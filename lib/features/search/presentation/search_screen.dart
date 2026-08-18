import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../design/components/section_header.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../design/tokens/typography.dart';
import '../../../shared/widgets/empty_view.dart';
import '../../actions/domain/action_item.dart';
import '../../extraction/domain/extraction_schema.dart';
import '../application/search_controller.dart';
import '../domain/search_query.dart';
import '../domain/search_result.dart';

/// Finding things, without asking anyone else.
///
/// Every character typed here stays in this process: no query is sent to a
/// model, uploaded, indexed remotely, logged to analytics, or kept after the
/// screen closes. That is the whole feature — a private index of your own
/// paperwork is only useful if it is genuinely private.
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchControllerProvider);
    final notifier = ref.read(searchControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _SearchField(
              controller: _controller,
              focus: _focus,
              onChanged: notifier.updateText,
              onSubmitted: (_) => notifier.searchNow(),
              onClear: () {
                _controller.clear();
                notifier.clear();
                _focus.requestFocus();
              },
              onBack: () => context.canPop()
                  ? context.pop()
                  : context.go(Routes.home),
            ),
            _FilterBar(
              filters: state.query.filters,
              onChanged: notifier.updateFilters,
            ),
            Expanded(child: _Results(state: state)),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.focus,
    required this.onChanged,
    required this.onSubmitted,
    required this.onClear,
    required this.onBack,
  });

  final TextEditingController controller;
  final FocusNode focus;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onClear;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.xs, Space.sm, Space.page, Space.sm),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back',
            onPressed: onBack,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focus,
              // Straight to typing: arriving here is already the intent.
              autofocus: true,
              textInputAction: TextInputAction.search,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: 'Search actions and captures',
                border: InputBorder.none,
                isDense: true,
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (context, value, _) => value.text.isEmpty
                      ? const SizedBox.shrink()
                      : IconButton(
                          tooltip: 'Clear',
                          icon: Icon(Icons.close, color: colors.textTertiary),
                          onPressed: onClear,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A single scrolling row of chips rather than an advanced-search form.
class _FilterBar extends StatelessWidget {
  const _FilterBar({required this.filters, required this.onChanged});

  final SearchFilters filters;
  final ValueChanged<SearchFilters> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Space.page),
        children: [
          _Chip(
            label: 'Active',
            selected: filters.statuses.contains(StatusFilter.active),
            onTap: () => onChanged(filters.toggleStatus(StatusFilter.active)),
          ),
          _Chip(
            label: 'Completed',
            selected: filters.statuses.contains(StatusFilter.completed),
            onTap: () =>
                onChanged(filters.toggleStatus(StatusFilter.completed)),
          ),
          _Chip(
            label: 'Overdue',
            selected: filters.dues.contains(DueFilter.overdue),
            onTap: () => onChanged(filters.toggleDue(DueFilter.overdue)),
          ),
          _Chip(
            label: 'This week',
            selected: filters.dues.contains(DueFilter.thisWeek),
            onTap: () => onChanged(filters.toggleDue(DueFilter.thisWeek)),
          ),
          _Chip(
            label: 'Critical',
            selected: filters.urgencies.contains(ActionUrgency.critical),
            onTap: () =>
                onChanged(filters.toggleUrgency(ActionUrgency.critical)),
          ),
          _Chip(
            label: 'Created by you',
            selected: filters.origins.contains(OriginFilter.manual),
            onTap: () => onChanged(filters.toggleOrigin(OriginFilter.manual)),
          ),
          // Archived is opt-in and last: it is the least expected result.
          _Chip(
            label: 'Archived',
            selected: filters.statuses.contains(StatusFilter.archived),
            onTap: () => onChanged(filters.toggleStatus(StatusFilter.archived)),
          ),
          if (!filters.isEmpty)
            _Chip(
              label: 'Clear filters',
              selected: false,
              onTap: () => onChanged(filters.cleared()),
            ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: Space.sm),
      child: Semantics(
        selected: selected,
        button: true,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Radii.pill),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: Space.md),
            decoration: BoxDecoration(
              color: selected ? colors.brandSubtle : colors.surfaceElevated,
              borderRadius: BorderRadius.circular(Radii.pill),
              border: Border.all(
                color: selected ? colors.brand : colors.border,
                width: Strokes.hairline,
              ),
            ),
            child: Text(
              label,
              style: text.labelLarge?.copyWith(
                color: selected ? colors.brand : colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({required this.state});

  final SearchState state;

  @override
  Widget build(BuildContext context) {
    if (state.isIdle) {
      return const EmptyView(
        icon: Icons.search,
        title: 'Search your actions and captures',
        message: 'Everything is searched on this device. Nothing you type '
            'here leaves it.',
      );
    }

    final results = state.results;

    if (results.isEmpty && !results.hasFailure) {
      // Never offered as "ask the AI" — there is nothing to ask.
      return EmptyView(
        icon: Icons.search_off,
        title: 'No matches for "${state.query.trimmed}"',
        message: state.query.filters.isEmpty
            ? 'Try fewer words, or a reference number exactly as it appears.'
            : 'Try fewer words, or clear the filters.',
      );
    }

    return CustomScrollView(
      slivers: [
        if (results.hasFailure)
          SliverToBoxAdapter(child: _FailureNotice(results: results)),
        if (results.actions.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Actions',
              count: results.actions.length,
            ),
          ),
          SliverList.separated(
            itemCount: results.actions.length,
            separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: Space.page),
              child: _ActionResultRow(result: results.actions[i]),
            ),
          ),
        ],
        if (results.sources.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Captures',
              count: results.sources.length,
            ),
          ),
          SliverList.separated(
            itemCount: results.sources.length,
            separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: Space.page),
              child: _SourceResultRow(result: results.sources[i]),
            ),
          ),
        ],
        const SliverToBoxAdapter(child: SizedBox(height: Space.xxxl)),
      ],
    );
  }
}

