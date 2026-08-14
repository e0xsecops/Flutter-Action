import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/domain/action_draft.dart';
import 'package:action_app/features/extraction/domain/escalation.dart';
import 'package:action_app/features/extraction/domain/extracted_field.dart';
import 'package:action_app/features/extraction/domain/extraction_evidence.dart';
import 'package:action_app/features/extraction/domain/extraction_input.dart';
import 'package:action_app/features/extraction/domain/extraction_result.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/extraction/domain/money_value.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const evidence = ExtractionEvidence(
    quote: 'Renewal date: 30 September 2026',
    grounding: EvidenceGrounding.exact,
    sourceKind: EvidenceSourceKind.ocrText,
    start: 17,
    end: 48,
    lineIndexes: [1],
  );

  ExtractedField dueDate({
    FieldReviewState state = FieldReviewState.highConfidence,
    ExtractionEvidence? withEvidence = evidence,
  }) =>
      ExtractedField(
        key: ExtractionFieldKeys.dueDate,
        label: 'Renewal date',
        valueType: ExtractedValueType.date,
        reviewState: state,
        value: '2026-09-30',
        evidence: withEvidence,
        dateValue: DateTime(2026, 9, 30),
      );

  group('ExtractedField', () {
    test('survives a JSON round trip with its evidence and typed value', () {
      final restored = ExtractedField.fromJson(dueDate().toJson());

      expect(restored.key, ExtractionFieldKeys.dueDate);
      expect(restored.dateValue, DateTime(2026, 9, 30));
      expect(restored.evidence!.grounding, EvidenceGrounding.exact);
      expect(restored.evidence!.lineIndexes, [1]);
      expect(restored.reviewState, FieldReviewState.highConfidence);
    });

    test('a money field round trips exactly', () {
      final field = ExtractedField(
        key: ExtractionFieldKeys.amount,
        label: 'Premium',
        valueType: ExtractedValueType.money,
        reviewState: FieldReviewState.highConfidence,
        value: '780.00',
        moneyValue: const MoneyValue(amountMinor: 78000, currencyCode: 'GBP'),
        evidence: evidence,
      );

      final restored = ExtractedField.fromJson(field.toJson());
      expect(restored.moneyValue, const MoneyValue(amountMinor: 78000, currencyCode: 'GBP'));
    });

    test('a missing field is a real state, not an absent entry', () {
      const missing = ExtractedField.missing(
        key: ExtractionFieldKeys.dueDate,
        label: 'Renewal date',
      );

      expect(missing.reviewState, FieldReviewState.missing);
      expect(missing.value, isNull);
      expect(missing.hasValue, isFalse);
      expect(missing.isTrustworthy, isFalse);
    });

    test('is only trustworthy when grounded', () {
      expect(dueDate().isTrustworthy, isTrue);
      expect(dueDate(withEvidence: null).isTrustworthy, isFalse);
      expect(
        dueDate(state: FieldReviewState.needsReview).isTrustworthy,
        isFalse,
      );
    });

    test('only a person can reach "confirmed"', () {
      final confirmed = dueDate(state: FieldReviewState.needsReview)
          .confirmedByUser('2026-10-05');

      expect(confirmed.reviewState, FieldReviewState.confirmed);
      expect(confirmed.editedByUser, isTrue);
      expect(confirmed.value, '2026-10-05');
      // A user-supplied value is authoritative even without evidence.
      expect(confirmed.isTrustworthy, isTrue);
      // The original evidence is kept for the confirmation screen, but the
      // typed value described the old reading and is not carried over.
      expect(confirmed.evidence, isNotNull);
      expect(confirmed.dateValue, isNull);
    });
  });

  group('ActionDraft', () {
    ActionDraft draftWith(List<ExtractedField> fields) => ActionDraft(
          sourceId: 'src',
          title: 'Renew your policy',
          summary: 'A renewal is due.',
          category: ActionCategory.renewal,
          urgency: ActionUrgency.important,
          urgencyReason: 'A date is stated.',
          reviewState: ExtractionReviewState.readyForConfirmation,
          fields: fields,
          steps: const [],
        );

    test('exposes a deadline only when the field is grounded', () {
      expect(draftWith([dueDate()]).groundedDueAt, DateTime(2026, 9, 30));
      expect(draftWith([dueDate(withEvidence: null)]).groundedDueAt, isNull);
      expect(
        draftWith([dueDate(state: FieldReviewState.needsReview)]).groundedDueAt,
        isNull,
      );
    });

    test('lists the fields a person still has to look at', () {
      final draft = draftWith([
        dueDate(),
        dueDate(state: FieldReviewState.needsReview),
      ]);

      expect(draft.fieldsNeedingReview.length, 1);
    });

    test('survives a JSON round trip', () {
      final restored = ActionDraft.fromJson(draftWith([dueDate()]).toJson());

      expect(restored.title, 'Renew your policy');
      expect(restored.category, ActionCategory.renewal);
      expect(restored.groundedDueAt, DateTime(2026, 9, 30));
    });
  });

  group('ExtractionResult', () {
    test('survives a JSON round trip including issues and escalation', () {
      final result = ExtractionResult(
        sourceId: 'src',
        reviewState: ExtractionReviewState.needsReview,
        engine: 'fixture',
        producedAt: DateTime.utc(2026, 1, 1),
        durationMs: 12,
        issues: const [
          ExtractionIssue(
            code: ExtractionIssueCode.evidenceUnresolved,
            severity: ExtractionIssueSeverity.downgraded,
            path: 'fields[0].evidence',
          ),
        ],
        escalation: const EscalationAssessment([
          ExtractionEscalationSignal.tableLikeLayout,
        ]),
      );

      final restored = ExtractionResult.fromJson(result.toJson());

      expect(restored.schemaVersion, extractionSchemaVersion);
      expect(restored.engine, 'fixture');
      expect(restored.issues.single.code, ExtractionIssueCode.evidenceUnresolved);
      expect(restored.issues.single.path, 'fields[0].evidence');
      expect(
        restored.escalation.has(ExtractionEscalationSignal.tableLikeLayout),
        isTrue,
      );
    });

    test('a manual-entry result still carries its reasons', () {
      final result = ExtractionResult.manualEntryRequired(
        sourceId: 'src',
        engine: 'fixture',
        producedAt: DateTime.utc(2026, 1, 1),
        issues: const [
          ExtractionIssue(
            code: ExtractionIssueCode.malformedJson,
            severity: ExtractionIssueSeverity.rejected,
          ),
        ],
      );

      expect(result.requiresManualEntry, isTrue);
      expect(result.hasDraft, isFalse);
      expect(result.noActionRequired, isFalse);
      expect(result.issuesOfSeverity(ExtractionIssueSeverity.rejected).length, 1);
    });
  });

  group('unknown wire values degrade safely', () {
    test('every enum falls back to its safest member', () {
      // A newer model or a newer build must never take a screen down, and must
      // never land on a confident-looking default.
      expect(ExtractedValueType.fromName('hologram'), ExtractedValueType.unknown);
      expect(FieldReviewState.fromName('definitely'), FieldReviewState.needsReview);
      expect(ActionCategory.fromName('teleport'), ActionCategory.unknown);
      expect(ActionUrgency.fromName('extreme'), ActionUrgency.unknown);
      expect(
        ExtractionReviewState.fromName('perfect'),
        ExtractionReviewState.needsReview,
      );
      expect(EvidenceGrounding.fromName('vibes'), EvidenceGrounding.unresolved);
      expect(EvidenceSourceKind.fromName('telepathy'), EvidenceSourceKind.unknown);
    });

    test('a result written by a newer build still parses', () {
      final restored = ExtractionResult.fromJson({
        'schemaVersion': 2,
        'sourceId': 'src',
        'reviewState': 'gloriouslyCertain',
        'engine': 'future',
        'producedAt': '2026-01-01T00:00:00.000Z',
        'issues': [
          {'code': 'somethingNewWentWrong', 'severity': 'catastrophic'},
        ],
        'escalation': ['newSignal'],
      });

      expect(restored.reviewState, ExtractionReviewState.needsReview);
      expect(restored.issues, isEmpty, reason: 'unrecognised codes are skipped');
      expect(restored.escalation.signals, isEmpty);
    });
  });

  group('ExtractionInput.fromSourceItem', () {
    test('prefers recognised lines and carries their confidence', () {
      final item = SourceItem(
        id: 'a',
        type: SourceType.photo,
        capturedAt: DateTime.utc(2026, 1, 1),
        imagePath: '/tmp/a.jpg',
        imageWidth: 1240,
        imageHeight: 1754,
        state: SourceProcessingState.ready,
        ocr: OcrOutcome(
          rawText: 'Renewal date: 30 September 2026',
          normalizedText: 'Renewal date: 30 September 2026',
          lines: const [
            OcrLine(text: 'Renewal date: 30 September 2026', confidence: 0.82),
          ],
          engine: 'test',
          processedAt: DateTime.utc(2026, 1, 1),
          durationMs: 5,
        ),
      );

      final input = ExtractionInput.fromSourceItem(item);

      expect(input.hasOcrGeometry, isTrue);
      expect(input.lines.single.confidence, 0.82);
      expect(input.imagePixelCount, 1240 * 1754);
      expect(input.multimodalSourceAvailable, isTrue);
      expect(input.evidenceSourceKind, EvidenceSourceKind.ocrText);
      expect(input.ocrFailed, isFalse);
    });

    test('pasted text becomes an ordinary input with no geometry', () {
      final item = SourceItem(
        id: 'b',
        type: SourceType.pastedText,
        capturedAt: DateTime.utc(2026, 1, 1),
        pastedText: 'Pay 780.00\nby 30 September 2026',
        state: SourceProcessingState.ready,
      );

      final input = ExtractionInput.fromSourceItem(item);

      expect(input.hasOcrGeometry, isFalse);
      expect(input.lines.length, 2);
      expect(input.evidenceSourceKind, EvidenceSourceKind.pastedText);
      expect(input.multimodalSourceAvailable, isFalse);
      expect(input.imagePixelCount, 0);
    });

    test('the manual fallback produces a perfectly ordinary input', () {
      // Recognition failed, the user typed the details in by hand. Extraction
      // must treat that as a first-class input, not a special case — otherwise
      // the escape hatch from a bad scan leads nowhere.
      final item = SourceItem(
        id: 'c',
        type: SourceType.photo,
        capturedAt: DateTime.utc(2026, 1, 1),
        imagePath: '/tmp/c.jpg',
        pastedText: 'Renewal date: 30 September 2026',
        state: SourceProcessingState.ready,
      );

      final input = ExtractionInput.fromSourceItem(item);

      expect(input.normalizedText, 'Renewal date: 30 September 2026');
      expect(input.hasText, isTrue);
      expect(input.ocrFailed, isFalse);
    });

    test('a day-3 record with no OCR fields still yields a usable input', () {
      // Backward compatibility with stored JSON written before day 4.
      final legacy = SourceItem.fromJson({
        'id': 'legacy',
        'type': 'pastedText',
        'capturedAt': '2026-08-14T09:30:00.000',
        'rawText': 'Pay 780 by 30 September',
      });

      final input = ExtractionInput.fromSourceItem(legacy);

      expect(input.normalizedText, 'Pay 780 by 30 September');
      expect(input.sourceId, 'legacy');
      expect(input.hasText, isTrue);
    });

    test('a failed recognition is carried through as a failure', () {
      final item = SourceItem(
        id: 'd',
        type: SourceType.photo,
        capturedAt: DateTime.utc(2026, 1, 1),
        imagePath: '/tmp/d.jpg',
        state: SourceProcessingState.failed,
        failureReason: 'unreadable',
      );

      expect(ExtractionInput.fromSourceItem(item).ocrFailed, isTrue);
    });
  });
}
