/// Pseudo-localization: every string expanded, accented and bracketed.
///
/// **What this catches that twenty real translations do not.** The twenty
/// locales find the layouts that break under German or Russian, but only where
/// those languages happen to be long. Here *every* string is 40% longer at
/// once, so a `Row` that fits its content by luck fails in this file rather
/// than in the one locale nobody thought to mount.
///
/// And it catches the bug no translation can. A string that renders as plain
/// English on a screen where everything else is `⟦…⟧` was never looked up — it
/// is hard-coded in the widget tree, and it would have shipped in English to
/// all twenty languages without a single test noticing.
///
/// **Why the screens are mounted directly rather than through `ActionApp`.**
/// The app's `localizationsDelegates` are a `const` list, so there is nowhere
/// to inject a delegate. That is the right shape for production — the pseudo
/// bundle must never be reachable from the shipped app — and it means this
/// file builds its own `MaterialApp` around one screen at a time.
library;

import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/design/app_theme.dart';
import 'package:action_app/features/settings/presentation/language_screen.dart';
import 'package:action_app/features/settings/presentation/text_recognition_screen.dart';
import 'package:action_app/l10n/supported_locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/pseudo_l10n.dart';

late PseudoL10n bundle;

Future<void> pumpPseudo(
  WidgetTester tester,
  Widget screen, {
  double textScale = 1.0,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        preferenceStoreProvider.overrideWithValue(
          InMemoryPreferenceStore({PreferenceKeys.onboardingCompleted: true}),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.light(),
        localizationsDelegates: PseudoL10nDelegate.delegatesFor(bundle),
        supportedLocales: const [PseudoL10nDelegate.locale],
        locale: PseudoL10nDelegate.locale,
        home: Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(textScale)),
            child: screen,
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Every `Text` currently in the tree that carries a word.
///
/// Icons, spacers and empty strings are not evidence of anything.
List<String> renderedWords(WidgetTester tester) => [
      for (final text in tester.widgetList<Text>(find.byType(Text)))
        if ((text.data ?? '').trim().isNotEmpty) text.data!,
    ].where((s) => RegExp('[A-Za-z]').hasMatch(s)).toList();

void pseudoTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(400, 1800);
    tester.view.devicePixelRatio = 1.0;
    try {
      await body(tester);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 5));
      tester.view.reset();
    }
  });
}

void main() {
  setUp(() => bundle = PseudoL10n.fromTemplate());

  group('the transform itself', () {
    test('expands, accents and brackets', () {
      final out = pseudoize('Save');
      expect(out, startsWith('⟦'));
      expect(out, endsWith('⟧'));
      expect(out, contains('Šäṽé'));
      expect(out.length, greaterThan('Save'.length));
    });

    test('reaches the expansion factor', () {
      const source = 'Confirm and create action';
      final out = pseudoize(source);
      // Brackets are two of the characters; the body must still have grown by
      // at least the factor the constant promises.
      expect(
        out.length - 2,
        greaterThanOrEqualTo((source.length * kPseudoExpansion).floor()),
      );
    });

    test('leaves digits and punctuation alone', () {
      // A deadline still has to look like a date, and a format string that is
      // only pattern letters must not stop being one.
      final out = pseudoize('2026-08-30');
      expect(out, contains('2026-08-30'));
    });

    test('passes empty and whitespace through untouched', () {
      expect(pseudoize(''), '');
      expect(pseudoize('   '), '   ');
    });

    test('takes the longer branch of a plural', () {
      // The `other` branch, unconditionally: this is a layout test and the
      // plural branch that overflows is the long one.
      final rendered = bundle.sourcePageCount(7);
      expect(rendered, contains('7'));
      expect(rendered, startsWith('⟦'));
      expect(rendered, endsWith('⟧'));
    });

    test('substitutes placeholders in the order gen_l10n passes them', () {
      final rendered = bundle.sourceDimensions(1920, 1080);
      expect(rendered, contains('1920'));
      expect(rendered, contains('1080'));
      expect(rendered.indexOf('1920'), lessThan(rendered.indexOf('1080')));
    });

    test('answers every message the template declares', () {
      // The forwarder covers the whole class or it covers none of it; a
      // missing key would return null and blank the control.
      expect(bundle.ocrScriptTitle, startsWith('⟦'));
      expect(bundle.evidenceUnverified, startsWith('⟦'));
      expect(bundle.urgencyUnsure, startsWith('⟦'));
    });
  });

  group('no string reaches the screen without passing through l10n', () {
    pseudoTest('the language picker', (tester) async {
      await pumpPseudo(tester, const LanguageScreen());

      // The native language names are the deliberate exception, and the only
      // one: they are data, not copy, and translating `Deutsch` would defeat
      // the point of the screen.
      final nativeNames = {for (final l in AppLocales.all) l.nativeName};

      for (final rendered in renderedWords(tester)) {
        if (nativeNames.contains(rendered)) continue;
        expect(
          rendered,
          contains('⟦'),
          reason: '"$rendered" rendered unbracketed on the language picker, '
              'so it never went through AppL10n. A hard-coded string ships in '
              'English to all twenty languages.',
        );
      }
    });

    pseudoTest('the text recognition chooser', (tester) async {
      await pumpPseudo(tester, const TextRecognitionScreen());

      for (final rendered in renderedWords(tester)) {
        expect(
          rendered,
          contains('⟦'),
          reason: '"$rendered" rendered unbracketed on the text recognition '
              'chooser, so it never went through AppL10n.',
        );
      }
    });
  });

  group('nothing overflows when every string grows at once', () {
    // A `RenderFlex` overflow surfaces as an exception, so asserting that
    // nothing was thrown covers the whole class rather than one widget.
    pseudoTest('the language picker', (tester) async {
      await pumpPseudo(tester, const LanguageScreen());
      expect(tester.takeException(), isNull);
    });

    pseudoTest('the text recognition chooser', (tester) async {
      await pumpPseudo(tester, const TextRecognitionScreen());
      expect(tester.takeException(), isNull);
    });

    pseudoTest('the text recognition chooser at 1.8x text', (tester) async {
      // 1.4x expansion on top of 1.8x type is past anything a real locale can
      // produce, which is the point: if it survives this it survives German.
      await pumpPseudo(tester, const TextRecognitionScreen(), textScale: 1.8);
      expect(tester.takeException(), isNull);
    });
  });

  group('the harness reports what a screen actually asked for', () {
    pseudoTest('a screen records the keys it read', (tester) async {
      await pumpPseudo(tester, const TextRecognitionScreen());

      expect(bundle.requested, contains('ocrScriptTitle'));
      expect(bundle.requested, contains('ocrScriptFootnote'));
      expect(bundle.requested, contains('ocrScriptDevanagariDescription'));
      // And it did not read the whole template just by being mounted.
      expect(bundle.requested, isNot(contains('evidenceUnverified')));
    });
  });
}
