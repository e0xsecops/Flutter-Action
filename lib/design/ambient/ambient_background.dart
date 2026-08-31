/// The environment that makes glass possible.
///
/// **Why this exists, and why it is the first thing V2 needed.** The app's
/// glass surfaces were engineered correctly — clipped blur, specular gradient,
/// hairline border, tuned per brightness — and still rendered as flat grey
/// rectangles on device. The reason is arithmetic rather than art:
/// `scaffoldBackgroundColor` was a single flat near-white, and a Gaussian blur
/// of a constant colour is that same constant. There was nothing behind the
/// glass to bend, so every surface collapsed to `surface × opacity` — a grey
/// card. No amount of tuning the glass itself could have fixed it.
///
/// So this paints a quiet, structured field behind the whole app: a vertical
/// tonal base plus two very low-alpha radial pools. It is what the blur samples.
///
/// **Cost.** Two radial gradients and a linear one, painted once into a
/// `CustomPainter` that never repaints unless the palette changes. No blur, no
/// animation, no timer, no image. This is close to free, and deliberately so:
/// the Day-16 performance work is not being spent on a background.
///
/// **Restraint.** Alphas here are in the 0.02–0.10 range. This is atmosphere,
/// not decoration — if you can point at it and call it a gradient, it is wrong.
/// No aurora, no mesh, no animated blobs.
library;

import 'package:flutter/material.dart';

import '../tokens/colors.dart';

/// Paints the ambient field behind a screen.
///
/// Sits at the root of the shell so every destination shares one continuous
/// environment — moving between Today and Library should feel like moving
/// within one place, not swapping two independently-painted pages.
class AmbientBackground extends StatelessWidget {
  const AmbientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final dark = Theme.of(context).brightness == Brightness.dark;

    // Someone who has asked the system for higher contrast has told us that
    // subtle tonal fields are working against them. Believe them: fall back to
    // the flat surface, which is also what the glass falls back to.
    final flat = MediaQuery.maybeOf(context)?.highContrast ?? false;

    if (flat) {
      return ColoredBox(color: colors.surface, child: child);
    }

    return CustomPaint(
      painter: _AmbientPainter(colors: colors, dark: dark),
      // The field is decoration in the strict sense — it must never be
      // announced, and it must never intercept a gesture meant for content.
      isComplex: false,
      willChange: false,
      child: child,
    );
  }
}

class _AmbientPainter extends CustomPainter {
  const _AmbientPainter({required this.colors, required this.dark});

  final AppColors colors;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // 1. Tonal base. A vertical fall from slightly lighter to slightly deeper.
    //    This alone is what gives a glass surface something to differ from as
    //    it moves down the page.
    final base = dark
        ? const [Color(0xFF0B0E13), Color(0xFF090B0F)]
        : const [Color(0xFFF8F9FD), Color(0xFFEDF0F7)];
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: base,
        ).createShader(rect),
    );

    // 2. Brand pool, upper right. The app's identity colour, present as light
    //    rather than as a painted element.
    _pool(
      canvas,
      rect,
      centre: Alignment(0.85, -0.75),
      radius: 1.15,
      colour: colors.brand,
      alpha: dark ? 0.13 : 0.055,
    );

    // 3. A second, cooler pool low-left, so the field is not one directional
    //    wash. Drawn from the review hue rather than a new colour, which keeps
    //    the environment inside the palette the rest of the app uses.
    _pool(
      canvas,
      rect,
      centre: const Alignment(-0.9, 0.8),
      radius: 1.0,
      colour: colors.confidenceReview,
      alpha: dark ? 0.07 : 0.032,
    );
  }

  void _pool(
    Canvas canvas,
    Rect rect, {
    required Alignment centre,
    required double radius,
    required Color colour,
    required double alpha,
  }) {
    canvas.drawRect(
      rect,
      Paint()
        ..shader = RadialGradient(
          center: centre,
          radius: radius,
          colors: [
            colour.withValues(alpha: alpha),
            colour.withValues(alpha: 0),
          ],
          // Most of the falloff happens early, so the pool reads as a soft
          // presence rather than a visible circle with an edge.
          stops: const [0, 0.75],
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(_AmbientPainter old) =>
      old.dark != dark || old.colors.brand != colors.brand;
}

/// A local pool of light behind one surface.
///
/// Used sparingly — behind the Today hero and the Studio hero — so the most
/// important glass on a screen has something brighter beneath it and separates
/// from the field. Not a shadow and not a border: it is the environment being
/// slightly brighter in one place.
class AmbientGlow extends StatelessWidget {
  const AmbientGlow({
    super.key,
    required this.child,
    this.colour,
    this.intensity = 1,
  });

  final Widget child;

  /// Defaults to the brand hue.
  final Color? colour;

  /// Scales the alpha. Keep at or below 1 outside of a genuine hero.
  final double intensity;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final dark = Theme.of(context).brightness == Brightness.dark;
    if (MediaQuery.maybeOf(context)?.highContrast ?? false) return child;

    final tint = colour ?? colors.brand;

    return DecoratedBox(
      decoration: BoxDecoration(
        // A large, very soft, spread shadow in the brand hue reads as light
        // pooling behind the surface. It is cheaper than a second painter and
        // sits exactly where the surface is.
        boxShadow: [
          BoxShadow(
            color: tint.withValues(
              alpha: (dark ? 0.16 : 0.10) * intensity,
            ),
            blurRadius: 44,
            spreadRadius: -6,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
