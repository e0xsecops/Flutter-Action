/// Removing what a camera writes into a photo that has nothing to do with the
/// photo.
///
/// **Why this exists.** A picture taken on a phone carries an EXIF block, and
/// that block routinely holds the GPS coordinates where the shutter was
/// pressed, the exact second it happened, and the make, model and sometimes
/// the serial number of the handset. None of it is visible. All of it was
/// being stored by Action, and — because a capture is handed to the AI
/// provider the user connected whenever a tool needs to read it — all of it
/// was leaving the device attached to the image.
///
/// That is a direct contradiction of the thing this product says about itself.
/// The privacy screen accounts for what leaves the device; a receipt that says
/// "one image" while the image says "51°30′26″N" is not an accurate receipt.
///
/// **Why it is a byte-level edit rather than a re-encode.** The obvious
/// implementation decodes the image, clears the metadata and encodes it again.
/// That works and it is the fallback below, but it costs a second generation
/// of JPEG artefacts, and those land hardest on the thin strokes of small text
/// — which is exactly what the OCR this app depends on has to read. Metadata
/// lives in container segments that sit *beside* the compressed pixel data, so
/// removing them is a copy with gaps: the entropy-coded scan is never
/// decompressed, never requantized, and comes out bit-identical. The file only
/// gets smaller.
library;

import 'dart:typed_data';

/// What a strip did.
class StripResult {
  const StripResult({
    required this.bytes,
    required this.bytesRemoved,
    required this.stripped,
  });

  /// The image with its metadata segments gone, or the input unchanged when
  /// [stripped] is false.
  final Uint8List bytes;

  final int bytesRemoved;

  /// Whether the container was understood well enough to guarantee removal.
  ///
  /// False means the bytes were left alone rather than guessed at — a
  /// corrupted capture is worse than a capture that still carries metadata,
  /// and the caller has a lossy fallback that always works. What must never
  /// happen is claiming a strip that did not occur.
  final bool stripped;
}

/// JPEG segments that carry metadata rather than image data.
///
/// `APP1` is EXIF (GPS, timestamp, device) and also XMP, which carries its own
/// copy of the location. `APP13` is the Photoshop image resource block, whose
/// IPTC payload has location fields of its own. `COM` is a free-text comment.
///
/// Deliberately *not* dropped: `APP0`, which is the JFIF header carrying pixel
/// density, and `APP2`, which is the ICC colour profile. Both change how the
/// image is displayed, so removing them would alter the picture — which is a
/// different thing from removing a note about the picture.
const _jpegMetadataMarkers = {0xE1, 0xED, 0xFE};

/// PNG ancillary chunks that carry metadata.
///
/// `eXIf` is the same EXIF block a JPEG carries. `tEXt`, `zTXt` and `iTXt` are
/// free-text, and screenshot tools write device and app details into them.
/// `tIME` is the last-modified timestamp.
const _pngMetadataChunks = {'tEXt', 'zTXt', 'iTXt', 'eXIf', 'tIME'};

/// Removes metadata from JPEG or PNG bytes, leaving the pixels untouched.
///
/// Anything else is returned unchanged with `stripped: false`.
StripResult stripImageMetadata(Uint8List bytes) {
  if (_isJpeg(bytes)) return _stripJpeg(bytes);
  if (_isPng(bytes)) return _stripPng(bytes);
  return StripResult(bytes: bytes, bytesRemoved: 0, stripped: false);
}

bool _isJpeg(Uint8List b) => b.length >= 3 && b[0] == 0xFF && b[1] == 0xD8;

bool _isPng(Uint8List b) =>
    b.length >= 8 &&
    b[0] == 0x89 &&
    b[1] == 0x50 &&
    b[2] == 0x4E &&
    b[3] == 0x47 &&
    b[4] == 0x0D &&
    b[5] == 0x0A &&
    b[6] == 0x1A &&
    b[7] == 0x0A;

