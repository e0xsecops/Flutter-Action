import 'package:action_app/app/app.dart';
import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/action_cloud_privacy_service.dart';
import 'package:action_app/features/actions/data/cloud_privacy_inventory.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
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

/// Settings, privacy and help, driven through the real app shell.
///
/// The properties that matter: a preference survives a restart, opening a
/// page never asks the system for anything, and the privacy copy says only
/// what the code actually does.

final settingsNow = DateTime(2026, 8, 18, 12);

/// An identity that resolves, so a deletion can actually finish. Without a
/// uid there is no way to prove ownership of the cloud documents and the
/// service correctly refuses to claim they are gone — which is its own test,
/// in privacy_deletion_test.dart.
class _Identity implements AuthIdentityService {
  const _Identity();
  @override
  String? get lastFailureClass => null;
  @override
  Future<String?> currentOrSignInUid() async => 'uid-test';
}

class _SpyLauncher implements SystemSettingsLauncher {
  int opened = 0;
  @override
  Future<bool> openNotificationSettings() async {
    opened++;
    return true;
  }
}

late ActionsDatabase _db;
late DriftActionRepository _repo;
late FakeSourceStore _sources;
late FakeSourceFileStore _files;
late FakeNotificationScheduler _scheduler;
late _SpyLauncher _launcher;

Future<void> pumpApp(
  WidgetTester tester,
  PreferenceStore prefs, {
  double textScale = 1.0,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        preferenceStoreProvider.overrideWithValue(prefs),
        actionsDatabaseProvider.overrideWithValue(_db),
        sourceStoreProvider.overrideWith((ref) async => _sources),
        sourceFileStoreProvider.overrideWith((ref) async => _files),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        authIdentityServiceProvider.overrideWithValue(const _Identity()),
        actionCloudMirrorProvider
            .overrideWithValue(const NoopActionCloudMirror()),
        actionCloudPrivacyServiceProvider
            .overrideWithValue(const NoopActionCloudPrivacyService()),
        cloudPrivacyInventoryProvider
            .overrideWithValue(const NoopCloudPrivacyInventory()),
        notificationSchedulerProvider.overrideWithValue(_scheduler),
        systemSettingsLauncherProvider.overrideWithValue(_launcher),
        appVersionProvider.overrideWith((ref) async => '1.0.0 (1)'),
        appClockProvider.overrideWithValue(() => settingsNow),
      ],
      child: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(textScale)),
          child: const ActionApp(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void settingsTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 1400);
    tester.view.devicePixelRatio = 1.0;
    await body(tester);
    await tester.pumpWidget(const SizedBox.shrink());
    // Long enough to run out a SnackBar's dismiss timer as well as drift's
    // stream-retire timer; a pending timer at teardown fails the test.
    await tester.pump(const Duration(seconds: 5));
    tester.view.reset();
  });
}

/// Home -> Settings.
Future<void> openSettings(WidgetTester tester) async {
  await tester.tap(find.byTooltip('Settings'));
  await tester.pumpAndSettle();
}

String _privacyText() =>
    privacyDataMap.expand((g) => g.lines).join(' ');

