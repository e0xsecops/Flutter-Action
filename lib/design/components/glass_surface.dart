import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/dimens.dart';

/// How much presence a glass surface has.
///
/// Three steps, not a slider. A named set forces the question "which of these
/// is it?" rather than letting every call site invent its own sigma, which is
/// how a design language turns into a pile of one-offs.
enum GlassIntensity {
  /// Barely there. A surface that needs separation but must not compete —
  /// a filter tray, an inline control strip.
  subtle,

  /// The default. Floating headers, sheets, command bars.
  regular,

  /// A surface that is genuinely the subject: an onboarding hero, a modal
  /// that should feel like it is in front of everything.
  strong,
}

/// Liquid / mirror glass, as one reusable surface.
///
/// **What this is trying to look like.** Not chrome, and not a frosted
/// rectangle with a blur behind it. Real glass reads as glass because of four
/// things happening at once: it lets the background through, it is slightly
/// brighter along its top edge where light catches it, it has a hairline that
/// is lighter at the top than the bottom, and it sits fractionally above what
/// it covers. All four are cheap. What is expensive — and what this is
/// careful with — is the blur.
///
/// **The performance contract.** Day 16 spent a day making this app fast, and
/// a `BackdropFilter` is the single easiest way to give that back: it forces
/// the compositor to read back everything beneath it, every frame. So this
/// widget is only ever used on *small, bounded* surfaces — a header, a sheet,
/// a control bar — and never wrapped around a scrolling list. The blur is
/// clipped to the surface's own rounded rectangle, so the read-back region is
/// the surface and not the screen. Sigmas are deliberately modest; past about
/// 20 the visual difference is small and the cost is not.
///
/// **When there is no blur.** [BackdropFilter] does nothing useful over an
/// opaque parent, and it is exactly wrong for someone who has asked the
/// system for higher contrast. In those cases this degrades to a solid tinted
/// surface with the same border, radius and padding — the layout does not
/// move, only the translucency goes. That is also why nothing in this app
/// uses translucency to *communicate* anything: it is depth, never meaning.
class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.intensity = GlassIntensity.regular,
    this.selected = false,
    this.pressed = false,
    this.onTap,
    this.semanticLabel,
    this.tint,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final GlassIntensity intensity;

  /// A surface the user has chosen — picks up a whisper of brand colour.
  final bool selected;

  /// Externally driven press state, for callers that own their own gesture
  /// handling. When [onTap] is supplied this widget tracks its own.
  final bool pressed;

  final VoidCallback? onTap;

  /// Only set this where the surface is itself the meaningful thing. A header
  /// that merely contains labelled controls should stay silent so a screen
  /// reader does not announce a wrapper before every control inside it.
  final String? semanticLabel;

  /// Overrides the environmental colour the glass picks up. Left null the
  /// surface samples the theme's brand at very low opacity, which is what
  /// keeps a screenful of glass feeling like one material.
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final media = MediaQuery.maybeOf(context);
    final dark = Theme.of(context).brightness == Brightness.dark;

    // Someone who asked for high contrast has told us translucency is a
    // problem. Believe them.
    final wantsSolid = media?.highContrast ?? false;

    final radius = borderRadius ?? Radii.rXl;
    final spec = _GlassSpec.of(intensity, dark: dark, solid: wantsSolid);

    final Color base = tint ?? colors.brand;
    final surface = dark ? colors.surfaceElevated : Colors.white;

    Widget content = Padding(
      padding: padding ?? const EdgeInsets.all(Space.lg),
      child: child,
    );

    // The stack, bottom to top: tinted body, top-edge specular gradient, then
    // the hairline. Painting the border last keeps it crisp over the
    // gradient instead of being washed out by it.
    Widget painted = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        color: Color.alphaBlend(
          base.withValues(alpha: selected ? spec.selectedTint : spec.envTint),
          surface.withValues(alpha: spec.surfaceOpacity),
        ),
        // A vertical gradient standing in for light falling on the surface:
        // brighter where the top edge catches it, gone by the middle. This is
        // the single detail that stops a translucent box reading as flat.
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: spec.specular),
            Colors.white.withValues(alpha: 0),
          ],
          stops: const [0, 0.55],
        ),
      ),
      child: content,
    );

    painted = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: (dark ? Colors.white : Colors.white)
              .withValues(alpha: spec.borderOpacity),
          width: Strokes.hairline,
        ),
      ),
      position: DecorationPosition.foreground,
      child: painted,
    );

    Widget surfaceWidget = ClipRRect(
      borderRadius: radius,
      child: spec.blurSigma == 0
          ? painted
          : BackdropFilter(
              // Clipped by the ClipRRect above, so the read-back is this
              // surface's own bounds — never the whole screen.
              filter: ui.ImageFilter.blur(
                sigmaX: spec.blurSigma,
                sigmaY: spec.blurSigma,
              ),
              child: painted,
            ),
    );

    // Depth. Kept soft and low-opacity: this floats a few points above the
    // page, it does not hover over it.
    surfaceWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: spec.shadowOpacity),
            blurRadius: spec.shadowBlur,
            offset: Offset(0, spec.shadowBlur / 3),
          ),
        ],
      ),
      child: surfaceWidget,
    );

    if (onTap != null) {
      surfaceWidget = _PressDepth(
        radius: radius,
        onTap: onTap!,
        child: surfaceWidget,
      );
    } else if (pressed) {
      surfaceWidget = Transform.scale(scale: 0.985, child: surfaceWidget);
    }

    if (semanticLabel != null) {
      surfaceWidget = Semantics(
        label: semanticLabel,
        container: true,
        child: surfaceWidget,
      );
    }
    return surfaceWidget;
  }
}

