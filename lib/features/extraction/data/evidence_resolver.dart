import '../domain/extraction_evidence.dart';
import '../domain/extraction_input.dart';
import '../domain/extraction_schema.dart';

/// Locates a quoted piece of evidence in the user's own document.
///
/// This exists because a model's idea of *where* something is cannot be
/// trusted. It saw a copy of the text, it counts characters unreliably, and any
/// offset it returns would have to be checked against our copy to be worth
/// anything — at which point we have done the search ourselves and the model's
/// number is redundant. So the contract asks the provider for the quote only,
/// and every offset in the app is produced here.
///
/// Two tiers of match, and no third:
///
///  * [EvidenceGrounding.exact] — the quote appears verbatim.
///  * [EvidenceGrounding.normalized] — it appears after levelling case and
///    collapsing whitespace. Nothing else is touched. Notably *not* done:
///    fuzzy or edit-distance matching. "780.00" and "78O.OO" are one OCR
///    misread apart, and a matcher loose enough to bridge that gap is loose
///    enough to ground a value against text that does not support it.
///
/// Anything else is [EvidenceGrounding.unresolved], and the caller must demote
/// whatever depended on it.
class EvidenceResolver {
  EvidenceResolver(this.input)
      : _canonical = _CanonicalText.of(input.normalizedText);

  final ExtractionInput input;
  final _CanonicalText _canonical;

  /// A quote shorter than this cannot ground anything.
  ///
  /// "30" or "£5" would match in a dozen places in a bill, so a hit tells us
  /// nothing about whether the model read the right one. The contract asks for
  /// the surrounding phrase, not the bare value.
  static const int minimumQuoteLength = 3;

  ExtractionEvidence resolve(String? rawQuote) {
    final quote = (rawQuote ?? '').trim();
    final kind = input.evidenceSourceKind;

    if (quote.length < minimumQuoteLength) {
      return ExtractionEvidence.unresolved(quote: quote, sourceKind: kind);
    }

    final exact = input.normalizedText.indexOf(quote);
    if (exact >= 0) {
      return ExtractionEvidence(
        quote: quote,
        grounding: EvidenceGrounding.exact,
        sourceKind: kind,
        start: exact,
        end: exact + quote.length,
        lineIndexes: _linesFor(quote),
      );
    }

    final canonicalQuote = _CanonicalText.canonicalize(quote);
    if (canonicalQuote.isNotEmpty) {
      final at = _canonical.text.indexOf(canonicalQuote);
      if (at >= 0) {
        return ExtractionEvidence(
          quote: quote,
          grounding: EvidenceGrounding.normalized,
          sourceKind: kind,
          start: _canonical.sourceOffsetAt(at),
          end: _canonical.sourceEndAfter(at + canonicalQuote.length - 1),
          lineIndexes: _linesFor(quote),
        );
      }
    }

    return ExtractionEvidence.unresolved(quote: quote, sourceKind: kind);
  }

  /// Recognised lines the quote overlaps, so day 6 can highlight the capture
  /// itself and not just the text.
  ///
  /// Containment in either direction: a quote may sit inside one long line, or
  /// span several short ones.
  List<int> _linesFor(String quote) {
    if (!input.hasOcrGeometry) return const [];

    final canonicalQuote = _CanonicalText.canonicalize(quote);
    if (canonicalQuote.isEmpty) return const [];

    final matches = <int>[];
    for (final line in input.lines) {
      final canonicalLine = _CanonicalText.canonicalize(line.text);
      if (canonicalLine.length < 2) continue;
      if (canonicalQuote.contains(canonicalLine) ||
          canonicalLine.contains(canonicalQuote)) {
        matches.add(line.index);
      }
    }
    return matches;
  }
}

