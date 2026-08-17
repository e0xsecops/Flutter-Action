import '../../extraction/domain/extraction_schema.dart';
import '../domain/action_item.dart';

/// Home's three buckets, derived — never stored.
///
/// The rules are deliberately dumb enough to explain in a sentence each:
///
///  * **Needs attention** — active, and either overdue, due today, or
///    marked critical. Ordered: earliest deadline first (no-deadline
///    criticals last), then higher urgency, then newest.
///  * **Upcoming** — every other active Action. Ordered: nearest future
///    deadline first, no-deadline Actions after, then newest.
///  * **Completed** — most recently completed first.
///
/// Archived Actions appear nowhere on Home. No scoring, no learning, no
/// hidden ranking — Day 11 can argue about smart triage; today's grouping
/// must be explainable to the person whose deadlines these are.
final class HomeActionGroups {
  const HomeActionGroups({
    required this.needsAttention,
    required this.upcoming,
    required this.completed,
  });

  final List<ActionItem> needsAttention;
  final List<ActionItem> upcoming;
  final List<ActionItem> completed;

  bool get isEmpty =>
      needsAttention.isEmpty && upcoming.isEmpty && completed.isEmpty;
}

int _urgencyRank(ActionUrgency u) => switch (u) {
      ActionUrgency.critical => 4,
      ActionUrgency.important => 3,
      ActionUrgency.normal => 2,
      ActionUrgency.low => 1,
      ActionUrgency.unknown => 0,
    };

HomeActionGroups groupActionsForHome(List<ActionItem> actions, DateTime now) {
  // "Due today" is a wall-clock question, so the boundary is the local
  // start of tomorrow — consistent with deadlines being wall-clock values.
  final startOfTomorrow = DateTime(now.year, now.month, now.day + 1);

  bool demandsAttention(ActionItem a) {
    if (a.urgency == ActionUrgency.critical) return true;
    final due = a.dueAt;
    return due != null && due.wallClock.isBefore(startOfTomorrow);
  }

  final needsAttention = <ActionItem>[];
  final upcoming = <ActionItem>[];
  final completed = <ActionItem>[];

  for (final action in actions) {
    switch (action.status) {
      case ActionStatus.archived:
        break;
      case ActionStatus.completed:
        completed.add(action);
      case ActionStatus.active:
        (demandsAttention(action) ? needsAttention : upcoming).add(action);
    }
  }

  int byDueUrgencyCreated(ActionItem a, ActionItem b) {
    final aDue = a.dueAt?.wallClock;
    final bDue = b.dueAt?.wallClock;
    if (aDue != null || bDue != null) {
      if (aDue == null) return 1; // deadlines outrank their absence
      if (bDue == null) return -1;
      final byDue = aDue.compareTo(bDue);
      if (byDue != 0) return byDue;
    }
    final byUrgency = _urgencyRank(b.urgency).compareTo(_urgencyRank(a.urgency));
    if (byUrgency != 0) return byUrgency;
    final byCreated = b.createdAt.compareTo(a.createdAt);
    if (byCreated != 0) return byCreated;
    return a.id.compareTo(b.id); // total order, always
  }

  needsAttention.sort(byDueUrgencyCreated);
  upcoming.sort(byDueUrgencyCreated);
  completed.sort((a, b) {
    final aAt = a.completedAt ?? a.updatedAt;
    final bAt = b.completedAt ?? b.updatedAt;
    final byCompleted = bAt.compareTo(aAt);
    if (byCompleted != 0) return byCompleted;
    return a.id.compareTo(b.id);
  });

  return HomeActionGroups(
    needsAttention: needsAttention,
    upcoming: upcoming,
    completed: completed,
  );
}
