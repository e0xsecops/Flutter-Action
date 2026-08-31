/// Checks that a rewrite did not quietly change the facts.
///
/// **Why this is local and not a prompt.** "Preserve every amount and date" is
/// in the instruction for every generative tool, and instructions are requests.
/// A model that rounds £284.50 to £285, or shifts a reference number by a
/// character while tidying a sentence, produces text that reads perfectly and
/// is wrong in the one way that matters — and the user, having asked for a
/// tidy-up, has no reason to re-read the numbers.
///
/// So the numbers are pulled out of both versions and compared. Anything in the
/// original that is not in the rewrite is reported. The prompt asks; this
/// decides.
library;

/// A fact present in the original that did not survive the rewrite.
class DroppedFact {
  const DroppedFact({required this.value, required this.kind});

  final String value;
  final DroppedFactKind kind;
}

enum DroppedFactKind { amount, date, reference, number }

abstract final class FactPreservation {
  /// Money, with or without a symbol, including thousands separators.
  static final RegExp _amount = RegExp(
    r'(?:[£$€₹৳]\s?\d[\d,.\s]*\d|\d[\d,]*\.\d{2})',
  );

  /// Dates in the forms documents actually use.
  static final RegExp _date = RegExp(
    r'\b(?:\d{4}-\d{2}-\d{2}'
    r'|\d{1,2}[/-]\d{1,2}[/-]\d{2,4}'
    r'|\d{1,2}\s+(?:January|February|March|April|May|June|July|August'
    r'|September|October|November|December)\s+\d{4})\b',
    caseSensitive: false,
  );

  /// Reference-shaped tokens: letters and digits joined by dashes or slashes,
  /// with at least one digit. `MTR-4471-08`, `INV/2026/114`.
  static final RegExp _reference = RegExp(
    r'\b(?=[A-Z0-9/-]*\d)[A-Z][A-Z0-9]*(?:[-/][A-Z0-9]+){1,}\b',
  );

  /// Any remaining run of digits long enough to be meaningful.
  ///
  /// Four or more, so ordinary counts ("3 documents") do not generate noise
  /// while account numbers and years do.
  static final RegExp _number = RegExp(r'\b\d{4,}\b');

  /// Facts in [original] that do not appear in [rewritten].
  ///
  /// Comparison is on normalised text, so a change of surrounding whitespace or
  /// a curly quote does not read as a dropped fact.
  static List<DroppedFact> check({
    required String original,
    required String rewritten,
  }) {
    final haystack = _normalise(rewritten);
    final seen = <String>{};
    final dropped = <DroppedFact>[];

    void scan(RegExp pattern, DroppedFactKind kind) {
      for (final match in pattern.allMatches(original)) {
        final raw = match.group(0);
        if (raw == null) continue;
        final value = raw.trim();
        if (value.isEmpty || !seen.add(value.toLowerCase())) continue;
        if (!haystack.contains(_normalise(value))) {
          dropped.add(DroppedFact(value: value, kind: kind));
        }
      }
    }

    // Order matters: an amount and a date can both contain digit runs, and
    // whichever is scanned first claims the token. Most specific first, so a
    // dropped amount is reported as an amount rather than as a bare number.
    scan(_amount, DroppedFactKind.amount);
    scan(_date, DroppedFactKind.date);
    scan(_reference, DroppedFactKind.reference);
    scan(_number, DroppedFactKind.number);

    return dropped;
  }

  /// What the user is told when facts went missing.
  static String describe(List<DroppedFact> dropped) {
    if (dropped.isEmpty) return '';
    final shown = dropped.take(4).map((d) => d.value).join(', ');
    final extra = dropped.length > 4 ? ' and ${dropped.length - 4} more' : '';
    return dropped.length == 1
        ? 'The rewrite no longer contains $shown. Check it before using this.'
        : 'The rewrite no longer contains $shown$extra. Check it before using '
            'this.';
  }

  /// Folds the differences that are not changes of fact.
  ///
  /// Whitespace, case, and the separators a model reflows while tidying —
  /// £1,200 and £1200 are the same amount, and reporting that as a dropped
  /// fact would train the user to ignore the warning.
  static String _normalise(String text) {
    final buffer = StringBuffer();
    for (final rune in text.toLowerCase().runes) {
      final char = String.fromCharCode(rune);
      if (char == ',' || char == ' ' || char == '\n' || char == '\t') continue;
      buffer.write(switch (char) {
        '‘' || '’' => "'",
        '“' || '”' => '"',
        '–' || '—' => '-',
        _ => char,
      });
    }
    return buffer.toString();
  }
}
