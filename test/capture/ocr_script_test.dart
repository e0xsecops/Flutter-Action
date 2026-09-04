/// Which writing system the recogniser is loaded for.
///
/// **Why this is worth a file of its own.** Before it existed the recogniser
/// was hard-coded to Latin, which meant an app offered in Hindi, Japanese,
/// Korean and Chinese could not read a letter written in any of them — and
/// said nothing about it. The failure was invisible: the user photographed a
/// document and got an empty result that looked like a bad photo.
///
/// So the properties tested here are the ones that make it visible. The
/// default follows the language on screen. An explicit choice outlives a
/// restart, and outlives a language change. The five languages with no
/// recogniser at all are named rather than left to fail quietly. And the
/// engine string stored on every capture stays exactly what it was for Latin,
/// so the rows written before this existed are still attributable.
library;

import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/features/capture/application/ocr_script_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/ocr_script.dart';
import 'package:action_app/features/settings/application/locale_controller.dart';
import 'package:action_app/l10n/supported_locales.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// A container whose language is already chosen, so the default script is
/// resolved from a known locale rather than from whatever the host machine is.
ProviderContainer containerFor({String? languageTag, String? scriptTag}) {
  final container = ProviderContainer(
    overrides: [
      preferenceStoreProvider.overrideWithValue(
        InMemoryPreferenceStore({
          PreferenceKeys.onboardingCompleted: true,
          PreferenceKeys.languageTag: ?languageTag,
          PreferenceKeys.ocrScript: ?scriptTag,
        }),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('the default script follows the language on screen', () {
    const expected = {
      'en': OcrScript.latin,
      'es': OcrScript.latin,
      'fr': OcrScript.latin,
      'de': OcrScript.latin,
      'pt': OcrScript.latin,
      'it': OcrScript.latin,
      'pl': OcrScript.latin,
      'tr': OcrScript.latin,
      'id': OcrScript.latin,
      'vi': OcrScript.latin,
      'hi': OcrScript.devanagari,
      'ja': OcrScript.japanese,
      'ko': OcrScript.korean,
      'zh': OcrScript.chinese,
    };

    expected.forEach((tag, script) {
      test('$tag reads $script', () {
        expect(OcrScript.defaultFor(Locale(tag)), script);
      });
    });

    test('a language with no recogniser still lands on Latin', () {
      // Not a fallback of convenience: Latin is the script most documents in
      // these countries are printed in, and it is the model guaranteed to be
      // present. What must not happen is a null, or a crash, or a silent
      // absence of recognition.
      for (final tag in ['bn', 'ur', 'ar', 'th', 'ru']) {
        expect(OcrScript.defaultFor(Locale(tag)), OcrScript.latin);
      }
    });

    test('a locale Action does not ship at all lands on Latin', () {
      expect(OcrScript.defaultFor(const Locale('sw')), OcrScript.latin);
    });
  });

  group('the five uncovered scripts are known, not discovered', () {
    test('coversScriptOf is false for exactly Bengali, Urdu, Arabic, Thai '
        'and Russian', () {
      final uncovered = [
        for (final language in AppLocales.all)
          if (!OcrScript.coversScriptOf(language.locale)) language.tag,
      ];
      expect(uncovered, ['ar', 'bn', 'ru', 'th', 'ur']);
    });

    test('every other shipped language is covered', () {
      final covered = [
        for (final language in AppLocales.all)
          if (OcrScript.coversScriptOf(language.locale)) language.tag,
      ];
      expect(covered, hasLength(AppLocales.all.length - 5));
      expect(covered, contains('hi'));
      expect(covered, contains('zh_Hans'));
    });
  });

  group('the stored engine name', () {
    test('Latin is byte-for-byte what it was before scripts were selectable',
        () {
      // Every capture read before this feature existed carries this exact
      // string. If it changed, those rows would become unattributable — the
      // engine field exists so that two readings of the same image can be
      // told apart, and a value nothing recognises tells nobody anything.
      expect(
        MlKitOcrService.engineNameFor(OcrScript.latin),
        'mlkit_text_v2_latin',
      );
    });

    test('every script produces a distinct name', () {
      final names = {
        for (final script in OcrScript.values)
          MlKitOcrService.engineNameFor(script),
      };
      expect(names, hasLength(OcrScript.values.length));
    });

    test('Devanagari is spelled correctly despite the plugin', () {
      // The ML Kit plugin's enum is `devanagiri`. Adopting that typo into the
      // stored data would outlive the plugin.
      expect(
        MlKitOcrService.engineNameFor(OcrScript.devanagari),
        'mlkit_text_v2_devanagari',
      );
    });
  });

  group('the preference', () {
    test('is absent until the user chooses, and then resolves from language',
        () {
      final container = containerFor(languageTag: 'ja');
      expect(container.read(ocrScriptControllerProvider), isNull);
      expect(container.read(ocrScriptProvider), OcrScript.japanese);
    });

    test('an explicit choice wins over the language', () {
      final container = containerFor(languageTag: 'ja', scriptTag: 'korean');
      expect(container.read(ocrScriptControllerProvider), OcrScript.korean);
      expect(container.read(ocrScriptProvider), OcrScript.korean);
    });

    test('a choice is written and survives a restart', () async {
      final prefs = InMemoryPreferenceStore({
        PreferenceKeys.onboardingCompleted: true,
      });
      final first = ProviderContainer(
        overrides: [preferenceStoreProvider.overrideWithValue(prefs)],
      );
      await first
          .read(ocrScriptControllerProvider.notifier)
          .set(OcrScript.chinese);
      expect(prefs.getString(PreferenceKeys.ocrScript), 'chinese');
      first.dispose();

      // Same store, new container: what a relaunch looks like.
      final second = ProviderContainer(
        overrides: [preferenceStoreProvider.overrideWithValue(prefs)],
      );
      addTearDown(second.dispose);
      expect(second.read(ocrScriptControllerProvider), OcrScript.chinese);
    });

    test('setting null goes back to following the language', () async {
      final prefs = InMemoryPreferenceStore({
        PreferenceKeys.onboardingCompleted: true,
        PreferenceKeys.languageTag: 'hi',
        PreferenceKeys.ocrScript: 'korean',
      });
      final container = ProviderContainer(
        overrides: [preferenceStoreProvider.overrideWithValue(prefs)],
      );
      addTearDown(container.dispose);

      expect(container.read(ocrScriptProvider), OcrScript.korean);
      await container.read(ocrScriptControllerProvider.notifier).set(null);

      expect(prefs.getString(PreferenceKeys.ocrScript), isNull);
      expect(container.read(ocrScriptProvider), OcrScript.devanagari);
    });

    test('an unrecognised stored tag reads as "follow the language"', () {
      // A script removed between versions, or a hand-edited preference file.
      // Falling back beats throwing on a value the enum no longer has.
      final container = containerFor(languageTag: 'ko', scriptTag: 'klingon');
      expect(container.read(ocrScriptControllerProvider), isNull);
      expect(container.read(ocrScriptProvider), OcrScript.korean);
    });

    test('following the language moves when the language moves', () async {
      final container = containerFor(languageTag: 'en');
      expect(container.read(ocrScriptProvider), OcrScript.latin);

      await container
          .read(localeControllerProvider.notifier)
          .set(const Locale('hi'));

      expect(container.read(ocrScriptProvider), OcrScript.devanagari);
    });

    test('an explicit choice does not move when the language moves', () async {
      final container = containerFor(languageTag: 'en', scriptTag: 'japanese');

      await container
          .read(localeControllerProvider.notifier)
          .set(const Locale('hi'));

      expect(container.read(ocrScriptProvider), OcrScript.japanese);
    });
  });

  test('a data wipe does not clear the chosen script', () {
    // It records a capability the user configured, not a fact about them.
    // Clearing it would leave someone who reads Hindi photographing Hindi
    // letters that silently come back empty.
    expect(PreferenceKeys.clearedOnDelete, isNot(contains('ocr_script_v1')));
    expect(PreferenceKeys.clearedOnDelete,
        isNot(contains(PreferenceKeys.ocrScript)));
  });

  test('every script round-trips through its stored tag', () {
    for (final script in OcrScript.values) {
      expect(OcrScript.byTag(script.tag), script);
    }
    expect(OcrScript.byTag(null), isNull);
    expect(OcrScript.byTag(''), isNull);
  });
}
