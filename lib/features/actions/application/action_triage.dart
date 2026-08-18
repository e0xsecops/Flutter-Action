import '../../extraction/domain/extraction_schema.dart';
import '../domain/action_item.dart';
import '../domain/action_reminder.dart';

/// Explainable triage: what deserves attention first, and why.
///
/// Everything here is deterministic, local, and derived only from state the
/// person themselves confirmed — a deadline they approved, an urgency they
/// accepted, steps they ticked, a reminder they set. There is no model call,
/// no learning, no engagement weighting, and deliberately **no numeric
/// score**: a rank the user cannot argue with is a rank they cannot trust.
///
/// One thing is pointedly absent: **money never affects priority.** A £10,000
/// bill is not more urgent than a £20 one — the deadline decides that, and
/// pretending otherwise would quietly rank people's obligations by size.

/// Where a deadline sits relative to now.
///
/// Date-only deadlines are compared as **local calendar dates**, because that
/// is what they mean: "due 18 August" is due all of the 18th, and only
/// becomes overdue once that day is over. Timestamp deadlines are compared as
/// instants.
enum DueRelation {
  overdue,
  today,
  tomorrow,
  withinThreeDays,
  withinSevenDays,
  later,
  none,
}

/// Why an Action sits where it does. Each one is a fact about persisted
/// state, never an inference about consequences.
enum TriageReason {
  overdue,
  dueToday,
  dueTomorrow,
  dueWithinThreeDays,
  dueWithinSevenDays,
  dueLater,

  /// Marked critical by the person, with no deadline to sort it by.
  criticalNoDeadline,

  /// Marked critical, and the deadline is close.
  criticalDueSoon,

  importantUrgency,

  /// A reminder the person scheduled themselves lands within a day.
  reminderDueSoon,

  /// Every step is ticked and the Action is still open — one tap from done.
  allStepsDoneAwaitingCompletion,

  /// Nothing is pressing. Said plainly rather than left blank.
  noDeadline,
}

/// Home's buckets. Archived Actions belong to none of them and appear nowhere.
enum TriageBand { needsAttention, upcoming, completed }

/// The whole verdict for one Action, including the words to show.
final class ActionTriageDecision {
  const ActionTriageDecision({
    required this.actionId,
    required this.band,
    required this.rank,
    required this.dueRelation,
    required this.reasons,
    required this.allStepsDone,
    this.upcomingReminder,
  });

  final String actionId;
  final TriageBand band;

  /// Position in the documented precedence list — lower is more pressing.
  /// Exposed for tests and ordering, never shown to anyone.
  final int rank;

  final DueRelation dueRelation;

  /// Every applicable reason, most important first.
  final List<TriageReason> reasons;

  final bool allStepsDone;

  /// The next scheduled reminder, when one lands within [reminderHorizon].
  final ActionReminder? upcomingReminder;

  /// The single reason worth showing on a card. Reason spam is worse than
  /// silence: "Overdue by 2 days" beats "Overdue · reminder soon · important".
  TriageReason? get primaryReason =>
      reasons.isEmpty ? null : reasons.first;

  /// Occasionally worth a second line, when it says something the first does
  /// not. Never a third.
  TriageReason? get secondaryReason =>
      reasons.length > 1 ? reasons[1] : null;
}

/// How close a self-set reminder has to be before it counts as pressing.
const Duration reminderHorizon = Duration(hours: 24);

/// The precedence, written once, in order. Rank is this list's index.
///
/// It is lexicographic rather than weighted on purpose: every position can be
/// justified in a sentence, and moving an Action up the list always has a
/// nameable cause.
///
///  0. overdue
///  1. due today
///  2. critical and due within three days
///  3. every step done, still open
///  4. due tomorrow
///  5. a reminder the user set lands within a day
///  6. due within three days
///  7. critical with no deadline
///  8. due within seven days
///  9. marked important
/// 10. has a deadline further out
/// 11. no deadline, no urgency preference
const List<TriageReason> _precedence = [
  TriageReason.overdue,
  TriageReason.dueToday,
  TriageReason.criticalDueSoon,
  TriageReason.allStepsDoneAwaitingCompletion,
  TriageReason.dueTomorrow,
  TriageReason.reminderDueSoon,
  TriageReason.dueWithinThreeDays,
  TriageReason.criticalNoDeadline,
  TriageReason.dueWithinSevenDays,
  TriageReason.importantUrgency,
  TriageReason.dueLater,
  TriageReason.noDeadline,
];

