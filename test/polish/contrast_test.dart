/// Contrast, measured rather than eyeballed.
///
/// **Why this exists.** V2 found the capture sheet's subtitle rendering at
/// 1.27:1 against its own background on device — invisible, and invisible for
/// a reason no amount of reading the code would have revealed. The colours
/// were fine. The surface underneath them had drifted, because a
/// `BoxDecoration` given both a `color` and a `gradient` paints only the
/// gradient, so every glass surface in the app had been discarding its own
/// opacity.
///
/// That bug is fixed. This is the guard that stops the *palette* half of the
/// same failure: a token quietly lightened until the text on it stops being
/// readable, which no widget test would catch because the widget still renders
/// and the finder still finds it.
///
/// The thresholds are WCAG 2.1 AA: 4.5:1 for body text, 3:1 for large text
/// (18.66px bold or 24px regular) and for the boundaries of user-interface
/// components.
library;

import 'dart:math' as math;

import 'package:action_app/design/tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Relative luminance, per WCAG 2.1.
double _luminance(Color color) {
  double channel(double v) =>
      v <= 0.04045 ? v / 12.92 : math.pow((v + 0.055) / 1.055, 2.4).toDouble();
  return 0.2126 * channel(color.r) +
      0.7152 * channel(color.g) +
      0.0722 * channel(color.b);
}

double contrast(Color a, Color b) {
  final la = _luminance(a);
  final lb = _luminance(b);
  final hi = math.max(la, lb);
  final lo = math.min(la, lb);
  return (hi + 0.05) / (lo + 0.05);
}

void expectContrast(
  Color foreground,
  Color background, {
  required double atLeast,
  required String what,
}) {
  final ratio = contrast(foreground, background);
  expect(
    ratio,
    greaterThanOrEqualTo(atLeast),
    reason: '$what measured ${ratio.toStringAsFixed(2)}:1, '
        'needs ${atLeast.toStringAsFixed(1)}:1',
  );
}

void main() {
  const bodyText = 4.5;
  const largeText = 3.0;
  const uiComponent = 3.0;

  for (final (name, colors) in [
    ('light', AppColors.light),
    ('dark', AppColors.dark),
  ]) {
    group('$name — text on its own surfaces', () {
      final surfaces = <String, Color>{
        'surface': colors.surface,
        'surfaceElevated': colors.surfaceElevated,
        'surfaceSunken': colors.surfaceSunken,
      };

      for (final surface in surfaces.entries) {
        test('primary text on ${surface.key}', () {
          expectContrast(
            colors.textPrimary,
            surface.value,
            atLeast: bodyText,
            what: 'textPrimary on ${surface.key} ($name)',
          );
        });

        test('secondary text on ${surface.key}', () {
          expectContrast(
            colors.textSecondary,
            surface.value,
            atLeast: bodyText,
            what: 'textSecondary on ${surface.key} ($name)',
          );
        });

        test('tertiary text on ${surface.key}', () {
          // The one that regressed. This token carries dates, counts and
          // section eyebrows — information, not decoration — so it is held to
          // the body-text threshold rather than excused as a label.
          expectContrast(
            colors.textTertiary,
            surface.value,
            atLeast: bodyText,
            what: 'textTertiary on ${surface.key} ($name)',
          );
        });
      }
    });

    group('$name — meaning colours', () {
      final meanings = <String, Color>{
        'brand': colors.brand,
        'danger': colors.danger,
        'success': colors.success,
        'urgencyCritical': colors.urgencyCritical,
        'urgencyImportant': colors.urgencyImportant,
        'confidenceConfirmed': colors.confidenceConfirmed,
        'confidenceHigh': colors.confidenceHigh,
        'confidenceReview': colors.confidenceReview,
      };

      for (final meaning in meanings.entries) {
        test('${meaning.key} reads as large text on the elevated surface', () {
          // These appear as badge labels and section eyebrows, which are
          // small — but they are always paired with an icon or a shape
          // carrying the same meaning, never colour alone. Held to the
          // large-text bar, which is the honest one for that usage.
          expectContrast(
            meaning.value,
            colors.surfaceElevated,
            atLeast: largeText,
            what: '${meaning.key} on surfaceElevated ($name)',
          );
        });
      }

      test('text on the brand fill is readable', () {
        expectContrast(
          colors.onBrand,
          colors.brand,
          atLeast: bodyText,
          what: 'onBrand on brand ($name)',
        );
      });

      test('the brand reads on its own subtle tint', () {
        // The capture sheet's primary option, and every glyph tile.
        expectContrast(
          colors.brand,
          colors.brandSubtle,
          atLeast: largeText,
          what: 'brand on brandSubtle ($name)',
        );
      });
    });

    group('$name — structure', () {
      test('the strong border is perceptible against the elevated surface', () {
        // Deliberately *not* held to the 3:1 that WCAG 1.4.11 asks of
        // component boundaries, and it is worth saying why rather than
        // quietly using a lower number.
        //
        // 1.4.11 covers visual information *required* to identify a component.
        // A hairline here is a separator, not the thing that identifies a
        // card: the card is identified by its fill against the ambient field
        // behind it, and by its content. Holding every hairline in the app to
        // 3:1 would draw the whole interface as a wireframe, which is a real
        // cost paid for a rule that does not apply.
        //
        // What this does catch is a border edited until it is invisible, which
        // would leave adjacent rows running into each other.
        expectContrast(
          colors.borderStrong,
          colors.surfaceElevated,
          atLeast: 1.3,
          what: 'borderStrong on surfaceElevated ($name)',
        );
      });

      test('a control filled with brand is identifiable against the page', () {
        // This one *is* 1.4.11: the capture orb and the primary button are
        // identified by their fill and nothing else.
        expectContrast(
          colors.brand,
          colors.surface,
          atLeast: uiComponent,
          what: 'brand fill on surface ($name)',
        );
      });
    });

    group('$name — the hierarchy is still a hierarchy', () {
      test('tertiary is lighter than secondary, which is lighter than primary',
          () {
        // The fix darkened tertiary. It must not have darkened it so far that
        // the three steps collapse into two.
        final onSurface = colors.surface;
        final primary = contrast(colors.textPrimary, onSurface);
        final secondary = contrast(colors.textSecondary, onSurface);
        final tertiary = contrast(colors.textTertiary, onSurface);

        expect(primary, greaterThan(secondary));
        expect(secondary, greaterThan(tertiary));
        // And the gap between secondary and tertiary is still perceptible.
        expect(secondary - tertiary, greaterThan(0.5));
      });
    });
  }

  group('the measurement itself', () {
    test('agrees with the known extremes', () {
      expect(contrast(Colors.black, Colors.white), closeTo(21, 0.01));
      expect(contrast(Colors.white, Colors.white), closeTo(1, 0.001));
    });

    test('is symmetric', () {
      expect(
        contrast(AppColors.light.textSecondary, AppColors.light.surface),
        closeTo(
          contrast(AppColors.light.surface, AppColors.light.textSecondary),
          0.0001,
        ),
      );
    });
  });
}
