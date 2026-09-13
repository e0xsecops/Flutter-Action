/// The geometry behind the Evidence Lens.
///
/// Almost every test here is about *refusing* to produce a region. A highlight
/// on the wrong line is the app asserting, visually and confidently, that a
/// deadline came from text that does not mention it — which is worse than
/// showing no highlight at all.
library;

import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/extraction/application/evidence_regions.dart';
import 'package:action_app/features/extraction/domain/extraction_evidence.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

OcrLine _line(String text, {double? left, double? top, double? w, double? h}) =>
    OcrLine(
      text: text,
      box: left == null
          ? null
          : OcrBox(left: left, top: top!, width: w!, height: h!),
    );

ExtractionEvidence _grounded(List<int> lines) => ExtractionEvidence(
      quote: 'Payment must be received by 12 September.',
      grounding: EvidenceGrounding.exact,
      sourceKind: EvidenceSourceKind.ocrText,
      start: 0,
      end: 40,
      lineIndexes: lines,
    );

/// A 1000x2000 capture with three tidy lines down the page.
final _lines = [
  _line('Dear Sir or Madam', left: 100, top: 100, w: 500, h: 40),
  _line('Payment must be received by 12 September.',
      left: 100, top: 200, w: 800, h: 40),
  _line('Reference INV-2048', left: 100, top: 300, w: 400, h: 40),
];

List<EvidenceRegion> _regions(
  ExtractionEvidence evidence, {
  List<OcrLine>? lines,
  int? width = 1000,
  int? height = 2000,
}) =>
    EvidenceRegions.forEvidence(
      evidence: evidence,
      lines: lines ?? _lines,
      imageWidth: width,
      imageHeight: height,
    );

void main() {
  group('when it will draw', () {
    test('a grounded quote on one line becomes one normalised band', () {
      final regions = _regions(_grounded([1]));

      expect(regions, hasLength(1));
      // 200/2000 = 0.1, minus the padding that keeps the band off the glyphs.
      expect(regions.single.top, closeTo(0.1, 0.01));
      expect(regions.single.left, closeTo(0.1, 0.01));
      expect(regions.single.height, closeTo(0.02, 0.02));
    });

    test('the band is padded outward, never inward', () {
      // A tight box clips the tops of letters, which reads as a bug.
      final regions = _regions(_grounded([1]));

      expect(regions.single.left, lessThan(100 / 1000));
      expect(regions.single.top, lessThan(200 / 2000));
    });

    test('every coordinate stays inside the image', () {
      final regions = _regions(
        _grounded([0]),
        lines: [_line('edge', left: 0, top: 0, w: 1000, h: 2000)],
      );

      final region = regions.single;
      expect(region.left, 0);
      expect(region.top, 0);
      expect(region.right, lessThanOrEqualTo(1.0));
      expect(region.bottom, lessThanOrEqualTo(1.0));
    });

    test('two separated lines stay two bands', () {
      final regions = _regions(_grounded([0, 2]));

      expect(regions, hasLength(2));
    });

    test('two touching lines merge into one', () {
      // Otherwise a hairline of dimming runs through the middle of a
      // two-line highlight and reads as a rendering fault.
      final regions = _regions(
        _grounded([0, 1]),
        lines: [
          _line('first half of the sentence', left: 100, top: 100, w: 800, h: 40),
          _line('second half', left: 100, top: 140, w: 400, h: 40),
        ],
      );

      expect(regions, hasLength(1));
      expect(regions.single.top, lessThan(100 / 2000));
      expect(regions.single.bottom, greaterThan(180 / 2000));
    });

    test('the merged band spans the widest of the lines it covers', () {
      final regions = _regions(
        _grounded([0, 1]),
        lines: [
          _line('narrow', left: 100, top: 100, w: 200, h: 40),
          _line('much wider line here', left: 100, top: 140, w: 800, h: 40),
        ],
      );

      expect(regions.single.right, greaterThan(0.8));
    });
  });

  group('when it refuses', () {
    test('unresolved evidence gets no region at all', () {
      // The quote could not be found in the app's own copy of the text.
      // Pointing at a place for it would invent the one thing this subsystem
      // exists not to invent.
      const evidence = ExtractionEvidence.unresolved(
        quote: 'Payment must be received by 12 September.',
        sourceKind: EvidenceSourceKind.ocrText,
      );

      expect(_regions(evidence), isEmpty);
    });

    test('no line indexes, no region', () {
      expect(_regions(_grounded(const [])), isEmpty);
    });

    test('an out-of-range index discards the whole answer', () {
      // Partial geometry is not safer than none: the bands that did resolve
      // would be presented as the complete evidence.
      expect(_regions(_grounded([1, 99])), isEmpty);
      expect(_regions(_grounded([-1])), isEmpty);
    });

    test('a line with no box discards the whole answer', () {
      expect(
        _regions(
          _grounded([0, 1]),
          lines: [_lines[0], _line('no geometry')],
        ),
        isEmpty,
      );
    });

    test('unknown image dimensions, no region', () {
      expect(_regions(_grounded([1]), width: null), isEmpty);
      expect(_regions(_grounded([1]), height: null), isEmpty);
      expect(_regions(_grounded([1]), width: 0), isEmpty);
      expect(_regions(_grounded([1]), height: -10), isEmpty);
    });

    test('a zero-area box, no region', () {
      expect(
        _regions(
          _grounded([0]),
          lines: [_line('flat', left: 10, top: 10, w: 300, h: 0)],
        ),
        isEmpty,
      );
    });

    test('boxes that do not fit the image are treated as a broken mapping', () {
      // The important one. OCR boxes are in the pixel space the recogniser
      // saw; if a capture is ever re-encoded or re-cropped afterwards, the
      // stored dimensions and the stored boxes stop agreeing and nothing else
      // in the pipeline would notice. Boxes outside the frame are the
      // observable symptom.
      expect(
        _regions(
          _grounded([0]),
          lines: [_line('too wide', left: 100, top: 100, w: 2000, h: 40)],
          width: 1000,
        ),
        isEmpty,
      );
      expect(
        _regions(
          _grounded([0]),
          lines: [_line('below', left: 100, top: 3000, w: 100, h: 40)],
          height: 2000,
        ),
        isEmpty,
      );
      expect(
        _regions(
          _grounded([0]),
          lines: [_line('left of frame', left: -50, top: 100, w: 100, h: 40)],
        ),
        isEmpty,
      );
    });

    test('a box exactly filling the image is accepted', () {
      // The mapping check must not reject the legitimate edge case.
      expect(
        _regions(
          _grounded([0]),
          lines: [_line('full', left: 0, top: 0, w: 1000, h: 2000)],
        ),
        hasLength(1),
      );
    });

    test('pasted text has no geometry and asks for none', () {
      final evidence = ExtractionEvidence(
        quote: 'Payment must be received by 12 September.',
        grounding: EvidenceGrounding.exact,
        sourceKind: EvidenceSourceKind.pastedText,
        start: 0,
        end: 40,
      );

      expect(_regions(evidence, lines: const []), isEmpty);
    });
  });

  group('determinism', () {
    test('the same inputs give the same regions', () {
      expect(_regions(_grounded([0, 1, 2])), _regions(_grounded([0, 1, 2])));
    });

    test('index order does not change the answer', () {
      expect(_regions(_grounded([2, 0])), _regions(_grounded([0, 2])));
    });
  });
}