/// The numbers behind one intensity, resolved for the current brightness.
///
/// Light and dark are not the same material with a different background. In
/// light the glass is mostly white and the highlight is what reads; in dark
/// the body is a charcoal that has to stay dark enough for white text, and the
/// highlight has to drop to near-nothing or it turns into the neon outline
/// this design explicitly does not want.
class _GlassSpec {
  const _GlassSpec({
    required this.blurSigma,
    required this.surfaceOpacity,
    required this.specular,
    required this.borderOpacity,
    required this.shadowOpacity,
    required this.shadowBlur,
    required this.envTint,
    required this.selectedTint,
  });

  final double blurSigma;
  final double surfaceOpacity;
  final double specular;
  final double borderOpacity;
  final double shadowOpacity;
  final double shadowBlur;
  final double envTint;
  final double selectedTint;

  static _GlassSpec of(
    GlassIntensity intensity, {
    required bool dark,
    required bool solid,
  }) {
    final blur = switch (intensity) {
      GlassIntensity.subtle => 10.0,
      GlassIntensity.regular => 16.0,
      GlassIntensity.strong => 22.0,
    };
    // Solid mode keeps every other property and drops only the see-through:
    // same border, same highlight, same depth, no read-back and no blur.
    final opacity = solid
        ? 1.0
        : switch (intensity) {
            GlassIntensity.subtle => dark ? 0.72 : 0.74,
            GlassIntensity.regular => dark ? 0.64 : 0.66,
            GlassIntensity.strong => dark ? 0.56 : 0.58,
          };
    return _GlassSpec(
      blurSigma: solid ? 0 : blur,
      surfaceOpacity: opacity,
      // Barely visible in dark on purpose. A bright top edge on a charcoal
      // panel is the difference between "glass" and "sci-fi".
      specular: dark ? 0.055 : 0.42,
      borderOpacity: dark ? 0.10 : 0.70,
      shadowOpacity: dark ? 0.34 : 0.08,
      shadowBlur: switch (intensity) {
        GlassIntensity.subtle => 10,
        GlassIntensity.regular => 18,
        GlassIntensity.strong => 26,
      },
      envTint: dark ? 0.045 : 0.030,
      selectedTint: dark ? 0.16 : 0.10,
    );
  }
}

/// A press that reads as the surface being pushed slightly into the page.
///
/// Scale only, 15 ms shy of imperceptible, and it honours the platform's
/// reduced-motion setting by simply not animating — the tap still works, it
/// just does not move.
class _PressDepth extends StatefulWidget {
  const _PressDepth({
    required this.child,
    required this.radius,
    required this.onTap,
  });

  final Widget child;
  final BorderRadius radius;
  final VoidCallback onTap;

  @override
  State<_PressDepth> createState() => _PressDepthState();
}

class _PressDepthState extends State<_PressDepth> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return GestureDetector(
      onTapDown: (_) => setState(() => _down = true),
      onTapCancel: () => setState(() => _down = false),
      onTapUp: (_) => setState(() => _down = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _down && !reduceMotion ? 0.985 : 1,
        duration: reduceMotion ? Duration.zero : Motion.fast,
        curve: Motion.standard,
        child: widget.child,
      ),
    );
  }
}
