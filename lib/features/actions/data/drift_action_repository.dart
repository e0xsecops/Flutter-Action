import 'package:drift/drift.dart';

import '../../extraction/domain/extraction_schema.dart';
import '../../extraction/domain/money_value.dart';
import '../domain/action_item.dart';
import '../domain/action_repository.dart';
import 'actions_database.dart';

/// Drift-backed [ActionRepository] and [ActionSyncOutbox].
///
/// Every mutation runs in one transaction that also records the mirror
/// intent, so "the Action exists locally" and "the cloud owes an upsert" can
/// never disagree. The mirror itself runs elsewhere and strictly later.
class DriftActionRepository implements ActionRepository, ActionSyncOutbox {
  DriftActionRepository(this._db);

  final ActionsDatabase _db;

  static const _upsertOperation = 'upsert';

  // ------------------------------------------------------------- reading --

  @override
  Stream<List<ActionItem>> watchAll() {
    final query = _db.select(_db.actionsTable)
      ..orderBy([
        (t) => OrderingTerm.desc(t.createdAtMicros),
        (t) => OrderingTerm.asc(t.id),
      ]);
    // Steps and facts are re-read per emission. Emissions are keyed to the
    // actions table; children only change inside the same transactions that
    // touch their action, so a stale join is not possible.
    return query.watch().asyncMap(_hydrate);
  }

  Future<List<ActionItem>> _hydrate(List<ActionRow> rows) async {
    if (rows.isEmpty) return const [];
    final ids = [for (final r in rows) r.id];
    final steps = await (_db.select(_db.actionStepsTable)
          ..where((t) => t.actionId.isIn(ids))
          ..orderBy([(t) => OrderingTerm.asc(t.orderIndex)]))
        .get();
    final facts = await (_db.select(_db.actionFactsTable)
          ..where((t) => t.actionId.isIn(ids)))
        .get();

    final stepsByAction = <String, List<ActionStepItem>>{};
    for (final s in steps) {
      stepsByAction.putIfAbsent(s.actionId, () => []).add(_stepFromRow(s));
    }
    final factsByAction = <String, List<ActionFactItem>>{};
    for (final f in facts) {
      factsByAction.putIfAbsent(f.actionId, () => []).add(_factFromRow(f));
    }

    return [
      for (final row in rows)
        _fromRow(
          row,
          steps: stepsByAction[row.id] ?? const [],
          facts: factsByAction[row.id] ?? const [],
        ),
    ];
  }

