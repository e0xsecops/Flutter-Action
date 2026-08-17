import '../../../features/capture/domain/source_item.dart';
import '../data/extraction_validator.dart' show parseStrictIso8601;
import '../domain/action_draft.dart';
import '../domain/confirmed_action_draft.dart';
import '../domain/extracted_field.dart';
import '../domain/extraction_result.dart';
import '../domain/extraction_schema.dart';
import '../domain/money_value.dart';
import 'canonical_fields.dart';

/// The user's side of the trust boundary.
///
/// [ActionReviewState] holds everything a person changes while reviewing an
/// extraction: edited values, accepted candidates, kept steps. It never
/// mutates the [ExtractionResult] it was built from — the provider's output
/// stays exactly as validated, and every user decision is layered on top as a
/// new immutable state. `confirm()` is the single gate through which anything
/// becomes a [ConfirmedActionDraft], and it refuses to run while a critical
/// question is still open.
///
/// Two modes share the type. [ReviewMode.extracted] reviews a draft the
/// validator produced. [ReviewMode.manual] starts from nothing — used when the
/// provider's answer was unusable, or when the user adds an action to a
/// document that needed none. Manual mode has no candidates and no evidence;
/// everything in it is user-entered by definition.
enum ReviewMode { extracted, manual }

/// What the user has decided about a canonical slot (deadline / amount).
enum SlotDecision {
  /// No decision yet. Blocks confirmation only when the slot actually needs
  /// one — see [ReviewDateSlot.needsDecision].
  pending,

  /// The user accepted one of the extracted candidates.
  accepted,

  /// The user typed their own value.
  edited,

  /// The user explicitly chose "no value". A reviewed absence, not a gap.
  unset,
}

/// The deadline slot: canonical resolution plus the user's decision on it.
final class ReviewDateSlot {
  const ReviewDateSlot({
    required this.canonical,
    this.decision = SlotDecision.pending,
    this.chosen,
    this.editedValue,
  });

  final CanonicalSlot canonical;
  final SlotDecision decision;

  /// The candidate the user accepted; null unless [decision] is accepted.
  final ExtractedField? chosen;

  /// The user-entered value; null unless [decision] is edited.
  final DateTime? editedValue;

  /// A decision is required when the resolver could not settle the slot —
  /// several disagreeing dates, or only unverified ones. A resolved or absent
  /// slot needs nothing from the user.
  bool get needsDecision =>
      canonical.needsUserDecision && decision == SlotDecision.pending;

  /// The value that would go into a confirmed draft right now.
  DateTime? get effectiveValue => switch (decision) {
        SlotDecision.edited => editedValue,
        SlotDecision.accepted => chosen?.dateValue,
        SlotDecision.unset => null,
        SlotDecision.pending => canonical.resolvedField?.dateValue,
      };

  /// True when the effective value came from the user rather than the
  /// extraction (either typed, or an explicit choice between candidates).
  bool get userDecided => decision != SlotDecision.pending;

  ReviewDateSlot copyWith({
    SlotDecision? decision,
    ExtractedField? chosen,
    DateTime? editedValue,
  }) =>
      ReviewDateSlot(
        canonical: canonical,
        decision: decision ?? this.decision,
        chosen: decision == SlotDecision.accepted ? (chosen ?? this.chosen) : null,
        editedValue: decision == SlotDecision.edited
            ? (editedValue ?? this.editedValue)
            : null,
      );
}

/// The amount slot. Mirrors [ReviewDateSlot] with [MoneyValue] semantics.
final class ReviewAmountSlot {
  const ReviewAmountSlot({
    required this.canonical,
    this.decision = SlotDecision.pending,
    this.chosen,
    this.editedValue,
  });

  final CanonicalSlot canonical;
  final SlotDecision decision;
  final ExtractedField? chosen;
  final MoneyValue? editedValue;

  bool get needsDecision =>
      canonical.needsUserDecision && decision == SlotDecision.pending;

  MoneyValue? get effectiveValue => switch (decision) {
        SlotDecision.edited => editedValue,
        SlotDecision.accepted => chosen?.moneyValue,
        SlotDecision.unset => null,
        SlotDecision.pending => canonical.resolvedField?.moneyValue,
      };

  bool get userDecided => decision != SlotDecision.pending;

