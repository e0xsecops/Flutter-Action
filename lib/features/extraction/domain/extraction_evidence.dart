import 'extraction_schema.dart';

/// Where in the user's own document a claim came from.
///
/// This is the load-bearing piece of day 5. Every value the app is willing to
/// show as a fact has to point at the characters that support it, so that day 6
/// can highlight them and the user can check the app's work rather than take it
/// on faith.
///
/// The critical design decision: **the offsets are ours, not the model's.**
/// A provider returns [quote] — the text it says supports the value — and
/// nothing else about position. [start] and [end] are filled in by
/// [EvidenceResolver] searching our own copy of the source text. A model-
/// supplied character range cannot be verified without doing that search
/// anyway, and if it is wrong it points the highlight at innocent text, which
/// is worse than no highlight at all.
///
/// When the quote cannot be found, [grounding] is
/// [EvidenceGrounding.unresolved] and the value it supports must be demoted to
/// [FieldReviewState.needsReview]. There is no state in which the app claims
/// grounding it does not have.
class ExtractionEvidence {
  const ExtractionEvidence({
    required this.quote,
    required this.grounding,
    required this.sourceKind,
    this.start,
    this.end,
    this.lineIndexes = const [],
  });

  /// An unresolvable quote, kept so the UI can still show what the model
  /// claimed and the user can judge it.
  const ExtractionEvidence.unresolved({
    required this.quote,
    required this.sourceKind,
  })  : grounding = EvidenceGrounding.unresolved,
        start = null,
        end = null,
        lineIndexes = const [];

  /// Exactly the text the provider offered as support, unedited.
  final String quote;

  final EvidenceGrounding grounding;
  final EvidenceSourceKind sourceKind;

  /// Half-open range into the *normalised source text*, resolved client-side.
  /// Null whenever [grounding] is unresolved.
  final int? start;
  final int? end;

  /// Indexes into the OCR line list, where the quote could be tied to specific
  /// recognised lines. Lets day 6 draw a box on the capture instead of only
  /// highlighting text. Empty for pasted text, which has no line geometry.
  final List<int> lineIndexes;

  bool get isGrounded => grounding.isResolved;

  bool get hasRange => start != null && end != null;

  Map<String, dynamic> toJson() => {
        'quote': quote,
        'grounding': grounding.name,
        'sourceKind': sourceKind.name,
        if (start != null) 'start': start,
        if (end != null) 'end': end,
        if (lineIndexes.isNotEmpty) 'lineIndexes': lineIndexes,
      };

  static ExtractionEvidence fromJson(Map<String, dynamic> json) {
    final grounding = EvidenceGrounding.fromName(json['grounding'] as String?);
    final start = (json['start'] as num?)?.toInt();
    final end = (json['end'] as num?)?.toInt();

    return ExtractionEvidence(
      quote: json['quote'] as String? ?? '',
      grounding: grounding,
      sourceKind: EvidenceSourceKind.fromName(json['sourceKind'] as String?),
      // A record claiming grounding without a usable range is not trusted on
      // the way back in either; the range is dropped and the caller can
      // re-resolve against the current source text.
      start: grounding.isResolved ? start : null,
      end: grounding.isResolved ? end : null,
      lineIndexes: (json['lineIndexes'] as List? ?? const [])
          .whereType<num>()
          .map((n) => n.toInt())
          .toList(),
    );
  }

  ExtractionEvidence copyWith({
    EvidenceGrounding? grounding,
    int? start,
    int? end,
    List<int>? lineIndexes,
  }) =>
      ExtractionEvidence(
        quote: quote,
        grounding: grounding ?? this.grounding,
        sourceKind: sourceKind,
        start: start ?? this.start,
        end: end ?? this.end,
        lineIndexes: lineIndexes ?? this.lineIndexes,
      );

  @override
  String toString() =>
      'ExtractionEvidence(${grounding.name}, "$quote"${hasRange ? ' @$start-$end' : ''})';
}
