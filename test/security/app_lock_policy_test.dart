import 'package:action_app/core/security/device_lock.dart';
import 'package:action_app/features/actions/application/reminder_presentation.dart';
import 'package:flutter_test/flutter_test.dart';

final _now = DateTime.utc(2026, 9, 1, 12);

bool _lock({
  bool enabled = true,
  AppLockDelay delay = AppLockDelay.immediately,
  Duration? away,
  DateTime? leftAt,
}) =>
    AppLockPolicy.shouldLock(
      enabled: enabled,
      delay: delay,
      leftAt: leftAt ?? (away == null ? null : _now.subtract(away)),
      now: _now,
    );

void main() {
  group('when App Lock is off', () {
    test('nothing locks, whatever else is true', () {
      expect(_lock(enabled: false), isFalse);
      expect(_lock(enabled: false, away: const Duration(days: 7)), isFalse);
      expect(
        _lock(enabled: false, delay: AppLockDelay.immediately),
        isFalse,
      );
    });
  });

  group('a cold start', () {
    test('locks, because that is the case the feature is for', () {
      // Someone picking up a phone that is already unlocked. Defaulting the
      // unknown case to "open" would defeat the whole feature.
      expect(_lock(leftAt: null), isTrue);
    });

    test('locks regardless of the grace period chosen', () {
      for (final delay in AppLockDelay.values) {
        expect(_lock(delay: delay, leftAt: null), isTrue, reason: delay.name);
      }
    });
  });

  group('grace periods', () {
    test('immediately means any absence at all', () {
      expect(
        _lock(delay: AppLockDelay.immediately, away: Duration.zero),
        isTrue,
      );
      expect(
        _lock(delay: AppLockDelay.immediately, away: const Duration(seconds: 1)),
        isTrue,
      );
    });

    test('one minute holds through a shorter absence', () {
      expect(
        _lock(
          delay: AppLockDelay.afterOneMinute,
          away: const Duration(seconds: 59),
        ),
        isFalse,
      );
    });

    test('one minute locks at exactly one minute', () {
      // The boundary belongs to the lock. Ambiguity in a security control
      // should resolve toward the safer answer.
      expect(
        _lock(
          delay: AppLockDelay.afterOneMinute,
          away: const Duration(minutes: 1),
        ),
        isTrue,
      );
    });

    test('five minutes holds through four', () {
      expect(
        _lock(
          delay: AppLockDelay.afterFiveMinutes,
          away: const Duration(minutes: 4, seconds: 59),
        ),
        isFalse,
      );
      expect(
        _lock(
          delay: AppLockDelay.afterFiveMinutes,
          away: const Duration(minutes: 5),
        ),
        isTrue,
      );
    });

    test('a long absence locks under every setting', () {
      for (final delay in AppLockDelay.values) {
        expect(
          _lock(delay: delay, away: const Duration(hours: 9)),
          isTrue,
          reason: delay.name,
        );
      }
    });
  });

  group('a clock that moved', () {
    test('locks when the clock went backwards while Action was away', () {
      // A timezone change, an NTP correction, or someone setting the clock
      // back deliberately. The last of those is the reason to be conservative.
      expect(
        _lock(
          delay: AppLockDelay.afterFiveMinutes,
          leftAt: _now.add(const Duration(hours: 2)),
        ),
        isTrue,
      );
    });
  });

  group('grace durations', () {
    test('map to the values the labels promise', () {
      expect(graceOf(AppLockDelay.immediately), Duration.zero);
      expect(graceOf(AppLockDelay.afterOneMinute), const Duration(minutes: 1));
      expect(
        graceOf(AppLockDelay.afterFiveMinutes),
        const Duration(minutes: 5),
      );
    });

    test('every option has a label and no label is a duration in disguise', () {
      for (final delay in AppLockDelay.values) {
        expect(describeAppLockDelay(delay), isNotEmpty);
      }
    });
  });

  group('the persisted id', () {
    test('round-trips', () {
      for (final delay in AppLockDelay.values) {
        expect(appLockDelayFromId(appLockDelayId(delay)), delay);
      }
    });

    test('is not the enum name, so a rename cannot reset the setting', () {
      expect(appLockDelayId(AppLockDelay.afterOneMinute),
          isNot(AppLockDelay.afterOneMinute.name));
    });

    test('an unreadable value falls back to the safest option', () {
      expect(appLockDelayFromId(null), AppLockDelay.immediately);
      expect(appLockDelayFromId(''), AppLockDelay.immediately);
      expect(appLockDelayFromId('after_9000y'), AppLockDelay.immediately);
    });
  });

  group('the unavailable authenticator', () {
    test('reports unavailable rather than pretending to succeed', () async {
      const authenticator = UnavailableAuthenticator();

      expect(await authenticator.isAvailable(), isFalse);
      expect(
        await authenticator.authenticate('why'),
        DeviceAuthOutcome.unavailable,
      );
    });
  });

  group('what a reminder says out loud', () {
    test('normally, the Action title', () {
      expect(
        reminderBody('Renew the car insurance', private: false),
        'Renew the car insurance',
      );
    });

    test('in private mode, nothing about the Action', () {
      const title = 'Call the clinic about the results';
      final body = reminderBody(title, private: true);

      expect(body, privateReminderBody);
      // Not truncated, not blurred, not abbreviated. Replaced.
      expect(body, isNot(contains('clinic')));
      expect(body, isNot(contains('Call')));
    });

    test('an empty title falls back rather than showing a blank', () {
      expect(reminderBody('', private: false), privateReminderBody);
      expect(reminderBody('   ', private: false), privateReminderBody);
    });

    test('the private line still tells the user Action wants them', () {
      // A notification with no body reads as a bug.
      expect(privateReminderBody, isNotEmpty);
      expect(privateReminderBody.length, greaterThan(10));
    });

    test('titles are trimmed', () {
      expect(reminderBody('  Pay the bill  ', private: false), 'Pay the bill');
    });
  });
}
