import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../domain/ocr_result.dart';
import '../domain/ocr_script.dart';
import '../domain/text_normalizer.dart';

/// Thrown when recognition could not run at all — a missing file, an
/// unreadable buffer, a platform failure.
///
/// Recognising *nothing* is not this: a photo of a wall legitimately contains
/// no text and is a successful result with empty output.
class OcrFailure implements Exception {
  const OcrFailure(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => 'OcrFailure($message)';
}

/// On-device text recognition.
///
/// Behind an interface so tests run against fixed transcripts: ML Kit needs a
/// platform channel and a real image, which would make every test that touches
/// the pipeline both slow and non-deterministic.
abstract interface class OcrService {
  Future<OcrOutcome> recognize(String imagePath);

  Future<void> dispose();
}

/// Google ML Kit, running entirely on the device. No network call is made and
/// no capture leaves the handset during recognition.
class MlKitOcrService implements OcrService {
  MlKitOcrService({
    this.script = OcrScript.latin,
    TextRecognizer? recognizer,
  }) : _recognizer = recognizer ?? TextRecognizer(script: _mlKit(script));

  /// The writing system this instance was built to read.
  ///
  /// One recogniser per instance rather than one per call: constructing a
  /// `TextRecognizer` loads a model, and doing that on every capture would put
  /// the load on the path the user is waiting on. The provider rebuilds the
  /// service when the preference changes, which moves the cost to the moment
  /// the user changes the setting.
  final OcrScript script;

  final TextRecognizer _recognizer;

  /// The plugin's enum, which misspells Devanagari. Mapped here rather than
  /// adopting the typo into the domain.
  static TextRecognitionScript _mlKit(OcrScript script) => switch (script) {
        OcrScript.latin => TextRecognitionScript.latin,
        OcrScript.chinese => TextRecognitionScript.chinese,
        OcrScript.devanagari => TextRecognitionScript.devanagiri,
        OcrScript.japanese => TextRecognitionScript.japanese,
        OcrScript.korean => TextRecognitionScript.korean,
      };

  /// Recorded on every result so that a capture read with one model is
  /// distinguishable later from one read with another — which matters because
  /// the two can legitimately disagree about the same image, and a stored
  /// transcript with no record of what produced it cannot be re-examined.
  ///
  /// Latin yields `mlkit_text_v2_latin`, which is deliberately the exact
  /// string every capture stored before scripts were selectable already
  /// carries: those rows stay correct rather than becoming unattributed.
  static String engineNameFor(OcrScript script) =>
      'mlkit_text_v2_${script.engineSuffix}';

  @override
  Future<OcrOutcome> recognize(String imagePath) async {
    final startedAt = DateTime.now();

    final RecognizedText recognized;
    try {
      recognized = await _recognizer.processImage(
        InputImage.fromFilePath(imagePath),
      );
    } on Object catch (error) {
      throw OcrFailure('Text recognition could not run.', cause: error);
    }

    final lines = <OcrLine>[];
    for (final block in recognized.blocks) {
      for (final line in block.lines) {
        final box = line.boundingBox;
        lines.add(
          OcrLine(
            text: line.text,
            box: OcrBox(
              left: box.left,
              top: box.top,
              width: box.width,
              height: box.height,
            ),
            // Passed through exactly as given. ML Kit on Android generally
            // leaves this null, and inventing a number here would end up
            // driving day-5 escalation decisions off a fiction.
            confidence: line.confidence,
          ),
        );
      }
    }

    return OcrOutcome(
      rawText: recognized.text,
      normalizedText: normalizeOcrText(recognized.text),
      lines: lines,
      engine: engineNameFor(script),
      processedAt: startedAt,
      durationMs: DateTime.now().difference(startedAt).inMilliseconds,
    );
  }

  @override
  Future<void> dispose() => _recognizer.close();
}

/// Returns whatever it was told to, keyed by image path.
///
/// Used by widget tests and the fixture harness so the pipeline can be
/// exercised end to end without a device.
class FakeOcrService implements OcrService {
  const FakeOcrService({
    this.transcripts = const {},
    this.fallback = '',
    this.failOnPaths = const {},
  });

  final Map<String, String> transcripts;
  final String fallback;
  final Set<String> failOnPaths;

  static const engineName = 'fake';

  @override
  Future<OcrOutcome> recognize(String imagePath) async {
    if (failOnPaths.contains(imagePath)) {
      throw const OcrFailure('Simulated recognition failure.');
    }

    final raw = transcripts[imagePath] ?? fallback;
    return OcrOutcome(
      rawText: raw,
      normalizedText: normalizeOcrText(raw),
      lines: [
        for (final line in raw.split('\n'))
          if (line.trim().isNotEmpty) OcrLine(text: line.trim()),
      ],
      engine: engineName,
      processedAt: DateTime.fromMillisecondsSinceEpoch(0),
      durationMs: 0,
    );
  }

  @override
  Future<void> dispose() async {}
}
