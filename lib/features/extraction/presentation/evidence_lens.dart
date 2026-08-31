/// Shows where a fact came from, on the capture it came from.
///
/// **Why this is worth a screen of its own.** Every product in this category
/// asks the user to trust an extracted value. Action's answer has been a quote
/// — better than nothing, and still a second thing to read and match up by eye.
/// This is the version that does the matching for them: the capture, dimmed,
/// with the lines that support the value left bright. "The deadline is 12
/// September" stops being a claim and becomes something you can see.
///
/// **It refuses to guess.** [EvidenceRegions] returns nothing whenever the
/// mapping is uncertain, and this falls back to the quote alone rather than
/// highlighting a plausible-looking area. A confident box over the wrong line
/// is worse than no box: it is the app asserting something false about the
/// user's own document.
///
/// Pasted text has no geometry at all, so it always gets the quote form. That
/// is not a degraded state and is not presented as one.
library;

import 'dart:io';

import 'package:flutter/material.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../capture/domain/source_item.dart';
import '../application/evidence_regions.dart';
import '../domain/extraction_evidence.dart';

/// Opens the lens for one piece of evidence.
Future<void> showEvidenceLens(
  BuildContext context, {
  required ExtractionEvidence evidence,
  required String label,
  SourceItem? source,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => EvidenceLensSheet(
      evidence: evidence,
      label: label,
      source: source,
    ),
  );
}

class EvidenceLensSheet extends StatelessWidget {
  const EvidenceLensSheet({
    super.key,
    required this.evidence,
    required this.label,
    this.source,
  });

  final ExtractionEvidence evidence;

  /// What the evidence supports — "Deadline", "Amount". Named so the sheet can
  /// say which fact is being explained.
  final String label;

  final SourceItem? source;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    final regions = source == null
        ? const <EvidenceRegion>[]
        : EvidenceRegions.forEvidence(
            evidence: evidence,
            lines: source!.ocr?.lines ?? const [],
            imageWidth: source!.imageWidth,
            imageHeight: source!.imageHeight,
          );

    final path = source?.imagePath;
    final canShowImage = regions.isNotEmpty && path != null;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: canShowImage ? 0.8 : 0.45,
      maxChildSize: 0.95,
      minChildSize: 0.3,
      builder: (context, controller) => Padding(
        padding: const EdgeInsets.fromLTRB(
          Space.page,
          Space.md,
          Space.page,
          Space.xl,
        ),
        child: ListView(
          controller: controller,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: Radii.rSm,
                ),
              ),
            ),
            const SizedBox(height: Space.lg),
            Semantics(
              header: true,
              child: Text('Where this came from', style: text.titleLarge),
            ),
            const SizedBox(height: Space.xs),
            Text(
              label,
              style: text.labelSmall?.copyWith(
                color: colors.textTertiary,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: Space.lg),
            if (canShowImage) ...[
              ClipRRect(
                borderRadius: Radii.rMd,
                child: _HighlightedCapture(
                  path: path,
                  regions: regions,
                  width: source!.imageWidth!,
                  height: source!.imageHeight!,
                ),
              ),
              const SizedBox(height: Space.lg),
            ],
            _Quote(evidence: evidence),
            const SizedBox(height: Space.lg),
            _Provenance(
              evidence: evidence,
              showedRegion: canShowImage,
              hasImage: path != null,
            ),
          ],
        ),
      ),
    );
  }
}

/// The capture with everything but the evidence dimmed.
class _HighlightedCapture extends StatelessWidget {
  const _HighlightedCapture({
    required this.path,
    required this.regions,
    required this.width,
    required this.height,
  });

  final String path;
  final List<EvidenceRegion> regions;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AspectRatio(
      aspectRatio: width / height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            File(path),
            fit: BoxFit.contain,
            // A capture that has been deleted from under us must not take the
            // sheet down with it.
            errorBuilder: (context, error, stack) => ColoredBox(
              color: colors.surfaceSunken,
              child: Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: colors.textTertiary,
                ),
              ),
            ),
          ),
          // Painted rather than composed from widgets: one path with an
          // even-odd fill dims everything outside the bands in a single
          // operation, and there is no per-region layout to do.
          CustomPaint(
            painter: _LensPainter(
              regions: regions,
              veil: Colors.black.withValues(alpha: 0.62),
              outline: colors.brand,
            ),
          ),
        ],
      ),
    );
  }
}

