# Action V2 — Design System

## The problem this had to solve

On device, the Day-20 build looked like a stock Flutter app with grey translucent
cards. The engineering behind it was not the reason.

`GlassSurface` was already doing the right things — clipped blur, specular
gradient, hairline border, per-brightness tuning, a high-contrast fallback. It
still rendered flat. The cause was arithmetic, not art:

```
scaffoldBackgroundColor = #FAFAFB          // one flat near-white
blur(constant colour)   = that constant     // Gaussian of a constant
result                  = surface × opacity // a grey card
```

There was nothing behind the glass to bend. **No amount of tuning the material
could have fixed it**, which is why V2 starts with the environment.

---

## 1. Ambient environment

`lib/design/ambient/ambient_background.dart`

Painted once at the shell, behind every destination, so moving between Today and
Library feels like moving within one place.

| Layer | Light | Dark |
|---|---|---|
| Tonal base (vertical) | `#F8F9FD` → `#EDF0F7` | `#0B0E13` → `#090B0F` |
| Brand pool, upper right | `brand` @ 0.055 | `brand` @ 0.13 |
| Cool pool, lower left | `confidenceReview` @ 0.032 | `confidenceReview` @ 0.07 |

Radial stops are `[0, 0.75]` so the falloff happens early and the pool reads as
presence rather than a circle with an edge.

**Cost**: one `CustomPainter`, three gradients, `shouldRepaint` false unless the
palette changes. No blur, no animation, no timer, no image.

**Restraint**: every alpha is between 0.03 and 0.13. If you can point at it and
call it a gradient, it is wrong. No aurora, no mesh, no animated blobs.

**Accessibility**: under `MediaQuery.highContrast` this collapses to the flat
surface colour, matching what the glass does.

`AmbientGlow` puts a local pool of light behind one hero surface. Used twice in
the whole app — the Today brief and the Studio hero.

---

## 2. Glass material

`lib/design/components/glass_surface.dart`

Four intensities: `subtle`, `regular`, `strong`, `hero`. A named set, not a
slider, so every call site answers "which of these is it?" rather than inventing
a sigma.

### The recipe

Layer order, bottom to top, inside a `ClipRRect`:

1. **`BackdropFilter`** with a *composed* filter:
   ```dart
   ui.ImageFilter.compose(
     outer: ColorFilter.matrix(_saturation(s)),   // 1.7 light / 1.45 dark
     inner: ui.ImageFilter.blur(sigmaX: σ, sigmaY: σ),
   )
   ```
   **This is the single most important line in the design system.** A Gaussian
   blur averages colour toward the mid-point, so the more you blur the more
   desaturated the result — that is *definitionally* grey. Apple's material
   concentrates light rather than scattering it; re-saturating the blurred
   backdrop is the honest equivalent, and `compose` makes it one filter rather
   than a second read-back.

2. **Tinted body** — environment tint alpha-blended into a white (light) or
   `surfaceElevated` (dark) at the intensity's opacity.

3. **Specular wash** — a vertical white gradient, `stops: [0, 0.55]`. Now a
   whisper (0.14 light / 0.04 dark), *not* a sheen. The previous 0.42 lightened
   the whole top half of the fill, which is what made a surface read as a pale
   grey panel rather than a lens.

4. **Lit top rim** — a 1.2px horizontal gradient of near-white, inset from the
   corners. Light catching a physical edge.

5. **Shaded bottom rim** — the same in black. Painting only the highlight gives a
   stroke; painting both gives *thickness*.

6. **Hairline border**, painted last so it stays crisp over the gradient.

7. **Depth shadow**, soft and low-opacity.

### Numbers

| Intensity | Role | σ | Body opacity (light / dark) | Shadow blur |
|---|---|---|---|---|
| subtle | inline surface | 12 | 0.40 / 0.46 | 10 |
| regular | sheets, panels | 18 | 0.36 / 0.42 | 18 |
| strong | **chrome over moving content** | 24 | 0.56 / 0.62 | 26 |
| hero | content surface over the field | 28 | 0.27 / 0.33 | 34 |

These are four named **roles**, not a linear transparency ramp — `strong` is
deliberately the most opaque. Chrome sits over a scrolling list and has to stay
legible while text passes beneath it; on device at 0.30 the section headings
scrolling under the nav bar read straight through it and looked like a rendering
fault. `hero` can be far more transparent because what is behind it is the quiet
ambient field, not text.

