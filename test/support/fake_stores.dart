import 'dart:typed_data';

import 'package:action_app/features/capture/data/source_file_store.dart';
import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/source_item.dart';

/// In-memory metadata store, so tests never touch path_provider's platform
/// channel and list contents are fixtures rather than whatever is on disk.
class FakeSourceStore implements SourceStore {
  FakeSourceStore([List<SourceItem> items = const []]) : _items = [...items];

  List<SourceItem> _items;

  List<SourceItem> get items => List.unmodifiable(_items);

  @override
  Future<List<SourceItem>> all() async => List.unmodifiable(_items);

  @override
  Future<SourceItem?> byId(String id) async =>
      _items.where((i) => i.id == id).firstOrNull;

  @override
  Future<void> add(SourceItem item) async => _items = [item, ..._items];

  @override
  Future<void> update(SourceItem item) async {
    if (!_items.any((i) => i.id == item.id)) return;
    _items = [
      for (final existing in _items)
        if (existing.id == item.id) item else existing,
    ];
  }

  @override
  Future<void> delete(String id) async =>
      _items = _items.where((i) => i.id != id).toList();

  @override
  Future<void> clear() async => _items = [];
}

/// Records what would have been written without touching the filesystem.
class FakeSourceFileStore implements SourceFileStore {
  final Map<String, Uint8List> saved = {};
  final List<String> deleted = [];

  @override
  Future<String> save({
    required String id,
    required Uint8List bytes,
    required String extension,
  }) async {
    final path = '/fake/sources/$id.$extension';
    saved[path] = bytes;
    return path;
  }

  @override
  Future<void> delete(String path) async {
    saved.remove(path);
    deleted.add(path);
  }

  @override
  Future<void> deleteAll() async {
    saved.clear();
  }
}
