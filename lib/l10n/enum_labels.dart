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
