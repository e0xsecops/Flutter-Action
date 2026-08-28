import '../data/notification_scheduler.dart';
import '../domain/action_item.dart';
import '../domain/action_reminder.dart';
import '../domain/action_reminder_repository.dart';
import '../domain/action_repository.dart';

/// What one reconciliation pass did. Counts only — never content.
final class ReminderReconcileReport {
  const ReminderReconcileReport({
    this.scheduled = 0,
    this.cancelled = 0,
    this.restored = 0,
    this.blockedOnPermission = 0,
    this.failed = 0,
    this.orphansRemoved = 0,
    this.skippedPast = 0,
  });

  final int scheduled;
  final int cancelled;
  final int restored;
  final int blockedOnPermission;
  final int failed;
  final int orphansRemoved;
  final int skippedPast;

  bool get didNothing =>
      scheduled == 0 &&
      cancelled == 0 &&
      restored == 0 &&
      failed == 0 &&
      orphansRemoved == 0;
}

/// Repairs the gap between what the user asked for and what Android actually
/// holds.
///
/// Scheduling a reminder touches two systems that cannot share a transaction,
/// so every crash point leaves a recoverable row rather than a lie. This runs
/// once after startup — not on a timer, not in a background service — and
/// makes the two sides agree again:
///
///  * intent that never reached Android gets scheduled (if permitted)
///  * an alarm that vanished — reboot, force-stop, an OEM battery manager —
///    is put back
///  * a removal the user made but Android never heard is completed
///  * a reminder whose Action is gone is cleaned up
///  * a moment that has already passed is never re-armed as if it were
///    still coming
class ReminderReconciler {
  ReminderReconciler({
    required this._reminders,
    required this._actions,
    required this._scheduler,
    required this._clock,
  });

  final ActionReminderRepository _reminders;
  final ActionRepository _actions;
  final NotificationScheduler _scheduler;
  final DateTime Function() _clock;

  bool _running = false;

  /// One bounded pass. Re-entrant calls are ignored rather than queued, so a
  /// second trigger can never turn this into a loop.
  Future<ReminderReconcileReport> reconcile() async {
    if (_running) return const ReminderReconcileReport();
    _running = true;
    try {
      return await _run();
    } finally {
      _running = false;
    }
  }

  Future<ReminderReconcileReport> _run() async {
    final work = await _reminders.needingReconciliation();
    if (work.isEmpty) return const ReminderReconcileReport();

    final now = _clock().toUtc();
    var scheduled = 0;
    var cancelled = 0;
    var restored = 0;
    var blocked = 0;
    var failed = 0;
    var orphans = 0;
    var skippedPast = 0;

    // Cancellations first, and without asking about permission: withdrawing
    // an alarm is always allowed, and a stray notification for something the
    // user deleted is the worst outcome available here.
    final cancels =
        work.where((r) => r.state == ReminderState.cancelPending).toList();
    for (final reminder in cancels) {
      try {
        await _scheduler.cancel(reminder.platformNotificationId);
        await _reminders.finalizeCancel(reminder.id);
        cancelled++;
      } on Object {
        // Left as cancelPending: the next pass tries again rather than
        // dropping the row and losing the intent.
      }
    }

    final remaining =
        work.where((r) => r.state != ReminderState.cancelPending).toList();
    if (remaining.isEmpty) {
      return ReminderReconcileReport(cancelled: cancelled);
    }

    // Asks; never prompts. A reconciliation pass is not a moment the user
    // asked for anything, so it must not raise a permission dialog.
    final allowed = await _scheduler.notificationsAllowed();
    final platformIds =
        allowed ? await _scheduler.pendingNotificationIds() : const <int>{};

    // An Action can hold several reminders, and the pass used to re-read it
    // once per reminder. Remembered for the length of the pass instead: the
    // pass is short and bounded, and re-reading the same row three times to
    // learn the same title is work with nothing to show for it.
    final seenActions = <String, ActionItem?>{};

    for (final reminder in remaining) {
      // An Action that no longer exists cannot be reminded about.
      final action = seenActions.containsKey(reminder.actionId)
          ? seenActions[reminder.actionId]
          : seenActions[reminder.actionId] =
              await _actions.getById(reminder.actionId);
      if (action == null) {
        try {
          await _scheduler.cancel(reminder.platformNotificationId);
        } on Object {
          // Best effort; the row goes either way so it cannot linger.
        }
        await _reminders.finalizeCancel(reminder.id);
        orphans++;
        continue;
      }

      // A moment that has passed is history. Never re-armed, and never
      // relabelled as delivered — we have no evidence either way.
      if (reminder.isPast(now)) {
        skippedPast++;
        continue;
      }

      if (!allowed) {
        if (reminder.state != ReminderState.needsPermission) {
          await _reminders.markState(
            reminder.id,
            state: ReminderState.needsPermission,
            now: now,
          );
        }
        blocked++;
        continue;
      }

      final alreadyArmed = platformIds.contains(reminder.platformNotificationId);
      if (reminder.state == ReminderState.scheduled && alreadyArmed) {
        continue; // both sides agree
      }

      try {
        await _scheduler.schedule(
          platformNotificationId: reminder.platformNotificationId,
          actionId: reminder.actionId,
          title: action.title,
          scheduledAt: reminder.scheduledAt,
          timeZoneId: reminder.timeZoneId,
        );
        await _reminders.markState(
          reminder.id,
          state: ReminderState.scheduled,
          now: now,
        );
        if (reminder.state == ReminderState.scheduled) {
          restored++; // the alarm had gone missing
        } else {
          scheduled++;
        }
      } on NotificationScheduleException catch (e) {
        await _reminders.markState(
          reminder.id,
          state: ReminderState.scheduleFailed,
          now: now,
          failureClass: e.failureClass,
        );
        failed++;
      } on Object {
        await _reminders.markState(
          reminder.id,
          state: ReminderState.scheduleFailed,
          now: now,
          failureClass: 'platform_error',
        );
        failed++;
      }
    }

    return ReminderReconcileReport(
      scheduled: scheduled,
      cancelled: cancelled,
      restored: restored,
      blockedOnPermission: blocked,
      failed: failed,
      orphansRemoved: orphans,
      skippedPast: skippedPast,
    );
  }
}
