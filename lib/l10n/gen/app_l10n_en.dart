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
