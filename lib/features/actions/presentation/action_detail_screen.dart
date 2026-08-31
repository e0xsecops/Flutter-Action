import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../app/router.dart';
import '../../intelligence/application/intelligence_context.dart';
import '../../../design/ambient/ambient_background.dart';
import '../../../design/components/readable_width.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../design/tokens/typography.dart';
import '../../../shared/widgets/empty_view.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_view.dart';
import '../../capture/application/capture_controller.dart';
import '../../capture/domain/source_item.dart';
import '../../extraction/application/canonical_fields.dart';
import '../../extraction/domain/extraction_schema.dart';
import '../application/action_chain.dart';
import '../application/action_timeline.dart';
import '../application/reminder_service.dart';
import '../application/action_providers.dart';
import '../domain/action_item.dart';
import '../domain/action_reminder.dart';
import 'action_edit_sheets.dart';
import 'reminder_sheet.dart';
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';

/// Everything about one Action, and the place the work actually happens.
///
/// Answers, in this order and without being asked: what needs doing, when it
/// matters, what to do next, what is already done, and where it came from.
/// It reads only the local database, so it opens at the speed of SQLite —
/// never waiting on auth, the network or a model.
class ActionDetailScreen extends ConsumerStatefulWidget {
  const ActionDetailScreen({required this.id, super.key});

  final String id;

  @override
  ConsumerState<ActionDetailScreen> createState() => _ActionDetailScreenState();
}

