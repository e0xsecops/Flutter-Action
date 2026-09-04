/// Establishes what a file actually is, independently of what it is called.
///
/// **Two questions, one answer.** "Is this the file I was told to expect?" is
/// answered by a hash. "Is this the *kind* of file it claims to be?" is
/// answered by reading the first few bytes. Both are cheap, both are local, and
/// both are things a person routinely wants to know about a download and has no
/// convenient way to find out on a phone.
///
/// **The naming rule, and why it is not negotiable.** This is not a virus
/// scanner. It contains no signatures, no heuristics about behaviour, and no
/// opinion about whether a file is malicious — a `.exe` renamed to `.pdf` is
/// reported as exactly that and nothing more. Calling this "security scanning"
/// would be a claim the code cannot support, and one that would lead someone to
/// trust a file because Action did not object to it. See
/// `docs/v2/AI_SECURITY_THREAT_MODEL.md` for the same rule stated for the
/// authenticity inspector.
///
/// **Streaming.** The digest is computed over a chunked read, so a large PDF
/// does not have to exist in memory twice to be hashed.
library;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

/// A file type recognised from its leading bytes.
class DetectedFileType {
  const DetectedFileType({
    required this.label,
    required this.mimeType,
    required this.extensions,
    this.container = false,
  });

  /// What to call it on screen.
  final String label;

  final String mimeType;

  /// Extensions consistent with this content. More than one because a single
  /// byte signature legitimately covers several file kinds.
  final List<String> extensions;

  /// True when this signature is a wrapper that many formats share.
  ///
  /// A `.docx` and an `.apk` are both Zip archives at the byte level. Reporting
  /// "this .docx is really a Zip" would be technically true and completely
  /// useless, so container types never raise a mismatch.
  final bool container;
}

/// Everything that could be established about one file.
class FileIdentity {
  const FileIdentity({
    required this.sha256,
    required this.sizeBytes,
    required this.fileName,
    this.detected,
  });

  /// Lowercase hex. The form every checksum on every download page uses.
  final String sha256;

  final int sizeBytes;
  final String fileName;

  /// Null when the leading bytes match nothing known — which is common and
  /// means nothing on its own.
  final DetectedFileType? detected;

  /// The extension as written, without the dot, lowercased. Empty when there
  /// is none.
  String get declaredExtension {
    final dot = fileName.lastIndexOf('.');
    if (dot < 0 || dot == fileName.length - 1) return '';
    return fileName.substring(dot + 1).toLowerCase();
  }

  /// True when the content is a recognised type and the name says otherwise.
  ///
  /// Deliberately false whenever anything is unknown. An unrecognised signature
  /// or a missing extension is an absence of evidence, and reporting it as a
  /// mismatch would make the signal meaningless through noise.
  bool get extensionMismatch {
    final type = detected;
    if (type == null || type.container) return false;
    final declared = declaredExtension;
    if (declared.isEmpty) return false;
    return !type.extensions.contains(declared);
  }

  /// The sentence shown when the name and the content disagree.
  String? get mismatchNote {
    if (!extensionMismatch) return null;
    return 'This file is named ".$declaredExtension" but its contents are '
        '${detected!.label}. That can be an honest mistake, and it is also how '
        'a file gets opened by something other than what you expected.';
  }

  /// Compares against a checksum the user pasted from wherever they got the
  /// file.
  ///
  /// Tolerant of the ways a hash arrives in the world — spaces, casing, a
  /// trailing filename from `sha256sum` output — because a comparison that
  /// fails on formatting teaches the user to ignore it.
  bool matchesExpected(String expected) {
    final cleaned = expected.trim().toLowerCase().split(RegExp(r'\s+')).first;
    if (cleaned.length != 64) return false;
    return _constantTimeEquals(cleaned, sha256);
  }

  /// Grouped in fours, which is how a person actually compares two hashes by
  /// eye. The ungrouped [sha256] is what gets copied.
  String get readableDigest {
    final buffer = StringBuffer();
    for (var i = 0; i < sha256.length; i += 4) {
      if (i > 0) buffer.write(' ');
      buffer.write(sha256.substring(i, i + 4));
    }
    return buffer.toString();
  }

  String get readableSize => formatBytes(sizeBytes);
}

/// Bytes as a person reads them.
String formatBytes(int bytes) {
  if (bytes < 1024) return '$bytes bytes';
  const units = ['KB', 'MB', 'GB'];
  var value = bytes / 1024;
  var unit = 0;
  while (value >= 1024 && unit < units.length - 1) {
    value /= 1024;
    unit++;
  }
  return '${value.toStringAsFixed(value >= 10 ? 0 : 1)} ${units[unit]}';
}

