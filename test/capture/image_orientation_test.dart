/// Stripping the orientation tag must not leave the photo on its side.
///
/// **Why this file exists.** Metadata stripping and EXIF orientation touch the
/// same bytes and pull in opposite directions. A huge share of phone photos are
/// stored in the sensor's native landscape and carry an `Orientation` tag that
/// tells a viewer to turn them; the pixels themselves are sideways. Remove the
/// tag without first baking the rotation into the pixels and every portrait
/// photo in the app quietly falls over — while the GPS fix it was removed to
/// protect is, correctly, gone. That would be a privacy win paid for with a
/// product regression, and it is the exact failure this file is here to catch.
///
/// **What is asserted.** For each orientation, a fixture is built by storing
/// the *inverse* of the intended display — which is what a camera actually
/// writes — and then run through the real normalizer. The check is made against
/// the output pixels with no reference to any tag, because after stripping
/// there is no tag left to honour: what a viewer sees is only what the pixels
/// say. A four-quadrant colour marker makes every rotation and every mirror
/// distinguishable from every other.
library;

import 'dart:typed_data';

import 'package:action_app/features/capture/data/image_metadata.dart';
import 'package:action_app/features/capture/data/image_normalizer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

const _red = (200, 40, 40);
const _green = (40, 180, 40);
const _blue = (40, 60, 200);
const _white = (235, 235, 235);

/// The image as it is meant to be *seen*: four distinguishable quadrants.
///
/// Deliberately not square, so a 90° error is visible in the dimensions as well
/// as in the colours, and deliberately asymmetric in both axes, so a mirror is
/// distinguishable from a rotation.
img.Image displayImage({int width = 160, int height = 100}) {
  final image = img.Image(width: width, height: height);
  void quad(int x0, int y0, int x1, int y1, (int, int, int) c) {
    img.fillRect(image,
        x1: x0,
        y1: y0,
        x2: x1,
        y2: y1,
        color: img.ColorRgb8(c.$1, c.$2, c.$3));
  }

  final midX = width ~/ 2;
  final midY = height ~/ 2;
  quad(0, 0, midX - 1, midY - 1, _red);
  quad(midX, 0, width - 1, midY - 1, _green);
  quad(0, midY, midX - 1, height - 1, _blue);
  quad(midX, midY, width - 1, height - 1, _white);
  return image;
}

/// The pixels a camera would store for a photo it wants displayed as [display]
/// once [orientation] has been applied.
///
/// This is the inverse of each EXIF transform, so `apply(orientation, stored)`
/// gives the display image back.
img.Image storedFor(img.Image display, int orientation) => switch (orientation) {
      1 => display,
      2 => img.flipHorizontal(display),
      3 => img.copyRotate(display, angle: 180),
      4 => img.flipVertical(display),
      // 5 is mirror-horizontal then rotate 270 clockwise to display, so the
      // inverse is rotate 90 clockwise then mirror.
      5 => img.flipHorizontal(img.copyRotate(display, angle: 90)),
      6 => img.copyRotate(display, angle: -90),
      7 => img.flipHorizontal(img.copyRotate(display, angle: -90)),
      8 => img.copyRotate(display, angle: 90),
      _ => throw ArgumentError('orientation $orientation'),
    };

/// A JPEG carrying [orientation] plus the GPS and device tags a phone writes.
Uint8List photoWithOrientation(
  int orientation, {
  int width = 160,
  int height = 100,
}) {
  final stored = storedFor(displayImage(width: width, height: height), orientation);
  stored.exif.imageIfd.orientation = orientation;
  stored.exif.imageIfd['Make'] = 'ACME';
  stored.exif.imageIfd['Model'] = 'Phone X';
  stored.exif.imageIfd['DateTime'] = '2026:08:30 14:22:07';
  stored.exif.gpsIfd['GPSLatitudeRef'] = img.IfdValueAscii('N');
  stored.exif.gpsIfd['GPSAltitude'] = img.IfdValueRational(35, 1);
  return Uint8List.fromList(img.encodeJpg(stored, quality: 92));
}

/// JPEG is lossy and a quadrant edge is a hard colour boundary, so sample well
/// inside each quadrant and allow generous tolerance.
void expectQuadrant(
  img.Image image,
  double fx,
  double fy,
  (int, int, int) expected, {
  required String corner,
  required int orientation,
}) {
  final x = (image.width * fx).round().clamp(0, image.width - 1);
  final y = (image.height * fy).round().clamp(0, image.height - 1);
  final p = image.getPixel(x, y);
  final drift = ((p.r - expected.$1).abs() +
          (p.g - expected.$2).abs() +
          (p.b - expected.$3).abs()) /
      3;
  expect(
    drift,
    lessThan(45),
    reason: 'orientation $orientation: the $corner of the stored image is '
        'rgb(${p.r.round()}, ${p.g.round()}, ${p.b.round()}) but should be '
        'rgb(${expected.$1}, ${expected.$2}, ${expected.$3}). The photo came '
        'out rotated or mirrored: the orientation tag was removed without the '
        'rotation being baked into the pixels first.',
  );
}

/// Every identifying tag is gone.
void expectStripped(Uint8List bytes, {required int orientation}) {
  final exif = img.decodeJpgExif(bytes);
  if (exif == null) return;
  expect(exif.gpsIfd.isEmpty, isTrue,
      reason: 'orientation $orientation still carries GPS');
  expect(exif.imageIfd['Make'], isNull,
      reason: 'orientation $orientation still names the camera');
  expect(exif.imageIfd['Model'], isNull,
      reason: 'orientation $orientation still names the model');
  expect(exif.imageIfd['DateTime'], isNull,
      reason: 'orientation $orientation still carries the capture time');
}

