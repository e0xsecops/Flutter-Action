import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_l10n_ar.dart';
import 'app_l10n_bn.dart';
import 'app_l10n_de.dart';
import 'app_l10n_en.dart';
import 'app_l10n_es.dart';
import 'app_l10n_fr.dart';
import 'app_l10n_hi.dart';
import 'app_l10n_id.dart';
import 'app_l10n_it.dart';
import 'app_l10n_ja.dart';
import 'app_l10n_ko.dart';
import 'app_l10n_pl.dart';
import 'app_l10n_pt.dart';
import 'app_l10n_ru.dart';
import 'app_l10n_th.dart';
import 'app_l10n_tr.dart';
import 'app_l10n_ur.dart';
import 'app_l10n_vi.dart';
import 'app_l10n_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppL10n
/// returned by `AppL10n.of(context)`.
///
/// Applications need to include `AppL10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppL10n.localizationsDelegates,
///   supportedLocales: AppL10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppL10n.supportedLocales
/// property.
abstract class AppL10n {
  AppL10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppL10n of(BuildContext context) {
    return Localizations.of<AppL10n>(context, AppL10n)!;
  }

  static const LocalizationsDelegate<AppL10n> delegate = _AppL10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// The product name. Not translated — it is the brand and the launcher label.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get appName;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get commonRemove;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get commonOpen;

  /// No description provided for @commonCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get commonCopy;

  /// No description provided for @commonCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get commonCopied;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get commonAdd;

  /// No description provided for @commonOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get commonOn;

  /// No description provided for @commonOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get commonOff;

  /// No description provided for @commonUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get commonUnknown;

  /// No description provided for @commonChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking…'**
  String get commonChecking;

  /// No description provided for @commonSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get commonSettings;

  /// No description provided for @commonDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get commonDismiss;

  /// No description provided for @commonUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get commonUndo;

  /// No description provided for @commonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get commonSkip;

  /// No description provided for @commonNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get commonNotNow;

  /// No description provided for @commonSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get commonSomethingWentWrong;

  /// Bottom navigation: the daily surface. Must stay one short word.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get navToday;

  /// Bottom navigation: everything captured and created. One short word.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get navLibrary;

  /// Bottom navigation: the AI tool workspace. Deliberately NOT 'AI' — the user's mental model is getting help understanding something, not operating a model.
  ///
  /// In en, this message translates to:
  /// **'Intelligence'**
  String get navIntelligence;

  /// Bottom navigation: local search. One short word.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navSearch;

  /// The raised centre control. Label and tooltip for the act of adding anything to Action.
  ///
  /// In en, this message translates to:
  /// **'Capture something'**
  String get navCapture;

  /// No description provided for @todayGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get todayGreetingMorning;

  /// No description provided for @todayGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get todayGreetingAfternoon;

  /// No description provided for @todayGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get todayGreetingEvening;

  /// An ICU skeleton passed to DateFormat, not prose. Translators may reorder the fields for their locale but must keep only pattern characters — any letter typed here is a format token, not text.
  ///
  /// In en, this message translates to:
  /// **'EEEE · d MMMM'**
  String get todayDateFormat;

  /// Shown when the local database cannot be read. SAFETY: must not imply the data was lost — it says the data is still stored.
  ///
  /// In en, this message translates to:
  /// **'Your actions couldn\'t be loaded. They are still stored on this device.'**
  String get todayActionsLoadFailed;

  /// No description provided for @todaySectionNeedsAttention.
  ///
  /// In en, this message translates to:
  /// **'Needs attention'**
  String get todaySectionNeedsAttention;

  /// No description provided for @todaySectionAlsoNeedsAttention.
  ///
  /// In en, this message translates to:
  /// **'Also needs attention'**
  String get todaySectionAlsoNeedsAttention;

  /// No description provided for @todaySectionWaitingForReview.
  ///
  /// In en, this message translates to:
  /// **'Waiting for review'**
  String get todaySectionWaitingForReview;

  /// No description provided for @todaySectionComingUp.
  ///
  /// In en, this message translates to:
  /// **'Coming up'**
  String get todaySectionComingUp;

  /// No description provided for @todaySeeAllCaptures.
  ///
  /// In en, this message translates to:
  /// **'See all {count} captures'**
  String todaySeeAllCaptures(int count);

