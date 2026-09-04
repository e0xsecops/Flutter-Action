/// Shared machinery for tool strategies: schemas, decoding, evidence.
///
/// The schema helpers exist to keep every tool inside the *intersection* of
/// what the three providers accept, which is narrower than JSON Schema and
/// narrower than any one of them alone. Anthropic rejects recursion,
/// `minimum`/`maximum`, `minLength`/`maxLength` and any `additionalProperties`
/// other than `false`; OpenAI requires `additionalProperties: false` and an
/// explicit `required` array listing every property. Building schemas by hand
/// means one of those gets forgotten, and the failure arrives as a provider 400
/// the user cannot act on.
library;

import 'dart:convert';

import '../../domain/ai_response.dart';
import '../../domain/intelligence_result.dart';
import '../../domain/intelligence_tool.dart';
import '../evidence_verifier.dart';

// ---------------------------------------------------------------------------
// Schema builders
// ---------------------------------------------------------------------------

const Map<String, dynamic> stringField = {'type': 'string'};
const Map<String, dynamic> boolField = {'type': 'boolean'};
const Map<String, dynamic> intField = {'type': 'integer'};

/// A nullable string.
///
/// `anyOf` with an explicit null rather than omitting the property: every
/// property has to appear in `required` for OpenAI's strict mode, so "unknown"
/// has to be expressible as a value rather than as an absence.
const Map<String, dynamic> nullableString = {
  'anyOf': [
    {'type': 'string'},
    {'type': 'null'},
  ],
};

Map<String, dynamic> enumField(List<String> values) => {
      'type': 'string',
      'enum': values,
    };

Map<String, dynamic> arrayOf(Map<String, dynamic> items) => {
      'type': 'array',
      'items': items,
    };

/// An object schema with every provider's requirements applied automatically.
Map<String, dynamic> objectSchema(Map<String, dynamic> properties) => {
      'type': 'object',
      'properties': properties,
      // Every property listed, because strict mode requires it. "Not known" is
      // expressed as a null value, never as a missing key.
      'required': properties.keys.toList(),
      'additionalProperties': false,
    };

/// The evidence field every factual tool must return.
///
/// Verbatim, not paraphrased — a paraphrase cannot be checked against the
/// document, which is the entire point.
const Map<String, dynamic> evidenceField = nullableString;

// ---------------------------------------------------------------------------
// Response decoding
// ---------------------------------------------------------------------------

/// Decodes a structured response, tolerating the wrappers models add.
///
/// Even under a strict schema, output arrives fenced in a Markdown code block
/// often enough that rejecting it would fail runs that actually succeeded.
/// Tolerating the fence is not the same as tolerating invalid data — the
/// contents are still validated against the schema by the caller.
Map<String, dynamic> decodeToolJson(String raw) {
  var text = raw.trim();

  if (text.startsWith('```')) {
    final firstBreak = text.indexOf('\n');
    if (firstBreak != -1) text = text.substring(firstBreak + 1);
    final fence = text.lastIndexOf('```');
    if (fence != -1) text = text.substring(0, fence);
    text = text.trim();
  }

  // Some models prepend a sentence before the object. Falling back to the first
  // balanced-looking span is better than discarding a good result.
  if (!text.startsWith('{')) {
    final start = text.indexOf('{');
    final end = text.lastIndexOf('}');
    if (start != -1 && end > start) text = text.substring(start, end + 1);
  }

  final Object? decoded;
  try {
    decoded = jsonDecode(text);
  } on FormatException catch (error) {
    throw FormatException('response was not JSON: ${error.message}');
  }
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('response was not a JSON object');
  }
  return decoded;
}

/// A trimmed string, or null when absent, empty, or the model's word for empty.
///
/// Models routinely return the literal strings "null", "none", "n/a" and "-"
/// where a JSON null was asked for. Rendering those as a fact value would put
/// the word "none" in front of the user as though it were a reference number.
String? readString(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value == null) return null;
  final text = value is String ? value.trim() : value.toString().trim();
  if (text.isEmpty) return null;
  const emptyWords = {'null', 'none', 'n/a', 'na', '-', 'unknown', 'not stated'};
  if (emptyWords.contains(text.toLowerCase())) return null;
  return text;
}

bool readBool(Map<String, dynamic> json, String key) => json[key] == true;

int? readInt(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value.trim());
  return null;
}

/// Objects under [key], skipping anything that is not one.
///
/// A model returning eleven good rows and one string should lose the string,
/// not the rows.
List<Map<String, dynamic>> readObjects(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is! List) return const [];
  return value.whereType<Map<String, dynamic>>().toList();
}

