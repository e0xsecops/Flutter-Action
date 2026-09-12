/// Localized names for the enums the UI shows.
///
/// **Why the labels are not on the enums.** Several of these enums carry an
/// English `label` already, and that field earns its place: it is what the
/// diagnostics harness prints, what the fixture reports compare against, and
/// what a domain test asserts without pumping a widget tree. What it cannot be
/// is the string on screen, because a `const` enum field cannot depend on the
/// locale.
///
/// So the enum keeps the canonical English and the screen asks for the
/// translation. The two are separate on purpose: `ActionCategory.unknown.label`
/// is a stable identifier for a category in a log, and
/// `ActionCategory.unknown.labelIn(l10n)` is what a person reads.
library;

import 'package:intl/intl.dart';

import '../core/security/credential_scanner.dart';
import '../core/security/device_lock.dart';
import '../core/security/file_identity.dart';
import '../core/security/link_inspector.dart';
import '../features/actions/application/reminder_presets.dart';
import '../features/capture/data/ocr_service.dart';
import '../features/capture/domain/document_intake.dart';
import '../features/capture/domain/ocr_script.dart';
import '../features/capture/domain/pdf_probe.dart';
import '../features/capture/domain/shared_payload.dart';
import '../features/capture/domain/source_item.dart';
import '../features/extraction/application/action_review_state.dart';
import '../features/extraction/data/extraction_transport.dart';
import '../features/extraction/domain/escalation.dart';
import '../features/extraction/domain/extraction_schema.dart';
import '../features/extraction/domain/money_value.dart';
import '../features/goals/domain/goal.dart';
import '../features/intelligence/application/intelligence_runner.dart';
import '../features/intelligence/data/ai_http.dart';
import '../features/intelligence/data/authenticity_inspector.dart';
import '../features/intelligence/data/tools/create_tools.dart';
import '../features/intelligence/data/tools/understand_tools.dart';
import '../features/intelligence/data/fact_preservation.dart';
import '../features/intelligence/data/sensitive_scanner.dart';
import '../features/intelligence/domain/ai_capabilities.dart';
import '../features/intelligence/domain/ai_failure.dart';
import '../features/intelligence/domain/ai_provider_config.dart';
import '../features/intelligence/domain/intelligence_result.dart';
import '../features/intelligence/domain/intelligence_tool.dart';
import '../features/intelligence/domain/tool_copy.dart';
import '../features/library/presentation/library_screen.dart';
import '../features/library/presentation/source_card.dart';
import '../features/search/domain/search_result.dart';
import 'casing.dart';
import 'gen/app_l10n.dart';

extension ActionCategoryL10n on ActionCategory {
  String labelIn(AppL10n l10n) => switch (this) {
        ActionCategory.payment => l10n.categoryPayment,
        ActionCategory.renewal => l10n.categoryRenewal,
        ActionCategory.appointment => l10n.categoryAppointment,
        ActionCategory.booking => l10n.categoryBooking,
        ActionCategory.travel => l10n.categoryTravel,
        ActionCategory.deadline => l10n.categoryDeadline,
        ActionCategory.response => l10n.categoryResponse,
        ActionCategory.delivery => l10n.categoryDelivery,
        ActionCategory.document => l10n.categoryDocument,
        ActionCategory.noActionRequired => l10n.categoryNoActionRequired,
        // Deliberately still an admission rather than a neutral "other".
        ActionCategory.unknown => l10n.categoryUnsure,
      };
}

extension SourceTypeL10n on SourceType {
  String provenanceIn(AppL10n l10n) => switch (this) {
        SourceType.photo => l10n.provenancePhoto,
        SourceType.gallery => l10n.provenanceImage,
        SourceType.pastedText => l10n.provenancePastedText,
        SourceType.document => l10n.provenanceDocument,
      };
}

extension CaptureStageL10n on CaptureStage {
  String labelIn(AppL10n l10n) => switch (this) {
        CaptureStage.reading => l10n.stageReading,
        CaptureStage.needsReview => l10n.stageNeedsReview,
        CaptureStage.actioned => l10n.stageActionCreated,
        CaptureStage.noText => l10n.stageNoText,
        CaptureStage.failed => l10n.stageCouldNotBeRead,
      };
}

extension IntelligenceCategoryL10n on IntelligenceCategory {
  String labelIn(AppL10n l10n) => switch (this) {
        IntelligenceCategory.understand => l10n.categoryUnderstand,
        IntelligenceCategory.plan => l10n.categoryPlan,
        IntelligenceCategory.create => l10n.categoryCreate,
        IntelligenceCategory.extract => l10n.categoryExtract,
        IntelligenceCategory.verify => l10n.categoryVerify,
      };

  String blurbIn(AppL10n l10n) => switch (this) {
        IntelligenceCategory.understand => l10n.categoryUnderstandBlurb,
        IntelligenceCategory.plan => l10n.categoryPlanBlurb,
        IntelligenceCategory.create => l10n.categoryCreateBlurb,
        IntelligenceCategory.extract => l10n.categoryExtractBlurb,
        IntelligenceCategory.verify => l10n.categoryVerifyBlurb,
      };
}

extension LibrarySegmentL10n on LibrarySegment {
  String labelIn(AppL10n l10n) => switch (this) {
        LibrarySegment.actions => l10n.librarySegmentActions,
        LibrarySegment.captures => l10n.librarySegmentCaptures,
        LibrarySegment.goals => l10n.librarySegmentGoals,
        LibrarySegment.done => l10n.librarySegmentDone,
      };
}

extension ActionUrgencyL10n on ActionUrgency {
  String labelIn(AppL10n l10n) => switch (this) {
        ActionUrgency.critical => l10n.urgencyCritical,
        ActionUrgency.important => l10n.urgencyImportant,
        ActionUrgency.normal => l10n.urgencyNormal,
        ActionUrgency.low => l10n.urgencyLow,
        // Never the calm "Low": not knowing and knowing it is minor are
        // different claims.
        ActionUrgency.unknown => l10n.urgencyUnsure,
      };
}

extension OcrScriptL10n on OcrScript {
  String labelIn(AppL10n l10n) => switch (this) {
        OcrScript.latin => l10n.ocrScriptLatin,
        OcrScript.chinese => l10n.ocrScriptChinese,
        OcrScript.devanagari => l10n.ocrScriptDevanagari,
        OcrScript.japanese => l10n.ocrScriptJapanese,
        OcrScript.korean => l10n.ocrScriptKorean,
      };

  /// What the script covers, in the reader's language.
  ///
  /// Devanagari's is the one that has to work hardest: it is the only entry
  /// whose name a reader can plausibly mistake for their own language when it
  /// is not, so its description says which languages it is *not*.
  String descriptionIn(AppL10n l10n) => switch (this) {
        OcrScript.latin => l10n.ocrScriptLatinDescription,
        OcrScript.chinese => l10n.ocrScriptChineseDescription,
        OcrScript.devanagari => l10n.ocrScriptDevanagariDescription,
        OcrScript.japanese => l10n.ocrScriptJapaneseDescription,
        OcrScript.korean => l10n.ocrScriptKoreanDescription,
      };
}

extension ReminderPresetKindL10n on ReminderPresetKind {
  String labelIn(AppL10n l10n) => switch (this) {
        ReminderPresetKind.inOneHour => l10n.reminderPresetInHour,
        ReminderPresetKind.tomorrowMorning =>
          l10n.reminderPresetTomorrowMorning,
        ReminderPresetKind.nextWeek => l10n.reminderPresetNextWeek,
        ReminderPresetKind.onTheDay => l10n.reminderPresetOnTheDay,
        ReminderPresetKind.oneDayBefore => l10n.reminderPresetDayBefore,
        ReminderPresetKind.oneWeekBefore => l10n.reminderPresetWeekBefore,
        ReminderPresetKind.atTheDeadline => l10n.reminderPresetAtDeadline,
        ReminderPresetKind.oneHourBefore => l10n.reminderPresetHourBefore,
      };
}

extension AppLockDelayL10n on AppLockDelay {
  String labelIn(AppL10n l10n) => switch (this) {
        AppLockDelay.immediately => l10n.appLockDelayImmediately,
        AppLockDelay.afterOneMinute => l10n.appLockDelayOneMinute,
        AppLockDelay.afterFiveMinutes => l10n.appLockDelayFiveMinutes,
      };
}


// --------------------------------------------------------------------------
// Goals
// --------------------------------------------------------------------------

/// The three Goal states, in the reader's language.
///
/// The member names stay English because they are storage: `GoalStatus.name`
/// is what `Goal.toJson` writes and `GoalStatus.fromName` reads back, so a
/// localized status would orphan every Goal already on the device.
///
/// [GoalStatus.achieved] reads **"Reached"** rather than "Achieved". The enum
/// member carries the storage name; the screen carries the word the product
/// has always shown. It is also the one label here that must not borrow the
/// Action completion vocabulary — `commonDone`, `searchFilterCompleted`,
/// `librarySegmentDone` — because a goal the user marked reached and a task
/// the user finished are different claims, and Goal.achieved is explicitly
/// never inferred from the linked Actions.
///
/// `active` and `archived` reuse the labels the rest of the app already shows
/// for the same two ideas instead of minting goal-only twins that would drift
/// apart in twenty languages.
extension GoalStatusL10n on GoalStatus {
  String labelIn(AppL10n l10n) => switch (this) {
        GoalStatus.active => l10n.searchFilterActive,
        GoalStatus.achieved => l10n.goalStatusReached,
        GoalStatus.archived => l10n.detailArchived,
      };
}


