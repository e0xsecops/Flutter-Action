import 'dart:async';

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
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';

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
  await runCaptureIntent(context, ref, intent);
}

/// Carries out one capture intent, without the chooser.
///
/// Split out of [startCapture] so a shortcut can go straight to the camera or
/// the paste screen. The sheet is a chooser, not a step: making Today's quick
/// tiles open it and then require a second tap would be a chooser to choose
/// something the user already chose.
Future<void> runCaptureIntent(
  BuildContext context,
  WidgetRef ref,
  CaptureIntent intent,
) async {
  // Which of the three ways in was used, and nothing else. Never the file,
  // never its path, never what it turns out to contain.
  final how = switch (intent) {
    CaptureIntent.pasteText => 'paste',
    CaptureIntent.camera => 'camera',
    CaptureIntent.gallery => 'gallery',
  };
  final analytics = ref.read(appAnalyticsProvider);
  unawaited(analytics.log(
    AnalyticsEvents.captureStarted,
    parameters: {AnalyticsParams.captureType: how},
  ));

  switch (intent) {
    case CaptureIntent.pasteText:
      context.push(Routes.captureText);

    case CaptureIntent.camera:
      await _pickThenPreview(
        context,
        ref,
        () => ref.read(capturePickerProvider).fromCamera(),
        SourceType.photo,
        how,
      );

    case CaptureIntent.gallery:
      await _pickThenPreview(
        context,
        ref,
        () => ref.read(capturePickerProvider).fromGallery(),
        SourceType.gallery,
        how,
      );
  }
}

Future<void> _pickThenPreview(
  BuildContext context,
  WidgetRef ref,
  Future<XFile?> Function() pick,
  SourceType type,
  String how,
) async {
  final analytics = ref.read(appAnalyticsProvider);
  XFile? file;
  try {
    file = await pick();
  } on Object {
    unawaited(analytics.log(
      AnalyticsEvents.captureFailed,
      parameters: {AnalyticsParams.captureType: how},
    ));
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

  // Null means the user backed out of the picker, which is a normal outcome
  // and not a failure worth recording.
  if (file == null || !context.mounted) return;

  unawaited(analytics.log(
    AnalyticsEvents.captureSucceeded,
    parameters: {AnalyticsParams.captureType: how},
  ));

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
      title: 'Capture something',
      subtitle: 'Hand Action anything you would rather not read through.',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Space.page,
          0,
          Space.page,
          Space.sm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Option(
              icon: Icons.photo_camera_rounded,
              title: 'Take a photo',
              subtitle: 'A letter, bill or notice in front of you',
              intent: CaptureIntent.camera,
              primary: true,
            ),
            const SizedBox(height: Space.sm),
            _Option(
              icon: Icons.image_rounded,
              title: 'Choose an image',
              subtitle: 'A screenshot or photo already on this device',
              intent: CaptureIntent.gallery,
            ),
            const SizedBox(height: Space.sm),
            _Option(
              icon: Icons.notes_rounded,
              title: 'Paste text',
              subtitle: 'An email, message or notice',
              intent: CaptureIntent.pasteText,
            ),
            const SizedBox(height: Space.lg),
            const _PrivacyNote(),
          ],
        ),
      ),
    );
  }
}

/// One way in.
///
/// A card rather than a list row. On device the row version had a real
/// legibility failure — a translucent sheet over a light page washed
/// `textSecondary` out until the subtitles were barely readable — and a row of
/// icon/title/subtitle/chevron reads as a settings list rather than as three
/// distinct things you could do. Each option now sits on its own solid surface,
/// which fixes the contrast and gives the three of them equal presence.
class _Option extends StatelessWidget {
  const _Option({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.intent,
    this.primary = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final CaptureIntent intent;

  /// The camera gets slightly more weight: it is the one that turns something
  /// physically in front of you into something Action can work with, which is
  /// the product in one gesture.
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Semantics(
      button: true,
      label: '$title. $subtitle',
      child: Material(
        // Solid, not glass. The sheet itself is the glass; a translucent card
        // on a translucent sheet is two read-backs and no contrast.
        color: primary ? colors.brandSubtle : colors.surfaceElevated,
        borderRadius: Radii.rLg,
        child: InkWell(
          borderRadius: Radii.rLg,
          onTap: () => Navigator.of(context).pop(intent),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: Radii.rLg,
              border: Border.all(
                color: primary ? colors.brand.withValues(alpha: 0.28) : colors.border,
                width: Strokes.hairline,
              ),
            ),
            padding: const EdgeInsets.all(Space.lg),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: primary
                        ? colors.brand
                        : colors.brand.withValues(alpha: 0.10),
                    borderRadius: Radii.rMd,
                  ),
                  child: Icon(
                    icon,
                    color: primary ? colors.onBrand : colors.brand,
                    size: 23,
                  ),
                ),
                const SizedBox(width: Space.lg),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: text.titleSmall),
                      const SizedBox(height: Space.xxs),
                      Text(
                        subtitle,
                        // textSecondary on a solid surface, which is the
                        // contrast this copy was designed for.
                        style: text.bodySmall,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: colors.textTertiary,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The promise that makes capturing safe to do.
///
/// Said here rather than only in the Privacy Centre because this is the moment
/// the user is about to hand the app a document, and it is the question they
/// would ask if there were anyone to ask.
class _PrivacyNote extends StatelessWidget {
  const _PrivacyNote();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.lock_outline_rounded, size: 15, color: colors.textSecondary),
        const SizedBox(width: Space.sm),
        Expanded(
          child: Text(
            'Captures stay on this device. Nothing is analysed online until you '
            'ask for it.',
            // Secondary, not tertiary. This is a promise the product is
            // making, not a label on something else — and a privacy claim
            // nobody can read is not a privacy claim.
            style: text.bodySmall?.copyWith(color: colors.textSecondary),
          ),
        ),
      ],
    );
  }
}