class _ActionDetailScreenState extends ConsumerState<ActionDetailScreen> {
  @override
  void initState() {
    super.initState();
    // A name, never the Action it refers to.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ref.read(appAnalyticsProvider).log(AnalyticsEvents.actionOpened);
    });
  }

  DateTime get _now => ref.read(appClockProvider)().toUtc();

  void _log(String event) => ref.read(appAnalyticsProvider).log(event);

  /// Mirrored metadata changed, so the cloud owes an upsert. Local truth is
  /// already committed by the time this runs; the flush is best-effort and
  /// its failure is never the user's problem.
  void _syncLater() =>
      unawaited(ref.read(actionSyncServiceProvider).flush());

  /// Persists [work], keeping the screen honest if the database refuses:
  /// nothing is claimed to have been saved that was not.
  Future<bool> _persist(Future<void> Function() work) async {
    try {
      await work();
      return true;
    } catch (_) {
      _log(AnalyticsEvents.actionLocalPersistenceFailed);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("That didn't save. Nothing was lost — try again."),
          ),
        );
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(actionDetailProvider(widget.id));

    return AmbientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ReadableWidth.list(
            child: switch (async) {
              AsyncLoading() => const LoadingView(),
              AsyncError() => ErrorView(
                  message: 'This action could not be loaded. It is still '
                      'stored on this device.',
                ),
            AsyncData(:final value) => value == null
                  ? _NotFound(onBack: () => _leave(context))
                  : _Loaded(action: value, state: this),
            },
          ),
        ),
      ),
    );
  }

  void _leave(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(Routes.home);
    }
  }

  // ------------------------------------------------------------ chain ops --

  Future<void> _addStep(ActionItem action) async {
    final title = await showStepSheet(context);
    if (title == null || !mounted) return;
    final now = _now;
    final ok = await _persist(() => ref.read(actionStepRepositoryProvider).addStep(
          action.id,
          ActionStepItem(
            id: const Uuid().v4(),
            title: title,
            order: 0, // assigned by the repository from the chain's length
            createdAt: now,
            updatedAt: now,
          ),
        ));
    if (ok) _log(AnalyticsEvents.stepAdded);
  }

  Future<void> _renameStep(ActionStepItem step) async {
    final title = await showStepSheet(context, current: step.title);
    if (title == null || !mounted) return;
    final ok = await _persist(() => ref
        .read(actionStepRepositoryProvider)
        .updateStep(step.copyWith(title: title), at: _now));
    if (ok) _log(AnalyticsEvents.stepEdited);
  }

  Future<void> _toggleStep(ActionItem action, ActionStepItem step) async {
    final next = !step.isCompleted;
    final ok = await _persist(() =>
        ref.read(actionStepRepositoryProvider).setStepCompleted(
              step.id,
              isCompleted: next,
              at: _now,
            ));
    if (!ok) return;
    _log(next ? AnalyticsEvents.stepCompleted : AnalyticsEvents.stepReopened);
  }

  Future<void> _deleteStep(ActionStepItem step) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete this step?'),
        content: Text(step.title),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Keep it'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    final ok = await _persist(() =>
        ref.read(actionStepRepositoryProvider).deleteStep(step.id, at: _now));
    if (ok) _log(AnalyticsEvents.stepDeleted);
  }

  /// [from] and [to] are already post-removal indices: `onReorderItem` does
  /// that adjustment, unlike the deprecated `onReorder`.
  Future<void> _reorder(ActionItem action, int from, int to) async {
    final ids = [for (final s in orderedSteps(action)) s.id];
    if (from < 0 || from >= ids.length) return;
    final moved = ids.removeAt(from);
    ids.insert(to.clamp(0, ids.length), moved);

    final ok = await _persist(() => ref
        .read(actionStepRepositoryProvider)
        .reorderSteps(action.id, ids, at: _now));
    if (ok) _log(AnalyticsEvents.stepReordered);
  }

  Future<void> _move(ActionItem action, ActionStepItem step, int delta) async {
    final steps = orderedSteps(action);
    final from = steps.indexWhere((s) => s.id == step.id);
    final to = from + delta;
    if (from < 0 || to < 0 || to >= steps.length) return;
    final ids = [for (final s in steps) s.id];
    ids
      ..removeAt(from)
      ..insert(to, step.id);
    final ok = await _persist(() => ref
        .read(actionStepRepositoryProvider)
        .reorderSteps(action.id, ids, at: _now));
    if (ok) _log(AnalyticsEvents.stepReordered);
  }

  // --------------------------------------------------------- reminder ops --

  Future<void> _addReminder(ActionItem action) async {
    final when = await showReminderSheet(
      context,
      action: action,
      now: ref.read(appClockProvider)(),
    );
    if (when == null || !mounted) return;

    final outcome = await ref.read(reminderServiceProvider).create(
          actionId: action.id,
          actionTitle: action.title,
          scheduledAt: when,
        );
    if (mounted) _reportReminder(outcome);
  }

  Future<void> _editReminder(ActionItem action, ActionReminder reminder) async {
    final when = await showReminderSheet(
      context,
      action: action,
      now: ref.read(appClockProvider)(),
      initial: reminder.scheduledAt.toLocal(),
    );
    if (when == null || !mounted) return;

    final outcome = await ref.read(reminderServiceProvider).reschedule(
          reminderId: reminder.id,
          actionTitle: action.title,
          scheduledAt: when,
        );
    if (mounted) _reportReminder(outcome, updated: true);
  }

  Future<void> _removeReminder(ActionReminder reminder) async {
    await ref.read(reminderServiceProvider).cancel(reminder.id);
    _log(AnalyticsEvents.reminderCancelled);
  }

  /// Says exactly what happened. "Saved" and "you will be alerted" are
  /// different promises, and the difference is the user's to know.
  void _reportReminder(ReminderOutcome outcome, {bool updated = false}) {
    final message = switch (outcome) {
      ReminderScheduled() =>
        updated ? 'Reminder updated.' : "Reminder set. We'll nudge you.",
      ReminderNeedsPermission() =>
        'Notifications are off, so this reminder is saved but cannot alert '
            'you yet.',
      ReminderFailed() =>
        "This reminder is saved, but Android wouldn't schedule it.",
      ReminderLimitReached() =>
        'That action already has the maximum number of reminders.',
      ReminderTimeInPast() => 'That time has already passed.',
    };
    switch (outcome) {
      case ReminderScheduled():
        _log(updated
            ? AnalyticsEvents.reminderUpdated
            : AnalyticsEvents.reminderCreated);
      case ReminderNeedsPermission():
        _log(AnalyticsEvents.reminderPermissionDenied);
      case ReminderFailed():
        _log(AnalyticsEvents.reminderScheduleFailed);
      case _:
        break;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // ----------------------------------------------------------- action ops --

  Future<void> _completeAction(ActionItem action) async {
    final ok = await _persist(
        () => ref.read(actionRepositoryProvider).complete(action.id, at: _now));
    if (!ok) return;
    _log(AnalyticsEvents.actionCompleted);
    // Finishing something means its future nudges are no longer wanted. Past
    // ones are history and are left alone; nothing is recreated on reopen.
    await ref.read(reminderServiceProvider).cancelFutureFor(action.id);
    _syncLater();
  }

  Future<void> _reopenAction(ActionItem action) async {
    final ok = await _persist(
        () => ref.read(actionRepositoryProvider).reopen(action.id, at: _now));
    if (!ok) return;
    _log(AnalyticsEvents.actionReopened);
    _syncLater();
  }

  Future<void> _archiveAction(ActionItem action) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Archive this action?'),
        content: const Text(
          'It leaves your list but is not deleted, and the capture it came '
          'from is kept.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Archive'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    final ok = await _persist(
        () => ref.read(actionRepositoryProvider).archive(action.id, at: _now));
    if (!ok) return;
    _log(AnalyticsEvents.actionArchived);
    await ref.read(reminderServiceProvider).cancelFutureFor(action.id);
    _syncLater();
    if (mounted) _leave(context);
  }

  /// Writes an edited Action and enqueues the mirror, because every field
  /// reachable from here is part of the cloud payload.
  Future<void> _saveEdited(ActionItem next) async {
    final ok = await _persist(
        () => ref.read(actionRepositoryProvider).update(next));
    if (!ok) return;
    _log(AnalyticsEvents.actionEdited);
    _syncLater();
  }

  Future<void> _editTitle(ActionItem action) async {
    final title = await showTitleSheet(context, action.title);
    if (title == null || !mounted) return;
    await _saveEdited(action.withEdits(title: title, updatedAt: _now));
  }

  Future<void> _editDeadline(ActionItem action) async {
    final outcome = await showDeadlineSheet(context, action.dueAt);
    if (outcome == null || !mounted) return;
    await _saveEdited(action.withEdits(
      dueAt: switch (outcome) {
        EditSaved(:final value) => ActionDue(value),
        EditCleared() => null,
      },
      clearDue: outcome is EditCleared,
      updatedAt: _now,
    ));
  }

  Future<void> _editAmount(ActionItem action) async {
    final outcome = await showAmountSheet(context, action.amount);
    if (outcome == null || !mounted) return;
    await _saveEdited(action.withEdits(
      amount: switch (outcome) {
        EditSaved(:final value) => value,
        EditCleared() => null,
      },
      clearAmount: outcome is EditCleared,
      updatedAt: _now,
    ));
  }

  Future<void> _editUrgency(ActionItem action) async {
    final urgency = await showUrgencySheet(context, action.urgency);
    if (urgency == null || !mounted) return;
    await _saveEdited(action.withEdits(urgency: urgency, updatedAt: _now));
  }

  Future<void> _editNextStep(ActionItem action) async {
    final outcome =
        await showNextStepSheet(context, action.recommendedNextStep);
    if (outcome == null || !mounted) return;
    await _saveEdited(action.withEdits(
      recommendedNextStep: switch (outcome) {
        EditSaved(:final value) => value,
        EditCleared() => null,
      },
      clearNextStep: outcome is EditCleared,
      updatedAt: _now,
    ));
  }
}

// ---------------------------------------------------------------- content --

class _Loaded extends ConsumerWidget {
  const _Loaded({required this.action, required this.state});

  final ActionItem action;
  final _ActionDetailScreenState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final steps = orderedSteps(action);
    final progress = chainProgress(action);
    final completed = action.status == ActionStatus.completed;

    return Column(
      children: [
        _DetailBar(action: action, state: state),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _Header(action: action)),
              SliverToBoxAdapter(
                child: _NextBlock(action: action, state: state),
              ),
              SliverToBoxAdapter(child: _KeyFacts(action: action, state: state)),
              SliverToBoxAdapter(
                child: _ChainHeader(progress: progress, hasSteps: steps.isNotEmpty),
              ),
              if (steps.isEmpty)
                SliverToBoxAdapter(
                  child: _EmptyChain(onAdd: () => state._addStep(action)),
                )
              else
                SliverReorderableList(
                  itemCount: steps.length,
                  onReorderItem: (from, to) => state._reorder(action, from, to),
                  // A dragged row is lifted into an Overlay, outside the
                  // Scaffold's Material — and these rows contain ink. Without
                  // a decorated proxy the drag throws instead of moving
                  // anything, which is invisible until someone actually drags.
                  // The lift is also the one place this design uses a shadow:
                  // the row is genuinely above the page while it is held.
                  proxyDecorator: (child, index, animation) => Material(
                    color: context.colors.surfaceElevated,
                    borderRadius: Radii.rMd,
                    elevation: 6,
                    shadowColor: Colors.black26,
                    child: child,
                  ),
                  itemBuilder: (context, index) {
                    final step = steps[index];
                    return _StepRow(
                      key: ValueKey(step.id),
                      step: step,
                      index: index,
                      isNext: !completed &&
                          nextBestAction(action) is NextStep &&
                          (nextBestAction(action) as NextStep).step.id == step.id,
                      onToggle: () => state._toggleStep(action, step),
                      onRename: () => state._renameStep(step),
                      onDelete: () => state._deleteStep(step),
                      onMoveUp:
                          index == 0 ? null : () => state._move(action, step, -1),
                      onMoveDown: index == steps.length - 1
                          ? null
                          : () => state._move(action, step, 1),
                    );
                  },
                ),
              if (steps.isNotEmpty)
                SliverToBoxAdapter(
                  child: _AddStepButton(onAdd: () => state._addStep(action)),
                ),
              SliverToBoxAdapter(
                child: _Reminders(action: action, state: state),
              ),
              SliverToBoxAdapter(child: _WhyThisMatters(action: action)),
              SliverToBoxAdapter(child: _ActionIntelligence(action: action)),
              SliverToBoxAdapter(child: _Timeline(action: action)),
              SliverToBoxAdapter(child: _Provenance(action: action)),
              const SliverToBoxAdapter(child: SizedBox(height: Space.xxxl)),
            ],
          ),
        ),
        _BottomBar(action: action, state: state),
      ],
    );
  }
}

