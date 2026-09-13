/// The Security & privacy centre, driven through the real app shell.
///
/// The properties worth holding: a device with no screen lock is refused
/// rather than locked out, a protection that the platform declined is never
/// shown as on, the receipts describe sizes and never contents, and nothing on
/// the screen claims more than the mechanisms deliver.
library;

import 'package:action_app/app/app.dart';
import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/core/security/activity_journal.dart';
import 'package:action_app/core/security/activity_providers.dart';
import 'package:action_app/core/security/device_lock.dart';
import 'package:action_app/core/security/platform_device_lock.dart';
import 'package:action_app/core/security/protection_providers.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/action_cloud_privacy_service.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/cloud_privacy_inventory.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/settings/application/settings_providers.dart';
import 'package:action_app/features/settings/data/system_settings_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';
import '../support/preferences.dart';

class _Identity implements AuthIdentityService {
  const _Identity();
  @override
  String? get lastFailureClass => null;
  @override
  Future<String?> currentOrSignInUid() async => 'uid-test';
}

class _NoopLauncher implements SystemSettingsLauncher {
  const _NoopLauncher();
  @override
  Future<bool> openNotificationSettings() async => true;
}

/// A device that answers however the test needs it to.
class _FakeAuthenticator implements DeviceAuthenticator {
  /// Set by the tests that need a device with no screen lock.
  bool available = true;

  /// Null means "succeed". Set to refuse or to report unavailable.
  DeviceAuthOutcome? outcome;

  int prompts = 0;

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<DeviceAuthOutcome> authenticate(String reason) async {
    prompts++;
    return outcome ?? DeviceAuthOutcome.succeeded;
  }
}

/// A platform that can refuse, which is the case worth testing.
class _FakeScreenPrivacy implements ScreenPrivacy {
  bool accept = true;
  final calls = <bool>[];

  @override
  Future<bool> setEnabled(bool enabled) async {
    calls.add(enabled);
    return accept;
  }
}

late ActionsDatabase _db;
late DriftActionRepository _repo;
late FakeSourceStore _sources;
late FakeSourceFileStore _files;
late FakeNotificationScheduler _scheduler;
late _FakeAuthenticator _auth;
late _FakeScreenPrivacy _screen;
late InMemoryActivityJournal _journal;

final _now = DateTime(2026, 9, 1, 12);

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
        systemSettingsLauncherProvider.overrideWithValue(const _NoopLauncher()),
        appVersionProvider.overrideWith((ref) async => '1.0.0 (1)'),
        appClockProvider.overrideWithValue(() => _now),
        deviceAuthenticatorProvider.overrideWithValue(_auth),
        screenPrivacyProvider.overrideWithValue(_screen),
        activityJournalProvider.overrideWith((ref) async => _journal),
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

void securityTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 1600);
    tester.view.devicePixelRatio = 1.0;
    try {
      await body(tester);
    } finally {
      // In a finally, always. One failure that skipped this used to leave a
      // pending timer and a resized view, and hang the whole file.
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 5));
      tester.view.reset();
    }
  });
}

