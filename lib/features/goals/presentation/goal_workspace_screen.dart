/// One Goal, and what Action can do about it.
///
/// **The order is the argument.** What you want, then where it stands, then
/// what came out of it. Planning tools sit between the second and the third,
/// because that is the moment they are useful — after the user has said enough
/// for a tool to have something to work with, and before they have already
/// turned it into Actions.
///
/// **No score, no percentage, no progress ring.** A Goal is not measurable
/// from the outside and Action does not pretend otherwise: it shows what is
/// written and what has been made, and the user decides whether that is
/// progress. `docs/v2/ACTION_V2_DECISIONS.md` records why every score in the
/// original brief was declined.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/ambient/ambient_background.dart';
import '../../../design/components/glass_surface.dart';
import '../../../design/components/readable_width.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../shared/widgets/error_view.dart';
import '../../actions/application/action_providers.dart';
import '../../actions/domain/action_item.dart';
import '../../intelligence/data/tools/plan_tools.dart';
import '../application/goal_providers.dart';
import '../domain/goal.dart';
import 'goal_edit_sheets.dart';

class GoalWorkspaceScreen extends ConsumerWidget {
  const GoalWorkspaceScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(goalProvider(id));

    return AmbientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: const Text('Goal'),
          actions: [
            if (goal != null)
              PopupMenuButton<String>(
                tooltip: 'More',
                onSelected: (value) async {
                  final notifier = ref.read(goalsProvider.notifier);
                  switch (value) {
                    case 'achieved':
                      await notifier.setAchieved(
                        goal,
                        goal.status != GoalStatus.achieved,
                      );
                    case 'archive':
                      await notifier.archive(goal);
                      if (context.mounted) context.pop();
                    case 'delete':
                      final ok = await _confirmDelete(context);
                      if (ok != true) return;
                      await notifier.delete(goal.id);
                      if (context.mounted) context.pop();
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'achieved',
                    child: Text(
                      goal.status == GoalStatus.achieved
                          ? 'Not reached after all'
                          : 'Mark as reached',
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'archive',
                    child: Text('Archive'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
              ),
          ],
        ),
        body: goal == null
            ? const ErrorView(message: 'That goal is no longer here.')
            : SafeArea(
                top: false,
                child: ReadableWidth.list(child: _Body(goal: goal)),
              ),
      ),
    );
  }

  static Future<bool?> _confirmDelete(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Delete this goal?'),
          content: const Text(
            'The goal is removed from this device. Any Actions made from it '
            'stay exactly as they are.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Keep'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );
}

class _Body extends ConsumerWidget {
  const _Body({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = ref.watch(actionsStreamProvider).value ?? const [];
    final linked = [
      for (final id in goal.linkedActionIds)
        ...actions.where((a) => a.id == id),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        0,
        Space.page,
        Space.giant,
      ),
      children: [
        _Hero(goal: goal),
        const SizedBox(height: Space.xxl),
        _Field(
          label: 'WHAT DONE LOOKS LIKE',
          value: goal.outcome,
          placeholder: 'Not written yet. A goal is easier to plan when you '
              'have said what finishing it means.',
          onEdit: () => _editOutcome(context, ref),
        ),
        const SizedBox(height: Space.xl),
        _Field(
          label: 'WHERE IT STANDS',
          value: goal.context,
          placeholder: 'Nothing written yet. What has happened so far, and '
              'what is in the way.',
          onEdit: () => _editContext(context, ref),
        ),
        const SizedBox(height: Space.xxl),
        _PlanningTools(goal: goal),
        if (linked.isNotEmpty) ...[
          const SizedBox(height: Space.xxl),
          _LinkedActions(actions: linked),
        ],
      ],
    );
  }

  Future<void> _editOutcome(BuildContext context, WidgetRef ref) async {
    final outcome = await showGoalTextSheet(
      context,
      title: 'What done looks like',
      hint: 'The car is insured and the paperwork is filed.',
      initial: goal.outcome,
    );
    if (outcome == null) return;
    await ref.read(goalsProvider.notifier).save(
          goal.copyWith(outcome: outcome, clearOutcome: outcome.isEmpty),
        );
  }

