import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app/router.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../extraction/application/extraction_providers.dart';
import '../../extraction/data/fixture_extraction_service.dart';
import '../../extraction/domain/extraction_schema.dart';

/// Debug-only harness for the extraction seam.
///
/// Two modes, deliberately kept visually distinct because they cost different
/// things:
///
///  * **FIXTURE** — canned provider responses through the real validator. Free,
///    offline, deterministic, and safe to run repeatedly.
///  * **LIVE** — real Firebase AI Logic calls. Costs quota and money, and is
///    therefore never automatic: it takes an explicit tap and a confirmation,
///    and runs a fixed short list rather than the whole corpus.
///
/// Unpolished on purpose. The confirmation and review experience is a later
/// stage's work; building it now would mean designing the most important screen
/// in the product against fixtures rather than against real extracted output.
///
/// Fixtures are not bundled into the APK, matching the day-4 OCR harness. Push
/// them with:
///
///   adb -s emulator-5554 push test/fixtures/extraction/cases.json /data/local/tmp/
///   adb -s emulator-5554 shell run-as com.solvex.actionapp \
///     cp /data/local/tmp/cases.json app_flutter/fixtures/extraction_cases.json
class ExtractionDiagnosticsScreen extends ConsumerStatefulWidget {
  const ExtractionDiagnosticsScreen({super.key});

  @override
  ConsumerState<ExtractionDiagnosticsScreen> createState() =>
      _ExtractionDiagnosticsScreenState();
}

class _ExtractionDiagnosticsScreenState
    extends ConsumerState<ExtractionDiagnosticsScreen> {
  /// The live suite is a fixed, short list. Running all 21 cases against a real
  /// model would be roughly triple the calls for no extra signal — these eight
  /// are the ones whose behaviour a live model could plausibly change.
  static const _liveCaseIds = [
    'renewal_notice',
    'utility_bill',
    'multiple_dates_one_actionable',
    'missing_deadline',
    'no_action_required',
    'table_heavy',
    'prompt_injection',
    'fabricated_claims',
  ];

  List<_CaseOutcome>? _outcomes;
  bool _running = false;
  String? _error;
  String _progress = '';
  bool _lastRunWasLive = false;

  Future<List<ExtractionFixtureCase>> _loadCases() async {
    final docs = await getApplicationDocumentsDirectory();
    final file = File(
      '${docs.path}${Platform.pathSeparator}fixtures'
      '${Platform.pathSeparator}extraction_cases.json',
    );

    if (!await file.exists()) {
      throw Exception('No extraction fixtures on device at ${file.path}');
    }
    return ExtractionFixtureCase.parseManifest(await file.readAsString());
  }

  Future<void> _runFixtures() async {
    await _run(live: false, (cases) async {
      final service = FixtureExtractionService.forCases(cases);
      final outcomes = <_CaseOutcome>[];

      for (final fixture in cases) {
        setState(() => _progress = fixture.id);
        final started = DateTime.now();
        final attempt = await runExtraction(service, fixture.toInput());
        outcomes.add(
          _CaseOutcome(
            id: fixture.id,
            attempt: attempt,
            latencyMs: DateTime.now().difference(started).inMilliseconds,
          ),
        );
      }
      return outcomes;
    });
  }

  Future<void> _runLive() async {
    final confirmed = await _confirmLiveRun();
    if (confirmed != true) return;

    await _run(live: true, (cases) async {
      final service = ref.read(extractionServiceProvider);
      final selected = [
        for (final id in _liveCaseIds)
          ...cases.where((c) => c.id == id).take(1),
      ];

      final outcomes = <_CaseOutcome>[];
      for (final fixture in selected) {
        setState(() => _progress = fixture.id);
        final started = DateTime.now();
        // One call per case. No retry loop: spending more quota is a decision
        // for whoever is watching, not something this screen does on its own.
        final attempt = await runExtraction(service, fixture.toInput());
        outcomes.add(
          _CaseOutcome(
            id: fixture.id,
            attempt: attempt,
            latencyMs: DateTime.now().difference(started).inMilliseconds,
          ),
        );

        // The Gemini Developer API free tier allows five requests per rolling
        // minute for this model. Unpaced, the tail of the suite always fails
        // with quotaExceeded before the model ever sees it.
        if (fixture != selected.last) {
          await Future<void>.delayed(const Duration(seconds: 13));
        }
      }
      return outcomes;
    });
  }

  Future<bool?> _confirmLiveRun() => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Run live AI suite?'),
          content: Text(
            'This makes ${_liveCaseIds.length} real Firebase AI Logic requests '
            'and will consume quota.\n\n'
            'Synthetic fixture documents only. No captured user document is '
            'sent.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Run live'),
            ),
          ],
        ),
      );

  Future<void> _run(
    Future<List<_CaseOutcome>> Function(List<ExtractionFixtureCase>) body, {
    required bool live,
  }) async {
    setState(() {
      _running = true;
      _error = null;
      _outcomes = null;
      _lastRunWasLive = live;
    });

    try {
      final outcomes = await body(await _loadCases());
      if (mounted) setState(() => _outcomes = outcomes);
    } on Object catch (error) {
      if (mounted) setState(() => _error = error.toString());
    } finally {
      // Always clears, so the harness can never sit on a spinner.
      if (mounted) setState(() => _running = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final outcomes = _outcomes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Extraction diagnostics'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Space.page),
        children: [
          FilledButton(
            onPressed: _running ? null : _runFixtures,
            child: Text(
              _running && !_lastRunWasLive
                  ? 'Running $_progress…'
                  : 'Run FIXTURE corpus (offline)',
            ),
          ),
          const SizedBox(height: Space.sm),
          Text(
            'FIXTURE · canned provider responses through the real validator. '
            'Free, deterministic, no network.',
            style: text.labelSmall,
          ),
          const SizedBox(height: Space.xl),
          OutlinedButton(
            onPressed: _running ? null : _runLive,
            child: Text(
              _running && _lastRunWasLive
                  ? 'LIVE $_progress…'
                  : 'Run LIVE suite (${_liveCaseIds.length} calls)',
            ),
          ),
          const SizedBox(height: Space.sm),
          Text(
            'LIVE · real Firebase AI Logic requests. Consumes quota and costs '
            'money. Synthetic fixture documents only.',
            style: text.labelSmall?.copyWith(color: colors.urgencyImportant),
          ),
          if (_error != null) ...[
            const SizedBox(height: Space.lg),
            Text(_error!, style: text.bodySmall?.copyWith(color: colors.danger)),
          ],
          if (outcomes != null) ...[
            const SizedBox(height: Space.xl),
            Text(
              '${_lastRunWasLive ? "LIVE" : "FIXTURE"} · ${outcomes.length} cases',
              style: text.titleSmall,
            ),
            const SizedBox(height: Space.md),
            for (final outcome in outcomes)
              _CaseRow(outcome: outcome, live: _lastRunWasLive),
          ],
        ],
      ),
    );
  }
}

