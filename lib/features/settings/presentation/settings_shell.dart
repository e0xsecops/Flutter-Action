import 'package:flutter/material.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';

/// Shared furniture for the settings, privacy and help screens.
///
/// One place for the page frame and the row so the three screens read as one
/// area of the product rather than three people's idea of a settings page.

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.title, required this.slivers});

  final String title;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: CustomScrollView(
        slivers: [
          ...slivers,
          const SliverToBoxAdapter(child: SizedBox(height: Space.xxxl)),
        ],
      ),
    );
  }
}

/// A titled group of rows.
///
/// The title is a quiet eyebrow rather than a heading: on a settings screen
/// the rows are the content, and a loud group label competes with them.
class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
    this.footnote,
  });

  final String title;
  final List<Widget> children;

  /// Small print that belongs to the group — used for the things this
  /// product must state plainly rather than imply.
  final String? footnote;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Space.page,
          Space.xl,
          Space.page,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              header: true,
              child: Padding(
                padding: const EdgeInsets.only(left: Space.xs, bottom: Space.sm),
                child: Text(
                  title.toUpperCase(),
                  style: text.labelSmall?.copyWith(color: colors.textTertiary),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: colors.surfaceElevated,
                borderRadius: Radii.rMd,
                border:
                    Border.all(color: colors.border, width: Strokes.hairline),
              ),
              child: Column(
                children: [
                  for (var i = 0; i < children.length; i++) ...[
                    if (i > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: Space.lg),
                        child: Divider(
                          height: Strokes.hairline,
                          color: colors.border,
                        ),
                      ),
                    children[i],
                  ],
                ],
              ),
            ),
            if (footnote != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: Space.sm,
                  left: Space.xs,
                  right: Space.xs,
                ),
                child: Text(
                  footnote!,
                  style:
                      text.bodySmall?.copyWith(color: colors.textTertiary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// One row. Tappable when [onTap] is given, inert when it is not.
class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.label,
    this.description,
    this.value,
    this.trailing,
    this.onTap,
    this.destructive = false,
  });

  final String label;
  final String? description;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onTap;

  /// Destructive rows are the only place danger colour appears here, so it
  /// keeps meaning something.
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final labelColor = destructive ? colors.danger : colors.textPrimary;

    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Space.lg,
        vertical: Space.lg,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: text.titleSmall?.copyWith(color: labelColor)),
                if (description != null) ...[
                  const SizedBox(height: Space.xxs),
                  Text(
                    description!,
                    style: text.bodySmall
                        ?.copyWith(color: colors.textSecondary),
                  ),
                ],
              ],
            ),
          ),
          if (value != null) ...[
            const SizedBox(width: Space.md),
            Text(
              value!,
              style: text.bodyMedium?.copyWith(color: colors.textSecondary),
            ),
          ],
          if (trailing != null) ...[
            const SizedBox(width: Space.sm),
            trailing!,
          ] else if (onTap != null) ...[
            const SizedBox(width: Space.sm),
            Icon(Icons.chevron_right_rounded,
                size: 20, color: colors.textTertiary),
          ],
        ],
      ),
    );

    if (onTap == null) return content;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: Radii.rMd,
        child: content,
      ),
    );
  }
}

/// Body copy on the privacy and help screens.
class SettingsProse extends StatelessWidget {
  const SettingsProse(this.text, {super.key, this.top = Space.md});

  final String text;
  final double top;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(Space.page, top, Space.page, 0),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: colors.textSecondary),
        ),
      ),
    );
  }
}
