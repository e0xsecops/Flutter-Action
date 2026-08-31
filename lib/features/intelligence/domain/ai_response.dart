/// What comes back, normalised.
library;

/// A quote the provider attached to a claim, with where it came from.
///
/// **Why this is a first-class type.** Anthropic returns `cited_text` with a
/// 1-indexed page location when citations are enabled, and that is the single
/// most valuable thing any of the three providers gives Action: it turns a
/// plausible answer into a checkable one. Tools that assert facts prefer a model
/// that supplies these, and say so plainly when none are available rather than
/// presenting an unevidenced claim as if it were evidenced.
class AiCitation {
  const AiCitation({
    required this.quotedText,
    this.sourceId,
    this.documentLabel,
    this.startPage,
    this.endPage,
  });

  /// Copied verbatim from the source. Never paraphrased — a paraphrased quote
  /// cannot be checked against the document, which defeats the point.
  final String quotedText;

  final String? sourceId;
  final String? documentLabel;

  /// 1-indexed, matching the provider and matching what a person sees in a
  /// PDF viewer.
  final int? startPage;
  final int? endPage;

  /// "page 4", "pages 4–6", or null when the location is unknown.
  String? get pageLabel {
    final start = startPage;
    if (start == null) return null;
    final end = endPage;
    if (end == null || end == start) return 'page $start';
    return 'pages $start–$end';
  }
}

/// Token usage, when the provider reports it.
///
/// Deliberately not converted into money. Provider pricing changes, a stale
/// table lies to the user, and there is no reliable way to keep one current from
/// inside the app — see `docs/v2/AI_PROVIDER_RESEARCH.md` §4.
class AiUsageObservation {
  const AiUsageObservation({this.inputTokens, this.outputTokens});

  final int? inputTokens;
  final int? outputTokens;

  bool get isEmpty => inputTokens == null && outputTokens == null;
}

/// A completed response.
class AiResponse {
  const AiResponse({
    required this.text,
    this.citations = const [],
    this.usage,
    this.modelId,
    this.truncated = false,
  });

  /// The model's output. For a structured request this is the raw JSON string,
  /// still unvalidated — validation belongs to the tool that owns the schema,
  /// not to the transport.
  final String text;

  final List<AiCitation> citations;

  final AiUsageObservation? usage;

  /// What the provider says actually ran, which is not always what was asked
  /// for. Worth surfacing in a technical detail view.
  final String? modelId;

  /// True when generation stopped at the token limit.
  ///
  /// Must reach the UI: a truncated extraction that looks complete is worse
  /// than an obvious failure, because the user acts on it.
  final bool truncated;

  bool get hasCitations => citations.isNotEmpty;
}

/// Incremental output, for generative tools.
///
/// Structured extraction deliberately does not stream. Rendering half-parsed
/// JSON risks showing a partial fact as a confirmed one, and a fact the user
/// sees is a fact they may act on.
sealed class AiStreamEvent {
  const AiStreamEvent();
}

class AiTextDelta extends AiStreamEvent {
  const AiTextDelta(this.text);
  final String text;
}

class AiStreamCompleted extends AiStreamEvent {
  const AiStreamCompleted(this.response);
  final AiResponse response;
}
