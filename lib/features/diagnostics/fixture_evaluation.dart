import 'dart:convert';

/// One entry from the fixture manifest.
class Fixture {
  const Fixture({
    required this.file,
    required this.description,
    required this.expectsText,
    required this.anchors,
  });

  final String file;
  final String description;

  /// False for fixtures that legitimately contain no text. Those must come back
  /// as "read successfully, found nothing", never as a failure.
  final bool expectsText;

  /// Strings a competent recogniser should find.
  ///
  /// These are **not** a ground-truth transcription, so the recall computed
  /// from them is a regression signal — "did this get worse than last run" —
  /// and not an OCR accuracy score. Reporting it as accuracy would be inventing
  /// a number we have not earned.
  final List<String> anchors;

  static List<Fixture> parseManifest(String jsonText) {
    final root = jsonDecode(jsonText) as Map<String, dynamic>;
    return (root['fixtures'] as List)
        .whereType<Map<String, dynamic>>()
        .map(
          (f) => Fixture(
            file: f['file'] as String,
            description: f['description'] as String? ?? '',
            expectsText: f['expectsText'] as bool? ?? true,
            anchors: (f['anchors'] as List? ?? const [])
                .whereType<String>()
                .toList(),
          ),
        )
        .toList();
  }
}

/// Loosens text so an anchor match is not defeated by spacing or case.
///
/// Digits, letters and punctuation are preserved exactly — only whitespace and
/// case are levelled. Anything more aggressive would let a genuine misread
/// ("780.00" recognised as "78O.OO") count as a hit.
String canonicalizeForMatch(String text) =>
    text.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').trim();

class AnchorScore {
  const AnchorScore({required this.found, required this.missing});

  final List<String> found;
  final List<String> missing;

  int get total => found.length + missing.length;

  double get recall => total == 0 ? 1 : found.length / total;
}

AnchorScore scoreAnchors(String recognizedText, List<String> anchors) {
  final haystack = canonicalizeForMatch(recognizedText);
  final found = <String>[];
  final missing = <String>[];

  for (final anchor in anchors) {
    if (haystack.contains(canonicalizeForMatch(anchor))) {
      found.add(anchor);
    } else {
      missing.add(anchor);
    }
  }
  return AnchorScore(found: found, missing: missing);
}

/// What one fixture produced on one run.
class FixtureReport {
  const FixtureReport({
    required this.fixture,
    required this.originalBytes,
    required this.processedBytes,
    required this.width,
    required this.height,
    required this.normalizeMs,
    this.ocrMs,
    this.textLength,
    this.lineCount,
    this.score,
    this.error,
  });

  final Fixture fixture;
  final int originalBytes;
  final int processedBytes;
  final int width;
  final int height;
  final int normalizeMs;

  final int? ocrMs;
  final int? textLength;
  final int? lineCount;
  final AnchorScore? score;

  /// Set when the pipeline could not complete for this fixture.
  final String? error;

  bool get failed => error != null;

  bool get textPresent => (textLength ?? 0) > 0;

  /// Whether the presence or absence of text matched what the fixture declares.
  bool get textExpectationMet => fixture.expectsText == textPresent;

  double get sizeRatio =>
      originalBytes == 0 ? 1 : processedBytes / originalBytes;
}

/// Aggregate figures for a whole run.
class CorpusSummary {
  const CorpusSummary(this.reports);

  final List<FixtureReport> reports;

  int get total => reports.length;

  int get failures => reports.where((r) => r.failed).length;

  int get textExpectationMet =>
      reports.where((r) => !r.failed && r.textExpectationMet).length;

  /// Mean recall across fixtures that declare anchors.
  double get meanRecall {
    final scored = reports
        .where((r) => !r.failed && (r.score?.total ?? 0) > 0)
        .toList();
    if (scored.isEmpty) return 0;
    return scored.map((r) => r.score!.recall).reduce((a, b) => a + b) /
        scored.length;
  }

  int get totalOriginalBytes =>
      reports.fold(0, (sum, r) => sum + r.originalBytes);

  int get totalProcessedBytes =>
      reports.fold(0, (sum, r) => sum + r.processedBytes);

  int get medianOcrMs {
    final times = reports
        .map((r) => r.ocrMs)
        .whereType<int>()
        .toList()
      ..sort();
    if (times.isEmpty) return 0;
    return times[times.length ~/ 2];
  }
}
