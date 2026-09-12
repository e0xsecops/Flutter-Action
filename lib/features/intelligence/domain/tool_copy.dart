/// What a tool-authored string *is*, beside what it says.
///
/// A tool strategy runs in `data/`, with no `BuildContext` and no locale, and
/// writes finished English. The screen has the locale but, given a finished
/// sentence, has nothing left to switch on. This is the thing it switches on:
/// the value carries its identity, and — where the sentence names or counts
/// something — the values with it, still typed.
///
/// **Nothing here is a string in a language.** A count is an `int` until the
/// bundle formats it, because a numeral written into a sentence in `data/` has
/// stopped being a number and cannot be pluralised for Polish or Arabic
/// afterwards. A named value is carried whole and placed by the bundle,
/// because "From {from} to {to}" is not the word order Japanese or Turkish
/// uses. A list is carried as a list, because `', '` is `، ` in Arabic and
/// `、` in Chinese and Japanese.
///
/// Sealed, so a shape that is not handled is a compile error rather than an
/// English sentence on a Bengali screen.
///
/// **This file imports no Flutter and no `AppL10n`.** It is a plain data
/// discriminator — the one thing the architecture note lets into the
/// Intelligence domain. The bundle meets it in `lib/l10n/enum_labels.dart`,
/// which is where `ToolCopy.resolveIn` lives.
library;

import '../../../core/security/credential_scanner.dart';
import '../../../core/security/file_identity.dart';
import '../../../core/security/link_inspector.dart';
import '../data/authenticity_inspector.dart';
import '../data/sensitive_scanner.dart';

sealed class ToolCopy {
  const ToolCopy();
}

/// A fixed sentence with nothing in it but itself.
final class ToolPhrase extends ToolCopy {
  const ToolPhrase(this.id);

  final ToolPhraseId id;
}

/// A sentence that counts something.
///
/// [count] stays an `int` all the way to `intl`. Every id here is an ICU
/// plural in the bundle, including the ones whose English singular carries no
/// numeral, so a language that needs a numeral or a classifier can add one.
final class ToolCounted extends ToolCopy {
  const ToolCounted(this.id, this.count);

  final ToolCountedId id;
  final int count;
}

/// A sentence that names one runtime value.
///
/// [value] is the user's own text or the model's — never translated, and never
/// pre-joined into the sentence. The bundle decides where it goes.
final class ToolNamed extends ToolCopy {
  const ToolNamed(this.id, this.value);

  final ToolNamedId id;
  final String value;
}

/// A sentence that names two.
final class ToolNamedPair extends ToolCopy {
  const ToolNamedPair(this.id, this.first, this.second);

  final ToolNamedPairId id;
  final String first;
  final String second;
}

/// A sentence that names several values and, where it names fewer than were
/// found, counts the remainder.
///
/// The list is carried unjoined: the separator between the values is the
/// bundle's `listSeparator`, and [hidden] is a plural argument.
final class ToolNamedList extends ToolCopy {
  const ToolNamedList(this.id, this.values, {this.hidden = 0});

  final ToolNamedListId id;
  final List<String> values;
  final int hidden;
}

/// Runtime text with no identity — a host read out of a link, a fact name the
/// model wrote, an amount out of the user's own document.
///
/// Exists so a *composed* line can hold translatable and untranslatable parts
/// in one list and still be joined in the reader's order. A scalar field whose
/// whole content is runtime text leaves its copy null instead.
final class ToolVerbatim extends ToolCopy {
  const ToolVerbatim(this.text);

  final String text;
}

/// A tool mode. The constant is a prompt-control identifier and stays English;
/// only what is drawn is translated. See `modeLabel` in `enum_labels.dart`.
final class ToolModeName extends ToolCopy {
  const ToolModeName(this.mode);

  final String mode;
}

final class ToolSensitiveKindCopy extends ToolCopy {
  const ToolSensitiveKindCopy(this.kind);

  final SensitiveKind kind;
}

final class ToolCredentialLabelCopy extends ToolCopy {
  const ToolCredentialLabelCopy(this.finding);

  final CredentialFinding finding;
}

final class ToolCredentialAdviceCopy extends ToolCopy {
  const ToolCredentialAdviceCopy(this.finding);

  final CredentialFinding finding;
}

final class ToolLinkVerdictCopy extends ToolCopy {
  const ToolLinkVerdictCopy(this.verdict);

  final LinkVerdict verdict;
}

/// One observation bullet. Carries the observation, not its two halves: the
/// summary and the detail are each localized before the bundle's frame joins
/// them, so no locale ever gets its own punctuation around English clauses.
final class ToolLinkObservationCopy extends ToolCopy {
  const ToolLinkObservationCopy(this.observation);

  final LinkObservation observation;
}

