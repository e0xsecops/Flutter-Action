import 'package:action_app/features/actions/application/reminder_reconciler.dart';
import 'package:action_app/features/actions/application/reminder_service.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/data/drift_reminder_repository.dart';
import 'package:action_app/features/actions/domain/action_reminder.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';
import 'support/fake_notification_scheduler.dart';

/// Scheduling spans two systems that cannot share a transaction, so these
/// tests are mostly about crash boundaries: what is true if the process dies
/// between "the user asked" and "Android agreed", and whether the next launch
/// can repair it without ever double-arming or silently dropping intent.
void main() {
  late ActionsDatabase db;
  late DriftActionRepository actions;
  late DriftReminderRepository reminders;
  late FakeNotificationScheduler scheduler;
  late ReminderService service;
  late ReminderReconciler reconciler;
  var seq = 0;

  setUp(() async {
    db = memoryDatabase();
    actions = DriftActionRepository(db);
    seq = 0;
    reminders = DriftReminderRepository(db, newId: () => 'r${++seq}');
    scheduler = FakeNotificationScheduler();
    service = ReminderService(
      reminders: reminders,
      scheduler: scheduler,
      clock: () => testNow,
      timeZoneId: () => 'Asia/Dhaka',
    );
    reconciler = ReminderReconciler(
      reminders: reminders,
      actions: actions,
      scheduler: scheduler,
      clock: () => testNow,
    );
    await actions.create(sampleAction('a1', title: 'Pay the water bill'));
  });

  tearDown(() async => db.close());

  DateTime at(int hours) => testNow.add(Duration(hours: hours));

  Future<ReminderOutcome> create({int hours = 24}) => service.create(
        actionId: 'a1',
        actionTitle: 'Pay the water bill',
        scheduledAt: at(hours),
      );

  group('creating a reminder', () {
    test('A: intent then platform, ending scheduled', () async {
      final outcome = await create();

      expect(outcome, isA<ReminderScheduled>());
      final stored = (await reminders.forAction('a1')).single;
      expect(stored.state, ReminderState.scheduled);
      expect(scheduler.scheduled, hasLength(1));
      expect(scheduler.scheduled.values.single.platformNotificationId,
          stored.platformNotificationId);
    });

    test('the platform is told the Action title and id, and nothing else',
        () async {
      await create();
      final call = scheduler.scheduleLog.single;
      expect(call.title, 'Pay the water bill');
      expect(call.actionId, 'a1');
      expect(call.timeZoneId, 'Asia/Dhaka');
    });

    test('B: a platform refusal keeps the reminder and records why', () async {
      scheduler.failScheduleWith = 'platform_error';
      final outcome = await create();

      expect(outcome, isA<ReminderFailed>());
      final stored = (await reminders.forAction('a1')).single;
      expect(stored.state, ReminderState.scheduleFailed);
      expect(stored.lastFailureClass, 'platform_error');
      expect(stored.isActive, isFalse,
          reason: 'a failed schedule must never read as working');
    });

    test('F: permission refused means nothing is scheduled, and it is kept',
        () async {
      scheduler
        ..allowed = false
        ..grantOnRequest = false;
      final outcome = await create();

      expect(outcome, isA<ReminderNeedsPermission>());
      expect(scheduler.scheduleLog, isEmpty,
          reason: 'no alarm may be attempted without permission');
      final stored = (await reminders.forAction('a1')).single;
      expect(stored.state, ReminderState.needsPermission);
    });

    test('permission is requested only when the user asks for a reminder',
        () async {
      scheduler.allowed = false;
      expect(scheduler.permissionRequests, 0);
      await create();
      expect(scheduler.permissionRequests, 1,
          reason: 'contextual, at the moment intent is expressed');
    });

    test('a granted prompt proceeds straight to scheduling', () async {
      scheduler
        ..allowed = false
        ..grantOnRequest = true;
      expect(await create(), isA<ReminderScheduled>());
      expect(scheduler.scheduled, hasLength(1));
    });

    test('a time in the past is refused outright and never stored', () async {
      final outcome = await service.create(
        actionId: 'a1',
        actionTitle: 'Pay the water bill',
        scheduledAt: testNow.subtract(const Duration(minutes: 1)),
      );

      expect(outcome, isA<ReminderTimeInPast>());
      expect(await reminders.forAction('a1'), isEmpty);
      expect(scheduler.scheduleLog, isEmpty);
    });

    test('the limit is reported rather than silently ignored', () async {
      for (var i = 1; i <= maxRemindersPerAction; i++) {
        await create(hours: i);
      }
      expect(await create(hours: 99), isA<ReminderLimitReached>());
    });
  });

  group('rescheduling', () {
    test('replaces the alarm instead of adding a second one', () async {
      await create(hours: 24);
      final stored = (await reminders.forAction('a1')).single;

      await service.reschedule(
        reminderId: stored.id,
        actionTitle: 'Pay the water bill',
        scheduledAt: at(48),
      );

      expect(scheduler.scheduled, hasLength(1),
          reason: 'one reminder, one OS notification');
      expect(scheduler.scheduled.keys.single, stored.platformNotificationId);
      expect(scheduler.scheduled.values.single.scheduledAt, at(48).toUtc());
      expect(await reminders.forAction('a1'), hasLength(1));
    });

    test('moving into the past is refused and changes nothing', () async {
      await create(hours: 24);
      final stored = (await reminders.forAction('a1')).single;

      final outcome = await service.reschedule(
        reminderId: stored.id,
        actionTitle: 'Pay the water bill',
        scheduledAt: testNow.subtract(const Duration(hours: 1)),
      );

      expect(outcome, isA<ReminderTimeInPast>());
      expect((await reminders.getById(stored.id))!.scheduledAt,
          at(24).toUtc());
    });
  });

  group('removing', () {
    test('E: cancels the platform alarm and drops the row', () async {
      await create();
      final stored = (await reminders.forAction('a1')).single;

      await service.cancel(stored.id);

      expect(scheduler.cancelLog, [stored.platformNotificationId]);
      expect(scheduler.scheduled, isEmpty);
      expect(await reminders.getById(stored.id), isNull);
    });

    test('a cancel the platform refuses stays durable, not lost', () async {
      await create();
      final stored = (await reminders.forAction('a1')).single;
      scheduler.failCancel = true;

      await service.cancel(stored.id);

      expect((await reminders.getById(stored.id))!.state,
          ReminderState.cancelPending,
          reason: 'the removal must survive to be completed later');

      // Next launch finishes it.
      scheduler.failCancel = false;
      await reconciler.reconcile();
      expect(await reminders.getById(stored.id), isNull);
      expect(scheduler.scheduled, isEmpty);
    });
  });

  group('completing and archiving an Action', () {
    test('cancels its future reminders but leaves the past alone', () async {
      await create(hours: 5);
      await reminders.createIntent(
        actionId: 'a1',
        scheduledAt: testNow.subtract(const Duration(hours: 3)),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      );

      await service.cancelFutureFor('a1');

      final left = await reminders.forAction('a1');
      expect(left, hasLength(1));
      expect(left.single.scheduledAt.isBefore(testNow.toUtc()), isTrue);
      expect(scheduler.scheduled, isEmpty);
    });

    test('reopening does not resurrect what was cancelled', () async {
      await create(hours: 5);
      await service.cancelFutureFor('a1');
      await actions.complete('a1', at: testNow);
      await actions.reopen('a1', at: testNow);

      await reconciler.reconcile();

      expect(await reminders.forAction('a1'), isEmpty);
      expect(scheduler.scheduled, isEmpty,
          reason: 'a reopened Action starts with no reminders, not old ones');
    });
  });

  group('reconciliation', () {
    test('C: a crash after arming but before the DB knows does not duplicate',
        () async {
      // Simulates the process dying between platform success and the local
      // mark: the row still says pending, the alarm already exists.
      final r = (await reminders.createIntent(
        actionId: 'a1',
        scheduledAt: at(6),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      ))!;
      await scheduler.schedule(
        platformNotificationId: r.platformNotificationId,
        actionId: 'a1',
        title: 'Pay the water bill',
        scheduledAt: r.scheduledAt,
        timeZoneId: 'Asia/Dhaka',
      );

      await reconciler.reconcile();

      expect(scheduler.scheduled, hasLength(1),
          reason: 'the same platform id is reused, so re-arming replaces');
      expect((await reminders.getById(r.id))!.state, ReminderState.scheduled);
    });

    test('D: an alarm that vanished is put back', () async {
      await create(hours: 8);
      final stored = (await reminders.forAction('a1')).single;
      expect(stored.state, ReminderState.scheduled);

      // Reboot / force-stop / battery manager.
      scheduler.loseAllPlatformAlarms();
      final report = await reconciler.reconcile();

      expect(report.restored, 1);
      expect(scheduler.scheduled.keys, [stored.platformNotificationId]);
    });

    test('a healthy pair is left completely alone', () async {
      await create(hours: 8);
      scheduler.scheduleLog.clear();

      final report = await reconciler.reconcile();

      expect(scheduler.scheduleLog, isEmpty);
      expect(report.didNothing, isTrue);
    });

    test('G: intent blocked on permission schedules once it is granted',
        () async {
      scheduler
        ..allowed = false
        ..grantOnRequest = false;
      await create(hours: 12);
      expect(scheduler.scheduled, isEmpty);

      // The user turns notifications on in system settings.
      scheduler.allowed = true;
      final report = await reconciler.reconcile();

      expect(report.scheduled, 1);
      expect((await reminders.forAction('a1')).single.state,
          ReminderState.scheduled);
    });

    test('reconciliation never raises a permission prompt', () async {
      scheduler
        ..allowed = false
        ..grantOnRequest = false;
      await create(hours: 12);
      final before = scheduler.permissionRequests;

      await reconciler.reconcile();

      expect(scheduler.permissionRequests, before,
          reason: 'a background repair is not a moment the user asked for '
              'anything');
    });

    test('H: a reminder whose moment has passed is never re-armed', () async {
      final r = (await reminders.createIntent(
        actionId: 'a1',
        scheduledAt: testNow.subtract(const Duration(hours: 1)),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      ))!;

      final report = await reconciler.reconcile();

      expect(scheduler.scheduled, isEmpty);
      expect(report.skippedPast, 1);
      expect((await reminders.getById(r.id))!.state,
          ReminderState.pendingSchedule,
          reason: 'and it is not relabelled as delivered either — we have no '
              'evidence it ever fired');
    });

    test('a reminder whose Action is gone is cleaned up', () async {
      await create(hours: 4);
      final stored = (await reminders.forAction('a1')).single;
      await (db.delete(db.actionsTable)..where((t) => t.id.equals('a1'))).go();

      final report = await reconciler.reconcile();

      expect(report.orphansRemoved, 1);
      expect(await reminders.getById(stored.id), isNull);
      expect(scheduler.scheduled, isEmpty);
    });

    test('a failed schedule is retried on the next pass, not in a loop',
        () async {
      scheduler.failScheduleWith = 'platform_error';
      await create(hours: 4);
      expect((await reminders.forAction('a1')).single.state,
          ReminderState.scheduleFailed);

      scheduler.failScheduleWith = null;
      final report = await reconciler.reconcile();

      expect(report.scheduled, 1);
      expect((await reminders.forAction('a1')).single.state,
          ReminderState.scheduled);
    });

    test('an empty queue costs nothing', () async {
      final report = await reconciler.reconcile();
      expect(report.didNothing, isTrue);
      expect(scheduler.initializeCalls, 0);
    });
  });
}
