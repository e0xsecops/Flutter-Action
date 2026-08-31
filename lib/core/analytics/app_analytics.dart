
/// Every analytics event this app can emit, in one place.
///
/// **The rule these names encode.** An event records *that* something
/// happened, never *what* it was about. Action handles bills, letters,
/// deadlines, amounts and reference numbers — the exact material that must
/// not become telemetry. So no event name is ever built from data, and the
/// catalogue is closed: if a name is not here, it cannot be sent.
///
/// The funnel these support, end to end, without a single piece of content:
///
///   capture_started → extraction_succeeded / extraction_manual_fallback
///     → review_confirmed → action_created → action_completed
///
/// That is enough to answer "where do people fall out?" and "is extraction
/// working?", which is the whole reason to measure anything.
abstract final class AnalyticsEvents {
  // ----------------------------------------------------------------- app --
  static const appOpened = 'app_opened';
  static const onboardingCompleted = 'onboarding_completed';

  // ------------------------------------------------------------- capture --
  static const captureStarted = 'capture_started';
  static const captureSucceeded = 'capture_succeeded';
  static const captureFailed = 'capture_failed';

  // ---------------------------------------------------------- extraction --
  static const extractionStarted = 'extraction_started';
  static const extractionSucceeded = 'extraction_succeeded';
  static const extractionNeedsReview = 'extraction_needs_review';
  static const extractionManualFallback = 'extraction_manual_fallback';
  static const extractionFailed = 'extraction_failed';

  // -------------------------------------------------------------- review --
  static const reviewOpened = 'review_opened';
  static const reviewConfirmed = 'review_confirmed';
  static const reviewCancelled = 'review_cancelled';
  static const reviewFieldEdited = 'review_field_edited';
  static const reviewEvidenceViewed = 'review_evidence_viewed';

  // -------------------------------------------------------------- action --
  static const actionCreated = 'action_created';
  static const actionOpened = 'action_opened';
  static const actionEdited = 'action_edited';
  static const actionCompleted = 'action_completed';
  static const actionReopened = 'action_reopened';
  static const actionArchived = 'action_archived';
  static const actionLocalPersistenceFailed = 'action_local_persistence_failed';
  static const actionCloudMirrorSucceeded = 'action_cloud_mirror_succeeded';
  static const actionCloudMirrorFailed = 'action_cloud_mirror_failed';

  // --------------------------------------------------------------- chain --
  static const stepAdded = 'step_added';
  static const stepCompleted = 'step_completed';
  static const stepReopened = 'step_reopened';
  static const stepEdited = 'step_edited';
  static const stepDeleted = 'step_deleted';
  static const stepReordered = 'step_reordered';

  // ------------------------------------------------------------ reminder --
  static const reminderCreated = 'reminder_created';
  static const reminderUpdated = 'reminder_updated';
  static const reminderCancelled = 'reminder_cancelled';
  static const reminderPermissionDenied = 'reminder_permission_denied';
  static const reminderScheduleFailed = 'reminder_schedule_failed';
  static const reminderOpened = 'reminder_opened';

  // -------------------------------------------------------------- search --
  //
  // Two events, and neither carries the query. What is worth knowing is
  // whether search gets used and whether it finds anything; what someone
  // typed is theirs.
  static const searchOpened = 'search_opened';
  static const searchNoResults = 'search_no_results';

  // ------------------------------------------------------------- privacy --
  static const privacyDeleteStarted = 'privacy_delete_started';
  static const privacyDeleteCompleted = 'privacy_delete_completed';
  static const privacyDeletePartial = 'privacy_delete_partial';

  // ------------------------------------------------------------ settings --
  static const appearanceChanged = 'appearance_changed';

  /// The closed set. Anything not in here is not an event.
  static const all = <String>{
    appOpened, onboardingCompleted,
    captureStarted, captureSucceeded, captureFailed,
    extractionStarted, extractionSucceeded, extractionNeedsReview,
    extractionManualFallback, extractionFailed,
    reviewOpened, reviewConfirmed, reviewCancelled, reviewFieldEdited,
    reviewEvidenceViewed,
    actionCreated, actionOpened, actionEdited, actionCompleted,
    actionReopened, actionArchived, actionLocalPersistenceFailed,
    actionCloudMirrorSucceeded, actionCloudMirrorFailed,
    stepAdded, stepCompleted, stepReopened, stepEdited, stepDeleted,
    stepReordered,
    reminderCreated, reminderUpdated, reminderCancelled,
    reminderPermissionDenied, reminderScheduleFailed, reminderOpened,
    searchOpened, searchNoResults,
    privacyDeleteStarted, privacyDeleteCompleted, privacyDeletePartial,
    appearanceChanged,
  };
}

/// The only parameters an event may carry, and the only values they may take.
///
/// Both halves matter. An allowlist of *keys* alone would still let
/// `capture_type: "Northgate Water invoice.pdf"` through; pinning the
/// *values* to closed sets is what makes that impossible. Every allowed value
/// below is a word this source file chose, so no parameter can ever contain
/// anything a user typed, a document said, or a model returned.
///
/// Deliberately absent, and worth naming so nobody adds them later: query,
/// title, summary, amount, currency, due date, organisation, reference,
/// action id, source id, uid, file path, OCR text, evidence quote, model
/// output.
abstract final class AnalyticsParams {
  /// How a capture was started.
  static const captureType = 'capture_type';
  /// Extended at V2 for Android share-in. Two values rather than one, because
  /// "someone sent Action a screenshot" and "someone sent Action some text"
  /// are different product facts and collapsing them would lose the only
  /// interesting half. Still a closed set of machine words: nothing about
  /// *what* was shared can reach this.
  static const captureTypeValues = {
    'camera',
    'gallery',
    'paste',
    'share_text',
    'share_image',
    'share_document',
    'document',
  };

