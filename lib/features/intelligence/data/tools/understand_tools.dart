/// UNDERSTAND — make sense of what you have.
library;

import '../../domain/ai_request.dart';
import '../../domain/ai_response.dart';
import '../../domain/intelligence_result.dart';
import '../../domain/intelligence_tool.dart';
import '../evidence_verifier.dart';
import 'tool_support.dart';

// ---------------------------------------------------------------------------
// 1. Document Intelligence
// ---------------------------------------------------------------------------

/// Turns a document into a structured brief.
///
/// The most important field is the last one: a suggested Action title. It is a
/// *suggestion*, off by default, and it is the bridge from "I understand this"
/// to "I have done something about it" without any of it becoming truth on its
/// own.
class DocumentIntelligenceStrategy implements IntelligenceToolStrategy {
  const DocumentIntelligenceStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You read a document a person has captured and explain what it is and what it means for them.

$factualRules

Be concise. A brief is not a transcript: leave out anything that does not change what the reader knows or needs to do.
Only suggest an action if the material actually asks the reader to do something.''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'document_brief',
        schema: objectSchema({
          'what_this_is': stringField,
          'what_matters': stringField,
          'key_facts': arrayOf(objectSchema({
            'label': stringField,
            'value': stringField,
            'evidence': evidenceField,
          })),
          'obligations': arrayOf(objectSchema({
            'text': stringField,
            'due_date': nullableString,
            'evidence': evidenceField,
          })),
          'recommended_next_step': nullableString,
          'open_questions': arrayOf(stringField),
          'suggested_action_title': nullableString,
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final verifier = EvidenceVerifier(input.parts);
    final evidence = <VerifiedEvidence>[];

    final facts = <IntelligenceFact>[];
    for (final raw in readObjects(json, 'key_facts')) {
      final label = readString(raw, 'label');
      final value = readString(raw, 'value');
      if (label == null || value == null) continue;
      final checked =
          verifyEvidence(verifier, readString(raw, 'evidence'), input);
      evidence.add(checked);
      facts.add(IntelligenceFact(
        label: label,
        value: value,
        citation: checked.citation,
        uncertain: checked.isUncertain,
      ));
    }

    final suggestions = <IntelligenceSuggestion>[];
    var index = 0;
    for (final raw in readObjects(json, 'obligations')) {
      final text = readString(raw, 'text');
      if (text == null) continue;
      final checked =
          verifyEvidence(verifier, readString(raw, 'evidence'), input);
      evidence.add(checked);
      suggestions.add(IntelligenceSuggestion(
        id: 'obligation-${index++}',
        // A deadline only where the document actually stated one. A
        // plausible-sounding date it does not mention is a fabrication.
        kind: readIsoDate(raw, 'due_date') != null
            ? IntelligenceSuggestionKind.deadline
            : IntelligenceSuggestionKind.step,
        title: text,
        dueAt: readIsoDate(raw, 'due_date'),
        citation: checked.citation,
      ));
    }

    final actionTitle = readString(json, 'suggested_action_title');
    if (actionTitle != null) {
      suggestions.add(IntelligenceSuggestion(
        id: 'action-0',
        kind: IntelligenceSuggestionKind.action,
        title: actionTitle,
        detail: readString(json, 'recommended_next_step'),
      ));
    }

    for (final question in readStrings(json, 'open_questions')) {
      suggestions.add(IntelligenceSuggestion(
        id: 'question-${index++}',
        kind: IntelligenceSuggestionKind.question,
        title: question,
      ));
    }

    return IntelligenceResult(
      toolId: documentIntelligenceTool.id,
      sections: [
        IntelligenceSection(
          title: 'What this is',
          body: readString(json, 'what_this_is'),
        ),
        IntelligenceSection(
          title: 'What matters',
          body: readString(json, 'what_matters'),
        ),
        if (facts.isNotEmpty)
          IntelligenceSection(
            title: 'Key details',
            kind: IntelligenceSectionKind.facts,
            facts: facts,
          ),
        if (readString(json, 'recommended_next_step') != null)
          IntelligenceSection(
            title: 'Recommended next step',
            body: readString(json, 'recommended_next_step'),
          ),
      ].where((s) => !s.isEmpty).toList(),
      citations: collectCitations(evidence, response),
      suggestions: suggestions,
      warnings: evidenceWarnings(evidence, verifier),
    );
  }
}

const documentIntelligenceTool = IntelligenceToolDefinition(
  id: 'document-intelligence',
  glyph: ToolGlyph.document,
  title: 'Understand this document',
  shortDescription: 'What it is, what matters, and what to do about it.',
  category: IntelligenceCategory.understand,
  acceptedInputs: {IntelligenceInputKind.source},
  strategy: DocumentIntelligenceStrategy(),
  allowsSaveToAction: true,
  maxOutputTokens: 4096,
);

// ---------------------------------------------------------------------------
// 2. Ask This Document
// ---------------------------------------------------------------------------

/// Grounded question answering.
///
/// The whole tool turns on one field: `answered`. A model that cannot find the
/// answer must say so, and the parser renders that as a plain "I couldn't find
/// that" rather than as an answer with a hedge in front of it. Answering from
/// general knowledge is the specific failure this exists to prevent — it is
/// exactly what makes document Q&A untrustworthy elsewhere.
class AskDocumentStrategy implements IntelligenceToolStrategy {
  const AskDocumentStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You answer questions about material a person has selected, using only that material.

$groundingRule

$factualRules

Set "answered" to false when the material does not contain the answer. That is a correct and useful outcome, not a failure.
Never guess. Never fill a gap with what is usually true.''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'grounded_answer',
        schema: objectSchema({
          'answered': boolField,
          'answer': nullableString,
          'evidence': evidenceField,
          'why_not_answered': nullableString,
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final verifier = EvidenceVerifier(input.parts);

    final answered = readBool(json, 'answered');
    final answer = readString(json, 'answer');

    if (!answered || answer == null) {
      return IntelligenceResult(
        toolId: askDocumentTool.id,
        sections: [
          IntelligenceSection(
            title: 'No answer in this material',
            body: readString(json, 'why_not_answered') ??
                "Action couldn't find that in the selected document.",
          ),
        ],
      );
    }

    final checked =
        verifyEvidence(verifier, readString(json, 'evidence'), input);

    return IntelligenceResult(
      toolId: askDocumentTool.id,
      sections: [
        IntelligenceSection(title: 'Answer', body: answer),
        if (checked.citation != null)
          IntelligenceSection(
            title: 'From the document',
            kind: IntelligenceSectionKind.quote,
            body: checked.citation!.quotedText,
          ),
      ],
      citations: collectCitations([checked], response),
      warnings: [
        ...evidenceWarnings([checked], verifier),
        if (checked.status == EvidenceStatus.notFound)
          const IntelligenceWarning.caution(
            'The quote behind this answer is not in the selected material. '
            'Treat the answer as unreliable.',
          ),
      ],
    );
  }
}

const askDocumentTool = IntelligenceToolDefinition(
  id: 'ask-document',
  glyph: ToolGlyph.question,
  title: 'Ask about a source',
  shortDescription: 'Answers grounded in what you selected — or nothing.',
  category: IntelligenceCategory.understand,
  acceptedInputs: {
    IntelligenceInputKind.source,
    IntelligenceInputKind.multipleSources,
    IntelligenceInputKind.question,
  },
  strategy: AskDocumentStrategy(),
  requiresQuestion: true,
  maxOutputTokens: 2048,
);

// ---------------------------------------------------------------------------
// 3. Smart Summary
// ---------------------------------------------------------------------------

/// Summarising, in modes that mean something.
///
/// The modes are kinds of reading, not word counts. "Give me 100 words" is a
/// gimmick; "tell me the part that affects what I have to do" is a different
/// summary of the same document.
class SmartSummaryStrategy implements IntelligenceToolStrategy {
  const SmartSummaryStrategy();

