import 'package:drift/drift.dart';

part 'actions_database.g.dart';

/// The canonical Action store.
///
/// Day 4 taught this project what ad-hoc JSON does under power loss; the
/// durable Action record therefore lives in SQLite via Drift, with real
/// transactions and an explicit migration path. The capture-side JSON store
/// is deliberately untouched — migrating it today would be risk with no
/// Day-8 requirement behind it.
///
/// Representation decisions, made once and tested:
///
///  * **Instants** (createdAt, updatedAt, completedAt, archivedAt,
///    reviewedAt, outbox timestamps) are epoch **microseconds UTC** in
///    INTEGER columns — full precision, total ordering, no parsing.
///  * **Deadlines** are wall-clock ISO-8601 TEXT with no zone suffix (see
///    `ActionDue`): a confirmed "30 August 2026" must read back as that date
///    on every device in every timezone, which epoch encoding cannot
///    guarantee.
///  * **Money** is exact minor units INTEGER plus ISO-4217 TEXT, mirroring
///    `MoneyValue` — never floating point, never an inferred currency.
@DataClassName('ActionRow')
class ActionsTable extends Table {
  @override
  String get tableName => 'actions';

  TextColumn get id => text()();
  IntColumn get schemaVersion => integer()();
  TextColumn get sourceId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get summary => text().nullable()();
  TextColumn get status => text()();
  TextColumn get urgency => text()();
  TextColumn get category => text()();

  /// Wall-clock deadline, no timezone. Null = reviewed absence of deadline.
  TextColumn get dueAtWall => text().nullable()();

  IntColumn get amountMinorUnits => integer().nullable()();
  TextColumn get currency => text().nullable()();

  TextColumn get recommendedNextStep => text().nullable()();
  TextColumn get whyThisMatters => text().nullable()();
  TextColumn get origin => text()();

  IntColumn get reviewedAtMicros => integer().nullable()();
  IntColumn get createdAtMicros => integer()();
  IntColumn get updatedAtMicros => integer()();
  IntColumn get completedAtMicros => integer().nullable()();
  IntColumn get archivedAtMicros => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// The Action Chain: the ordered steps a person works through.
///
/// Day 8 stored steps as immutable confirmation output, keyed by
/// `(actionId, orderIndex)`. Day 9 makes them editable, checkable and
/// reorderable, and a position cannot be an identity for any of that: moving
/// a step would change which row "is" that step, and a completion would
/// follow the slot rather than the work. So the primary key is a stable
/// [id] minted at creation, and `orderIndex` becomes ordinary data.
@DataClassName('ActionStepRow')
class ActionStepsTable extends Table {
  @override
  String get tableName => 'action_steps';

  TextColumn get id => text()();
  TextColumn get actionId => text()();

  /// Dense rank within the Action, rewritten as a block on reorder. Integer
  /// on purpose: fractional positions drift toward precision loss after
  /// enough moves, and a dense rewrite of a handful of rows is cheap.
  IntColumn get orderIndex => integer()();

  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get dueAtWall => text().nullable()();

  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get completedAtMicros => integer().nullable()();
  IntColumn get createdAtMicros => integer()();
  IntColumn get updatedAtMicros => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ActionFactRow')
class ActionFactsTable extends Table {
  @override
  String get tableName => 'action_facts';

  TextColumn get actionId => text()();
  TextColumn get factKey => text()();
  TextColumn get label => text()();
  TextColumn get value => text()();
  BoolColumn get editedByUser => boolean()();

  @override
  Set<Column> get primaryKey => {actionId, factKey};
}

/// Reminders the user asked for, and what we know about the OS alarm behind
/// each one.
///
/// Two identities on purpose. [platformNotificationId] is an INTEGER PRIMARY
/// KEY AUTOINCREMENT because Android addresses notifications by int and
/// AUTOINCREMENT never reuses a value — a recycled id could cancel or replace
/// a stale notification belonging to a reminder the user already deleted.
/// [id] is the domain identity used everywhere else, so the two concerns
/// never get confused.
///
/// A reminder is an **absolute instant** plus the IANA zone it was chosen in.
/// The instant is what Android is told; the zone is kept so the choice can be
/// explained and re-derived later. Changing device timezone does not move an
/// already-agreed reminder.
@DataClassName('ActionReminderRow')
class ActionRemindersTable extends Table {
  @override
  String get tableName => 'action_reminders';

