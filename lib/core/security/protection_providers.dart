/// The four protections the user can turn on, and the state that drives them.
///
/// Lives in `core` rather than under the settings feature because nothing here
/// is specific to settings: the reminder layer reads the notification setting,
/// the app shell reads the lock, and the Security Centre only happens to be
/// where they are presented.
///
/// These are settings with teeth: each one changes what another process can
/// see. So each is persisted, each is reflected truthfully in the Security
/// Centre — including when the platform refused it — and each is recorded in
/// the activity journal, because "when did I turn this on?" is a question a
/// person genuinely asks about a security setting.
library;

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../preferences/preference_store.dart';
import '../preferences/shared_preferences_store.dart';
import 'activity_journal.dart';
import 'activity_providers.dart';
import 'device_lock.dart';
import 'platform_device_lock.dart';

final deviceAuthenticatorProvider = Provider<DeviceAuthenticator>((ref) {
  return LocalAuthDeviceAuthenticator();
});

final screenPrivacyProvider = Provider<ScreenPrivacy>((ref) {
  return const PlatformScreenPrivacy();
});

/// Whether this device can be asked to confirm the owner at all.
///
/// False on a device with no PIN, pattern, password or enrolled biometric.
/// App Lock is not offered in that state: switching it on would lock someone
/// out of their own data with no way back in, which is a bug that cannot be
/// apologised for afterwards.
final appLockAvailableProvider = FutureProvider<bool>((ref) async {
  return ref.watch(deviceAuthenticatorProvider).isAvailable();
});

/// Everything the user has chosen about protection.
class ProtectionSettings {
  const ProtectionSettings({
    this.appLockEnabled = false,
    this.appLockDelay = AppLockDelay.immediately,
    this.screenPrivacyEnabled = false,
    this.privateNotifications = false,
  });

  final bool appLockEnabled;
  final AppLockDelay appLockDelay;
  final bool screenPrivacyEnabled;
  final bool privateNotifications;

  /// How many of the four are on. Shown as a count rather than a score: a
  /// number out of four is a fact, and "security: 75%" would be a claim.
  int get activeCount => [
        appLockEnabled,
        screenPrivacyEnabled,
        privateNotifications,
      ].where((on) => on).length;

  ProtectionSettings copyWith({
    bool? appLockEnabled,
    AppLockDelay? appLockDelay,
    bool? screenPrivacyEnabled,
    bool? privateNotifications,
  }) =>
      ProtectionSettings(
        appLockEnabled: appLockEnabled ?? this.appLockEnabled,
        appLockDelay: appLockDelay ?? this.appLockDelay,
        screenPrivacyEnabled:
            screenPrivacyEnabled ?? this.screenPrivacyEnabled,
        privateNotifications: privateNotifications ?? this.privateNotifications,
      );
}

final protectionSettingsProvider =
    NotifierProvider<ProtectionSettingsController, ProtectionSettings>(
  ProtectionSettingsController.new,
);

class ProtectionSettingsController extends Notifier<ProtectionSettings> {
  @override
  ProtectionSettings build() {
    final prefs = ref.watch(preferenceStoreProvider);
    final settings = ProtectionSettings(
      appLockEnabled: prefs.getBool(PreferenceKeys.appLockEnabled) ?? false,
      appLockDelay:
          appLockDelayFromId(prefs.getString(PreferenceKeys.appLockDelay)),
      screenPrivacyEnabled:
          prefs.getBool(PreferenceKeys.screenPrivacyEnabled) ?? false,
      privateNotifications:
          prefs.getBool(PreferenceKeys.privateNotifications) ?? false,
    );

    // Re-apply the window flag on every app start. FLAG_SECURE lives on the
    // Activity's window, not in any store, so a setting the user turned on
    // last week protects nothing today unless something asks for it again.
    if (settings.screenPrivacyEnabled) {
      unawaited(ref.read(screenPrivacyProvider).setEnabled(true));
    }

    return settings;
  }

