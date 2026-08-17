import 'extraction_schema.dart';
import 'money_value.dart';

/// One fact the user has explicitly accepted into a confirmed action.
///
/// Deliberately thin: no evidence, no review state, no provenance machinery.
/// By the time a value arrives here it has been through the validator *and*
/// a person; what remains worth recording is the value itself and whether
/// the person changed it on the way through.
final class ConfirmedFact {
  const ConfirmedFact({
    required this.key,
    required this.label,
    required this.value,
    required this.editedByUser,
  });

  final String key;
  final String label;
  final String value;

  /// True when the user typed or corrected this value; false when they
  /// accepted the extracted value as it stood. Either way a person approved
  /// it — this flag only records which kind of approval.
  final bool editedByUser;
}

/// A step the user kept when confirming.
final class ConfirmedStep {
  const ConfirmedStep({
    required this.title,
    required this.order,
    this.description,
    this.dueAt,
  });

  final String title;
  final String? description;
  final DateTime? dueAt;
  final int order;
}

/// The output boundary of review: an action as a *person* approved it.
///
/// This is the only shape allowed to leave the review flow, and it is built in
/// exactly one place — `ActionReviewState.confirm()` — which refuses to run
/// while anything critical is unresolved. Nothing here refers back to
/// [ExtractionResult]'s live objects, so no later mutation of review state or
/// re-extraction can reach inside a draft that has been confirmed: AI produced
/// a proposal, the user produced this.
///
/// Day 8 owns persistence. Until then a confirmed draft lives only in memory,
/// which is a feature: there is no path by which it can become a stored Action
/// without the storage layer seeing it created here.
final class ConfirmedActionDraft {
  const ConfirmedActionDraft({
    required this.id,
    required this.sourceId,
    required this.title,
    required this.category,
    required this.urgency,
    required this.confirmedAt,
    required this.manuallyCreated,
    this.summary,
    this.dueAt,
    this.amount,
    this.recommendedNextStep,
    this.facts = const [],
    this.steps = const [],
    this.extractionEngine,
    this.extractionProducedAt,
  });

  /// The durable Action's identity, minted when the draft is produced —
  /// BEFORE any persistence. Storage inserts idempotently on this id, which
  /// is what makes a double-tapped confirm button, or a retried save,
  /// yield exactly one Action.
  final String id;

  final String sourceId;

  /// Non-empty by construction — `confirm()` will not produce a draft
  /// without one.
  final String title;

  final String? summary;
  final ActionCategory category;
  final ActionUrgency urgency;

  /// Null means the user reviewed the deadline question and the answer is
  /// "there is none" — an explicit decision, not a gap.
  final DateTime? dueAt;

  /// Same contract as [dueAt]: null is a reviewed absence.
  final MoneyValue? amount;

  final String? recommendedNextStep;
  final List<ConfirmedFact> facts;
  final List<ConfirmedStep> steps;

  /// True when this action was typed in by hand because extraction could not
  /// produce a usable draft. [extractionEngine] is null in that case.
  final bool manuallyCreated;

  /// Which engine produced the underlying proposal, for audit — e.g.
  /// 'firebase_ai/googleai/gemini-3.6-flash' or 'fixture'.
  final String? extractionEngine;
  final DateTime? extractionProducedAt;

  final DateTime confirmedAt;

  /// How many of the confirmed values the user actively edited.
  int get editedFactCount => facts.where((f) => f.editedByUser).length;
}
