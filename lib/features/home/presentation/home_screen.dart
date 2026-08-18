import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../design/components/section_header.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../design/tokens/typography.dart';
import '../../../shared/widgets/empty_view.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_view.dart';
import '../../actions/application/action_grouping.dart';
import '../../actions/application/action_providers.dart';
import '../../actions/domain/action_item.dart';
import '../../capture/application/capture_controller.dart';
import '../../capture/domain/source_item.dart';
import '../../capture/presentation/capture_sheet.dart';
import '../../capture/presentation/preview_screen.dart';
import '../../extraction/application/review_analytics.dart';
import '../../extraction/domain/extraction_schema.dart';

/// Home: the user's confirmed Actions, then their unreviewed captures.
///
/// Actions are the product object now — read from the durable local store,
/// never from anything in memory, grouped into NEEDS ATTENTION / UPCOMING /
/// COMPLETED by the deterministic rules in [groupActionsForHome]. Captures
/// keep their own section below: a capture is still something to deal with,
/// but it is raw material rather than a commitment.
///
/// Empty sections are hidden rather than rendered as rows of nothing — three
/// permanently empty headings is what makes a productivity app feel like a
/// spreadsheet. A database error is its own state: it must never read as
/// "your Actions disappeared", and it never triggers a silent re-create.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _recoverLostCapture();
      // Captures the previous run stored but never finished reading. Without
      // this they sit on the inbox saying "Reading the text…" forever.
      ref.read(sourcesProvider.notifier).resumeUnfinished();
      // One bounded pass over any Actions still owing the cloud mirror an
      // upsert. Strictly after first frame, never blocking anything.
      unawaited(ref.read(actionSyncServiceProvider).flush());
    });
  }

  /// Android can kill this app while the camera activity is in the foreground,
  /// in which case the picker's result is never delivered to the call that is
  /// waiting for it — that call died with the process. image_picker holds the
  /// result until `retrieveLostData` is asked for it.
  ///
  /// This recovers the *picked file* only. Anything the user had typed
  /// elsewhere is genuinely gone, and the routing structure on its own does not
  /// change that.
  Future<void> _recoverLostCapture() async {
    final XFile? file;
    try {
      file = await ref.read(capturePickerProvider).recoverLostCapture();
    } on Object {
      return;
    }
    if (file == null || !mounted) return;

    // The lost activity is almost always the camera; gallery picking does not
    // put another app in the foreground long enough to be reclaimed.
    context.push(
      Routes.capturePreview,
      extra: PreviewArgs(path: file.path, type: SourceType.photo),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sources = ref.watch(sourcesProvider);
    final actions = ref.watch(actionsStreamProvider);

    final Widget body;
    if (actions is AsyncError) {
      // The local database could not be read. This is loud but calm, and it
      // deliberately does not overlap with "no Actions yet" — data that
      // cannot be loaded has not vanished.
      body = ErrorView(
        message: "Your actions couldn't be loaded. They are still stored on "
            'this device.',
        onRetry: () => ref.invalidate(actionsStreamProvider),
      );
    } else if (actions is AsyncLoading && sources is AsyncLoading) {
      body = const LoadingView();
    } else {
      body = _Inbox(
        groups: groupActionsForHome(actions.value ?? const [], DateTime.now()),
        sourceItems: sources.value ?? const [],
      );
    }

    return Scaffold(
      body: SafeArea(bottom: false, child: body),
      bottomNavigationBar: const _AddBar(),
    );
  }
}

class _Inbox extends StatelessWidget {
  const _Inbox({required this.groups, required this.sourceItems});

  final HomeActionGroups groups;
  final List<SourceItem> sourceItems;

  @override
  Widget build(BuildContext context) {
    final nothingAtAll = groups.isEmpty && sourceItems.isEmpty;

    SliverList actionList(List<ActionItem> actions) => SliverList.separated(
          itemCount: actions.length,
          separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.page),
            child: _ActionRow(item: actions[i]),
          ),
        );

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: _Greeting()),
        if (nothingAtAll)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: EmptyView(
              icon: Icons.inbox_outlined,
              title: 'Nothing needs your attention',
              message:
                  'Add a photo, a screenshot, or some text. Action works out '
                  'what it is and what you need to do about it.',
            ),
          )
        else ...[
          if (groups.needsAttention.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Needs attention',
                count: groups.needsAttention.length,
              ),
            ),
            actionList(groups.needsAttention),
          ],
          if (groups.upcoming.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Upcoming',
                count: groups.upcoming.length,
              ),
            ),
            actionList(groups.upcoming),
          ],
          if (groups.completed.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Completed',
                count: groups.completed.length,
              ),
            ),
            actionList(groups.completed),
          ],
          if (sourceItems.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Captures',
                count: sourceItems.length,
              ),
            ),
            SliverList.separated(
              itemCount: sourceItems.length,
              separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: Space.page),
                child: _SourceRow(item: sourceItems[i]),
              ),
            ),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: Space.xxl)),
        ],
      ],
    );
  }
}

