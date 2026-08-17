import '../../extraction/domain/extraction_schema.dart';
import '../../extraction/domain/money_value.dart';

/// The durable Action schema version. Bump when the persisted shape changes
/// in a way an older build could misread; the database migration strategy
/// owns the upgrade path.
const int actionSchemaVersion = 1;

/// Where an Action came from. Deliberately the only provenance that
/// survives confirmation — the AI's confidence machinery served its purpose
/// during review and is not carried forward as if it were still true.
enum ActionOrigin {
  extraction,
  manual;

  static ActionOrigin fromName(String? name) => values.firstWhere(
        (v) => v.name == name,
        orElse: () => ActionOrigin.manual,
      );
}

/// The minimal lifecycle Day 8 supports. Home's visual buckets (needs
/// attention / upcoming / completed) are DERIVED from status plus timing —
/// they are presentation groupings, never stored states.
enum ActionStatus {
  active,
  completed,
  archived;

  static ActionStatus fromName(String? name) => values.firstWhere(
        (v) => v.name == name,
        orElse: () => ActionStatus.active,
      );
}

/// A deadline as the user confirmed it: a wall-clock reading, not an instant.
///
/// Documents state dates ("due by 30 August 2026"), sometimes with a time
/// ("appointment at 09:40"). Neither carries a timezone, and inventing one
/// would let a device-timezone change silently move a deadline — the exact
/// failure the strict parsers exist to prevent. So persistence keeps the
/// components exactly as confirmed and flags whether a time was meaningful.
///
/// [isDateOnly] is derived: a confirmed deadline at exactly midnight is
/// treated as date-only. A genuine midnight appointment would lose its
/// "00:00" display — accepted and documented, since nothing in the product
/// renders deadline times as anything finer than the date today.
final class ActionDue {
  ActionDue(this.wallClock) : isDateOnly = _isMidnight(wallClock);

  /// Rebuilds from the persisted wall-clock text. Total: malformed text
  /// returns null rather than inventing a date.
  static ActionDue? fromStorage(String? text) {
    if (text == null || text.isEmpty) return null;
    final parsed = DateTime.tryParse(text);
    if (parsed == null) return null;
    return ActionDue(parsed);
  }

  /// Local wall-clock components as confirmed; never converted to UTC.
  final DateTime wallClock;
  final bool isDateOnly;

  /// ISO-8601 without any zone suffix — components only, so the same date
  /// reads back identically on any device.
  String toStorage() => wallClock.toIso8601String();

  static bool _isMidnight(DateTime dt) =>
      dt.hour == 0 && dt.minute == 0 && dt.second == 0 && dt.millisecond == 0;

  @override
  bool operator ==(Object other) =>
      other is ActionDue && other.wallClock == wallClock;

  @override
  int get hashCode => wallClock.hashCode;

  @override
  String toString() => toStorage();
}

/// One step the user kept when confirming, persisted with its Action.
final class ActionStepItem {
  const ActionStepItem({
    required this.title,
    required this.order,
    this.description,
    this.dueAt,
  });

  final String title;
  final String? description;
  final ActionDue? dueAt;
  final int order;
}

/// One reviewed fact carried along for reference (an account number, an
/// organisation). Values here passed the validator AND a person; whether the
/// person edited it is the only provenance kept.
final class ActionFactItem {
  const ActionFactItem({
    required this.key,
    required this.label,
    required this.value,
    required this.editedByUser,
  });

  final String key;
  final String label;
  final String value;
  final bool editedByUser;
}

/// A durable Action: the thing the user actually owns.
///
/// Separate from [ConfirmedActionDraft] on purpose — the draft is the output
/// of one review session; this is a record with a lifecycle. Nothing here
/// references extraction internals: no evidence, no review states, no raw
/// provider output. Money is exact minor units via [MoneyValue]; deadlines
/// are wall-clock [ActionDue] values.
final class ActionItem {
  const ActionItem({
    required this.id,
    required this.title,
    required this.status,
    required this.origin,
    required this.createdAt,
    required this.updatedAt,
    this.schemaVersion = actionSchemaVersion,
    this.sourceId,
    this.summary,
    this.urgency = ActionUrgency.unknown,
    this.category = ActionCategory.unknown,
    this.dueAt,
    this.amount,
    this.recommendedNextStep,
    this.whyThisMatters,
    this.reviewedAt,
    this.completedAt,
    this.archivedAt,
    this.steps = const [],
    this.facts = const [],
  });

  final String id;
  final int schemaVersion;

  /// Local linkage only — never mirrored. Null for manual actions, and left
  /// dangling (not cascaded) if the source is ever deleted.
  final String? sourceId;

  final String title;
  final String? summary;
  final ActionStatus status;
  final ActionUrgency urgency;
  final ActionCategory category;
  final ActionDue? dueAt;
  final MoneyValue? amount;
  final String? recommendedNextStep;
  final String? whyThisMatters;
  final ActionOrigin origin;

  /// When the person confirmed the underlying review; equals createdAt for
  /// Day-8 flows.
  final DateTime? reviewedAt;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  final DateTime? archivedAt;

  final List<ActionStepItem> steps;
  final List<ActionFactItem> facts;

  bool get isActive => status == ActionStatus.active;

  ActionItem copyWith({
    ActionStatus? status,
    DateTime? updatedAt,
    DateTime? completedAt,
    DateTime? archivedAt,
  }) =>
      ActionItem(
        id: id,
        schemaVersion: schemaVersion,
        sourceId: sourceId,
        title: title,
        summary: summary,
        status: status ?? this.status,
        urgency: urgency,
        category: category,
        dueAt: dueAt,
        amount: amount,
        recommendedNextStep: recommendedNextStep,
        whyThisMatters: whyThisMatters,
        origin: origin,
        reviewedAt: reviewedAt,
        createdAt: createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        completedAt: completedAt ?? this.completedAt,
        archivedAt: archivedAt ?? this.archivedAt,
        steps: steps,
        facts: facts,
      );
}