  ReviewAmountSlot copyWith({
    SlotDecision? decision,
    ExtractedField? chosen,
    MoneyValue? editedValue,
  }) =>
      ReviewAmountSlot(
        canonical: canonical,
        decision: decision ?? this.decision,
        chosen: decision == SlotDecision.accepted ? (chosen ?? this.chosen) : null,
        editedValue: decision == SlotDecision.edited
            ? (editedValue ?? this.editedValue)
            : null,
      );
}

/// One step under review: the validator's step plus the user's changes.
final class ReviewStep {
  const ReviewStep({
    required this.id,
    required this.title,
    required this.order,
    this.original,
    this.included = true,
    this.editedByUser = false,
  });

  final String id;
  final String title;
  final int order;

  /// Null for a step the user added by hand in manual mode.
  final ActionStepDraft? original;
  final bool included;
  final bool editedByUser;

  DateTime? get dueAt => original?.dueAt;
  String? get description => original?.description;

  ReviewStep copyWith({String? title, bool? included, bool? editedByUser}) =>
      ReviewStep(
        id: id,
        title: title ?? this.title,
        order: order,
        original: original,
        included: included ?? this.included,
        editedByUser: editedByUser ?? this.editedByUser,
      );
}

/// Why confirmation is currently refused. [message] is user-facing.
final class ReviewBlocker {
  const ReviewBlocker(this.message);
  final String message;
}

/// Result of applying a typed edit that had to be validated first.
sealed class ReviewEdit {
  const ReviewEdit();
}

final class ReviewEditApplied extends ReviewEdit {
  const ReviewEditApplied(this.state);
  final ActionReviewState state;
}

final class ReviewEditRejected extends ReviewEdit {
  const ReviewEditRejected(this.reason);
  final String reason;
}

final class ActionReviewState {
  const ActionReviewState._({
    required this.mode,
    required this.sourceId,
    required this.title,
    required this.titleEditedByUser,
    required this.due,
    required this.amount,
    required this.steps,
    required this.confirmedFields,
    this.original,
    this.recommendedNextStep,
  });

  /// Review of a validated extraction draft. The result must carry a draft;
  /// use [ActionReviewState.manual] for the draftless outcomes.
  factory ActionReviewState.fromResult(ExtractionResult result) {
    final draft = result.draft;
    if (draft == null) {
      throw ArgumentError(
        'fromResult needs a draft; use ActionReviewState.manual for '
        '${result.reviewState.name}',
      );
    }
    return ActionReviewState._(
      mode: ReviewMode.extracted,
      sourceId: result.sourceId,
      original: result,
      title: draft.title,
      titleEditedByUser: false,
      due: ReviewDateSlot(canonical: CanonicalFieldResolver.dueDate(draft.fields)),
      amount:
          ReviewAmountSlot(canonical: CanonicalFieldResolver.amount(draft.fields)),
      steps: [
        for (final step in draft.steps)
          ReviewStep(
            id: step.id,
            title: step.title,
            order: step.order,
            original: step,
          ),
      ],
      confirmedFields: const {},
      recommendedNextStep: draft.recommendedNextStep,
    );
  }

  /// A blank review for typing an action in by hand. [original] may carry the
  /// unusable extraction result for audit; it contributes no values.
  factory ActionReviewState.manual({
    required String sourceId,
    ExtractionResult? original,
  }) =>
      ActionReviewState._(
        mode: ReviewMode.manual,
        sourceId: sourceId,
        original: original,
        title: '',
        titleEditedByUser: false,
        due: const ReviewDateSlot(canonical: CanonicalSlot.absent()),
        amount: const ReviewAmountSlot(canonical: CanonicalSlot.absent()),
        steps: const [],
        confirmedFields: const {},
      );

  final ReviewMode mode;
  final String sourceId;

  /// The provider's validated output, held for reading only. Nothing in this
  /// class writes to it, and [confirm] copies primitives out of it rather
  /// than handing it onward.
  final ExtractionResult? original;

  final String title;
  final bool titleEditedByUser;
  final ReviewDateSlot due;
  final ReviewAmountSlot amount;
  final List<ReviewStep> steps;

