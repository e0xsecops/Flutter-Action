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
import 'tool_copy.dart';

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
    this.labelCopy,
    this.valueCopy,
    this.citation,
    this.uncertain = false,
  });

  final String label;
  final String value;

  /// What [label] *is*, where the tool wrote it rather than the model.
  final ToolCopy? labelCopy;

  /// What [value] *is*.
  ///
  /// Null for an amount, a date or a reference read out of the user's own
  /// document. Those are not anybody's to translate.
  final ToolCopy? valueCopy;

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
    this.titleCopy,
    this.kind = IntelligenceSectionKind.prose,
    this.body,
    this.bodyCopy,
    this.bullets = const [],
    this.bulletCopy = const [],
    this.facts = const [],
    this.rows = const [],
    this.columns = const [],
  });

  /// Canonical English. Still what a log line, the activity journal and the
  /// domain tests read.
  final String title;

  /// What [title] *is*, where it is editorial copy this tool wrote.
  ///
  /// Null on purpose where the title is runtime text — a host read out of a
  /// link, a mode the user picked, a fact name the model returned. Absence is
  /// a statement, not an omission: it says this string is nobody's to
  /// translate.
  final ToolCopy? titleCopy;

  final IntelligenceSectionKind kind;

  /// Used by [IntelligenceSectionKind.prose] and `quote`.
  final String? body;

  /// What [body] *is*. Null where the body is the model's own prose.
  final ToolCopy? bodyCopy;

  final List<String> bullets;

  /// Index-parallel to [bullets], or empty when no bullet is editorial.
  ///
  /// Ragged is tolerated the way a ragged table row is: a short list costs the
  /// bullets it does not cover, not the whole section.
  final List<ToolCopy> bulletCopy;
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
    this.startPage,
    this.endPage,
  });

  factory IntelligenceCitation.fromProvider(AiCitation citation) =>
      IntelligenceCitation(
        quotedText: citation.quotedText,
        sourceId: citation.sourceId,
        sourceLabel: citation.documentLabel,
        pageLabel: citation.pageLabel,
        startPage: citation.startPage,
        endPage: citation.endPage,
      );

  final String quotedText;
  final String? sourceId;
  final String? sourceLabel;

  /// The provider's page location as canonical English — "page 3",
  /// "pages 3–6". Kept for logs and for a citation built without page
  /// numbers; the evidence chip prefers [startPage]/[endPage].
  final String? pageLabel;

  /// 1-indexed, carried through from [AiCitation] so the page label can be
  /// *built* in the reader's language rather than translated after the fact.
  ///
  /// This is the whole reason they are here. "page 3" arrives from the
  /// provider layer as a finished English string, and by then the number has
  /// stopped being a number — nothing downstream can pluralise it for a
  /// language that inflects the noun, or swap the en dash for the range mark
  /// its locale uses. Null for a citation Action derived locally, which has
  /// no page to point at and must not invent one.
  final int? startPage;
  final int? endPage;
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
    this.titleCopy,
    this.detail,
    this.detailCopy = const <ToolCopy>[],
    this.dueAt,
    this.citation,
    this.selectedByDefault = false,
  });

  /// Stable within one result, so a selection survives a rebuild.
  final String id;

  final IntelligenceSuggestionKind kind;
  final String title;

  /// What [title] *is*. Null where the title is the model's own words, which
  /// is the usual case for a suggestion.
  final ToolCopy? titleCopy;

  final String? detail;

  /// The parts of [detail], unjoined.
  ///
  /// [detail] is a `' · '` join made in `data/` — a sentence assembled in
  /// English order out of translatable labels and untranslatable model text.
  /// The parts travel separately so the reader's bundle chooses the separator,
  /// and so "If not: {consequence}" and "You need: {items}" reach the bundle
  /// as frames rather than as finished strings. Empty means [detail] is
  /// runtime text throughout.
  final List<ToolCopy> detailCopy;

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
    required this.copy,
  });

  const IntelligenceWarning.caution(String message, ToolCopy copy)
      : this(
          level: IntelligenceWarningLevel.caution,
          message: message,
          copy: copy,
        );

  const IntelligenceWarning.note(String message, ToolCopy copy)
      : this(
          level: IntelligenceWarningLevel.note,
          message: message,
          copy: copy,
        );

  final IntelligenceWarningLevel level;

  /// Canonical English, written at the tool that raises it.
  ///
  /// Read by logs, by the fixture reports and by the domain tests; no longer
  /// the string on screen. [copy] is what the banner renders.
  final String message;

  /// What this warning *is*.
  ///
  /// **Required, unlike every other copy field in this file.** A warning is
  /// never runtime text — all of them are editorial, and several are safety
  /// copy whose only job is to stop the user acting on something. A section
  /// title may legitimately be a hostname; a caution may not legitimately be
  /// English on a Bengali screen. So a new tool that raises a warning without
  /// an identity does not compile.
  final ToolCopy copy;
}

/// Generated content the user can keep, copy, edit or export.
///
/// A derived document. The original Source is never modified — "write" means
/// produce something new. See `docs/v2/ACTION_INTELLIGENCE_SPEC.md` §10.
class IntelligenceArtifact {
  const IntelligenceArtifact({
    required this.title,
    this.titleCopy,
    required this.text,
    this.mimeType = 'text/plain',
    this.isDraft = true,
  });

  final String title;

  /// What [title] *is*. Null where the artifact is named after the user's own
  /// document rather than by the tool.
  final ToolCopy? titleCopy;
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
