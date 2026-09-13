/// The Action Brief: what Today says about your situation, in one sentence.
///
/// **Entirely deterministic, entirely local.** Every statement here is derived
/// by counting things the user already confirmed — triaged Actions, captures
/// that have been read but not acted on, upcoming deadlines. There is no model
/// call, no score, no ranking heuristic beyond the Day-8 triage engine that
/// already decides what "needs attention" means.
///
/// That matters for two reasons. It costs nothing and cannot be wrong in the
/// way a generated summary can be wrong; and it means the headline on the first
/// screen of the app never depends on a network, a key, or a provider being up.
///
/// **Why it is its own class rather than widget code.** The interesting part is
/// the rules, and rules that live inside a `build` method cannot be tested
/// without pumping a widget tree. This is pure and takes plain data.
///
/// **Why the string bundle is a parameter.** The rules decide *what is true*;
/// the bundle decides what that reads like in the user's language. Passing it
/// in keeps this a pure function of (data, strings) — no `BuildContext`, no
/// widget tree, still testable by calling it — and it means a brief in Bengali
/// goes through exactly the same branches as a brief in English rather than
/// through a parallel path nobody exercises.
library;

import '../../../l10n/gen/app_l10n.dart';
import '../../actions/application/action_triage.dart';
import '../../actions/domain/action_item.dart';
import '../../capture/domain/source_item.dart';

/// What the brief is telling you, as a category.
///
/// The UI keys its tone off this rather than off string matching, so a copy
/// change cannot silently change a colour.
enum BriefTone {
  /// Nothing wants anything. Worth saying plainly and warmly.
  clear,

  /// Something is due or overdue.
  attention,

  /// Nothing urgent, but there is unreviewed material.
  review,

  /// Nothing urgent, nothing to review, but something is coming.
  upcoming,
}

class ActionBrief {
  const ActionBrief({
    required this.tone,
    required this.headline,
    this.detail,
    this.topAction,
    this.topDecision,
    this.needsAttentionCount = 0,
    this.awaitingReviewCount = 0,
    this.upcomingCount = 0,
    this.hasEverHadAction = false,
  });

  final BriefTone tone;

  /// The one line. Short, factual, never exclamatory.
  final String headline;

  /// A second line, when there is something genuinely useful to add.
  final String? detail;

  /// The single Action the brief is pointing at, if any.
  final ActionItem? topAction;
  final ActionTriageDecision? topDecision;

  final int needsAttentionCount;
  final int awaitingReviewCount;
  final int upcomingCount;

  /// Whether this device has ever held an Action.
  ///
  /// The distinction the whole empty state turns on: someone who just finished
  /// their list and someone who has never used the app need opposite things
  /// said to them.
  final bool hasEverHadAction;

  /// True only for a genuinely new user.
  ///
  /// Deliberately keyed off [hasEverHadAction] rather than off the counts
  /// alone. Counting to zero also describes someone who has just completed
  /// everything, and showing them a "here is what Action does" primer erases
  /// the win and implies the app has forgotten them.
  bool get isFirstRun => !hasEverHadAction && tone == BriefTone.clear;

  /// Builds the brief from local state.
  ///
  /// [sources] contributes every capture that has not yet become an Action —
  /// the honest definition of "still on your plate", whatever state it is in.
  factory ActionBrief.from({
    required TriagedHome home,
    required List<SourceItem> sources,
    required Set<String> actionedSourceIds,
    required bool hasAnyAction,
    required AppL10n l10n,
  }) {
    // Every capture that has not become an Action yet — including one still
    // being read, and one that failed.
    //
    // The narrower "ready and has text" rule was wrong in a way only the device
    // shows: capture something and Today went blank until OCR finished, so the
    // thing you just added appeared to have been swallowed. A capture mid-read
    // is still waiting on you; the card says which state it is in.
    final awaitingReview =
        sources.where((s) => !actionedSourceIds.contains(s.id)).length;

    final needsAttention = home.needsAttention.length;
    final upcoming = home.upcoming.length;

    final top = home.needsAttention.isNotEmpty
        ? home.needsAttention.first
        : (home.upcoming.isNotEmpty ? home.upcoming.first : null);
    final decision = top == null ? null : home.decisionFor(top.id);

    if (needsAttention > 0) {
      return ActionBrief(
        tone: BriefTone.attention,
        headline: l10n.briefHeadlineNeedsAttention(needsAttention),
        detail: _reviewDetail(l10n, awaitingReview),
        topAction: top,
        topDecision: decision,
        needsAttentionCount: needsAttention,
        awaitingReviewCount: awaitingReview,
        upcomingCount: upcoming,
        hasEverHadAction: hasAnyAction,
      );
    }

    if (awaitingReview > 0) {
      return ActionBrief(
        tone: BriefTone.review,
        headline: l10n.briefHeadlineCapturesWaiting(awaitingReview),
        detail: l10n.briefDetailNothingOverdue,
        topAction: top,
        topDecision: decision,
        awaitingReviewCount: awaitingReview,
        upcomingCount: upcoming,
        hasEverHadAction: hasAnyAction,
      );
    }

    if (upcoming > 0) {
      return ActionBrief(
        tone: BriefTone.upcoming,
        headline: l10n.briefHeadlineNothingToday,
        detail: l10n.briefDetailComingUp(upcoming),
        topAction: top,
        topDecision: decision,
        upcomingCount: upcoming,
        hasEverHadAction: hasAnyAction,
      );
    }

    // Nothing open at all. Distinguish "you finished everything" from "you have
    // never used this", because congratulating a brand-new user for clearing an
    // empty list is hollow.
    return ActionBrief(
      tone: BriefTone.clear,
      // NOT "Nothing here yet". Day 15 banned that phrasing outright, and the
      // ban is right: it describes the app's state rather than telling the
      // person what to do, which is the whole job of a first-run screen.
      headline: hasAnyAction
          ? l10n.briefHeadlineClear
          : l10n.briefHeadlineFirstRun,
      detail: hasAnyAction
          ? l10n.briefDetailClear
          : l10n.briefDetailFirstRun,
      hasEverHadAction: hasAnyAction,
    );
  }

  static String? _reviewDetail(AppL10n l10n, int awaitingReview) {
    if (awaitingReview == 0) return null;
    return l10n.briefDetailAlsoWaiting(awaitingReview);
  }
}
