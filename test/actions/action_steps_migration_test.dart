import 'dart:io';

import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
// `isNotNull` exists in both drift and matcher; the test needs matcher's.
import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

/// The Day-8 → Day-9 upgrade, run against a database built in the *old*
/// shape rather than a mock of it.
///
/// This is the migration that matters most in the whole project so far: the
/// rows it touches are commitments a person confirmed, and the one repair
/// this store is never allowed to make is dropping them to fix a schema.
class _V1Database extends GeneratedDatabase {
  _V1Database(super.e);

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables => const [];

  @override
  int get schemaVersion => 1;

  // Drift stamps user_version = 1 on create; the v1 tables are then written
  // by hand, exactly as Day 8 shipped them.
  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async {});
}

const _v1Actions = 'CREATE TABLE "actions" ('
    '"id" TEXT NOT NULL, "schema_version" INTEGER NOT NULL, '
    '"source_id" TEXT NULL, "title" TEXT NOT NULL, "summary" TEXT NULL, '
    '"status" TEXT NOT NULL, "urgency" TEXT NOT NULL, '
    '"category" TEXT NOT NULL, "due_at_wall" TEXT NULL, '
    '"amount_minor_units" INTEGER NULL, "currency" TEXT NULL, '
    '"recommended_next_step" TEXT NULL, "why_this_matters" TEXT NULL, '
    '"origin" TEXT NOT NULL, "reviewed_at_micros" INTEGER NULL, '
    '"created_at_micros" INTEGER NOT NULL, '
    '"updated_at_micros" INTEGER NOT NULL, '
    '"completed_at_micros" INTEGER NULL, "archived_at_micros" INTEGER NULL, '
    'PRIMARY KEY ("id"))';

const _v1Steps = 'CREATE TABLE "action_steps" ('
    '"action_id" TEXT NOT NULL, "order_index" INTEGER NOT NULL, '
    '"title" TEXT NOT NULL, "description" TEXT NULL, '
    '"due_at_wall" TEXT NULL, PRIMARY KEY ("action_id", "order_index"))';

const _v1Facts = 'CREATE TABLE "action_facts" ('
    '"action_id" TEXT NOT NULL, "fact_key" TEXT NOT NULL, '
    '"label" TEXT NOT NULL, "value" TEXT NOT NULL, '
    '"edited_by_user" INTEGER NOT NULL CHECK ("edited_by_user" IN (0, 1)), '
    'PRIMARY KEY ("action_id", "fact_key"))';

const _v1Outbox = 'CREATE TABLE "sync_outbox" ('
    '"action_id" TEXT NOT NULL, "operation" TEXT NOT NULL, '
    '"attempts" INTEGER NOT NULL DEFAULT 0, '
    '"created_at_micros" INTEGER NOT NULL, '
    '"next_attempt_at_micros" INTEGER NOT NULL, '
    '"last_failure_class" TEXT NULL, PRIMARY KEY ("action_id"))';

