/// The platform half of App Lock and Screen Privacy.
///
/// Kept apart from `device_lock.dart` so that file — and everything that
/// reasons about locking — stays free of a plugin import and testable without
/// a platform channel.
library;

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'device_lock.dart';

/// Asks Android's BiometricPrompt, falling back to the device credential.
class LocalAuthDeviceAuthenticator implements DeviceAuthenticator {
  LocalAuthDeviceAuthenticator({LocalAuthentication? auth})
      : _auth = auth ?? LocalAuthentication();

  final LocalAuthentication _auth;

  @override
  Future<bool> isAvailable() async {
    try {
      // `isDeviceSupported` is the right question, not `canCheckBiometrics`.
      // It is true whenever *any* secure credential exists — PIN, pattern,
      // password or biometric — which is exactly the set of devices where App
      // Lock can be offered without locking someone out. Asking only about
      // biometrics would deny the feature to a phone with a PIN and no sensor.
      return await _auth.isDeviceSupported();
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  @override
  Future<DeviceAuthOutcome> authenticate(String reason) async {
    try {
      final ok = await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          // False on purpose: the device credential is a first-class way in.
          // A user with no enrolled fingerprint still gets App Lock, and a
          // user whose sensor fails still gets back into their own data.
          biometricOnly: false,
          // Survives the prompt being interrupted by the system rather than
          // silently failing the attempt.
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
      return ok ? DeviceAuthOutcome.succeeded : DeviceAuthOutcome.failed;
    } on PlatformException catch (error) {
      // The error *code* only. A platform message is free text from another
      // process and has no business in this app's state.
      return switch (error.code) {
        'NotAvailable' ||
        'NotEnrolled' ||
        'PasscodeNotSet' =>
          DeviceAuthOutcome.unavailable,
        _ => DeviceAuthOutcome.failed,
      };
    } on MissingPluginException {
      return DeviceAuthOutcome.unavailable;
    }
  }
}

/// Whether Android should block screenshots, screen recording and the
/// recent-apps preview for this window.
abstract interface class ScreenPrivacy {
  /// Returns whether the platform accepted the change.
  Future<bool> setEnabled(bool enabled);
}

class PlatformScreenPrivacy implements ScreenPrivacy {
  const PlatformScreenPrivacy();

  static const _channel =
      MethodChannel('com.solvex.actionapp/screen_privacy');

  @override
  Future<bool> setEnabled(bool enabled) async {
    try {
      final result = await _channel.invokeMethod<bool>(
        'setSecure',
        {'enabled': enabled},
      );
      return result ?? false;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      // iOS has no FLAG_SECURE equivalent, and a widget test has no channel.
      // Reporting false is what keeps the Security Centre honest about
      // whether the protection is actually on.
      return false;
    }
  }
}

/// For tests and for hosts with no equivalent capability.
class NoopScreenPrivacy implements ScreenPrivacy {
  const NoopScreenPrivacy();

  @override
  Future<bool> setEnabled(bool enabled) async => false;
}
