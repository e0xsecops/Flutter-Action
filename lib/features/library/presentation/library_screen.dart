/// Library — everything Action holds, in one place you can browse.
///
/// **Why this destination exists.** Before V2, an Action that was not currently
/// urgent was effectively gone: Home showed triage groups, and there was no
/// screen that simply listed what the app was holding. A capture that had been
/// read but not turned into an Action had nowhere to live at all — it sat in a
/// section of Home called "captures" and then fell off the bottom.
///
/// So Library is the answer to "where is my stuff", and Captures is a real
/// **inbox**: a capture is allowed to exist without becoming an Action, and its
/// state is shown honestly rather than implied by which list it fell into.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/action_shell.dart';
import '../../../app/router.dart';
import '../../../design/components/readable_width.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../shared/widgets/empty_view.dart';
import '../../actions/application/action_providers.dart';
import '../../actions/domain/action_item.dart';
import '../../actions/presentation/action_card.dart';
import '../../capture/application/capture_controller.dart';
import '../../capture/domain/source_item.dart';
import 'source_card.dart';

enum LibrarySegment {
  actions('Actions'),
  captures('Captures'),
  done('Done');

  const LibrarySegment(this.label);
  final String label;
}

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  LibrarySegment _segment = LibrarySegment.actions;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final actions = ref.watch(actionsStreamProvider).value ?? const <ActionItem>[];
    final sources = ref.watch(sourcesProvider).value ?? const <SourceItem>[];
    final now = ref.watch(appClockProvider)();

    final open = actions
        .where((a) => a.status != ActionStatus.completed)
        .toList()
      ..sort(_byDueThenCreated);
    final done = actions
        .where((a) => a.status == ActionStatus.completed)
        .toList()
      ..sort((a, b) => (b.completedAt ?? b.updatedAt)
          .compareTo(a.completedAt ?? a.updatedAt));

    // Newest capture first: an inbox is read from the top.
    final captures = [...sources]
      ..sort((a, b) => b.capturedAt.compareTo(a.capturedAt));

    // Which captures already became something, so a card can say so instead of
    // inviting the user to review the same notice twice.
    final actionedSourceIds = {
      for (final action in actions)
        if (action.sourceId != null) action.sourceId!,
    };

    return SafeArea(
      bottom: false,
      child: ReadableWidth.list(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Space.page,
                  Space.xl,
                  Space.page,
                  Space.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Library', style: text.headlineMedium),
                    const SizedBox(height: Space.xs),
                    Text(
                      'Everything Action is holding for you. All of it stays '
                      'on this device.',
                      style: text.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _Segments(
                segment: _segment,
                counts: {
                  LibrarySegment.actions: open.length,
                  LibrarySegment.captures: captures.length,
                  LibrarySegment.done: done.length,
                },
                onChanged: (s) => setState(() => _segment = s),
              ),
            ),
            ...switch (_segment) {
              LibrarySegment.actions => _actionSlivers(open, now, 'actions'),
              LibrarySegment.done => _actionSlivers(done, now, 'done'),
              LibrarySegment.captures =>
                _captureSlivers(captures, actionedSourceIds),
            },
            const SliverToBoxAdapter(
              child: SizedBox(height: actionNavBarClearance + Space.lg),
            ),
          ],
        ),
      ),
    );
  }

  /// Soonest deadline first, then most recently created. An Action with no
  /// deadline is not urgent by omission, so it sorts after the dated ones
  /// rather than to the top.
  static int _byDueThenCreated(ActionItem a, ActionItem b) {
    final ad = a.dueAt?.wallClock;
    final bd = b.dueAt?.wallClock;
    if (ad != null && bd != null) return ad.compareTo(bd);
    if (ad != null) return -1;
    if (bd != null) return 1;
    return b.createdAt.compareTo(a.createdAt);
  }

  List<Widget> _actionSlivers(
    List<ActionItem> items,
    DateTime now,
    String kind,
  ) {
    if (items.isEmpty) {
      return [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.giant),
            child: EmptyView(
              icon: kind == 'done'
                  ? Icons.check_circle_outline_rounded
                  : Icons.checklist_rounded,
              title: kind == 'done'
                  ? 'Nothing completed yet'
                  : 'No open actions',
              message: kind == 'done'
                  ? 'Actions you finish will be kept here.'
                  : 'Capture something and Action will work out what needs '
                      'doing.',
            ),
          ),
        ),
      ];
    }

    return [
      SliverList.separated(
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.page),
          child: ActionCard(
            item: items[i],
            now: now,
            // No triage badge here. Library is a place to browse what exists,
            // and repeating "OVERDUE" on every row turns urgency into
            // wallpaper — Today is where urgency is the point.
            showNextStep: kind != 'done',
          ),
        ),
      ),
    ];
  }

  List<Widget> _captureSlivers(
    List<SourceItem> captures,
    Set<String> actionedSourceIds,
  ) {
    if (captures.isEmpty) {
      return [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Space.giant),
            child: EmptyView(
              icon: Icons.photo_library_outlined,
              title: 'Nothing captured yet',
              message: 'Photos, screenshots and text you add land here first. '
                  'Nothing is analysed until you ask.',
            ),
          ),
        ),
      ];
    }

    return [
      SliverList.separated(
        itemCount: captures.length,
        separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
        itemBuilder: (context, i) {
          final source = captures[i];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.page),
            child: SourceCard(
              source: source,
              hasAction: actionedSourceIds.contains(source.id),
              onTap: () => context.push(Routes.source(source.id)),
            ),
          );
        },
      ),
    ];
  }
}

/// The segment switcher.
///
/// Counts are shown because they are the answer to the question the user is
/// actually asking — "is there anything in there?" — and because a segment
/// that turns out to be empty after a tap is a wasted tap.
class _Segments extends StatelessWidget {
  const _Segments({
    required this.segment,
    required this.counts,
    required this.onChanged,
  });

  final LibrarySegment segment;
  final Map<LibrarySegment, int> counts;
  final ValueChanged<LibrarySegment> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        0,
        Space.page,
        Space.lg,
      ),
      child: Container(
        padding: const EdgeInsets.all(Space.xxs),
        decoration: BoxDecoration(
          color: colors.surfaceSunken,
          borderRadius: Radii.rMd,
          border: Border.all(color: colors.border, width: Strokes.hairline),
        ),
        child: Row(
          children: [
            for (final option in LibrarySegment.values)
              Expanded(
                child: Semantics(
                  button: true,
                  selected: option == segment,
                  child: InkWell(
                    onTap: () => onChanged(option),
                    borderRadius: Radii.rSm,
                    child: AnimatedContainer(
                      duration:
                          MediaQuery.maybeOf(context)?.disableAnimations ??
                                  false
                              ? Duration.zero
                              : Motion.fast,
                      curve: Motion.standard,
                      padding: const EdgeInsets.symmetric(
                        vertical: Space.sm,
                        horizontal: Space.xs,
                      ),
                      decoration: BoxDecoration(
                        color: option == segment
                            ? colors.surfaceElevated
                            : Colors.transparent,
                        borderRadius: Radii.rSm,
                        border: Border.all(
                          color: option == segment
                              ? colors.border
                              : Colors.transparent,
                          width: Strokes.hairline,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              option.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: text.labelLarge?.copyWith(
                                color: option == segment
                                    ? colors.textPrimary
                                    : colors.textSecondary,
                              ),
                            ),
                          ),
                          if ((counts[option] ?? 0) > 0) ...[
                            const SizedBox(width: Space.xs),
                            Text(
                              '${counts[option]}',
                              style: text.labelSmall?.copyWith(
                                color: colors.textTertiary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