final class ToolAuthenticityTitleCopy extends ToolCopy {
  const ToolAuthenticityTitleCopy(this.verdict);

  final AuthenticityVerdict verdict;
}

final class ToolAuthenticityExplanationCopy extends ToolCopy {
  const ToolAuthenticityExplanationCopy(this.verdict);

  final AuthenticityVerdict verdict;
}

final class ToolSignalLabelCopy extends ToolCopy {
  const ToolSignalLabelCopy(this.signal);

  final AuthenticitySignal signal;
}

final class ToolSignalValueCopy extends ToolCopy {
  const ToolSignalValueCopy(this.signal);

  final AuthenticitySignal signal;
}

/// The detected format, or the honest absence of one.
final class ToolFileKindCopy extends ToolCopy {
  const ToolFileKindCopy(this.identity);

  final FileIdentity identity;
}

/// A byte count, formatted with the reader's digits and separators.
final class ToolFileSizeCopy extends ToolCopy {
  const ToolFileSizeCopy(this.identity);

  final FileIdentity identity;
}

/// Member name = ARB key with the leading `tool` removed, lowerCamel.
///
/// `toolSectionAnswer` is [ToolPhraseId.sectionAnswer];
/// `toolWarningQuoteNotFound` is [ToolPhraseId.warningQuoteNotFound]. The rule
/// is mechanical so a reviewer can grep in either direction.
enum ToolPhraseId {
  // 57 section headings and bodies.
  sectionWhatChanged, sectionNote, sectionAlreadyClearBody,
  sectionImprovedText, sectionSubject, sectionDraftReply, sectionPlaceholders,
  sectionTranslation, sectionKeptInOriginal, sectionTable, sectionFields,
  sectionTableCsv, sectionNothingDue, sectionNothingDueBody,
  sectionCouldBeSimpler, sectionThePlan, sectionContradictions,
  sectionWhatThisIs, sectionWhatMatters, sectionKeyDetails, sectionNoAnswer,
  sectionNoAnswerBody, sectionAnswer, sectionFromTheDocument,
  sectionKeyPoints, sectionWhatDiffers, sectionConflicts, sectionOnlyInOne,
  sectionInCommon, sectionRedactionNothingToScan,
  sectionRedactionNothingToScanBody, sectionRedactionNothingFound,
  sectionRedactionNothingFoundBody, sectionRedactedCopy,
  sectionAuthenticityNothingToInspect,
  sectionAuthenticityNothingToInspectBody, sectionAuthenticityFileSignals,
  sectionAuthenticityFileItself, sectionFileContents,
  sectionFileUnknownFormat, sectionFileSize, sectionFileDigest,
  sectionCredentialNothingToCheck, sectionCredentialNothingToCheckBody,
  sectionCredentialNoneFound, sectionCredentialNoneFoundBody,
  sectionCredentialRedactedCopy, sectionLinkNoneFound,
  sectionLinkNoneFoundBody, sectionLinkUnreadableHost,
  sectionLinkNothingUnusual, sectionLinkNothingUnusualBody, sectionObjective,
  sectionCurrentState, sectionRecommendedNextStep, sectionCredentialAdvice,
  sectionSummary,

  // 16 warnings.
  warningFactsNotChecked, warningDraftNotSent, warningTranslationNotCertified,
  warningTableLayoutUncertain, warningNothingScheduledAutomatically,
  warningReplyTruncated, warningNoSupportingQuotes,
  warningEvidenceUnverifiable, warningQuoteNotFound, warningRedactionCoverage,
  warningRedactionFormatLimit, warningAuthenticityNotProof,
  warningCredentialRevoke, warningCredentialCoverage, warningLinkAddressOnly,
  warningLinkNoSignals,
}

/// Every one of these is an ICU plural in every bundle.
enum ToolCountedId {
  sectionDeadlineCount, sectionBlockerCount, sectionMissingDetailCount,
  warningEvidenceNotFound, sectionRedactionFindings,
  sectionCredentialFindings, sectionCredentialPossibleFindings,
  sectionLinkFindings,
}

enum ToolNamedId {
  /// `toolSectionDraftWithSubject` — {subject}
  sectionDraftWithSubject,
  /// `toolSectionStepDependsOn` — {step}
  sectionStepDependsOn,
  /// `toolLabelDeadlineConsequence` — {consequence}
  labelDeadlineConsequence,
}

enum ToolNamedPairId {
  /// `toolSectionTranslationFromTo` — {from}, {to}
  sectionTranslationFromTo,
}

enum ToolNamedListId {
  /// `toolLabelDeadlineRequiredItems` — {items}, joined with the bundle's `listSeparator`.
  labelDeadlineRequiredItems,

  /// `rewriteDroppedFacts` / `rewriteDroppedFactsMore`, the one id whose two
  /// bundle keys are chosen by whether anything was hidden.
  factLoss,
}
