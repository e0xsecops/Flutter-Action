import 'package:action_app/features/capture/domain/text_normalizer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('normalizeOcrText', () {
    test('collapses runs of spaces and tabs', () {
      expect(normalizeOcrText('Amount    due\t\t780'), 'Amount due 780');
    });

    test('trims each line and the whole block', () {
      expect(
        normalizeOcrText('  Policy  \n   NM-4471   \n'),
        'Policy\nNM-4471',
      );
    });

    test('keeps line structure, because rows carry meaning', () {
      // Merging these would invent an association between a label and a value
      // that might belong to a different row of a table.
      expect(
        normalizeOcrText('Electricity\n132.55\nVAT\n8.05'),
        'Electricity\n132.55\nVAT\n8.05',
      );
    });

    test('collapses excess blank lines but preserves paragraph breaks', () {
      expect(normalizeOcrText('A\n\n\n\n\nB'), 'A\n\nB');
    });

    test('normalises CRLF and CR to LF', () {
      expect(normalizeOcrText('A\r\nB\rC'), 'A\nB\nC');
    });

    test('turns lookalike spaces into ordinary spaces', () {
      // Non-breaking and thin spaces defeat naive matching during grounding.
      expect(normalizeOcrText('1 780'), '1 780');
      expect(normalizeOcrText('1 780'), '1 780');
      expect(normalizeOcrText('GB29 NWBK'), 'GB29 NWBK');
    });

    test('strips zero-width characters', () {
      expect(normalizeOcrText('30​September'), '30September');
      expect(normalizeOcrText('﻿Policy'), 'Policy');
    });

    test('never alters dates, amounts, or reference numbers', () {
      const facts = [
        '30/09/2026',
        '2026-08-14',
        '14 Sep 2026',
        '1,234.56',
        '1.234,56',
        '780.00',
        'NM-4471-882',
        'GB29 NWBK 6016 1331 9268 19',
        '£45.00',
        '09:15',
      ];

      for (final fact in facts) {
        expect(
          normalizeOcrText(fact),
          fact,
          reason: 'normalisation must not rewrite source facts',
        );
      }
    });

    test('leaves an empty input empty', () {
      expect(normalizeOcrText(''), '');
      expect(normalizeOcrText('   \n\n  '), '');
    });

    test('does not join wrapped lines', () {
      // Tempting, but a break between a label and a value is ambiguous: it may
      // be wrapping, or it may be two unrelated cells.
      expect(
        normalizeOcrText('Amount due\n780.00'),
        'Amount due\n780.00',
      );
    });
  });
}
