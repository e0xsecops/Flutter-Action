import 'package:flutter/widgets.dart';

import '../tokens/dimens.dart';

/// Centres content once the window gets wider than it is useful for.
///
/// Day 15 recorded that every screen was phone-first and simply stretched on
/// a tablet; Day 17 fixes that without inventing a tablet application. The
/// whole idea is restraint: nothing gains a second pane, nothing rearranges,
/// and no screen has a "tablet version" to maintain. Past a readable width
/// the content just stops growing and sits in the middle, which is what the
/// phone layout was already doing at phone widths.
///
/// [Breakpoints.readableContent] for prose, [Breakpoints.readableList] for
/// card lists — a row of short scannable text tolerates more width than a
/// paragraph does.
class ReadableWidth extends StatelessWidget {
  const ReadableWidth({
    super.key,
    required this.child,
    this.maxWidth = Breakpoints.readableContent,
    this.shrinkVertically = false,
  });

  const ReadableWidth.list({
    super.key,
    required this.child,
    this.shrinkVertically = false,
  }) : maxWidth = Breakpoints.readableList;

  final Widget child;
  final double maxWidth;

  /// Take only the height the child needs, instead of filling what is
  /// offered.
  ///
  /// The default fills, which is what a page body wants. A bar does not: an
  /// [Align] given loose constraints expands to the largest size allowed, so
  /// a bottom bar wrapped in the default would quietly grow to the height of
  /// the screen and sit its content at the top — with an invisible surface
  /// covering everything below it and swallowing taps meant for the page.
  final bool shrinkVertically;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      heightFactor: shrinkVertically ? 1 : null,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
