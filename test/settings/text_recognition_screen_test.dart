/// The Text recognition screen, driven through the real app shell.
///
/// **What is actually being tested.** Not that five rows render — that a user
/// whose language Action cannot read is *told so*, on the screen where the
/// question arises, with the way through named. That was the whole point of
/// building the setting: before it, a Bengali reader photographed a Bengali
/// letter and received an empty result and no explanation.
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
import 'package:action_app/l10n/gen/app_l10n_bn.dart';
import 'package:action_app/l10n/gen/app_l10n_en.dart';
import 'package:action_app/l10n/gen/app_l10n_hi.dart';
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
late InMemoryPreferenceStore _prefs;

Future<void> pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        preferenceStoreProvider.overrideWithValue(_prefs),
        actionsDatabaseProvider.overrideWithValue(_db),
        sourceStoreProvider.overrideWith((ref) async => FakeSourceStore()),
        sourceFileStoreProvider
            .overrideWith((ref) async => FakeSourceFileStore()),
        // The real provider builds an ML Kit recogniser, which needs a
        // platform. Overriding it is also why this file can assert what the
        // *setting* does without asserting anything about recognition.
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

/// Today → Settings → Text recognition, in whatever language the app speaks.
Future<void> openTextRecognition(WidgetTester tester, AppL10n l10n) async {
  await tester.tap(find.byTooltip(l10n.commonSettings));
  await tester.pumpAndSettle();
  await tester.tap(find.text(l10n.settingsTextRecognition).first);
  await tester.pumpAndSettle();
}

void screenTest(String description, Future<void> Function(WidgetTester) body) {
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
    _prefs = InMemoryPreferenceStore({
      PreferenceKeys.onboardingCompleted: true,
    });
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  final en = AppL10nEn();

  group('the chooser', () {
    screenTest('is reachable from Settings and lists every script',
        (tester) async {
      await pumpApp(tester);
      await openTextRecognition(tester, en);

      expect(find.text(en.ocrScriptFollowLanguage), findsOneWidget);
      for (final label in [
        en.ocrScriptLatin,
        en.ocrScriptChinese,
        en.ocrScriptDevanagari,
        en.ocrScriptJapanese,
        en.ocrScriptKorean,
      ]) {
        expect(find.text(label), findsWidgets, reason: '$label is missing');
      }
    });

    screenTest('names the script "follow the language" currently resolves to',
        (tester) async {
      // "Follow the app language" is only a usable option if the user can see
      // where it lands. On English that is Latin.
      await pumpApp(tester);
      await openTextRecognition(tester, en);

      expect(
        find.text(en.ocrScriptFollowLanguageValue(en.ocrScriptLatin)),
        findsOneWidget,
      );
    });

    screenTest('choosing one stores it', (tester) async {
      await pumpApp(tester);
      await openTextRecognition(tester, en);

      await tester.tap(find.text(en.ocrScriptKorean).first);
      await tester.pumpAndSettle();

      expect(_prefs.getString(PreferenceKeys.ocrScript), 'korean');
    });

    screenTest('choosing one is reflected back on the Settings row',
        (tester) async {
      await pumpApp(tester);
      await openTextRecognition(tester, en);
      await tester.tap(find.text(en.ocrScriptChinese).first);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(BackButton).first);
      await tester.pumpAndSettle();

      // The row shows the value, so the setting is legible without opening it.
      expect(find.text(en.ocrScriptChinese), findsOneWidget);
    });

    screenTest('going back to "follow the language" clears the preference',
        (tester) async {
      await pumpApp(tester);
      await openTextRecognition(tester, en);

      await tester.tap(find.text(en.ocrScriptJapanese).first);
      await tester.pumpAndSettle();
      expect(_prefs.getString(PreferenceKeys.ocrScript), 'japanese');

      await tester.tap(find.text(en.ocrScriptFollowLanguage));
      await tester.pumpAndSettle();
      expect(_prefs.getString(PreferenceKeys.ocrScript), isNull);
    });
  });

  group('a language with no recogniser', () {
    screenTest('is told so by name, and told what still works',
        (tester) async {
      _prefs = InMemoryPreferenceStore({
        PreferenceKeys.onboardingCompleted: true,
        PreferenceKeys.languageTag: 'bn',
      });
      final bn = AppL10nBn();

      await pumpApp(tester);
      await openTextRecognition(tester, bn);

      // Named, not hinted at: the notice says which language, and the body
      // keeps both remaining facts — Latin is still read, and typing works.
      expect(
        find.text(bn.ocrScriptUnreadableTitle('বাংলা')),
        findsOneWidget,
      );
      expect(find.text(bn.ocrScriptUnreadableBody), findsOneWidget);
    });

    screenTest('does not appear for a language that is covered',
        (tester) async {
      _prefs = InMemoryPreferenceStore({
        PreferenceKeys.onboardingCompleted: true,
        PreferenceKeys.languageTag: 'hi',
      });

      final hi = AppL10nHi();
      await pumpApp(tester);
      await openTextRecognition(tester, hi);

      // Hindi has a Devanagari recogniser, so nothing is being withheld and
      // there is nothing to warn about. Asserted on the notice itself rather
      // than on any Hindi words — the Latin row's description legitimately
      // mentions Roman letters, and matching on that caught the wrong thing.
      expect(find.text(hi.ocrScriptUnreadableTitle('हिन्दी')), findsNothing);
      expect(find.text(hi.ocrScriptUnreadableBody), findsNothing);
      // The chooser itself is there; only the warning is absent.
      expect(find.text(hi.ocrScriptDevanagari), findsWidgets);
    });
  });

  group('what it will not claim', () {
    screenTest('the screen never says a capture is sent somewhere to be read',
        (tester) async {
      await pumpApp(tester);
      await openTextRecognition(tester, en);

      // The subtitle is the on-device claim. It is the one sentence on this
      // screen a user might rely on for a privacy decision.
      expect(find.text(en.ocrScriptSubtitle), findsOneWidget);
      expect(en.ocrScriptSubtitle.toLowerCase(), contains('on this device'));
    });

    screenTest('the footnote keeps both of its claims', (tester) async {
      await pumpApp(tester);
      await openTextRecognition(tester, en);

      expect(find.text(en.ocrScriptFootnote), findsOneWidget);
      // Additive, and not retroactive. Losing either leaves the user with a
      // wrong model of what the setting just did.
      expect(en.ocrScriptFootnote, contains('instead of swapping'));
      expect(en.ocrScriptFootnote, contains('not ones already read'));
    });
  });
}
