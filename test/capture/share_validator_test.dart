/// What Action believes about something another app handed it.
///
/// A share sheet is an interface any installed app can send through, and the
/// sender chooses the URI, the MIME type and the file name. So the tests here
/// are mostly about *disbelieving*: a declared type that the bytes contradict,
/// a name that is really a path, a size that is really an attack.
library;

import 'dart:typed_data';

import 'package:action_app/features/capture/domain/shared_payload.dart';
import 'package:flutter_test/flutter_test.dart';

Uint8List _bytes(List<int> magic, {int pad = 32}) {
  final out = Uint8List(pad);
  for (var i = 0; i < magic.length && i < pad; i++) {
    out[i] = magic[i];
  }
  return out;
}

final _jpeg = _bytes(const [0xFF, 0xD8, 0xFF, 0xE0]);
final _png = _bytes(const [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]);
final _pdf = Uint8List.fromList('%PDF-1.7'.codeUnits);
final _windowsExe = _bytes(const [0x4D, 0x5A, 0x90, 0x00]);
final _zip = _bytes(const [0x50, 0x4B, 0x03, 0x04]);

SharedPayload _file({
  String path = '/data/cache/shared/share_1',
  String? declared = 'image/jpeg',
  String? name = 'photo.jpg',
  int size = 4096,
  Uint8List? header,
}) =>
    ShareValidator.validateFile(
      path: path,
      declaredMimeType: declared,
      declaredName: name,
      sizeBytes: size,
      header: header ?? _jpeg,
    );

