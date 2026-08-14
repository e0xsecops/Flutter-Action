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

/// Why a fixture looks like it would need more than on-device OCR.
///
/// Diagnostic only. This is the harness reasoning about measured signals so a
/// day-4 run can inform the day-5 escalation rule — it is not the rule, and no
/// product code consults it. The thresholds are provisional, chosen from this
/// corpus, and exist to be argued with rather than trusted.
///
/// Note what is deliberately absent: a confidence cut-off. ML Kit gives us no
/// per-line confidence on Android, so every signal here is structural.
enum EscalationSignal {
  ocrFailed('recognition could not run at all'),
  noTextFound('text was expected but none was recognised'),
  anchorsMissed('known facts in the image were not recognised'),
  layoutFlattened('many short lines — table structure is lost in a flat read'),
  thinText('very little text for a document of this size');

  const EscalationSignal(this.reason);

  final String reason;
}

/// Signals that would likely send a fixture to multimodal extraction.
///
/// Empty means on-device OCR alone looks sufficient for this input.
List<EscalationSignal> classifyEscalation(FixtureReport report) {
  if (report.failed) return const [EscalationSignal.ocrFailed];

  final signals = <EscalationSignal>[];

  // A fixture that legitimately has no text is not an escalation case — there
  // is nothing more for a larger model to find.
  if (report.fixture.expectsText && !report.textPresent) {
    signals.add(EscalationSignal.noTextFound);
  }

  if ((report.score?.missing.isNotEmpty ?? false)) {
    signals.add(EscalationSignal.anchorsMissed);
  }

  // A table read line-by-line loses its columns: the values survive, the
  // relationships between them do not. Many short lines is what that looks
  // like from outside the recogniser.
  final lines = report.lineCount ?? 0;
  final chars = report.textLength ?? 0;
  if (lines >= 12 && chars / lines < 24) {
    signals.add(EscalationSignal.layoutFlattened);
  }

  // Text so sparse it cannot describe an obligation, on an image large enough
  // that it should have contained one.
  if (report.fixture.expectsText &&
      report.textPresent &&
      chars < 40 &&
      report.width * report.height > 500000) {
    signals.add(EscalationSignal.thinText);
  }

  return signals;
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
    this.recognizedText,
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

  /// What the recogniser actually read.
  ///
  /// Safe to export because the corpus is synthetic — these are documents we
  /// generated for testing. A capture of a real user document must never be
  /// written to a diagnostics file.
  final String? recognizedText;

  bool get failed => error != null;

  bool get textPresent => (textLength ?? 0) > 0;

  /// Whether the presence or absence of text matched what the fixture declares.
  bool get textExpectationMet => fixture.expectsText == textPresent;

  double get sizeRatio =>
      originalBytes == 0 ? 1 : processedBytes / originalBytes;

  Map<String, dynamic> toJson() => {
        'file': fixture.file,
        'description': fixture.description,
        'expectsText': fixture.expectsText,
        'failed': failed,
        if (error != null) 'error': error,
        'originalBytes': originalBytes,
        'processedBytes': processedBytes,
        'width': width,
        'height': height,
        'normalizeMs': normalizeMs,
        'ocrMs': ocrMs,
        'textLength': textLength,
        'lineCount': lineCount,
        'textExpectationMet': textExpectationMet,
        // Recall against known anchors — a regression signal, not an accuracy
        // score. There is no ground-truth transcription behind it.
        'anchorRecall': score?.recall,
        'anchorsFound': score?.found,
        'anchorsMissed': score?.missing,
        'escalationSignals':
            classifyEscalation(this).map((s) => s.name).toList(),
        'escalationReasons':
            classifyEscalation(this).map((s) => s.reason).toList(),
        'recognizedText': recognizedText,
      };
}

/// Aggregate figures for a whole run.
class CorpusSummary {
  const CorpusSummary(this.reports, {this.engine = 'unknown'});

  final List<FixtureReport> reports;

  /// Which recogniser produced these numbers. Recorded so a run against a
  /// different script or a fake is never mistaken for a real-device baseline.
  final String engine;

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

  /// Fixtures that expected text and got none. Distinct from [failures]:
  /// recognition ran, it just came back empty.
  int get emptyDespiteExpectingText => reports
      .where((r) => !r.failed && r.fixture.expectsText && !r.textPresent)
      .length;

  List<int> get _ocrTimes =>
      reports.map((r) => r.ocrMs).whereType<int>().toList()..sort();

  List<int> get _normalizeTimes =>
      reports.where((r) => !r.failed).map((r) => r.normalizeMs).toList()..sort();

  int get medianOcrMs => _percentile(_ocrTimes, 0.5);

  /// With 18 samples p95 is an indicative worst case, not a stable percentile.
  /// It is here to catch an outlier fixture, not to characterise a population.
  int get p95OcrMs => _percentile(_ocrTimes, 0.95);

  int get medianNormalizeMs => _percentile(_normalizeTimes, 0.5);

  int get slowestOcrMs => _ocrTimes.isEmpty ? 0 : _ocrTimes.last;

  double get medianRecall {
    final recalls = reports
        .where((r) => !r.failed && (r.score?.total ?? 0) > 0)
        .map((r) => r.score!.recall)
        .toList()
      ..sort();
    if (recalls.isEmpty) return 0;
    final mid = ((recalls.length - 1) * 0.5).round();
    return recalls[mid];
  }

  /// Worst fixtures by anchor recall, failures first.
  List<FixtureReport> weakest(int count) {
    final scored = reports
        .where((r) => r.failed || (r.score?.total ?? 0) > 0)
        .toList()
      ..sort((a, b) {
        if (a.failed != b.failed) return a.failed ? -1 : 1;
        return (a.score?.recall ?? 0).compareTo(b.score?.recall ?? 0);
      });
    return scored.take(count).toList();
  }

  static int _percentile(List<int> sorted, double fraction) {
    if (sorted.isEmpty) return 0;
    final index = ((sorted.length - 1) * fraction).round();
    return sorted[index];
  }

  Map<String, dynamic> toJson() => {
        'engine': engine,
        'total': total,
        'failures': failures,
        'emptyDespiteExpectingText': emptyDespiteExpectingText,
        'textExpectationMet': textExpectationMet,
        'medianOcrMs': medianOcrMs,
        'p95OcrMs': p95OcrMs,
        'slowestOcrMs': slowestOcrMs,
        'medianNormalizeMs': medianNormalizeMs,
        'medianAnchorRecall': medianRecall,
        'meanAnchorRecall': meanRecall,
        'totalOriginalBytes': totalOriginalBytes,
        'totalProcessedBytes': totalProcessedBytes,
        'reports': reports.map((r) => r.toJson()).toList(),
      };
}