abstract final class FileIdentifier {
  /// Enough for every signature below, with room to reach the `ftyp` brand.
  static const _headerBytes = 32;

  /// Identifies [file]. Throws [FileSystemException] if it cannot be read,
  /// which the caller is expected to turn into a message rather than swallow.
  static Future<FileIdentity> identify(File file) async {
    final size = await file.length();
    final digest = await _digestOf(file);
    final header = await _headerOf(file);

    return FileIdentity(
      sha256: digest,
      sizeBytes: size,
      fileName: _baseName(file.path),
      detected: detectType(header),
    );
  }

  /// The same for bytes already in memory — a share-sheet payload, a test
  /// fixture.
  static FileIdentity identifyBytes(Uint8List bytes, {required String name}) {
    return FileIdentity(
      sha256: sha256.convert(bytes).toString(),
      sizeBytes: bytes.length,
      fileName: name,
      detected: detectType(bytes),
    );
  }

  static Future<String> _digestOf(File file) async {
    final output = AccumulatorSink<Digest>();
    final input = sha256.startChunkedConversion(output);
    await for (final chunk in file.openRead()) {
      input.add(chunk);
    }
    input.close();
    final result = output.events.single.toString();
    output.close();
    return result;
  }

  static Future<Uint8List> _headerOf(File file) async {
    final handle = await file.open();
    try {
      final buffer = Uint8List(_headerBytes);
      final read = await handle.readInto(buffer);
      return Uint8List.sublistView(buffer, 0, read);
    } finally {
      await handle.close();
    }
  }

  static String _baseName(String path) {
    final slash = path.lastIndexOf(RegExp(r'[/\\]'));
    return slash < 0 ? path : path.substring(slash + 1);
  }