class _DetailBar extends StatelessWidget {
  const _DetailBar({required this.action, required this.state});

  final ActionItem action;
  final _ActionDetailScreenState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.xs, Space.xs, Space.xs, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back',
            onPressed: () => state._leave(context),
          ),
          const Spacer(),
          PopupMenuButton<String>(
            tooltip: 'More',
            onSelected: (value) => switch (value) {
              'title' => state._editTitle(action),
              'urgency' => state._editUrgency(action),
              'next' => state._editNextStep(action),
              'archive' => state._archiveAction(action),
              _ => null,
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'title', child: Text('Edit title')),
              const PopupMenuItem(value: 'urgency', child: Text('Change urgency')),
              PopupMenuItem(
                value: 'next',
                child: Text(action.recommendedNextStep == null
                    ? 'Add a recommended step'
                    : 'Edit recommended step'),
              ),
              if (action.status != ActionStatus.archived)
                const PopupMenuItem(value: 'archive', child: Text('Archive')),
            ],
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.action});

  final ActionItem action;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final completed = action.status == ActionStatus.completed;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.sm, Space.page, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            action.title,
            style: text.headlineMedium?.copyWith(
              color: completed ? colors.textSecondary : colors.textPrimary,
            ),
          ),
          const SizedBox(height: Space.sm),
          _MetaLine(action: action),
          if (completed && action.completedAt != null) ...[
            const SizedBox(height: Space.md),
            Row(
              children: [
                Icon(Icons.check_circle_outline,
                    size: 18, color: colors.success),
                const SizedBox(width: Space.sm),
                Text(
                  'Completed ${_friendlyDate(action.completedAt!.toLocal())}',
                  style: text.bodySmall?.copyWith(color: colors.textSecondary),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Urgency in words next to the honest provenance. Never colour alone, and
/// never a claim of doubt about something the person typed themselves.
class _MetaLine extends StatelessWidget {
  const _MetaLine({required this.action});

  final ActionItem action;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    // Provenance is NOT repeated here — it has its own section further down,
    // and saying "Created by you" twice on one calm page is noise.
    final parts = <String>[
      if (action.status == ActionStatus.archived) 'Archived',
      if (action.urgency != ActionUrgency.unknown) action.urgency.label,
      if (action.category != ActionCategory.unknown) action.category.label,
    ];
    if (parts.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        Container(
          width: Strokes.spine,
          height: 14,
          decoration: BoxDecoration(
            color: _urgencyColor(colors, action),
            borderRadius: BorderRadius.circular(Radii.pill),
          ),
        ),
        const SizedBox(width: Space.sm),
        Expanded(
          child: Text(
            parts.join('  ·  '),
            style: text.bodySmall?.copyWith(color: colors.textSecondary),
          ),
        ),
      ],
    );
  }
}

Color _urgencyColor(AppColors colors, ActionItem action) =>
    switch (action.urgency) {
      ActionUrgency.critical => colors.urgencyCritical,
      ActionUrgency.important => colors.urgencyImportant,
      ActionUrgency.normal => colors.urgencyNormal,
      ActionUrgency.low => colors.urgencyLow,
      ActionUrgency.unknown => colors.border,
    };

/// The one visually primary block: what to do now.
class _NextBlock extends StatelessWidget {
  const _NextBlock({required this.action, required this.state});

  final ActionItem action;
  final _ActionDetailScreenState state;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final next = nextBestAction(action);
    if (next is NothingProposed) return const SizedBox(height: Space.xl);

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.xxl, Space.page, 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(Space.lg),
        decoration: BoxDecoration(
          color: colors.surfaceElevated,
          borderRadius: Radii.rMd,
          border: Border.all(color: colors.border, width: Strokes.hairline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              switch (next) {
                ChainFinished() => 'ALL STEPS DONE',
                _ => 'NEXT',
              },
              style: text.labelSmall?.copyWith(
                color: colors.textTertiary,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: Space.sm),
            Text(
              switch (next) {
                NextStep(:final step) => step.title,
                NextSuggestion(:final text) => text,
                ChainFinished() => 'Complete this action?',
                NothingProposed() => '',
              },
              style: text.titleMedium,
            ),
            const SizedBox(height: Space.lg),
            switch (next) {
              NextStep(:final step) => Align(
                  alignment: Alignment.centerLeft,
                  child: FilledButton.tonal(
                    onPressed: () => state._toggleStep(action, step),
                    child: const Text('Mark step done'),
                  ),
                ),
              ChainFinished() => Align(
                  alignment: Alignment.centerLeft,
                  child: FilledButton.tonal(
                    onPressed: () => state._completeAction(action),
                    child: const Text('Complete this action'),
                  ),
                ),
              _ => const SizedBox.shrink(),
            },
          ],
        ),
      ),
    );
  }
}