  IntColumn get platformNotificationId => integer().autoIncrement()();

  TextColumn get id => text().unique()();
  TextColumn get actionId => text()();

  /// The absolute moment, epoch microseconds UTC.
  IntColumn get scheduledAtMicros => integer()();

  /// IANA zone id in force when the user chose the time (e.g. 'Asia/Dhaka').
  TextColumn get timeZoneId => text()();

  TextColumn get state => text()();

  IntColumn get createdAtMicros => integer()();
  IntColumn get updatedAtMicros => integer()();

  /// A short machine word, never message text and never content.
  TextColumn get lastFailureClass => text().nullable()();
}

/// The sync outbox: which Actions still owe the cloud mirror an upsert.
///
/// One row per Action (the only Day-8 operation is upsert, and a newer local
/// state supersedes an older pending one, so rows collapse naturally).
/// Written in the SAME transaction as the Action mutation — local truth and
/// its pending mirror intent are atomic — and removed only after the mirror
/// write succeeds. Failure classes are short machine words, never content.
@DataClassName('SyncOutboxRow')
class SyncOutboxTable extends Table {
  @override
  String get tableName => 'sync_outbox';

  TextColumn get actionId => text()();
  TextColumn get operation => text()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  IntColumn get createdAtMicros => integer()();
  IntColumn get nextAttemptAtMicros => integer()();
  TextColumn get lastFailureClass => text().nullable()();

  @override
  Set<Column> get primaryKey => {actionId};
}

@DriftDatabase(
  tables: [
    ActionsTable,
    ActionStepsTable,
    ActionFactsTable,
    SyncOutboxTable,
    ActionRemindersTable,
  ],
)
class ActionsDatabase extends _$ActionsDatabase {
  ActionsDatabase(super.e, {DateTime Function()? clock})
      : _clock = clock ?? DateTime.now;

  /// Only the migration needs a clock, and only to stamp rows that predate
  /// the columns that record their own timestamps.
  final DateTime Function() _clock;

  /// v2 (Day 9) gave `action_steps` a stable primary key plus completion and
  /// timestamp columns. v3 (Day 10) added `action_reminders`.
  ///
  /// This is the *database* version and is deliberately independent of
  /// `actionSchemaVersion`, which describes the mirrored Action payload and
  /// stays at 1: steps and reminders are local-only, so nothing the cloud
  /// sees changed, and the deployed Firestore rules pin `schemaVersion == 1`.
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            // Rebuild action_steps in place, carrying every existing row
            // across. Destructive recreation is not an acceptable fallback
            // for a table of user commitments, so the old rows are
            // transformed, never dropped:
            //
            //  * `id` is derived from the composite key the row already had,
            //    so the value is stable and a re-run is idempotent.
            //  * steps confirmed before Day 9 were never checkable, so none
            //    of them is complete.
            //  * a step has no creation time of its own in v1; the Action it
            //    was confirmed with does, and that is the truthful answer.
            // `alterTable` takes no bound variables, so the fallback instant
            // is inlined — an integer this code computed itself, never input.
            final fallback = _clock().toUtc().microsecondsSinceEpoch;
            final bornWithItsAction = CustomExpression<int>(
              'COALESCE((SELECT created_at_micros FROM actions '
              'WHERE actions.id = action_steps.action_id), $fallback)',
            );
            await m.alterTable(
              TableMigration(
                actionStepsTable,
                newColumns: [
                  actionStepsTable.id,
                  actionStepsTable.isCompleted,
                  actionStepsTable.completedAtMicros,
                  actionStepsTable.createdAtMicros,
                  actionStepsTable.updatedAtMicros,
                ],
                columnTransformer: {
                  actionStepsTable.id: const CustomExpression<String>(
                    "action_steps.action_id || ':' || action_steps.order_index",
                  ),
                  actionStepsTable.isCompleted: const Constant(false),
                  actionStepsTable.completedAtMicros: const Constant(null),
                  actionStepsTable.createdAtMicros: bornWithItsAction,
                  actionStepsTable.updatedAtMicros: bornWithItsAction,
                },
              ),
            );
          }
          if (from < 3) {
            // Purely additive: a new table, and not one existing row is read,
            // rewritten or dropped to get it.
            await m.createTable(actionRemindersTable);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
