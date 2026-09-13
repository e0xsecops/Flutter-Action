/// What has actually happened to an Action, derived from what is stored.
///
/// **No event log, deliberately.** The obvious implementation is a table of
/// events appended on every mutation. That would be a second source of truth
/// to keep in step with the first, a migration, and a growing store of history
/// about the user's own tasks. Every event this screen can honestly show is
/// already implied by a timestamp that exists: `createdAt`, `completedAt`,
/// `archivedAt`, a step's `completedAt`, a reminder's `scheduledAt`.
///
/// **Only real events.** The consequence of deriving rather than recording is
/// that some history is unrecoverable, and the correct response is to omit it
/// rather than to guess. An Action that was completed and then reopened has had
/// its `completedAt` cleared; there is no trace, so no "reopened" event is
/// emitted. A title that was edited leaves only `updatedAt`, which says when
/// something changed and not what — so it appears as "Last changed", once, and
/// never as a list of invented edits.
///
/// That honesty is the whole value of the section. A timeline that pads itself
/// out with plausible entries is worse than no timeline, because the entries
/// that are real become indistinguishable from the ones that are not.
library;

import '../domain/action_item.dart';
import '../domain/action_reminder.dart';

enum ActionEventKind {
  created,

  /// The user confirmed the extracted draft.
  reviewed,

  stepCompleted,

  reminderSet,

  completed,

  archived,

  /// Something changed, and the store does not say what.
  changed,
}

/// One thing that happened, at a moment that is recorded rather than inferred.
class ActionEvent {
  const ActionEvent({
    required this.kind,
    required this.at,
    this.subject,
    this.count,
  });

  final ActionEventKind kind;
  final DateTime at;

  /// A step's title, for the events that are about one.
  final String? subject;

  /// How many steps arrived with the Action, for [ActionEventKind.created].
  final int? count;

  @override
  String toString() => 'ActionEvent(${kind.name} at $at)';
}

abstract final class ActionTimeline {
  /// Steps created within this long of the Action itself came from the same
  /// confirmed draft. Emitting "step added" for each would be three identical
  /// timestamps and no information.
  static const _sameMoment = Duration(seconds: 5);

  /// The history of [action], newest first.
  ///
  /// Newest first because the question a person opens this to answer is "what
  /// happened to this recently", not "tell me the story from the beginning".
  static List<ActionEvent> of(
    ActionItem action, {
    List<ActionReminder> reminders = const [],
  }) {
    final events = <ActionEvent>[];

    final bornWithAction = action.steps
        .where((s) =>
            s.createdAt.difference(action.createdAt).abs() < _sameMoment)
        .length;

    events.add(ActionEvent(
      kind: ActionEventKind.created,
      at: action.createdAt,
      count: bornWithAction > 0 ? bornWithAction : null,
    ));

    // Only when the review is a distinct moment from the creation. An Action
    // made from a confirmed draft is created *by* being reviewed, so the two
    // timestamps are the same instant and showing both would put "Created"
    // and "Confirmed" a second apart as if they were two things that happened.
    final reviewedAt = action.reviewedAt;
    if (reviewedAt != null &&
        reviewedAt.difference(action.createdAt).abs() > _sameMoment) {
      events.add(ActionEvent(
        kind: ActionEventKind.reviewed,
        at: reviewedAt,
      ));
    }

    for (final step in action.steps) {
      // A step's own creation is only interesting when it did not arrive with
      // the Action — and even then the store has no "added" event, only the
      // timestamp, so this stays as completion only. Adding "step added" for
      // every later step would be honest but noisy; completion is the event
      // people look for.
      if (step.completedAt != null) {
        events.add(ActionEvent(
          kind: ActionEventKind.stepCompleted,
          at: step.completedAt!,
          subject: step.title,
        ));
      }
    }

    for (final reminder in reminders) {
      events.add(ActionEvent(
        kind: ActionEventKind.reminderSet,
        at: reminder.createdAt,
        // The moment it is set *for*, which is the part worth showing.
        subject: reminder.scheduledAt.toIso8601String(),
      ));
    }

    if (action.completedAt != null) {
      events.add(
        ActionEvent(kind: ActionEventKind.completed, at: action.completedAt!),
      );
    }

    if (action.archivedAt != null) {
      events.add(
        ActionEvent(kind: ActionEventKind.archived, at: action.archivedAt!),
      );
    }

    // "Last changed" only when the store's own clock has moved past everything
    // known. Otherwise it is a duplicate of the event that moved it.
    final latestKnown = events
        .map((e) => e.at)
        .fold<DateTime>(action.createdAt, (a, b) => b.isAfter(a) ? b : a);
    if (action.updatedAt.difference(latestKnown) > _sameMoment) {
      events.add(
        ActionEvent(kind: ActionEventKind.changed, at: action.updatedAt),
      );
    }

    events.sort((a, b) => b.at.compareTo(a.at));
    return events;
  }
}