  /// No description provided for @todaySeeAllInLibrary.
  ///
  /// In en, this message translates to:
  /// **'See all in Library'**
  String get todaySeeAllInLibrary;

  /// No description provided for @todayCompletedCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 done} other{{count} done}}'**
  String todayCompletedCount(int count);

  /// No description provided for @todayCompletedSemantics.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 action completed. Open the library.} other{{count} actions completed. Open the library.}}'**
  String todayCompletedSemantics(int count);

  /// An eyebrow label above three capture shortcuts. Rendered as typed — if the language has no uppercase, write it normally.
  ///
  /// In en, this message translates to:
  /// **'START WITH'**
  String get todayStartWith;

  /// No description provided for @todayQuickPhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get todayQuickPhoto;

  /// No description provided for @todayQuickScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Screenshot'**
  String get todayQuickScreenshot;

  /// No description provided for @todayQuickText.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get todayQuickText;

  /// Links to the two tools that need no AI provider. Names the tools rather than saying 'explore', because it is a promise the app keeps with nothing connected.
  ///
  /// In en, this message translates to:
  /// **'Check a link, or find keys in some text'**
  String get todayQuickTools;

  /// No description provided for @briefBadgeNeedsYou.
  ///
  /// In en, this message translates to:
  /// **'NEEDS YOU'**
  String get briefBadgeNeedsYou;

  /// No description provided for @briefBadgeToReview.
  ///
  /// In en, this message translates to:
  /// **'TO REVIEW'**
  String get briefBadgeToReview;

  /// No description provided for @briefBadgeAhead.
  ///
  /// In en, this message translates to:
  /// **'AHEAD'**
  String get briefBadgeAhead;

  /// No description provided for @briefBadgeStartHere.
  ///
  /// In en, this message translates to:
  /// **'START HERE'**
  String get briefBadgeStartHere;

  /// No description provided for @briefBadgeClear.
  ///
  /// In en, this message translates to:
  /// **'CLEAR'**
  String get briefBadgeClear;

  /// Label before the next step of the highlighted Action.
  ///
  /// In en, this message translates to:
  /// **'NEXT'**
  String get briefNext;

  /// No description provided for @briefOpenAction.
  ///
  /// In en, this message translates to:
  /// **'Open {title}'**
  String briefOpenAction(String title);

  /// No description provided for @briefMarkDone.
  ///
  /// In en, this message translates to:
  /// **'Mark \"{title}\" as done'**
  String briefMarkDone(String title);

  /// No description provided for @briefHeadlineNeedsAttention.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 action needs your attention} other{{count} actions need your attention}}'**
  String briefHeadlineNeedsAttention(int count);

  /// No description provided for @briefDetailAlsoWaiting.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 capture is also waiting for review.} other{{count} captures are also waiting for review.}}'**
  String briefDetailAlsoWaiting(int count);

  /// No description provided for @briefHeadlineCapturesWaiting.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 capture is waiting for you} other{{count} captures are waiting for you}}'**
  String briefHeadlineCapturesWaiting(int count);

  /// No description provided for @briefDetailNothingOverdue.
  ///
  /// In en, this message translates to:
  /// **'Nothing is overdue.'**
  String get briefDetailNothingOverdue;

  /// No description provided for @briefHeadlineNothingToday.
  ///
  /// In en, this message translates to:
  /// **'Nothing needs you today'**
  String get briefHeadlineNothingToday;

  /// No description provided for @briefDetailComingUp.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 action is coming up.} other{{count} actions are coming up.}}'**
  String briefDetailComingUp(int count);

  /// No description provided for @briefHeadlineClear.
  ///
  /// In en, this message translates to:
  /// **'You\'re clear'**
  String get briefHeadlineClear;

  /// No description provided for @briefDetailClear.
  ///
  /// In en, this message translates to:
  /// **'Nothing is due and nothing is waiting.'**
  String get briefDetailClear;

  /// First-run headline. SAFETY: must tell the person what to do, never describe the app's own emptiness. 'Nothing here yet' and its equivalents are banned across the product.
  ///
  /// In en, this message translates to:
  /// **'Start with anything'**
  String get briefHeadlineFirstRun;

