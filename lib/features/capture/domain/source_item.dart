import 'ocr_result.dart';

/// Where a captured item came from.
///
/// Provenance is a product requirement, not bookkeeping: every action the app
/// eventually proposes has to be traceable back to the thing the user handed
/// us, or there is no reason to trust it.
enum SourceType {
  photo('Captured from photo'),
  gallery('Captured from image'),
  pastedText('Captured from pasted text'),
  document('Added as a document');

  const SourceType(this.provenanceLabel);

  final String provenanceLabel;

  static SourceType fromName(String? name) {
    return SourceType.values.firstWhere(
      (t) => t.name == name,
      // Values written by a newer build must stay readable on an older one.
      orElse: () => SourceType.gallery,
    );
  }
}

/// How far a capture has got through local processing.
enum SourceProcessingState {
  /// Stored, not yet read.
  pending,

  /// Normalisation or OCR is running.
  processing,

  /// Text is available — including the legitimate case of a picture with no
  /// text in it, which is [ready] with empty OCR rather than [failed].
  ready,

  /// Processing could not complete. Manual entry is the way forward.
  failed;

  static SourceProcessingState fromName(String? name) {
    return SourceProcessingState.values.firstWhere(
      (s) => s.name == name,
      orElse: () => SourceProcessingState.pending,
    );
  }
}

/// One raw input the user handed to the app, plus whatever local processing has
/// established about it.
///
/// Deliberately holds no interpretation: no urgency, no deadline, no proposed
/// action. Those belong to `Action`, created only after the user confirms.
/// Re-running analysis never mutates the captured bytes or the raw OCR text.
class SourceItem {
  const SourceItem({
    required this.id,
    required this.type,
    required this.capturedAt,
    this.pastedText,
    this.imagePath,
    this.documentPath,
    this.pageCount,
    this.mimeType,
    this.originalFormat,
    this.imageWidth,
    this.imageHeight,
    this.originalByteSize,
    this.byteSize,
    this.ocr,
    this.state = SourceProcessingState.pending,
    this.failureReason,
  });

  final String id;
  final SourceType type;
  final DateTime capturedAt;

  /// Text the user pasted. Null for image captures.
  final String? pastedText;

  /// Absolute path to the normalized image. Capture bytes are written to the
  /// device's app-private storage; nothing in the capture or OCR pipeline
  /// uploads them. Remote processing, when it is introduced for extraction,
  /// will be a separate and explicitly disclosed step.
  final String? imagePath;

  /// MIME type of the bytes actually on disk, derived from the bytes rather
  /// than from a filename.
  final String? mimeType;

  /// What the user originally supplied, before re-encoding. A PNG here is a
  /// strong hint the capture was a screenshot.
  final String? originalFormat;

  /// Absolute path to a document this app copied into its own storage.
  ///
  /// Separate from [imagePath] rather than sharing it, because almost
  /// everything downstream branches on the difference: OCR must not run on a
  /// PDF, the inbox must not try to draw one as a thumbnail, and the resume
  /// pass must not pick one up as unfinished. One field holding either would
  /// make every one of those a guess.
  final String? documentPath;

  /// Pages, when the document said so plainly enough to be believed.
  ///
  /// Null means *unknown*, never zero — see [PdfProbe]. A scope disclosure
  /// falls back to counting files rather than claiming a page count it does
  /// not have.
  final int? pageCount;

  final int? imageWidth;
  final int? imageHeight;

  /// Size as picked, before normalisation.
  final int? originalByteSize;

  /// Size on disk after normalisation.
  final int? byteSize;

  final OcrOutcome? ocr;
  final SourceProcessingState state;
  final String? failureReason;

  bool get hasImage => imagePath != null;

  bool get hasDocument => documentPath != null;

  /// What day-5 extraction will read. Pasted text is already analysis-ready;
  /// image captures contribute their normalized OCR text.
  String get analysisText =>
      (ocr?.normalizedText.trim().isNotEmpty ?? false)
          ? ocr!.normalizedText
          : (pastedText?.trim() ?? '');

  bool get hasText => analysisText.isNotEmpty;

  bool get isProcessed =>
      state == SourceProcessingState.ready ||
      state == SourceProcessingState.failed;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'capturedAt': capturedAt.toIso8601String(),
        'pastedText': pastedText,
        'imagePath': imagePath,
        'documentPath': documentPath,
        'pageCount': pageCount,
        'mimeType': mimeType,
        'originalFormat': originalFormat,
        'imageWidth': imageWidth,
        'imageHeight': imageHeight,
        'originalByteSize': originalByteSize,
        'byteSize': byteSize,
        'ocr': ocr?.toJson(),
        'state': state.name,
        'failureReason': failureReason,
      };

  static SourceItem fromJson(Map<String, dynamic> json) {
    return SourceItem(
      id: json['id'] as String,
      type: SourceType.fromName(json['type'] as String?),
      capturedAt:
          DateTime.tryParse(json['capturedAt'] as String? ?? '') ?? DateTime.now(),
      // `rawText` is the pre-day-4 field name; records written before the OCR
      // fields existed still read correctly.
      pastedText: (json['pastedText'] ?? json['rawText']) as String?,
      imagePath: json['imagePath'] as String?,
      // Absent from every record written before V2, which reads correctly as
      // "not a document".
      documentPath: json['documentPath'] as String?,
      pageCount: (json['pageCount'] as num?)?.toInt(),
      mimeType: json['mimeType'] as String?,
      originalFormat: json['originalFormat'] as String?,
      imageWidth: (json['imageWidth'] as num?)?.toInt(),
      imageHeight: (json['imageHeight'] as num?)?.toInt(),
      originalByteSize: (json['originalByteSize'] as num?)?.toInt(),
      byteSize: (json['byteSize'] as num?)?.toInt(),
      ocr: json['ocr'] is Map<String, dynamic>
          ? OcrOutcome.fromJson(json['ocr'] as Map<String, dynamic>)
          : null,
      state: SourceProcessingState.fromName(json['state'] as String?),
      failureReason: json['failureReason'] as String?,
    );
  }

  SourceItem copyWith({
    OcrOutcome? ocr,
    SourceProcessingState? state,
    String? failureReason,
    String? pastedText,
    bool clearFailure = false,
  }) {
    return SourceItem(
      id: id,
      type: type,
      capturedAt: capturedAt,
      pastedText: pastedText ?? this.pastedText,
      imagePath: imagePath,
      mimeType: mimeType,
      originalFormat: originalFormat,
      imageWidth: imageWidth,
      imageHeight: imageHeight,
      originalByteSize: originalByteSize,
      byteSize: byteSize,
      ocr: ocr ?? this.ocr,
      state: state ?? this.state,
      failureReason:
          clearFailure ? null : (failureReason ?? this.failureReason),
    );
  }
}
