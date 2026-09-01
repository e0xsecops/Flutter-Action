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
}
