import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../capture/application/capture_controller.dart';
import '../../capture/data/image_normalizer.dart';
import '../fixture_evaluation.dart';

/// Debug-only harness that runs the synthetic fixture corpus through the real
/// pipeline — normalisation plus on-device ML Kit — and reports what happened.
///
/// Fixtures are not bundled into the APK. They are pushed onto the device into
/// the app's own documents directory, so the corpus costs release users
/// nothing and no test imagery ships. Push them with:
///
///   adb push test/fixtures/... /data/local/tmp/fixtures/
///   adb shell run-as com.solvex.actionapp cp -r /data/local/tmp/fixtures app_flutter/
class OcrDiagnosticsScreen extends ConsumerStatefulWidget {
  const OcrDiagnosticsScreen({super.key});

  @override
  ConsumerState<OcrDiagnosticsScreen> createState() =>
      _OcrDiagnosticsScreenState();
}

class _OcrDiagnosticsScreenState extends ConsumerState<OcrDiagnosticsScreen> {
  CorpusSummary? _summary;
  bool _running = false;
  String? _error;
  String _progress = '';
  String? _reportPath;

  Future<void> _run() async {
    setState(() {
      _running = true;
      _error = null;
      _summary = null;
      _reportPath = null;
    });

    try {
      final docs = await getApplicationDocumentsDirectory();
      final dir = Directory('${docs.path}${Platform.pathSeparator}fixtures');
      final manifestFile =
          File('${dir.path}${Platform.pathSeparator}manifest.json');

      if (!await manifestFile.exists()) {
        throw Exception('No fixtures on device at ${dir.path}');
      }

      final fixtures =
          Fixture.parseManifest(await manifestFile.readAsString());
      final outDir =
          Directory('${docs.path}${Platform.pathSeparator}fixtures_out');
      await outDir.create(recursive: true);

      final ocr = ref.read(ocrServiceProvider);
      final normalizer = ref.read(imageNormalizerProvider);
      final reports = <FixtureReport>[];
      var engine = 'unknown';

      for (final fixture in fixtures) {
        setState(() => _progress = fixture.file);
        final source = File('${dir.path}${Platform.pathSeparator}${fixture.file}');

        if (!await source.exists()) {
          reports.add(
            FixtureReport(
              fixture: fixture,
              originalBytes: 0,
              processedBytes: 0,
              width: 0,
              height: 0,
              normalizeMs: 0,
              error: 'missing on device',
            ),
          );
          continue;
        }

        try {
          final bytes = await source.readAsBytes();

          final normalizeStart = DateTime.now();
          final normalized =
              await normalizer.normalize(NormalizeRequest(bytes: bytes));
          final normalizeMs =
              DateTime.now().difference(normalizeStart).inMilliseconds;

          final processed = File(
            '${outDir.path}${Platform.pathSeparator}${fixture.file}.jpg',
          );
          await processed.writeAsBytes(normalized.bytes, flush: true);

          final ocrStart = DateTime.now();
          final outcome = await ocr.recognize(processed.path);
          final ocrMs = DateTime.now().difference(ocrStart).inMilliseconds;

          reports.add(
            FixtureReport(
              fixture: fixture,
              originalBytes: normalized.originalByteSize,
              processedBytes: normalized.processedByteSize,
              width: normalized.width,
              height: normalized.height,
              normalizeMs: normalizeMs,
              ocrMs: ocrMs,
              textLength: outcome.normalizedText.length,
              lineCount: outcome.lineCount,
              score: scoreAnchors(outcome.normalizedText, fixture.anchors),
              recognizedText: outcome.normalizedText,
            ),
          );
          engine = outcome.engine;
        } on Object catch (error) {
          reports.add(
            FixtureReport(
              fixture: fixture,
              originalBytes: 0,
              processedBytes: 0,
              width: 0,
              height: 0,
              normalizeMs: 0,
              error: error.toString(),
            ),
          );
        }
      }

      final summary = CorpusSummary(reports, engine: engine);

      // Written to a file as well as rendered, because eighteen fixtures times
      // ten measurements is not something to read off a phone screen and
      // retype. The file is what gets compared against the next run.
      final reportFile =
          File('${docs.path}${Platform.pathSeparator}ocr_report.json');
      await reportFile.writeAsString(
        const JsonEncoder.withIndent('  ').convert(summary.toJson()),
        flush: true,
      );

      if (mounted) {
        setState(() {
          _summary = summary;
          _reportPath = reportFile.path;
        });
      }
    } on Object catch (error) {
      if (mounted) setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _running = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final summary = _summary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('OCR diagnostics'),
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
            child: Text(_running ? 'Running $_progress…' : 'Run fixture corpus'),
          ),
          if (_error != null) ...[
            const SizedBox(height: Space.lg),
            Text(_error!, style: text.bodySmall),
          ],
          if (summary != null) ...[
            const SizedBox(height: Space.xl),
            _SummaryPanel(summary: summary),
            if (_reportPath != null) ...[
              const SizedBox(height: Space.sm),
              Text('report → ${_reportPath!}', style: text.labelSmall),
            ],
            const SizedBox(height: Space.lg),
            for (final report in summary.reports) _ReportRow(report: report),
          ],
        ],
      ),
    );
  }
}

