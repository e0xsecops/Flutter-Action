import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_stores.dart';

/// Exercises the notifier's state machine with fake OCR, so the pipeline is
/// tested without a device and without a real recogniser's variability.
void main() {
  ProviderContainer container({
    required FakeSourceStore store,
    required OcrService ocr,
    FakeSourceFileStore? files,
  }) {
    final c = ProviderContainer(
      overrides: [
        sourceStoreProvider.overrideWith((ref) async => store),
        sourceFileStoreProvider
            .overrideWith((ref) async => files ?? FakeSourceFileStore()),
        ocrServiceProvider.overrideWithValue(ocr),
      ],
    );
    addTearDown(c.dispose);
    return c;
  }

  SourceItem imageItem(String id, {String path = '/fake/a.jpg'}) => SourceItem(
        id: id,
        type: SourceType.photo,
        capturedAt: DateTime.now(),
        imagePath: path,
      );

  test('pasted text is analysis-ready immediately, no OCR needed', () async {
    final store = FakeSourceStore();
    final c = container(store: store, ocr: const FakeOcrService());

    final item = await c
        .read(sourcesProvider.notifier)
        .addPastedText('  Renewal   due 30 September  ');

    expect(item.state, SourceProcessingState.ready);
    // Whitespace tidied, the facts untouched.
    expect(item.pastedText, 'Renewal due 30 September');
    expect(item.analysisText, contains('30 September'));
  });

  test('runOcr attaches raw and normalized text and marks the item ready',
      () async {
    final store = FakeSourceStore([imageItem('1')]);
    final c = container(
      store: store,
      ocr: const FakeOcrService(
        transcripts: {'/fake/a.jpg': 'Policy  NM-4471\n\n\n\nDue 30 September'},
      ),
    );

    await c.read(sourcesProvider.notifier).runOcr('1');

    final updated = await store.byId('1');
    expect(updated!.state, SourceProcessingState.ready);
    expect(updated.ocr!.rawText, contains('\n\n\n\n'),
        reason: 'raw output must be preserved exactly for day-5 grounding');
    expect(updated.ocr!.normalizedText, 'Policy NM-4471\n\nDue 30 September');
    expect(updated.ocr!.engine, FakeOcrService.engineName);
  });

  test('recognising no text is ready-with-nothing, not a failure', () async {
    final store = FakeSourceStore([imageItem('1')]);
    final c = container(store: store, ocr: const FakeOcrService());

    await c.read(sourcesProvider.notifier).runOcr('1');

    final updated = await store.byId('1');
    expect(updated!.state, SourceProcessingState.ready);
    expect(updated.hasText, isFalse);
    expect(updated.failureReason, isNull);
  });

  test('a recognition failure is recorded with a reason', () async {
    final store = FakeSourceStore([imageItem('1')]);
    final c = container(
      store: store,
      ocr: const FakeOcrService(failOnPaths: {'/fake/a.jpg'}),
    );

    await c.read(sourcesProvider.notifier).runOcr('1');

    final updated = await store.byId('1');
    expect(updated!.state, SourceProcessingState.failed);
    expect(updated.failureReason, isNotNull);
  });

  test('retrying after a failure clears the previous failure', () async {
    final store = FakeSourceStore([
      imageItem('1').copyWith(
        state: SourceProcessingState.failed,
        failureReason: 'previous failure',
      ),
    ]);
    final c = container(
      store: store,
      ocr: const FakeOcrService(transcripts: {'/fake/a.jpg': 'Now readable'}),
    );

    await c.read(sourcesProvider.notifier).runOcr('1');

    final updated = await store.byId('1');
    expect(updated!.state, SourceProcessingState.ready);
    expect(updated.failureReason, isNull);
    expect(updated.analysisText, 'Now readable');
  });

  test('manual text becomes the analysis text without erasing what OCR read',
      () async {
    final store = FakeSourceStore([imageItem('1')]);
    final c = container(
      store: store,
      // Recognised something, but garbage.
      ocr: const FakeOcrService(transcripts: {'/fake/a.jpg': 'lll |||'}),
    );

    await c.read(sourcesProvider.notifier).runOcr('1');
    await c
        .read(sourcesProvider.notifier)
        .setManualText('1', 'Renewal due 30 September, 780.00');

    final updated = await store.byId('1');
    expect(updated!.state, SourceProcessingState.ready);
    expect(updated.pastedText, 'Renewal due 30 September, 780.00');
    expect(
      updated.ocr!.rawText,
      'lll |||',
      reason: 'the record of what the machine actually read must survive',
    );
  });

  test('runOcr on a missing or image-less record does nothing', () async {
    final store = FakeSourceStore([
      SourceItem(
        id: 'text-only',
        type: SourceType.pastedText,
        capturedAt: DateTime.now(),
        pastedText: 'typed',
        state: SourceProcessingState.ready,
      ),
    ]);
    final c = container(store: store, ocr: const FakeOcrService());

    await c.read(sourcesProvider.notifier).runOcr('text-only');
    await c.read(sourcesProvider.notifier).runOcr('does-not-exist');

    expect((await store.byId('text-only'))!.state, SourceProcessingState.ready);
  });

  test('deleting a capture removes its bytes as well as its record', () async {
    final files = FakeSourceFileStore();
    final store = FakeSourceStore([imageItem('1', path: '/fake/sources/1.jpg')]);
    final c = container(store: store, ocr: const FakeOcrService(), files: files);

    await c.read(sourcesProvider.notifier).delete('1');

    expect(await store.all(), isEmpty);
    expect(
      files.deleted,
      contains('/fake/sources/1.jpg'),
      reason: 'deleting a capture must delete the image, not just the index',
    );
  });
}