/// The data controls sit below the data map, which is the right order for
/// reading and means a test has to scroll to reach them.
Future<void> scrollTo(WidgetTester tester, Finder target) async {
  await tester.scrollUntilVisible(
    target,
    300,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _repo = DriftActionRepository(_db);
    _sources = FakeSourceStore();
    _files = FakeSourceFileStore();
    _scheduler = FakeNotificationScheduler();
    _launcher = _SpyLauncher();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  group('getting there', () {
    settingsTest('Home has a settings affordance that opens Settings',
        (tester) async {
      await pumpApp(tester, onboardedPreferences());

      await openSettings(tester);

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Appearance'), findsOneWidget);
    });

    settingsTest('it is five small groups, not a wall of switches',
        (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);

      // V2 split the old "Privacy & data" row in two: the controls that
      // actually protect something now live behind Security, and the
      // explanation of where data goes stays where it was.
      expect(find.text('PERSONALISE'), findsOneWidget);
      expect(find.text('INTELLIGENCE'), findsOneWidget);
      expect(find.text('PRIVACY & SECURITY'), findsOneWidget);
      expect(find.text('REMINDERS'), findsOneWidget);
      expect(find.text('ACTION'), findsOneWidget);
      // No developer configuration is on show.
      expect(find.textContaining('Firestore'), findsNothing);
      expect(find.textContaining('schemaVersion'), findsNothing);
    });
  });

  group('appearance', () {
    settingsTest('defaults to following the system', (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);

      expect(find.text('System'), findsOneWidget);
    });

    settingsTest('choosing dark applies immediately', (tester) async {
      final prefs = onboardedPreferences();
      await pumpApp(tester, prefs);
      await openSettings(tester);

      await tester.tap(find.text('Appearance'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark'));
      await tester.pumpAndSettle();

      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.themeMode, ThemeMode.dark);
      expect(prefs.getString(PreferenceKeys.themeMode), 'dark');
    });

    settingsTest('the choice survives a restart', (tester) async {
      final prefs = onboardedPreferences();
      await pumpApp(tester, prefs);
      await openSettings(tester);
      await tester.tap(find.text('Appearance'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark'));
      await tester.pumpAndSettle();

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(Duration.zero);

      // Same store, new app lifetime.
      await pumpApp(tester, prefs);
      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.themeMode, ThemeMode.dark);
    });

    settingsTest('and can be put back to System', (tester) async {
      final prefs = InMemoryPreferenceStore({
        PreferenceKeys.onboardingCompleted: true,
        PreferenceKeys.themeMode: 'dark',
      });
      await pumpApp(tester, prefs);
      await openSettings(tester);
      expect(find.text('Dark'), findsOneWidget);

      await tester.tap(find.text('Appearance'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('System'));
      await tester.pumpAndSettle();

      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.themeMode, ThemeMode.system);
    });
  });

  group('notifications', () {
    settingsTest('shows the real state when allowed', (tester) async {
      _scheduler.allowed = true;
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);

      expect(find.text('Allowed'), findsOneWidget);
    });

    settingsTest('shows the real state when off, and offers a way out',
        (tester) async {
      _scheduler.allowed = false;
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);

      expect(find.text('Off'), findsOneWidget);
      expect(find.text('Open settings'), findsOneWidget);
    });

    settingsTest('opening the page never asks for permission', (tester) async {
      _scheduler.allowed = false;
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);

      // A settings screen that provokes a permission dialog is a trap.
      expect(_scheduler.permissionRequests, 0);
    });

    settingsTest('system settings open only when asked', (tester) async {
      _scheduler.allowed = false;
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);
      expect(_launcher.opened, 0);

      await tester.tap(find.text('Open settings'));
      await tester.pumpAndSettle();

      expect(_launcher.opened, 1);
      expect(_scheduler.permissionRequests, 0);
    });

    settingsTest('does not promise reminders will be on time', (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);

      expect(find.textContaining('Android may deliver a reminder a little '
          'later'), findsOneWidget);
      expect(find.textContaining('guaranteed'), findsNothing);
      expect(find.textContaining('exactly on time'), findsNothing);
    });
  });

  group('about', () {
    settingsTest('shows a version and no marketing', (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);

      expect(find.text('1.0.0 (1)'), findsOneWidget);
      expect(find.textContaining('most advanced'), findsNothing);
      expect(find.textContaining('powered by'), findsNothing);
    });
  });

  group('help', () {
    settingsTest('opens from Settings', (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSettings(tester);

      await tester.tap(find.text('Help'));
      await tester.pumpAndSettle();

      expect(find.text('What can I add?'), findsOneWidget);
    });

    // The list builds lazily, so these read the copy itself rather than the
    // handful of entries that happen to fit on screen.
    test('answers the questions people actually ask', () {
      final questions = helpEntries.map((e) => e.question).toList();
      expect(questions, contains('Is this a backup?'));
      expect(questions, contains('Why was my reminder late?'));
      expect(questions, contains('Where is my data?'));
      expect(questions, contains('Why does Action ask me to review?'));
    });

    test('invents no support channel anywhere in it', () {
      for (final entry in helpEntries) {
        final text = '${entry.question} ${entry.answer}';
        expect(text, isNot(contains('@')));
        expect(text.toLowerCase(), isNot(contains('contact us')));
        expect(text.toLowerCase(), isNot(contains('support team')));
      }
    });

    test('does not promise what the architecture cannot deliver', () {
      final all = helpEntries.map((e) => e.answer).join(' ').toLowerCase();
      expect(all, isNot(contains('guaranteed')));
      expect(all, isNot(contains('cloud backup')));
      expect(all, isNot(contains('syncs across')));
      // And it says the two true things out loud.
      expect(all, contains('sent to the ai service'));
      expect(all, contains('cannot be restored'));
    });
  });

  group('the privacy page', () {
    Future<void> openPrivacy(WidgetTester tester) async {
      await openSettings(tester);
      await tester.tap(find.text('Where your information lives'));
      await tester.pumpAndSettle();
    }

    settingsTest('names every route data can take off the device',
        (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openPrivacy(tester);

      // Four now, not three: V2 added the user's own AI provider, which is a
      // genuinely different route from the built-in reader. The page is a lazy
      // list, so each heading is scrolled to rather than assumed on screen.
      for (final heading in [
        'On this device',
        'Sent to be read',
        'Sent to your own AI provider',
        'Stored in the cloud',
      ]) {
        await tester.scrollUntilVisible(find.text(heading), 200);
        expect(find.text(heading), findsOneWidget, reason: heading);
      }
    });

    // Copy assertions read the map itself: the page is long, and a widget
    // finder can only see the part of it that is on screen.
    test('does not claim on-device AI', () {
      final all = _privacyText();
      expect(all, contains('This is not on-device AI'));
      expect(all.toLowerCase(), isNot(contains('never sees')));
      expect(all.toLowerCase(), isNot(contains('everything stays on')));
    });

    test('does not promise backup or cross-device restore', () {
      final all = _privacyText();
      expect(all, contains('This is not a backup'));
      expect(all, contains('no way to restore it to a new device'));
      expect(all.toLowerCase(), isNot(contains('syncs across')));
      expect(all.toLowerCase(), isNot(contains('cloud backup')));
    });

    test('says search, steps and reminders stay local', () {
      final all = _privacyText();
      expect(all, contains('searches run here, are never sent anywhere'));
      expect(all, contains('reminders are not sent'));
    });

    test('names exactly what the mirror carries', () {
      final cloud = privacyDataMap
          .firstWhere((g) => g.title == 'Stored in the cloud')
          .lines
          .join(' ');
      // Matches cloudPayloadFor field for field.
      for (final field in [
        'title',
        'status',
        'urgency',
        'category',
        'deadline',
        'amount',
        'suggested next step',
        'timestamps',
      ]) {
        expect(cloud, contains(field));
      }
      expect(cloud, contains('anonymous ID'));
    });

    settingsTest('deleting everything asks first, and cancel changes nothing',
        (tester) async {
      await _repo.create(sampleAction('a1', title: 'Water bill'));
      await pumpApp(tester, onboardedPreferences());
      await openPrivacy(tester);

      await scrollTo(tester, find.text('Delete all my data'));
      await tester.tap(find.text('Delete all my data'));
      await tester.pumpAndSettle();
      expect(find.text('Delete all your data?'), findsOneWidget);
      expect(find.textContaining('cannot be undone'), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(await _repo.watchAll().first, hasLength(1));
    });

    settingsTest('confirming deletes and says so', (tester) async {
      await _repo.create(sampleAction('a1', title: 'Water bill'));
      await _sources.add(SourceItem(
        id: 's1',
        type: SourceType.pastedText,
        capturedAt: DateTime(2026, 8, 10),
        pastedText: 'anything',
        state: SourceProcessingState.ready,
      ));
      await pumpApp(tester, onboardedPreferences());
      await openPrivacy(tester);

      await scrollTo(tester, find.text('Delete all my data'));
      await tester.tap(find.text('Delete all my data'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete everything'));
      await tester.pumpAndSettle();

      expect(await _repo.watchAll().first, isEmpty);
      expect(_sources.items, isEmpty);

      // The deletion is asynchronous; the confirmation lands a frame later.
      await tester.pumpAndSettle();
      expect(find.text('Everything has been deleted.'), findsOneWidget);
    });

    settingsTest('clearing captures keeps the Actions', (tester) async {
      await _repo.create(sampleAction('a1', title: 'Water bill'));
      await _sources.add(SourceItem(
        id: 's1',
        type: SourceType.pastedText,
        capturedAt: DateTime(2026, 8, 10),
        pastedText: 'anything',
        state: SourceProcessingState.ready,
      ));
      await pumpApp(tester, onboardedPreferences());
      await openPrivacy(tester);

      await scrollTo(tester, find.text('Clear captures'));
      await tester.tap(find.text('Clear captures').first);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(TextButton, 'Clear captures'));
      await tester.pumpAndSettle();

      expect(_sources.items, isEmpty);
      expect(await _repo.watchAll().first, hasLength(1));
    });
  });

  group('presentation', () {
    settingsTest('renders dark', (tester) async {
      final prefs = InMemoryPreferenceStore({
        PreferenceKeys.onboardingCompleted: true,
        PreferenceKeys.themeMode: 'dark',
      });
      await pumpApp(tester, prefs);
      await openSettings(tester);

      expect(tester.takeException(), isNull);
      expect(find.text('Dark'), findsOneWidget);
    });

    settingsTest('survives large text on settings and privacy',
        (tester) async {
      await pumpApp(tester, onboardedPreferences(), textScale: 1.8);
      await openSettings(tester);
      expect(tester.takeException(), isNull);

      // At 1.8x the page is taller than the viewport, and Settings is a lazy
      // sliver list, so the privacy row is not built until it is scrolled to.
      // Scrolling first keeps this asserting what it always asserted - that
      // the page survives large text and privacy is still reachable - rather
      // than depending on the row happening to sit above the fold.
      await tester.scrollUntilVisible(
        find.text('Where your information lives'),
        200,
      );
      await tester.tap(find.text('Where your information lives'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });
}
