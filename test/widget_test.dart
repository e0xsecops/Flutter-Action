import 'package:action_app/app/app.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_stores.dart';

Widget _app(SourceStore store) {
  return ProviderScope(
    overrides: [sourceStoreProvider.overrideWith((ref) async => store)],
    child: const ActionApp(),
  );
}

SourceItem _ready(String text) => SourceItem(
      id: '1',
      type: SourceType.pastedText,
      capturedAt: DateTime.now(),
      pastedText: text,
      state: SourceProcessingState.ready,
    );

void main() {
  testWidgets('empty inbox explains what to do instead of showing a blank list',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('Nothing needs your attention'), findsOneWidget);
    expect(find.text('Add something'), findsOneWidget);
  });

  testWidgets('captures appear under Needs attention with their provenance',
      (tester) async {
    await tester.pumpWidget(
      _app(FakeSourceStore([_ready('Car insurance renewal due 30 September')])),
    );
    await tester.pumpAndSettle();

    expect(find.text('Needs attention'.toUpperCase()), findsOneWidget);
    expect(find.text(SourceType.pastedText.provenanceLabel), findsOneWidget);
    expect(find.textContaining('30 September'), findsOneWidget);
  });

  testWidgets('a capture still being read says so rather than looking empty',
      (tester) async {
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.processing,
          ),
        ]),
      ),
    );
    await tester.pump();

    expect(find.text('Reading the text…'), findsOneWidget);
  });

  testWidgets('a failed capture surfaces the reason on the inbox row',
      (tester) async {
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.failed,
            failureReason: "That image format couldn't be read on this device.",
          ),
        ]),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text("That image format couldn't be read on this device."),
      findsOneWidget,
    );
  });

  testWidgets('a capture that read successfully but found nothing says so',
      (tester) async {
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.ready,
            ocr: OcrOutcome(
              rawText: '',
              normalizedText: '',
              lines: const [],
              engine: 'test',
              processedAt: DateTime.now(),
              durationMs: 5,
            ),
          ),
        ]),
      ),
    );
    await tester.pumpAndSettle();

    // Distinct from failure: recognition ran fine, the picture just has no text.
    expect(find.text('No text found'), findsOneWidget);
  });

  testWidgets('the add button opens the capture chooser with all three inputs',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add something'));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsOneWidget);
    expect(find.text('Choose an image'), findsOneWidget);
    expect(find.text('Paste text'), findsOneWidget);
  });

  testWidgets('dismissing the chooser returns to the inbox unchanged',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add something'));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(200, 60));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsNothing);
    expect(find.text('Nothing needs your attention'), findsOneWidget);
  });

  testWidgets('paste screen gates Continue until there is enough text',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add something'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Paste text'));
    await tester.pumpAndSettle();

    final continueButton = find.widgetWithText(FilledButton, 'Continue');
    expect(tester.widget<FilledButton>(continueButton).onPressed, isNull);

    await tester.enterText(
      find.byType(TextField),
      'Car insurance renewal is due on 30 September and costs 780.',
    );
    await tester.pumpAndSettle();

    expect(tester.widget<FilledButton>(continueButton).onPressed, isNotNull);
  });

  testWidgets('tapping a capture opens what we read from it', (tester) async {
    await tester.pumpWidget(
      _app(FakeSourceStore([_ready('Renewal due 30 September, 780.00')])),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(SourceType.pastedText.provenanceLabel));
    await tester.pumpAndSettle();

    expect(find.text('What we read'), findsOneWidget);
    expect(find.text('Text found'), findsOneWidget);
    expect(
      find.textContaining('Nothing has been interpreted yet'),
      findsOneWidget,
      reason: 'the screen must not imply the app has drawn conclusions',
    );
  });

  testWidgets('a failed capture offers retry and manual entry', (tester) async {
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.failed,
            failureReason: 'Text recognition could not run.',
          ),
        ]),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(SourceType.photo.provenanceLabel));
    await tester.pumpAndSettle();

    expect(find.text("Couldn't read this"), findsOneWidget);
    expect(find.text('Try reading again'), findsOneWidget);
    expect(
      find.text('Type the details instead'),
      findsOneWidget,
      reason: 'manual creation must stay available when extraction fails',
    );
  });
}
