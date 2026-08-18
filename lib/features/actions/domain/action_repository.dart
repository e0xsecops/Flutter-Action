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

  /// One Action and its chain, re-emitted on every durable change. Emits null
  /// when the id does not exist (or stops existing), so a detail screen can
  /// show a real not-found state instead of hanging on an empty stream.
  Stream<ActionItem?> watchById(String id);

  /// Persists a new Action atomically (with its steps, facts, and a pending
  /// mirror-outbox entry). Returns false — changing nothing — when an Action
  /// with this id already exists, which is what makes a double-tapped
  /// confirm button harmless.
  Future<bool> create(ActionItem item);

  /// Replaces the stored Action's mutable state. Missing id is a no-op.
  Future<void> update(ActionItem item);

  Future<void> complete(String id, {required DateTime at});

  /// Back to active, clearing the completion stamp. Step history is left
  /// exactly as it was: reopening an Action is not a claim that the work
  /// already done was undone.
  Future<void> reopen(String id, {required DateTime at});

  Future<void> archive(String id, {required DateTime at});
}

/// The Action Chain store.
///
/// Deliberately a separate interface from [ActionRepository], because these
/// operations have a different contract: **steps are local-only**. None of
/// them enqueues a cloud-mirror upsert, because the Day-8 mirror payload does
/// not carry steps and the deployed Firestore rules reject any document that
/// does. Splitting the interface makes that boundary something you have to
/// cross deliberately rather than something you can forget.
abstract interface class ActionStepRepository {
  /// Appends a step to the end of the chain. The step's id is its identity;
  /// its order is assigned from the current chain length.
  Future<void> addStep(String actionId, ActionStepItem step);

  /// Applies a step's user-editable content (title, description). Missing id
  /// is a no-op.
  Future<void> updateStep(ActionStepItem step, {required DateTime at});

  /// Checks or unchecks a step. Completing stamps [at]; reopening clears the
  /// stamp rather than leaving a time that no longer means anything.
  Future<void> setStepCompleted(
    String stepId, {
    required bool isCompleted,
    required DateTime at,
  });

  Future<void> deleteStep(String stepId, {required DateTime at});

  /// Rewrites the whole chain's positions to match [orderedStepIds], densely
  /// from zero, in one transaction. Ids not belonging to [actionId] are
  /// ignored; ids omitted from the list keep their relative order after the
  /// listed ones, so a partial list can never silently drop a step.
  Future<void> reorderSteps(
    String actionId,
    List<String> orderedStepIds, {
    required DateTime at,
  });
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
