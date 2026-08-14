import 'dart:convert';

import '../domain/action_draft.dart';
import '../domain/escalation.dart';
import '../domain/extracted_field.dart';
import '../domain/extraction_evidence.dart';
import '../domain/extraction_input.dart';
import '../domain/extraction_result.dart';
import '../domain/extraction_schema.dart';
import '../domain/money_value.dart';
import 'escalation_evaluator.dart';
import 'evidence_resolver.dart';
import 'provider_contract.dart';

/// Turns whatever a provider returned into a domain object, or refuses to.
///
/// The governing assumption is that **model output is untrusted input**, in the
/// same sense as a network payload from a stranger. It is not merely possibly
/// wrong; it is possibly wrong in ways that look right. A fabricated deadline
/// is well-formed JSON. A consequence the document never stated is a grammatical
/// English sentence. Shape validation alone would pass both.
///
/// So this class checks three separate things, and a value has to survive all
/// of them before it can be shown as a fact:
///
///  1. **Shape** — required keys, known enum members, parseable dates and
///     amounts, sane sizes.
///  2. **Grounding** — the quote offered as evidence actually exists in the
///     user's document, located by [EvidenceResolver] rather than trusted.
///  3. **Support** — the value actually appears in the quote offered for it.
///     This is the one that catches a real quote paired with a wrong number.
///
/// Anything that fails is downgraded to [FieldReviewState.needsReview] or
/// dropped, never silently accepted. The result always exists: a total failure
/// produces a manual-entry result rather than an exception, so the user is
/// never left with a screen that has nothing to offer.
class ExtractionValidator {
  const ExtractionValidator({
    this.escalationEvaluator = const EscalationEvaluator(),
  });

  final EscalationEvaluator escalationEvaluator;

