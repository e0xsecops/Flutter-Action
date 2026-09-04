import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../intelligence/application/intelligence_context.dart';
import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../core/security/file_identity.dart' show formatBytes;
import '../../../design/ambient/ambient_background.dart';
import '../../../shared/widgets/error_view.dart';
import '../../actions/application/action_providers.dart';
import '../../actions/domain/action_item.dart';
import '../../extraction/application/action_review_state.dart'
    show sourceReadyForExtraction;
import '../application/capture_controller.dart';
import '../application/ocr_script_controller.dart';
import '../domain/source_item.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_l10n.dart';

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
    final l10n = AppL10n.of(context);
    final sources = ref.watch(sourcesProvider);
    final item = sources.value?.where((s) => s.id == id).firstOrNull;

    // What this capture already became. Library has derived this since V2 so a
    // card could say "Action created" instead of inviting the user to review
    // the same notice twice; this screen was still asking them to.
    final created = <ActionItem>[
      for (final action in ref.watch(actionsStreamProvider).value ??
          const <ActionItem>[])
        if (action.sourceId == id) action,
    ];

    return AmbientBackground(
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(l10n.sourceWhatWeRead),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (item != null)
            IconButton(
              tooltip: l10n.sourceDelete,
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmDelete(context, ref),
            ),
        ],
      ),
      body: item == null
          ? ErrorView(message: l10n.sourceGone)
          : _Body(item: item, created: created),
      // The bridge into review: the one production entry point to
      // extraction. Only offered once the capture actually has text to
      // interpret — the review flow's manual path covers everything else.
      bottomNavigationBar: item != null && sourceReadyForExtraction(item)
          ? _ReviewBar(id: id, created: created)
          : null,
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.sourceDeleteTitle),
        content: Text(l10n.sourceDeleteBody),
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

    if (confirmed != true || !context.mounted) return;
    await ref.read(sourcesProvider.notifier).delete(id);
    if (context.mounted) context.pop();
  }
}

class _ReviewBar extends StatelessWidget {
  const _ReviewBar({required this.id, this.created = const []});

  final String id;

  /// Actions already created from this capture.
  final List<ActionItem> created;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final done = created.isNotEmpty;

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
          // Once this capture has become something, opening that thing is what
          // the user wants; making another is still available and no longer
          // the loudest control on the screen.
          child: done
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      onPressed: () =>
                          context.push(Routes.action(created.first.id)),
                      child: Text(
                        created.length == 1
                            ? l10n.sourceOpenAction
                            : l10n.sourceOpenActions(created.length),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push(Routes.sourceReview(id)),
                      child: Text(l10n.sourceCreateAnother),
                    ),
                  ],
                )
              : FilledButton(
                  onPressed: () => context.push(Routes.sourceReview(id)),
                  child: Text(l10n.sourceCreateAction),
                ),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.item, this.created = const []});

  final SourceItem item;
  final List<ActionItem> created;

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
        _StateSection(item: item, created: created),
        if (created.isNotEmpty) ...[
          const SizedBox(height: Space.xxl),
          _CreatedActions(actions: created),
        ],
        // Documents too, not only captures with text. A PDF cannot go through
        // the local review flow — there is nothing on this device to review —
        // so the tools are the *only* thing to do with one. Without this a
        // document was a dead end.
        if (item.hasText || item.hasDocument) ...[
          const SizedBox(height: Space.xxl),
          _IntelligenceStrip(item: item),
        ],
      ],
    );
  }
}