/// Walks the JPEG marker chain, copying every segment except the metadata ones.
///
/// The scan itself is not walked. Once `SOS` is reached the rest of the file —
/// compressed pixels, restart markers, `EOI`, and any trailer — is copied
/// verbatim, which is what makes this lossless and also what keeps it cheap.
StripResult _stripJpeg(Uint8List bytes) {
  final out = BytesBuilder(copy: false);
  out.add([0xFF, 0xD8]);

  var i = 2;
  while (i + 1 < bytes.length) {
    if (bytes[i] != 0xFF) {
      // Not where a marker should be. Rather than resynchronise and risk
      // writing a file no decoder will open, give up and keep the original.
      return StripResult(bytes: bytes, bytesRemoved: 0, stripped: false);
    }

    // Fill bytes: a marker may be preceded by any number of 0xFF padding
    // bytes, and they are not part of it.
    var marker = bytes[i + 1];
    var markerAt = i;
    while (marker == 0xFF && markerAt + 2 < bytes.length) {
      markerAt++;
      marker = bytes[markerAt + 1];
    }

    // Standalone markers carry no length: TEM and the restart markers.
    if (marker == 0x01 || (marker >= 0xD0 && marker <= 0xD7)) {
      out.add([0xFF, marker]);
      i = markerAt + 2;
      continue;
    }

    if (marker == 0xD9) {
      out.add([0xFF, 0xD9]);
      i = markerAt + 2;
      break;
    }

    if (markerAt + 4 > bytes.length) {
      return StripResult(bytes: bytes, bytesRemoved: 0, stripped: false);
    }

    final length = (bytes[markerAt + 2] << 8) | bytes[markerAt + 3];
    // The length counts itself; anything below two is malformed.
    if (length < 2 || markerAt + 2 + length > bytes.length) {
      return StripResult(bytes: bytes, bytesRemoved: 0, stripped: false);
    }

    final segmentEnd = markerAt + 2 + length;

    if (marker == 0xDA) {
      // Start of scan: copy this segment and everything after it, unexamined.
      out.add(Uint8List.sublistView(bytes, markerAt, bytes.length));
      i = bytes.length;
      break;
    }

    if (!_jpegMetadataMarkers.contains(marker)) {
      out.add(Uint8List.sublistView(bytes, markerAt, segmentEnd));
    }
    i = segmentEnd;
  }

  final result = out.toBytes();
  // A strip can only remove. Growing means the walk went wrong somewhere the
  // checks above did not catch, and the original is the safer answer.
  if (result.length > bytes.length) {
    return StripResult(bytes: bytes, bytesRemoved: 0, stripped: false);
  }
  return StripResult(
    bytes: result,
    bytesRemoved: bytes.length - result.length,
    stripped: true,
  );
}

/// Copies the PNG chunk stream, dropping the ancillary chunks that hold text,
/// timestamps and EXIF.
///
/// Every chunk carries its own CRC over its own type and data, so dropping one
/// whole chunk leaves every remaining CRC valid. Nothing has to be recomputed.
StripResult _stripPng(Uint8List bytes) {
  final out = BytesBuilder(copy: false);
  out.add(Uint8List.sublistView(bytes, 0, 8));

  var i = 8;
  while (i + 8 <= bytes.length) {
    final length = (bytes[i] << 24) |
        (bytes[i + 1] << 16) |
        (bytes[i + 2] << 8) |
        bytes[i + 3];
    if (length < 0) {
      return StripResult(bytes: bytes, bytesRemoved: 0, stripped: false);
    }

    final type = String.fromCharCodes(bytes, i + 4, i + 8);
    final chunkEnd = i + 12 + length;
    if (chunkEnd > bytes.length) {
      return StripResult(bytes: bytes, bytesRemoved: 0, stripped: false);
    }

    if (!_pngMetadataChunks.contains(type)) {
      out.add(Uint8List.sublistView(bytes, i, chunkEnd));
    }

    i = chunkEnd;
    if (type == 'IEND') break;
  }

  final result = out.toBytes();
  if (result.length > bytes.length) {
    return StripResult(bytes: bytes, bytesRemoved: 0, stripped: false);
  }
  return StripResult(
    bytes: result,
    bytesRemoved: bytes.length - result.length,
    stripped: true,
  );
}