class _KeyFacts extends StatelessWidget {
  const _KeyFacts({required this.action, required this.state});

  final ActionItem action;
  final _ActionDetailScreenState state;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    // Only what exists. An absent deadline is an absent row, not a row that
    // says "none".
    final rows = <Widget>[
      _FactLine(
        label: 'Deadline',
        value: action.dueAt == null
            ? 'Add a deadline'
            : _friendlyDate(action.dueAt!.wallClock),
        muted: action.dueAt == null,
        onTap: () => state._editDeadline(action),
      ),
      if (action.amount != null || action.category == ActionCategory.payment)
        _FactLine(
          label: 'Amount',
          value: action.amount?.toString() ?? 'Add an amount',
          muted: action.amount == null,
          numeric: action.amount != null,
          onTap: () => state._editAmount(action),
        ),
      // Facts the person reviewed and kept — but not the ones the deadline
      // and amount rows above were resolved FROM. "Deadline 21 Sep" followed
      // by "Payment Due Date 2026-09-21" is the same commitment twice, and
      // the raw one is the less readable of the two. Internal keys never
      // surface either; only the human label the review carried.
      for (final fact in action.facts)
        if (!_isCanonicalDuplicate(fact.key))
          _FactLine(label: fact.label, value: fact.value, numeric: true),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.xxl, Space.page, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DETAILS',
            style: text.labelSmall?.copyWith(
              color: colors.textTertiary,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: Space.sm),
          ...rows,
        ],
      ),
    );
  }
}

