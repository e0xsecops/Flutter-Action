import 'dart:io';

import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/extraction/domain/money_value.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

/// The durable store, tested the way it will be trusted: real SQLite, real
/// transactions, and a real file when the claim under test is "survives a
/// dead process".
void main() {
  late ActionsDatabase db;
  late DriftActionRepository repo;

  setUp(() {
    db = memoryDatabase();
    repo = DriftActionRepository(db);
  });

  tearDown(() async => db.close());

  group('create', () {
    test('persists the full record and returns true', () async {
      final due = ActionDue(DateTime(2026, 8, 30));
      final created = await repo.create(sampleAction(
        'a1',
        dueAt: due,
        amount: gbp('96.40'),
        steps: [
          sampleStep('s1', title: 'Pay it', order: 0),
          sampleStep('s2', title: 'File the receipt', order: 1),
        ],
        facts: const [
          ActionFactItem(
            key: 'reference',
            label: 'Account',
            value: '88-2043-11',
            editedByUser: false,
          ),
        ],
      ));

      expect(created, isTrue);
      final stored = (await repo.getById('a1'))!;
      expect(stored.title, 'Action a1');
      expect(stored.schemaVersion, actionSchemaVersion);
      expect(stored.sourceId, 'src-1');
      expect(stored.status, ActionStatus.active);
      expect(stored.dueAt, due);
      expect(stored.dueAt!.isDateOnly, isTrue);
      expect('${stored.amount}', '96.40 GBP');
      expect(stored.steps.map((s) => s.title), ['Pay it', 'File the receipt']);
      expect(stored.facts.single.value, '88-2043-11');
      expect(stored.origin, ActionOrigin.extraction);
    });

    test('the same id twice is one Action — second create is a no-op', () async {
      expect(await repo.create(sampleAction('a1', title: 'First')), isTrue);
      expect(await repo.create(sampleAction('a1', title: 'Second')), isFalse);

      final all = await repo.watchAll().first;
      expect(all, hasLength(1));
      expect(all.single.title, 'First');
      // And the outbox holds exactly one pending upsert, not two.
      expect(await repo.pendingCount(), 1);
    });

    test('a manual Action needs no sourceId', () async {
      await repo.create(sampleAction(
        'm1',
        sourceId: null,
        origin: ActionOrigin.manual,
      ));
      final stored = (await repo.getById('m1'))!;
      expect(stored.sourceId, isNull);
      expect(stored.origin, ActionOrigin.manual);
    });

    test('null deadline and null amount are reviewed absences that persist',
        () async {
      await repo.create(sampleAction('a1'));
      final stored = (await repo.getById('a1'))!;
      expect(stored.dueAt, isNull);
      expect(stored.amount, isNull);
    });
  });

  group('round-trips', () {
    test('a date-only deadline survives storage exactly', () async {
      await repo.create(
          sampleAction('a1', dueAt: ActionDue(DateTime(2026, 12, 31))));
      final stored = (await repo.getById('a1'))!;
      expect(stored.dueAt!.wallClock, DateTime(2026, 12, 31));
      expect(stored.dueAt!.isDateOnly, isTrue);
    });

    test('a timed deadline keeps its wall-clock time', () async {
      await repo.create(
          sampleAction('a1', dueAt: ActionDue(DateTime(2026, 10, 12, 9, 40))));
      final stored = (await repo.getById('a1'))!;
      expect(stored.dueAt!.wallClock, DateTime(2026, 10, 12, 9, 40));
      expect(stored.dueAt!.isDateOnly, isFalse);
    });

    test('money round-trips as exact minor units, including 0- and 3-decimal '
        'currencies', () async {
      final jpy = (MoneyValue.parse('1200', 'JPY') as MoneyParsed).value;
      final bhd = (MoneyValue.parse('12.345', 'BHD') as MoneyParsed).value;
      await repo.create(sampleAction('a1', amount: jpy));
      await repo.create(sampleAction('a2', amount: bhd));

      expect('${(await repo.getById('a1'))!.amount}', '1200 JPY');
      final storedBhd = (await repo.getById('a2'))!.amount!;
      expect(storedBhd.amountMinor, 12345);
      expect('$storedBhd', '12.345 BHD');
    });
  });

  group('lifecycle', () {
    test('complete stamps status and completedAt atomically', () async {
      await repo.create(sampleAction('a1'));
      final at = testNow.add(const Duration(hours: 2));
      await repo.complete('a1', at: at);

      final stored = (await repo.getById('a1'))!;
      expect(stored.status, ActionStatus.completed);
      expect(stored.completedAt, at);
      expect(stored.updatedAt, at);
    });

    test('archive is distinct from complete', () async {
      await repo.create(sampleAction('a1'));
      final at = testNow.add(const Duration(hours: 3));
      await repo.archive('a1', at: at);

      final stored = (await repo.getById('a1'))!;
      expect(stored.status, ActionStatus.archived);
      expect(stored.archivedAt, at);
      expect(stored.completedAt, isNull);
    });

    test('update replaces mutable state and never inserts', () async {
      await repo.create(sampleAction('a1'));
      final edited = sampleAction('a1', title: 'Edited')
          .copyWith(updatedAt: testNow.add(const Duration(minutes: 5)));
      await repo.update(edited);
      expect((await repo.getById('a1'))!.title, 'Edited');

      await repo.update(sampleAction('ghost'));
      expect(await repo.getById('ghost'), isNull);
    });

    test('lifecycle changes on a missing id are silent no-ops', () async {
      await repo.complete('missing', at: testNow);
      await repo.archive('missing', at: testNow);
      expect(await repo.watchAll().first, isEmpty);
    });
  });

  group('watching', () {
    test('watchAll orders newest creation first with a total tiebreak',
        () async {
      await repo.create(sampleAction('b',
          createdAt: testNow.add(const Duration(minutes: 1))));
      await repo.create(sampleAction('a',
          createdAt: testNow.add(const Duration(minutes: 1))));
      await repo.create(sampleAction('c', createdAt: testNow));

      final all = await repo.watchAll().first;
      expect(all.map((a) => a.id), ['a', 'b', 'c']);
    });

    test('the stream emits when an Action changes', () async {
      await repo.create(sampleAction('a1'));
      final emissions = <List<ActionItem>>[];
      final sub = repo.watchAll().listen(emissions.add);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await repo.complete('a1', at: testNow);
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await sub.cancel();

      expect(emissions.last.single.status, ActionStatus.completed);
    });
  });

  group('durability and corruption', () {
    test('Actions survive closing and reopening the database file — the '
        'process-death guarantee', () async {
      final dir = await Directory.systemTemp.createTemp('actions_db_test');
      final file = File('${dir.path}${Platform.pathSeparator}actions.db');
      addTearDown(() => dir.delete(recursive: true));

      final db1 = ActionsDatabase(NativeDatabase(file));
      final repo1 = DriftActionRepository(db1);
      await repo1.create(sampleAction('a1', amount: gbp('96.40')));
      await repo1.create(sampleAction('a2',
          dueAt: ActionDue(DateTime(2026, 8, 30)),
          createdAt: testNow.add(const Duration(minutes: 1))));
      await db1.close();

      // A brand-new connection — the old process is gone.
      final db2 = ActionsDatabase(NativeDatabase(file));
      final repo2 = DriftActionRepository(db2);
      final all = await repo2.watchAll().first;
      expect(all.map((a) => a.id), ['a2', 'a1']);
      expect('${all.last.amount}', '96.40 GBP');
      expect(all.first.dueAt!.wallClock, DateTime(2026, 8, 30));
      // Pending mirror intents survive the restart too.
      expect(await repo2.pendingCount(), 2);
      await db2.close();
    });

    test('a corrupted row degrades safely instead of crashing the list',
        () async {
      await repo.create(sampleAction('good'));
      // Sabotage: nonsense status, unsupported currency, malformed deadline.
      await db.customStatement(
        "INSERT INTO actions (id, schema_version, source_id, title, summary, "
        "status, urgency, category, due_at_wall, amount_minor_units, currency, "
        "recommended_next_step, why_this_matters, origin, reviewed_at_micros, "
        "created_at_micros, updated_at_micros, completed_at_micros, "
        "archived_at_micros) VALUES ('bad', 1, NULL, 'Corrupt row', NULL, "
        "'banana', 'mega', 'payment', 'not-a-date', 5000, 'ZZZ', NULL, NULL, "
        "'martian', NULL, 1, 1, NULL, NULL)",
      );

      final all = await repo.watchAll().first;
      expect(all, hasLength(2));
      final bad = all.singleWhere((a) => a.id == 'bad');
      // Every unreadable value degrades to its safest form; nothing throws
      // and nothing is invented.
      expect(bad.status, ActionStatus.active);
      expect(bad.urgency, ActionUrgency.unknown);
      expect(bad.dueAt, isNull);
      expect(bad.amount, isNull, reason: 'ZZZ is not a currency we trust');
      expect(bad.origin, ActionOrigin.manual);
    });

    test('fresh database initialises at the current schema version', () async {
      await repo.create(sampleAction('a1'));
      final row = await db.customSelect('PRAGMA user_version').getSingle();
      expect(row.data.values.single, 3,
          reason: 'Day 9 added the chain columns, Day 10 the reminder table');
    });

    test('the mirrored Action schema version is NOT the database version',
        () async {
      // The deployed Firestore rules pin `schemaVersion == 1`. Day 9 changed
      // only local tables, so bumping the record version would start failing
      // every mirror write for no reason.
      await repo.create(sampleAction('a1'));
      expect(actionSchemaVersion, 1);
      expect((await repo.getById('a1'))!.schemaVersion, 1);
    });
  });

  group('outbox', () {
    test('every mutation leaves exactly one pending upsert per Action',
        () async {
      await repo.create(sampleAction('a1'));
      await repo.complete('a1', at: testNow.add(const Duration(minutes: 1)));
      expect(await repo.pendingCount(), 1);

      final due = await repo.duePending(testNow.add(const Duration(hours: 1)));
      expect(due.single.actionId, 'a1');
      expect(due.single.operation, 'upsert');
    });

    test('markFailure backs off and preserves the entry; markSynced clears it',
        () async {
      await repo.create(sampleAction('a1'));
      final later = testNow.add(const Duration(minutes: 30));
      await repo.markFailure('a1',
          failureClass: 'auth_unavailable', nextAttemptAt: later);

      expect(await repo.duePending(testNow), isEmpty,
          reason: 'backed off entries are not due yet');
      final due = await repo.duePending(later);
      expect(due.single.attempts, 1);
      expect(due.single.lastFailureClass, 'auth_unavailable');

      await repo.markSynced('a1');
      expect(await repo.pendingCount(), 0);
    });

    test('a new local change makes a backed-off entry immediately due again',
        () async {
      await repo.create(sampleAction('a1'));
      await repo.markFailure('a1',
          failureClass: 'unavailable',
          nextAttemptAt: testNow.add(const Duration(hours: 1)));
      expect(await repo.duePending(testNow), isEmpty);

      await repo.complete('a1', at: testNow);
      expect((await repo.duePending(testNow)).single.actionId, 'a1');
    });
  });
}
