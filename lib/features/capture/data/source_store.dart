import 'dart:convert';
import 'dart:io';

import '../domain/source_item.dart';

/// Persistence for capture *metadata*. Byte storage lives behind
/// [SourceFileStore]; this interface deliberately knows nothing about files, so
/// replacing it with Drift on day 8 does not touch capture logic.
abstract interface class SourceStore {
  Future<List<SourceItem>> all();

  Future<SourceItem?> byId(String id);

  Future<void> add(SourceItem item);

  /// Replaces an existing record, matched on id. Used to attach OCR output to a
  /// capture after processing. A missing id is a no-op rather than an insert —
  /// silently resurrecting a deleted capture would be worse than doing nothing.
  Future<void> update(SourceItem item);

  Future<void> delete(String id);

  Future<void> clear();
}

/// JSON-file backed index. Adequate for the volumes V1 sees, and intentionally
/// boring: one file, rewritten on change, with a corrupt file degrading to an
/// empty list rather than taking the app down.
class JsonFileSourceStore implements SourceStore {
  JsonFileSourceStore(this.directory);

  /// Injected rather than resolved internally so tests can use a temp folder.
  final Directory directory;

  static const _fileName = 'sources.json';

  File get _file => File('${directory.path}${Platform.pathSeparator}$_fileName');

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
      // A truncated write costs the index, not the app. The bytes themselves
      // survive independently in the file store.
      return const [];
    }
  }

  @override
  Future<SourceItem?> byId(String id) async {
    final all = await this.all();
    return all.where((i) => i.id == id).firstOrNull;
  }

  @override
  Future<void> add(SourceItem item) async {
    final items = List<SourceItem>.from(await all())..add(item);
    await _write(items);
  }

  @override
  Future<void> update(SourceItem item) async {
    final items = await all();
    if (!items.any((i) => i.id == item.id)) return;
    await _write([
      for (final existing in items)
        if (existing.id == item.id) item else existing,
    ]);
  }

  @override
  Future<void> delete(String id) async {
    final items = await all();
    await _write(items.where((i) => i.id != id).toList());
  }

  @override
  Future<void> clear() => _write(const []);

  Future<void> _write(List<SourceItem> items) async {
    final file = _file;
    await file.parent.create(recursive: true);
    await file.writeAsString(
      jsonEncode(items.map((i) => i.toJson()).toList()),
      flush: true,
    );
  }
}