/// Which reasons are pressing enough to pull an Action into Needs Attention.
///
/// Kept deliberately short. If fifteen things all look urgent, the section has
/// stopped meaning anything — so "due tomorrow" on its own is *not* here, and
/// neither is "important".
const Set<TriageReason> _needsAttentionReasons = {
  TriageReason.overdue,
  TriageReason.dueToday,
  TriageReason.criticalDueSoon,
  TriageReason.allStepsDoneAwaitingCompletion,
  TriageReason.reminderDueSoon,
  TriageReason.criticalNoDeadline,
};

/// Calendar days from [from] to [to], counting whole local dates.
///
/// Computed in UTC so a daylight-saving jump cannot make a day 23 hours long
/// and round the answer wrong.
int calendarDaysBetween(DateTime from, DateTime to) {
  final a = DateTime.utc(from.year, from.month, from.day);
  final b = DateTime.utc(to.year, to.month, to.day);
  return b.difference(a).inDays;
}

/// Classifies a deadline against [now].
DueRelation dueRelationFor(ActionDue? due, DateTime now) {
  if (due == null) return DueRelation.none;

  // A timestamp deadline is a moment, so it is overdue the moment it passes.
  // A date-only deadline is a whole day, and survives until that day is over.
  if (!due.isDateOnly && due.wallClock.isBefore(now)) return DueRelation.overdue;

  final days = calendarDaysBetween(now, due.wallClock);
  if (days < 0) return DueRelation.overdue;
  if (days == 0) return DueRelation.today;
  if (days == 1) return DueRelation.tomorrow;
  if (days <= 3) return DueRelation.withinThreeDays;
  if (days <= 7) return DueRelation.withinSevenDays;
  return DueRelation.later;
}

/// The triage rules, in one testable place.
///
/// Home consumes decisions; it does not compute them. That separation is what
/// makes the ordering arguable in a test rather than only observable on a
/// device.
class ActionTriageEngine {
  const ActionTriageEngine();

  /// Judges one Action. [reminder] should be its soonest still-scheduled
  /// reminder, if any — the caller fetches those in one query rather than one
  /// per card.
  ActionTriageDecision decide(
    ActionItem action, {
    required DateTime now,
    ActionReminder? reminder,
  }) {
    final relation = dueRelationFor(action.dueAt, now);

    // Completed and archived Actions are judged on status alone. A finished
    // obligation is never described as overdue — the date stopped mattering
    // when the person dealt with it.
    if (action.status != ActionStatus.active) {
      return ActionTriageDecision(
        actionId: action.id,
        band: TriageBand.completed,
        rank: _precedence.length,
        dueRelation: DueRelation.none,
        reasons: const [],
        allStepsDone: false,
      );
    }

    final allStepsDone =
        action.steps.isNotEmpty && action.steps.every((s) => s.isCompleted);

    // Only a reminder that is genuinely armed and genuinely soon counts. One
    // blocked on permission, or refused by the platform, is not going to
    // alert anyone and must not pretend otherwise.
    final pressingReminder = _pressingReminder(reminder, now);

    final reasons = <TriageReason>[];

    switch (relation) {
      case DueRelation.overdue:
        reasons.add(TriageReason.overdue);
      case DueRelation.today:
        reasons.add(TriageReason.dueToday);
      case DueRelation.tomorrow:
        reasons.add(TriageReason.dueTomorrow);
      case DueRelation.withinThreeDays:
        reasons.add(TriageReason.dueWithinThreeDays);
      case DueRelation.withinSevenDays:
        reasons.add(TriageReason.dueWithinSevenDays);
      case DueRelation.later:
        reasons.add(TriageReason.dueLater);
      case DueRelation.none:
        break;
    }

    if (action.urgency == ActionUrgency.critical) {
      if (relation == DueRelation.none) {
        reasons.add(TriageReason.criticalNoDeadline);
      } else if (relation == DueRelation.tomorrow ||
          relation == DueRelation.withinThreeDays) {
        // "Critical and close" is its own thing; when it is already overdue
        // or due today, that fact leads and critical adds nothing.
        reasons.add(TriageReason.criticalDueSoon);
      }
    } else if (action.urgency == ActionUrgency.important) {
      reasons.add(TriageReason.importantUrgency);
    }

    if (allStepsDone) {
      reasons.add(TriageReason.allStepsDoneAwaitingCompletion);
    }
    if (pressingReminder != null) {
      reasons.add(TriageReason.reminderDueSoon);
    }
    if (reasons.isEmpty) {
      reasons.add(TriageReason.noDeadline);
    }

    // Sorted by the one precedence list, so the leading reason is always the
    // reason the Action ranks where it does.
    reasons.sort((a, b) => _rankOf(a).compareTo(_rankOf(b)));

    final band = reasons.any(_needsAttentionReasons.contains)
        ? TriageBand.needsAttention
        : TriageBand.upcoming;

    return ActionTriageDecision(
      actionId: action.id,
      band: band,
      rank: _rankOf(reasons.first),
      dueRelation: relation,
      reasons: List.unmodifiable(reasons),
      allStepsDone: allStepsDone,
      upcomingReminder: pressingReminder,
    );
  }

