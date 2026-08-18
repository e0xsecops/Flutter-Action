import '../data/notification_scheduler.dart';
import '../domain/action_reminder.dart';
import '../domain/action_reminder_repository.dart';

/// What actually happened when the user asked to be reminded.
///
/// Every outcome is distinguishable, because "we saved your intent but
/// Android will not alert you" and "your reminder is set" are different
/// promises and the UI must never conflate them.
sealed class ReminderOutcome {
  const ReminderOutcome();
}

final class ReminderScheduled extends ReminderOutcome {
  const ReminderScheduled(this.reminder);
  final ActionReminder reminder;
}

/// Saved, but notifications are off. Deliberately not an error: the intent is
/// durable and becomes real as soon as permission exists.
final class ReminderNeedsPermission extends ReminderOutcome {
  const ReminderNeedsPermission(this.reminder);
  final ActionReminder reminder;
}

/// Saved, but the platform refused the alarm.
final class ReminderFailed extends ReminderOutcome {
  const ReminderFailed(this.reminder, this.failureClass);
  final ActionReminder reminder;
  final String failureClass;
}

final class ReminderLimitReached extends ReminderOutcome {
  const ReminderLimitReached();
}

/// The time has already gone. Never persisted, never armed.
final class ReminderTimeInPast extends ReminderOutcome {
  const ReminderTimeInPast();
}

/// Coordinates the two systems a reminder lives in.
///
/// The order is the whole design: **persist the intent first**, then ask for
/// permission, then arm the alarm. A crash at any point leaves a row the
/// reconciler can finish, and at no point is the user told a reminder is
/// working when it is not.
class ReminderService {
  ReminderService({
    required this._reminders,
    required this._scheduler,
    required this._clock,
    required this._timeZoneId,
  });

  final ActionReminderRepository _reminders;
  final NotificationScheduler _scheduler;
  final DateTime Function() _clock;
  final String Function() _timeZoneId;

  Future<ReminderOutcome> create({
    required String actionId,
    required String actionTitle,
    required DateTime scheduledAt,
  }) async {
    final now = _clock().toUtc();
    if (!scheduledAt.toUtc().isAfter(now)) return const ReminderTimeInPast();

    final reminder = await _reminders.createIntent(
      actionId: actionId,
      scheduledAt: scheduledAt,
      timeZoneId: _timeZoneId(),
      now: now,
    );
    if (reminder == null) return const ReminderLimitReached();

    return _arm(reminder, actionTitle);
  }

  Future<ReminderOutcome> reschedule({
    required String reminderId,
    required String actionTitle,
    required DateTime scheduledAt,
  }) async {
    final now = _clock().toUtc();
    if (!scheduledAt.toUtc().isAfter(now)) return const ReminderTimeInPast();

    // Same reminder id and same platform id, so Android replaces the alarm
    // instead of gaining a second one.
    final reminder = await _reminders.reschedule(
      reminderId,
      scheduledAt: scheduledAt,
      timeZoneId: _timeZoneId(),
      now: now,
    );
    if (reminder == null) return const ReminderLimitReached();

    return _arm(reminder, actionTitle);
  }

  /// Permission, then platform. Both failure paths keep the row.
  Future<ReminderOutcome> _arm(ActionReminder reminder, String title) async {
    final now = _clock().toUtc();

    if (!await _scheduler.notificationsAllowed()) {
      // This is the one moment the app is allowed to ask: the user has just
      // asked to be reminded, so the request has obvious context.
      final granted = await _scheduler.requestPermission();
      if (!granted) {
        await _reminders.markState(
          reminder.id,
          state: ReminderState.needsPermission,
          now: now,
          failureClass: 'permission_denied',
        );
        return ReminderNeedsPermission(
          reminder.copyWith(
            state: ReminderState.needsPermission,
            updatedAt: now,
          ),
        );
      }
    }

    try {
      await _scheduler.schedule(
        platformNotificationId: reminder.platformNotificationId,
        actionId: reminder.actionId,
        title: title,
        scheduledAt: reminder.scheduledAt,
        timeZoneId: reminder.timeZoneId,
      );
      await _reminders.markState(
        reminder.id,
        state: ReminderState.scheduled,
        now: now,
      );
      return ReminderScheduled(
        reminder.copyWith(state: ReminderState.scheduled, updatedAt: now),
      );
    } on NotificationScheduleException catch (e) {
      await _reminders.markState(
        reminder.id,
        state: ReminderState.scheduleFailed,
        now: now,
        failureClass: e.failureClass,
      );
      return ReminderFailed(reminder, e.failureClass);
    } on Object {
      await _reminders.markState(
        reminder.id,
        state: ReminderState.scheduleFailed,
        now: now,
        failureClass: 'platform_error',
      );
      return ReminderFailed(reminder, 'platform_error');
    }
  }

  /// Removes a reminder across both systems, durably.
  ///
  /// The intent to cancel is written first, so a crash mid-way can never
  /// leave an alarm for something the user deleted — the reconciler finishes
  /// it on the next launch.
  Future<void> cancel(String reminderId) async {
    final now = _clock().toUtc();
    final reminder = await _reminders.getById(reminderId);
    if (reminder == null) return;

    await _reminders.requestCancel(reminderId, now: now);
    try {
      await _scheduler.cancel(reminder.platformNotificationId);
      await _reminders.finalizeCancel(reminderId);
    } on Object {
      // Stays cancelPending; the reconciler completes it later.
    }
  }

  /// Withdraws every still-future reminder of an Action — what completing or
  /// archiving it means. Past reminders are left as history, and nothing here
  /// recreates anything later.
  Future<void> cancelFutureFor(String actionId) async {
    final now = _clock().toUtc();
    final cancelling =
        await _reminders.requestCancelFutureFor(actionId, now: now);
    for (final reminder in cancelling) {
      try {
        await _scheduler.cancel(reminder.platformNotificationId);
        await _reminders.finalizeCancel(reminder.id);
      } on Object {
        // Left for the reconciler.
      }
    }
  }
}
