/// PLAN — turn material into something you can actually do.
///
/// Everything in this category returns *suggestions*. Nothing it produces is
/// persisted, nothing pre-selects itself, and nothing rewrites a goal the user
/// wrote. The user picks what to keep. See
/// `docs/v2/ACTION_INTELLIGENCE_SPEC.md` §3.2.
library;

import '../../domain/ai_request.dart';
import '../../domain/ai_response.dart';
import '../../domain/intelligence_result.dart';
import '../../domain/intelligence_tool.dart';
import '../evidence_verifier.dart';
import 'tool_support.dart';

/// The rule that keeps planning tools from inventing time pressure.
const String _noInventedDates = '''
Never invent a date. Only give a deadline if the material states one. If the user has not given a time constraint, describe order and dependency instead of dates.''';

// ---------------------------------------------------------------------------
// 5. Goal Optimizer
// ---------------------------------------------------------------------------

/// Examines a goal and says what is in the way.
///
/// Deliberately returns counted findings — blockers, gaps, steps — and never a
/// score. "Goal score 82/100" sounds precise and means nothing; there is no
/// transparent, checkable definition behind it, so the product does not print
/// one. See `docs/v2/ACTION_INTELLIGENCE_SPEC.md` §11.
class GoalOptimizerStrategy implements IntelligenceToolStrategy {
  const GoalOptimizerStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You examine a goal or project the person is trying to achieve, along with any supporting material, and work out what stands between them and finishing it.

Answer these, in order: what is the objective; what information already exists; what is missing; what is unnecessary; what could be simpler; what should happen first; what is most likely to block completion.

Be specific and short. A blocker the reader cannot act on is not a blocker, it is an observation.
Do not produce a score, a rating, a percentage or a probability of success.
$_noInventedDates

Everything you return is a suggestion for the person to accept or reject. Do not rewrite their goal.''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'goal_review',
        schema: objectSchema({
          'objective': stringField,
          'current_state': stringField,
          'blockers': arrayOf(objectSchema({
            'description': stringField,
            'why': nullableString,
          })),
          'missing_information': arrayOf(stringField),
          'simplifications': arrayOf(stringField),
          'next_steps': arrayOf(objectSchema({
            'title': stringField,
            'detail': nullableString,
          })),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);

    final blockers = [
      for (final raw in readObjects(json, 'blockers'))
        if (readString(raw, 'description') case final description?)
          IntelligenceFact(
            label: description,
            value: readString(raw, 'why') ?? '',
          ),
    ];

    final suggestions = <IntelligenceSuggestion>[];
    var index = 0;
    for (final raw in readObjects(json, 'next_steps')) {
      final title = readString(raw, 'title');
      if (title == null) continue;
      suggestions.add(IntelligenceSuggestion(
        id: 'step-${index++}',
        kind: IntelligenceSuggestionKind.step,
        title: title,
        detail: readString(raw, 'detail'),
      ));
    }
    for (final question in readStrings(json, 'missing_information')) {
      suggestions.add(IntelligenceSuggestion(
        id: 'gap-${index++}',
        kind: IntelligenceSuggestionKind.question,
        title: question,
      ));
    }

    final simplifications = readStrings(json, 'simplifications');

    return IntelligenceResult(
      toolId: goalOptimizerTool.id,
      sections: [
        IntelligenceSection(
          title: 'What you want',
          body: readString(json, 'objective'),
        ),
        IntelligenceSection(
          title: 'Where it stands',
          body: readString(json, 'current_state'),
        ),
        if (blockers.isNotEmpty)
          IntelligenceSection(
            title: blockers.length == 1 ? '1 blocker' : '${blockers.length} blockers',
            kind: IntelligenceSectionKind.facts,
            facts: blockers,
          ),
        if (simplifications.isNotEmpty)
          IntelligenceSection(
            title: 'Could be simpler',
            kind: IntelligenceSectionKind.bullets,
            bullets: simplifications,
          ),
      ].where((s) => !s.isEmpty).toList(),
      suggestions: suggestions,
    );
  }
}

