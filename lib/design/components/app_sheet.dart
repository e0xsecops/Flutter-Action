import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/dimens.dart';
import 'glass_surface.dart';

/// Shell for modal bottom sheets: grab handle, optional title, safe-area aware
/// padding. Keeps every sheet in the app structurally identical so the surface
/// itself becomes familiar.
///
/// Day 17 made this the glass surface it always wanted to be. A sheet is the
/// right place for it: it is bounded, it is genuinely in front of the page it
/// covers, and a hint of that page showing through is what makes it read as a
/// layer rather than a new screen. The theme sets the sheet route's own
/// background to transparent so this widget owns the whole appearance -
/// which is also why every sheet in the app goes through here.
class AppSheet extends StatelessWidget {
  const AppSheet({
    required this.child,
    this.title,
    this.subtitle,
    super.key,
  });

  final Widget child;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return GlassSurface(
      // Rounded on the top edge only: the bottom is off-screen.
      borderRadius: Radii.sheet,
      intensity: GlassIntensity.strong,
      padding: EdgeInsets.zero,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: Space.sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(top: Space.md, bottom: Space.lg),
                  decoration: BoxDecoration(
                    color: colors.borderStrong,
                    borderRadius: BorderRadius.circular(Radii.pill),
                  ),
                ),
              ),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      Space.page, 0, Space.page, Space.xs),
                  child: Text(title!, style: text.headlineSmall),
                ),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      Space.page, 0, Space.page, Space.sm),
                  child: Text(subtitle!, style: text.bodySmall),
                ),
              const SizedBox(height: Space.sm),
              Flexible(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