/// Contextual entry points into the Intelligence tools.
///
/// **Why these three and not a menu of fifteen.** The tools shown are chosen
/// from local signals in the text Action already has — a long document suggests
/// summarising, a letter suggests a reply, several dates suggest looking for
/// obligations. Action never asks the AI which AI button to render: that would
/// spend the user's money to draw a menu, and would need the document sent
/// before the user had chosen to send anything.
class _IntelligenceStrip extends StatelessWidget {
  const _IntelligenceStrip({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final tools = recommendedFor(item);
    if (tools.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppL10n.of(context).sourceDoMore, style: text.titleSmall),
        const SizedBox(height: Space.md),
        Wrap(
          spacing: Space.sm,
          runSpacing: Space.sm,
          children: [
            for (final tool in tools)
              ActionChip(
                label: Text(tool.title),
                onPressed: () => context.push(
                  Routes.tool(tool.id, sourceId: item.id),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _ProvenanceStrip extends StatelessWidget {
  const _ProvenanceStrip({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    final icon = switch (item.type) {
      SourceType.photo => Icons.photo_camera_outlined,
      SourceType.gallery => Icons.image_outlined,
      SourceType.pastedText => Icons.text_snippet_outlined,
      SourceType.document => Icons.picture_as_pdf_outlined,
    };

    return Row(
      children: [
        Icon(icon, size: 18, color: colors.textTertiary),
        const SizedBox(width: Space.sm),
        Expanded(
          child: Text(
            l10n.sourceMeta(
              item.type.provenanceIn(l10n),
              DateFormat(l10n.sourceCapturedAtFormat, l10n.localeName)
                  .format(item.capturedAt),
            ),
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
        Text(_describe(AppL10n.of(context), item), style: text.labelSmall?.copyWith(
          color: colors.textTertiary,
        )),
      ],
    );
  }

  static String _describe(AppL10n l10n, SourceItem item) {
    final parts = <String>[];
    if (item.imageWidth != null && item.imageHeight != null) {
      parts.add(l10n.sourceDimensions(item.imageWidth!, item.imageHeight!));
    }
    if (item.byteSize != null) {
      parts.add(l10n.sourceKilobytes((item.byteSize! / 1024).round()));
    }
    // Naming the original format makes the re-encode visible rather than
    // something the app quietly did to the user's file.
    if (item.originalFormat != null && item.originalByteSize != null) {
      final was = (item.originalByteSize! / 1024).round();
      parts.add(l10n.sourceConvertedFrom(
        item.originalFormat!.toUpperCase(),
        '$was',
      ));
    }
    return parts.join(' · ');
  }
}

class _StateSection extends ConsumerWidget {
  const _StateSection({required this.item, this.created = const []});

  final SourceItem item;
  final List<ActionItem> created;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (item.state) {
      SourceProcessingState.pending ||
      SourceProcessingState.processing =>
        const _Processing(),
      SourceProcessingState.failed => _Failed(item: item),
      // A document before an empty-text check: a PDF legitimately has no text
      // on this device, and falling through to "No text found" would tell the
      // user their statement was unreadable when nothing has tried to read it.
      SourceProcessingState.ready when item.hasDocument =>
        _DocumentPanel(item: item),
      SourceProcessingState.ready => item.hasText
          ? _TextPanel(item: item, interpreted: created.isNotEmpty)
          : _NoTextFound(item: item),
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
        Text(AppL10n.of(context).stageReadingPreview,
            style: text.bodyMedium),
      ],
    );
  }
}

class _TextPanel extends StatelessWidget {
  const _TextPanel({required this.item, this.interpreted = false});

  final SourceItem item;

  /// Whether something has already been made from this capture.
  final bool interpreted;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(l10n.sourceTextFound, style: text.titleSmall),
            const Spacer(),
            if (item.ocr != null)
              Text(
                l10n.sourceOcrStats(
                  item.ocr!.lineCount,
                  item.ocr!.durationMs,
                ),
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
          // Saying "nothing has been interpreted yet" over a capture that has
          // already become an Action is simply false, and it was what the
          // screen said after the user had just finished doing exactly that.
          interpreted
              ? l10n.sourceReadExplainer
              : l10n.sourceNotInterpreted,
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
    final l10n = AppL10n.of(context);
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.stageNoText, style: text.titleSmall),
        const SizedBox(height: Space.sm),
        Text(l10n.sourceNoTextExplainer, style: text.bodyMedium),
        const SizedBox(height: Space.sm),
        // The explainer above lists three causes; this names which one the
        // user can actually do something about, and what it is set to right
        // now. "A script this device cannot read" is only useful advice if the
        // reader can find out which script it is currently reading.
        Text(
          l10n.ocrScriptNoTextHint(
            ref.watch(ocrScriptProvider).labelIn(l10n),
          ),
          style: text.bodySmall?.copyWith(color: context.colors.textSecondary),
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
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.error_outline_rounded, size: 18, color: colors.danger),
            const SizedBox(width: Space.sm),
            Text(l10n.sourceReadFailed, style: text.titleSmall),
          ],
        ),
        const SizedBox(height: Space.sm),
        Text(
          item.failureReason ?? l10n.sourceReadFailedReason,
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
            label: Text(AppL10n.of(context).sourceTryReadingAgain),
          ),
        const SizedBox(height: Space.sm),
        FilledButton(
          onPressed: () => _enterManually(context, ref),
          child: Text(AppL10n.of(context).sourceTypeInstead),
        ),
      ],
    );
  }

  Future<void> _enterManually(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context);
    final controller = TextEditingController(text: item.pastedText ?? '');

    final saved = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      // Through AppSheet like every other sheet in the app. Day 17 made the
      // sheet surface glass, and it is AppSheet that paints it — a sheet
      // built by hand would now come out transparent.
      builder: (sheetContext) => AppSheet(
        title: l10n.sourceTypeWhatItSays,
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
                decoration: InputDecoration(
                  hintText: l10n.sourceTypeHint,
                ),
              ),
              const SizedBox(height: Space.lg),
              FilledButton(
                onPressed: () =>
                    Navigator.of(sheetContext).pop(controller.text),
                child: Text(l10n.commonSave),
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


/// What this capture already became.
///
/// The screen used to end at "nothing has been interpreted yet" no matter how
/// many Actions had come out of the capture — so the last thing a user saw
/// after finishing the whole flow was an invitation to start it again. The
/// link back is the other half: a capture and the Action made from it should
/// each be one tap from the other.
class _CreatedActions extends StatelessWidget {
  const _CreatedActions({required this.actions});

  final List<ActionItem> actions;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: 18,
              color: colors.confidenceConfirmed,
            ),
            const SizedBox(width: Space.sm),
            // Expanded, because the plural form is longer than the singular
            // and overflowed a 380px row by 8px — which is every narrow phone,
            // and every phone once the text scale goes up.
            Expanded(
              child: Text(
                actions.length == 1
                    ? l10n.sourceMadeFromThis
                    : l10n.sourceMadeFromThisCount(actions.length),
                style: text.titleSmall,
              ),
            ),
          ],
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(action.title, style: text.titleSmall),
                            if (action.status == ActionStatus.completed) ...[
                              const SizedBox(height: Space.xxs),
                              Text(
                                l10n.commonDone,
                                style: text.labelSmall?.copyWith(
                                  color: colors.confidenceConfirmed,
                                ),
                              ),
                            ],
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
            ),
          ),
      ],
    );
  }
}


