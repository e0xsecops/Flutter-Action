import 'action_reminder.dart';

/// Durable reminder intent.
///
/// Like the Action Chain, this is **local-only**: reminders never enter the
/// Day-8 cloud payload, the deployed Firestore rules would reject a document
/// carrying them, and nothing here touches the sync outbox.
///
/// The repository stores *intent and known state*. It never talks to Android —
/// that seam is [NotificationScheduler], so a widget test can exercise every
/// path without a platform channel.
abstract interface class ActionReminderRepository {
  /// Reminders for one Action, soonest first, re-emitted on every change.
  /// Excludes ones already cancelled away.
  Stream<List<ActionReminder>> watchForAction(String actionId);

  Future<ActionReminder?> getById(String id);

  Future<List<ActionReminder>> forAction(String actionId);

  /// Records a new reminder intent in [ReminderState.pendingSchedule] and
  /// mints its stable platform id. Nothing is handed to Android here — that
  /// is a separate, failable step, and this row is what survives a crash in
  /// between.
  ///
  /// Returns null when the Action already holds [maxRemindersPerAction].
  Future<ActionReminder?> createIntent({
    required String actionId,
    required DateTime scheduledAt,
    required String timeZoneId,
    required DateTime now,
  });

  /// Moves an existing reminder to a new time, keeping both identities so the
  /// reschedule replaces the alarm rather than adding one.
  Future<ActionReminder?> reschedule(
    String id, {
    required DateTime scheduledAt,
    required String timeZoneId,
    required DateTime now,
  });

  /// Records what happened when Android was asked.
  Future<void> markState(
    String id, {
    required ReminderState state,
    required DateTime now,
    String? failureClass,
  });

  /// Marks the user's removal durably. The row stays until Android has been
  /// told, so a crash cannot leave an orphaned alarm behind.
  Future<void> requestCancel(String id, {required DateTime now});

  /// Cancellation is complete on both sides; the row can go.
  Future<void> finalizeCancel(String id);

  /// Everything the reconciler needs to look at: intents never scheduled,
  /// cancels never delivered, and failures worth retrying.
  Future<List<ActionReminder>> needingReconciliation();

  /// Marks every future reminder of an Action for cancellation — used when
  /// the Action is completed or archived. Past reminders are left alone;
  /// they are history, not pending work.
  Future<List<ActionReminder>> requestCancelFutureFor(
    String actionId, {
    required DateTime now,
  });
}
