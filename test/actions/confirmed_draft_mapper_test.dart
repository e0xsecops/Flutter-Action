import 'package:action_app/features/actions/application/confirmed_draft_mapper.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/extraction/application/action_review_state.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

import '../extraction/support/extraction_test_support.dart';
import 'support/actions_test_support.dart';

/// The crossing from reviewed draft to durable Action, exercised through the
/// REAL review layer: payload → validator → review state → confirm() →
/// mapper. Nothing is hand-assembled, so what these tests pin is exactly
/// what the running app persists.
void main() {
  const doc = 'Riverford Energy statement.\n'
      'Amount due: 96.40\n'
      'Payment is due by 30 August 2026.\n'
      'Account 88-2043-11.';

  ActionReviewState reviewOf() => ActionReviewState.fromResult(validate(
        response(
          title: 'Pay the Riverford Energy bill',
          urgency: 'important',
          urgencyReason: 'Payment is due by 30 August 2026',
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
          ],
          steps: [
            {
              'title': 'Pay 96.40 by 30 August 2026',
              'evidence': 'Payment is due by 30 August 2026',
            },
          ],
        ),
        inputFor(doc),
      ));

  test('an extraction-born draft maps to a faithful active Action', () {
    final draft =
        reviewOf().confirm(confirmedAt: testProducedAt, id: 'action-1');
    final item = actionItemFromDraft(draft, now: testNow);

    expect(item.id, 'action-1');
    expect(item.schemaVersion, actionSchemaVersion);
    expect(item.sourceId, 'src');
    expect(item.title, 'Pay the Riverford Energy bill');
    expect(item.status, ActionStatus.active);
    expect(item.urgency, ActionUrgency.important);
    expect(item.category, ActionCategory.payment);
    expect(item.dueAt!.wallClock, DateTime(2026, 8, 30));
    expect(item.dueAt!.isDateOnly, isTrue);
    expect('${item.amount}', '96.40 GBP');
    expect(item.origin, ActionOrigin.extraction);
    expect(item.reviewedAt, testProducedAt);
    expect(item.createdAt, testNow);
    expect(item.updatedAt, testNow);
    expect(item.completedAt, isNull);
    expect(item.steps.single.title, 'Pay 96.40 by 30 August 2026');
    expect(item.facts.map((f) => f.key), contains('reference'));
  });

  test('user edits keep their user-owned marks across the crossing', () {
    final review = reviewOf()
        .editFieldValue('reference', '99-9999-99')
        .editDue(DateTime(2026, 9, 15));
    final draft =
        review.confirm(confirmedAt: testProducedAt, id: 'action-2');
    final item = actionItemFromDraft(draft, now: testNow);

    expect(item.dueAt!.wallClock, DateTime(2026, 9, 15));
    final fact = item.facts.singleWhere((f) => f.key == 'reference');
    expect(fact.value, '99-9999-99');
    expect(fact.editedByUser, isTrue);
  });

  test('a manual draft maps to a manual Action with no source linkage', () {
    final draft = ActionReviewState.manual(sourceId: '')
        .withTitle('Call the bank')
        .confirm(confirmedAt: testProducedAt, id: 'manual-1');
    final item = actionItemFromDraft(draft, now: testNow);

    expect(item.origin, ActionOrigin.manual);
    expect(item.sourceId, isNull);
    expect(item.dueAt, isNull);
    expect(item.amount, isNull);
    expect(item.steps, isEmpty);
    expect(item.facts, isEmpty);
  });

  test('confidence machinery does not survive the crossing', () {
    final draft =
        reviewOf().confirm(confirmedAt: testProducedAt, id: 'action-3');
    final item = actionItemFromDraft(draft, now: testNow);

    // The durable record carries values and one provenance flag per fact —
    // no review states, no evidence, no grounding.
    for (final fact in item.facts) {
      expect(fact.editedByUser, isFalse);
    }
    expect(item.whyThisMatters, isNull,
        reason: 'not carried by the Day-8 mapper');
  });
}