  /// No description provided for @briefDetailFirstRun.
  ///
  /// In en, this message translates to:
  /// **'A letter, a screenshot, a note — Action works out what it is.'**
  String get briefDetailFirstRun;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSectionPersonalise.
  ///
  /// In en, this message translates to:
  /// **'Personalise'**
  String get settingsSectionPersonalise;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsAppearanceDescription.
  ///
  /// In en, this message translates to:
  /// **'Light, dark, or whatever the device is doing.'**
  String get settingsAppearanceDescription;

  /// No description provided for @settingsLanguageDescription.
  ///
  /// In en, this message translates to:
  /// **'The language Action speaks to you in.'**
  String get settingsLanguageDescription;

  /// No description provided for @appearanceSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get appearanceSystem;

  /// No description provided for @appearanceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get appearanceLight;

  /// No description provided for @appearanceDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get appearanceDark;

  /// No description provided for @appearanceSystemDescription.
  ///
  /// In en, this message translates to:
  /// **'Match the device setting'**
  String get appearanceSystemDescription;

  /// No description provided for @appearanceLightDescription.
  ///
  /// In en, this message translates to:
  /// **'Always light'**
  String get appearanceLightDescription;

  /// No description provided for @appearanceDarkDescription.
  ///
  /// In en, this message translates to:
  /// **'Always dark'**
  String get appearanceDarkDescription;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// SAFETY: the second clause is a data-flow claim and must stay true — the language preference is written to local preferences only.
  ///
  /// In en, this message translates to:
  /// **'Changes apply straight away. Nothing is sent anywhere; the choice is stored on this device.'**
  String get languageSubtitle;

  /// No description provided for @languageSectionChoose.
  ///
  /// In en, this message translates to:
  /// **'Choose a language'**
  String get languageSectionChoose;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @languageSystemDescription.
  ///
  /// In en, this message translates to:
  /// **'Follow the device\'s language'**
  String get languageSystemDescription;

  /// SAFETY: this is the honest disclosure about translation quality. It must not be softened into a claim that the translations are professionally certified, and it must keep the sentence pointing at English as the reference for privacy and security wording.
  ///
  /// In en, this message translates to:
  /// **'English is the language Action\'s wording was written in. The other translations were drafted against a fixed glossary and checked automatically, and have not yet been reviewed by a native speaker. Where the exact wording matters — privacy, security, what Action will and will not claim — English remains the reference.'**
  String get languageDraftNote;

  /// SAFETY: must keep the first sentence — that the product is useful with nothing connected.
  ///
  /// In en, this message translates to:
  /// **'Action works without AI. Connecting your own provider adds document analysis, planning and drafting tools.'**
  String get settingsIntelligenceFootnote;

  /// No description provided for @settingsAiProvider.
  ///
  /// In en, this message translates to:
  /// **'AI provider'**
  String get settingsAiProvider;

  /// No description provided for @settingsAiNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected. Use your own account and API key.'**
  String get settingsAiNotConnected;

  /// No description provided for @settingsAiConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected to {provider}.'**
  String settingsAiConnected(String provider);

  /// No description provided for @settingsSectionPrivacySecurity.
  ///
  /// In en, this message translates to:
  /// **'Privacy & security'**
  String get settingsSectionPrivacySecurity;

  /// No description provided for @settingsSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSecurity;

  /// No description provided for @settingsWhereInfoLives.
  ///
  /// In en, this message translates to:
  /// **'Where your information lives'**
  String get settingsWhereInfoLives;

  /// No description provided for @settingsWhereInfoLivesDescription.
  ///
  /// In en, this message translates to:
  /// **'What stays on this device, and what does not.'**
  String get settingsWhereInfoLivesDescription;

  /// No description provided for @protectionAppLock.
  ///
  /// In en, this message translates to:
  /// **'App Lock'**
  String get protectionAppLock;

  /// No description provided for @protectionScreenPrivacy.
  ///
  /// In en, this message translates to:
  /// **'screen privacy'**
  String get protectionScreenPrivacy;

  /// No description provided for @protectionPrivateReminders.
  ///
  /// In en, this message translates to:
  /// **'private reminders'**
  String get protectionPrivateReminders;