/// Whether a value is actually present in the quote offered as its evidence.
///
/// Catches the failure mode that grounding alone misses: a model returning a
/// real quote from the document alongside a value that quote does not contain.
/// "Premium due: 750.00" is perfectly groundable evidence — it just does not
/// support a claim of 780.00, and without this check that mismatch would sail
/// through as high confidence.
abstract final class EvidenceSupport {
  /// Types whose value should appear literally inside its own evidence.
  ///
  /// Free-form prose is excluded: a summary or a consequence is written by the
  /// model *about* the quote, so demanding literal containment there would flag
  /// correct output.
  static bool appliesTo(ExtractedValueType type) => switch (type) {
        ExtractedValueType.money ||
        ExtractedValueType.number ||
        ExtractedValueType.date ||
        ExtractedValueType.datetime ||
        ExtractedValueType.reference ||
        ExtractedValueType.person ||
        ExtractedValueType.organization ||
        ExtractedValueType.location =>
          true,
        ExtractedValueType.text ||
        ExtractedValueType.boolean ||
        ExtractedValueType.unknown =>
          false,
      };

  /// For dates, checks the day and year appear in the quote rather than the
  /// ISO string itself — documents write "30 September 2026", not "2026-09-30",
  /// and requiring the canonical form would reject every real date.
  static bool supportsDate(String quote, DateTime date) {
    final digits = _digitsOf(quote);
    final day = date.day.toString();
    final year = date.year.toString();
    return digits.contains(day) && digits.contains(year);
  }

  /// For money, compares digit runs so "1,780.00", "1780.00" and "1780" all
  /// count as support for the same sum.
  static bool supportsAmount(String quote, String plainAmount) {
    final digits = _digitsOf(quote);
    final full = _digitsOf(plainAmount);
    final whole = _digitsOf(plainAmount.split('.').first);
    if (full.isEmpty) return false;
    return digits.contains(full) || (whole.isNotEmpty && digits.contains(whole));
  }

  /// For everything else, alphanumeric containment: punctuation and spacing
  /// vary between how a document prints a reference and how a model repeats it,
  /// but the characters themselves must be there.
  static bool supportsLiteral(String quote, String value) {
    final haystack = _alphanumericOf(quote);
    final needle = _alphanumericOf(value);
    if (needle.isEmpty) return false;
    return haystack.contains(needle);
  }

  static String _digitsOf(String text) =>
      text.replaceAll(RegExp(r'[^0-9]'), '');

  static String _alphanumericOf(String text) =>
      text.toLowerCase().replaceAll(RegExp(r'[^0-9a-z]'), '');
}

/// A case-levelled, whitespace-collapsed copy of the source text that can still
/// say where each of its characters came from.
///
/// The offset table is what lets a relaxed match produce a range into the
/// *original* text, so a highlight lands on the real characters rather than on
/// a position in a transformed string that the user never sees.
class _CanonicalText {
  const _CanonicalText(this.text, this._offsets);

  final String text;

  /// `_offsets[i]` is the index in the source text that canonical character `i`
  /// came from.
  final List<int> _offsets;

  int sourceOffsetAt(int canonicalIndex) => _offsets[canonicalIndex];

  /// End of the source character that produced canonical index [canonicalIndex],
  /// as a half-open bound.
  int sourceEndAfter(int canonicalIndex) => _offsets[canonicalIndex] + 1;

  static _CanonicalText of(String source) {
    final chars = <String>[];
    final offsets = <int>[];
    var pendingSpace = false;

    for (var i = 0; i < source.length; i++) {
      final unit = source[i];

      if (_isWhitespace(unit)) {
        // Runs of whitespace collapse to one space, and leading whitespace is
        // dropped entirely. The space is only emitted once a non-space follows,
        // which also removes trailing whitespace without a second pass.
        if (chars.isNotEmpty) pendingSpace = true;
        continue;
      }

      if (pendingSpace) {
        chars.add(' ');
        // Attributed to this character's position: a highlight that starts on
        // the space would look like it began one character early.
        offsets.add(i);
        pendingSpace = false;
      }

      final lower = unit.toLowerCase();
      // Lowercasing must not change length, or every offset after it drifts.
      // The handful of characters that expand keep their original form instead.
      chars.add(lower.length == 1 ? lower : unit);
      offsets.add(i);
    }

    return _CanonicalText(chars.join(), offsets);
  }

  /// The same transformation, when only the string is needed.
  static String canonicalize(String source) => of(source).text;

  static bool _isWhitespace(String unit) =>
      unit == ' ' || unit == '\n' || unit == '\t' || unit == '\r';
}