  ActionReminder? _pressingReminder(ActionReminder? reminder, DateTime now) {
    if (reminder == null) return null;
    if (reminder.state != ReminderState.scheduled) return null;
    final at = reminder.scheduledAt.toUtc();
    final nowUtc = now.toUtc();
    if (!at.isAfter(nowUtc)) return null; // already gone
    return at.difference(nowUtc) <= reminderHorizon ? reminder : null;
  }

  static int _rankOf(TriageReason reason) {
    final index = _precedence.indexOf(reason);
    return index < 0 ? _precedence.length : index;
  }
}

/// Home's three lists plus the reasoning behind each card.
final class TriagedHome {
  const TriagedHome({
    required this.needsAttention,
    required this.upcoming,
    required this.completed,
    required this.decisions,
  });

  final List<ActionItem> needsAttention;
  final List<ActionItem> upcoming;
  final List<ActionItem> completed;

  /// Keyed by Action id, so a card can explain itself without recomputing.
  final Map<String, ActionTriageDecision> decisions;

  bool get isEmpty =>
      needsAttention.isEmpty && upcoming.isEmpty && completed.isEmpty;

  ActionTriageDecision? decisionFor(String actionId) => decisions[actionId];
}

int _urgencyRank(ActionUrgency u) => switch (u) {
      ActionUrgency.critical => 4,
      ActionUrgency.important => 3,
      ActionUrgency.normal => 2,
      ActionUrgency.low => 1,
      ActionUrgency.unknown => 0,
    };

/// Triages a whole Home.
///
/// [nextReminders] maps an Action id to its soonest still-scheduled reminder,
/// gathered once by the caller — Home must never ask the database a question
/// per card.
TriagedHome triageHome(
  List<ActionItem> actions, {
  required DateTime now,
  Map<String, ActionReminder> nextReminders = const {},
  ActionTriageEngine engine = const ActionTriageEngine(),
}) {
  final decisions = <String, ActionTriageDecision>{};
  final needsAttention = <ActionItem>[];
  final upcoming = <ActionItem>[];
  final completed = <ActionItem>[];

  for (final action in actions) {
    // Archived Actions leave Home entirely — including when their deadline
    // has passed. Archiving is the user saying "stop showing me this".
    if (action.status == ActionStatus.archived) continue;

    final decision = engine.decide(
      action,
      now: now,
      reminder: nextReminders[action.id],
    );
    decisions[action.id] = decision;

    switch (decision.band) {
      case TriageBand.needsAttention:
        needsAttention.add(action);
      case TriageBand.upcoming:
        upcoming.add(action);
      case TriageBand.completed:
        completed.add(action);
    }
  }

  /// Total, and stable across rebuilds: rank, then how soon, then urgency,
  /// then who has been waiting longest, then id. Two equivalent Actions can
  /// never swap places between frames.
  int byTriage(ActionItem a, ActionItem b) {
    final da = decisions[a.id]!;
    final db = decisions[b.id]!;

    final byRank = da.rank.compareTo(db.rank);
    if (byRank != 0) return byRank;

    final aDue = a.dueAt?.wallClock;
    final bDue = b.dueAt?.wallClock;
    if (aDue != null && bDue != null) {
      final byDue = aDue.compareTo(bDue);
      if (byDue != 0) return byDue;
    } else if (aDue != null) {
      return -1; // a dated Action outranks an undated one at equal rank
    } else if (bDue != null) {
      return 1;
    }

    final byUrgency = _urgencyRank(b.urgency).compareTo(_urgencyRank(a.urgency));
    if (byUrgency != 0) return byUrgency;

    // Oldest first: at identical priority, the thing that has been waiting
    // longer goes first.
    final byCreated = a.createdAt.compareTo(b.createdAt);
    if (byCreated != 0) return byCreated;

    return a.id.compareTo(b.id);
  }

  needsAttention.sort(byTriage);
  upcoming.sort(byTriage);
  completed.sort((a, b) {
    final aAt = a.completedAt ?? a.updatedAt;
    final bAt = b.completedAt ?? b.updatedAt;
    final byCompleted = bAt.compareTo(aAt); // most recently finished first
    if (byCompleted != 0) return byCompleted;
    return a.id.compareTo(b.id);
  });

  return TriagedHome(
    needsAttention: needsAttention,
    upcoming: upcoming,
    completed: completed,
    decisions: decisions,
  );
}
