/// Running one tool: choose what it works on, run it, read the result.
///
/// Three rules this screen exists to keep. Nothing is sent until the user taps
/// Run. Leaving the screen cancels the request rather than letting it finish on
/// the user's metered key. And a large operation states its scope before it
/// spends anything.
library;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/security/activity_journal.dart';
import '../../../core/security/activity_providers.dart';
import '../../../design/components/glass_surface.dart';
import '../../../design/components/readable_width.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../shared/widgets/empty_view.dart';
import '../../capture/application/capture_controller.dart';
import '../../actions/application/action_providers.dart';
import '../../actions/domain/action_item.dart';
import '../../capture/domain/source_item.dart';
import '../application/intelligence_context.dart';
import '../application/intelligence_providers.dart';
import '../application/intelligence_runner.dart';
import '../domain/ai_failure.dart';
import '../domain/ai_provider.dart';
import '../domain/ai_request.dart';
import '../domain/ai_provider_config.dart';
import '../domain/intelligence_result.dart';
import '../domain/intelligence_tool.dart';
import '../domain/tool_registry.dart';
import 'connect_provider_sheet.dart';
import 'intelligence_result_view.dart';

class ToolRunScreen extends ConsumerStatefulWidget {
  const ToolRunScreen({
    super.key,
    required this.toolId,
    this.sourceId,
    this.actionId,
  });

  final String toolId;

  /// Pre-selects a source when arriving from Source Detail.
  final String? sourceId;

  /// Fixes the context to one Action when arriving from Action Detail.
  ///
  /// Unlike [sourceId] this is not a pre-selection the user can change: they
  /// asked about this Action, so the picker is replaced by a statement of what
  /// is being worked on.
  final String? actionId;

  @override
  ConsumerState<ToolRunScreen> createState() => _ToolRunScreenState();
}

class _ToolRunScreenState extends ConsumerState<ToolRunScreen> {
  final _questionController = TextEditingController();
  final _freeTextController = TextEditingController();

  final Set<String> _selectedSourceIds = {};
  final Set<String> _selectedSuggestions = {};
  String? _mode;

  AiCancellationToken? _cancel;
  IntelligenceRunState _run = const IntelligenceRunState();

  @override
  void initState() {
    super.initState();
    if (widget.sourceId != null) _selectedSourceIds.add(widget.sourceId!);
  }

  @override
  void dispose() {
    // The whole reason cancellation reaches the socket: an abandoned Future
    // still costs the user tokens.
    _cancel?.cancel();
    _questionController.dispose();
    _freeTextController.dispose();
    super.dispose();
  }

  IntelligenceToolDefinition? get _tool => ToolRegistry.byId(widget.toolId);

  /// The Action this run is about, when one was named.
  ActionItem? get _action {
    final id = widget.actionId;
    if (id == null) return null;
    final actions = ref.read(actionsStreamProvider).value;
    if (actions == null) return null;
    for (final action in actions) {
      if (action.id == id) return action;
    }
    return null;
  }

  IntelligenceRunInput _buildInput(List<SourceItem> allSources) {
    final action = _action;
    if (action != null) {
      return buildActionRunInput(
        action: action,
        question: _questionController.text.trim().isEmpty
            ? null
            : _questionController.text.trim(),
        mode: _mode,
      );
    }

    final chosen =
        allSources.where((s) => _selectedSourceIds.contains(s.id)).toList();
    return buildRunInput(
      sources: chosen,
      question: _questionController.text.trim().isEmpty
          ? null
          : _questionController.text.trim(),
      freeText: _freeTextController.text.trim().isEmpty
          ? null
          : _freeTextController.text.trim(),
      mode: _mode,
    );
  }