/// The pixels are upright, whatever the tag used to say.
void expectUprightAndClean(Uint8List output, {required int orientation}) {
  expectStripped(output, orientation: orientation);

  final decoded = img.decodeImage(output);
  expect(decoded, isNotNull,
      reason: 'orientation $orientation no longer decodes');

  // Landscape in, landscape out. A quarter-turn error shows up here first.
  expect(decoded!.width, greaterThan(decoded.height),
      reason: 'orientation $orientation came out ${decoded.width}x'
          '${decoded.height}; the display image is landscape');

  expectQuadrant(decoded, 0.25, 0.25, _red,
      corner: 'top-left', orientation: orientation);
  expectQuadrant(decoded, 0.75, 0.25, _green,
      corner: 'top-right', orientation: orientation);
  expectQuadrant(decoded, 0.25, 0.75, _blue,
      corner: 'bottom-left', orientation: orientation);
  expectQuadrant(decoded, 0.75, 0.75, _white,
      corner: 'bottom-right', orientation: orientation);
}

void main() {
  group('the fixtures are built correctly', () {
    // If the inverse transforms above are wrong, every test below would be
    // testing the wrong thing — so prove the round trip first, without the
    // normalizer involved at all.
    for (final orientation in [1, 2, 3, 4, 5, 6, 7, 8]) {
      test('orientation $orientation round-trips through its own inverse', () {
        final display = displayImage();
        final stored = storedFor(display, orientation);
        final back = switch (orientation) {
          1 => stored,
          2 => img.flipHorizontal(stored),
          3 => img.copyRotate(stored, angle: 180),
          4 => img.flipVertical(stored),
          5 => img.copyRotate(img.flipHorizontal(stored), angle: -90),
          6 => img.copyRotate(stored, angle: 90),
          7 => img.copyRotate(img.flipHorizontal(stored), angle: 90),
          8 => img.copyRotate(stored, angle: -90),
          _ => stored,
        };
        expect(back.width, display.width);
        expect(back.height, display.height);
        expectQuadrant(back, 0.25, 0.25, _red,
            corner: 'top-left', orientation: orientation);
        expectQuadrant(back, 0.75, 0.75, _white,
            corner: 'bottom-right', orientation: orientation);
      });
    }
  });

  group('the rotations a camera actually writes survive stripping', () {
    // 1, 3, 6 and 8 are the four a phone produces by holding the handset in
    // each of the four ways. These are not allowed to regress.
    for (final orientation in [1, 3, 6, 8]) {
      test('orientation $orientation comes out upright and without metadata',
          () {
        final source = photoWithOrientation(orientation);
        // The fixture is only meaningful if it really carries what we claim.
        expect(img.decodeJpgExif(source)!.imageIfd.orientation, orientation);
        expect(img.decodeJpgExif(source)!.gpsIfd.isEmpty, isFalse);

        final result = normalizeImageSync(NormalizeRequest(bytes: source));
        expectUprightAndClean(result.bytes, orientation: orientation);
      });

      test('orientation $orientation is upright after a resize too', () {
        // The oversized path re-encodes, which is a different branch through
        // the normalizer and has its own chance to lose the rotation.
        final source = photoWithOrientation(orientation, width: 4000, height: 2500);
        final result = normalizeImageSync(NormalizeRequest(bytes: source));
        expect(result.wasResized, isTrue);
        expectUprightAndClean(result.bytes, orientation: orientation);
      });
    }
  });

  group('the mirrored orientations', () {
    // 2, 4, 5 and 7 involve a flip. They are produced by front cameras that
    // mirror the preview, and by some scanning software; they are rare but not
    // impossible. The pipeline does not special-case them, so this records
    // what it actually does rather than assuming.
    for (final orientation in [2, 4, 5, 7]) {
      test('orientation $orientation comes out upright and without metadata',
          () {
        final source = photoWithOrientation(orientation);
        final result = normalizeImageSync(NormalizeRequest(bytes: source));
        expectUprightAndClean(result.bytes, orientation: orientation);
      });
    }
  });

  group('what the rest of the pipeline sees', () {
    test('the reported dimensions match the pixels that were stored', () {
      // The stored file and the recorded width/height must agree, or the
      // Evidence Lens maps a highlight onto the wrong part of the image.
      for (final orientation in [1, 3, 6, 8]) {
        final result = normalizeImageSync(
            NormalizeRequest(bytes: photoWithOrientation(orientation)));
        final decoded = img.decodeImage(result.bytes)!;
        expect(result.width, decoded.width,
            reason: 'orientation $orientation reports width ${result.width} '
                'but stored ${decoded.width}');
        expect(result.height, decoded.height,
            reason: 'orientation $orientation reports height ${result.height} '
                'but stored ${decoded.height}');
      }
    });

    test('a stripped photo is still a valid JPEG for the provider', () {
      // What is handed to an AI provider is the stored file. If stripping left
      // it unopenable the capture would fail at the last step.
      for (final orientation in [1, 3, 6, 8]) {
        final result = normalizeImageSync(
            NormalizeRequest(bytes: photoWithOrientation(orientation)));
        expect(stripImageMetadata(result.bytes).stripped, isTrue,
            reason: 'orientation $orientation is no longer a walkable JPEG');
        expect(img.decodeImage(result.bytes), isNotNull);
      }
    });

    test('an image with no orientation tag at all is left upright', () {
      final plain = displayImage();
      final bytes = Uint8List.fromList(img.encodeJpg(plain, quality: 92));
      final result = normalizeImageSync(NormalizeRequest(bytes: bytes));
      expectUprightAndClean(result.bytes, orientation: 0);
    });
  });
}