  /// Fields the user has confirmed or corrected, keyed by field key. Each
  /// value came from [ExtractedField.confirmedByUser] — the only route to
  /// [FieldReviewState.confirmed] in the entire codebase.
  final Map<String, ExtractedField> confirmedFields;

  final String? recommendedNextStep;

  ActionDraft? get draft => original?.draft;

  /// The draft's fields with the user's confirmations layered on top. This is
  /// what the screen renders — the underlying draft list is never edited.
  List<ExtractedField> get effectiveFields => [
        for (final field in draft?.fields ?? const <ExtractedField>[])
          confirmedFields[field.key] ?? field,
      ];

  ExtractedField? effectiveField(String key) {
    final override = confirmedFields[key];
    if (override != null) return override;
    return draft?.fieldFor(key) ??
        draft?.fields.where((f) => f.key == key).firstOrNull;
  }

  // ---------------------------------------------------------------- edits --

  ActionReviewState withTitle(String value) =>
      _copy(title: value, titleEditedByUser: true);

  /// Accept one extracted candidate as the deadline. Choosing is a user
  /// decision, so the chosen field is also marked confirmed by the user.
  ActionReviewState acceptDueCandidate(ExtractedField field) => _copy(
        due: due.copyWith(decision: SlotDecision.accepted, chosen: field),
        confirmedFields: _withConfirmed(field),
      );

  /// Apply a user-typed deadline. Dates arrive as ISO-8601 text (the edit
  /// sheet's date picker produces it); parsing is strict — `2026-02-30` is
  /// rejected, never rolled into March.
  ReviewEdit editDueFromText(String text) {
    final parsed = parseStrictIso8601(text.trim());
    if (parsed == null) {
      return const ReviewEditRejected(
        'That is not a real date. Use the format 2026-08-30.',
      );
    }
    return ReviewEditApplied(editDue(parsed));
  }

  ActionReviewState editDue(DateTime value) => _copy(
        due: due.copyWith(decision: SlotDecision.edited, editedValue: value),
      );

  ActionReviewState unsetDue() =>
      _copy(due: due.copyWith(decision: SlotDecision.unset));

  ActionReviewState acceptAmountCandidate(ExtractedField field) => _copy(
        amount:
            amount.copyWith(decision: SlotDecision.accepted, chosen: field),
        confirmedFields: _withConfirmed(field),
      );

  /// Apply a user-typed amount. [MoneyValue.parse] is the same strict parser
  /// the validator uses: plain decimals, supported ISO-4217 codes, never
  /// negative.
  ReviewEdit editAmountFromText(String amountText, String currencyCode) {
    switch (MoneyValue.parse(amountText.trim(), currencyCode)) {
      case MoneyParsed(:final value):
        return ReviewEditApplied(editAmount(value));
      case MoneyRejected(:final error):
        return ReviewEditRejected('That amount cannot be used: ${error.reason}.');
    }
  }

  ActionReviewState editAmount(MoneyValue value) => _copy(
        amount:
            amount.copyWith(decision: SlotDecision.edited, editedValue: value),
      );

  ActionReviewState unsetAmount() =>
      _copy(amount: amount.copyWith(decision: SlotDecision.unset));

  /// The user accepts a field's extracted value as correct.
  ActionReviewState confirmField(String key) {
    final field = effectiveField(key);
    if (field == null || !field.hasValue) return this;
    return _copy(confirmedFields: _withConfirmed(field));
  }

  /// The user corrects a field's value. Empty input is ignored — deleting a
  /// value is not a correction, and nothing here invents an empty fact.
  ActionReviewState editFieldValue(String key, String newValue) {
    final field = effectiveField(key);
    final trimmed = newValue.trim();
    if (field == null || trimmed.isEmpty) return this;
    return _copy(
      confirmedFields: {
        ...confirmedFields,
        key: field.confirmedByUser(trimmed),
      },
    );
  }

  ActionReviewState setStepIncluded(String id, bool included) => _copy(
        steps: [
          for (final step in steps)
            step.id == id ? step.copyWith(included: included) : step,
        ],
      );