  Future<void> _run_(IntelligenceToolDefinition tool, IntelligenceRunInput input) async {
    final config = ref.read(aiProviderConfigProvider);

    // The disclosure and the scope confirmation both happen before a request
    // is built, so declining costs nothing.
    if (!tool.isLocal && config != null) {
      if (!await _confirmFirstUse(config.kind.label, config.kind)) return;

      final scope = ref
          .read(intelligenceRunnerProvider)
          .scopeFor(tool, input, config);
      if (scope.needsConfirmation && !await _confirmScope(scope)) return;
    }

    final token = AiCancellationToken();
    setState(() {
      _cancel?.cancel();
      _cancel = token;
      _selectedSuggestions.clear();
      _run = const IntelligenceRunState(stage: IntelligenceStage.preparing);
    });

    // The receipt, written at the moment of sending rather than on success.
    //
    // A transparency log that only recorded completed runs would understate
    // what left the device — a request rejected by the provider still reached
    // it — and would lose the record entirely if the app were killed mid-run.
    // A local tool sends nothing, so there is nothing to receipt.
    if (!tool.isLocal && config != null) {
      unawaited(ref.read(activityRecorderProvider).record(
            ActivityEvent.aiRequestSent,
            providerId: config.kind.id,
            toolId: tool.id,
            pages: input.parts
                .whereType<AiDocumentPart>()
                .fold(0, (sum, part) => sum + (part.pageCount ?? 0)),
            attachments: input.parts
                .where((p) => p is AiDocumentPart || p is AiImagePart)
                .length,
            textCharacters: _textLengthOf(input),
          ));
    }

    final stream = ref.read(intelligenceRunnerProvider).run(
          tool: tool,
          input: input,
          config: config,
          cancel: token,
        );

    await for (final state in stream) {
      if (!mounted || token.isCancelled) return;
      setState(() => _run = state);
    }

    if (mounted && _run.stage == IntelligenceStage.done) {
      // Only the tool id is remembered — never what it was pointed at.
      await ref.read(recentToolsProvider.notifier).record(tool.id);
      final selected = _run.result?.suggestions
              .where((s) => s.selectedByDefault)
              .map((s) => s.id) ??
          const <String>[];
      if (mounted) {
        setState(() => _selectedSuggestions.addAll(selected));
      }
    }
  }

  /// How much text is in this run, for the receipt.
  ///
  /// A character count, never the characters. The point of the number is to
  /// let someone reading their own history tell a one-line question apart from
  /// a forty-page contract.
  static int _textLengthOf(IntelligenceRunInput input) {
    var total = 0;
    for (final part in input.parts) {
      total += switch (part) {
        AiTextPart(:final text) => text.length,
        AiSourceTextPart(:final text) => text.length,
        _ => 0,
      };
    }
    total += input.freeText?.trim().length ?? 0;
    total += input.question?.trim().length ?? 0;
    return total;
  }

