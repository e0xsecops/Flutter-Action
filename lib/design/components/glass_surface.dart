import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/dimens.dart';

/// How much presence a glass surface has.
///
/// Four steps, not a slider. A named set forces the question "which of these
/// is it?" rather than letting every call site invent its own sigma, which is
/// how a design language turns into a pile of one-offs.
enum GlassIntensity {
  /// Barely there. A surface that needs separation but must not compete —
  /// a filter tray, an inline control strip.
  subtle,

  /// The default. Floating headers, sheets, command bars.
  regular,

  /// A surface that is genuinely the subject: a modal that should feel like it
  /// is in front of everything.
  strong,

  /// The one surface on a screen that is the point of the screen — the Today
  /// brief, the Studio hero. At most one per screen; a page with two heroes
  /// has none.
  hero,

  /// A modal sheet.
  ///
  /// **Its own role because a sheet is the one glass surface whose backdrop is
  /// not the app.** Everything else here samples a page: an ambient field, a
  /// list, a document. A sheet samples a page *through the modal scrim*, which
  /// is arbitrary and dark, so its legibility stops being a property of the
  /// design and becomes a property of whatever the barrier happens to be.
  ///
  /// Measured on device before this role existed: the capture sheet's subtitle
  /// came out at 1.27:1 against its own background and the privacy note at
  /// 2.96:1, where AA wants 4.5:1. The text colours were not wrong — they were
  /// chosen against a near-white surface, and the composite had drifted to a
  /// mid grey.
  ///
  /// So this is anchored: near-opaque, enough for a hint of movement behind it
  /// and not enough for the scrim to drag the surface anywhere.
  sheet,
}