// --------------------------------------------------------------------------
// Capture: what Action refused, and why
// --------------------------------------------------------------------------

/// Why Action refused a document, in the reader's language.
///
/// The English stays on `RejectedDocument.message`: it is what a log line
/// carries and what `test/capture/document_intake_test.dart` asserts, and it
/// must not change with the phone's language. This is the same refusal for a
/// person to read.
///
/// [DocumentRejection.notAPdf] and [DocumentRejection.notAPdfOnInspection] map
/// to two different keys on purpose. They are two different checks — the bytes
/// at the front, then the structure inside — and each already said so in its
/// own sentence in English. Collapsing them here would silently rewrite one of
/// them for every locale.
extension DocumentRejectionL10n on DocumentRejection {
  /// [size] is only read for [DocumentRejection.tooLarge], whose sentence
  /// names it. Callers should prefer `RejectedDocumentL10n.messageIn`, which
  /// supplies it from the rejection itself.
  String messageIn(AppL10n l10n, {int? size}) => switch (this) {
        DocumentRejection.empty => l10n.documentRejectedEmpty,
        DocumentRejection.tooLarge =>
          l10n.documentRejectedTooLarge(formatBytes(size ?? 0)),
        DocumentRejection.notAPdf => l10n.documentRejectedNotAPdf,
        DocumentRejection.notAPdfOnInspection => l10n.pdfRejectedNotAPdf,
        DocumentRejection.encrypted => l10n.pdfRejectedEncrypted,
        DocumentRejection.damaged => l10n.pdfRejectedDamaged,
        DocumentRejection.unreadable => l10n.documentRejectedUnreadable,
      };
}

/// The refusal a screen should show.
///
/// Every site that currently reads `RejectedDocument.message` for display
/// should read this instead; `message` stays for logs and tests.
extension RejectedDocumentL10n on RejectedDocument {
  String messageIn(AppL10n l10n) => reason.messageIn(l10n, size: sizeBytes);
}

/// Why a PDF could not be used, in the reader's language.
///
/// Kept alongside `describePdfRejection`, which stays the canonical English —
/// `test/capture/pdf_probe_test.dart` reads that one.
extension PdfRejectionL10n on PdfRejection {
  String messageIn(AppL10n l10n) => switch (this) {
        PdfRejection.notAPdf => l10n.pdfRejectedNotAPdf,
        PdfRejection.encrypted => l10n.pdfRejectedEncrypted,
        PdfRejection.damaged => l10n.pdfRejectedDamaged,
      };
}

extension PdfProbeResultL10n on PdfProbeResult {
  /// The page phrase for a scope disclosure, or null when the count is
  /// unknown — the same fail-closed rule `pageSentence` follows, because a
  /// confident wrong number in a sentence about spending the user's money is
  /// worse than an honest vaguer one.
  ///
  /// Reuses `sourcePageCount`, which is already the app's plural for this
  /// exact phrase, rather than minting a second one that would drift.
  String? pageSentenceIn(AppL10n l10n) {
    final count = pageCount;
    return count == null ? null : l10n.sourcePageCount(count);
  }
}

/// Why a share was refused, in the reader's language.
///
/// `describeShareRejection` stays the canonical English;
/// `test/capture/share_validator_test.dart` asserts against it.
extension ShareRejectionL10n on ShareRejection {
  String messageIn(AppL10n l10n) => switch (this) {
        ShareRejection.empty => l10n.shareRejectedEmpty,
        ShareRejection.unsupportedType => l10n.shareRejectedUnsupportedType,
        ShareRejection.contentMismatch => l10n.shareRejectedContentMismatch,
        ShareRejection.tooLarge => l10n.shareRejectedTooLarge,
        ShareRejection.unreadable => l10n.shareRejectedUnreadable,
      };
}

/// The refusal a screen should show for a rejected share.
extension SharedRejectedL10n on SharedRejected {
  String messageIn(AppL10n l10n) => reason.messageIn(l10n);
}

/// Why a capture could not be read, in the reader's language.
extension CaptureReadFailureL10n on CaptureReadFailure {
  String messageIn(AppL10n l10n) => switch (this) {
        CaptureReadFailure.recognitionDidNotRun =>
          l10n.captureFailureRecognition,
        CaptureReadFailure.imageFormatUnreadable =>
          l10n.captureFailureImageFormat,
      };
}

/// A stored `SourceItem.failureReason`, in the reader's language.
///
/// **Why a lookup rather than a stored code.** `failureReason` is a plain
/// string in the record on disk, written once at capture time. Storing the
/// translation would freeze a capture in whatever language the phone happened
/// to be in that day, so Action stores its canonical English and this maps it
/// back at the moment it is shown.
///
/// Returns [stored] unchanged when it is not a sentence Action wrote — an
/// older build, or a reason from somewhere else. Showing the English is worse
/// than showing the reader's language and far better than showing nothing:
/// a failed capture with no reason offers no way to decide between retrying
/// and typing it in by hand.
String? localizedFailureReason(String? stored, AppL10n l10n) =>
    CaptureReadFailure.forStoredMessage(stored)?.messageIn(l10n) ?? stored;


// --------------------------------------------------------------------------
// Extraction, review and search
// --------------------------------------------------------------------------

extension MoneyParseErrorL10n on MoneyParseError {
  /// Why an amount was refused, as a sentence fragment for
  /// `l10n.reviewAmountError`.
  ///
  /// Lowercase and unterminated in every locale that punctuates like English,
  /// because it is never shown on its own — it is the tail of "Cannot use this
  /// amount: …".
  String reasonIn(AppL10n l10n) => switch (this) {
        MoneyParseError.empty => l10n.moneyErrorEmpty,
        MoneyParseError.malformed => l10n.moneyErrorMalformed,
        MoneyParseError.negative => l10n.moneyErrorNegative,
        MoneyParseError.tooManyDecimals => l10n.moneyErrorTooManyDecimals,
        // An admission about this build's allowlist, not a claim that the
        // currency is not real.
        MoneyParseError.unsupportedCurrency =>
          l10n.moneyErrorUnsupportedCurrency,
        MoneyParseError.outOfRange => l10n.moneyErrorOutOfRange,
      };
}

extension ExtractionEscalationSignalL10n on ExtractionEscalationSignal {
  /// What the capture could not be read to establish, in the reader's
  /// language.
  ///
  /// Every one of these is a statement about a limit of the reading, which is
  /// why the review screen puts them above the values it is asking the user to
  /// confirm. Two of them — [ExtractionEscalationSignal.tableLikeLayout] and
  /// [ExtractionEscalationSignal.instructionLikeContent] — are handled
  /// separately by that screen with its own longer wording
  /// (`reviewLayoutNotice`, `reviewInjectionNotice`), so their entries here are
  /// the domain's own sentence and are not currently rendered. They are still
  /// translated: the switch has to be exhaustive, and any other caller of
  /// `reasonIn` gets a real sentence rather than a hole.
  String reasonIn(AppL10n l10n) => switch (this) {
        ExtractionEscalationSignal.ocrFailed => l10n.escalationOcrFailed,
        ExtractionEscalationSignal.noTextRecognised =>
          l10n.escalationNoTextRecognised,
        ExtractionEscalationSignal.thinText => l10n.escalationThinText,
        ExtractionEscalationSignal.lowLineConfidence =>
          l10n.escalationLowLineConfidence,
        ExtractionEscalationSignal.tableLikeLayout =>
          l10n.escalationTableLikeLayout,
        ExtractionEscalationSignal.fragmentedLayout =>
          l10n.escalationFragmentedLayout,
        ExtractionEscalationSignal.malformedText =>
          l10n.escalationMalformedText,
        ExtractionEscalationSignal.conflictingDates =>
          l10n.escalationConflictingDates,
        ExtractionEscalationSignal.conflictingAmounts =>
          l10n.escalationConflictingAmounts,
        ExtractionEscalationSignal.unresolvedGrounding =>
          l10n.escalationUnresolvedGrounding,
        ExtractionEscalationSignal.instructionLikeContent =>
          l10n.escalationInstructionLikeContent,
      };
}

extension ProviderFailureKindL10n on ProviderFailureKind {
  /// The sentence shown when extraction never got an answer.
  ///
  /// [ProviderFailureKind.quotaExceeded] and
  /// [ProviderFailureKind.serviceUnavailable] deliberately share one string:
  /// they are the same event to a reader who does not hold the key and cannot
  /// act on a quota. They stay separate members because the analytics and the
  /// retry policy tell them apart.
  String userMessageIn(AppL10n l10n) => switch (this) {
        ProviderFailureKind.network => l10n.providerFailureNetwork,
        ProviderFailureKind.timedOut => l10n.providerFailureTimedOut,
        ProviderFailureKind.quotaExceeded ||
        ProviderFailureKind.serviceUnavailable =>
          l10n.providerFailureServiceUnavailable,
        ProviderFailureKind.unauthorized => l10n.providerFailureUnauthorized,
        ProviderFailureKind.blocked => l10n.providerFailureBlocked,
        ProviderFailureKind.unknown => l10n.providerFailureUnknown,
      };
}