/// What Action holds for a PDF, and what it has not done with it.
///
/// The honest part is the last line. Action has copied the file and read its
/// structure; it has not read its contents, and it will not until the user
/// asks for a tool that does — at which point the document goes to their own
/// provider, which is a different thing again and disclosed separately.
class _DocumentPanel extends StatelessWidget {
  const _DocumentPanel({required this.item});

  final SourceItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final pages = item.pageCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.sourceTheDocument, style: text.titleSmall),
        const SizedBox(height: Space.md),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Space.lg),
          decoration: BoxDecoration(
            color: colors.surfaceSunken,
            borderRadius: Radii.rMd,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.brandSubtle,
                  borderRadius: Radii.rSm,
                ),
                child: Icon(
                  Icons.picture_as_pdf_outlined,
                  color: colors.brand,
                  size: 22,
                ),
              ),
              const SizedBox(width: Space.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PDF', style: text.titleSmall),
                    const SizedBox(height: Space.xxs),
                    Text(
                      // "Page count unknown" rather than a guess. Modern PDFs
                      // commonly compress the page tree out of sight, and a
                      // confident wrong number would end up in the sentence
                      // that says what a run will cost.
                      [
                        if (pages != null)
                          l10n.sourcePageCount(pages)
                        else
                          l10n.sourcePageCountUnknown,
                        if (item.byteSize != null)
                          formatBytes(item.byteSize!),
                      ].join(' · '),
                      style: text.bodySmall
                          ?.copyWith(color: colors.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Space.md),
        Text(l10n.sourceDocumentNotRead, style: text.bodySmall),
      ],
    );
  }
}
