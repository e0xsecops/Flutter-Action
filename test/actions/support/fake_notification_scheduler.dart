import 'dart:async';

import 'package:action_app/features/actions/data/notification_scheduler.dart';

/// A scheduler that behaves like Android without being Android.
///
/// The interesting reminder behaviour is all failure behaviour — permission
/// refused, the platform rejecting an alarm, an alarm quietly vanishing after
/// a reboot. Those are painful to provoke on a device and trivial here, which
/// is the entire reason the seam exists.
class FakeNotificationScheduler implements NotificationScheduler {
  FakeNotificationScheduler({
    this.allowed = true,
    this.grantOnRequest = true,
  });

  /// Whether the OS would currently show notifications.
  bool allowed;

  /// What the runtime permission dialog would return.
  bool grantOnRequest;

  /// Set to make the next schedule call fail with this class.
  String? failScheduleWith;

  /// Set to make cancel throw, so cancellation durability can be tested.
  bool failCancel = false;

  int initializeCalls = 0;
  int permissionRequests = 0;

  /// The Action id a cold-start tap would report.
  String? launchTapActionId;

  final _taps = StreamController<String>.broadcast();

  @override
  Stream<String> get tappedActionIds => _taps.stream;

  @override
  Future<String?> launchActionId() async => launchTapActionId;

  /// Simulates the user tapping a delivered reminder while the app runs.
  void emitTap(String actionId) => _taps.add(actionId);

  void dispose() => _taps.close();

  final scheduled = <int, ScheduledCall>{};
  final scheduleLog = <ScheduledCall>[];
  final cancelLog = <int>[];

  /// Simulates alarms disappearing without notice — a reboot, a force-stop,
  /// or an OEM battery manager.
  void loseAllPlatformAlarms() => scheduled.clear();

  @override
  Future<void> initialize() async => initializeCalls++;

  @override
  Future<bool> notificationsAllowed() async => allowed;

  @override
  Future<bool> requestPermission() async {
    permissionRequests++;
    if (grantOnRequest) allowed = true;
    return allowed;
  }

  @override
  Future<void> schedule({
    required int platformNotificationId,
    required String actionId,
    required String title,
    required DateTime scheduledAt,
    required String timeZoneId,
  }) async {
    final failure = failScheduleWith;
    if (failure != null) throw NotificationScheduleException(failure);
    final call = ScheduledCall(
      platformNotificationId: platformNotificationId,
      actionId: actionId,
      title: title,
      scheduledAt: scheduledAt,
      timeZoneId: timeZoneId,
    );
    // Keyed by id, exactly like Android: arming the same id twice replaces.
    scheduled[platformNotificationId] = call;
    scheduleLog.add(call);
  }

  @override
  Future<void> cancel(int platformNotificationId) async {
    if (failCancel) throw const NotificationScheduleException('cancel_failed');
    cancelLog.add(platformNotificationId);
    scheduled.remove(platformNotificationId);
  }

  @override
  Future<Set<int>> pendingNotificationIds() async => scheduled.keys.toSet();
}

final class ScheduledCall {
  const ScheduledCall({
    required this.platformNotificationId,
    required this.actionId,
    required this.title,
    required this.scheduledAt,
    required this.timeZoneId,
  });

  final int platformNotificationId;
  final String actionId;
  final String title;
  final DateTime scheduledAt;
  final String timeZoneId;
}
