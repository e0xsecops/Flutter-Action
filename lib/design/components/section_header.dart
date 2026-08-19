import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/dimens.dart';
import '../tokens/typography.dart';

/// Header for a Home triage section.
///
/// The count sits in a muted pill rather than beside the title as bare text, so
/// a section with nothing in it reads as calm instead of as an error.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    this.count,
    this.trailing,
    super.key,
  });

  final String title;
  final int? count;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.xxl, Space.page, Space.md),
      child: Row(
        children: [
          // Flexible, so a long title at a large text size wraps instead of
          // pushing the count off the edge. Truncating a section name would
          // be worse than letting it take two lines.
          Flexible(
            child: Text(
              title.toUpperCase(),
              style: text.labelSmall?.copyWith(
                color: colors.textTertiary,
                letterSpacing: 1.0,
              ),
            ),
          ),
          if (count != null && count! > 0) ...[
            const SizedBox(width: Space.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Space.sm,
                vertical: Space.xxs,
              ),
              decoration: BoxDecoration(
                color: colors.surfaceSunken,
                borderRadius: BorderRadius.circular(Radii.pill),
              ),
              child: Text(
                '$count',
                style: text.labelSmall?.copyWith(
                  color: colors.textSecondary,
                  fontFeatures: AppText.numeric,
                ),
              ),
            ),
          ],
          const Spacer(),
          ?trailing,
        ],
      ),
    );
  }
}
