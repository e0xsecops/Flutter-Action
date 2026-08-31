/// Shared furniture for Settings, Security & privacy, and Help.
///
/// **What changed at V2, and why.** The previous version was a stack of
/// bordered boxes containing dividered rows — the default Material settings
/// shape, and completely anonymous. Nothing about it said which app it
/// belonged to, and next to the Studio and Today it read as a screen someone
/// else had built.
///
/// The rows now carry the same tinted-glyph language the Intelligence tools
/// use, the groups lost their boxes, and the page gained a real header instead
/// of an app-bar title. The visual weight moved from the container to the
/// content, which is the right way round: on a settings screen the rows *are*
/// the content, and a box drawn round them is decoration competing with them.
///
/// The glyph is not ornament. It is the fastest way to find "the one about
/// notifications" in a list of fourteen, and colour carries the category —
/// protection reads one way, data another — without a word of explanation.
library;

import 'package:flutter/material.dart';

import '../../../app/action_shell.dart';
import '../../../design/ambient/ambient_background.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';

/// The page frame.
///
/// Sits on the ambient field like the rest of the app rather than on a flat
/// scaffold colour, so moving from Today into Settings feels like moving
/// within one place.
class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.title,
    required this.slivers,
    this.subtitle,
  });

  final String title;

  /// One line under the title, where the page needs framing. Most do not.
  final String? subtitle;

  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return AmbientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: const SizedBox.shrink(),
        ),
        // Prose pages would otherwise run edge to edge on a tablet, which is
        // where long lines stop being readable.
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.readableContent,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Space.page,
                      0,
                      Space.page,
                      Space.md,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Semantics(
                          header: true,
                          child: Text(title, style: text.headlineSmall),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: Space.sm),
                          Text(
                            subtitle!,
                            style: text.bodyMedium
                                ?.copyWith(color: colors.textSecondary),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                ...slivers,
                // Clears the floating navigation bar, which is translucent and
                // would otherwise sit over the last row.
                const SliverToBoxAdapter(
                  child: SizedBox(height: actionNavBarClearance),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A group of rows under a quiet label.
///
/// The label is an eyebrow rather than a heading: it orients, and then gets
/// out of the way.
class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
    this.footnote,
    this.trailing,
  });

  final String title;
  final List<Widget> children;

  /// Small print belonging to the group — used for the things this product
  /// must state plainly rather than imply.
  final String? footnote;

  /// A status for the whole group, shown beside its label.
  final Widget? trailing;

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
            Row(
              children: [
                Expanded(
                  child: Semantics(
                    header: true,
                    child: Text(
                      title.toUpperCase(),
                      style: text.labelSmall?.copyWith(
                        color: colors.textTertiary,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ),
                ?trailing,
              ],
            ),
            const SizedBox(height: Space.xs),
            ...children,
            if (footnote != null)
              Padding(
                padding: const EdgeInsets.only(top: Space.sm, right: Space.sm),
                child: Text(
                  footnote!,
                  style: text.bodySmall?.copyWith(color: colors.textTertiary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// One row.
///
/// [icon] is close to required in practice: a row without one sits ragged
/// against the rows that have one, and the glyph is what makes a long list
/// scannable. It is optional only for the handful of rows that are pure
/// statements of fact, like a version number.
class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.label,
    this.description,
    this.value,
    this.icon,
    this.tint,
    this.trailing,
    this.action,
    this.onTap,
    this.destructive = false,
  });

  final String label;
  final String? description;
  final String? value;

  final IconData? icon;

  /// The glyph's colour, and the tint of the tile behind it. Defaults to the
  /// brand, which is the right answer for anything navigational.
  final Color? tint;

  /// A compact control that sits beside the title: a switch, a small icon.
  ///
  /// Anything wider belongs in [action]. A full-width button here competes
  /// with the label for one line and, at large text scales, wraps the label
  /// mid-word — which is exactly how "Notifications" once rendered as
  /// "Notification / s" on device.
  final Widget? trailing;

  /// A button belonging to this row, rendered under the description.
  final Widget? action;

  final VoidCallback? onTap;

  /// Destructive rows are the only place danger colour appears here, so it
  /// keeps meaning something.
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final labelColor = destructive ? colors.danger : colors.textPrimary;
    final glyphColor = destructive ? colors.danger : (tint ?? colors.brand);

    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Space.sm,
        vertical: Space.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            _Glyph(icon: icon!, colour: glyphColor),
            const SizedBox(width: Space.md),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        label,
                        style: text.titleSmall?.copyWith(color: labelColor),
                      ),
                    ),
                    if (value != null) ...[
                      const SizedBox(width: Space.md),
                      // Flexible, not fixed: at 1.8x text a label and a value
                      // competing for one line is what overflowed the row.
                      // The label keeps the space it needs and the value gives
                      // way, which is the right priority.
                      Flexible(
                        child: Text(
                          value!,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: text.bodyMedium
                              ?.copyWith(color: colors.textSecondary),
                        ),
                      ),
                    ],
                    if (trailing != null) ...[
                      const SizedBox(width: Space.sm),
                      trailing!,
                    ] else if (onTap != null) ...[
                      const SizedBox(width: Space.xs),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 20,
                        color: colors.textTertiary,
                      ),
                    ],
                  ],
                ),
                if (description != null) ...[
                  const SizedBox(height: Space.xxs),
                  Padding(
                    // Keeps the description clear of a trailing switch.
                    padding: EdgeInsets.only(
                      right: trailing != null ? Space.xxxl : 0,
                    ),
                    child: Text(
                      description!,
                      style: text.bodySmall
                          ?.copyWith(color: colors.textSecondary),
                    ),
                  ),
                ],
                if (action != null)
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: action,
                  ),
              ],
            ),
          ),
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

/// The tinted tile behind a row's icon.
///
/// The same object as the Studio's tool glyph, at settings scale: a low-alpha
/// wash of the meaning colour with the icon at full strength on top. It reads
/// as one family across the app, which is the point.
class _Glyph extends StatelessWidget {
  const _Glyph({required this.icon, required this.colour});

  final IconData icon;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: colour.withValues(alpha: 0.12),
        borderRadius: Radii.rSm,
      ),
      child: Icon(icon, size: 18, color: colour),
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
