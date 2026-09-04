// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppL10nEn extends AppL10n {
  AppL10nEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDone => 'Done';

  @override
  String get commonSave => 'Save';

  @override
  String get commonClose => 'Close';

  @override
  String get commonBack => 'Back';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonOpen => 'Open';

  @override
  String get commonCopy => 'Copy';

  @override
  String get commonCopied => 'Copied';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonAdd => 'Add';

  @override
  String get commonOn => 'On';

  @override
  String get commonOff => 'Off';

  @override
  String get commonUnknown => 'Unknown';

  @override
  String get commonChecking => 'Checking…';

  @override
  String get commonSettings => 'Settings';

  @override
  String get commonDismiss => 'Dismiss';

  @override
  String get commonUndo => 'Undo';

  @override
  String get commonSkip => 'Skip';

  @override
  String get commonNotNow => 'Not now';

  @override
  String get commonSomethingWentWrong => 'Something went wrong.';

  @override
  String get navToday => 'Today';

  @override
  String get navLibrary => 'Library';

  @override
  String get navIntelligence => 'Intelligence';

  @override
  String get navSearch => 'Search';

  @override
  String get navCapture => 'Capture something';

  @override
  String get todayGreetingMorning => 'Good morning';

  @override
  String get todayGreetingAfternoon => 'Good afternoon';

  @override
  String get todayGreetingEvening => 'Good evening';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Your actions couldn\'t be loaded. They are still stored on this device.';

  @override
  String get todaySectionNeedsAttention => 'Needs attention';

  @override
  String get todaySectionAlsoNeedsAttention => 'Also needs attention';

  @override
  String get todaySectionWaitingForReview => 'Waiting for review';

  @override
  String get todaySectionComingUp => 'Coming up';

  @override
  String todaySeeAllCaptures(int count) {
    return 'See all $count captures';
  }

  @override
  String get todaySeeAllInLibrary => 'See all in Library';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count done',
      one: '1 done',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actions completed. Open the library.',
      one: '1 action completed. Open the library.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'START WITH';

  @override
  String get todayQuickPhoto => 'Photo';

  @override
  String get todayQuickScreenshot => 'Screenshot';

  @override
  String get todayQuickText => 'Text';

  @override
  String get todayQuickTools => 'Check a link, or find keys in some text';

  @override
  String get briefBadgeNeedsYou => 'NEEDS YOU';

  @override
  String get briefBadgeToReview => 'TO REVIEW';

  @override
  String get briefBadgeAhead => 'AHEAD';

  @override
  String get briefBadgeStartHere => 'START HERE';

  @override
  String get briefBadgeClear => 'CLEAR';

  @override
  String get briefNext => 'NEXT';

  @override
  String briefOpenAction(String title) {
    return 'Open $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Mark \"$title\" as done';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actions need your attention',
      one: '1 action needs your attention',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count captures are also waiting for review.',
      one: '1 capture is also waiting for review.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count captures are waiting for you',
      one: '1 capture is waiting for you',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Nothing is overdue.';

  @override
  String get briefHeadlineNothingToday => 'Nothing needs you today';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actions are coming up.',
      one: '1 action is coming up.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'You\'re clear';

  @override
  String get briefDetailClear => 'Nothing is due and nothing is waiting.';

  @override
  String get briefHeadlineFirstRun => 'Start with anything';

  @override
  String get briefDetailFirstRun =>
      'A letter, a screenshot, a note — Action works out what it is.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSectionPersonalise => 'Personalise';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsAppearanceDescription =>
      'Light, dark, or whatever the device is doing.';

  @override
  String get settingsLanguageDescription =>
      'The language Action speaks to you in.';

  @override
  String get appearanceSystem => 'System';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceDark => 'Dark';

  @override
  String get appearanceSystemDescription => 'Match the device setting';

  @override
  String get appearanceLightDescription => 'Always light';

  @override
  String get appearanceDarkDescription => 'Always dark';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageSubtitle =>
      'Changes apply straight away. Nothing is sent anywhere; the choice is stored on this device.';

  @override
  String get languageSectionChoose => 'Choose a language';

  @override
  String get languageSystem => 'System';

  @override
  String get languageSystemDescription => 'Follow the device\'s language';

  @override
  String get languageDraftNote =>
      'English is the language Action\'s wording was written in. The other translations were drafted against a fixed glossary and checked automatically, and have not yet been reviewed by a native speaker. Where the exact wording matters — privacy, security, what Action will and will not claim — English remains the reference.';

  @override
  String get ocrScriptTitle => 'Text recognition';

  @override
  String get ocrScriptSubtitle =>
      'The writing system Action reads when it looks at a photo. Recognition happens on this device; no capture is sent anywhere to be read.';

  @override
  String get ocrScriptSectionChoose => 'Writing system';

  @override
  String get ocrScriptFollowLanguage => 'Follow the app language';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Currently $script';
  }

  @override
  String get ocrScriptLatin => 'Latin';

  @override
  String get ocrScriptChinese => 'Chinese';

  @override
  String get ocrScriptDevanagari => 'Devanagari';

  @override
  String get ocrScriptJapanese => 'Japanese';

  @override
  String get ocrScriptKorean => 'Korean';

  @override
  String get ocrScriptLatinDescription =>
      'English, Spanish, French, German and the other languages written in Latin letters.';

  @override
  String get ocrScriptChineseDescription =>
      'Simplified and Traditional Chinese.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Hindi, Marathi and Nepali. Not Bengali, Tamil or Telugu — each of those is a different writing system.';

  @override
  String get ocrScriptJapaneseDescription => 'Japanese.';

  @override
  String get ocrScriptKoreanDescription => 'Korean.';

  @override
  String get ocrScriptFootnote =>
      'Every choice except Latin also reads Latin letters, so picking one adds a writing system instead of swapping it. Changing this affects photos taken from now on, not ones already read.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action cannot read the $language script';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'There is no on-device recogniser for it. Photos will still be read for anything written in Latin letters, and the rest will come back empty. You can type or paste that text instead.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action is set to read $script. If this photo is in another writing system, change it in Settings and read it again.';
  }

  @override
  String get settingsTextRecognition => 'Text recognition';

  @override
  String get settingsTextRecognitionDescription =>
      'The writing system Action reads from photos.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action works without AI. Connecting your own provider adds document analysis, planning and drafting tools.';

  @override
  String get settingsAiProvider => 'AI provider';

  @override
  String get settingsAiNotConnected =>
      'Not connected. Use your own account and API key.';

  @override
  String settingsAiConnected(String provider) {
    return 'Connected to $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Privacy & security';

  @override
  String get settingsSecurity => 'Security';

  @override
  String get settingsWhereInfoLives => 'Where your information lives';

  @override
  String get settingsWhereInfoLivesDescription =>
      'What stays on this device, and what does not.';

  @override
  String get protectionAppLock => 'App Lock';

  @override
  String get protectionScreenPrivacy => 'screen privacy';

  @override
  String get protectionPrivateReminders => 'private reminders';

  @override
  String get protectionSummaryNone =>
      'App Lock, screen privacy and what leaves this device.';

  @override
  String protectionSummaryOne(String first) {
    return '$first is on.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first and $second are on.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second and $third are on.';
  }

  @override
  String get settingsSectionReminders => 'Reminders';

  @override
  String get settingsRemindersFootnote =>
      'Android may deliver a reminder a little later than the time you set, depending on battery settings and how the device is being used.';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsNotificationsOnDescription =>
      'Reminders you set can be shown.';

  @override
  String get settingsNotificationsOffDescription =>
      'Turned off for Action, so reminders will not appear.';

  @override
  String get settingsNotificationsUnknown => 'Could not be checked.';

  @override
  String get settingsNotificationsAllowed => 'Allowed';

  @override
  String get settingsOpenSystemSettings => 'Open settings';

  @override
  String get settingsActionFootnote =>
      'Action turns messy information into clear next steps. You confirm everything before it is saved.';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsHelpDescription =>
      'How Action works, and what it will not do.';

  @override
  String get settingsVersion => 'Version';

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Just now';

  @override
  String relativeMinutes(int count) {
    return '${count}m ago';
  }

  @override
  String relativeHours(int count) {
    return '${count}h ago';
  }

  @override
  String get relativeYesterday => 'Yesterday';

  @override
  String relativeDays(int count) {
    return '${count}d ago';
  }

  @override
  String get libraryTitle => 'Library';

  @override
  String get librarySubtitle =>
      'Everything Action is holding for you. All of it stays on this device.';

  @override
  String get librarySegmentActions => 'Actions';

  @override
  String get librarySegmentCaptures => 'Captures';

  @override
  String get librarySegmentGoals => 'Goals';

  @override
  String get librarySegmentDone => 'Done';

  @override
  String get libraryNewGoal => 'New goal';

  @override
  String get libraryNoGoalsTitle => 'No goals yet';

  @override
  String get libraryNoGoalsMessage =>
      'A goal is something you want to happen. Action can find what is missing, what blocks it, and what to do first.';

  @override
  String get libraryNoDoneTitle => 'Nothing completed yet';

  @override
  String get libraryNoDoneMessage => 'Actions you finish will be kept here.';

  @override
  String get libraryNoOpenTitle => 'No open actions';

  @override
  String get libraryNoOpenMessage =>
      'Capture something and Action will work out what needs doing.';

  @override
  String get libraryNoCapturesTitle => 'Nothing captured yet';

  @override
  String get libraryNoCapturesMessage =>
      'Photos, screenshots and text you add land here first. Nothing is analysed until you ask.';

  @override
  String get libraryGoalNoActions => 'Nothing made from it yet';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actions from this goal',
      one: '1 action from this goal',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Search actions and captures';

  @override
  String get searchClear => 'Clear';

  @override
  String get searchPrivacyNote =>
      'Searched on this device. Nothing you type here leaves it.';

  @override
  String get searchYouCanSearch => 'YOU CAN SEARCH';

  @override
  String get searchFieldTitles => 'Titles';

  @override
  String get searchFieldTitlesExample => 'Renew the car insurance';

  @override
  String get searchFieldReferences => 'Reference numbers';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Organisations';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Steps inside an Action';

  @override
  String get searchFieldStepsExample => 'Upload the form';

  @override
  String get searchFieldCaptureText => 'The text read from a capture';

  @override
  String get searchFieldCaptureTextExample => 'renewal notice';

  @override
  String searchNoMatchesTitle(String query) {
    return 'No matches for \"$query\"';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Try fewer words, or a reference number exactly as it appears.';

  @override
  String get searchNoMatchesClearFilters =>
      'Try fewer words, or clear the filters.';

  @override
  String get searchFilterActive => 'Active';

  @override
  String get searchFilterCompleted => 'Completed';

  @override
  String get searchFilterOverdue => 'Overdue';

  @override
  String get searchFilterThisWeek => 'This week';

  @override
  String get searchFilterCritical => 'Critical';

  @override
  String get searchFilterCreatedByYou => 'Created by you';

  @override
  String get searchFilterArchived => 'Archived';

  @override
  String get searchFilterClear => 'Clear filters';

  @override
  String get searchIncompleteActions =>
      'Couldn\'t search your actions, so these results may be incomplete.';

  @override
  String get searchIncompleteCaptures =>
      'Couldn\'t search your captures, so these results may be incomplete.';

  @override
  String get searchIncompleteBoth =>
      'Couldn\'t search your actions or your captures, so these results may be incomplete.';

  @override
  String get searchMatchTitle => 'Title';

  @override
  String get searchMatchNextStep => 'Next step';

  @override
  String get searchMatchStep => 'Step';

  @override
  String get searchMatchSummary => 'Summary';

  @override
  String get searchMatchFromCapture => 'From capture';

  @override
  String get studioSuggested => 'Suggested for your last capture';

  @override
  String get studioRecentlyUsed => 'Recently used';

  @override
  String get studioReady => 'READY';

  @override
  String get studioNotConnected => 'NOT CONNECTED';

  @override
  String get studioHeroTitle => 'Action Intelligence';

  @override
  String get studioConnectedBlurb =>
      'Understand a document, improve a goal, build a plan, draft a reply, or check what you are looking at.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count tools for understanding documents, planning and writing. Connect your own AI account to use them — you are billed by your provider, never by Action.';
  }

  @override
  String get studioConnectAi => 'Connect AI';

  @override
  String get studioHowItWorks => 'How it works';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count of them already work without any of that, entirely on this device.',
      one: '1 of them already works without any of that, entirely on this device.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Runs on this device';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Runs on this device.';
  }

  @override
  String get categoryUnderstand => 'Understand';

  @override
  String get categoryUnderstandBlurb => 'Make sense of what you have.';

  @override
  String get categoryPlan => 'Plan';

  @override
  String get categoryPlanBlurb => 'Turn it into something you can do.';

  @override
  String get categoryCreate => 'Create';

  @override
  String get categoryCreateBlurb => 'Write it, improve it, translate it.';

  @override
  String get categoryExtract => 'Extract';

  @override
  String get categoryExtractBlurb => 'Pull out the details that matter.';

  @override
  String get categoryVerify => 'Verify';

  @override
  String get categoryVerifyBlurb => 'Check what you are looking at.';

  @override
  String get captureSheetTitle => 'Capture something';

  @override
  String get captureSheetSubtitle =>
      'Hand Action anything you would rather not read through.';

  @override
  String get captureTakePhoto => 'Take a photo';

  @override
  String get captureTakePhotoSubtitle =>
      'A letter, bill or notice in front of you';

  @override
  String get captureChooseImage => 'Choose an image';

  @override
  String get captureChooseImageSubtitle =>
      'A screenshot or photo already on this device';

  @override
  String get capturePasteText => 'Paste text';

  @override
  String get capturePasteTextSubtitle => 'An email, message or notice';

  @override
  String get captureChoosePdf => 'Choose a PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'A statement, letter or form you already have';

  @override
  String get captureFootnote =>
      'Captures stay on this device. Nothing is analysed online until you ask for it.';

  @override
  String get captureCouldNotOpen => 'Couldn\'t open that. Try another way.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Reading';

  @override
  String get stageNeedsReview => 'Needs review';

  @override
  String get stageActionCreated => 'Action created';

  @override
  String get stageNoText => 'No text found';

  @override
  String get stageCouldNotBeRead => 'Couldn\'t be read';

  @override
  String get stageReadingPreview => 'Reading the text…';

  @override
  String get stageFailedPreview => 'This couldn\'t be read on this device.';

  @override
  String get provenancePhoto => 'Captured from photo';

  @override
  String get provenanceImage => 'Captured from image';

  @override
  String get provenancePastedText => 'Captured from pasted text';

  @override
  String get provenanceDocument => 'Added as a document';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Done $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Overdue · was due $date';
  }

  @override
  String get metaDueToday => 'Due today';

  @override
  String metaDueOn(String date) {
    return 'Due $date';
  }

  @override
  String get metaCreatedByYou => 'Created by you';

  @override
  String get categoryPayment => 'Payment';

  @override
  String get categoryRenewal => 'Renewal';

  @override
  String get categoryAppointment => 'Appointment';

  @override
  String get categoryBooking => 'Booking';

  @override
  String get categoryTravel => 'Travel';

  @override
  String get categoryDeadline => 'Deadline';

  @override
  String get categoryResponse => 'Reply needed';

  @override
  String get categoryDelivery => 'Delivery';

  @override
  String get categoryDocument => 'Document';

  @override
  String get categoryNoActionRequired => 'No action needed';

  @override
  String get categoryUnsure => 'Not sure';

  @override
  String get errorEnterManually => 'Enter it manually';

  @override
  String get sourceWhatWeRead => 'What we read';

  @override
  String get sourceDelete => 'Delete capture';

  @override
  String get sourceGone => 'That capture is no longer available.';

  @override
  String get sourceDeleteTitle => 'Delete this capture?';

  @override
  String get sourceDeleteBody =>
      'The image and the text read from it are removed from this device.';

  @override
  String get sourceDeleteKeep => 'Keep';

  @override
  String get sourceOpenAction => 'Open the action';

  @override
  String sourceOpenActions(int count) {
    return 'Open $count actions';
  }

  @override
  String get sourceCreateAnother => 'Create another from this';

  @override
  String get sourceCreateAction => 'Create an action from this';

  @override
  String get sourceDoMore => 'Do more with this';

  @override
  String sourceMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String sourceDimensions(int width, int height) {
    return '$width×$height';
  }

  @override
  String sourceKilobytes(int size) {
    return '$size KB';
  }

  @override
  String sourceConvertedFrom(String format, String size) {
    return 'from $format $size KB';
  }

  @override
  String get sourceTextFound => 'Text found';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines lines · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'This is the text Action read. What was made from it is below.';

  @override
  String get sourceNotInterpreted =>
      'Nothing has been interpreted yet. Action will suggest what to do with this, and you confirm before anything is created.';

  @override
  String get sourceNoTextExplainer =>
      'This can happen with handwriting, very low light, or a script this device cannot read yet.';

  @override
  String get sourceReadFailed => 'Couldn\'t read this';

  @override
  String get sourceReadFailedReason => 'Text recognition did not complete.';

  @override
  String get sourceTryReadingAgain => 'Try reading again';

  @override
  String get sourceTypeInstead => 'Type the details instead';

  @override
  String get sourceTypeWhatItSays => 'Type what it says';

  @override
  String get sourceTypeHint => 'Dates, amounts, and what is being asked for.';

  @override
  String get sourceMadeFromThis => 'Made from this capture';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count made from this capture';
  }

  @override
  String get sourceTheDocument => 'The document';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Page count unknown';

  @override
  String get sourceDocumentNotRead =>
      'Action has not read what is inside this document. When you run a tool that needs to, the file goes to the AI provider you connected and you will be told before it does.';

  @override
  String get previewSaveFailed => 'Couldn\'t save that. Try again.';

  @override
  String get previewTitle => 'Check the capture';

  @override
  String get previewImageFailed => 'That image couldn\'t be opened.';

  @override
  String get previewHint =>
      'Make sure the text is readable and nothing important is cut off.';

  @override
  String get previewRetake => 'Retake';

  @override
  String get pasteTitle => 'Paste text';

  @override
  String get pasteHint =>
      'Paste the email, message, or notice you would rather not read through.';

  @override
  String get pasteFootnote =>
      'Anything with a date, an amount, or a request works well.';

  @override
  String get pasteEnough => 'Looks like enough to work with.';

  @override
  String get pasteMore => 'A little more text will give a better result.';

  @override
  String get reviewLoadFailed => 'Could not load this capture.';

  @override
  String get reviewConfirmed => 'Confirmed';

  @override
  String get reviewNeedsReview => 'Needs review';

  @override
  String get reviewReview => 'Review';

  @override
  String get reviewHighConfidence => 'High confidence';

  @override
  String get reviewConfirmedByYou => 'Confirmed by you';

  @override
  String get reviewMissing => 'Missing';

  @override
  String get reviewNotUnderstood =>
      'Action couldn’t reliably understand enough of this source.';

  @override
  String get reviewNotUnderstoodBody =>
      'The capture is safe and nothing was lost. You can enter the details yourself, and the source stays attached for reference.';

  @override
  String get reviewEnterDetails => 'Enter the details';

  @override
  String get reviewKeepSource => 'Keep the source for later';

  @override
  String reviewEngine(String engine) {
    return 'Engine: $engine';
  }

  @override
  String get reviewManualNotice =>
      'You are creating this action yourself. Only what you enter here will be used.';

  @override
  String get reviewUntitled => 'Untitled action';

  @override
  String get reviewEditTitle => 'Edit title';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count values need your review.',
      one: '1 value needs your review before this can be confirmed.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Key facts';

  @override
  String get reviewNotFound => 'Not found';

  @override
  String get reviewSuggestedNextStep => 'Suggested next step';

  @override
  String get reviewWhyThisMatters => 'Why this matters';

  @override
  String get reviewSteps => 'Steps';

  @override
  String get reviewAddStep => 'Add a step';

  @override
  String get reviewInjectionNotice =>
      'Some text in this source looked like instructions rather than document facts, so Action ignored it.';

  @override
  String get reviewLayoutNotice =>
      'This document’s layout may contain relationships that text extraction couldn’t fully preserve. Check the values below against the source before confirming.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Check the values below against the source.';
  }

  @override
  String get reviewDeadline => 'Deadline';

  @override
  String get reviewAmount => 'Amount';

  @override
  String get reviewLeftUnset => 'None — you chose to leave this unset';

  @override
  String get reviewUnclear => 'Unclear';

  @override
  String get reviewNotSet => 'Not set';

  @override
  String get reviewNoDeadlineFound => 'None found in this document';

  @override
  String get reviewNoAmountFound => 'None found in this document';

  @override
  String get reviewMultipleDates => 'Action found multiple possible dates.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count dates could be the deadline. Choose the right one, enter another, or leave it unset.';
  }

  @override
  String get reviewChooseDate => 'Choose a date';

  @override
  String get reviewMultipleAmounts =>
      'Action found more than one possible amount.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count amounts could be the one this action is about. Choose, enter another, or leave it unset.';
  }

  @override
  String get reviewChooseAmount => 'Choose an amount';

  @override
  String get reviewSkipStep => 'Skip this step';

  @override
  String get reviewKeepStep => 'Keep this step';

  @override
  String get reviewEditStep => 'Edit step';

  @override
  String get reviewCreateManually => 'Create manually';

  @override
  String get reviewConfirmAndCreate => 'Confirm & create action';

  @override
  String get reviewFixHighlighted => 'Review highlighted fields';

  @override
  String get reviewSaving => 'Saving…';

  @override
  String get reviewSaveFailed =>
      'Could not save this action. Nothing was lost — try again.';

  @override
  String get reviewFieldTitle => 'Title';

  @override
  String get reviewTitleHint => 'What needs to happen?';

  @override
  String get reviewNewStep => 'New step';

  @override
  String get reviewStepHint => 'What to do';

  @override
  String get reviewDatesConflict => 'The document mentions more than one date.';

  @override
  String get reviewAmountsConflict =>
      'The document mentions more than one amount.';

  @override
  String get reviewAnotherDate => 'Another date — 2026-08-30';

  @override
  String get reviewBadDate => 'Not a real date. Use the format 2026-08-30.';

  @override
  String get reviewTypeDate => 'Type a date, or leave it unset below.';

  @override
  String get reviewUseThisDate => 'Use this date';

  @override
  String get reviewLeaveNoDeadline => 'Leave without a deadline';

  @override
  String get reviewAnotherAmount => 'Another amount — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Cannot use this amount: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Use this amount';

  @override
  String get reviewLeaveNoAmount => 'Leave without an amount';

  @override
  String get reviewThisValue => 'This value';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => 'See it on the capture';

  @override
  String get reviewViewSource => 'View source';

  @override
  String get reviewFromSource => 'From source';

  @override
  String get reviewNotVerified => 'Not verified';

  @override
  String get reviewCouldNotVerify =>
      'Could not verify this against the source.';

  @override
  String get reviewLooksRight => 'Looks right';

  @override
  String get reviewStageReading => 'Reading source';

  @override
  String get reviewStageUnderstanding => 'Understanding important details';

  @override
  String get reviewStageChecking => 'Checking what needs review';

  @override
  String get reviewNothingToDo => 'Nothing you need to do right now.';

  @override
  String get reviewInformationOnly =>
      'This looks like information only — no deadline, payment or reply was found.';

  @override
  String get reviewInformationOnlyWithSource =>
      'This looks like information only — no deadline, payment or reply was found in this capture.';

  @override
  String get reviewSourceKept => 'The source is kept either way.';

  @override
  String get reviewAddAnyway => 'Add an action anyway';

  @override
  String get reviewActionConfirmed => 'Action confirmed';

  @override
  String get reviewCreatedByYou => 'Created by you.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Confirmed by you from $count reviewed facts.',
      one: 'Confirmed by you from 1 reviewed fact.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Confirmed by you from $count reviewed facts. You changed $edited of them.',
      one:
          'Confirmed by you from 1 reviewed fact. You changed $edited of them.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Saved on this device.';

  @override
  String get detailLoadFailed =>
      'This action could not be loaded. It is still stored on this device.';

  @override
  String get detailNotFoundTitle => 'That action is no longer here';

  @override
  String get detailNotFoundMessage =>
      'It may have been deleted on this device.';

  @override
  String get detailGoBack => 'Go back';

  @override
  String get detailMore => 'More';

  @override
  String get detailChangeUrgency => 'Change urgency';

  @override
  String get detailAddRecommendedStep => 'Add a recommended step';

  @override
  String get detailEditRecommendedStep => 'Edit recommended step';

  @override
  String get detailArchiveTitle => 'Archive this action?';

  @override
  String get detailArchiveBody =>
      'It leaves your list but is not deleted, and the capture it came from is kept.';

  @override
  String get detailArchiveConfirm => 'Archive';

  @override
  String get detailArchived => 'Archived';

  @override
  String detailCompletedOn(String date) {
    return 'Completed $date';
  }

  @override
  String get detailSectionDetails => 'Details';

  @override
  String get detailSectionReminders => 'Reminders';

  @override
  String get detailAllStepsDone => 'All steps done';

  @override
  String get detailNextEyebrow => 'Next';

  @override
  String get detailCompleteQuestion => 'Complete this action?';

  @override
  String get detailMarkStepDone => 'Mark step done';

  @override
  String get detailCompleteAction => 'Complete this action';

  @override
  String get detailAddDeadline => 'Add a deadline';

  @override
  String get detailAddAmount => 'Add an amount';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed of $total done';
  }

  @override
  String get detailNoStepsTitle => 'No steps yet';

  @override
  String get detailNoStepsMessage =>
      'Break this into the moves you actually have to make.';

  @override
  String get detailAddFirstStep => 'Add first step';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Completed step: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Next step: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Step: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Mark \"$title\" as done';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Mark \"$title\" as not done';
  }

  @override
  String get detailStepOptions => 'Step options';

  @override
  String get detailMoveUp => 'Move up';

  @override
  String get detailMoveDown => 'Move down';

  @override
  String get detailDeleteStep => 'Delete step';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Delete this step?';

  @override
  String get stepDeleteKeep => 'Keep it';

  @override
  String get detailNoRemindersYet => 'No reminders yet.';

  @override
  String get detailReminderLimit =>
      'That is the most reminders one action can have. Remove one to add another.';

  @override
  String get detailAddReminder => 'Add reminder';

  @override
  String get detailChangeReminder => 'Change reminder';

  @override
  String get detailRemoveReminder => 'Remove reminder';

  @override
  String get detailReminderFormat => 'EEE d MMM, h:mm a';

  @override
  String get reminderStatePending => 'Not set up yet';

  @override
  String get reminderStateNotificationsOff =>
      'Saved, but notifications are off';

  @override
  String get reminderStateFailed => 'Couldn\'t be scheduled';

  @override
  String get reminderStateRemoving => 'Removing…';

  @override
  String get reminderSetConfirmation => 'Reminder set. We\'ll nudge you.';

  @override
  String get reminderUpdatedConfirmation => 'Reminder updated.';

  @override
  String get reminderNeedsPermission =>
      'Notifications are off, so this reminder is saved but cannot alert you yet.';

  @override
  String get reminderScheduleFailed =>
      'This reminder is saved, but Android wouldn\'t schedule it.';

  @override
  String get reminderLimitReached =>
      'That action already has the maximum number of reminders.';

  @override
  String get reminderTimeInPast => 'That time has already passed.';

  @override
  String get reminderAddTitle => 'Add a reminder';

  @override
  String get reminderChangeTitle => 'Change this reminder';

  @override
  String get reminderDateLabel => 'Date';

  @override
  String get reminderTimeLabel => 'Time';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'h:mm a';

  @override
  String get reminderSummaryDateFormat => 'EEEE d MMMM';

  @override
  String get reminderPresetFormat => 'd MMM, h:mm a';

  @override
  String reminderSummary(String date, String time) {
    return 'You will be reminded on $date at $time.';
  }

  @override
  String get reminderTimePastError =>
      'That time has already passed. Choose a later one.';

  @override
  String get reminderSet => 'Set reminder';

  @override
  String get reminderPresetInHour => 'In 1 hour';

  @override
  String get reminderPresetTomorrowMorning => 'Tomorrow morning';

  @override
  String get reminderPresetNextWeek => 'Next week';

  @override
  String get reminderPresetOnTheDay => 'On the day';

  @override
  String get reminderPresetDayBefore => '1 day before';

  @override
  String get reminderPresetWeekBefore => '1 week before';

  @override
  String get reminderPresetAtDeadline => 'At the deadline';

  @override
  String get reminderPresetHourBefore => '1 hour before';

  @override
  String get editNextStepTitle => 'Recommended next step';

  @override
  String get editNextStepSubtitle =>
      'A short sentence about the next useful move.';

  @override
  String get editNextStepHint => 'What is the next useful move?';

  @override
  String get editRemoveSuggestion => 'Remove the suggestion';

  @override
  String get editUrgencyTitle => 'How urgent is this?';

  @override
  String get editStepHint => 'One concrete thing to do';

  @override
  String get editAddStep => 'Add step';

  @override
  String get editDateHint => 'YYYY-MM-DD';

  @override
  String get editRemoveDeadline => 'Remove the deadline';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => 'Save amount';

  @override
  String get editRemoveAmount => 'Remove the amount';

  @override
  String get securityTitle => 'Security & privacy';

  @override
  String get securitySectionProtection => 'Protection';

  @override
  String get securityAppLockUnavailable =>
      'App Lock needs a screen lock on this device. Set a PIN, pattern, password or fingerprint in your device settings first.';

  @override
  String get securityAppLockOn =>
      'Action asks your device to confirm it is you.';

  @override
  String get securityAppLockOff =>
      'Require your fingerprint, face or device PIN to open Action.';

  @override
  String get securityAskAgain => 'Ask again';

  @override
  String get securityAskAgainDescription =>
      'How long Action may be in the background before it locks.';

  @override
  String get securityScreenPrivacy => 'Screen privacy';

  @override
  String get securityScreenPrivacyDescription =>
      'Ask Android to block screenshots and screen recording, and to hide Action in the app switcher.';

  @override
  String get securityPrivateReminders => 'Private reminders';

  @override
  String get securityPrivateRemindersOn =>
      'Reminders say only that something needs you.';

  @override
  String get securityPrivateRemindersOff =>
      'Reminders show the Action title. Turn this on to keep it off your lock screen.';

  @override
  String get securityLockNow => 'Lock now';

  @override
  String get securityLockNowDescription => 'Close the door without waiting.';

  @override
  String get securitySectionStorage => 'How your data is stored';

  @override
  String get securityStorageDataLabel => 'Your Actions, captures and settings';

  @override
  String get securityStorageDataDetail =>
      'They sit in this app\'s own private storage, which other apps cannot read and which Android encrypts as part of the device\'s encryption. Action does not add a second layer of its own on top.';

  @override
  String get securityStorageKeyLabel => 'Your AI provider key';

  @override
  String get securityStorageKeyDetail =>
      'Held in the Android Keystore rather than with everything else, and never shown again after you save it.';

  @override
  String get securityStorageGapLabel => 'What that does not cover';

  @override
  String get securityStorageGapDetail =>
      'None of it is a defence against someone using your unlocked device, and a modified or rooted system can read more than a normal one. App Lock is the control that helps with the first of those.';

  @override
  String get securitySectionInformation => 'Your information';

  @override
  String get securityWhereInfoDescription =>
      'Every route your data can take, and the two that leave this device.';

  @override
  String get securityAppLockRefused => 'Not confirmed, so nothing changed.';

  @override
  String get securityAppLockUnavailableToast =>
      'This device has no screen lock set up. Add a PIN, pattern, password or fingerprint in your device settings, then try again.';

  @override
  String get securityScreenPrivacyRefused =>
      'This device would not apply screen privacy, so it has been left off rather than shown as on.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count scheduled reminders updated to say less.',
      one: '1 scheduled reminder updated to say less.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count scheduled reminders updated.',
      one: '1 scheduled reminder updated.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Immediately';

  @override
  String get appLockDelayOneMinute => 'After 1 minute';

  @override
  String get appLockDelayFiveMinutes => 'After 5 minutes';

  @override
  String get securityDelayImmediatelyDescription =>
      'Every time Action leaves the screen';

  @override
  String get securityDelayOneMinuteDescription =>
      'Long enough to answer a message';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Long enough to take a call';

  @override
  String get securityHeroProtected => 'Protected';

  @override
  String get securityHeroNothingOn => 'Nothing turned on';

  @override
  String get securityHeroFootnote =>
      'Everything here works on this device. None of these settings is sent anywhere, and none of them can be changed remotely.';

  @override
  String get securityHeadlineNone => 'Three protections are available';

  @override
  String securityHeadlineOne(String first) {
    return '$first is on';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first and $second are on';
  }

  @override
  String get securityHeadlineAll => 'All three protections are on';

  @override
  String get securityTransfersTitle => 'What left this device';

  @override
  String get securityTransfersNoProvider =>
      'No AI provider is connected, so nothing is being sent for analysis at all.';

  @override
  String get securityTransfersDescription =>
      'Recorded here the moment something is sent, whether or not it came back. Only the tool, the provider and the size — never what was in it. Kept for 90 days on this device and sent nowhere.';

  @override
  String get securityClear => 'Clear';

  @override
  String get securityNothingSent => 'Nothing has been sent';

  @override
  String get securityNothingSentDescription =>
      'When you run a tool that uses your AI provider, it will be listed here.';

  @override
  String get securityClearHistoryTitle => 'Clear this history?';

  @override
  String get securityClearHistoryBody =>
      'The record of what was sent will be deleted from this device. It does not undo anything that was already sent.';

  @override
  String get securityUnnamedTool => 'An Intelligence tool';

  @override
  String get securityYourProvider => 'your AI provider';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'a short piece of text';

  @override
  String securityTransferCharacters(int count) {
    return '${count}k characters';
  }

  @override
  String securitySentTo(String provider) {
    return 'Sent to $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Sent to $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return '${count}w ago';
  }

  @override
  String get helpTitle => 'Help';

  @override
  String get helpAddQuestion => 'What can I add?';

  @override
  String get helpAddAnswer =>
      'A screenshot, a photo of a letter or bill, or text you paste in. Anything with a date, an amount or a request works best.';

  @override
  String get helpReviewQuestion => 'Why does Action ask me to review?';

  @override
  String get helpReviewAnswer =>
      'Because a machine reading a document can misread it, and a deadline that is quietly wrong is worse than no deadline at all. Action shows what it found and the words it came from, and nothing is saved until you confirm it.';

  @override
  String get helpVaryQuestion => 'Why do the results change if I try again?';

  @override
  String get helpVaryAnswer =>
      'The service that reads your document is not deterministic, so the same capture can come back slightly differently. That is also why the review step exists — you are the part that does not change.';

  @override
  String get helpLateQuestion => 'Why was my reminder late?';

  @override
  String get helpLateAnswer =>
      'Reminders are scheduled with Android, and Android decides exactly when to deliver them. Battery saving, Doze and manufacturer power settings can all delay one. Action never promises a reminder to the minute.';

  @override
  String get helpDataQuestion => 'Where is my data?';

  @override
  String get helpDataAnswer =>
      'Almost all of it is on this device: your captures, Actions, steps, reminders and searches. Two exceptions — the content you ask Action to read is sent to the AI service that reads it, and a short record of a confirmed Action may be stored in the cloud under an anonymous ID. Privacy & data in Settings lists exactly what that record contains.';

  @override
  String get helpBackupQuestion => 'Is this a backup?';

  @override
  String get helpBackupAnswer =>
      'No. The cloud record cannot be restored to a new device, and there is no account to sign in to. If you uninstall Action or lose this device, the data on it is gone.';

  @override
  String get helpCorrectQuestion => 'How do I correct an Action?';

  @override
  String get helpCorrectAnswer =>
      'Open it and edit any field — the title, the deadline, the amount or the suggested next step. You can add, reorder, complete and delete steps at any time. Editing an Action never asks the AI service anything.';

  @override
  String get privacyTitle => 'Privacy & data';

  @override
  String get privacyIntro =>
      'Action keeps as much as it can on this device. Two things are exceptions, and they are both listed below.';

  @override
  String get privacyGroupOnDevice => 'On this device';

  @override
  String get privacyOnDeviceCaptures =>
      'Captures — the screenshots, photos and text you add, and the text read out of them.';

  @override
  String get privacyOnDeviceActions =>
      'Actions, their steps, facts and reminders.';

  @override
  String get privacyOnDeviceSearch =>
      'Search. Your searches run here, are never sent anywhere, and are not kept after you close the screen.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Photos are stored without their location. The coordinates, time and camera details a phone writes into a picture are removed before the capture is saved, so they are not kept here and not included when you send a capture to your AI provider.';

  @override
  String get privacyGroupSentToRead => 'Sent to be read';

  @override
  String get privacySentToReadWhat =>
      'When you ask Action to interpret a capture, that content is sent to the AI service that reads it. This is not on-device AI.';

  @override
  String get privacySentToReadWhen =>
      'It is sent only for the capture you chose, and only when you ask for it.';

  @override
  String get privacyGroupYourProvider => 'Sent to your own AI provider';

  @override
  String get privacyProviderWhat =>
      'If you connect an AI provider in Settings, the Intelligence tools send the content you select to that provider — OpenAI, Anthropic, Google or an endpoint you chose — using your own API key.';

  @override
  String get privacyProviderDirect =>
      'It goes to them directly. It does not pass through any server belonging to Action.';

  @override
  String get privacyProviderScope =>
      'Only what you pick for a tool is sent, and only when you run it. Your other Actions, captures and sources are never included, and nothing is ever sent in the background.';

  @override
  String get privacyProviderKey =>
      'Your API key is kept in this device’s secure storage and is sent only to the provider it belongs to. Secure storage is a real obstacle to anyone with your unlocked device, but it is not absolute, and Action will not claim otherwise.';

  @override
  String get privacyProviderLocalTools =>
      'Two tools never send anything: hiding sensitive details, and checking where a file came from. Both run entirely on this device.';

  @override
  String get privacyProviderAgreement =>
      'What your provider does with what you send is governed by your agreement with them, not by Action.';

  @override
  String get privacyGroupCloud => 'Stored in the cloud';

  @override
  String get privacyCloudWhat =>
      'When you confirm an Action, a short record of it may be saved under an anonymous ID belonging to this installation: its title, status, urgency, category, deadline, amount, suggested next step and timestamps.';

  @override
  String get privacyCloudNotSent =>
      'Your captures, the text read from them, an Action’s steps and facts, and your reminders are not sent.';

  @override
  String get privacyCloudNotBackup =>
      'This is not a backup. There is no way to restore it to a new device, and losing this installation loses the anonymous ID with it.';

  @override
  String get privacyGroupDiagnostics => 'Diagnostics';

  @override
  String get privacyDiagnosticsWhat =>
      'Action records anonymous counts of what happens in the app — that a capture was started, that an extraction worked or did not, that a search found nothing, that an Action was completed.';

  @override
  String get privacyDiagnosticsCounts =>
      'These are counts, not contents. No title, amount, deadline, reference, captured text or search term is ever included, and neither is the anonymous ID or any identifier for an Action or capture.';

  @override
  String get privacyDiagnosticsCrash =>
      'If the app crashes, the error and where it happened are reported so it can be fixed. Action does not attach your data to those reports.';

  @override
  String get privacySectionYourData => 'Your data';

  @override
  String get privacyYourDataFootnote =>
      'Clearing captures leaves your Actions in place. An Action whose capture is gone still works; it simply no longer shows what it came from.';

  @override
  String get privacyClearCaptures => 'Clear captures';

  @override
  String get privacyClearCapturesDescription =>
      'Deletes every capture and its image file.';

  @override
  String get privacyDeleteAll => 'Delete all my data';

  @override
  String get privacyDeleteAllDescription =>
      'Actions, steps, reminders, captures and the cloud records above.';

  @override
  String get privacyClearCapturesTitle => 'Clear captures?';

  @override
  String get privacyClearCapturesBody =>
      'Every capture and its image will be deleted from this device. Your Actions stay exactly as they are.';

  @override
  String get privacyCapturesDeleted => 'Captures deleted.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Some captures could not be deleted. Nothing else was changed.';

  @override
  String get privacyDeleteAllTitle => 'Delete all your data?';

  @override
  String get privacyDeleteAllBody =>
      'This deletes every Action, step, reminder and capture on this device, and the cloud records listed above. It cannot be undone, and there is no backup to restore from.';

  @override
  String get privacyDeleteEverything => 'Delete everything';

  @override
  String get privacyDeletedAll => 'Everything has been deleted.';

  @override
  String get privacyDeleteFailed => 'Your data could not be deleted.';

  @override
  String get privacyDeletedUnverified =>
      'Everything on this device has been deleted. Action could not reach the cloud to confirm nothing is left there, and will check again.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Deleted, apart from $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action will try again.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action could not finish checking the cloud, and will try again.';

  @override
  String get privacyLeftoverCaptures => 'some captures';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cloud records',
      one: '1 cloud record',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first and $second';
  }

  @override
  String get privacyCloudDeleted => 'The cloud records have been deleted.';

  @override
  String get privacyCloudUnreachable =>
      'Still could not reach them. Action will try again.';

  @override
  String get privacyPendingTitle => 'Still to delete';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count cloud records could not be reached last time. Action will try again on its own, or you can retry now.',
      one: '1 cloud record could not be reached last time. Action will try again on its own, or you can retry now.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Try again';

  @override
  String get evidenceTitle => 'Where this came from';

  @override
  String get evidenceUnverified =>
      'Action could not find these words in the text it read, so this value has not been verified. Check it against the original before you rely on it.';

  @override
  String get evidenceHighlighted =>
      'These words were found in the text Action read from this capture, and the highlight shows where.';

  @override
  String get evidenceNoRegion =>
      'These words were found in the text Action read from this capture. It could not work out exactly where on the image they sit, so it is not guessing.';

  @override
  String get evidenceInText =>
      'These words were found in the text this capture contains.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Critical';

  @override
  String get urgencyImportant => 'Important';

  @override
  String get urgencyNormal => 'Normal';

  @override
  String get urgencyLow => 'Low';

  @override
  String get urgencyUnsure => 'Not sure';
}