  /// How an extraction attempt ended.
  static const extractionOutcome = 'extraction_outcome';
  static const extractionOutcomeValues = {
    'success',
    'needs_review',
    'manual',
    'failed',
  };

  /// A short machine word for why something failed. Never a message, never a
  /// provider body — the same classes the outbox and reminder stores already
  /// record.
  static const failureClass = 'failure_class';

  /// Which appearance the user chose.
  static const themeMode = 'theme_mode';
  static const themeModeValues = {'system', 'light', 'dark'};

  /// Whether a privacy deletion could account for everything.
  static const deletionVerified = 'deletion_verified';
  static const deletionVerifiedValues = {'yes', 'no'};

  static const allowed = <String, Set<String>?>{
    captureType: captureTypeValues,
    extractionOutcome: extractionOutcomeValues,
    themeMode: themeModeValues,
    deletionVerified: deletionVerifiedValues,
    // Null means "no fixed value set", which applies only to failure classes.
    // Those are machine words minted by our own code, and the length cap
    // below is the backstop against one ever carrying something longer.
    failureClass: null,
  };

  /// A failure class is a token like `auth_unavailable`. Anything longer, or
  /// containing a space, is prose that does not belong in telemetry.
  static const maxFailureClassLength = 40;
}

/// Thrown in debug and tests when something tries to log content.
///
/// Deliberately loud where a developer will see it and silent in release: a
/// mistake here should fail a test rather than ship, but it must never take a
/// user's app down for the sake of a metric.
class AnalyticsContractViolation implements Exception {
  const AnalyticsContractViolation(this.reason);
  final String reason;

  @override
  String toString() => 'AnalyticsContractViolation: $reason';
}

/// Where product analytics goes.
///
/// One seam, so `FirebaseAnalytics` is named in exactly one file and swapping
/// it — or turning it off — is a change to a provider rather than a hunt
/// through the app.
abstract interface class AppAnalytics {
  /// Records that [name] happened.
  ///
  /// Never throws and never blocks anything a person is waiting for: the
  /// future returned is safe to drop, and every implementation swallows its
  /// own failures. Analytics that can break the product is worse than no
  /// analytics.
  Future<void> log(String name, {Map<String, String>? parameters});
}

/// Checks an event against the catalogue and the parameter contract.
///
/// Shared by every implementation, including the fake, so a test proves the
/// same rule production runs. Returns the parameters to send, which in
/// release is "the safe ones" — an event with a bad parameter still counts,
/// it just loses the parameter. Dropping the event too would hide the
/// mistake; sending the parameter would be the mistake.
Map<String, String> validateAnalytics(
  String name,
  Map<String, String>? parameters,
) {
  void fail(String reason) {
    // assert runs in debug and in `flutter test`, and is stripped from
    // release — exactly the split this needs.
    assert(() {
      throw AnalyticsContractViolation(reason);
    }());
  }

  if (!AnalyticsEvents.all.contains(name)) {
    fail('unknown event "$name" - add it to AnalyticsEvents, do not build '
        'names from data');
    return const {};
  }
  if (parameters == null || parameters.isEmpty) return const {};

  final safe = <String, String>{};
  for (final entry in parameters.entries) {
    final allowedValues = AnalyticsParams.allowed[entry.key];
    if (!AnalyticsParams.allowed.containsKey(entry.key)) {
      fail('parameter "${entry.key}" is not on the allowlist');
      continue;
    }
    if (allowedValues != null && !allowedValues.contains(entry.value)) {
      // The value is not named because it may be the very content this is
      // stopping from travelling.
      fail('parameter "${entry.key}" carried a value outside its closed set');
      continue;
    }
    if (allowedValues == null &&
        (entry.value.length > AnalyticsParams.maxFailureClassLength ||
            entry.value.contains(' '))) {
      fail('parameter "${entry.key}" looks like prose, not a machine word');
      continue;
    }
    safe[entry.key] = entry.value;
  }
  return safe;
}

/// Analytics that goes nowhere.
///
/// The default in tests, and the implementation a build with no cloud gets.
class NoopAppAnalytics implements AppAnalytics {
  const NoopAppAnalytics();

  @override
  Future<void> log(String name, {Map<String, String>? parameters}) async {
    // Still validated, so a contract mistake fails in a test that overrode
    // analytics away rather than hiding until someone runs the real thing.
    validateAnalytics(name, parameters);
  }
}

/// Records what was logged, for tests that want to assert on it.
class RecordingAppAnalytics implements AppAnalytics {
  final events = <({String name, Map<String, String> parameters})>[];

  List<String> get names => [for (final e in events) e.name];

  @override
  Future<void> log(String name, {Map<String, String>? parameters}) async {
    events.add((name: name, parameters: validateAnalytics(name, parameters)));
  }
}