extension ReviewBlockerKindL10n on ReviewBlockerKind {
  /// The open question, named in the reader's language.
  ///
  /// Shown under the confirm button and repeated in a snackbar if the button
  /// is pressed anyway. Each one names a decision only the user can make; none
  /// of them may read as something Action will resolve on its own.
  String messageIn(AppL10n l10n) => switch (this) {
        ReviewBlockerKind.titleMissing => l10n.reviewBlockerTitle,
        ReviewBlockerKind.dateUndecided => l10n.reviewBlockerDate,
        ReviewBlockerKind.amountUndecided => l10n.reviewBlockerAmount,
        ReviewBlockerKind.stepTitleMissing => l10n.reviewBlockerStepTitle,
      };
}

extension ReviewEditRejectedL10n on ReviewEditRejected {
  /// Why a typed edit was refused, in the reader's language.
  ///
  /// The date case reuses `reviewBadDate`, the sentence the date sheet already
  /// shows for exactly this condition, rather than minting a second wording of
  /// the same refusal. The example date inside it is the ISO format the field
  /// parses; the digits and dashes are syntax, not prose.
  String reasonIn(AppL10n l10n) {
    final money = moneyError;
    if (money != null) return l10n.reviewAmountError(money.reasonIn(l10n));
    return switch (rejection) {
      ReviewEditRejection.notADate => l10n.reviewBadDate,
      // Unreachable: every amount rejection is built with its parser error.
      // Falls back to the canonical English rather than inventing a reason.
      ReviewEditRejection.notAnAmount => reason,
    };
  }
}

extension MatchFieldL10n on MatchField {
  /// The short label above a search result's snippet — "Title", "Step" — in
  /// the reader's language.
  ///
  /// Null for the two fact fields, and that is the point: their label is the
  /// user's own fact name ("Reference number", "Policy holder"), read out of
  /// their document. Translating it would be inventing a fact. Callers render
  /// `field.labelIn(l10n) ?? match.label`.
  String? labelIn(AppL10n l10n) => switch (this) {
        MatchField.titleExact ||
        MatchField.titlePrefix ||
        MatchField.titleContains =>
          l10n.searchMatchTitle,
        MatchField.factExact || MatchField.factContains => null,
        MatchField.recommendedNextStep => l10n.searchMatchNextStep,
        MatchField.stepTitle => l10n.searchMatchStep,
        MatchField.summary => l10n.searchMatchSummary,
        MatchField.sourceText => l10n.searchMatchFromCapture,
      };
}

extension IntelligenceCitationL10n on IntelligenceCitation {
  /// "page 3" / "pages 3–6", built from the numbers rather than translated
  /// from the English.
  ///
  /// The provider hands down a finished string, and a finished string cannot
  /// be pluralised afterwards — "page" inflects with the number in Russian and
  /// Polish, and the range mark is not the same character in every locale. So
  /// the label is rebuilt here from [IntelligenceCitation.startPage] and
  /// [IntelligenceCitation.endPage], which travel alongside it for this
  /// reason.
  ///
  /// Falls back to the English [IntelligenceCitation.pageLabel] only for a
  /// citation that carried a label without numbers, and returns null when
  /// there is no page at all — a citation must never point at a page nobody
  /// established.
  String? pageLabelIn(AppL10n l10n) {
    final start = startPage;
    if (start == null) return pageLabel;
    final end = endPage;
    if (end == null || end == start) return l10n.citationPage(start);
    return l10n.citationPageRange(start, end);
  }
}

extension DroppedFactsL10n on List<DroppedFact> {
  /// The fact-preservation caution, in the reader's language.
  ///
  /// Safety copy: it is the only thing telling someone that a rewrite they
  /// asked for lost an amount, a date or a reference number. The values are
  /// the user's own and are never translated; what the bundle decides is the
  /// sentence around them, the separator between them, and — when more than
  /// four were dropped — how the remainder is counted.
  String describeIn(AppL10n l10n) => isEmpty
      ? ''
      : ToolNamedList(
          ToolNamedListId.factLoss,
          FactPreservation.namedValues(this),
          hidden: FactPreservation.hiddenCount(this),
        ).resolveIn(l10n);
}


// --------------------------------------------------------------------------
// The Intelligence tools
// --------------------------------------------------------------------------

/// The seventeen tool titles and descriptions, in the reader's language.
///
/// **Why an extension and not a field on the definition.** An
/// `IntelligenceToolDefinition` is a top-level `const` in a domain that is
/// deliberately Flutter-free — that is why `ToolGlyph` is an enum rather than an
/// `IconData`. A const cannot ask for a translation, and threading `AppL10n`
/// into the domain to let it would trade the whole boundary for one string. So
/// the English stays canonical where the registry, the activity journal and the
/// domain tests read it, and the screen asks for the translation. This is
/// exactly the shape `IntelligenceCategoryL10n` above already uses.
///
/// **Why it switches on `id` and not on the object.** `id` is the stable
/// persistence key — it is what the transfer journal stored months ago and what
/// `ToolRegistry.byId` resolves. Matching on it means a tool can be reworded
/// without orphaning a row in someone's receipt.
///
/// **Why the fallback returns the English rather than throwing.** A stored id
/// from an older build must degrade to a readable label, not crash the Security
/// centre. That screen is the one place a user goes to check what left their
/// device; it has to render.
extension IntelligenceToolL10n on IntelligenceToolDefinition {
  String titleIn(AppL10n l10n) => switch (id) {
        'action-plan' => l10n.toolActionPlanTitle,
        'ask-document' => l10n.toolTitleAskDocument,
        'authenticity-inspector' => l10n.toolTitleAuthenticity,
        'compare-documents' => l10n.toolTitleCompareDocuments,
        'credential-scanner' => l10n.toolTitleCredentialScanner,
        'deadline-finder' => l10n.toolTitleDeadlineFinder,
        'document-intelligence' => l10n.toolTitleDocumentIntelligence,
        'draft-reply' => l10n.toolTitleDraftReply,
        'goal-optimizer' => l10n.toolGoalOptimizerTitle,
        'link-inspector' => l10n.toolTitleLinkInspector,
        'missing-information' => l10n.toolTitleMissingInformation,
        'redaction-assistant' => l10n.toolTitleRedaction,
        'rewrite' => l10n.toolTitleRewrite,
        'smart-checklist' => l10n.toolTitleSmartChecklist,
        'smart-summary' => l10n.toolTitleSmartSummary,
        'structured-data' => l10n.toolTitleStructuredData,
        'translate' => l10n.toolTitleTranslate,
        _ => title,
      };

  String shortDescriptionIn(AppL10n l10n) => switch (id) {
        'action-plan' => l10n.toolDescriptionActionPlan,
        'ask-document' => l10n.toolDescriptionAskDocument,
        'authenticity-inspector' => l10n.toolDescriptionAuthenticity,
        'compare-documents' => l10n.toolDescriptionCompareDocuments,
        'credential-scanner' => l10n.toolDescriptionCredentialScanner,
        'deadline-finder' => l10n.toolDescriptionDeadlineFinder,
        'document-intelligence' => l10n.toolDescriptionDocumentIntelligence,
        'draft-reply' => l10n.toolDescriptionDraftReply,
        'goal-optimizer' => l10n.toolDescriptionGoalOptimizer,
        'link-inspector' => l10n.toolDescriptionLinkInspector,
        'missing-information' => l10n.toolDescriptionMissingInformation,
        'redaction-assistant' => l10n.toolDescriptionRedaction,
        'rewrite' => l10n.toolDescriptionRewrite,
        'smart-checklist' => l10n.toolDescriptionSmartChecklist,
        'smart-summary' => l10n.toolDescriptionSmartSummary,
        'structured-data' => l10n.toolDescriptionStructuredData,
        'translate' => l10n.toolDescriptionTranslate,
        _ => shortDescription,
      };
}


// --------------------------------------------------------------------------
// A tool run in progress
// --------------------------------------------------------------------------

