import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preference_store.dart';

/// [PreferenceStore] backed by `SharedPreferences`.
///
/// The instance is resolved once during startup and handed in, because
/// `SharedPreferences` only offers synchronous getters *after* it has loaded.
class SharedPreferencesStore implements PreferenceStore {
  const SharedPreferencesStore(this._prefs);

  final SharedPreferences _prefs;

  /// Loads the backing store, or returns an in-memory one if the platform
  /// channel fails.
  ///
  /// A device that cannot read its own preferences will show onboarding again
  /// on the next launch. That is a mildly annoying outcome; refusing to start
  /// would be a much worse one.
  static Future<PreferenceStore> open() async {
    try {
      return SharedPreferencesStore(await SharedPreferences.getInstance());
    } on Object {
      return InMemoryPreferenceStore();
    }
  }

  @override
  bool? getBool(String key) => _prefs.getBool(key);

  @override
  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  @override
  String? getString(String key) => _prefs.getString(key);

  @override
  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);

  @override
  Future<void> remove(String key) => _prefs.remove(key);
}

/// Overridden in `main()` with the loaded store, and in tests with an
/// in-memory one.
///
/// The default is a real (empty) in-memory store rather than a throw: a test
/// that never touches preferences should not have to know this provider
/// exists, and a fresh in-memory store is exactly what "no preferences yet"
/// means anyway.
final preferenceStoreProvider = Provider<PreferenceStore>(
  (ref) => InMemoryPreferenceStore(),
);
