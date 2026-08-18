import 'action_triage.dart';
import '../domain/action_item.dart';

/// The words triage is allowed to use.
///
/// Two rules. Nothing here names an internal enum, and nothing here invents a
/// consequence: triage can say a thing is late, never that being late is
/// expensive, illegal or dangerous. That claim would need evidence the app
/// does not have.
abstract final class TriageLabels {
  /// The short badge on a Home card, e.g. `OVERDUE · 2 DAYS`.
  ///
  /// [now] and [action] are needed because "overdue" alone is vaguer than it
  /// needs to be when we know by how much.
  static String? badge(
    ActionTriageDecision decision,
    ActionItem action,
    DateTime now,
  ) {
    final reason = decision.primaryReason;
    if (reason == null) return null;

    return switch (reason) {
      TriageReason.overdue => _overdueBadge(action, now),
      TriageReason.dueToday => 'DUE TODAY',
      TriageReason.criticalDueSoon => 'CRITICAL',
      TriageReason.allStepsDoneAwaitingCompletion => 'ALL STEPS DONE',
      TriageReason.dueTomorrow => 'DUE TOMORROW',
      TriageReason.reminderDueSoon => 'REMINDER SOON',
      TriageReason.dueWithinThreeDays => null,
      TriageReason.criticalNoDeadline => 'CRITICAL',
      TriageReason.dueWithinSevenDays => null,
      TriageReason.importantUrgency => null,
      TriageReason.dueLater => null,
      TriageReason.noDeadline => null,
    };
  }

  static String _overdueBadge(ActionItem action, DateTime now) {
    final due = action.dueAt;
    if (due == null) return 'OVERDUE';
    final days = -calendarDaysBetween(now, due.wallClock);
    if (days <= 0) return 'OVERDUE';
    return days == 1 ? 'OVERDUE · 1 DAY' : 'OVERDUE · $days DAYS';
  }

  /// A full sentence for the "why is this here?" affordance, and for screen
  /// readers — which must hear the reason, never just notice a colour.
  static String explanation(
    ActionTriageDecision decision,
    ActionItem action,
    DateTime now,
  ) {
    final reason = decision.primaryReason;
    if (reason == null) {
      return decision.band == TriageBand.completed
          ? 'This is done.'
          : 'This is here because nothing about it is pressing yet.';
    }

    final where = decision.band == TriageBand.needsAttention
        ? 'This needs attention because'
        : 'This is further down because';

    final because = switch (reason) {
      TriageReason.overdue => _overdueSentence(action, now),
      TriageReason.dueToday => 'it is due today',
      TriageReason.criticalDueSoon =>
        'you marked it critical and its deadline is close',
      TriageReason.allStepsDoneAwaitingCompletion =>
        'every step is done — it just needs finishing',
      TriageReason.dueTomorrow => 'it is due tomorrow',
      TriageReason.reminderDueSoon =>
        'you set a reminder for it within the next day',
      TriageReason.dueWithinThreeDays => 'it is due within three days',
      TriageReason.criticalNoDeadline =>
        'you marked it critical, and it has no deadline',
      TriageReason.dueWithinSevenDays => 'it is due within a week',
      TriageReason.importantUrgency => 'you marked it important',
      TriageReason.dueLater => 'its deadline is further away',
      TriageReason.noDeadline => 'it has no deadline and nothing is pressing',
    };

    return '$where $because.';
  }

  static String _overdueSentence(ActionItem action, DateTime now) {
    final due = action.dueAt;
    if (due == null) return 'it is overdue';
    final days = -calendarDaysBetween(now, due.wallClock);
    if (days <= 0) return 'its deadline has passed';
    return days == 1 ? 'it is one day overdue' : 'it is $days days overdue';
  }

  /// What a screen reader should say instead of noticing an emphasis colour.
  static String semanticLabel(
    ActionTriageDecision decision,
    ActionItem action,
    DateTime now,
  ) {
    final badge = TriageLabels.badge(decision, action, now);
    if (badge == null) return action.title;
    // Spoken as words, not as shouted capitals.
    return '${_spoken(badge)}. ${action.title}';
  }

  static String _spoken(String badge) => badge
      .toLowerCase()
      .replaceAll(' · ', ' by ')
      .replaceFirst('overdue by', 'Overdue by')
      .replaceFirstMapped(
        RegExp('^[a-z]'),
        (m) => m.group(0)!.toUpperCase(),
      );
}
