/// App Lock: the policy, and the seam to the platform that enforces it.
///
/// **What Action knows about you, which is nothing.** The device authenticator
/// is asked one question — "is the owner present?" — and answers yes or no.
/// Action never receives a fingerprint, a face, a PIN or a pattern, never sees
/// the enrolment, and stores nothing derived from any of them. That is not a
/// design choice this app could get wrong even if it wanted to: the biometric
/// never leaves the secure hardware, and the OS returns a boolean.
///
/// **Why the policy is pure.** Whether the app should be locked right now is a
/// question about an enabled flag, a timestamp and a grace period. It has
/// nothing to do with biometrics, and the interesting cases — the exact
/// boundary, a cold start, a clock that went backwards — are miserable to
/// provoke on a device and trivial to provoke against a function. So the
/// decision lives in [AppLockPolicy] with no platform behind it, and the
/// platform lives behind [DeviceAuthenticator] with no decision in it.
library;

/// How long Action may be away before it locks again.
///
/// Three options, not a slider. A lock that re-arms at a duration the user
/// picked to the second is a setting nobody tunes and everybody has to read.
enum AppLockDelay {
  /// Every time Action leaves the foreground.
  immediately,

  /// Enough to answer a message and come back.
  afterOneMinute,

  /// Enough to take a call.
  afterFiveMinutes,
}

Duration graceOf(AppLockDelay delay) => switch (delay) {
      AppLockDelay.immediately => Duration.zero,
      AppLockDelay.afterOneMinute => const Duration(minutes: 1),
      AppLockDelay.afterFiveMinutes => const Duration(minutes: 5),
    };

String describeAppLockDelay(AppLockDelay delay) => switch (delay) {
      AppLockDelay.immediately => 'Immediately',
      AppLockDelay.afterOneMinute => 'After 1 minute',
      AppLockDelay.afterFiveMinutes => 'After 5 minutes',
    };

/// The stable id persisted for [AppLockDelay]. Never `name`, so renaming an
/// enum value cannot silently reset someone's setting.
String appLockDelayId(AppLockDelay delay) => switch (delay) {
      AppLockDelay.immediately => 'immediate',
      AppLockDelay.afterOneMinute => 'after_1m',
      AppLockDelay.afterFiveMinutes => 'after_5m',
    };

AppLockDelay appLockDelayFromId(String? id) => switch (id) {
      'after_1m' => AppLockDelay.afterOneMinute,
      'after_5m' => AppLockDelay.afterFiveMinutes,
      // Including null and anything unrecognised. The safest of the three is
      // the right answer for a value we cannot read.
      _ => AppLockDelay.immediately,
    };

abstract final class AppLockPolicy {
  /// Whether Action should be locked, given when it was last left.
  ///
  /// [leftAt] is null when the app has just started, which is deliberately
  /// treated as "lock". A cold start is the case App Lock most obviously
  /// exists for — someone picking up a phone that was already unlocked — and
  /// defaulting the unknown case to unlocked would be exactly wrong.
  static bool shouldLock({
    required bool enabled,
    required AppLockDelay delay,
    required DateTime? leftAt,
    required DateTime now,
  }) {
    if (!enabled) return false;
    if (leftAt == null) return true;

    final away = now.difference(leftAt);

    // A negative interval means the clock moved backwards while Action was in
    // the background — a timezone change, an NTP correction, or a user
    // adjusting it deliberately. Locking is the conservative reading, and the
    // deliberate case is also the one worth being conservative about.
    if (away.isNegative) return true;

    return away >= graceOf(delay);
  }
}

/// What came back from the device.
enum DeviceAuthOutcome {
  /// The OS confirmed the owner.
  succeeded,

  /// The OS said no — wrong credential, too many attempts, or the user backed
  /// out. Action does not distinguish these, because it is not told enough to
  /// distinguish them honestly and each retry is the OS's business.
  failed,

  /// There is no screen lock set up, no enrolled biometric, or the hardware is
  /// unavailable. Distinct from [failed] because it is not the user's fault
  /// and the remedy is somewhere else entirely.
  unavailable,
}

/// The seam to whatever the platform uses to confirm the owner is present.
abstract interface class DeviceAuthenticator {
  /// Whether this device can be asked at all.
  ///
  /// False when there is no device credential set. App Lock must not be
  /// offered in that state: enabling it would lock the user out of their own
  /// data with no way back in.
  Future<bool> isAvailable();

  /// Asks. [reason] is shown by the OS in its own dialog.
  Future<DeviceAuthOutcome> authenticate(String reason);
}

/// Used where no platform is present — tests, and any host without a
/// device-credential API.
///
/// Reports unavailable rather than succeeding. A stub that returned
/// [DeviceAuthOutcome.succeeded] would make App Lock look enabled while
/// protecting nothing, which is worse than not offering it.
class UnavailableAuthenticator implements DeviceAuthenticator {
  const UnavailableAuthenticator();

  @override
  Future<bool> isAvailable() async => false;

  @override
  Future<DeviceAuthOutcome> authenticate(String reason) async =>
      DeviceAuthOutcome.unavailable;
}