/// The named stages of a tool run, in the reader's language.
///
/// The English original stays on `describeStage` in
/// `features/intelligence/application/intelligence_runner.dart`, where a log
/// line and a domain test can reach it without a locale. This is the same set
/// of words for the screen, for the reason every other enum in this app keeps
/// its English and its translation apart: a `const` value cannot depend on a
/// locale, and the runner is an application-layer stream with no
/// `BuildContext` and no business growing one.
///
/// [IntelligenceStage.idle] returns the empty string rather than a key, exactly
/// as `describeStage` does. It is the state before a run starts, when the stage
/// row is not on screen at all — an empty label is correct here and is not a
/// missing translation.
///
/// Only the four running stages reach a reader today: `_StageIndicator` in
/// `tool_run_screen.dart` is built solely under `_run.isRunning`. The terminal
/// three are translated anyway because `describeStage` is a public function
/// documented as what the user is told, and because the alternative — an
/// English word appearing in a Bengali screen the first time that condition is
/// rendered — is the failure this whole exercise exists to prevent.
extension IntelligenceStageL10n on IntelligenceStage {
  String labelIn(AppL10n l10n) => switch (this) {
        IntelligenceStage.idle => '',
        IntelligenceStage.preparing => l10n.toolRunStagePreparing,
        IntelligenceStage.reading => l10n.toolRunStageReading,
        IntelligenceStage.analysing => l10n.toolRunStageAnalysing,
        IntelligenceStage.building => l10n.toolRunStageBuilding,
        IntelligenceStage.done => l10n.toolRunStageDone,
        IntelligenceStage.failed => l10n.toolRunStageFailed,
        IntelligenceStage.cancelled => l10n.toolRunStageCancelled,
      };
}


// --------------------------------------------------------------------------
// What a result suggests
// --------------------------------------------------------------------------

extension IntelligenceSuggestionKindL10n on IntelligenceSuggestionKind {
  /// Names what accepting a suggestion of this kind would do.
  ///
  /// Every one of these headings has to stay advisory. It sits above a
  /// checkbox nobody has ticked yet, and a suggestion is advice until the user
  /// says otherwise — a heading that reads as saved data is the difference
  /// between a proposal and a fact in the database.
  String headingIn(AppL10n l10n) => switch (this) {
        IntelligenceSuggestionKind.step => l10n.resultSuggestedSteps,
        IntelligenceSuggestionKind.action => l10n.resultSuggestedAction,
        IntelligenceSuggestionKind.question => l10n.resultWorthAsking,
        IntelligenceSuggestionKind.deadline => l10n.resultSuggestedDeadlines,
      };
}


// --------------------------------------------------------------------------
// Sources, short
// --------------------------------------------------------------------------

/// The short name for a source, for a list row.
///
/// Deliberately separate from [SourceTypeL10n.provenanceIn], which returns a
/// whole sentence ("Captured from photo"). A picker row wants the noun.
///
/// **This is the display side only.** `labelForSource` in
/// `features/intelligence/application/intelligence_context.dart` returns the
/// same four names in English and must keep doing so: that value is written
/// into `AiSourceTextPart.label` and `AiDocumentPart.label`, so it travels in
/// the prompt and comes back on citation chips. Localising it would send the
/// reader's language into the model's grounding and change which citation
/// matched. The English is the identifier; this is what a person reads.
extension SourceTypeShortLabelL10n on SourceType {
  String shortLabelIn(AppL10n l10n) => switch (this) {
        SourceType.photo => l10n.sourceTypeLabelPhoto,
        SourceType.gallery => l10n.sourceTypeLabelScreenshot,
        SourceType.pastedText => l10n.sourceTypeLabelPastedText,
        SourceType.document => l10n.sourceTypeLabelDocument,
      };
}


// --------------------------------------------------------------------------
// Providers, models and what they cannot do
// --------------------------------------------------------------------------

/// The provider families, in the reader's language — except where they are
/// names.
///
/// Three of the four are trademarks. OpenAI, Anthropic and Google Gemini are
/// what those companies call themselves in every locale, and a translated or
/// transliterated one sends a reader looking for an account that does not
/// exist, so those arms return the canonical English `label` unchanged. Only
/// the fourth is a description — and `OpenAI` survives inside it, because it
/// names the request shape a server imitates, not where the content goes.
extension AiProviderKindL10n on AiProviderKind {
  String labelIn(AppL10n l10n) => switch (this) {
        AiProviderKind.openAi ||
        AiProviderKind.anthropic ||
        AiProviderKind.gemini =>
          label,
        AiProviderKind.openAiCompatible => l10n.aiProviderCustom,
      };
}

/// What a model cannot do, named in the reader's language.
///
/// Lowercase and mid-sentence: every one of these lands inside "The model you
/// chose cannot read …", never on a button.
extension AiCapabilityL10n on AiCapability {
  String describeIn(AppL10n l10n) => switch (this) {
        AiCapability.text => l10n.aiCapabilityText,
        AiCapability.vision => l10n.aiCapabilityImages,
        AiCapability.documents => l10n.aiCapabilityDocuments,
        AiCapability.structuredOutput => l10n.aiCapabilityStructuredResults,
        AiCapability.streaming => l10n.aiCapabilityStreaming,
        AiCapability.systemInstruction => l10n.aiCapabilitySystemInstructions,
        AiCapability.citations => l10n.aiCapabilityEvidenceCitations,
        AiCapability.longContext => l10n.aiCapabilityLongDocuments,
      };
}

/// Several of them, joined the way the reader's language joins a list.
///
/// **Why this is not `join(', ')`.** The comma and the "or" are language, not
/// punctuation: Arabic writes `، `, Chinese and Japanese write `、`, and the
/// conjunction before the last item is not always a word in the same place.
/// So the joining is three translated patterns, exactly like the nouns it
/// joins.
///
/// The order is the enum's, not the alphabet's. Sorting the *translated*
/// nouns would order the sentence differently in every locale, and sorting
/// the English ones — which is what the adapter does today — orders it by an
/// alphabet most readers of this sentence are not using.
extension AiCapabilityListL10n on Iterable<AiCapability> {
  String describeIn(AppL10n l10n) {
    final ordered = AiCapability.values.where(contains).toList();
    if (ordered.isEmpty) return '';
    if (ordered.length == 1) return ordered.single.describeIn(l10n);

    final last = ordered.removeLast();
    if (ordered.length == 1) {
      return l10n.aiCapabilityListTwo(
        ordered.single.describeIn(l10n),
        last.describeIn(l10n),
      );
    }
    var head = ordered.first.describeIn(l10n);
    for (final capability in ordered.skip(1)) {
      head = l10n.aiCapabilityListJoin(head, capability.describeIn(l10n));
    }
    return l10n.aiCapabilityListMore(head, last.describeIn(l10n));
  }
}

/// What a person is told when a provider call fails.
///
/// The English original lives on [AiFailureKind.message], where a log line
/// and a domain test can reach it without a locale. This is the same sentence
/// for the screen. Nothing here names an HTTP code, a provider or a JSON
/// envelope — the adapter is the last place that knows those.
///
/// [missing] is read only by [AiFailureKind.unsupportedCapability], whose
/// sentence names what the chosen model could not do.
extension AiFailureKindL10n on AiFailureKind {
  String messageIn(
    AppL10n l10n, {
    Iterable<AiCapability> missing = const [],
  }) =>
      switch (this) {
        AiFailureKind.notConfigured => l10n.aiFailureNotConfigured,
        AiFailureKind.invalidKey => l10n.aiFailureInvalidKey,
        AiFailureKind.quotaExceeded => l10n.aiFailureQuotaExceeded,
        AiFailureKind.rateLimited => l10n.aiFailureRateLimited,
        AiFailureKind.networkUnavailable => l10n.aiFailureNetworkUnavailable,
        AiFailureKind.unsupportedModel => l10n.aiFailureUnsupportedModel,
        AiFailureKind.unsupportedCapability =>
          l10n.aiFailureUnsupportedCapability(missing.describeIn(l10n)),
        AiFailureKind.contextTooLarge => l10n.aiFailureContextTooLarge,
        AiFailureKind.inputTooLarge => l10n.aiFailureInputTooLargeText,
        AiFailureKind.providerUnavailable => l10n.aiFailureProviderUnavailable,
        AiFailureKind.malformedResponse => l10n.aiFailureMalformedResponse,
        AiFailureKind.cancelled => l10n.aiFailureCancelled,
        AiFailureKind.insecureEndpoint => l10n.aiFailureInsecureEndpoint,
        AiFailureKind.unknown => l10n.aiFailureUnknown,
      };
}


// --------------------------------------------------------------------------
// The adapters own sentences
// --------------------------------------------------------------------------

