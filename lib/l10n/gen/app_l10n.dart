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
