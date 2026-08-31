/// EXTRACT — pull out the details that matter.
library;

import '../../domain/ai_request.dart';
import '../../domain/ai_response.dart';
import '../../domain/intelligence_result.dart';
import '../../domain/intelligence_tool.dart';
import '../evidence_verifier.dart';
import 'tool_support.dart';

// ---------------------------------------------------------------------------
// 12. Structured Data Extractor
// ---------------------------------------------------------------------------

/// Turns document content into rows and fields.
///
/// The interesting problem is tables. OCR reads a page as lines, not as a grid,
/// so the association between a value and its column is genuinely uncertain on
/// anything but a clean digital PDF. The tool therefore carries a confidence
/// flag from the model and shows uncertainty rather than inventing tidy rows —
/// a table that looks right and pairs the wrong amount with the wrong invoice
/// is worse than one that admits it is unsure.
class StructuredDataStrategy implements IntelligenceToolStrategy {
  const StructuredDataStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You extract structured data from material a person has selected: table rows, line items, fields, contacts, references, dates and amounts.

About tables specifically: this material may have been read by OCR, which sees lines of text rather than a grid. If you cannot tell reliably which column a value belongs to, set "layout_certain" to false. Do not guess a tidy arrangement.

Choose column names that match what the material actually calls things.
Return values exactly as written — do not reformat dates, round amounts, or expand abbreviations.

$factualRules''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'structured_data',
        schema: objectSchema({
          'columns': arrayOf(stringField),
          'rows': arrayOf(arrayOf(stringField)),
          'layout_certain': boolField,
          'fields': arrayOf(objectSchema({
            'label': stringField,
            'value': stringField,
            'evidence': evidenceField,
          })),
        }),
      );

  @override
  IntelligenceResult parse(AiResponse response, IntelligenceRunInput input) {
    final json = decodeToolJson(response.text);
    final verifier = EvidenceVerifier(input.parts);
    final evidence = <VerifiedEvidence>[];

    final columns = readStrings(json, 'columns');
    final rawRows = json['rows'];
    final rows = <List<String>>[];
    if (rawRows is List) {
      for (final row in rawRows) {
        if (row is! List) continue;
        rows.add(row.map((c) => c?.toString().trim() ?? '').toList());
      }
    }

    final fields = <IntelligenceFact>[];
    for (final raw in readObjects(json, 'fields')) {
      final label = readString(raw, 'label');
      final value = readString(raw, 'value');
      if (label == null || value == null) continue;
      final checked =
          verifyEvidence(verifier, readString(raw, 'evidence'), input);
      evidence.add(checked);
      fields.add(IntelligenceFact(
        label: label,
        value: value,
        citation: checked.citation,
        uncertain: checked.isUncertain,
      ));
    }

    final layoutCertain = json['layout_certain'] != false;

    return IntelligenceResult(
      toolId: structuredDataTool.id,
      sections: [
        if (rows.isNotEmpty)
          IntelligenceSection(
            title: 'Table',
            kind: IntelligenceSectionKind.table,
            columns: columns,
            rows: rows,
          ),
        if (fields.isNotEmpty)
          IntelligenceSection(
            title: 'Fields',
            kind: IntelligenceSectionKind.facts,
            facts: fields,
          ),
      ],
      citations: collectCitations(evidence, response),
      artifacts: [
        if (rows.isNotEmpty)
          IntelligenceArtifact(
            title: 'Table (CSV)',
            text: _csv(columns, rows),
            mimeType: 'text/csv',
            isDraft: false,
          ),
      ],
      warnings: [
        ...evidenceWarnings(evidence, verifier),
        if (rows.isNotEmpty && !layoutCertain)
          const IntelligenceWarning.caution(
            'The column layout of this table could not be read reliably. '
            'Check the rows line up before using them.',
          ),
      ],
    );
  }

  /// RFC-4180 quoting. A value containing a comma is the normal case for an
  /// address or a description, not an edge case.
  static String _csv(List<String> columns, List<List<String>> rows) {
    String cell(String value) {
      final needsQuotes =
          value.contains(',') || value.contains('"') || value.contains('\n');
      if (!needsQuotes) return value;
      return '"${value.replaceAll('"', '""')}"';
    }

    return [
      if (columns.isNotEmpty) columns.map(cell).join(','),
      for (final row in rows) row.map(cell).join(','),
    ].join('\n');
  }
}

