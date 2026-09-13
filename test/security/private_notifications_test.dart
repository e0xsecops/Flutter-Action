/// Private notifications, end to end through the two things that arm alarms.
///
/// The interesting case is not "a new reminder is private" — it is the one
/// already sitting in Android's alarm queue with the Action's title baked into
/// it. Turning the setting on has to reach those too, or the feature quietly
/// only applies to reminders the user has not created yet.
library;

import 'package:action_app/features/actions/application/reminder_presentation.dart';
import 'package:action_app/features/actions/application/reminder_reconciler.dart';
import 'package:action_app/features/actions/application/reminder_service.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/data/drift_reminder_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';

void main() {
  late ActionsDatabase db;
  late DriftActionRepository actions;
  late DriftReminderRepository reminders;
  late FakeNotificationScheduler scheduler;
  late ReminderService service;
  late ReminderReconciler reconciler;
  var seq = 0;

  /// Flipped by the tests the way the Security Centre flips it.
  var private = false;

  final testNow = DateTime.utc(2026, 9, 1, 9);
  DateTime at(int hours) => testNow.add(Duration(hours: hours));

  setUp(() async {
    db = memoryDatabase();
    actions = DriftActionRepository(db);
    seq = 0;
    private = false;
    reminders = DriftReminderRepository(db, newId: () => 'r${++seq}');
    scheduler = FakeNotificationScheduler();
    service = ReminderService(
      reminders: reminders,
      scheduler: scheduler,
      clock: () => testNow,
      timeZoneId: () => 'Asia/Dhaka',
      privateNotifications: () => private,
    );
    reconciler = ReminderReconciler(
      reminders: reminders,
      actions: actions,
      scheduler: scheduler,
      clock: () => testNow,
      privateNotifications: () => private,
    );
    await actions.create(
      sampleAction('a1', title: 'Call the clinic about the results'),
    );
  });

  tearDown(() async {
    scheduler.dispose();
    await db.close();
  });

  group('a new reminder', () {
    test('carries the Action title when private mode is off', () async {
      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(3),
      );

      expect(
        scheduler.scheduleLog.single.title,
        'Call the clinic about the results',
      );
    });

    test('carries nothing about the Action when private mode is on', () async {
      private = true;

      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(3),
      );

      final armed = scheduler.scheduleLog.single;
      expect(armed.title, privateReminderBody);
      expect(armed.title, isNot(contains('clinic')));
      // Routing is unaffected: tapping it still opens the right Action.
      expect(armed.actionId, 'a1');
    });

    test('reads the setting at arming time, not at construction', () async {
      // The service is built once for the app's lifetime. If it captured the
      // value it would keep using whatever was true at start-up.
      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(3),
      );
      private = true;
      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(5),
      );

      expect(scheduler.scheduleLog.first.title, contains('clinic'));
      expect(scheduler.scheduleLog.last.title, privateReminderBody);
    });
  });

  group('reminders already armed when the setting changes', () {
    test('a forced pass re-arms them with the private body', () async {
      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(3),
      );
      expect(scheduler.scheduled.values.single.title, contains('clinic'));

      private = true;
      final report = await reconciler.reconcile(rearmAll: true);

      expect(report.restored, 1);
      expect(scheduler.scheduled.values.single.title, privateReminderBody);
    });

    test('and back again when it is turned off', () async {
      private = true;
      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(3),
      );

      private = false;
      await reconciler.reconcile(rearmAll: true);

      expect(scheduler.scheduled.values.single.title, contains('clinic'));
    });

    test('an ordinary pass leaves agreeing reminders alone', () async {
      // The forced pass is extra work, so the normal one must not do it.
      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(3),
      );
      final armedBefore = scheduler.scheduleLog.length;

      final report = await reconciler.reconcile();

      expect(scheduler.scheduleLog, hasLength(armedBefore));
      expect(report.didNothing, isTrue);
    });

    test('a forced pass still refuses to re-arm a moment that has passed',
        () async {
      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(3),
      );

      // Same reminder, but now the clock is past it.
      final later = ReminderReconciler(
        reminders: reminders,
        actions: actions,
        scheduler: scheduler,
        clock: () => at(9),
        privateNotifications: () => private,
      );
      final report = await later.reconcile(rearmAll: true);

      expect(report.restored, 0);
      expect(report.scheduled, 0);
      expect(report.skippedPast, 1);
    });

    test('a forced pass does not prompt for permission', () async {
      await service.create(
        actionId: 'a1',
        actionTitle: 'Call the clinic about the results',
        scheduledAt: at(3),
      );
      scheduler.allowed = false;
      final before = scheduler.permissionRequests;

      await reconciler.reconcile(rearmAll: true);

      // Changing a privacy setting is not a moment to raise a permission
      // dialog the user did not ask for.
      expect(scheduler.permissionRequests, before);
    });
  });
}
