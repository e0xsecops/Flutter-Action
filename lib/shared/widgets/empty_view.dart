import 'package:flutter/material.dart';

import '../../design/tokens/colors.dart';
import '../../design/tokens/dimens.dart';

/// Shown when a list is legitimately empty — distinct from loading and from
/// failure, which have their own views. Keeping the three apart stops "empty"
/// reading as "broken".
///
/// The icon sits in a soft recessed disc rather than floating loose, so an
/// empty screen still looks composed instead of unfinished.
class EmptyView extends StatelessWidget {
  const EmptyView({
    required this.icon,
    required this.title,
    this.message,
    this.action,
    this.compact = false,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? message;
  final Widget? action;

  /// Inline inside a section, rather than filling the screen.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: compact ? 48 : 72,
          height: compact ? 48 : 72,
          decoration: BoxDecoration(
            color: colors.surfaceSunken,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: compact ? 22 : 30,
            color: colors.textTertiary,
          ),
        ),
        SizedBox(height: compact ? Space.md : Space.xl),
        Text(
          title,
          style: compact ? text.titleSmall : text.headlineSmall,
          textAlign: TextAlign.center,
        ),
        if (message != null) ...[
          const SizedBox(height: Space.sm),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Text(
              message!,
              style: text.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
        if (action != null) ...[
          const SizedBox(height: Space.xxl),
          action!,
        ],
      ],
    );

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Space.xxxl,
          vertical: compact ? Space.xl : Space.huge,
        ),
        child: content,
      ),
    );
  }
}
