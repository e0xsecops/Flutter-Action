/// An amount of money, held in minor units so arithmetic and equality are
/// exact.
///
/// Doubles are not used anywhere near currency. `0.1 + 0.2` is the classic
/// example, but the failure that matters here is subtler: a bill for 1780.00
/// that round-trips as 1779.9999999999998 and is later rendered as "1,779.99"
/// would be the app quietly changing a number the user is expected to pay.
///
/// Parsing is deliberately strict and never "helpful". A string this class
/// cannot read with certainty is rejected rather than coerced, because a
/// misread amount is worse than a missing one: missing is visibly unknown,
/// misread looks like a fact.
library;

/// How many decimal places a currency actually has.
///
/// Most are 2. The exceptions are real and matter for correctness — a JPY
/// amount parsed as if it had minor units would be wrong by 100x.
const Map<String, int> _minorUnitDigits = {
  'JPY': 0,
  'KRW': 0,
  'VND': 0,
  'BHD': 3,
  'KWD': 3,
  'OMR': 3,
  'TND': 3,
};

/// Currencies this build accepts.
///
/// An allowlist rather than "any three letters": an unrecognised code almost
/// always means the model guessed at a symbol it could not read, and inventing
/// a currency changes what the user thinks they owe. BDT is present because the
/// primary device is in Bangladesh and real documents are denominated in it.
const Set<String> supportedCurrencies = {
  'AED',
  'AUD',
  'BDT',
  'BHD',
  'CAD',
  'CHF',
  'CNY',
  'DKK',
  'EUR',
  'GBP',
  'INR',
  'JPY',
  'KWD',
  'NOK',
  'NZD',
  'OMR',
  'PKR',
  'SAR',
  'SEK',
  'SGD',
  'USD',
};

/// Why a money string could not be turned into a [MoneyValue].
enum MoneyParseError {
  empty('no amount given'),
  malformed('the amount is not a plain number'),
  negative('a negative amount is not a payable sum'),
  tooManyDecimals('more decimal places than the currency has'),
  unsupportedCurrency('the currency code is not one we recognise'),
  outOfRange('the amount is implausibly large');

  const MoneyParseError(this.reason);

  final String reason;
}

/// The outcome of parsing. A sum type rather than a nullable return so callers
/// can report *why* an amount was rejected instead of silently dropping it.
sealed class MoneyParseResult {
  const MoneyParseResult();
}

final class MoneyParsed extends MoneyParseResult {
  const MoneyParsed(this.value);

  final MoneyValue value;
}

final class MoneyRejected extends MoneyParseResult {
  const MoneyRejected(this.error);

  final MoneyParseError error;
}

class MoneyValue {
  const MoneyValue({required this.amountMinor, required this.currencyCode});

  /// The amount in the currency's smallest unit — pence, cents, poisha.
  final int amountMinor;

  /// ISO-4217, uppercase, and always one of [supportedCurrencies].
  final String currencyCode;

  int get minorUnitDigits => _minorUnitDigits[currencyCode] ?? 2;

  /// Beyond this an "amount" is a misread reference number, not a sum of
  /// money. Ten billion major units is far above any household document and far
  /// below where int arithmetic gets uncomfortable.
  static const int _maxMinorUnits = 1000000000000;

  /// Parses an amount and currency as they arrive over the wire.
  ///
  /// Accepts digit grouping (`1,780.00`) because documents are written that
  /// way, but nothing else: no currency symbols, no trailing text, no
  /// parenthesised negatives, no locale guessing about whether `1.780` means
  /// one-point-seven-eight or one thousand seven hundred and eighty. That
  /// ambiguity is exactly the kind of thing this class must not resolve on its
  /// own, so it is rejected.
  static MoneyParseResult parse(String? amount, String? currency) {
    final code = currency?.trim().toUpperCase() ?? '';
    if (!supportedCurrencies.contains(code)) {
      return const MoneyRejected(MoneyParseError.unsupportedCurrency);
    }

    final raw = amount?.trim() ?? '';
    if (raw.isEmpty) return const MoneyRejected(MoneyParseError.empty);

    if (raw.startsWith('-')) {
      return const MoneyRejected(MoneyParseError.negative);
    }

    // Grouping separators are stripped only when they sit in plausible
    // positions; `1,7,80` is a misread, not a formatted number.
    final degrouped = raw.replaceAll(',', '');
    if (raw.contains(',') && !RegExp(r'^\d{1,3}(,\d{3})+(\.\d+)?$').hasMatch(raw)) {
      return const MoneyRejected(MoneyParseError.malformed);
    }

    if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(degrouped)) {
      return const MoneyRejected(MoneyParseError.malformed);
    }

    final digits = _minorUnitDigits[code] ?? 2;
    final parts = degrouped.split('.');
    final whole = parts[0];
    final fraction = parts.length > 1 ? parts[1] : '';

    if (fraction.length > digits) {
      return const MoneyRejected(MoneyParseError.tooManyDecimals);
    }

    final padded = fraction.padRight(digits, '0');
    final combined = int.tryParse('$whole$padded');
    if (combined == null || combined > _maxMinorUnits) {
      return const MoneyRejected(MoneyParseError.outOfRange);
    }

    return MoneyParsed(MoneyValue(amountMinor: combined, currencyCode: code));
  }

  /// The amount as it appeared, without a currency symbol.
  ///
  /// Symbol placement and thousands separators are a presentation concern that
  /// depends on the user's locale; this is the neutral form used for storage,
  /// comparison and evidence matching.
  String get plainAmount {
    final digits = minorUnitDigits;
    if (digits == 0) return amountMinor.toString();

    final text = amountMinor.toString().padLeft(digits + 1, '0');
    final split = text.length - digits;
    return '${text.substring(0, split)}.${text.substring(split)}';
  }

  Map<String, dynamic> toJson() => {
        'amountMinor': amountMinor,
        'currencyCode': currencyCode,
      };

  static MoneyValue? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final minor = (json['amountMinor'] as num?)?.toInt();
    final code = json['currencyCode'] as String?;
    if (minor == null || minor < 0 || code == null) return null;
    if (!supportedCurrencies.contains(code)) return null;
    return MoneyValue(amountMinor: minor, currencyCode: code);
  }

  @override
  bool operator ==(Object other) =>
      other is MoneyValue &&
      other.amountMinor == amountMinor &&
      other.currencyCode == currencyCode;

  @override
  int get hashCode => Object.hash(amountMinor, currencyCode);

  @override
  String toString() => '$plainAmount $currencyCode';
}
