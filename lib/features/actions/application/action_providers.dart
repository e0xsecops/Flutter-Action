import 'dart:async';

import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/firebase/firebase_gate.dart';
import '../data/action_cloud_mirror.dart';
import '../data/actions_database.dart';
import '../data/auth_identity_service.dart';
import '../data/drift_action_repository.dart';
import '../data/drift_reminder_repository.dart';
import '../data/flutter_local_notification_scheduler.dart';
import '../data/notification_scheduler.dart';
import '../domain/action_item.dart';
import '../domain/action_reminder.dart';
import '../domain/action_reminder_repository.dart';
import '../domain/action_repository.dart';
import 'action_sync_service.dart';
import 'action_triage.dart';
import 'reminder_reconciler.dart';
import 'reminder_service.dart';

/// Semantic Action lifecycle events. Names only — a title, an amount or a
/// deadline must never ride along.
abstract final class ActionEvents {
  static const created = 'action_created';
  static const completed = 'action_completed';
  static const archived = 'action_archived';
  static const localPersistenceFailed = 'action_local_persistence_failed';
  static const cloudMirrorSucceeded = 'action_cloud_mirror_succeeded';
  static const cloudMirrorFailed = 'action_cloud_mirror_failed';

  // Day 10 reminders. Names only — never a time, a title or a payload.
  static const reminderCreated = 'reminder_created';
  static const reminderUpdated = 'reminder_updated';
  static const reminderCancelled = 'reminder_cancelled';
  static const reminderPermissionDenied = 'reminder_permission_denied';
  static const reminderScheduleFailed = 'reminder_schedule_failed';
  static const reminderNotificationOpened = 'reminder_notification_opened';

  // Day 9. Still names only: what happened, never what it was about.
  static const detailOpened = 'action_detail_opened';
  static const edited = 'action_edited';
  static const reopened = 'action_reopened';
  static const stepAdded = 'action_step_added';
  static const stepCompleted = 'action_step_completed';
  static const stepReopened = 'action_step_reopened';
  static const stepEdited = 'action_step_edited';
  static const stepDeleted = 'action_step_deleted';
  static const stepReordered = 'action_step_reordered';
}

/// The app's clock, injected so that "when did this happen" is testable and
/// never reaches for `DateTime.now()` deep inside a widget.
final appClockProvider = Provider<DateTime Function()>((ref) => DateTime.now);

/// One database for the whole app. Opening is lazy (first query), so app
/// startup never waits on SQLite; open failures surface through the watch
/// stream as an error state — never as a silent recreate, because wiping a
/// table of user commitments to fix a schema hiccup is the one repair this
/// store is not allowed to make.
final actionsDatabaseProvider = Provider<ActionsDatabase>((ref) {
  final db = ActionsDatabase(driftDatabase(name: 'actions'));
  ref.onDispose(db.close);
  return db;
});

final _driftRepositoryProvider = Provider<DriftActionRepository>(
  (ref) => DriftActionRepository(ref.watch(actionsDatabaseProvider)),
);

final actionRepositoryProvider = Provider<ActionRepository>(
  (ref) => ref.watch(_driftRepositoryProvider),
);

final actionSyncOutboxProvider = Provider<ActionSyncOutbox>(
  (ref) => ref.watch(_driftRepositoryProvider),
);

final authIdentityServiceProvider = Provider<AuthIdentityService>(
  (ref) => FirebaseAuthIdentityService(gate: ref.watch(firebaseGateProvider)),
);

final actionCloudMirrorProvider = Provider<ActionCloudMirror>(
  (ref) => FirestoreActionCloudMirror(gate: ref.watch(firebaseGateProvider)),
);

final actionSyncServiceProvider = Provider<ActionSyncService>(
  (ref) => ActionSyncService(
    outbox: ref.watch(actionSyncOutboxProvider),
    repository: ref.watch(actionRepositoryProvider),
    identity: ref.watch(authIdentityServiceProvider),
    mirror: ref.watch(actionCloudMirrorProvider),
  ),
);

/// What Home watches. Database errors arrive as AsyncError — shown as a safe
/// error state, distinct from "no Actions yet".
final actionsStreamProvider = StreamProvider<List<ActionItem>>(
  (ref) => ref.watch(actionRepositoryProvider).watchAll(),
);

/// Chain writes. A separate provider from [actionRepositoryProvider] because
/// it is a separate contract: nothing reachable through here mirrors to the
/// cloud.
final actionStepRepositoryProvider = Provider<ActionStepRepository>(
  (ref) => ref.watch(_driftRepositoryProvider),
);

/// One Action for the detail screen, re-emitted on every durable change to it
/// or its chain. `null` means no such Action — a real answer, not an error.
final actionDetailProvider =
    StreamProvider.family<ActionItem?, String>((ref, id) {
  return ref.watch(actionRepositoryProvider).watchById(id);
});