/// The adapters' own sentences, in the reader's language.
///
/// The companion to [AiFailureKindL10n.messageIn], and the split is the same
/// one: [AiAdapterMessage.text] is the canonical English, which is what a log
/// line, a bug report and the adapter tests read, and this is what a person
/// should read.
///
/// **Why there are two families rather than one.** Almost every failure the
/// provider layer raises is one of the dozen conditions [AiFailureKind]
/// already owns, and those take their wording from the kind. These are the
/// remainder — the cases where the kind is right but its sentence is not. A
/// four-minute timeout is not "check your connection", a failed TLS handshake
/// is not "try again shortly", a prompt stopped by the provider's own safety
/// filter is not a malformed reply, and a document refused locally has to name
/// the file and the number.
///
/// [filename], [count] and [limit] are read only by the arms that name them,
/// exactly as in the English original.
extension AiAdapterMessageL10n on AiAdapterMessage {
  String messageIn(
    AppL10n l10n, {
    String filename = '',
    int count = 0,
    int limit = 0,
  }) =>
      switch (this) {
        AiAdapterMessage.timedOut => l10n.aiAdapterTimedOut,
        AiAdapterMessage.secureConnectionFailed =>
          l10n.aiAdapterSecureConnectionFailed,
        AiAdapterMessage.modelOrEndpointNotFound =>
          l10n.aiAdapterModelOrEndpointNotFound,
        AiAdapterMessage.requestRejected => l10n.aiAdapterRequestRejected,
        AiAdapterMessage.secureStorageUnavailable =>
          l10n.aiAdapterSecureStorageUnavailable,
        AiAdapterMessage.endpointMissing => l10n.aiAdapterEndpointMissing,
        AiAdapterMessage.replyIncomplete => l10n.aiAdapterReplyIncomplete,
        AiAdapterMessage.contentDeclined => l10n.aiAdapterContentDeclined,
        AiAdapterMessage.tooManyAttachments =>
          l10n.aiAdapterTooManyAttachments(limit),
        AiAdapterMessage.imageTooLarge => l10n.aiAdapterImageTooLarge,
        AiAdapterMessage.documentTooLarge =>
          l10n.aiAdapterDocumentTooLarge(filename, limit),
        AiAdapterMessage.documentTooManyPages =>
          l10n.aiAdapterDocumentTooManyPages(filename, count, limit),
        AiAdapterMessage.selectionTooLarge => l10n.aiAdapterSelectionTooLarge,
      };
}


// --------------------------------------------------------------------------
// VERIFY: credentials and links
// --------------------------------------------------------------------------

extension CredentialKindL10n on CredentialKind {
  String labelIn(AppL10n l10n) => switch (this) {
        CredentialKind.privateKeyBlock => l10n.credentialKindPrivateKey,
        CredentialKind.providerApiKey => l10n.credentialKindApiKey,
        CredentialKind.connectionString => l10n.credentialKindConnectionString,
        CredentialKind.jsonWebToken => l10n.credentialKindAccessToken,
        CredentialKind.authorizationHeader =>
          l10n.credentialKindAuthorizationHeader,
        CredentialKind.keyedAssignment => l10n.credentialKindPasswordOrKey,
        CredentialKind.highEntropyString => l10n.credentialKindPossibleSecret,
      };

  /// What to do about a credential of this kind.
  ///
  /// The provider-key sentence is the one that has to survive every
  /// translation intact: revoking happens with the provider, and taking the
  /// key out of the document does not disable it. Deleting the line and
  /// stopping there is the commonest mistake made after a key leaks, and this
  /// is the only place the product says so.
  String adviceIn(AppL10n l10n) => switch (this) {
        CredentialKind.privateKeyBlock => l10n.credentialAdvicePrivateKey,
        CredentialKind.providerApiKey => l10n.credentialAdviceProviderApiKey,
        CredentialKind.connectionString =>
          l10n.credentialAdviceConnectionString,
        CredentialKind.jsonWebToken => l10n.credentialAdviceJsonWebToken,
        CredentialKind.authorizationHeader =>
          l10n.credentialAdviceAuthorizationHeader,
        CredentialKind.keyedAssignment => l10n.credentialAdviceKeyedAssignment,
        CredentialKind.highEntropyString =>
          l10n.credentialAdviceHighEntropyString,
      };
}

/// The specific name a credential finding carries when the scan could give it
/// one — the vendor a prefix identified, or the keyword an assignment was
/// named for.
///
/// Three of these are deliberately the same string as a kind's label rather
/// than a near-duplicate of it: an assignment called `private_key` is a
/// private key, one called `access_token` is an access token, and one called
/// `api_key` is an API key. Minting second copies would let two renderings of
/// the same idea drift apart in twenty languages.
extension CredentialLabelL10n on CredentialLabel {
  String labelIn(AppL10n l10n) => switch (this) {
        CredentialLabel.anthropicApiKey => l10n.credentialLabelAnthropicApiKey,
        CredentialLabel.openAiProjectKey =>
          l10n.credentialLabelOpenAiProjectKey,
        CredentialLabel.openAiStyleApiKey =>
          l10n.credentialLabelOpenAiStyleApiKey,
        CredentialLabel.googleApiKey => l10n.credentialLabelGoogleApiKey,
        CredentialLabel.googleOAuthToken =>
          l10n.credentialLabelGoogleOAuthToken,
        CredentialLabel.gitHubToken => l10n.credentialLabelGitHubToken,
        CredentialLabel.slackToken => l10n.credentialLabelSlackToken,
        CredentialLabel.awsAccessKeyId => l10n.credentialLabelAwsAccessKeyId,
        CredentialLabel.gitLabToken => l10n.credentialLabelGitLabToken,
        CredentialLabel.npmToken => l10n.credentialLabelNpmToken,
        CredentialLabel.passphrase => l10n.credentialLabelPassphrase,
        CredentialLabel.password => l10n.credentialLabelPassword,
        CredentialLabel.privateKey => l10n.credentialKindPrivateKey,
        CredentialLabel.refreshToken => l10n.credentialLabelRefreshToken,
        CredentialLabel.accessToken => l10n.credentialKindAccessToken,
        CredentialLabel.token => l10n.credentialLabelToken,
        CredentialLabel.clientSecret => l10n.credentialLabelClientSecret,
        CredentialLabel.apiKey => l10n.credentialKindApiKey,
        CredentialLabel.credential => l10n.credentialLabelCredential,
        CredentialLabel.secret => l10n.credentialLabelSecret,
      };
}

extension CredentialFindingL10n on CredentialFinding {
  /// The specific label when the scan produced one, otherwise the kind's.
  ///
  /// Mirrors [CredentialFinding.label], which is the English original the
  /// scanner tests read.
  String labelIn(AppL10n l10n) => detail?.labelIn(l10n) ?? kind.labelIn(l10n);

  String adviceIn(AppL10n l10n) => kind.adviceIn(l10n);

  /// The marker written over this credential in a cleaned copy.
  ///
  /// Uppercased through [eyebrowCase] rather than `toUpperCase`, for the
  /// reason that helper exists: Dart maps Turkish dotted i to a letter Turkish
  /// does not use, so `[api anahtarı]` would come back misspelt in the one
  /// place a user pastes the result somewhere else.
  ///
  /// Pass this to `CredentialScanner.redact` as its `marker`; the domain
  /// default stays English so a caller with no locale still gets a valid copy.
  String replacementIn(AppL10n l10n) =>
      '[${eyebrowCase(kind.labelIn(l10n), l10n.localeName)}]';
}

/// The three things the link inspector is willing to say about a link.
///
/// None of them is that it is safe, and no translation of them may become
/// that. The absence of a signal is not evidence of safety: a phishing page
/// served over HTTPS from a short, correctly spelled hostname produces
/// [LinkVerdict.noObviousSignals], which is the honest limit of what can be
/// known without fetching the page.
extension LinkVerdictL10n on LinkVerdict {
  String labelIn(AppL10n l10n) => switch (this) {
        LinkVerdict.noObviousSignals => l10n.linkVerdictNoObviousSignals,
        LinkVerdict.worthChecking => l10n.linkVerdictWorthChecking,
        LinkVerdict.treatWithCaution => l10n.linkVerdictTreatWithCaution,
      };

  /// The sentence under the verdict.
  ///
  /// The clear case is the one worded most carefully, because it is where a
  /// reader is likeliest to find reassurance that was never offered.
  String summaryIn(AppL10n l10n) => switch (this) {
        LinkVerdict.noObviousSignals => l10n.linkSummaryNoObviousSignals,
        LinkVerdict.worthChecking => l10n.linkSummaryWorthChecking,
        LinkVerdict.treatWithCaution => l10n.linkSummaryTreatWithCaution,
      };
}

extension LinkInspectionL10n on LinkInspection {
  String verdictIn(AppL10n l10n) => verdict.labelIn(l10n);

  /// Mirrors [LinkInspection.summary], the English original the honesty tests
  /// read.
  String summaryIn(AppL10n l10n) => verdict.summaryIn(l10n);
}

extension LinkSignalL10n on LinkSignal {
  /// A few words for a chip or a row title.
  String summaryIn(AppL10n l10n) => switch (this) {
        LinkSignal.notHttps => l10n.linkSignalNotHttps,
        LinkSignal.nonWebScheme => l10n.linkSignalNonWebScheme,
        LinkSignal.embeddedCredentials => l10n.linkSignalEmbeddedCredentials,
        LinkSignal.misleadingAuthority => l10n.linkSignalMisleadingAuthority,
        LinkSignal.ipLiteralHost => l10n.linkSignalIpLiteralHost,
        LinkSignal.punycodeHost => l10n.linkSignalPunycodeHost,
        LinkSignal.mixedScriptHost => l10n.linkSignalMixedScriptHost,
        LinkSignal.unusualPort => l10n.linkSignalUnusualPort,
        LinkSignal.deepSubdomain => l10n.linkSignalDeepSubdomain,
        LinkSignal.publicSuffixInSubdomain =>
          l10n.linkSignalPublicSuffixInSubdomain,
        LinkSignal.veryLongUrl => l10n.linkSignalVeryLongUrl,
        LinkSignal.redirectParameter => l10n.linkSignalRedirectParameter,
        LinkSignal.executableTarget => l10n.linkSignalExecutableTarget,
        LinkSignal.shortener => l10n.linkSignalShortener,
        LinkSignal.encodedHost => l10n.linkSignalEncodedHost,
        LinkSignal.unparseable => l10n.linkSignalUnparseable,
      };
}

