import 'dart:convert';

import '../../../core/result.dart';
import '../../capture/domain/source_item.dart';
import '../domain/escalation.dart';
import '../domain/extraction_input.dart';
import '../domain/extraction_result.dart';
import '../domain/extraction_schema.dart';
import 'extraction_service.dart';
import 'extraction_validator.dart';

/// One synthetic case: a document, the response a provider would give for it,
/// and what the app is expected to make of the pair.
///
/// The corpus is deliberately *not* a set of expected model outputs — that
/// would only test the model, which we cannot run offline anyway. It is a set
/// of provider responses chosen to exercise the seam: well-formed ones,
/// malformed ones, plausible lies, ungrounded consequences, invented deadlines,
/// duplicated steps. What is being pinned down is the app's reaction.
///
/// All content is synthetic. Real captures never enter this corpus — the day-4
/// checkpoint records that rule and day 5 is where it would first be tempting
/// to break it.
class ExtractionFixtureCase {
  const ExtractionFixtureCase({
    required this.id,
    required this.description,
    required this.sourceText,
    required this.providerResponse,
    this.sourceType = SourceType.photo,
    this.lines = const [],
    this.imagePixelCount = 0,
    this.ocrFailed = false,
    this.expectation = const ExtractionExpectation(),
  });

  final String id;
  final String description;
  final String sourceText;

  /// What the provider "returned". A [Map] for well-formed cases, a [String]
  /// for the malformed ones — the validator has to cope with both.
  final Object? providerResponse;

  final SourceType sourceType;

  /// Optional simulated OCR lines, so escalation cases can carry confidences
  /// and line shapes that plain text cannot express.
  final List<ExtractionSourceLine> lines;

  final int imagePixelCount;
  final bool ocrFailed;
  final ExtractionExpectation expectation;

  ExtractionInput toInput() {
    final derived = <ExtractionSourceLine>[];
    if (lines.isEmpty) {
      final split = sourceText.split('\n');
      for (var i = 0; i < split.length; i++) {
        if (split[i].trim().isEmpty) continue;
        derived.add(ExtractionSourceLine(index: i, text: split[i]));
      }
    }

    return ExtractionInput(
      sourceId: id,
      sourceType: sourceType,
      normalizedText: sourceText,
      // Fixed so a fixture run never depends on the clock.
      capturedAt: DateTime.utc(2026, 1, 1),
      lines: lines.isEmpty ? derived : lines,
      hasOcrGeometry: lines.isNotEmpty,
      ocrFailed: ocrFailed,
      multimodalSourceAvailable: imagePixelCount > 0,
      imagePixelCount: imagePixelCount,
    );
  }

  static List<ExtractionFixtureCase> parseManifest(String jsonText) {
    final root = jsonDecode(jsonText) as Map<String, dynamic>;
    return (root['cases'] as List)
        .whereType<Map<String, dynamic>>()
        .map(_parseCase)
        .toList();
  }

  static ExtractionFixtureCase _parseCase(Map<String, dynamic> json) {
    final rawLines = (json['lines'] as List? ?? const [])
        .whereType<Map<String, dynamic>>()
        .toList();

    return ExtractionFixtureCase(
      id: json['id'] as String,
      description: json['description'] as String? ?? '',
      sourceText: json['sourceText'] as String? ?? '',
      providerResponse: json['providerResponse'],
      sourceType: SourceType.fromName(json['sourceType'] as String?),
      imagePixelCount: (json['imagePixelCount'] as num?)?.toInt() ?? 0,
      ocrFailed: json['ocrFailed'] as bool? ?? false,
      lines: [
        for (var i = 0; i < rawLines.length; i++)
          ExtractionSourceLine(
            index: i,
            text: rawLines[i]['text'] as String? ?? '',
            confidence: (rawLines[i]['confidence'] as num?)?.toDouble(),
          ),
      ],
      expectation: ExtractionExpectation.fromJson(
        json['expect'] as Map<String, dynamic>? ?? const {},
      ),
    );
  }
}

/// What a fixture asserts about the validated outcome.
///
/// Every field is optional so a case only pins down what it is actually about.
/// A fixture that exists to test currency rejection should not also have to
/// restate the whole draft.
class ExtractionExpectation {
  const ExtractionExpectation({
    this.hasDraft,
    this.noActionRequired,
    this.reviewState,
    this.category,
    this.urgency,
    this.groundedDueAt,
    this.groundedAmount,
    this.dueAtAbsent,
    this.amountAbsent,
    this.fieldCount,
    this.stepCount,
    this.issueCount,
    this.issueCodes = const {},
    this.forbiddenIssueCodes = const {},
    this.escalationSignals = const {},
    this.mayNeedMultimodal,
    this.consequencePresent,
  });

