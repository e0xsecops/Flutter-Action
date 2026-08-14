import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  OcrOutcome outcome(String raw, {String? normalized}) => OcrOutcome(
        rawText: raw,
        normalizedText: normalized ?? raw,
        lines: [OcrLine(text: raw, box: const OcrBox(left: 1, top: 2, width: 3, height: 4))],
        engine: 'test',
        processedAt: DateTime.parse('2026-08-14T10:00:00.000'),
        durationMs: 42,
      );

  group('SourceItem', () {
    test('survives a JSON round trip including OCR output', () {
      final original = SourceItem(
        id: 'abc',
        type: SourceType.gallery,
        capturedAt: DateTime.parse('2026-08-14T09:30:00.000'),
        imagePath: '/data/sources/abc.jpg',
        mimeType: 'image/jpeg',
        originalFormat: 'png',
        imageWidth: 1200,
        imageHeight: 1600,
        originalByteSize: 5592060,
        byteSize: 412000,
        ocr: outcome('Renewal due 30 September'),
        state: SourceProcessingState.ready,
      );

      final restored = SourceItem.fromJson(original.toJson());

      expect(restored.id, 'abc');
      expect(restored.mimeType, 'image/jpeg');
      expect(restored.originalFormat, 'png');
      expect(restored.imageWidth, 1200);
      expect(restored.originalByteSize, 5592060);
      expect(restored.byteSize, 412000);
      expect(restored.state, SourceProcessingState.ready);
      expect(restored.ocr!.rawText, 'Renewal due 30 September');
      expect(restored.ocr!.durationMs, 42);
      expect(restored.ocr!.lines.single.box!.width, 3);
    });

    test('reads records written before the OCR fields existed', () {
      // Day-3 records used `rawText` for pasted text and had no state.
      final restored = SourceItem.fromJson({
        'id': 'legacy',
        'type': 'pastedText',
        'capturedAt': '2026-08-14T09:30:00.000',
        'rawText': 'Pay 780 by 30 September',
      });

      expect(restored.pastedText, 'Pay 780 by 30 September');
      expect(restored.analysisText, 'Pay 780 by 30 September');
      expect(restored.state, SourceProcessingState.pending);
    });

    test('falls back instead of throwing on an unknown type or state', () {
      final restored = SourceItem.fromJson({
        'id': 'x',
        'type': 'holographicScan',
        'state': 'teleporting',
        'capturedAt': '2026-08-14T09:30:00.000',
      });

      expect(restored.type, SourceType.gallery);
      expect(restored.state, SourceProcessingState.pending);
    });

    test('analysisText prefers OCR but falls back to typed text', () {
      final base = SourceItem(
        id: '1',
        type: SourceType.photo,
        capturedAt: DateTime.now(),
        imagePath: '/tmp/a.jpg',
      );

      expect(base.analysisText, '');
      expect(base.hasText, isFalse);

      final withOcr = base.copyWith(ocr: outcome('From the image'));
      expect(withOcr.analysisText, 'From the image');

      // Manual fallback wins when recognition produced nothing usable.
      final blankOcr = base.copyWith(
        ocr: outcome('   '),
        pastedText: 'Typed by hand',
      );
      expect(blankOcr.analysisText, 'Typed by hand');
    });

    test('copyWith can clear a failure without wiping other fields', () {
      final failed = SourceItem(
        id: '1',
        type: SourceType.photo,
        capturedAt: DateTime.now(),
        imagePath: '/tmp/a.jpg',
        mimeType: 'image/jpeg',
        state: SourceProcessingState.failed,
        failureReason: 'boom',
      );

      final retried = failed.copyWith(
        state: SourceProcessingState.processing,
        clearFailure: true,
      );

      expect(retried.failureReason, isNull);
      expect(retried.state, SourceProcessingState.processing);
      expect(retried.mimeType, 'image/jpeg');
      expect(retried.imagePath, '/tmp/a.jpg');
    });

    test('every source type carries provenance copy for the UI', () {
      for (final type in SourceType.values) {
        expect(type.provenanceLabel, isNotEmpty);
      }
    });
  });
}
