import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../data/image_normalizer.dart';
import '../data/ocr_service.dart';
import '../data/share_intake.dart';
import '../data/source_file_store.dart';
import '../data/source_store.dart';
import '../domain/document_intake.dart';
import '../domain/source_item.dart';
import '../domain/text_normalizer.dart';
import 'ocr_script_controller.dart';

final _uuid = Uuid();

final imagePickerProvider = Provider<ImagePicker>((ref) => ImagePicker());

final _documentsDirectoryProvider = FutureProvider<Directory>(
  (ref) => getApplicationDocumentsDirectory(),
);

final sourceStoreProvider = FutureProvider<SourceStore>((ref) async {
  return JsonFileSourceStore(await ref.watch(_documentsDirectoryProvider.future));
});

final sourceFileStoreProvider = FutureProvider<SourceFileStore>((ref) async {
  return DirectorySourceFileStore(
    await ref.watch(_documentsDirectoryProvider.future),
  );
});

final imageNormalizerProvider =
    Provider<ImageNormalizer>((ref) => const IsolateImageNormalizer());

/// Rebuilt whenever the chosen script changes.
///
/// Constructing a `TextRecognizer` loads a model, so this deliberately happens
/// when the setting changes rather than on the capture the user is waiting on.
/// The old service is disposed by `ref.onDispose`, which Riverpod runs on
/// rebuild — without it each change would leak a native recogniser.
final ocrServiceProvider = Provider<OcrService>((ref) {
  final service = MlKitOcrService(script: ref.watch(ocrScriptProvider));
  ref.onDispose(service.dispose);
  return service;
});

/// Picks images and hands back a temp file. Nothing is persisted here — the
/// user has not agreed to keep it yet.
class CapturePicker {
  const CapturePicker(this._picker);

  final ImagePicker _picker;

  /// No `maxWidth`/`imageQuality` here on purpose. Those only re-encode JPEG,
  /// so a PNG screenshot passed through untouched — which is how day 3 stored a
  /// 5.6MB "compressed" capture. Resizing and re-encoding now happen in
  /// [ImageNormalizer], where they apply to every format.
  Future<XFile?> fromCamera() => _picker.pickImage(source: ImageSource.camera);

  Future<XFile?> fromGallery() => _picker.pickImage(source: ImageSource.gallery);

  /// Android can reclaim this app while the camera is in the foreground. When
  /// that happens the picker's result is delivered here on next launch instead
  /// of to the awaiting call, which was discarded along with the process.
  Future<XFile?> recoverLostCapture() async {
    final response = await _picker.retrieveLostData();
    if (response.isEmpty || response.file == null) return null;
    return response.file;
  }
}

/// Where shares from other apps arrive.
///
/// A `Provider` rather than a `FutureProvider` because the channel is cheap to
/// construct and a share can be waiting before anything async has resolved.
final shareIntakeProvider = Provider<ShareIntake>((ref) {
  final intake = PlatformShareIntake();
  ref.onDispose(intake.dispose);
  return intake;
});

final capturePickerProvider = Provider<CapturePicker>(
  (ref) => CapturePicker(ref.watch(imagePickerProvider)),
);

/// The list of captured sources, and the only sanctioned way to mutate it.
class SourcesNotifier extends AsyncNotifier<List<SourceItem>> {
  /// Recognition is started with [unawaited] and outlives the widget that
  /// triggered it, so a result can arrive after this notifier is gone.
  bool _disposed = false;

  @override
  Future<List<SourceItem>> build() async {
    _disposed = false;
    ref.onDispose(() => _disposed = true);

    final store = await ref.watch(sourceStoreProvider.future);
    return store.all();
  }

  /// Picks up captures that were stored but never finished being read.
  ///
  /// Recognition is fired off with [unawaited], so a capture whose process is
  /// killed mid-read — backgrounded, low memory, swiped away — leaves a record
  /// sitting in [SourceProcessingState.pending] or `processing` that nothing
  /// would ever look at again. Found on a real device: day-3 records showed
  /// "Reading the text…" indefinitely, and because that state offers neither
  /// retry nor manual entry, the capture was unreachable. Limbo is worse than
  /// failure, which at least has a way out.
  ///
  /// Called by the inbox on first frame rather than from [build], so loading
  /// the list stays a pure read and the resume happens at a point the app
  /// chooses. Self-limiting: [runOcr] records a failure for anything it cannot
  /// read, so a genuinely unreadable capture is attempted once and then leaves
  /// the user the manual path, instead of being retried on every launch.
  Future<void> resumeUnfinished() async {
    final store = await ref.read(sourceStoreProvider.future);
    final unfinished = (await store.all())
        .where((i) => !i.isProcessed && i.hasImage)
        .toList();

    for (final item in unfinished) {
      if (_disposed) return;
      await runOcr(item.id);
    }
  }