  Future<bool> _confirmFirstUse(String label, AiProviderKind kind) async {
    final disclosure = ref.read(aiDisclosureProvider.notifier);
    if (disclosure.hasAccepted(kind)) return true;

    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Send this to $label?'),
        content: Text(
          'The content you selected will be sent to $label for processing, '
          'using your API key.\n\n'
          'Your key stays on this device. Action does not send anything in '
          'the background, and does not send your other Actions or sources.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
    if (accepted != true) return false;
    await disclosure.accept(kind);
    return true;
  }

  Future<bool> _confirmScope(IntelligenceScope scope) async {
    final go = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Before this runs'),
        // Scope, never a currency figure: provider pricing changes and a stale
        // table would lie to the user.
        content: Text(scope.sentence),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Run'),
          ),
        ],
      ),
    );
    return go == true;
  }

  void _stop() {
    _cancel?.cancel();
    setState(() => _run = const IntelligenceRunState(
          stage: IntelligenceStage.cancelled,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final tool = _tool;
    if (tool == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const EmptyView(
          icon: Icons.help_outline,
          title: 'That tool is not available',
          message: 'It may have been removed in a newer version of Action.',
        ),
      );
    }

    final sources = ref.watch(sourcesProvider).value ?? const <SourceItem>[];
    final usable = sources.where((s) => s.hasText).toList();
    final config = ref.watch(aiProviderConfigProvider);
    final needsProvider = !tool.isLocal && config == null;

    return Scaffold(
      appBar: AppBar(title: Text(tool.title)),
      body: SafeArea(
        top: false,
        child: ReadableWidth(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              Space.page,
              Space.md,
              Space.page,
              Space.giant,
            ),
            children: [
              Text(
                tool.shortDescription,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: Space.lg),

              if (needsProvider)
                _NeedsProvider(onConnect: () async {
                  await showConnectProviderSheet(context);
                  if (mounted) setState(() {});
                })
              else ...[
                if (_action case final action?)
                  _FixedContext(label: action.title)
                else
                  _sourcePicker(tool, usable),
                if (tool.requiresQuestion) _questionField(),
                if (tool.acceptedInputs
                    .contains(IntelligenceInputKind.freeText))
                  _freeTextField(tool),
                if (tool.modes.isNotEmpty) _modePicker(tool),
                const SizedBox(height: Space.lg),
                _runButton(tool, usable),
              ],

              if (_run.isRunning) ...[
                const SizedBox(height: Space.xl),
                _StageIndicator(stage: _run.stage, onStop: _stop),
              ],

              if (_run.failure != null) ...[
                const SizedBox(height: Space.xl),
                _FailureView(
                  failure: _run.failure!,
                  onRetry: _run.failure!.isRetryable
                      ? () => _run_(tool, _buildInput(usable))
                      : null,
                ),
              ],

              if (_run.result != null) ...[
                const SizedBox(height: Space.xl),
                IntelligenceResultView(
                  result: _run.result!,
                  selectedSuggestions: _selectedSuggestions,
                  onToggleSuggestion: (id) => setState(() {
                    _selectedSuggestions.contains(id)
                        ? _selectedSuggestions.remove(id)
                        : _selectedSuggestions.add(id);
                  }),
                ),
                const SizedBox(height: Space.xl),
                _ResultActions(
                  tool: tool,
                  result: _run.result!,
                  onRerun: () => _run_(tool, _buildInput(usable)),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _sourcePicker(
    IntelligenceToolDefinition tool,
    List<SourceItem> sources,
  ) {
    if (!tool.acceptedInputs.contains(IntelligenceInputKind.source) &&
        !tool.acceptedInputs.contains(IntelligenceInputKind.multipleSources)) {
      return const SizedBox.shrink();
    }
    final multiple =
        tool.acceptedInputs.contains(IntelligenceInputKind.multipleSources);

    if (sources.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: Space.lg),
        child: Text(
          'Nothing to work on yet. Capture something, or paste some text below.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          multiple ? 'Choose what to compare' : 'Choose a source',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: Space.sm),
        for (final source in sources.take(12))
          Padding(
            padding: const EdgeInsets.only(bottom: Space.sm),
            child: GlassSurface(
              intensity: GlassIntensity.subtle,
              padding: const EdgeInsets.all(Space.md),
              selected: _selectedSourceIds.contains(source.id),
              onTap: () => setState(() {
                if (_selectedSourceIds.contains(source.id)) {
                  _selectedSourceIds.remove(source.id);
                } else {
                  // A single-source tool replaces rather than accumulates, so
                  // the user cannot accidentally send two documents to a tool
                  // that reads one.
                  if (!multiple) _selectedSourceIds.clear();
                  _selectedSourceIds.add(source.id);
                }
              }),
              child: Row(
                children: [
                  Icon(
                    _selectedSourceIds.contains(source.id)
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    size: 20,
                    color: context.colors.brand,
                  ),
                  const SizedBox(width: Space.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          labelForSource(source),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          source.analysisText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: Space.md),
      ],
    );
  }

  Widget _questionField() => Padding(
        padding: const EdgeInsets.only(bottom: Space.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your question',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: Space.sm),
            TextField(
              controller: _questionController,
              minLines: 1,
              maxLines: 3,
              textInputAction: TextInputAction.done,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                hintText: 'What is the deadline?',
              ),
            ),
          ],
        ),
      );

  Widget _freeTextField(IntelligenceToolDefinition tool) => Padding(
        padding: const EdgeInsets.only(bottom: Space.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Or paste some text',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: Space.sm),
            TextField(
              controller: _freeTextController,
              minLines: 3,
              maxLines: 10,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                hintText: 'Paste or type here',
              ),
            ),
          ],
        ),
      );

  Widget _modePicker(IntelligenceToolDefinition tool) => Padding(
        padding: const EdgeInsets.only(bottom: Space.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Style', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: Space.sm),
            Wrap(
              spacing: Space.sm,
              runSpacing: Space.sm,
              children: [
                for (final mode in tool.modes)
                  ChoiceChip(
                    label: Text(mode),
                    selected: (_mode ?? tool.modes.first) == mode,
                    onSelected: (_) => setState(() => _mode = mode),
                  ),
              ],
            ),
          ],
        ),
      );

  Widget _runButton(
    IntelligenceToolDefinition tool,
    List<SourceItem> sources,
  ) {
    final input = _buildInput(sources);
    final canRun = tool.accepts(input) && !_run.isRunning;

    return FilledButton(
      onPressed: canRun ? () => _run_(tool, input) : null,
      child: Text(tool.isLocal ? 'Check on this device' : 'Run'),
    );
  }
}

class _NeedsProvider extends StatelessWidget {
  const _NeedsProvider({required this.onConnect});

  final VoidCallback onConnect;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return GlassSurface(
      intensity: GlassIntensity.subtle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // An invitation, not an error. The user did nothing wrong.
          Text('Connect an AI provider to use this tool', style: text.titleSmall),
          const SizedBox(height: Space.sm),
          Text(
            'You use your own provider account and API key.',
            style: text.bodySmall,
          ),
          const SizedBox(height: Space.lg),
          FilledButton(onPressed: onConnect, child: const Text('Connect AI')),
        ],
      ),
    );
  }
}

/// Named stages, never a fabricated percentage.
class _StageIndicator extends StatelessWidget {
  const _StageIndicator({required this.stage, required this.onStop});

  final IntelligenceStage stage;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Row(
      children: [
        const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: Space.md),
        Expanded(child: Text(describeStage(stage), style: text.bodyMedium)),
        TextButton(onPressed: onStop, child: const Text('Stop')),
      ],
    );
  }
}

