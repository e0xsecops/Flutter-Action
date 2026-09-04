import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/capture_controller.dart';
import '../domain/source_item.dart';
import '../../../l10n/gen/app_l10n.dart';

class PreviewArgs {
  const PreviewArgs({required this.path, required this.type});

  final String path;
  final SourceType type;
}

/// Confirm-or-retake before anything is kept.
///
/// At this point the file is still where the picker left it, in OS temp
/// storage; this app has written nothing. Backing out therefore stores no
/// capture. That is a statement about the capture flow only — it says nothing
/// about what later stages do, and remote extraction will need its own explicit
/// disclosure when it is introduced.
class PreviewScreen extends ConsumerStatefulWidget {
  const PreviewScreen({required this.args, super.key});

  final PreviewArgs args;

  @override
  ConsumerState<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends ConsumerState<PreviewScreen> {
  late String _path = widget.args.path;
  bool _busy = false;

  Future<void> _retake() async {
    final picker = ref.read(capturePickerProvider);
    final file = widget.args.type == SourceType.photo
        ? await picker.fromCamera()
        : await picker.fromGallery();
    if (file == null || !mounted) return;
    setState(() => _path = file.path);
  }

  Future<void> _keep() async {
    setState(() => _busy = true);
    try {
      final item = await ref
          .read(sourcesProvider.notifier)
          .addImage(_path, widget.args.type);
      if (!mounted) return;
      // Reset to Home first so the capture stack is gone, then open the
      // capture: back from here returns to the inbox, not into the picker.
      context.go(Routes.home);
      context.push(Routes.source(item.id));
    } on Object {
      if (!mounted) return;
      setState(() => _busy = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppL10n.of(context).previewSaveFailed)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.previewTitle),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _busy ? null : () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: Space.page),
              decoration: BoxDecoration(
                color: colors.surfaceSunken,
                borderRadius: Radii.rLg,
              ),
              // Over the image: a white page would otherwise run to the panel
              // edge with nothing marking where the capture stops.
              foregroundDecoration: BoxDecoration(
                borderRadius: Radii.rLg,
                border: Border.all(color: colors.border, width: Strokes.hairline),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.file(
                File(_path),
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => Center(
                  child: Text(
                    l10n.previewImageFailed,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Space.page,
              Space.xl,
              Space.page,
              Space.md,
            ),
            child: Text(
              l10n.previewHint,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Space.page,
                0,
                Space.page,
                Space.lg,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _busy ? null : _retake,
                      child: Text(l10n.previewRetake),
                    ),
                  ),
                  const SizedBox(width: Space.md),
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: _busy ? null : _keep,
                      child: _busy
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(l10n.commonContinue),
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
}
