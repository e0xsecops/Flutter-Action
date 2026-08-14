import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/router.dart';
import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/capture_controller.dart';
import '../domain/source_item.dart';
import 'preview_screen.dart';

enum CaptureIntent { camera, gallery, pasteText }

/// Entry point for every capture. Shown as a modal sheet from Home so the
/// chooser never costs a screen transition, while everything after it is a real
/// route — which is what keeps Android back predictable and lets a half-finished
/// capture survive a process death.
Future<void> startCapture(BuildContext context, WidgetRef ref) async {
  final intent = await showModalBottomSheet<CaptureIntent>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const _CaptureSheet(),
  );

  if (intent == null || !context.mounted) return;

  switch (intent) {
    case CaptureIntent.pasteText:
      context.push(Routes.captureText);

    case CaptureIntent.camera:
      await _pickThenPreview(
        context,
        ref,
        () => ref.read(capturePickerProvider).fromCamera(),
        SourceType.photo,
      );

    case CaptureIntent.gallery:
      await _pickThenPreview(
        context,
        ref,
        () => ref.read(capturePickerProvider).fromGallery(),
        SourceType.gallery,
      );
  }
}

Future<void> _pickThenPreview(
  BuildContext context,
  WidgetRef ref,
  Future<XFile?> Function() pick,
  SourceType type,
) async {
  XFile? file;
  try {
    file = await pick();
  } on Object {
    // Most commonly a device with no camera, or a permission the user declined
    // in the system UI. Neither is exceptional enough to interrupt them with a
    // dialog.
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Couldn't open that. Try another way.")),
      );
    }
    return;
  }

  // Null means the user backed out of the picker, which is a normal outcome.
  if (file == null || !context.mounted) return;

  context.push(
    Routes.capturePreview,
    extra: PreviewArgs(path: file.path, type: type),
  );
}

class _CaptureSheet extends StatelessWidget {
  const _CaptureSheet();

  @override
  Widget build(BuildContext context) {
    return AppSheet(
      title: 'Add something',
      subtitle: 'Hand Action anything you would rather not read through.',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.md, 0, Space.md, Space.sm),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Option(
              icon: Icons.photo_camera_outlined,
              title: 'Take a photo',
              subtitle: 'A letter, bill, or notice in front of you',
              intent: CaptureIntent.camera,
            ),
            _Option(
              icon: Icons.image_outlined,
              title: 'Choose an image',
              subtitle: 'A screenshot or photo already on this device',
              intent: CaptureIntent.gallery,
            ),
            _Option(
              icon: Icons.text_snippet_outlined,
              title: 'Paste text',
              subtitle: 'An email, message, or notice',
              intent: CaptureIntent.pasteText,
            ),
          ],
        ),
      ),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.intent,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final CaptureIntent intent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: Space.xs),
      child: InkWell(
        borderRadius: Radii.rMd,
        onTap: () => Navigator.of(context).pop(intent),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Space.sm,
            vertical: Space.md,
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.brandSubtle,
                  borderRadius: Radii.rMd,
                ),
                child: Icon(icon, color: colors.brand, size: 22),
              ),
              const SizedBox(width: Space.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: text.titleSmall),
                    const SizedBox(height: Space.xxs),
                    Text(subtitle, style: text.bodySmall),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: colors.textTertiary, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
