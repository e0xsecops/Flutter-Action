import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/firebase/firebase_gate.dart';

/// Asking the cloud what it still holds — **only ever to destroy it**.
///
/// Day 14 could delete every mirror document the device could still name, and
/// documented the hole that left: an Action lost locally before Day 14 — a
/// reinstall, a wiped database, a crash between the mirror write and the
/// local commit — leaves a document nothing on this device knows the id of.
/// "Delete all my data" could not reach it, because the architecture has no
/// remote reads at all.
///
/// This closes that, and it is deliberately the narrowest possible opening.
///
/// **Why this is not the start of sync.** [ActionCloudMirror] is write-only
/// and [ActionCloudPrivacyService] can only delete; the one thing neither can
/// do is find out what is up there. That gap was load-bearing — it is why no
/// remote state can ever flow into the app — so re-opening it needs a seam
/// that is useless for anything else. This interface returns *ids and nothing
/// else*: no titles, no payloads, no documents. Nothing it returns can
/// hydrate a screen, restore an Action, or influence Home, Search or triage,
/// because ids are all it has. A future refactor cannot quietly widen it into
/// a fetch without changing its signature and its name.
///
/// **When it may run.** During an explicit privacy deletion, or a deletion
/// retry finishing one. Never on a timer, never at startup, never to repair
/// missing local data, and never to make a claim about other devices.
abstract interface class CloudPrivacyInventory {
  /// Every mirrored Action document id under [uid].
  ///
  /// Returns `null` when the listing could not be performed at all — offline,
  /// unauthenticated, Firebase not up, permission refused. That is a
  /// different fact from an empty set, and the difference is the whole point:
  /// "there is nothing up there" licenses a claim of complete deletion, while
  /// "I could not look" must never be reported as one.
  Future<Set<String>?> listMirroredActionIds(String uid);
}

/// For tests and builds with no cloud configured.
///
/// Answers with the empty set rather than `null`: a build with no cloud has
/// genuinely nothing mirrored, which is a real answer and not a failure.
class NoopCloudPrivacyInventory implements CloudPrivacyInventory {
  const NoopCloudPrivacyInventory();

  @override
  Future<Set<String>?> listMirroredActionIds(String uid) async => const {};
}

class FirestoreCloudPrivacyInventory implements CloudPrivacyInventory {
  FirestoreCloudPrivacyInventory({this._firestore, FirebaseGate? gate})
      : _gate = gate ?? FirebaseGate.open();

  final FirebaseFirestore? _firestore;
  FirebaseFirestore get _instance => _firestore ?? FirebaseFirestore.instance;
  final FirebaseGate _gate;

  @override
  Future<Set<String>?> listMirroredActionIds(String uid) async {
    if (!await _gate.ready) return null;
    try {
      // Owner-scoped by construction: the collection lives under the uid, so
      // there is no query here that could reach another user's subtree even
      // if the rules allowed it. The deployed rule already permits this —
      // `allow read` covers listing, and `isOwner(uid)` depends only on the
      // path and the caller's auth, never on document contents, which is what
      // makes a whole-collection query decidable. **No rules change was
      // needed for this, and none was made.**
      final snapshot = await _instance
          .collection('users')
          .doc(uid)
          .collection('actions')
          // Ids are the entire payload this seam is allowed to see. Firestore
          // still bills a document read, but nothing beyond the id crosses
          // into this process.
          .get(const GetOptions(source: Source.server))
          .timeout(const Duration(seconds: 30));
      return {for (final doc in snapshot.docs) doc.id};
    } on Object {
      // Never throws. A privacy flow needs to know it could not look, so it
      // can say so.
      return null;
    }
  }
}
