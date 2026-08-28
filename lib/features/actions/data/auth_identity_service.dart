import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/firebase/firebase_gate.dart';

/// Who owns the cloud mirror path — and nothing more.
///
/// Anonymous auth exists solely so mirrored Actions have a per-user path the
/// security rules can enforce. It is NOT an account: it is never shown to
/// the user, never promised as backup or cross-device sync, and losing the
/// installation loses the anonymous uid. Real account linking is a future,
/// deliberate feature.
///
/// Nothing may block on this: startup, Home, and local Action creation all
/// proceed whether or not an identity ever materialises.
abstract interface class AuthIdentityService {
  /// The current uid, signing in anonymously first if needed. Null when
  /// identity is unavailable (auth disabled in console, offline first run,
  /// platform failure) — callers record a safe failure class and move on.
  Future<String?> currentOrSignInUid();

  /// Short machine word describing the last failure, for the outbox and the
  /// console STOP gate ('operation-not-allowed' means anonymous sign-in is
  /// disabled in Firebase Console). Never message text.
  String? get lastFailureClass;
}

class FirebaseAuthIdentityService implements AuthIdentityService {
  FirebaseAuthIdentityService({this._auth, FirebaseGate? gate})
      : _gate = gate ?? FirebaseGate.open();

  final FirebaseAuth? _auth;
  FirebaseAuth get _instance => _auth ?? FirebaseAuth.instance;

  /// Since Day 16 Firebase comes up after the first frame, so the first
  /// sign-in of a launch can arrive before there is an app to sign in to.
  final FirebaseGate _gate;

  @override
  String? lastFailureClass;

  @override
  Future<String?> currentOrSignInUid() async {
    if (!await _gate.ready) {
      // Firebase never came up. That is the same answer as an outage, and
      // the outbox already knows what to do with it.
      lastFailureClass = 'firebase_unavailable';
      return null;
    }
    try {
      final existing = _instance.currentUser;
      if (existing != null) {
        lastFailureClass = null;
        return existing.uid;
      }
      final credential = await _instance.signInAnonymously();
      lastFailureClass = null;
      return credential.user?.uid;
    } on FirebaseAuthException catch (error) {
      lastFailureClass = error.code; // e.g. 'operation-not-allowed'
      return null;
    } on Object {
      lastFailureClass = 'auth_unavailable';
      return null;
    }
  }
}