/// True when this fact is the raw source of the Deadline or Amount row, so
/// showing it again would just be the same value in a worse format. Reuses
/// the review layer's allowlist rather than keeping a second copy of it.
bool _isCanonicalDuplicate(String key) =>
    CanonicalFieldKeys.dueDate.contains(key) ||
    CanonicalFieldKeys.amount.contains(key);

class _FactLine extends StatelessWidget {
  const _FactLine({
    required this.label,
    required this.value,
    this.muted = false,
    this.numeric = false,
    this.onTap,
  });

  final String label;
  final String value;
  final bool muted;
  final bool numeric;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: Radii.rSm,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Space.md),
        child: Row(
          children: [
            SizedBox(
              width: 108,
              child: Text(
                label,
                style: text.bodySmall?.copyWith(color: colors.textSecondary),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: text.bodyMedium?.copyWith(
                  color: muted ? colors.textTertiary : colors.textPrimary,
                  fontFeatures: numeric ? AppText.numeric : null,
                ),
              ),
            ),
            if (onTap != null)
              Icon(Icons.edit_outlined, size: 16, color: colors.textTertiary),
          ],
        ),
      ),
    );
  }
}

class _ChainHeader extends StatelessWidget {
  const _ChainHeader({required this.progress, required this.hasSteps});