  static const quick = 'Quick';
  static const detailed = 'Detailed';
  static const executive = 'Executive';
  static const keyPoints = 'Key points';
  static const actionFocused = 'Action-focused';

  @override
  String systemInstruction(IntelligenceRunInput input) {
    final mode = input.mode ?? quick;
    final guidance = switch (mode) {
      detailed =>
        'Cover the material thoroughly, section by section, keeping its structure.',
      executive =>
        'Write for someone deciding what to do, not someone studying the detail. '
            'Lead with the decision and its consequences.',
      keyPoints => 'Return points only. No connecting prose.',
      actionFocused =>
        'Prioritise only what changes what the reader has to do: obligations, '
            'deadlines, amounts, conditions and consequences. Leave out background.',
      _ => 'Two or three sentences that capture the point.',
    };

    return '''
You summarise material a person has selected.

$guidance

$factualRules''';
  }

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'summary',
        schema: objectSchema({
          'summary': stringField,
          'key_points': arrayOf(stringField),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final points = readStrings(json, 'key_points');

    return IntelligenceResult(
      toolId: smartSummaryTool.id,
      sections: [
        IntelligenceSection(
          title: input.mode ?? quick,
          body: readString(json, 'summary'),
        ),
        if (points.isNotEmpty)
          IntelligenceSection(
            title: 'Key points',
            kind: IntelligenceSectionKind.bullets,
            bullets: points,
          ),
      ].where((s) => !s.isEmpty).toList(),
      citations: collectCitations(const [], response),
      artifacts: [
        IntelligenceArtifact(
          title: 'Summary',
          text: [
            readString(json, 'summary') ?? '',
            if (points.isNotEmpty) '',
            ...points.map((p) => '• $p'),
          ].join('\n'),
          isDraft: false,
        ),
      ],
    );
  }
}

const smartSummaryTool = IntelligenceToolDefinition(
  id: 'smart-summary',
  glyph: ToolGlyph.summary,
  title: 'Summarise',
  shortDescription: 'The short version — or the version that affects you.',
  category: IntelligenceCategory.understand,
  acceptedInputs: {
    IntelligenceInputKind.source,
    IntelligenceInputKind.freeText,
  },
  strategy: SmartSummaryStrategy(),
  modes: [
    SmartSummaryStrategy.quick,
    SmartSummaryStrategy.detailed,
    SmartSummaryStrategy.executive,
    SmartSummaryStrategy.keyPoints,
    SmartSummaryStrategy.actionFocused,
  ],
  maxOutputTokens: 3072,
);

// ---------------------------------------------------------------------------
// 4. Compare Documents
// ---------------------------------------------------------------------------

/// Differences between two or more selected sources.
///
/// Explains; does not rule. Comparing two tenancy agreements and announcing
/// which is legally better would be advice Action is not entitled to give, and
/// the instruction says so explicitly rather than hoping the model refrains.
class CompareDocumentsStrategy implements IntelligenceToolStrategy {
  const CompareDocumentsStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You compare two or more pieces of material a person has selected. Each is fenced and labelled with its own id.

Report what is the same, what differs, and what appears in one but not another. Pay particular attention to differing dates, amounts, obligations and conditions.

Explain differences. Do not judge which is better and do not give legal advice or a legal conclusion. If the reader would need professional advice to act on a difference, say that instead of supplying it.

$factualRules''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'comparison',
        schema: objectSchema({
          'in_common': arrayOf(stringField),
          'differences': arrayOf(objectSchema({
            'aspect': stringField,
            'description': stringField,
            'evidence': evidenceField,
          })),
          'conflicts': arrayOf(objectSchema({
            'description': stringField,
            'evidence': evidenceField,
          })),
          'only_in_one': arrayOf(stringField),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final verifier = EvidenceVerifier(input.parts);
    final evidence = <VerifiedEvidence>[];

    final differences = <IntelligenceFact>[];
    for (final raw in readObjects(json, 'differences')) {
      final aspect = readString(raw, 'aspect');
      final description = readString(raw, 'description');
      if (aspect == null || description == null) continue;
      final checked =
          verifyEvidence(verifier, readString(raw, 'evidence'), input);
      evidence.add(checked);
      differences.add(IntelligenceFact(
        label: aspect,
        value: description,
        citation: checked.citation,
        uncertain: checked.isUncertain,
      ));
    }

    final conflicts = <String>[];
    for (final raw in readObjects(json, 'conflicts')) {
      final description = readString(raw, 'description');
      if (description == null) continue;
      evidence.add(
        verifyEvidence(verifier, readString(raw, 'evidence'), input),
      );
      conflicts.add(description);
    }

    final common = readStrings(json, 'in_common');
    final onlyInOne = readStrings(json, 'only_in_one');

    return IntelligenceResult(
      toolId: compareDocumentsTool.id,
      sections: [
        if (differences.isNotEmpty)
          IntelligenceSection(
            title: 'What differs',
            kind: IntelligenceSectionKind.facts,
            facts: differences,
          ),
        if (conflicts.isNotEmpty)
          IntelligenceSection(
            title: 'Conflicts',
            kind: IntelligenceSectionKind.bullets,
            bullets: conflicts,
          ),
        if (onlyInOne.isNotEmpty)
          IntelligenceSection(
            title: 'Only in one of them',
            kind: IntelligenceSectionKind.bullets,
            bullets: onlyInOne,
          ),
        if (common.isNotEmpty)
          IntelligenceSection(
            title: 'In common',
            kind: IntelligenceSectionKind.bullets,
            bullets: common,
          ),
      ],
      citations: collectCitations(evidence, response),
      warnings: evidenceWarnings(evidence, verifier),
    );
  }
}

const compareDocumentsTool = IntelligenceToolDefinition(
  id: 'compare-documents',
  glyph: ToolGlyph.compare,
  title: 'Compare documents',
  shortDescription: 'What changed, what conflicts, what is missing.',
  category: IntelligenceCategory.understand,
  acceptedInputs: {IntelligenceInputKind.multipleSources},
  strategy: CompareDocumentsStrategy(),
  maxOutputTokens: 4096,
);
