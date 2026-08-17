import '../domain/action_draft.dart';
import '../domain/extracted_field.dart';
import '../domain/extraction_schema.dart';
import '../domain/money_value.dart';

/// Deterministic resolution of "the deadline" and "the amount" for display.
///
/// Day 6 showed that a live model names its keys freely — one run says
/// `due_date`, the next says `payment_deadline` — so [ActionDraft.groundedDueAt],
/// which looks up one exact key, can be null while a perfectly grounded
/// deadline sits in the field list. The review screen needs a single canonical
/// value to put at the top, and this resolver is the only permitted way to
/// choose it.
///
/// The rules are deliberately rigid:
///
///  * Only a **documented allowlist** of semantic keys qualifies. No fuzzy or
///    substring matching — a matcher loose enough to catch `payment_deadline`
///    by similarity would one day catch `previous_due_date` too.
///  * Only fields the validator marked trustworthy qualify: grounded, with a
///    successfully parsed typed value. An ungrounded date is a *question for
///    the user*, never a headline.
///  * Multiple qualifying candidates that disagree resolve to **nothing**.
///    Choosing between two dates is the user's decision; picking the first
///    would be fake certainty wearing a convenient face.
abstract final class CanonicalFieldKeys {
  /// Keys that may mean "the deadline of this action", in priority order.
  static const List<String> dueDate = [
    ExtractionFieldKeys.dueDate, // 'due_date'
    'deadline',
    'payment_due_date',
    'payment_deadline',
    'renewal_date',
  ];

  /// Keys that may mean "the amount this action is about", in priority order.
  static const List<String> amount = [
    ExtractionFieldKeys.amount, // 'amount'
    'amount_due',
    'total_due',
    'total_amount_due',
    'payment_amount',
    'premium_due',
  ];
}

/// How the canonical lookup for one slot came out.
enum CanonicalStatus {
  /// Exactly one qualifying value (several fields agreeing count as one).
  resolved,

  /// Two or more qualifying fields disagree. The user must choose.
  ambiguous,

  /// Allowlisted fields exist, but none passed validation/grounding. The
  /// value on screen is a question, not a fact.
  unverified,

  /// No allowlisted field at all. Absence is a legitimate final answer —
  /// a missing deadline stays missing.
  absent,
}

/// The outcome of resolving one canonical slot over a draft's fields.
///
/// [candidates] carries whichever fields the status is *about*: the agreeing
/// fields when [CanonicalStatus.resolved], the disagreeing qualified fields
/// when [CanonicalStatus.ambiguous], the failed-validation fields when
/// [CanonicalStatus.unverified], and nothing when [CanonicalStatus.absent].
final class CanonicalSlot {
  const CanonicalSlot({
    required this.status,
    this.candidates = const [],
  });

  const CanonicalSlot.absent() : this(status: CanonicalStatus.absent);

  final CanonicalStatus status;
  final List<ExtractedField> candidates;

  /// The single agreed field. Non-null exactly when [status] is resolved.
  ExtractedField? get resolvedField =>
      status == CanonicalStatus.resolved ? candidates.first : null;

  bool get needsUserDecision =>
      status == CanonicalStatus.ambiguous || status == CanonicalStatus.unverified;
}

/// See the library comment for the rules. Stateless and total: never throws.
abstract final class CanonicalFieldResolver {
  /// The canonical deadline over [fields].
  ///
  /// A field qualifies when its key is allowlisted, its type is date-like,
  /// the validator produced a parsed [ExtractedField.dateValue], and the
  /// field is trustworthy (grounded, or already user-edited).
  static CanonicalSlot dueDate(List<ExtractedField> fields) => _resolve(
        fields,
        allowlist: CanonicalFieldKeys.dueDate,
        isTyped: (f) =>
            (f.valueType == ExtractedValueType.date ||
                f.valueType == ExtractedValueType.datetime) &&
            f.dateValue != null,
        valueOf: (f) => f.dateValue,
      );

  /// The canonical amount over [fields]. Qualification mirrors [dueDate],
  /// with [MoneyValue] equality deciding agreement — `210.00 GBP` in two
  /// fields is one answer, `210.00 GBP` and `210.00 USD` are two.
  static CanonicalSlot amount(List<ExtractedField> fields) => _resolve(
        fields,
        allowlist: CanonicalFieldKeys.amount,
        isTyped: (f) =>
            f.valueType == ExtractedValueType.money && f.moneyValue != null,
        valueOf: (f) => f.moneyValue,
      );

  static CanonicalSlot _resolve(
    List<ExtractedField> fields, {
    required List<String> allowlist,
    required bool Function(ExtractedField) isTyped,
    required Object? Function(ExtractedField) valueOf,
  }) {
    // Walk the allowlist in priority order so the representative of an
    // agreeing set is stable across runs regardless of provider field order.
    final family = <ExtractedField>[
      for (final key in allowlist)
        ...fields.where((f) => f.key == key && f.hasValue),
    ];
    if (family.isEmpty) return const CanonicalSlot.absent();

    final qualified =
        family.where((f) => isTyped(f) && f.isTrustworthy).toList();
    if (qualified.isEmpty) {
      return CanonicalSlot(
        status: CanonicalStatus.unverified,
        candidates: family,
      );
    }

    final distinct = <Object?>{for (final f in qualified) valueOf(f)};
    if (distinct.length > 1) {
      return CanonicalSlot(
        status: CanonicalStatus.ambiguous,
        candidates: family,
      );
    }

    // One qualified answer — but an *unqualified* family field that disagrees
    // still forces the question. Resolving over a visible conflict would be
    // silently choosing, exactly what this resolver exists to refuse. An
    // unqualified field agrees only when its typed value matches, or —
    // lacking one — its raw text matches the qualified field's.
    final representative = qualified.first;
    final contradicted = family.any((f) {
      if (qualified.contains(f)) return false;
      final typed = valueOf(f);
      if (typed != null) return typed != valueOf(representative);
      return f.value?.trim() != representative.value?.trim();
    });
    if (contradicted) {
      return CanonicalSlot(
        status: CanonicalStatus.ambiguous,
        candidates: family,
      );
    }
    return CanonicalSlot(
      status: CanonicalStatus.resolved,
      candidates: qualified,
    );
  }
}
