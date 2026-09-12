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

  @override
  String get detailSaveFailed =>
      'That didn\'t save. Nothing was lost — try again.';

  @override
  String get detailSectionCreatedFrom => 'Created from';

  @override
  String get detailSourceChecking => 'Checking the original capture…';

  @override
  String get detailSourceUnavailable =>
      'The original capture is no longer available.';

  @override
  String get detailReopenAction => 'Reopen action';

  @override
  String get detailMarkActionComplete => 'Mark action complete';

  @override
  String get detailGetHelp => 'Get help with this';

  @override
  String get detailSectionHistory => 'History';

  @override
  String get detailHistoryShowLess => 'Show less';

  @override
  String detailHistoryShowAll(int count) {
    return 'Show all $count';
  }

  @override
  String get detailHistoryCreated => 'Created';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Created with $count steps',
      one: 'Created with 1 step',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'You confirmed the details';

  @override
  String detailHistoryStepFinished(String title) {
    return 'Finished “$title”';
  }

  @override
  String get detailHistoryAStep => 'a step';

  @override
  String get detailHistoryReminderSet => 'You set a reminder';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'You set a reminder for $when';
  }

  @override
  String get detailHistoryCompleted => 'Marked done';

  @override
  String get detailHistoryChanged => 'Last changed';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Custom (OpenAI-compatible)';

  @override
  String get aiCapabilityText => 'text';

  @override
  String get aiCapabilityImages => 'images';

  @override
  String get aiCapabilityDocuments => 'documents';

  @override
  String get aiCapabilityStructuredResults => 'structured results';

  @override
  String get aiCapabilityStreaming => 'streaming';

  @override
  String get aiCapabilitySystemInstructions => 'system instructions';

  @override
  String get aiCapabilityEvidenceCitations => 'evidence citations';

  @override
  String get aiCapabilityLongDocuments => 'long documents';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a or $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head or $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'Connect an AI provider to use this tool.';

  @override
  String get aiFailureInvalidKey =>
      'That API key was not accepted by the provider.';

  @override
  String get aiFailureQuotaExceeded =>
      'Your provider account is out of credit or has hit its quota.';

  @override
  String get aiFailureRateLimited =>
      'Your provider is rate-limiting requests. Try again shortly.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action couldn\'t reach your AI provider. Check your connection.';

  @override
  String get aiFailureUnsupportedModel =>
      'That model is not available to your key. Choose another in Settings.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'The model you chose cannot read $capabilities. Pick another model in Settings.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'That was too much content for this model to read at once.';

  @override
  String get aiFailureInputTooLargeText =>
      'That is more text than can be analysed at once.';

  @override
  String get aiFailureProviderUnavailable =>
      'Your AI provider is having trouble. Try again shortly.';

  @override
  String get aiFailureMalformedResponse =>
      'That provider sent back something Action could not read.';

  @override
  String get aiFailureCancelled => 'Stopped.';

  @override
  String get aiFailureInsecureEndpoint =>
      'That endpoint must be an https:// address.';

  @override
  String get aiFailureUnknown =>
      'Something went wrong talking to your AI provider.';

  @override
  String get appLockTitle => 'Action is locked';

  @override
  String get appLockPrompt =>
      'Confirm it is you to continue. Action asks your device — it never sees your fingerprint, face or PIN.';

  @override
  String get appLockUnlocking => 'Unlocking…';

  @override
  String get appLockNotConfirmed =>
      'That was not confirmed. Try again when you are ready.';

  @override
  String get appLockCannotConfirm =>
      'Your device cannot confirm it is you right now. Check that a screen lock is still set up in your device settings.';

  @override
  String get appLockWaiting => 'Waiting…';

  @override
  String get appLockUnlock => 'Unlock';

  @override
  String get appLockReasonUnlock => 'Unlock Action';

  @override
  String get appLockReasonEnable =>
      'Confirm it is you before turning on App Lock';

  @override
  String get appLockReasonDisable =>
      'Confirm it is you before turning off App Lock';

  @override
  String get todayCapabilityHeading => 'What Action handles';

  @override
  String get todayCapabilityDocumentTitle => 'A letter or bill';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action reads it and finds the deadline, the amount and the reference.';

  @override
  String get todayCapabilityScreenshotTitle => 'A screenshot';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Turn a message you would otherwise forget into something you can act on.';

  @override
  String get todayCapabilityTextTitle => 'Some text';

  @override
  String get todayCapabilityTextBlurb =>
      'Paste anything. Action works out what it is and what it asks of you.';

  @override
  String get todayCapabilityConfirmTitle => 'You confirm everything';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Nothing becomes a task until you have seen the evidence and said yes.';

  @override
  String get todayCapabilityExploreIntelligence => 'Explore Intelligence';

  @override
  String get documentRejectedEmpty => 'That file is empty.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'That document is $size, which is larger than Action can work with.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'That is not a PDF, whatever it is called. Action reads PDFs and images.';

  @override
  String get documentRejectedUnreadable => 'That document could not be read.';

  @override
  String get pdfRejectedNotAPdf =>
      'That file is not a PDF, whatever it is called.';

  @override
  String get pdfRejectedEncrypted =>
      'That PDF is password-protected, so Action cannot read it.';

  @override
  String get pdfRejectedDamaged =>
      'That PDF could not be read. It may be incomplete.';

  @override
  String get shareRejectedEmpty => 'There was nothing in that share to read.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action can take text, images and PDFs. That was something else.';

  @override
  String get shareRejectedContentMismatch =>
      'That file is not the kind of file it says it is, so Action has not opened it.';

  @override
  String get shareRejectedTooLarge =>
      'That file is too large for Action to work with.';

  @override
  String get shareRejectedUnreadable => 'That file could not be read.';

  @override
  String get captureFailureRecognition => 'Text recognition could not run.';

  @override
  String get captureFailureImageFormat =>
      'That image format couldn\'t be read on this device.';

  @override
  String get connectSheetTitle => 'Connect your AI';

  @override
  String get connectSheetSubtitle =>
      'You use your own provider account and API key. Action stores the key in this device’s secure storage.';

  @override
  String get connectErrorKeyMissing => 'Paste your API key to continue.';

  @override
  String get connectErrorModelMissing => 'Choose a model, or type a model id.';

  @override
  String get connectErrorEndpointMissing => 'Add the address of your endpoint.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'This device\'s secure storage could not be opened, so the key was not saved.';

  @override
  String get connectTestSucceeded => 'Connected.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Connected. $count models available.';
  }

  @override
  String get connectProviderLabel => 'Provider';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'Must be an https:// address. Action will not send your documents over an unencrypted connection.';

  @override
  String get connectApiKeyLabel => 'API key';

  @override
  String get connectApiKeyHint => 'Paste your key';

  @override
  String get connectKeyPrivacyNote =>
      'Your key stays on this device. Action never sends it anywhere except to the provider you chose, and cannot show it to you again after saving.';

  @override
  String get connectModelLabel => 'Model';

  @override
  String get connectModelIdHint => 'Model id';

  @override
  String get connectModelFreeTextNote =>
      'Providers retire model ids and add new ones. If the one you want is not listed, type it here.';

  @override
  String get connectAndTest => 'Connect and test';

  @override
  String get connectSaveWithoutTesting => 'Save without testing';

  @override
  String get toolWarningFactsNotChecked =>
      'Action couldn\'t compare this against the original text, so the amounts and dates in it have not been checked.';

  @override
  String get toolTitleRewrite => 'Improve this writing';

  @override
  String get toolDescriptionRewrite =>
      'Clearer, shorter or more formal — facts kept intact.';

  @override
  String get toolModeRewriteClearer => 'Clearer';

  @override
  String get toolModeRewriteProfessional => 'More professional';

  @override
  String get toolModeRewriteShorter => 'Shorter';

  @override
  String get toolModeRewritePersuasive => 'More persuasive';

  @override
  String get toolModeRewriteSimpler => 'Simpler';

  @override
  String get toolModeRewriteStructured => 'More structured';

  @override
  String get toolModeRewriteGrammarOnly => 'Grammar only';

  @override
  String get toolSectionWhatChanged => 'What changed';

  @override
  String get toolSectionNote => 'Note';

  @override
  String get toolSectionAlreadyClearBody =>
      'This was already clear. The changes below are minor.';

  @override
  String get toolSectionImprovedText => 'Improved text';

  @override
  String get toolTitleDraftReply => 'Draft a reply';

  @override
  String get toolDescriptionDraftReply =>
      'A response you can edit and send yourself.';

  @override
  String get toolModeReplyProfessional => 'Professional';

  @override
  String get toolModeReplyConcise => 'Concise';

  @override
  String get toolModeReplyFriendly => 'Friendly';

  @override
  String get toolModeReplyFormal => 'Formal';

  @override
  String get toolModeReplyClarification => 'Ask for clarification';

  @override
  String get toolModeReplyConfirmation => 'Confirm';

  @override
  String get toolModeReplyDispute => 'Dispute this';

  @override
  String get toolSectionSubject => 'Subject';

  @override
  String get toolSectionDraftReply => 'Draft reply';

  @override
  String get toolSectionPlaceholders => 'You need to fill these in';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Draft — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'This is a draft. Action does not send anything — read it, edit it, and send it yourself.';

  @override
  String get toolTitleTranslate => 'Translate';

  @override
  String get toolDescriptionTranslate =>
      'Another language, with the numbers and names kept intact.';

  @override
  String get toolSectionTranslation => 'Translation';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'From $from to $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'Kept in the original';

  @override
  String get toolWarningTranslationNotCertified =>
      'A translation for understanding, not a certified translation.';

  @override
  String get toolTitleStructuredData => 'Extract a table';

  @override
  String get toolDescriptionStructuredData =>
      'Rows, fields and figures you can copy out.';

  @override
  String get toolSectionTable => 'Table';

  @override
  String get toolSectionFields => 'Fields';

  @override
  String get toolSectionTableCsv => 'Table (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'The column layout of this table could not be read reliably. Check the rows line up before using them.';

  @override
  String get toolTitleDeadlineFinder => 'Find deadlines';

  @override
  String get toolDescriptionDeadlineFinder =>
      'What is due, when, and what happens if it is not.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deadlines',
      one: '1 deadline',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Nothing due';

  @override
  String get toolSectionNothingDueBody =>
      'Action found no deadlines or obligations in this material.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'Nothing is scheduled until you choose it. Reminders are never set automatically.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'If not: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'You need: $items';
  }

  @override
  String get moneyErrorEmpty => 'no amount given';

  @override
  String get moneyErrorMalformed => 'the amount is not a plain number';

  @override
  String get moneyErrorNegative => 'a negative amount is not a payable sum';

  @override
  String get moneyErrorTooManyDecimals =>
      'more decimal places than the currency has';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'the currency code is not one we recognise';

  @override
  String get moneyErrorOutOfRange => 'the amount is implausibly large';

  @override
  String get escalationOcrFailed =>
      'Recognition could not run on this capture at all.';

  @override
  String get escalationNoTextRecognised =>
      'This looks like a document, but no text was recognised.';

  @override
  String get escalationThinText =>
      'Far too little text was recognised for a document this size.';

  @override
  String get escalationLowLineConfidence =>
      'The recogniser reported low confidence on several lines.';

  @override
  String get escalationTableLikeLayout =>
      'The layout looks like a table, and reading it line by line loses which value belongs to which row.';

  @override
  String get escalationFragmentedLayout =>
      'The text came back as many tiny fragments, so the structure is unclear.';

  @override
  String get escalationMalformedText =>
      'Much of the recognised text is not readable words or numbers.';

  @override
  String get escalationConflictingDates =>
      'More than one date is presented as a deadline.';

  @override
  String get escalationConflictingAmounts =>
      'More than one amount is presented as the sum due.';

  @override
  String get escalationUnresolvedGrounding =>
      'Some values could not be traced back to the document text.';

  @override
  String get escalationInstructionLikeContent =>
      'The document contains text written as if it were instructions to the app. It is treated as document content, never as instructions.';

  @override
  String get providerFailureNetwork =>
      'Action could not reach the service. Check your connection.';

  @override
  String get providerFailureTimedOut => 'The service took too long to answer.';

  @override
  String get providerFailureServiceUnavailable =>
      'The service is temporarily unavailable. Try again later.';

  @override
  String get providerFailureUnauthorized =>
      'This app is not authorised to use the service right now.';

  @override
  String get providerFailureBlocked =>
      'The service declined to process this document.';

  @override
  String get providerFailureUnknown =>
      'Action could not read this document. Trying again may work.';

  @override
  String get reviewBlockerTitle => 'Give this action a title.';

  @override
  String get reviewBlockerDate =>
      'Choose which date is the real deadline, or leave it unset.';

  @override
  String get reviewBlockerAmount =>
      'Choose which amount is right, or leave it unset.';

  @override
  String get reviewBlockerStepTitle => 'Steps you keep need a title.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'page $page',
      one: 'page 1',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'pages $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'The rewrite no longer contains $values. Check it before using this.',
      one:
          'The rewrite no longer contains $values. Check it before using this.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'The rewrite no longer contains $values and $count more. Check it before using this.',
      one:
          'The rewrite no longer contains $values and 1 more. Check it before using this.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Reached';

  @override
  String get goalNewSheetTitle => 'What do you want to happen?';

  @override
  String get goalNewSheetSubtitle =>
      'One sentence is enough. You can add the details after.';

  @override
  String get goalTitleHint => 'Renew the car insurance without overpaying.';

  @override
  String get goalCreateAction => 'Create goal';

  @override
  String get goalTitleSheetTitle => 'What you want';

  @override
  String get goalOutcomeSheetTitle => 'What done looks like';

  @override
  String get goalContextSheetTitle => 'Where it stands';

  @override
  String get goalOutcomeHint =>
      'The car is insured and the paperwork is filed.';

  @override
  String get goalContextHint =>
      'I have two quotes and the renewal is on the 18th.';

  @override
  String get goalWorkspaceTitle => 'Goal';

  @override
  String get goalUnmarkReached => 'Not reached after all';

  @override
  String get goalMarkReached => 'Mark as reached';

  @override
  String get goalNotFound => 'That goal is no longer here.';

  @override
  String get goalDeleteTitle => 'Delete this goal?';

  @override
  String get goalDeleteBody =>
      'The goal is removed from this device. Any Actions made from it stay exactly as they are.';

  @override
  String get goalOutcomeLabel => 'What done looks like';

  @override
  String get goalOutcomeEmpty =>
      'Not written yet. A goal is easier to plan when you have said what finishing it means.';

  @override
  String get goalContextLabel => 'Where it stands';

  @override
  String get goalContextEmpty =>
      'Nothing written yet. What has happened so far, and what is in the way.';

  @override
  String get goalTitleLabel => 'What you want';

  @override
  String get goalEditTooltip => 'Edit goal';

  @override
  String get goalToolsLabel => 'What Action can do';

  @override
  String get goalToolsNotReady =>
      'Write a little more about what you want, and these will have something to work with.';

  @override
  String get toolGoalOptimizerTitle => 'Improve a goal';

  @override
  String get toolActionPlanTitle => 'Build a plan';

  @override
  String get resultFactUnconfirmed => 'Unconfirmed';

  @override
  String get resultSuggestedSteps => 'Suggested steps';

  @override
  String get resultSuggestedAction => 'Suggested action';

  @override
  String get resultWorthAsking => 'Worth asking';

  @override
  String get resultSuggestedDeadlines => 'Suggested deadlines';

  @override
  String get resultSuggestions => 'Suggestions';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count supporting quotes',
      one: '1 supporting quote',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'From the selected source';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Preparing your document';

  @override
  String get toolRunStageReading => 'Reading the selected pages';

  @override
  String get toolRunStageAnalysing => 'Analysing';

  @override
  String get toolRunStageBuilding => 'Building your review';

  @override
  String get toolRunStageDone => 'Done';

  @override
  String get toolRunStageFailed => 'That didn\'t finish';

  @override
  String get toolRunStageCancelled => 'Stopped';

  @override
  String get toolRunFailureLocalCheckFailed => 'That couldn\'t be checked.';

  @override
  String get toolRunFailureProviderRetired =>
      'That AI provider is no longer available in this version.';

  @override
  String get toolRunFailureUnusableReply =>
      'That reply did not come back in a usable form. Try again.';

  @override
  String get toolRunFailureQuestionRequired => 'Type a question first.';

  @override
  String get toolRunFailureInputRequired =>
      'Choose something for this tool to work on.';

  @override
  String get toolWarningReplyTruncated =>
      'This reply was cut short, so it may be incomplete.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Your model returned no supporting quotes, so nothing here is evidenced. Check it against the document before acting on it.';

  @override
  String get aiSettingsRemoveTitle => 'Remove this connection?';

  @override
  String get aiSettingsRemoveBody =>
      'Action will delete your API key from this device and stop using AI features. Your provider account is not affected.';

  @override
  String get aiSettingsProviderLabel => 'Provider';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'You are billed by your provider for what you use. Action never makes a request on its own.';

  @override
  String get aiSettingsConnectLabel => 'Connect an AI provider';

  @override
  String get aiSettingsConnectDescription =>
      'Use your own account and API key with OpenAI, Anthropic, Google Gemini, or a compatible endpoint.';

  @override
  String get aiSettingsModelLabel => 'Model';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API key';

  @override
  String get aiSettingsKeyStored => 'Stored in this device’s secure storage.';

  @override
  String get aiSettingsKeyMissing =>
      'No key found on this device. Connect again to add one.';

  @override
  String get aiSettingsTestLabel => 'Test connection';

  @override
  String get aiSettingsProviderUnavailable =>
      'That provider is not available in this version.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Connected. $count models available.';
  }

  @override
  String get aiSettingsTestButton => 'Test';

  @override
  String get aiSettingsChangeProvider => 'Change provider or model';

  @override
  String get aiSettingsRemoveKey => 'Remove key';

  @override
  String get aiSettingsSectionPrivacy => 'Privacy';

  @override
  String get aiSettingsWhatGetsSentLabel => 'What gets sent';

  @override
  String get aiSettingsWhereItGoesLabel => 'Where it goes';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'Nothing is sent until you connect a provider.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Directly to $provider, using your key. It does not pass through Action’s servers.';
  }

  @override
  String get aiSettingsSectionData => 'Data';

  @override
  String get aiSettingsDataFootnote =>
      'Action remembers which tools you used, never what you used them on.';

  @override
  String get aiSettingsRecentToolsLabel => 'Recently used tools';

  @override
  String get aiSettingsRecentToolsNone => 'None';

  @override
  String get reminderNotificationTitle => 'Action reminder';

  @override
  String get reminderNotificationPrivateBody => 'You have something to review.';

  @override
  String get reminderChannelName => 'Action reminders';

  @override
  String get reminderChannelDescription =>
      'Reminders you set yourself for your actions.';

  @override
  String get onboardingStart => 'Start using Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get onboardingCaptureTitle => 'Turn information into action';

  @override
  String get onboardingCaptureBody =>
      'Add a screenshot, a photo or text you have been sent. Action reads it and works out what it is asking you to do.';

  @override
  String get onboardingReviewTitle => 'Nothing is saved until you confirm it';

  @override
  String get onboardingReviewBody =>
      'Action shows you what it found and the words it came from. You fix anything that is wrong. Until you confirm, it is a suggestion — not a fact, and not an Action.';

  @override
  String get onboardingTrackingTitle => 'Stay on top of what matters';

  @override
  String get onboardingTrackingBody =>
      'Needs attention brings forward what is overdue or close. Every Action keeps its next step, its progress and any reminder you set for it.';

  @override
  String get onboardingPrivacyBody => 'Worth knowing before you start:';

  @override
  String get onboardingPrivacyOnDevice =>
      'Your Actions, captures, reminders and searches are stored on this device. Search and reminders work without a connection.';

  @override
  String get onboardingPrivacySentToRead =>
      'When you ask Action to read something, that content is sent to the AI service that interprets it.';

  @override
  String get onboardingPrivacyCloud =>
      'A short record of a confirmed Action — its title, dates, amount and suggested step — may be saved to the cloud under an anonymous ID for this device. Your captures, steps and reminders are not.';

  @override
  String get onboardingPrivacyNotBackup =>
      'That record is not a backup. It cannot restore anything to a new device.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blockers',
      one: '1 blocker',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Could be simpler';

  @override
  String get toolDescriptionGoalOptimizer =>
      'What is missing, what blocks it, what to do first.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'After: $step';
  }

  @override
  String get toolSectionThePlan => 'The plan';

  @override
  String get toolDescriptionActionPlan =>
      'An ordered set of steps you can turn into Actions.';

  @override
  String get toolTitleSmartChecklist => 'Make a checklist';

  @override
  String get toolDescriptionSmartChecklist =>
      'Everything this asks of you, in order.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count missing details',
      one: '1 missing detail',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'These disagree with each other';

  @override
  String get toolTitleMissingInformation => 'What is missing';

  @override
  String get toolDescriptionMissingInformation =>
      'The gaps, and what to ask about them.';

  @override
  String get aiAdapterTimedOut => 'That took too long and was stopped.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'The secure connection to your AI provider failed.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action could not find that model or endpoint.';

  @override
  String get aiAdapterRequestRejected =>
      'Your AI provider rejected that request.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action couldn\'t open this device\'s secure storage.';

  @override
  String get aiAdapterEndpointMissing =>
      'Add the address of your AI endpoint in Settings.';

  @override
  String get aiAdapterReplyIncomplete =>
      'That reply was incomplete. Try again.';

  @override
  String get aiAdapterContentDeclined =>
      'Your provider declined to process that content.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'That is more than $limit files at once. Select fewer.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'One of those images is too large to analyse.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '\"$filename\" is too large to analyse. The limit is $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '\"$filename\" has $count pages. Action reads up to $limit at a time — choose a range.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'That selection is too large to send in one request.';

  @override
  String get toolRunNotAvailableTitle => 'That tool is not available';

  @override
  String get toolRunNotAvailableMessage =>
      'It may have been removed in a newer version of Action.';

  @override
  String get toolRunNoSourcesYet =>
      'Nothing to work on yet. Capture something, or paste some text below.';

  @override
  String get toolRunChooseSourcesToCompare => 'Choose what to compare';

  @override
  String get toolRunChooseSource => 'Choose a source';

  @override
  String get toolRunQuestionLabel => 'Your question';

  @override
  String get toolRunQuestionHint => 'What is the deadline?';

  @override
  String get toolRunFreeTextLabel => 'Or paste some text';

  @override
  String get toolRunFreeTextHint => 'Paste or type here';

  @override
  String get toolRunModeLabel => 'Style';

  @override
  String get toolRunRunLocally => 'Check on this device';

  @override
  String get toolRunRun => 'Run';

  @override
  String get toolRunStop => 'Stop';

  @override
  String get toolRunRunAgain => 'Run again';

  @override
  String get toolRunWorkingOn => 'Working on';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'Send this to $provider?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'The content you selected will be sent to $provider for processing, using your API key.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'Your key stays on this device. Action does not send anything in the background, and does not send your other Actions or sources.';

  @override
  String get toolRunScopeTitle => 'Before this runs';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0 will be analysed using your $provider connection.';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files',
      one: '1 file',
    );
    return '$_temp0 will be analysed using your $provider connection.';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'The text you selected will be sent to your $provider connection.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Connect an AI provider to use this tool';

  @override
  String get toolRunNeedsProviderBody =>
      'You use your own provider account and API key.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count steps',
      one: '1 step',
    );
    return 'Action created from $_temp0.';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count steps',
      one: '1 step',
    );
    return '$_temp0 added.';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count steps',
      one: '1 step',
    );
    return 'Create an action · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count steps',
      one: '1 step',
    );
    return 'Add to this action · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Photo';

  @override
  String get sourceTypeLabelScreenshot => 'Screenshot';

  @override
  String get sourceTypeLabelPastedText => 'Pasted note';

  @override
  String get sourceTypeLabelDocument => 'Document';

  @override
  String get toolModeClearer => 'Clearer';

  @override
  String get toolModeMoreProfessional => 'More professional';

  @override
  String get toolModeShorter => 'Shorter';

  @override
  String get toolModeSimpler => 'Simpler';

  @override
  String get toolModeMoreStructured => 'More structured';

  @override
  String get toolModeMorePersuasive => 'More persuasive';

  @override
  String get toolModeGrammarOnly => 'Grammar only';

  @override
  String get toolModeProfessional => 'Professional';

  @override
  String get toolModeConcise => 'Concise';

  @override
  String get toolModeFriendly => 'Friendly';

  @override
  String get toolModeFormal => 'Formal';

  @override
  String get toolModeAskForClarification => 'Ask for clarification';

  @override
  String get toolModeConfirm => 'Confirm';

  @override
  String get toolModeDispute => 'Dispute this';

  @override
  String get toolModeQuick => 'Quick';

  @override
  String get toolModeDetailed => 'Detailed';

  @override
  String get toolModeExecutive => 'Executive';

  @override
  String get toolModeKeyPoints => 'Key points';

  @override
  String get toolModeActionFocused => 'Action-focused';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count quoted details could not be found in what you selected, so they are marked uncertain.',
      one: 'One quoted detail could not be found in what you selected, so it is marked uncertain.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action couldn\'t check these quotes against the file itself, so they have not been verified.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Overdue · $count days',
      one: 'Overdue · 1 day',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Due tomorrow';

  @override
  String get triageBadgeReminderSoon => 'Reminder soon';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Overdue by $count days',
      one: 'Overdue by 1 day',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'This is done.';

  @override
  String get triageExplanationNothingPressing =>
      'This is here because nothing about it is pressing yet.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'This needs attention because $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'This is further down because $reason.';
  }

  @override
  String get triageReasonOverdue => 'it is overdue';

  @override
  String get triageReasonDeadlinePassed => 'its deadline has passed';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'it is $count days overdue',
      one: 'it is one day overdue',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'it is due today';

  @override
  String get triageReasonCriticalDueSoon =>
      'you marked it critical and its deadline is close';

  @override
  String get triageReasonAllStepsDone =>
      'every step is done — it just needs finishing';

  @override
  String get triageReasonDueTomorrow => 'it is due tomorrow';

  @override
  String get triageReasonReminderSoon =>
      'you set a reminder for it within the next day';

  @override
  String get triageReasonDueWithinThreeDays => 'it is due within three days';

  @override
  String get triageReasonCriticalNoDeadline =>
      'you marked it critical, and it has no deadline';

  @override
  String get triageReasonDueWithinSevenDays => 'it is due within a week';

  @override
  String get triageReasonImportant => 'you marked it important';

  @override
  String get triageReasonDueLater => 'its deadline is further away';

  @override
  String get triageReasonNoDeadline =>
      'it has no deadline and nothing is pressing';

  @override
  String cardCompletedTooltip(String title) {
    return 'Completed: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Understand this document';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'What it is, what matters, and what to do about it.';

  @override
  String get toolSectionWhatThisIs => 'What this is';

  @override
  String get toolSectionWhatMatters => 'What matters';

  @override
  String get toolSectionKeyDetails => 'Key details';

  @override
  String get toolTitleAskDocument => 'Ask about a source';

  @override
  String get toolDescriptionAskDocument =>
      'Answers grounded in what you selected — or nothing.';

  @override
  String get toolSectionNoAnswer => 'No answer in this material';

  @override
  String get toolSectionNoAnswerBody =>
      'Action couldn\'t find that in the selected document.';

  @override
  String get toolSectionAnswer => 'Answer';

  @override
  String get toolSectionFromTheDocument => 'From the document';

  @override
  String get toolWarningQuoteNotFound =>
      'The quote behind this answer is not in the selected material. Treat the answer as unreliable.';

  @override
  String get toolTitleSmartSummary => 'Summarise';

  @override
  String get toolDescriptionSmartSummary =>
      'The short version — or the version that affects you.';

  @override
  String get toolSectionKeyPoints => 'Key points';

  @override
  String get toolTitleCompareDocuments => 'Compare documents';

  @override
  String get toolDescriptionCompareDocuments =>
      'What changed, what conflicts, what is missing.';

  @override
  String get toolSectionWhatDiffers => 'What differs';

  @override
  String get toolSectionConflicts => 'Conflicts';

  @override
  String get toolSectionOnlyInOne => 'Only in one of them';

  @override
  String get toolSectionInCommon => 'In common';

  @override
  String get sensitiveKindEmail => 'Email address';

  @override
  String get sensitiveKindPhone => 'Phone number';

  @override
  String get sensitiveKindPaymentCard => 'Payment card number';

  @override
  String get sensitiveKindIban => 'Bank account (IBAN)';

  @override
  String get sensitiveKindNationalId => 'National identity number';

  @override
  String get sensitiveKindPostcode => 'Postcode';

  @override
  String get sensitiveKindAccountNumber => 'Account number';

  @override
  String get sensitiveKindReference => 'Reference number';

  @override
  String get sensitiveKindDateOfBirth => 'Date of birth';

  @override
  String get sensitiveKindUrl => 'Web address';

  @override
  String get verdictVerifiedProvenance => 'Verified provenance available';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'This file carries a signature that was checked and held up.';

  @override
  String get verdictSignalsSynthetic =>
      'Signals consistent with AI-generated content';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'This file says it was made with a generative tool. Metadata can be edited or removed, so this is what the file claims, not proof.';

  @override
  String get verdictSignalsEdited => 'Signals consistent with edited content';

  @override
  String get verdictSignalsEditedExplainer =>
      'This file says it passed through editing software. That is ordinary for photographs and does not by itself mean anything was faked.';

  @override
  String get verdictNoReliableProvenance => 'No reliable provenance found';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'There is no provenance information in this file. That is normal — most services strip it — and it is not a sign of anything.';

  @override
  String get verdictInconclusive => 'Inconclusive';

  @override
  String get verdictInconclusiveExplainer =>
      'There is not enough information here to say where this came from.';

  @override
  String get authenticitySignalCamera => 'Camera';

  @override
  String get authenticitySignalSoftware => 'Software';

  @override
  String get authenticitySignalDescription => 'Description';

  @override
  String get authenticitySignalCopyright => 'Copyright';

  @override
  String get authenticitySignalLocation => 'Location';

  @override
  String get authenticitySignalLocationValue =>
      'Location data is present in this file.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Not checked — this build has no signature verifier.';

  @override
  String get authenticitySignalFile => 'File';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'Could not be read as an image.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'Not a recognised image format.';

  @override
  String get authenticitySignalText => 'Text';

  @override
  String get authenticitySignalTextValue =>
      'Text alone cannot reliably show whether AI was used. Action does not guess.';

  @override
  String get fileTypePng => 'a PNG image';

  @override
  String get fileTypeJpeg => 'a JPEG image';

  @override
  String get fileTypeGif => 'a GIF image';

  @override
  String get fileTypeWebp => 'a WebP image';

  @override
  String get fileTypeWav => 'a WAV recording';

  @override
  String get fileTypePdf => 'a PDF document';

  @override
  String get fileTypeHeic => 'a HEIC image';

  @override
  String get fileTypeVideo => 'a video file';

  @override
  String get fileTypeTiff => 'a TIFF image';

  @override
  String get fileTypeBitmap => 'a bitmap image';

  @override
  String get fileTypeRtf => 'an RTF document';

  @override
  String get fileTypeZip => 'a Zip archive';

  @override
  String get fileTypeGzip => 'a gzip archive';

  @override
  String get fileTypeSevenZip => 'a 7-Zip archive';

  @override
  String get fileTypeRar => 'a RAR archive';

  @override
  String get fileTypeWindowsProgram => 'a Windows program';

  @override
  String get fileTypeLinuxProgram => 'a Linux program';

  @override
  String get fileTypePostScript => 'a PostScript document';

  @override
  String get fileTypeOgg => 'an Ogg recording';

  @override
  String get fileTypeMp3 => 'an MP3 recording';

  @override
  String get fileTypePlainText => 'plain text';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'This file is named \".$extension\" but its contents are $contents. That can be an honest mistake, and it is also how a file gets opened by something other than what you expected.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bytes',
      one: '1 byte',
    );
    return '$_temp0';
  }

  @override
  String fileSizeKilobytes(String size) {
    return '$size KB';
  }

  @override
  String fileSizeMegabytes(String size) {
    return '$size MB';
  }

  @override
  String fileSizeGigabytes(String size) {
    return '$size GB';
  }

  @override
  String get credentialKindPrivateKey => 'Private key';

  @override
  String get credentialKindApiKey => 'API key';

  @override
  String get credentialKindConnectionString => 'Connection string';

  @override
  String get credentialKindAccessToken => 'Access token';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization header';

  @override
  String get credentialKindPasswordOrKey => 'Password or key';

  @override
  String get credentialKindPossibleSecret => 'Possible secret';

  @override
  String get credentialAdvicePrivateKey =>
      'Remove this before sharing, and replace the key pair. A private key cannot be made safe again once it has been seen.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Revoke this key with the provider and issue a new one. Removing it from the document does not disable it.';

  @override
  String get credentialAdviceConnectionString =>
      'This carries a password and the address it opens. Change the password if this has already been shared.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Tokens like this often expire, but not always. Treat it as live unless you know when it expires.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Remove the header value. Pasted request logs are one of the most common ways a working token gets shared by accident.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Move this into an environment variable or a secret store, and change the value if the file has been shared.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action cannot tell what this is. Check it before sharing — it may equally be an identifier or a checksum.';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API key';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI project key';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI-style API key';

  @override
  String get credentialLabelGoogleApiKey => 'Google API key';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth token';

  @override
  String get credentialLabelGitHubToken => 'GitHub token';

  @override
  String get credentialLabelSlackToken => 'Slack token';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS access key ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab token';

  @override
  String get credentialLabelNpmToken => 'npm token';

  @override
  String get credentialLabelPassphrase => 'Passphrase';

  @override
  String get credentialLabelPassword => 'Password';

  @override
  String get credentialLabelRefreshToken => 'Refresh token';

  @override
  String get credentialLabelToken => 'Token';

  @override
  String get credentialLabelClientSecret => 'Client secret';

  @override
  String get credentialLabelCredential => 'Credential';

  @override
  String get credentialLabelSecret => 'Secret';

  @override
  String get linkVerdictNoObviousSignals => 'No obvious signals';

  @override
  String get linkVerdictWorthChecking => 'Worth checking';

  @override
  String get linkVerdictTreatWithCaution => 'Treat with caution';

  @override
  String get linkSummaryNoObviousSignals =>
      'Nothing unusual in how this link is written. That is not the same as knowing the page is trustworthy — only you can judge whether you expected it.';

  @override
  String get linkSummaryWorthChecking =>
      'One thing about this link is worth a look before you open it.';

  @override
  String get linkSummaryTreatWithCaution =>
      'Several things about how this link is written are worth checking before you open it.';

  @override
  String get linkSignalNotHttps => 'Not encrypted';

  @override
  String get linkSignalNonWebScheme => 'Not a web link';

  @override
  String get linkSignalEmbeddedCredentials => 'Password in the link';

  @override
  String get linkSignalMisleadingAuthority => 'Hidden real address';

  @override
  String get linkSignalIpLiteralHost => 'Numeric address';

  @override
  String get linkSignalPunycodeHost => 'Encoded characters in the name';

  @override
  String get linkSignalMixedScriptHost => 'Mixed alphabets in the name';

  @override
  String get linkSignalEncodedHost => 'Escaped characters in the name';

  @override
  String get linkSignalUnusualPort => 'Unusual port';

  @override
  String get linkSignalDeepSubdomain => 'Many parts in the name';

  @override
  String get linkSignalPublicSuffixInSubdomain =>
      'Familiar name in the wrong place';

  @override
  String get linkSignalShortener => 'Shortened link';

  @override
  String get linkSignalExecutableTarget => 'Downloads a program';

  @override
  String get linkSignalRedirectParameter => 'Sends you on somewhere else';

  @override
  String get linkSignalVeryLongUrl => 'Very long';

  @override
  String get linkSignalUnparseable => 'Not a readable link';

  @override
  String get linkDetailNotHttps =>
      'This link uses http, so anything you type into the page can be read on the way there.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'This opens with \"$scheme:\" rather than a web page. It may ask another app to do something.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'A username and password are written into this link. Anywhere it is shared, they go with it.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'Everything before the \"@\" is ignored by the browser. The real destination is \"$host\".';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'This goes to \"$host\" — a raw address rather than a name. Legitimate sites almost always use a name.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'The site name contains non-Latin characters, stored encoded. This is normal for many languages, and it is also how a name can be made to look like a familiar one.';

  @override
  String get linkDetailMixedScriptHost =>
      'The site name mixes Latin letters with letters from another alphabet that look the same. Read it character by character.';

  @override
  String get linkDetailEncodedHost =>
      'The site name contains escape codes, which is not where they belong. They can hide what the name actually says.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'This connects on port $port rather than the usual one. That is common for test servers and unusual for public sites.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'The name has $count parts. Only the last two decide who runs the site; the rest can be set to anything.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'This name contains \".$suffix.\" in the middle, which makes the beginning look like the site. The site is actually \"$host\".';
  }

  @override
  String get linkDetailShortener =>
      'A shortening service hides the real destination. You cannot tell where this goes without opening it.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'This link ends in \"$fileExtension\", so it downloads something that can run on your device rather than a page to read.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'This link carries a second address in its \"$parameter\" setting, so opening it may take you somewhere other than \"$host\".';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'Long links are harder to read, and the part that decides the destination can be pushed out of sight.';

  @override
  String get linkDetailUnparseable =>
      'Action could not read this as a web address. Be careful with links that do not look like links.';

  @override
  String get toolTitleRedaction => 'Hide sensitive details';

  @override
  String get toolDescriptionRedaction =>
      'Find what should not be shared, and make a clean copy.';

  @override
  String get toolSectionRedactionNothingToScan => 'Nothing to scan';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'This tool reads text. Select a note, a pasted message, or a capture whose text has been read.';

  @override
  String get toolSectionRedactionNothingFound => 'Nothing obvious found';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action found no email addresses, phone numbers, card numbers or reference numbers in this text.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count things worth hiding',
      one: '1 thing worth hiding',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Redacted copy';

  @override
  String get toolWarningRedactionCoverage =>
      'This finds patterns like emails, phone numbers and account numbers. It will not catch everything sensitive — read the copy before you share it.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action cannot redact images or PDF files. Covering something in a picture would leave the original underneath it, so it is not offered.';

  @override
  String get toolTitleAuthenticity => 'Check where this came from';

  @override
  String get toolDescriptionAuthenticity =>
      'What a file declares about its own origin.';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'Nothing to inspect';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Select an image or some text.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'What this file says about itself';

  @override
  String get toolSectionAuthenticityFileItself => 'The file itself';

  @override
  String get toolSectionFileContents => 'Contents';

  @override
  String get toolSectionFileUnknownFormat => 'Not a format Action knows';

  @override
  String get toolSectionFileSize => 'Size';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'This reports what a file declares about itself. Metadata can be edited or stripped, so none of it is proof. Do not use this to accuse anyone.';

  @override
  String get toolTitleCredentialScanner => 'Check for keys and passwords';

  @override
  String get toolDescriptionCredentialScanner =>
      'Find credentials before you share something.';

  @override
  String get toolSectionCredentialNothingToCheck => 'Nothing to check';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Paste some text, or choose a capture whose text has been read. This tool reads text only.';

  @override
  String get toolSectionCredentialNoneFound => 'No credentials found';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action did not find anything shaped like an API key, a private key, a token or a password in this text.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count credentials found',
      one: '1 credential found',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count things that might be secrets',
      one: '1 thing that might be a secret',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Copy with the credentials removed';

  @override
  String get toolWarningCredentialRevoke =>
      'Removing a key from a document does not disable it. If one of these has already been shared, revoke it with the provider and issue a new one.';

  @override
  String get toolWarningCredentialCoverage =>
      'This finds credentials with a recognisable shape. A password written out in a sentence will not be found, so read the text as well.';

  @override
  String get toolTitleLinkInspector => 'Check a link';

  @override
  String get toolDescriptionLinkInspector =>
      'What an address gives away before you open it.';

  @override
  String get toolSectionLinkNoneFound => 'No links found';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Paste a link, or choose a capture that contains one.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count links in this text',
      one: 'The link in this text',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'Unreadable';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'Nothing unusual in how these are written';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'That is not the same as knowing the pages are trustworthy. Only you can judge whether you expected them.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action reads the address only. It does not open the link, look up the site, or check any reputation service — doing that would send your browsing somewhere.';

  @override
  String get toolWarningLinkNoSignals =>
      'A link with no signals can still be harmful. This finds problems in how an address is written, which is not everything there is to know about where it goes.';

  @override
  String get toolSectionObjective => 'What you want';

  @override
  String get toolSectionCurrentState => 'Where it stands';

  @override
  String get toolSectionRecommendedNextStep => 'Recommended next step';

  @override
  String get toolSectionCredentialAdvice => 'What to do';

  @override
  String get toolSectionSummary => 'Summary';

  @override
  String get toolDetailSeparator => ' · ';
}