void main() {
  group('shared text', () {
    test('ordinary text is accepted and trimmed', () {
      final payload = ShareValidator.validateText('  Pay by 12 September.  ');

      expect(payload, isA<SharedText>());
      expect((payload as SharedText).text, 'Pay by 12 September.');
      expect(payload.truncated, isFalse);
    });

    test('nothing usable is refused rather than turned into an empty capture',
        () {
      expect(
        ShareValidator.validateText(null),
        isA<SharedRejected>()
            .having((r) => r.reason, 'reason', ShareRejection.empty),
      );
      expect(ShareValidator.validateText('   \n\t '), isA<SharedRejected>());
    });

    test('truncation is carried through rather than swallowed', () {
      // A silently shortened notice is one whose deadline may be missing.
      final payload =
          ShareValidator.validateText('a notice', truncated: true) as SharedText;

      expect(payload.truncated, isTrue);
    });
  });

  group('shared images', () {
    test('a real JPEG is accepted, typed from its bytes', () {
      final payload = _file() as SharedImage;

      expect(payload.mimeType, 'image/jpeg');
      expect(payload.sizeBytes, 4096);
      expect(payload.suggestedName, 'photo.jpg');
    });

    test('the type comes from the bytes, not from what was declared', () {
      // A sender that mislabels a PNG as a JPEG is wrong but not hostile, and
      // Action can read it either way — so it is accepted, as a PNG.
      final payload =
          _file(declared: 'image/jpeg', header: _png) as SharedImage;

      expect(payload.mimeType, 'image/png');
    });

    test('an image type Action cannot read is refused', () {
      // Declared image, and the bytes agree it is not one of the seven the
      // pipeline can normalise.
      final payload = _file(declared: 'image/zip', header: _zip);

      expect(payload, isA<SharedRejected>());
    });
  });

  group('what it refuses to believe', () {
    test('a program declared as an image is a mismatch, and says so', () {
      // The case worth naming rather than hiding behind a generic failure.
      final payload = _file(
        declared: 'image/png',
        name: 'holiday.png',
        header: _windowsExe,
      );

      expect(
        payload,
        isA<SharedRejected>()
            .having((r) => r.reason, 'reason', ShareRejection.contentMismatch),
      );
    });

    test('a PDF mislabelled as an image is taken as the PDF it is', () {
      // Not treated as a mismatch, and the distinction is deliberate. The
      // reason to refuse a contradiction is that a *program* wearing an
      // image's name is worth refusing on sight. A PDF wearing one is far more
      // likely a careless sender, and Action reads PDFs — so it is accepted as
      // what it actually is, which is the same rule as everywhere else: the
      // bytes decide.
      final payload = _file(declared: 'image/jpeg', header: _pdf);

      expect(payload, isA<SharedDocument>());
    });

    test('something Action cannot read at all is merely unsupported', () {
      // Not suspicious — nothing was contradicted. Different situation,
      // different word.
      final payload = _file(declared: 'application/zip', header: _zip);

      expect(
        (payload as SharedRejected).reason,
        ShareRejection.unsupportedType,
      );
    });

    test('a shared PDF keeps its size and its cleaned name', () {
      final payload = _file(
        declared: 'application/pdf',
        name: '../statement.pdf',
        size: 90_000,
        header: _pdf,
      ) as SharedDocument;

      expect(payload.sizeBytes, 90_000);
      expect(payload.suggestedName, 'statement.pdf');
    });

    test('an oversized PDF is still refused before anything reads it', () {
      expect(
        (_file(
          declared: 'application/pdf',
          size: ShareValidator.maxBytes + 1,
          header: _pdf,
        ) as SharedRejected)
            .reason,
        ShareRejection.tooLarge,
      );
    });

    test('unrecognised bytes are unsupported, not a mismatch', () {
      final unknown = Uint8List.fromList(
        List<int>.generate(32, (i) => 0x80 + (i % 60)),
      );

      expect(
        (_file(declared: null, header: unknown) as SharedRejected).reason,
        ShareRejection.unsupportedType,
      );
    });

    test('an empty file is refused', () {
      expect(
        (_file(size: 0) as SharedRejected).reason,
        ShareRejection.empty,
      );
    });

    test('a file past the cap is refused before anything reads it', () {
      expect(
        (_file(size: ShareValidator.maxBytes + 1) as SharedRejected).reason,
        ShareRejection.tooLarge,
      );
    });

    test('the cap itself is accepted', () {
      expect(_file(size: ShareValidator.maxBytes), isA<SharedImage>());
    });
  });

  group('the sender-supplied name', () {
    test('a plain name survives', () {
      expect(ShareValidator.sanitiseName('invoice.png'), 'invoice.png');
    });

    test('a name that is really a path keeps only the last part', () {
      // A name reaches a screen, and it was chosen by another app.
      expect(
        ShareValidator.sanitiseName('../../etc/passwd'),
        'passwd',
      );
      expect(
        ShareValidator.sanitiseName(r'C:\Windows\System32\thing.png'),
        'thing.png',
      );
    });

    test('control characters are removed', () {
      final name = ShareValidator.sanitiseName(
        String.fromCharCodes([...'in'.codeUnits, 0, 27, ...'voice.png'.codeUnits]),
      );

      expect(name, 'invoice.png');
    });

    test('an absurd length is bounded', () {
      final long = '${'a' * 500}.png';

      expect(ShareValidator.sanitiseName(long), hasLength(80));
    });

    test('nothing left means no name, not a mangled remnant', () {
      expect(ShareValidator.sanitiseName('   '), isNull);
      expect(ShareValidator.sanitiseName('/'), isNull);
      expect(ShareValidator.sanitiseName(null), isNull);
    });

    test('a rejected share never carries a name onward', () {
      // Nothing about a refused payload should reach a screen.
      final payload = _file(name: '../../secret.png', header: _windowsExe);

      expect(payload, isA<SharedRejected>());
    });
  });

  group('the messages', () {
    test('every rejection has one, and none of them blames the user', () {
      for (final reason in ShareRejection.values) {
        final message = describeShareRejection(reason);
        expect(message, isNotEmpty);
        expect(message.toLowerCase(), isNot(contains('invalid')));
        expect(message.toLowerCase(), isNot(contains('error')));
      }
    });

    test('the mismatch message says Action did not open it', () {
      // The user's takeaway should be that nothing happened, not that
      // something failed halfway.
      expect(
        describeShareRejection(ShareRejection.contentMismatch),
        contains('has not opened it'),
      );
    });
  });
}