  ActionReviewState editStepTitle(String id, String title) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return this;
    return _copy(
      steps: [
        for (final step in steps)
          step.id == id
              ? step.copyWith(title: trimmed, editedByUser: true)
              : step,
      ],
    );
  }

  ActionReviewState addManualStep(String title) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return this;
    return _copy(
      steps: [
        ...steps,
        ReviewStep(
          id: 'manual_${steps.length}',
          title: trimmed,
          order: steps.length,
          editedByUser: true,
        ),
      ],
    );
  }

  Map<String, ExtractedField> _withConfirmed(ExtractedField field) => {
        ...confirmedFields,
        if (field.hasValue) field.key: field.confirmedByUser(field.value!),
      };

  // ----------------------------------------------------------- confirming --

  /// Everything still standing between the user and a confirmed action.
  /// Empty exactly when [canConfirm].
  List<ReviewBlocker> get blockers => [
        if (title.trim().isEmpty)
          const ReviewBlocker('Give this action a title.'),
        if (due.needsDecision)
          const ReviewBlocker(
            'Choose which date is the real deadline, or leave it unset.',
          ),
        if (amount.needsDecision)
          const ReviewBlocker(
            'Choose which amount is right, or leave it unset.',
          ),
        if (steps.any((s) => s.included && s.title.trim().isEmpty))
          const ReviewBlocker('Steps you keep need a title.'),
      ];

  /// Deterministic: a pure function of this state, nothing else.
  bool get canConfirm => blockers.isEmpty;

  /// The single gate to a [ConfirmedActionDraft]. Throws [StateError] when
  /// [canConfirm] is false — callers must disable the CTA, not catch this.
  ConfirmedActionDraft confirm({DateTime? confirmedAt}) {
    if (!canConfirm) {
      throw StateError(
        'confirm() while blocked: ${blockers.map((b) => b.message).join(' ')}',
      );
    }
    final draftFields = effectiveFields;
    return ConfirmedActionDraft(
      sourceId: sourceId,
      title: title.trim(),
      summary: draft?.summary,
      category: draft?.category ?? ActionCategory.unknown,
      urgency: draft?.urgency ?? ActionUrgency.unknown,
      dueAt: due.effectiveValue,
      amount: amount.effectiveValue,
      recommendedNextStep: recommendedNextStep,
      // Only values a person could have seen and vetted survive: trustworthy
      // means grounded-and-trusted or explicitly user-confirmed. A needsReview
      // fact the user never touched is left behind, not smuggled through.
      facts: [
        for (final field in draftFields)
          if (field.isTrustworthy && field.hasValue)
            ConfirmedFact(
              key: field.key,
              label: field.label,
              value: field.value!,
              editedByUser: field.editedByUser,
            ),
      ],
      steps: [
        for (final step in steps)
          if (step.included)
            ConfirmedStep(
              title: step.title,
              description: step.description,
              dueAt: step.dueAt,
              order: step.order,
            ),
      ],
      manuallyCreated: mode == ReviewMode.manual,
      extractionEngine: mode == ReviewMode.manual ? null : original?.engine,
      extractionProducedAt:
          mode == ReviewMode.manual ? null : original?.producedAt,
      confirmedAt: confirmedAt ?? DateTime.now(),
    );
  }

  ActionReviewState _copy({
    String? title,
    bool? titleEditedByUser,
    ReviewDateSlot? due,
    ReviewAmountSlot? amount,
    List<ReviewStep>? steps,
    Map<String, ExtractedField>? confirmedFields,
  }) =>
      ActionReviewState._(
        mode: mode,
        sourceId: sourceId,
        original: original,
        title: title ?? this.title,
        titleEditedByUser: titleEditedByUser ?? this.titleEditedByUser,
        due: due ?? this.due,
        amount: amount ?? this.amount,
        steps: steps ?? this.steps,
        confirmedFields: confirmedFields ?? this.confirmedFields,
        recommendedNextStep: recommendedNextStep,
      );
}

/// Builds the review state a completed extraction should open with, or null
/// when the outcome has no draft (no-action and manual-entry outcomes get
/// their own screens states first; manual review is created on demand).
ActionReviewState? reviewStateFor(ExtractionResult result) =>
    result.hasDraft ? ActionReviewState.fromResult(result) : null;

/// Whether [item]'s text can be sent to extraction at all. Kept here so the
/// screen and tests agree on one rule.
bool sourceReadyForExtraction(SourceItem item) =>
    item.isProcessed && item.hasText;
