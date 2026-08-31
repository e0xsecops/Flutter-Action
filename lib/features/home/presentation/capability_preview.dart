/// What Action can actually do, shown to someone who has not used it yet.
///
/// **The problem this replaces.** The old empty Home said "Nothing needs your
/// attention" over a grey inbox glyph, and roughly half the screen was blank.
/// It told a new user what was *absent*. Nothing anywhere in the app said that
/// it reads documents, finds deadlines, keeps the evidence for what it found,
/// or has fifteen intelligence tools behind it. The capability was real and
/// completely invisible.
///
/// So the empty state is the pitch: four things Action does, in the user's
/// words, each one tappable and each one leading somewhere real. No marketing
/// copy, no illustration of a person at a desk, and nothing claimed that the
/// app cannot do.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../capture/presentation/capture_sheet.dart';

/// One thing Action does.
class _Capability {
  const _Capability({
    required this.icon,
    required this.title,
    required this.blurb,
  });

  final IconData icon;
  final String title;
  final String blurb;
}

/// Four, not ten. A list long enough to skim is a list nobody reads.
const _capabilities = [
  _Capability(
    icon: Icons.description_outlined,
    title: 'A letter or bill',
    blurb: 'Action reads it and finds the deadline, the amount and the '
        'reference.',
  ),
  _Capability(
    icon: Icons.photo_outlined,
    title: 'A screenshot',
    blurb: 'Turn a message you would otherwise forget into something you can '
        'act on.',
  ),
  _Capability(
    icon: Icons.notes_rounded,
    title: 'Some text',
    blurb: 'Paste anything. Action works out what it is and what it asks of '
        'you.',
  ),
  _Capability(
    icon: Icons.fact_check_outlined,
    title: 'You confirm everything',
    blurb: 'Nothing becomes a task until you have seen the evidence and said '
        'yes.',
  ),
];

class CapabilityPreview extends ConsumerWidget {
  const CapabilityPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.sm,
        Space.page,
        Space.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WHAT ACTION HANDLES',
            style: text.labelSmall?.copyWith(
              color: colors.textTertiary,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Space.md),

          for (final capability in _capabilities) ...[
            _CapabilityRow(capability: capability),
            const SizedBox(height: Space.md),
          ],

          const SizedBox(height: Space.xs),
          FilledButton.icon(
            onPressed: () => startCapture(context, ref),
            icon: const Icon(Icons.add_rounded, size: 20),
            label: const Text('Capture something'),
          ),
          const SizedBox(height: Space.sm),
          OutlinedButton(
            onPressed: () => context.go(Routes.studio),
            child: const Text('Explore Intelligence'),
          ),
        ],
      ),
    );
  }
}

class _CapabilityRow extends StatelessWidget {
  const _CapabilityRow({required this.capability});

  final _Capability capability;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: colors.brandSubtle,
            borderRadius: Radii.rMd,
          ),
          child: Icon(capability.icon, size: 18, color: colors.brand),
        ),
        const SizedBox(width: Space.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(capability.title, style: text.titleSmall),
              const SizedBox(height: Space.xxs),
              Text(capability.blurb, style: text.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
