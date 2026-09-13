import 'dart:io';
import 'dart:typed_data';

import 'package:action_app/core/security/file_identity.dart';
import 'package:flutter_test/flutter_test.dart';

/// Builds a header with [magic] at the front and filler behind it, so the
/// detector has the 32 bytes it reads in the real path.
Uint8List _header(List<int> magic, {int pad = 32}) {
  final bytes = Uint8List(pad);
  for (var i = 0; i < magic.length && i < pad; i++) {
    bytes[i] = magic[i];
  }
  return bytes;
}

/// Exactly the bytes of [text], with no padding.
///
/// Deliberately not padded: [_header] pads with zeros, and a NUL byte is what
/// disqualifies a header from being plain text. Padding these would make the
/// text fixtures fail for a reason that has nothing to do with the detector.
Uint8List _ascii(String text) => Uint8List.fromList(text.codeUnits);

void main() {
  group('the digest', () {
    // Known-answer tests. A hash that is only checked against itself proves
    // nothing; these two values are the published SHA-256 of their inputs.
    test('of the empty input is the published value', () {
      final identity =
          FileIdentifier.identifyBytes(Uint8List(0), name: 'empty.bin');

      expect(
        identity.sha256,
        'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',
      );
    });

    test('of "abc" is the published value', () {
      final identity = FileIdentifier.identifyBytes(
        Uint8List.fromList('abc'.codeUnits),
        name: 'abc.txt',
      );

      expect(
        identity.sha256,
        'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad',
      );
    });

    test('is lowercase hex of the right length', () {
      final identity = FileIdentifier.identifyBytes(
        Uint8List.fromList([1, 2, 3]),
        name: 'x.bin',
      );

      expect(identity.sha256, hasLength(64));
      expect(identity.sha256, matches(RegExp(r'^[0-9a-f]{64}$')));
    });

    test('a streamed file agrees with the in-memory result', () async {
      // The chunked path is the one that actually runs on a large PDF, and it
      // is the one that would silently produce a wrong digest if the sink were
      // wired up incorrectly.
      final dir = await Directory.systemTemp.createTemp('action_identity');
      addTearDown(() => dir.delete(recursive: true));

      // Comfortably more than one read chunk.
      final bytes = Uint8List.fromList(
        List<int>.generate(400 * 1024, (i) => i % 251),
      );
      final file = File('${dir.path}${Platform.pathSeparator}big.bin');
      await file.writeAsBytes(bytes);

      final streamed = await FileIdentifier.identify(file);
      final direct = FileIdentifier.identifyBytes(bytes, name: 'big.bin');

      expect(streamed.sha256, direct.sha256);
      expect(streamed.sizeBytes, bytes.length);
      expect(streamed.fileName, 'big.bin');
    });
  });

  group('comparing against an expected checksum', () {
    final identity = FileIdentifier.identifyBytes(
      Uint8List.fromList('abc'.codeUnits),
      name: 'abc.txt',
    );
    const expected =
        'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad';

    test('matches the exact value', () {
      expect(identity.matchesExpected(expected), isTrue);
    });

    test('tolerates the shapes a hash arrives in', () {
      // A comparison that fails on formatting teaches people to ignore it.
      expect(identity.matchesExpected(expected.toUpperCase()), isTrue);
      expect(identity.matchesExpected('  $expected  '), isTrue);
      expect(identity.matchesExpected('$expected  abc.txt'), isTrue);
    });

    test('rejects a different digest', () {
      expect(identity.matchesExpected('0' * 64), isFalse);
    });

    test('rejects anything that is not a digest', () {
      expect(identity.matchesExpected(''), isFalse);
      expect(identity.matchesExpected('not a hash'), isFalse);
      expect(identity.matchesExpected(expected.substring(0, 40)), isFalse);
    });

    test('is grouped for reading but copied whole', () {
      expect(identity.readableDigest, startsWith('ba78 16bf'));
      expect(identity.readableDigest.replaceAll(' ', ''), identity.sha256);
    });
  });

  group('type detection', () {
    final cases = <String, ({Uint8List bytes, String mime})>{
      'PNG': (
        bytes: _header(const [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]),
        mime: 'image/png',
      ),
      'JPEG': (
        bytes: _header(const [0xFF, 0xD8, 0xFF, 0xE0]),
        mime: 'image/jpeg',
      ),
      'GIF': (bytes: _ascii('GIF89a'), mime: 'image/gif'),
      'PDF': (bytes: _ascii('%PDF-1.7'), mime: 'application/pdf'),
      'Zip': (
        bytes: _header(const [0x50, 0x4B, 0x03, 0x04]),
        mime: 'application/zip',
      ),
      'gzip': (bytes: _header(const [0x1F, 0x8B, 0x08]), mime:
          'application/gzip'),
      'TIFF': (
        bytes: _header(const [0x49, 0x49, 0x2A, 0x00]),
        mime: 'image/tiff',
      ),
      'RTF': (bytes: _ascii(r'{\rtf1\ansi'), mime: 'application/rtf'),
      'ELF': (
        bytes: _header(const [0x7F, 0x45, 0x4C, 0x46]),
        mime: 'application/x-elf',
      ),
    };

    for (final entry in cases.entries) {
      test('recognises ${entry.key}', () {
        expect(
          FileIdentifier.detectType(entry.value.bytes)?.mimeType,
          entry.value.mime,
        );
      });
    }

    test('recognises WebP, which needs the brand at offset 8', () {
      final bytes = Uint8List(32);
      bytes.setAll(0, 'RIFF'.codeUnits);
      bytes.setAll(8, 'WEBP'.codeUnits);

      expect(FileIdentifier.detectType(bytes)?.mimeType, 'image/webp');
    });

    test('tells a WAV from a WebP, which share the RIFF header', () {
      final bytes = Uint8List(32);
      bytes.setAll(0, 'RIFF'.codeUnits);
      bytes.setAll(8, 'WAVE'.codeUnits);

      expect(FileIdentifier.detectType(bytes)?.mimeType, 'audio/wav');
    });

    test('tells a HEIC from an MP4, which share the ftyp box', () {
      final heic = Uint8List(32)
        ..setAll(4, 'ftyp'.codeUnits)
        ..setAll(8, 'heic'.codeUnits);
      final mp4 = Uint8List(32)
        ..setAll(4, 'ftyp'.codeUnits)
        ..setAll(8, 'isom'.codeUnits);

      expect(FileIdentifier.detectType(heic)?.mimeType, 'image/heic');
      expect(FileIdentifier.detectType(mp4)?.mimeType, 'video/mp4');
    });

    test('recognises plain text', () {
      expect(
        FileIdentifier.detectType(_ascii('Dear Sir or Madam,\nPlease find'))
            ?.mimeType,
        'text/plain',
      );
    });

    test('does not call arbitrary binary "text"', () {
      final binary = Uint8List.fromList(
        List<int>.generate(32, (i) => (i * 37 + 11) % 256),
      );

      expect(FileIdentifier.detectType(binary)?.mimeType, isNot('text/plain'));
    });

    test('a NUL byte disqualifies text outright', () {
      // Otherwise a UTF-16 document, or a binary that happens to open
      // with readable ASCII, gets called plain text.
      final withNul = Uint8List.fromList(
        [...'hello world padding'.codeUnits, 0, ...'here!!'.codeUnits],
      );

      expect(FileIdentifier.detectType(withNul)?.mimeType, isNot('text/plain'));
    });

    test('unknown bytes are unknown, not guessed', () {
      final unknown = Uint8List.fromList(
        List<int>.generate(32, (i) => 0x80 + (i % 60)),
      );

      expect(FileIdentifier.detectType(unknown), isNull);
    });

    test('a header too short to judge returns nothing', () {
      expect(FileIdentifier.detectType(Uint8List.fromList([0x89])), isNull);
      expect(FileIdentifier.detectType(Uint8List(0)), isNull);
    });
  });

  group('name against content', () {
    test('a program named .pdf is reported', () {
      final identity = FileIdentifier.identifyBytes(
        _header(const [0x4D, 0x5A, 0x90, 0x00]),
        name: 'invoice.pdf',
      );

      expect(identity.extensionMismatch, isTrue);
      expect(identity.mismatchNote, contains('Windows program'));
      expect(identity.mismatchNote, contains('.pdf'));
    });

    test('a matching name and content is not a mismatch', () {
      final identity = FileIdentifier.identifyBytes(
        _ascii('%PDF-1.7'),
        name: 'statement.pdf',
      );

      expect(identity.extensionMismatch, isFalse);
      expect(identity.mismatchNote, isNull);
    });

    test('jpg and jpeg are both correct for a JPEG', () {
      for (final name in ['photo.jpg', 'photo.jpeg', 'photo.JPG']) {
        final identity = FileIdentifier.identifyBytes(
          _header(const [0xFF, 0xD8, 0xFF, 0xE0]),
          name: name,
        );
        expect(identity.extensionMismatch, isFalse, reason: name);
      }
    });

    test('a .docx is not accused of being a Zip', () {
      // Technically true, entirely useless, and it would fire on every office
      // document a user owns.
      final identity = FileIdentifier.identifyBytes(
        _header(const [0x50, 0x4B, 0x03, 0x04]),
        name: 'contract.docx',
      );

      expect(identity.extensionMismatch, isFalse);
    });

    test('a .csv is not accused of being text', () {
      final identity = FileIdentifier.identifyBytes(
        _ascii('date,amount,reference\n2026-01-01,58.20,INV'),
        name: 'export.csv',
      );

      expect(identity.extensionMismatch, isFalse);
    });

    test('unknown content never raises a mismatch', () {
      final identity = FileIdentifier.identifyBytes(
        Uint8List.fromList(List<int>.generate(32, (i) => 0x80 + (i % 60))),
        name: 'mystery.pdf',
      );

      expect(identity.detected, isNull);
      expect(identity.extensionMismatch, isFalse);
    });

    test('a file with no extension never raises a mismatch', () {
      final identity = FileIdentifier.identifyBytes(
        _ascii('%PDF-1.7'),
        name: 'download',
      );

      expect(identity.declaredExtension, '');
      expect(identity.extensionMismatch, isFalse);
    });

    test('a trailing dot is not an extension', () {
      final identity =
          FileIdentifier.identifyBytes(_ascii('%PDF-1.7'), name: 'weird.');

      expect(identity.declaredExtension, '');
      expect(identity.extensionMismatch, isFalse);
    });
  });

  group('honesty', () {
    test('the mismatch note offers the innocent explanation first', () {
      final identity = FileIdentifier.identifyBytes(
        _header(const [0x4D, 0x5A]),
        name: 'photo.png',
      );

      // A renamed file is usually a mistake, not an attack, and leading with
      // an accusation would be wrong far more often than it was right.
      expect(identity.mismatchNote, contains('honest mistake'));
    });

    test('nothing it produces claims the file is safe or scanned', () {
      final samples = <Uint8List>[
        _ascii('%PDF-1.7'),
        _header(const [0x4D, 0x5A]),
        _header(const [0xFF, 0xD8, 0xFF]),
      ];

      for (final bytes in samples) {
        final identity = FileIdentifier.identifyBytes(bytes, name: 'a.pdf');
        final text = [
          identity.detected?.label ?? '',
          identity.mismatchNote ?? '',
        ].join(' ').toLowerCase();

        for (final banned in ['virus', 'malware', 'scanned', 'is safe',
            'clean']) {
          expect(text, isNot(contains(banned)));
        }
      }
    });
  });

  group('size formatting', () {
    test('reads the way a person would say it', () {
      expect(formatBytes(0), '0 bytes');
      expect(formatBytes(512), '512 bytes');
      expect(formatBytes(2048), '2.0 KB');
      expect(formatBytes(1024 * 1024 * 3), '3.0 MB');
      expect(formatBytes(1024 * 1024 * 1024 * 2), '2.0 GB');
    });

    test('drops the decimal once it stops being useful', () {
      expect(formatBytes(1024 * 15), '15 KB');
    });
  });
}