void main() {
  late Directory dir;
  late File file;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('day9_migration');
    file = File('${dir.path}/actions.sqlite');
  });

  tearDown(() => dir.deleteSync(recursive: true));

  /// Builds a Day-8 database on disk with one Action and two steps.
  Future<void> writeV1({int actionCreatedAtMicros = 1000}) async {
    final legacy = _V1Database(NativeDatabase(file));
    for (final ddl in [_v1Actions, _v1Steps, _v1Facts, _v1Outbox]) {
      await legacy.customStatement(ddl);
    }
    await legacy.customStatement(
      'INSERT INTO actions (id, schema_version, title, status, urgency, '
      'category, origin, created_at_micros, updated_at_micros) '
      "VALUES ('a1', 1, 'Pay the Riverford Energy bill', 'active', "
      "'important', 'payment', 'extraction', ?, ?)",
      [actionCreatedAtMicros, actionCreatedAtMicros],
    );
    await legacy.customStatement(
      'INSERT INTO action_steps (action_id, order_index, title, description) '
      "VALUES ('a1', 0, 'Read the bill', 'the important part'), "
      "('a1', 1, 'Pay it', NULL)",
    );
    await legacy.close();
  }

  test('a Day-8 database upgrades in place, keeping every confirmed step',
      () async {
    await writeV1(actionCreatedAtMicros: 1000);

    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);
    final action = await DriftActionRepository(db).getById('a1');

    expect(action, isNotNull, reason: 'the Action itself must survive');
    final steps = action!.steps;
    expect(steps, hasLength(2), reason: 'no confirmed step may be dropped');
    expect(steps.map((s) => s.title), ['Read the bill', 'Pay it']);
    expect(steps.first.description, 'the important part');
    expect(steps.map((s) => s.order), [0, 1], reason: 'order is preserved');

    // A Day-8 database jumps straight to the current version, running every
    // intermediate step on the way.
    final version =
        await db.customSelect('PRAGMA user_version').getSingle();
    expect(version.data.values.single, 3);
  });

  test('a v1 database also gains the later tables on the way through',
      () async {
    await writeV1();
    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);

    // v1 -> v2 -> v3 in one open: the reminder table must exist afterwards.
    final tables = await db
        .customSelect("SELECT name FROM sqlite_master WHERE type = 'table'")
        .get();
    expect(
      tables.map((r) => r.data['name']),
      contains('action_reminders'),
    );
  });

  test('migrated steps gain stable, distinct identities', () async {
    await writeV1();
    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);

    final steps = (await DriftActionRepository(db).getById('a1'))!.steps;
    final ids = steps.map((s) => s.id).toList();
    expect(ids.toSet(), hasLength(2), reason: 'ids must be distinct');
    expect(ids.every((id) => id.isNotEmpty), isTrue);
    // Derived from the composite key the row already had, so re-running the
    // migration on a copy of the same database yields the same ids.
    expect(ids, ['a1:0', 'a1:1']);
  });

  test('steps that predate the chain start out incomplete', () async {
    await writeV1();
    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);

    final steps = (await DriftActionRepository(db).getById('a1'))!.steps;
    expect(steps.every((s) => !s.isCompleted), isTrue);
    expect(steps.every((s) => s.completedAt == null), isTrue);
  });

  test('a migrated step is dated from the Action it was confirmed with',
      () async {
    // The truthful answer for a row that never recorded its own creation.
    await writeV1(actionCreatedAtMicros: 1234567);
    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);

    final steps = (await DriftActionRepository(db).getById('a1'))!.steps;
    expect(
      steps.first.createdAt,
      DateTime.fromMicrosecondsSinceEpoch(1234567, isUtc: true),
    );
    expect(steps.first.updatedAt, steps.first.createdAt);
  });

  test('an orphaned step still migrates, dated from the migration itself',
      () async {
    await writeV1();
    final legacy = _V1Database(NativeDatabase(file));
    await legacy.customStatement(
      "INSERT INTO action_steps (action_id, order_index, title) "
      "VALUES ('gone', 0, 'step of a deleted action')",
    );
    await legacy.close();

    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);

    // No parent row to date it from, so the fallback applies rather than the
    // migration failing on a NOT NULL column.
    final row = await db
        .customSelect(
          "SELECT created_at_micros FROM action_steps WHERE action_id = 'gone'",
        )
        .getSingle();
    expect(
      row.data.values.single,
      testNow.toUtc().microsecondsSinceEpoch,
    );
  });

  test('the upgraded chain is immediately writable', () async {
    await writeV1();
    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);
    final repo = DriftActionRepository(db);

    // The new primary key has to actually work, not just exist.
    await repo.addStep('a1', sampleStep('s3', title: 'File the receipt'));
    await repo.setStepCompleted('a1:0', isCompleted: true, at: testNow);

    final steps = (await repo.getById('a1'))!.steps;
    expect(steps.map((s) => s.title),
        ['Read the bill', 'Pay it', 'File the receipt']);
    expect(steps.first.isCompleted, isTrue);
    expect(steps.first.completedAt, testNow);
  });

  test('opening an already-migrated database again changes nothing', () async {
    await writeV1();
    final first = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    await DriftActionRepository(first).getById('a1');
    await first.close();

    final second = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(second.close);
    final steps = (await DriftActionRepository(second).getById('a1'))!.steps;

    expect(steps, hasLength(2));
    expect(steps.map((s) => s.id), ['a1:0', 'a1:1']);
  });
}
