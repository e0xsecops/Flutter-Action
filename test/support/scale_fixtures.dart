import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/domain/action_reminder.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/extraction/domain/money_value.dart';

/// Synthetic data at scale, generated rather than committed.
///
/// **Test-only.** Nothing here ships, and nothing here contains a real name,
/// address, reference or amount — every string is derived from an index, so a
/// 500-Action corpus costs a few lines of source instead of a fixture file
/// nobody can review.
///
/// The shape matters as much as the size. A thousand identical Actions would
/// measure the wrong thing: real Home has a mix of overdue and distant
/// deadlines, date-only and timestamp dues, completed and archived rows,
/// chains of varying length and facts worth searching. [syntheticActions]
/// deals those deterministically from the index so a run is reproducible and
/// a regression is reproducible with it.
abstract final class ScaleFixtures {
  /// A fixed instant, so "overdue" means the same thing on every run.
  static final now = DateTime.utc(2026, 8, 28, 12);

  /// [count] Actions spread across the states Home actually renders.
  ///
  /// Roughly: a tenth completed, a twentieth archived, the rest active; about
  /// four fifths carry a deadline, spread from three weeks overdue to three
  /// months out; every seventh is date-only. Chain length cycles 0–[maxSteps]
  /// so hydration is measured against a realistic child-row count rather than
  /// a best case.
  static List<ActionItem> syntheticActions(
    int count, {
    int maxSteps = 4,
    int factsPer = 3,
    DateTime? at,
  }) {
    final base = at ?? now;
    return [
      for (var i = 0; i < count; i++) _action(i, base, maxSteps, factsPer),
    ];
  }

  static ActionItem _action(int i, DateTime base, int maxSteps, int factsPer) {
    final status = switch (i % 20) {
      0 => ActionStatus.archived,
      1 || 11 => ActionStatus.completed,
      _ => ActionStatus.active,
    };
    final urgency = switch (i % 7) {
      0 => ActionUrgency.critical,
      1 || 4 => ActionUrgency.important,
      6 => ActionUrgency.low,
      _ => ActionUrgency.normal,
    };

    // -21 .. +90 days, so overdue, today, tomorrow, this week and "later" are
    // all populated instead of clustering in one bucket.
    final offset = (i * 7 % 112) - 21;
    final dateOnly = i % 7 == 0;
    final due = i % 5 == 4
        ? null
        : ActionDue(
            dateOnly
                ? DateTime(2026, 8, 28 + offset)
                : DateTime(2026, 8, 28 + offset, 9 + i % 12, 30),
          );

    final created = base.subtract(Duration(hours: i * 3 + 1));
    final stepCount = i % (maxSteps + 1);

    return ActionItem(
      id: 'scale-action-${i.toString().padLeft(5, '0')}',
      sourceId: i % 3 == 0 ? null : 'scale-source-${i % 120}',
      title: _title(i),
      summary: 'Synthetic summary $i describing a routine obligation.',
      status: status,
      urgency: urgency,
      category: ActionCategory
          .values[i % ActionCategory.values.length],
      dueAt: due,
      amount: i % 4 == 0
          ? null
          : (MoneyValue.parse('${10 + i % 900}.${(i % 100).toString().padLeft(2, '0')}',
                  'GBP') as MoneyParsed)
              .value,
      recommendedNextStep: 'Next step for item $i',
      whyThisMatters: 'Why item $i matters.',
      origin: i % 6 == 0 ? ActionOrigin.manual : ActionOrigin.extraction,
      reviewedAt: created,
      createdAt: created,
      updatedAt: created.add(const Duration(minutes: 5)),
      completedAt:
          status == ActionStatus.completed ? created.add(const Duration(days: 1)) : null,
      archivedAt:
          status == ActionStatus.archived ? created.add(const Duration(days: 2)) : null,
      steps: [
        for (var s = 0; s < stepCount; s++) syntheticStep(i, s, created),
      ],
      facts: [
        for (var f = 0; f < factsPer; f++)
          ActionFactItem(
            key: 'fact_$f',
            label: _factLabels[f % _factLabels.length],
            value: _factValue(i, f),
            editedByUser: f == 0 && i % 9 == 0,
          ),
      ],
    );
  }

  /// Titles drawn from a small vocabulary, so a search needle matches a
  /// realistic *fraction* of the corpus rather than none of it or all of it.
  static String _title(int i) =>
      '${_verbs[i % _verbs.length]} ${_nouns[i % _nouns.length]} $i';

