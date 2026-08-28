import '../../actions/application/action_triage.dart';
import '../../actions/domain/action_item.dart';
import '../../actions/domain/action_repository.dart';
import '../../capture/data/source_store.dart';
import '../domain/search_query.dart';
import '../domain/search_result.dart';
import 'search_normalizer.dart';

/// Local search over everything the app already knows.
///
/// Entirely on-device: no model call, no network, no index shipped anywhere.
/// The query itself never leaves this process and is never logged — it can
/// contain an account number as easily as a word.
///
/// **Why no FTS5.** The bundled SQLite does have it, but its tokeniser splits
/// on punctuation, so `INV-2048` becomes two tokens and `MATCH 'INV-2048'`
/// fails outright as query syntax. Reference numbers are one of the main
/// reasons to search at all, and a persisted index would additionally need a
/// migration, staleness handling and a rebuild path. For a corpus of this
/// size, composing over the existing stores is both faster to trust and
/// exactly precise about identifiers.
class ActionSearchService {
  const ActionSearchService({
    required ActionRepository actions,
    required Future<SourceStore> Function() sources,
  }) : this._(actions, sources);

  const ActionSearchService._(this._actions, this._sources);

  final ActionRepository _actions;
  final Future<SourceStore> Function() _sources;

  /// Runs a search. Never throws: a subsystem that fails is reported as
  /// failed, and whatever the other one found is still returned.
  Future<SearchResultSet> search(
    SearchQuery query, {
    required DateTime now,
  }) async {
    if (query.isEmpty) return const SearchResultSet();

    final needle = query.trimmed;
    // Folded once for the whole query rather than once per field of every
    // Action and every capture. The comparison is unchanged; what goes away
    // is thousands of identical foldings of the same handful of characters.
    final foldedNeedle = SearchNormalizer.fold(needle);

    List<ActionSearchResult> actionResults = const [];
    var actionsFailed = false;
    try {
      actionResults = await _searchActions(query, needle, foldedNeedle, now);
    } on Object {
      actionsFailed = true;
    }

    List<SourceSearchResult> sourceResults = const [];
    var sourcesFailed = false;
    // Captures are only searched once the query is specific enough to be
    // worth putting their text on screen.
    if (needle.isNotEmpty && query.searchesSources) {
      try {
        sourceResults = await _searchSources(query, needle, foldedNeedle);
      } on Object {
        sourcesFailed = true;
      }
    }

    return SearchResultSet(
      actions: actionResults,
      sources: sourceResults,
      actionsFailed: actionsFailed,
      sourcesFailed: sourcesFailed,
    );
  }

  // ------------------------------------------------------------- actions --

  Future<List<ActionSearchResult>> _searchActions(
    SearchQuery query,
    String needle,
    String foldedNeedle,
    DateTime now,
  ) async {
    final all = await _actions.watchAll().first;
    final results = <ActionSearchResult>[];

    for (final action in all) {
      if (!_passesFilters(action, query.filters, now)) continue;

      final matches = needle.isEmpty
          // Filters alone: everything that passes is a result, described by
          // its title so the row still says something.
          ? [
              SearchMatch(
                field: MatchField.titleContains,
                label: 'Title',
                snippet: action.title,
              ),
            ]
          : _matchAction(action, needle, foldedNeedle);

      if (matches.isEmpty) continue;

      // One Action, once. Matching in three places is not three results.
      matches.sort((a, b) => a.field.index.compareTo(b.field.index));
      results.add(ActionSearchResult(
        action: action,
        match: matches.first,
        otherMatchCount: matches.length - 1,
      ));
    }

    results.sort((a, b) => _compareActions(a, b, now));
    return results;
  }

