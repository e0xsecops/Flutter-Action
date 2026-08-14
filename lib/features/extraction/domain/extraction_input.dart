import '../../capture/domain/ocr_result.dart';
import '../../capture/domain/source_item.dart';
import 'extraction_schema.dart';

/// One line of source text, with whatever the recogniser knew about it.
class ExtractionSourceLine {
  const ExtractionSourceLine({
    required this.index,
    required this.text,
    this.confidence,
    this.box,
  });

  final int index;
  final String text;

  /// ML Kit's per-line confidence where it was populated. Day 4 established
  /// this *is* available on the Samsung (roughly 0.31–0.89, and the low values
  /// tracked real misreads), correcting an earlier assumption that it never
  /// was. It is still frequently null, so escalation treats it as one signal
  /// among several rather than a gate.
  final double? confidence;

  /// Position on the normalised image, where known. Carried so day 6 can draw
  /// a highlight on the capture itself.
  final OcrBox? box;
}

/// Everything the extraction layer is allowed to see.
///
/// Narrow on purpose. Extraction gets text and layout metadata, not a
/// [SourceItem] — which would hand it the image path, the byte sizes and the
/// storage details it has no business knowing, and would make the seam
/// impossible to test without a filesystem.
///
/// Note what is *not* here: the image bytes or path. Day 5 sends nothing
/// anywhere, and when day 6 adds a provider, a text-only extraction must not be
/// able to attach a capture by accident. [multimodalSourceAvailable] says only
/// whether escalating *could* be possible, and carries no way to act on it.
class ExtractionInput {
  const ExtractionInput({
    required this.sourceId,
    required this.sourceType,
    required this.normalizedText,
    required this.capturedAt,
    this.lines = const [],
    this.hasOcrGeometry = false,
    this.ocrFailed = false,
    this.multimodalSourceAvailable = false,
    this.imagePixelCount = 0,
  });

  final String sourceId;
  final SourceType sourceType;

  /// The text extraction reasons about, and the only text evidence is resolved
  /// against. Whitespace-normalised; no fact was rewritten to produce it.
  final String normalizedText;

  final DateTime capturedAt;

  final List<ExtractionSourceLine> lines;

  /// Whether [lines] came from the recogniser (so their geometry and
  /// confidence mean something) or were split out of plain text.
  final bool hasOcrGeometry;

  /// Recognition was attempted and could not complete. Distinct from "ran and
  /// found nothing", which is a legitimate empty result.
  final bool ocrFailed;

  /// A normalised image still exists for this capture, so a future multimodal
  /// read is technically possible.
  final bool multimodalSourceAvailable;

  /// Width × height of the normalised image, used to tell "a big page with
  /// almost no text on it" from "a small crop with a little text on it". Zero
  /// for pasted text.
  final int imagePixelCount;

  bool get hasText => normalizedText.trim().isNotEmpty;

  EvidenceSourceKind get evidenceSourceKind => switch (sourceType) {
        SourceType.pastedText => EvidenceSourceKind.pastedText,
        SourceType.photo || SourceType.gallery => EvidenceSourceKind.ocrText,
      };

  /// Builds the extraction view of a capture.
  ///
  /// Uses [SourceItem.analysisText], which already prefers OCR output and falls
  /// back to text the user typed by hand — so the manual-entry path produces a
  /// perfectly ordinary input here rather than a special case.
  static ExtractionInput fromSourceItem(SourceItem item) {
    final ocr = item.ocr;
    final text = item.analysisText;

    // Recognised lines are preferred because they carry confidence and
    // geometry. Pasted or hand-typed text has neither, but its newlines are
    // still real structure worth passing on.
    final lines = <ExtractionSourceLine>[];
    if (ocr != null && ocr.lines.isNotEmpty) {
      for (var i = 0; i < ocr.lines.length; i++) {
        final line = ocr.lines[i];
        lines.add(
          ExtractionSourceLine(
            index: i,
            text: line.text,
            confidence: line.confidence,
            box: line.box,
          ),
        );
      }
    } else {
      final split = text.split('\n');
      for (var i = 0; i < split.length; i++) {
        if (split[i].trim().isEmpty) continue;
        lines.add(ExtractionSourceLine(index: i, text: split[i]));
      }
    }

    return ExtractionInput(
      sourceId: item.id,
      sourceType: item.type,
      normalizedText: text,
      capturedAt: item.capturedAt,
      lines: lines,
      hasOcrGeometry: ocr != null && ocr.lines.isNotEmpty,
      ocrFailed: item.state == SourceProcessingState.failed,
      multimodalSourceAvailable: item.hasImage,
      imagePixelCount: (item.imageWidth ?? 0) * (item.imageHeight ?? 0),
    );
  }
}