  /// No description provided for @protectionSummaryNone.
  ///
  /// In en, this message translates to:
  /// **'App Lock, screen privacy and what leaves this device.'**
  String get protectionSummaryNone;

  /// No description provided for @protectionSummaryOne.
  ///
  /// In en, this message translates to:
  /// **'{first} is on.'**
  String protectionSummaryOne(String first);

  /// No description provided for @protectionSummaryTwo.
  ///
  /// In en, this message translates to:
  /// **'{first} and {second} are on.'**
  String protectionSummaryTwo(String first, String second);

  /// No description provided for @protectionSummaryThree.
  ///
  /// In en, this message translates to:
  /// **'{first}, {second} and {third} are on.'**
  String protectionSummaryThree(String first, String second, String third);

  /// No description provided for @settingsSectionReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get settingsSectionReminders;

  /// SAFETY: an honest limitation. Must not be reworded into a promise of on-time delivery.
  ///
  /// In en, this message translates to:
  /// **'Android may deliver a reminder a little later than the time you set, depending on battery settings and how the device is being used.'**
  String get settingsRemindersFootnote;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsNotificationsOnDescription.
  ///
  /// In en, this message translates to:
  /// **'Reminders you set can be shown.'**
  String get settingsNotificationsOnDescription;

  /// No description provided for @settingsNotificationsOffDescription.
  ///
  /// In en, this message translates to:
  /// **'Turned off for Action, so reminders will not appear.'**
  String get settingsNotificationsOffDescription;

  /// No description provided for @settingsNotificationsUnknown.
  ///
  /// In en, this message translates to:
  /// **'Could not be checked.'**
  String get settingsNotificationsUnknown;

  /// No description provided for @settingsNotificationsAllowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get settingsNotificationsAllowed;

  /// No description provided for @settingsOpenSystemSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get settingsOpenSystemSettings;

  /// SAFETY: the second sentence is a product guarantee — nothing is saved without the user confirming it. It must survive translation as a statement about the user confirming, not about Action checking.
  ///
  /// In en, this message translates to:
  /// **'Action turns messy information into clear next steps. You confirm everything before it is saved.'**
  String get settingsActionFootnote;

  /// No description provided for @settingsHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsHelp;

  /// No description provided for @settingsHelpDescription.
  ///
  /// In en, this message translates to:
  /// **'How Action works, and what it will not do.'**
  String get settingsHelpDescription;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// An ICU date skeleton, not prose. Day and abbreviated month. Reorder for the locale; every letter is a format token.
  ///
  /// In en, this message translates to:
  /// **'d MMM'**
  String get dateShortFormat;

  /// ICU skeleton: day, abbreviated month, year.
  ///
  /// In en, this message translates to:
  /// **'d MMM yyyy'**
  String get dateLongFormat;

  /// No description provided for @relativeJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get relativeJustNow;

  /// No description provided for @relativeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String relativeMinutes(int count);

  /// No description provided for @relativeHours.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String relativeHours(int count);

  /// No description provided for @relativeYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get relativeYesterday;

  /// No description provided for @relativeDays.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String relativeDays(int count);

  /// No description provided for @libraryTitle.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get libraryTitle;

  /// SAFETY: a data-flow claim about the Library's contents. Captures, Actions and Goals are local; it must not be softened into 'is kept private' or strengthened into a claim about everything in the app.
  ///
  /// In en, this message translates to:
  /// **'Everything Action is holding for you. All of it stays on this device.'**
  String get librarySubtitle;

  /// No description provided for @librarySegmentActions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get librarySegmentActions;

  /// No description provided for @librarySegmentCaptures.
  ///
  /// In en, this message translates to:
  /// **'Captures'**
  String get librarySegmentCaptures;

  /// No description provided for @librarySegmentGoals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get librarySegmentGoals;

  /// No description provided for @librarySegmentDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get librarySegmentDone;

  /// No description provided for @libraryNewGoal.
  ///
  /// In en, this message translates to:
  /// **'New goal'**
  String get libraryNewGoal;

  /// No description provided for @libraryNoGoalsTitle.
  ///
  /// In en, this message translates to:
  /// **'No goals yet'**
  String get libraryNoGoalsTitle;

