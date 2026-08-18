import '../../actions/domain/action_item.dart';
import '../../capture/domain/source_item.dart';

/// Where a result matched, in the order the ranking prefers.
///
/// The order of this enum *is* the ranking precedence, so a lower index is a
/// better match. Written once, here, rather than as a scattered set of
/// comparison rules.
enum MatchField {
  /// The whole title, exactly.
  titleExact,

  /// The title starts with the query.
  titlePrefix,

  titleContains,

  /// A retained fact — a reference number, an organisation — matched exactly.
  factExact,

  factContains,

  /// The reviewed "next step" sentence.
  recommendedNextStep,

  /// One of the Action's chain steps.
  stepTitle,

  /// The Action's own summary text.
  summary,

  /// Text read from, or pasted into, a capture.
  sourceText,
}

/// Why a result is on screen, in words the user can read.
///
/// Carries the snippet to show and, where it can be resolved honestly, the
/// range inside that snippet to highlight. When the range cannot be resolved
/// exactly, it is left null rather than guessed — a highlight in the wrong
/// place is worse than none.
final class SearchMatch {
  const SearchMatch({
    required this.field,
    required this.label,
    required this.snippet,
    this.highlightStart,
    this.highlightEnd,
  });

  final MatchField field;

  /// A short human label: "Title", "Reference number", "Step".
  final String label;

  /// The text to show. Never the whole OCR body — a bounded window.
  final String snippet;

  final int? highlightStart;
  final int? highlightEnd;

  bool get hasHighlight => highlightStart != null && highlightEnd != null;
}

sealed class SearchResult {
  const SearchResult();

  SearchMatch get match;
}

/// One Action, once — even when the query matched its title *and* a fact
/// *and* a step. Only the best match is shown; the rest would be noise.
final class ActionSearchResult extends SearchResult {
  const ActionSearchResult({
    required this.action,
    required this.match,
    required this.otherMatchCount,
  });

  final ActionItem action;

  @override
  final SearchMatch match;

  /// How many further fields also matched, for a quiet "+2 more" if wanted.
  final int otherMatchCount;
}

/// A capture. Distinct from an Action derived from it: they are different
/// objects, and merging them would hide which one you are looking at.
final class SourceSearchResult extends SearchResult {
  const SourceSearchResult({required this.source, required this.match});

  final SourceItem source;

  @override
  final SearchMatch match;
}

/// Everything a search turned up, plus what did not work.
///
/// Subsystem failures are carried rather than thrown: if captures cannot be
/// read, the Actions that *were* found should still appear, and the screen
/// must say the search was incomplete instead of "no matches".
final class SearchResultSet {
  const SearchResultSet({
    this.actions = const [],
    this.sources = const [],
    this.actionsFailed = false,
    this.sourcesFailed = false,
  });

  final List<ActionSearchResult> actions;
  final List<SourceSearchResult> sources;

  final bool actionsFailed;
  final bool sourcesFailed;

  bool get isEmpty => actions.isEmpty && sources.isEmpty;
  bool get hasFailure => actionsFailed || sourcesFailed;
  int get total => actions.length + sources.length;
}
