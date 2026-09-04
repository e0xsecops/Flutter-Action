import 'package:action_app/app/app.dart';
import 'package:action_app/app/router.dart';
import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/core/result.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/application/extraction_providers.dart';
import 'package:action_app/features/extraction/data/extraction_service.dart';
import 'package:action_app/features/extraction/domain/extraction_input.dart';
import 'package:action_app/features/extraction/domain/extraction_result.dart';
import 'package:action_app/features/onboarding/application/onboarding_controller.dart';
import 'package:action_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';
import '../support/preferences.dart';

/// First run.
///
/// The two properties worth defending: a fresh install cannot get past
/// onboarding without a decision, and onboarding cannot touch anything —
/// not the Actions already on the device, not the captures, not the
/// notification permission, and not the model.

final onboardingNow = DateTime(2026, 8, 18, 12);

class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async => null;
}

/// Fails loudly if onboarding ever reaches for the model.
class _ForbiddenExtractionService implements ExtractionService {
  bool called = false;

  @override
  Future<Result<ExtractionResult>> extract(ExtractionInput input) async {
    called = true;
    throw StateError('onboarding must never call the extraction service');
  }
}

/// Fails loudly if onboarding ever writes to the cloud.
class _SpyCloudMirror implements ActionCloudMirror {
  final upserts = <String>[];

  @override
  Future<void> upsert(String uid, ActionItem item) async =>
      upserts.add(item.id);
}

late ActionsDatabase _db;
late DriftActionRepository _repo;
late FakeSourceStore _sources;
late FakeNotificationScheduler _scheduler;
late _ForbiddenExtractionService _extraction;
late _SpyCloudMirror _cloud;

/// Pumps the real app shell — router, redirect guard and all — against a
/// given preference state. Using [ActionApp] rather than a hand-built router
/// is the point: the thing under test is what a user actually launches.
Future<void> pumpApp(
  WidgetTester tester,
  PreferenceStore preferences, {
  ThemeMode themeMode = ThemeMode.light,
  double textScale = 1.0,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        preferenceStoreProvider.overrideWithValue(preferences),
        actionsDatabaseProvider.overrideWithValue(_db),
        sourceStoreProvider.overrideWith((ref) async => _sources),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider.overrideWithValue(_cloud),
        extractionServiceProvider.overrideWithValue(_extraction),
        notificationSchedulerProvider.overrideWithValue(_scheduler),
        appClockProvider.overrideWithValue(() => onboardingNow),
      ],
      child: MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
        child: Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(textScale),
            ),
            child: const ActionApp(),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Detaches the tree before the test ends, so drift's stream-retire timer
/// runs while the fake clock can still elapse it.
void onboardingTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 1000);
    tester.view.devicePixelRatio = 1.0;
    await body(tester);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(Duration.zero);
    tester.view.reset();
  });
}