Saturation 1.7 (light) / 1.45 (dark). Above ~1.9 the backdrop looks tinted
rather than clear and skin tones in a photographed document go lurid.

Apple's own equivalents are far more transparent still (white at 8–14%). Action
sits higher deliberately: Apple's glass floats over photographs and content,
Action's floats over a deliberately quiet field, and at 12% the hero would
disappear into it.

### The performance contract

**Glass is for chrome. Never for list rows.**

| Uses glass | Does not |
|---|---|
| Nav bar | Action cards |
| Today brief hero | Source cards |
| Studio hero | Tool cards |
| Bottom sheets | Search results |

A `BackdropFilter` forces the compositor to read back everything beneath it,
every frame. One per screen is a design; one per row is how Day 16's work gets
given back. Day-17 tests assert exactly one blur layer per surface and that the
blur is clipped to the surface's own bounds.

### Fallbacks

- `highContrast` → σ = 0, saturation = 1, opacity = 1. Same border, same rims,
  same padding, same layout. A different *material*, not a different layout.
- `disableAnimations` → the press-depth scale is skipped; the tap still works.

---

## 3. Colour

The Day-3 token layer is unchanged and correct. Two families, deliberately kept
apart by hue *and* treatment:

- **Urgency** — warm (red → amber → slate), always a solid fill.
- **Confidence** — cool (teal → blue → violet → neutral), always outline + icon.

Hue alone is not enough: someone glancing at an amber badge should not have to
work out whether it means "due soon" or "we are unsure".

V2 adds one mapping, in `tool_glyphs.dart`: a hue per Intelligence category,
drawn from the existing confidence family rather than new swatches, so a tool's
mark says which of the five intents it belongs to before its title is read.

Brand blue remains reserved for the primary action and identity. It is never
used for state.

---

## 4. Iconography

**No sparkles. No robots.** Every Intelligence glyph describes what the tool does
to your material — reads it, questions it, compares it, shields it — never that
a model is involved. Marking all fifteen with a wand would tell the user the only
thing they already assumed and none of the thing they need to choose between.

`ToolGlyph` is an enum in the domain layer; the mapping to `IconData` lives in
presentation, so the domain stays free of Flutter.

---

## 5. Typography

Unchanged from Day 3 and still right. One V2 correction of *usage*, not scale:
the old Home made `displaySmall` (32px/700) carry the word "Good evening" — the
largest element on the screen was a greeting with no information in it. Today
now uses `labelSmall` for the date eyebrow and `headlineMedium` for the greeting,
and reserves `headlineSmall` for the brief headline, which is the sentence that
actually matters.

---

## 6. Motion

Short, standard-eased, only where it explains a change of state. `Motion.fast`
(150ms) for press depth and nav selection, `Motion.base` (220ms) for transitions.

Every animation checks `disableAnimations` and degrades to `Duration.zero`.

**Predictive back is now inherited rather than overridden.** The theme used to
pin `FadeForwardsPageTransitionsBuilder`, which looks like a deliberate choice
and is in fact exactly the fallback `PredictiveBackPageTransitionsBuilder`
degrades to where predictive back is unavailable — so the override kept the
fallback and discarded the feature, on an app targeting API 36 where the system
enables it by default.

---

## 7. Haptics

Four moments only: capture selection, nav destination change, confirmed Action
creation, destructive confirmation. `selectionClick` for navigation,
`mediumImpact` for capture. No haptic on scroll, no click sounds.

---

## 8. What V2 deliberately did not adopt

**Material 3 Expressive.** Flutter 3.47 has no M3E component or motion API —
there is no `MotionScheme` in the SDK, and Flutter's own source states its
springs are not currently supported. Every M3E component name in circulation
(`NavigationSuiteScaffold`, `ButtonGroup`, FAB Menu) is Jetpack Compose. Adopting
it here would mean planning against an API surface that does not exist.

Google's research attributes the measured gains to *emphasis hierarchy* — size,
containment and colour concentrated on one primary action — not to decoration.
Action's existing rules (zero elevation, hairline borders, brand reserved for the
primary action) are already that strategy.

**A custom fragment shader for edge refraction.** `ui.ImageFilter.shader` is
available and would give genuine lensing. It is not in V2 because the composed
saturation filter closed most of the visible gap for five lines and no shader
compilation risk. Revisit only with a profile showing the remaining gap matters.

**Third-party glass packages.** Unofficial re-implementations of a moving spec,
in an app whose Day-19 discipline removed `cupertino_icons` purely for being
unused.