extension LinkObservationL10n on LinkObservation {
  String summaryIn(AppL10n l10n) => signal.summaryIn(l10n);

  /// The sentence saying what was seen and why it is worth knowing.
  ///
  /// Rebuilt from the values the inspection kept beside the sentence rather
  /// than from the English one, so a language can place the host, the port or
  /// the count where its own grammar wants them.
  ///
  /// Each case that needs a value falls back to the canonical English
  /// [LinkObservation.detail] if that value is somehow absent. An untranslated
  /// true sentence is a much better failure here than a translated one with a
  /// hole where the destination should be — this is the screen where a reader
  /// decides whether to open a link.
  String detailIn(AppL10n l10n) {
    final subject = this.subject;
    final destination = this.destination;
    final count = this.count;

    return switch (signal) {
      LinkSignal.notHttps => l10n.linkDetailNotHttps,
      LinkSignal.nonWebScheme =>
        subject == null ? detail : l10n.linkDetailNonWebScheme(subject),
      LinkSignal.embeddedCredentials => l10n.linkDetailEmbeddedCredentials,
      LinkSignal.misleadingAuthority =>
        subject == null ? detail : l10n.linkDetailMisleadingAuthority(subject),
      LinkSignal.ipLiteralHost =>
        subject == null ? detail : l10n.linkDetailIpLiteralHost(subject),
      LinkSignal.punycodeHost => l10n.linkDetailPunycodeHost,
      LinkSignal.mixedScriptHost => l10n.linkDetailMixedScriptHost,
      LinkSignal.encodedHost => l10n.linkDetailEncodedHost,
      LinkSignal.unusualPort =>
        subject == null ? detail : l10n.linkDetailUnusualPort(subject),
      LinkSignal.deepSubdomain =>
        count == null ? detail : l10n.linkDetailDeepSubdomain(count),
      LinkSignal.publicSuffixInSubdomain =>
        subject == null || destination == null
            ? detail
            : l10n.linkDetailPublicSuffixInSubdomain(subject, destination),
      LinkSignal.shortener => l10n.linkDetailShortener,
      LinkSignal.executableTarget =>
        subject == null ? detail : l10n.linkDetailExecutableTarget(subject),
      LinkSignal.redirectParameter => subject == null || destination == null
          ? detail
          : l10n.linkDetailRedirectParameter(subject, destination),
      LinkSignal.veryLongUrl => l10n.linkDetailVeryLongUrl,
      LinkSignal.unparseable => l10n.linkDetailUnparseable,
    };
  }
}


// --------------------------------------------------------------------------
// VERIFY: sensitive values, authenticity and files
// --------------------------------------------------------------------------

extension SensitiveKindL10n on SensitiveKind {
  String labelIn(AppL10n l10n) => switch (this) {
        SensitiveKind.email => l10n.sensitiveKindEmail,
        SensitiveKind.phone => l10n.sensitiveKindPhone,
        SensitiveKind.paymentCard => l10n.sensitiveKindPaymentCard,
        SensitiveKind.iban => l10n.sensitiveKindIban,
        SensitiveKind.nationalId => l10n.sensitiveKindNationalId,
        SensitiveKind.postcode => l10n.sensitiveKindPostcode,
        SensitiveKind.accountNumber => l10n.sensitiveKindAccountNumber,
        SensitiveKind.reference => l10n.sensitiveKindReference,
        SensitiveKind.dateOfBirth => l10n.sensitiveKindDateOfBirth,
        SensitiveKind.url => l10n.sensitiveKindUrl,
      };

  /// The bracketed marker that stands in for a redacted value.
  ///
  /// Pass it to `SensitiveScanner.redact` as `replacementFor` so the redacted
  /// copy is in the reader's language. It goes through [eyebrowCase] rather
  /// than `toUpperCase` for the usual reason: Turkish `i` uppercases to `İ`,
  /// and a marker reading "E-POSTA ADRESI" is a misspelling in the one place
  /// the document cannot be corrected afterwards.
  String redactionMarkerIn(AppL10n l10n) =>
      '[${eyebrowCase(labelIn(l10n), l10n.localeName)}]';
}

extension AuthenticityVerdictL10n on AuthenticityVerdict {
  String titleIn(AppL10n l10n) => switch (this) {
        AuthenticityVerdict.verifiedProvenanceAvailable =>
          l10n.verdictVerifiedProvenance,
        AuthenticityVerdict.signalsConsistentWithSynthetic =>
          l10n.verdictSignalsSynthetic,
        AuthenticityVerdict.signalsConsistentWithEdited =>
          l10n.verdictSignalsEdited,
        AuthenticityVerdict.noReliableProvenanceFound =>
          l10n.verdictNoReliableProvenance,
        // Not a failure and not an error — the most common honest answer.
        AuthenticityVerdict.inconclusive => l10n.verdictInconclusive,
      };

  /// The sentence under the verdict. Every one of these limits the claim, and
  /// each ARB description names the clauses a translation may not drop.
  String explanationIn(AppL10n l10n) => switch (this) {
        AuthenticityVerdict.verifiedProvenanceAvailable =>
          l10n.verdictVerifiedProvenanceExplainer,
        AuthenticityVerdict.signalsConsistentWithSynthetic =>
          l10n.verdictSignalsSyntheticExplainer,
        AuthenticityVerdict.signalsConsistentWithEdited =>
          l10n.verdictSignalsEditedExplainer,
        AuthenticityVerdict.noReliableProvenanceFound =>
          l10n.verdictNoReliableProvenanceExplainer,
        AuthenticityVerdict.inconclusive => l10n.verdictInconclusiveExplainer,
      };
}

extension AuthenticitySignalL10n on AuthenticitySignal {
  String labelIn(AppL10n l10n) => switch (kind) {
        // A verifier that Action does not ship wrote this one. Its own label
        // is the only label there is.
        AuthenticitySignalKind.provenance => label,
        AuthenticitySignalKind.camera => l10n.authenticitySignalCamera,
        AuthenticitySignalKind.software => l10n.authenticitySignalSoftware,
        AuthenticitySignalKind.description =>
          l10n.authenticitySignalDescription,
        AuthenticitySignalKind.copyright => l10n.authenticitySignalCopyright,
        AuthenticitySignalKind.location => l10n.authenticitySignalLocation,
        AuthenticitySignalKind.contentCredentials =>
          l10n.authenticitySignalContentCredentials,
        AuthenticitySignalKind.unreadableFile ||
        AuthenticitySignalKind.unrecognisedFormat =>
          l10n.authenticitySignalFile,
        AuthenticitySignalKind.textLimitation => l10n.authenticitySignalText,
      };

  /// The value beside the label.
  ///
  /// The camera, software, description and copyright signals are strings read
  /// out of someone's file. They are returned as they were found: translating
  /// what a file says about itself would be inventing evidence.
  String valueIn(AppL10n l10n) => switch (kind) {
        AuthenticitySignalKind.provenance ||
        AuthenticitySignalKind.camera ||
        AuthenticitySignalKind.software ||
        AuthenticitySignalKind.description ||
        AuthenticitySignalKind.copyright =>
          value,
        AuthenticitySignalKind.location =>
          l10n.authenticitySignalLocationValue,
        AuthenticitySignalKind.contentCredentials =>
          l10n.authenticitySignalContentCredentialsValue,
        AuthenticitySignalKind.unreadableFile =>
          l10n.authenticitySignalFileUnreadableValue,
        AuthenticitySignalKind.unrecognisedFormat =>
          l10n.authenticitySignalFileUnrecognisedValue,
        AuthenticitySignalKind.textLimitation =>
          l10n.authenticitySignalTextValue,
      };
}

extension DetectedFileKindL10n on DetectedFileKind {
  String labelIn(AppL10n l10n) => switch (this) {
        DetectedFileKind.png => l10n.fileTypePng,
        DetectedFileKind.jpeg => l10n.fileTypeJpeg,
        DetectedFileKind.gif => l10n.fileTypeGif,
        DetectedFileKind.webp => l10n.fileTypeWebp,
        DetectedFileKind.wav => l10n.fileTypeWav,
        DetectedFileKind.pdf => l10n.fileTypePdf,
        DetectedFileKind.heic => l10n.fileTypeHeic,
        DetectedFileKind.video => l10n.fileTypeVideo,
        DetectedFileKind.tiff => l10n.fileTypeTiff,
        DetectedFileKind.bitmap => l10n.fileTypeBitmap,
        DetectedFileKind.rtf => l10n.fileTypeRtf,
        DetectedFileKind.zip => l10n.fileTypeZip,
        DetectedFileKind.gzip => l10n.fileTypeGzip,
        DetectedFileKind.sevenZip => l10n.fileTypeSevenZip,
        DetectedFileKind.rar => l10n.fileTypeRar,
        DetectedFileKind.windowsProgram => l10n.fileTypeWindowsProgram,
        DetectedFileKind.linuxProgram => l10n.fileTypeLinuxProgram,
        DetectedFileKind.postScript => l10n.fileTypePostScript,
        DetectedFileKind.ogg => l10n.fileTypeOgg,
        DetectedFileKind.mp3 => l10n.fileTypeMp3,
        DetectedFileKind.plainText => l10n.fileTypePlainText,
      };
}

