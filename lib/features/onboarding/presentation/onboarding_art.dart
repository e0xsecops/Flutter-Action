import 'package:flutter/material.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';

/// The four onboarding illustrations.
///
/// Built entirely from the app's own vocabulary — the same surfaces, hairlines,
/// radii and urgency spine the real screens use — so the first thing a new user
/// sees is the product's actual visual language rather than stock artwork.
///
/// **Deliberately wordless.** Every illustration is geometry and icons, never
/// text. That keeps them honest (no invented amounts or reference numbers on a
/// fake receipt), it makes them safe at any text scale because there is nothing
/// inside to reflow, and it leaves the headline as the only thing saying what
/// the screen means. They are decorative, so each is wrapped in
/// [ExcludeSemantics] by the page that shows it.

/// A stand-in for a captured document: a sunken card with a few text lines.
class _SourceCard extends StatelessWidget {
  const _SourceCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 96,
      height: 116,
      padding: const EdgeInsets.all(Space.md),
      decoration: BoxDecoration(
        color: colors.surfaceSunken,
        borderRadius: Radii.rMd,
        border: Border.all(color: colors.border, width: Strokes.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Bar(width: 44, color: colors.textTertiary),
          const SizedBox(height: Space.sm),
          _Bar(width: 68, color: colors.border),
          const SizedBox(height: Space.xs),
          _Bar(width: 60, color: colors.border),
          const SizedBox(height: Space.xs),
          _Bar(width: 66, color: colors.border),
          const Spacer(),
          _Bar(width: 36, color: colors.border),
        ],
      ),
    );
  }
}

/// A stand-in for a real Action Card, spine and all.
class _ActionCard extends StatelessWidget {
  const _ActionCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 116,
      height: 116,
      decoration: BoxDecoration(
        color: colors.surfaceElevated,
        borderRadius: Radii.rMd,
        border: Border.all(color: colors.border, width: Strokes.hairline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: Strokes.spine,
            decoration: BoxDecoration(
              color: colors.urgencyImportant,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(Radii.md),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Space.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Bar(width: 74, height: 8, color: colors.textSecondary),
                  const SizedBox(height: Space.sm),
                  _Bar(width: 52, color: colors.border),
                  const Spacer(),
                  _Bar(width: 40, color: colors.urgencyImportant),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.width, required this.color, this.height = 6});

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Radii.xs),
        ),
      );
}

/// Screen 1 — something messy becomes something you can act on.
class CaptureToActionArt extends StatelessWidget {
  const CaptureToActionArt({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _SourceCard(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.lg),
          child: Icon(Icons.arrow_forward_rounded,
              size: 20, color: colors.textTertiary),
        ),
        const _ActionCard(),
      ],
    );
  }
}

/// Screen 2 — a suggestion, and then a decision.
///
/// The top row is outlined and unresolved; the bottom row is the same field
/// after a person has confirmed it. Confidence uses the cool outline family
/// and confirmation uses a solid check, exactly as the review screen does.
class ReviewArt extends StatelessWidget {
  const ReviewArt({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget row({
      required IconData icon,
      required Color accent,
      required bool emphasised,
    }) {
      return Container(
        width: 240,
        padding: const EdgeInsets.symmetric(
          horizontal: Space.md,
          vertical: Space.md,
        ),
        decoration: BoxDecoration(
          color: emphasised ? colors.surfaceElevated : colors.surface,
          borderRadius: Radii.rMd,
          border: Border.all(
            color: emphasised ? accent : colors.border,
            width: Strokes.hairline,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: accent),
            const SizedBox(width: Space.md),
            _Bar(
              width: 64,
              height: 7,
              color: emphasised ? colors.textSecondary : colors.border,
            ),
            const Spacer(),
            _Bar(width: 44, height: 7, color: accent),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        row(
          icon: Icons.help_outline_rounded,
          accent: colors.confidenceReview,
          emphasised: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.sm),
          child: Icon(Icons.arrow_downward_rounded,
              size: 18, color: colors.textTertiary),
        ),
        row(
          icon: Icons.check_circle_rounded,
          accent: colors.confidenceConfirmed,
          emphasised: true,
        ),
      ],
    );
  }
}

/// Screen 3 — what the inbox does with an Action once it exists.
class TrackingArt extends StatelessWidget {
  const TrackingArt({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget actionRow({required Color spine, required int stepsDone}) {
      return Container(
        width: 240,
        // Explicit, because the spine below stretches on the cross axis and
        // this sits in a Column that would otherwise offer it infinite height.
        height: 62,
        margin: const EdgeInsets.only(bottom: Space.sm),
        decoration: BoxDecoration(
          color: colors.surfaceElevated,
          borderRadius: Radii.rMd,
          border: Border.all(color: colors.border, width: Strokes.hairline),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: Strokes.spine,
              decoration: BoxDecoration(
                color: spine,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(Radii.md),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Space.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Bar(width: 120, height: 7, color: colors.textSecondary),
                    const SizedBox(height: Space.sm),
                    Row(
                      children: [
                        for (var i = 0; i < 3; i++)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: Space.xs),
                            child: Icon(
                              i < stepsDone
                                  ? Icons.check_circle_rounded
                                  : Icons.circle_outlined,
                              size: 13,
                              color: i < stepsDone
                                  ? colors.confidenceConfirmed
                                  : colors.border,
                            ),
                          ),
                        const SizedBox(width: Space.xs),
                        _Bar(width: 40, color: colors.border),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: Space.md),
              child: Icon(Icons.notifications_none_rounded,
                  size: 16, color: colors.textTertiary),
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // A Row rather than an Align: Align would take every pixel of height
        // a Column is willing to offer it, which here is all of them.
        SizedBox(
          width: 240,
          child: Padding(
            padding: const EdgeInsets.only(bottom: Space.sm, left: Space.xxs),
            child: Row(
              children: [_Bar(width: 84, color: colors.textTertiary)],
            ),
          ),
        ),
        actionRow(spine: colors.urgencyCritical, stepsDone: 1),
        actionRow(spine: colors.urgencyNormal, stepsDone: 3),
      ],
    );
  }
}

/// Screen 4 — the boundary, drawn.
///
/// Most of the product lives inside the device outline. Two thin arrows leave
/// it, and only two: the content you hand to the model to be read, and the
/// small Action record that can be mirrored. Drawing exactly two is the point
/// — an illustration that showed none would be a lie.
class PrivacyArt extends StatelessWidget {
  const PrivacyArt({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget node(IconData icon) => Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colors.surface,
            shape: BoxShape.circle,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          child: Icon(icon, size: 18, color: colors.textTertiary),
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // The device: everything that never has to leave.
        Container(
          width: 116,
          height: 148,
          padding: const EdgeInsets.all(Space.md),
          decoration: BoxDecoration(
            color: colors.surfaceElevated,
            borderRadius: Radii.rLg,
            border: Border.all(color: colors.borderStrong, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final width in const [72.0, 58.0, 66.0, 48.0])
                Padding(
                  padding: const EdgeInsets.only(bottom: Space.sm),
                  child: _Bar(width: width, color: colors.border),
                ),
              _Bar(width: 40, color: colors.confidenceConfirmed),
            ],
          ),
        ),
        SizedBox(
          width: 56,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward_rounded,
                  size: 18, color: colors.textTertiary),
              const SizedBox(height: Space.huge),
              Icon(Icons.arrow_forward_rounded,
                  size: 18, color: colors.textTertiary),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            node(Icons.auto_stories_outlined),
            const SizedBox(height: Space.xl),
            node(Icons.cloud_outlined),
          ],
        ),
      ],
    );
  }
}
