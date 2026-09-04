import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/preferences/preference_store.dart';
import '../../../core/preferences/shared_preferences_store.dart';
import '../../../l10n/supported_locales.dart';
import '../../settings/application/locale_controller.dart';
import '../domain/ocr_script.dart';

/// The language the app is actually being read in.
///
/// Not the same thing as [localeControllerProvider], which is null whenever the
/// user has not chosen — and "null" is not a language to pick a recogniser for.
/// This resolves that null the way `MaterialApp` does, through
/// [AppLocales.resolve], so the default script matches the words on screen
/// rather than a locale the app never displays.
final effectiveLocaleProvider = Provider<Locale>((ref) {
  final chosen = ref.watch(localeControllerProvider);
  if (chosen != null) return chosen;
  final platform = WidgetsBinding.instance.platformDispatcher;
  return AppLocales.resolve(platform.locales, AppLocales.locales) ??
      AppLocales.english.locale;
});

/// The script the user explicitly picked, or null for "follow the language".
///
/// The distinction is kept rather than collapsed into a concrete script,
/// because the two are different states to the user and only one of them
/// survives a language change. Someone reading the app in English who picked
/// Japanese wants Japanese; someone who never opened the setting wants the
/// recogniser to follow them when they switch the app to Hindi. Storing the
/// resolved value would silently turn the second person into the first the
/// first time the default was written to disk.
class OcrScriptController extends Notifier<OcrScript?> {
  @override
  OcrScript? build() => OcrScript.byTag(
        ref.watch(preferenceStoreProvider).getString(PreferenceKeys.ocrScript),
      );

  /// Pass null to go back to following the app's language.
  Future<void> set(OcrScript? script) async {
    state = script;
    final store = ref.read(preferenceStoreProvider);
    if (script == null) {
      await store.remove(PreferenceKeys.ocrScript);
      return;
    }
    await store.setString(PreferenceKeys.ocrScript, script.tag);
  }
}

final ocrScriptControllerProvider =
    NotifierProvider<OcrScriptController, OcrScript?>(OcrScriptController.new);

/// The script the recogniser is actually loaded for.
///
/// What every reader of this value wants: the explicit choice if there is one,
/// and otherwise the sensible default for the language on screen.
final ocrScriptProvider = Provider<OcrScript>((ref) {
  return ref.watch(ocrScriptControllerProvider) ??
      OcrScript.defaultFor(ref.watch(effectiveLocaleProvider));
});
