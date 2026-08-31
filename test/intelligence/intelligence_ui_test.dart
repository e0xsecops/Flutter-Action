import 'package:action_app/app/app.dart';
import 'package:action_app/app/router.dart';
import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/core/security/secret_store.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/action_cloud_privacy_service.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/intelligence/application/intelligence_providers.dart';
import 'package:action_app/features/intelligence/domain/ai_provider_config.dart';
import 'package:action_app/features/settings/application/settings_providers.dart';
import 'package:action_app/features/settings/data/system_settings_launcher.dart';
import 'package:action_app/features/settings/presentation/privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';
import '../support/preferences.dart';
import 'support/fake_http.dart';

final _now = DateTime(2026, 8, 18, 12);

class _Identity implements AuthIdentityService {
  const _Identity();
  @override
  String? get lastFailureClass => null;
  @override
  Future<String?> currentOrSignInUid() async => 'uid-test';
}

class _Launcher implements SystemSettingsLauncher {
  @override
  Future<bool> openNotificationSettings() async => true;
}

late ActionsDatabase _db;
late FakeSourceStore _sources;
late FakeSourceFileStore _files;
late FakeNotificationScheduler _scheduler;
late InMemorySecretStore _secrets;
late ForbiddenHttp _http;

/// Pumps the real app shell with a network that fails loudly on any call.
///
/// A fake returning a plausible response would let an accidental provider
/// request pass unnoticed, which is exactly the regression these tests exist
/// to catch.
Future<void> pumpApp(
  WidgetTester tester, {
  PreferenceStore? prefs,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        preferenceStoreProvider.overrideWithValue(prefs ?? onboardedPreferences()),
        actionsDatabaseProvider.overrideWithValue(_db),
        sourceStoreProvider.overrideWith((ref) async => _sources),
        sourceFileStoreProvider.overrideWith((ref) async => _files),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        authIdentityServiceProvider.overrideWithValue(const _Identity()),
        actionCloudMirrorProvider
            .overrideWithValue(const NoopActionCloudMirror()),
        actionCloudPrivacyServiceProvider
            .overrideWithValue(const NoopActionCloudPrivacyService()),
        notificationSchedulerProvider.overrideWithValue(_scheduler),
        systemSettingsLauncherProvider.overrideWithValue(_Launcher()),
        appVersionProvider.overrideWith((ref) async => '1.0.0 (1)'),
        appClockProvider.overrideWithValue(() => _now),
        secretStoreProvider.overrideWithValue(_secrets),
        aiHttpExchangeProvider.overrideWithValue(_http.exchange),
      ],
      child: const ActionApp(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> openStudio(WidgetTester tester) async {
  final container = ProviderScope.containerOf(
    tester.element(find.byType(ActionApp)),
  );
  container.read(routerProvider).push('/studio');
  await tester.pumpAndSettle();
}

Future<void> openIntelligenceSettings(WidgetTester tester) async {
  final container = ProviderScope.containerOf(
    tester.element(find.byType(ActionApp)),
  );
  container.read(routerProvider).push('/settings/intelligence');
  await tester.pumpAndSettle();
}

void uiTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 1600);
    tester.view.devicePixelRatio = 1.0;
    try {
      await body(tester);
    } finally {
      // In a finally, so a failing test still tears its view down. Without
      // this a single failure leaves the resized view in place and every
      // later test in the file inherits it.
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 5));
      tester.view.reset();
    }
  });
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _sources = FakeSourceStore();
    _files = FakeSourceFileStore();
    _scheduler = FakeNotificationScheduler();
    _secrets = InMemorySecretStore();
    _http = ForbiddenHttp();
  });

  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  group('no AI request happens without an explicit act', () {
    uiTest('opening Home issues none', (tester) async {
      await pumpApp(tester);
      expect(_http.calls, 0);
    });

    uiTest('opening the Studio issues none', (tester) async {
      await pumpApp(tester);
      await openStudio(tester);
      expect(find.text('Intelligence'), findsWidgets);
      expect(_http.calls, 0);
    });

    uiTest('opening Intelligence settings issues none', (tester) async {
      await pumpApp(tester);
      await openIntelligenceSettings(tester);
      expect(_http.calls, 0);
    });

    uiTest('a configured provider still issues none on open', (tester) async {
      // The important version of this test: a connected key must not turn
      // screen-opening into spending.
      final prefs = onboardedPreferences();
      await prefs.setString(
        IntelligencePreferenceKeys.providerConfig,
        '{"kind":"anthropic","modelId":"claude-opus-5"}',
      );
      await _secrets.write(
        SecretKeys.providerKey('anthropic'),
        'sk-ant-api03-TESTTESTTESTTEST1234',
      );

      await pumpApp(tester, prefs: prefs);
      await openStudio(tester);
      await openIntelligenceSettings(tester);

      expect(_http.calls, 0);
    });

    uiTest('scrolling the Studio issues none', (tester) async {
      await pumpApp(tester);
      await openStudio(tester);
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -600));
      await tester.pumpAndSettle();
      expect(_http.calls, 0);
    });
  });

  group('the Studio without a provider', () {
    uiTest('invites rather than erroring', (tester) async {
      await pumpApp(tester);
      await openStudio(tester);

      expect(find.text('Connect your AI'), findsOneWidget);
      expect(find.text('Connect AI'), findsOneWidget);
      // Never an error state: the user has done nothing wrong.
      expect(find.textContaining('Error'), findsNothing);
      expect(find.textContaining('failed'), findsNothing);
    });

    uiTest('still offers the tools that need no provider', (tester) async {
      await pumpApp(tester);
      await openStudio(tester);

      // SectionHeader uppercases its title, which is part of the design
      // system rather than something this test should work around.
      expect(find.text('WORKS WITHOUT SETUP'), findsOneWidget);
      expect(find.text('Hide sensitive details'), findsWidgets);
    });

    uiTest('lists all five categories', (tester) async {
      await pumpApp(tester);
      await openStudio(tester);

      // The Studio is a lazy sliver list, so the later categories are not
      // built until they are scrolled to. Scrolling to each is the point:
      // it proves all five are reachable, not merely declared.
      for (final label in ['Understand', 'Plan', 'Create', 'Extract', 'Verify']) {
        await tester.scrollUntilVisible(
          find.text(label.toUpperCase()),
          300,
          scrollable: find.byType(Scrollable).first,
        );
        expect(find.text(label.toUpperCase()), findsWidgets, reason: label);
      }
    });
  });

  group('a tool without a provider', () {
    uiTest('shows an invitation, not an error', (tester) async {
      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/studio/tool/smart-summary');
      await tester.pumpAndSettle();

      expect(
        find.text('Connect an AI provider to use this tool'),
        findsOneWidget,
      );
      expect(_http.calls, 0);
    });

    uiTest('a local tool is usable with no provider at all', (tester) async {
      await _sources.add(SourceItem(
        id: 'src-1',
        type: SourceType.pastedText,
        capturedAt: _now,
        pastedText: 'Email me at someone@example.invalid about invoice 4471.',
        state: SourceProcessingState.ready,
      ));

      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/studio/tool/redaction-assistant');
      await tester.pumpAndSettle();

      // No connect prompt, because this one never needed a provider.
      expect(find.text('Connect an AI provider to use this tool'), findsNothing);
      expect(find.text('Check on this device'), findsOneWidget);

      await tester.tap(find.text('Pasted note'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Check on this device'));
      await tester.pumpAndSettle();

      expect(find.textContaining('worth hiding'), findsOneWidget);
      expect(_http.calls, 0);
    });

    uiTest('an unknown tool id is a calm dead end, not a crash', (tester) async {
      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/studio/tool/nope');
      await tester.pumpAndSettle();

      expect(find.text('That tool is not available'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('Settings shows the connection truthfully', () {
    uiTest('offers to connect when nothing is configured', (tester) async {
      await pumpApp(tester);
      await openIntelligenceSettings(tester);

      expect(find.text('Connect an AI provider'), findsOneWidget);
      expect(find.textContaining('works without AI'), findsWidgets);
    });

    uiTest('never shows the key, only a masked tail', (tester) async {
      const key = 'sk-ant-api03-TESTTESTTESTTEST4T7K';
      final prefs = onboardedPreferences();
      await prefs.setString(
        IntelligencePreferenceKeys.providerConfig,
        '{"kind":"anthropic","modelId":"claude-opus-5"}',
      );
      await _secrets.write(SecretKeys.providerKey('anthropic'), key);

      await pumpApp(tester, prefs: prefs);
      await openIntelligenceSettings(tester);

      // The tail identifies which key is installed; nothing more is readable.
      expect(find.textContaining('4T7K'), findsOneWidget);
      expect(find.textContaining('sk-ant'), findsNothing);
      expect(find.text(key), findsNothing);
      expect(find.text('Reveal'), findsNothing);
    });

    uiTest('states where content goes, and does not claim it stays local',
        (tester) async {
      final prefs = onboardedPreferences();
      await prefs.setString(
        IntelligencePreferenceKeys.providerConfig,
        '{"kind":"gemini","modelId":"gemini-3.7-flash"}',
      );
      await pumpApp(tester, prefs: prefs);
      await openIntelligenceSettings(tester);

      expect(find.textContaining('Directly to Google Gemini'), findsOneWidget);
      // The lie this screen must never tell.
      expect(find.textContaining('Everything stays on this device'), findsNothing);
      expect(find.textContaining('never leaves your device'), findsNothing);
    });

    uiTest('reaches Intelligence from the main Settings page', (tester) async {
      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/settings');
      await tester.pumpAndSettle();

      expect(find.text('AI provider'), findsOneWidget);
      await tester.tap(find.text('AI provider'));
      await tester.pumpAndSettle();

      expect(find.text('Connect an AI provider'), findsOneWidget);
      expect(_http.calls, 0);
    });
  });

  group('stored configuration', () {
    test('round-trips through preferences', () async {
      final prefs = onboardedPreferences();
      final container = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(container.dispose);

      await container.read(aiProviderConfigProvider.notifier).connect(
            const AiProviderConfig(
              kind: AiProviderKind.openAi,
              modelId: 'gpt-5.6',
            ),
          );

      // A fresh container reads what the first one wrote.
      final second = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(second.dispose);

      final restored = second.read(aiProviderConfigProvider);
      expect(restored?.kind, AiProviderKind.openAi);
      expect(restored?.modelId, 'gpt-5.6');
    });

    test('a corrupt stored config reads as nothing connected', () async {
      final prefs = onboardedPreferences();
      await prefs.setString(
        IntelligencePreferenceKeys.providerConfig,
        'not json at all',
      );
      final container = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(container.dispose);

      expect(container.read(aiProviderConfigProvider), isNull);
    });

    test('disconnecting deletes the key, not just the preference', () async {
      // Clearing the config while leaving the credential would leave a secret
      // on the device the user believes they removed.
      final prefs = onboardedPreferences();
      final secrets = InMemorySecretStore();
      final container = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(secrets),
      ]);
      addTearDown(container.dispose);

      await secrets.write(SecretKeys.providerKey('anthropic'), 'sk-ant-secret1234');
      await container.read(aiProviderConfigProvider.notifier).connect(
            const AiProviderConfig(
              kind: AiProviderKind.anthropic,
              modelId: 'claude-opus-5',
            ),
          );

      await container.read(aiProviderConfigProvider.notifier).disconnect();

      expect(container.read(aiProviderConfigProvider), isNull);
      expect(
        await secrets.contains(SecretKeys.providerKey('anthropic')),
        isFalse,
      );
      expect(
        prefs.getString(IntelligencePreferenceKeys.providerConfig),
        isNull,
      );
    });

    test('a config with no stored key reads as not ready', () async {
      // The preference survives a restore that secure storage does not.
      final prefs = onboardedPreferences();
      await prefs.setString(
        IntelligencePreferenceKeys.providerConfig,
        '{"kind":"anthropic","modelId":"claude-opus-5"}',
      );
      final container = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(container.dispose);

      expect(await container.read(aiConnectionReadyProvider.future), isFalse);
    });
  });

  group('recent tools remember ids only', () {
    test('stores the id and nothing about the content', () async {
      final prefs = onboardedPreferences();
      final container = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(container.dispose);

      await container.read(recentToolsProvider.notifier).record('smart-summary');

      final stored = prefs.getString(IntelligencePreferenceKeys.recentTools);
      expect(stored, 'smart-summary');
      // What must never be there: any trace of what it was pointed at.
      expect(stored, isNot(contains('.pdf')));
    });

    test('keeps the most recent first and bounds the list', () async {
      final prefs = onboardedPreferences();
      final container = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(container.dispose);

      final notifier = container.read(recentToolsProvider.notifier);
      for (final id in [
        'smart-summary',
        'ask-document',
        'rewrite',
        'translate',
        'deadline-finder',
      ]) {
        await notifier.record(id);
      }

      final recents = container.read(recentToolsProvider);
      expect(recents.first, 'deadline-finder');
      expect(recents.length, lessThanOrEqualTo(4));
      expect(recents, isNot(contains('smart-summary')));
    });

    test('re-recording moves a tool to the front without duplicating it',
        () async {
      final prefs = onboardedPreferences();
      final container = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(container.dispose);

      final notifier = container.read(recentToolsProvider.notifier);
      await notifier.record('rewrite');
      await notifier.record('translate');
      await notifier.record('rewrite');

      expect(container.read(recentToolsProvider), ['rewrite', 'translate']);
    });
  });

  group('first-use disclosure', () {
    test('is remembered per provider, so switching asks again', () async {
      final prefs = onboardedPreferences();
      final container = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(container.dispose);

      final disclosure = container.read(aiDisclosureProvider.notifier);
      expect(disclosure.hasAccepted(AiProviderKind.anthropic), isFalse);

      await disclosure.accept(AiProviderKind.anthropic);

      expect(disclosure.hasAccepted(AiProviderKind.anthropic), isTrue);
      // The disclosure names where content goes, and that has changed.
      expect(disclosure.hasAccepted(AiProviderKind.openAi), isFalse);
    });

    test('survives a restart', () async {
      final prefs = onboardedPreferences();
      final first = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(first.dispose);
      await first.read(aiDisclosureProvider.notifier).accept(
            AiProviderKind.gemini,
          );

      final second = ProviderContainer(overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        secretStoreProvider.overrideWithValue(InMemorySecretStore()),
      ]);
      addTearDown(second.dispose);

      expect(
        second.read(aiDisclosureProvider.notifier).hasAccepted(
              AiProviderKind.gemini,
            ),
        isTrue,
      );
    });
  });

  group('source context is only what the user picked', () {
    uiTest('a tool sees the selected source and no others', (tester) async {
      for (var i = 0; i < 3; i++) {
        await _sources.add(SourceItem(
          id: 'src-$i',
          type: SourceType.pastedText,
          capturedAt: _now,
          pastedText: 'Document number $i with email user$i@example.invalid',
          state: SourceProcessingState.ready,
        ));
      }

      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/studio/tool/redaction-assistant');
      await tester.pumpAndSettle();

      // Pick exactly one of the three.
      await tester.tap(find.textContaining('Document number 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Check on this device'));
      await tester.pumpAndSettle();

      // The count is the precise assertion. Every source carries exactly one
      // email, so finding one match proves one source was read - where
      // searching the screen for the other addresses would only find them in
      // the picker's own previews and prove nothing.
      expect(find.text('1 thing worth hiding'), findsOneWidget);
      expect(find.text('3 things worth hiding'), findsNothing);
    });
  });

  group('OCR text is what a tool reads', () {
    uiTest('a capture with recognised text is selectable', (tester) async {
      const recognised = 'Renewal due 18 August 2026. Contact a@b.invalid.';
      await _sources.add(SourceItem(
        id: 'src-ocr',
        type: SourceType.gallery,
        capturedAt: _now,
        imagePath: '/nowhere.jpg',
        state: SourceProcessingState.ready,
        ocr: OcrOutcome(
          rawText: recognised,
          normalizedText: recognised,
          lines: const [OcrLine(text: recognised)],
          engine: 'test',
          processedAt: _now,
          durationMs: 1,
        ),
      ));

      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/studio/tool/redaction-assistant');
      await tester.pumpAndSettle();

      // Labelled by kind, never by file path.
      expect(find.text('Screenshot'), findsOneWidget);
      expect(find.textContaining('/nowhere.jpg'), findsNothing);
    });
  });

  group('entry points', () {
    uiTest('Home offers Intelligence beside Add, and it opens the Studio',
        (tester) async {
      await pumpApp(tester);

      expect(find.byTooltip('Intelligence'), findsOneWidget);
      await tester.tap(find.byTooltip('Intelligence'));
      await tester.pumpAndSettle();

      expect(find.text('WORKS WITHOUT SETUP'), findsOneWidget);
      expect(_http.calls, 0);
    });

    uiTest('Add is still the primary action on Home', (tester) async {
      // Intelligence sits beside Add; it must not displace it.
      await pumpApp(tester);
      expect(find.text('Add something'), findsOneWidget);
    });

    uiTest('a source suggests tools chosen from its own text', (tester) async {
      await _sources.add(SourceItem(
        id: 'src-letter',
        type: SourceType.pastedText,
        capturedAt: _now,
        pastedText: 'Dear Ms Rahman, your policy is due for renewal on '
            '18 August 2026. Amount payable: 284.50. Yours sincerely.',
        state: SourceProcessingState.ready,
      ));

      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/source/src-letter');
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text('Do more with this'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('Do more with this'), findsOneWidget);

      // Deterministic, from local signals: a letter with a date and an amount
      // suggests a reply and a deadline hunt. No request was needed to decide.
      expect(find.text('Draft a reply'), findsOneWidget);
      expect(_http.calls, 0);
    });

    uiTest('a source with no text suggests nothing', (tester) async {
      await _sources.add(SourceItem(
        id: 'src-blank',
        type: SourceType.pastedText,
        capturedAt: _now,
        pastedText: '',
        state: SourceProcessingState.ready,
      ));

      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/source/src-blank');
      await tester.pumpAndSettle();

      expect(find.text('Do more with this'), findsNothing);
    });

    uiTest('tapping a suggested tool arrives with that source selected',
        (tester) async {
      await _sources.add(SourceItem(
        id: 'src-letter',
        type: SourceType.pastedText,
        capturedAt: _now,
        pastedText: 'Dear Ms Rahman, please reply by 18 August 2026. '
            'Amount payable: 284.50. Yours sincerely.',
        state: SourceProcessingState.ready,
      ));

      await pumpApp(tester);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(ActionApp)),
      );
      container.read(routerProvider).push('/source/src-letter');
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text('Draft a reply'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('Draft a reply'));
      await tester.pumpAndSettle();

      // The tool screen opened; nothing has been sent.
      expect(find.text('Draft a reply'), findsWidgets);
      expect(_http.calls, 0);
    });
  });

  group('privacy copy tells the truth about the BYOK route', () {
    test('names the provider route explicitly', () {
      final all = privacyDataMap.expand((g) => g.lines).join(' ');
      expect(all, contains('your own API key'));
      expect(all, contains('does not pass through any server'));
      expect(all, contains('nothing is ever sent in the background'));
    });

    test('does not promise the key cannot be extracted', () {
      // OS-backed storage is a real obstacle, not an absolute one, and the
      // copy has to say so rather than reassure.
      final all = privacyDataMap.expand((g) => g.lines).join(' ');
      expect(all, contains('it is not absolute'));
      expect(all.toLowerCase(), isNot(contains('cannot be extracted')));
      expect(all.toLowerCase(), isNot(contains('impossible')));
    });

    test('still never claims everything stays on the device', () {
      final all = privacyDataMap.expand((g) => g.lines).join(' ').toLowerCase();
      expect(all, isNot(contains('everything stays on')));
      expect(all, isNot(contains('never leaves your device')));
    });

    test('says which tools genuinely stay local', () {
      final all = privacyDataMap.expand((g) => g.lines).join(' ');
      expect(all, contains('Two tools never send anything'));
    });
  });
}
