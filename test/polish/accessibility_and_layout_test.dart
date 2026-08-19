import 'package:action_app/app/app.dart';
import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/design/tokens/dimens.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/action_cloud_privacy_service.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/app/router.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/extraction/data/extraction_transport.dart';
import 'package:action_app/features/settings/application/settings_providers.dart';
import 'package:action_app/features/settings/data/system_settings_launcher.dart';
import 'package:action_app/features/settings/presentation/help_screen.dart';
import 'package:action_app/features/settings/presentation/privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';
import '../support/preferences.dart';

/// Day-15 polish, as properties rather than pixels.
///
/// Deliberately not screenshot tests: what is worth defending is that a
/// control says what it does, that decorative motion stops when asked, that
/// paragraphs do not run the width of a tablet, and that the trust wording
/// this product depends on has not quietly drifted.

final polishNow = DateTime(2026, 8, 18, 12);

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
late DriftActionRepository _repo;
late FakeSourceStore _sources;
late FakeSourceFileStore _files;
late FakeNotificationScheduler _scheduler;

Future<void> pumpApp(
  WidgetTester tester, {
  PreferenceStore? prefs,
  double textScale = 1.0,
  bool reduceMotion = false,
  Size size = const Size(420, 1400),
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;

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
        appClockProvider.overrideWithValue(() => polishNow),
      ],
      child: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(textScale),
            disableAnimations: reduceMotion,
          ),
          child: const ActionApp(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void polishTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    await body(tester);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 5));
    tester.view.reset();
  });
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _repo = DriftActionRepository(_db);
    _sources = FakeSourceStore();
    _files = FakeSourceFileStore();
    _scheduler = FakeNotificationScheduler();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  group('controls say what they act on', () {
    polishTest('the Home completion control names its Action', (tester) async {
      await _repo.create(sampleAction('a1', title: 'Pay the water bill'));
      await _repo.create(sampleAction('a2', title: 'Renew the passport'));
      await pumpApp(tester);

      // Two identical "Mark as done" buttons would be indistinguishable to
      // anyone not looking at the screen.
      expect(find.byTooltip('Mark "Pay the water bill" as done'),
          findsOneWidget);
      expect(find.byTooltip('Mark "Renew the passport" as done'),
          findsOneWidget);
    });

    polishTest('a completed Action says so rather than offering the verb',
        (tester) async {
      await _repo.create(sampleAction('a1',
          title: 'Paid bill',
          status: ActionStatus.completed,
          completedAt: polishNow));
      await pumpApp(tester);

      expect(find.byTooltip('Completed: Paid bill'), findsOneWidget);
      expect(find.byTooltip('Mark "Paid bill" as done'), findsNothing);
    });

    polishTest('the step control names its step and its state',
        (tester) async {
      await _repo.create(sampleAction('a1', title: 'Renew the passport',
          steps: [sampleStep('s1', title: 'Upload the signed form')]));
      await pumpApp(tester);

      await tester.tap(find.text('Renew the passport'));
      await tester.pumpAndSettle();

      // A pattern, not an exact string: the row's own semantics merge with
      // the control's, so the node carries both.
      expect(
        find.bySemanticsLabel(RegExp(r'Mark "Upload the signed form" as done')),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.circle_outlined));
      await tester.pumpAndSettle();

      // The state is in the words, not only in the strikethrough.
      expect(
        find.bySemanticsLabel(
            RegExp(r'Mark "Upload the signed form" as not done')),
        findsOneWidget,
      );
    });
  });

  group('button hierarchy', () {
    polishTest('Action Detail has exactly one filled button', (tester) async {
      await _repo.create(sampleAction('a1', title: 'Renew the passport',
          steps: [sampleStep('s1', title: 'Upload the signed form')]));
      await pumpApp(tester);
      await tester.tap(find.text('Renew the passport'));
      await tester.pumpAndSettle();

      // The filled one is the recommended next step. Completing the whole
      // Action is a real action but a quieter one, so the screen only ever
      // shouts about a single thing.
      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.widgetWithText(FilledButton, 'Mark step done'),
          findsOneWidget);
      expect(find.widgetWithText(OutlinedButton, 'Mark action complete'),
          findsOneWidget);
    });

    polishTest('a completed Action shouts about nothing', (tester) async {
      await _repo.create(sampleAction('a1',
          title: 'Paid bill',
          status: ActionStatus.completed,
          completedAt: polishNow));
      await pumpApp(tester);
      await tester.tap(find.text('Paid bill'));
      await tester.pumpAndSettle();

      // The terminal action on a finished Action is a calm way back, never
      // a filled button competing for the eye.
      expect(find.widgetWithText(OutlinedButton, 'Reopen action'),
          findsOneWidget);
      expect(find.widgetWithText(FilledButton, 'Reopen action'), findsNothing);
      expect(find.text('Mark action complete'), findsNothing);
    });
  });

  group('reduced motion', () {
    polishTest('the onboarding progress stops animating when asked',
        (tester) async {
      await pumpApp(tester, prefs: freshPreferences(), reduceMotion: true);

      final animated = tester.widgetList<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      expect(animated, isNotEmpty);
      for (final container in animated) {
        expect(container.duration, Duration.zero);
      }
    });

    polishTest('and still animates when not', (tester) async {
      await pumpApp(tester, prefs: freshPreferences());

      final animated = tester.widgetList<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      expect(animated, isNotEmpty);
      expect(animated.every((c) => c.duration == Duration.zero), isFalse);
    });

    polishTest('paging still works with motion off', (tester) async {
      await pumpApp(tester, prefs: freshPreferences(), reduceMotion: true);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Motion is decoration; changing screen is not.
      expect(find.text('Nothing is saved until you confirm it'), findsOneWidget);
    });
  });

  group('paragraphs stay readable on a wide screen', () {
    polishTest('the privacy page does not run edge to edge on a tablet',
        (tester) async {
      await pumpApp(tester, size: const Size(1400, 1600));

      await tester.tap(find.byTooltip('Settings'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Where your information lives'));
      await tester.pumpAndSettle();

      final body = tester.getSize(find.byType(CustomScrollView).first);
      expect(body.width, lessThanOrEqualTo(Breakpoints.readableContent));
    });

    polishTest('and still fills a phone', (tester) async {
      await pumpApp(tester, size: const Size(420, 1400));

      await tester.tap(find.byTooltip('Settings'));
      await tester.pumpAndSettle();

      final body = tester.getSize(find.byType(CustomScrollView).first);
      expect(body.width, 420);
    });
  });

  group('trust wording has not drifted', () {
    // These strings are the product's promises. A refactor that quietly
    // reworded one would be a change of meaning, not of style.
    test('privacy copy still names the two exceptions', () {
      final all = privacyDataMap.expand((g) => g.lines).join(' ');
      expect(all, contains('sent to the AI service'));
      expect(all, contains('This is not on-device AI'));
      expect(all, contains('This is not a backup'));
      expect(all, contains('anonymous ID'));
    });

    test('nothing anywhere promises a cross-device backup', () {
      final everything = [
        ...privacyDataMap.expand((g) => g.lines),
        ...helpEntries.map((e) => '${e.question} ${e.answer}'),
      ].join(' ').toLowerCase();

      for (final forbidden in [
        'cloud backup',
        'syncs across',
        'restore to your new device',
        'never leaves your device',
        'everything stays on your device',
      ]) {
        expect(everything, isNot(contains(forbidden)), reason: forbidden);
      }
    });
  });

  group('failure messages say what to do', () {
    test('no provider failure falls back to "something went wrong"', () {
      for (final kind in ProviderFailureKind.values) {
        expect(kind.userMessage.toLowerCase(),
            isNot(contains('something went wrong')),
            reason: kind.name);
        expect(kind.userMessage.toLowerCase(), isNot(contains('oops')));
        // No status codes or machine words reach a person.
        expect(kind.userMessage, isNot(matches(RegExp(r'[45]\d\d'))));
      }
    });

    test('every one of them is a sentence, not a word', () {
      for (final kind in ProviderFailureKind.values) {
        expect(kind.userMessage.trim(), endsWith('.'), reason: kind.name);
        expect(kind.userMessage.length, greaterThan(20), reason: kind.name);
      }
    });
  });

  group('states are contextual, not generic', () {
    polishTest('an empty Home says what to do next', (tester) async {
      await pumpApp(tester);

      expect(find.text('Nothing needs your attention'), findsOneWidget);
      expect(find.textContaining('Add a photo, a screenshot, or some text'),
          findsOneWidget);
      // The two phrasings this product should never fall back to.
      expect(find.textContaining('Nothing here yet'), findsNothing);
      expect(find.textContaining('Something went wrong'), findsNothing);
    });

    polishTest('a missing Action explains itself', (tester) async {
      await pumpApp(tester);

      final container = ProviderScope.containerOf(
        tester.element(find.byType(MaterialApp)),
      );
      container.read(routerProvider).go(Routes.action('does-not-exist'));
      await tester.pumpAndSettle();

      expect(find.text('That action is no longer here'), findsOneWidget);
    });
  });

  group('large text does not clip the operational screens', () {
    polishTest('Home at 200%', (tester) async {
      await _repo.create(sampleAction('a1',
          title: 'Pay the Northgate Water invoice for the summer quarter',
          dueAt: ActionDue(DateTime(2026, 8, 18))));
      await pumpApp(tester, textScale: 2.0);

      expect(tester.takeException(), isNull);
    });

    polishTest('Action Detail at 200%', (tester) async {
      await _repo.create(sampleAction('a1',
          title: 'Pay the Northgate Water invoice',
          steps: [sampleStep('s1', title: 'Check the meter reading first')]));
      await pumpApp(tester, textScale: 2.0);

      await tester.tap(find.textContaining('Northgate'));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    polishTest('Settings at 200%', (tester) async {
      await pumpApp(tester, textScale: 2.0);

      await tester.tap(find.byTooltip('Settings'));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });
  });
}
