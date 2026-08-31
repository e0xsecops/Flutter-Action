/// The root shell: one continuous place, four destinations, one way in.
///
/// **Why this exists.** Before V2 every screen in Action was a route pushed
/// from Home, and the only way to reach Search, Settings or Intelligence was a
/// cluster of small icons in the greeting row — three of them, one of which was
/// a debug-only diagnostics flask. Nothing told a new user the app had a
/// Library, an Intelligence workspace, or private search. The capability was
/// real and invisible.
///
/// So the app now has a persistent shell. Four destinations the user can move
/// between without losing their place, and Capture in the middle as the act
/// rather than a place. Detail screens — an Action, a Source, a tool run,
/// Settings — still push *above* this, full height with a back button, because
/// those are focused tasks rather than destinations.
///
/// **Why `StatefulShellRoute.indexedStack`.** Each branch keeps its own
/// `Navigator` and its own scroll and stack state, so returning to Library
/// returns to where you were rather than to the top. It also restores across
/// process death, which the previous single-navigator arrangement did not.
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../design/ambient/ambient_background.dart';
import '../design/components/glass_surface.dart';
import '../design/components/readable_width.dart';
import '../design/tokens/colors.dart';
import '../design/tokens/dimens.dart';
import '../features/capture/presentation/capture_sheet.dart';

/// One destination in the shell.
class ShellDestination {
  const ShellDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

/// The four places, in order. Capture is deliberately absent — it is an action.
const List<ShellDestination> shellDestinations = [
  ShellDestination(
    label: 'Today',
    icon: Icons.today_outlined,
    selectedIcon: Icons.today,
  ),
  ShellDestination(
    label: 'Library',
    icon: Icons.inbox_outlined,
    selectedIcon: Icons.inbox,
  ),
  ShellDestination(
    // Not "AI". The user's mental model is that they are getting help
    // understanding something, not that they are operating a model.
    label: 'Intelligence',
    icon: Icons.lightbulb_outline,
    selectedIcon: Icons.lightbulb,
  ),
  ShellDestination(
    label: 'Search',
    icon: Icons.search_outlined,
    selectedIcon: Icons.search,
  ),
];

class ActionShell extends StatelessWidget {
  const ActionShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return AmbientBackground(
      child: Scaffold(
        // Transparent so the one ambient field shows through every branch —
        // moving between Today and Library should feel like moving within one
        // place, not swapping two separately painted pages.
        backgroundColor: Colors.transparent,
        // The bar floats over the content, so cards pass behind the glass
        // rather than stopping above a solid strip. That is the whole reason
        // the bar is glass: a translucent panel with nothing moving underneath
        // is just a tinted rectangle.
        extendBody: true,
        body: navigationShell,
        bottomNavigationBar: _ActionNavBar(navigationShell: navigationShell),
      ),
    );
  }
}

/// The height the nav bar occupies, so a scrolling branch can clear it.
///
/// Exported because every destination needs to end its list above the bar;
/// hard-coding the number in five places is how one of them drifts.
const double actionNavBarClearance = 96;

class _ActionNavBar extends StatelessWidget {
  const _ActionNavBar({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _go(BuildContext context, int index) {
    HapticFeedback.selectionClick();
    navigationShell.goBranch(
      index,
      // Tapping the destination you are already on returns that branch to its
      // root — the platform convention, and the fastest way back to the top of
      // a long Library.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ReadableWidth.list(
      shrinkVertically: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.md, 0, Space.md, Space.sm),
        child: SafeArea(
          top: false,
          child: GlassSurface(
            borderRadius: Radii.rXl,
            intensity: GlassIntensity.strong,
            padding: const EdgeInsets.symmetric(
              horizontal: Space.xs,
              vertical: Space.xs,
            ),
            child: Row(
              children: [
                for (var i = 0; i < shellDestinations.length; i++) ...[
                  Expanded(
                    child: _NavItem(
                      destination: shellDestinations[i],
                      selected: navigationShell.currentIndex == i,
                      onTap: () => _go(context, i),
                    ),
                  ),
                  // Capture sits between Library and Intelligence — the middle
                  // of the bar and the middle of the loop: you have looked at
                  // what is there, and now you add to it.
                  if (i == 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Space.xs),
                      child: _CaptureControl(colors: colors),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final ShellDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    // Secondary, not tertiary. A navigation label is the most important small
    // text in the app — it is how someone knows where they are and where they
    // can go — and tertiary is the token for things that can afford to
    // recede. Measured on device, tertiary on the nav bar's glass came out at
    // 4.49:1, which is both under AA and the right prompt to notice that the
    // token was wrong for the job.
    final tint = selected ? colors.brand : colors.textSecondary;
    final reduceMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    return Semantics(
      button: true,
      selected: selected,
      label: destination.label,
      child: Tooltip(
        // Long-press reveals the label, and it gives every destination a
        // stable handle for tests and for accessibility tooling.
        message: destination.label,
        child: InkWell(
          onTap: onTap,
          borderRadius: Radii.rMd,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.sm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedScale(
                  scale: selected && !reduceMotion ? 1.06 : 1,
                  duration: reduceMotion ? Duration.zero : Motion.fast,
                  curve: Motion.standard,
                  child: Icon(
                    selected ? destination.selectedIcon : destination.icon,
                    size: 22,
                    color: tint,
                  ),
                ),
                const SizedBox(height: Space.xxs),
                Text(
                  destination.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: text.labelSmall?.copyWith(
                    color: tint,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The Capture control.
///
/// Raised, brand-filled and circular: the one element in the chrome that is not
/// a place you go but a thing you do. It is deliberately the highest-contrast
/// object on screen, because everything Action can do begins here — and because
/// a new user who presses exactly one control should press this one.
class _CaptureControl extends ConsumerWidget {
  const _CaptureControl({required this.colors});

  final AppColors colors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      button: true,
      label: 'Capture something',
      child: Tooltip(
        message: 'Capture something',
        child: InkWell(
          onTap: () {
            HapticFeedback.mediumImpact();
            startCapture(context, ref);
          },
          borderRadius: BorderRadius.circular(Radii.pill),
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // A lift from the top-left, so the control reads as a
                  // physical object catching the same light as the glass.
                  Color.alphaBlend(
                    Colors.white.withValues(alpha: 0.22),
                    colors.brand,
                  ),
                  colors.brand,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  // Modest, and tight to the control. A wider, brighter glow
                  // read straight through the capture sheet on device as a
                  // blue smear near the bottom edge — chrome that is visible
                  // through the surface covering it is an artifact, not depth.
                  color: colors.brand.withValues(alpha: 0.26),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(Icons.add_rounded, color: colors.onBrand, size: 28),
          ),
        ),
      ),
    );
  }
}
