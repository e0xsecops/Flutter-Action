import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../domain/action_reminder.dart';
import '../domain/action_reminder_repository.dart';
import 'actions_database.dart';

/// Drift-backed reminder store.
///
/// Deliberately outbox-free, exactly like the Action Chain: reminders are
/// local-only, and the deployed Firestore rules reject any document carrying
/// them. Nothing in this file calls `_enqueueUpsert` or touches `sync_outbox`.
class DriftReminderRepository implements ActionReminderRepository {
  DriftReminderRepository(this._db, {String Function()? newId})
      : _newId = newId ?? const Uuid().v4;

  final ActionsDatabase _db;
  final String Function() _newId;

  @override
  Stream<List<ActionReminder>> watchForAction(String actionId) {
    final query = _db.select(_db.actionRemindersTable)
      ..where((t) => t.actionId.equals(actionId))
      ..where((t) => t.state.equals(ReminderState.cancelPending.name).not())
      ..orderBy([
        (t) => OrderingTerm.asc(t.scheduledAtMicros),
        (t) => OrderingTerm.asc(t.platformNotificationId),
      ]);
    return query.watch().map((rows) => rows.map(_fromRow).toList());
  }

  @override
  Future<ActionReminder?> getById(String id) async {
    final row = await (_db.select(_db.actionRemindersTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<List<ActionReminder>> forAction(String actionId) async {
    final rows = await (_db.select(_db.actionRemindersTable)
          ..where((t) => t.actionId.equals(actionId))
          ..orderBy([(t) => OrderingTerm.asc(t.scheduledAtMicros)]))
        .get();
    return rows.map(_fromRow).toList();
  }

  @override
  Future<ActionReminder?> createIntent({
    required String actionId,
    required DateTime scheduledAt,
    required String timeZoneId,
    required DateTime now,
  }) {
    return _db.transaction(() async {
      // The cap counts what the user can see: a row already on its way out
      // is not occupying a slot.
      final live = await (_db.select(_db.actionRemindersTable)
            ..where((t) => t.actionId.equals(actionId))
            ..where(
                (t) => t.state.equals(ReminderState.cancelPending.name).not()))
          .get();
      if (live.length >= maxRemindersPerAction) return null;

      final micros = now.toUtc().microsecondsSinceEpoch;
      // The platform id comes from SQLite's AUTOINCREMENT, so it is unique,
      // stable across restarts, and never recycled from a deleted reminder.
      final row = await _db.into(_db.actionRemindersTable).insertReturning(
            ActionRemindersTableCompanion.insert(
              id: _newId(),
              actionId: actionId,
              scheduledAtMicros: scheduledAt.toUtc().microsecondsSinceEpoch,
              timeZoneId: timeZoneId,
              state: ReminderState.pendingSchedule.name,
              createdAtMicros: micros,
              updatedAtMicros: micros,
            ),
          );
      return _fromRow(row);
    });
  }

  @override
  Future<ActionReminder?> reschedule(
    String id, {
    required DateTime scheduledAt,
    required String timeZoneId,
    required DateTime now,
  }) async {
    final existing = await getById(id);
    if (existing == null) return null;
    // Both identities survive, so the platform replaces one alarm instead of
    // gaining a second.
    await (_db.update(_db.actionRemindersTable)..where((t) => t.id.equals(id)))
        .write(ActionRemindersTableCompanion(
      scheduledAtMicros: Value(scheduledAt.toUtc().microsecondsSinceEpoch),
      timeZoneId: Value(timeZoneId),
      state: Value(ReminderState.pendingSchedule.name),
      updatedAtMicros: Value(now.toUtc().microsecondsSinceEpoch),
      lastFailureClass: const Value(null),
    ));
    return getById(id);
  }

  @override
  Future<void> markState(
    String id, {
    required ReminderState state,
    required DateTime now,
    String? failureClass,
  }) async {
    await (_db.update(_db.actionRemindersTable)..where((t) => t.id.equals(id)))
        .write(ActionRemindersTableCompanion(
      state: Value(state.name),
      updatedAtMicros: Value(now.toUtc().microsecondsSinceEpoch),
      lastFailureClass: Value(failureClass),
    ));
  }

  @override
  Future<void> requestCancel(String id, {required DateTime now}) =>
      markState(id, state: ReminderState.cancelPending, now: now);

  @override
  Future<void> finalizeCancel(String id) async {
    await (_db.delete(_db.actionRemindersTable)..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<List<ActionReminder>> needingReconciliation() async {
    final rows = await (_db.select(_db.actionRemindersTable)
          ..where((t) => t.state.isIn([
                ReminderState.pendingSchedule.name,
                ReminderState.cancelPending.name,
                ReminderState.scheduleFailed.name,
                ReminderState.needsPermission.name,
                ReminderState.scheduled.name,
              ]))
          ..orderBy([(t) => OrderingTerm.asc(t.scheduledAtMicros)]))
        .get();
    return rows.map(_fromRow).toList();
  }

  @override
  Future<List<ActionReminder>> requestCancelFutureFor(
    String actionId, {
    required DateTime now,
  }) async {
    final micros = now.toUtc().microsecondsSinceEpoch;
    final rows = await (_db.select(_db.actionRemindersTable)
          ..where((t) => t.actionId.equals(actionId))
          ..where((t) => t.scheduledAtMicros.isBiggerThanValue(micros))
          ..where(
              (t) => t.state.equals(ReminderState.cancelPending.name).not()))
        .get();
    for (final row in rows) {
      await requestCancel(row.id, now: now);
    }
    // Returned so the caller can tell the platform, and so a crash before
    // that leaves rows the reconciler will finish.
    return rows.map(_fromRow).toList();
  }

  static ActionReminder _fromRow(ActionReminderRow row) => ActionReminder(
        id: row.id,
        platformNotificationId: row.platformNotificationId,
        actionId: row.actionId,
        scheduledAt: DateTime.fromMicrosecondsSinceEpoch(
          row.scheduledAtMicros,
          isUtc: true,
        ),
        timeZoneId: row.timeZoneId,
        state: ReminderState.fromName(row.state),
        createdAt: DateTime.fromMicrosecondsSinceEpoch(
          row.createdAtMicros,
          isUtc: true,
        ),
        updatedAt: DateTime.fromMicrosecondsSinceEpoch(
          row.updatedAtMicros,
          isUtc: true,
        ),
        lastFailureClass: row.lastFailureClass,
      );
}