  @override
  Future<ActionItem?> getById(String id) async {
    final row = await (_db.select(_db.actionsTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    final items = await _hydrate([row]);
    return items.single;
  }

  // ------------------------------------------------------------- writing --

  @override
  Future<bool> create(ActionItem item) {
    return _db.transaction(() async {
      final inserted = await _db.into(_db.actionsTable).insertReturningOrNull(
            _toRow(item),
            mode: InsertMode.insertOrIgnore,
          );
      // Null means the id already existed and the insert was ignored.
      // Nothing else may run in that case — a second tap must not touch the
      // steps, facts or outbox of the Action the first tap created.
      if (inserted == null) return false;

      for (final step in item.steps) {
        await _db.into(_db.actionStepsTable).insert(_stepToRow(item.id, step));
      }
      for (final fact in item.facts) {
        await _db.into(_db.actionFactsTable).insert(_factToRow(item.id, fact));
      }
      await _enqueueUpsert(item.id, item.updatedAt);
      return true;
    });
  }

  @override
  Future<void> update(ActionItem item) {
    return _db.transaction(() async {
      final changed = await (_db.update(_db.actionsTable)
            ..where((t) => t.id.equals(item.id)))
          .write(_toRow(item).toCompanion(false));
      if (changed == 0) return; // update never inserts
      await _enqueueUpsert(item.id, item.updatedAt);
    });
  }

  @override
  Future<void> complete(String id, {required DateTime at}) =>
      _setStatus(id, ActionStatus.completed, at,
          (c, micros) => c.copyWith(completedAtMicros: Value(micros)));

  @override
  Future<void> archive(String id, {required DateTime at}) =>
      _setStatus(id, ActionStatus.archived, at,
          (c, micros) => c.copyWith(archivedAtMicros: Value(micros)));

  Future<void> _setStatus(
    String id,
    ActionStatus status,
    DateTime at,
    ActionsTableCompanion Function(ActionsTableCompanion, int) stamp,
  ) {
    final micros = at.toUtc().microsecondsSinceEpoch;
    return _db.transaction(() async {
      final base = ActionsTableCompanion(
        status: Value(status.name),
        updatedAtMicros: Value(micros),
      );
      final changed = await (_db.update(_db.actionsTable)
            ..where((t) => t.id.equals(id)))
          .write(stamp(base, micros));
      if (changed == 0) return;
      await _enqueueUpsert(id, at);
    });
  }

  Future<void> _enqueueUpsert(String actionId, DateTime at) async {
    final micros = at.toUtc().microsecondsSinceEpoch;
    await _db.into(_db.syncOutboxTable).insert(
          SyncOutboxTableCompanion.insert(
            actionId: actionId,
            operation: _upsertOperation,
            createdAtMicros: micros,
            // A fresh local change is immediately due: reset any backoff a
            // previous failure left behind, since the payload it will carry
            // is new.
            nextAttemptAtMicros: micros,
          ),
          onConflict: DoUpdate(
            (old) => SyncOutboxTableCompanion(
              nextAttemptAtMicros: Value(micros),
            ),
          ),
        );
  }

  // -------------------------------------------------------------- outbox --

  @override
  Future<List<OutboxEntry>> duePending(DateTime now, {int limit = 10}) async {
    final rows = await (_db.select(_db.syncOutboxTable)
          ..where((t) => t.nextAttemptAtMicros
              .isSmallerOrEqualValue(now.toUtc().microsecondsSinceEpoch))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAtMicros)])
          ..limit(limit))
        .get();
    return [
      for (final r in rows)
        OutboxEntry(
          actionId: r.actionId,
          operation: r.operation,
          attempts: r.attempts,
          createdAt: _instantFromMicros(r.createdAtMicros),
          nextAttemptAt: _instantFromMicros(r.nextAttemptAtMicros),
          lastFailureClass: r.lastFailureClass,
        ),
    ];
  }

  @override
  Future<int> pendingCount() async {
    final count = _db.syncOutboxTable.actionId.count();
    final row = await (_db.selectOnly(_db.syncOutboxTable)..addColumns([count]))
        .getSingle();
    return row.read(count) ?? 0;
  }

  @override
  Future<void> markSynced(String actionId) =>
      (_db.delete(_db.syncOutboxTable)..where((t) => t.actionId.equals(actionId)))
          .go();

  @override
  Future<void> markFailure(
    String actionId, {
    required String failureClass,
    required DateTime nextAttemptAt,
  }) =>
      _db.customStatement(
        'UPDATE sync_outbox SET attempts = attempts + 1, '
        'last_failure_class = ?, next_attempt_at_micros = ? '
        'WHERE action_id = ?',
        [
          failureClass,
          nextAttemptAt.toUtc().microsecondsSinceEpoch,
          actionId,
        ],
      );

  // ------------------------------------------------------------- mapping --

  static DateTime _instantFromMicros(int micros) =>
      DateTime.fromMicrosecondsSinceEpoch(micros, isUtc: true);

  static ActionRow _toRow(ActionItem item) => ActionRow(
        id: item.id,
        schemaVersion: item.schemaVersion,
        sourceId: item.sourceId,
        title: item.title,
        summary: item.summary,
        status: item.status.name,
        urgency: item.urgency.name,
        category: item.category.name,
        dueAtWall: item.dueAt?.toStorage(),
        amountMinorUnits: item.amount?.amountMinor,
        currency: item.amount?.currencyCode,
        recommendedNextStep: item.recommendedNextStep,
        whyThisMatters: item.whyThisMatters,
        origin: item.origin.name,
        reviewedAtMicros: item.reviewedAt?.toUtc().microsecondsSinceEpoch,
        createdAtMicros: item.createdAt.toUtc().microsecondsSinceEpoch,
        updatedAtMicros: item.updatedAt.toUtc().microsecondsSinceEpoch,
        completedAtMicros: item.completedAt?.toUtc().microsecondsSinceEpoch,
        archivedAtMicros: item.archivedAt?.toUtc().microsecondsSinceEpoch,
      );

  static ActionItem _fromRow(
    ActionRow row, {
    required List<ActionStepItem> steps,
    required List<ActionFactItem> facts,
  }) {
    // Money re-enters through MoneyValue.fromJson, which re-validates the
    // currency; a corrupted row degrades to "no amount", never to a guess.
    final amount = (row.amountMinorUnits != null && row.currency != null)
        ? MoneyValue.fromJson({
            'amountMinor': row.amountMinorUnits,
            'currencyCode': row.currency,
          })
        : null;
    return ActionItem(
      id: row.id,
      schemaVersion: row.schemaVersion,
      sourceId: row.sourceId,
      title: row.title,
      summary: row.summary,
      status: ActionStatus.fromName(row.status),
      urgency: ActionUrgency.fromName(row.urgency),
      category: ActionCategory.fromName(row.category),
      dueAt: ActionDue.fromStorage(row.dueAtWall),
      amount: amount,
      recommendedNextStep: row.recommendedNextStep,
      whyThisMatters: row.whyThisMatters,
      origin: ActionOrigin.fromName(row.origin),
      reviewedAt: row.reviewedAtMicros == null
          ? null
          : _instantFromMicros(row.reviewedAtMicros!),
      createdAt: _instantFromMicros(row.createdAtMicros),
      updatedAt: _instantFromMicros(row.updatedAtMicros),
      completedAt: row.completedAtMicros == null
          ? null
          : _instantFromMicros(row.completedAtMicros!),
      archivedAt: row.archivedAtMicros == null
          ? null
          : _instantFromMicros(row.archivedAtMicros!),
      steps: steps,
      facts: facts,
    );
  }

  static ActionStepRow _stepToRow(String actionId, ActionStepItem step) =>
      ActionStepRow(
        actionId: actionId,
        orderIndex: step.order,
        title: step.title,
        description: step.description,
        dueAtWall: step.dueAt?.toStorage(),
      );

  static ActionStepItem _stepFromRow(ActionStepRow row) => ActionStepItem(
        title: row.title,
        order: row.orderIndex,
        description: row.description,
        dueAt: ActionDue.fromStorage(row.dueAtWall),
      );

  static ActionFactRow _factToRow(String actionId, ActionFactItem fact) =>
      ActionFactRow(
        actionId: actionId,
        factKey: fact.key,
        label: fact.label,
        value: fact.value,
        editedByUser: fact.editedByUser,
      );

  static ActionFactItem _factFromRow(ActionFactRow row) => ActionFactItem(
        key: row.factKey,
        label: row.label,
        value: row.value,
        editedByUser: row.editedByUser,
      );
}
