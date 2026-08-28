import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../shared/widgets/error_view.dart';
import '../../extraction/application/action_review_state.dart'
    show sourceReadyForExtraction;
import '../application/capture_controller.dart';
import '../domain/source_item.dart';

/// What Action has read from a capture, before it has interpreted anything.
///
/// Shows the processed image, the recognised text, and the provenance — the
/// three things that let a user judge whether the app actually understood what
/// they handed it. Interpretation (dates, amounts, proposed actions) belongs to
/// the day-7 review screen, not here.
class SourceDetailScreen extends ConsumerWidget {
  const SourceDetailScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sources = ref.watch(sourcesProvider);
    final item = sources.value?.where((s) => s.id == id).firstOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('What we read'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (item != null)
            IconButton(
              tooltip: 'Delete capture',
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmDelete(context, ref),
            ),
        ],
      ),
      body: item == null
          ? const ErrorView(message: 'That capture is no longer available.')
          : _Body(item: item),
      // The bridge into review: the one production entry point to
      // extraction. Only offered once the capture actually has text to
      // interpret — the review flow's manual path covers everything else.
      bottomNavigationBar: item != null && sourceReadyForExtraction(item)
          ? _ReviewBar(id: id)
          : null,
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete this capture?'),
        content: const Text(
          'The image and the text read from it are removed from this device.',
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

    if (confirmed != true || !context.mounted) return;
    await ref.read(sourcesProvider.notifier).delete(id);
    if (context.mounted) context.pop();
  }
}

class _ReviewBar extends StatelessWidget {
  const _ReviewBar({required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
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
              Space.page, Space.md, Space.page, Space.md),
          child: FilledButton(
            onPressed: () => context.push(Routes.sourceReview(id)),
            child: const Text('Create an action from this'),
          ),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.lg,
        Space.page,
        Space.huge,
      ),
      children: [
        _ProvenanceStrip(item: item),
        if (item.hasImage) ...[
          const SizedBox(height: Space.lg),
          _ImagePanel(item: item),
        ],
        const SizedBox(height: Space.xxl),
        _StateSection(item: item),
      ],
    );
  }
}

class _ProvenanceStrip extends StatelessWidget {
  const _ProvenanceStrip({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    final icon = switch (item.type) {
      SourceType.photo => Icons.photo_camera_outlined,
      SourceType.gallery => Icons.image_outlined,
      SourceType.pastedText => Icons.text_snippet_outlined,
    };

    return Row(
      children: [
        Icon(icon, size: 18, color: colors.textTertiary),
        const SizedBox(width: Space.sm),
        Expanded(
          child: Text(
            '${item.type.provenanceLabel} · '
            '${DateFormat('d MMM, HH:mm').format(item.capturedAt)}',
            style: text.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _ImagePanel extends StatelessWidget {
  const _ImagePanel({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 320),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.surfaceSunken,
              borderRadius: Radii.rLg,
            ),
            // Drawn over the image for the same reason as the inbox thumbnail:
            // a white page reaching the panel edge would otherwise bleed into
            // the background with no boundary.
            foregroundDecoration: BoxDecoration(
              borderRadius: Radii.rLg,
              border: Border.all(color: colors.border, width: Strokes.hairline),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.file(
              File(item.imagePath!),
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => Center(
                child: Icon(
                  Icons.broken_image_outlined,
                  color: colors.textTertiary,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: Space.sm),
        Text(_describe(item), style: text.labelSmall?.copyWith(
          color: colors.textTertiary,
        )),
      ],
    );
  }

  static String _describe(SourceItem item) {
    final parts = <String>[];
    if (item.imageWidth != null && item.imageHeight != null) {
      parts.add('${item.imageWidth}×${item.imageHeight}');
    }
    if (item.byteSize != null) {
      parts.add('${(item.byteSize! / 1024).round()} KB');
    }
    // Naming the original format makes the re-encode visible rather than
    // something the app quietly did to the user's file.
    if (item.originalFormat != null && item.originalByteSize != null) {
      final was = (item.originalByteSize! / 1024).round();
      parts.add('from ${item.originalFormat!.toUpperCase()} $was KB');
    }
    return parts.join(' · ');
  }
}

class _StateSection extends ConsumerWidget {
  const _StateSection({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (item.state) {
      SourceProcessingState.pending ||
      SourceProcessingState.processing =>
        const _Processing(),
      SourceProcessingState.failed => _Failed(item: item),
      SourceProcessingState.ready =>
        item.hasText ? _TextPanel(item: item) : _NoTextFound(item: item),
    };
  }
}

class _Processing extends StatelessWidget {
  const _Processing();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        const SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: Space.md),
        Text('Reading the text…', style: text.bodyMedium),
      ],
    );
  }
}

class _TextPanel extends StatelessWidget {
  const _TextPanel({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Text found', style: text.titleSmall),
            const Spacer(),
            if (item.ocr != null)
              Text(
                '${item.ocr!.lineCount} lines · ${item.ocr!.durationMs} ms',
                style: text.labelSmall?.copyWith(color: colors.textTertiary),
              ),
          ],
        ),
        const SizedBox(height: Space.md),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Space.lg),
          decoration: BoxDecoration(
            color: colors.surfaceSunken,
            borderRadius: Radii.rMd,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          child: SelectableText(
            item.analysisText,
            style: text.bodyMedium?.copyWith(color: colors.textPrimary),
          ),
        ),
        const SizedBox(height: Space.md),
        Text(
          'Nothing has been interpreted yet. Action will suggest what to do '
          'with this, and you confirm before anything is created.',
          style: text.bodySmall,
        ),
      ],
    );
  }
}

