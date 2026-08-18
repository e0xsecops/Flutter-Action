import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import 'notification_scheduler.dart';

/// The one place in the app that talks to Android's notification subsystem.
///
/// Everything above this is testable without a platform channel; everything
/// platform-specific and version-sensitive is here, coded against
/// flutter_local_notifications 22.3.0 as installed.
class FlutterLocalNotificationScheduler implements NotificationScheduler {
  FlutterLocalNotificationScheduler({FlutterLocalNotificationsPlugin? plugin})
      : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  final _taps = StreamController<String>.broadcast();

  @override
  Stream<String> get tappedActionIds => _taps.stream;

  /// One channel for every reminder. A channel per Action would flood the
  /// system notification settings screen and give the user nothing useful to
  /// control.
  static const channelId = 'action_reminders';
  static const _channelName = 'Action reminders';
  static const _channelDescription =
      'Reminders you set yourself for your actions.';

  bool _initialized = false;

  AndroidFlutterLocalNotificationsPlugin? get _android =>
      _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  @override
  Future<void> initialize() async {
    if (_initialized) return;

    // The timezone database has to exist before any TZDateTime is built.
    tz_data.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(await deviceTimeZoneId()));

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: _handleResponse,
    );

    // Importance.high (not max): a reminder the user asked for deserves to be
    // seen, but this is not an alarm clock and never takes over the screen.
    await _android?.createNotificationChannel(
      const AndroidNotificationChannel(
        channelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.high,
      ),
    );

    _initialized = true;
  }

  @override
  Future<String?> launchActionId() async {
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp != true) return null;
    final payload = details?.notificationResponse?.payload;
    return (payload != null && payload.isNotEmpty) ? payload : null;
  }

  void _handleResponse(NotificationResponse response) {
    final actionId = response.payload;
    if (actionId != null && actionId.isNotEmpty) _taps.add(actionId);
  }

  @override
  Future<bool> notificationsAllowed() async =>
      await _android?.areNotificationsEnabled() ?? false;

  @override
  Future<bool> requestPermission() async =>
      await _android?.requestNotificationsPermission() ?? false;

  @override
  Future<void> schedule({
    required int platformNotificationId,
    required String actionId,
    required String title,
    required DateTime scheduledAt,
    required String timeZoneId,
  }) async {
    await initialize();
    try {
      // Built in the zone the reminder was agreed in, so the absolute instant
      // is preserved even if the device has since moved.
      final location = _locationOrLocal(timeZoneId);
      final when = tz.TZDateTime.from(scheduledAt.toUtc(), location);

      await _plugin.zonedSchedule(
        id: platformNotificationId,
        title: 'Action reminder',
        // The Action's own words, and nothing else. No amount, no deadline,
        // no reference number, no source text — this can appear on a lock
        // screen.
        body: title,
        scheduledDate: when,
        // Inexact on purpose: see the manifest comment. This mode needs no
        // exact-alarm permission and still fires in Doze.
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        // Routing only. Never the source id, the amount or anything else.
        payload: actionId,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            channelId,
            _channelName,
            channelDescription: _channelDescription,
            importance: Importance.high,
            priority: Priority.defaultPriority,
            // Conceal the body on a secure lock screen: the Action title is
            // the user's business, not the room's.
            visibility: NotificationVisibility.private,
          ),
        ),
      );
    } on NotificationScheduleException {
      rethrow;
    } on Object catch (error) {
      // Classified, never echoed: a platform message could carry content.
      throw NotificationScheduleException(_classify(error));
    }
  }

  @override
  Future<void> cancel(int platformNotificationId) async {
    await initialize();
    await _plugin.cancel(id: platformNotificationId);
  }

  @override
  Future<Set<int>> pendingNotificationIds() async {
    await initialize();
    final pending = await _plugin.pendingNotificationRequests();
    return {for (final request in pending) request.id};
  }

  /// Falls back to the device zone if a stored id is not in the tz database
  /// (renamed zone, corrupt row). Better a reminder in the current zone than
  /// no reminder at all.
  tz.Location _locationOrLocal(String timeZoneId) {
    try {
      return tz.getLocation(timeZoneId);
    } on Object {
      return tz.local;
    }
  }

  static String _classify(Object error) {
    final text = error.toString().toLowerCase();
    if (text.contains('permission')) return 'permission_denied';
    if (text.contains('exact_alarms_not_permitted') ||
        text.contains('exact alarm')) {
      return 'exact_alarms_not_permitted';
    }
    if (text.contains('invalid')) return 'invalid_schedule';
    return 'platform_error';
  }
}

/// The device's IANA zone id, e.g. `Asia/Dhaka`.
///
/// An offset like `+06:00` is not an identity — it cannot express when the
/// offset changes — so the id is what gets stored with a reminder.
Future<String> deviceTimeZoneId() async {
  try {
    return (await FlutterTimezone.getLocalTimezone()).identifier;
  } on Object {
    return 'UTC';
  }
}
