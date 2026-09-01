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
}
