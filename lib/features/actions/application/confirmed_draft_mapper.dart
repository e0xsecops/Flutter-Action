import '../../extraction/domain/confirmed_action_draft.dart';
import '../domain/action_item.dart';

/// The one crossing from "reviewed proposal" to "durable record".
///
/// Everything here is a straight copy of values a person approved. Nothing
/// is enriched, inferred or re-scored: the draft's absence of a deadline is
/// stored as absence, its money object is stored exactly, and the only
/// provenance kept is origin plus when the review happened. Confidence
/// machinery does not survive the crossing by design.
ActionItem actionItemFromDraft(ConfirmedActionDraft draft, {DateTime? now}) {
  final createdAt = (now ?? DateTime.now()).toUtc();
  return ActionItem(
    id: draft.id,
    sourceId: draft.sourceId.isEmpty ? null : draft.sourceId,
    title: draft.title,
    summary: draft.summary,
    status: ActionStatus.active,
    urgency: draft.urgency,
    category: draft.category,
    dueAt: draft.dueAt == null ? null : ActionDue(draft.dueAt!),
    amount: draft.amount,
    recommendedNextStep: draft.recommendedNextStep,
    whyThisMatters: null,
    origin:
        draft.manuallyCreated ? ActionOrigin.manual : ActionOrigin.extraction,
    reviewedAt: draft.confirmedAt,
    createdAt: createdAt,
    updatedAt: createdAt,
    steps: [
      for (final step in draft.steps)
        ActionStepItem(
          title: step.title,
          order: step.order,
          description: step.description,
          dueAt: step.dueAt == null ? null : ActionDue(step.dueAt!),
        ),
    ],
    facts: [
      for (final fact in draft.facts)
        ActionFactItem(
          key: fact.key,
          label: fact.label,
          value: fact.value,
          editedByUser: fact.editedByUser,
        ),
    ],
  );
}
