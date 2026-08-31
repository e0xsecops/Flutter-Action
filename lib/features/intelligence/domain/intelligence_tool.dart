/// What a capability *is*, as data.
///
/// Fifteen tools share one runner, one gate set, one result model and one
/// renderer set because a tool is a definition plus a strategy — not a screen.
/// Adding the sixteenth should be a prompt and a parser, not a new navigation
/// destination.
///
/// See `docs/v2/ACTION_INTELLIGENCE_SPEC.md` §3.
library;

import 'ai_capabilities.dart';
import 'ai_request.dart';
import 'ai_response.dart';
import 'intelligence_result.dart';

/// The five intents the Studio is organised by.
///
/// Intent, not feature type. A user arrives wanting to understand something or
/// to plan something; they do not arrive wanting "a summarisation tool".
enum IntelligenceCategory {
  understand(label: 'Understand', blurb: 'Make sense of what you have.'),
  plan(label: 'Plan', blurb: 'Turn it into something you can do.'),
  create(label: 'Create', blurb: 'Write it, improve it, translate it.'),
  extract(label: 'Extract', blurb: 'Pull out the details that matter.'),
  verify(label: 'Verify', blurb: 'Check what you are looking at.');

  const IntelligenceCategory({required this.label, required this.blurb});

  final String label;
  final String blurb;
}

/// The visual mark for a tool.
///
/// An enum rather than an `IconData` so the domain stays free of Flutter, and
/// so the *meaning* is named once. Chosen by intent - what the tool does to
/// your material - never by "this is AI". There is no sparkle here and no
/// robot: a tool that finds a deadline is a calendar, not a magic wand.
enum ToolGlyph {
  document,
  question,
  summary,
  compare,
  goal,
  plan,
  checklist,
  gap,
  rewrite,
  reply,
  translate,
  table,
  deadline,
  shield,
  provenance,
}

/// What a tool can be pointed at.
enum IntelligenceInputKind {
  /// A stored Source — a capture, a document, a pasted note.
  source,

  /// More than one Source, chosen deliberately. Only comparison tools take this.
  multipleSources,

  /// An existing Action.
  action,

  /// A Goal.
  goal,

  /// Text the user typed or pasted in the tool itself.
  freeText,

  /// A question, alongside a source.
  question,
}

/// How much of the user's content leaves the device for this tool.
///
/// Surfaced in the UI, because "check this image's metadata" and "send this
/// contract to a third party" deserve visibly different treatment.
enum IntelligencePrivacyLevel {
  /// Runs entirely on-device. No provider, no key, no network.
  local,

  /// Sends the selected content to the configured provider.
  sendsSelectedContent,
}

/// Everything a run needs, resolved.
class IntelligenceRunInput {
  const IntelligenceRunInput({
    required this.parts,
    this.question,
    this.freeText,
    this.mode,
    this.targetLanguage,
    this.sourceLabels = const {},
  });

  /// The content the user chose. Never assembled from ambient state — a tool
  /// sees exactly what was selected for it and nothing else.
  final List<AiPart> parts;

  /// For Q&A tools.
  final String? question;

  /// Text typed into the tool itself.
  final String? freeText;

  /// A tool-specific option: a summary length, a rewrite voice, a reply tone.
  final String? mode;

  /// For translation.
  final String? targetLanguage;

  /// sourceId to display label, so a citation can name a document.
  final Map<String, String> sourceLabels;

  bool get hasSources => parts.any((p) => p is! AiTextPart);
}

/// A tool that runs entirely on this device.
///
/// Two of the fifteen are local, and both are local for a reason rather than as
/// an optimisation. Scanning a document for sensitive information by sending it
/// to a third party would defeat the point of asking, and inspecting a file's
/// own metadata needs no model at all. A useful consequence: both work for
/// someone who has never connected a provider.
abstract interface class LocalIntelligenceStrategy {
  Future<IntelligenceResult> run(IntelligenceRunInput input);
}

/// The tool-specific half: what to ask, and how to read the answer.
abstract interface class IntelligenceToolStrategy {
  /// The tool's own instructions. The injection preamble is prepended by the
  /// adapter, so a strategy never has to remember it.
  String systemInstruction(IntelligenceRunInput input);

  /// Grounded or structured. Decided per tool, and per run where a tool takes
  /// both shapes.
  AiOutputContract contract(IntelligenceRunInput input);

  /// Turns a validated response into the shared result shape.
  ///
  /// Throws [FormatException] when the response does not match the contract;
  /// the runner converts that into a typed failure. Returning a half-built
  /// result would put unvalidated model output in front of the user.
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input);
}

/// One capability.
class IntelligenceToolDefinition {
  const IntelligenceToolDefinition({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.category,
    required this.acceptedInputs,
    required this.glyph,
    this.strategy,
    this.localStrategy,
    this.extraCapabilities = const [],
    this.privacyLevel = IntelligencePrivacyLevel.sendsSelectedContent,
    this.allowsStreaming = false,
    this.allowsSaveToAction = false,
    this.allowsCopy = true,
    this.allowsShare = true,
    this.maxOutputTokens = 4096,
    this.modes = const [],
    this.requiresQuestion = false,
  })  : assert(
          (strategy == null) != (localStrategy == null),
          'a tool runs either against a provider or on this device, not both',
        ),
        assert(
          localStrategy == null ||
              privacyLevel == IntelligencePrivacyLevel.local,
          'a tool that runs on this device must declare itself local, because '
          'the privacy level is what the UI shows the user',
        );

  /// Stable id. Persisted in "recently used", so it must not change.
  final String id;

  final String title;

  /// One line, in the user's terms. Shown on the tool card.
  final String shortDescription;

  final IntelligenceCategory category;

  final Set<IntelligenceInputKind> acceptedInputs;

  /// The mark shown on this tool's card.
  final ToolGlyph glyph;

  /// Set for a tool that calls the configured provider. Null for a local one.
  final IntelligenceToolStrategy? strategy;

  /// Set for a tool that runs on this device. Null for a provider-backed one.
  final LocalIntelligenceStrategy? localStrategy;

  /// Capabilities this tool needs beyond whatever its inputs already imply.
  ///
  /// Deliberately additive: the request derives documents/vision/structured
  /// output from its own parts and contract, so a tool only lists what those
  /// cannot infer — citations being the main one.
  final List<AiCapability> extraCapabilities;

  final IntelligencePrivacyLevel privacyLevel;

  /// Only ever true for generative tools. Structured extraction does not
  /// stream, because half-parsed JSON must never render as a confirmed fact.
  final bool allowsStreaming;

  final bool allowsSaveToAction;
  final bool allowsCopy;
  final bool allowsShare;

  final int maxOutputTokens;

  /// Selectable variants — summary lengths, rewrite voices, reply tones.
  final List<String> modes;

  /// Whether the tool is useless without a typed question.
  final bool requiresQuestion;

  bool get isLocal => privacyLevel == IntelligencePrivacyLevel.local;

  /// Whether this tool can run against what the user has selected.
  bool accepts(IntelligenceRunInput input) {
    if (requiresQuestion && (input.question?.trim().isEmpty ?? true)) {
      return false;
    }
    if (acceptedInputs.contains(IntelligenceInputKind.freeText) &&
        (input.freeText?.trim().isNotEmpty ?? false)) {
      return true;
    }
    return input.parts.isNotEmpty;
  }
}
