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
import '../../goals/application/goal_providers.dart';
import '../../goals/domain/goal.dart';
import '../../goals/presentation/goal_edit_sheets.dart';
import 'source_card.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_l10n.dart';

/// The four things the Library holds.
///
/// The label lives in `lib/l10n/enum_labels.dart` rather than here: a `const`
/// enum field cannot depend on the locale, and the segment bar has to read in
/// the user's language.
enum LibrarySegment { actions, captures, goals, done }

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
    final l10n = AppL10n.of(context);
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
    final goals = ref.watch(openGoalsProvider);
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
                    Text(l10n.libraryTitle, style: text.headlineMedium),
                    const SizedBox(height: Space.xs),
                    Text(l10n.librarySubtitle, style: text.bodyMedium),
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
                  LibrarySegment.goals: goals.length,
                  LibrarySegment.done: done.length,
                },
                onChanged: (s) => setState(() => _segment = s),
              ),
            ),
            ...switch (_segment) {
              LibrarySegment.actions =>
                _actionSlivers(l10n, open, now, 'actions'),
              LibrarySegment.done => _actionSlivers(l10n, done, now, 'done'),
              LibrarySegment.captures =>
                _captureSlivers(l10n, captures, actionedSourceIds),
              LibrarySegment.goals => _goalSlivers(context, ref, goals),
            },
            const SliverToBoxAdapter(
              child: SizedBox(height: actionNavBarClearance + Space.lg),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _goalSlivers(
    BuildContext context,
    WidgetRef ref,
    List<Goal> goals,
  ) {
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Space.page,
            0,
            Space.page,
            Space.md,
          ),
          child: OutlinedButton.icon(
            onPressed: () => _newGoal(context, ref),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: Text(AppL10n.of(context).libraryNewGoal),
          ),
        ),
      ),
      if (goals.isEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.xxxl),
            child: EmptyView(
              icon: Icons.flag_outlined,
              title: AppL10n.of(context).libraryNoGoalsTitle,
              // Says what a goal is for rather than that there are none. The
              // difference between the two tools that take one and the
              // fourteen that do not is worth a sentence.
              message: AppL10n.of(context).libraryNoGoalsMessage,
            ),
          ),
        )
      else
        SliverList.separated(
          itemCount: goals.length,
          separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.page),
            child: _GoalCard(goal: goals[i]),
          ),
        ),
    ];
  }

  static Future<void> _newGoal(BuildContext context, WidgetRef ref) async {
    final title = await showNewGoalSheet(context);
    if (title == null || title.trim().isEmpty || !context.mounted) return;
    final goal = await ref.read(goalsProvider.notifier).create(title: title);
    if (!context.mounted) return;
    // Straight into the workspace: a goal with one line in it is the start of
    // the job, not the end, and the next thing to do is say more about it.
    context.push(Routes.goal(goal.id));
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
    AppL10n l10n,
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
                  ? l10n.libraryNoDoneTitle
                  : l10n.libraryNoOpenTitle,
              message: kind == 'done'
                  ? l10n.libraryNoDoneMessage
                  : l10n.libraryNoOpenMessage,
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
    AppL10n l10n,
    List<SourceItem> captures,
    Set<String> actionedSourceIds,
  ) {
    if (captures.isEmpty) {
      return [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.giant),
            child: EmptyView(
              icon: Icons.photo_library_outlined,
              title: l10n.libraryNoCapturesTitle,
              message: l10n.libraryNoCapturesMessage,
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
                              option.labelIn(AppL10n.of(context)),
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


/// One Goal in the Library list.
///
/// Deliberately plain next to an ActionCard: an Action has urgency, a deadline
/// and a spine because those things are true of it. A Goal has none of them —
/// it is a sentence and a count — and dressing it up to match would imply an
/// urgency nobody set.
class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final linked = goal.linkedActionIds.length;

    return Material(
      color: colors.surfaceElevated,
      borderRadius: Radii.rMd,
      child: InkWell(
        borderRadius: Radii.rMd,
        onTap: () => context.push(Routes.goal(goal.id)),
        child: Container(
          padding: const EdgeInsets.all(Space.lg),
          decoration: BoxDecoration(
            borderRadius: Radii.rMd,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.flag_outlined, size: 20, color: colors.brand),
              const SizedBox(width: Space.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(goal.title, style: text.titleSmall),
                    const SizedBox(height: Space.xxs),
                    Text(
                      linked == 0
                          ? AppL10n.of(context).libraryGoalNoActions
                          : AppL10n.of(context).libraryGoalActionCount(linked),
                      style: text.bodySmall
                          ?.copyWith(color: colors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: colors.textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
