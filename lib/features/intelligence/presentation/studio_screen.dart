/// Intelligence Studio — a workspace, not a catalogue.
///
/// **What was wrong with the first version.** It listed fifteen tools as
/// fifteen identical rounded rectangles with no iconography, differentiated
/// only by their titles, under grey uppercase labels carrying the same visual
/// weight as any other caption. It read as a settings screen for a feature
/// rather than a place you would choose to work.
///
/// **What changed.** A hero that says what this is for and what state the
/// connection is in. Every tool has a mark chosen by intent — what it does to
/// your material — and every category has a colour, so the family is legible
/// before the title is read. Recommendations come first when there is something
/// to recommend about, decided from local signals; Action never asks a model
/// which model button to draw.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/action_shell.dart';
import '../../../app/router.dart';
import '../../../design/ambient/ambient_background.dart';
import '../../../design/components/glass_surface.dart';
import '../../../design/components/readable_width.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_l10n.dart';
import '../../capture/application/capture_controller.dart';
import '../../capture/domain/source_item.dart';
import '../application/intelligence_context.dart';
import '../application/intelligence_providers.dart';
import '../domain/intelligence_tool.dart';
import '../domain/tool_registry.dart';
import 'connect_provider_sheet.dart';
import 'tool_glyphs.dart';

class StudioScreen extends ConsumerWidget {
  const StudioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context);
    final config = ref.watch(aiProviderConfigProvider);
    final recents = ref.watch(recentToolsProvider);
    final sources = ref.watch(sourcesProvider).value ?? const <SourceItem>[];

    // A stored id from an older build resolves to null and simply drops out.
    final recentTools = [for (final id in recents) ?ToolRegistry.byId(id)];

    // Recommendations come from the most recent capture that has text — a real
    // thing the user has, read with local signals only.
    final newest = sources.where((s) => s.hasText).fold<SourceItem?>(
          null,
          (best, s) =>
              best == null || s.capturedAt.isAfter(best.capturedAt) ? s : best,
        );
    final recommended = newest == null
        ? const <IntelligenceToolDefinition>[]
        : recommendedFor(newest);

    return SafeArea(
      bottom: false,
      child: ReadableWidth.list(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _StudioHero(connected: config != null)),

            if (recommended.isNotEmpty) ...[
              _Heading(
                label: l10n.studioSuggested,
                icon: Icons.auto_awesome_motion_outlined,
                colour: context.colors.brand,
              ),
              _ToolList(tools: recommended),
            ],

            if (recentTools.isNotEmpty) ...[
              _Heading(
                label: l10n.studioRecentlyUsed,
                icon: Icons.history_rounded,
                colour: context.colors.textSecondary,
              ),
              _ToolList(tools: recentTools),
            ],

            for (final category in IntelligenceCategory.values) ...[
              _Heading(
                label: category.labelIn(l10n),
                blurb: category.blurbIn(l10n),
                icon: iconForCategory(category),
                colour: colourForCategory(category, context.colors),
                count: ToolRegistry.inCategory(category).length,
              ),
              _ToolList(tools: ToolRegistry.inCategory(category)),
            ],

            const SliverToBoxAdapter(
              child: SizedBox(height: actionNavBarClearance + Space.lg),
            ),
          ],
        ),
      ),
    );
  }
}

/// The hero. Says what this place is, and what state the connection is in.
class _StudioHero extends ConsumerWidget {
  const _StudioHero({required this.connected});