  Future<void> _editContext(BuildContext context, WidgetRef ref) async {
    final value = await showGoalTextSheet(
      context,
      title: 'Where it stands',
      hint: 'I have two quotes and the renewal is on the 18th.',
      initial: goal.context,
    );
    if (value == null) return;
    await ref.read(goalsProvider.notifier).save(
          goal.copyWith(context: value, clearContext: value.isEmpty),
        );
  }
}

class _Hero extends ConsumerWidget {
  const _Hero({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final reached = goal.status == GoalStatus.achieved;

    return AmbientGlow(
      colour: reached ? colors.confidenceConfirmed : colors.brand,
      child: GlassSurface(
        intensity: GlassIntensity.hero,
        padding: const EdgeInsets.all(Space.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  reached
                      ? Icons.check_circle_outline_rounded
                      : Icons.flag_outlined,
                  size: 16,
                  color: reached ? colors.confidenceConfirmed : colors.brand,
                ),
                const SizedBox(width: Space.sm),
                Flexible(
                  child: Text(
                    reached ? 'REACHED' : 'WHAT YOU WANT',
                    overflow: TextOverflow.ellipsis,
                    style: text.labelSmall?.copyWith(
                      color:
                          reached ? colors.confidenceConfirmed : colors.brand,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Space.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(goal.title, style: text.headlineSmall),
                ),
                IconButton(
                  tooltip: 'Edit goal',
                  icon: const Icon(Icons.edit_outlined, size: 20),
                  onPressed: () async {
                    final title = await showGoalTextSheet(
                      context,
                      title: 'What you want',
                      hint: 'Renew the car insurance without overpaying.',
                      initial: goal.title,
                    );
                    if (title == null || title.trim().isEmpty) return;
                    await ref
                        .read(goalsProvider.notifier)
                        .save(goal.copyWith(title: title));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.value,
    required this.placeholder,
    required this.onEdit,
  });

  final String label;
  final String? value;
  final String placeholder;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final written = value != null && value!.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Semantics(
                header: true,
                child: Text(
                  label,
                  style: text.labelSmall?.copyWith(
                    color: colors.textTertiary,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: onEdit,
              style: TextButton.styleFrom(
                minimumSize: const Size(0, 36),
                padding: const EdgeInsets.symmetric(horizontal: Space.sm),
              ),
              child: Text(written ? 'Edit' : 'Add'),
            ),
          ],
        ),
        const SizedBox(height: Space.xs),
        Text(
          written ? value! : placeholder,
          style: text.bodyMedium?.copyWith(
            color: written ? colors.textPrimary : colors.textSecondary,
          ),
        ),
      ],
    );
  }
}

/// The two tools that take a Goal.
///
/// Named rather than hidden behind "Explore": both existed in the registry
/// before Goals did, with nothing to point at.
class _PlanningTools extends StatelessWidget {
  const _PlanningTools({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final ready = goal.hasEnoughToPlan;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            'WHAT ACTION CAN DO',
            style: text.labelSmall?.copyWith(
              color: colors.textTertiary,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(height: Space.md),
        if (!ready)
          Text(
            'Write a little more about what you want, and these will have '
            'something to work with.',
            style: text.bodySmall?.copyWith(color: colors.textSecondary),
          )
        else
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.sm,
            children: [
              _ToolChip(
                label: goalOptimizerTool.title,
                onTap: () => context.push(
                  Routes.tool(goalOptimizerTool.id, goalId: goal.id),
                ),
              ),
              _ToolChip(
                label: actionPlanTool.title,
                onTap: () => context.push(
                  Routes.tool(actionPlanTool.id, goalId: goal.id),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class _ToolChip extends StatelessWidget {
  const _ToolChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onTap,
    );
  }
}

class _LinkedActions extends StatelessWidget {
  const _LinkedActions({required this.actions});

  final List<ActionItem> actions;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            actions.length == 1
                ? '1 ACTION FROM THIS GOAL'
                : '${actions.length} ACTIONS FROM THIS GOAL',
            style: text.labelSmall?.copyWith(
              color: colors.textTertiary,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(height: Space.md),
        for (final action in actions)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.sm),
            child: Material(
              color: colors.surfaceElevated,
              borderRadius: Radii.rMd,
              child: InkWell(
                borderRadius: Radii.rMd,
                onTap: () => context.push(Routes.action(action.id)),
                child: Container(
                  padding: const EdgeInsets.all(Space.lg),
                  decoration: BoxDecoration(
                    borderRadius: Radii.rMd,
                    border: Border.all(
                      color: colors.border,
                      width: Strokes.hairline,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(action.title, style: text.titleSmall),
                      ),
                      if (action.status == ActionStatus.completed)
                        Icon(
                          Icons.check_circle_outline_rounded,
                          size: 18,
                          color: colors.confidenceConfirmed,
                        )
                      else
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 20,
                          color: colors.textTertiary,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
