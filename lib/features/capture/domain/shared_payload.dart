/// Something another app handed to Action, and whether it can be believed.
///
/// **Everything on the way in is a claim.** The sending app chose the URI, the
/// MIME type and the file name; none of them has been checked by anyone, and a
/// share sheet is an interface any installed app can send through. So the
/// declared type is treated as a hint and the leading bytes are treated as the
/// fact, exactly the way [FileIdentifier] already treats a downloaded file.
///
/// The platform half has already copied the bytes into storage this app owns —
/// see `MainActivity.copyToOwnStorage` — so nothing here depends on a
/// `content://` grant that expires, and nothing here can be swapped out from
/// under it between the check and the use.
///
/// **What this deliberately does not do.** It does not open anything, does not
/// follow a URL found in shared text, and does not decide the content is safe.
/// It decides only whether Action can read it, and says plainly when it cannot.
library;

import 'dart:typed_data';

import '../../../core/security/file_identity.dart';

/// What arrived.
enum SharedKind { text, image }

/// Why a share was refused.
///
/// Separate cases because each needs a different sentence: "too big" is the
/// user's problem to solve, "not something Action reads" is a limitation to
/// state, and "the file says one thing and contains another" is worth naming
/// rather than hiding behind a generic failure.
enum ShareRejection {
  /// Nothing usable in the intent.
  empty,

  /// A type Action has no way to read.
  unsupportedType,

  /// The declared type and the actual bytes disagree.
  contentMismatch,

  /// Past the cap.
  tooLarge,

  /// The copy could not be read back.
  unreadable,
}

String describeShareRejection(ShareRejection rejection) => switch (rejection) {
      ShareRejection.empty => 'There was nothing in that share to read.',
      ShareRejection.unsupportedType =>
        'Action can take text and images. That was something else.',
      ShareRejection.contentMismatch =>
        'That file is not the kind of file it says it is, so Action has not '
            'opened it.',
      ShareRejection.tooLarge =>
        'That file is too large for Action to work with.',
      ShareRejection.unreadable => 'That file could not be read.',
    };

/// A share that passed every check.
sealed class SharedPayload {
  const SharedPayload();
}

final class SharedText extends SharedPayload {
  const SharedText({required this.text, this.truncated = false});

  final String text;

  /// The sender's text was longer than the platform cap and was cut.
  ///
  /// Surfaced rather than swallowed: a silently shortened notice is one whose
  /// deadline may be missing.
  final bool truncated;
}

final class SharedImage extends SharedPayload {
  const SharedImage({
    required this.path,
    required this.mimeType,
    required this.sizeBytes,
    this.suggestedName,
  });

  final String path;

  /// The type established from the *bytes*, never the one that was declared.
  final String mimeType;

  final int sizeBytes;

  /// A cleaned form of the sender's file name, or null.
  final String? suggestedName;
}

/// A share that did not.
final class SharedRejected extends SharedPayload {
  const SharedRejected(this.reason);

  final ShareRejection reason;

  String get message => describeShareRejection(reason);
}

abstract final class ShareValidator {
  /// The same cap the platform half enforces, restated so the Dart side is not
  /// trusting the platform to have done it.
  static const maxBytes = 25 * 1024 * 1024;

  /// Image types Action's pipeline can actually normalise and read.
  ///
  /// Deliberately not "anything image/*": the manifest advertises `image/*`
  /// because that is the coarsest filter a share sheet offers, and this is
  /// where the real answer lives.
  static const readableImageTypes = {
    'image/jpeg',
    'image/png',
    'image/webp',
    'image/heic',
    'image/heif',
    'image/bmp',
    'image/gif',
  };

  /// Validates shared text.
  static SharedPayload validateText(String? text, {bool truncated = false}) {
    final trimmed = text?.trim() ?? '';
    if (trimmed.isEmpty) return const SharedRejected(ShareRejection.empty);
    return SharedText(text: trimmed, truncated: truncated);
  }

  /// Validates a shared file that the platform has already copied.
  ///
  /// [header] is the leading bytes of the copy. The declared type is only ever
  /// used to decide *what kind of thing was claimed*; whether that claim is
  /// true is decided by [FileIdentifier].
  static SharedPayload validateFile({
    required String path,
    required String? declaredMimeType,
    required String? declaredName,
    required int sizeBytes,
    required Uint8List header,
  }) {
    if (sizeBytes <= 0) return const SharedRejected(ShareRejection.empty);
    if (sizeBytes > maxBytes) {
      return const SharedRejected(ShareRejection.tooLarge);
    }

    final detected = FileIdentifier.detectType(header);
    if (detected == null) {
      // Unknown bytes. Not called a mismatch, because nothing was contradicted
      // — Action simply does not recognise it.
      return const SharedRejected(ShareRejection.unsupportedType);
    }

    if (!readableImageTypes.contains(detected.mimeType)) {
      // The case worth naming: a sender that declared an image and sent
      // something else. Reported as a mismatch rather than as "unsupported",
      // because the two are different situations and only one of them is
      // suspicious.
      final claimedImage = declaredMimeType?.startsWith('image/') ?? false;
      return SharedRejected(
        claimedImage
            ? ShareRejection.contentMismatch
            : ShareRejection.unsupportedType,
      );
    }

    return SharedImage(
      path: path,
      mimeType: detected.mimeType,
      sizeBytes: sizeBytes,
      suggestedName: sanitiseName(declaredName),
    );
  }

  /// The sender's file name, made safe to show.
  ///
  /// It is free text chosen by another app and it reaches a screen, so: no path
  /// separators (a name is not a path), no control characters, and a length
  /// bound. Null rather than a mangled remnant when nothing survives — the name
  /// is a convenience and the capture works without it.
  static String? sanitiseName(String? raw) {
    if (raw == null) return null;
    final withoutPath = raw.split(RegExp(r'[/\\]')).last;
    final cleaned = withoutPath
        .replaceAll(RegExp(r'[\x00-\x1F\x7F]'), '')
        .trim();
    if (cleaned.isEmpty) return null;
    return cleaned.length > 80 ? cleaned.substring(0, 80) : cleaned;
  }
}
