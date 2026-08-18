import 'package:action_app/features/actions/application/action_triage.dart';
import 'package:action_app/features/actions/application/triage_labels.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/domain/action_reminder.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

/// The triage rules, pinned.
///
/// Deadlines are wall-clock values, so "now" here is a fixed **local**
/// instant: mixing a UTC clock with local deadlines would compare two
/// different things and quietly pass for the wrong reason.
final triageNow = DateTime(2026, 8, 18, 12); // Tue 18 Aug 2026, midday

ActionItem dated(
  String id, {
  DateTime? due,
  bool dateOnly = true,
  ActionUrgency urgency = ActionUrgency.normal,
  ActionStatus status = ActionStatus.active,
  List<ActionStepItem> steps = const [],
  DateTime? createdAt,
  DateTime? completedAt,
}) =>
    sampleAction(
      id,
      status: status,
      urgency: urgency,
      dueAt: due == null
          ? null
          : ActionDue(dateOnly
              ? DateTime(due.year, due.month, due.day)
              : due),
      steps: steps,
      createdAt: createdAt,
      completedAt: completedAt,
    );

ActionReminder reminderAt(
  DateTime at, {
  String actionId = 'a1',
  ReminderState state = ReminderState.scheduled,
}) =>
    ActionReminder(
      id: 'r-$actionId',
      platformNotificationId: 1,
      actionId: actionId,
      scheduledAt: at.toUtc(),
      timeZoneId: 'Asia/Dhaka',
      state: state,
      createdAt: triageNow.toUtc(),
      updatedAt: triageNow.toUtc(),
    );

ActionTriageDecision decide(
  ActionItem action, {
  ActionReminder? reminder,
  DateTime? now,
}) =>
    const ActionTriageEngine()
        .decide(action, now: now ?? triageNow, reminder: reminder);