  /// Turns App Lock on or off.
  ///
  /// Turning it *on* requires passing the check first. Enabling a lock the
  /// user cannot open — no credential enrolled, sensor broken — would be a
  /// trap, and finding out at the door is too late.
  Future<AppLockChangeResult> setAppLock(bool enabled) async {
    if (enabled == state.appLockEnabled) return AppLockChangeResult.unchanged;

    if (enabled) {
      final authenticator = ref.read(deviceAuthenticatorProvider);
      if (!await authenticator.isAvailable()) {
        return AppLockChangeResult.unavailable;
      }
      final outcome = await authenticator.authenticate(
        'Confirm it is you before turning on App Lock',
      );
      if (outcome != DeviceAuthOutcome.succeeded) {
        return outcome == DeviceAuthOutcome.unavailable
            ? AppLockChangeResult.unavailable
            : AppLockChangeResult.refused;
      }
    } else {
      // And turning it *off* requires it too, or the lock protects nothing
      // from someone holding the unlocked phone.
      final outcome = await ref.read(deviceAuthenticatorProvider).authenticate(
            'Confirm it is you before turning off App Lock',
          );
      if (outcome != DeviceAuthOutcome.succeeded) {
        return AppLockChangeResult.refused;
      }
    }

    state = state.copyWith(appLockEnabled: enabled);
    await ref
        .read(preferenceStoreProvider)
        .setBool(PreferenceKeys.appLockEnabled, enabled);
    await ref.read(activityRecorderProvider).record(
          enabled ? ActivityEvent.appLockEnabled : ActivityEvent.appLockDisabled,
        );
    return AppLockChangeResult.changed;
  }

  Future<void> setAppLockDelay(AppLockDelay delay) async {
    state = state.copyWith(appLockDelay: delay);
    await ref
        .read(preferenceStoreProvider)
        .setString(PreferenceKeys.appLockDelay, appLockDelayId(delay));
  }

  /// Asks Android for FLAG_SECURE.
  ///
  /// Returns whether it was actually applied. The setting is only stored when
  /// the platform accepted it: a switch that stays on while the window is
  /// unprotected is the worst outcome available here, because the user would
  /// then believe they were covered.
  Future<bool> setScreenPrivacy(bool enabled) async {
    final applied = await ref.read(screenPrivacyProvider).setEnabled(enabled);
    if (!applied && enabled) return false;

    state = state.copyWith(screenPrivacyEnabled: enabled);
    await ref
        .read(preferenceStoreProvider)
        .setBool(PreferenceKeys.screenPrivacyEnabled, enabled);
    await ref.read(activityRecorderProvider).record(
          enabled
              ? ActivityEvent.screenPrivacyEnabled
              : ActivityEvent.screenPrivacyDisabled,
        );
    return true;
  }

  Future<void> setPrivateNotifications(bool enabled) async {
    state = state.copyWith(privateNotifications: enabled);
    await ref
        .read(preferenceStoreProvider)
        .setBool(PreferenceKeys.privateNotifications, enabled);
    await ref.read(activityRecorderProvider).record(
          enabled
              ? ActivityEvent.notificationPrivacyEnabled
              : ActivityEvent.notificationPrivacyDisabled,
        );
  }
}

/// What happened when the user asked to change App Lock.
///
/// Four outcomes rather than a bool, because each one needs a different
/// sentence and "it didn't work" is not one of them.
enum AppLockChangeResult { changed, unchanged, refused, unavailable }

/// Whether Action is currently locked.
final appLockedProvider =
    NotifierProvider<AppLockedController, bool>(AppLockedController.new);

class AppLockedController extends Notifier<bool> {
  /// When Action last left the foreground. Null at start-up, which
  /// [AppLockPolicy] deliberately reads as "lock".
  DateTime? _leftAt;

  /// True while the OS prompt is up.
  ///
  /// The prompt can itself push Action out of the foreground, which without
  /// this would record a departure, re-arm the lock on the way back, and
  /// produce a prompt that reappears the instant it is satisfied.
  bool _authenticating = false;

  @override
  bool build() => ref.watch(protectionSettingsProvider).appLockEnabled;

  void noteLeftForeground({DateTime? at}) {
    if (_authenticating) return;
    _leftAt = at ?? DateTime.now();
  }

  /// Re-evaluates on return to the foreground.
  void noteReturnedToForeground({DateTime? at}) {
    if (_authenticating) return;
    final settings = ref.read(protectionSettingsProvider);
    final locked = AppLockPolicy.shouldLock(
      enabled: settings.appLockEnabled,
      delay: settings.appLockDelay,
      leftAt: _leftAt,
      now: at ?? DateTime.now(),
    );
    if (locked) state = true;
  }

  /// The Quick Lock control.
  void lockNow() {
    if (!ref.read(protectionSettingsProvider).appLockEnabled) return;
    _leftAt = null;
    state = true;
  }

  /// Prompts, and unlocks if the OS says yes.
  Future<DeviceAuthOutcome> unlock() async {
    _authenticating = true;
    try {
      final outcome = await ref
          .read(deviceAuthenticatorProvider)
          .authenticate('Unlock Action');
      if (outcome == DeviceAuthOutcome.succeeded) {
        _leftAt = null;
        state = false;
      }
      return outcome;
    } finally {
      _authenticating = false;
    }
  }
}
