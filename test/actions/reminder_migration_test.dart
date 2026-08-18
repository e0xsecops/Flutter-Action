import 'dart:io';

import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/data/drift_reminder_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
// `isNotNull` exists in both drift and matcher; the test needs matcher's.
import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

/// The Day-9 → Day-10 upgrade, run against a database built in the *old*
/// shape. Adding reminders must not cost a single Action, step or fact.
class _V2Database extends GeneratedDatabase {
  _V2Database(super.e);

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables => const [];

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async {});
}

const _v2Actions = 'CREATE TABLE "actions" ('
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

/// The Day-9 shape: stable id primary key, completion, timestamps.
const _v2Steps = 'CREATE TABLE "action_steps" ('
    '"id" TEXT NOT NULL, "action_id" TEXT NOT NULL, '
    '"order_index" INTEGER NOT NULL, "title" TEXT NOT NULL, '
    '"description" TEXT NULL, "due_at_wall" TEXT NULL, '
    '"is_completed" INTEGER NOT NULL DEFAULT 0 '
    'CHECK ("is_completed" IN (0, 1)), '
    '"completed_at_micros" INTEGER NULL, '
    '"created_at_micros" INTEGER NOT NULL, '
    '"updated_at_micros" INTEGER NOT NULL, PRIMARY KEY ("id"))';

const _v2Facts = 'CREATE TABLE "action_facts" ('
    '"action_id" TEXT NOT NULL, "fact_key" TEXT NOT NULL, '
    '"label" TEXT NOT NULL, "value" TEXT NOT NULL, '
    '"edited_by_user" INTEGER NOT NULL CHECK ("edited_by_user" IN (0, 1)), '
    'PRIMARY KEY ("action_id", "fact_key"))';

const _v2Outbox = 'CREATE TABLE "sync_outbox" ('
    '"action_id" TEXT NOT NULL, "operation" TEXT NOT NULL, '
    '"attempts" INTEGER NOT NULL DEFAULT 0, '
    '"created_at_micros" INTEGER NOT NULL, '
    '"next_attempt_at_micros" INTEGER NOT NULL, '
    '"last_failure_class" TEXT NULL, PRIMARY KEY ("action_id"))';

void main() {
  late Directory dir;
  late File file;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('day10_migration');
    file = File('${dir.path}/actions.sqlite');
  });

  tearDown(() => dir.deleteSync(recursive: true));

  /// A Day-9 database with an Action, two steps (one done), a fact, and a
  /// pending mirror intent.
  Future<void> writeV2() async {
    final legacy = _V2Database(NativeDatabase(file));
    for (final ddl in [_v2Actions, _v2Steps, _v2Facts, _v2Outbox]) {
      await legacy.customStatement(ddl);
    }
    await legacy.customStatement(
      'INSERT INTO actions (id, schema_version, source_id, title, status, '
      'urgency, category, due_at_wall, amount_minor_units, currency, origin, '
      'created_at_micros, updated_at_micros) VALUES '
      "('a1', 1, 'src-1', 'Pay the Riverford Energy bill', 'active', "
      "'important', 'payment', '2026-08-30T00:00:00.000', 9640, 'GBP', "
      "'extraction', 1000, 1000)",
    );
    await legacy.customStatement(
      'INSERT INTO action_steps (id, action_id, order_index, title, '
      'is_completed, completed_at_micros, created_at_micros, '
      'updated_at_micros) VALUES '
      "('s1', 'a1', 0, 'Read the bill', 1, 2000, 1000, 2000), "
      "('s2', 'a1', 1, 'Pay it', 0, NULL, 1000, 1000)",
    );
    await legacy.customStatement(
      'INSERT INTO action_facts (action_id, fact_key, label, value, '
      "edited_by_user) VALUES ('a1', 'reference', 'Account', '88-2043-11', 0)",
    );
    await legacy.customStatement(
      'INSERT INTO sync_outbox (action_id, operation, attempts, '
      "created_at_micros, next_attempt_at_micros) VALUES ('a1', 'upsert', 2, "
      '1000, 5000)',
    );
    await legacy.close();
  }

  test('a Day-9 database gains reminders without losing anything', () async {
    await writeV2();

    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);
    final action = await DriftActionRepository(db).getById('a1');

    expect(action, isNotNull);
    expect(action!.title, 'Pay the Riverford Energy bill');
    expect(action.sourceId, 'src-1');
    expect(action.dueAt!.wallClock, DateTime(2026, 8, 30));
    expect(action.amount!.amountMinor, 9640);
    expect(action.amount!.currencyCode, 'GBP');
    expect(action.steps.map((s) => s.id), ['s1', 's2']);
    expect(action.steps.first.isCompleted, isTrue,
        reason: 'step completion must survive');
    expect(action.facts.single.value, '88-2043-11');

    final version = await db.customSelect('PRAGMA user_version').getSingle();
    expect(version.data.values.single, 3);
  });

  test('the pending cloud mirror intent survives untouched', () async {
    await writeV2();
    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);

    final row = await db
        .customSelect('SELECT attempts, next_attempt_at_micros FROM '
            "sync_outbox WHERE action_id = 'a1'")
        .getSingle();
    expect(row.data['attempts'], 2,
        reason: 'a schema change must not reset retry state');
    expect(row.data['next_attempt_at_micros'], 5000);
  });

  test('the reminder table is immediately usable after migrating', () async {
    await writeV2();
    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);

    final reminders = DriftReminderRepository(db);
    final made = await reminders.createIntent(
      actionId: 'a1',
      scheduledAt: testNow.add(const Duration(days: 1)),
      timeZoneId: 'Asia/Dhaka',
      now: testNow,
    );

    expect(made, isNotNull);
    expect(made!.platformNotificationId, greaterThan(0));
    expect((await reminders.forAction('a1')).single.id, made.id);
  });

  test('the mirrored payload version is untouched by a database upgrade',
      () async {
    // The deployed Firestore rules pin `schemaVersion == 1`. Local storage
    // moving to v3 must not touch that, or every mirror write starts failing.
    await writeV2();
    final db = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(db.close);

    expect(actionSchemaVersion, 1);
    expect((await DriftActionRepository(db).getById('a1'))!.schemaVersion, 1);
  });

  test('migrating twice is harmless', () async {
    await writeV2();
    final first = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    await DriftActionRepository(first).getById('a1');
    await first.close();

    final second = ActionsDatabase(NativeDatabase(file), clock: () => testNow);
    addTearDown(second.close);
    final action = await DriftActionRepository(second).getById('a1');

    expect(action!.steps, hasLength(2));
    final version =
        await second.customSelect('PRAGMA user_version').getSingle();
    expect(version.data.values.single, 3);
  });
}
