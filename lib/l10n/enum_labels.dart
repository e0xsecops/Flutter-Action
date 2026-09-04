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

import '../features/actions/application/reminder_presets.dart';

import '../features/capture/domain/ocr_script.dart';
import '../features/capture/domain/source_item.dart';
import '../features/extraction/domain/extraction_schema.dart';
import '../features/intelligence/domain/intelligence_tool.dart';
import '../features/library/presentation/library_screen.dart';
import '../features/library/presentation/source_card.dart';
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
