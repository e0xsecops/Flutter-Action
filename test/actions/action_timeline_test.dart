/// The Action timeline.
///
/// Derived from timestamps that already exist rather than from an event log,
/// so most of these tests are about what it declines to claim: a reopen it
/// cannot see, an edit it cannot describe, a duplicate it would otherwise
/// emit.
library;

import 'package:action_app/features/actions/application/action_timeline.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/domain/action_reminder.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

final _created = DateTime.utc(2026, 8, 1, 9);

ActionStepItem _step(
  String id, {
  required String title,
  DateTime? createdAt,
  DateTime? completedAt,
  int order = 0,
}) =>
    ActionStepItem(
      id: id,
      title: title,
      order: order,
      isCompleted: completedAt != null,
      completedAt: completedAt,
      createdAt: createdAt ?? _created,
      updatedAt: completedAt ?? createdAt ?? _created,
    );

ActionReminder _reminder({
  required DateTime createdAt,
  required DateTime scheduledAt,
}) =>
    ActionReminder(
      id: 'r1',
      platformNotificationId: 1,
      actionId: 'a1',
      scheduledAt: scheduledAt,
      timeZoneId: 'Asia/Dhaka',
      state: ReminderState.scheduled,
      createdAt: createdAt,
      updatedAt: createdAt,
    );

List<ActionEventKind> _kinds(List<ActionEvent> events) =>
    events.map((e) => e.kind).toList();

void main() {
  group('what it always has', () {
    test('a creation event', () {
      final events = ActionTimeline.of(sampleAction('a1', createdAt: _created));

      expect(_kinds(events), contains(ActionEventKind.created));
      expect(events.last.at, _created);
    });

    test('newest first', () {
      final action = sampleAction(
        'a1',
        createdAt: _created,
        completedAt: _created.add(const Duration(days: 3)),
        status: ActionStatus.completed,
      );

      final events = ActionTimeline.of(action);

      expect(events.first.kind, ActionEventKind.completed);
      expect(events.last.kind, ActionEventKind.created);
      final times = events.map((e) => e.at).toList();
      expect(times, orderedEquals([...times]..sort((a, b) => b.compareTo(a))));
    });
  });

  group('steps', () {
    test('steps that arrived with the Action are counted, not listed', () {
      // Three identical timestamps and no information is not a timeline.
      final action = sampleAction(
        'a1',
        createdAt: _created,
        steps: [
          _step('s1', title: 'Compare the renewal quote'),
          _step('s2', title: 'Call the insurer', order: 1),
          _step('s3', title: 'Send the form', order: 2),
        ],
      );

      final events = ActionTimeline.of(action);
      final created =
          events.firstWhere((e) => e.kind == ActionEventKind.created);

      expect(created.count, 3);
      expect(events, hasLength(1));
    });

    test('a completed step becomes its own event, named', () {
      final done = _created.add(const Duration(days: 1));
      final action = sampleAction(
        'a1',
        createdAt: _created,
        steps: [
          _step('s1', title: 'Compare the renewal quote', completedAt: done),
        ],
      );

      final events = ActionTimeline.of(action);
      final step =
          events.firstWhere((e) => e.kind == ActionEventKind.stepCompleted);

      expect(step.at, done);
      expect(step.subject, 'Compare the renewal quote');
    });

    test('an incomplete step produces no event', () {
      // There is no "added" timestamp worth showing for a step that arrived
      // with the Action, and nothing at all has happened to it since.
      final action = sampleAction(
        'a1',
        createdAt: _created,
        steps: [_step('s1', title: 'Not done yet')],
      );

      expect(_kinds(ActionTimeline.of(action)),
          isNot(contains(ActionEventKind.stepCompleted)));
    });
  });

  group('reminders', () {
    test('a reminder is recorded when it was set, and says what for', () {
      final set = _created.add(const Duration(hours: 2));
      final fires = _created.add(const Duration(days: 5));

      final events = ActionTimeline.of(
        sampleAction('a1', createdAt: _created),
        reminders: [_reminder(createdAt: set, scheduledAt: fires)],
      );
      final reminder =
          events.firstWhere((e) => e.kind == ActionEventKind.reminderSet);

      expect(reminder.at, set);
      expect(reminder.subject, fires.toIso8601String());
    });

    test('no reminders, no reminder events', () {
      expect(
        _kinds(ActionTimeline.of(sampleAction('a1', createdAt: _created))),
        isNot(contains(ActionEventKind.reminderSet)),
      );
    });
  });

  group('what it refuses to invent', () {
    test('no reopened event, because the store cannot show one', () {
      // Reopening clears completedAt. There is no trace, so there is no event
      // — rather than a guess dressed as history.
      final action = sampleAction(
        'a1',
        createdAt: _created,
        status: ActionStatus.active,
      );

      expect(_kinds(ActionTimeline.of(action)), [ActionEventKind.created]);
    });

    test('an edit is "changed", never a description of what changed', () {
      final edited = _created.add(const Duration(days: 2));
      final action = sampleAction('a1', createdAt: _created)
          .copyWith(updatedAt: edited);

      final events = ActionTimeline.of(action);
      final changed =
          events.firstWhere((e) => e.kind == ActionEventKind.changed);

      expect(changed.at, edited);
      expect(changed.subject, isNull);
    });

    test('no "changed" event when updatedAt only reflects a known event', () {
      // Completing an Action moves updatedAt. Emitting both would show
      // "Completed" and "Last changed" a second apart, which reads as two
      // things happening.
      final done = _created.add(const Duration(days: 3));
      final action = sampleAction(
        'a1',
        createdAt: _created,
        completedAt: done,
        status: ActionStatus.completed,
      ).copyWith(updatedAt: done);

      expect(_kinds(ActionTimeline.of(action)),
          isNot(contains(ActionEventKind.changed)));
    });

    test('no "changed" event on a brand new Action', () {
      expect(
        _kinds(ActionTimeline.of(sampleAction('a1', createdAt: _created))),
        isNot(contains(ActionEventKind.changed)),
      );
    });

    test('every event carries a timestamp that came from the store', () {
      final action = sampleAction(
        'a1',
        createdAt: _created,
        completedAt: _created.add(const Duration(days: 3)),
        status: ActionStatus.completed,
        steps: [
          _step(
            's1',
            title: 'Done',
            completedAt: _created.add(const Duration(days: 1)),
          ),
        ],
      );

      final stored = {
        action.createdAt,
        action.updatedAt,
        action.completedAt,
        action.reviewedAt,
        ...action.steps.map((s) => s.completedAt),
      }.whereType<DateTime>().toSet();

      for (final event in ActionTimeline.of(action)) {
        expect(stored, contains(event.at), reason: '${event.kind}');
      }
    });
  });

  group('determinism', () {
    test('the same Action gives the same timeline', () {
      final action = sampleAction(
        'a1',
        createdAt: _created,
        steps: [
          _step('s1', title: 'One', completedAt: _created.add(const Duration(days: 1))),
          _step('s2', title: 'Two', order: 1),
        ],
      );

      expect(
        _kinds(ActionTimeline.of(action)),
        _kinds(ActionTimeline.of(action)),
      );
    });
  });
}
