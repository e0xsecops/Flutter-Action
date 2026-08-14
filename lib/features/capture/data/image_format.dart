import 'dart:typed_data';

/// Image container formats we can meaningfully distinguish from the bytes.
enum DetectedImageFormat {
  jpeg('image/jpeg', 'jpg'),
  png('image/png', 'png'),
  webp('image/webp', 'webp'),
  gif('image/gif', 'gif'),
  bmp('image/bmp', 'bmp'),
  heic('image/heic', 'heic'),
  unknown('application/octet-stream', 'bin');

  const DetectedImageFormat(this.mimeType, this.extension);

  final String mimeType;
  final String extension;
}

/// Identifies a format from its magic bytes.
///
/// The filename is never trusted for this. A picked screenshot arrives as PNG
/// regardless of what the picker calls it, and getting this wrong is what
/// produced 5.6MB files named `.jpg` on day 3.
DetectedImageFormat detectImageFormat(Uint8List bytes) {
  bool startsWith(List<int> signature, {int offset = 0}) {
    if (bytes.length < offset + signature.length) return false;
    for (var i = 0; i < signature.length; i++) {
      if (bytes[offset + i] != signature[i]) return false;
    }
    return true;
  }

  if (startsWith([0xFF, 0xD8, 0xFF])) return DetectedImageFormat.jpeg;
  if (startsWith([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])) {
    return DetectedImageFormat.png;
  }
  if (startsWith([0x47, 0x49, 0x46, 0x38])) return DetectedImageFormat.gif;
  if (startsWith([0x42, 0x4D])) return DetectedImageFormat.bmp;

  // RIFF....WEBP — the four size bytes at offset 4 are skipped.
  if (startsWith([0x52, 0x49, 0x46, 0x46]) &&
      startsWith([0x57, 0x45, 0x42, 0x50], offset: 8)) {
    return DetectedImageFormat.webp;
  }

  // ISO base media: 'ftyp' at offset 4, then a HEIF-family brand.
  if (startsWith([0x66, 0x74, 0x79, 0x70], offset: 4)) {
    const brands = ['heic', 'heix', 'hevc', 'hevx', 'mif1', 'msf1'];
    if (bytes.length >= 12) {
      final brand = String.fromCharCodes(bytes.sublist(8, 12));
      if (brands.contains(brand)) return DetectedImageFormat.heic;
    }
  }

  return DetectedImageFormat.unknown;
}