  Future<SourceItem> addPastedText(String text) async {
    final item = SourceItem(
      id: _uuid.v4(),
      type: SourceType.pastedText,
      capturedAt: DateTime.now(),
      pastedText: normalizeOcrText(text),
      // Pasted text needs no recognition; it is analysis-ready on arrival.
      state: SourceProcessingState.ready,
    );
    await _add(item);
    return item;
  }

  /// Opens the document picker and stores what comes back, or reports why not.
  ///
  /// Returns null when the user backed out. Returns a [RejectedDocument] when
  /// the file cannot be used — refused *before* anything is stored, so a
  /// document Action cannot read never becomes a capture the user has to
  /// tidy up.
  ///
  /// **No OCR.** A PDF's text is read by the provider that receives it, not on
  /// this device, so the capture is ready the moment it is stored. That is
  /// also why [SourceItem.documentPath] is a separate field: the resume pass
  /// looks for unfinished *images*, and a document must not be swept into it.
  Future<Object?> addPickedDocument() async {
    final picked = await ref.read(shareIntakeProvider).pickDocument();
    if (picked == null) return null;

    return addSharedDocument(
      path: picked.path,
      sizeBytes: picked.sizeBytes,
      declaredName: picked.declaredName,
    );
  }

  /// Validates and stores a PDF that already sits in a file this app owns.
  ///
  /// The picker and the share sheet both land here. An encrypted or truncated
  /// PDF has to be refused the same way whichever door it came through, and a
  /// second implementation of that judgement is a second place for it to drift.
  Future<Object?> addSharedDocument({
    required String path,
    required int sizeBytes,
    String? declaredName,
  }) async {
    final file = File(path);
    final Uint8List header;
    final Uint8List content;
    try {
      header = await _leadingBytes(file, DocumentIntake.headerBytes);
      // Bounded: the probe only reads the two ends of a file, and holding a
      // 25 MB document in memory to answer one question would be wasteful on
      // the way to sending it anyway.
      content = await file.readAsBytes();
    } on FileSystemException {
      return const RejectedDocument('That document could not be read.');
    }

    final outcome = DocumentIntake.validate(
      path: path,
      declaredName: declaredName,
      sizeBytes: sizeBytes,
      header: header,
      content: content,
    );
    if (outcome is RejectedDocument) {
      // Nothing was stored, so nothing needs cleaning up beyond the platform's
      // own copy, which lives in the cache directory Android reclaims.
      unawaited(file.delete().catchError((_) => file));
      return outcome;
    }

    final accepted = outcome as AcceptedDocument;
    final store = await ref.read(sourceStoreProvider.future);
    final files = await ref.read(sourceFileStoreProvider.future);
    final id = _uuid.v4();

    // Named for what it is: the parameter `path` is where the file came from,
    // this is where the capture keeps it.
    final storedPath = await files.save(
      id: id,
      bytes: content,
      extension: 'pdf',
    );
    // The platform's copy has served its purpose; the capture owns its bytes
    // now and two copies of the user's document is one too many.
    unawaited(file.delete().catchError((_) => file));

    final item = SourceItem(
      id: id,
      type: SourceType.document,
      capturedAt: DateTime.now(),
      documentPath: storedPath,
      pageCount: accepted.pageCount,
      mimeType: 'application/pdf',
      originalByteSize: accepted.sizeBytes,
      byteSize: accepted.sizeBytes,
      // Nothing local left to do.
      state: SourceProcessingState.ready,
    );
    await store.add(item);
    await _publish(store);
    return item;
  }

  static Future<Uint8List> _leadingBytes(File file, int count) async {
    final handle = await file.open();
    try {
      final buffer = Uint8List(count);
      final read = await handle.readInto(buffer);
      return Uint8List.sublistView(buffer, 0, read);
    } finally {
      await handle.close();
    }
  }

