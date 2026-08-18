/// The seam between "the user asked to be reminded" and Android's alarm and
/// notification subsystem.
///
/// Everything above this interface is testable without a platform channel,
/// which matters because the interesting cases are the failures: permission
/// refused, the OS rejecting a schedule, an alarm that quietly went missing.
/// Those are hard to provoke on a device and trivial to provoke against a
/// fake.
abstract interface class NotificationScheduler {
  /// Prepares the plugin and the notification channel. Safe to call twice.
  Future<void> initialize();

  /// Action ids from reminders the user tapped while the app was running.
  Stream<String> get tappedActionIds;

  /// The Action id of a reminder that cold-started the app, if any.
  ///
  /// A separate question from [tappedActionIds] because the tap happened
  /// before anything was listening, and both paths must route identically.
  Future<String?> launchActionId();

  /// Whether the OS will currently show our notifications. Asks; never
  /// prompts.
  Future<bool> notificationsAllowed();

  /// Prompts for the Android 13+ runtime permission. Only ever called from a
  /// point where the user has just asked for a reminder — never at launch.
  Future<bool> requestPermission();

  /// Arms a notification at an absolute instant, in [timeZoneId].
  ///
  /// Implementations must be idempotent on [platformNotificationId]: arming
  /// the same id twice replaces the alarm rather than producing two.
  /// Throws [NotificationScheduleException] if the platform refuses.
  Future<void> schedule({
    required int platformNotificationId,
    required String actionId,
    required String title,
    required DateTime scheduledAt,
    required String timeZoneId,
  });

  Future<void> cancel(int platformNotificationId);

  /// Ids Android currently holds. The reconciler compares this against our
  /// own rows, because an alarm can disappear (reboot, force-stop, OEM
  /// battery manager) without telling anyone.
  Future<Set<int>> pendingNotificationIds();
}

/// The platform refused to schedule. [failureClass] is a short machine word,
/// never message text and never Action content.
final class NotificationScheduleException implements Exception {
  const NotificationScheduleException(this.failureClass);

  final String failureClass;

  @override
  String toString() => 'NotificationScheduleException($failureClass)';
}