class _CaseOutcome {
  const _CaseOutcome({
    required this.id,
    required this.attempt,
    required this.latencyMs,
  });

  final String id;
  final ExtractionAttempt attempt;
  final int latencyMs;
}

class _CaseRow extends StatelessWidget {
  const _CaseRow({required this.outcome, required this.live});

  final _CaseOutcome outcome;
  final bool live;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final attempt = outcome.attempt;

    final result = attempt is ExtractionCompleted ? attempt.result : null;

    // Tapping a completed row opens the PRODUCTION review screen with this
    // result injected — the deterministic way to exercise the real review UI
    // against every fixture state without a live call. Debug builds only, by
    // virtue of this whole screen being debug-only.
    void openReview() {
      if (result == null) return;
      context.push(Routes.sourceReview(outcome.id), extra: result);
    }

    final marker = switch (attempt) {
      ExtractionFailed() => colors.danger,
      ExtractionCompleted(:final result) => switch (result.reviewState) {
          ExtractionReviewState.readyForConfirmation => colors.success,
          ExtractionReviewState.needsReview => colors.urgencyImportant,
          ExtractionReviewState.manualEntryRequired => colors.danger,
        },
      _ => colors.textTertiary,
    };

    final draft = result?.draft;
    final grounded =
        draft?.fields.where((f) => f.isGrounded).length ?? 0;
    final total = draft?.fields.length ?? 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: Space.md),
      child: InkWell(
        borderRadius: Radii.rSm,
        onTap: result == null ? null : openReview,
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Strokes.spine,
            height: 46,
            decoration: BoxDecoration(
              color: marker,
              borderRadius: BorderRadius.circular(Radii.pill),
            ),
          ),
          const SizedBox(width: Space.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${live ? "LIVE" : "FIX"} · ${outcome.id}',
                  style: text.titleSmall,
                ),
                Text('${outcome.latencyMs} ms', style: text.labelSmall),
                if (attempt is ExtractionFailed) ...[
                  Text(
                    'TRANSPORT FAILURE · ${attempt.message}'
                    '${attempt.isRetryable ? " (retryable)" : ""}',
                    style: text.bodySmall?.copyWith(color: colors.danger),
                  ),
                  // Developer-facing detail. A transport failure's cause is a
                  // ProviderTransportException, whose detail never carries
                  // document text — which is what makes it safe to show here.
                  if (attempt.cause != null)
                    Text(
                      '${attempt.cause}',
                      style:
                          text.labelSmall?.copyWith(color: colors.textTertiary),
                    ),
                ],
                if (result != null) ...[
                  Text(
                    '${result.reviewState.name}'
                    '${result.noActionRequired ? " · no action needed" : ""}'
                    ' · $total fields ($grounded grounded)'
                    ' · ${draft?.steps.length ?? 0} steps'
                    ' · ${result.issues.length} issues',
                    style: text.bodySmall,
                  ),
                  Text(result.engine, style: text.labelSmall),
                  if (draft != null) ...[
                    Text(
                      'title: ${draft.title}',
                      style: text.labelSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'due ${draft.groundedDueAt?.toIso8601String() ?? "—"}'
                      ' · amount ${draft.groundedAmount ?? "—"}'
                      ' · consequence ${draft.consequence == null ? "—" : "yes"}',
                      style: text.labelSmall,
                    ),
                  ],
                  if (result.issues.isNotEmpty)
                    Text(
                      result.issues.map((i) => i.code.name).toSet().join(', '),
                      style: text.labelSmall?.copyWith(color: colors.danger),
                    ),
                  if (result.escalation.signals.isNotEmpty)
                    Text(
                      'escalation: '
                      '${result.escalation.signals.map((s) => s.name).join(', ')}',
                      style: text.labelSmall
                          ?.copyWith(color: colors.urgencyImportant),
                    ),
                  if (draft != null)
                    for (final field in draft.fields)
                      Text(
                        '  ${field.key}: ${field.value ?? "—"}'
                        ' (${field.reviewState.name}'
                        '${field.reviewState == FieldReviewState.missing ? "" : field.isGrounded ? ", grounded" : ", ungrounded"})',
                        style: text.labelSmall,
                      ),
                ],
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}
