/// The lock controller against the lifecycle order the device actually
/// produces.
///
/// **What the device showed.** With App Lock on and "ask again immediately",
/// entering the PIN on the OS prompt raised the prompt again, and again,
/// forever. The prompt's result reaches Dart *before* the activity's own
/// `resumed` event: the credential screen finishes and hands back its
/// answer, and only then does Action resume. The controller had already
/// cleared its "prompt is up" flag and set `leftAt` to null, so the resume
/// read as a cold start — which the policy deliberately treats as "lock".
///
/// The widget tests could not see this because they drive lifecycle events
/// by hand and never in that order. These tests drive them in that order.
library;

import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/core/security/device_lock.dart';
import 'package:action_app/core/security/protection_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeAuthenticator implements DeviceAuthenticator {
  DeviceAuthOutcome outcome = DeviceAuthOutcome.succeeded;
  int prompts = 0;

  @override
  Future<bool> isAvailable() async => true;

  @override
  Future<DeviceAuthOutcome> authenticate(String reason) async {
    prompts++;
    return outcome;
  }
}

final _t0 = DateTime(2026, 9, 14, 12);
DateTime _at(int ms) => _t0.add(Duration(milliseconds: ms));

ProviderContainer _container(
  _FakeAuthenticator auth, {
  bool enabled = true,
  String delay = 'immediate',
}) {
  final container = ProviderContainer(
    overrides: [
      preferenceStoreProvider.overrideWithValue(
        InMemoryPreferenceStore({
          PreferenceKeys.appLockEnabled: enabled,
          PreferenceKeys.appLockDelay: delay,
        }),
      ),
      deviceAuthenticatorProvider.overrideWithValue(auth),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('after a successful unlock', () {
    test('the resume the prompt itself causes does not lock again', () async {
      final auth = _FakeAuthenticator();
      final c = _container(auth);
      final lock = c.read(appLockedProvider.notifier);
      expect(c.read(appLockedProvider), isTrue, reason: 'starts locked');

      // The prompt takes the app out of the foreground...
      lock.noteLeftForeground(at: _at(0));
      final outcome = await lock.unlock(now: _at(900));
      expect(outcome, DeviceAuthOutcome.succeeded);
      expect(c.read(appLockedProvider), isFalse);

      // ...and the activity resumes a few milliseconds *after* the answer.
      lock.noteReturnedToForeground(at: _at(950));
      expect(c.read(appLockedProvider), isFalse,
          reason: 'the return is the prompt closing, not the user coming back');
      expect(auth.prompts, 1, reason: 'no second prompt');
    });

    test('a real departure later still locks, even at "immediately"',
        () async {
      final auth = _FakeAuthenticator();
      final c = _container(auth);
      final lock = c.read(appLockedProvider.notifier);
      await lock.unlock(now: _at(0));
      lock.noteReturnedToForeground(at: _at(40));
      expect(c.read(appLockedProvider), isFalse);

      // Ten seconds later the user genuinely leaves and comes back.
      lock.noteLeftForeground(at: _at(10000));
      lock.noteReturnedToForeground(at: _at(10050));
      expect(c.read(appLockedProvider), isTrue);
    });

    test('a departure inside the settling window errs towards locking',
        () async {
      // If the user backgrounds Action within the settle window the departure
      // is not recorded, which leaves leftAt null — and null locks on the
      // next return. The mistake this design can make is locking once too
      // often, never once too rarely.
      final auth = _FakeAuthenticator();
      final c = _container(auth, delay: 'after_5m');
      final lock = c.read(appLockedProvider.notifier);
      await lock.unlock(now: _at(0));
      lock.noteReturnedToForeground(at: _at(30));

      lock.noteLeftForeground(at: _at(500)); // ignored: still settling
      lock.noteReturnedToForeground(at: _at(60000)); // a minute later
      expect(c.read(appLockedProvider), isTrue,
          reason: 'unknown departure time reads as a cold start');
    });

    test('the settling window is short', () {
      expect(AppLockedController.promptSettle,
          lessThanOrEqualTo(const Duration(seconds: 2)));
    });
  });

  group('a refused unlock', () {
    test('stays locked and reports the refusal', () async {
      final auth = _FakeAuthenticator()..outcome = DeviceAuthOutcome.failed;
      final c = _container(auth);
      final lock = c.read(appLockedProvider.notifier);
      final outcome = await lock.unlock(now: _at(0));
      expect(outcome, DeviceAuthOutcome.failed);
      expect(c.read(appLockedProvider), isTrue);
      lock.noteReturnedToForeground(at: _at(40));
      expect(c.read(appLockedProvider), isTrue);
    });
  });

  group('turning App Lock on from Settings', () {
    test('the prompt that confirms it does not lock the app it just enabled',
        () async {
      final auth = _FakeAuthenticator();
      final c = _container(auth, enabled: false);
      final settings = c.read(protectionSettingsProvider.notifier);
      final lock = c.read(appLockedProvider.notifier);
      expect(c.read(appLockedProvider), isFalse);

      // The switch's prompt bounces the app out and back, like the other.
      // Real clock here: the Settings path stamps the prompt's close with
      // DateTime.now(), and the resume follows within the settle window.
      lock.noteLeftForeground();
      final result = await settings.setAppLock(true);
      expect(result, AppLockChangeResult.changed);
      lock.noteReturnedToForeground();

      expect(c.read(appLockedProvider), isFalse,
          reason: 'the user just proved who they are');
      expect(c.read(protectionSettingsProvider).appLockEnabled, isTrue);
    });
  });
}
