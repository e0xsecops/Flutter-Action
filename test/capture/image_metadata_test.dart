/// What a photograph stops carrying once Action has stored it.
///
/// **The defect this was written for.** A phone photo carries an EXIF block
/// holding the GPS coordinates where the shutter was pressed, the second it
/// happened, and the make and model of the handset. Action stored all of it,
/// on both paths through the normalizer — verbatim on the passthrough, and
/// carried across by the encoder on the resize. Because a capture is handed to
/// the AI provider the user connected whenever a tool needs to read it, the
/// coordinates of someone's home were leaving the device attached to a
/// photograph of their letter, and the privacy screen's account of what leaves
/// the device did not mention them, because nobody had noticed.
///
/// So these tests are about absence, and they check it on every path a capture
/// can take rather than on the one that was easiest to reach.
library;

import 'dart:typed_data';

import 'package:action_app/features/capture/data/image_format.dart';
import 'package:action_app/features/capture/data/image_metadata.dart';
import 'package:action_app/features/capture/data/image_normalizer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

/// Degrees, minutes and seconds, as EXIF stores a coordinate.
///
/// `Rational` is not exported from `package:image`, so the values are built
/// through the one constructor that is, then collected.
img.IfdValueRational _coordinate(int deg, int min, int sec) {
  final value = img.IfdValueRational(deg, 1);
  value.value
    ..add(img.IfdValueRational(min, 1).value.first)
    ..add(img.IfdValueRational(sec, 1).value.first);
  return value;
}

/// A JPEG carrying what a phone camera actually writes.
Uint8List photoWithGps({int width = 800, int height = 600}) {
  final image = img.Image(width: width, height: height);
  img.fill(image, color: img.ColorRgb8(210, 210, 205));
  img.drawString(image, 'INVOICE 4471', font: img.arial24, x: 40, y: 40);
  img.drawString(image, 'DUE 30 AUG 2026', font: img.arial24, x: 40, y: 90);

  image.exif.imageIfd['Make'] = 'ACME';
  image.exif.imageIfd['Model'] = 'Phone X';
  image.exif.imageIfd['DateTime'] = '2026:08:30 14:22:07';
  image.exif.gpsIfd['GPSLatitudeRef'] = img.IfdValueAscii('N');
  image.exif.gpsIfd['GPSLatitude'] = _coordinate(51, 30, 26);
  image.exif.gpsIfd['GPSLongitudeRef'] = img.IfdValueAscii('W');
  image.exif.gpsIfd['GPSLongitude'] = _coordinate(0, 7, 39);
  image.exif.gpsIfd['GPSAltitude'] = img.IfdValueRational(35, 1);

  return Uint8List.fromList(img.encodeJpg(image, quality: 90));
}

/// A PNG screenshot with the text chunks a capture tool writes into one.
Uint8List screenshotWithText() {
  final image = img.Image(width: 600, height: 400);
  img.fill(image, color: img.ColorRgb8(255, 255, 255));
  img.drawString(image, 'BALANCE 780.00', font: img.arial24, x: 20, y: 20);
  image.textData = {
    'Software': 'ScreenGrab 4.2',
    'Author': 'a.person@example.com',
    'Comment': 'taken at home',
  };
  return Uint8List.fromList(img.encodePng(image));
}

/// Everything EXIF holds that identifies a person, a place or a device.
void expectNoIdentifyingMetadata(Uint8List bytes, {required String on}) {
  final exif = img.decodeJpgExif(bytes);
  if (exif == null) return;

  expect(exif.gpsIfd.isEmpty, isTrue,
      reason: '$on still carries GPS: ${exif.gpsIfd.keys.toList()}. '
          'These are the coordinates where the photo was taken.');
  expect(exif.imageIfd['Make'], isNull, reason: '$on still names the camera.');
  expect(exif.imageIfd['Model'], isNull, reason: '$on still names the model.');
  expect(exif.imageIfd['DateTime'], isNull,
      reason: '$on still carries the moment the shutter was pressed.');
}

