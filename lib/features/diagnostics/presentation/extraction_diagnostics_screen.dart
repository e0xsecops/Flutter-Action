import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/result.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../extraction/data/fixture_extraction_service.dart';
import '../../extraction/domain/extraction_result.dart';
import '../../extraction/domain/extraction_schema.dart';

/// Debug-only view of what [FixtureExtractionService] makes of the synthetic
/// extraction corpus.
///
/// Deliberately unpolished. The real confirmation and review experience is a
/// later stage's work, and building it now would mean designing the most
/// important screen in the product against fixtures instead of against real
/// extracted output. This exists only so the seam can be watched working on a
/// device.
///
/// Fixtures are not bundled into the APK, matching the day-4 OCR harness: the
/// corpus costs release users nothing. Push them with:
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
  List<_CaseOutcome>? _outcomes;
  bool _running = false;
  String? _error;

  Future<void> _run() async {
    setState(() {
      _running = true;
      _error = null;
      _outcomes = null;
    });

    try {
      final docs = await getApplicationDocumentsDirectory();
      final file = File(
        '${docs.path}${Platform.pathSeparator}fixtures'
        '${Platform.pathSeparator}extraction_cases.json',
      );

      if (!await file.exists()) {
        throw Exception('No extraction fixtures on device at ${file.path}');
      }

      final cases = ExtractionFixtureCase.parseManifest(
        await file.readAsString(),
      );
      final service = FixtureExtractionService.forCases(cases);

      final outcomes = <_CaseOutcome>[];
      for (final fixture in cases) {
        final outcome = await service.extract(fixture.toInput());
        outcomes.add(
          _CaseOutcome(
            id: fixture.id,
            result: switch (outcome) {
              Ok(:final value) => value,
              Err() => null,
            },
          ),
        );
      }

      if (mounted) setState(() => _outcomes = outcomes);
    } on Object catch (error) {
      if (mounted) setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _running = false);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: _running ? null : _run,
            child: Text(_running ? 'Running…' : 'Run extraction corpus'),
          ),
          const SizedBox(height: Space.md),
          Text(
            'Fixture responses only. No request is made to any provider.',
            style: text.labelSmall,
          ),
          if (_error != null) ...[
            const SizedBox(height: Space.lg),
            Text(_error!, style: text.bodySmall),
          ],
          if (outcomes != null) ...[
            const SizedBox(height: Space.xl),
            for (final outcome in outcomes) _CaseRow(outcome: outcome),
          ],
        ],
      ),
    );
  }
}

class _CaseOutcome {
  const _CaseOutcome({required this.id, this.result});

  final String id;
  final ExtractionResult? result;
}

class _CaseRow extends StatelessWidget {
  const _CaseRow({required this.outcome});

  final _CaseOutcome outcome;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final result = outcome.result;

    final marker = switch (result?.reviewState) {
      ExtractionReviewState.readyForConfirmation => colors.success,
      ExtractionReviewState.needsReview => colors.urgencyImportant,
      _ => colors.danger,
    };

    final draft = result?.draft;

    return Padding(
      padding: const EdgeInsets.only(bottom: Space.md),
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
                Text(outcome.id, style: text.titleSmall),
                Text(
                  result == null
                      ? 'no response registered'
                      : '${result.reviewState.name}'
                          '${result.noActionRequired ? " · no action needed" : ""}'
                          ' · ${draft?.fields.length ?? 0} fields'
                          ' · ${draft?.steps.length ?? 0} steps'
                          ' · ${result.issues.length} issues',
                  style: text.bodySmall,
                ),
                if (draft != null)
                  Text(
                    'due ${draft.groundedDueAt?.toIso8601String() ?? "—"}'
                    ' · amount ${draft.groundedAmount ?? "—"}',
                    style: text.labelSmall,
                  ),
                if (result != null && result.issues.isNotEmpty)
                  Text(
                    result.issues.map((i) => i.code.name).join(', '),
                    style: text.labelSmall?.copyWith(color: colors.danger),
                  ),
                if (result != null && result.escalation.signals.isNotEmpty)
                  Text(
                    'escalation: ${result.escalation.signals.map((s) => s.name).join(', ')}',
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
            ),
          ),
        ],
      ),
    );
  }
}
