import 'dart:io';

import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/data/drift_reminder_repository.dart';
import 'package:action_app/features/actions/domain/action_reminder.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

/// Durable reminder intent, against real SQLite.
///
/// The property that matters most: a reminder the user agreed to survives
/// everything — a crash mid-schedule, a restart, a missing Action — and is
/// never quietly upgraded to "working" without evidence.
void main() {
  late ActionsDatabase db;
  late DriftActionRepository actions;
  late DriftReminderRepository reminders;
  var seq = 0;

  setUp(() async {
    db = memoryDatabase();
    actions = DriftActionRepository(db);
    seq = 0;
    reminders = DriftReminderRepository(db, newId: () => 'r${++seq}');
    await actions.create(sampleAction('a1'));
  });

  tearDown(() async => db.close());

  DateTime at(int hoursFromNow) =>
      testNow.add(Duration(hours: hoursFromNow));

  Future<ActionReminder> create({int hours = 24, String actionId = 'a1'}) async {
    final r = await reminders.createIntent(
      actionId: actionId,
      scheduledAt: at(hours),
      timeZoneId: 'Asia/Dhaka',
      now: testNow,
    );
    return r!;
  }

  group('creating intent', () {
    test('starts as pending, never as scheduled', () async {
      final r = await create();
      expect(r.state, ReminderState.pendingSchedule,
          reason: 'nothing has been handed to Android yet');
      expect(r.isActive, isFalse);
      expect(r.lastFailureClass, isNull);
    });

    test('keeps the absolute instant and the zone it was chosen in', () async {
      final r = await create(hours: 30);
      expect(r.scheduledAt, at(30).toUtc());
      expect(r.scheduledAt.isUtc, isTrue);
      expect(r.timeZoneId, 'Asia/Dhaka');
    });

    test('mints a platform id that is stable and never zero', () async {
      final r = await create();
      expect(r.platformNotificationId, greaterThan(0));
      expect((await reminders.getById(r.id))!.platformNotificationId,
          r.platformNotificationId);
    });

    test('every reminder gets a distinct platform id', () async {
      final ids = <int>{};
      for (var i = 1; i <= 4; i++) {
        ids.add((await create(hours: i)).platformNotificationId);
      }
      expect(ids, hasLength(4), reason: 'a collision would cancel the wrong '
          'notification');
    });

    test('a deleted reminder never donates its platform id to the next one',
        () async {
      final first = await create(hours: 1);
      await reminders.finalizeCancel(first.id);
      final second = await create(hours: 2);

      expect(second.platformNotificationId,
          isNot(first.platformNotificationId),
          reason: 'a recycled id could cancel a stale OS notification');
    });

    test('holds at most five per Action', () async {
      for (var i = 1; i <= maxRemindersPerAction; i++) {
        expect(await create(hours: i), isNotNull);
      }
      final overflow = await reminders.createIntent(
        actionId: 'a1',
        scheduledAt: at(9),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      );
      expect(overflow, isNull, reason: 'a single obligation is not a feed');
    });

    test('a reminder on its way out does not occupy a slot', () async {
      for (var i = 1; i <= maxRemindersPerAction; i++) {
        await create(hours: i);
      }
      final all = await reminders.forAction('a1');
      await reminders.requestCancel(all.first.id, now: testNow);

      expect(await create(hours: 20), isNotNull);
    });

    test('the cap is per Action, not global', () async {
      await actions.create(sampleAction('a2'));
      for (var i = 1; i <= maxRemindersPerAction; i++) {
        await create(hours: i);
      }
      expect(await create(hours: 1, actionId: 'a2'), isNotNull);
    });
  });

  group('watching', () {
    test('lists soonest first', () async {
      await create(hours: 48);
      await create(hours: 2);
      await create(hours: 24);

      final list = await reminders.watchForAction('a1').first;
      expect(
        list.map((r) => r.scheduledAt),
        [at(2).toUtc(), at(24).toUtc(), at(48).toUtc()],
      );
    });

    test('hides reminders the user already removed', () async {
      final r = await create();
      await reminders.requestCancel(r.id, now: testNow);

      expect(await reminders.watchForAction('a1').first, isEmpty,
          reason: 'a removed reminder must not linger on screen while the '
              'platform catches up');
    });

    test('re-emits when a reminder changes state', () async {
      final r = await create();
      final seen = <ReminderState?>[];
      final sub = reminders.watchForAction('a1').listen(
            (list) => seen.add(list.isEmpty ? null : list.single.state),
          );
      await pumpEventQueue();
      await reminders.markState(r.id,
          state: ReminderState.scheduled, now: testNow);
      await pumpEventQueue();
      await sub.cancel();

      expect(seen.last, ReminderState.scheduled);
    });
  });

  group('rescheduling', () {
    test('keeps both identities so the alarm is replaced, not duplicated',
        () async {
      final r = await create(hours: 24);
      final moved = (await reminders.reschedule(
        r.id,
        scheduledAt: at(48),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      ))!;

      expect(moved.id, r.id);
      expect(moved.platformNotificationId, r.platformNotificationId);
      expect(moved.scheduledAt, at(48).toUtc());
    });

    test('returns to pending and clears a previous failure', () async {
      final r = await create();
      await reminders.markState(
        r.id,
        state: ReminderState.scheduleFailed,
        now: testNow,
        failureClass: 'platform_error',
      );

      final moved = (await reminders.reschedule(
        r.id,
        scheduledAt: at(72),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      ))!;
      expect(moved.state, ReminderState.pendingSchedule);
      expect(moved.lastFailureClass, isNull,
          reason: 'a stale failure must not haunt a new attempt');
    });

    test('rescheduling something that no longer exists is a no-op', () async {
      expect(
        await reminders.reschedule('ghost',
            scheduledAt: at(1), timeZoneId: 'Asia/Dhaka', now: testNow),
        isNull,
      );
    });
  });

  group('cancelling', () {
    test('is durable before the platform is told', () async {
      final r = await create();
      await reminders.requestCancel(r.id, now: testNow);

      // Still present, so a crash here cannot orphan the OS alarm.
      expect((await reminders.getById(r.id))!.state,
          ReminderState.cancelPending);
    });

    test('finalising removes the row', () async {
      final r = await create();
      await reminders.requestCancel(r.id, now: testNow);
      await reminders.finalizeCancel(r.id);
      expect(await reminders.getById(r.id), isNull);
    });

    test('completing an Action targets only its future reminders', () async {
      final past = await reminders.createIntent(
        actionId: 'a1',
        scheduledAt: testNow.subtract(const Duration(hours: 2)),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      );
      final future = await create(hours: 5);

      final cancelling =
          await reminders.requestCancelFutureFor('a1', now: testNow);

      expect(cancelling.map((r) => r.id), [future.id]);
      expect((await reminders.getById(past!.id))!.state,
          ReminderState.pendingSchedule,
          reason: 'a past reminder is history, not pending work');
    });
  });

  group('reconciliation queue', () {
    test('surfaces every state that still needs looking at', () async {
      final a = await create(hours: 1);
      final b = await create(hours: 2);
      final c = await create(hours: 3);
      await reminders.markState(a.id,
          state: ReminderState.scheduled, now: testNow);
      await reminders.markState(b.id,
          state: ReminderState.needsPermission, now: testNow);
      await reminders.requestCancel(c.id, now: testNow);

      final work = await reminders.needingReconciliation();
      expect(work.map((r) => r.id).toSet(), {a.id, b.id, c.id});
    });
  });

  group('durability', () {
    test('a reminder survives process death with its identities intact',
        () async {
      final dir = Directory.systemTemp.createTempSync('day10_reminders');
      addTearDown(() => dir.deleteSync(recursive: true));
      final file = File('${dir.path}/actions.sqlite');

      final first = ActionsDatabase(NativeDatabase(file));
      await DriftActionRepository(first).create(sampleAction('a1'));
      final made = await DriftReminderRepository(first).createIntent(
        actionId: 'a1',
        scheduledAt: at(24),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      );
      await first.close();

      final second = ActionsDatabase(NativeDatabase(file));
      addTearDown(second.close);
      final reopened =
          (await DriftReminderRepository(second).getById(made!.id))!;

      expect(reopened.platformNotificationId, made.platformNotificationId);
      expect(reopened.scheduledAt, made.scheduledAt);
      expect(reopened.timeZoneId, 'Asia/Dhaka');
      expect(reopened.state, ReminderState.pendingSchedule);
    });
  });

  group('the local-only boundary', () {
    test('no reminder operation ever tells the cloud anything', () async {
      await actions.markSynced('a1'); // discharge the create's mirror intent
      expect(await actions.pendingCount(), 0);

      final r = await create();
      await reminders.markState(r.id,
          state: ReminderState.scheduled, now: testNow);
      await reminders.reschedule(r.id,
          scheduledAt: at(72), timeZoneId: 'Asia/Dhaka', now: testNow);
      await reminders.requestCancel(r.id, now: testNow);
      await reminders.finalizeCancel(r.id);

      expect(await actions.pendingCount(), 0,
          reason: 'reminders are local-only; the deployed rules would reject '
              'a document carrying them');
    });
  });
}
