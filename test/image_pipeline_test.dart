import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:action_app/features/capture/data/image_format.dart';
import 'package:action_app/features/capture/data/image_metadata.dart';
import 'package:action_app/features/capture/data/image_normalizer.dart';
import 'package:action_app/features/capture/data/source_file_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

Uint8List _png({int width = 40, int height = 30}) {
  final image = img.Image(width: width, height: height);
  img.fill(image, color: img.ColorRgb8(220, 220, 220));
  return img.encodePng(image);
}

Uint8List _jpeg({int width = 40, int height = 30}) {
  final image = img.Image(width: width, height: height);
  img.fill(image, color: img.ColorRgb8(180, 180, 180));
  return img.encodeJpg(image, quality: 90);
}

/// Broad gradients plus fine detail — the shape real photographs have.
///
/// Two things this deliberately is not: pure random noise, which JPEG
/// compresses *worse* than PNG, and a clean gradient, which PNG handles
/// beautifully. Real photographic content sits between them, and that is the
/// case JPEG is built for.
img.Image _photoLikeImage(int width, int height) {
  final image = img.Image(width: width, height: height);
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      final detail = (math.sin(x * 0.37) + math.cos(y * 0.29)) * 38;
      final grain = math.sin((x * 13 + y * 7) * 0.9) * 14;
      final r = (120 + 100 * (x / width) + detail).round().clamp(0, 255);
      final g = (120 + 100 * (y / height) + grain).round().clamp(0, 255);
      final b = (120 + detail + grain).round().clamp(0, 255);
      image.setPixelRgb(x, y, r, g, b);
    }
  }
  return image;
}

Uint8List _photoLikePng(int width, int height) =>
    img.encodePng(_photoLikeImage(width, height));

