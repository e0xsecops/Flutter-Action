/// Text preparation for matching.
///
/// The rule that governs everything here: search may be **forgiving about
/// presentation**, never about facts. Case and surrounding whitespace are
/// presentation. Digits, punctuation inside an identifier, and the difference
/// between `58.20` and `5820` are facts, and none of them is touched.
abstract final class SearchNormalizer {
  /// Case-folded, whitespace-collapsed, trimmed — and nothing else.
  ///
  /// `toLowerCase` is Unicode-aware in Dart and leaves scripts without case
  /// (Bengali, Arabic, CJK) exactly as they were, which is why it is safe to
  /// apply unconditionally.
  static String fold(String value) =>
      value.trim().replaceAll(_whitespace, ' ').toLowerCase();

  static final _whitespace = RegExp(r'\s+');

  /// Whether [haystack] contains [needle], comparing folded text.
  static bool contains(String haystack, String needle) =>
      fold(haystack).contains(fold(needle));

  static bool equals(String haystack, String needle) =>
      fold(haystack) == fold(needle);

  static bool startsWith(String haystack, String needle) =>
      fold(haystack).startsWith(fold(needle));

  /// Where [needle] appears in the ORIGINAL [haystack], or -1.
  ///
  /// Folding can change length (collapsing runs of whitespace), so an index
  /// found in folded text does not necessarily point at the same place in the
  /// original. This searches the original case-insensitively without altering
  /// its length, so any index it returns is real. When the two disagree —
  /// because whitespace differed — it gives up rather than highlighting the
  /// wrong characters.
  static int indexIn(String haystack, String needle) {
    final trimmedNeedle = needle.trim();
    if (trimmedNeedle.isEmpty) return -1;
    final lowerHaystack = haystack.toLowerCase();
    final lowerNeedle = trimmedNeedle.toLowerCase();
    // Same length after lowering on both sides, or offsets would be lies.
    if (lowerHaystack.length != haystack.length ||
        lowerNeedle.length != trimmedNeedle.length) {
      return -1;
    }
    return lowerHaystack.indexOf(lowerNeedle);
  }

  /// A bounded window around a match, so a result never dumps a whole OCR
  /// body onto the screen.
  ///
  /// Returns the snippet and where the match sits inside it.
  static (String snippet, int? start, int? end) snippetAround(
    String text,
    String needle, {
    int window = 90,
  }) {
    final collapsed = text.replaceAll(_whitespace, ' ').trim();
    final at = indexIn(collapsed, needle);
    if (at < 0) {
      // Found by folded comparison but not locatable exactly: show the head of
      // the text with no highlight rather than pretending to know where.
      final head =
          collapsed.length <= window ? collapsed : '${collapsed.substring(0, window)}…';
      return (head, null, null);
    }

    final needleLength = needle.trim().length;
    final before = (window / 3).round();
    var start = at - before;
    if (start < 0) start = 0;
    var end = start + window;
    if (end > collapsed.length) {
      end = collapsed.length;
      start = end - window < 0 ? 0 : end - window;
    }

    final prefix = start > 0 ? '…' : '';
    final suffix = end < collapsed.length ? '…' : '';
    final snippet = '$prefix${collapsed.substring(start, end)}$suffix';

    final highlightStart = at - start + prefix.length;
    final highlightEnd = highlightStart + needleLength;
    if (highlightStart < 0 || highlightEnd > snippet.length) {
      return (snippet, null, null);
    }
    return (snippet, highlightStart, highlightEnd);
  }
}