// ------------------------------------------------------------- reminders --

/// The device's IANA zone, resolved once at startup and cached so the rest of
/// the app can read it synchronously.
///
/// `UTC` until resolved: a wrong-but-valid zone id is recoverable, whereas
/// blocking startup on a platform channel to learn it is not worth it.
class DeviceTimeZone {
  String _id = 'UTC';

  String get id => _id;

  Future<void> refresh() async {
    _id = await deviceTimeZoneId();
  }
}

final deviceTimeZoneProvider = Provider<DeviceTimeZone>((_) => DeviceTimeZone());

/// The platform seam. Tests override this with a fake, so no widget or unit
/// test ever reaches an Android notification API.
final notificationSchedulerProvider = Provider<NotificationScheduler>((ref) {
  return FlutterLocalNotificationScheduler();
});

final actionReminderRepositoryProvider = Provider<ActionReminderRepository>(
  (ref) => DriftReminderRepository(ref.watch(actionsDatabaseProvider)),
);

final reminderServiceProvider = Provider<ReminderService>((ref) {
  return ReminderService(
    reminders: ref.watch(actionReminderRepositoryProvider),
    scheduler: ref.watch(notificationSchedulerProvider),
    clock: ref.watch(appClockProvider),
    timeZoneId: () => ref.read(deviceTimeZoneProvider).id,
  );
});

final reminderReconcilerProvider = Provider<ReminderReconciler>((ref) {
  return ReminderReconciler(
    reminders: ref.watch(actionReminderRepositoryProvider),
    actions: ref.watch(actionRepositoryProvider),
    scheduler: ref.watch(notificationSchedulerProvider),
    clock: ref.watch(appClockProvider),
  );
});

/// Reminders shown on one Action's detail screen, soonest first.
final remindersForActionProvider =
    StreamProvider.family<List<ActionReminder>, String>((ref, actionId) {
  return ref.watch(actionReminderRepositoryProvider).watchForAction(actionId);
});

// ----------------------------------------------------------------- triage --

/// The soonest armed reminder per Action — one query for the whole of Home.
final nextScheduledRemindersProvider =
    StreamProvider<Map<String, ActionReminder>>((ref) {
  return ref.watch(actionReminderRepositoryProvider).watchNextScheduled();
});

/// The current local calendar date, re-emitted when it changes.
///
/// Day 11 left a gap and named it: Home held across midnight kept describing
/// yesterday, because triage reads the clock when it recomputes and nothing
/// asked it to. A date-only deadline is a whole local day, so at midnight an
/// Action genuinely becomes overdue with no user action and no data change —
/// the one moment ordering changes by itself.
///
/// Closed with a single timer, armed for the next local midnight and re-armed
/// when it fires. Not a tick, not a poll, and nothing per-second: one pending
/// timer exists at a time, it wakes nothing, and it is cancelled on dispose.
/// A timer that fires late — because the device slept through midnight — is
/// harmless, because the new day is read from the clock at that moment rather
/// than assumed from when the timer was set.
class LocalDay extends Notifier<DateTime> {
  Timer? _timer;

  @override
  DateTime build() {
    ref.onDispose(() => _timer?.cancel());
    final now = ref.watch(appClockProvider)();
    _armFor(now);
    return DateTime(now.year, now.month, now.day);
  }

  void _armFor(DateTime now) {
    _timer?.cancel();
    // A minute past the boundary, so a timer that fires a hair early still
    // lands on the day it was meant to announce.
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    final delay = nextMidnight.difference(now) + const Duration(minutes: 1);
    _timer = Timer(delay, () {
      final at = ref.read(appClockProvider)();
      state = DateTime(at.year, at.month, at.day);
      _armFor(at);
    });
  }
}

final localDayProvider =
    NotifierProvider<LocalDay, DateTime>(LocalDay.new);

/// Home, triaged: three ordered lists plus the reason behind every card.
///
/// Composed from two local streams and computed in memory. Nothing here
/// touches the network, Firebase or a model, and no card asks the database a
/// question of its own.
final triagedHomeProvider = Provider<AsyncValue<TriagedHome>>((ref) {
  final actions = ref.watch(actionsStreamProvider);
  final reminders = ref.watch(nextScheduledRemindersProvider);
  // Watched, not read: this is what makes the local day boundary recompute
  // the order. The value itself is unused — the clock below is the truth.
  ref.watch(localDayProvider);
  final now = ref.watch(appClockProvider)();

  return actions.whenData(
    (items) => triageHome(
      items,
      now: now,
      // Reminders are a refinement, not a prerequisite: if that stream has
      // not arrived yet, Home still triages on deadlines and urgency rather
      // than waiting.
      nextReminders: switch (reminders) {
        AsyncData(:final value) => value,
        _ => const {},
      },
    ),
  );
});