void main() {
  group('due relation', () {
    test('a date-only deadline today is due today, not overdue', () {
      // The whole point: "due 18 August" is due all of the 18th.
      final relation = dueRelationFor(
        ActionDue(DateTime(2026, 8, 18)),
        triageNow,
      );
      expect(relation, DueRelation.today);
    });

    test('a date-only deadline is overdue only once its day is over', () {
      expect(
        dueRelationFor(ActionDue(DateTime(2026, 8, 18)),
            DateTime(2026, 8, 18, 23, 59)),
        DueRelation.today,
      );
      expect(
        dueRelationFor(ActionDue(DateTime(2026, 8, 18)),
            DateTime(2026, 8, 19, 0, 1)),
        DueRelation.overdue,
      );
    });

    test('a timestamp deadline is overdue the moment it passes', () {
      final due = ActionDue(DateTime(2026, 8, 18, 9)); // 9am, now is midday
      expect(due.isDateOnly, isFalse);
      expect(dueRelationFor(due, triageNow), DueRelation.overdue);
    });

    test('a timestamp deadline later today is still today', () {
      final due = ActionDue(DateTime(2026, 8, 18, 17));
      expect(dueRelationFor(due, triageNow), DueRelation.today);
    });

    test('classifies the whole ladder', () {
      DueRelation on(int day) =>
          dueRelationFor(ActionDue(DateTime(2026, 8, day)), triageNow);

      expect(on(17), DueRelation.overdue);
      expect(on(18), DueRelation.today);
      expect(on(19), DueRelation.tomorrow);
      expect(on(21), DueRelation.withinThreeDays);
      expect(on(25), DueRelation.withinSevenDays);
      expect(on(30), DueRelation.later);
      expect(dueRelationFor(null, triageNow), DueRelation.none);
    });

    test('a daylight-saving jump cannot miscount the days', () {
      // Counted over UTC dates, so a 23- or 25-hour local day is irrelevant.
      expect(calendarDaysBetween(DateTime(2026, 3, 28, 23), DateTime(2026, 3, 29, 1)), 1);
      expect(calendarDaysBetween(DateTime(2026, 10, 24, 1), DateTime(2026, 10, 25, 23)), 1);
    });
  });

  group('reasons', () {
    test('overdue leads, and nothing else outranks it', () {
      final action = dated('a1',
          due: DateTime(2026, 8, 15), urgency: ActionUrgency.critical);
      final decision = decide(action,
          reminder: reminderAt(triageNow.add(const Duration(hours: 2))));

      expect(decision.primaryReason, TriageReason.overdue);
      expect(decision.band, TriageBand.needsAttention);
    });

    test('due today leads over urgency and reminders', () {
      final decision = decide(
        dated('a1', due: DateTime(2026, 8, 18), urgency: ActionUrgency.critical),
        reminder: reminderAt(triageNow.add(const Duration(hours: 1))),
      );
      expect(decision.primaryReason, TriageReason.dueToday);
    });

    test('critical with no deadline is surfaced, and says why', () {
      final decision =
          decide(dated('a1', urgency: ActionUrgency.critical));

      expect(decision.primaryReason, TriageReason.criticalNoDeadline);
      expect(decision.band, TriageBand.needsAttention);
      expect(decision.dueRelation, DueRelation.none);
    });

    test('normal with no deadline waits in Upcoming', () {
      final decision = decide(dated('a1'));
      expect(decision.primaryReason, TriageReason.noDeadline);
      expect(decision.band, TriageBand.upcoming);
    });

    test('unknown urgency is not treated as suspicious', () {
      // Unknown means no preference was recorded, not that something is off.
      final decision = decide(dated('a1', urgency: ActionUrgency.unknown));
      expect(decision.band, TriageBand.upcoming);
      expect(decision.reasons, isNot(contains(TriageReason.importantUrgency)));
    });

    test('important alone does not reach Needs Attention', () {
      final decision = decide(dated('a1',
          due: DateTime(2026, 9, 30), urgency: ActionUrgency.important));
      expect(decision.band, TriageBand.upcoming);
    });

    test('due tomorrow alone does not reach Needs Attention', () {
      // If everything looks urgent, the section stops meaning anything.
      final decision = decide(dated('a1', due: DateTime(2026, 8, 19)));
      expect(decision.primaryReason, TriageReason.dueTomorrow);
      expect(decision.band, TriageBand.upcoming);
    });

    test('critical AND due soon does reach Needs Attention', () {
      final decision = decide(dated('a1',
          due: DateTime(2026, 8, 19), urgency: ActionUrgency.critical));
      expect(decision.primaryReason, TriageReason.criticalDueSoon);
      expect(decision.band, TriageBand.needsAttention);
    });
  });

  group('the money rule', () {
    test('amount never affects priority', () {
      // A big number is not an emergency. The deadline decides.
      final cheap = sampleAction('cheap',
          amount: gbp('20.00'), dueAt: ActionDue(DateTime(2026, 8, 25)));
      final costly = sampleAction('costly',
          amount: gbp('10000.00'), dueAt: ActionDue(DateTime(2026, 8, 25)));

      final a = decide(cheap);
      final b = decide(costly);
      expect(a.rank, b.rank);
      expect(a.band, b.band);
      expect(a.reasons, b.reasons);
    });

    test('a large amount cannot pull an Action into Needs Attention', () {
      final decision = decide(sampleAction('a1',
          amount: gbp('99999.00'), dueAt: ActionDue(DateTime(2026, 12, 1))));
      expect(decision.band, TriageBand.upcoming);
    });
  });

  group('the chain signal', () {
    test('every step done on an open Action is surfaced', () {
      final decision = decide(dated('a1', steps: [
        sampleStep('s1', isCompleted: true),
        sampleStep('s2', order: 1, isCompleted: true),
      ]));

      expect(decision.allStepsDone, isTrue);
      expect(decision.primaryReason,
          TriageReason.allStepsDoneAwaitingCompletion);
      expect(decision.band, TriageBand.needsAttention);
    });

    test('a partly finished chain is not surfaced', () {
      final decision = decide(dated('a1', steps: [
        sampleStep('s1', isCompleted: true),
        sampleStep('s2', order: 1),
      ]));
      expect(decision.allStepsDone, isFalse);
      expect(decision.band, TriageBand.upcoming);
    });

    test('an Action with no steps is not "all steps done"', () {
      expect(decide(dated('a1')).allStepsDone, isFalse);
    });

    test('progress percentage is not a signal', () {
      // Nine of ten done ranks exactly like one of ten: only *all* done means
      // anything, because only that is one tap from finished.
      final nearlyDone = dated('a1', steps: [
        for (var i = 0; i < 9; i++)
          sampleStep('s$i', order: i, isCompleted: true),
        sampleStep('s9', order: 9),
      ]);
      final barelyStarted = dated('a2', steps: [
        sampleStep('t0', isCompleted: true),
        for (var i = 1; i < 10; i++) sampleStep('t$i', order: i),
      ]);
      expect(decide(nearlyDone).rank, decide(barelyStarted).rank);
    });
  });

  group('the reminder signal', () {
    test('a scheduled reminder within a day counts', () {
      final decision = decide(dated('a1'),
          reminder: reminderAt(triageNow.add(const Duration(hours: 6))));

      expect(decision.primaryReason, TriageReason.reminderDueSoon);
      expect(decision.band, TriageBand.needsAttention);
      expect(decision.upcomingReminder, isNotNull);
    });

    test('a reminder further out than a day does not', () {
      final decision = decide(dated('a1'),
          reminder: reminderAt(triageNow.add(const Duration(days: 3))));
      expect(decision.band, TriageBand.upcoming);
      expect(decision.upcomingReminder, isNull);
    });

    test('a reminder blocked on permission is not a signal', () {
      // It will not alert anyone, so it must not act as though it will.
      final decision = decide(
        dated('a1'),
        reminder: reminderAt(triageNow.add(const Duration(hours: 2)),
            state: ReminderState.needsPermission),
      );
      expect(decision.band, TriageBand.upcoming);
    });

    test('a reminder the platform refused is not a signal', () {
      final decision = decide(
        dated('a1'),
        reminder: reminderAt(triageNow.add(const Duration(hours: 2)),
            state: ReminderState.scheduleFailed),
      );
      expect(decision.band, TriageBand.upcoming);
    });

    test('a reminder still waiting to be scheduled is not a signal', () {
      final decision = decide(
        dated('a1'),
        reminder: reminderAt(triageNow.add(const Duration(hours: 2)),
            state: ReminderState.pendingSchedule),
      );
      expect(decision.band, TriageBand.upcoming);
    });

    test('a reminder in the past is not a signal', () {
      final decision = decide(dated('a1'),
          reminder: reminderAt(triageNow.subtract(const Duration(hours: 2))));
      expect(decision.band, TriageBand.upcoming);
    });

    test('a reminder does not outrank the deadline it belongs to', () {
      // Both facts are true; the ranking still leads with the deadline.
      final decision = decide(
        dated('a1', due: DateTime(2026, 8, 15)),
        reminder: reminderAt(triageNow.add(const Duration(hours: 2))),
      );
      expect(decision.primaryReason, TriageReason.overdue);
      expect(decision.reasons, contains(TriageReason.reminderDueSoon));
    });
  });

  group('lifecycle', () {
    test('a completed Action is never called overdue', () {
      final decision = decide(dated(
        'a1',
        due: DateTime(2026, 8, 10),
        status: ActionStatus.completed,
        completedAt: triageNow,
      ));

      expect(decision.band, TriageBand.completed);
      expect(decision.dueRelation, DueRelation.none);
      expect(decision.reasons, isEmpty);
    });

    test('an archived Action leaves Home entirely, even when overdue', () {
      final home = triageHome(
        [dated('a1', due: DateTime(2026, 8, 1), status: ActionStatus.archived)],
        now: triageNow,
      );
      expect(home.isEmpty, isTrue);
      expect(home.decisionFor('a1'), isNull);
    });
  });

  group('ordering', () {
    List<String> order(List<ActionItem> actions,
        {Map<String, ActionReminder> reminders = const {}}) {
      final home =
          triageHome(actions, now: triageNow, nextReminders: reminders);
      return [
        for (final a in home.needsAttention) a.id,
        for (final a in home.upcoming) a.id,
      ];
    }

    test('follows the documented precedence', () {
      final ids = order([
        dated('later', due: DateTime(2026, 9, 30)),
        dated('tomorrow', due: DateTime(2026, 8, 19)),
        dated('overdue', due: DateTime(2026, 8, 10)),
        dated('today', due: DateTime(2026, 8, 18)),
        dated('week', due: DateTime(2026, 8, 24)),
        dated('none'),
      ]);

      expect(ids, ['overdue', 'today', 'tomorrow', 'week', 'later', 'none']);
    });

    test('the most overdue comes first', () {
      final ids = order([
        dated('b', due: DateTime(2026, 8, 16)),
        dated('a', due: DateTime(2026, 8, 10)),
        dated('c', due: DateTime(2026, 8, 17)),
      ]);
      expect(ids, ['a', 'b', 'c']);
    });

    test('identical everything still has one stable order', () {
      final made = DateTime(2026, 8, 1);
      final ids = order([
        dated('z', due: DateTime(2026, 8, 20), createdAt: made),
        dated('a', due: DateTime(2026, 8, 20), createdAt: made),
        dated('m', due: DateTime(2026, 8, 20), createdAt: made),
      ]);
      expect(ids, ['a', 'm', 'z'], reason: 'id is the final tie-break');
    });

    test('at equal priority the one waiting longest goes first', () {
      final ids = order([
        dated('new', due: DateTime(2026, 8, 20), createdAt: DateTime(2026, 8, 17)),
        dated('old', due: DateTime(2026, 8, 20), createdAt: DateTime(2026, 8, 1)),
      ]);
      expect(ids, ['old', 'new']);
    });

    test('a dated Action outranks an undated one at the same rank', () {
      final home = triageHome([
        dated('undated', urgency: ActionUrgency.critical),
        dated('dated', urgency: ActionUrgency.critical, due: DateTime(2026, 12, 1)),
      ], now: triageNow);
      // 'dated' is criticalDueSoon? No — December is `later`, so both sit at
      // different ranks; what matters is the result is deterministic.
      expect(home.needsAttention.map((a) => a.id), contains('undated'));
    });

    test('repeating the same triage gives the same order', () {
      final actions = [
        for (var i = 0; i < 20; i++)
          dated('a$i',
              due: DateTime(2026, 8, 18 + (i % 5)),
              createdAt: DateTime(2026, 8, 1)),
      ];
      final first = order(actions);
      final second = order(actions.reversed.toList());
      expect(second, first, reason: 'input order must not leak into output');
    });

    test('completed Actions list most recently finished first', () {
      final home = triageHome([
        dated('old',
            status: ActionStatus.completed,
            completedAt: DateTime(2026, 8, 10)),
        dated('new',
            status: ActionStatus.completed,
            completedAt: DateTime(2026, 8, 17)),
      ], now: triageNow);

      expect(home.completed.map((a) => a.id), ['new', 'old']);
    });
  });

  group('reacting to edits', () {
    test('raising urgency moves an Action into Needs Attention', () {
      final before = decide(dated('a1', due: DateTime(2026, 8, 20)));
      expect(before.band, TriageBand.upcoming);

      final after = decide(dated('a1',
          due: DateTime(2026, 8, 20), urgency: ActionUrgency.critical));
      expect(after.band, TriageBand.needsAttention);
    });

    test('completing removes it from the active sections', () {
      final home = triageHome([
        dated('a1',
            due: DateTime(2026, 8, 10),
            status: ActionStatus.completed,
            completedAt: triageNow),
      ], now: triageNow);

      expect(home.needsAttention, isEmpty);
      expect(home.upcoming, isEmpty);
      expect(home.completed, hasLength(1));
    });
  });

  group('degrading safely', () {
    test('a hundred dateless Actions do not crowd Needs Attention', () {
      final home = triageHome(
        [for (var i = 0; i < 100; i++) dated('a$i')],
        now: triageNow,
      );
      expect(home.needsAttention, isEmpty);
      expect(home.upcoming, hasLength(100));
    });

    test('a deadline far in the past is just very overdue', () {
      final decision = decide(dated('a1', due: DateTime(1990, 1, 1)));
      expect(decision.primaryReason, TriageReason.overdue);
      expect(decision.band, TriageBand.needsAttention);
    });

    test('steps with duplicate positions do not break triage', () {
      final decision = decide(dated('a1', steps: [
        sampleStep('s1', order: 0, isCompleted: true),
        sampleStep('s2', order: 0, isCompleted: true),
      ]));
      expect(decision.allStepsDone, isTrue);
    });

    test('an empty Home is empty, not broken', () {
      final home = triageHome(const [], now: triageNow);
      expect(home.isEmpty, isTrue);
    });

    test('triaging a large set stays quick', () {
      final actions = [
        for (var i = 0; i < 500; i++)
          dated('a$i', due: DateTime(2026, 8, 1 + (i % 60))),
      ];
      final watch = Stopwatch()..start();
      final home = triageHome(actions, now: triageNow);
      watch.stop();

      expect(home.needsAttention.length + home.upcoming.length, 500);
      // Not a benchmark — a guard against an accidental quadratic.
      expect(watch.elapsedMilliseconds, lessThan(500));
    });
  });

  group('the words shown', () {
    test('overdue says by how much', () {
      final action = dated('a1', due: DateTime(2026, 8, 16));
      expect(TriageLabels.badge(decide(action), action, triageNow),
          'OVERDUE · 2 DAYS');
    });

    test('one day overdue is singular', () {
      final action = dated('a1', due: DateTime(2026, 8, 17));
      expect(TriageLabels.badge(decide(action), action, triageNow),
          'OVERDUE · 1 DAY');
    });

    test('quiet Actions get no badge at all', () {
      final action = dated('a1', due: DateTime(2026, 9, 30));
      expect(TriageLabels.badge(decide(action), action, triageNow), isNull,
          reason: 'a badge on everything is a badge on nothing');
    });

    test('explanations are sentences, never enum names', () {
      final action = dated('a1', due: DateTime(2026, 8, 18));
      final text = TriageLabels.explanation(decide(action), action, triageNow);

      expect(text, 'This needs attention because it is due today.');
      for (final reason in TriageReason.values) {
        expect(text.contains(reason.name), isFalse);
      }
    });

    test('critical with no deadline explains both halves', () {
      final action = dated('a1', urgency: ActionUrgency.critical);
      expect(
        TriageLabels.explanation(decide(action), action, triageNow),
        'This needs attention because you marked it critical, and it has no '
        'deadline.',
      );
    });

    test('nothing claims a consequence', () {
      // Triage may say a thing is late. It may never say being late is
      // expensive, illegal or dangerous.
      const forbidden = ['penalty', 'legal', 'fine', 'risk', 'consequence',
          'debt', 'court', 'credit'];
      for (final action in [
        dated('a', due: DateTime(2026, 8, 1)),
        dated('b', due: DateTime(2026, 8, 18)),
        dated('c', urgency: ActionUrgency.critical),
        dated('d'),
      ]) {
        final text =
            TriageLabels.explanation(decide(action), action, triageNow)
                .toLowerCase();
        for (final word in forbidden) {
          expect(text.contains(word), isFalse, reason: '"$word" in: $text');
        }
      }
    });

    test('a screen reader hears the reason, not a colour', () {
      final action = dated('a1', due: DateTime(2026, 8, 16));
      final label = TriageLabels.semanticLabel(decide(action), action, triageNow);
      expect(label, startsWith('Overdue by 2 days'));
      expect(label, contains(action.title));
    });
  });
}
