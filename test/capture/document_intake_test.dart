/// Whether a document Action was handed can be used.
///
/// The order of the two checks is the point. First "is this a PDF", answered
/// from the leading bytes — a file called `statement.pdf` is a claim by
/// whoever named it. Then "can it be read", which is where an encrypted or
/// truncated file is refused with its own sentence rather than as a generic
/// failure.
library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:action_app/features/capture/domain/document_intake.dart';
import 'package:flutter_test/flutter_test.dart';

Uint8List _b(String text) => Uint8List.fromList(latin1.encode(text));

Uint8List _magic(List<int> bytes) {
  final out = Uint8List(32);
  for (var i = 0; i < bytes.length && i < 32; i++) {
    out[i] = bytes[i];
  }
  return out;
}

const _goodPdf = '%PDF-1.7\n'
    '3 0 obj\n<< /Type /Pages /Kids [] /Count 4 >>\nendobj\n'
    'trailer\n<< /Root 1 0 R >>\nstartxref\n0\n%%EOF\n';

Object _validate({
  String content = _goodPdf,
  Uint8List? header,
  String? name = 'statement.pdf',
  int? size,
}) {
  final bytes = _b(content);
  return DocumentIntake.validate(
    path: '/data/data/app/files/doc.pdf',
    declaredName: name,
    sizeBytes: size ?? bytes.length,
    header: header ?? _b(content.substring(0, 32.clamp(0, content.length))),
    content: bytes,
  );
}

void main() {
  group('what it accepts', () {
    test('a readable PDF, with its page count', () {
      final doc = _validate() as AcceptedDocument;

      expect(doc.pageCount, 4);
      expect(doc.version, '1.7');
      expect(doc.suggestedName, 'statement.pdf');
    });

    test('a PDF whose page count cannot be established', () {
      // Accepted, with pageCount null. Unknown is a usable answer; a wrong
      // number in a sentence about spending money is not.
      final doc = _validate(
        content: '%PDF-1.7\n<< /Type /ObjStm /Filter /FlateDecode >>\n'
            'trailer\n%%EOF\n',
      ) as AcceptedDocument;

      expect(doc.pageCount, isNull);
    });

    test('the name is cleaned on the way through', () {
      final doc = _validate(name: '../../etc/passwd.pdf') as AcceptedDocument;

      expect(doc.suggestedName, 'passwd.pdf');
    });

    test('no name at all is fine', () {
      final doc = _validate(name: null) as AcceptedDocument;

      expect(doc.suggestedName, isNull);
    });
  });

  group('what it refuses, by its bytes and not its name', () {
    test('a PNG called statement.pdf', () {
      final rejected = _validate(
        header: _magic(const [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]),
      ) as RejectedDocument;

      expect(rejected.message, contains('not a PDF'));
      expect(rejected.message, contains('whatever it is called'));
    });

    test('a Windows program called statement.pdf', () {
      final rejected =
          _validate(header: _magic(const [0x4D, 0x5A, 0x90, 0x00]))
              as RejectedDocument;

      expect(rejected.message, contains('not a PDF'));
    });

    test('a password-protected PDF, with its own sentence', () {
      // A provider could not open it either, so sending it would cost the user
      // money on their own key and come back with nothing.
      final rejected = _validate(
        content: '%PDF-1.6\ntrailer\n<< /Encrypt 9 0 R >>\n%%EOF\n',
      ) as RejectedDocument;

      expect(rejected.message, contains('password-protected'));
    });

    test('a truncated PDF', () {
      final rejected = _validate(
        content: '%PDF-1.7\n3 0 obj\n<< /Type /Pages /Count 2 >>\n',
      ) as RejectedDocument;

      expect(rejected.message, contains('could not be read'));
    });

    test('an empty file', () {
      expect(
        (_validate(size: 0) as RejectedDocument).message,
        contains('empty'),
      );
    });

    test('a document past the cap, named in a unit a person reads', () {
      final rejected =
          _validate(size: DocumentIntake.maxBytes + 1) as RejectedDocument;

      expect(rejected.message, contains('MB'));
      expect(rejected.message, contains('larger than'));
    });

    test('the cap itself is accepted', () {
      expect(
        _validate(size: DocumentIntake.maxBytes),
        isA<AcceptedDocument>(),
      );
    });
  });

  group('the refusals read like limitations, not accusations', () {
    test('none of them blames the user or says "error"', () {
      final refusals = [
        _validate(header: _magic(const [0x4D, 0x5A])),
        _validate(content: '%PDF-1.6\ntrailer\n/Encrypt\n%%EOF\n'),
        _validate(size: 0),
        _validate(size: DocumentIntake.maxBytes + 1),
      ].whereType<RejectedDocument>();

      expect(refusals, hasLength(4));
      for (final refusal in refusals) {
        final lower = refusal.message.toLowerCase();
        expect(lower, isNot(contains('error')));
        expect(lower, isNot(contains('invalid')));
        expect(lower, isNot(contains('failed')));
        expect(refusal.message, isNotEmpty);
      }
    });
  });
}