extension FileIdentityL10n on FileIdentity {
  /// The sentence shown when the name and the content disagree, translated.
  ///
  /// Null in exactly the cases [FileIdentity.mismatchNote] is null, so the
  /// caller's `if (note != null)` keeps working unchanged.
  String? mismatchNoteIn(AppL10n l10n) {
    final type = detected;
    if (type == null || !extensionMismatch) return null;
    return l10n.fileMismatchNote(declaredExtension, type.kind.labelIn(l10n));
  }

  String readableSizeIn(AppL10n l10n) => formatBytesIn(sizeBytes, l10n);
}

/// [formatBytes] for a reader rather than for a log.
///
/// Picks the same unit as the English version, then renders the number with
/// the locale's own separators and digits — "1,2 MB" in German, Arabic-Indic
/// digits in Arabic — and the unit through the ARB so a language that
/// abbreviates it differently can. The one deliberate difference from
/// [formatBytes] is that a single byte reads "1 byte": the English function
/// says "1 bytes", and a plural is the point of doing this in ICU.
String formatBytesIn(int bytes, AppL10n l10n) {
  if (bytes < 1024) return l10n.fileSizeBytes(bytes);

  var value = bytes / 1024;
  var unit = 0;
  while (value >= 1024 && unit < 2) {
    value /= 1024;
    unit++;
  }

  // Same rule as formatBytes: one decimal below ten, none above, because
  // "1023.7 MB" is precision nobody asked for.
  final size = NumberFormat.decimalPatternDigits(
    locale: l10n.localeName,
    decimalDigits: value >= 10 ? 0 : 1,
  ).format(value);

  return switch (unit) {
    0 => l10n.fileSizeKilobytes(size),
    1 => l10n.fileSizeMegabytes(size),
    _ => l10n.fileSizeGigabytes(size),
  };
}


// --------------------------------------------------------------------------
// Tool-authored copy
// --------------------------------------------------------------------------

/// The reader's name for a tool mode.
///
/// **The mode string is an identifier, not copy.** Each of these is a `static
/// const` on a strategy, and the same value is both the chip label and the
/// `switch` key that selects the prompt guidance inside
/// `systemInstruction` — so it is stored on `IntelligenceRunInput.mode` and
/// travels to the provider. Translating the constant would fall through to the
/// default branch and quietly change what the model is asked to do. The
/// constant stays English; only what is drawn is translated, here.
///
/// Note that `RewriteStrategy.professional` ("More professional") and
/// `DraftReplyStrategy.professional` ("Professional") are different modes of
/// different tools and keep different keys.
String modeLabel(AppL10n l10n, String mode) => switch (mode) {
      RewriteStrategy.clearer => l10n.toolModeClearer,
      RewriteStrategy.professional => l10n.toolModeMoreProfessional,
      RewriteStrategy.shorter => l10n.toolModeShorter,
      RewriteStrategy.simpler => l10n.toolModeSimpler,
      RewriteStrategy.structured => l10n.toolModeMoreStructured,
      RewriteStrategy.persuasive => l10n.toolModeMorePersuasive,
      RewriteStrategy.grammarOnly => l10n.toolModeGrammarOnly,
      DraftReplyStrategy.professional => l10n.toolModeProfessional,
      DraftReplyStrategy.concise => l10n.toolModeConcise,
      DraftReplyStrategy.friendly => l10n.toolModeFriendly,
      DraftReplyStrategy.formal => l10n.toolModeFormal,
      DraftReplyStrategy.clarification => l10n.toolModeAskForClarification,
      DraftReplyStrategy.confirmation => l10n.toolModeConfirm,
      DraftReplyStrategy.dispute => l10n.toolModeDispute,
      SmartSummaryStrategy.quick => l10n.toolModeQuick,
      SmartSummaryStrategy.detailed => l10n.toolModeDetailed,
      SmartSummaryStrategy.executive => l10n.toolModeExecutive,
      SmartSummaryStrategy.keyPoints => l10n.toolModeKeyPoints,
      SmartSummaryStrategy.actionFocused => l10n.toolModeActionFocused,
      // A mode from a tool that has not been through here yet still shows its
      // English name rather than nothing at all.
      _ => mode,
    };

/// A tool-authored string, in the reader's language.
///
/// The sealed switch and each id switch carry no default arm, so a new shape
/// or a new id is a compile error here rather than an English sentence in a
/// Turkish result.
extension ToolCopyL10n on ToolCopy {
  String resolveIn(AppL10n l10n) => switch (this) {
        ToolPhrase(:final id) => _toolPhrase(l10n, id),
        ToolCounted(:final id, :final count) => _toolCounted(l10n, id, count),
        ToolNamed(:final id, :final value) => _toolNamed(l10n, id, value),
        ToolNamedPair(:final id, :final first, :final second) =>
          _toolNamedPair(l10n, id, first, second),
        ToolNamedList(:final id, :final values, :final hidden) =>
          _toolNamedList(l10n, id, values, hidden),
        ToolVerbatim(:final text) => text,
        ToolModeName(:final mode) => modeLabel(l10n, mode),
        ToolSensitiveKindCopy(:final kind) => kind.labelIn(l10n),
        ToolCredentialLabelCopy(:final finding) => finding.labelIn(l10n),
        ToolCredentialAdviceCopy(:final finding) => finding.adviceIn(l10n),
        ToolLinkVerdictCopy(:final verdict) => verdict.labelIn(l10n),
        // Both halves localized first, then joined by the bundle's own frame.
        // Never a locale's punctuation around two English clauses.
        ToolLinkObservationCopy(:final observation) =>
          l10n.toolSectionLinkObservationLine(
            observation.summaryIn(l10n),
            observation.detailIn(l10n),
          ),
        ToolAuthenticityTitleCopy(:final verdict) => verdict.titleIn(l10n),
        ToolAuthenticityExplanationCopy(:final verdict) =>
          verdict.explanationIn(l10n),
        ToolSignalLabelCopy(:final signal) => signal.labelIn(l10n),
        ToolSignalValueCopy(:final signal) => signal.valueIn(l10n),
        ToolFileKindCopy(:final identity) =>
          identity.detected?.kind.labelIn(l10n) ??
              l10n.toolSectionFileUnknownFormat,
        ToolFileSizeCopy(:final identity) => identity.readableSizeIn(l10n),
      };
}