Future<void> openSecurity(WidgetTester tester) async {
  await tester.tap(find.byTooltip('Settings'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Security'));
  await tester.pumpAndSettle();
}

Future<void> scrollTo(WidgetTester tester, Finder target) async {
  await tester.scrollUntilVisible(target, 250);
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _repo = DriftActionRepository(_db);
    _sources = FakeSourceStore();
    _files = FakeSourceFileStore();
    _scheduler = FakeNotificationScheduler();
    _auth = _FakeAuthenticator();
    _screen = _FakeScreenPrivacy();
    _journal = InMemoryActivityJournal();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  group('getting there', () {
    securityTest('Settings has a Security row that opens the centre',
        (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);

      expect(find.text('Security & privacy'), findsOneWidget);
      expect(find.text('App Lock'), findsOneWidget);
    });

    securityTest('the data map is still reachable, from either place',
        (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await tester.tap(find.byTooltip('Settings'));
      await tester.pumpAndSettle();

      // Splitting the old privacy row in two must not have orphaned the
      // explanation of where data goes.
      expect(find.text('Where your information lives'), findsOneWidget);
    });
  });

  group('App Lock', () {
    securityTest('is off by default', (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);

      final toggle = tester.widget<Switch>(find.byType(Switch).first);
      expect(toggle.value, isFalse);
      expect(_auth.prompts, 0);
    });

    securityTest('opening the screen never prompts for anything',
        (tester) async {
      // A security screen that provokes a biometric dialog on arrival is a
      // trap, exactly like a settings screen that provokes a permission one.
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);

      expect(_auth.prompts, 0);
    });

    securityTest('turning it on asks first, and only then stores it',
        (tester) async {
      final prefs = onboardedPreferences();
      await pumpApp(tester, prefs);
      await openSecurity(tester);

      await tester.tap(find.byType(Switch).first);
      await tester.pumpAndSettle();

      expect(_auth.prompts, 1);
      expect(prefs.getBool(PreferenceKeys.appLockEnabled), isTrue);
    });

    securityTest('a refused check changes nothing', (tester) async {
      _auth.outcome = DeviceAuthOutcome.failed;
      final prefs = onboardedPreferences();
      await pumpApp(tester, prefs);
      await openSecurity(tester);

      await tester.tap(find.byType(Switch).first);
      await tester.pumpAndSettle();

      expect(prefs.getBool(PreferenceKeys.appLockEnabled), isNot(isTrue));
      expect(find.textContaining('nothing changed'), findsOneWidget);
    });

    securityTest('a device with no screen lock is refused, not locked out',
        (tester) async {
      // The bug that cannot be apologised for afterwards.
      _auth.available = false;
      final prefs = onboardedPreferences();
      await pumpApp(tester, prefs);
      await openSecurity(tester);

      final toggle = tester.widget<Switch>(find.byType(Switch).first);
      expect(toggle.onChanged, isNull);
      expect(prefs.getBool(PreferenceKeys.appLockEnabled), isNot(isTrue));
    });

    securityTest('and says where to fix it', (tester) async {
      _auth.available = false;
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);

      expect(
        find.textContaining('App Lock needs a screen lock on this device'),
        findsOneWidget,
      );
    });

    securityTest('turning it off also requires the check', (tester) async {
      // Otherwise the lock protects nothing from whoever is holding the
      // unlocked phone.
      final prefs = InMemoryPreferenceStore({
        PreferenceKeys.onboardingCompleted: true,
        PreferenceKeys.appLockEnabled: true,
      });
      // Starting with App Lock already on means the app starts locked, which
      // is the correct behaviour and has to be got past before the switch can
      // be reached at all.
      await pumpApp(tester, prefs);
      await tester.pumpAndSettle();
      expect(_auth.prompts, 1);

      await openSecurity(tester);
      _auth.outcome = DeviceAuthOutcome.failed;
      _auth.prompts = 0;

      await tester.tap(find.byType(Switch).first);
      await tester.pumpAndSettle();

      expect(_auth.prompts, 1);
      expect(prefs.getBool(PreferenceKeys.appLockEnabled), isTrue);
    });

    securityTest('an app that starts with App Lock on starts locked',
        (tester) async {
      // The case the feature exists for: someone picking up a phone that is
      // already unlocked.
      _auth.outcome = DeviceAuthOutcome.failed;
      await pumpApp(
        tester,
        InMemoryPreferenceStore({
          PreferenceKeys.onboardingCompleted: true,
          PreferenceKeys.appLockEnabled: true,
        }),
      );

      expect(find.text('Action is locked'), findsOneWidget);
    });

    securityTest('turning App Lock on does not immediately lock the app',
        (tester) async {
      // It used to. The locked-state provider watched the setting, so the
      // instant the switch went on the app demanded the credential the user
      // had just supplied to turn it on.
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);

      await tester.tap(find.byType(Switch).first);
      await tester.pumpAndSettle();

      expect(find.text('Action is locked'), findsNothing);
      expect(_auth.prompts, 1);
    });

    securityTest('the grace period and Lock now appear only when it is on',
        (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);
      expect(find.text('Ask again'), findsNothing);
      expect(find.text('Lock now'), findsNothing);

      await tester.tap(find.byType(Switch).first);
      await tester.pumpAndSettle();

      expect(find.text('Ask again'), findsOneWidget);
      expect(find.text('Lock now'), findsOneWidget);
    });

    securityTest('the grace period defaults to the safest option',
        (tester) async {
      final prefs = InMemoryPreferenceStore({
        PreferenceKeys.onboardingCompleted: true,
        PreferenceKeys.appLockEnabled: true,
      });
      await pumpApp(tester, prefs);
      await tester.pumpAndSettle(); // past the start-up lock
      await openSecurity(tester);

      expect(find.text('Immediately'), findsOneWidget);
    });
  });

  group('screen privacy', () {
    securityTest('asks the platform and stores the result', (tester) async {
      final prefs = onboardedPreferences();
      await pumpApp(tester, prefs);
      await openSecurity(tester);

      await tester.tap(find.byType(Switch).at(1));
      await tester.pumpAndSettle();

      expect(_screen.calls, [true]);
      expect(prefs.getBool(PreferenceKeys.screenPrivacyEnabled), isTrue);
    });

    securityTest('a platform that refuses leaves the switch off',
        (tester) async {
      // A switch reading "on" over an unprotected window is the worst
      // available outcome, because the user then believes they are covered.
      _screen.accept = false;
      final prefs = onboardedPreferences();
      await pumpApp(tester, prefs);
      await openSecurity(tester);

      await tester.tap(find.byType(Switch).at(1));
      await tester.pumpAndSettle();

      expect(prefs.getBool(PreferenceKeys.screenPrivacyEnabled), isNot(isTrue));
      final toggle = tester.widget<Switch>(find.byType(Switch).at(1));
      expect(toggle.value, isFalse);
      expect(find.textContaining('left off rather than shown as on'),
          findsOneWidget);
    });

    securityTest('a stored setting is re-applied to the window at start-up',
        (tester) async {
      // FLAG_SECURE lives on the Activity window, not in any store, so a
      // setting from last week protects nothing today unless something asks
      // for it again.
      await pumpApp(
        tester,
        InMemoryPreferenceStore({
          PreferenceKeys.onboardingCompleted: true,
          PreferenceKeys.screenPrivacyEnabled: true,
        }),
      );

      expect(_screen.calls, contains(true));
    });
  });

  group('private reminders', () {
    securityTest('stores the choice', (tester) async {
      final prefs = onboardedPreferences();
      await pumpApp(tester, prefs);
      await openSecurity(tester);

      await tester.tap(find.byType(Switch).at(2));
      await tester.pumpAndSettle();

      expect(prefs.getBool(PreferenceKeys.privateNotifications), isTrue);
    });
  });

  group('what left this device', () {
    securityTest('says so plainly when nothing has', (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);
      await scrollTo(tester, find.text('Nothing has been sent'));

      expect(find.text('Nothing has been sent'), findsOneWidget);
    });

    securityTest('lists a send with its size and provider, never its content',
        (tester) async {
      await _journal.record(ActivityEntry(
        event: ActivityEvent.aiRequestSent,
        at: _now.subtract(const Duration(minutes: 30)),
        providerId: 'anthropic',
        toolId: 'document-intelligence',
        pages: 4,
      ));

      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);
      await scrollTo(tester, find.text('Understand this document'));

      expect(find.textContaining('Anthropic'), findsWidgets);
      expect(find.textContaining('4 pages'), findsOneWidget);
      expect(find.text('30m ago'), findsOneWidget);
    });

    securityTest('a character count is rounded rather than exact',
        (tester) async {
      // An exact character count is closer to a fingerprint of the document
      // than the reader needs.
      await _journal.record(ActivityEntry(
        event: ActivityEvent.aiRequestSent,
        at: _now.subtract(const Duration(minutes: 5)),
        providerId: 'openai',
        toolId: 'smart-summary',
        textCharacters: 18_402,
      ));

      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);
      await scrollTo(tester, find.textContaining('18k characters'));

      expect(find.textContaining('18k characters'), findsOneWidget);
      expect(find.textContaining('18402'), findsNothing);
    });

    securityTest('protection changes do not appear in the transfer list',
        (tester) async {
      // Two questions, two lanes. Someone checking what was sent to a provider
      // should not scroll past six appearance changes to find it.
      await _journal.record(
        ActivityEntry(event: ActivityEvent.appLockEnabled, at: _now),
      );

      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);
      await scrollTo(tester, find.text('Nothing has been sent'));

      expect(find.text('Nothing has been sent'), findsOneWidget);
    });
  });

  group('what it will not claim', () {
    securityTest('no marketing security language anywhere on the screen',
        (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);

      for (final banned in [
        'military',
        'bank-grade',
        'unhackable',
        '100%',
        'completely secure',
        'fully encrypted',
      ]) {
        expect(
          find.textContaining(banned, skipOffstage: false),
          findsNothing,
          reason: banned,
        );
      }
    });

    securityTest('it states plainly what Action does not encrypt',
        (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);
      await scrollTo(tester, find.text('How your data is stored'.toUpperCase()));

      expect(
        find.textContaining('does not add a second layer of its own'),
        findsOneWidget,
      );
      expect(
        find.textContaining('None of it is a defence against someone'),
        findsOneWidget,
      );
    });

    securityTest('there is no security score', (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);

      // A number invites optimising the number. The hero names what is on.
      expect(find.textContaining('out of'), findsNothing);
      expect(find.textContaining('score'), findsNothing);
      expect(find.text('Three protections are available'), findsOneWidget);
    });

    securityTest('the hero names the protections that are on', (tester) async {
      await pumpApp(
        tester,
        InMemoryPreferenceStore({
          PreferenceKeys.onboardingCompleted: true,
          PreferenceKeys.appLockEnabled: true,
          PreferenceKeys.privateNotifications: true,
        }),
      );
      await tester.pumpAndSettle(); // past the start-up lock
      await openSecurity(tester);

      expect(
        find.text('App Lock and Private reminders are on'),
        findsOneWidget,
      );
    });
  });

  group('presentation', () {
    securityTest('renders dark without exception', (tester) async {
      await pumpApp(
        tester,
        InMemoryPreferenceStore({
          PreferenceKeys.onboardingCompleted: true,
          PreferenceKeys.themeMode: 'dark',
        }),
      );
      await openSecurity(tester);

      expect(tester.takeException(), isNull);
      expect(find.text('Security & privacy'), findsOneWidget);
    });

    securityTest('survives large text', (tester) async {
      await pumpApp(tester, onboardedPreferences(), textScale: 1.8);
      await openSecurity(tester);

      expect(tester.takeException(), isNull);
    });
  });

  group('the repository is untouched by any of this', () {
    securityTest('turning protections on creates no Actions', (tester) async {
      await pumpApp(tester, onboardedPreferences());
      await openSecurity(tester);
      await tester.tap(find.byType(Switch).first);
      await tester.pumpAndSettle();

      expect(await _repo.watchAll().first, isEmpty);
    });
  });
}
