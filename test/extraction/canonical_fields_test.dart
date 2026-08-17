import 'package:action_app/features/extraction/application/canonical_fields.dart';
import 'package:action_app/features/extraction/domain/extraction_result.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/extraction_test_support.dart';

/// The resolver is exercised the same way everything else in extraction is:
/// canned provider payloads through the REAL validator, so every field it
/// sees carries genuine grounding and review state rather than hand-built
/// approximations of them.
void main() {
  ExtractionResult resultFor({
    required String document,
    required List<Map<String, dynamic>> fields,
  }) =>
      validate(response(fields: fields), inputFor(document));

  Map<String, dynamic> dateField(
    String key, {
    String value = '2026-08-30',
    String? evidence = 'Payment is due by 30 August 2026',
    String label = 'Due date',
  }) =>
      {
        'key': key,
        'label': label,
        'value': value,
        'value_type': 'date',
        'evidence': ?evidence,
      };

  Map<String, dynamic> moneyField(
    String key, {
    String value = '96.40',
    String currency = 'GBP',
    String? evidence = 'Amount due: 96.40',
    String label = 'Amount due',
  }) =>
      {
        'key': key,
        'label': label,
        'value': value,
        'value_type': 'money',
        'currency': currency,
        'evidence': ?evidence,
      };

  const dueDoc = 'Payment is due by 30 August 2026.\nThank you.';
  const amountDoc = 'Amount due: 96.40\nThank you.';

  group('due date resolution', () {
    test('a single grounded allowlisted date resolves', () {
      final result = resultFor(
        document: dueDoc,
        fields: [dateField('due_date')],
      );
      final slot = CanonicalFieldResolver.dueDate(result.draft!.fields);

      expect(slot.status, CanonicalStatus.resolved);
      expect(slot.resolvedField!.dateValue, DateTime(2026, 8, 30));
      expect(slot.needsUserDecision, isFalse);
    });

    test('two allowlisted keys agreeing on one date resolve as one answer',
        () {
      final result = resultFor(
        document: dueDoc,
        fields: [
          dateField('payment_deadline'),
          dateField('due_date'),
        ],
      );
      final slot = CanonicalFieldResolver.dueDate(result.draft!.fields);

      expect(slot.status, CanonicalStatus.resolved);
      // Representative comes from allowlist priority, not provider order.
      expect(slot.resolvedField!.key, 'due_date');
    });

    test('disagreeing grounded dates are ambiguous, never auto-chosen', () {
      final result = resultFor(
        document: 'Payment is due by 30 August 2026.\n'
            'Renewal date: 30 September 2026.',
        fields: [
          dateField('due_date'),
          dateField(
            'renewal_date',
            value: '2026-09-30',
            evidence: 'Renewal date: 30 September 2026',
            label: 'Renewal date',
          ),
        ],
      );
      final slot = CanonicalFieldResolver.dueDate(result.draft!.fields);

      expect(slot.status, CanonicalStatus.ambiguous);
      expect(slot.resolvedField, isNull);
      expect(slot.needsUserDecision, isTrue);
      expect(slot.candidates, hasLength(2));
    });

    test('an ungrounded family date contradicting a grounded one forces '
        'ambiguity', () {
      final result = resultFor(
        document: dueDoc,
        fields: [
          dateField('due_date'),
          // Evidence that does not exist in the document -> ungrounded,
          // needsReview — but its different value is still a visible
          // conflict the user must settle.
          dateField(
            'renewal_date',
            value: '2026-09-30',
            evidence: 'not in the document at all',
          ),
        ],
      );
      final slot = CanonicalFieldResolver.dueDate(result.draft!.fields);

      expect(slot.status, CanonicalStatus.ambiguous);
    });

    test('only unverified family dates give unverified, not a value', () {
      final result = resultFor(
        document: 'The dates in here support nothing.',
        fields: [
          dateField('due_date', evidence: 'nowhere to be found'),
        ],
      );
      final slot = CanonicalFieldResolver.dueDate(result.draft!.fields);

      expect(slot.status, CanonicalStatus.unverified);
      expect(slot.resolvedField, isNull);
      expect(slot.needsUserDecision, isTrue);
    });

    test('no allowlisted key at all is absent — a date field with a foreign '
        'key never qualifies by similarity', () {
      final result = resultFor(
        document: 'Treatment on 21 July 2026.',
        fields: [
          dateField(
            'treatment_date',
            value: '2026-07-21',
            evidence: 'Treatment on 21 July 2026',
          ),
          // 'previous_due_date' contains 'due_date' as a substring; a fuzzy
          // matcher would take the bait.
          dateField(
            'previous_due_date',
            value: '2026-07-01',
            evidence: null,
          ),
        ],
      );
      final slot = CanonicalFieldResolver.dueDate(result.draft!.fields);

      expect(slot.status, CanonicalStatus.absent);
      expect(slot.candidates, isEmpty);
    });
  });

  group('amount resolution', () {
    test('a single grounded allowlisted amount resolves with its currency',
        () {
      final result = resultFor(
        document: amountDoc,
        fields: [moneyField('amount_due')],
      );
      final slot = CanonicalFieldResolver.amount(result.draft!.fields);

      expect(slot.status, CanonicalStatus.resolved);
      expect('${slot.resolvedField!.moneyValue}', '96.40 GBP');
    });

    test('same number in different currencies is ambiguous', () {
      final result = resultFor(
        document: 'Amount due: 96.40\nAlso listed: 96.40\nEnd.',
        fields: [
          moneyField('amount_due'),
          moneyField(
            'total_due',
            currency: 'USD',
            evidence: 'Also listed: 96.40',
            label: 'Total due',
          ),
        ],
      );
      final slot = CanonicalFieldResolver.amount(result.draft!.fields);

      expect(slot.status, CanonicalStatus.ambiguous);
    });

    test('disagreeing grounded amounts are ambiguous', () {
      final result = resultFor(
        document: 'Amount due: 96.40\nLate total: 120.00\nEnd.',
        fields: [
          moneyField('amount_due'),
          moneyField(
            'total_due',
            value: '120.00',
            evidence: 'Late total: 120.00',
            label: 'Total',
          ),
        ],
      );
      final slot = CanonicalFieldResolver.amount(result.draft!.fields);

      expect(slot.status, CanonicalStatus.ambiguous);
      expect(slot.candidates, hasLength(2));
    });

    test('no allowlisted amount key is absent', () {
      final result = resultFor(
        document: 'Previous balance: 0.00',
        fields: [
          moneyField(
            'previous_balance',
            value: '0.00',
            evidence: 'Previous balance: 0.00',
          ),
        ],
      );
      expect(
        CanonicalFieldResolver.amount(result.draft!.fields).status,
        CanonicalStatus.absent,
      );
    });
  });
}
