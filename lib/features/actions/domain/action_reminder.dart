/// A reminder the user explicitly asked for, and what we honestly know about
/// the OS alarm behind it.
///
/// Scheduling spans two systems that cannot share a transaction: this
/// database, and Android's notification/alarm subsystem. So the state here
/// describes *our side of the agreement* and nothing more. There is
/// deliberately no `delivered` state: Android does not tell us a notification
/// was shown, and a scheduled time passing is not evidence that anything
/// reached the user.
enum ReminderState {
  /// Written down, not yet handed to Android. The safe landing point for a
  /// crash: intent survives, and the reconciler finishes the job.
  pendingSchedule,

  /// Handed to Android successfully. Still not a promise it will be *shown* —
  /// battery and idle policy can delay delivery.
  scheduled,

  /// The user asked for it, but notifications are not permitted. Kept, not
  /// discarded, and never described as active.
  needsPermission,

  /// Android refused it. Kept with a failure class so the UI can be honest
  /// and a bounded retry can happen.
  scheduleFailed,

  /// The user removed it; Android has not been told yet. Survives a crash so
  /// a cancelled reminder can never come back to life as a notification.
  cancelPending;

  static ReminderState fromName(String? name) => values.firstWhere(
        (v) => v.name == name,
        orElse: () => ReminderState.pendingSchedule,
      );

  /// Whether this state means an alarm may currently exist in Android.
  bool get mayExistInPlatform =>
      this == ReminderState.scheduled || this == ReminderState.cancelPending;
}

/// The most reminders one Action may carry.
///
/// Enough for "a week before / a day before / on the day" without turning a
/// single obligation into a stream of notifications.
const int maxRemindersPerAction = 5;

final class ActionReminder {
  const ActionReminder({
    required this.id,
    required this.platformNotificationId,
    required this.actionId,
    required this.scheduledAt,
    required this.timeZoneId,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    this.lastFailureClass,
  });

  /// Domain identity. Stable across every reschedule.
  final String id;

  /// Android's handle for this reminder. Stable across every reschedule too —
  /// rescheduling must *replace* the alarm, never add a second one.
  final int platformNotificationId;

  final String actionId;

  /// The absolute moment the user agreed to, always UTC in memory.
  final DateTime scheduledAt;

  /// The IANA zone that moment was chosen in. Kept so the choice can be
  /// explained later; changing device timezone does not move [scheduledAt].
  final String timeZoneId;

  final ReminderState state;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Short machine word ('permission_denied', 'platform_error', ...) — never
  /// message text, never Action content.
  final String? lastFailureClass;

  /// True once the moment has passed. A past reminder is never re-armed as if
  /// it were still coming.
  bool isPast(DateTime now) => !scheduledAt.isAfter(now.toUtc());

  /// Whether the user should be told this reminder is actually working.
  bool get isActive => state == ReminderState.scheduled;

  ActionReminder copyWith({
    DateTime? scheduledAt,
    String? timeZoneId,
    ReminderState? state,
    DateTime? updatedAt,
    Object? lastFailureClass = _unset,
  }) =>
      ActionReminder(
        id: id,
        platformNotificationId: platformNotificationId,
        actionId: actionId,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        timeZoneId: timeZoneId ?? this.timeZoneId,
        state: state ?? this.state,
        createdAt: createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lastFailureClass: lastFailureClass == _unset
            ? this.lastFailureClass
            : lastFailureClass as String?,
      );
}

const Object _unset = Object();
