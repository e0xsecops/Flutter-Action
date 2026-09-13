/// A capture, as it appears in the inbox.
///
/// **What this card is for.** Telling the user, at a glance, what a capture is
/// and *what state it is in* — because the honest answer is often "read, but
/// nothing has been done with it", and before V2 there was nowhere for that
/// state to be shown. A capture is allowed to sit here unprocessed. That is not
/// a failure, and the card should not nag.
library;

import 'package:flutter/material.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../actions/presentation/action_card.dart' show relativeTime;
import '../../capture/domain/source_item.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/casing.dart';
import '../../../l10n/gen/app_l10n.dart';

/// Where a capture stands, as the user would describe it.
///
/// Derived rather than stored: every input is already on the SourceItem or in
/// the Action list, so there is no new state to keep in sync and no migration.
/// The label lives in `lib/l10n/enum_labels.dart`; only the glyph is a
/// property of the stage itself.
enum CaptureStage {
  reading(Icons.hourglass_empty_rounded),
  needsReview(Icons.rate_review_outlined),
  actioned(Icons.check_circle_outline_rounded),
  noText(Icons.text_fields_rounded),
  failed(Icons.error_outline_rounded);

  const CaptureStage(this.icon);
  final IconData icon;
}

CaptureStage stageOf(SourceItem source, {required bool hasAction}) {
  // Order matters: an Action having been created is the most useful thing to
  // say about a capture, and it outranks anything about its text.
  if (hasAction) return CaptureStage.actioned;
  return switch (source.state) {
    SourceProcessingState.pending ||
    SourceProcessingState.processing =>
      CaptureStage.reading,
    SourceProcessingState.failed => CaptureStage.failed,
    SourceProcessingState.ready =>
      source.hasText ? CaptureStage.needsReview : CaptureStage.noText,
  };
}

class SourceCard extends StatelessWidget {
  const SourceCard({
    super.key,
    required this.source,
    required this.hasAction,
    required this.onTap,
  });

  final SourceItem source;
  final bool hasAction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final l10n = AppL10n.of(context);
    final stage = stageOf(source, hasAction: hasAction);

    final tone = switch (stage) {
      CaptureStage.actioned => colors.confidenceConfirmed,
      CaptureStage.needsReview => colors.brand,
      CaptureStage.failed => colors.urgencyCritical,
      _ => colors.textTertiary,
    };

    // The body line says the most useful thing available for this state. The
    // eyebrow names the state; this says what it means for the user.
    //
    // The failure reason in particular must survive: "couldn't be read" with no
    // reason is a dead end, and the reason is the only thing that tells someone
    // whether to retry or type it in themselves.
    final preview = switch (stage) {
      CaptureStage.failed => source.failureReason ?? l10n.stageFailedPreview,
      CaptureStage.reading => l10n.stageReadingPreview,
      CaptureStage.noText => l10n.stageNoText,
      _ => source.hasText
          ? source.analysisText.replaceAll(RegExp(r'\s+'), ' ').trim()
          : null,
    };

    return Material(
      color: colors.surfaceElevated,
      borderRadius: Radii.rLg,
      child: InkWell(
        onTap: onTap,
        borderRadius: Radii.rLg,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Radii.rLg,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          padding: const EdgeInsets.all(Space.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Thumbnail(source: source),
              const SizedBox(width: Space.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(stage.icon, size: 13, color: tone),
                        const SizedBox(width: Space.xs),
                        Flexible(
                          child: Text(
                            eyebrowCase(
                              stage.labelIn(l10n),
                              l10n.localeName,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: text.labelSmall?.copyWith(
                              color: tone,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Space.xxs),
                    Text(
                      // The capture's own words where it has any. A preview of
                      // the actual notice tells the user which one this is;
                      // "Screenshot" does not.
                      preview ?? source.type.provenanceIn(l10n),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: text.bodyMedium?.copyWith(
                        color: preview == null
                            ? colors.textSecondary
                            : colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: Space.xs),
                    Text(
                      l10n.sourceCardMeta(
                        source.type.provenanceIn(l10n),
                        relativeTime(l10n, source.capturedAt),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: text.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A small square standing in for the capture.
///
/// Deliberately not the real image. Decoding a full photo for every row of a
/// scrolling inbox is exactly the kind of thing the Day-16 work removed, and a
/// tinted glyph is enough to tell a screenshot from a pasted note.
class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.source});

  final SourceItem source;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final icon = switch (source.type) {
      SourceType.photo => Icons.photo_camera_outlined,
      SourceType.gallery => Icons.image_outlined,
      SourceType.pastedText => Icons.notes_rounded,
      SourceType.document => Icons.picture_as_pdf_outlined,
    };

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: colors.brandSubtle,
        borderRadius: Radii.rMd,
        border: Border.all(color: colors.border, width: Strokes.hairline),
      ),
      child: Icon(icon, size: 20, color: colors.brand),
    );
  }
}