/// The Action Card: urgency spine on the left (warm, solid — the documented
/// treatment), title, deadline and amount in tabular figures, and a
/// completion toggle, and the way into the Action itself.
class _ActionRow extends ConsumerWidget {
  const _ActionRow({required this.item});

  final ActionItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final completed = item.status == ActionStatus.completed;

    final spine = switch (item.urgency) {
      ActionUrgency.critical => colors.urgencyCritical,
      ActionUrgency.important => colors.urgencyImportant,
      ActionUrgency.normal => colors.urgencyNormal,
      ActionUrgency.low || ActionUrgency.unknown => colors.urgencyLow,
    };

    return Material(
      color: colors.surfaceElevated,
      borderRadius: Radii.rMd,
      child: InkWell(
        // The card opens the Action; the completion toggle keeps its own hit
        // target inside it, so finishing something never costs a navigation.
        onTap: () => context.push(Routes.action(item.id)),
        borderRadius: Radii.rMd,
        child: Container(
        decoration: BoxDecoration(
          borderRadius: Radii.rMd,
          border: Border.all(color: colors.border, width: Strokes.hairline),
        ),
        padding: const EdgeInsets.fromLTRB(0, Space.md, Space.xs, Space.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Strokes.spine,
              height: 40,
              margin: const EdgeInsets.only(left: Space.md),
              decoration: BoxDecoration(
                color: completed ? colors.border : spine,
                borderRadius: BorderRadius.circular(Radii.pill),
              ),
            ),
            const SizedBox(width: Space.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: text.titleSmall?.copyWith(
                      color:
                          completed ? colors.textTertiary : colors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Space.xxs),
                  _ActionMetaLine(item: item),
                ],
              ),
            ),
            IconButton(
              tooltip: completed ? 'Completed' : 'Mark as done',
              onPressed: completed
                  ? null
                  : () async {
                      await ref
                          .read(actionRepositoryProvider)
                          .complete(item.id, at: DateTime.now());
                      ref
                          .read(reviewAnalyticsProvider)
                          .log(ActionEvents.completed);
                      unawaited(
                          ref.read(actionSyncServiceProvider).flush());
                    },
              icon: Icon(
                completed
                    ? Icons.check_circle_outline_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: completed
                    ? colors.confidenceConfirmed
                    : colors.textTertiary,
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class _ActionMetaLine extends StatelessWidget {
  const _ActionMetaLine({required this.item});

  final ActionItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final now = DateTime.now();

    final parts = <InlineSpan>[];
    final due = item.dueAt;
    if (item.status == ActionStatus.completed) {
      parts.add(TextSpan(
        text: 'Done ${_relativeTime(item.completedAt ?? item.updatedAt)}',
      ));
    } else if (due != null) {
      final startOfToday = DateTime(now.year, now.month, now.day);
      final overdue = due.wallClock.isBefore(startOfToday);
      final dueToday = !overdue &&
          due.wallClock.isBefore(startOfToday.add(const Duration(days: 1)));
      final label = overdue
          ? 'Overdue · was due ${DateFormat('d MMM').format(due.wallClock)}'
          : dueToday
              ? 'Due today'
              : 'Due ${DateFormat(due.wallClock.year == now.year ? 'd MMM' : 'd MMM yyyy').format(due.wallClock)}';
      parts.add(TextSpan(
        text: label,
        style: overdue || dueToday
            ? text.bodySmall?.copyWith(color: colors.urgencyCritical)
            : null,
      ));
    }
    if (item.amount != null) {
      if (parts.isNotEmpty) parts.add(const TextSpan(text: '  ·  '));
      parts.add(TextSpan(text: '${item.amount}'));
    }
    if (parts.isEmpty) {
      // Nothing to summarise. A manually created Action has no category
      // either, and its label would read "Not sure" — a doubt the app has no
      // business claiming about something the user typed themselves.
      parts.add(TextSpan(
        text: item.origin == ActionOrigin.manual
            ? 'Created by you'
            : item.category.label,
      ));
    }

    return Text.rich(
      TextSpan(children: parts),
      style: text.bodySmall?.copyWith(fontFeatures: AppText.numeric),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final now = DateTime.now();

    final greeting = switch (now.hour) {
      < 12 => 'Good morning',
      < 17 => 'Good afternoon',
      _ => 'Good evening',
    };

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.xxl,
        Space.page,
        Space.xs,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(greeting, style: text.displaySmall),
                const SizedBox(height: Space.xs),
                Text(
                  DateFormat('EEEE, d MMMM').format(now),
                  style: text.bodyMedium,
                ),
              ],
            ),
          ),
          // Debug builds only; the route itself is not registered in release.
          if (kDebugMode)
            IconButton(
              tooltip: 'OCR diagnostics',
              icon: const Icon(Icons.science_outlined),
              onPressed: () => context.push(Routes.diagnostics),
            ),
        ],
      ),
    );
  }
}