  final ChainProgress? progress;
  final bool hasSteps;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.xxxl, Space.page, Space.sm),
      child: Row(
        children: [
          Text(
            'STEPS',
            style: text.labelSmall?.copyWith(
              color: colors.textTertiary,
              letterSpacing: 1.0,
            ),
          ),
          const Spacer(),
          // No progress line for an empty chain: "0 of 0" is noise.
          if (progress != null)
            Text(
              '${progress!.completed} of ${progress!.total} done',
              style: text.labelSmall?.copyWith(
                color: colors.textTertiary,
                fontFeatures: AppText.numeric,
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyChain extends StatelessWidget {
  const _EmptyChain({required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Space.page),
      child: EmptyView(
        compact: true,
        icon: Icons.checklist_rtl,
        title: 'No steps yet',
        message: 'Break this into the moves you actually have to make.',
        action: FilledButton.tonal(
          onPressed: onAdd,
          child: const Text('Add first step'),
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({
    required this.step,
    required this.index,
    required this.isNext,
    required this.onToggle,
    required this.onRename,
    required this.onDelete,
    required this.onMoveUp,
    required this.onMoveDown,
    super.key,
  });

  final ActionStepItem step;
  final int index;
  final bool isNext;
  final VoidCallback onToggle;
  final VoidCallback onRename;
  final VoidCallback onDelete;
  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Space.page),
      child: Semantics(
        // The status is in the semantics, not only in the strikethrough.
        label: step.isCompleted
            ? 'Completed step: ${step.title}'
            : isNext
                ? 'Next step: ${step.title}'
                : 'Step: ${step.title}',
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // A generous target: the checkbox is the main verb on this screen.
            // It carries its own name so it does not announce as an unlabelled
            // button when focused directly — "button" is not an instruction.
            Semantics(
              button: true,
              checked: step.isCompleted,
              label: step.isCompleted
                  ? 'Mark "${step.title}" as not done'
                  : 'Mark "${step.title}" as done',
              child: InkWell(
                onTap: onToggle,
                borderRadius: BorderRadius.circular(Radii.pill),
                child: Padding(
                  padding: const EdgeInsets.all(Space.sm),
                  child: Icon(
                    step.isCompleted
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    size: 24,
                    color: step.isCompleted
                        ? colors.success
                        : isNext
                            ? colors.brand
                            : colors.borderStrong,
                  ),
                ),
              ),
            ),
            const SizedBox(width: Space.xs),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Space.md),
                child: Text(
                  step.title,
                  style: text.bodyMedium?.copyWith(
                    color: step.isCompleted
                        ? colors.textTertiary
                        : colors.textPrimary,
                    decoration:
                        step.isCompleted ? TextDecoration.lineThrough : null,
                    decorationColor: colors.textTertiary,
                    fontWeight: isNext ? FontWeight.w600 : null,
                  ),
                ),
              ),
            ),
            PopupMenuButton<String>(
              tooltip: 'Step options',
              onSelected: (value) => switch (value) {
                'rename' => onRename(),
                'up' => onMoveUp?.call(),
                'down' => onMoveDown?.call(),
                'delete' => onDelete(),
                _ => null,
              },
              itemBuilder: (_) => [
                const PopupMenuItem(value: 'rename', child: Text('Edit step')),
                if (onMoveUp != null)
                  const PopupMenuItem(value: 'up', child: Text('Move up')),
                if (onMoveDown != null)
                  const PopupMenuItem(value: 'down', child: Text('Move down')),
                const PopupMenuItem(
                    value: 'delete', child: Text('Delete step')),
              ],
            ),
            // Only the handle drags, so checking a step never starts a move.
            ReorderableDragStartListener(
              index: index,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Space.xs),
                child: Icon(Icons.drag_handle,
                    size: 20, color: colors.textTertiary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddStepButton extends StatelessWidget {
  const _AddStepButton({required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.sm, Space.page, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Add a step'),
        ),
      ),
    );
  }
}

/// When the user asked to be reminded, and whether that is actually working.
///
/// Every row says which of those two it is. A reminder blocked on permission
/// or refused by the platform is never displayed as if it were armed.
class _Reminders extends ConsumerWidget {
  const _Reminders({required this.action, required this.state});

  final ActionItem action;
  final _ActionDetailScreenState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final async = ref.watch(remindersForActionProvider(action.id));
    // A reminder list that has not loaded yet is shown as empty rather than as
    // a spinner: the section is secondary, and flicker here would be worse
    // than a beat of nothing.
    final reminders = switch (async) {
      AsyncData(:final value) => value,
      _ => const <ActionReminder>[],
    };
    final atLimit = reminders.length >= maxRemindersPerAction;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.xxxl, Space.page, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'REMINDERS',
            style: text.labelSmall?.copyWith(
              color: colors.textTertiary,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: Space.sm),
          if (reminders.isEmpty)
            Text(
              'No reminders yet.',
              style: text.bodyMedium?.copyWith(color: colors.textTertiary),
            )
          else
            for (final reminder in reminders)
              _ReminderRow(
                reminder: reminder,
                onEdit: () => state._editReminder(action, reminder),
                onRemove: () => state._removeReminder(reminder),
              ),
          const SizedBox(height: Space.xs),
          if (atLimit)
            Text(
              'That is the most reminders one action can have. Remove one to '
              'add another.',
              style: text.bodySmall?.copyWith(color: colors.textTertiary),
            )
          else if (action.status == ActionStatus.active)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => state._addReminder(action),
                icon: const Icon(Icons.alarm_add_outlined, size: 18),
                label: const Text('Add reminder'),
              ),
            ),
        ],
      ),
    );
  }
}

class _ReminderRow extends StatelessWidget {
  const _ReminderRow({
    required this.reminder,
    required this.onEdit,
    required this.onRemove,
  });

  final ActionReminder reminder;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final local = reminder.scheduledAt.toLocal();

    // The honest one-line status. Only `scheduled` is allowed to read as
    // working, and even that promises delivery "around" the time.
    final (String note, Color noteColor) = switch (reminder.state) {
      ReminderState.scheduled => ('', colors.textTertiary),
      ReminderState.pendingSchedule => ('Not set up yet', colors.textTertiary),
      ReminderState.needsPermission => (
          'Saved, but notifications are off',
          colors.urgencyImportant,
        ),
      ReminderState.scheduleFailed => (
          "Couldn't be scheduled",
          colors.danger,
        ),
      ReminderState.cancelPending => ('Removing…', colors.textTertiary),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Space.sm),
      child: Row(
        children: [
          Icon(
            reminder.isActive
                ? Icons.notifications_active_outlined
                : Icons.notifications_off_outlined,
            size: 20,
            color: reminder.isActive ? colors.brand : colors.textTertiary,
          ),
          const SizedBox(width: Space.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEE d MMM, h:mm a').format(local),
                  style: text.bodyMedium?.copyWith(
                    fontFeatures: AppText.numeric,
                  ),
                ),
                if (note.isNotEmpty)
                  Text(
                    note,
                    style: text.bodySmall?.copyWith(color: noteColor),
                  ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Change reminder',
            onPressed: onEdit,
            icon: Icon(Icons.edit_outlined, size: 18, color: colors.textTertiary),
          ),
          IconButton(
            tooltip: 'Remove reminder',
            onPressed: onRemove,
            icon: Icon(Icons.close, size: 18, color: colors.textTertiary),
          ),
        ],
      ),
    );
  }
}

