import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../design/components/section_header.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../shared/widgets/empty_view.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_view.dart';
import '../../capture/application/capture_controller.dart';
import '../../capture/domain/source_item.dart';
import '../../capture/presentation/capture_sheet.dart';

/// The Action Inbox.
///
/// Captures that have not been interpreted yet sit under "Needs attention",
/// because an unread capture is precisely something the user still has to deal
/// with. Once extraction lands they keep that place until they are reviewed, so
/// this is the real section rather than a placeholder.
///
/// Empty sections are hidden rather than rendered as rows of nothing — three
/// permanently empty headings is what makes a productivity app feel like a
/// spreadsheet.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sources = ref.watch(sourcesProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: switch (sources) {
          AsyncLoading() => const LoadingView(),
          AsyncError(:final error) => ErrorView(
              message: "Your captures couldn't be loaded.\n$error",
              onRetry: () => ref.invalidate(sourcesProvider),
            ),
          _ => _Inbox(items: sources.value ?? const []),
        },
      ),
      bottomNavigationBar: const _AddBar(),
    );
  }
}

class _Inbox extends StatelessWidget {
  const _Inbox({required this.items});

  final List<SourceItem> items;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: _Greeting()),
        if (items.isEmpty)
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
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Needs attention',
              count: items.length,
            ),
          ),
          SliverList.separated(
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: Space.page),
              child: _SourceRow(item: items[i]),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: Space.xxl)),
        ],
      ],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(greeting, style: text.displaySmall),
          const SizedBox(height: Space.xs),
          Text(DateFormat('EEEE, d MMMM').format(now), style: text.bodyMedium),
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

    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceElevated,
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
                Text(
                  item.hasText ? item.rawText!.trim() : 'Not read yet',
                  style: text.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Space.sm),
                Text(
                  _relativeTime(item.capturedAt),
                  style: text.labelSmall?.copyWith(color: colors.textTertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