class _LensPainter extends CustomPainter {
  const _LensPainter({
    required this.regions,
    required this.veil,
    required this.outline,
  });

  final List<EvidenceRegion> regions;
  final Color veil;
  final Color outline;

  @override
  void paint(Canvas canvas, Size size) {
    final rects = [
      for (final region in regions)
        Rect.fromLTWH(
          region.left * size.width,
          region.top * size.height,
          region.width * size.width,
          region.height * size.height,
        ),
    ];

    // Everything except the bands, in one path.
    final veilPath = Path()..addRect(Offset.zero & size);
    for (final rect in rects) {
      veilPath.addRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(3)),
      );
    }
    veilPath.fillType = PathFillType.evenOdd;
    canvas.drawPath(veilPath, Paint()..color = veil);

    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = outline;
    for (final rect in rects) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(3)),
        stroke,
      );
    }
  }

  @override
  bool shouldRepaint(_LensPainter old) =>
      old.regions != regions || old.veil != veil || old.outline != outline;
}

class _Quote extends StatelessWidget {
  const _Quote({required this.evidence});

  final ExtractionEvidence evidence;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Space.lg),
      decoration: BoxDecoration(
        color: colors.surfaceSunken,
        borderRadius: Radii.rMd,
        // Directional: the accent marks the *leading* edge of a quotation, and
        // in a right-to-left script that is the right-hand side.
        border: BorderDirectional(
          start: BorderSide(color: colors.brand, width: 3),
          top: BorderSide(color: colors.border, width: Strokes.hairline),
          end: BorderSide(color: colors.border, width: Strokes.hairline),
          bottom: BorderSide(color: colors.border, width: Strokes.hairline),
        ),
      ),
      child: SelectableText(
        // Exactly what the source says, unedited. Selectable so the user can
        // copy it into a reply or a search.
        '“${evidence.quote}”',
        style: text.bodyMedium?.copyWith(
          color: colors.textPrimary,
          fontStyle: FontStyle.italic,
          height: 1.5,
        ),
      ),
    );
  }
}

/// The sentence that says how much this evidence is worth.
class _Provenance extends StatelessWidget {
  const _Provenance({
    required this.evidence,
    required this.showedRegion,
    required this.hasImage,
  });

  final ExtractionEvidence evidence;
  final bool showedRegion;
  final bool hasImage;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final grounded = evidence.isGrounded;

    final (icon, colour, message) = switch (grounded) {
      false => (
          Icons.help_outline_rounded,
          colors.confidenceReview,
          'Action could not find these words in the text it read, so this '
              'value has not been verified. Check it against the original '
              'before you rely on it.',
        ),
      true when showedRegion => (
          Icons.check_circle_outline_rounded,
          colors.confidenceConfirmed,
          'These words were found in the text Action read from this capture, '
              'and the highlight shows where.',
        ),
      // Grounded, but no region: pasted text, or geometry that could not be
      // trusted. Said plainly rather than dressed up — and deliberately not
      // framed as a failure, because for pasted text it is simply the truth.
      true when hasImage => (
          Icons.check_circle_outline_rounded,
          colors.confidenceConfirmed,
          'These words were found in the text Action read from this capture. '
              'It could not work out exactly where on the image they sit, so '
              'it is not guessing.',
        ),
      true => (
          Icons.check_circle_outline_rounded,
          colors.confidenceConfirmed,
          'These words were found in the text this capture contains.',
        ),
    };

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: colour),
        const SizedBox(width: Space.sm),
        Expanded(
          child: Text(
            message,
            style: text.bodySmall?.copyWith(color: colors.textSecondary),
          ),
        ),
      ],
    );
  }
}
