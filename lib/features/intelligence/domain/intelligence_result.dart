/// The one shape every intelligence tool returns.
///
/// **Why one shape for fifteen tools.** If each tool invented its own result
/// type, each would need its own renderer, its own action bar and its own
/// empty and error states — which is how "fifteen capabilities" becomes fifteen
/// screens and, shortly after, fifteen slightly different products. Sharing this
/// means a new tool is a prompt, a contract and a parser, and it arrives already
/// looking and behaving like the rest of Action.
///
/// See `docs/v2/ACTION_INTELLIGENCE_SPEC.md` §4.
library;

import 'ai_response.dart';

/// How a section wants to be read.
///
/// Presentation is chosen by the tool that produced the content, because the
/// tool is the only thing that knows whether it is returning an argument or a
/// list of dates.
enum IntelligenceSectionKind {
  /// Paragraphs.
  prose,

  /// A short list of points.
  bullets,

  /// Label/value pairs — references, amounts, dates.
  facts,

  /// Rows and columns.
  table,

  /// Copied from the source, shown as a quotation.
  quote,
}

/// A label/value pair, optionally with the evidence behind it.
class IntelligenceFact {
  const IntelligenceFact({
    required this.label,
    required this.value,
    this.citation,
    this.uncertain = false,
  });

  final String label;
  final String value;

  /// Where this came from. Absent means the model asserted it without evidence,
  /// which the UI shows differently — an unevidenced amount is not the same
  /// kind of thing as a quoted one.
  final IntelligenceCitation? citation;

  /// The tool could not tell reliably.
  ///
  /// Shown as uncertainty rather than dropped: "the two dates in this document
  /// disagree" is useful, and silently picking one is not.
  final bool uncertain;
}

/// One block of a result.
class IntelligenceSection {
  const IntelligenceSection({
    required this.title,
    this.kind = IntelligenceSectionKind.prose,
    this.body,
    this.bullets = const [],
    this.facts = const [],
    this.rows = const [],
    this.columns = const [],
  });

  final String title;
  final IntelligenceSectionKind kind;

  /// Used by [IntelligenceSectionKind.prose] and `quote`.
  final String? body;

  final List<String> bullets;
  final List<IntelligenceFact> facts;

  /// Table data. Ragged rows are tolerated at render time rather than rejected:
  /// a model that returns one short row should not lose the other twelve.
  final List<String> columns;
  final List<List<String>> rows;

  bool get isEmpty =>
      (body?.trim().isEmpty ?? true) &&
      bullets.isEmpty &&
      facts.isEmpty &&
      rows.isEmpty;
}

/// Evidence for a claim.
///
/// A thin wrapper over the provider-level [AiCitation] so the presentation
/// layer never has to import anything from the transport, and so a citation
/// Action derived locally sits alongside one a provider returned.
class IntelligenceCitation {
  const IntelligenceCitation({
    required this.quotedText,
    this.sourceId,
    this.sourceLabel,
    this.pageLabel,
  });

  factory IntelligenceCitation.fromProvider(AiCitation citation) =>
      IntelligenceCitation(
        quotedText: citation.quotedText,
        sourceId: citation.sourceId,
        sourceLabel: citation.documentLabel,
        pageLabel: citation.pageLabel,
      );

  final String quotedText;
  final String? sourceId;
  final String? sourceLabel;
  final String? pageLabel;

  /// "Renewal notice, page 3" — what an evidence chip shows.
  String get locationLabel {
    final parts = [
      ?sourceLabel,
      ?pageLabel,
    ];
    return parts.isEmpty ? 'From the selected source' : parts.join(', ');
  }
}

/// What a suggestion would become if the user accepted it.
enum IntelligenceSuggestionKind {
  /// A step in an Action Chain.
  step,

  /// A whole Action.
  action,

  /// Something to find out — a question to ask, a missing detail.
  question,

