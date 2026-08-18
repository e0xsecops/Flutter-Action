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
class DriftActionRepository
    implements ActionRepository, ActionStepRepository, ActionSyncOutbox {
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

  @override
  Stream<ActionItem?> watchById(String id) {
    // A detail screen must also react when only the CHAIN changed, and steps
    // live in their own table — watching a query over `actions` alone would
    // never fire for them. So the tables this stream depends on are declared
    // explicitly, and the projection carries a chain fingerprint so the
    // emission is distinguishable even if the Action row itself is untouched.
    return _db
        .customSelect(
          'SELECT a.id AS id, '
          '(SELECT COUNT(*) FROM action_steps s WHERE s.action_id = a.id) '
          'AS step_count, '
          '(SELECT COALESCE(MAX(s.updated_at_micros), 0) FROM action_steps s '
          'WHERE s.action_id = a.id) AS steps_touched_at '
          'FROM actions a WHERE a.id = ?',
          variables: [Variable<String>(id)],
          readsFrom: {
            _db.actionsTable,
            _db.actionStepsTable,
            _db.actionFactsTable,
          },
        )
        .watch()
        .asyncMap((rows) => rows.isEmpty ? null : getById(id));
  }

  Future<List<ActionItem>> _hydrate(List<ActionRow> rows) async {
    if (rows.isEmpty) return const [];
    final ids = [for (final r in rows) r.id];
    final steps = await (_db.select(_db.actionStepsTable)
          ..where((t) => t.actionId.isIn(ids))
          // Ties break on id so the chain has a total order even if two rows
          // somehow share a position.
          ..orderBy([
            (t) => OrderingTerm.asc(t.orderIndex),
            (t) => OrderingTerm.asc(t.id),
          ]))
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

  @override
  Future<void> reopen(String id, {required DateTime at}) =>
      // Clearing the stamp, not writing a new one: an Action that is active
      // again has no completion time. The chain is untouched — the steps that
      // were done stay done.
      _setStatus(id, ActionStatus.active, at,
          (c, _) => c.copyWith(completedAtMicros: const Value(null)));

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

  // --------------------------------------------------------- action chain --
  //
  // Every method below is deliberately outbox-free. Steps are local-only: the
  // Day-8 mirror payload does not carry them, and the deployed rules reject a
  // document that does. Enqueuing here would either upload nothing new or
  // start failing every write — so nothing here calls _enqueueUpsert.

  @override
  Future<void> addStep(String actionId, ActionStepItem step) {
    return _db.transaction(() async {
      final highest = _db.actionStepsTable.orderIndex.max();
      final row = await (_db.selectOnly(_db.actionStepsTable)
            ..addColumns([highest])
            ..where(_db.actionStepsTable.actionId.equals(actionId)))
          .getSingle();
      final next = (row.read(highest) ?? -1) + 1;
      await _db
          .into(_db.actionStepsTable)
          .insert(_stepToRow(actionId, step.copyWith(order: next)));
    });
  }

  @override
  Future<void> updateStep(ActionStepItem step, {required DateTime at}) async {
    await (_db.update(_db.actionStepsTable)
          ..where((t) => t.id.equals(step.id)))
        .write(
      ActionStepsTableCompanion(
        title: Value(step.title),
        description: Value(step.description),
        updatedAtMicros: Value(at.toUtc().microsecondsSinceEpoch),
      ),
    );
  }

  @override
  Future<void> setStepCompleted(
    String stepId, {
    required bool isCompleted,
    required DateTime at,
  }) async {
    final micros = at.toUtc().microsecondsSinceEpoch;
    await (_db.update(_db.actionStepsTable)..where((t) => t.id.equals(stepId)))
        .write(
      ActionStepsTableCompanion(
        isCompleted: Value(isCompleted),
        completedAtMicros: Value(isCompleted ? micros : null),
        updatedAtMicros: Value(micros),
      ),
    );
  }

  @override
  Future<void> deleteStep(String stepId, {required DateTime at}) async {
    // Positions are left with a gap rather than re-densified: ordering reads
    // tolerate gaps, and rewriting untouched rows would churn their
    // updatedAt for no user-visible reason.
    await (_db.delete(_db.actionStepsTable)..where((t) => t.id.equals(stepId)))
        .go();
  }

  @override
  Future<void> reorderSteps(
    String actionId,
    List<String> orderedStepIds, {
    required DateTime at,
  }) {
    return _db.transaction(() async {
      final rows = await (_db.select(_db.actionStepsTable)
            ..where((t) => t.actionId.equals(actionId))
            ..orderBy([
              (t) => OrderingTerm.asc(t.orderIndex),
              (t) => OrderingTerm.asc(t.id),
            ]))
          .get();
      final byId = {for (final r in rows) r.id: r};

      // The requested order first — ignoring ids that are not this Action's
      // and any repeat — then everything the caller left out, keeping its
      // existing relative order. A partial or stale list reorders what it
      // names and drops nothing.
      final ordered = <String>[];
      final placed = <String>{};
      for (final id in orderedStepIds) {
        if (byId.containsKey(id) && placed.add(id)) ordered.add(id);
      }
      for (final row in rows) {
        if (placed.add(row.id)) ordered.add(row.id);
      }

      final micros = at.toUtc().microsecondsSinceEpoch;
      for (var i = 0; i < ordered.length; i++) {
        if (byId[ordered[i]]!.orderIndex == i) continue;
        await (_db.update(_db.actionStepsTable)
              ..where((t) => t.id.equals(ordered[i])))
            .write(ActionStepsTableCompanion(
          orderIndex: Value(i),
          updatedAtMicros: Value(micros),
        ));
      }
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
        id: step.id,
        actionId: actionId,
        orderIndex: step.order,
        title: step.title,
        description: step.description,
        dueAtWall: step.dueAt?.toStorage(),
        isCompleted: step.isCompleted,
        completedAtMicros: step.completedAt?.toUtc().microsecondsSinceEpoch,
        createdAtMicros: step.createdAt.toUtc().microsecondsSinceEpoch,
        updatedAtMicros: step.updatedAt.toUtc().microsecondsSinceEpoch,
      );

  static ActionStepItem _stepFromRow(ActionStepRow row) => ActionStepItem(
        id: row.id,
        title: row.title,
        order: row.orderIndex,
        description: row.description,
        dueAt: ActionDue.fromStorage(row.dueAtWall),
        isCompleted: row.isCompleted,
        // A completion stamp only means anything while the step is complete;
        // a stale one on a reopened step would be a false timeline.
        completedAt: row.isCompleted && row.completedAtMicros != null
            ? _instantFromMicros(row.completedAtMicros!)
            : null,
        createdAt: _instantFromMicros(row.createdAtMicros),
        updatedAt: _instantFromMicros(row.updatedAtMicros),
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