  ExtractionResult validate({
    required Object? payload,
    required ExtractionInput input,
    required String engine,
    required DateTime producedAt,
    int durationMs = 0,
  }) {
    final issues = <ExtractionIssue>[];
    var escalation = escalationEvaluator.evaluate(input);

    // Recorded on every result, whether or not extraction succeeds: if a
    // document tried to issue instructions, that fact should be visible in the
    // record even when nothing usable came back.
    if (escalation.has(ExtractionEscalationSignal.instructionLikeContent)) {
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.injectionAttemptInDocument,
          severity: ExtractionIssueSeverity.noted,
        ),
      );
    }

    ExtractionResult manual() => ExtractionResult.manualEntryRequired(
          sourceId: input.sourceId,
          engine: engine,
          producedAt: producedAt,
          issues: issues,
          escalation: escalation,
          durationMs: durationMs,
        );

    final map = _decode(payload, issues);
    if (map == null) return manual();

    final version = (map[ExtractionWireKeys.schemaVersion] as num?)?.toInt();
    if (version == null) {
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.missingRequiredKey,
          severity: ExtractionIssueSeverity.rejected,
          path: ExtractionWireKeys.schemaVersion,
        ),
      );
      return manual();
    }
    if (version != extractionSchemaVersion) {
      issues.add(
        ExtractionIssue(
          code: ExtractionIssueCode.unsupportedSchemaVersion,
          severity: ExtractionIssueSeverity.rejected,
          detail: 'got $version, this build speaks $extractionSchemaVersion',
        ),
      );
      return manual();
    }

    // A document that asks nothing of the reader is a real, complete answer —
    // not a failure to find anything. It is deliberately allowed to skip every
    // other key.
    if (map[ExtractionWireKeys.noActionRequired] == true) {
      return ExtractionResult(
        sourceId: input.sourceId,
        reviewState: ExtractionReviewState.readyForConfirmation,
        engine: engine,
        producedAt: producedAt,
        durationMs: durationMs,
        noActionRequired: true,
        issues: issues,
        escalation: escalation,
      );
    }

    final title = _trimmed(map[ExtractionWireKeys.title]);
    if (title == null) {
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.emptyTitle,
          severity: ExtractionIssueSeverity.rejected,
          path: ExtractionWireKeys.title,
        ),
      );
      return manual();
    }

    final resolver = EvidenceResolver(input);

    // Everything from the first instruction-like sentence onward is treated as
    // payload rather than content. Grounding alone cannot defend against
    // injection — text the attacker wrote *is* in the document, so a quote from
    // it resolves perfectly well — and this is what closes that gap.
    final taintedFrom =
        EscalationEvaluator.firstInstructionLikeIndex(input.normalizedText);

    final summary = _trimmed(map[ExtractionWireKeys.summary]);
    if (summary == null) {
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.missingRequiredKey,
          severity: ExtractionIssueSeverity.downgraded,
          path: ExtractionWireKeys.summary,
        ),
      );
    }

    final category = _enumOrNote<ActionCategory>(
      raw: map[ExtractionWireKeys.category],
      parse: ActionCategory.fromName,
      fallback: ActionCategory.unknown,
      path: ExtractionWireKeys.category,
      issues: issues,
    );

    var urgency = _enumOrNote<ActionUrgency>(
      raw: map[ExtractionWireKeys.urgency],
      parse: ActionUrgency.fromName,
      fallback: ActionUrgency.unknown,
      path: ExtractionWireKeys.urgency,
      issues: issues,
    );
    final urgencyReason = _trimmed(map[ExtractionWireKeys.urgencyReason]);
    if (urgency != ActionUrgency.unknown && urgencyReason == null) {
      // An urgency the app cannot explain is one it should not show. Dropping
      // to unknown is honest; keeping "Critical" with no reason is a claim.
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.urgencyWithoutReason,
          severity: ExtractionIssueSeverity.downgraded,
          path: ExtractionWireKeys.urgency,
        ),
      );
      urgency = ActionUrgency.unknown;
    }

    final fields = _validateFields(
      raw: map[ExtractionWireKeys.fields],
      resolver: resolver,
      issues: issues,
      taintedFrom: taintedFrom,
    );

    final steps = _validateSteps(
      raw: map[ExtractionWireKeys.steps],
      resolver: resolver,
      issues: issues,
      taintedFrom: taintedFrom,
    );

    final consequence = _validateConsequence(
      raw: map[ExtractionWireKeys.consequence],
      resolver: resolver,
      issues: issues,
      taintedFrom: taintedFrom,
    );

    final needsReview = fields.any(
          (f) => f.reviewState == FieldReviewState.needsReview,
        ) ||
        steps.any((s) => s.reviewState == FieldReviewState.needsReview);

    if (issues.any((i) => i.code == ExtractionIssueCode.evidenceUnresolved)) {
      escalation = escalation.merge(
        const EscalationAssessment([
          ExtractionEscalationSignal.unresolvedGrounding,
        ]),
      );
    }

    final draft = ActionDraft(
      sourceId: input.sourceId,
      title: _capped(title, ExtractionLimits.maxTitleLength, ExtractionWireKeys.title, issues),
      summary: summary == null
          ? ''
          : _capped(summary, ExtractionLimits.maxSummaryLength, ExtractionWireKeys.summary, issues),
      category: category,
      urgency: urgency,
      urgencyReason: urgencyReason,
      whyThisMatters: _cappedOrNull(
        _trimmed(map[ExtractionWireKeys.whyThisMatters]),
        ExtractionWireKeys.whyThisMatters,
        issues,
      ),
      recommendedNextStep: _cappedOrNull(
        _trimmed(map[ExtractionWireKeys.recommendedNextStep]),
        ExtractionWireKeys.recommendedNextStep,
        issues,
      ),
      consequence: consequence?.text,
      consequenceEvidence: consequence?.evidence,
      fields: fields,
      steps: steps,
      reviewState: needsReview
          ? ExtractionReviewState.needsReview
          : ExtractionReviewState.readyForConfirmation,
    );

    return ExtractionResult(
      sourceId: input.sourceId,
      reviewState: draft.reviewState,
      engine: engine,
      producedAt: producedAt,
      durationMs: durationMs,
      draft: draft,
      issues: issues,
      escalation: escalation,
    );
  }

  // ---------------------------------------------------------------- decoding

  Map<String, dynamic>? _decode(Object? payload, List<ExtractionIssue> issues) {
    if (payload is Map<String, dynamic>) return payload;

    if (payload is String) {
      try {
        final decoded = jsonDecode(payload);
        if (decoded is Map<String, dynamic>) return decoded;
      } on FormatException catch (error) {
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.malformedJson,
            severity: ExtractionIssueSeverity.rejected,
            // The message, not the payload: the payload is document-derived and
            // could end up in a crash report.
            detail: error.message,
          ),
        );
        return null;
      }
    }

    issues.add(
      const ExtractionIssue(
        code: ExtractionIssueCode.malformedJson,
        severity: ExtractionIssueSeverity.rejected,
        detail: 'the response was not a JSON object',
      ),
    );
    return null;
  }

  // ------------------------------------------------------------------ fields

  List<ExtractedField> _validateFields({
    required Object? raw,
    required EvidenceResolver resolver,
    required List<ExtractionIssue> issues,
    required int? taintedFrom,
  }) {
    if (raw is! List) return const [];

    final entries = raw.whereType<Map<String, dynamic>>().toList();
    if (entries.length > ExtractionLimits.maxFields) {
      issues.add(
        ExtractionIssue(
          code: ExtractionIssueCode.excessiveOutput,
          severity: ExtractionIssueSeverity.dropped,
          detail: '${entries.length} fields, keeping ${ExtractionLimits.maxFields}',
          path: ExtractionWireKeys.fields,
        ),
      );
    }

    final fields = <ExtractedField>[];
    final seenKeys = <String>{};

    for (final entry in entries.take(ExtractionLimits.maxFields)) {
      final index = fields.length;
      final path = '${ExtractionWireKeys.fields}[$index]';

      final key = _trimmed(entry[ExtractionWireKeys.key]);
      if (key == null) {
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.missingRequiredKey,
            severity: ExtractionIssueSeverity.dropped,
            path: '$path.${ExtractionWireKeys.key}',
          ),
        );
        continue;
      }

      if (!seenKeys.add(key)) {
        // Two answers for one question is not extra information, it is a
        // contradiction the app cannot resolve. First wins; the second is
        // dropped rather than arbitrarily preferred.
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.duplicateFieldKey,
            severity: ExtractionIssueSeverity.dropped,
            detail: key,
            path: path,
          ),
        );
        continue;
      }

      final label = _trimmed(entry[ExtractionWireKeys.label]) ?? key;
      final valueType = _enumOrNote<ExtractedValueType>(
        raw: entry[ExtractionWireKeys.valueType],
        parse: ExtractedValueType.fromName,
        fallback: ExtractedValueType.unknown,
        path: '$path.${ExtractionWireKeys.valueType}',
        issues: issues,
      );

      // A provider claiming a value is confirmed is claiming a person agreed
      // with it. Recorded and ignored — there is no wire value that can reach
      // FieldReviewState.confirmed.
      if (_trimmed(entry[ExtractionWireKeys.reviewState]) ==
          FieldReviewState.confirmed.name) {
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.unconfirmableConfidence,
            severity: ExtractionIssueSeverity.downgraded,
            path: '$path.${ExtractionWireKeys.reviewState}',
          ),
        );
      }

      final value = _trimmed(entry[ExtractionWireKeys.value]);
      if (value == null) {
        // Explicitly absent, and stays that way. Unknown remains unknown.
        fields.add(
          ExtractedField.missing(key: key, label: label, valueType: valueType),
        );
        continue;
      }

      fields.add(
        _validateFieldValue(
          key: key,
          label: label,
          valueType: valueType,
          value: _capped(value, ExtractionLimits.maxValueLength, path, issues),
          currency: _trimmed(entry[ExtractionWireKeys.currency]),
          rawEvidence: _trimmed(entry[ExtractionWireKeys.evidence]),
          resolver: resolver,
          issues: issues,
          path: path,
          taintedFrom: taintedFrom,
        ),
      );
    }

    return fields;
  }

  ExtractedField _validateFieldValue({
    required String key,
    required String label,
    required ExtractedValueType valueType,
    required String value,
    required String? currency,
    required String? rawEvidence,
    required EvidenceResolver resolver,
    required List<ExtractionIssue> issues,
    required String path,
    required int? taintedFrom,
  }) {
    var degraded = false;

    ExtractionEvidence? evidence;
    if (rawEvidence == null) {
      issues.add(
        ExtractionIssue(
          code: ExtractionIssueCode.evidenceMissing,
          severity: ExtractionIssueSeverity.downgraded,
          path: '$path.${ExtractionWireKeys.evidence}',
        ),
      );
      degraded = true;
    } else {
      evidence = resolver.resolve(
        _capped(rawEvidence, ExtractionLimits.maxEvidenceLength, path, issues),
      );
      if (!evidence.isGrounded) {
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.evidenceUnresolved,
            severity: ExtractionIssueSeverity.downgraded,
            path: '$path.${ExtractionWireKeys.evidence}',
          ),
        );
        degraded = true;
      } else if (_isTainted(evidence, taintedFrom)) {
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.injectionAttemptInDocument,
            severity: ExtractionIssueSeverity.downgraded,
            detail: 'the supporting quote comes from instruction-like text',
            path: '$path.${ExtractionWireKeys.evidence}',
          ),
        );
        degraded = true;
      }
    }

    DateTime? dateValue;
    MoneyValue? moneyValue;

    switch (valueType) {
      case ExtractedValueType.date:
      case ExtractedValueType.datetime:
        dateValue = parseStrictIso8601(value);
        if (dateValue == null) {
          issues.add(
            ExtractionIssue(
              code: ExtractionIssueCode.invalidDate,
              severity: ExtractionIssueSeverity.downgraded,
              detail: value,
              path: path,
            ),
          );
          degraded = true;
        }

      case ExtractedValueType.money:
        switch (MoneyValue.parse(value, currency)) {
          case MoneyParsed(:final value):
            moneyValue = value;
          case MoneyRejected(:final error):
            issues.add(
              ExtractionIssue(
                code: switch (error) {
                  MoneyParseError.unsupportedCurrency =>
                    ExtractionIssueCode.unsupportedCurrency,
                  MoneyParseError.negative => ExtractionIssueCode.negativeAmount,
                  _ => ExtractionIssueCode.invalidMoney,
                },
                severity: ExtractionIssueSeverity.downgraded,
                detail: error.reason,
                path: path,
              ),
            );
            degraded = true;
        }

      case ExtractedValueType.number:
        if (num.tryParse(value.replaceAll(',', '')) == null) {
          issues.add(
            ExtractionIssue(
              code: ExtractionIssueCode.invalidNumber,
              severity: ExtractionIssueSeverity.downgraded,
              detail: value,
              path: path,
            ),
          );
          degraded = true;
        }

      case ExtractedValueType.text:
      case ExtractedValueType.person:
      case ExtractedValueType.organization:
      case ExtractedValueType.reference:
      case ExtractedValueType.location:
      case ExtractedValueType.boolean:
      case ExtractedValueType.unknown:
        break;
    }

    // The check that catches a genuine quote paired with a wrong value.
    if (evidence != null &&
        evidence.isGrounded &&
        EvidenceSupport.appliesTo(valueType) &&
        !_evidenceSupportsValue(
          quote: evidence.quote,
          valueType: valueType,
          value: value,
          dateValue: dateValue,
          moneyValue: moneyValue,
        )) {
      issues.add(
        ExtractionIssue(
          code: ExtractionIssueCode.valueNotSupportedByEvidence,
          severity: ExtractionIssueSeverity.downgraded,
          detail: value,
          path: path,
        ),
      );
      degraded = true;
    }

    return ExtractedField(
      key: key,
      label: label,
      valueType: valueType,
      value: value,
      evidence: evidence,
      // Typed values are withheld whenever anything about the field is in
      // doubt, so no caller can read a deadline off a field the user has not
      // looked at yet.
      dateValue: degraded ? null : dateValue,
      moneyValue: degraded ? null : moneyValue,
      reviewState:
          degraded ? FieldReviewState.needsReview : FieldReviewState.highConfidence,
    );
  }

  bool _evidenceSupportsValue({
    required String quote,
    required ExtractedValueType valueType,
    required String value,
    required DateTime? dateValue,
    required MoneyValue? moneyValue,
  }) {
    if (valueType == ExtractedValueType.date ||
        valueType == ExtractedValueType.datetime) {
      // An unparseable date has already been flagged; do not flag it twice.
      return dateValue == null || EvidenceSupport.supportsDate(quote, dateValue);
    }
    if (valueType == ExtractedValueType.money) {
      return moneyValue == null ||
          EvidenceSupport.supportsAmount(quote, moneyValue.plainAmount);
    }
    return EvidenceSupport.supportsLiteral(quote, value);
  }

  // ------------------------------------------------------------------- steps

  /// Whether this evidence was quoted from the part of the document that began
  /// issuing instructions.
  bool _isTainted(ExtractionEvidence evidence, int? taintedFrom) =>
      taintedFrom != null &&
      evidence.start != null &&
      evidence.start! >= taintedFrom;

  List<ActionStepDraft> _validateSteps({
    required Object? raw,
    required EvidenceResolver resolver,
    required List<ExtractionIssue> issues,
    required int? taintedFrom,
  }) {
    if (raw is! List) return const [];

    final entries = raw.whereType<Map<String, dynamic>>().toList();
    if (entries.length > ExtractionLimits.maxSteps) {
      issues.add(
        ExtractionIssue(
          code: ExtractionIssueCode.excessiveOutput,
          severity: ExtractionIssueSeverity.dropped,
          detail: '${entries.length} steps, keeping ${ExtractionLimits.maxSteps}',
          path: ExtractionWireKeys.steps,
        ),
      );
    }

    final steps = <ActionStepDraft>[];
    final seenTitles = <String>{};

    for (final entry in entries.take(ExtractionLimits.maxSteps)) {
      final path = '${ExtractionWireKeys.steps}[${steps.length}]';

      final title = _trimmed(entry[ExtractionWireKeys.title]);
      if (title == null) {
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.emptyTitle,
            severity: ExtractionIssueSeverity.dropped,
            path: path,
          ),
        );
        continue;
      }

      // Case and spacing are not meaningful differences between two steps.
      final fingerprint = title.toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
      if (!seenTitles.add(fingerprint)) {
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.duplicateStep,
            severity: ExtractionIssueSeverity.dropped,
            detail: title,
            path: path,
          ),
        );
        continue;
      }

      var degraded = false;
      final rawEvidence = _trimmed(entry[ExtractionWireKeys.evidence]);
      ExtractionEvidence? evidence;

      if (rawEvidence == null) {
        // Kept rather than dropped: a sensible next step the model inferred is
        // still worth offering, it simply may not be presented as something the
        // document said.
        issues.add(
          ExtractionIssue(
            code: ExtractionIssueCode.ungroundedStep,
            severity: ExtractionIssueSeverity.downgraded,
            path: path,
          ),
        );
        degraded = true;
      } else {
        evidence = resolver.resolve(rawEvidence);
        if (!evidence.isGrounded) {
          issues.add(
            ExtractionIssue(
              code: ExtractionIssueCode.evidenceUnresolved,
              severity: ExtractionIssueSeverity.downgraded,
              path: '$path.${ExtractionWireKeys.evidence}',
            ),
          );
          degraded = true;
        } else if (_isTainted(evidence, taintedFrom)) {
          // The step a prompt injection asked for will quote the injection to
          // justify itself, and that quote grounds perfectly. This is the check
          // that stops it being presented as something the document asked for.
          issues.add(
            ExtractionIssue(
              code: ExtractionIssueCode.injectionAttemptInDocument,
              severity: ExtractionIssueSeverity.downgraded,
              detail: 'the supporting quote comes from instruction-like text',
              path: '$path.${ExtractionWireKeys.evidence}',
            ),
          );
          degraded = true;
        }
      }

      DateTime? dueAt;
      final rawDueAt = _trimmed(entry[ExtractionWireKeys.dueAt]);
      if (rawDueAt != null) {
        final parsed = parseStrictIso8601(rawDueAt);
        if (parsed == null) {
          issues.add(
            ExtractionIssue(
              code: ExtractionIssueCode.invalidDate,
              severity: ExtractionIssueSeverity.downgraded,
              detail: rawDueAt,
              path: '$path.${ExtractionWireKeys.dueAt}',
            ),
          );
          degraded = true;
        } else if (evidence != null &&
            evidence.isGrounded &&
            EvidenceSupport.supportsDate(evidence.quote, parsed)) {
          dueAt = parsed;
        } else {
          // A step deadline the document does not state is exactly the invented
          // obligation this layer exists to prevent, so it is discarded rather
          // than shown with a caveat.
          issues.add(
            ExtractionIssue(
              code: ExtractionIssueCode.valueNotSupportedByEvidence,
              severity: ExtractionIssueSeverity.dropped,
              detail: rawDueAt,
              path: '$path.${ExtractionWireKeys.dueAt}',
            ),
          );
          degraded = true;
        }
      }

      steps.add(
        ActionStepDraft(
          // Stable within this result and derived from position, so the
          // confirmation UI can track edits without matching on title text.
          id: 'step_${steps.length}',
          title: _capped(title, ExtractionLimits.maxProseLength, path, issues),
          description: _cappedOrNull(
            _trimmed(entry[ExtractionWireKeys.description]),
            path,
            issues,
          ),
          dueAt: dueAt,
          order: steps.length,
          evidence: evidence,
          reviewState: degraded
              ? FieldReviewState.needsReview
              : FieldReviewState.highConfidence,
        ),
      );
    }

    return steps;
  }

  // ------------------------------------------------------------- consequence

  ({String text, ExtractionEvidence evidence})? _validateConsequence({
    required Object? raw,
    required EvidenceResolver resolver,
    required List<ExtractionIssue> issues,
    required int? taintedFrom,
  }) {
    if (raw == null) return null;

    // A bare string carries no evidence, so it cannot clear the bar no matter
    // how plausible it reads.
    if (raw is String) {
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.ungroundedConsequence,
          severity: ExtractionIssueSeverity.dropped,
          detail: 'no evidence supplied',
          path: ExtractionWireKeys.consequence,
        ),
      );
      return null;
    }

    if (raw is! Map<String, dynamic>) return null;

    final text = _trimmed(raw[ExtractionWireKeys.text]);
    final quote = _trimmed(raw[ExtractionWireKeys.evidence]);
    if (text == null || quote == null) {
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.ungroundedConsequence,
          severity: ExtractionIssueSeverity.dropped,
          path: ExtractionWireKeys.consequence,
        ),
      );
      return null;
    }

    final evidence = resolver.resolve(quote);
    if (!evidence.isGrounded) {
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.ungroundedConsequence,
          severity: ExtractionIssueSeverity.dropped,
          detail: 'the quote is not in the document',
          path: ExtractionWireKeys.consequence,
        ),
      );
      return null;
    }

    if (_isTainted(evidence, taintedFrom)) {
      // The highest-harm claim the app can make, sourced from the least
      // trustworthy part of the document. Dropped outright rather than
      // downgraded.
      issues.add(
        const ExtractionIssue(
          code: ExtractionIssueCode.ungroundedConsequence,
          severity: ExtractionIssueSeverity.dropped,
          detail: 'the quote comes from instruction-like text',
          path: ExtractionWireKeys.consequence,
        ),
      );
      return null;
    }

    return (
      text: _capped(text, ExtractionLimits.maxProseLength,
          ExtractionWireKeys.consequence, issues),
      evidence: evidence,
    );
  }

  // ------------------------------------------------------------------ shared

  static String? _trimmed(Object? value) {
    if (value is! String) return null;
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  T _enumOrNote<T>({
    required Object? raw,
    required T Function(String?) parse,
    required T fallback,
    required String path,
    required List<ExtractionIssue> issues,
  }) {
    final name = _trimmed(raw);
    final parsed = parse(name);
    // Only a *wrong* value is worth reporting. An absent one is ordinary, and
    // an explicit "unknown" is the model correctly declining to guess.
    if (name != null && parsed == fallback && name != (fallback as Enum).name) {
      issues.add(
        ExtractionIssue(
          code: ExtractionIssueCode.invalidEnumValue,
          severity: ExtractionIssueSeverity.downgraded,
          detail: name,
          path: path,
        ),
      );
    }
    return parsed;
  }

  String _capped(
    String value,
    int limit,
    String path,
    List<ExtractionIssue> issues,
  ) {
    if (value.length <= limit) return value;
    issues.add(
      ExtractionIssue(
        code: ExtractionIssueCode.excessiveOutput,
        severity: ExtractionIssueSeverity.downgraded,
        detail: '${value.length} characters, limit $limit',
        path: path,
      ),
    );
    return value.substring(0, limit);
  }

  String? _cappedOrNull(String? value, String path, List<ExtractionIssue> issues) =>
      value == null
          ? null
          : _capped(value, ExtractionLimits.maxProseLength, path, issues);
}

