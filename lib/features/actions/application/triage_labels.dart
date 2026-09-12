import '../../../l10n/casing.dart';
import '../../../l10n/gen/app_l10n.dart';
import 'action_triage.dart';
import '../domain/action_item.dart';

/// The words triage is allowed to use.
///
/// Two rules. Nothing here names an internal enum, and nothing here invents a
/// consequence: triage can say a thing is late, never that being late is
/// expensive, illegal or dangerous. That claim would need evidence the app
/// does not have.
///
/// **Two forms of every label.** The plain methods return the canonical
/// English; the `…In(l10n, …)` methods return what a person actually reads.
/// The pair exists for the reason `enum_labels.dart` gives: a string the
/// domain tests and the diagnostics harness can assert on without pumping a
/// widget tree cannot also be the string on screen, because that one has to
/// depend on the locale. Screens call the `…In` form; nothing user-facing
/// calls the English one.
///
/// **Why the spoken label is its own set of keys.** This class used to derive
/// the screen-reader label from the badge by string surgery: lowercase it,
/// replace `' · '` with `' by '`, put the first letter back into capitals.
/// Every one of those steps is a fact about English. `toLowerCase` is wrong in
/// Turkish, ` by ` is not a word in nineteen of the twenty languages, and a
/// translation is under no obligation to keep the separator, the word order or
/// even the number of words the English happened to use — so rewriting a
/// translated badge would corrupt it. The spoken form is asked for directly
/// instead, and a translator sees it as its own sentence.
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
    final days = _overdueDays(action, now);
    if (days == null) return 'OVERDUE';
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
    final days = _overdueDays(action, now);
    if (days == null) return 'its deadline has passed';
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

  /// English only, and deliberately unreachable from a translated string.
  ///
  /// Kept for [semanticLabel], whose whole job is to produce the canonical
  /// English. [_spokenBadgeIn] is the localized route, and it asks for the
  /// spoken sentence rather than editing a badge into one.
  static String _spoken(String badge) => badge
      .toLowerCase()
      .replaceAll(' · ', ' by ')
      .replaceFirst('overdue by', 'Overdue by')
      .replaceFirstMapped(
        RegExp('^[a-z]'),
        (m) => m.group(0)!.toUpperCase(),
      );

  /// Whole calendar days the deadline is in the past by, or null when there is
  /// no deadline or it has not been over for a whole day yet.
  static int? _overdueDays(ActionItem action, DateTime now) {
    final due = action.dueAt;
    if (due == null) return null;
    final days = -calendarDaysBetween(now, due.wallClock);
    return days <= 0 ? null : days;
  }

  // -------------------------------------------------------------------------
  // The same three labels, in the reader's language.
  // -------------------------------------------------------------------------

  /// The badge, in eyebrow case for [l10n]'s language.
  ///
  /// Cased here rather than at each render site because there are two of those
  /// — the Today hero and the Action card — and the rule about the Turkish
  /// dotted `i` is one that gets remembered once and forgotten twice.
  /// Languages without case get their sentence back unchanged, which
  /// `casing.dart` explains is the intended outcome rather than a gap.
  static String? badgeIn(
    AppL10n l10n,
    ActionTriageDecision decision,
    ActionItem action,
    DateTime now,
  ) {
    final sentence = _badgeSentenceIn(l10n, decision, action, now);
    return sentence == null ? null : eyebrowCase(sentence, l10n.localeName);
  }

  /// The badge as a sentence-case phrase, before any eyebrow casing.
  static String? _badgeSentenceIn(
    AppL10n l10n,
    ActionTriageDecision decision,
    ActionItem action,
    DateTime now,
  ) {
    final reason = decision.primaryReason;
    if (reason == null) return null;

    return switch (reason) {
      TriageReason.overdue => _overdueBadgeIn(l10n, action, now),
      TriageReason.dueToday => l10n.metaDueToday,
      // The badge exists because the person marked the Action critical, so it
      // says the word they were shown when they chose it, not a synonym.
      TriageReason.criticalDueSoon => l10n.urgencyCritical,
      TriageReason.allStepsDoneAwaitingCompletion => l10n.detailAllStepsDone,
      TriageReason.dueTomorrow => l10n.triageBadgeDueTomorrow,
      TriageReason.reminderDueSoon => l10n.triageBadgeReminderSoon,
      TriageReason.dueWithinThreeDays => null,
      TriageReason.criticalNoDeadline => l10n.urgencyCritical,
      TriageReason.dueWithinSevenDays => null,
      TriageReason.importantUrgency => null,
      TriageReason.dueLater => null,
      TriageReason.noDeadline => null,
    };
  }

  static String _overdueBadgeIn(AppL10n l10n, ActionItem action, DateTime now) {
    final days = _overdueDays(action, now);
    return days == null
        ? l10n.searchFilterOverdue
        : l10n.triageBadgeOverdueDays(days);
  }

  /// The full "why is this here?" sentence, in the reader's language.
  static String explanationIn(
    AppL10n l10n,
    ActionTriageDecision decision,
    ActionItem action,
    DateTime now,
  ) {
    final reason = decision.primaryReason;
    if (reason == null) {
      return decision.band == TriageBand.completed
          ? l10n.triageExplanationDone
          : l10n.triageExplanationNothingPressing;
    }

    final because = switch (reason) {
      TriageReason.overdue => _overdueSentenceIn(l10n, action, now),
      TriageReason.dueToday => l10n.triageReasonDueToday,
      TriageReason.criticalDueSoon => l10n.triageReasonCriticalDueSoon,
      TriageReason.allStepsDoneAwaitingCompletion =>
        l10n.triageReasonAllStepsDone,
      TriageReason.dueTomorrow => l10n.triageReasonDueTomorrow,
      TriageReason.reminderDueSoon => l10n.triageReasonReminderSoon,
      TriageReason.dueWithinThreeDays => l10n.triageReasonDueWithinThreeDays,
      TriageReason.criticalNoDeadline => l10n.triageReasonCriticalNoDeadline,
      TriageReason.dueWithinSevenDays => l10n.triageReasonDueWithinSevenDays,
      TriageReason.importantUrgency => l10n.triageReasonImportant,
      TriageReason.dueLater => l10n.triageReasonDueLater,
      TriageReason.noDeadline => l10n.triageReasonNoDeadline,
    };

    // The clause is a placeholder rather than something glued on with a space,
    // so a language that puts the reason before the verdict, or needs another
    // join entirely, can say so in its own file.
    return decision.band == TriageBand.needsAttention
        ? l10n.triageExplanationNeedsAttention(because)
        : l10n.triageExplanationUpcoming(because);
  }

  static String _overdueSentenceIn(
    AppL10n l10n,
    ActionItem action,
    DateTime now,
  ) {
    final due = action.dueAt;
    if (due == null) return l10n.triageReasonOverdue;
    final days = _overdueDays(action, now);
    return days == null
        ? l10n.triageReasonDeadlinePassed
        : l10n.triageReasonOverdueDays(days);
  }

  /// What a screen reader should say, in the reader's language.
  static String semanticLabelIn(
    AppL10n l10n,
    ActionTriageDecision decision,
    ActionItem action,
    DateTime now,
  ) {
    final spoken = _spokenBadgeIn(l10n, decision, action, now);
    if (spoken == null) return action.title;
    return l10n.triageSemanticLabel(spoken, action.title);
  }

  /// The badge as a screen reader should hear it — words, not capitals.
  ///
  /// Only the overdue-by-N-days badge differs from the written one: `Overdue ·
  /// 2 days` is spoken as `Overdue by 2 days`, and that is its own key rather
  /// than a substitution performed on somebody's translation.
  static String? _spokenBadgeIn(
    AppL10n l10n,
    ActionTriageDecision decision,
    ActionItem action,
    DateTime now,
  ) {
    if (decision.primaryReason == TriageReason.overdue) {
      final days = _overdueDays(action, now);
      return days == null
          ? l10n.searchFilterOverdue
          : l10n.triageSpokenOverdueDays(days);
    }
    return _badgeSentenceIn(l10n, decision, action, now);
  }
}
