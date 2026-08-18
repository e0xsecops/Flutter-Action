import '../../capture/domain/source_item.dart';
import '../../extraction/domain/extraction_schema.dart';

/// What the user is looking for, and what they have narrowed it to.
///
/// Deliberately a plain value: search state is not persisted, never leaves the
/// device, and is never logged. The query string in particular is treated as
/// sensitive — it can contain an account number as easily as a word.

/// Lifecycle narrowing. Archived Actions are excluded unless asked for.
enum StatusFilter { active, completed, archived }

/// Deadline narrowing, resolved against the same calendar rules triage uses.
enum DueFilter { overdue, today, thisWeek, noDeadline }

enum OriginFilter { manual, extraction }

final class SearchFilters {
  const SearchFilters({
    this.statuses = const {},
    this.urgencies = const {},
    this.dues = const {},
    this.origins = const {},
    this.sourceTypes = const {},
  });

  final Set<StatusFilter> statuses;
  final Set<ActionUrgency> urgencies;
  final Set<DueFilter> dues;
  final Set<OriginFilter> origins;
  final Set<SourceType> sourceTypes;

  bool get isEmpty =>
      statuses.isEmpty &&
      urgencies.isEmpty &&
      dues.isEmpty &&
      origins.isEmpty &&
      sourceTypes.isEmpty;

  int get activeCount =>
      (statuses.isEmpty ? 0 : 1) +
      (urgencies.isEmpty ? 0 : 1) +
      (dues.isEmpty ? 0 : 1) +
      (origins.isEmpty ? 0 : 1) +
      (sourceTypes.isEmpty ? 0 : 1);

  /// Whether the user explicitly asked to see archived Actions. Without this
  /// they stay out — archiving means "stop showing me this", and a search
  /// result is still showing it.
  bool get includesArchived => statuses.contains(StatusFilter.archived);

  SearchFilters toggleStatus(StatusFilter v) =>
      _copy(statuses: _toggled(statuses, v));
  SearchFilters toggleUrgency(ActionUrgency v) =>
      _copy(urgencies: _toggled(urgencies, v));
  SearchFilters toggleDue(DueFilter v) => _copy(dues: _toggled(dues, v));
  SearchFilters toggleOrigin(OriginFilter v) =>
      _copy(origins: _toggled(origins, v));
  SearchFilters toggleSourceType(SourceType v) =>
      _copy(sourceTypes: _toggled(sourceTypes, v));

  SearchFilters cleared() => const SearchFilters();

  static Set<T> _toggled<T>(Set<T> set, T value) =>
      set.contains(value) ? (set.toSet()..remove(value)) : (set.toSet()..add(value));

  SearchFilters _copy({
    Set<StatusFilter>? statuses,
    Set<ActionUrgency>? urgencies,
    Set<DueFilter>? dues,
    Set<OriginFilter>? origins,
    Set<SourceType>? sourceTypes,
  }) =>
      SearchFilters(
        statuses: statuses ?? this.statuses,
        urgencies: urgencies ?? this.urgencies,
        dues: dues ?? this.dues,
        origins: origins ?? this.origins,
        sourceTypes: sourceTypes ?? this.sourceTypes,
      );
}

/// A query plus its narrowing.
///
/// Filters combine as **AND across dimensions, OR within one**: choosing
/// "Active" and "Critical" means active *and* critical, while choosing
/// "Critical" and "Important" means either of those urgencies. Anything else
/// would make a filter chip mean something different depending on its
/// neighbours.
final class SearchQuery {
  const SearchQuery({this.text = '', this.filters = const SearchFilters()});

  final String text;
  final SearchFilters filters;

  String get trimmed => text.trim();

  bool get isEmpty => trimmed.isEmpty && filters.isEmpty;

  /// Source text is only searched from two characters up.
  ///
  /// One character would sweep every capture's whole OCR body into the
  /// results — a lot of sensitive text on screen in exchange for nothing
  /// useful. Action titles are still matched at one character, because a
  /// short list of names is genuinely helpful.
  static const int minimumSourceQueryLength = 2;

  bool get searchesSources => trimmed.runes.length >= minimumSourceQueryLength;

  SearchQuery withText(String value) =>
      SearchQuery(text: value, filters: filters);

  SearchQuery withFilters(SearchFilters value) =>
      SearchQuery(text: text, filters: value);
}
