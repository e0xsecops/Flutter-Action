/// The Goal model and its store.
///
/// A Goal is deliberately small — a sentence, two optional paragraphs, and a
/// list of Actions that came out of it. Most of what is worth testing is what
/// it refuses to become: a thing with a score, a thing that infers its own
/// completion, or a thing an Action has to know about.
library;

import 'dart:convert';
import 'dart:io';

import 'package:action_app/features/goals/data/json_goal_store.dart';
import 'package:action_app/features/goals/domain/goal.dart';
import 'package:flutter_test/flutter_test.dart';

final _now = DateTime.utc(2026, 9, 1, 10);

Goal _goal({
  String id = 'g1',
  String title = 'Renew the car insurance without overpaying',
  String? outcome,
  String? context,
  GoalStatus status = GoalStatus.active,
  List<String> linked = const [],
  DateTime? updatedAt,
}) =>
    Goal(
      id: id,
      title: title,
      outcome: outcome,
      context: context,
      status: status,
      linkedActionIds: linked,
      createdAt: _now,
      updatedAt: updatedAt ?? _now,
    );

void main() {
  group('the model', () {
    test('a new goal is open and has nothing linked', () {
      final goal = _goal();

      expect(goal.isOpen, isTrue);
      expect(goal.linkedActionIds, isEmpty);
      expect(goal.achievedAt, isNull);
    });

    test('linking an Action records it', () {
      final goal = _goal().linking('a1', now: _now);

      expect(goal.linkedActionIds, ['a1']);
    });

    test('linking the same Action twice records it once', () {
      // Creating the same Action twice from one plan would otherwise list it
      // twice, and the second entry would be indistinguishable from a second
      // real Action.
      final goal = _goal().linking('a1', now: _now).linking('a1', now: _now);

      expect(goal.linkedActionIds, ['a1']);
    });

    test('linking preserves order, oldest first', () {
      final goal =
          _goal().linking('a1', now: _now).linking('a2', now: _now);

      expect(goal.linkedActionIds, ['a1', 'a2']);
    });

    test('clearing a field is different from leaving it alone', () {
      final written = _goal(outcome: 'The car is insured');

      expect(written.copyWith(outcome: 'Something else').outcome,
          'Something else');
      expect(written.copyWith(clearOutcome: true).outcome, isNull);
      expect(written.copyWith().outcome, 'The car is insured');
    });

    test('nothing infers completion from linked Actions', () {
      // A goal can be met without finishing every task it produced, and
      // finishing every task does not always mean the goal was met. Status is
      // the user's own judgement and there is no code path that sets it.
      final goal = _goal(linked: ['a1', 'a2']);

      expect(goal.status, GoalStatus.active);
      expect(goal.isOpen, isTrue);
    });

    test('there is nothing on a Goal that could be read as a score', () {
      final goal = _goal(linked: ['a1']);
      final json = goal.toJson();

      for (final key in json.keys) {
        expect(key.toLowerCase(), isNot(contains('score')));
        expect(key.toLowerCase(), isNot(contains('progress')));
        expect(key.toLowerCase(), isNot(contains('percent')));
      }
    });
  });

  group('planning readiness', () {
    test('a real sentence is enough', () {
      expect(_goal().hasEnoughToPlan, isTrue);
    });

    test('a couple of words is not', () {
      // The tools can run on anything, but they run badly on three letters —
      // and finding that out costs a request on the user's own key.
      expect(_goal(title: 'tax').hasEnoughToPlan, isFalse);
      expect(_goal(title: '  a  ').hasEnoughToPlan, isFalse);
    });
  });

  group('round trip', () {
    test('everything survives encoding and decoding', () {
      final goal = _goal(
        outcome: 'Insured and filed',
        context: 'Two quotes so far',
        status: GoalStatus.achieved,
        linked: ['a1', 'a2'],
      ).copyWith(achievedAt: _now);

      final restored = Goal.fromJson(
        jsonDecode(jsonEncode(goal.toJson())) as Map<String, dynamic>,
      )!;

      expect(restored.id, goal.id);
      expect(restored.title, goal.title);
      expect(restored.outcome, 'Insured and filed');
      expect(restored.context, 'Two quotes so far');
      expect(restored.status, GoalStatus.achieved);
      expect(restored.linkedActionIds, ['a1', 'a2']);
      expect(restored.achievedAt, _now);
    });

    test('a record with no id or no title is dropped, not half-built', () {
      expect(Goal.fromJson({'title': 'x', 'createdAt': '2026-09-01'}), isNull);
      expect(Goal.fromJson({'id': 'g1', 'createdAt': '2026-09-01'}), isNull);
      expect(
        Goal.fromJson({'id': 'g1', 'title': '   ', 'createdAt': '2026-09-01'}),
        isNull,
      );
    });

    test('a record with an unreadable date is dropped', () {
      expect(Goal.fromJson({'id': 'g1', 'title': 'x'}), isNull);
      expect(
        Goal.fromJson({'id': 'g1', 'title': 'x', 'createdAt': 'never'}),
        isNull,
      );
    });

    test('an unknown status reads as active rather than failing', () {
      final restored = Goal.fromJson({
        'id': 'g1',
        'title': 'x',
        'status': 'inventedByAFutureVersion',
        'createdAt': _now.toIso8601String(),
      })!;

      expect(restored.status, GoalStatus.active);
    });
  });

  group('the file store', () {
    late Directory dir;

    setUp(() async {
      dir = await Directory.systemTemp.createTemp('action_goals');
    });
    tearDown(() async {
      if (await dir.exists()) await dir.delete(recursive: true);
    });

    test('reads back what it wrote', () async {
      final store = JsonFileGoalStore(dir);
      await store.add(_goal());

      final reopened = await JsonFileGoalStore(dir).all();

      expect(reopened, hasLength(1));
      expect(reopened.single.title, contains('car insurance'));
    });

    test('an absent file is an empty list, not an error', () async {
      expect(await JsonFileGoalStore(dir).all(), isEmpty);
    });

    test('a corrupt file degrades to empty rather than taking the app down',
        () async {
      await File('${dir.path}${Platform.pathSeparator}goals.json')
          .writeAsString('{ not json');

      expect(await JsonFileGoalStore(dir).all(), isEmpty);
    });

    test('one unreadable record does not lose the others', () async {
      await File('${dir.path}${Platform.pathSeparator}goals.json')
          .writeAsString(jsonEncode([
        {'id': 'g1', 'title': 'Keep me', 'createdAt': '2026-09-01T10:00:00Z'},
        {'title': 'no id at all', 'createdAt': '2026-09-01T10:00:00Z'},
        {'id': 'g2', 'title': 'Me too', 'createdAt': '2026-09-01T09:00:00Z'},
      ]));

      final all = await JsonFileGoalStore(dir).all();

      expect(all.map((g) => g.id), ['g1', 'g2']);
    });

    test('most recently updated first', () async {
      final store = JsonFileGoalStore(dir);
      await store.add(_goal(id: 'old', updatedAt: _now));
      await store.add(_goal(
        id: 'new',
        updatedAt: _now.add(const Duration(hours: 2)),
      ));

      expect((await store.all()).map((g) => g.id), ['new', 'old']);
    });

    test('updating a goal that is not there does nothing', () async {
      // Silently resurrecting a deleted Goal would be worse than a no-op.
      final store = JsonFileGoalStore(dir);
      await store.update(_goal(id: 'ghost'));

      expect(await store.all(), isEmpty);
    });

    test('deleting removes only that goal', () async {
      final store = JsonFileGoalStore(dir);
      await store.add(_goal(id: 'g1'));
      await store.add(_goal(id: 'g2'));

      await store.delete('g1');

      expect((await store.all()).map((g) => g.id), ['g2']);
    });

    test('clear removes the file', () async {
      final store = JsonFileGoalStore(dir);
      await store.add(_goal());
      await store.clear();

      expect(await store.all(), isEmpty);
    });

    test('writing into a directory that does not exist yet creates it',
        () async {
      final nested = Directory(
        '${dir.path}${Platform.pathSeparator}not${Platform.pathSeparator}yet',
      );

      await JsonFileGoalStore(nested).add(_goal());

      expect(await JsonFileGoalStore(nested).all(), hasLength(1));
    });
  });

  group('the in-memory store behaves the same way', () {
    test('update on a missing id is a no-op', () async {
      final store = InMemoryGoalStore();
      await store.update(_goal(id: 'ghost'));

      expect(await store.all(), isEmpty);
    });

    test('sorted most recently updated first', () async {
      final store = InMemoryGoalStore([
        _goal(id: 'old', updatedAt: _now),
        _goal(id: 'new', updatedAt: _now.add(const Duration(hours: 1))),
      ]);

      expect((await store.all()).map((g) => g.id), ['new', 'old']);
    });
  });
}