/// A capture that has not been read yet.
///
/// Deliberately not an Action Card: there is no urgency to show and no
/// confidence to report, and borrowing that treatment now would imply the app
/// understands more than it does.
class _SourceRow extends StatelessWidget {
  const _SourceRow({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Material(
      color: colors.surfaceElevated,
      borderRadius: Radii.rMd,
      child: InkWell(
        borderRadius: Radii.rMd,
        onTap: () => context.push(Routes.source(item.id)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Radii.rMd,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          padding: const EdgeInsets.all(Space.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Thumbnail(item: item),
              const SizedBox(width: Space.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.type.provenanceLabel,
                      style: text.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: Space.xxs),
                    _Status(item: item),
                    const SizedBox(height: Space.sm),
                    Text(
                      _relativeTime(item.capturedAt),
                      style:
                          text.labelSmall?.copyWith(color: colors.textTertiary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One line describing where the capture has got to.
///
/// "Reading" and "couldn't read" are states the user needs to distinguish, so
/// they read as sentences rather than as a badge they have to decode.
class _Status extends StatelessWidget {
  const _Status({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return switch (item.state) {
      SourceProcessingState.pending ||
      SourceProcessingState.processing =>
        Row(
          children: [
            SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 1.6,
                color: colors.textTertiary,
              ),
            ),
            const SizedBox(width: Space.sm),
            Text('Reading the text…', style: text.bodySmall),
          ],
        ),
      SourceProcessingState.failed => Text(
          item.failureReason ?? "Couldn't read this",
          style: text.bodySmall?.copyWith(color: colors.danger),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      SourceProcessingState.ready => Text(
          item.hasText ? item.analysisText : 'No text found',
          style: text.bodySmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
    };
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: colors.surfaceSunken,
        borderRadius: Radii.rSm,
      ),
      // In front of the image, not behind it. Documents are overwhelmingly
      // white, so without an edge the thumbnail reads as a blank white block
      // against a dark card and as nothing at all against a light one. A
      // border in `decoration` would be painted under the image and lost.
      foregroundDecoration: BoxDecoration(
        borderRadius: Radii.rSm,
        border: Border.all(color: colors.border, width: Strokes.hairline),
      ),
      clipBehavior: Clip.antiAlias,
      child: item.hasImage
          // cacheWidth keeps a 2048px capture from being decoded at full size
          // for a 52px box, which is the difference between a smooth list and a
          // stuttering one.
          ? Image.file(
              File(item.imagePath!),
              fit: BoxFit.cover,
              cacheWidth: 156,
              errorBuilder: (_, _, _) =>
                  Icon(Icons.broken_image_outlined, color: colors.textTertiary),
            )
          : Icon(Icons.text_snippet_outlined, color: colors.textTertiary),
    );
  }
}

class _AddBar extends ConsumerWidget {
  const _AddBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(
          top: BorderSide(color: colors.border, width: Strokes.hairline),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Space.page,
            Space.md,
            Space.page,
            Space.md,
          ),
          child: FilledButton.icon(
            onPressed: () => startCapture(context, ref),
            icon: const Icon(Icons.add_rounded, size: 22),
            label: const Text('Add something'),
          ),
        ),
      ),
    );
  }
}

String _relativeTime(DateTime when) {
  final diff = DateTime.now().difference(when);
  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  if (diff.inDays == 1) return 'Yesterday';
  if (diff.inDays < 7) return '${diff.inDays}d ago';
  return DateFormat('d MMM').format(when);
}