List<String> readStrings(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is! List) return const [];
  return value
      .map((e) => e is String ? e.trim() : e?.toString().trim() ?? '')
      .where((e) => e.isNotEmpty)
      .toList();
}

/// An ISO date the source actually stated, or null.
///
/// Deliberately strict. A date that cannot be parsed is dropped rather than
/// guessed at, because a wrong deadline is worse than no deadline.
DateTime? readIsoDate(Map<String, dynamic> json, String key) {
  final text = readString(json, key);
  if (text == null) return null;
  return DateTime.tryParse(text);
}

// ---------------------------------------------------------------------------
// Evidence
// ---------------------------------------------------------------------------

/// A claim with its evidence checked against the source.
class VerifiedEvidence {
  const VerifiedEvidence({required this.status, this.citation});

  final EvidenceStatus status;
  final IntelligenceCitation? citation;

  /// A fact whose quote could not be found is shown as uncertain rather than
  /// dropped: the user should see that the model claimed it and that Action
  /// could not confirm it.
  bool get isUncertain => status == EvidenceStatus.notFound;
}

/// Verifies one quote and builds the citation for it.
VerifiedEvidence verifyEvidence(
  EvidenceVerifier verifier,
  String? quote,
  IntelligenceRunInput input,
) {
  final status = verifier.check(quote);
  if (quote == null || quote.trim().isEmpty) {
    return VerifiedEvidence(status: status);
  }
  return VerifiedEvidence(
    status: status,
    citation: IntelligenceCitation(
      quotedText: quote.trim(),
      sourceLabel: _singleSourceLabel(input),
    ),
  );
}

/// The label to attach when there is exactly one source.
///
/// With several selected, the model is not asked which one a quote came from —
/// asking produces confident wrong attributions — so the citation carries the
/// quote without claiming a document.
String? _singleSourceLabel(IntelligenceRunInput input) {
  if (input.sourceLabels.length == 1) return input.sourceLabels.values.first;
  return null;
}

/// The warning to show when evidence did not hold up.
///
/// Counted rather than listed: "two of these could not be found" is the shape
/// of the problem, and repeating each failed quote would bury the result.
List<IntelligenceWarning> evidenceWarnings(
  List<VerifiedEvidence> evidence,
  EvidenceVerifier verifier,
) {
  final warnings = <IntelligenceWarning>[];
  final notFound = evidence.where((e) => e.status == EvidenceStatus.notFound).length;

  if (notFound > 0) {
    warnings.add(IntelligenceWarning.caution(
      notFound == 1
          ? 'One quoted detail could not be found in what you selected, so it '
              'is marked uncertain.'
          : '$notFound quoted details could not be found in what you selected, '
              'so they are marked uncertain.',
    ));
  } else if (!verifier.canVerify && evidence.isNotEmpty) {
    warnings.add(const IntelligenceWarning.note(
      "Action couldn't check these quotes against the file itself, so they "
      'have not been verified.',
    ));
  }
  return warnings;
}

/// Every citation carried by a set of verified claims.
List<IntelligenceCitation> collectCitations(
  List<VerifiedEvidence> evidence,
  AiResponse response,
) {
  final citations = <IntelligenceCitation>[
    for (final item in evidence)
      if (item.citation != null && item.status != EvidenceStatus.notFound)
        item.citation!,
  ];
  // Provider-supplied citations, where the provider supplies them, sit
  // alongside the model's own quotes rather than replacing them.
  citations.addAll(response.citations.map(IntelligenceCitation.fromProvider));
  return citations;
}

// ---------------------------------------------------------------------------
// Shared prompt fragments
// ---------------------------------------------------------------------------

/// Rules every factual tool is held to.
///
/// Each line corresponds to something checked afterwards rather than merely
/// requested — the prompt asks, the parser and the verifier decide.
const String factualRules = '''
Rules:
- Never invent. Every fact must come from the material provided. If it is not there, return null.
- Every fact must carry an "evidence" quote copied word for word from the material, long enough to contain the fact.
- Do not paraphrase an evidence quote. It is checked against the original.
- Dates must be ISO-8601 (YYYY-MM-DD). If a date is ambiguous, return null rather than choosing.
- Amounts must be written exactly as the material writes them.
- Reply in the same language as the material unless asked otherwise.''';

/// Rules every generative tool is held to.
const String generativeRules = '''
Rules:
- Preserve every fact: amounts, dates, reference numbers, names and organisations must not change.
- Do not add facts, commitments or promises the user did not make.
- Do not invent details to fill gaps. Leave a gap visible.
- Write in the same language as the input unless asked otherwise.''';

/// The blunt instruction that stops a model answering from general knowledge.
const String groundingRule =
    'If the material does not answer the question, say so plainly. '
    'Do not answer from general knowledge.';
