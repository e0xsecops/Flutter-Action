import 'package:action_app/features/extraction/domain/money_value.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MoneyValue parsed(String amount, String currency) {
    final result = MoneyValue.parse(amount, currency);
    expect(result, isA<MoneyParsed>(), reason: 'expected "$amount" to parse');
    return (result as MoneyParsed).value;
  }

  MoneyParseError rejected(String? amount, String? currency) {
    final result = MoneyValue.parse(amount, currency);
    expect(result, isA<MoneyRejected>(), reason: 'expected "$amount" to be rejected');
    return (result as MoneyRejected).error;
  }

  group('MoneyValue parsing', () {
    test('reads a plain decimal into exact minor units', () {
      expect(parsed('780.00', 'GBP').amountMinor, 78000);
      expect(parsed('780', 'GBP').amountMinor, 78000);
      expect(parsed('780.5', 'GBP').amountMinor, 78050);
      expect(parsed('0.01', 'GBP').amountMinor, 1);
    });

    test('accepts digit grouping only where it is really grouping', () {
      expect(parsed('1,780.00', 'GBP').amountMinor, 178000);
      expect(parsed('1,204,000', 'GBP').amountMinor, 120400000);

      // "1,7,80" is a misread, not a formatted number.
      expect(rejected('1,7,80', 'GBP'), MoneyParseError.malformed);
      expect(rejected('1,78', 'GBP'), MoneyParseError.malformed);
    });

    test('refuses anything that would need a guess', () {
      expect(rejected('£780.00', 'GBP'), MoneyParseError.malformed);
      expect(rejected('780.00 due', 'GBP'), MoneyParseError.malformed);
      expect(rejected('seven hundred', 'GBP'), MoneyParseError.malformed);
      expect(rejected('', 'GBP'), MoneyParseError.empty);
      expect(rejected(null, 'GBP'), MoneyParseError.empty);
    });

    test('refuses a negative sum where a payable amount was expected', () {
      expect(rejected('-780.00', 'GBP'), MoneyParseError.negative);
    });

    test('honours each currency\'s real minor-unit count', () {
      // JPY has none — parsing it as if it had two would be wrong by 100x.
      expect(parsed('4500', 'JPY').amountMinor, 4500);
      expect(parsed('4500', 'JPY').plainAmount, '4500');
      expect(rejected('45.00', 'JPY'), MoneyParseError.tooManyDecimals);

      expect(parsed('12.345', 'KWD').amountMinor, 12345);
      expect(rejected('780.001', 'GBP'), MoneyParseError.tooManyDecimals);
    });

    test('only accepts currencies the app actually supports', () {
      expect(rejected('780.00', 'XYZ'), MoneyParseError.unsupportedCurrency);
      expect(rejected('780.00', null), MoneyParseError.unsupportedCurrency);
      expect(rejected('780.00', ''), MoneyParseError.unsupportedCurrency);

      // The primary device is in Bangladesh; BDT is not optional.
      expect(parsed('1500.00', 'BDT').currencyCode, 'BDT');
      // Case is normalised, since documents and models are inconsistent.
      expect(parsed('10.00', 'gbp').currencyCode, 'GBP');
    });

    test('rejects an amount too large to be a household sum', () {
      expect(rejected('99999999999999', 'GBP'), MoneyParseError.outOfRange);
    });
  });

  group('MoneyValue representation', () {
    test('renders the neutral form used for storage and matching', () {
      expect(parsed('780', 'GBP').plainAmount, '780.00');
      expect(parsed('0.05', 'GBP').plainAmount, '0.05');
      expect(parsed('1780.5', 'GBP').toString(), '1780.50 GBP');
    });

    test('compares by value, not identity', () {
      expect(parsed('780.00', 'GBP'), parsed('780', 'GBP'));
      expect(parsed('780.00', 'GBP'), isNot(parsed('780.00', 'USD')));
      expect(parsed('780.00', 'GBP').hashCode, parsed('780', 'GBP').hashCode);
    });

    test('survives a JSON round trip and refuses a corrupt record', () {
      final original = parsed('1204.55', 'GBP');
      expect(MoneyValue.fromJson(original.toJson()), original);

      expect(MoneyValue.fromJson(null), isNull);
      expect(
        MoneyValue.fromJson({'amountMinor': -5, 'currencyCode': 'GBP'}),
        isNull,
      );
      expect(
        MoneyValue.fromJson({'amountMinor': 500, 'currencyCode': 'XYZ'}),
        isNull,
      );
    });
  });
}
