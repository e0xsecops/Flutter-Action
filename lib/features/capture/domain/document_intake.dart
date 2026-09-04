/// Deciding whether a document Action was handed can be used.
///
/// Two checks, in this order, and the order matters. First: is this actually a
/// PDF? Answered from the leading bytes by [FileIdentifier], never from the
/// extension or from what the picker said — a file called `statement.pdf` is a
/// claim by whoever named it. Second: can it be read? Answered by [PdfProbe],
/// which also refuses anything password-protected.
///
/// **Why refuse an encrypted PDF rather than send it.** A provider cannot open
/// it either, so the run would cost the user money on their own key and come
/// back with nothing. Saying so here is the difference between a limitation and
/// a bill.
library;

import 'dart:typed_data';

import '../../../core/security/file_identity.dart';
import 'pdf_probe.dart';
import 'shared_payload.dart';

/// A document that passed both checks.
class AcceptedDocument {
  const AcceptedDocument({
    required this.path,
    required this.sizeBytes,
    this.pageCount,
    this.suggestedName,
    this.version,
  });

  final String path;
  final int sizeBytes;

  /// Null means unknown, never zero.
  final int? pageCount;

  /// A cleaned form of the file's own name.
  ///
  /// Kept for the user to recognise it by and deliberately *not* used as the
  /// label sent to a provider — a document's name is the most identifying
  /// string a capture carries.
  final String? suggestedName;

  final String? version;
}

/// A document that did not.
class RejectedDocument {
  const RejectedDocument(this.message);

  final String message;
}

abstract final class DocumentIntake {
  /// The largest document Action will take.
  ///
  /// Matched to what can actually be done with it rather than to what the
  /// device could hold: every provider has an input limit well below this, and
  /// a document past it would be refused at the far end after the user had
  /// waited for an upload.
  static const maxBytes = 25 * 1024 * 1024;

  /// Enough leading bytes to identify the format.
  static const headerBytes = 32;

  /// Validates a document the platform has already copied into app storage.
  ///
  /// [header] is its first bytes; [content] is as much of it as should be
  /// scanned for structure. They are separate parameters so a caller can pass
  /// a bounded window of a large file rather than all of it.
  static Object validate({
    required String path,
    required String? declaredName,
    required int sizeBytes,
    required Uint8List header,
    required Uint8List content,
  }) {
    if (sizeBytes <= 0) {
      return const RejectedDocument('That file is empty.');
    }
    if (sizeBytes > maxBytes) {
      return RejectedDocument(
        'That document is ${formatBytes(sizeBytes)}, which is larger than '
        'Action can work with.',
      );
    }

    // The bytes, not the name. A file called statement.pdf is a claim.
    final detected = FileIdentifier.detectType(header);
    if (detected?.mimeType != 'application/pdf') {
      return const RejectedDocument(
        'That is not a PDF, whatever it is called. Action reads PDFs and '
        'images.',
      );
    }

    final probe = PdfProbe.probe(content);
    final rejection = probe.rejection;
    if (rejection != null) {
      return RejectedDocument(describePdfRejection(rejection));
    }

    return AcceptedDocument(
      path: path,
      sizeBytes: sizeBytes,
      pageCount: probe.pageCount,
      version: probe.version,
      suggestedName: ShareValidator.sanitiseName(declaredName),
    );
  }
}