  List<SearchMatch> _matchAction(
    ActionItem action,
    String needle,
    String foldedNeedle,
  ) {
    final matches = <SearchMatch>[];

    // Title, from most specific to least. Folded once and then tested three
    // ways, rather than folded once per test.
    final foldedTitle = SearchNormalizer.fold(action.title);
    if (foldedTitle == foldedNeedle) {
      matches.add(_titleMatch(action, MatchField.titleExact, needle));
    } else if (foldedTitle.startsWith(foldedNeedle)) {
      matches.add(_titleMatch(action, MatchField.titlePrefix, needle));
    } else if (foldedTitle.contains(foldedNeedle)) {
      matches.add(_titleMatch(action, MatchField.titleContains, needle));
    }

    for (final fact in action.facts) {
      final foldedValue = SearchNormalizer.fold(fact.value);
      // An exact fact match is how a reference number is found, so it ranks
      // above a loose mention of the same digits elsewhere.
      if (foldedValue == foldedNeedle) {
        matches.add(SearchMatch(
          field: MatchField.factExact,
          label: fact.label,
          snippet: fact.value,
          highlightStart: 0,
          highlightEnd: fact.value.length,
        ));
      } else if (foldedValue.contains(foldedNeedle) ||
          SearchNormalizer.fold(fact.label).contains(foldedNeedle)) {
        final (snippet, start, end) =
            SearchNormalizer.snippetAround(fact.value, needle);
        matches.add(SearchMatch(
          field: MatchField.factContains,
          label: fact.label,
          snippet: snippet,
          highlightStart: start,
          highlightEnd: end,
        ));
      }
    }

    final next = action.recommendedNextStep;
    if (next != null && SearchNormalizer.fold(next).contains(foldedNeedle)) {
      final (snippet, start, end) =
          SearchNormalizer.snippetAround(next, needle);
      matches.add(SearchMatch(
        field: MatchField.recommendedNextStep,
        label: 'Next step',
        snippet: snippet,
        highlightStart: start,
        highlightEnd: end,
      ));
    }

    for (final step in action.steps) {
      if (SearchNormalizer.fold(step.title).contains(foldedNeedle)) {
        final (snippet, start, end) =
            SearchNormalizer.snippetAround(step.title, needle);
        matches.add(SearchMatch(
          field: MatchField.stepTitle,
          label: 'Step',
          snippet: snippet,
          highlightStart: start,
          highlightEnd: end,
        ));
        break; // one step is enough to explain the result
      }
    }

    final summary = action.summary;
    if (summary != null &&
        SearchNormalizer.fold(summary).contains(foldedNeedle)) {
      final (snippet, start, end) =
          SearchNormalizer.snippetAround(summary, needle);
      matches.add(SearchMatch(
        field: MatchField.summary,
        label: 'Summary',
        snippet: snippet,
        highlightStart: start,
        highlightEnd: end,
      ));
    }

    return matches;
  }

  SearchMatch _titleMatch(ActionItem action, MatchField field, String needle) {
    final at = SearchNormalizer.indexIn(action.title, needle);
    return SearchMatch(
      field: field,
      label: 'Title',
      snippet: action.title,
      highlightStart: at < 0 ? null : at,
      highlightEnd: at < 0 ? null : at + needle.trim().length,
    );
  }

  // ------------------------------------------------------------- sources --

