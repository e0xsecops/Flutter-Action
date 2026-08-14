import 'dart:io';

import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory dir;
  late JsonFileSourceStore store;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('action_store_test');
    store = JsonFileSourceStore(dir);
  });

  tearDown(() async {
    if (await dir.exists()) await dir.delete(recursive: true);
  });

  SourceItem item(String id, {DateTime? at, String? imagePath}) => SourceItem(
        id: id,
        type: SourceType.pastedText,
        capturedAt: at ?? DateTime.now(),
        rawText: 'text $id',
        imagePath: imagePath,
      );

  group('JsonFileSourceStore', () {
    test('is empty before anything is written', () async {
      expect(await store.all(), isEmpty);
    });

    test('persists and reads back', () async {
      await store.add(item('a'));
      await store.add(item('b'));

      final all = await store.all();
      expect(all.map((i) => i.id), containsAll(<String>['a', 'b']));
    });

    test('returns newest first', () async {
      final old = DateTime.now().subtract(const Duration(days: 2));
      final recent = DateTime.now();
      await store.add(item('old', at: old));
      await store.add(item('recent', at: recent));

      final all = await store.all();
      expect(all.first.id, 'recent');
    });

    test('delete removes the record and its image bytes', () async {
      final image = File('${dir.path}${Platform.pathSeparator}pic.jpg');
      await image.writeAsBytes([1, 2, 3]);

      await store.add(item('withImage', imagePath: image.path));
      await store.delete('withImage');

      expect(await store.all(), isEmpty);
      expect(
        await image.exists(),
        isFalse,
        reason: 'deleting a source must delete the bytes, not just the index',
      );
    });

    test('delete of an unknown id is a no-op', () async {
      await store.add(item('a'));
      await store.delete('nope');
      expect((await store.all()).length, 1);
    });

    test('clear removes every record and image', () async {
      final image = File('${dir.path}${Platform.pathSeparator}pic2.jpg');
      await image.writeAsBytes([1]);
      await store.add(item('a', imagePath: image.path));
      await store.add(item('b'));

      await store.clear();

      expect(await store.all(), isEmpty);
      expect(await image.exists(), isFalse);
    });

    test('a corrupt index degrades to empty rather than throwing', () async {
      await File('${dir.path}${Platform.pathSeparator}sources.json')
          .writeAsString('{ this is not json');

      expect(await store.all(), isEmpty);
    });

    test('a JSON payload of the wrong shape degrades to empty', () async {
      await File('${dir.path}${Platform.pathSeparator}sources.json')
          .writeAsString('{"unexpected":"object"}');

      expect(await store.all(), isEmpty);
    });
  });
}