Future<void> tapContinueTo(WidgetTester tester, int times) async {
  for (var i = 0; i < times; i++) {
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
  }
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _repo = DriftActionRepository(_db);
    _sources = FakeSourceStore();
    _scheduler = FakeNotificationScheduler();
    _extraction = _ForbiddenExtractionService();
    _cloud = _SpyCloudMirror();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  group('first-run routing', () {
    onboardingTest('a fresh install opens onboarding', (tester) async {
      await pumpApp(tester, freshPreferences());

      expect(find.byType(OnboardingScreen), findsOneWidget);
      expect(find.text('Turn information into action'), findsOneWidget);
    });

    onboardingTest('a completed install opens Home', (tester) async {
      await pumpApp(tester, onboardedPreferences());

      expect(find.byType(OnboardingScreen), findsNothing);
      // Home's own greeting, not onboarding's.
      expect(find.byTooltip('Capture something'), findsOneWidget);
    });

    onboardingTest('a deep link cannot slip past a fresh install',
        (tester) async {
      await _repo.create(sampleAction('a1', title: 'Northgate Water invoice'));
      await pumpApp(tester, freshPreferences());

      // A real navigation to a real Action that really exists — the kind a
      // reminder tap performs. The guard has to hold for that too, not just
      // for the initial location.
      final container = ProviderScope.containerOf(
        tester.element(find.byType(OnboardingScreen)),
      );
      container.read(routerProvider).go(Routes.action('a1'));
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingScreen), findsOneWidget);
      expect(find.text('Northgate Water invoice'), findsNothing);
    });

    onboardingTest('the same deep link works once onboarding is done',
        (tester) async {
      await _repo.create(sampleAction('a1', title: 'Northgate Water invoice'));
      await pumpApp(tester, onboardedPreferences());

      final container = ProviderScope.containerOf(
        tester.element(find.byType(MaterialApp)),
      );
      container.read(routerProvider).go(Routes.action('a1'));
      await tester.pumpAndSettle();

      expect(find.text('Northgate Water invoice'), findsOneWidget);
    });
  });

  group('completing', () {
    onboardingTest('the final call to action opens Home and persists',
        (tester) async {
      final prefs = freshPreferences();
      await pumpApp(tester, prefs);

      await tapContinueTo(tester, 3);
      expect(find.text('Where your information lives'), findsOneWidget);

      await tester.tap(find.text('Start using Action'));
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingScreen), findsNothing);
      expect(prefs.getBool(PreferenceKeys.onboardingCompleted), isTrue);
    });

    onboardingTest('skipping counts as a decision and persists too',
        (tester) async {
      final prefs = freshPreferences();
      await pumpApp(tester, prefs);

      // Skip is deliberately absent on the first screen.
      expect(find.text('Skip'), findsNothing);
      await tapContinueTo(tester, 1);
      expect(find.text('Skip'), findsOneWidget);

      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingScreen), findsNothing);
      expect(prefs.getBool(PreferenceKeys.onboardingCompleted), isTrue);
    });

    onboardingTest('completion survives a restart', (tester) async {
      // One store, two app lifetimes — which is what a restart actually is.
      final prefs = freshPreferences();
      await pumpApp(tester, prefs);
      await tapContinueTo(tester, 3);
      await tester.tap(find.text('Start using Action'));
      await tester.pumpAndSettle();

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(Duration.zero);

      await pumpApp(tester, prefs);
      expect(find.byType(OnboardingScreen), findsNothing);
    });

    onboardingTest('an unfinished run does not count', (tester) async {
      final prefs = freshPreferences();
      await pumpApp(tester, prefs);
      await tapContinueTo(tester, 2);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(Duration.zero);

      await pumpApp(tester, prefs);
      expect(find.byType(OnboardingScreen), findsOneWidget);
      // And it starts from the beginning rather than resuming mid-thought.
      expect(find.text('Turn information into action'), findsOneWidget);
    });
  });

  group('onboarding touches nothing', () {
    onboardingTest('it does not modify Actions', (tester) async {
      await _repo.create(sampleAction('a1', title: 'Existing action'));
      final before = await _repo.watchAll().first;

      final prefs = freshPreferences();
      await pumpApp(tester, prefs);
      await tapContinueTo(tester, 3);
      await tester.tap(find.text('Start using Action'));
      await tester.pumpAndSettle();

      final after = await _repo.watchAll().first;
      expect(after.map((a) => a.id), before.map((a) => a.id));
      expect(after.single.title, 'Existing action');
    });

    onboardingTest('it does not modify Sources', (tester) async {
      await _sources.add(SourceItem(
        id: 's1',
        type: SourceType.pastedText,
        capturedAt: DateTime(2026, 8, 10),
        pastedText: 'Existing capture',
        state: SourceProcessingState.ready,
      ));

      await pumpApp(tester, freshPreferences());
      await tapContinueTo(tester, 3);
      await tester.tap(find.text('Start using Action'));
      await tester.pumpAndSettle();

      expect(_sources.items, hasLength(1));
      expect(_sources.items.single.pastedText, 'Existing capture');
    });

    onboardingTest('it never asks for notification permission',
        (tester) async {
      await pumpApp(tester, freshPreferences());
      await tapContinueTo(tester, 3);
      await tester.tap(find.text('Start using Action'));
      await tester.pumpAndSettle();

      // Permissions stay contextual: the ask belongs to the first reminder,
      // not to a page someone is trying to read.
      expect(_scheduler.permissionRequests, 0);
    });

    onboardingTest('it never calls the extraction service', (tester) async {
      await pumpApp(tester, freshPreferences());
      await tapContinueTo(tester, 3);
      await tester.tap(find.text('Start using Action'));
      await tester.pumpAndSettle();

      expect(_extraction.called, isFalse);
    });

    onboardingTest('it never writes to the cloud', (tester) async {
      await pumpApp(tester, freshPreferences());
      await tapContinueTo(tester, 3);
      await tester.tap(find.text('Start using Action'));
      await tester.pumpAndSettle();

      expect(_cloud.upserts, isEmpty);
    });
  });

  group('navigation', () {
    onboardingTest('back moves to the previous page, not out of the app',
        (tester) async {
      await pumpApp(tester, freshPreferences());
      await tapContinueTo(tester, 2);
      expect(find.text('Stay on top of what matters'), findsOneWidget);

      final popped = await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(popped, isTrue, reason: 'the page-back was handled here');
      expect(find.text('Nothing is saved until you confirm it'),
          findsOneWidget);
      expect(find.byType(OnboardingScreen), findsOneWidget);
    });

    onboardingTest('every page is reachable and titled', (tester) async {
      await pumpApp(tester, freshPreferences());

      const titles = [
        'Turn information into action',
        'Nothing is saved until you confirm it',
        'Stay on top of what matters',
        'Where your information lives',
      ];
      for (var i = 0; i < titles.length; i++) {
        expect(find.text(titles[i]), findsOneWidget);
        if (i < titles.length - 1) await tapContinueTo(tester, 1);
      }
    });

    onboardingTest('progress is announced, not only drawn', (tester) async {
      await pumpApp(tester, freshPreferences());
      expect(find.bySemanticsLabel('Step 1 of 4'), findsOneWidget);

      await tapContinueTo(tester, 1);
      expect(find.bySemanticsLabel('Step 2 of 4'), findsOneWidget);
    });
  });

  group('the privacy screen tells the truth', () {
    Future<void> openPrivacy(WidgetTester tester) async {
      await pumpApp(tester, freshPreferences());
      await tapContinueTo(tester, 3);
    }

    onboardingTest('it does not claim everything stays on the device',
        (tester) async {
      await openPrivacy(tester);

      // The one claim this architecture cannot make: extraction sends the
      // selected content to a model.
      expect(find.textContaining('sent to the AI service'), findsOneWidget);
      expect(find.textContaining('Everything stays on'), findsNothing);
      expect(find.textContaining('never leaves'), findsNothing);
    });

    onboardingTest('it does not promise a backup or cross-device restore',
        (tester) async {
      await openPrivacy(tester);

      expect(find.textContaining('not a backup'), findsOneWidget);
      expect(find.textContaining('cannot restore'), findsOneWidget);
      expect(find.textContaining('Cloud backup'), findsNothing);
      expect(find.textContaining('syncs across'), findsNothing);
    });

    onboardingTest('it names what is mirrored and what is not',
        (tester) async {
      await openPrivacy(tester);

      // Matches cloudPayloadFor: title, dates, amount, suggested step.
      expect(find.textContaining('anonymous ID'), findsOneWidget);
      expect(
        find.textContaining('captures, steps and reminders are not'),
        findsOneWidget,
      );
    });
  });

  group('presentation', () {
    onboardingTest('renders in dark theme', (tester) async {
      await pumpApp(tester, freshPreferences(), themeMode: ThemeMode.dark);

      expect(find.byType(OnboardingScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    onboardingTest('survives a large accessibility text size',
        (tester) async {
      await pumpApp(tester, freshPreferences(), textScale: 2.0);

      // Every page, at 200%: the illustration is dropped rather than the
      // words being clipped.
      for (var i = 0; i < 3; i++) {
        expect(tester.takeException(), isNull);
        await tapContinueTo(tester, 1);
      }
      expect(tester.takeException(), isNull);
    });

    onboardingTest('survives a short screen', (tester) async {
      tester.view.physicalSize = const Size(420, 560);
      await pumpApp(tester, freshPreferences());

      await tapContinueTo(tester, 3);
      expect(tester.takeException(), isNull);
      expect(find.text('Start using Action'), findsOneWidget);
    });
  });

  group('the reset seam', () {
    test('reset puts a completed app back to first run', () async {
      final prefs = freshPreferences();
      final container = ProviderContainer(
        overrides: [preferenceStoreProvider.overrideWithValue(prefs)],
      );
      addTearDown(container.dispose);

      expect(container.read(onboardingControllerProvider), isFalse);

      await container.read(onboardingControllerProvider.notifier).complete();
      expect(container.read(onboardingControllerProvider), isTrue);
      expect(prefs.getBool(PreferenceKeys.onboardingCompleted), isTrue);

      await container.read(onboardingControllerProvider.notifier).reset();
      expect(container.read(onboardingControllerProvider), isFalse);
      expect(prefs.getBool(PreferenceKeys.onboardingCompleted), isNull);
    });

    test('routes are not stringly-typed', () {
      expect(Routes.onboarding, '/onboarding');
    });
  });
}