class _WhyThisMatters extends StatelessWidget {
  const _WhyThisMatters({required this.action});

  final ActionItem action;

  @override
  Widget build(BuildContext context) {
    final why = action.whyThisMatters?.trim();
    final summary = action.summary?.trim();
    final body = (why != null && why.isNotEmpty)
        ? why
        : (summary != null && summary.isNotEmpty)
            ? summary
            : null;
    if (body == null) return const SizedBox.shrink();

    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.xxxl, Space.page, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WHY THIS MATTERS',
            style: text.labelSmall?.copyWith(
              color: colors.textTertiary,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: Space.sm),
          Text(body, style: text.bodyMedium),
        ],
      ),
    );
  }
}

/// Where this came from. A dangling source is a normal outcome, not damage:
/// the Action stays entirely usable without it.
class _Provenance extends ConsumerWidget {
  const _Provenance({required this.action});

  final ActionItem action;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    Widget shell(Widget child) => Padding(
          padding:
              const EdgeInsets.fromLTRB(Space.page, Space.xxxl, Space.page, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CREATED FROM',
                style: text.labelSmall?.copyWith(
                  color: colors.textTertiary,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: Space.sm),
              child,
            ],
          ),
        );

    final sourceId = action.sourceId;
    final manual = action.origin == ActionOrigin.manual;

    final byYou = Text(
      'Created by you',
      style: text.bodyMedium?.copyWith(color: colors.textSecondary),
    );

    // Typed by hand, with nothing behind it.
    if (sourceId == null) return shell(byYou);

    // Otherwise there is a capture, and it is worth offering even when the
    // person wrote the details themselves — typing an action out from a
    // letter does not make the letter irrelevant. Both facts are true, so
    // both are shown rather than one hiding the other.
    final source = ref.watch(_sourceProvider(sourceId));
    return shell(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (manual) ...[byYou, const SizedBox(height: Space.xs)],
          switch (source) {
            // Resolving the source must never hold up the page.
            AsyncLoading() => Text(
                'Checking the original capture…',
                style: text.bodySmall?.copyWith(color: colors.textTertiary),
              ),
            AsyncData(:final value) when value != null =>
              _SourceLink(item: value),
            _ => Text(
                'The original capture is no longer available.',
                style: text.bodyMedium?.copyWith(color: colors.textSecondary),
              ),
          },
        ],
      ),
    );
  }
}

class _SourceLink extends StatelessWidget {
  const _SourceLink({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => context.push(Routes.source(item.id)),
      borderRadius: Radii.rSm,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Space.sm),
        child: Row(
          children: [
            Icon(Icons.description_outlined, size: 18, color: colors.textSecondary),
            const SizedBox(width: Space.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.type.provenanceLabel, style: text.bodyMedium),
                  Text(
                    _friendlyDate(item.capturedAt.toLocal()),
                    style: text.bodySmall?.copyWith(color: colors.textTertiary),
                  ),
                ],
              ),
            ),
            Text('View source',
                style: text.labelLarge?.copyWith(color: colors.brand)),
          ],
        ),
      ),
    );
  }
}

/// Resolves one capture. Family-scoped so a missing source is cached as a
/// missing source rather than re-read on every rebuild.
final _sourceProvider =
    FutureProvider.family<SourceItem?, String>((ref, id) async {
  final store = await ref.watch(sourceStoreProvider.future);
  return store.byId(id);
});

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.action, required this.state});

  final ActionItem action;
  final _ActionDetailScreenState state;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final completed = action.status == ActionStatus.completed;

    return Container(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.md, Space.page, Space.md),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(
          top: BorderSide(color: colors.border, width: Strokes.hairline),
        ),
      ),
      child: SafeArea(
        top: false,
        // A completed Action offers a calm way back, not a loud destructive
        // button.
        child: completed
            ? OutlinedButton(
                onPressed: () => state._reopenAction(action),
                child: const Text('Reopen action'),
              )
            // Outlined, not filled. The filled button on this screen belongs
            // to the recommended next step: that is the move the product is
            // actually suggesting, and two equally loud blue buttons make the
            // user decide which one the app meant. Finishing the whole Action
            // stays one tap away, it just stops shouting over the step.
            : OutlinedButton(
                onPressed: () => state._completeAction(action),
                child: const Text('Mark action complete'),
              ),
      ),
    );
  }
}

