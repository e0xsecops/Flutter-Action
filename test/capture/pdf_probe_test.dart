/// Reading a PDF's shape without a PDF library.
///
/// Most of these are about the answer being allowed to be "unknown". A page
/// count appears in a sentence about spending the user's money — "4 pages will
/// be analysed using your OpenAI connection" — so a confident wrong number is
/// worse than an honest vaguer one.
library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:action_app/features/capture/domain/pdf_probe.dart';
import 'package:flutter_test/flutter_test.dart';

Uint8List _pdf(String body) => Uint8List.fromList(latin1.encode(body));

/// A minimal well-formed PDF skeleton with an explicit page tree.
String _withPageTree(int count, {int markers = 0}) {
  final pages = List.generate(
    markers,
    (i) => '${i + 4} 0 obj\n<< /Type /Page /Parent 3 0 R >>\nendobj\n',
  ).join();
  return '%PDF-1.7\n'
      '3 0 obj\n<< /Type /Pages /Kids [] /Count $count >>\nendobj\n'
      '$pages'
      'trailer\n<< /Root 1 0 R >>\nstartxref\n0\n%%EOF\n';
}

void main() {
  group('what it refuses', () {
    test('bytes that are not a PDF', () {
      expect(
        PdfProbe.probe(_pdf('just some text')).rejection,
        PdfRejection.notAPdf,
      );
    });

    test('something far too short to be one', () {
      expect(
        PdfProbe.probe(Uint8List.fromList([0x25, 0x50])).rejection,
        PdfRejection.notAPdf,
      );
    });

    test('a PNG that has been renamed', () {
      final png = Uint8List.fromList(
        [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, ...List.filled(40, 0)],
      );

      expect(PdfProbe.probe(png).rejection, PdfRejection.notAPdf);
    });

    test('a password-protected PDF', () {
      // Action has no password and will not ask for one in order to send the
      // file somewhere else.
      final encrypted = _pdf(
        '%PDF-1.6\ntrailer\n<< /Encrypt 9 0 R /Root 1 0 R >>\n%%EOF\n',
      );

      expect(PdfProbe.probe(encrypted).rejection, PdfRejection.encrypted);
      expect(PdfProbe.probe(encrypted).isUsable, isFalse);
    });

    test('a truncated PDF, which has no trailer', () {
      final cut = _pdf('%PDF-1.7\n3 0 obj\n<< /Type /Pages /Count 4 >>\n');

      expect(PdfProbe.probe(cut).rejection, PdfRejection.damaged);
    });

    test('every rejection has something to say', () {
      for (final reason in PdfRejection.values) {
        expect(describePdfRejection(reason), isNotEmpty);
      }
    });
  });

  group('what it reads', () {
    test('the version from the header', () {
      expect(PdfProbe.probe(_pdf(_withPageTree(3))).version, '1.7');
    });

    test('the page count from the page tree root', () {
      expect(PdfProbe.probe(_pdf(_withPageTree(4))).pageCount, 4);
    });

    test('the linearization dictionary, which states it unambiguously', () {
      final linearized = _pdf(
        '%PDF-1.5\n'
        '1 0 obj\n<< /Linearized 1 /L 12345 /O 6 /E 900 /N 12 /T 11000 >>\n'
        'endobj\ntrailer\n<< /Root 1 0 R >>\n%%EOF\n',
      );

      expect(PdfProbe.probe(linearized).pageCount, 12);
    });

    test('the root count, not a nested subtree count', () {
      // Nested page-tree nodes carry their own counts; the root is the largest.
      final nested = _pdf(
        '%PDF-1.7\n'
        '3 0 obj\n<< /Type /Pages /Kids [4 0 R 5 0 R] /Count 9 >>\nendobj\n'
        '4 0 obj\n<< /Type /Pages /Kids [] /Count 4 >>\nendobj\n'
        '5 0 obj\n<< /Type /Pages /Kids [] /Count 5 >>\nendobj\n'
        'trailer\n<< /Root 1 0 R >>\n%%EOF\n',
      );

      expect(PdfProbe.probe(nested).pageCount, 9);
    });

    test('page objects alone, for a small document', () {
      final markersOnly = _pdf(
        '%PDF-1.4\n'
        '4 0 obj\n<< /Type /Page /Parent 3 0 R >>\nendobj\n'
        '5 0 obj\n<< /Type /Page /Parent 3 0 R >>\nendobj\n'
        'trailer\n<< /Root 1 0 R >>\n%%EOF\n',
      );

      expect(PdfProbe.probe(markersOnly).pageCount, 2);
    });

    test('/Type /Pages is not counted as a page', () {
      final one = _pdf(
        '%PDF-1.4\n'
        '3 0 obj\n<< /Type /Pages /Kids [4 0 R] >>\nendobj\n'
        '4 0 obj\n<< /Type /Page /Parent 3 0 R >>\nendobj\n'
        'trailer\n<< /Root 1 0 R >>\n%%EOF\n',
      );

      expect(PdfProbe.probe(one).pageCount, 1);
    });

    test('a count and its markers agreeing is reported', () {
      expect(PdfProbe.probe(_pdf(_withPageTree(3, markers: 3))).pageCount, 3);
    });
  });

  group('when it declines to answer', () {
    test('a page tree compressed into an object stream leaves nothing to find',
        () {
      // The common modern case, and the reason this returns null at all: the
      // structure is real but invisible in the raw bytes.
      final compressed = _pdf(
        '%PDF-1.7\n'
        '10 0 obj\n<< /Type /ObjStm /N 12 /First 88 /Filter /FlateDecode >>\n'
        'stream\n\x78\x9c\x01\x02\x03binary-nonsense\nendstream\nendobj\n'
        'trailer\n<< /Root 1 0 R >>\n%%EOF\n',
      );

      expect(PdfProbe.probe(compressed).isUsable, isTrue);
      expect(PdfProbe.probe(compressed).pageCount, isNull);
    });

    test('a count and its markers disagreeing wildly is not believed', () {
      // One of the two patterns has hit something that is not a page tree, and
      // there is no way to tell which — so neither is reported.
      final disagreeing = _pdf(_withPageTree(4, markers: 30));

      expect(PdfProbe.probe(disagreeing).pageCount, isNull);
    });

    test('an implausible count is not believed', () {
      final absurd = _pdf(
        '%PDF-1.7\n'
        '3 0 obj\n<< /Type /Pages /Kids [] /Count 999999 >>\nendobj\n'
        'trailer\n<< /Root 1 0 R >>\n%%EOF\n',
      );

      expect(PdfProbe.probe(absurd).pageCount, isNull);
    });

    test('a zero count is unknown, never zero', () {
      // Callers must read null as "do not claim a page count", not as "empty".
      final zero = _pdf(
        '%PDF-1.7\n'
        '3 0 obj\n<< /Type /Pages /Kids [] /Count 0 >>\nendobj\n'
        'trailer\n<< /Root 1 0 R >>\n%%EOF\n',
      );

      expect(PdfProbe.probe(zero).pageCount, isNull);
    });

    test('too many markers alone is not believed', () {
      final many = List.generate(
        80,
        (i) => '${i + 4} 0 obj\n<< /Type /Page >>\nendobj\n',
      ).join();

      expect(
        PdfProbe.probe(_pdf('%PDF-1.4\n$many\ntrailer\n%%EOF\n')).pageCount,
        isNull,
      );
    });
  });

  group('the sentence it offers', () {
    test('is singular for one page', () {
      final one = PdfProbe.probe(_pdf(_withPageTree(1)));

      expect(one.pageSentence, '1 page');
    });

    test('is plural for more', () {
      expect(PdfProbe.probe(_pdf(_withPageTree(6))).pageSentence, '6 pages');
    });

    test('is absent when the count is unknown, rather than saying zero', () {
      final unknown = PdfProbe.probe(_pdf(
        '%PDF-1.7\n<< /Type /ObjStm >>\ntrailer\n%%EOF\n',
      ));

      expect(unknown.pageCount, isNull);
      expect(unknown.pageSentence, isNull);
    });
  });

  group('robustness', () {
    test('a large file is handled without reading all of it', () {
      // The structures worth finding sit at the two ends; the middle is
      // skipped so this stays cheap enough to run before a picker closes.
      final filler = 'A' * (2 * 1024 * 1024);
      final big = _pdf(
        '%PDF-1.7\n'
        '3 0 obj\n<< /Type /Pages /Kids [] /Count 7 >>\nendobj\n'
        '$filler\n'
        'trailer\n<< /Root 1 0 R >>\nstartxref\n0\n%%EOF\n',
      );

      final result = PdfProbe.probe(big);

      expect(result.isUsable, isTrue);
      expect(result.pageCount, 7);
    });

    test('binary noise does not throw', () {
      final noisy = Uint8List.fromList([
        ...latin1.encode('%PDF-1.7\n'),
        ...List<int>.generate(4096, (i) => (i * 37) % 256),
        ...latin1.encode('\ntrailer\n%%EOF\n'),
      ]);

      expect(PdfProbe.probe(noisy).isUsable, isTrue);
    });

    test('an empty input is refused rather than crashing', () {
      expect(PdfProbe.probe(Uint8List(0)).rejection, PdfRejection.notAPdf);
    });
  });
}