  /// No description provided for @libraryNoGoalsMessage.
  ///
  /// In en, this message translates to:
  /// **'A goal is something you want to happen. Action can find what is missing, what blocks it, and what to do first.'**
  String get libraryNoGoalsMessage;

  /// No description provided for @libraryNoDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing completed yet'**
  String get libraryNoDoneTitle;

  /// No description provided for @libraryNoDoneMessage.
  ///
  /// In en, this message translates to:
  /// **'Actions you finish will be kept here.'**
  String get libraryNoDoneMessage;

  /// No description provided for @libraryNoOpenTitle.
  ///
  /// In en, this message translates to:
  /// **'No open actions'**
  String get libraryNoOpenTitle;

  /// No description provided for @libraryNoOpenMessage.
  ///
  /// In en, this message translates to:
  /// **'Capture something and Action will work out what needs doing.'**
  String get libraryNoOpenMessage;

  /// No description provided for @libraryNoCapturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing captured yet'**
  String get libraryNoCapturesTitle;

  /// SAFETY: the second sentence is the product's central promise — no analysis happens without an explicit request. It must not become 'nothing is shared' or 'analysis happens automatically'.
  ///
  /// In en, this message translates to:
  /// **'Photos, screenshots and text you add land here first. Nothing is analysed until you ask.'**
  String get libraryNoCapturesMessage;

  /// No description provided for @libraryGoalNoActions.
  ///
  /// In en, this message translates to:
  /// **'Nothing made from it yet'**
  String get libraryGoalNoActions;

  /// No description provided for @libraryGoalActionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 action from this goal} other{{count} actions from this goal}}'**
  String libraryGoalActionCount(int count);

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search actions and captures'**
  String get searchHint;

  /// No description provided for @searchClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get searchClear;

  /// SAFETY: the strongest data-flow claim in the product and literally true — search runs against the local database and no query is logged or sent. Must stay an absolute statement about the query never leaving.
  ///
  /// In en, this message translates to:
  /// **'Searched on this device. Nothing you type here leaves it.'**
  String get searchPrivacyNote;

  /// No description provided for @searchYouCanSearch.
  ///
  /// In en, this message translates to:
  /// **'YOU CAN SEARCH'**
  String get searchYouCanSearch;

  /// No description provided for @searchFieldTitles.
  ///
  /// In en, this message translates to:
  /// **'Titles'**
  String get searchFieldTitles;

  /// No description provided for @searchFieldTitlesExample.
  ///
  /// In en, this message translates to:
  /// **'Renew the car insurance'**
  String get searchFieldTitlesExample;

  /// No description provided for @searchFieldReferences.
  ///
  /// In en, this message translates to:
  /// **'Reference numbers'**
  String get searchFieldReferences;

  /// No description provided for @searchFieldReferencesExample.
  ///
  /// In en, this message translates to:
  /// **'MTR-4471-08'**
  String get searchFieldReferencesExample;

  /// No description provided for @searchFieldOrganisations.
  ///
  /// In en, this message translates to:
  /// **'Organisations'**
  String get searchFieldOrganisations;

  /// No description provided for @searchFieldOrganisationsExample.
  ///
  /// In en, this message translates to:
  /// **'Northgate'**
  String get searchFieldOrganisationsExample;

  /// No description provided for @searchFieldSteps.
  ///
  /// In en, this message translates to:
  /// **'Steps inside an Action'**
  String get searchFieldSteps;

  /// No description provided for @searchFieldStepsExample.
  ///
  /// In en, this message translates to:
  /// **'Upload the form'**
  String get searchFieldStepsExample;

  /// No description provided for @searchFieldCaptureText.
  ///
  /// In en, this message translates to:
  /// **'The text read from a capture'**
  String get searchFieldCaptureText;

  /// No description provided for @searchFieldCaptureTextExample.
  ///
  /// In en, this message translates to:
  /// **'renewal notice'**
  String get searchFieldCaptureTextExample;

  /// No description provided for @searchNoMatchesTitle.
  ///
  /// In en, this message translates to:
  /// **'No matches for \"{query}\"'**
  String searchNoMatchesTitle(String query);

  /// No description provided for @searchNoMatchesTryFewer.
  ///
  /// In en, this message translates to:
  /// **'Try fewer words, or a reference number exactly as it appears.'**
  String get searchNoMatchesTryFewer;

