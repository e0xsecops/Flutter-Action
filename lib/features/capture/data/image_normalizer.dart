import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

import 'image_format.dart';

/// Thrown when bytes cannot be decoded into an image at all.
///
/// Distinct from "OCR found nothing": this one means we never got as far as
/// having pixels, so the UI must offer manual entry rather than a retry that
/// would fail identically.
class ImageDecodeException implements Exception {
  const ImageDecodeException(this.detectedFormat);

  final DetectedImageFormat detectedFormat;

  @override
  String toString() =>
      'ImageDecodeException(detected: ${detectedFormat.name})';
}

class NormalizeRequest {
  const NormalizeRequest({
    required this.bytes,
    this.maxEdge = ImageNormalizer.defaultMaxEdge,
    this.quality = ImageNormalizer.defaultQuality,
  });

  final Uint8List bytes;
  final int maxEdge;
  final int quality;
}

/// A capture converted into the single predictable form the rest of the
/// pipeline works with.
class NormalizedImage {
  const NormalizedImage({
    required this.bytes,
    required this.format,
    required this.originalFormat,
    required this.width,
    required this.height,
    required this.originalByteSize,
    required this.wasResized,
  });

  final Uint8List bytes;

  /// What [bytes] actually are.
  ///
  /// Photographs are re-encoded to JPEG, which beats PNG on them by a wide
  /// margin. Screenshots are the opposite case: large flat areas of one colour
  /// compress far better losslessly, and re-encoding a screenshot to JPEG can
  /// more than double its size while adding artefacts to the very text OCR
  /// needs. So a PNG source is offered both encodings and the smaller wins.
  final DetectedImageFormat format;

  /// What arrived. Kept because it is the honest record of what the user gave
  /// us, and because a PNG source is a useful signal that this was a screenshot.
  final DetectedImageFormat originalFormat;

  final int width;
  final int height;
  final int originalByteSize;
  final bool wasResized;

  int get processedByteSize => bytes.length;

  double get compressionRatio =>
      originalByteSize == 0 ? 1 : processedByteSize / originalByteSize;
}

/// Decodes, straightens, downscales and re-encodes a capture.
///
/// `image_picker`'s `imageQuality` is a JPEG-only setting, so a PNG screenshot
/// passes through it untouched — day 3 stored a 5.6MB "compressed" capture
/// because of exactly that. Real re-encoding is the only fix.
///
/// The work runs on a background isolate: decoding a 12-megapixel PNG takes
/// long enough to drop frames, and it happens while the user is looking at the
/// preview screen.
abstract interface class ImageNormalizer {
  /// Long-edge cap. Text recognition needs genuine resolution on small print —
  /// a scanned A4 at 2048px long edge lands around 170dpi, which reads
  /// reliably. Going lower starts costing recall on footnotes and account
  /// numbers, which is exactly the content this product exists to find.
  static const defaultMaxEdge = 2048;

  /// Slightly above the usual 85 because JPEG artefacts land hardest on the
  /// thin strokes of small text, which is what OCR needs most.
  static const defaultQuality = 88;

  Future<NormalizedImage> normalize(NormalizeRequest request);
}

/// Runs [normalizeImageSync] on a background isolate.
class IsolateImageNormalizer implements ImageNormalizer {
  const IsolateImageNormalizer();

  @override
  Future<NormalizedImage> normalize(NormalizeRequest request) {
    return compute(normalizeImageSync, request);
  }
}