  final bool? hasDraft;
  final bool? noActionRequired;
  final ExtractionReviewState? reviewState;
  final ActionCategory? category;
  final ActionUrgency? urgency;

  /// ISO date the draft must expose, or the literal string `null` in JSON to
  /// assert the app refused to expose one.
  final String? groundedDueAt;

  /// `"780.00 GBP"` form, matching [MoneyValue.toString].
  final String? groundedAmount;

  /// Asserts the draft exposes *no* deadline. The important half of the
  /// contract: a case where the app refuses to name a date is as much a
  /// behaviour worth pinning as one where it names the right date.
  final bool? dueAtAbsent;
  final bool? amountAbsent;

  final int? fieldCount;
  final int? stepCount;

  /// Exact number of issues. Set on the clean cases, where "no complaints at
  /// all" is the point; left null on cases that only care about specific codes.
  final int? issueCount;

  /// Issues that must be present. Not exhaustive — a case asserts the codes it
  /// is about.
  final Set<ExtractionIssueCode> issueCodes;

  /// Issues that must *not* be present. Used by the injection cases to assert
  /// that hostile text did not, for instance, produce an accepted consequence.
  final Set<ExtractionIssueCode> forbiddenIssueCodes;

  final Set<ExtractionEscalationSignal> escalationSignals;
  final bool? mayNeedMultimodal;
  final bool? consequencePresent;

  static ExtractionExpectation fromJson(Map<String, dynamic> json) =>
      ExtractionExpectation(
        hasDraft: json['hasDraft'] as bool?,
        noActionRequired: json['noActionRequired'] as bool?,
        reviewState: json.containsKey('reviewState')
            ? ExtractionReviewState.fromName(json['reviewState'] as String?)
            : null,
        category: json.containsKey('category')
            ? ActionCategory.fromName(json['category'] as String?)
            : null,
        urgency: json.containsKey('urgency')
            ? ActionUrgency.fromName(json['urgency'] as String?)
            : null,
        groundedDueAt: json['groundedDueAt'] as String?,
        groundedAmount: json['groundedAmount'] as String?,
        dueAtAbsent: json['dueAtAbsent'] as bool?,
        amountAbsent: json['amountAbsent'] as bool?,
        fieldCount: (json['fieldCount'] as num?)?.toInt(),
        stepCount: (json['stepCount'] as num?)?.toInt(),
        issueCount: (json['issueCount'] as num?)?.toInt(),
        issueCodes: _codes(json['issueCodes']),
        forbiddenIssueCodes: _codes(json['forbiddenIssueCodes']),
        escalationSignals: (json['escalationSignals'] as List? ?? const [])
            .whereType<String>()
            .map(ExtractionEscalationSignal.fromName)
            .whereType<ExtractionEscalationSignal>()
            .toSet(),
        mayNeedMultimodal: json['mayNeedMultimodal'] as bool?,
        consequencePresent: json['consequencePresent'] as bool?,
      );

  static Set<ExtractionIssueCode> _codes(Object? raw) =>
      (raw as List? ?? const [])
          .whereType<String>()
          .map(ExtractionIssueCode.fromName)
          .whereType<ExtractionIssueCode>()
          .toSet();
}

/// An [ExtractionService] that replays canned provider responses.
///
/// Its value is that it is **not** a stub returning ready-made domain objects.
/// It feeds its canned response through the same [ExtractionValidator] the real
/// provider will use, so every test written against it is a test of the
/// validation, grounding and escalation logic that day 6 will depend on. A stub
/// that returned a finished [ExtractionResult] would prove nothing.
class FixtureExtractionService implements ExtractionService {
  const FixtureExtractionService({
    required this.responses,
    this.engine = 'fixture',
    this.validator = const ExtractionValidator(),
    this.producedAt,
  });

  /// Keyed by [ExtractionInput.sourceId].
  final Map<String, Object?> responses;

  final String engine;
  final ExtractionValidator validator;

  /// Fixed by default so two runs of the corpus produce byte-identical output.
  final DateTime? producedAt;

  /// Builds a service that answers every case in a parsed corpus.
  factory FixtureExtractionService.forCases(
    List<ExtractionFixtureCase> cases, {
    String engine = 'fixture',
  }) =>
      FixtureExtractionService(
        responses: {for (final c in cases) c.id: c.providerResponse},
        engine: engine,
      );

  @override
  Future<Result<ExtractionResult>> extract(ExtractionInput input) async {
    if (!responses.containsKey(input.sourceId)) {
      // Modelled as a transport failure, because that is what it is: no answer
      // arrived. It is not a document the app failed to understand.
      return Err('No fixture response is registered for ${input.sourceId}.');
    }

    return Ok(
      validator.validate(
        payload: responses[input.sourceId],
        input: input,
        engine: engine,
        producedAt: producedAt ?? DateTime.utc(2026, 1, 1),
      ),
    );
  }
}