  /// No description provided for @searchNoMatchesClearFilters.
  ///
  /// In en, this message translates to:
  /// **'Try fewer words, or clear the filters.'**
  String get searchNoMatchesClearFilters;

  /// No description provided for @searchFilterActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get searchFilterActive;

  /// No description provided for @searchFilterCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get searchFilterCompleted;

  /// No description provided for @searchFilterOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get searchFilterOverdue;

  /// No description provided for @searchFilterThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get searchFilterThisWeek;

  /// No description provided for @searchFilterCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get searchFilterCritical;

  /// No description provided for @searchFilterCreatedByYou.
  ///
  /// In en, this message translates to:
  /// **'Created by you'**
  String get searchFilterCreatedByYou;

  /// No description provided for @searchFilterArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get searchFilterArchived;

  /// No description provided for @searchFilterClear.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get searchFilterClear;

  /// SAFETY: says the search was incomplete rather than letting an empty result read as 'nothing found'. The distinction must survive.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t search your actions, so these results may be incomplete.'**
  String get searchIncompleteActions;

  /// No description provided for @searchIncompleteCaptures.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t search your captures, so these results may be incomplete.'**
  String get searchIncompleteCaptures;

  /// No description provided for @searchIncompleteBoth.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t search your actions or your captures, so these results may be incomplete.'**
  String get searchIncompleteBoth;

  /// No description provided for @searchMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get searchMatchTitle;

  /// No description provided for @searchMatchNextStep.
  ///
  /// In en, this message translates to:
  /// **'Next step'**
  String get searchMatchNextStep;

  /// No description provided for @searchMatchStep.
  ///
  /// In en, this message translates to:
  /// **'Step'**
  String get searchMatchStep;

  /// No description provided for @searchMatchSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get searchMatchSummary;

  /// No description provided for @searchMatchFromCapture.
  ///
  /// In en, this message translates to:
  /// **'From capture'**
  String get searchMatchFromCapture;

  /// No description provided for @studioSuggested.
  ///
  /// In en, this message translates to:
  /// **'Suggested for your last capture'**
  String get studioSuggested;

  /// No description provided for @studioRecentlyUsed.
  ///
  /// In en, this message translates to:
  /// **'Recently used'**
  String get studioRecentlyUsed;

  /// No description provided for @studioReady.
  ///
  /// In en, this message translates to:
  /// **'READY'**
  String get studioReady;

  /// No description provided for @studioNotConnected.
  ///
  /// In en, this message translates to:
  /// **'NOT CONNECTED'**
  String get studioNotConnected;

  /// No description provided for @studioHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Action Intelligence'**
  String get studioHeroTitle;

  /// No description provided for @studioConnectedBlurb.
  ///
  /// In en, this message translates to:
  /// **'Understand a document, improve a goal, build a plan, draft a reply, or check what you are looking at.'**
  String get studioConnectedBlurb;

  /// SAFETY: the billing sentence is a commercial statement of fact — Action never bills for AI use, the user's own provider does. It must not become vague about who charges.
  ///
  /// In en, this message translates to:
  /// **'{count} tools for understanding documents, planning and writing. Connect your own AI account to use them — you are billed by your provider, never by Action.'**
  String studioDisconnectedBlurb(int count);

  /// No description provided for @studioConnectAi.
  ///
  /// In en, this message translates to:
  /// **'Connect AI'**
  String get studioConnectAi;

  /// No description provided for @studioHowItWorks.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get studioHowItWorks;

  /// SAFETY: 'entirely on this device' is a data-flow claim about the local tools. It is true of exactly the tools counted here.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 of them already works without any of that, entirely on this device.} other{{count} of them already work without any of that, entirely on this device.}}'**
  String studioLocalCount(int count);

  /// No description provided for @studioRunsOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Runs on this device'**
  String get studioRunsOnThisDevice;

  /// No description provided for @studioToolSemantics.
  ///
  /// In en, this message translates to:
  /// **'{title}. {description}'**
  String studioToolSemantics(String title, String description);

  /// No description provided for @studioToolSemanticsLocal.
  ///
  /// In en, this message translates to:
  /// **'{title}. {description} Runs on this device.'**
  String studioToolSemanticsLocal(String title, String description);

