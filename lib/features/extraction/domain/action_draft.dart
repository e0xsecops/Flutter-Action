import 'extracted_field.dart';
import 'extraction_evidence.dart';
import 'extraction_schema.dart';
import 'money_value.dart';

/// Field keys the app itself reasons about.
///
/// A model may return other keys and they are kept and shown, but only these
/// drive behaviour — a deadline reminder must never hinge on whether the model
/// happened to call something `due_date` or `payment_deadline` this time.
abstract final class ExtractionFieldKeys {
  static const dueDate = 'due_date';
  static const amount = 'amount';
  static const reference = 'reference';
  static const organization = 'organization';

  /// Keys with defined product meaning. Anything else is passthrough detail.
  static const known = {dueDate, amount, reference, organization};
}

/// One thing the user would have to do.
///
/// A step is a *draft*: it is shown for confirmation and never scheduled,
/// notified or completed on its own. Nothing here writes to a calendar.
class ActionStepDraft {
  const ActionStepDraft({
    required this.id,
    required this.title,
    required this.order,
    required this.reviewState,
    this.description,
    this.dueAt,
    this.evidence,
  });

  /// Stable within one extraction result, so the confirmation UI can track
  /// edits and reordering without matching on title text.
  final String id;

  final String title;
  final String? description;

  /// Only ever set when a date was both parseable and grounded. A step with a
  /// deadline the document does not state is precisely the invented obligation
  /// this layer exists to prevent.
  final DateTime? dueAt;

  final int order;
  final ExtractionEvidence? evidence;
  final FieldReviewState reviewState;

  bool get isGrounded => evidence?.isGrounded ?? false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'order': order,
        'reviewState': reviewState.name,
        if (description != null) 'description': description,
        if (dueAt != null) 'dueAt': dueAt!.toIso8601String(),
        if (evidence != null) 'evidence': evidence!.toJson(),
      };

  static ActionStepDraft fromJson(Map<String, dynamic> json) => ActionStepDraft(
        id: json['id'] as String? ?? '',
        title: json['title'] as String? ?? '',
        order: (json['order'] as num?)?.toInt() ?? 0,
        reviewState: FieldReviewState.fromName(json['reviewState'] as String?),
        description: json['description'] as String?,
        dueAt: DateTime.tryParse(json['dueAt'] as String? ?? ''),
        evidence: json['evidence'] is Map<String, dynamic>
            ? ExtractionEvidence.fromJson(
                json['evidence'] as Map<String, dynamic>,
              )
            : null,
      );
}

/// What the app proposes, before anybody has agreed to it.
///
/// "Draft" is load-bearing. This type is the *only* thing extraction produces;
/// there is no path from here to a stored Action that does not pass through a
/// person. Day 5 deliberately stops at the draft so that the confirmation step
/// cannot be skipped by a later feature quietly persisting one of these.
class ActionDraft {
  const ActionDraft({
    required this.sourceId,
    required this.title,
    required this.summary,
    required this.category,
    required this.urgency,
    required this.reviewState,
    required this.fields,
    required this.steps,
    this.recommendedNextStep,
    this.urgencyReason,
    this.whyThisMatters,
    this.consequence,
    this.consequenceEvidence,
  });

  /// Which capture this came from. Provenance is never optional.
  final String sourceId;

  final String title;

  /// One or two sentences. Not a re-statement of the document.
  final String summary;

  final ActionCategory category;

  /// The single most useful thing to do next, in plain language.
  final String? recommendedNextStep;

  final ActionUrgency urgency;

  /// Why the urgency is what it is. The validator drops [urgency] back to
  /// [ActionUrgency.unknown] when this is absent: an urgency the app cannot
  /// explain is an urgency it should not assert.
  final String? urgencyReason;

  /// Why this matters to this person, grounded in the document.
  final String? whyThisMatters;

  /// What happens if nothing is done.
  ///
  /// Kept **only** when [consequenceEvidence] resolves against the source. A
  /// plausible-sounding consequence the document never stated ("your policy
  /// will be cancelled") is the highest-harm fabrication this product can make,
  /// so it is the most strictly gated claim in the model.
  final String? consequence;
  final ExtractionEvidence? consequenceEvidence;

  final List<ExtractedField> fields;
  final List<ActionStepDraft> steps;

  final ExtractionReviewState reviewState;

  ExtractedField? fieldFor(String key) {
    for (final field in fields) {
      if (field.key == key) return field;
    }
    return null;
  }

  /// The deadline, but only if the app can point at where it read it.
  ///
  /// An ungrounded date is still present in [fields] as
  /// [FieldReviewState.needsReview] so the user can see and fix it — it just
  /// does not get to be the draft's answer to "when is this due".
  DateTime? get groundedDueAt {
    final field = fieldFor(ExtractionFieldKeys.dueDate);
    if (field == null || !field.isTrustworthy) return null;
    return field.dateValue;
  }

  /// The amount owed, under the same rule as [groundedDueAt].
  MoneyValue? get groundedAmount {
    final field = fieldFor(ExtractionFieldKeys.amount);
    if (field == null || !field.isTrustworthy) return null;
    return field.moneyValue;
  }

  /// Fields the user must look at before this can become an Action.
  List<ExtractedField> get fieldsNeedingReview => fields
      .where((f) => f.reviewState == FieldReviewState.needsReview)
      .toList(growable: false);

  Map<String, dynamic> toJson() => {
        'sourceId': sourceId,
        'title': title,
        'summary': summary,
        'category': category.name,
        'urgency': urgency.name,
        'reviewState': reviewState.name,
        'fields': fields.map((f) => f.toJson()).toList(),
        'steps': steps.map((s) => s.toJson()).toList(),
        if (recommendedNextStep != null)
          'recommendedNextStep': recommendedNextStep,
        if (urgencyReason != null) 'urgencyReason': urgencyReason,
        if (whyThisMatters != null) 'whyThisMatters': whyThisMatters,
        if (consequence != null) 'consequence': consequence,
        if (consequenceEvidence != null)
          'consequenceEvidence': consequenceEvidence!.toJson(),
      };

  static ActionDraft fromJson(Map<String, dynamic> json) => ActionDraft(
        sourceId: json['sourceId'] as String? ?? '',
        title: json['title'] as String? ?? '',
        summary: json['summary'] as String? ?? '',
        category: ActionCategory.fromName(json['category'] as String?),
        urgency: ActionUrgency.fromName(json['urgency'] as String?),
        reviewState:
            ExtractionReviewState.fromName(json['reviewState'] as String?),
        fields: (json['fields'] as List? ?? const [])
            .whereType<Map<String, dynamic>>()
            .map(ExtractedField.fromJson)
            .toList(),
        steps: (json['steps'] as List? ?? const [])
            .whereType<Map<String, dynamic>>()
            .map(ActionStepDraft.fromJson)
            .toList(),
        recommendedNextStep: json['recommendedNextStep'] as String?,
        urgencyReason: json['urgencyReason'] as String?,
        whyThisMatters: json['whyThisMatters'] as String?,
        consequence: json['consequence'] as String?,
        consequenceEvidence: json['consequenceEvidence'] is Map<String, dynamic>
            ? ExtractionEvidence.fromJson(
                json['consequenceEvidence'] as Map<String, dynamic>,
              )
            : null,
      );
}
