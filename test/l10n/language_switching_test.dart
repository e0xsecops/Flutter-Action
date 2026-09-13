/// Language switching, end to end through the real app.
///
/// **Why it drives the app rather than the screen.** The claim being tested is
/// not "the picker renders twenty rows" — it is that choosing a language
/// changes what the *rest of the app* says, immediately, and that the choice
/// survives being closed. Both of those are properties of `MaterialApp` and
/// the preference store, and neither is visible from inside the picker.
library;

import 'package:action_app/app/app.dart';
import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/l10n/gen/app_l10n.dart';
import 'package:action_app/l10n/gen/app_l10n_ar.dart';
import 'package:action_app/l10n/gen/app_l10n_bn.dart';
import 'package:action_app/l10n/gen/app_l10n_de.dart';
import 'package:action_app/l10n/gen/app_l10n_en.dart';
import 'package:action_app/l10n/supported_locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';

class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async => null;
}

late ActionsDatabase _db;
late FakeNotificationScheduler _scheduler;

Future<void> pumpApp(WidgetTester tester, PreferenceStore prefs) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        actionsDatabaseProvider.overrideWithValue(_db),
        sourceStoreProvider.overrideWith((ref) async => FakeSourceStore()),
        sourceFileStoreProvider
            .overrideWith((ref) async => FakeSourceFileStore()),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider
            .overrideWithValue(const NoopActionCloudMirror()),
        notificationSchedulerProvider.overrideWithValue(_scheduler),
      ],
      child: const ActionApp(),
    ),
  );
  await tester.pumpAndSettle();
}

PreferenceStore onboarded([Map<String, Object>? extra]) => InMemoryPreferenceStore({
      PreferenceKeys.onboardingCompleted: true,
      ...?extra,
    });

/// Walks Today -> Settings -> Language, in whatever language the app is
/// currently speaking. [l10n] defaults to English because that is what a
/// fresh install shows; a test that starts from a stored preference has to
/// pass the bundle it will actually be reading.
Future<void> openLanguage(WidgetTester tester, [AppL10n? l10n]) async {
  final strings = l10n ?? AppL10nEn();
  await tester.tap(find.byTooltip(strings.commonSettings));
  await tester.pumpAndSettle();
  await tester.tap(find.text(strings.languageTitle));
  await tester.pumpAndSettle();
}

/// The app bar's back control, which cannot be found by its tooltip once the
/// app is speaking a language whose word for "back" the test does not know.
Future<void> goBack(WidgetTester tester) async {
  await tester.tap(find.byType(BackButton).first);
  await tester.pumpAndSettle();
}

void languageTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 2400);
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
  setUp(() {
    _db = memoryDatabase();
    _scheduler = FakeNotificationScheduler();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  group('the picker', () {
    languageTest('offers System and all twenty languages', (tester) async {
      await pumpApp(tester, onboarded());
      await openLanguage(tester);

      expect(find.text(AppL10nEn().languageSystem), findsWidgets);
      for (final language in AppLocales.all) {
        expect(
          find.text(language.nativeName),
          findsOneWidget,
          reason: '${language.englishName} is missing from the picker',
        );
      }
    });

    languageTest('names each language in itself, never in English',
        (tester) async {
      await pumpApp(tester, onboarded());
      await openLanguage(tester);

      // The English name of a language is exactly what someone who cannot
      // read English cannot use to find their own.
      for (final language in AppLocales.all) {
        if (language.nativeName == language.englishName) continue;
        expect(
          find.text(language.englishName),
          findsNothing,
          reason: '${language.englishName} is named in English',
        );
      }
    });

    languageTest('says plainly that the translations are not reviewed',
        (tester) async {
      await pumpApp(tester, onboarded());
      await openLanguage(tester);

      final note = AppL10nEn().languageDraftNote;
      expect(find.text(note), findsOneWidget);
      // The disclosure is the point. It may be reworded, but it may not turn
      // into a claim of certification.
      for (final banned in ['certified', 'professionally', 'guaranteed']) {
        expect(note.toLowerCase(), isNot(contains(banned)));
      }
    });
  });

  group('choosing one', () {
    languageTest('changes the app immediately, without a restart',
        (tester) async {
      await pumpApp(tester, onboarded());
      await openLanguage(tester);

      await tester.tap(find.text('বাংলা'));
      await tester.pumpAndSettle();

      // The screen the user is standing on is already in Bengali.
      expect(find.text(AppL10nBn().languageTitle), findsWidgets);
      expect(find.text(AppL10nEn().languageDraftNote), findsNothing);

      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.locale, const Locale('bn'));
    });

    languageTest('reaches the rest of the app, not only this screen',
        (tester) async {
      await pumpApp(tester, onboarded());
      await openLanguage(tester);
      await tester.tap(find.text('বাংলা'));
      await tester.pumpAndSettle();

      // Back out to Today: the navigation bar and the brief are Bengali too.
      await goBack(tester);
      await goBack(tester);

      expect(find.text(AppL10nBn().navToday), findsWidgets);
      expect(find.text(AppL10nEn().briefHeadlineFirstRun), findsNothing);
      expect(find.text(AppL10nBn().briefHeadlineFirstRun), findsOneWidget);
    });

    languageTest('an RTL language turns the layout around', (tester) async {
      await pumpApp(tester, onboarded());
      await openLanguage(tester);

      await tester.tap(find.text('العربية'));
      await tester.pumpAndSettle();

      final direction = Directionality.of(
        tester.element(find.text(AppL10nAr().languageTitle).first),
      );
      expect(direction, TextDirection.rtl);
    });

    languageTest('is remembered across a restart', (tester) async {
      final prefs = onboarded();
      await pumpApp(tester, prefs);
      await openLanguage(tester);
      await tester.tap(find.text('Deutsch'));
      await tester.pumpAndSettle();

      expect(prefs.getString(PreferenceKeys.languageTag), 'de');

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(Duration.zero);

      // Same store, new app lifetime — and the first frame is already German
      // rather than English corrected a frame later.
      await pumpApp(tester, prefs);
      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.locale, const Locale('de'));
    });

    languageTest('can be handed back to the system', (tester) async {
      final prefs = onboarded({PreferenceKeys.languageTag: 'de'});
      await pumpApp(tester, prefs);
      // The app is already in German, so the route there is in German.
      await openLanguage(tester, AppL10nDe());

      await tester.tap(find.text(AppL10nDe().languageSystem).first);
      await tester.pumpAndSettle();

      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.locale, isNull);
      expect(prefs.getString(PreferenceKeys.languageTag), isNull);
    });

    languageTest('an unrecognised stored tag reads as System', (tester) async {
      // A language removed between versions, or a hand-edited preference
      // file. Falling back beats throwing on a locale with no strings.
      final prefs = onboarded({PreferenceKeys.languageTag: 'kx_Zzzz'});
      await pumpApp(tester, prefs);

      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.locale, isNull);
    });
  });

  group('what a data wipe does not touch', () {
    test('the language choice is not cleared with the data', () {
      // Clearing it would hand someone back an app in a language they may not
      // read, as a side effect of deleting their Actions — and there is no
      // privacy gain to weigh against that.
      expect(
        PreferenceKeys.clearedOnDelete,
        isNot(contains(PreferenceKeys.languageTag)),
      );
    });
  });
}
