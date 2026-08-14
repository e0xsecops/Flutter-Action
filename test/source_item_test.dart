import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SourceItem', () {
    test('survives a JSON round trip', () {
      final original = SourceItem(
        id: 'abc',
        type: SourceType.gallery,
        capturedAt: DateTime.parse('2026-08-14T09:30:00.000'),
        rawText: 'Renewal due 30 September',
        imagePath: '/data/sources/abc.jpg',
        byteSize: 1234,
      );

      final restored = SourceItem.fromJson(original.toJson());

      expect(restored.id, original.id);
      expect(restored.type, original.type);
      expect(restored.capturedAt, original.capturedAt);
      expect(restored.rawText, original.rawText);
      expect(restored.imagePath, original.imagePath);
      expect(restored.byteSize, original.byteSize);
    });

    test('falls back instead of throwing on a type it does not know', () {
      // Data written by a newer build must stay readable, or a downgrade
      // bricks the inbox.
      final restored = SourceItem.fromJson({
        'id': 'x',
        'type': 'holographicScan',
        'capturedAt': '2026-08-14T09:30:00.000',
      });

      expect(restored.type, SourceType.gallery);
    });

    test('falls back to now when the timestamp is unparseable', () {
      final restored = SourceItem.fromJson({
        'id': 'x',
        'type': 'photo',
        'capturedAt': 'not-a-date',
      });

      expect(
        restored.capturedAt.difference(DateTime.now()).abs(),
        lessThan(const Duration(seconds: 5)),
      );
    });

    test('reports whether it carries text or an image', () {
      final text = SourceItem(
        id: '1',
        type: SourceType.pastedText,
        capturedAt: DateTime.now(),
        rawText: 'hello',
      );
      final blank = SourceItem(
        id: '2',
        type: SourceType.pastedText,
        capturedAt: DateTime.now(),
        rawText: '   ',
      );
      final image = SourceItem(
        id: '3',
        type: SourceType.photo,
        capturedAt: DateTime.now(),
        imagePath: '/tmp/a.jpg',
      );

      expect(text.hasText, isTrue);
      expect(blank.hasText, isFalse, reason: 'whitespace is not content');
      expect(image.hasImage, isTrue);
      expect(text.hasImage, isFalse);
    });

    test('every source type carries provenance copy for the UI', () {
      for (final type in SourceType.values) {
        expect(type.provenanceLabel, isNotEmpty);
      }
    });
  });
}
