import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../actions/application/action_providers.dart';
import '../../capture/application/capture_controller.dart';
import '../domain/search_query.dart';
import '../domain/search_result.dart';
import 'action_search_service.dart';
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';

/// Everything the search screen renders from.
final class SearchState {
  const SearchState({
    this.query = const SearchQuery(),
    this.results = const SearchResultSet(),
    this.isSearching = false,
  });

  final SearchQuery query;
  final SearchResultSet results;
  final bool isSearching;

  /// Nothing typed and nothing narrowed — the resting state.
  bool get isIdle => query.isEmpty;

  SearchState copyWith({
    SearchQuery? query,
    SearchResultSet? results,
    bool? isSearching,
  }) =>
      SearchState(
        query: query ?? this.query,
        results: results ?? this.results,
        isSearching: isSearching ?? this.isSearching,
      );
}

final searchServiceProvider = Provider<ActionSearchService>((ref) {
  return ActionSearchService(
    actions: ref.watch(actionRepositoryProvider),
    sources: () => ref.read(sourceStoreProvider.future),
  );
});

/// How long to wait after a keystroke before searching.
///
/// Short enough to feel immediate, long enough that typing a word does not
/// run a search per letter.
const Duration searchDebounce = Duration(milliseconds: 180);

class SearchController extends Notifier<SearchState> {
  Timer? _debounce;

  /// Incremented on every request. A result carrying an old generation is
  /// discarded, so a slow search for "ren" can never land on top of a newer
  /// one for "renewal".
  int _generation = 0;

  @override
  SearchState build() {
    ref.onDispose(() => _debounce?.cancel());
    return const SearchState();
  }

  void updateText(String text) {
    state = state.copyWith(query: state.query.withText(text));
    _scheduleSearch();
  }

  void updateFilters(SearchFilters filters) {
    state = state.copyWith(query: state.query.withFilters(filters));
    // A filter tap is a deliberate act, not typing: run it at once.
    _debounce?.cancel();
    unawaited(_run());
  }

  void clear() {
    _debounce?.cancel();
    _generation++;
    state = const SearchState();
  }

  void _scheduleSearch() {
    _debounce?.cancel();
    if (state.query.isEmpty) {
      // Emptying the box should feel instant, not delayed by a debounce.
      _generation++;
      state = state.copyWith(
        results: const SearchResultSet(),
        isSearching: false,
      );
      return;
    }
    _debounce = Timer(searchDebounce, () => unawaited(_run()));
  }

  Future<void> _run() async {
    if (state.query.isEmpty) {
      state = state.copyWith(
          results: const SearchResultSet(), isSearching: false);
      return;
    }

    final generation = ++_generation;
    state = state.copyWith(isSearching: true);

    final results = await ref.read(searchServiceProvider).search(
          state.query,
          now: ref.read(appClockProvider)(),
        );

    // A newer query started while this one was running: drop this result.
    if (generation != _generation) return;
    state = state.copyWith(results: results, isSearching: false);

    // That a search found nothing is worth knowing; what was searched for is
    // not, and never leaves this process.
    if (results.isEmpty && !results.hasFailure) {
      unawaited(ref.read(appAnalyticsProvider).log(
        AnalyticsEvents.searchNoResults,
      ));
    }
  }

  /// Runs the current query immediately, skipping the debounce. Used by tests
  /// and by "search" on the keyboard.
  Future<void> searchNow() {
    _debounce?.cancel();
    return _run();
  }
}

final searchControllerProvider =
    NotifierProvider<SearchController, SearchState>(SearchController.new);
