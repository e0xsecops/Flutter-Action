import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/data/extraction_validator.dart';
import 'package:action_app/features/extraction/domain/extraction_input.dart';
import 'package:action_app/features/extraction/domain/extraction_result.dart';

/// A fixed timestamp so nothing under test depends on the clock.
final testProducedAt = DateTime.utc(2026, 1, 1);

/// Builds an extraction input straight from text, splitting it into lines the
/// way [ExtractionInput.fromSourceItem] would for pasted text.
ExtractionInput inputFor(
  String text, {
  String sourceId = 'src',
  SourceType sourceType = SourceType.photo,
  List<ExtractionSourceLine>? lines,
  bool ocrFailed = false,
  int imagePixelCount = 0,
}) {
  final derived = <ExtractionSourceLine>[];
  final split = text.split('\n');
  for (var i = 0; i < split.length; i++) {
    if (split[i].trim().isEmpty) continue;
    derived.add(ExtractionSourceLine(index: i, text: split[i]));
  }

  return ExtractionInput(
    sourceId: sourceId,
    sourceType: sourceType,
    normalizedText: text,
    capturedAt: testProducedAt,
    lines: lines ?? derived,
    hasOcrGeometry: lines != null,
    ocrFailed: ocrFailed,
    multimodalSourceAvailable: imagePixelCount > 0,
    imagePixelCount: imagePixelCount,
  );
}

/// Runs a provider payload through the real validator.
ExtractionResult validate(Object? payload, ExtractionInput input) =>
    const ExtractionValidator().validate(
      payload: payload,
      input: input,
      engine: 'test',
      producedAt: testProducedAt,
    );

/// A minimal well-formed response, so each test only states the part it is
/// about instead of restating a whole draft.
Map<String, dynamic> response({
  Object? title = 'A title',
  Object? summary = 'A summary.',
  Object? category = 'payment',
  Object? urgency,
  Object? urgencyReason,
  List<Map<String, dynamic>>? fields,
  List<Map<String, dynamic>>? steps,
  Object? consequence,
  Object? schemaVersion = 1,
  bool noActionRequired = false,
}) =>
    {
      'schema_version': ?schemaVersion,
      'no_action_required': noActionRequired,
      'title': ?title,
      'summary': ?summary,
      'category': ?category,
      'urgency': ?urgency,
      'urgency_reason': ?urgencyReason,
      'fields': ?fields,
      'steps': ?steps,
      'consequence': ?consequence,
    };