void main() {
  group('the stripper', () {
    test('removes GPS, camera and timestamp from a JPEG', () {
      final source = photoWithGps();
      // The fixture is only meaningful if it really carries the metadata.
      expect(img.decodeJpgExif(source)!.gpsIfd.isEmpty, isFalse);

      final result = stripImageMetadata(source);

      expect(result.stripped, isTrue);
      expect(result.bytesRemoved, greaterThan(0));
      expectNoIdentifyingMetadata(result.bytes, on: 'the stripped JPEG');
    });

    test('leaves the pixels bit-identical', () {
      // The whole reason for editing the container instead of re-encoding: a
      // second generation of JPEG artefacts lands hardest on the thin strokes
      // of small text, which is what the OCR in this app has to read.
      final source = photoWithGps();
      final stripped = stripImageMetadata(source).bytes;

      final before = img.decodeImage(source)!;
      final after = img.decodeImage(stripped)!;

      expect(after.width, before.width);
      expect(after.height, before.height);
      for (var y = 0; y < before.height; y += 7) {
        for (var x = 0; x < before.width; x += 7) {
          expect(after.getPixel(x, y), before.getPixel(x, y),
              reason: 'pixel $x,$y changed — the strip was not lossless');
        }
      }
    });

    test('only ever makes a file smaller', () {
      final source = photoWithGps();
      final result = stripImageMetadata(source);
      expect(result.bytes.length, lessThan(source.length));
    });

    test('removes text chunks from a PNG and leaves it readable', () {
      final source = screenshotWithText();
      final result = stripImageMetadata(source);

      expect(result.stripped, isTrue);
      expect(result.bytesRemoved, greaterThan(0));

      final decoded = img.decodeImage(result.bytes);
      expect(decoded, isNotNull, reason: 'the stripped PNG no longer decodes');
      expect(decoded!.textData ?? const {}, isEmpty,
          reason: 'the PNG still names the tool and the person');
    });

    test('is idempotent', () {
      final once = stripImageMetadata(photoWithGps()).bytes;
      final twice = stripImageMetadata(once);
      expect(twice.bytesRemoved, 0);
      expect(twice.bytes.length, once.length);
    });

    test('refuses rather than guesses at bytes it does not understand', () {
      // Failing closed here would corrupt a capture. Failing open is safe
      // because the caller re-encodes instead — what must never happen is
      // reporting a strip that did not occur.
      final notAnImage = Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9]);
      final result = stripImageMetadata(notAnImage);
      expect(result.stripped, isFalse);
      expect(result.bytesRemoved, 0);
      expect(result.bytes, same(notAnImage));
    });

    test('refuses a truncated JPEG', () {
      final source = photoWithGps();
      final truncated = Uint8List.sublistView(source, 0, 40);
      expect(stripImageMetadata(truncated).stripped, isFalse);
    });
  });

  group('the normalizer strips on every path', () {
    test('the passthrough path — an in-spec upright photo', () {
      // The path that matters most: a photo already within the size cap and
      // already upright is handed straight through, and that is exactly the
      // file off a camera roll that carries the GPS fix.
      final source = photoWithGps();
      final result = normalizeImageSync(NormalizeRequest(bytes: source));

      expect(result.wasResized, isFalse);
      expect(result.metadataBytesRemoved, greaterThan(0));
      expectNoIdentifyingMetadata(result.bytes, on: 'the passthrough result');
      expect(result.bytes.length, lessThan(source.length));
    });

    test('the resize path — an oversized photo', () {
      final source = photoWithGps(width: 4000, height: 3000);
      final result = normalizeImageSync(NormalizeRequest(bytes: source));

      expect(result.wasResized, isTrue);
      expectNoIdentifyingMetadata(result.bytes, on: 'the resized result');
    });

    test('the PNG path — a screenshot', () {
      final source = screenshotWithText();
      final result = normalizeImageSync(NormalizeRequest(bytes: source));

      final decoded = img.decodeImage(result.bytes)!;
      expect(decoded.textData ?? const {}, isEmpty);
    });

    test('a photo that never had metadata is not made larger', () {
      final plain = img.Image(width: 300, height: 200);
      img.fill(plain, color: img.ColorRgb8(120, 120, 120));
      final bytes = Uint8List.fromList(img.encodeJpg(plain, quality: 88));

      final result = normalizeImageSync(NormalizeRequest(bytes: bytes));
      expect(result.bytes.length, lessThanOrEqualTo(bytes.length));
    });
  });

  group('what stripping must not break', () {
    test('orientation is still applied to the pixels', () {
      // The rotation fix and the strip touch the same bytes. A photo stored
      // sideways with an orientation tag must still come out upright, because
      // ML Kit reads the buffer and not the metadata — and the tag it used to
      // rely on is now one of the things being removed.
      final upright = img.Image(width: 400, height: 200);
      img.fill(upright, color: img.ColorRgb8(180, 180, 180));
      final sideways = img.copyRotate(upright, angle: -90);
      sideways.exif.imageIfd.orientation = 6;
      sideways.exif.gpsIfd['GPSAltitude'] = img.IfdValueRational(35, 1);
      final bytes = Uint8List.fromList(img.encodeJpg(sideways, quality: 88));

      final result = normalizeImageSync(NormalizeRequest(bytes: bytes));

      // Landscape again, by pixels rather than by a tag.
      expect(result.width, greaterThan(result.height));
      expect(img.decodeImage(result.bytes)!.width,
          greaterThan(img.decodeImage(result.bytes)!.height));
      expectNoIdentifyingMetadata(result.bytes, on: 'the rotated result');
    });

    test('the stored image still decodes and still reports its format', () {
      final result =
          normalizeImageSync(NormalizeRequest(bytes: photoWithGps()));
      expect(result.format, DetectedImageFormat.jpeg);
      expect(detectImageFormat(result.bytes), DetectedImageFormat.jpeg);
      expect(img.decodeImage(result.bytes), isNotNull);
    });

    test('text is still legible enough to recognise', () {
      // A strip that quietly damaged the scan would show up as an image that
      // decodes but no longer matches the original pixel for pixel.
      final source = photoWithGps();
      final result = normalizeImageSync(NormalizeRequest(bytes: source));

      final before = img.decodeImage(source)!;
      final after = img.decodeImage(result.bytes)!;
      for (var x = 40; x < 300; x += 11) {
        expect(after.getPixel(x, 50), before.getPixel(x, 50));
      }
    });
  });
}
