/// CREATE — write it, improve it, translate it.
///
/// Everything here produces a *derived* document. The original Source is never
/// modified, every generated message is labelled a draft, and nothing is ever
/// sent anywhere. See `docs/v2/ACTION_INTELLIGENCE_SPEC.md` §10.
library;

import '../../domain/ai_request.dart';
import '../../domain/ai_response.dart';
import '../../domain/intelligence_result.dart';
import '../../domain/intelligence_tool.dart';
import '../fact_preservation.dart';
import 'tool_support.dart';

/// The original text a rewrite must preserve the facts of.
///
/// Only locally readable text counts. A PDF the provider read natively cannot
/// be compared against, so the check reports honestly that it did not run
/// rather than passing silently.
String _originalTextOf(IntelligenceRunInput input) => [
      for (final part in input.parts)
        if (part is AiSourceTextPart) part.text else if (part is AiTextPart)
          part.text,
      ?input.freeText,
    ].join('\n');

/// Adds the fact-preservation warning, where the check could run.
List<IntelligenceWarning> _factWarnings(
  IntelligenceRunInput input,
  String produced,
) {
  final original = _originalTextOf(input).trim();
  if (original.isEmpty) {
    return const [
      IntelligenceWarning.note(
        "Action couldn't compare this against the original text, so the "
        'amounts and dates in it have not been checked.',
      ),
    ];
  }
  final dropped =
      FactPreservation.check(original: original, rewritten: produced);
  if (dropped.isEmpty) return const [];
  return [IntelligenceWarning.caution(FactPreservation.describe(dropped))];
}

// ---------------------------------------------------------------------------
// 9. Rewrite / Improve
// ---------------------------------------------------------------------------

class RewriteStrategy implements IntelligenceToolStrategy {
  const RewriteStrategy();

  static const clearer = 'Clearer';
  static const professional = 'More professional';
  static const shorter = 'Shorter';
  static const persuasive = 'More persuasive';
  static const simpler = 'Simpler';
  static const structured = 'More structured';
  static const grammarOnly = 'Grammar only';

  @override
  String systemInstruction(IntelligenceRunInput input) {
    final mode = input.mode ?? clearer;
    final guidance = switch (mode) {
      professional =>
        'Make it appropriate for formal correspondence. Neutral, courteous, '
            'no slang and no hedging.',
      shorter => 'Cut length without losing meaning. Remove repetition and '
          'filler, not content.',
      persuasive =>
        'Make the case more compelling using only what the writer already says. '
            'Do not add new arguments, claims or promises.',
      simpler => 'Use plain language and shorter sentences. Explain jargon '
          'rather than removing the idea behind it.',
      structured =>
        'Give it a clear structure with headings or short paragraphs so it can '
            'be scanned.',
      grammarOnly =>
        'Correct grammar, spelling and punctuation only. Do not change wording, '
            'tone, structure or length beyond what a correction requires.',
      _ => 'Make it easier to understand on one reading. Remove ambiguity.',
    };

    return '''
You improve text a person has written or captured.

$guidance

$generativeRules

Return the improved text and a short list of what you changed and why. If the text is already fine, say so and return it unchanged.''';
  }

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'rewrite',
        schema: objectSchema({
          'improved_text': stringField,
          'changes': arrayOf(stringField),
          'already_good': boolField,
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final improved = readString(json, 'improved_text');
    if (improved == null) {
      throw const FormatException('no improved_text in response');
    }
    final changes = readStrings(json, 'changes');

    return IntelligenceResult(
      toolId: rewriteTool.id,
      sections: [
        IntelligenceSection(title: input.mode ?? clearer, body: improved),
        if (changes.isNotEmpty)
          IntelligenceSection(
            title: 'What changed',
            kind: IntelligenceSectionKind.bullets,
            bullets: changes,
          ),
        if (readBool(json, 'already_good'))
          const IntelligenceSection(
            title: 'Note',
            body: 'This was already clear. The changes below are minor.',
          ),
      ],
      artifacts: [
        IntelligenceArtifact(
          title: 'Improved text',
          text: improved,
          isDraft: false,
        ),
      ],
      // The original is never touched — this is a new document beside it.
      warnings: _factWarnings(input, improved),
    );
  }
}

const rewriteTool = IntelligenceToolDefinition(
  id: 'rewrite',
  title: 'Improve this writing',
  shortDescription: 'Clearer, shorter or more formal — facts kept intact.',
  category: IntelligenceCategory.create,
  acceptedInputs: {
    IntelligenceInputKind.freeText,
    IntelligenceInputKind.source,
  },
  strategy: RewriteStrategy(),
  modes: [
    RewriteStrategy.clearer,
    RewriteStrategy.professional,
    RewriteStrategy.shorter,
    RewriteStrategy.simpler,
    RewriteStrategy.structured,
    RewriteStrategy.persuasive,
    RewriteStrategy.grammarOnly,
  ],
  maxOutputTokens: 4096,
);

// ---------------------------------------------------------------------------
// 10. Draft a Reply
// ---------------------------------------------------------------------------

/// Produces a reply. Never sends one.
///
/// There is no mail integration and there will not be one here: the gap between
/// "Action wrote this" and "Action sent this on my behalf" is the whole
/// difference between a useful assistant and one you cannot trust with your
/// correspondence.
class DraftReplyStrategy implements IntelligenceToolStrategy {
  const DraftReplyStrategy();

  static const professional = 'Professional';
  static const concise = 'Concise';
  static const friendly = 'Friendly';
  static const formal = 'Formal';
  static const clarification = 'Ask for clarification';
  static const confirmation = 'Confirm';
  static const dispute = 'Dispute this';