  final bool connected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final l10n = AppL10n.of(context);
    final localCount = ToolRegistry.local.length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.xl,
        Space.page,
        Space.sm,
      ),
      child: AmbientGlow(
        child: GlassSurface(
          intensity: GlassIntensity.hero,
          padding: const EdgeInsets.all(Space.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: connected
                          ? colors.confidenceConfirmed
                          : colors.textTertiary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: Space.sm),
                  Text(
                    connected ? l10n.studioReady : l10n.studioNotConnected,
                    style: text.labelSmall?.copyWith(
                      color: connected
                          ? colors.confidenceConfirmed
                          : colors.textTertiary,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Space.md),
              Text(l10n.studioHeroTitle, style: text.headlineSmall),
              const SizedBox(height: Space.xs),
              Text(
                connected
                    ? l10n.studioConnectedBlurb
                    // Counted, never spelled out as a constant. The registry
                    // has grown twice already and a hardcoded "fifteen"
                    // outlived both, telling the user something the screen
                    // below it visibly contradicted.
                    : l10n.studioDisconnectedBlurb(ToolRegistry.all.length),
                style: text.bodyMedium,
              ),

              if (!connected) ...[
                const SizedBox(height: Space.lg),
                FilledButton(
                  onPressed: () => showConnectProviderSheet(context),
                  child: Text(l10n.studioConnectAi),
                ),
                const SizedBox(height: Space.xs),
                TextButton(
                  onPressed: () => context.push(Routes.settingsIntelligence),
                  child: Text(l10n.studioHowItWorks),
                ),
                const SizedBox(height: Space.sm),
                // The one thing a disconnected user can act on immediately.
                // Saying it here stops the screen reading as entirely gated.
                Row(
                  children: [
                    Icon(
                      Icons.phone_android,
                      size: 15,
                      color: colors.confidenceConfirmed,
                    ),
                    const SizedBox(width: Space.xs),
                    Expanded(
                      child: Text(
                        l10n.studioLocalCount(localCount),
                        style: text.bodySmall?.copyWith(
                          color: colors.confidenceConfirmed,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// A section heading with its own mark and colour.
class _Heading extends StatelessWidget {
  const _Heading({
    required this.label,
    required this.icon,
    required this.colour,
    this.blurb,
    this.count,
  });

  final String label;
  final String? blurb;
  final IconData icon;
  final Color colour;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Space.page,
          Space.xxl,
          Space.page,
          Space.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: colour),
                const SizedBox(width: Space.sm),
                Flexible(
                  child: Text(
                    label.toUpperCase(),
                    style: text.labelLarge?.copyWith(
                      color: colors.textPrimary,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                if (count != null) ...[
                  const SizedBox(width: Space.sm),
                  Text(
                    '$count',
                    style: text.labelSmall?.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ],
              ],
            ),
            if (blurb != null) ...[
              const SizedBox(height: Space.xxs),
              Text(blurb!, style: text.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}

class _ToolList extends StatelessWidget {
  const _ToolList({required this.tools});

  final List<IntelligenceToolDefinition> tools;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: tools.length,
      separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Space.page),
        child: _ToolCard(tool: tools[i]),
      ),
    );
  }
}

/// A tool, as a card you can tell apart from the one above it.
///
/// Solid rather than glass: these live in a long scrolling list, and a
/// BackdropFilter per row is exactly the cost Day 16 removed.
class _ToolCard extends StatelessWidget {
  const _ToolCard({required this.tool});

  final IntelligenceToolDefinition tool;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final l10n = AppL10n.of(context);
    final tone = colourForCategory(tool.category, colors);

    return Semantics(
      button: true,
      // Name and purpose together: a screen reader landing on fifteen of these
      // should hear what each one does, not fifteen titles.
      label: tool.isLocal
          ? l10n.studioToolSemanticsLocal(tool.title, tool.shortDescription)
          : l10n.studioToolSemantics(tool.title, tool.shortDescription),
      child: Material(
      color: colors.surfaceElevated,
      borderRadius: Radii.rLg,
      child: InkWell(
        onTap: () => context.push(Routes.tool(tool.id)),
        borderRadius: Radii.rLg,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Radii.rLg,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          padding: const EdgeInsets.all(Space.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: tone.withValues(alpha: 0.10),
                  borderRadius: Radii.rMd,
                ),
                child: Icon(iconForGlyph(tool.glyph), size: 19, color: tone),
              ),
              const SizedBox(width: Space.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tool.title, style: text.titleSmall),
                    const SizedBox(height: Space.xxs),
                    Text(tool.shortDescription, style: text.bodySmall),
                  ],
                ),
              ),
              // Whether this tool needs a provider is the single most useful
              // thing to know before tapping it, so it is on the card rather
              // than discovered on the next screen.
              if (tool.isLocal)
                Padding(
                  padding: const EdgeInsets.only(
                    left: Space.sm,
                    top: Space.xxs,
                  ),
                  child: Tooltip(
                    message: l10n.studioRunsOnThisDevice,
                    child: Icon(
                      Icons.phone_android,
                      size: 15,
                      color: colors.confidenceConfirmed,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
