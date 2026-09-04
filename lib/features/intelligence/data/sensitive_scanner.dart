/// Finds likely-sensitive strings in text, entirely on this device.
///
/// **Why local.** Sending a document to a third party in order to be told it
/// contains sensitive information would defeat the point of asking. Every
/// pattern here is deterministic, so it needs no model, no key and no network —
/// which also means this tool works for someone who has never connected a
/// provider.
///
/// **What it is not.** Not a guarantee. Pattern matching finds structured
/// identifiers well and free-form sensitive content poorly; it will miss things
/// and it will occasionally flag something harmless. The UI says so, and the
/// user confirms each match before it is redacted.
library;

/// What kind of thing was found. Drives the label and the replacement.
enum SensitiveKind {
  email,
  phone,
  paymentCard,
  iban,
  nationalId,
  postcode,
  accountNumber,
  reference,
  dateOfBirth,
  url,
}

String describeSensitiveKind(SensitiveKind kind) => switch (kind) {
      SensitiveKind.email => 'Email address',
      SensitiveKind.phone => 'Phone number',
      SensitiveKind.paymentCard => 'Payment card number',
      SensitiveKind.iban => 'Bank account (IBAN)',
      SensitiveKind.nationalId => 'National identity number',
      SensitiveKind.postcode => 'Postcode',
      SensitiveKind.accountNumber => 'Account number',
      SensitiveKind.reference => 'Reference number',
      SensitiveKind.dateOfBirth => 'Date of birth',
      SensitiveKind.url => 'Web address',
    };

/// One match, with where it sits so it can be replaced exactly.
class SensitiveMatch {
  const SensitiveMatch({
    required this.kind,
    required this.value,
    required this.start,
    required this.end,
  });

  final SensitiveKind kind;
  final String value;
  final int start;
  final int end;

  /// What replaces it. Keeps the shape so the document stays readable, without
  /// keeping enough to reconstruct the value.
  String get replacement => '[${describeSensitiveKind(kind).toUpperCase()}]';
}

abstract final class SensitiveScanner {
  static final _patterns = <SensitiveKind, RegExp>{
    SensitiveKind.email:
        RegExp(r'\b[\w.+-]+@[\w-]+\.[\w.-]{2,}\b', caseSensitive: false),
    // Deliberately before the generic account-number pattern: a 16-digit run is
    // far more likely to be a card than an account, and whichever pattern runs
    // first claims the span.
    SensitiveKind.paymentCard:
        RegExp(r'\b(?:\d[ -]?){13,19}\b'),
    SensitiveKind.iban:
        RegExp(r'\b[A-Z]{2}\d{2}[ ]?(?:[A-Z0-9]{4}[ ]?){2,7}[A-Z0-9]{1,4}\b'),
    SensitiveKind.url: RegExp(r'\bhttps?://[^\s<>"]+', caseSensitive: false),
    SensitiveKind.phone: RegExp(
      r'(?:\+\d{1,3}[\s-]?)?(?:\(\d{2,4}\)[\s-]?)?\d{3,5}[\s-]?\d{3,4}'
      r'(?:[\s-]?\d{3,4})?',
    ),
    SensitiveKind.dateOfBirth: RegExp(
      r'\b(?:date of birth|d\.?o\.?b\.?|born)\D{0,12}'
      r'(\d{1,2}[/-]\d{1,2}[/-]\d{2,4}|\d{4}-\d{2}-\d{2})',
      caseSensitive: false,
    ),
    // UK-shaped, which is what this app's fixtures and likely users produce.
    SensitiveKind.postcode: RegExp(
      r'\b[A-Z]{1,2}\d[A-Z\d]?\s?\d[A-Z]{2}\b',
      caseSensitive: false,
    ),
    SensitiveKind.nationalId:
        RegExp(r'\b[A-Z]{2}\s?\d{2}\s?\d{2}\s?\d{2}\s?[A-D]\b'),
    SensitiveKind.accountNumber:
        RegExp(r'\b(?:account|a/c|acct)\D{0,10}(\d[\d\s-]{5,})', caseSensitive: false),
    SensitiveKind.reference: RegExp(
      r'\b(?:ref(?:erence)?|policy|invoice|claim)\W{0,10}'
      r'([A-Z0-9][A-Z0-9/-]{4,})',
      caseSensitive: false,
    ),
  };

  /// Scan order. Specific patterns run before general ones so a span is claimed
  /// by the most precise description of it, and overlapping matches are dropped.
  static const _order = [
    SensitiveKind.email,
    SensitiveKind.url,
    SensitiveKind.iban,
    SensitiveKind.paymentCard,
    SensitiveKind.nationalId,
    SensitiveKind.dateOfBirth,
    SensitiveKind.accountNumber,
    SensitiveKind.reference,
    SensitiveKind.postcode,
    SensitiveKind.phone,
  ];

  static List<SensitiveMatch> scan(String text) {
    final claimed = <_Span>[];
    final matches = <SensitiveMatch>[];

    for (final kind in _order) {
      for (final match in _patterns[kind]!.allMatches(text)) {
        final start = match.start;
        final end = match.end;
        if (end - start < 4) continue;
        if (claimed.any((s) => s.overlaps(start, end))) continue;

        final value = text.substring(start, end).trim();
        if (value.isEmpty) continue;

        // A run of digits that fails the card checksum is almost certainly an
        // invoice or a reference, and calling it a payment card would erode
        // trust in every other match.
        if (kind == SensitiveKind.paymentCard && !_passesLuhn(value)) continue;

        claimed.add(_Span(start, end));
        matches.add(SensitiveMatch(
          kind: kind,
          value: value,
          start: start,
          end: end,
        ));
      }
    }

    matches.sort((a, b) => a.start.compareTo(b.start));
    return matches;
  }

  /// Produces a redacted copy. The original string is never modified.
  ///
  /// Only [selected] matches are replaced, so the user stays in control of what
  /// goes. Replacement runs back to front so earlier offsets stay valid.
  static String redact(String text, List<SensitiveMatch> selected) {
    final ordered = [...selected]..sort((a, b) => b.start.compareTo(a.start));
    final buffer = StringBuffer();
    var result = text;
    for (final match in ordered) {
      if (match.start < 0 || match.end > result.length) continue;
      result = result.replaceRange(match.start, match.end, match.replacement);
    }
    buffer.write(result);
    return buffer.toString();
  }

  /// The check that separates a card number from a long reference.
  static bool _passesLuhn(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 13 || digits.length > 19) return false;

    var sum = 0;
    var double = false;
    for (var i = digits.length - 1; i >= 0; i--) {
      var digit = digits.codeUnitAt(i) - 0x30;
      if (double) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      double = !double;
    }
    return sum % 10 == 0;
  }
}

class _Span {
  const _Span(this.start, this.end);
  final int start;
  final int end;

  bool overlaps(int otherStart, int otherEnd) =>
      otherStart < end && otherEnd > start;
}
