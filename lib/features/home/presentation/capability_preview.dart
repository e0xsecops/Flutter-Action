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
///
/// **Why the promises are safety keys.** Three of the four blurbs are the
/// first thing a new user is told about what automated reading does, and each
/// one is deliberately weak: Action *reads* and *finds*, it *works out* what
/// something is, and nothing becomes a task until the person has seen the
/// evidence and said yes. Those verbs are the product's position, so the ARB
/// entries carry `SAFETY:` descriptions naming the clauses a translation may
/// not drop.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../l10n/casing.dart';
import '../../../l10n/gen/app_l10n.dart';
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
///
/// Built from the bundle on each build rather than held in a top-level `const`
/// list: the titles and blurbs are translated now, and a `const` cannot depend
/// on the locale. The icons are the only part of a row that is the same in
/// every language.
List<_Capability> _capabilitiesFor(AppL10n l10n) => [
      _Capability(
        icon: Icons.description_outlined,
        title: l10n.todayCapabilityDocumentTitle,
        blurb: l10n.todayCapabilityDocumentBlurb,
      ),
      _Capability(
        icon: Icons.photo_outlined,
        title: l10n.todayCapabilityScreenshotTitle,
        blurb: l10n.todayCapabilityScreenshotBlurb,
      ),
      _Capability(
        icon: Icons.notes_rounded,
        title: l10n.todayCapabilityTextTitle,
        blurb: l10n.todayCapabilityTextBlurb,
      ),
      _Capability(
        icon: Icons.fact_check_outlined,
        title: l10n.todayCapabilityConfirmTitle,
        blurb: l10n.todayCapabilityConfirmBlurb,
      ),
    ];

class CapabilityPreview extends ConsumerWidget {
  const CapabilityPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final l10n = AppL10n.of(context);

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
          // The eyebrow is stored in sentence case and uppercased here, not
          // stored shouting. Dart's `toUpperCase` maps Turkish dotted `i` to
          // `I`, which a Turkish reader reads as a misspelling; `eyebrowCase`
          // is the helper that knows the exception, and in the scripts with no
          // uppercase at all it is a no-op and the style carries on size,
          // weight and tracking. `header: true` matches the QuickStart eyebrow
          // on the same screen, so a screen reader announces both as headings.
          Semantics(
            header: true,
            child: Text(
              eyebrowCase(l10n.todayCapabilityHeading, l10n.localeName),
              style: text.labelSmall?.copyWith(
                color: colors.textTertiary,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: Space.md),

          for (final capability in _capabilitiesFor(l10n)) ...[
            _CapabilityRow(capability: capability),
            const SizedBox(height: Space.md),
          ],

          const SizedBox(height: Space.xs),
          FilledButton.icon(
            onPressed: () => startCapture(context, ref),
            icon: const Icon(Icons.add_rounded, size: 20),
            // The same label the raised centre control carries, deliberately:
            // this button does the same thing, and a second phrasing for it
            // would read as a second feature.
            label: Text(l10n.navCapture),
          ),
          const SizedBox(height: Space.sm),
          OutlinedButton(
            onPressed: () => context.go(Routes.studio),
            child: Text(l10n.todayCapabilityExploreIntelligence),
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
