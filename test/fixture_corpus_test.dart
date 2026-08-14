import 'dart:io';

import 'package:action_app/features/capture/data/image_format.dart';
import 'package:action_app/features/capture/data/image_normalizer.dart';
import 'package:action_app/features/diagnostics/fixture_evaluation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

/// Deterministic half of the fixture harness.
///
/// Everything here runs without a device: manifest integrity, the anchor
/// scoring logic, and image normalisation over the real corpus. The OCR half
/// needs ML Kit and therefore a handset, and runs from the in-app diagnostics
/// screen.
///
/// The fixtures are synthetic documents generated for this purpose. No personal
/// or customer data is used, and none is ever sent anywhere — day 4 runs
/// entirely on-device.
void main() {
  final fixturesDir = Directory('test/fixtures/images');
  final manifestFile = File('test/fixtures/manifest.json');

  late List<Fixture> fixtures;

  setUpAll(() {
    fixtures = Fixture.parseManifest(manifestFile.readAsStringSync());
  });

  group('manifest', () {
    test('covers a spread of at least 15 fixtures', () {
      expect(fixtures.length, greaterThanOrEqualTo(15));
    });

    test('every declared fixture exists on disk', () {
      for (final fixture in fixtures) {
        final file = File('${fixturesDir.path}/${fixture.file}');
        expect(file.existsSync(), isTrue, reason: 'missing ${fixture.file}');
      }
    });

    test('covers the conditions we care about, not just clean documents', () {
      final names = fixtures.map((f) => f.file).join(' ');
      for (final condition in [
        'screenshot',
        'rotated',
        'low_contrast',
        'low_light',
        'table_heavy',
        'long_text',
        'sparse',
        'multilingual',
        'landscape',
        'no_text',
      ]) {
        expect(names, contains(condition), reason: 'no fixture covers $condition');
      }
    });

    test('fixtures expecting text declare anchors, and the empty one does not',
        () {
      for (final fixture in fixtures) {
        if (fixture.expectsText) {
          expect(fixture.anchors, isNotEmpty, reason: fixture.file);
        } else {
          expect(fixture.anchors, isEmpty, reason: fixture.file);
        }
      }
    });
  });

  group('anchor scoring', () {
    test('matches regardless of case and spacing', () {
      final score = scoreAnchors(
        'Renewal   Date:\n30 September 2026',
        ['renewal date', '30 September 2026'],
      );
      expect(score.recall, 1.0);
      expect(score.missing, isEmpty);
    });

    test('does not count a misread digit as a hit', () {
      // "780.00" misrecognised as "78O.OO" must be reported missing, otherwise
      // the harness would hide exactly the failures it exists to catch.
      final score = scoreAnchors('Premium due: 78O.OO', ['780.00']);
      expect(score.found, isEmpty);
      expect(score.recall, 0.0);
    });

    test('reports partial recall honestly', () {
      final score = scoreAnchors('Only the policy number NM-4471-882 survived',
          ['NM-4471-882', '30 September 2026', '780.00']);
      expect(score.found, ['NM-4471-882']);
      expect(score.missing.length, 2);
      expect(score.recall, closeTo(1 / 3, 0.001));
    });

    test('an empty anchor list scores as complete rather than zero', () {
      expect(scoreAnchors('anything', const []).recall, 1.0);
    });
  });

  group('normalisation over the corpus', () {
    test('every fixture decodes, and its declared format matches its bytes', () {
      for (final fixture in fixtures) {
        final bytes = File('${fixturesDir.path}/${fixture.file}').readAsBytesSync();
        final result = normalizeImageSync(NormalizeRequest(bytes: bytes));

        expect(
          detectImageFormat(result.bytes),
          result.format,
          reason: '${fixture.file} metadata disagrees with its payload',
        );
        expect(result.width, greaterThan(0));
        expect(result.height, greaterThan(0));
      }
    });

    test('no fixture is inflated by normalisation', () {
      // Growing a capture would be a regression in the opposite direction from
      // the day-3 defect, and just as wrong.
      for (final fixture in fixtures) {
        final bytes = File('${fixturesDir.path}/${fixture.file}').readAsBytesSync();
        final result = normalizeImageSync(NormalizeRequest(bytes: bytes));

        expect(
          result.processedByteSize,
          lessThanOrEqualTo(result.originalByteSize),
          reason: '${fixture.file} grew from ${result.originalByteSize} '
              'to ${result.processedByteSize}',
        );
      }
    });

    test('the large PNG screenshot actually shrinks', () {
      // This is the day-3 regression in miniature: a PNG that image_picker's
      // imageQuality left completely untouched.
      final fixture =
          fixtures.firstWhere((f) => f.file == '17_large_screenshot.png');
      final bytes = File('${fixturesDir.path}/${fixture.file}').readAsBytesSync();

      final result = normalizeImageSync(NormalizeRequest(bytes: bytes));

      expect(result.originalFormat, DetectedImageFormat.png);
      expect(
        result.processedByteSize,
        lessThan(result.originalByteSize),
        reason: 'a PNG screenshot must get smaller, not pass through',
      );
      expect(result.wasResized, isTrue, reason: '2400x3200 exceeds the cap');
    });

    test('the EXIF-rotated fixture comes back upright', () {
      // Stored 1754x1240 with orientation 6. If the tag were ignored the
      // dimensions would come back unswapped and ML Kit would be reading a
      // sideways page.
      final bytes =
          File('${fixturesDir.path}/19_exif_rotated.jpg').readAsBytesSync();

      final result = normalizeImageSync(NormalizeRequest(bytes: bytes));

      expect(result.width, 1240);
      expect(result.height, 1754);
      expect(
        img.decodeJpgExif(result.bytes)?.imageIfd.orientation,
        anyOf(isNull, 1),
        reason: 'the stored bytes must be upright, not merely described as it',
      );
    });

    test('no fixture exceeds the long-edge cap after normalisation', () {
      for (final fixture in fixtures) {
        final bytes = File('${fixturesDir.path}/${fixture.file}').readAsBytesSync();
        final result = normalizeImageSync(
          NormalizeRequest(bytes: bytes, maxEdge: ImageNormalizer.defaultMaxEdge),
        );
        final longEdge =
            result.width > result.height ? result.width : result.height;
        expect(longEdge, lessThanOrEqualTo(ImageNormalizer.defaultMaxEdge));
      }
    });
  });
}
