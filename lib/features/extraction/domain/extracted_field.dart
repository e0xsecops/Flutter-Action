import 'extraction_evidence.dart';
import 'extraction_schema.dart';
import 'money_value.dart';

/// One thing the app believes the document says.
///
/// A field carries its own provenance and its own uncertainty. That is the
/// whole contract: the UI never has to reach elsewhere to find out whether a
/// value can be shown as a fact, and there is no representable state in which a
/// value looks trustworthy while its evidence does not exist.
///
/// [value] is the canonical string form and is the thing displayed. The typed
/// sidecars [dateValue] and [moneyValue] are filled in **only** when the
/// validator parsed them successfully, so a field can hold "30 Sept 2026" as
/// text while [dateValue] stays null — visibly unparsed rather than quietly
/// turned into a date the app made up.
class ExtractedField {
  const ExtractedField({
    required this.key,
    required this.label,
    required this.valueType,
    required this.reviewState,
    this.value,
    this.evidence,
    this.dateValue,
    this.moneyValue,
    this.editedByUser = false,
  });

  /// A field the document simply does not contain.
  ///
  /// Exists so "we looked and it is not there" is representable as something
  /// other than an absent map entry. Unknown stays unknown, and stays visible.
  const ExtractedField.missing({
    required this.key,
    required this.label,
    this.valueType = ExtractedValueType.unknown,
  })  : value = null,
        evidence = null,
        dateValue = null,
        moneyValue = null,
        editedByUser = false,
        reviewState = FieldReviewState.missing;

  /// Stable machine key, e.g. `due_date`. Snake case, never shown to a user.
  final String key;

  /// What the user reads, e.g. "Payment due".
  final String label;

  /// Canonical display form. Null exactly when [reviewState] is
  /// [FieldReviewState.missing].
  final String? value;

  final ExtractedValueType valueType;
  final FieldReviewState reviewState;
  final ExtractionEvidence? evidence;

  /// Set only when [valueType] is a date type *and* the value parsed as strict
  /// ISO-8601. Null means unparsed, never "today".
  final DateTime? dateValue;

  /// Set only when [valueType] is money *and* both amount and currency passed
  /// validation.
  final MoneyValue? moneyValue;

  /// True once a person has typed or accepted this value. The only route to
  /// [FieldReviewState.confirmed].
  final bool editedByUser;

  /// Whether the evidence for this value was actually located in the source.
  bool get isGrounded => evidence?.isGrounded ?? false;

  /// Whether the UI may present this as a fact rather than a suggestion.
  ///
  /// User-confirmed values qualify without evidence: the person is the
  /// authority, and they may well be reading something the recogniser missed.
  bool get isTrustworthy =>
      editedByUser || (reviewState.isTrusted && isGrounded);

  bool get hasValue => (value ?? '').trim().isNotEmpty;

  /// Records a human decision. This is the only way [FieldReviewState.confirmed]
  /// is ever reached.
  ExtractedField confirmedByUser(String newValue) => ExtractedField(
        key: key,
        label: label,
        valueType: valueType,
        reviewState: FieldReviewState.confirmed,
        value: newValue,
        // The original evidence is kept even though the user has overridden the
        // value, so the confirmation screen can still show what the app had
        // read and where. Typed sidecars are dropped: they described the old
        // value and re-deriving them from free text here would be guessing.
        evidence: evidence,
        editedByUser: true,
      );

  ExtractedField copyWith({
    String? value,
    FieldReviewState? reviewState,
    ExtractionEvidence? evidence,
    DateTime? dateValue,
    MoneyValue? moneyValue,
    bool clearTypedValues = false,
  }) =>
      ExtractedField(
        key: key,
        label: label,
        valueType: valueType,
        reviewState: reviewState ?? this.reviewState,
        value: value ?? this.value,
        evidence: evidence ?? this.evidence,
        dateValue: clearTypedValues ? null : (dateValue ?? this.dateValue),
        moneyValue: clearTypedValues ? null : (moneyValue ?? this.moneyValue),
        editedByUser: editedByUser,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'label': label,
        'valueType': valueType.name,
        'reviewState': reviewState.name,
        if (value != null) 'value': value,
        if (evidence != null) 'evidence': evidence!.toJson(),
        if (dateValue != null) 'dateValue': dateValue!.toIso8601String(),
        if (moneyValue != null) 'moneyValue': moneyValue!.toJson(),
        if (editedByUser) 'editedByUser': true,
      };

  static ExtractedField fromJson(Map<String, dynamic> json) => ExtractedField(
        key: json['key'] as String? ?? '',
        label: json['label'] as String? ?? '',
        valueType: ExtractedValueType.fromName(json['valueType'] as String?),
        reviewState: FieldReviewState.fromName(json['reviewState'] as String?),
        value: json['value'] as String?,
        evidence: json['evidence'] is Map<String, dynamic>
            ? ExtractionEvidence.fromJson(
                json['evidence'] as Map<String, dynamic>,
              )
            : null,
        dateValue: DateTime.tryParse(json['dateValue'] as String? ?? ''),
        moneyValue:
            MoneyValue.fromJson(json['moneyValue'] as Map<String, dynamic>?),
        editedByUser: json['editedByUser'] as bool? ?? false,
      );

  @override
  String toString() =>
      'ExtractedField($key=${value ?? "—"}, ${reviewState.name})';
}
