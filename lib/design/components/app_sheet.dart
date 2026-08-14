import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/dimens.dart';

/// Shell for modal bottom sheets: grab handle, optional title, safe-area aware
/// padding. Keeps every sheet in the app structurally identical so the surface
/// itself becomes familiar.
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

    return SafeArea(
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
                padding: const EdgeInsets.fromLTRB(Space.page, 0, Space.page, Space.xs),
                child: Text(title!, style: text.headlineSmall),
              ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(Space.page, 0, Space.page, Space.sm),
                child: Text(subtitle!, style: text.bodySmall),
              ),
            const SizedBox(height: Space.sm),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
