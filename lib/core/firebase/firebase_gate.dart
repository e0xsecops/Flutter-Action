import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Firebase's readiness, as something a caller can wait on.
///
/// Day 16 measured `Firebase.initializeApp` at 388–567 ms of a 451–611 ms
/// pre-first-frame window on the API-36 emulator — between 85% and 93% of
/// everything the app did before it could draw. Not one pixel of the inbox
/// depends on it: Actions, steps, reminders and search are all local. So
/// initialisation was moved off the startup path and started in the
/// background instead.
///
/// This gate is what makes that safe. "Started but not finished" stops being
/// a race nobody declared and becomes a state with a name, which every seam
/// that genuinely touches Firebase waits on before its first call. The gate
/// is deliberately the *only* new coupling: nothing local knows it exists.
class FirebaseGate {
  const FirebaseGate(this._ready);

  /// An already-open gate.
  ///
  /// The default everywhere Firebase is not part of the picture — every test
  /// with a fake identity or a no-op mirror, and any build with no cloud
  /// configured. Awaiting it costs a microtask and changes no behaviour.
  FirebaseGate.open() : _ready = Future<bool>.value(true);

  final Future<bool> _ready;

  /// Completes `true` when Firebase came up and `false` when it did not.
  ///
  /// **Never throws, and never times out.** A device that cannot reach
  /// Firebase has to keep working, so a failure is a value the caller
  /// branches on rather than an error that propagates into a sync pass. The
  /// callers that consult it already have a defined answer for "no cloud
  /// right now" — an outbox row with a backoff, a pending deletion kept for
  /// next launch — and this simply lets them reach it honestly instead of
  /// through a `[core/no-app]` exception.
  Future<bool> get ready => _ready;
}

/// The app's gate. Overridden in `main` with the real initialisation; the
/// default is open so every test and every widget that never touches the
/// cloud behaves exactly as it did before Day 16.
final firebaseGateProvider = Provider<FirebaseGate>((ref) => FirebaseGate.open());