  /// A date the user may want a reminder for. Never scheduled automatically.
  deadline,
}

/// Something the user may choose to keep.
///
/// **Nothing here is persisted until the user says so.** A suggestion is advice
/// with a checkbox next to it, which is what keeps a prompt injection or a
/// confident hallucination from becoming a fact in the database. See
/// `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T3).
class IntelligenceSuggestion {
  const IntelligenceSuggestion({
    required this.id,
    required this.kind,
    required this.title,
    this.detail,
    this.dueAt,
    this.citation,
    this.selectedByDefault = false,
  });

  /// Stable within one result, so a selection survives a rebuild.
  final String id;

  final IntelligenceSuggestionKind kind;
  final String title;
  final String? detail;

  /// Only ever set when the source actually stated a date. A plausible-sounding
  /// deadline the document does not mention is a fabrication.
  final DateTime? dueAt;

  final IntelligenceCitation? citation;

  /// Off by default for anything that would create data. Pre-ticking a box that
  /// writes to the user's Actions makes confirmation theatre.
  final bool selectedByDefault;
}

enum IntelligenceWarningLevel {
  /// Worth knowing. The result is still usable.
  note,

  /// The result is incomplete or less reliable than it looks.
  caution,
}

/// Something the user must know to read the result correctly.
///
/// Not decoration. A truncated answer, an ungrounded claim or an uncertain
/// table is a result the user would otherwise act on as if it were whole.
class IntelligenceWarning {
  const IntelligenceWarning({
    required this.level,
    required this.message,
  });

  const IntelligenceWarning.caution(String message)
      : this(level: IntelligenceWarningLevel.caution, message: message);

  const IntelligenceWarning.note(String message)
      : this(level: IntelligenceWarningLevel.note, message: message);

  final IntelligenceWarningLevel level;
  final String message;
}

/// Generated content the user can keep, copy, edit or export.
///
/// A derived document. The original Source is never modified — "write" means
/// produce something new. See `docs/v2/ACTION_INTELLIGENCE_SPEC.md` §10.
class IntelligenceArtifact {
  const IntelligenceArtifact({
    required this.title,
    required this.text,
    this.mimeType = 'text/plain',
    this.isDraft = true,
  });

  final String title;
  final String text;
  final String mimeType;

  /// Drafts are labelled as drafts everywhere they appear, and nothing Action
  /// generates is ever sent anywhere on its own.
  final bool isDraft;
}

/// A finished tool run.
class IntelligenceResult {
  const IntelligenceResult({
    required this.toolId,
    this.sections = const [],
    this.citations = const [],
    this.suggestions = const [],
    this.warnings = const [],
    this.artifacts = const [],
    this.usage,
    this.modelId,
  });

  final String toolId;
  final List<IntelligenceSection> sections;
  final List<IntelligenceCitation> citations;
  final List<IntelligenceSuggestion> suggestions;
  final List<IntelligenceWarning> warnings;
  final List<IntelligenceArtifact> artifacts;

  /// Token counts where the provider reported them. Never converted to money.
  final AiUsageObservation? usage;

  final String? modelId;

  /// Whether any claim in this result carries evidence.
  ///
  /// Drives the UI's honesty about itself: a factual answer with no citations is
  /// presented as an unevidenced reading of the document, not as a finding.
  bool get isGrounded => citations.isNotEmpty;

  bool get isEmpty =>
      sections.every((s) => s.isEmpty) &&
      suggestions.isEmpty &&
      artifacts.isEmpty;

  IntelligenceResult copyWith({
    List<IntelligenceWarning>? warnings,
    AiUsageObservation? usage,
    String? modelId,
  }) =>
      IntelligenceResult(
        toolId: toolId,
        sections: sections,
        citations: citations,
        suggestions: suggestions,
        warnings: warnings ?? this.warnings,
        artifacts: artifacts,
        usage: usage ?? this.usage,
        modelId: modelId ?? this.modelId,
      );
}