void main() {
  group('detectImageFormat', () {
    test('identifies formats from magic bytes, not filenames', () {
      expect(detectImageFormat(_png()), DetectedImageFormat.png);
      expect(detectImageFormat(_jpeg()), DetectedImageFormat.jpeg);
      expect(
        detectImageFormat(Uint8List.fromList([0x47, 0x49, 0x46, 0x38, 0x39])),
        DetectedImageFormat.gif,
      );
      expect(
        detectImageFormat(Uint8List.fromList([0x42, 0x4D, 0x00, 0x00])),
        DetectedImageFormat.bmp,
      );
    });

    test('identifies WebP by its RIFF/WEBP pair', () {
      final bytes = Uint8List.fromList([
        0x52, 0x49, 0x46, 0x46, // RIFF
        0x00, 0x00, 0x00, 0x00, // size
        0x57, 0x45, 0x42, 0x50, // WEBP
      ]);
      expect(detectImageFormat(bytes), DetectedImageFormat.webp);
    });

    test('identifies HEIC by its ftyp brand', () {
      final bytes = Uint8List.fromList([
        0, 0, 0, 24,
        ...'ftyp'.codeUnits,
        ...'heic'.codeUnits,
      ]);
      expect(detectImageFormat(bytes), DetectedImageFormat.heic);
    });

    test('reports unknown rather than guessing', () {
      expect(
        detectImageFormat(Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9])),
        DetectedImageFormat.unknown,
      );
      expect(detectImageFormat(Uint8List(0)), DetectedImageFormat.unknown);
    });

    test('every format carries a mime type and extension', () {
      for (final format in DetectedImageFormat.values) {
        expect(format.mimeType, isNotEmpty);
        expect(format.extension, isNotEmpty);
      }
    });
  });

  group('normalizeImageSync', () {
    test('the declared format always matches the actual bytes', () {
      // The day-3 defect was metadata that lied about the payload. Whatever
      // encoding wins, the two must agree.
      for (final source in [
        _png(width: 800, height: 600),
        _jpeg(width: 800, height: 600),
        _photoLikePng(3000, 2000),
      ]) {
        final result = normalizeImageSync(NormalizeRequest(bytes: source));
        expect(detectImageFormat(result.bytes), result.format);
      }
    });

    test('a large photographic PNG is re-encoded to JPEG', () {
      // Oversized, so it must be transformed; photographic, so JPEG wins.
      final result = normalizeImageSync(
        NormalizeRequest(bytes: _photoLikePng(3000, 2000)),
      );

      expect(result.originalFormat, DetectedImageFormat.png);
      expect(result.format, DetectedImageFormat.jpeg);
      expect(result.processedByteSize, lessThan(result.originalByteSize));
    });

    test('an image needing no transform is passed through untouched', () {
      // Re-encoding it would cost a second generation of artefacts on the small
      // text OCR needs, and measurably grows the file.
      final source = _jpeg(width: 900, height: 900);
      final result = normalizeImageSync(NormalizeRequest(bytes: source));

      expect(result.format, DetectedImageFormat.jpeg);
      expect(result.bytes, equals(source));
      expect(result.wasResized, isFalse);
    });

    test('normalisation never returns more bytes than it was given', () {
      for (final source in [
        _png(width: 1200, height: 900),
        _jpeg(width: 900, height: 700),
        _photoLikePng(2600, 2600),
      ]) {
        final result = normalizeImageSync(NormalizeRequest(bytes: source));
        expect(result.processedByteSize, lessThanOrEqualTo(source.length));
      }
    });

    test('caps the long edge without distorting aspect ratio', () {
      final landscape = _jpeg(width: 4000, height: 2000);
      final result = normalizeImageSync(
        NormalizeRequest(bytes: landscape, maxEdge: 2048),
      );

      expect(result.width, 2048);
      expect(result.height, 1024);
      expect(result.wasResized, isTrue);
    });

    test('caps portrait images on their height', () {
      final portrait = _jpeg(width: 1500, height: 3000);
      final result = normalizeImageSync(
        NormalizeRequest(bytes: portrait, maxEdge: 2048),
      );

      expect(result.height, 2048);
      expect(result.width, 1024);
    });

    test('never upscales a small capture', () {
      final small = _jpeg(width: 300, height: 200);
      final result = normalizeImageSync(
        NormalizeRequest(bytes: small, maxEdge: 2048),
      );

      expect(result.width, 300);
      expect(result.height, 200);
      expect(result.wasResized, isFalse);
    });

    test('records original and processed sizes', () {
      final source = _png(width: 1000, height: 1000);
      final result = normalizeImageSync(NormalizeRequest(bytes: source));

      expect(result.originalByteSize, source.length);
      expect(result.processedByteSize, result.bytes.length);
      expect(result.compressionRatio, greaterThan(0));
    });

    test('throws a typed error on malformed bytes, carrying what it detected',
        () {
      final garbage = Uint8List.fromList(List<int>.filled(64, 0x7F));

      expect(
        () => normalizeImageSync(NormalizeRequest(bytes: garbage)),
        throwsA(isA<ImageDecodeException>()),
      );
    });

    test('throws on a truncated PNG rather than producing a broken image', () {
      final truncated = Uint8List.fromList(_png().take(20).toList());

      expect(
        () => normalizeImageSync(NormalizeRequest(bytes: truncated)),
        throwsA(isA<ImageDecodeException>()),
      );
    });

    test('EXIF orientation is baked into the pixels', () {
      // A phone camera stores the sensor buffer sideways and records the
      // rotation in EXIF. ML Kit reads the buffer it is handed, not the
      // metadata, so unless the rotation is applied to the pixels a portrait
      // photo reaches recognition on its side and reads almost nothing.
      //
      // Orientation 6 means "rotate 90 clockwise to display", so 400x200 of
      // stored pixels must come back as 200x400.
      final sideways = _photoLikeImage(400, 200);
      sideways.exif.imageIfd.orientation = 6;

      final result = normalizeImageSync(
        NormalizeRequest(bytes: img.encodeJpg(sideways, quality: 90)),
      );

      expect(result.width, 200);
      expect(result.height, 400);

      // The reported dimensions are not enough. The bytes that get written to
      // disk and handed to the recogniser must themselves be upright, with no
      // orientation tag left telling a viewer to rotate them again.
      final storedTag = img.decodeJpgExif(result.bytes)?.imageIfd.orientation;
      expect(storedTag, anyOf(isNull, 1),
          reason: 'the stored file still claims it needs rotating');
      expect(result.bytes, isNot(equals(img.encodeJpg(sideways, quality: 90))),
          reason: 'the sideways original must not be passed through');
    });

    test('rotation is applied even when it costs bytes', () {
      // Correctness outranks size. The "never grow a capture" guard must not
      // swallow a rotation, or an upside-down page would be kept as-is.
      final sideways = _photoLikeImage(600, 300);
      sideways.exif.imageIfd.orientation = 8; // 90 anticlockwise
      final source = img.encodeJpg(sideways, quality: 95);

      final result = normalizeImageSync(NormalizeRequest(bytes: source));

      expect(result.width, 300);
      expect(result.height, 600);
    });

    test('an orientation of 1 is left alone rather than re-encoded', () {
      final upright = img.Image(width: 500, height: 400);
      img.fill(upright, color: img.ColorRgb8(210, 210, 210));
      upright.exif.imageIfd.orientation = 1;
      final source = Uint8List.fromList(img.encodeJpg(upright, quality: 90));

      final result = normalizeImageSync(NormalizeRequest(bytes: source));

      // This used to assert byte-identity with the source. It cannot any
      // more, because metadata is now stripped from every capture — this
      // fixture has an EXIF segment and that segment is gone. The property
      // the test was written to protect is untouched and is what is asserted
      // instead: the pixels were not re-encoded. Comparing against the
      // stripped source proves exactly that, since the strip only removes
      // container segments and never touches the compressed scan.
      expect(
        result.bytes,
        equals(stripImageMetadata(source).bytes),
        reason: 'nothing needed doing beyond removing the metadata',
      );
      expect(result.wasResized, isFalse);
      expect(result.metadataBytesRemoved, greaterThan(0));
    });

    test('is deterministic - the same input gives byte-identical output', () {
      final source = _png(width: 500, height: 400);
      final a = normalizeImageSync(NormalizeRequest(bytes: source));
      final b = normalizeImageSync(NormalizeRequest(bytes: source));

      expect(a.bytes, equals(b.bytes));
    });
  });

  group('DirectorySourceFileStore', () {
    late Directory dir;
    late DirectorySourceFileStore store;

    setUp(() async {
      dir = await Directory.systemTemp.createTemp('action_files_test');
      store = DirectorySourceFileStore(dir);
    });

    tearDown(() async {
      if (await dir.exists()) await dir.delete(recursive: true);
    });

    test('writes bytes under the given id and extension', () async {
      final path = await store.save(
        id: 'abc',
        bytes: _jpeg(),
        extension: 'jpg',
      );

      expect(path.endsWith('abc.jpg'), isTrue);
      expect(await File(path).exists(), isTrue);
    });

    test('delete removes the bytes', () async {
      final path =
          await store.save(id: 'abc', bytes: _jpeg(), extension: 'jpg');
      await store.delete(path);

      expect(await File(path).exists(), isFalse);
    });

    test('deleting a missing file is not an error', () async {
      await expectLater(
        store.delete('${dir.path}${Platform.pathSeparator}nope.jpg'),
        completes,
      );
    });

    test('deleteAll clears the folder', () async {
      await store.save(id: 'a', bytes: _jpeg(), extension: 'jpg');
      await store.save(id: 'b', bytes: _png(), extension: 'png');

      await store.deleteAll();

      final folder = Directory(
        '${dir.path}${Platform.pathSeparator}${DirectorySourceFileStore.folderName}',
      );
      expect(await folder.exists(), isFalse);
    });
  });
}
