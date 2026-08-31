/// The Evidence Lens affordance.
///
/// One property, tested from the outside: **the offer and the answer cannot
/// disagree.** "See it on the capture" appears only when there is genuinely a
/// region to show, because a button that opens a sheet saying "Action could
/// not work out where" is worse than no button.
library;

import 'package:action_app/design/app_theme.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/domain/extraction_evidence.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/extraction/presentation/review_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _quote = 'Payment must be received by 12 September.';

ExtractionEvidence _grounded({List<int> lines = const [1]}) =>
    ExtractionEvidence(
      quote: _quote,
      grounding: EvidenceGrounding.exact,
      sourceKind: EvidenceSourceKind.ocrText,
      start: 0,
      end: _quote.length,
      lineIndexes: lines,
    );

const _unresolved = ExtractionEvidence.unresolved(
  quote: _quote,
  sourceKind: EvidenceSourceKind.ocrText,
);

SourceItem _capture({
  String? imagePath = '/tmp/capture.jpg',
  int? width = 1000,
  int? height = 2000,
  bool withBoxes = true,
}) =>
    SourceItem(
      id: 's1',
      type: SourceType.gallery,
      capturedAt: DateTime(2026, 9, 1),
      imagePath: imagePath,
      imageWidth: width,
      imageHeight: height,
      state: SourceProcessingState.ready,
      ocr: OcrOutcome(
        rawText: 'Dear Sir or Madam\n$_quote',
        normalizedText: 'Dear Sir or Madam\n$_quote',
        engine: 'test',
        processedAt: DateTime(2026, 9, 1),
        durationMs: 1,
        lines: [
          OcrLine(
            text: 'Dear Sir or Madam',
            box: withBoxes
                ? const OcrBox(left: 100, top: 100, width: 500, height: 40)
                : null,
          ),
          OcrLine(
            text: _quote,
            box: withBoxes
                ? const OcrBox(left: 100, top: 200, width: 800, height: 40)
                : null,
          ),
        ],
      ),
    );

/// A pasted note: real text, no geometry anywhere.
SourceItem _pasted() => SourceItem(
      id: 's2',
      type: SourceType.pastedText,
      capturedAt: DateTime(2026, 9, 1),
      pastedText: _quote,
      state: SourceProcessingState.ready,
    );

Future<void> _pumpTile(
  WidgetTester tester, {
  required ExtractionEvidence evidence,
  SourceItem? source,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 380,
            child: EvidenceTile(
              evidence: evidence,
              source: source,
              label: 'Deadline',
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// The tile starts collapsed; the affordance lives inside it.
Future<void> _expand(WidgetTester tester) async {
  await tester.tap(find.byType(InkWell).first);
  await tester.pumpAndSettle();
}

void main() {
  const affordance = 'See it on the capture';

  group('the affordance appears', () {
    testWidgets('when the evidence is grounded and the geometry lines up',
        (tester) async {
      await _pumpTile(tester, evidence: _grounded(), source: _capture());
      await _expand(tester);

      expect(find.text(affordance), findsOneWidget);
    });

    testWidgets('and the quote is shown either way', (tester) async {
      await _pumpTile(tester, evidence: _grounded(), source: _capture());
      await _expand(tester);

      expect(find.textContaining('12 September'), findsOneWidget);
    });
  });

  group('the affordance is withheld', () {
    testWidgets('when there is no source at all', (tester) async {
      await _pumpTile(tester, evidence: _grounded());
      await _expand(tester);

      expect(find.text(affordance), findsNothing);
      expect(find.textContaining('12 September'), findsOneWidget);
    });

    testWidgets('when the evidence was never grounded', (tester) async {
      await _pumpTile(tester, evidence: _unresolved, source: _capture());
      await _expand(tester);

      expect(find.text(affordance), findsNothing);
      // And the tile says so rather than implying the value is verified.
      expect(find.text('Not verified'), findsOneWidget);
    });

    testWidgets('when the capture has no image', (tester) async {
      await _pumpTile(
        tester,
        evidence: _grounded(),
        source: _capture(imagePath: null),
      );
      await _expand(tester);

      expect(find.text(affordance), findsNothing);
    });

    testWidgets('when the OCR lines carry no geometry', (tester) async {
      await _pumpTile(
        tester,
        evidence: _grounded(),
        source: _capture(withBoxes: false),
      );
      await _expand(tester);

      expect(find.text(affordance), findsNothing);
    });

    testWidgets('when the image dimensions are unknown', (tester) async {
      await _pumpTile(
        tester,
        evidence: _grounded(),
        source: _capture(width: null),
      );
      await _expand(tester);

      expect(find.text(affordance), findsNothing);
    });

    testWidgets('when a line index is out of range', (tester) async {
      await _pumpTile(
        tester,
        evidence: _grounded(lines: [0, 42]),
        source: _capture(),
      );
      await _expand(tester);

      expect(find.text(affordance), findsNothing);
    });

    testWidgets('for pasted text, which has no geometry by nature',
        (tester) async {
      // Not a degraded state and not presented as one: the quote is the whole
      // answer, and it is a complete one.
      await _pumpTile(tester, evidence: _grounded(), source: _pasted());
      await _expand(tester);

      expect(find.text(affordance), findsNothing);
      expect(find.text('From source'), findsOneWidget);
    });
  });

  group('the tile itself', () {
    testWidgets('is collapsed until asked', (tester) async {
      await _pumpTile(tester, evidence: _grounded(), source: _capture());

      expect(find.textContaining('12 September'), findsNothing);
      expect(find.text('From source'), findsOneWidget);
    });

    testWidgets('reports its first expansion exactly once', (tester) async {
      var expansions = 0;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light(),
          home: Scaffold(
            body: EvidenceTile(
              evidence: _grounded(),
              source: _capture(),
              onFirstExpand: () => expansions++,
            ),
          ),
        ),
      );

      await _expand(tester);
      await _expand(tester); // collapse
      await _expand(tester); // and again

      expect(expansions, 1);
    });
  });
}
