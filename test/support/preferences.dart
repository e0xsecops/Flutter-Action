import 'package:action_app/core/preferences/preference_store.dart';

/// A preference store for tests that exercise the app *after* first run.
///
/// The Day-13 router sends anyone without this flag to onboarding, which is
/// correct in production and merely in the way when the subject under test is
/// Home, Search or Action Detail.
PreferenceStore onboardedPreferences() => InMemoryPreferenceStore(
      {PreferenceKeys.onboardingCompleted: true},
    );

/// A store in the state a freshly installed app is in.
PreferenceStore freshPreferences() => InMemoryPreferenceStore();
