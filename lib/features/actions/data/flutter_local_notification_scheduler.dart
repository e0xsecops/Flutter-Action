import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import '../../../l10n/gen/app_l10n.dart';
import 'notification_scheduler.dart';

/// The one place in the app that talks to Android's notification subsystem.
///
/// Everything above this is testable without a platform channel; everything
/// platform-specific and version-sensitive is here, coded against
/// flutter_local_notifications 22.3.0 as installed.
///
/// **Language.** A notification is the one part of Action that appears without
/// being opened, so its three app-authored strings — the channel's name and
/// description in Android's own settings, and the notification title — have to
/// be in the user's language too. There is no `BuildContext` down here and
/// there never will be, so the bundle arrives as a callback the caller reads
/// at the moment it is needed: a locale can change while this object lives,
/// and a scheduler holding a bundle captured at construction would keep
/// announcing reminders in the language the app started in.
class FlutterLocalNotificationScheduler implements NotificationScheduler {
  FlutterLocalNotificationScheduler({
    FlutterLocalNotificationsPlugin? plugin,
    AppL10n Function()? l10n,
  })  : _bundle = l10n,
        _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;

  /// The current bundle, asked for rather than held.
  ///
  /// Null means nobody wired one in, and the English below is used. That is a
  /// fallback, not a design: it exists so this class stays constructible in a
  /// test and so a missing wire degrades to readable English rather than to a
  /// crash on a lock screen.
  final AppL10n Function()? _bundle;

  final _taps = StreamController<String>.broadcast();

  @override
  Stream<String> get tappedActionIds => _taps.stream;

  /// One channel for every reminder. A channel per Action would flood the
  /// system notification settings screen and give the user nothing useful to
  /// control.
  ///
  /// The id is an identifier and stays English forever: Android keys the
  /// user's own choices about this channel — importance, sound, whether it is
  /// blocked — to this exact string, so translating it would abandon every
  /// setting the user has made and silently re-enable a channel they had
  /// turned off.
  static const channelId = 'action_reminders';

  static const _englishChannelName = 'Action reminders';
  static const _englishChannelDescription =
      'Reminders you set yourself for your actions.';
  static const _englishNotificationTitle = 'Action reminder';

  String get _channelName =>
      _bundle?.call().reminderChannelName ?? _englishChannelName;

  String get _channelDescription =>
      _bundle?.call().reminderChannelDescription ?? _englishChannelDescription;

  /// The line above the body. Never the Action's own words: on a secure lock
  /// screen `NotificationVisibility.private` hides the body and leaves this,
  /// so whatever this says is what a stranger reads.
  String get _notificationTitle =>
      _bundle?.call().reminderNotificationTitle ?? _englishNotificationTitle;

  bool _initialized = false;

  /// What Android was last told this channel is called, so the copy is only
  /// re-registered when it has actually changed.
  String? _registeredChannelName;
  String? _registeredChannelDescription;

  AndroidFlutterLocalNotificationsPlugin? get _android =>
      _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  @override
  Future<void> initialize() async {
    if (_initialized) {
      // Cheap, and the only chance the channel copy gets to follow a language
      // change: see [_registerChannel].
      await _registerChannel();
      return;
    }

    // The timezone database has to exist before any TZDateTime is built.
    tz_data.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(await deviceTimeZoneId()));

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: _handleResponse,
    );

    await _registerChannel();

    _initialized = true;
  }

  /// Registers the channel, and registers it again when its copy has changed.
  ///
  /// Android stores the channel's name and description in its own record the
  /// moment the channel is created, and every notification posted to the
  /// channel from then on is labelled from that record rather than from
  /// anything this app holds. Calling `createNotificationChannel` again with
  /// the same id updates exactly the name and the description; importance,
  /// sound and vibration belong to the user after creation and are not
  /// re-applied.
  ///
  /// So a language change reaches Android's own settings screen only when this
  /// runs again, which is why it sits outside the `_initialized` guard rather
  /// than inside it. Arming, cancelling and auditing a reminder all call
  /// [initialize] first, so the rename lands the next time one of those runs
  /// rather than only after the next cold start.
  ///
  /// Importance.high (not max): a reminder the user asked for deserves to be
  /// seen, but this is not an alarm clock and never takes over the screen.
  Future<void> _registerChannel() async {
    final name = _channelName;
    final description = _channelDescription;
    if (name == _registeredChannelName &&
        description == _registeredChannelDescription) {
      return;
    }

    await _android?.createNotificationChannel(
      AndroidNotificationChannel(
        channelId,
        name,
        description: description,
        importance: Importance.high,
      ),
    );

    _registeredChannelName = name;
    _registeredChannelDescription = description;
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
        // Resolved now rather than at delivery: Android is handed the finished
        // notification and gives it back verbatim whenever it fires, so a
        // reminder armed today arrives in today's language however long it
        // waits. Re-arming is the only thing that relabels a pending one,
        // which is what the reconciler's `rearmAll` pass exists for.
        title: _notificationTitle,
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
        notificationDetails: NotificationDetails(
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

  /// Machine words, never shown to anyone. They are matched against the
  /// platform's own English error text and stored in a reminder row, so they
  /// are identifiers rather than copy and are deliberately not translated.
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
