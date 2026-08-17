import 'action_item.dart';

/// The durable Action store as the rest of the app sees it.
///
/// Local persistence is the source of truth: once [create] returns true, the
/// Action exists — no cloud outcome can revoke that. Implementations must be
/// atomic per call and idempotent on [create] (a stable id arriving twice is
/// one Action, not two).
abstract interface class ActionRepository {
  /// Every stored Action, newest first by creation; includes completed and
  /// archived — presentation decides what to show.
  Stream<List<ActionItem>> watchAll();

  Future<ActionItem?> getById(String id);

  /// Persists a new Action atomically (with its steps, facts, and a pending
  /// mirror-outbox entry). Returns false — changing nothing — when an Action
  /// with this id already exists, which is what makes a double-tapped
  /// confirm button harmless.
  Future<bool> create(ActionItem item);

  /// Replaces the stored Action's mutable state. Missing id is a no-op.
  Future<void> update(ActionItem item);

  Future<void> complete(String id, {required DateTime at});

  Future<void> archive(String id, {required DateTime at});
}

/// One pending cloud-mirror intent.
final class OutboxEntry {
  const OutboxEntry({
    required this.actionId,
    required this.operation,
    required this.attempts,
    required this.createdAt,
    required this.nextAttemptAt,
    this.lastFailureClass,
  });

  final String actionId;
  final String operation;
  final int attempts;
  final DateTime createdAt;
  final DateTime nextAttemptAt;

  /// A short machine word ('auth_unavailable', 'permission_denied', ...) —
  /// never message text, never content.
  final String? lastFailureClass;
}

/// Durable queue of mirror work. Backed by the same database and written in
/// the same transactions as the Actions it mirrors.
abstract interface class ActionSyncOutbox {
  /// Entries whose backoff has elapsed, oldest first, bounded by [limit].
  Future<List<OutboxEntry>> duePending(DateTime now, {int limit = 10});

  /// Count of everything still pending, due or not (developer-facing).
  Future<int> pendingCount();

  /// The mirror confirmed this Action; the intent is discharged.
  Future<void> markSynced(String actionId);

  /// The attempt failed; record the class and push the next attempt out.
  Future<void> markFailure(
    String actionId, {
    required String failureClass,
    required DateTime nextAttemptAt,
  });
}