/// The pure transformation, exposed directly so the fixture harness and unit
/// tests can run it deterministically without spawning isolates.
NormalizedImage normalizeImageSync(NormalizeRequest request) {
  final detected = detectImageFormat(request.bytes);

  // Malformed input reaches the decoder in two different ways: some codecs
  // return null, others throw from inside the package on a truncated stream.
  // Both are the same thing to a caller, so both become ImageDecodeException —
  // otherwise a corrupt capture escapes the capture flow's error handling.
  final img.Image? decoded;
  try {
    decoded = img.decodeImage(request.bytes);
  } on Object {
    throw ImageDecodeException(detected);
  }
  if (decoded == null) throw ImageDecodeException(detected);

  // EXIF orientation must be applied to the pixels. ML Kit reads the buffer we
  // hand it, not the metadata, so a photo taken in landscape would otherwise be
  // fed to OCR sideways and recognise almost nothing.
  // The subtlety, found by testing rather than by reading the docs: this
  // decoder applies the orientation itself and clears the tag, so `decoded` is
  // already upright and its exif no longer mentions rotation. What the decoder
  // does *not* do is rewrite the bytes we were handed — those are still
  // sideways, still carrying the tag. So the tag must be read from the
  // original bytes, or the passthrough below ships a sideways file described
  // by upright dimensions: the day-3 defect again, in a different field.
  final storedOrientation = detected == DetectedImageFormat.jpeg
      ? img.decodeJpgExif(request.bytes)?.imageIfd.orientation
      : null;
  final needsRotate = storedOrientation != null && storedOrientation != 1;

  // Belt and braces for a codec that leaves the tag in place rather than
  // applying it, so correctness does not depend on which decoder ran.
  final residual = decoded.exif.imageIfd.orientation;
  final upright = (residual != null && residual != 1)
      ? img.bakeOrientation(decoded)
      : decoded;

  final longestEdge =
      upright.width > upright.height ? upright.width : upright.height;
  final needsResize = longestEdge > request.maxEdge;

  // Nothing to correct and nothing to shrink: hand back exactly what we were
  // given. Re-encoding here would add a second generation of JPEG artefacts to
  // the small text OCR depends on, and observably produces a *larger* file,
  // since our encoder is not the one that wrote the original.
  if (!needsResize &&
      !needsRotate &&
      (detected == DetectedImageFormat.jpeg ||
          detected == DetectedImageFormat.png)) {
    return NormalizedImage(
      bytes: request.bytes,
      format: detected,
      originalFormat: detected,
      width: upright.width,
      height: upright.height,
      originalByteSize: request.bytes.length,
      wasResized: false,
    );
  }

  // Only ever downscale. Enlarging a small capture invents detail and makes
  // OCR worse while costing bytes.
  final sized = needsResize
      ? img.copyResize(
          upright,
          width: upright.width >= upright.height ? request.maxEdge : null,
          height: upright.height > upright.width ? request.maxEdge : null,
          interpolation: img.Interpolation.average,
        )
      : upright;

  final jpeg = img.encodeJpg(sized, quality: request.quality);

  // Only screenshots get the second encode. Photographs never win as PNG, so
  // paying for a lossless encode of one would be wasted work on every capture.
  var bytes = jpeg;
  var format = DetectedImageFormat.jpeg;
  if (detected == DetectedImageFormat.png) {
    final png = img.encodePng(sized);
    if (png.length < jpeg.length) {
      bytes = png;
      format = DetectedImageFormat.png;
    }
  }

  // Never store more bytes than we were handed.
  //
  // The three goals here rank in this order: correctness, then size, then the
  // dimension cap. Rotation is correctness — a sideways page recognises almost
  // nothing — so it is applied even when it costs bytes. The cap is only an
  // optimisation for decode time and eventual upload, so if downscaling and
  // re-encoding somehow produce a *larger* file than the original, the cap
  // yields and the original is kept. An oversized capture is a minor cost; a
  // capture we made bigger is a defect.
  if (!needsRotate && bytes.length >= request.bytes.length) {
    return NormalizedImage(
      bytes: request.bytes,
      format: detected,
      originalFormat: detected,
      width: upright.width,
      height: upright.height,
      originalByteSize: request.bytes.length,
      wasResized: false,
    );
  }

  return NormalizedImage(
    bytes: bytes,
    format: format,
    originalFormat: detected,
    width: sized.width,
    height: sized.height,
    originalByteSize: request.bytes.length,
    wasResized: needsResize,
  );
}