  Future<List<SourceSearchResult>> _searchSources(
    SearchQuery query,
    String needle,
    String foldedNeedle,
  ) async {
    final store = await _sources();
    final all = await store.all();
    final results = <SourceSearchResult>[];

    for (final source in all) {
      if (query.filters.sourceTypes.isNotEmpty &&
          !query.filters.sourceTypes.contains(source.type)) {
        continue;
      }
      // Action-only filters exclude captures entirely rather than silently
      // ignoring the narrowing the user asked for.
      if (query.filters.statuses.isNotEmpty ||
          query.filters.urgencies.isNotEmpty ||
          query.filters.dues.isNotEmpty ||
          query.filters.origins.isNotEmpty) {
        continue;
      }

      // Normalised OCR text is what search reads; the raw text is left
      // untouched, exactly as captured.
      final body = source.ocr?.normalizedText ?? source.pastedText;
      if (body == null || body.isEmpty) continue;
      // An OCR body is the largest text search touches, and collapsing it is
      // the expensive part. Done once here and handed to the snippet, which
      // would otherwise repeat the same pass over the same characters.
      final collapsedBody = SearchNormalizer.collapse(body);
      if (!collapsedBody.toLowerCase().contains(foldedNeedle)) continue;

      final (snippet, start, end) = SearchNormalizer.snippetAround(
        collapsedBody,
        needle,
        isCollapsed: true,
      );
      results.add(SourceSearchResult(
        source: source,
        match: SearchMatch(
          field: MatchField.sourceText,
          label: 'From capture',
          snippet: snippet,
          highlightStart: start,
          highlightEnd: end,
        ),
      ));
    }

    results.sort((a, b) {
      final byDate = b.source.capturedAt.compareTo(a.source.capturedAt);
      return byDate != 0 ? byDate : a.source.id.compareTo(b.source.id);
    });
    return results;
  }

  // ------------------------------------------------------------- filters --

  bool _passesFilters(ActionItem action, SearchFilters filters, DateTime now) {
    // Archived Actions stay out unless explicitly asked for. Archiving means
    // "stop showing me this", and a search result is still showing it.
    if (action.status == ActionStatus.archived && !filters.includesArchived) {
      return false;
    }

    if (filters.statuses.isNotEmpty) {
      final matches = switch (action.status) {
        ActionStatus.active => filters.statuses.contains(StatusFilter.active),
        ActionStatus.completed =>
          filters.statuses.contains(StatusFilter.completed),
        ActionStatus.archived =>
          filters.statuses.contains(StatusFilter.archived),
      };
      if (!matches) return false;
    }

    if (filters.urgencies.isNotEmpty &&
        !filters.urgencies.contains(action.urgency)) {
      return false;
    }

    if (filters.origins.isNotEmpty) {
      final wanted = switch (action.origin) {
        ActionOrigin.manual => OriginFilter.manual,
        ActionOrigin.extraction => OriginFilter.extraction,
      };
      if (!filters.origins.contains(wanted)) return false;
    }

    if (filters.dues.isNotEmpty) {
      // Reuses the triage classifier rather than re-deriving "overdue" —
      // two definitions of that word is one too many.
      final relation = dueRelationFor(action.dueAt, now);
      final matches = filters.dues.any((f) => switch (f) {
            DueFilter.overdue => relation == DueRelation.overdue,
            DueFilter.today => relation == DueRelation.today,
            DueFilter.thisWeek => relation == DueRelation.today ||
                relation == DueRelation.tomorrow ||
                relation == DueRelation.withinThreeDays ||
                relation == DueRelation.withinSevenDays,
            DueFilter.noDeadline => relation == DueRelation.none,
          });
      if (!matches) return false;
    }

    return true;
  }

  // ------------------------------------------------------------- ranking --

  /// Deterministic, and never influenced by how much money an Action is
  /// about. Relevance first, then a light nod to what is still open, then
  /// recency, then id so the order can never wobble between runs.
  int _compareActions(
    ActionSearchResult a,
    ActionSearchResult b,
    DateTime now,
  ) {
    final byField = a.match.field.index.compareTo(b.match.field.index);
    if (byField != 0) return byField;

    // Something still open is usually what you were looking for.
    final aOpen = a.action.status == ActionStatus.active ? 0 : 1;
    final bOpen = b.action.status == ActionStatus.active ? 0 : 1;
    if (aOpen != bOpen) return aOpen - bOpen;

    final byUpdated = b.action.updatedAt.compareTo(a.action.updatedAt);
    if (byUpdated != 0) return byUpdated;

    return a.action.id.compareTo(b.action.id);
  }
}
