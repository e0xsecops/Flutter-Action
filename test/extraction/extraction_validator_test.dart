import 'package:action_app/features/extraction/data/extraction_validator.dart';
import 'package:action_app/features/extraction/domain/escalation.dart';
import 'package:action_app/features/extraction/domain/extraction_result.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/extraction_test_support.dart';

/// The validator's job is to treat provider output as untrusted input. These
/// tests are mostly about what it *refuses*.
void main() {
  final input = inputFor(
    'Northgate Mutual\n'
    'Policy number: NM-4471-882\n'
    'Renewal date: 30 September 2026\n'
    'Premium due: 780.00',
  );

  Map<String, dynamic> field({
    String key = 'due_date',
    String label = 'Renewal date',
    Object? value = '2026-09-30',
    String type = 'date',
    Object? evidence = 'Renewal date: 30 September 2026',
    String? currency,
    String? reviewState,
  }) =>
      {
        'key': key,
        'label': label,
        'value': value,
        'value_type': type,
        'evidence': ?evidence,
        'currency': ?currency,
        'review_state': ?reviewState,
      };

  group('rejects a response outright', () {
    test('malformed JSON leaves the manual path open', () {
      final result = validate('{"schema_version": 1, "title": "Bro', input);

      expect(result.requiresManualEntry, isTrue);
      expect(result.draft, isNull);
      expect(result.hasIssue(ExtractionIssueCode.malformedJson), isTrue);
      // Crucially not an exception: every failure still produces a result the
      // UI can render.
      expect(result.sourceId, input.sourceId);
    });

    test('a payload that is not a JSON object', () {
      final result = validate('[1, 2, 3]', input);
      expect(result.requiresManualEntry, isTrue);
      expect(result.hasIssue(ExtractionIssueCode.malformedJson), isTrue);
    });

    test('a missing schema version', () {
      final result = validate(response(schemaVersion: null), input);
      expect(result.requiresManualEntry, isTrue);
      expect(result.hasIssue(ExtractionIssueCode.missingRequiredKey), isTrue);
    });

    test('a schema version this build does not speak', () {
      final result = validate(response(schemaVersion: 99), input);
      expect(result.requiresManualEntry, isTrue);
      expect(
        result.hasIssue(ExtractionIssueCode.unsupportedSchemaVersion),
        isTrue,
      );
    });

    test('an empty title', () {
      expect(validate(response(title: '   '), input).requiresManualEntry, isTrue);
      expect(validate(response(title: null), input).requiresManualEntry, isTrue);
    });
  });

  group('enums and urgency', () {
    test('an unknown enum member falls back and is reported', () {
      final result = validate(response(category: 'teleportation'), input);

      expect(result.draft!.category, ActionCategory.unknown);
      expect(result.hasIssue(ExtractionIssueCode.invalidEnumValue), isTrue);
    });

    test('an explicit "unknown" is the model declining, not an error', () {
      final result = validate(response(category: 'unknown'), input);

      expect(result.draft!.category, ActionCategory.unknown);
      expect(result.hasIssue(ExtractionIssueCode.invalidEnumValue), isFalse);
    });

    test('an urgency with no reason is dropped rather than shown', () {
      final result = validate(response(urgency: 'critical'), input);

      expect(result.draft!.urgency, ActionUrgency.unknown);
      expect(result.hasIssue(ExtractionIssueCode.urgencyWithoutReason), isTrue);
    });

    test('an urgency with a reason survives', () {
      final result = validate(
        response(urgency: 'critical', urgencyReason: 'A date is stated.'),
        input,
      );

      expect(result.draft!.urgency, ActionUrgency.critical);
    });
  });

  group('dates', () {
    test('an impossible date is refused, not rolled over', () {
      // DateTime.parse would turn 30 February into 2 March. For a product that
      // promises never to invent a deadline, that is the worst possible
      // failure mode.
      expect(parseStrictIso8601('2026-02-30'), isNull);
      expect(parseStrictIso8601('2026-13-01'), isNull);
      expect(parseStrictIso8601('2026-09-31'), isNull);
      expect(parseStrictIso8601('2026-09-30T25:00'), isNull);
      expect(parseStrictIso8601('30/09/2026'), isNull);
      expect(parseStrictIso8601('2026-09-30'), DateTime(2026, 9, 30));
      expect(parseStrictIso8601('2026-09-30T09:40'), DateTime(2026, 9, 30, 9, 40));
    });

    test('an unparseable date downgrades the field and withholds the value', () {
      final result = validate(
        response(fields: [field(value: '2026-02-30')]),
        input,
      );

      final due = result.draft!.fields.single;
      expect(due.reviewState, FieldReviewState.needsReview);
      expect(due.dateValue, isNull, reason: 'no usable date may be exposed');
      expect(due.value, '2026-02-30', reason: 'the claim is kept so a person can fix it');
      expect(result.draft!.groundedDueAt, isNull);
      expect(result.hasIssue(ExtractionIssueCode.invalidDate), isTrue);
    });
  });

  group('money', () {
    Map<String, dynamic> amount(String value, String? currency) => field(
          key: 'amount',
          label: 'Premium due',
          value: value,
          type: 'money',
          currency: currency,
          evidence: 'Premium due: 780.00',
        );

    test('a valid amount is exposed only once grounded', () {
      final result = validate(response(fields: [amount('780.00', 'GBP')]), input);

      expect(result.draft!.groundedAmount.toString(), '780.00 GBP');
      expect(result.draft!.fields.single.reviewState, FieldReviewState.highConfidence);
    });

    test('an unsupported currency downgrades the field', () {
      final result = validate(response(fields: [amount('780.00', 'XYZ')]), input);

      expect(result.hasIssue(ExtractionIssueCode.unsupportedCurrency), isTrue);
      expect(result.draft!.groundedAmount, isNull);
    });

    test('a negative amount is refused', () {
      final result = validate(response(fields: [amount('-780.00', 'GBP')]), input);

      expect(result.hasIssue(ExtractionIssueCode.negativeAmount), isTrue);
      expect(result.draft!.groundedAmount, isNull);
    });

    test('an amount its own evidence does not contain is refused', () {
      final result = validate(
        response(fields: [amount('999.00', 'GBP')]),
        input,
      );

      expect(
        result.hasIssue(ExtractionIssueCode.valueNotSupportedByEvidence),
        isTrue,
        reason: 'a real quote paired with a wrong number must not pass',
      );
      expect(result.draft!.groundedAmount, isNull);
    });

    test('a number that is not a number is refused', () {
      final result = validate(
        response(fields: [field(key: 'count', value: 'several', type: 'number')]),
        input,
      );
      expect(result.hasIssue(ExtractionIssueCode.invalidNumber), isTrue);
    });
  });

  group('evidence', () {
    test('a value with no evidence at all is downgraded', () {
      final result = validate(
        response(fields: [field(evidence: null)]),
        input,
      );

      expect(result.hasIssue(ExtractionIssueCode.evidenceMissing), isTrue);
      expect(result.draft!.fields.single.reviewState, FieldReviewState.needsReview);
    });

    test('a quote that is not in the document is downgraded and escalated', () {
      final result = validate(
        response(fields: [field(evidence: 'Renewal date: 12 December 2027')]),
        input,
      );

      expect(result.hasIssue(ExtractionIssueCode.evidenceUnresolved), isTrue);
      expect(result.reviewState, ExtractionReviewState.needsReview);
      expect(
        result.escalation.has(ExtractionEscalationSignal.unresolvedGrounding),
        isTrue,
      );
    });

    test('a null value needs no evidence and stays honestly missing', () {
      final result = validate(
        response(fields: [field(value: null, evidence: null)]),
        input,
      );

      final due = result.draft!.fields.single;
      expect(due.reviewState, FieldReviewState.missing);
      expect(due.value, isNull);
      expect(result.issues, isEmpty);
      expect(result.reviewState, ExtractionReviewState.readyForConfirmation);
    });
  });

  group('confidence claims', () {
    test('the machine can never reach "confirmed"', () {
      final result = validate(
        response(fields: [field(reviewState: 'confirmed')]),
        input,
      );

      expect(result.draft!.fields.single.reviewState, FieldReviewState.highConfidence);
      expect(
        result.hasIssue(ExtractionIssueCode.unconfirmableConfidence),
        isTrue,
      );
    });
  });

  group('fields and steps hygiene', () {
    test('a duplicate key keeps the first answer and reports the second', () {
      final result = validate(
        response(fields: [field(), field(value: '2026-10-01')]),
        input,
      );

      expect(result.draft!.fields.length, 1);
      expect(result.draft!.fields.single.value, '2026-09-30');
      expect(result.hasIssue(ExtractionIssueCode.duplicateFieldKey), isTrue);
    });

    test('a field with no key is dropped', () {
      final result = validate(
        response(fields: [
          {'label': 'Nameless', 'value': 'x', 'value_type': 'text'},
        ]),
        input,
      );

      expect(result.draft!.fields, isEmpty);
      expect(result.hasIssue(ExtractionIssueCode.missingRequiredKey), isTrue);
    });

    test('too many fields are truncated and reported', () {
      final result = validate(
        response(
          fields: [
            for (var i = 0; i < 30; i++)
              field(key: 'k$i', value: 'v$i', type: 'text', evidence: 'Northgate Mutual'),
          ],
        ),
        input,
      );

      expect(result.draft!.fields.length, 24);
      expect(result.hasIssue(ExtractionIssueCode.excessiveOutput), isTrue);
    });

    test('duplicate steps differing only in case and spacing are collapsed', () {
      final result = validate(
        response(steps: [
          {'title': 'Renew the policy', 'evidence': 'Northgate Mutual'},
          {'title': 'renew   THE policy', 'evidence': 'Northgate Mutual'},
        ]),
        input,
      );

      expect(result.draft!.steps.length, 1);
      expect(result.hasIssue(ExtractionIssueCode.duplicateStep), isTrue);
    });

    test('a step with no title is dropped', () {
      final result = validate(
        response(steps: [
          {'title': '  ', 'evidence': 'Northgate Mutual'},
        ]),
        input,
      );

      expect(result.draft!.steps, isEmpty);
      expect(result.hasIssue(ExtractionIssueCode.emptyTitle), isTrue);
    });

    test('a step keeps a stable id and its order', () {
      final result = validate(
        response(steps: [
          {'title': 'First', 'evidence': 'Northgate Mutual'},
          {'title': 'Second', 'evidence': 'Policy number: NM-4471-882'},
        ]),
        input,
      );

      expect(result.draft!.steps.map((s) => s.id), ['step_0', 'step_1']);
      expect(result.draft!.steps.map((s) => s.order), [0, 1]);
    });

    test('an ungrounded step is kept but never presented as grounded', () {
      final result = validate(
        response(steps: [
          {'title': 'Call the insurer to check'},
        ]),
        input,
      );

      final step = result.draft!.steps.single;
      expect(step.reviewState, FieldReviewState.needsReview);
      expect(step.isGrounded, isFalse);
      expect(result.hasIssue(ExtractionIssueCode.ungroundedStep), isTrue);
    });

    test('a step deadline the document does not state is discarded', () {
      final result = validate(
        response(steps: [
          {
            'title': 'Renew the policy',
            'due_at': '2026-11-15',
            'evidence': 'Renewal date: 30 September 2026',
          },
        ]),
        input,
      );

      expect(result.draft!.steps.single.dueAt, isNull);
      expect(
        result.hasIssue(ExtractionIssueCode.valueNotSupportedByEvidence),
        isTrue,
      );
    });
  });

  group('consequence', () {
    test('is dropped when supplied without evidence', () {
      final result = validate(
        response(consequence: 'Your policy will be cancelled.'),
        input,
      );

      expect(result.draft!.consequence, isNull);
      expect(result.hasIssue(ExtractionIssueCode.ungroundedConsequence), isTrue);
    });

    test('is dropped when its quote is not in the document', () {
      final result = validate(
        response(consequence: {
          'text': 'Your policy will be cancelled.',
          'evidence': 'Your policy will be cancelled without notice',
        }),
        input,
      );

      expect(result.draft!.consequence, isNull);
      expect(result.hasIssue(ExtractionIssueCode.ungroundedConsequence), isTrue);
    });

    test('survives only when the document actually says it', () {
      final grounded = inputFor(
        'Renewal date: 30 September 2026\n'
        'If you do not renew, your cover will end on that date.',
      );

      final result = validate(
        response(consequence: {
          'text': 'Cover ends if the policy is not renewed.',
          'evidence': 'your cover will end on that date',
        }),
        grounded,
      );

      expect(result.draft!.consequence, 'Cover ends if the policy is not renewed.');
      expect(result.draft!.consequenceEvidence!.isGrounded, isTrue);
    });
  });

  group('no action required', () {
    test('is a successful answer with no draft', () {
      final result = validate(
        {'schema_version': 1, 'no_action_required': true},
        input,
      );

      expect(result.noActionRequired, isTrue);
      expect(result.hasDraft, isFalse);
      expect(result.requiresManualEntry, isFalse);
      expect(result.reviewState, ExtractionReviewState.readyForConfirmation);
    });
  });
}
