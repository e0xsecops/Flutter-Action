/// Intelligence Studio.
///
/// **Not a grid of fifteen equal cards.** Fifteen things presented at one
/// weight is a control panel, and a control panel is what a user closes. So the
/// page leads with what they used last and what runs without setup, then the
/// five intents, each collapsed to its own heading.
///
/// With no provider connected this is an invitation, never an error, and it
/// still has two working tools in it.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/components/glass_surface.dart';
import '../../../design/components/readable_width.dart';
import '../../../design/components/section_header.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/intelligence_providers.dart';
import '../domain/intelligence_tool.dart';
import '../domain/tool_registry.dart';
import 'connect_provider_sheet.dart';

class StudioScreen extends ConsumerWidget {
  const StudioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(aiProviderConfigProvider);
    final recents = ref.watch(recentToolsProvider);

    // A stored id from an older build resolves to null and simply drops out.
    final recentTools = [
      for (final id in recents) ?ToolRegistry.byId(id),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Intelligence')),
      body: SafeArea(
        top: false,
        child: ReadableWidth.list(
          child: CustomScrollView(
            slivers: [
              if (config == null)
                const SliverToBoxAdapter(child: _ConnectInvitation()),

              if (recentTools.isNotEmpty) ...[
                const SliverToBoxAdapter(
                  child: SectionHeader(title: 'Recently used'),
                ),
                _ToolList(tools: recentTools),
              ],

              if (config == null) ...[
                const SliverToBoxAdapter(
                  child: SectionHeader(title: 'Works without setup'),
                ),
                _ToolList(tools: ToolRegistry.local),
              ],

              for (final category in IntelligenceCategory.values) ...[
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: category.label,
                    count: ToolRegistry.inCategory(category).length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Space.page,
                      0,
                      Space.page,
                      Space.sm,
                    ),
                    child: Text(
                      category.blurb,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                _ToolList(tools: ToolRegistry.inCategory(category)),
              ],

              const SliverToBoxAdapter(child: SizedBox(height: Space.xxxl)),
            ],
          ),
        ),
      ),
    );
  }
}

/// The no-provider state. An invitation, with no upsell and no error styling.
class _ConnectInvitation extends ConsumerWidget {
  const _ConnectInvitation();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.lg,
        Space.page,
        Space.sm,
      ),
      child: GlassSurface(
        intensity: GlassIntensity.regular,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Connect your AI', style: text.titleMedium),
            const SizedBox(height: Space.sm),
            Text(
              'Action works without it. Connecting your own provider account '
              'adds document analysis, planning and drafting — you use your '
              'own API key, and you are billed by your provider.',
              style: text.bodyMedium,
            ),
            const SizedBox(height: Space.lg),
            // Stacked, not side by side: the app's FilledButton style sets a
            // minimum size of Size.fromHeight(52), whose width is infinity, so
            // these are full-width buttons by design and a Row would hand one
            // unbounded width.
            FilledButton(
              onPressed: () => showConnectProviderSheet(context),
              child: const Text('Connect AI'),
            ),
            const SizedBox(height: Space.xs),
            TextButton(
              onPressed: () => context.push(Routes.settingsIntelligence),
              child: const Text('How it works'),
            ),
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

class _ToolCard extends StatelessWidget {
  const _ToolCard({required this.tool});

  final IntelligenceToolDefinition tool;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = context.colors;

    return GlassSurface(
      intensity: GlassIntensity.subtle,
      padding: const EdgeInsets.all(Space.lg),
      onTap: () => context.push(Routes.tool(tool.id)),
      semanticLabel: '${tool.title}. ${tool.shortDescription}',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          // Local tools say so, because "this never leaves your device" is the
          // most useful thing a user can know about a tool before running it.
          if (tool.isLocal)
            Padding(
              padding: const EdgeInsets.only(left: Space.sm),
              child: Tooltip(
                message: 'Runs on this device',
                child: Icon(
                  Icons.phone_android,
                  size: 16,
                  color: colors.confidenceConfirmed,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
