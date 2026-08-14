import 'action_draft.dart';
import 'escalation.dart';
import 'extraction_schema.dart';

/// What went wrong, in a form the app can reason about rather than a string.
///
/// Typed because these drive behaviour: some downgrade one field, some drop an
/// element, some make the whole draft unusable. A message alone could only be
/// logged.
enum ExtractionIssueCode {
  malformedJson('The response was not valid JSON.'),
  unsupportedSchemaVersion('The response used a schema version this app does not understand.'),
  missingRequiredKey('A required key was absent.'),
  invalidEnumValue('A value was outside the allowed set.'),
  emptyTitle('The draft had no title.'),
  invalidDate('A date could not be read as a real calendar date.'),
  invalidNumber('A number could not be read as a number.'),
  invalidMoney('An amount could not be read as a sum of money.'),
  unsupportedCurrency('The currency is not one this app supports.'),
  negativeAmount('A negative amount was given where a sum due was expected.'),
  evidenceMissing('A value was asserted with no supporting quote.'),
  evidenceUnresolved('The supporting quote could not be found in the document.'),
  valueNotSupportedByEvidence('The value does not appear in the quote offered as its evidence.'),
  ungroundedConsequence('A consequence was claimed that the document does not state.'),
  ungroundedStep('A step was proposed with no supporting quote.'),
  duplicateStep('The same step was proposed more than once.'),
  duplicateFieldKey('The same field key was returned more than once.'),
  excessiveOutput('The response contained more items than the contract allows.'),
  unconfirmableConfidence('The response claimed a value was confirmed; only a person can confirm.'),
  urgencyWithoutReason('An urgency was asserted with no reason given.'),
  injectionAttemptInDocument('The document contains text written as instructions. It was treated as content.');

  const ExtractionIssueCode(this.description);

  final String description;

  static ExtractionIssueCode? fromName(String? name) {
    for (final code in ExtractionIssueCode.values) {
      if (code.name == name) return code;
    }
    return null;
  }
}

/// What the validator did about a problem.
enum ExtractionIssueSeverity {
  /// The whole draft was discarded. The user types it in themselves.
  rejected,

  /// An element was kept but demoted to needing review.
  downgraded,

  /// An element was removed; the rest of the draft stands.
  dropped,

  /// Recorded for visibility. Nothing changed.
  noted;

  static ExtractionIssueSeverity fromName(String? name) =>
      ExtractionIssueSeverity.values.firstWhere(
        (v) => v.name == name,
        orElse: () => ExtractionIssueSeverity.noted,
      );
}

class ExtractionIssue {
  const ExtractionIssue({
    required this.code,
    required this.severity,
    this.detail,
    this.path,
  });

  final ExtractionIssueCode code;
  final ExtractionIssueSeverity severity;

  /// Extra context. Never a stack trace, and never the document text itself —
  /// these can end up in a crash report.
  final String? detail;

  /// Where in the payload, e.g. `fields[2].evidence`. For debugging the
  /// contract, not for the user.
  final String? path;

  String get message => detail == null
      ? code.description
      : '${code.description} ($detail)';

  Map<String, dynamic> toJson() => {
        'code': code.name,
        'severity': severity.name,
        if (detail != null) 'detail': detail,
        if (path != null) 'path': path,
      };

  static ExtractionIssue? fromJson(Map<String, dynamic> json) {
    final code = ExtractionIssueCode.fromName(json['code'] as String?);
    if (code == null) return null;
    return ExtractionIssue(
      code: code,
      severity: ExtractionIssueSeverity.fromName(json['severity'] as String?),
      detail: json['detail'] as String?,
      path: json['path'] as String?,
    );
  }

  @override
  String toString() => '${severity.name}: ${code.name}${path == null ? '' : ' @$path'}';
}

/// Everything one extraction run established, including what it refused to
/// establish.
///
/// There is no failure variant. A run that produced nothing usable is still an
/// [ExtractionResult] — with a null [draft], a
/// [ExtractionReviewState.manualEntryRequired] state and issues explaining
/// why. That is deliberate: the manual path has to stay reachable from every
/// outcome, and an exception thrown out of this layer would be one more way for
/// a screen to end up with nothing to render.
class ExtractionResult {
  const ExtractionResult({
    required this.sourceId,
    required this.reviewState,
    required this.engine,
    required this.producedAt,
    this.schemaVersion = extractionSchemaVersion,
    this.draft,
    this.noActionRequired = false,
    this.issues = const [],
    this.escalation = const EscalationAssessment.none(),
    this.durationMs = 0,
  });

  /// A run that produced nothing the user could confirm.
  ExtractionResult.manualEntryRequired({
    required this.sourceId,
    required this.engine,
    required this.producedAt,
    required this.issues,
    this.escalation = const EscalationAssessment.none(),
    this.durationMs = 0,
  })  : schemaVersion = extractionSchemaVersion,
        draft = null,
        noActionRequired = false,
        reviewState = ExtractionReviewState.manualEntryRequired;

  final int schemaVersion;
  final String sourceId;

  /// Null when the document needs no action, or when nothing usable came back.
  /// [noActionRequired] distinguishes the two.
  final ActionDraft? draft;

  /// The document was understood and asks nothing of the user. A real,
  /// successful outcome — not a failure to find anything.
  final bool noActionRequired;

  final List<ExtractionIssue> issues;
  final ExtractionReviewState reviewState;
  final EscalationAssessment escalation;

  /// Which implementation produced this, e.g. `fixture`. Recorded so a fixture
  /// run is never mistaken for a provider run in stored data or a bug report.
  final String engine;

  final DateTime producedAt;
  final int durationMs;

  /// Whether there is something for the user to confirm.
  bool get hasDraft => draft != null;

  bool get requiresManualEntry =>
      reviewState == ExtractionReviewState.manualEntryRequired;

  List<ExtractionIssue> issuesOfSeverity(ExtractionIssueSeverity severity) =>
      issues.where((i) => i.severity == severity).toList(growable: false);

  bool hasIssue(ExtractionIssueCode code) => issues.any((i) => i.code == code);

  Map<String, dynamic> toJson() => {
        'schemaVersion': schemaVersion,
        'sourceId': sourceId,
        'reviewState': reviewState.name,
        'noActionRequired': noActionRequired,
        'engine': engine,
        'producedAt': producedAt.toIso8601String(),
        'durationMs': durationMs,
        'issues': issues.map((i) => i.toJson()).toList(),
        'escalation': escalation.toJson(),
        if (draft != null) 'draft': draft!.toJson(),
      };

  static ExtractionResult fromJson(Map<String, dynamic> json) =>
      ExtractionResult(
        schemaVersion:
            (json['schemaVersion'] as num?)?.toInt() ?? extractionSchemaVersion,
        sourceId: json['sourceId'] as String? ?? '',
        reviewState:
            ExtractionReviewState.fromName(json['reviewState'] as String?),
        noActionRequired: json['noActionRequired'] as bool? ?? false,
        engine: json['engine'] as String? ?? 'unknown',
        producedAt: DateTime.tryParse(json['producedAt'] as String? ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        durationMs: (json['durationMs'] as num?)?.toInt() ?? 0,
        issues: (json['issues'] as List? ?? const [])
            .whereType<Map<String, dynamic>>()
            .map(ExtractionIssue.fromJson)
            .whereType<ExtractionIssue>()
            .toList(),
        escalation: EscalationAssessment.fromJson(json['escalation'] as List?),
        draft: json['draft'] is Map<String, dynamic>
            ? ActionDraft.fromJson(json['draft'] as Map<String, dynamic>)
            : null,
      );
}