const goalOptimizerTool = IntelligenceToolDefinition(
  id: 'goal-optimizer',
  glyph: ToolGlyph.goal,
  title: 'Improve a goal',
  shortDescription: 'What is missing, what blocks it, what to do first.',
  category: IntelligenceCategory.plan,
  acceptedInputs: {
    IntelligenceInputKind.goal,
    IntelligenceInputKind.freeText,
    IntelligenceInputKind.source,
  },
  strategy: GoalOptimizerStrategy(),
  allowsSaveToAction: true,
  maxOutputTokens: 4096,
);

// ---------------------------------------------------------------------------
// 6. Action Plan Generator
// ---------------------------------------------------------------------------

class ActionPlanStrategy implements IntelligenceToolStrategy {
  const ActionPlanStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You turn a goal, a document or an existing action into an ordered plan.

Give phases only where they genuinely help. A five-step task does not need three phases.
State what each step produces, and what it depends on.
$_noInventedDates''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'action_plan',
        schema: objectSchema({
          'summary': stringField,
          'steps': arrayOf(objectSchema({
            'title': stringField,
            'outcome': nullableString,
            'depends_on': nullableString,
            'phase': nullableString,
          })),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);

    final suggestions = <IntelligenceSuggestion>[];
    var index = 0;
    for (final raw in readObjects(json, 'steps')) {
      final title = readString(raw, 'title');
      if (title == null) continue;
      final detail = [
        ?readString(raw, 'outcome'),
        if (readString(raw, 'depends_on') case final dep?) 'After: $dep',
      ].join(' · ');
      suggestions.add(IntelligenceSuggestion(
        id: 'step-${index++}',
        kind: IntelligenceSuggestionKind.step,
        title: title,
        detail: detail.isEmpty ? null : detail,
      ));
    }

    return IntelligenceResult(
      toolId: actionPlanTool.id,
      sections: [
        IntelligenceSection(
          title: 'The plan',
          body: readString(json, 'summary'),
        ),
      ].where((s) => !s.isEmpty).toList(),
      suggestions: suggestions,
    );
  }
}

const actionPlanTool = IntelligenceToolDefinition(
  id: 'action-plan',
  glyph: ToolGlyph.plan,
  title: 'Build a plan',
  shortDescription: 'An ordered set of steps you can turn into Actions.',
  category: IntelligenceCategory.plan,
  acceptedInputs: {
    IntelligenceInputKind.goal,
    IntelligenceInputKind.source,
    IntelligenceInputKind.action,
    IntelligenceInputKind.freeText,
  },
  strategy: ActionPlanStrategy(),
  allowsSaveToAction: true,
  maxOutputTokens: 4096,
);

// ---------------------------------------------------------------------------
// 7. Smart Checklist
// ---------------------------------------------------------------------------

