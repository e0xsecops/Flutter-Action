/// Renders any [IntelligenceResult].
///
/// One view for fifteen tools. That is the payoff for the shared result model:
/// evidence, uncertainty, warnings and suggestions all behave identically
/// everywhere, so a user who learns to read one tool's output can read them
/// all — and a new tool inherits the honesty affordances rather than
/// reimplementing them.
library;

import 'package:flutter/material.dart';

import '../../../design/components/glass_surface.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../domain/intelligence_result.dart';

class IntelligenceResultView extends StatelessWidget {
  const IntelligenceResultView({
    super.key,
    required this.result,
    this.selectedSuggestions = const {},
    this.onToggleSuggestion,
  });

  final IntelligenceResult result;

  /// Suggestion ids the user has ticked.
  final Set<String> selectedSuggestions;

  /// Null makes suggestions read-only.
  final void Function(String id)? onToggleSuggestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Warnings first. A caution about a truncated or unevidenced result
        // has to arrive before the content it qualifies, or the reader has
        // already believed it.
        for (final warning in result.warnings) ...[
          _WarningBanner(warning: warning),
          const SizedBox(height: Space.md),
        ],

        for (final section in result.sections)
          if (!section.isEmpty) ...[
            _SectionView(section: section),
            const SizedBox(height: Space.lg),
          ],

        if (result.suggestions.isNotEmpty) ...[
          _SuggestionsView(
            suggestions: result.suggestions,
            selected: selectedSuggestions,
            onToggle: onToggleSuggestion,
          ),
          const SizedBox(height: Space.lg),
        ],

        if (result.citations.isNotEmpty)
          _EvidenceView(citations: result.citations),
      ],
    );
  }
}

class _WarningBanner extends StatelessWidget {
  const _WarningBanner({required this.warning});

  final IntelligenceWarning warning;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final isCaution = warning.level == IntelligenceWarningLevel.caution;
    final tint = isCaution ? colors.urgencyImportant : colors.textSecondary;

    return Container(
      padding: const EdgeInsets.all(Space.md),
      decoration: BoxDecoration(
        color: tint.withValues(alpha: 0.08),
        borderRadius: Radii.rMd,
        border: Border.all(
          color: tint.withValues(alpha: 0.3),
          width: Strokes.hairline,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isCaution ? Icons.error_outline : Icons.info_outline,
            size: 18,
            color: tint,
          ),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Text(
              warning.message,
              style: text.bodySmall?.copyWith(color: colors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionView extends StatelessWidget {
  const _SectionView({required this.section});

  final IntelligenceSection section;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(section.title, style: text.titleSmall),
        const SizedBox(height: Space.sm),
        switch (section.kind) {
          IntelligenceSectionKind.prose => SelectableText(
              section.body ?? '',
              style: text.bodyLarge,
            ),
          IntelligenceSectionKind.quote => _Quote(text: section.body ?? ''),
          IntelligenceSectionKind.bullets => _Bullets(items: section.bullets),
          IntelligenceSectionKind.facts => _Facts(facts: section.facts),
          IntelligenceSectionKind.table => _Table(
              columns: section.columns,
              rows: section.rows,
            ),
        },
      ],
    );
  }
}

class _Quote extends StatelessWidget {
  const _Quote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.fromLTRB(Space.md, Space.sm, Space.md, Space.sm),
      decoration: BoxDecoration(
        // A quotation's spine marks its leading edge, which is the right-hand
        // side in a right-to-left script.
        border: BorderDirectional(
          start: BorderSide(color: colors.borderStrong, width: Strokes.spine),
        ),
      ),
      child: SelectableText(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontStyle: FontStyle.italic),
      ),
    );
  }
}

class _Bullets extends StatelessWidget {
  const _Bullets({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, right: Space.sm),
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colors.textTertiary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: SelectableText(item, style: text.bodyLarge),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _Facts extends StatelessWidget {
  const _Facts({required this.facts});

  final List<IntelligenceFact> facts;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final fact in facts)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(fact.label, style: text.bodySmall),
                    ),
                    // Uncertainty is a visible property of the fact, not a
                    // footnote somewhere else. A value Action could not
                    // confirm must not look like one it could.
                    if (fact.uncertain)
                      Semantics(
                        label: 'Unconfirmed',
                        child: Icon(
                          Icons.help_outline,
                          size: 16,
                          color: colors.urgencyImportant,
                        ),
                      ),
                  ],
                ),
                if (fact.value.isNotEmpty)
                  SelectableText(
                    fact.value,
                    style: text.bodyLarge?.copyWith(
                      fontFeatures: AppTextFeatures.numeric,
                    ),
                  ),
                if (fact.citation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: Space.xs),
                    child: _EvidenceChip(citation: fact.citation!),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Numeric font features, without importing the whole type scale here.