class _NotFound extends StatelessWidget {
  const _NotFound({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return EmptyView(
      icon: Icons.search_off,
      title: 'That action is no longer here',
      message: 'It may have been deleted on this device.',
      action: FilledButton(onPressed: onBack, child: const Text('Go back')),
    );
  }
}

String _friendlyDate(DateTime value) {
  final now = DateTime.now();
  return DateFormat(value.year == now.year ? 'd MMM' : 'd MMM yyyy')
      .format(value);
}

/// Contextual Intelligence entry points for one Action.
///
/// Placed below the plan and above provenance: it is something to do *with*
/// the Action once you have read it, not a headline. Which tools appear is
/// decided from the Action's own shape - a plan with no steps wants steps, a
/// half-finished one is where missing details actually bite - never by asking
/// a model to choose, which would spend the user's money to draw a menu.
class _ActionIntelligence extends StatelessWidget {
  const _ActionIntelligence({required this.action});

  final ActionItem action;

  @override
  Widget build(BuildContext context) {
    final tools = recommendedForAction(action);
    if (tools.isEmpty) return const SizedBox.shrink();

    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.xxl,
        Space.page,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Get help with this', style: text.titleSmall),
          const SizedBox(height: Space.md),
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.sm,
            children: [
              for (final tool in tools)
                ActionChip(
                  label: Text(tool.title),
                  onPressed: () => context.push(
                    Routes.tool(tool.id, actionId: action.id),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}


/// What has happened to this Action.
///
/// Derived from stored timestamps rather than an event log — see
/// [ActionTimeline] for why, and for the list of things it deliberately
/// cannot say. Collapsed by default: on a healthy Action this is one line of
/// history and nobody opened the screen to read it, but on an old one it is
/// the fastest answer to "when did I do this?"
class _Timeline extends ConsumerStatefulWidget {
  const _Timeline({required this.action});

  final ActionItem action;

  @override
  ConsumerState<_Timeline> createState() => _TimelineState();
}

class _TimelineState extends ConsumerState<_Timeline> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final reminders =
        ref.watch(remindersForActionProvider(widget.action.id)).value ??
            const [];
    final events =
        ActionTimeline.of(widget.action, reminders: reminders);
    if (events.isEmpty) return const SizedBox.shrink();

    final shown = _expanded ? events : events.take(3).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.xxl,
        Space.page,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(
              'HISTORY',
              style: text.labelSmall?.copyWith(
                color: colors.textTertiary,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: Space.md),
          for (var i = 0; i < shown.length; i++)
            _TimelineRow(
              event: shown[i],
              isFirst: i == 0,
              isLast: i == shown.length - 1 && shown.length == events.length,
            ),
          if (events.length > 3)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: () => setState(() => _expanded = !_expanded),
                style: TextButton.styleFrom(
                  minimumSize: const Size(0, 40),
                  padding: const EdgeInsets.symmetric(horizontal: Space.sm),
                ),
                child: Text(
                  _expanded
                      ? 'Show less'
                      : 'Show all ${events.length}',
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({
    required this.event,
    required this.isFirst,
    required this.isLast,
  });

  final ActionEvent event;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // The rail. A dot per event and a hairline between them: the
          // cheapest possible way to say "these are in order" without a
          // decorated card round each one.
          SizedBox(
            width: 20,
            child: Column(
              children: [
                const SizedBox(height: 5),
                Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFirst ? colors.brand : colors.textTertiary,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: Strokes.hairline,
                      color: colors.border,
                      margin: const EdgeInsets.symmetric(vertical: 3),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : Space.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _describe(event, context),
                    style: text.bodyMedium?.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: Space.xxs),
                  Text(
                    _timestamp(event.at),
                    style: text.labelSmall?.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _describe(ActionEvent event, BuildContext context) {
    return switch (event.kind) {
      ActionEventKind.created => event.count == null
          ? 'Created'
          : 'Created with ${event.count} '
              '${event.count == 1 ? 'step' : 'steps'}',
      ActionEventKind.reviewed => 'You confirmed the details',
      ActionEventKind.stepCompleted =>
        'Finished “${event.subject ?? 'a step'}”',
      ActionEventKind.reminderSet => _reminderLine(event.subject),
      ActionEventKind.completed => 'Marked done',
      ActionEventKind.archived => 'Archived',
      // Never elaborated. The store knows that something changed and not what,
      // and inventing the what is exactly what this section refuses to do.
      ActionEventKind.changed => 'Last changed',
    };
  }

  /// In the user's voice, like the rest of the history — and deliberately not
  /// the words the Reminders section above uses. The same phrase twice on one
  /// screen, meaning two different things, is ambiguous to a reader and was
  /// ambiguous to a test.
  static String _reminderLine(String? scheduledAt) {
    final when = scheduledAt == null ? null : DateTime.tryParse(scheduledAt);
    if (when == null) return 'You set a reminder';
    return 'You set a reminder for ${_timestamp(when.toLocal())}';
  }

  static String _timestamp(DateTime at) =>
      DateFormat('d MMM yyyy, HH:mm').format(at.toLocal());
}
