/// Where a captured item came from.
///
/// Source provenance is a product requirement, not bookkeeping: every action
/// the app eventually proposes has to be traceable back to the thing the user
/// handed us, or the user has no reason to trust it.
enum SourceType {
  photo('Captured from photo'),
  gallery('Captured from image'),
  pastedText('Captured from pasted text');

  const SourceType(this.provenanceLabel);

  /// Shown verbatim on cards and detail screens.
  final String provenanceLabel;

  static SourceType fromName(String? name) {
    return SourceType.values.firstWhere(
      (t) => t.name == name,
      // Unknown values can only come from a newer build's data, so degrade to
      // something displayable instead of throwing on read.
      orElse: () => SourceType.gallery,
    );
  }
}

/// One raw input the user handed to the app, before any interpretation.
///
/// A [SourceItem] is deliberately dumb — it holds what was captured and nothing
/// about what it means. OCR text lands in [rawText] on day 4; extraction reads
/// from here and writes elsewhere, so re-running analysis never mutates the
/// original.
class SourceItem {
  const SourceItem({
    required this.id,
    required this.type,
    required this.capturedAt,
    this.rawText,
    this.imagePath,
    this.byteSize,
  });

  final String id;
  final SourceType type;
  final DateTime capturedAt;

  /// Pasted text now; OCR output from day 4 onward.
  final String? rawText;

  /// Absolute path to the compressed image inside the app's documents
  /// directory. Null for pasted text. Images stay on device in V1 — nothing is
  /// uploaded — which is what lets the privacy screen make an honest claim.
  final String? imagePath;

  final int? byteSize;

  bool get hasImage => imagePath != null;

  bool get hasText => (rawText?.trim().isNotEmpty) ?? false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'capturedAt': capturedAt.toIso8601String(),
        'rawText': rawText,
        'imagePath': imagePath,
        'byteSize': byteSize,
      };

  static SourceItem fromJson(Map<String, dynamic> json) {
    return SourceItem(
      id: json['id'] as String,
      type: SourceType.fromName(json['type'] as String?),
      capturedAt:
          DateTime.tryParse(json['capturedAt'] as String? ?? '') ?? DateTime.now(),
      rawText: json['rawText'] as String?,
      imagePath: json['imagePath'] as String?,
      byteSize: (json['byteSize'] as num?)?.toInt(),
    );
  }

  SourceItem copyWith({String? rawText}) {
    return SourceItem(
      id: id,
      type: type,
      capturedAt: capturedAt,
      rawText: rawText ?? this.rawText,
      imagePath: imagePath,
      byteSize: byteSize,
    );
  }
}
