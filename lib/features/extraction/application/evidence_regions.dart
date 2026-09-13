/// Turns evidence into the region of the capture it came from.
///
/// **The rule, and it is the whole file.** A highlight drawn on the wrong part
/// of someone's document is worse than no highlight at all: it is the app
/// asserting, visually and confidently, that a deadline came from a line that
/// does not mention it. So every step here fails closed. If the evidence was
/// never grounded, if the image dimensions are unknown, if a line index is out
/// of range, if a box has no area, or if the boxes do not fit inside the image
/// they claim to describe — the answer is an empty list, and the lens falls
/// back to showing the quote alone.
///
/// That last check is the one that matters in practice. OCR boxes are in the
/// pixel space of the image the recogniser saw. If a capture is ever re-encoded
/// or re-cropped after OCR, the stored dimensions and the stored boxes stop
/// agreeing, and nothing else in the pipeline would notice. Boxes that fall
/// outside the frame are the observable symptom, and they are treated as proof
/// that the mapping cannot be trusted.
///
/// Pure, and separated from the widget for the usual reason: the interesting
/// cases are geometric and are miserable to check by looking at a screen.
library;

import '../../capture/domain/ocr_result.dart';
import '../domain/extraction_evidence.dart';

/// A rectangle in normalised image coordinates: 0 is the left/top edge, 1 the
/// right/bottom. Normalised so the widget can scale it to whatever size the
/// image is actually being displayed at without knowing the original pixels.
class EvidenceRegion {
  const EvidenceRegion({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  final double left;
  final double top;
  final double width;
  final double height;

  double get right => left + width;
  double get bottom => top + height;

  @override
  String toString() =>
      'EvidenceRegion($left, $top, $width x $height)';

  @override
  bool operator ==(Object other) =>
      other is EvidenceRegion &&
      other.left == left &&
      other.top == top &&
      other.width == width &&
      other.height == height;

  @override
  int get hashCode => Object.hash(left, top, width, height);
}

abstract final class EvidenceRegions {
  /// Grow each band by this fraction of the image so the highlight does not
  /// clip the glyphs it is pointing at. OCR boxes are tight to the ink.
  static const _padding = 0.006;

  /// The regions of the capture that support [evidence].
  ///
  /// Empty whenever the mapping cannot be trusted. Callers must treat empty as
  /// "show the quote, draw nothing" rather than as an error.
  static List<EvidenceRegion> forEvidence({
    required ExtractionEvidence evidence,
    required List<OcrLine> lines,
    required int? imageWidth,
    required int? imageHeight,
  }) {
    // An unresolved quote is one the app could not find in its own copy of the
    // text. Pointing at a region for it would be inventing the one thing this
    // whole subsystem exists to avoid inventing.
    if (!evidence.isGrounded) return const [];
    if (evidence.lineIndexes.isEmpty) return const [];

    final width = imageWidth?.toDouble();
    final height = imageHeight?.toDouble();
    if (width == null || height == null || width <= 0 || height <= 0) {
      return const [];
    }

    final boxes = <OcrBox>[];
    for (final index in evidence.lineIndexes) {
      if (index < 0 || index >= lines.length) return const [];
      final box = lines[index].box;
      // A line with no geometry is normal — pasted text has none — but it
      // means this quote cannot be shown on an image.
      if (box == null) return const [];
      if (box.width <= 0 || box.height <= 0) return const [];
      boxes.add(box);
    }
    if (boxes.isEmpty) return const [];

    // The mapping check. Anything outside the frame means the boxes and the
    // dimensions came from different versions of this image.
    const tolerance = 1.0;
    for (final box in boxes) {
      if (box.left < -tolerance ||
          box.top < -tolerance ||
          box.left + box.width > width + tolerance ||
          box.top + box.height > height + tolerance) {
        return const [];
      }
    }

    final regions = [
      for (final box in boxes)
        EvidenceRegion(
          left: _clamp(box.left / width - _padding),
          top: _clamp(box.top / height - _padding),
          width: _clamp(box.width / width + _padding * 2),
          height: _clamp(box.height / height + _padding * 2),
        ),
    ];

    return _merged(regions);
  }

  /// Merges bands that overlap vertically into one.
  ///
  /// A quote spanning two OCR lines usually produces two boxes a pixel apart,
  /// and drawing them separately puts a hairline of dimming through the middle
  /// of the highlight. Merging is cosmetic, but the seam reads as a rendering
  /// fault.
  static List<EvidenceRegion> _merged(List<EvidenceRegion> regions) {
    if (regions.length < 2) return regions;

    final sorted = [...regions]..sort((a, b) => a.top.compareTo(b.top));
    final out = <EvidenceRegion>[sorted.first];

    for (final region in sorted.skip(1)) {
      final last = out.last;
      final overlapsVertically = region.top <= last.bottom;
      if (!overlapsVertically) {
        out.add(region);
        continue;
      }
      final left = last.left < region.left ? last.left : region.left;
      final top = last.top < region.top ? last.top : region.top;
      final right = last.right > region.right ? last.right : region.right;
      final bottom = last.bottom > region.bottom ? last.bottom : region.bottom;
      out[out.length - 1] = EvidenceRegion(
        left: left,
        top: top,
        width: right - left,
        height: bottom - top,
      );
    }
    return out;
  }

  static double _clamp(double value) =>
      value < 0 ? 0 : (value > 1 ? 1 : value);
}
