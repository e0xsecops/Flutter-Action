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

@DataClassName('ActionStepRow')
class ActionStepsTable extends Table {
  @override
  String get tableName => 'action_steps';

  TextColumn get actionId => text()();
  IntColumn get orderIndex => integer()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get dueAtWall => text().nullable()();

  @override
  Set<Column> get primaryKey => {actionId, orderIndex};
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
  tables: [ActionsTable, ActionStepsTable, ActionFactsTable, SyncOutboxTable],
)
class ActionsDatabase extends _$ActionsDatabase {
  ActionsDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          // v1 is the only schema today. When v2 arrives, its steps belong
          // here as explicit, additive migrations. Destructive recreation is
          // not an acceptable fallback for a table of user commitments —
          // an unknown future version fails loudly instead (see the
          // database-open error path in the providers).
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
