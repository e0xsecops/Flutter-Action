/// A rectangle in the coordinate space of the *normalized* image.
///
/// Boxes are only meaningful against the image OCR actually ran on, which is
/// the re-encoded, straightened, downscaled one — not the original capture.
class OcrBox {
  const OcrBox({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  final double left;
  final double top;
  final double width;
  final double height;

  Map<String, dynamic> toJson() =>
      {'l': left, 't': top, 'w': width, 'h': height};

  static OcrBox fromJson(Map<String, dynamic> json) => OcrBox(
        left: (json['l'] as num?)?.toDouble() ?? 0,
        top: (json['t'] as num?)?.toDouble() ?? 0,
        width: (json['w'] as num?)?.toDouble() ?? 0,
        height: (json['h'] as num?)?.toDouble() ?? 0,
      );
}

/// One recognised line, with where it sat on the page.
class OcrLine {
  const OcrLine({required this.text, this.box, this.confidence});

  final String text;
  final OcrBox? box;

  /// ML Kit's Android text recogniser generally does **not** populate a
  /// per-line confidence, so this is usually null. It is carried through
  /// untouched rather than replaced with a synthesised number — a fabricated
  /// score would end up driving day-5 escalation decisions, which is precisely
  /// the failure mode to avoid.
  final double? confidence;

  Map<String, dynamic> toJson() => {
        'text': text,
        if (box != null) 'box': box!.toJson(),
        if (confidence != null) 'confidence': confidence,
      };

  static OcrLine fromJson(Map<String, dynamic> json) => OcrLine(
        text: json['text'] as String? ?? '',
        box: json['box'] is Map<String, dynamic>
            ? OcrBox.fromJson(json['box'] as Map<String, dynamic>)
            : null,
        confidence: (json['confidence'] as num?)?.toDouble(),
      );
}

/// The result of running text recognition over a normalized capture.
class OcrOutcome {
  const OcrOutcome({
    required this.rawText,
    required this.normalizedText,
    required this.lines,
    required this.engine,
    required this.processedAt,
    required this.durationMs,
  });

  /// Exactly what the recogniser returned. Never edited — day 5 grounding has
  /// to be able to point at the original characters.
  final String rawText;

  /// Whitespace-tidied text for analysis. Facts are never rewritten.
  final String normalizedText;

  final List<OcrLine> lines;

  /// e.g. `mlkit_text_v2`. Recorded so a later engine change is visible in the
  /// data rather than silently altering results.
  final String engine;

  final DateTime processedAt;
  final int durationMs;

  bool get isEmpty => normalizedText.trim().isEmpty;

  int get lineCount => lines.length;

  Map<String, dynamic> toJson() => {
        'rawText': rawText,
        'normalizedText': normalizedText,
        'lines': lines.map((l) => l.toJson()).toList(),
        'engine': engine,
        'processedAt': processedAt.toIso8601String(),
        'durationMs': durationMs,
      };

  static OcrOutcome fromJson(Map<String, dynamic> json) => OcrOutcome(
        rawText: json['rawText'] as String? ?? '',
        normalizedText: json['normalizedText'] as String? ?? '',
        lines: (json['lines'] as List? ?? const [])
            .whereType<Map<String, dynamic>>()
            .map(OcrLine.fromJson)
            .toList(),
        engine: json['engine'] as String? ?? 'unknown',
        processedAt:
            DateTime.tryParse(json['processedAt'] as String? ?? '') ??
                DateTime.fromMillisecondsSinceEpoch(0),
        durationMs: (json['durationMs'] as num?)?.toInt() ?? 0,
      );
}