const structuredDataTool = IntelligenceToolDefinition(
  id: 'structured-data',
  title: 'Extract a table',
  shortDescription: 'Rows, fields and figures you can copy out.',
  category: IntelligenceCategory.extract,
  acceptedInputs: {IntelligenceInputKind.source},
  strategy: StructuredDataStrategy(),
  maxOutputTokens: 6144,
);

// ---------------------------------------------------------------------------
// 13. Deadline / Obligation Finder
// ---------------------------------------------------------------------------

/// Finds what is due, and when.
///
/// Feeds the existing trust-first review rather than bypassing it. Nothing here
/// creates a reminder: a notification the user did not ask for, derived from a
/// date a model believed it saw, is precisely the kind of automation that makes
/// people stop trusting an app.
class DeadlineFinderStrategy implements IntelligenceToolStrategy {
  const DeadlineFinderStrategy();

  @override
  String systemInstruction(IntelligenceRunInput input) => '''
You find deadlines and obligations in material a person needs to act on.

For each one, record what must be done, by when, on what condition, and what the material says happens if it is not done.

Only report a consequence the material actually states. A likely-sounding outcome it does not mention is a fabrication.
Only report a date the material states. Do not calculate one from "within 14 days" unless the material also gives the date that period runs from — and if you do, say so in the condition.

$factualRules''';

  @override
  AiOutputContract contract(IntelligenceRunInput input) => AiStructuredContract(
        name: 'obligations',
        schema: objectSchema({
          'obligations': arrayOf(objectSchema({
            'what_must_be_done': stringField,
            'due_date': nullableString,
            'due_text': nullableString,
            'condition': nullableString,
            'consequence': nullableString,
            'required_items': arrayOf(stringField),
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
    final facts = <IntelligenceFact>[];
    var index = 0;

    for (final raw in readObjects(json, 'obligations')) {
      final what = readString(raw, 'what_must_be_done');
      if (what == null) continue;

      final checked =
          verifyEvidence(verifier, readString(raw, 'evidence'), input);
      evidence.add(checked);

      final dueAt = readIsoDate(raw, 'due_date');
      final detail = [
        // The document's own wording is kept even when a date was parsed, so
        // "within 14 days of receipt" is not silently replaced by a date the
        // user cannot check.
        ?readString(raw, 'due_text'),
        ?readString(raw, 'condition'),
        if (readString(raw, 'consequence') case final c?) 'If not: $c',
        if (readStrings(raw, 'required_items') case final items
            when items.isNotEmpty)
          'You need: ${items.join(', ')}',
      ].join(' · ');

      suggestions.add(IntelligenceSuggestion(
        id: 'obligation-${index++}',
        kind: dueAt != null
            ? IntelligenceSuggestionKind.deadline
            : IntelligenceSuggestionKind.step,
        title: what,
        detail: detail.isEmpty ? null : detail,
        dueAt: dueAt,
        citation: checked.citation,
      ));

      if (dueAt != null || readString(raw, 'due_text') != null) {
        facts.add(IntelligenceFact(
          label: what,
          value: readString(raw, 'due_text') ??
              '${dueAt!.year}-${dueAt.month.toString().padLeft(2, '0')}-'
                  '${dueAt.day.toString().padLeft(2, '0')}',
          citation: checked.citation,
          uncertain: checked.isUncertain,
        ));
      }
    }

    return IntelligenceResult(
      toolId: deadlineFinderTool.id,
      sections: [
        if (facts.isNotEmpty)
          IntelligenceSection(
            title: facts.length == 1 ? '1 deadline' : '${facts.length} deadlines',
            kind: IntelligenceSectionKind.facts,
            facts: facts,
          ),
        if (suggestions.isEmpty)
          const IntelligenceSection(
            title: 'Nothing due',
            body: 'Action found no deadlines or obligations in this material.',
          ),
      ],
      suggestions: suggestions,
      citations: collectCitations(evidence, response),
      warnings: [
        ...evidenceWarnings(evidence, verifier),
        if (suggestions.isNotEmpty)
          const IntelligenceWarning.note(
            'Nothing is scheduled until you choose it. Reminders are never set '
            'automatically.',
          ),
      ],
    );
  }
}

const deadlineFinderTool = IntelligenceToolDefinition(
  id: 'deadline-finder',
  title: 'Find deadlines',
  shortDescription: 'What is due, when, and what happens if it is not.',
  category: IntelligenceCategory.extract,
  acceptedInputs: {IntelligenceInputKind.source, IntelligenceInputKind.action},
  strategy: DeadlineFinderStrategy(),
  allowsSaveToAction: true,
  maxOutputTokens: 4096,
);
