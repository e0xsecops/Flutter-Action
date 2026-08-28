import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/firebase/firebase_gate.dart';

import '../domain/action_item.dart';

/// What one mirrored Action looks like in the cloud — and the complete list
/// of what does not go there.
///
/// The mirror exists for future recovery, so it carries the minimum record
/// of a commitment: identity, lifecycle, deadline, amount, suggested step.
/// **Deliberately absent**, and enforced by test:
///
///  * `sourceId` and anything about the capture — the source is a separate
///    privacy domain and stays on the device;
///  * `summary` and `whyThisMatters` — prose derived from document content,
///    local-only by default (less cloud data wins);
///  * steps and facts — reference numbers, organisations and step text stay
///    local until a deliberate future sync design;
///  * OCR text, evidence quotes, provider output, images, tokens, logs.
///
/// Deadlines travel as the same zone-free wall-clock text the local store
/// uses; instants as ISO-8601 UTC strings. Document id == Action id, which
/// is what makes retries idempotent.
Map<String, Object?> cloudPayloadFor(ActionItem item) => {
      'schemaVersion': item.schemaVersion,
      'id': item.id,
      'title': item.title,
      'status': item.status.name,
      'urgency': item.urgency.name,
      'category': item.category.name,
      'due': item.dueAt?.toStorage(),
      'dueIsDateOnly': item.dueAt?.isDateOnly,
      'amountMinorUnits': item.amount?.amountMinor,
      'currency': item.amount?.currencyCode,
      'recommendedNextStep': item.recommendedNextStep,
      'origin': item.origin.name,
      'createdAt': item.createdAt.toUtc().toIso8601String(),
      'updatedAt': item.updatedAt.toUtc().toIso8601String(),
      'completedAt': item.completedAt?.toUtc().toIso8601String(),
      'archivedAt': item.archivedAt?.toUtc().toIso8601String(),
    };

/// Thrown by a mirror with an already-classified failure word.
class CloudMirrorException implements Exception {
  const CloudMirrorException(this.failureClass);

  /// 'permission_denied', 'unavailable', 'not_found', 'mirror_failed' —
  /// machine words only.
  final String failureClass;

  @override
  String toString() => 'CloudMirrorException($failureClass)';
}

/// The one-way, best-effort cloud mirror. Local is authoritative; this
/// never reads remote state back and never participates in local
/// transactions.
abstract interface class ActionCloudMirror {
  /// Idempotently writes the Action's mirror document for [uid]. Throws
  /// [CloudMirrorException] on failure; throwing NEVER affects local data.
  Future<void> upsert(String uid, ActionItem item);
}

/// For tests and for builds where no cloud is configured.
class NoopActionCloudMirror implements ActionCloudMirror {
  const NoopActionCloudMirror();

  @override
  Future<void> upsert(String uid, ActionItem item) async {}
}

class FirestoreActionCloudMirror implements ActionCloudMirror {
  FirestoreActionCloudMirror({this._firestore, FirebaseGate? gate})
      : _gate = gate ?? FirebaseGate.open();

  final FirebaseFirestore? _firestore;
  FirebaseFirestore get _instance => _firestore ?? FirebaseFirestore.instance;
  final FirebaseGate _gate;

  @override
  Future<void> upsert(String uid, ActionItem item) async {
    // Reported as an ordinary transport failure, so the outbox retries with
    // its normal backoff instead of losing the row.
    if (!await _gate.ready) throw const CloudMirrorException('unavailable');
    try {
      // set() on a caller-chosen document id: the retry of an upsert lands
      // on the same document. Firestore auto-ids would mint duplicates.
      await _instance
          .collection('users')
          .doc(uid)
          .collection('actions')
          .doc(item.id)
          .set(cloudPayloadFor(item))
          .timeout(const Duration(seconds: 20));
    } on FirebaseException catch (error) {
      throw CloudMirrorException(switch (error.code) {
        'permission-denied' => 'permission_denied',
        'unavailable' => 'unavailable',
        'not-found' => 'not_found',
        'unauthenticated' => 'unauthenticated',
        _ => 'mirror_failed',
      });
    } on Object {
      throw const CloudMirrorException('mirror_failed');
    }
  }
}
