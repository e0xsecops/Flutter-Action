import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sends the user to this app's own settings page.
///
/// A seam rather than a direct channel call so tests can assert that opening
/// settings is something the user *asked* for, and never a side effect of a
/// screen appearing.
abstract interface class SystemSettingsLauncher {
  /// Returns false when no settings activity could be resolved, so the caller
  /// can say so rather than appearing to do nothing.
  Future<bool> openNotificationSettings();
}

class PlatformSystemSettingsLauncher implements SystemSettingsLauncher {
  const PlatformSystemSettingsLauncher();

  static const _channel = MethodChannel('com.solvex.actionapp/system_settings');

  @override
  Future<bool> openNotificationSettings() async {
    try {
      return await _channel.invokeMethod<bool>('openNotificationSettings') ??
          false;
    } on Object {
      // A missing implementation (any non-Android host) is a "no", not a
      // crash on a settings screen.
      return false;
    }
  }
}

final systemSettingsLauncherProvider = Provider<SystemSettingsLauncher>(
  (ref) => const PlatformSystemSettingsLauncher(),
);

/// The installed build's version, read from the platform rather than kept as
/// a constant in Dart that someone has to remember to bump.
final appVersionProvider = FutureProvider<String?>((ref) async {
  try {
    final info = await PlatformSystemSettingsLauncher._channel
        .invokeMapMethod<String, String>('packageVersion');
    final version = info?['version'];
    if (version == null || version.isEmpty) return null;
    final build = info?['build'];
    return build == null || build.isEmpty ? version : '$version ($build)';
  } on Object {
    return null;
  }
});