  @override
  String systemInstruction(IntelligenceRunInput input) {
    final mode = input.mode ?? professional;
    final guidance = switch (mode) {
      concise => 'Three or four sentences. Say the thing and stop.',
      friendly => 'Warm and direct, without being casual about the substance.',
      formal => 'Formal register throughout, suitable for a legal or official '
          'recipient.',
      clarification =>
        'The purpose is to ask for what is missing or unclear. Ask specific '
            'questions and nothing else.',
      confirmation =>
        'The purpose is to confirm receipt and state what the sender should '
            'expect next.',
      // Only ever reached because the user explicitly picked it.
      dispute =>
        'The purpose is to disagree with what was sent. State the disagreement '
            'and the grounds for it, drawn only from the material. Do not '
            'threaten, do not cite law, and do not assert rights the material '
            'does not establish.',
      _ => 'Neutral, courteous and businesslike.',
    };

    return '''
You draft a reply to a message, letter or notice a person has received.

$guidance

$generativeRules
- Do not agree to anything, commit to a date, or accept a charge on the writer's behalf.
- Where the writer must supply something you do not know, leave a clearly marked placeholder in square brackets.
- Do not sign the message with a name you were not given.

This is a draft for the person to review, edit and send themselves.''';
  }

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'reply_draft',
        schema: objectSchema({
          'subject': nullableString,
          'body': stringField,
          'placeholders': arrayOf(stringField),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final body = readString(json, 'body');
    if (body == null) throw const FormatException('no body in reply');

    final subject = readString(json, 'subject');
    final placeholders = readStrings(json, 'placeholders');

    return IntelligenceResult(
      toolId: draftReplyTool.id,
      sections: [
        if (subject != null)
          IntelligenceSection(title: 'Subject', body: subject),
        IntelligenceSection(title: 'Draft reply', body: body),
        if (placeholders.isNotEmpty)
          IntelligenceSection(
            title: 'You need to fill these in',
            kind: IntelligenceSectionKind.bullets,
            bullets: placeholders,
          ),
      ],
      artifacts: [
        IntelligenceArtifact(
          title: subject == null ? 'Draft reply' : 'Draft — $subject',
          text: subject == null ? body : '$subject\n\n$body',
        ),
      ],
      warnings: const [
        IntelligenceWarning.note(
          'This is a draft. Action does not send anything — read it, edit it, '
          'and send it yourself.',
        ),
      ],
    );
  }
}

const draftReplyTool = IntelligenceToolDefinition(
  id: 'draft-reply',
  title: 'Draft a reply',
  shortDescription: 'A response you can edit and send yourself.',
  category: IntelligenceCategory.create,
  acceptedInputs: {
    IntelligenceInputKind.source,
    IntelligenceInputKind.action,
    IntelligenceInputKind.freeText,
  },
  strategy: DraftReplyStrategy(),
  modes: [
    DraftReplyStrategy.professional,
    DraftReplyStrategy.concise,
    DraftReplyStrategy.friendly,
    DraftReplyStrategy.formal,
    DraftReplyStrategy.clarification,
    DraftReplyStrategy.confirmation,
    DraftReplyStrategy.dispute,
  ],
  maxOutputTokens: 3072,
);

// ---------------------------------------------------------------------------
// 11. Translate with Context
// ---------------------------------------------------------------------------

/// Translation that keeps the parts that must not be translated.
///
/// Reference numbers, account numbers and proper nouns are exactly what a
/// translation model most wants to helpfully localise, and exactly what must
/// survive untouched for the document to remain usable.
class TranslateStrategy implements IntelligenceToolStrategy {
  const TranslateStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) {
    final target = input.targetLanguage ?? 'English';
    return '''
You translate material into $target.

- Keep every amount, date, reference number, account number and code exactly as written. Do not convert currencies or reformat dates.
- Keep names of people and organisations in their original form. If a name has a well-known form in $target, give it and put the original in brackets after it.
- Preserve the layout: headings stay headings, lists stay lists, paragraph breaks stay where they are.
- Where a term has no good equivalent, translate it and put the original in brackets.
- Translate what is written. Do not explain, summarise, or improve it.

This is a translation for understanding. It is not a certified or legal translation, and you must not describe it as one.''';
  }

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'translation',
        schema: objectSchema({
          'detected_source_language': nullableString,
          'translated_text': stringField,
          'untranslatable_terms': arrayOf(stringField),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final translated = readString(json, 'translated_text');
    if (translated == null) {
      throw const FormatException('no translated_text in response');
    }
    final terms = readStrings(json, 'untranslatable_terms');
    final detected = readString(json, 'detected_source_language');

    return IntelligenceResult(
      toolId: translateTool.id,
      sections: [
        IntelligenceSection(
          title: detected == null
              ? 'Translation'
              : 'From $detected to ${input.targetLanguage ?? 'English'}',
          body: translated,
        ),
        if (terms.isNotEmpty)
          IntelligenceSection(
            title: 'Kept in the original',
            kind: IntelligenceSectionKind.bullets,
            bullets: terms,
          ),
      ],
      artifacts: [
        IntelligenceArtifact(
          title: 'Translation',
          text: translated,
          isDraft: false,
        ),
      ],
      warnings: [
        ..._factWarnings(input, translated),
        const IntelligenceWarning.note(
          'A translation for understanding, not a certified translation.',
        ),
      ],
    );
  }
}

const translateTool = IntelligenceToolDefinition(
  id: 'translate',
  title: 'Translate',
  shortDescription: 'Another language, with the numbers and names kept intact.',
  category: IntelligenceCategory.create,
  acceptedInputs: {
    IntelligenceInputKind.source,
    IntelligenceInputKind.freeText,
  },
  strategy: TranslateStrategy(),
  maxOutputTokens: 8192,
);