  /// Normalizes the picked file, writes the processed bytes, records the
  /// capture, then starts recognition in the background.
  Future<SourceItem> addImage(String pickedPath, SourceType type) async {
    final store = await ref.read(sourceStoreProvider.future);
    final files = await ref.read(sourceFileStoreProvider.future);
    final id = _uuid.v4();

    final original = await File(pickedPath).readAsBytes();

    SourceItem item;
    try {
      final normalized = await ref
          .read(imageNormalizerProvider)
          .normalize(NormalizeRequest(bytes: original));

      final path = await files.save(
        id: id,
        bytes: normalized.bytes,
        extension: normalized.format.extension,
      );

      item = SourceItem(
        id: id,
        type: type,
        capturedAt: DateTime.now(),
        imagePath: path,
        mimeType: normalized.format.mimeType,
        originalFormat: normalized.originalFormat.name,
        imageWidth: normalized.width,
        imageHeight: normalized.height,
        originalByteSize: normalized.originalByteSize,
        byteSize: normalized.processedByteSize,
      );
    } on ImageDecodeException catch (error) {
      // Keep the bytes we were given so the user still has their capture and
      // can type the details in, rather than losing the whole thing.
      final detected = error.detectedFormat;
      final path = await files.save(
        id: id,
        bytes: original,
        extension: detected.extension,
      );
      item = SourceItem(
        id: id,
        type: type,
        capturedAt: DateTime.now(),
        imagePath: path,
        mimeType: detected.mimeType,
        originalFormat: detected.name,
        originalByteSize: original.length,
        byteSize: original.length,
        state: SourceProcessingState.failed,
        failureReason: "That image format couldn't be read on this device.",
      );
    }

    await store.add(item);
    await _publish(store);

    if (item.state != SourceProcessingState.failed) {
      unawaited(runOcr(item.id));
    }
    return item;
  }

  /// Runs recognition and folds the outcome back into the stored record.
  Future<void> runOcr(String id) async {
    final store = await ref.read(sourceStoreProvider.future);
    final existing = await store.byId(id);
    if (existing == null || existing.imagePath == null) return;

    await _replace(
      store,
      existing.copyWith(
        state: SourceProcessingState.processing,
        clearFailure: true,
      ),
    );

    try {
      final outcome =
          await ref.read(ocrServiceProvider).recognize(existing.imagePath!);
      await _replace(
        store,
        existing.copyWith(
          ocr: outcome,
          state: SourceProcessingState.ready,
          clearFailure: true,
        ),
      );
    } on OcrFailure catch (error) {
      await _replace(
        store,
        existing.copyWith(
          state: SourceProcessingState.failed,
          failureReason: error.message,
        ),
      );
    }
  }

  /// Manual fallback when recognition fails or finds nothing usable. The typed
  /// text becomes the analysis text; the raw OCR output, if any, is left intact
  /// so the record of what the machine actually read is not overwritten.
  Future<void> setManualText(String id, String text) async {
    final store = await ref.read(sourceStoreProvider.future);
    final existing = await store.byId(id);
    if (existing == null) return;

    await _replace(
      store,
      existing.copyWith(
        pastedText: normalizeOcrText(text),
        state: SourceProcessingState.ready,
        clearFailure: true,
      ),
    );
  }

  Future<void> delete(String id) async {
    final store = await ref.read(sourceStoreProvider.future);
    final files = await ref.read(sourceFileStoreProvider.future);

    final item = await store.byId(id);
    if (item?.imagePath != null) await files.delete(item!.imagePath!);

    await store.delete(id);
    await _publish(store);
  }

  Future<void> _add(SourceItem item) async {
    final store = await ref.read(sourceStoreProvider.future);
    await store.add(item);
    await _publish(store);
  }

  Future<void> _replace(SourceStore store, SourceItem item) async {
    await store.update(item);
    await _publish(store);
  }

  /// The store is written first and unconditionally; only the in-memory
  /// publish is skipped once disposed. A recognition result that lands after
  /// the notifier is gone must still reach disk, or the next launch would
  /// resume work that had in fact already finished.
  Future<void> _publish(SourceStore store) async {
    if (_disposed) return;
    state = AsyncValue.data(await store.all());
  }
}

final sourcesProvider =
    AsyncNotifierProvider<SourcesNotifier, List<SourceItem>>(
  SourcesNotifier.new,
);