class _NoTextFound extends ConsumerWidget {
  const _NoTextFound({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('No text found', style: text.titleSmall),
        const SizedBox(height: Space.sm),
        Text(
          'This can happen with handwriting, very low light, or a script this '
          'device cannot read yet.',
          style: text.bodyMedium,
        ),
        const SizedBox(height: Space.xl),
        _Actions(item: item),
      ],
    );
  }
}

class _Failed extends ConsumerWidget {
  const _Failed({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.error_outline_rounded, size: 18, color: colors.danger),
            const SizedBox(width: Space.sm),
            Text("Couldn't read this", style: text.titleSmall),
          ],
        ),
        const SizedBox(height: Space.sm),
        Text(
          item.failureReason ?? 'Text recognition did not complete.',
          style: text.bodyMedium,
        ),
        const SizedBox(height: Space.xl),
        _Actions(item: item),
      ],
    );
  }
}

/// Retry plus the manual fallback the product rules require whenever automatic
/// extraction cannot deliver.
class _Actions extends ConsumerWidget {
  const _Actions({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (item.hasImage)
          OutlinedButton.icon(
            onPressed: () =>
                ref.read(sourcesProvider.notifier).runOcr(item.id),
            icon: const Icon(Icons.refresh_rounded, size: 20),
            label: const Text('Try reading again'),
          ),
        const SizedBox(height: Space.sm),
        FilledButton(
          onPressed: () => _enterManually(context, ref),
          child: const Text('Type the details instead'),
        ),
      ],
    );
  }

  Future<void> _enterManually(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController(text: item.pastedText ?? '');

    final saved = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      // Through AppSheet like every other sheet in the app. Day 17 made the
      // sheet surface glass, and it is AppSheet that paints it — a sheet
      // built by hand would now come out transparent.
      builder: (sheetContext) => AppSheet(
        title: 'Type what it says',
        child: Padding(
          padding: EdgeInsets.only(
            left: Space.page,
            right: Space.page,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + Space.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                maxLines: 6,
                minLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Dates, amounts, and what is being asked for.',
                ),
              ),
              const SizedBox(height: Space.lg),
              FilledButton(
                onPressed: () =>
                    Navigator.of(sheetContext).pop(controller.text),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );

    controller.dispose();
    if (saved == null || saved.trim().isEmpty) return;
    await ref.read(sourcesProvider.notifier).setManualText(item.id, saved);
  }
}
