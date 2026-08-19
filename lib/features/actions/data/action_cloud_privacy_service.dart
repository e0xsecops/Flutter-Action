import 'package:cloud_firestore/cloud_firestore.dart';

/// Removing mirrored Actions from the cloud. Deletion only.
///
/// Deliberately a separate interface from [ActionCloudMirror] rather than
/// another method on it. The mirror is a one-way, best-effort *write* path,
/// and the single most valuable property it has is that it never reads remote
/// state back into the app. A delete method living next to `upsert` would be
/// one refactor away from someone adding `fetch` beside it and turning the
/// mirror into two-way sync. This interface can only destroy things.
abstract interface class ActionCloudPrivacyService {
  /// Deletes the mirror documents for [actionIds] under [uid].
  ///
  /// Returns the ids it could **not** delete — empty means everything the
  /// caller asked about is gone. Never throws: a privacy flow needs to know
  /// exactly what is left, not to be interrupted by the first network error.
  Future<Set<String>> deleteMirrored(String uid, Set<String> actionIds);
}

/// For tests and builds with no cloud configured.
class NoopActionCloudPrivacyService implements ActionCloudPrivacyService {
  const NoopActionCloudPrivacyService();

  @override
  Future<Set<String>> deleteMirrored(String uid, Set<String> actionIds) async =>
      const {};
}

class FirestoreActionCloudPrivacyService implements ActionCloudPrivacyService {
  FirestoreActionCloudPrivacyService({this._firestore});

  final FirebaseFirestore? _firestore;
  FirebaseFirestore get _instance => _firestore ?? FirebaseFirestore.instance;

  /// Firestore caps a write batch at 500 operations.
  static const _batchLimit = 500;

  @override
  Future<Set<String>> deleteMirrored(
    String uid,
    Set<String> actionIds,
  ) async {
    if (actionIds.isEmpty) return const {};

    final collection =
        _instance.collection('users').doc(uid).collection('actions');
    final remaining = <String>{};

    for (final chunk in _chunked(actionIds.toList(), _batchLimit)) {
      try {
        final batch = _instance.batch();
        for (final id in chunk) {
          batch.delete(collection.doc(id));
        }
        await batch.commit().timeout(const Duration(seconds: 20));
      } on Object {
        // A batch is atomic, so a failure means none of this chunk went. The
        // rest of the chunks are still attempted: partial progress is better
        // than none, and what is left is reported precisely.
        remaining.addAll(chunk);
      }
    }
    return remaining;
  }

  static Iterable<List<T>> _chunked<T>(List<T> items, int size) sync* {
    for (var i = 0; i < items.length; i += size) {
      yield items.sublist(i, i + size > items.length ? items.length : i + size);
    }
  }
}