abstract final class AppTextFeatures {
  static const numeric = <FontFeature>[FontFeature.tabularFigures()];
}

class _Table extends StatelessWidget {
  const _Table({required this.columns, required this.rows});

  final List<String> columns;
  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = context.colors;
    // Ragged rows are tolerated rather than rejected: a model that returns one
    // short row should not cost the user the other twelve.
    final width = [
      columns.length,
      ...rows.map((r) => r.length),
    ].fold<int>(0, (a, b) => a > b ? a : b);

    if (width == 0) return const SizedBox.shrink();

    List<Widget> cells(List<String> values, TextStyle? style) => [
          for (var i = 0; i < width; i++)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Space.sm,
                vertical: Space.sm,
              ),
              child: Text(i < values.length ? values[i] : '', style: style),
            ),
        ];

    // Wide content scrolls inside its own box; the page never scrolls
    // sideways.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: const IntrinsicColumnWidth(),
        border: TableBorder.all(
          color: colors.border,
          width: Strokes.hairline,
          borderRadius: Radii.rSm,
        ),
        children: [
          if (columns.isNotEmpty)
            TableRow(children: cells(columns, text.labelLarge)),
          for (final row in rows)
            TableRow(children: cells(row, text.bodyMedium)),
        ],
      ),
    );
  }
}

class _EvidenceChip extends StatelessWidget {
  const _EvidenceChip({required this.citation});

  final IntelligenceCitation citation;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Tooltip(
      message: citation.quotedText,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.format_quote, size: 14, color: colors.confidenceConfirmed),
          const SizedBox(width: Space.xs),
          Flexible(
            child: Text(
              citation.locationLabel,
              style: text.bodySmall?.copyWith(
                color: colors.confidenceConfirmed,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionsView extends StatelessWidget {
  const _SuggestionsView({
    required this.suggestions,
    required this.selected,
    this.onToggle,
  });

  final List<IntelligenceSuggestion> suggestions;
  final Set<String> selected;
  final void Function(String id)? onToggle;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(_headingFor(suggestions), style: text.titleSmall),
        const SizedBox(height: Space.sm),
        for (final suggestion in suggestions)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.sm),
            child: GlassSurface(
              intensity: GlassIntensity.subtle,
              padding: const EdgeInsets.all(Space.md),
              selected: selected.contains(suggestion.id),
              onTap: onToggle == null ? null : () => onToggle!(suggestion.id),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (onToggle != null)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: Space.sm),
                      child: Icon(
                        selected.contains(suggestion.id)
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        size: 20,
                        color: context.colors.brand,
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(suggestion.title, style: text.titleSmall),
                        if (suggestion.detail != null)
                          Padding(
                            padding: const EdgeInsets.only(top: Space.xxs),
                            child:
                                Text(suggestion.detail!, style: text.bodySmall),
                          ),
                        if (suggestion.citation != null)
                          Padding(
                            padding: const EdgeInsets.only(top: Space.xs),
                            child:
                                _EvidenceChip(citation: suggestion.citation!),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  /// Names what accepting these would do, so the checkbox is not ambiguous.
  static String _headingFor(List<IntelligenceSuggestion> suggestions) {
    final kinds = suggestions.map((s) => s.kind).toSet();
    if (kinds.length == 1) {
      return switch (kinds.single) {
        IntelligenceSuggestionKind.step => 'Suggested steps',
        IntelligenceSuggestionKind.action => 'Suggested action',
        IntelligenceSuggestionKind.question => 'Worth asking',
        IntelligenceSuggestionKind.deadline => 'Suggested deadlines',
      };
    }
    return 'Suggestions';
  }
}

class _EvidenceView extends StatelessWidget {
  const _EvidenceView({required this.citations});

  final List<IntelligenceCitation> citations;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      collapsedShape: const Border(),
      title: Text(
        citations.length == 1
            ? '1 supporting quote'
            : '${citations.length} supporting quotes',
        style: text.titleSmall,
      ),
      children: [
        for (final citation in citations)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(citation.locationLabel, style: text.bodySmall),
                const SizedBox(height: Space.xs),
                _Quote(text: citation.quotedText),
              ],
            ),
          ),
      ],
    );
  }
}