class _FailureView extends StatelessWidget {
  const _FailureView({required this.failure, this.onRetry});

  final AiProviderFailure failure;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(Space.lg),
      decoration: BoxDecoration(
        color: colors.danger.withValues(alpha: 0.06),
        borderRadius: Radii.rMd,
        border: Border.all(
          color: colors.danger.withValues(alpha: 0.3),
          width: Strokes.hairline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The normalised message. Never raw provider JSON.
          Text(failure.message, style: text.bodyLarge),
          if (onRetry != null) ...[
            const SizedBox(height: Space.md),
            // Offered only where retrying could actually work.
            TextButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ],
      ),
    );
  }
}

class _ResultActions extends StatelessWidget {
  const _ResultActions({
    required this.tool,
    required this.result,
    required this.onRerun,
  });

  final IntelligenceToolDefinition tool;
  final IntelligenceResult result;
  final VoidCallback onRerun;

  @override
  Widget build(BuildContext context) {
    final artifact = result.artifacts.isEmpty ? null : result.artifacts.first;

    // The app's OutlinedButton style is full-width by default
    // (Size.fromHeight), which a Wrap cannot lay out. These are secondary
    // actions that belong side by side, so they opt out of that width.
    final style = OutlinedButton.styleFrom(
      minimumSize: const Size(0, 44),
      padding: const EdgeInsets.symmetric(horizontal: Space.lg),
    );

    return Wrap(
      spacing: Space.sm,
      runSpacing: Space.sm,
      children: [
        if (tool.allowsCopy && artifact != null)
          OutlinedButton.icon(
            style: style,
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: artifact.text));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied')),
                );
              }
            },
            icon: const Icon(Icons.copy, size: 18),
            label: const Text('Copy'),
          ),
        OutlinedButton.icon(
          style: style,
          onPressed: onRerun,
          icon: const Icon(Icons.refresh, size: 18),
          label: const Text('Run again'),
        ),
      ],
    );
  }
}

/// What this run is about, when the user arrived from an Action.
///
/// A statement rather than a picker: they tapped a tool on a specific Action,
/// so offering them a list to choose from would be asking a question they have
/// already answered.
class _FixedContext extends StatelessWidget {
  const _FixedContext({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: Space.lg),
      child: GlassSurface(
        intensity: GlassIntensity.subtle,
        padding: const EdgeInsets.all(Space.md),
        child: Row(
          children: [
            Icon(Icons.link, size: 18, color: context.colors.textSecondary),
            const SizedBox(width: Space.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Working on', style: text.bodySmall),
                  Text(label, style: text.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