class SmartChecklistStrategy implements IntelligenceToolStrategy {
  const SmartChecklistStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You turn what a document requires into a checklist the reader can work through.

Each item must be something the reader physically does, in the order they would do it. Include checking and confirming steps where the material implies them — attaching proof, keeping a receipt, saving a confirmation.

Only include items the material supports.
$factualRules''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'checklist',
        schema: objectSchema({
          'items': arrayOf(objectSchema({
            'title': stringField,
            'evidence': evidenceField,
          })),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final verifier = EvidenceVerifier(input.parts);
    final evidence = <VerifiedEvidence>[];

    final suggestions = <IntelligenceSuggestion>[];
    var index = 0;
    for (final raw in readObjects(json, 'items')) {
      final title = readString(raw, 'title');
      if (title == null) continue;
      final checked =
          verifyEvidence(verifier, readString(raw, 'evidence'), input);
      evidence.add(checked);
      suggestions.add(IntelligenceSuggestion(
        id: 'item-${index++}',
        kind: IntelligenceSuggestionKind.step,
        title: title,
        citation: checked.citation,
      ));
    }

    return IntelligenceResult(
      toolId: smartChecklistTool.id,
      sections: const [],
      suggestions: suggestions,
      citations: collectCitations(evidence, response),
      warnings: evidenceWarnings(evidence, verifier),
    );
  }
}

const smartChecklistTool = IntelligenceToolDefinition(
  id: 'smart-checklist',
  glyph: ToolGlyph.checklist,
  title: 'Make a checklist',
  shortDescription: 'Everything this asks of you, in order.',
  category: IntelligenceCategory.plan,
  acceptedInputs: {IntelligenceInputKind.source, IntelligenceInputKind.action},
  strategy: SmartChecklistStrategy(),
  allowsSaveToAction: true,
  maxOutputTokens: 3072,
);

// ---------------------------------------------------------------------------
// 8. Missing Information
// ---------------------------------------------------------------------------

/// Finds the gaps, and the questions that would close them.
///
/// The useful half is the questions. Knowing a payment reference is missing is
/// mildly useful; knowing exactly what to ask the sender is what gets the user
/// unstuck. It does not answer its own questions.
class MissingInformationStrategy implements IntelligenceToolStrategy {
  const MissingInformationStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You find what is missing or unclear in material a person needs to act on.

Look for: information required to act that is absent; details that are stated ambiguously; and facts that contradict each other within the material.

Then write the questions the reader should ask to resolve each gap. Address the questions to whoever sent the material.

Do not answer the questions. Do not guess what the missing value probably is.
$factualRules''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'gaps',
        schema: objectSchema({
          'gaps': arrayOf(objectSchema({
            'what_is_missing': stringField,
            'why_it_matters': nullableString,
          })),
          'contradictions': arrayOf(objectSchema({
            'description': stringField,
            'evidence': evidenceField,
          })),
          'questions_to_ask': arrayOf(stringField),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final verifier = EvidenceVerifier(input.parts);
    final evidence = <VerifiedEvidence>[];

    final gaps = [
      for (final raw in readObjects(json, 'gaps'))
        if (readString(raw, 'what_is_missing') case final what?)
          IntelligenceFact(
            label: what,
            value: readString(raw, 'why_it_matters') ?? '',
          ),
    ];

    final contradictions = <String>[];
    for (final raw in readObjects(json, 'contradictions')) {
      final description = readString(raw, 'description');
      if (description == null) continue;
      evidence.add(
        verifyEvidence(verifier, readString(raw, 'evidence'), input),
      );
      contradictions.add(description);
    }

    final questions = readStrings(json, 'questions_to_ask');

    return IntelligenceResult(
      toolId: missingInformationTool.id,
      sections: [
        if (gaps.isNotEmpty)
          IntelligenceSection(
            title: gaps.length == 1
                ? '1 missing detail'
                : '${gaps.length} missing details',
            kind: IntelligenceSectionKind.facts,
            facts: gaps,
          ),
        if (contradictions.isNotEmpty)
          IntelligenceSection(
            title: 'These disagree with each other',
            kind: IntelligenceSectionKind.bullets,
            bullets: contradictions,
          ),
      ],
      suggestions: [
        for (var i = 0; i < questions.length; i++)
          IntelligenceSuggestion(
            id: 'ask-$i',
            kind: IntelligenceSuggestionKind.question,
            title: questions[i],
          ),
      ],
      citations: collectCitations(evidence, response),
      warnings: evidenceWarnings(evidence, verifier),
    );
  }
}

const missingInformationTool = IntelligenceToolDefinition(
  id: 'missing-information',
  glyph: ToolGlyph.gap,
  title: 'What is missing',
  shortDescription: 'The gaps, and what to ask about them.',
  category: IntelligenceCategory.plan,
  acceptedInputs: {IntelligenceInputKind.source, IntelligenceInputKind.action},
  strategy: MissingInformationStrategy(),
  maxOutputTokens: 3072,
);
