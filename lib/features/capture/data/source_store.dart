import 'dart:convert';
import 'dart:io';

import '../domain/source_item.dart';

/// Local persistence for captured sources.
///
/// Day 8 replaces this with Drift once `Action` needs querying and indexing. It
/// is behind an interface now so that swap is a one-file change, and so tests
/// can run against a temp directory without touching platform channels.
abstract interface class SourceStore {
  Future<List<SourceItem>> all();

  Future<void> add(SourceItem item);

  /// Removes the record and its image file. Deleting a source must actually
  /// delete the bytes — the privacy screen says so.
  Future<void> delete(String id);

  Future<void> clear();
}

/// JSON-file backed store. Adequate for day 3 volumes (tens of items) and
/// intentionally boring: one file, rewritten on change, no partial-write
/// recovery beyond replacing a corrupt file with an empty list.
class JsonFileSourceStore implements SourceStore {
  JsonFileSourceStore(this.directory);

  /// The app's documents directory. Injected rather than resolved internally so
  /// tests can point it at a temp folder.
  final Directory directory;

  static const _fileName = 'sources.json';
  static const imagesFolder = 'sources';

  File get _file => File('${directory.path}${Platform.pathSeparator}$_fileName');

  Directory get imagesDirectory =>
      Directory('${directory.path}${Platform.pathSeparator}$imagesFolder');

  @override
  Future<List<SourceItem>> all() async {
    final file = _file;
    if (!await file.exists()) return const [];

    try {
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! List) return const [];
      return decoded
          .whereType<Map<String, dynamic>>()
          .map(SourceItem.fromJson)
          .toList(growable: false)
        ..sort((a, b) => b.capturedAt.compareTo(a.capturedAt));
    } on FormatException {
      // A truncated write should cost the index, not the app. The image files
      // themselves survive and can be re-indexed later if it ever matters.
      return const [];
    }
  }

  @override
  Future<void> add(SourceItem item) async {
    final items = List<SourceItem>.from(await all())..add(item);
    await _write(items);
  }

  @override
  Future<void> delete(String id) async {
    final items = await all();
    final target = items.where((i) => i.id == id).firstOrNull;

    if (target?.imagePath != null) {
      final image = File(target!.imagePath!);
      if (await image.exists()) await image.delete();
    }

    await _write(items.where((i) => i.id != id).toList());
  }

  @override
  Future<void> clear() async {
    final items = await all();
    for (final item in items) {
      if (item.imagePath == null) continue;
      final image = File(item.imagePath!);
      if (await image.exists()) await image.delete();
    }
    await _write(const []);
  }

  Future<void> _write(List<SourceItem> items) async {
    final file = _file;
    await file.parent.create(recursive: true);
    await file.writeAsString(
      jsonEncode(items.map((i) => i.toJson()).toList()),
      flush: true,
    );
  }
}
