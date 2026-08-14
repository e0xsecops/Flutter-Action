import 'package:flutter/material.dart';

/// Entry point for the three supported inputs.
///
/// The options are listed but not yet wired — picking, OCR, and extraction are
/// later steps. They are shown disabled rather than hidden so the intended
/// surface is visible on device while the core loop is being built.
class CaptureScreen extends StatelessWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Add')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          const _CaptureOption(
            icon: Icons.photo_camera_outlined,
            title: 'Take a photo',
            subtitle: 'Capture a document or notice with the camera',
          ),
          const _CaptureOption(
            icon: Icons.image_outlined,
            title: 'Choose an image or PDF',
            subtitle: 'Pick a screenshot or file already on this device',
          ),
          const _CaptureOption(
            icon: Icons.content_paste_outlined,
            title: 'Paste text',
            subtitle: 'Paste an email, message, or notice',
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Text(
              'Input handling is not wired up yet.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CaptureOption extends StatelessWidget {
  const _CaptureOption({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
