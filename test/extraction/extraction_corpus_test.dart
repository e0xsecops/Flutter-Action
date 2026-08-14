import 'dart:io';

import 'package:action_app/core/result.dart';
import 'package:action_app/features/extraction/data/fixture_extraction_service.dart';
import 'package:action_app/features/extraction/domain/extraction_result.dart';
import 'package:flutter_test/flutter_test.dart';

/// Runs the whole synthetic extraction corpus through the real validator.
///
/// Every case is a document plus the response a provider would give for it.
/// Several of those responses are deliberately wrong — an inflated amount, an
/// invented start date, a consequence the document never states — because the
/// thing under test is what the app does about them, not whether a model gets
/// them right.
///
/// No network, no model, no clock: [FixtureExtractionService] pins the
/// timestamp, so two runs produce identical output.
void main() {
  final corpus = ExtractionFixtureCase.parseManifest(
    File('test/fixtures/extraction/cases.json').readAsStringSync(),
  );

  test('the corpus is large enough to be worth trusting', () {
    expect(corpus.length, greaterThanOrEqualTo(15));
    expect(
      corpus.map((c) => c.id).toSet().length,
      corpus.length,
      reason: 'case ids must be unique — they key the fixture responses',
    );
  });

  group('extraction corpus', () {
    for (final fixture in corpus) {
      test('${fixture.id}: ${fixture.description}', () async {
        final service = FixtureExtractionService(
          responses: {fixture.id: fixture.providerResponse},
        );

        final outcome = await service.extract(fixture.toInput());
        expect(outcome, isA<Ok<ExtractionResult>>());
        final result = (outcome as Ok<ExtractionResult>).value;

        final expected = fixture.expectation;
        final where = 'case "${fixture.id}"';

        if (expected.hasDraft != null) {
          expect(result.hasDraft, expected.hasDraft, reason: '$where hasDraft');
        }
        if (expected.noActionRequired != null) {
          expect(
            result.noActionRequired,
            expected.noActionRequired,
            reason: '$where noActionRequired',
          );
        }
        if (expected.reviewState != null) {
          expect(
            result.reviewState,
            expected.reviewState,
            reason: '$where reviewState — issues: ${result.issues}',
          );
        }
        if (expected.issueCount != null) {
          expect(
            result.issues.length,
            expected.issueCount,
            reason: '$where issue count — got ${result.issues}',
          );
        }
        for (final code in expected.issueCodes) {
          expect(
            result.hasIssue(code),
            isTrue,
            reason: '$where expected issue $code — got ${result.issues}',
          );
        }
        for (final code in expected.forbiddenIssueCodes) {
          expect(
            result.hasIssue(code),
            isFalse,
            reason: '$where must not report $code',
          );
        }

        expect(
          result.escalation.signals.toSet(),
          expected.escalationSignals,
          reason: '$where escalation signals',
        );
        if (expected.mayNeedMultimodal != null) {
          expect(
            result.escalation.mayNeedMultimodal,
            expected.mayNeedMultimodal,
            reason: '$where mayNeedMultimodal',
          );
        }

        final draft = result.draft;
        if (expected.category != null) {
          expect(draft?.category, expected.category, reason: '$where category');
        }
        if (expected.urgency != null) {
          expect(draft?.urgency, expected.urgency, reason: '$where urgency');
        }
        if (expected.fieldCount != null) {
          expect(
            draft?.fields.length,
            expected.fieldCount,
            reason: '$where field count — got ${draft?.fields}',
          );
        }
        if (expected.stepCount != null) {
          expect(
            draft?.steps.length,
            expected.stepCount,
            reason: '$where step count',
          );
        }
        if (expected.groundedDueAt != null) {
          expect(
            draft?.groundedDueAt?.toIso8601String(),
            expected.groundedDueAt,
            reason: '$where grounded due date',
          );
        }
        if (expected.dueAtAbsent == true) {
          expect(
            draft?.groundedDueAt,
            isNull,
            reason: '$where must not expose a deadline',
          );
        }
        if (expected.groundedAmount != null) {
          expect(
            draft?.groundedAmount?.toString(),
            expected.groundedAmount,
            reason: '$where grounded amount',
          );
        }
        if (expected.amountAbsent == true) {
          expect(
            draft?.groundedAmount,
            isNull,
            reason: '$where must not expose an amount',
          );
        }
        if (expected.consequencePresent != null) {
          expect(
            draft?.consequence != null,
            expected.consequencePresent,
            reason: '$where consequence presence',
          );
        }
      });
    }
  });

  test('an unregistered source is a transport failure, not a bad document', () async {
    const service = FixtureExtractionService(responses: {});
    final outcome = await service.extract(corpus.first.toInput());

    // The distinction matters to the UI: this one is worth retrying, an
    // unusable response is not.
    expect(outcome, isA<Err<ExtractionResult>>());
  });

  test('the corpus covers the scenarios day 5 was scoped around', () {
    final ids = corpus.map((c) => c.id).toSet();
    for (final required in [
      'renewal_notice',
      'utility_bill',
      'appointment',
      'booking_confirmation',
      'receipt',
      'return_deadline',
      'travel_booking',
      'cancellation_deadline',
      'reference_numbers',
      'multiple_dates_one_actionable',
      'multiple_amounts',
      'no_action_required',
      'missing_deadline',
      'ambiguous_deadline',
      'table_heavy',
      'sparse_ocr',
      'low_confidence_fragments',
      'conflicting_amounts',
      'prompt_injection',
    ]) {
      expect(ids, contains(required));
    }
  });
}