  /// No description provided for @categoryUnderstand.
  ///
  /// In en, this message translates to:
  /// **'Understand'**
  String get categoryUnderstand;

  /// No description provided for @categoryUnderstandBlurb.
  ///
  /// In en, this message translates to:
  /// **'Make sense of what you have.'**
  String get categoryUnderstandBlurb;

  /// No description provided for @categoryPlan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get categoryPlan;

  /// No description provided for @categoryPlanBlurb.
  ///
  /// In en, this message translates to:
  /// **'Turn it into something you can do.'**
  String get categoryPlanBlurb;

  /// No description provided for @categoryCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get categoryCreate;

  /// No description provided for @categoryCreateBlurb.
  ///
  /// In en, this message translates to:
  /// **'Write it, improve it, translate it.'**
  String get categoryCreateBlurb;

  /// No description provided for @categoryExtract.
  ///
  /// In en, this message translates to:
  /// **'Extract'**
  String get categoryExtract;

  /// No description provided for @categoryExtractBlurb.
  ///
  /// In en, this message translates to:
  /// **'Pull out the details that matter.'**
  String get categoryExtractBlurb;

  /// No description provided for @categoryVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get categoryVerify;

  /// No description provided for @categoryVerifyBlurb.
  ///
  /// In en, this message translates to:
  /// **'Check what you are looking at.'**
  String get categoryVerifyBlurb;

  /// No description provided for @captureSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Capture something'**
  String get captureSheetTitle;

  /// No description provided for @captureSheetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Hand Action anything you would rather not read through.'**
  String get captureSheetSubtitle;

  /// No description provided for @captureTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get captureTakePhoto;

  /// No description provided for @captureTakePhotoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A letter, bill or notice in front of you'**
  String get captureTakePhotoSubtitle;

  /// No description provided for @captureChooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose an image'**
  String get captureChooseImage;

  /// No description provided for @captureChooseImageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A screenshot or photo already on this device'**
  String get captureChooseImageSubtitle;

  /// No description provided for @capturePasteText.
  ///
  /// In en, this message translates to:
  /// **'Paste text'**
  String get capturePasteText;

  /// No description provided for @capturePasteTextSubtitle.
  ///
  /// In en, this message translates to:
  /// **'An email, message or notice'**
  String get capturePasteTextSubtitle;

  /// No description provided for @captureChoosePdf.
  ///
  /// In en, this message translates to:
  /// **'Choose a PDF'**
  String get captureChoosePdf;

  /// No description provided for @captureChoosePdfSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A statement, letter or form you already have'**
  String get captureChoosePdfSubtitle;

  /// SAFETY: two separate claims — captures are stored locally, and no network analysis happens without an explicit request. Both must survive as absolutes.
  ///
  /// In en, this message translates to:
  /// **'Captures stay on this device. Nothing is analysed online until you ask for it.'**
  String get captureFootnote;

  /// No description provided for @captureCouldNotOpen.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open that. Try another way.'**
  String get captureCouldNotOpen;

  /// No description provided for @captureOptionSemantics.
  ///
  /// In en, this message translates to:
  /// **'{title}. {subtitle}'**
  String captureOptionSemantics(String title, String subtitle);

  /// No description provided for @stageReading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get stageReading;

  /// No description provided for @stageNeedsReview.
  ///
  /// In en, this message translates to:
  /// **'Needs review'**
  String get stageNeedsReview;

  /// No description provided for @stageActionCreated.
  ///
  /// In en, this message translates to:
  /// **'Action created'**
  String get stageActionCreated;

  /// No description provided for @stageNoText.
  ///
  /// In en, this message translates to:
  /// **'No text found'**
  String get stageNoText;

  /// No description provided for @stageCouldNotBeRead.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t be read'**
  String get stageCouldNotBeRead;

  /// No description provided for @stageReadingPreview.
  ///
  /// In en, this message translates to:
  /// **'Reading the text…'**
  String get stageReadingPreview;

  /// No description provided for @stageFailedPreview.
  ///
  /// In en, this message translates to:
  /// **'This couldn\'t be read on this device.'**
  String get stageFailedPreview;

