/// A tiny key/value seam for the handful of settings the app remembers.
///
/// **Reads are synchronous, writes are not.** That asymmetry is the whole
/// point: the router has to know whether onboarding is finished *while it is
/// deciding the first route*, and an async answer there means either a splash
/// flicker or a frame of the wrong screen. The backing store is loaded once
/// before `runApp`, after which every read is a map lookup.
///
/// This is deliberately not a database. Two booleans and a string do not earn
/// a schema, a migration path or a second file to keep consistent with the
/// first one.
abstract interface class PreferenceStore {
  bool? getBool(String key);
  Future<void> setBool(String key, bool value);

  String? getString(String key);
  Future<void> setString(String key, String value);

  Future<void> remove(String key);
}

/// Used by tests, and as the fallback when the real store cannot be opened.
///
/// Falling back rather than throwing is the same call made for App Check and
/// for the reminder scheduler: a device that cannot persist a preference
/// should lose the preference, not lose the app.
class InMemoryPreferenceStore implements PreferenceStore {
  InMemoryPreferenceStore([Map<String, Object>? seed])
      : _values = {...?seed};

  final Map<String, Object> _values;

  @override
  bool? getBool(String key) => _values[key] as bool?;

  @override
  Future<void> setBool(String key, bool value) async => _values[key] = value;

  @override
  String? getString(String key) => _values[key] as String?;

  @override
  Future<void> setString(String key, String value) async =>
      _values[key] = value;

  @override
  Future<void> remove(String key) async => _values.remove(key);
}

/// Every key the app persists, in one place, so it is possible to answer
/// "what does this app remember about me?" by reading a single list — which
/// is exactly the question the privacy screen has to answer honestly.
abstract final class PreferenceKeys {
  /// Whether first-run onboarding has been finished or deliberately skipped.
  static const onboardingCompleted = 'onboarding_completed_v1';

  /// The user's appearance choice: system, light or dark.
  static const themeMode = 'theme_mode_v1';

  static const all = <String>[onboardingCompleted, themeMode];
}
