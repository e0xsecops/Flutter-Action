import 'dart:io';

import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

/// Durable Action Chain behaviour, against real SQLite.
///
/// Two properties matter most and are tested against a file rather than
/// memory: an order the user chose survives process death, and none of this
/// ever tells the cloud anything.
void main() {
  late ActionsDatabase db;
  late DriftActionRepository repo;

  setUp(() {
    db = memoryDatabase();
    repo = DriftActionRepository(db);
  });

  tearDown(() async => db.close());

  Future<List<ActionStepItem>> chain(String actionId) async =>
      (await repo.getById(actionId))!.steps;

  Future<void> seed({List<ActionStepItem> steps = const []}) =>
      repo.create(sampleAction('a1', steps: steps));

  group('adding', () {
    test('a step is appended to the end of the chain', () async {
      await seed(steps: [sampleStep('s1', title: 'First')]);
      await repo.addStep('a1', sampleStep('s2', title: 'Second'));

      final steps = await chain('a1');
      expect(steps.map((s) => s.title), ['First', 'Second']);
      expect(steps.map((s) => s.order), [0, 1]);
    });

    test('the first step of an empty chain lands at position zero', () async {
      await seed();
      await repo.addStep('a1', sampleStep('s1'));
      expect((await chain('a1')).single.order, 0);
    });

    test('a new step starts incomplete with no completion time', () async {
      await seed();
      await repo.addStep('a1', sampleStep('s1'));
      final step = (await chain('a1')).single;
      expect(step.isCompleted, isFalse);
      expect(step.completedAt, isNull);
    });

    test('appending ignores gaps and never collides with an existing row',
        () async {
      await seed(steps: [
        sampleStep('s1', order: 0),
        sampleStep('s9', order: 9),
      ]);
      await repo.addStep('a1', sampleStep('s10'));
      expect((await chain('a1')).last.order, 10);
    });

    test('steps of one Action do not affect another', () async {
      await seed(steps: [sampleStep('s1')]);
      await repo.create(sampleAction('a2'));
      await repo.addStep('a2', sampleStep('other'));

      expect(await chain('a1'), hasLength(1));
      expect((await chain('a2')).single.order, 0,
          reason: 'positions are per Action, not global');
    });
  });

  group('editing', () {
    test('a rename keeps the identity and stamps the edit', () async {
      await seed(steps: [sampleStep('s1', title: 'Old')]);
      final later = testNow.add(const Duration(hours: 3));
      await repo.updateStep(
        (await chain('a1')).single.copyWith(title: 'New'),
        at: later,
      );

      final step = (await chain('a1')).single;
      expect(step.id, 's1', reason: 'a rename is not a replacement');
      expect(step.title, 'New');
      expect(step.updatedAt, later);
      expect(step.createdAt, testNow, reason: 'creation time is not an edit');
    });

    test('editing a step that no longer exists changes nothing', () async {
      await seed(steps: [sampleStep('s1')]);
      await repo.updateStep(sampleStep('ghost', title: 'x'), at: testNow);
      expect(await chain('a1'), hasLength(1));
    });
  });

  group('completion', () {
    test('completing stamps the moment it happened', () async {
      await seed(steps: [sampleStep('s1')]);
      final at = testNow.add(const Duration(minutes: 5));
      await repo.setStepCompleted('s1', isCompleted: true, at: at);

      final step = (await chain('a1')).single;
      expect(step.isCompleted, isTrue);
      expect(step.completedAt, at);
    });

    test('reopening clears the stamp rather than keeping a stale one',
        () async {
      await seed(steps: [sampleStep('s1')]);
      await repo.setStepCompleted('s1', isCompleted: true, at: testNow);
      await repo.setStepCompleted('s1', isCompleted: false, at: testNow);

      final step = (await chain('a1')).single;
      expect(step.isCompleted, isFalse);
      expect(step.completedAt, isNull,
          reason: 'a reopened step was not completed at any time');
    });

    test('a completion stamp left behind by corruption is not believed',
        () async {
      await seed(steps: [sampleStep('s1')]);
      // isCompleted false but a stamp present: the flag wins, so the UI can
      // never show a completion time for an outstanding step.
      await db.customStatement(
        'UPDATE action_steps SET is_completed = 0, completed_at_micros = 99 '
        "WHERE id = 's1'",
      );
      expect((await chain('a1')).single.completedAt, isNull);
    });

    test('completing a step does not complete its Action', () async {
      await seed(steps: [sampleStep('s1')]);
      await repo.setStepCompleted('s1', isCompleted: true, at: testNow);
      expect((await repo.getById('a1'))!.status, ActionStatus.active,
          reason: 'finishing the work is the user\'s call, not a side effect');
    });
  });

  group('deleting', () {
    test('removes only that step', () async {
      await seed(steps: [
        sampleStep('s1', order: 0),
        sampleStep('s2', order: 1),
      ]);
      await repo.deleteStep('s1', at: testNow);

      final steps = await chain('a1');
      expect(steps.map((s) => s.id), ['s2']);
    });

    test('the resulting position gap does not disturb the order', () async {
      await seed(steps: [
        sampleStep('s1', order: 0),
        sampleStep('s2', order: 1),
        sampleStep('s3', order: 2),
      ]);
      await repo.deleteStep('s2', at: testNow);
      expect((await chain('a1')).map((s) => s.id), ['s1', 's3']);
    });
  });

  group('reordering', () {
    Future<void> seedThree() => seed(steps: [
          sampleStep('A', title: 'A', order: 0),
          sampleStep('B', title: 'B', order: 1),
          sampleStep('C', title: 'C', order: 2),
        ]);

    test('moving the last step to the front rewrites the whole chain',
        () async {
      await seedThree();
      await repo.reorderSteps('a1', ['C', 'A', 'B'], at: testNow);

      final steps = await chain('a1');
      expect(steps.map((s) => s.id), ['C', 'A', 'B']);
      expect(steps.map((s) => s.order), [0, 1, 2],
          reason: 'positions are rewritten densely, never left fractional');
    });

    test('an omitted step keeps its place behind the ones named', () async {
      await seedThree();
      await repo.reorderSteps('a1', ['C'], at: testNow);
      // A partial list reorders what it names and drops nothing.
      expect((await chain('a1')).map((s) => s.id), ['C', 'A', 'B']);
    });

    test('unknown and repeated ids are ignored, not obeyed', () async {
      await seedThree();
      await repo.reorderSteps('a1', ['C', 'C', 'nope', 'A'], at: testNow);
      expect((await chain('a1')).map((s) => s.id), ['C', 'A', 'B']);
    });

    test('a step belonging to another Action cannot be pulled in', () async {
      await seedThree();
      await repo.create(sampleAction('a2', steps: [sampleStep('X')]));
      await repo.reorderSteps('a1', ['X', 'C'], at: testNow);

      expect((await chain('a1')).map((s) => s.id), ['C', 'A', 'B']);
      expect((await chain('a2')).map((s) => s.id), ['X']);
    });

    test('an empty request leaves the chain exactly as it was', () async {
      await seedThree();
      await repo.reorderSteps('a1', const [], at: testNow);
      expect((await chain('a1')).map((s) => s.id), ['A', 'B', 'C']);
    });

    test('reordering an Action that does not exist is a no-op, not a throw',
        () async {
      await seedThree();
      await repo.reorderSteps('ghost', ['A'], at: testNow);
      expect((await chain('a1')).map((s) => s.id), ['A', 'B', 'C']);
    });

    test('pre-existing gaps are densified by any reorder', () async {
      await seed(steps: [
        sampleStep('A', order: 0),
        sampleStep('B', order: 7),
        sampleStep('C', order: 99),
      ]);
      await repo.reorderSteps('a1', ['A', 'B', 'C'], at: testNow);
      expect((await chain('a1')).map((s) => s.order), [0, 1, 2]);
    });

    test('duplicate positions are resolved into a single dense order',
        () async {
      await seed(steps: [
        sampleStep('A', order: 0),
        sampleStep('B', order: 0),
        sampleStep('C', order: 0),
      ]);
      await repo.reorderSteps('a1', ['C', 'B', 'A'], at: testNow);

      final steps = await chain('a1');
      expect(steps.map((s) => s.id), ['C', 'B', 'A']);
      expect(steps.map((s) => s.order).toSet(), {0, 1, 2},
          reason: 'no two steps may share a position after a rewrite');
    });

    test('reordering does not disturb which steps are done', () async {
      await seedThree();
      await repo.setStepCompleted('B', isCompleted: true, at: testNow);
      await repo.reorderSteps('a1', ['C', 'B', 'A'], at: testNow);

      final done = (await chain('a1')).where((s) => s.isCompleted);
      expect(done.map((s) => s.id), ['B'],
          reason: 'completion follows the step, not the position');
    });
  });

  group('durability', () {
    test('a chosen order and its completions survive process death',
        () async {
      final dir = Directory.systemTemp.createTempSync('day9_chain');
      addTearDown(() => dir.deleteSync(recursive: true));
      final file = File('${dir.path}/actions.sqlite');

      final first = ActionsDatabase(NativeDatabase(file));
      final firstRepo = DriftActionRepository(first);
      await firstRepo.create(sampleAction('a1', steps: [
        sampleStep('A', title: 'A', order: 0),
        sampleStep('B', title: 'B', order: 1),
        sampleStep('C', title: 'C', order: 2),
      ]));
      await firstRepo.reorderSteps('a1', ['C', 'A', 'B'], at: testNow);
      await firstRepo.setStepCompleted('A', isCompleted: true, at: testNow);
      await first.close();

      // A brand-new process over the same file.
      final second = ActionsDatabase(NativeDatabase(file));
      addTearDown(second.close);
      final reopened = (await DriftActionRepository(second).getById('a1'))!;

      expect(reopened.steps.map((s) => s.id), ['C', 'A', 'B']);
      expect(
        reopened.steps.singleWhere((s) => s.isCompleted).id,
        'A',
      );
    });
  });

  group('the local-only boundary', () {
    // The Day-8 mirror payload has no room for steps, and the deployed rules
    // reject a document that carries them. So a chain edit must leave the
    // outbox exactly as it found it.
    setUp(() async {
      await seed(steps: [sampleStep('s1', order: 0), sampleStep('s2', order: 1)]);
      await repo.markSynced('a1'); // discharge the create's mirror intent
      expect(await repo.pendingCount(), 0);
    });

    test('adding a step enqueues nothing', () async {
      await repo.addStep('a1', sampleStep('s3'));
      expect(await repo.pendingCount(), 0);
    });

    test('completing a step enqueues nothing', () async {
      await repo.setStepCompleted('s1', isCompleted: true, at: testNow);
      expect(await repo.pendingCount(), 0);
    });

    test('renaming a step enqueues nothing', () async {
      await repo.updateStep(sampleStep('s1', title: 'renamed'), at: testNow);
      expect(await repo.pendingCount(), 0);
    });

    test('deleting a step enqueues nothing', () async {
      await repo.deleteStep('s1', at: testNow);
      expect(await repo.pendingCount(), 0);
    });

    test('reordering enqueues nothing', () async {
      await repo.reorderSteps('a1', ['s2', 's1'], at: testNow);
      expect(await repo.pendingCount(), 0);
    });

    test('but editing mirrored Action metadata still does', () async {
      // The contrast is the point: the boundary is about steps, not about
      // Day 9 having stopped syncing.
      await repo.update(
        (await repo.getById('a1'))!.withEdits(title: 'New', updatedAt: testNow),
      );
      expect(await repo.pendingCount(), 1);
    });
  });

  group('watching one Action', () {
    test('re-emits when only the chain changed', () async {
      await seed(steps: [sampleStep('s1')]);
      final seen = <int>[];
      final sub = repo.watchById('a1').listen((a) {
        if (a != null) seen.add(a.steps.where((s) => s.isCompleted).length);
      });

      await pumpEventQueue();
      await repo.setStepCompleted('s1', isCompleted: true, at: testNow);
      await pumpEventQueue();
      await sub.cancel();

      expect(seen.last, 1,
          reason: 'a detail screen must react to step changes, and steps '
              'live in their own table');
    });

    test('emits null for an id that does not exist', () async {
      expect(await repo.watchById('nope').first, isNull);
    });

    test('emits null once the Action is gone', () async {
      await seed();
      final seen = <ActionItem?>[];
      final sub = repo.watchById('a1').listen(seen.add);
      await pumpEventQueue();
      // Through drift rather than raw SQL: a `customStatement` does not
      // declare which tables it touched, so nothing would be invalidated.
      await (db.delete(db.actionsTable)..where((t) => t.id.equals('a1'))).go();
      await pumpEventQueue();
      await sub.cancel();

      expect(seen.last, isNull);
    });
  });

  group('Action lifecycle', () {
    test('reopening clears the completion but keeps the chain intact',
        () async {
      await seed(steps: [sampleStep('s1'), sampleStep('s2', order: 1)]);
      await repo.setStepCompleted('s1', isCompleted: true, at: testNow);
      await repo.complete('a1', at: testNow);
      await repo.reopen('a1', at: testNow.add(const Duration(hours: 1)));

      final action = (await repo.getById('a1'))!;
      expect(action.status, ActionStatus.active);
      expect(action.completedAt, isNull);
      expect(
        action.steps.where((s) => s.isCompleted).map((s) => s.id),
        ['s1'],
        reason: 'reopening an Action does not un-do the work already done',
      );
    });

    test('reopening is a mirrored change and enqueues an upsert', () async {
      await seed();
      await repo.complete('a1', at: testNow);
      await repo.markSynced('a1');
      await repo.reopen('a1', at: testNow);
      expect(await repo.pendingCount(), 1);
    });
  });

  group('metadata edits', () {
    test('a deadline edit round-trips as the same wall-clock date', () async {
      await seed();
      final edited = (await repo.getById('a1'))!.withEdits(
        updatedAt: testNow,
        dueAt: ActionDue(DateTime(2026, 9, 15)),
      );
      await repo.update(edited);

      final due = (await repo.getById('a1'))!.dueAt!;
      expect(due.wallClock, DateTime(2026, 9, 15));
      expect(due.isDateOnly, isTrue,
          reason: 'a date-only deadline must not become an instant');
    });

    test('clearing a deadline is distinct from leaving it alone', () async {
      await repo.create(
          sampleAction('a1', dueAt: ActionDue(DateTime(2026, 8, 30))));
      final action = (await repo.getById('a1'))!;

      await repo.update(action.withEdits(updatedAt: testNow, title: 'Same due'));
      expect((await repo.getById('a1'))!.dueAt, isNotNull);

      await repo.update(action.withEdits(updatedAt: testNow, clearDue: true));
      expect((await repo.getById('a1'))!.dueAt, isNull);
    });

    test('an amount edit round-trips in exact minor units', () async {
      await seed();
      await repo.update((await repo.getById('a1'))!
          .withEdits(updatedAt: testNow, amount: gbp('96.40')));

      final amount = (await repo.getById('a1'))!.amount!;
      expect(amount.amountMinor, 9640);
      expect(amount.currencyCode, 'GBP');
      expect('$amount', '96.40 GBP');
    });

    test('clearing an amount removes both halves of it', () async {
      await repo.create(sampleAction('a1', amount: gbp('96.40')));
      final action = (await repo.getById('a1'))!;
      await repo.update(action.withEdits(updatedAt: testNow, clearAmount: true));

      final row = await db
          .customSelect("SELECT amount_minor_units, currency FROM actions "
              "WHERE id = 'a1'")
          .getSingle();
      expect(row.data['amount_minor_units'], isNull);
      expect(row.data['currency'], isNull,
          reason: 'a currency with no amount is not a value');
    });

    test('an edit never touches identity or provenance', () async {
      await repo.create(sampleAction('a1', sourceId: 'src-1'));
      final before = (await repo.getById('a1'))!;
      await repo.update(before.withEdits(
        updatedAt: testNow.add(const Duration(days: 1)),
        title: 'Renamed',
        urgency: ActionUrgency.critical,
      ));

      final after = (await repo.getById('a1'))!;
      expect(after.title, 'Renamed');
      expect(after.urgency, ActionUrgency.critical);
      expect(after.id, before.id);
      expect(after.sourceId, 'src-1');
      expect(after.schemaVersion, before.schemaVersion);
      expect(after.createdAt, before.createdAt);
      expect(after.origin, before.origin);
      expect(after.reviewedAt, before.reviewedAt);
    });
  });
}