  /// Recognises a type from leading bytes.
  ///
  /// Ordered so that a longer, more specific signature is tried before a
  /// shorter one that would also match it.
  static DetectedFileType? detectType(Uint8List header) {
    if (header.length < 4) return null;

    bool startsWith(List<int> magic, {int offset = 0}) {
      if (header.length < offset + magic.length) return false;
      for (var i = 0; i < magic.length; i++) {
        if (header[offset + i] != magic[i]) return false;
      }
      return true;
    }

    bool ascii(String text, {int offset = 0}) =>
        startsWith(text.codeUnits, offset: offset);

    if (startsWith(const [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])) {
      return const DetectedFileType(
        label: 'a PNG image',
        mimeType: 'image/png',
        extensions: ['png'],
      );
    }
    if (startsWith(const [0xFF, 0xD8, 0xFF])) {
      return const DetectedFileType(
        label: 'a JPEG image',
        mimeType: 'image/jpeg',
        extensions: ['jpg', 'jpeg', 'jpe'],
      );
    }
    if (ascii('GIF87a') || ascii('GIF89a')) {
      return const DetectedFileType(
        label: 'a GIF image',
        mimeType: 'image/gif',
        extensions: ['gif'],
      );
    }
    if (ascii('RIFF') && ascii('WEBP', offset: 8)) {
      return const DetectedFileType(
        label: 'a WebP image',
        mimeType: 'image/webp',
        extensions: ['webp'],
      );
    }
    if (ascii('RIFF') && ascii('WAVE', offset: 8)) {
      return const DetectedFileType(
        label: 'a WAV recording',
        mimeType: 'audio/wav',
        extensions: ['wav'],
      );
    }
    if (ascii('%PDF-')) {
      return const DetectedFileType(
        label: 'a PDF document',
        mimeType: 'application/pdf',
        extensions: ['pdf'],
      );
    }
    if (ascii('ftyp', offset: 4)) {
      final brand = String.fromCharCodes(
        header.sublist(8, header.length < 12 ? header.length : 12),
      );
      if (brand.startsWith('hei') || brand.startsWith('mif')) {
        return const DetectedFileType(
          label: 'a HEIC image',
          mimeType: 'image/heic',
          extensions: ['heic', 'heif'],
        );
      }
      return const DetectedFileType(
        label: 'a video file',
        mimeType: 'video/mp4',
        extensions: ['mp4', 'm4v', 'm4a', 'mov', '3gp'],
      );
    }
    if (startsWith(const [0x49, 0x49, 0x2A, 0x00]) ||
        startsWith(const [0x4D, 0x4D, 0x00, 0x2A])) {
      return const DetectedFileType(
        label: 'a TIFF image',
        mimeType: 'image/tiff',
        extensions: ['tif', 'tiff'],
      );
    }
    if (ascii('BM')) {
      return const DetectedFileType(
        label: 'a bitmap image',
        mimeType: 'image/bmp',
        extensions: ['bmp'],
      );
    }
    if (ascii(r'{\rtf')) {
      return const DetectedFileType(
        label: 'an RTF document',
        mimeType: 'application/rtf',
        extensions: ['rtf'],
      );
    }
    if (startsWith(const [0x50, 0x4B, 0x03, 0x04]) ||
        startsWith(const [0x50, 0x4B, 0x05, 0x06])) {
      return const DetectedFileType(
        label: 'a Zip archive',
        mimeType: 'application/zip',
        // Every modern office format and every Android package is a Zip.
        extensions: [
          'zip', 'docx', 'xlsx', 'pptx', 'apk', 'jar', 'epub', 'odt', 'ods',
          'odp', 'aab', 'ipa', 'xpi',
        ],
        container: true,
      );
    }
    if (startsWith(const [0x1F, 0x8B])) {
      return const DetectedFileType(
        label: 'a gzip archive',
        mimeType: 'application/gzip',
        extensions: ['gz', 'tgz'],
        container: true,
      );
    }
    if (startsWith(const [0x37, 0x7A, 0xBC, 0xAF, 0x27, 0x1C])) {
      return const DetectedFileType(
        label: 'a 7-Zip archive',
        mimeType: 'application/x-7z-compressed',
        extensions: ['7z'],
        container: true,
      );
    }
    if (ascii('Rar!')) {
      return const DetectedFileType(
        label: 'a RAR archive',
        mimeType: 'application/vnd.rar',
        extensions: ['rar'],
        container: true,
      );
    }
    // Executables. Reported because a name/content mismatch here is the one
    // worth showing a person, not because Action judges the file.
    if (startsWith(const [0x4D, 0x5A])) {
      return const DetectedFileType(
        label: 'a Windows program',
        mimeType: 'application/vnd.microsoft.portable-executable',
        extensions: ['exe', 'dll', 'sys', 'msi', 'scr'],
      );
    }
    if (startsWith(const [0x7F, 0x45, 0x4C, 0x46])) {
      return const DetectedFileType(
        label: 'a Linux program',
        mimeType: 'application/x-elf',
        extensions: ['elf', 'so', 'bin', 'o'],
      );
    }
    if (ascii('%!PS')) {
      return const DetectedFileType(
        label: 'a PostScript document',
        mimeType: 'application/postscript',
        extensions: ['ps', 'eps'],
      );
    }
    if (ascii('OggS')) {
      return const DetectedFileType(
        label: 'an Ogg recording',
        mimeType: 'audio/ogg',
        extensions: ['ogg', 'oga', 'opus'],
      );
    }
    if (ascii('ID3') || startsWith(const [0xFF, 0xFB])) {
      return const DetectedFileType(
        label: 'an MP3 recording',
        mimeType: 'audio/mpeg',
        extensions: ['mp3'],
      );
    }

    if (_looksLikeText(header)) {
      return const DetectedFileType(
        label: 'plain text',
        mimeType: 'text/plain',
        // Text is the ultimate container: source code, CSV, JSON, Markdown and
        // an SVG are all text, so this must never raise a mismatch.
        extensions: ['txt', 'md', 'csv', 'json', 'xml', 'svg', 'log', 'yaml'],
        container: true,
      );
    }

    return null;
  }

  /// A conservative text check over the header only.
  ///
  /// A NUL byte anywhere is the classic disqualifier and is what every `file`
  /// implementation uses; beyond that this only asks that the bytes decode and
  /// are mostly printable.
  static bool _looksLikeText(Uint8List header) {
    if (header.isEmpty) return false;
    if (header.contains(0)) return false;
    try {
      const Utf8Decoder(allowMalformed: false).convert(header);
    } on FormatException {
      // A multi-byte character can legitimately be cut in half by the header
      // boundary, so this is not conclusive either way. Treat it as unknown.
      return false;
    }
    final printable = header
        .where((b) => b >= 0x20 || b == 0x09 || b == 0x0A || b == 0x0D)
        .length;
    return printable / header.length > 0.9;
  }
}

/// Compares two hex digests without an early return on the first difference.
///
/// The timing here cannot realistically be observed — both values are already
/// on the device and there is no oracle to attack. It is written this way
/// because a checksum comparison that short-circuits is the kind of thing that
/// gets copied into somewhere it does matter.
bool _constantTimeEquals(String a, String b) {
  if (a.length != b.length) return false;
  var difference = 0;
  for (var i = 0; i < a.length; i++) {
    difference |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
  }
  return difference == 0;
}
