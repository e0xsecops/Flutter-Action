/// What a given provider *and model* can actually accept.
///
/// **Why this is explicit data rather than something inferred.** "Gemini
/// supports PDFs" is true of the provider and false of several of its models.
/// A text-only model behind a multimodal provider is a normal configuration,
/// and it is the configuration that breaks a naive dispatch: the request goes
/// out, the document is dropped or rejected, and the user is shown an answer
/// about a document nobody read. Capability therefore travels with the model
/// descriptor and is checked before a request is built.
///
/// See `docs/v2/ACTION_INTELLIGENCE_SPEC.md` §2 and
/// `docs/v2/AI_PROVIDER_RESEARCH.md` §2.
library;

enum AiCapability {
  /// Plain text in, plain text out. Every usable model has this.
  text,

  /// Accepts images as input.
  vision,

  /// Accepts a document (PDF) as a first-class input, rather than needing the
  /// text pulled out locally first.
  documents,

  /// Can be constrained to a JSON schema by the provider itself.
  structuredOutput,

  /// Supports incremental token delivery.
  streaming,

  /// Honours a separate system instruction channel. Where absent, the
  /// instruction is folded into the first user turn instead — which works, but
  /// is weaker against injected text and so is worth knowing about.
  systemInstruction,

  /// Returns verifiable evidence for claims — quoted text with a location.
  ///
  /// Only Anthropic supplies this today, and it is the difference between a
  /// grounded answer and a plausible one. Tools that need evidence prefer a
  /// model with it and degrade honestly without it.
  citations,

  /// A context window large enough for whole documents rather than excerpts.
  longContext,
}

/// An immutable capability set.
///
/// A thin wrapper over a `Set` so that call sites read as a question about the
/// model ("can it read documents?") and so the set cannot be mutated by
/// whoever happens to be holding it.
extension type const AiCapabilities(Set<AiCapability> _values) {
  static const AiCapabilities none = AiCapabilities(<AiCapability>{});

  /// The conservative floor assumed for an endpoint Action knows nothing about
  /// — a user's own OpenAI-compatible server. Claiming less than a server can
  /// do produces a needless refusal the user can fix by widening it manually;
  /// claiming more produces a broken request they cannot fix at all.
  static const AiCapabilities textOnly = AiCapabilities({AiCapability.text});

  bool has(AiCapability capability) => _values.contains(capability);

  bool hasAll(Iterable<AiCapability> required) => required.every(has);

  /// The capabilities in [required] this set is missing.
  ///
  /// Returned rather than a bare bool so the failure can name what is wrong:
  /// "this model cannot read documents" is actionable, "unsupported" is not.
  Set<AiCapability> missingFrom(Iterable<AiCapability> required) =>
      required.where((c) => !has(c)).toSet();

  Set<AiCapability> get values => _values;
}

/// How a missing capability reads, in canonical English.
///
/// Kept next to the enum so a new capability cannot be added without deciding
/// what the user would be told when it is absent — and kept in English so a
/// log line, a fixture report and a domain test can print it without a locale.
///
/// What a person reads is `AiCapabilityL10n.describeIn(l10n)` in
/// `lib/l10n/enum_labels.dart`. These nouns are mid-sentence and lowercase on
/// purpose: they land inside "the model you chose cannot read …", not on a
/// button.
String describeCapability(AiCapability capability) => switch (capability) {
      AiCapability.text => 'text',
      AiCapability.vision => 'images',
      AiCapability.documents => 'documents',
      AiCapability.structuredOutput => 'structured results',
      AiCapability.streaming => 'streaming',
      AiCapability.systemInstruction => 'system instructions',
      AiCapability.citations => 'evidence citations',
      AiCapability.longContext => 'long documents',
    };

/// Several capabilities, joined as they read inside a sentence — in English.
///
/// **Why the join is not a `join(', ')` at the call site.** The comma and the
/// "or" are language, not punctuation: Arabic writes `، `, Chinese and
/// Japanese write `、`, and several languages put the conjunction somewhere
/// English does not. So the joining is a translated pattern like everything
/// else, and this function is only its English twin, for logs and tests. A
/// person reads `AiCapabilityListL10n.describeIn(l10n)`.
///
/// Order follows the enum declaration rather than the alphabet, because an
/// alphabetical sort is an English sort and would reorder the sentence
/// differently in every locale.
String describeCapabilities(Iterable<AiCapability> capabilities) {
  final ordered = AiCapability.values.where(capabilities.contains).toList();
  if (ordered.isEmpty) return '';
  if (ordered.length == 1) return describeCapability(ordered.single);
  final head = ordered
      .sublist(0, ordered.length - 1)
      .map(describeCapability)
      .join(', ');
  return '$head or ${describeCapability(ordered.last)}';
}