  /// No description provided for @provenancePhoto.
  ///
  /// In en, this message translates to:
  /// **'Captured from photo'**
  String get provenancePhoto;

  /// No description provided for @provenanceImage.
  ///
  /// In en, this message translates to:
  /// **'Captured from image'**
  String get provenanceImage;

  /// No description provided for @provenancePastedText.
  ///
  /// In en, this message translates to:
  /// **'Captured from pasted text'**
  String get provenancePastedText;

  /// No description provided for @provenanceDocument.
  ///
  /// In en, this message translates to:
  /// **'Added as a document'**
  String get provenanceDocument;

  /// No description provided for @sourceCardMeta.
  ///
  /// In en, this message translates to:
  /// **'{provenance} · {when}'**
  String sourceCardMeta(String provenance, String when);

  /// No description provided for @metaDone.
  ///
  /// In en, this message translates to:
  /// **'Done {when}'**
  String metaDone(String when);

  /// No description provided for @metaOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue · was due {date}'**
  String metaOverdue(String date);

  /// No description provided for @metaDueToday.
  ///
  /// In en, this message translates to:
  /// **'Due today'**
  String get metaDueToday;

  /// No description provided for @metaDueOn.
  ///
  /// In en, this message translates to:
  /// **'Due {date}'**
  String metaDueOn(String date);

  /// No description provided for @metaCreatedByYou.
  ///
  /// In en, this message translates to:
  /// **'Created by you'**
  String get metaCreatedByYou;

  /// No description provided for @categoryPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get categoryPayment;

  /// No description provided for @categoryRenewal.
  ///
  /// In en, this message translates to:
  /// **'Renewal'**
  String get categoryRenewal;

  /// No description provided for @categoryAppointment.
  ///
  /// In en, this message translates to:
  /// **'Appointment'**
  String get categoryAppointment;

  /// No description provided for @categoryBooking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get categoryBooking;

  /// No description provided for @categoryTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get categoryTravel;

  /// No description provided for @categoryDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get categoryDeadline;

  /// No description provided for @categoryResponse.
  ///
  /// In en, this message translates to:
  /// **'Reply needed'**
  String get categoryResponse;

  /// No description provided for @categoryDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get categoryDelivery;

  /// No description provided for @categoryDocument.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get categoryDocument;

  /// No description provided for @categoryNoActionRequired.
  ///
  /// In en, this message translates to:
  /// **'No action needed'**
  String get categoryNoActionRequired;

  /// SAFETY: the category Action assigns when it could not tell. Must stay an admission of uncertainty, never a neutral 'other' or 'general'.
  ///
  /// In en, this message translates to:
  /// **'Not sure'**
  String get categoryUnsure;

  /// No description provided for @errorEnterManually.
  ///
  /// In en, this message translates to:
  /// **'Enter it manually'**
  String get errorEnterManually;
}

class _AppL10nDelegate extends LocalizationsDelegate<AppL10n> {
  const _AppL10nDelegate();

  @override
  Future<AppL10n> load(Locale locale) {
    return SynchronousFuture<AppL10n>(lookupAppL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'pl',
    'pt',
    'ru',
    'th',
    'tr',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppL10nDelegate old) => false;
}

AppL10n lookupAppL10n(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppL10nZhHans();
          case 'Hant':
            return AppL10nZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppL10nAr();
    case 'bn':
      return AppL10nBn();
    case 'de':
      return AppL10nDe();
    case 'en':
      return AppL10nEn();
    case 'es':
      return AppL10nEs();
    case 'fr':
      return AppL10nFr();
    case 'hi':
      return AppL10nHi();
    case 'id':
      return AppL10nId();
    case 'it':
      return AppL10nIt();
    case 'ja':
      return AppL10nJa();
    case 'ko':
      return AppL10nKo();
    case 'pl':
      return AppL10nPl();
    case 'pt':
      return AppL10nPt();
    case 'ru':
      return AppL10nRu();
    case 'th':
      return AppL10nTh();
    case 'tr':
      return AppL10nTr();
    case 'ur':
      return AppL10nUr();
    case 'vi':
      return AppL10nVi();
    case 'zh':
      return AppL10nZh();
  }

  throw FlutterError(
    'AppL10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
