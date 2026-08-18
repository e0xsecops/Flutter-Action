import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/preferences/preference_store.dart';
import '../../../core/preferences/shared_preferences_store.dart';

/// Whether first-run onboarding is behind us.
///
/// Read synchronously by the router so the very first frame is already the
/// right screen. The value is a plain `bool` because that is genuinely all
/// the state there is: onboarding is finished, or it is not.
class OnboardingController extends Notifier<bool> {
  @override
  bool build() =>
      ref
          .watch(preferenceStoreProvider)
          .getBool(PreferenceKeys.onboardingCompleted) ??
      false;

  /// Marks onboarding done — whether the user read every screen or skipped.
  ///
  /// State moves first and persistence follows, so navigation never waits on
  /// a disk write. If the write fails the user simply sees onboarding again
  /// next launch, which is the safe direction to fail in: showing it twice is
  /// recoverable, hiding it forever on a broken store is not.
  Future<void> complete() async {
    state = true;
    await ref
        .read(preferenceStoreProvider)
        .setBool(PreferenceKeys.onboardingCompleted, true);
  }

  /// Puts the app back into its first-run state.
  ///
  /// Exists for tests and for QA on a device that must keep its existing
  /// Actions — resetting this flag is emphatically not the same thing as
  /// clearing data, and it touches nothing but the flag.
  Future<void> reset() async {
    state = false;
    await ref
        .read(preferenceStoreProvider)
        .remove(PreferenceKeys.onboardingCompleted);
  }
}

final onboardingControllerProvider =
    NotifierProvider<OnboardingController, bool>(OnboardingController.new);