/// Says the search was incomplete rather than letting it read as "nothing
/// found" — those are very different answers.
class _FailureNotice extends StatelessWidget {
  const _FailureNotice({required this.results});

  final SearchResultSet results;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final what = results.actionsFailed && results.sourcesFailed
        ? 'your actions or your captures'
        : results.actionsFailed
            ? 'your actions'
            : 'your captures';

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.md, Space.page, 0),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: colors.urgencyImportant),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Text(
              "Couldn't search $what, so these results may be incomplete.",
              style: text.bodySmall?.copyWith(color: colors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionResultRow extends StatelessWidget {
  const _ActionResultRow({required this.result});

  final ActionSearchResult result;

  /// Whether the match was in the title, in which case showing a "Title · …"
  /// line underneath would print the same words twice.
  bool get _titleMatched => switch (result.match.field) {
        MatchField.titleExact ||
        MatchField.titlePrefix ||
        MatchField.titleContains =>
          true,
        _ => false,
      };

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final action = result.action;
    final completed = action.status == ActionStatus.completed;

    return Material(
      color: colors.surfaceElevated,
      borderRadius: Radii.rMd,
      child: InkWell(
        onTap: () => context.push(Routes.action(action.id)),
        borderRadius: Radii.rMd,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Radii.rMd,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          padding: const EdgeInsets.all(Space.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _titleMatched
                        // The title *is* the evidence here, so it carries the
                        // emphasis and no second line repeats it underneath.
                        ? Text.rich(
                            TextSpan(
                              children: _highlighted(
                                action.title,
                                result.match,
                                text.titleSmall,
                                colors,
                              ),
                            ),
                            style: text.titleSmall?.copyWith(
                              color: completed
                                  ? colors.textTertiary
                                  : colors.textPrimary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            action.title,
                            style: text.titleSmall?.copyWith(
                              color: completed
                                  ? colors.textTertiary
                                  : colors.textPrimary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                  if (completed)
                    Icon(Icons.check_circle_outline_rounded,
                        size: 18, color: colors.confidenceConfirmed),
                ],
              ),
              if (!_titleMatched) ...[
                const SizedBox(height: Space.xs),
                _MatchLine(match: result.match, extra: result.otherMatchCount),
              ],
              if (action.dueAt != null) ...[
                const SizedBox(height: Space.xxs),
                Text(
                  'Due ${DateFormat('d MMM yyyy').format(action.dueAt!.wallClock)}',
                  style: text.bodySmall?.copyWith(
                    color: colors.textTertiary,
                    fontFeatures: AppText.numeric,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SourceResultRow extends StatelessWidget {
  const _SourceResultRow({required this.result});

  final SourceSearchResult result;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final source = result.source;

    return Material(
      color: colors.surfaceElevated,
      borderRadius: Radii.rMd,
      child: InkWell(
        onTap: () => context.push(Routes.source(source.id)),
        borderRadius: Radii.rMd,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Radii.rMd,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          padding: const EdgeInsets.all(Space.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.description_outlined,
                      size: 16, color: colors.textSecondary),
                  const SizedBox(width: Space.sm),
                  Expanded(
                    child: Text(
                      source.type.provenanceLabel,
                      style: text.titleSmall,
                    ),
                  ),
                  Text(
                    DateFormat('d MMM').format(source.capturedAt.toLocal()),
                    style: text.bodySmall?.copyWith(color: colors.textTertiary),
                  ),
                ],
              ),
              const SizedBox(height: Space.xs),
              _MatchLine(match: result.match, extra: 0),
            ],
          ),
        ),
      ),
    );
  }
}

/// Why this row is here: a short label, then the matching text with the
/// query emphasised where its position could be resolved honestly.
class _MatchLine extends StatelessWidget {
  const _MatchLine({required this.match, required this.extra});

  final SearchMatch match;
  final int extra;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final base = text.bodySmall?.copyWith(color: colors.textSecondary);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${match.label} · ',
          style: text.bodySmall?.copyWith(color: colors.textTertiary),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(children: _spans(base, colors)),
            style: base,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (extra > 0)
          Text(
            '+$extra',
            style: text.bodySmall?.copyWith(color: colors.textTertiary),
          ),
      ],
    );
  }

  List<InlineSpan> _spans(TextStyle? base, AppColors colors) {
    if (!match.hasHighlight) return [TextSpan(text: match.snippet)];

    final start = match.highlightStart!;
    final end = match.highlightEnd!;
    final emphasised = base?.copyWith(
      color: colors.textPrimary,
      fontWeight: FontWeight.w600,
    );
    return [
      TextSpan(text: match.snippet.substring(0, start)),
      TextSpan(text: match.snippet.substring(start, end), style: emphasised),
      TextSpan(text: match.snippet.substring(end)),
    ];
  }
}

/// Splits [text] so the matched part can be emphasised, when the match's
/// position was resolvable. Otherwise the text is returned whole — a
/// highlight in the wrong place is worse than none.
List<InlineSpan> _highlighted(
  String text,
  SearchMatch match,
  TextStyle? base,
  AppColors colors,
) {
  if (!match.hasHighlight ||
      match.highlightEnd! > text.length ||
      match.highlightStart! < 0) {
    return [TextSpan(text: text)];
  }
  return [
    TextSpan(text: text.substring(0, match.highlightStart!)),
    TextSpan(
      text: text.substring(match.highlightStart!, match.highlightEnd!),
      style: base?.copyWith(color: colors.brand),
    ),
    TextSpan(text: text.substring(match.highlightEnd!)),
  ];
}