  static String _factValue(int i, int f) => switch (f % 3) {
        0 => 'REF-${(i * 37 % 100000).toString().padLeft(5, '0')}',
        1 => '£${10 + i % 900}.${(i % 100).toString().padLeft(2, '0')}',
        _ => '2026-${(i % 12) + 1}-${(i % 28) + 1}',
      };

  static ActionStepItem syntheticStep(int actionIndex, int s, DateTime born) =>
      ActionStepItem(
        id: 'scale-step-$actionIndex-$s',
        title: '${_verbs[(actionIndex + s) % _verbs.length]} step $s',
        order: s,
        description: s.isEven ? 'Detail for step $s of item $actionIndex.' : null,
        // A third of chains are partly done, and every eleventh is fully done
        // so the "all steps done" triage branch is genuinely exercised.
        isCompleted: actionIndex % 11 == 0 || (actionIndex % 3 == 0 && s == 0),
        completedAt: actionIndex % 11 == 0 ? born.add(const Duration(hours: 2)) : null,
        createdAt: born,
        updatedAt: born,
      );

  /// One long chain, for the Day-16 long-chain measurements.
  ///
  /// [idPrefix] keeps ids unique when a test builds more than one long chain
  /// in the same database; step ids are a primary key, not a position.
  static List<ActionStepItem> longChain(
    int steps, {
    DateTime? at,
    String idPrefix = 'chain',
  }) {
    final born = at ?? now;
    return [
      for (var s = 0; s < steps; s++)
        ActionStepItem(
          id: '$idPrefix-step-${s.toString().padLeft(4, '0')}',
          title: 'Chain step $s',
          order: s,
          description: s % 3 == 0 ? 'Detail for chain step $s.' : null,
          isCompleted: s % 4 == 0,
          completedAt: s % 4 == 0 ? born.add(Duration(minutes: s)) : null,
          createdAt: born,
          updatedAt: born,
        ),
    ];
  }

  /// Scheduled reminders for the first [count] Actions, all within the
  /// triage horizon so the pressing-reminder branch is exercised.
  static Map<String, ActionReminder> syntheticNextReminders(
    int count, {
    DateTime? at,
  }) {
    final base = at ?? now;
    return {
      for (var i = 0; i < count; i++)
        'scale-action-${i.toString().padLeft(5, '0')}': ActionReminder(
          id: 'scale-reminder-$i',
          actionId: 'scale-action-${i.toString().padLeft(5, '0')}',
          platformNotificationId: i + 1,
          scheduledAt: base.add(Duration(minutes: 30 + i)),
          timeZoneId: 'UTC',
          state: ReminderState.scheduled,
          createdAt: base,
          updatedAt: base,
        ),
    };
  }

  /// Captures with OCR bodies of a realistic length — the thing search has to
  /// scan, and the reason source search is the expensive half.
  static List<SourceItem> syntheticSources(int count, {int bodyWords = 220}) {
    return [
      for (var i = 0; i < count; i++)
        SourceItem(
          id: 'scale-source-$i',
          type: i % 4 == 0 ? SourceType.pastedText : SourceType.photo,
          capturedAt: now.subtract(Duration(hours: i)),
          imagePath: i % 4 == 0 ? null : '/synthetic/scale-source-$i.png',
          pastedText: i % 4 == 0 ? _body(i, bodyWords) : null,
          state: SourceProcessingState.ready,
          ocr: i % 4 == 0
              ? null
              : OcrOutcome(
                  rawText: _body(i, bodyWords),
                  normalizedText: _body(i, bodyWords),
                  lines: const [],
                  engine: 'synthetic',
                  processedAt: now,
                  durationMs: 12,
                ),
        ),
    ];
  }

  static String _body(int i, int words) {
    final buffer = StringBuffer();
    for (var w = 0; w < words; w++) {
      buffer.write(_vocab[(i + w) % _vocab.length]);
      buffer.write(w % 12 == 11 ? '\n' : ' ');
    }
    buffer.write('REF-${(i * 37 % 100000).toString().padLeft(5, '0')}');
    return buffer.toString();
  }

  static const _verbs = ['Pay', 'Renew', 'Submit', 'Review', 'Confirm', 'Cancel'];
  static const _nouns = ['invoice', 'permit', 'form', 'notice', 'statement', 'policy'];
  static const _factLabels = ['Reference', 'Amount', 'Date', 'Account'];
  static const _vocab = [
    'notice', 'account', 'balance', 'payable', 'reference', 'statement',
    'period', 'charge', 'total', 'due', 'renewal', 'policy', 'permit',
    'submission', 'deadline', 'contact', 'office', 'service', 'record',
    'number', 'amount', 'date', 'issued', 'received', 'northgate',
  ];
}
