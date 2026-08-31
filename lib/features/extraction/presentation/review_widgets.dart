import 'package:flutter/material.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../design/tokens/typography.dart';
import '../domain/extracted_field.dart';
import '../../capture/domain/source_item.dart';
import '../application/evidence_regions.dart';
import '../domain/extraction_evidence.dart';
import 'evidence_lens.dart';
import '../domain/extraction_schema.dart';

/// Shared pieces of the review screen.
///
/// The design-system rule these all follow: confidence is the *cool* family,
/// rendered as **outline + icon + words**, never a solid fill — solid warm
/// fills belong to urgency. And no state is ever communicated by colour
/// alone; every badge carries its label.

/// User-readable confidence, mapped from the domain's field review state.
/// No percentages anywhere — four honest words instead.
enum ConfidenceDisplay {
  confirmed('Confirmed by you', Icons.check_circle_outline_rounded),
  high('High confidence', Icons.verified_outlined),
  review('Needs review', Icons.help_outline_rounded),
  missing('Missing', Icons.remove_circle_outline_rounded);

  const ConfidenceDisplay(this.label, this.icon);

  final String label;
  final IconData icon;

  static ConfidenceDisplay of(ExtractedField field) {
    // A grounded value the validator trusted still reads "high confidence",
    // never "confirmed" — confirmation is a person's word, and the model
    // cannot borrow it.
    if (field.editedByUser || field.reviewState == FieldReviewState.confirmed) {
      return ConfidenceDisplay.confirmed;
    }
    return switch (field.reviewState) {
      FieldReviewState.highConfidence => ConfidenceDisplay.high,
      FieldReviewState.needsReview => ConfidenceDisplay.review,
      FieldReviewState.missing => ConfidenceDisplay.missing,
      FieldReviewState.confirmed => ConfidenceDisplay.confirmed,
    };
  }

  Color colorOf(AppColors colors) => switch (this) {
        ConfidenceDisplay.confirmed => colors.confidenceConfirmed,
        ConfidenceDisplay.high => colors.confidenceHigh,
        ConfidenceDisplay.review => colors.confidenceReview,
        ConfidenceDisplay.missing => colors.confidenceMissing,
      };
}

class ConfidenceBadge extends StatelessWidget {
  const ConfidenceBadge(this.display, {super.key});

  final ConfidenceDisplay display;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = display.colorOf(colors);
    return Semantics(
      label: display.label,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Space.sm,
          vertical: Space.xxs,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: Strokes.hairline),
          borderRadius: Radii.rSm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(display.icon, size: 14, color: color),
            const SizedBox(width: Space.xs),
            Text(
              display.label,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: color, letterSpacing: 0),
            ),
          ],
        ),
      ),
    );
  }
}

/// "Why do you think this?" — a quiet affordance that expands to the exact
/// evidence quote. When grounding failed it says so plainly instead of
/// pretending: an unverified quote is a question, and the row above it will
/// already be carrying a needs-review badge.
class EvidenceTile extends StatefulWidget {
  const EvidenceTile({
    required this.evidence,
    this.onFirstExpand,
    this.source,
    this.label = 'This value',
    super.key,
  });

  final ExtractionEvidence evidence;
  final VoidCallback? onFirstExpand;

  /// The capture this evidence points into. When it has usable geometry the
  /// tile offers the lens; when it does not, the quote is the whole answer and
  /// no promise of a highlight is made.
  final SourceItem? source;

  /// What the evidence supports, for the lens header.
  final String label;

  @override
  State<EvidenceTile> createState() => _EvidenceTileState();
}

class _EvidenceTileState extends State<EvidenceTile> {
  bool _expanded = false;
  bool _everExpanded = false;