/// Liquid / mirror glass, as one reusable surface.
///
/// **What this is trying to look like.** Not chrome, and not a frosted
/// rectangle with a blur behind it. Real glass reads as glass because of four
/// things happening at once: it lets the background through, it is brighter
/// along the edge where light catches it, it has a hairline that is lighter at
/// the top than the bottom, and it sits fractionally above what it covers.
///
/// **The V2 correction.** All four of those were already implemented here, and
/// on device this still rendered as a flat grey card. The fault was not in this
/// widget: the app painted a single flat near-white behind it, and a blur of a
/// constant colour is that constant. There was nothing to bend. [AmbientBackground]
/// now paints a tonal field with two low-alpha pools, and with something
/// actually behind it the material was re-tuned — lower body opacity so the
/// field shows through, a real lit top edge rather than only a wash, and a
/// darker bottom seat so the surface has thickness.
///
/// **The performance contract.** Day 16 spent a day making this app fast, and
/// a `BackdropFilter` is the single easiest way to give that back: it forces
/// the compositor to read back everything beneath it, every frame. So this
/// widget is only ever used on *small, bounded* surfaces — a header, a sheet, a
/// control bar, one hero — and **never** on the rows of a scrolling list. The
/// blur is clipped to the surface's own rounded rectangle, so the read-back
/// region is the surface and not the screen. Sigmas are deliberately modest;
/// past about 24 the visual difference is small and the cost is not.
///
/// **When there is no blur.** [BackdropFilter] does nothing useful over an
/// opaque parent, and it is exactly wrong for someone who has asked the system
/// for higher contrast. In those cases this degrades to a solid tinted surface
/// with the same border, radius and padding — the layout does not move, only
/// the translucency goes. That is also why nothing in this app uses translucency
/// to *communicate* anything: it is depth, never meaning.
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

    // The body: environment tint blended into the surface, then a vertical
    // gradient standing in for light falling across it — brightest at the top,
    // gone by the middle. This is the single detail that stops a translucent
    // box reading as flat.
    //
    // **Two boxes, not one, and this is load-bearing.** A `BoxDecoration`
    // given both a `color` and a `gradient` paints only the gradient:
    // `BoxPainter._getBackgroundPaint` assigns `paint.color` and then
    // `paint.shader`, and a shader wins. So the single-decoration version of
    // this widget silently discarded `surfaceOpacity` — every intensity in the
    // ramp rendered identically, as nothing but the specular wash, and the
    // whole table below was dead code.
    //
    // Found by measuring the capture sheet on device: its subtitle came out at
    // 1.27:1 against its own background, which is not a value any of these
    // numbers can produce. Nothing in the code reads wrong; it is one of those
    // defects that is only visible in pixels.
    Widget painted = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        color: Color.alphaBlend(
          base.withValues(alpha: selected ? spec.selectedTint : spec.envTint),
          surface.withValues(alpha: spec.surfaceOpacity),
        ),
      ),
      // The highlight, and the difference between glass and a gradient.
      //
      // A top-to-middle linear wash is what most "glassmorphism" does, and it
      // reads as a gradient painted on a panel because it has no source: the
      // light is everywhere along the top edge at once. A real surface catches
      // one light and is brightest where it faces it.
      //
      // So this is a radial hotspot, placed at the same corner the ambient
      // field's brand pool occupies — `AmbientBackground` puts it at
      // Alignment(0.85, -0.75). Every glass surface on a screen now catches
      // the light from the same direction as every other one, which is the
      // cue that makes a set of surfaces read as being in one room.
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: RadialGradient(
            center: const Alignment(0.72, -1.05),
            radius: 1.25,
            colors: [
              Colors.white.withValues(alpha: spec.specular),
              Colors.white.withValues(alpha: spec.specular * 0.35),
              Colors.white.withValues(alpha: 0),
            ],
            stops: const [0, 0.42, 1],
          ),
        ),
        child: content,
      ),
    );

    // The lit edge. A hairline of near-white along the very top of the surface,
    // inside the clip — this is light catching a physical edge, and it is what
    // separates "glass" from "translucent panel". Ignored in solid mode, where
    // there is no edge to catch anything.
    if (!wantsSolid) {
      painted = Stack(
        children: [
          painted,
          Positioned(
            top: 0,
            left: radius.topLeft.x * 0.6,
            right: radius.topRight.x * 0.6,
            height: 1.2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0),
                    Colors.white.withValues(alpha: spec.edgeHighlight),
                    Colors.white.withValues(alpha: 0),
                  ],
                  stops: const [0, 0.5, 1],
                ),
              ),
            ),
          ),
          // The shaded lower rim. Light catches the top of a physical edge and
          // the bottom falls into shadow; painting only the highlight gives a
          // stroke, painting both gives thickness.
          Positioned(
            bottom: 0,
            left: radius.bottomLeft.x * 0.6,
            right: radius.bottomRight.x * 0.6,
            height: 1.2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0),
                    Colors.black.withValues(alpha: spec.edgeShade),
                    Colors.black.withValues(alpha: 0),
                  ],
                  stops: const [0, 0.5, 1],
                ),
              ),
            ),
          ),
        ],
      );
    }

    // The hairline. Painted last so it stays crisp over the gradient instead
    // of being washed out by it.
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
              //
              // A blur ALONE is why translucent surfaces read as grey: a
              // Gaussian average pulls every colour toward the mid-point, so
              // the more you blur the more desaturated the result. Apple's
              // material concentrates light rather than scattering it. The
              // closest honest equivalent here is to saturate the backdrop
              // *after* blurring it, which is one composed filter rather than
              // a second read-back.
              filter: ui.ImageFilter.compose(
                outer: ColorFilter.matrix(_saturation(spec.saturation)),
                inner: ui.ImageFilter.blur(
                  sigmaX: spec.blurSigma,
                  sigmaY: spec.blurSigma,
                ),
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
    required this.saturation,
    required this.surfaceOpacity,
    required this.specular,
    required this.edgeHighlight,
    required this.edgeShade,
    required this.borderOpacity,
    required this.shadowOpacity,
    required this.shadowBlur,
    required this.envTint,
    required this.selectedTint,
  });

  final double blurSigma;

  /// How much the blurred backdrop is re-saturated. 1.0 is untouched.
  final double saturation;

  final double surfaceOpacity;
  final double specular;

  /// The lit top edge. Brighter than the wash and only a pixel tall.
  final double edgeHighlight;

  /// The shaded bottom edge, which is what gives the surface thickness.
  final double edgeShade;

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
      GlassIntensity.subtle => 12.0,
      GlassIntensity.regular => 18.0,
      GlassIntensity.strong => 24.0,
      GlassIntensity.hero => 28.0,
      GlassIntensity.sheet => 24.0,
    };

    // Solid mode keeps every other property and drops only the see-through:
    // same border, same highlight, same depth, no read-back and no blur.
    //
    // The translucent values are lower than V1's. V1 sat at 0.66 over a flat
    // white page, which is the same colour either way; now that there is a
    // tonal field behind, letting more of it through is what makes the
    // material visible at all.
    final opacity = solid
        ? 1.0
        : switch (intensity) {
            GlassIntensity.subtle => dark ? 0.46 : 0.40,
            GlassIntensity.regular => dark ? 0.42 : 0.36,
            // NOT a continuation of the ramp. `strong` is chrome that sits
            // over *moving content* — the nav bar, a sheet — and it has to stay
            // legible while a list scrolls beneath it. On device at 0.30 the
            // headings passing underneath read straight through the bar and
            // looked like a rendering fault. `hero` can be far more
            // transparent because what is behind it is the quiet ambient
            // field, not text.
            // Raised again once the opacity actually painted. Measured on
            // device, the selected nav label — brand blue on the bar — came
            // out at 4.35:1 against it, just under AA for small text. The bar
            // is chrome over moving content, so a lighter body serves the same
            // purpose the role was created for.
            GlassIntensity.strong => dark ? 0.74 : 0.72,
            GlassIntensity.hero => dark ? 0.33 : 0.27,
            // Anchored. See the enum comment: this is the one surface whose
            // backdrop is a scrim rather than the app, so it cannot afford to
            // let the backdrop decide its contrast.
            GlassIntensity.sheet => dark ? 0.94 : 0.95,
          };

    return _GlassSpec(
      blurSigma: solid ? 0 : blur,
      // Above ~1.9 the backdrop starts to look tinted rather than clear, and
      // skin tones in a photographed document go lurid. Dark needs less: the
      // ambient field is already deeper in colour there.
      saturation: solid ? 1.0 : (dark ? 1.45 : 1.7),
      surfaceOpacity: opacity,
      // Barely visible in dark on purpose. A bright top edge on a charcoal
      // panel is the difference between "glass" and "sci-fi".
      // A whisper, not a sheen. The old value (0.44) lightened the whole top
      // half of the fill, which is what made the surface read as a pale grey
      // panel rather than a lens — the highlight belongs on the edge.
      // Raised alongside the move to a radial hotspot: a concentrated
      // highlight can be brighter than a full-width wash without lightening
      // the panel, which is what made the old linear version read as pale grey
      // rather than as a lens.
      specular: dark ? 0.07 : 0.20,
      edgeHighlight: dark ? 0.26 : 0.92,
      // The 2026 addition to Apple's material: a darkened opposite edge is
      // what gives the surface thickness. Without it a bright top rim alone
      // reads as a stroke.
      edgeShade: dark ? 0.30 : 0.10,
      borderOpacity: dark ? 0.12 : 0.72,
      shadowOpacity: switch (intensity) {
        GlassIntensity.hero => dark ? 0.42 : 0.11,
        _ => dark ? 0.34 : 0.08,
      },
      shadowBlur: switch (intensity) {
        GlassIntensity.subtle => 10,
        GlassIntensity.regular => 18,
        GlassIntensity.strong => 26,
        GlassIntensity.hero => 34,
        GlassIntensity.sheet => 30,
      },
      envTint: dark ? 0.05 : 0.035,
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

/// A 5x4 colour matrix that scales saturation by [s].
///
/// Standard luminance coefficients (0.213 / 0.715 / 0.072) so a grey stays
/// exactly grey and only chroma is scaled — the point is to recover the colour
/// the blur averaged away, not to shift the hue.
List<double> _saturation(double s) {
  const lr = 0.213, lg = 0.715, lb = 0.072;
  final ir = (1 - s) * lr, ig = (1 - s) * lg, ib = (1 - s) * lb;
  return <double>[
    ir + s, ig, ib, 0, 0, //
    ir, ig + s, ib, 0, 0, //
    ir, ig, ib + s, 0, 0, //
    0, 0, 0, 1, 0, //
  ];
}