String _toolPhrase(AppL10n l10n, ToolPhraseId id) => switch (id) {
      ToolPhraseId.warningFactsNotChecked => l10n.toolWarningFactsNotChecked,
      ToolPhraseId.sectionWhatChanged => l10n.toolSectionWhatChanged,
      ToolPhraseId.sectionNote => l10n.toolSectionNote,
      ToolPhraseId.sectionAlreadyClearBody => l10n.toolSectionAlreadyClearBody,
      ToolPhraseId.sectionImprovedText => l10n.toolSectionImprovedText,
      ToolPhraseId.sectionSubject => l10n.toolSectionSubject,
      ToolPhraseId.sectionDraftReply => l10n.toolSectionDraftReply,
      ToolPhraseId.sectionPlaceholders => l10n.toolSectionPlaceholders,
      ToolPhraseId.warningDraftNotSent => l10n.toolWarningDraftNotSent,
      ToolPhraseId.sectionTranslation => l10n.toolSectionTranslation,
      ToolPhraseId.sectionKeptInOriginal => l10n.toolSectionKeptInOriginal,
      ToolPhraseId.warningTranslationNotCertified => l10n.toolWarningTranslationNotCertified,
      ToolPhraseId.sectionTable => l10n.toolSectionTable,
      ToolPhraseId.sectionFields => l10n.toolSectionFields,
      ToolPhraseId.sectionTableCsv => l10n.toolSectionTableCsv,
      ToolPhraseId.warningTableLayoutUncertain => l10n.toolWarningTableLayoutUncertain,
      ToolPhraseId.sectionNothingDue => l10n.toolSectionNothingDue,
      ToolPhraseId.sectionNothingDueBody => l10n.toolSectionNothingDueBody,
      ToolPhraseId.warningNothingScheduledAutomatically => l10n.toolWarningNothingScheduledAutomatically,
      ToolPhraseId.warningReplyTruncated => l10n.toolWarningReplyTruncated,
      ToolPhraseId.warningNoSupportingQuotes => l10n.toolWarningNoSupportingQuotes,
      ToolPhraseId.sectionCouldBeSimpler => l10n.toolSectionCouldBeSimpler,
      ToolPhraseId.sectionThePlan => l10n.toolSectionThePlan,
      ToolPhraseId.sectionContradictions => l10n.toolSectionContradictions,
      ToolPhraseId.warningEvidenceUnverifiable => l10n.toolWarningEvidenceUnverifiable,
      ToolPhraseId.sectionWhatThisIs => l10n.toolSectionWhatThisIs,
      ToolPhraseId.sectionWhatMatters => l10n.toolSectionWhatMatters,
      ToolPhraseId.sectionKeyDetails => l10n.toolSectionKeyDetails,
      ToolPhraseId.sectionNoAnswer => l10n.toolSectionNoAnswer,
      ToolPhraseId.sectionNoAnswerBody => l10n.toolSectionNoAnswerBody,
      ToolPhraseId.sectionAnswer => l10n.toolSectionAnswer,
      ToolPhraseId.sectionFromTheDocument => l10n.toolSectionFromTheDocument,
      ToolPhraseId.warningQuoteNotFound => l10n.toolWarningQuoteNotFound,
      ToolPhraseId.sectionKeyPoints => l10n.toolSectionKeyPoints,
      ToolPhraseId.sectionWhatDiffers => l10n.toolSectionWhatDiffers,
      ToolPhraseId.sectionConflicts => l10n.toolSectionConflicts,
      ToolPhraseId.sectionOnlyInOne => l10n.toolSectionOnlyInOne,
      ToolPhraseId.sectionInCommon => l10n.toolSectionInCommon,
      ToolPhraseId.sectionRedactionNothingToScan => l10n.toolSectionRedactionNothingToScan,
      ToolPhraseId.sectionRedactionNothingToScanBody => l10n.toolSectionRedactionNothingToScanBody,
      ToolPhraseId.sectionRedactionNothingFound => l10n.toolSectionRedactionNothingFound,
      ToolPhraseId.sectionRedactionNothingFoundBody => l10n.toolSectionRedactionNothingFoundBody,
      ToolPhraseId.sectionRedactedCopy => l10n.toolSectionRedactedCopy,
      ToolPhraseId.warningRedactionCoverage => l10n.toolWarningRedactionCoverage,
      ToolPhraseId.warningRedactionFormatLimit => l10n.toolWarningRedactionFormatLimit,
      ToolPhraseId.sectionAuthenticityNothingToInspect => l10n.toolSectionAuthenticityNothingToInspect,
      ToolPhraseId.sectionAuthenticityNothingToInspectBody => l10n.toolSectionAuthenticityNothingToInspectBody,
      ToolPhraseId.sectionAuthenticityFileSignals => l10n.toolSectionAuthenticityFileSignals,
      ToolPhraseId.sectionAuthenticityFileItself => l10n.toolSectionAuthenticityFileItself,
      ToolPhraseId.sectionFileContents => l10n.toolSectionFileContents,
      ToolPhraseId.sectionFileUnknownFormat => l10n.toolSectionFileUnknownFormat,
      ToolPhraseId.sectionFileSize => l10n.toolSectionFileSize,
      ToolPhraseId.sectionFileDigest => l10n.toolSectionFileDigest,
      ToolPhraseId.warningAuthenticityNotProof => l10n.toolWarningAuthenticityNotProof,
      ToolPhraseId.sectionCredentialNothingToCheck => l10n.toolSectionCredentialNothingToCheck,
      ToolPhraseId.sectionCredentialNothingToCheckBody => l10n.toolSectionCredentialNothingToCheckBody,
      ToolPhraseId.sectionCredentialNoneFound => l10n.toolSectionCredentialNoneFound,
      ToolPhraseId.sectionCredentialNoneFoundBody => l10n.toolSectionCredentialNoneFoundBody,
      ToolPhraseId.sectionCredentialRedactedCopy => l10n.toolSectionCredentialRedactedCopy,
      ToolPhraseId.warningCredentialRevoke => l10n.toolWarningCredentialRevoke,
      ToolPhraseId.warningCredentialCoverage => l10n.toolWarningCredentialCoverage,
      ToolPhraseId.sectionLinkNoneFound => l10n.toolSectionLinkNoneFound,
      ToolPhraseId.sectionLinkNoneFoundBody => l10n.toolSectionLinkNoneFoundBody,
      ToolPhraseId.sectionLinkUnreadableHost => l10n.toolSectionLinkUnreadableHost,
      ToolPhraseId.sectionLinkNothingUnusual => l10n.toolSectionLinkNothingUnusual,
      ToolPhraseId.sectionLinkNothingUnusualBody => l10n.toolSectionLinkNothingUnusualBody,
      ToolPhraseId.warningLinkAddressOnly => l10n.toolWarningLinkAddressOnly,
      ToolPhraseId.warningLinkNoSignals => l10n.toolWarningLinkNoSignals,
      ToolPhraseId.sectionObjective => l10n.toolSectionObjective,
      ToolPhraseId.sectionCurrentState => l10n.toolSectionCurrentState,
      ToolPhraseId.sectionRecommendedNextStep => l10n.toolSectionRecommendedNextStep,
      ToolPhraseId.sectionCredentialAdvice => l10n.toolSectionCredentialAdvice,
      ToolPhraseId.sectionSummary => l10n.toolSectionSummary,
    };

/// The count reaches `intl` as a number, which is the whole point: Polish and
/// Russian choose between four categories and Arabic between six, and none of
/// that is possible once the numeral has been written into a string.
String _toolCounted(AppL10n l10n, ToolCountedId id, int count) => switch (id) {
      ToolCountedId.sectionDeadlineCount => l10n.toolSectionDeadlineCount(count),
      ToolCountedId.sectionBlockerCount => l10n.toolSectionBlockerCount(count),
      ToolCountedId.sectionMissingDetailCount => l10n.toolSectionMissingDetailCount(count),
      ToolCountedId.warningEvidenceNotFound => l10n.toolWarningEvidenceNotFound(count),
      ToolCountedId.sectionRedactionFindings => l10n.toolSectionRedactionFindings(count),
      ToolCountedId.sectionCredentialFindings => l10n.toolSectionCredentialFindings(count),
      ToolCountedId.sectionCredentialPossibleFindings => l10n.toolSectionCredentialPossibleFindings(count),
      ToolCountedId.sectionLinkFindings => l10n.toolSectionLinkFindings(count),
    };

String _toolNamed(AppL10n l10n, ToolNamedId id, String value) => switch (id) {
      ToolNamedId.sectionDraftWithSubject => l10n.toolSectionDraftWithSubject(value),
      ToolNamedId.sectionStepDependsOn => l10n.toolSectionStepDependsOn(value),
      ToolNamedId.labelDeadlineConsequence => l10n.toolLabelDeadlineConsequence(value),
    };

/// Two names the bundle may reorder freely. Neither is translated: `from` is
/// what the model reported the source language was, `to` is what the user
/// asked for.
String _toolNamedPair(
  AppL10n l10n,
  ToolNamedPairId id,
  String first,
  String second,
) =>
    switch (id) {
      ToolNamedPairId.sectionTranslationFromTo => l10n.toolSectionTranslationFromTo(first, second),
    };

/// The separator between values is the bundle's — `، ` in Arabic, `、` in
/// Chinese and Japanese — which is why the list arrives unjoined.
String _toolNamedList(
  AppL10n l10n,
  ToolNamedListId id,
  List<String> values,
  int hidden,
) {
  final joined = values.join(l10n.listSeparator);
  return switch (id) {
    ToolNamedListId.labelDeadlineRequiredItems =>
      l10n.toolLabelDeadlineRequiredItems(joined),
    ToolNamedListId.factLoss => hidden == 0
        ? l10n.rewriteDroppedFacts(values.length, joined)
        : l10n.rewriteDroppedFactsMore(hidden, joined),
  };
}

extension IntelligenceSectionL10n on IntelligenceSection {
  String titleIn(AppL10n l10n) => titleCopy?.resolveIn(l10n) ?? title;

  String? bodyIn(AppL10n l10n) => bodyCopy?.resolveIn(l10n) ?? body;

  /// [bullets] in the reader's language, item by item. An item with no copy is
  /// the model's own words and passes through.
  List<String> bulletsIn(AppL10n l10n) => [
        for (var i = 0; i < bullets.length; i++)
          i < bulletCopy.length ? bulletCopy[i].resolveIn(l10n) : bullets[i],
      ];
}

extension IntelligenceFactL10n on IntelligenceFact {
  String labelIn(AppL10n l10n) => labelCopy?.resolveIn(l10n) ?? label;

  String valueIn(AppL10n l10n) => valueCopy?.resolveIn(l10n) ?? value;
}

extension IntelligenceWarningL10n on IntelligenceWarning {
  String messageIn(AppL10n l10n) => copy.resolveIn(l10n);
}

extension IntelligenceSuggestionL10n on IntelligenceSuggestion {
  String titleIn(AppL10n l10n) => titleCopy?.resolveIn(l10n) ?? title;

  /// The detail line, assembled in the reader's order with the reader's
  /// separator rather than with the `' · '` the strategy used for the log.
  String? detailIn(AppL10n l10n) {
    if (detailCopy.isEmpty) return detail;
    return detailCopy
        .map((part) => part.resolveIn(l10n))
        .where((part) => part.isNotEmpty)
        .join(l10n.toolDetailSeparator);
  }
}

extension IntelligenceArtifactL10n on IntelligenceArtifact {
  String titleIn(AppL10n l10n) => titleCopy?.resolveIn(l10n) ?? title;
}