  /// Whether the lens would actually have a region to draw.
  ///
  /// Asked here rather than inside the sheet so the affordance and the answer
  /// cannot disagree.
  bool get _canShowOnCapture {
    final source = widget.source;
    if (source?.imagePath == null) return false;
    return EvidenceRegions.forEvidence(
      evidence: widget.evidence,
      lines: source!.ocr?.lines ?? const [],
      imageWidth: source.imageWidth,
      imageHeight: source.imageHeight,
    ).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final grounded = widget.evidence.isGrounded;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: Radii.rSm,
          onTap: () {
            setState(() => _expanded = !_expanded);
            if (_expanded && !_everExpanded) {
              _everExpanded = true;
              widget.onFirstExpand?.call();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.sm),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  grounded
                      ? Icons.format_quote_rounded
                      : Icons.info_outline_rounded,
                  size: 16,
                  color: grounded ? colors.textTertiary : colors.confidenceReview,
                ),
                const SizedBox(width: Space.xs),
                Text(
                  grounded ? 'From source' : 'Not verified',
                  style: text.labelSmall?.copyWith(
                    color:
                        grounded ? colors.textTertiary : colors.confidenceReview,
                  ),
                ),
                const SizedBox(width: Space.xxs),
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: Motion.fast,
                  child: Icon(
                    Icons.expand_more_rounded,
                    size: 16,
                    color: colors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: Motion.base,
          curve: Motion.standard,
          alignment: Alignment.topCenter,
          child: _expanded
              ? Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: Space.sm),
                  padding: const EdgeInsets.all(Space.md),
                  decoration: BoxDecoration(
                    color: colors.surfaceSunken,
                    borderRadius: Radii.rSm,
                    border: Border.all(
                      color: colors.border,
                      width: Strokes.hairline,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!grounded) ...[
                        Text(
                          'Could not verify this against the source.',
                          style: text.bodySmall
                              ?.copyWith(color: colors.confidenceReview),
                        ),
                        const SizedBox(height: Space.xs),
                      ],
                      Text(
                        '“${widget.evidence.quote}”',
                        style: text.bodySmall?.copyWith(
                          color: colors.textSecondary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      // Offered only when there is genuinely something to
                      // show. A button that opens a sheet saying "Action could
                      // not work out where" would be worse than no button.
                      if (_canShowOnCapture) ...[
                        const SizedBox(height: Space.xs),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: TextButton.icon(
                            onPressed: () => showEvidenceLens(
                              context,
                              evidence: widget.evidence,
                              label: widget.label,
                              source: widget.source,
                            ),
                            icon: const Icon(Icons.center_focus_strong_outlined,
                                size: 18),
                            label: const Text('See it on the capture'),
                            style: TextButton.styleFrom(
                              // The shared theme sizes buttons to full width,
                              // which is fatal inside a Column of prose.
                              minimumSize: const Size(0, 40),
                              padding: const EdgeInsets.symmetric(
                                horizontal: Space.sm,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}

/// A calm, bordered notice. Used for everything from "this looked like a
/// table" to "some text looked like instructions" — informative, never
/// alarming, and always in product language rather than security jargon.
class ReviewNotice extends StatelessWidget {
  const ReviewNotice({
    required this.icon,
    required this.message,
    this.title,
    super.key,
  });

  final IconData icon;
  final String? title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Space.lg),
      decoration: BoxDecoration(
        color: colors.surfaceElevated,
        borderRadius: Radii.rMd,
        border: Border.all(color: colors.border, width: Strokes.hairline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: colors.textSecondary),
          const SizedBox(width: Space.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title!, style: text.titleSmall),
                  const SizedBox(height: Space.xs),
                ],
                Text(message, style: text.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// One key fact: label, value in tabular figures, its confidence in words,
/// and whatever affordances the caller attaches (edit, confirm, evidence).
class FactRow extends StatelessWidget {
  const FactRow({
    required this.label,
    required this.value,
    required this.display,
    this.numeric = false,
    this.onEdit,
    this.onConfirm,
    this.evidence,
    this.onEvidenceViewed,
    this.source,
    super.key,
  });

  final String label;
  final String value;
  final ConfidenceDisplay display;
  final bool numeric;
  final VoidCallback? onEdit;
  final VoidCallback? onConfirm;
  final ExtractionEvidence? evidence;
  final VoidCallback? onEvidenceViewed;

  /// Passed through to the evidence tile so it can offer the lens.
  final SourceItem? source;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.fromSTEB(Space.lg, Space.md, Space.sm, 0),
      decoration: BoxDecoration(
        color: colors.surfaceElevated,
        borderRadius: Radii.rMd,
        border: Border.all(color: colors.border, width: Strokes.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style:
                          text.labelMedium?.copyWith(color: colors.textTertiary),
                    ),
                    const SizedBox(height: Space.xxs),
                    Text(
                      value,
                      style: text.bodyLarge?.copyWith(
                        fontFeatures: numeric ? AppText.numeric : null,
                      ),
                    ),
                    const SizedBox(height: Space.sm),
                    ConfidenceBadge(display),
                  ],
                ),
              ),
              if (onConfirm != null)
                IconButton(
                  tooltip: 'Looks right',
                  onPressed: onConfirm,
                  icon: const Icon(Icons.check_rounded),
                ),
              if (onEdit != null)
                IconButton(
                  tooltip: 'Edit',
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined),
                ),
            ],
          ),
          if (evidence != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: Space.sm),
              child: EvidenceTile(
                evidence: evidence!,
                onFirstExpand: onEvidenceViewed,
                source: source,
                label: label,
              ),
            )
          else
            const SizedBox(height: Space.md),
        ],
      ),
    );
  }
}