/// Parses ISO-8601 and refuses anything that is not a real calendar date.
///
/// [DateTime.parse] cannot be used directly here. It builds a [DateTime] from
/// the parsed components, and the constructor *normalises overflow*: month 13
/// rolls into the next year and 30 February silently becomes 2 March. For a
/// product whose central promise is that it never invents a deadline, a parser
/// that turns an impossible date into a plausible one is exactly the wrong
/// failure mode. The round-trip check below is what rejects those.
DateTime? parseStrictIso8601(String value) {
  final match = RegExp(
    r'^(\d{4})-(\d{2})-(\d{2})(?:[T ](\d{2}):(\d{2})(?::(\d{2}))?)?$',
  ).firstMatch(value.trim());
  if (match == null) return null;

  final year = int.parse(match.group(1)!);
  final month = int.parse(match.group(2)!);
  final day = int.parse(match.group(3)!);
  final hour = int.tryParse(match.group(4) ?? '0') ?? 0;
  final minute = int.tryParse(match.group(5) ?? '0') ?? 0;
  final second = int.tryParse(match.group(6) ?? '0') ?? 0;

  if (month < 1 || month > 12) return null;
  if (day < 1 || day > 31) return null;
  if (hour > 23 || minute > 59 || second > 59) return null;

  final parsed = DateTime(year, month, day, hour, minute, second);
  if (parsed.year != year || parsed.month != month || parsed.day != day) {
    return null;
  }
  return parsed;
}