class _SummaryPanel extends StatelessWidget {
  const _SummaryPanel({required this.summary});

  final CorpusSummary summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    final shrink = summary.totalOriginalBytes == 0
        ? 0.0
        : 100 *
            (1 - summary.totalProcessedBytes / summary.totalOriginalBytes);

    return Container(
      padding: const EdgeInsets.all(Space.lg),
      decoration: BoxDecoration(
        color: colors.surfaceSunken,
        borderRadius: Radii.rMd,
        border: Border.all(color: colors.border, width: Strokes.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Corpus summary', style: text.titleSmall),
          const SizedBox(height: Space.sm),
          Text(
            'engine ${summary.engine}\n'
            'fixtures ${summary.total} · failures ${summary.failures}\n'
            'text expectation met ${summary.textExpectationMet}/${summary.total}\n'
            'median anchor recall ${(summary.medianRecall * 100).toStringAsFixed(1)}% '
            '(regression signal, not accuracy)\n'
            'OCR median ${summary.medianOcrMs} ms · '
            'p95 ${summary.p95OcrMs} ms · max ${summary.slowestOcrMs} ms\n'
            'normalise median ${summary.medianNormalizeMs} ms\n'
            'bytes ${(summary.totalOriginalBytes / 1024).round()} KB → '
            '${(summary.totalProcessedBytes / 1024).round()} KB '
            '(${shrink.toStringAsFixed(0)}% smaller)',
            style: text.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _ReportRow extends StatelessWidget {
  const _ReportRow({required this.report});

  final FixtureReport report;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    final Color marker;
    if (report.failed) {
      marker = colors.danger;
    } else if (!report.textExpectationMet) {
      marker = colors.urgencyImportant;
    } else if ((report.score?.recall ?? 1) < 1) {
      marker = colors.urgencyImportant;
    } else {
      marker = colors.success;
    }

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
                Text(report.fixture.file, style: text.titleSmall),
                Text(
                  report.failed
                      ? 'FAILED ${report.error}'
                      : '${(report.originalBytes / 1024).round()}→'
                          '${(report.processedBytes / 1024).round()} KB · '
                          '${report.width}×${report.height} · '
                          'norm ${report.normalizeMs}ms · ocr ${report.ocrMs}ms · '
                          '${report.lineCount} lines · '
                          'recall ${((report.score?.recall ?? 0) * 100).round()}%',
                  style: text.bodySmall,
                ),
                if (!report.failed && (report.score?.missing.isNotEmpty ?? false))
                  Text(
                    'missed: ${report.score!.missing.join(" | ")}',
                    style: text.labelSmall?.copyWith(color: colors.danger),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
