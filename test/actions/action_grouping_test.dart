import 'package:action_app/features/actions/application/action_grouping.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

void main() {
  // A fixed local "now": 18 Aug 2026, 12:00.
  final now = DateTime(2026, 8, 18, 12);

  ActionDue due(int year, int month, int day, [int hour = 0]) =>
      ActionDue(DateTime(year, month, day, hour));

  test('active actions split into needs-attention and upcoming by the '
      'documented rules', () {
    final groups = groupActionsForHome([
      sampleAction('overdue', dueAt: due(2026, 8, 10)),
      sampleAction('due-today', dueAt: due(2026, 8, 18, 17)),
      sampleAction('critical-no-due', urgency: ActionUrgency.critical),
      sampleAction('future', dueAt: due(2026, 9, 30)),
      sampleAction('no-due'),
      sampleAction('done',
          status: ActionStatus.completed, completedAt: testNow),
      sampleAction('archived', status: ActionStatus.archived),
    ], now);

    expect(groups.needsAttention.map((a) => a.id),
        ['overdue', 'due-today', 'critical-no-due']);
    expect(groups.upcoming.map((a) => a.id), ['future', 'no-due']);
    expect(groups.completed.map((a) => a.id), ['done']);
    // Archived appears nowhere on Home.
    expect(
      [...groups.needsAttention, ...groups.upcoming, ...groups.completed]
          .where((a) => a.id == 'archived'),
      isEmpty,
    );
  });

  test('needs-attention orders by deadline, then urgency, then newest, and '
      'is total on id', () {
    final groups = groupActionsForHome([
      sampleAction('later-critical',
          dueAt: due(2026, 8, 17), urgency: ActionUrgency.critical),
      sampleAction('earliest', dueAt: due(2026, 8, 10)),
      sampleAction('same-due-normal',
          dueAt: due(2026, 8, 17), urgency: ActionUrgency.normal),
      sampleAction('critical-no-due', urgency: ActionUrgency.critical),
    ], now);

    expect(groups.needsAttention.map((a) => a.id), [
      'earliest',
      'later-critical', // same date as same-due-normal, higher urgency
      'same-due-normal',
      'critical-no-due', // a deadline outranks its absence
    ]);
  });

  test('upcoming orders nearest deadline first, deadline-less last by '
      'newest creation', () {
    final groups = groupActionsForHome([
      sampleAction('far', dueAt: due(2026, 12, 1)),
      sampleAction('near', dueAt: due(2026, 9, 1)),
      sampleAction('older-no-due', createdAt: testNow),
      sampleAction('newer-no-due',
          createdAt: testNow.add(const Duration(minutes: 5))),
    ], now);

    expect(groups.upcoming.map((a) => a.id),
        ['near', 'far', 'newer-no-due', 'older-no-due']);
  });

  test('completed orders most recently completed first', () {
    final groups = groupActionsForHome([
      sampleAction('first-done',
          status: ActionStatus.completed, completedAt: testNow),
      sampleAction('last-done',
          status: ActionStatus.completed,
          completedAt: testNow.add(const Duration(hours: 1))),
    ], now);

    expect(groups.completed.map((a) => a.id), ['last-done', 'first-done']);
  });

  test('grouping is deterministic — same input, same output, every time', () {
    final actions = [
      for (var i = 0; i < 20; i++)
        sampleAction('a$i',
            dueAt: i.isEven ? due(2026, 9, 1 + i) : null,
            urgency: ActionUrgency.values[i % ActionUrgency.values.length]),
    ];
    final a = groupActionsForHome(actions, now);
    final b = groupActionsForHome(List.of(actions.reversed), now);
    expect(a.needsAttention.map((x) => x.id), b.needsAttention.map((x) => x.id));
    expect(a.upcoming.map((x) => x.id), b.upcoming.map((x) => x.id));
  });
}
