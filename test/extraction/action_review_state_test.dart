import 'package:action_app/features/extraction/application/action_review_state.dart';
import 'package:action_app/features/extraction/application/canonical_fields.dart';
import 'package:action_app/features/extraction/domain/extraction_result.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/extraction_test_support.dart';

/// The review state is where user decisions live. These tests pin the rules
/// that make it a trust boundary: the provider's result is never mutated,
/// `confirmed` is reachable only through a user action, and `canConfirm` is a
/// deterministic function that refuses to close over an open question.
void main() {
  const cleanDoc = 'Riverford Energy statement.\n'
      'Amount due: 96.40\n'
      'Payment is due by 30 August 2026.\n'
      'Account 88-2043-11.';

  Map<String, dynamic> cleanPayload({List<Map<String, dynamic>>? extraFields}) =>
      response(
        title: 'Pay the Riverford Energy bill',
        fields: [
          {
            'key': 'due_date',
            'label': 'Payment due',
            'value': '2026-08-30',
            'value_type': 'date',
            'evidence': 'Payment is due by 30 August 2026',
          },
          {
            'key': 'amount',
            'label': 'Amount due',
            'value': '96.40',
            'value_type': 'money',
            'currency': 'GBP',
            'evidence': 'Amount due: 96.40',
          },
          {
            'key': 'reference',
            'label': 'Account',
            'value': '88-2043-11',
            'value_type': 'reference',
            'evidence': 'Account 88-2043-11',
          },
          ...?extraFields,
        ],
        steps: [
          {
            'title': 'Pay 96.40 by 30 August 2026',
            'evidence': 'Payment is due by 30 August 2026',
          },
        ],
      );

  ExtractionResult cleanResult() => validate(cleanPayload(), inputFor(cleanDoc));

  group('happy path', () {
    test('a fully grounded draft can confirm immediately', () {
      final review = ActionReviewState.fromResult(cleanResult());

      expect(review.blockers, isEmpty);
      expect(review.canConfirm, isTrue);
      expect(review.due.canonical.status, CanonicalStatus.resolved);
      expect(review.amount.canonical.status, CanonicalStatus.resolved);
    });

    test('confirm carries the reviewed values and provenance', () {
      final review = ActionReviewState.fromResult(cleanResult());
      final confirmed = review.confirm(confirmedAt: testProducedAt);

      expect(confirmed.title, 'Pay the Riverford Energy bill');
      expect(confirmed.dueAt, DateTime(2026, 8, 30));
      expect('${confirmed.amount}', '96.40 GBP');
      expect(confirmed.manuallyCreated, isFalse);
      expect(confirmed.extractionEngine, 'test');
      expect(confirmed.steps, hasLength(1));
      expect(confirmed.confirmedAt, testProducedAt);
      // Untouched grounded facts arrive marked as accepted, not edited.
      expect(confirmed.editedFactCount, 0);
    });

    test('a needsReview fact the user never touched is not smuggled into the '
        'confirmed draft', () {
      final result = validate(
        cleanPayload(extraFields: [
          {
            'key': 'organization',
            'label': 'Organisation',
            'value': 'Riverford Energy',
            'value_type': 'organization',
            'evidence': 'this quote is not in the document',
          },
        ]),
        inputFor(cleanDoc),
      );
      final review = ActionReviewState.fromResult(result);
      final confirmed = review.confirm(confirmedAt: testProducedAt);

      expect(
        confirmed.facts.where((f) => f.key == 'organization'),
        isEmpty,
        reason: 'ungrounded and unconfirmed must not pass the boundary',
      );
    });
  });

  group('immutability of the provider result', () {
    test('user edits never touch the original ExtractionResult', () {
      final result = cleanResult();
      final fieldsBefore = result.draft!.fields;
      final statesBefore = [for (final f in fieldsBefore) f.reviewState];

      var review = ActionReviewState.fromResult(result);
      review = review
          .withTitle('My own title')
          .editFieldValue('reference', '99-9999-99')
          .unsetDue()
          .unsetAmount();
      review.confirm(confirmedAt: testProducedAt);

      expect(identical(result.draft!.fields, fieldsBefore), isTrue);
      for (var i = 0; i < fieldsBefore.length; i++) {
        expect(fieldsBefore[i].reviewState, statesBefore[i]);
        expect(fieldsBefore[i].editedByUser, isFalse);
      }
    });

    test('the machine cannot mark a field confirmed — a provider claim of '
        'confirmed is downgraded before review ever sees it', () {
      final result = validate(
        cleanPayload(extraFields: [
          {
            'key': 'organization',
            'label': 'Organisation',
            'value': 'Riverford Energy',
            'value_type': 'organization',
            'evidence': 'Riverford Energy statement',
            'review_state': 'confirmed',
          },
        ]),
        inputFor(cleanDoc),
      );
      final review = ActionReviewState.fromResult(result);

      expect(
        review.effectiveFields
            .where((f) => f.reviewState == FieldReviewState.confirmed),
        isEmpty,
      );
      expect(result.hasIssue(ExtractionIssueCode.unconfirmableConfidence),
          isTrue);
    });

    test('confirmed appears only after an explicit user action', () {
      var review = ActionReviewState.fromResult(cleanResult());
      expect(
        review.effectiveFields
            .any((f) => f.reviewState == FieldReviewState.confirmed),
        isFalse,
      );

      review = review.confirmField('reference');
      final field = review.effectiveField('reference')!;
      expect(field.reviewState, FieldReviewState.confirmed);
      expect(field.editedByUser, isTrue);
    });
  });

  group('editing fields', () {
    test('editing a field keeps its evidence but replaces its value', () {
      var review = ActionReviewState.fromResult(cleanResult());
      final before = review.effectiveField('reference')!;

      review = review.editFieldValue('reference', '11-1111-11');
      final after = review.effectiveField('reference')!;

      expect(after.value, '11-1111-11');
      expect(after.editedByUser, isTrue);
      expect(after.reviewState, FieldReviewState.confirmed);
      expect(after.evidence, same(before.evidence),
          reason: 'provenance is retained, never overwritten');
    });

    test('an edited value is flagged as edited in the confirmed draft', () {
      final review = ActionReviewState.fromResult(cleanResult())
          .editFieldValue('reference', '11-1111-11');
      final confirmed = review.confirm(confirmedAt: testProducedAt);

      final fact =
          confirmed.facts.singleWhere((f) => f.key == 'reference');
      expect(fact.editedByUser, isTrue);
      expect(confirmed.editedFactCount, 1);
    });

    test('empty edits are ignored — deleting is not correcting', () {
      final review = ActionReviewState.fromResult(cleanResult());
      expect(
        review.editFieldValue('reference', '   ').effectiveField('reference'),
        same(review.effectiveField('reference')),
      );
    });
  });

  group('deadline slot', () {
    ExtractionResult ambiguousDates() => validate(
          response(
            title: 'Renew the policy',
            fields: [
              {
                'key': 'due_date',
                'label': 'Payment due',
                'value': '2026-08-30',
                'value_type': 'date',
                'evidence': 'Payment is due by 30 August 2026',
              },
              {
                'key': 'renewal_date',
                'label': 'Renewal date',
                'value': '2026-09-30',
                'value_type': 'date',
                'evidence': 'Renewal date: 30 September 2026',
              },
            ],
          ),
          inputFor('Payment is due by 30 August 2026.\n'
              'Renewal date: 30 September 2026.'),
        );

    test('ambiguous dates block confirmation until the user decides', () {
      var review = ActionReviewState.fromResult(ambiguousDates());

      expect(review.canConfirm, isFalse);
      expect(review.blockers.single.message, contains('date'));

      final candidate = review.due.canonical.candidates
          .singleWhere((f) => f.key == 'due_date');
      review = review.acceptDueCandidate(candidate);

      expect(review.canConfirm, isTrue);
      expect(review.due.effectiveValue, DateTime(2026, 8, 30));
      // Choosing is confirming: the chosen field is now the user's word.
      expect(review.effectiveField('due_date')!.reviewState,
          FieldReviewState.confirmed);
    });

    test('the user may resolve ambiguity by choosing no deadline at all', () {
      final review =
          ActionReviewState.fromResult(ambiguousDates()).unsetDue();

      expect(review.canConfirm, isTrue);
      expect(
          review.confirm(confirmedAt: testProducedAt).dueAt, isNull);
    });

    test('a typed deadline replaces the extracted one and is user-owned', () {
      final review = ActionReviewState.fromResult(cleanResult())
          .editDue(DateTime.utc(2026, 9, 15));

      expect(review.due.userDecided, isTrue);
      expect(
        review.confirm(confirmedAt: testProducedAt).dueAt,
        DateTime.utc(2026, 9, 15),
      );
    });

    test('an impossible typed date is rejected, not normalised', () {
      final review = ActionReviewState.fromResult(ambiguousDates());
      final outcome = review.editDueFromText('2026-02-30');

      expect(outcome, isA<ReviewEditRejected>());
      // The state is untouched, so confirmation stays blocked.
      expect(review.canConfirm, isFalse);
    });

    test('a valid typed date applies through the text path', () {
      final review = ActionReviewState.fromResult(ambiguousDates());
      final outcome = review.editDueFromText('2026-09-01');

      final applied = (outcome as ReviewEditApplied).state;
      expect(applied.canConfirm, isTrue);
      expect(applied.due.effectiveValue, DateTime(2026, 9, 1));
    });

    test('a missing deadline stays missing without blocking', () {
      final result = validate(
        response(
          title: 'Submit the meter reading',
          fields: [
            {
              'key': 'reference',
              'label': 'Account',
              'value': '22-9087',
              'value_type': 'reference',
              'evidence': 'Account 22-9087',
            },
          ],
        ),
        inputFor('Submit your reading soon. Account 22-9087.'),
      );
      final review = ActionReviewState.fromResult(result);

      expect(review.due.canonical.status, CanonicalStatus.absent);
      expect(review.canConfirm, isTrue);
      expect(review.confirm(confirmedAt: testProducedAt).dueAt, isNull);
    });
  });

  group('amount slot', () {
    test('multiple grounded amounts block until resolved', () {
      final result = validate(
        response(
          title: 'Pay the bill',
          fields: [
            {
              'key': 'amount_due',
              'label': 'Amount due',
              'value': '96.40',
              'value_type': 'money',
              'currency': 'GBP',
              'evidence': 'Amount due: 96.40',
            },
            {
              'key': 'total_due',
              'label': 'Total with late fee',
              'value': '120.00',
              'value_type': 'money',
              'currency': 'GBP',
              'evidence': 'Total with late fee: 120.00',
            },
          ],
        ),
        inputFor('Amount due: 96.40\nTotal with late fee: 120.00'),
      );
      var review = ActionReviewState.fromResult(result);

      expect(review.canConfirm, isFalse);

      final candidate = review.amount.canonical.candidates
          .singleWhere((f) => f.key == 'total_due');
      review = review.acceptAmountCandidate(candidate);

      expect(review.canConfirm, isTrue);
      expect('${review.amount.effectiveValue}', '120.00 GBP');
    });

    test('invalid typed amounts are rejected with the parser reason', () {
      final review = ActionReviewState.fromResult(cleanResult());

      expect(review.editAmountFromText('12.3.4', 'GBP'),
          isA<ReviewEditRejected>());
      expect(review.editAmountFromText('-5.00', 'GBP'),
          isA<ReviewEditRejected>());
      expect(review.editAmountFromText('96.40', 'ZZZ'),
          isA<ReviewEditRejected>());
    });

    test('a valid typed amount applies and is user-owned', () {
      final outcome = ActionReviewState.fromResult(cleanResult())
          .editAmountFromText('105.00', 'GBP');

      final applied = (outcome as ReviewEditApplied).state;
      expect('${applied.amount.effectiveValue}', '105.00 GBP');
      expect(
        '${applied.confirm(confirmedAt: testProducedAt).amount}',
        '105.00 GBP',
      );
    });
  });

  group('steps', () {
    test('excluded steps stay out of the confirmed draft', () {
      var review = ActionReviewState.fromResult(cleanResult());
      final id = review.steps.single.id;

      review = review.setStepIncluded(id, false);
      expect(review.confirm(confirmedAt: testProducedAt).steps, isEmpty);
    });

    test('edited and added steps are user-marked', () {
      var review = ActionReviewState.fromResult(cleanResult());
      final id = review.steps.single.id;

      review = review
          .editStepTitle(id, 'Pay it early')
          .addManualStep('File the receipt');

      expect(review.steps.first.editedByUser, isTrue);
      expect(review.steps.last.editedByUser, isTrue);
      expect(
        review.confirm(confirmedAt: testProducedAt).steps.map((s) => s.title),
        ['Pay it early', 'File the receipt'],
      );
    });
  });

  group('title and blocking', () {
    test('an empty title blocks confirmation', () {
      final review =
          ActionReviewState.fromResult(cleanResult()).withTitle('   ');

      expect(review.canConfirm, isFalse);
      expect(review.blockers.single.message, contains('title'));
    });

    test('confirm() while blocked throws rather than producing a draft', () {
      final review =
          ActionReviewState.fromResult(cleanResult()).withTitle('');
      expect(() => review.confirm(), throwsStateError);
    });
  });

  group('manual mode', () {
    test('manual review starts blocked and confirms only user-entered data',
        () {
      var review = ActionReviewState.manual(sourceId: 'src');
      expect(review.canConfirm, isFalse);

      review = review.withTitle('Call the bank');
      expect(review.canConfirm, isTrue);

      review = review
          .editDue(DateTime.utc(2026, 9, 1))
          .addManualStep('Find the phone number');
      final confirmed = review.confirm(confirmedAt: testProducedAt);

      expect(confirmed.manuallyCreated, isTrue);
      expect(confirmed.extractionEngine, isNull);
      expect(confirmed.title, 'Call the bank');
      expect(confirmed.dueAt, DateTime.utc(2026, 9, 1));
      expect(confirmed.facts, isEmpty);
    });

    test('manualEntryRequired originals contribute audit context, not values',
        () {
      final unusable = validate('this is not json', inputFor('anything'));
      expect(unusable.requiresManualEntry, isTrue);

      final review = ActionReviewState.manual(
        sourceId: 'src',
        original: unusable,
      ).withTitle('Typed by hand');
      final confirmed = review.confirm(confirmedAt: testProducedAt);

      expect(confirmed.manuallyCreated, isTrue);
      expect(confirmed.extractionEngine, isNull);
      expect(confirmed.facts, isEmpty);
      expect(confirmed.steps, isEmpty);
    });

    test('fromResult refuses a draftless result', () {
      final unusable = validate('nope', inputFor('anything'));
      expect(() => ActionReviewState.fromResult(unusable),
          throwsArgumentError);
      expect(reviewStateFor(unusable), isNull);
    });
  });
}
