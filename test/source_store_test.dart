import 'dart:io';

import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
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

  SourceItem item(String id, {DateTime? at}) => SourceItem(
        id: id,
        type: SourceType.pastedText,
        capturedAt: at ?? DateTime.now(),
        pastedText: 'text $id',
      );

  group('JsonFileSourceStore', () {
    test('is empty before anything is written', () async {
      expect(await store.all(), isEmpty);
    });

    test('persists and reads back', () async {
      await store.add(item('a'));
      await store.add(item('b'));

      expect((await store.all()).map((i) => i.id), containsAll(['a', 'b']));
    });

    test('returns newest first', () async {
      await store.add(item('old', at: DateTime.now().subtract(const Duration(days: 2))));
      await store.add(item('recent', at: DateTime.now()));

      expect((await store.all()).first.id, 'recent');
    });

    test('byId finds a record, or returns null', () async {
      await store.add(item('a'));

      expect((await store.byId('a'))?.id, 'a');
      expect(await store.byId('missing'), isNull);
    });

    test('update replaces a record in place', () async {
      await store.add(item('a'));

      await store.update(
        (await store.byId('a'))!.copyWith(
          ocr: OcrOutcome(
            rawText: 'read from image',
            normalizedText: 'read from image',
            lines: const [],
            engine: 'test',
            processedAt: DateTime.now(),
            durationMs: 12,
          ),
          state: SourceProcessingState.ready,
        ),
      );

      final updated = await store.byId('a');
      expect(updated!.state, SourceProcessingState.ready);
      expect(updated.ocr!.rawText, 'read from image');
      expect((await store.all()).length, 1, reason: 'update must not insert');
    });

    test('update of an unknown id does not resurrect a deleted record',
        () async {
      await store.add(item('a'));
      await store.delete('a');

      await store.update(item('a'));

      expect(await store.all(), isEmpty);
    });

    test('delete removes only the target', () async {
      await store.add(item('a'));
      await store.add(item('b'));

      await store.delete('a');

      expect((await store.all()).single.id, 'b');
    });

    test('delete of an unknown id is a no-op', () async {
      await store.add(item('a'));
      await store.delete('nope');
      expect((await store.all()).length, 1);
    });

    test('clear empties the index', () async {
      await store.add(item('a'));
      await store.add(item('b'));

      await store.clear();

      expect(await store.all(), isEmpty);
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
