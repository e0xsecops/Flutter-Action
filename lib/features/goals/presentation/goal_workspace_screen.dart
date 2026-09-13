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
///
/// **The eyebrows are stored in sentence case.** Every wide-tracked capital
/// label on this screen — WHAT YOU WANT, REACHED, WHAT ACTION CAN DO — is one
/// ARB string in sentence case, uppercased at the render site by
/// `eyebrowCase`. Storing the capitals would bake them into the fourteen
/// locales whose script has no case, and a bare `toUpperCase` turns Turkish
/// dotted `i` into the wrong letter. Three of them double as the heading of
/// the sheet that edits the same field, which is why one key serves both.
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
import '../../../l10n/casing.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_l10n.dart';
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
    final l10n = AppL10n.of(context);
    final goal = ref.watch(goalProvider(id));

    return AmbientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: Text(l10n.goalWorkspaceTitle),
          actions: [
            if (goal != null)
              PopupMenuButton<String>(
                tooltip: l10n.detailMore,
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
                    // Both halves are the user's own mark and are worded to
                    // stay that way: reaching a goal is never inferred from
                    // the Actions made from it, so the menu offers to set the
                    // mark and to take it back, and neither phrasing says
                    // Action decided.
                    child: Text(
                      goal.status == GoalStatus.achieved
                          ? l10n.goalUnmarkReached
                          : l10n.goalMarkReached,
                    ),
                  ),
                  PopupMenuItem(
                    value: 'archive',
                    child: Text(l10n.detailArchiveConfirm),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text(l10n.commonDelete),
                  ),
                ],
              ),
          ],
        ),
        body: goal == null
            ? ErrorView(message: l10n.goalNotFound)
            : SafeArea(
                top: false,
                child: ReadableWidth.list(child: _Body(goal: goal)),
              ),
      ),
    );
  }

  static Future<bool?> _confirmDelete(BuildContext context) {
    final l10n = AppL10n.of(context);
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.goalDeleteTitle),
        content: Text(l10n.goalDeleteBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.sourceDeleteKeep),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.commonDelete),
          ),
        ],
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context);
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
          // The label and the heading of the sheet that edits the field are
          // the same words, so they are the same key; only the case differs,
          // and the case is applied here rather than stored.
          label: eyebrowCase(l10n.goalOutcomeLabel, l10n.localeName),
          value: goal.outcome,
          placeholder: l10n.goalOutcomeEmpty,
          onEdit: () => _editOutcome(context, ref),
        ),
        const SizedBox(height: Space.xl),
        _Field(
          label: eyebrowCase(l10n.goalContextLabel, l10n.localeName),
          value: goal.context,
          placeholder: l10n.goalContextEmpty,
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
    final l10n = AppL10n.of(context);
    final outcome = await showGoalTextSheet(
      context,
      title: l10n.goalOutcomeLabel,
      // An example of a finished state, not an instruction — each locale
      // substitutes one of its own.
      hint: l10n.goalOutcomeHint,
      initial: goal.outcome,
    );
    if (outcome == null) return;
    await ref.read(goalsProvider.notifier).save(
          goal.copyWith(outcome: outcome, clearOutcome: outcome.isEmpty),
        );
  }

  Future<void> _editContext(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context);
    final value = await showGoalTextSheet(
      context,
      title: l10n.goalContextLabel,
      hint: l10n.goalContextHint,
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
    final l10n = AppL10n.of(context);
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
                    // "Reached" is the mark the user set, not a verdict Action
                    // arrived at, and the two strings have to stay different
                    // words in every locale — they occupy the same slot in
                    // opposite states.
                    reached
                        ? eyebrowCase(l10n.goalStatusReached, l10n.localeName)
                        : eyebrowCase(l10n.goalTitleLabel, l10n.localeName),
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
                  // Names the object as well as the verb: it is the only
                  // accessible name on the pencil, and there are two bare
                  // "Edit" buttons further down the same screen.
                  tooltip: l10n.goalEditTooltip,
                  icon: const Icon(Icons.edit_outlined, size: 20),
                  onPressed: () async {
                    final title = await showGoalTextSheet(
                      context,
                      title: l10n.goalTitleLabel,
                      hint: l10n.goalTitleHint,
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

  /// Already in the eyebrow's case: the caller owns the key, and only the
  /// caller knows which locale bundle it came from.
  final String label;
  final String? value;
  final String placeholder;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
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
              child: Text(written ? l10n.commonEdit : l10n.commonAdd),
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
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final ready = goal.hasEnoughToPlan;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            eyebrowCase(l10n.goalToolsLabel, l10n.localeName),
            style: text.labelSmall?.copyWith(
              color: colors.textTertiary,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(height: Space.md),
        if (!ready)
          Text(
            l10n.goalToolsNotReady,
            style: text.bodySmall?.copyWith(color: colors.textSecondary),
          )
        else
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.sm,
            children: [
              _ToolChip(
                // A tool's title is a `const` on its definition and so cannot
                // depend on the locale; `titleIn` is the translation of it,
                // the same split the enum labels use. The id stays the id.
                label: goalOptimizerTool.titleIn(l10n),
                onTap: () => context.push(
                  Routes.tool(goalOptimizerTool.id, goalId: goal.id),
                ),
              ),
              _ToolChip(
                label: actionPlanTool.titleIn(l10n),
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
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            // The same count the Library shows under a goal, in the same
            // words: one plural key, uppercased here because this one is an
            // eyebrow. English needs two forms, Arabic six, Japanese one —
            // which is why the branch is in the bundle and not here.
            eyebrowCase(
              l10n.libraryGoalActionCount(actions.length),
              l10n.localeName,
            ),
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
