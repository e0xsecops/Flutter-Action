import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../data/source_store.dart';
import '../domain/source_item.dart';

final _uuid = Uuid();

final imagePickerProvider = Provider<ImagePicker>((ref) => ImagePicker());

/// The extension of the file we were handed, defaulting to `jpg`.
///
/// image_picker preserves the source encoding, so a picked screenshot arrives
/// as a PNG. Naming every stored file `.jpg` regardless would make the filename
/// lie about its contents, and anything downstream that infers a MIME type from
/// the extension — upload headers, OCR input handling — would then be wrong.
///
/// Note this only makes the *name* honest. PNG screenshots still bypass
/// `imageQuality`, which is a JPEG-only setting, so they are not actually being
/// compressed. Re-encoding belongs with the day-4 image pipeline.
String imageExtensionFor(String path) {
  final dot = path.lastIndexOf('.');
  final separator = path.lastIndexOf(Platform.pathSeparator);
  if (dot <= separator || dot == path.length - 1) return 'jpg';

  final extension = path.substring(dot + 1).toLowerCase();
  // Guard against a long trailing segment after a dot in a directory name
  // being mistaken for an extension.
  return extension.length <= 5 ? extension : 'jpg';
}

final sourceStoreProvider = FutureProvider<SourceStore>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return JsonFileSourceStore(dir);
});

/// Picks images and hands back a temp file. Nothing is persisted here — the
/// user has not agreed to keep it yet. Persistence happens only when they
/// continue from the preview screen.
class CapturePicker {
  const CapturePicker(this._picker);

  final ImagePicker _picker;

  /// Downscaled and re-encoded at pick time. Doing it here rather than after
  /// the fact means the full-resolution bytes never reach our storage, which
  /// keeps both the footprint and the eventual upload small.
  static const _maxEdge = 2048.0;
  static const _quality = 85;

  Future<XFile?> fromCamera() => _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: _maxEdge,
        maxHeight: _maxEdge,
        imageQuality: _quality,
      );

  Future<XFile?> fromGallery() => _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: _maxEdge,
        maxHeight: _maxEdge,
        imageQuality: _quality,
      );
}

final capturePickerProvider = Provider<CapturePicker>(
  (ref) => CapturePicker(ref.watch(imagePickerProvider)),
);

/// The list of captured sources, and the only sanctioned way to mutate it.
class SourcesNotifier extends AsyncNotifier<List<SourceItem>> {
  @override
  Future<List<SourceItem>> build() async {
    final store = await ref.watch(sourceStoreProvider.future);
    return store.all();
  }

  Future<SourceItem> addPastedText(String text) async {
    final item = SourceItem(
      id: _uuid.v4(),
      type: SourceType.pastedText,
      capturedAt: DateTime.now(),
      rawText: text.trim(),
    );
    await _persist(item);
    return item;
  }

  /// Copies the picked file out of the OS temp directory, where it would
  /// otherwise be reclaimed, and into our documents directory.
  Future<SourceItem> addImage(String pickedPath, SourceType type) async {
    final store = await ref.read(sourceStoreProvider.future);
    final id = _uuid.v4();

    final imagesDir = (store as JsonFileSourceStore).imagesDirectory;
    await imagesDir.create(recursive: true);

    final destination =
        '${imagesDir.path}${Platform.pathSeparator}$id.${imageExtensionFor(pickedPath)}';
    final saved = await File(pickedPath).copy(destination);

    final item = SourceItem(
      id: id,
      type: type,
      capturedAt: DateTime.now(),
      imagePath: saved.path,
      byteSize: await saved.length(),
    );
    await _persist(item);
    return item;
  }

  Future<void> delete(String id) async {
    final store = await ref.read(sourceStoreProvider.future);
    await store.delete(id);
    state = AsyncValue.data(await store.all());
  }

  Future<void> _persist(SourceItem item) async {
    final store = await ref.read(sourceStoreProvider.future);
    await store.add(item);
    state = AsyncValue.data(await store.all());
  }
}

final sourcesProvider =
    AsyncNotifierProvider<SourcesNotifier, List<SourceItem>>(
  SourcesNotifier.new,
);
