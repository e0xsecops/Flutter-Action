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

  /// No description provided for @ocrScriptTitle.
  ///
  /// In en, this message translates to:
  /// **'Text recognition'**
  String get ocrScriptTitle;

  /// SAFETY: carries two claims that must both survive — which writing system is read, and that reading happens on the device. Never soften the second into 'privately' or 'securely'; the point is the literal fact that no capture leaves the handset to be read.
  ///
  /// In en, this message translates to:
  /// **'The writing system Action reads when it looks at a photo. Recognition happens on this device; no capture is sent anywhere to be read.'**
  String get ocrScriptSubtitle;

  /// No description provided for @ocrScriptSectionChoose.
  ///
  /// In en, this message translates to:
  /// **'Writing system'**
  String get ocrScriptSectionChoose;

  /// No description provided for @ocrScriptFollowLanguage.
  ///
  /// In en, this message translates to:
  /// **'Follow the app language'**
  String get ocrScriptFollowLanguage;

  /// No description provided for @ocrScriptFollowLanguageValue.
  ///
  /// In en, this message translates to:
  /// **'Currently {script}'**
  String ocrScriptFollowLanguageValue(String script);

  /// No description provided for @ocrScriptLatin.
  ///
  /// In en, this message translates to:
  /// **'Latin'**
  String get ocrScriptLatin;

  /// No description provided for @ocrScriptChinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get ocrScriptChinese;

  /// No description provided for @ocrScriptDevanagari.
  ///
  /// In en, this message translates to:
  /// **'Devanagari'**
  String get ocrScriptDevanagari;

  /// No description provided for @ocrScriptJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get ocrScriptJapanese;

  /// No description provided for @ocrScriptKorean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get ocrScriptKorean;

  /// No description provided for @ocrScriptLatinDescription.
  ///
  /// In en, this message translates to:
  /// **'English, Spanish, French, German and the other languages written in Latin letters.'**
  String get ocrScriptLatinDescription;

  /// No description provided for @ocrScriptChineseDescription.
  ///
  /// In en, this message translates to:
  /// **'Simplified and Traditional Chinese.'**
  String get ocrScriptChineseDescription;

  /// SAFETY: names a script, not a country or a region. The second sentence prevents a reader from choosing this for Bengali and getting empty results with no explanation.
  ///
  /// In en, this message translates to:
  /// **'Hindi, Marathi and Nepali. Not Bengali, Tamil or Telugu — each of those is a different writing system.'**
  String get ocrScriptDevanagariDescription;

  /// No description provided for @ocrScriptJapaneseDescription.
  ///
  /// In en, this message translates to:
  /// **'Japanese.'**
  String get ocrScriptJapaneseDescription;

  /// No description provided for @ocrScriptKoreanDescription.
  ///
  /// In en, this message translates to:
  /// **'Korean.'**
  String get ocrScriptKoreanDescription;

  /// SAFETY: two separate claims, both required. The choice is additive, and it is not retroactive. Dropping either leaves the user with a wrong model of what the setting did.
  ///
  /// In en, this message translates to:
  /// **'Every choice except Latin also reads Latin letters, so picking one adds a writing system instead of swapping it. Changing this affects photos taken from now on, not ones already read.'**
  String get ocrScriptFootnote;

  /// SAFETY: a plain statement of a missing capability. It must stay a statement of fact — not 'not yet supported', which implies a date nobody has promised.
  ///
  /// In en, this message translates to:
  /// **'Action cannot read the {language} script'**
  String ocrScriptUnreadableTitle(String language);

  /// SAFETY: three claims that must all survive — no recogniser exists, Latin is still read, and there is a manual way through. Dropping the third leaves the user with a dead end.
  ///
  /// In en, this message translates to:
  /// **'There is no on-device recogniser for it. Photos will still be read for anything written in Latin letters, and the rest will come back empty. You can type or paste that text instead.'**
  String get ocrScriptUnreadableBody;

  /// SAFETY: shown when recognition found nothing. It must name the current setting rather than implying the capture was unreadable in general.
  ///
  /// In en, this message translates to:
  /// **'Action is set to read {script}. If this photo is in another writing system, change it in Settings and read it again.'**
  String ocrScriptNoTextHint(String script);

  /// No description provided for @settingsTextRecognition.
  ///
  /// In en, this message translates to:
  /// **'Text recognition'**
  String get settingsTextRecognition;

  /// No description provided for @settingsTextRecognitionDescription.
  ///
  /// In en, this message translates to:
  /// **'The writing system Action reads from photos.'**
  String get settingsTextRecognitionDescription;

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

  /// No description provided for @sourceWhatWeRead.
  ///
  /// In en, this message translates to:
  /// **'What we read'**
  String get sourceWhatWeRead;

  /// No description provided for @sourceDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete capture'**
  String get sourceDelete;

  /// No description provided for @sourceGone.
  ///
  /// In en, this message translates to:
  /// **'That capture is no longer available.'**
  String get sourceGone;

  /// No description provided for @sourceDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this capture?'**
  String get sourceDeleteTitle;

  /// No description provided for @sourceDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'The image and the text read from it are removed from this device.'**
  String get sourceDeleteBody;

  /// No description provided for @sourceDeleteKeep.
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get sourceDeleteKeep;

  /// No description provided for @sourceOpenAction.
  ///
  /// In en, this message translates to:
  /// **'Open the action'**
  String get sourceOpenAction;

  /// No description provided for @sourceOpenActions.
  ///
  /// In en, this message translates to:
  /// **'Open {count} actions'**
  String sourceOpenActions(int count);

  /// No description provided for @sourceCreateAnother.
  ///
  /// In en, this message translates to:
  /// **'Create another from this'**
  String get sourceCreateAnother;

  /// No description provided for @sourceCreateAction.
  ///
  /// In en, this message translates to:
  /// **'Create an action from this'**
  String get sourceCreateAction;

  /// No description provided for @sourceDoMore.
  ///
  /// In en, this message translates to:
  /// **'Do more with this'**
  String get sourceDoMore;

  /// No description provided for @sourceMeta.
  ///
  /// In en, this message translates to:
  /// **'{provenance} · {when}'**
  String sourceMeta(String provenance, String when);

  /// No description provided for @sourceDimensions.
  ///
  /// In en, this message translates to:
  /// **'{width}×{height}'**
  String sourceDimensions(int width, int height);

  /// No description provided for @sourceKilobytes.
  ///
  /// In en, this message translates to:
  /// **'{size} KB'**
  String sourceKilobytes(int size);

  /// No description provided for @sourceConvertedFrom.
  ///
  /// In en, this message translates to:
  /// **'from {format} {size} KB'**
  String sourceConvertedFrom(String format, String size);

  /// No description provided for @sourceTextFound.
  ///
  /// In en, this message translates to:
  /// **'Text found'**
  String get sourceTextFound;

  /// No description provided for @sourceOcrStats.
  ///
  /// In en, this message translates to:
  /// **'{lines} lines · {ms} ms'**
  String sourceOcrStats(int lines, int ms);

  /// No description provided for @sourceReadExplainer.
  ///
  /// In en, this message translates to:
  /// **'This is the text Action read. What was made from it is below.'**
  String get sourceReadExplainer;

  /// SAFETY: the second clause is the confirm-before-create guarantee. It must stay a statement that the user confirms first.
  ///
  /// In en, this message translates to:
  /// **'Nothing has been interpreted yet. Action will suggest what to do with this, and you confirm before anything is created.'**
  String get sourceNotInterpreted;

  /// SAFETY: names the real limits of on-device OCR, including scripts it cannot read. Must not be softened into a temporary glitch.
  ///
  /// In en, this message translates to:
  /// **'This can happen with handwriting, very low light, or a script this device cannot read yet.'**
  String get sourceNoTextExplainer;

  /// No description provided for @sourceReadFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t read this'**
  String get sourceReadFailed;

  /// No description provided for @sourceReadFailedReason.
  ///
  /// In en, this message translates to:
  /// **'Text recognition did not complete.'**
  String get sourceReadFailedReason;

  /// No description provided for @sourceTryReadingAgain.
  ///
  /// In en, this message translates to:
  /// **'Try reading again'**
  String get sourceTryReadingAgain;

  /// No description provided for @sourceTypeInstead.
  ///
  /// In en, this message translates to:
  /// **'Type the details instead'**
  String get sourceTypeInstead;

  /// No description provided for @sourceTypeWhatItSays.
  ///
  /// In en, this message translates to:
  /// **'Type what it says'**
  String get sourceTypeWhatItSays;

  /// No description provided for @sourceTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Dates, amounts, and what is being asked for.'**
  String get sourceTypeHint;

  /// No description provided for @sourceMadeFromThis.
  ///
  /// In en, this message translates to:
  /// **'Made from this capture'**
  String get sourceMadeFromThis;

  /// No description provided for @sourceMadeFromThisCount.
  ///
  /// In en, this message translates to:
  /// **'{count} made from this capture'**
  String sourceMadeFromThisCount(int count);

  /// No description provided for @sourceTheDocument.
  ///
  /// In en, this message translates to:
  /// **'The document'**
  String get sourceTheDocument;

  /// No description provided for @sourcePageCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page} other{{count} pages}}'**
  String sourcePageCount(int count);

  /// No description provided for @sourcePageCountUnknown.
  ///
  /// In en, this message translates to:
  /// **'Page count unknown'**
  String get sourcePageCountUnknown;

  /// SAFETY: the central data-flow disclosure for PDFs. Two claims: Action has not read the contents, and the file leaves only on an explicit tool run with a warning first. Both must survive.
  ///
  /// In en, this message translates to:
  /// **'Action has not read what is inside this document. When you run a tool that needs to, the file goes to the AI provider you connected and you will be told before it does.'**
  String get sourceDocumentNotRead;

  /// No description provided for @previewSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save that. Try again.'**
  String get previewSaveFailed;

  /// No description provided for @previewTitle.
  ///
  /// In en, this message translates to:
  /// **'Check the capture'**
  String get previewTitle;

  /// No description provided for @previewImageFailed.
  ///
  /// In en, this message translates to:
  /// **'That image couldn\'t be opened.'**
  String get previewImageFailed;

  /// No description provided for @previewHint.
  ///
  /// In en, this message translates to:
  /// **'Make sure the text is readable and nothing important is cut off.'**
  String get previewHint;

  /// No description provided for @previewRetake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get previewRetake;

  /// No description provided for @pasteTitle.
  ///
  /// In en, this message translates to:
  /// **'Paste text'**
  String get pasteTitle;

  /// No description provided for @pasteHint.
  ///
  /// In en, this message translates to:
  /// **'Paste the email, message, or notice you would rather not read through.'**
  String get pasteHint;

  /// No description provided for @pasteFootnote.
  ///
  /// In en, this message translates to:
  /// **'Anything with a date, an amount, or a request works well.'**
  String get pasteFootnote;

  /// No description provided for @pasteEnough.
  ///
  /// In en, this message translates to:
  /// **'Looks like enough to work with.'**
  String get pasteEnough;

  /// No description provided for @pasteMore.
  ///
  /// In en, this message translates to:
  /// **'A little more text will give a better result.'**
  String get pasteMore;

  /// No description provided for @reviewLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load this capture.'**
  String get reviewLoadFailed;

  /// No description provided for @reviewConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get reviewConfirmed;

  /// No description provided for @reviewNeedsReview.
  ///
  /// In en, this message translates to:
  /// **'Needs review'**
  String get reviewNeedsReview;

  /// No description provided for @reviewReview.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewReview;

  /// No description provided for @reviewHighConfidence.
  ///
  /// In en, this message translates to:
  /// **'High confidence'**
  String get reviewHighConfidence;

  /// No description provided for @reviewConfirmedByYou.
  ///
  /// In en, this message translates to:
  /// **'Confirmed by you'**
  String get reviewConfirmedByYou;

  /// No description provided for @reviewMissing.
  ///
  /// In en, this message translates to:
  /// **'Missing'**
  String get reviewMissing;

  /// SAFETY: an admission that extraction failed. Must not become a claim that the source was unreadable or that data was lost.
  ///
  /// In en, this message translates to:
  /// **'Action couldn’t reliably understand enough of this source.'**
  String get reviewNotUnderstood;

  /// No description provided for @reviewNotUnderstoodBody.
  ///
  /// In en, this message translates to:
  /// **'The capture is safe and nothing was lost. You can enter the details yourself, and the source stays attached for reference.'**
  String get reviewNotUnderstoodBody;

  /// No description provided for @reviewEnterDetails.
  ///
  /// In en, this message translates to:
  /// **'Enter the details'**
  String get reviewEnterDetails;

  /// No description provided for @reviewKeepSource.
  ///
  /// In en, this message translates to:
  /// **'Keep the source for later'**
  String get reviewKeepSource;

  /// Debug-build diagnostic line.
  ///
  /// In en, this message translates to:
  /// **'Engine: {engine}'**
  String reviewEngine(String engine);

  /// SAFETY: states that a manual entry involves no extraction at all. Must not imply Action contributed anything.
  ///
  /// In en, this message translates to:
  /// **'You are creating this action yourself. Only what you enter here will be used.'**
  String get reviewManualNotice;

  /// No description provided for @reviewUntitled.
  ///
  /// In en, this message translates to:
  /// **'Untitled action'**
  String get reviewUntitled;

  /// No description provided for @reviewEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit title'**
  String get reviewEditTitle;

  /// No description provided for @reviewNeedsReviewCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 value needs your review before this can be confirmed.} other{{count} values need your review.}}'**
  String reviewNeedsReviewCount(int count);

  /// No description provided for @reviewKeyFacts.
  ///
  /// In en, this message translates to:
  /// **'Key facts'**
  String get reviewKeyFacts;

  /// No description provided for @reviewNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get reviewNotFound;

  /// No description provided for @reviewSuggestedNextStep.
  ///
  /// In en, this message translates to:
  /// **'Suggested next step'**
  String get reviewSuggestedNextStep;

  /// No description provided for @reviewWhyThisMatters.
  ///
  /// In en, this message translates to:
  /// **'Why this matters'**
  String get reviewWhyThisMatters;

  /// No description provided for @reviewSteps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get reviewSteps;

  /// No description provided for @reviewAddStep.
  ///
  /// In en, this message translates to:
  /// **'Add a step'**
  String get reviewAddStep;

  /// SAFETY: the prompt-injection disclosure. Must stay a statement that instructions embedded in a document were ignored, never that they were followed or sanitised.
  ///
  /// In en, this message translates to:
  /// **'Some text in this source looked like instructions rather than document facts, so Action ignored it.'**
  String get reviewInjectionNotice;

  /// No description provided for @reviewLayoutNotice.
  ///
  /// In en, this message translates to:
  /// **'This document’s layout may contain relationships that text extraction couldn’t fully preserve. Check the values below against the source before confirming.'**
  String get reviewLayoutNotice;

  /// No description provided for @reviewSignalNotice.
  ///
  /// In en, this message translates to:
  /// **'{reason} Check the values below against the source.'**
  String reviewSignalNotice(String reason);

  /// No description provided for @reviewDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get reviewDeadline;

  /// No description provided for @reviewAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get reviewAmount;

  /// No description provided for @reviewLeftUnset.
  ///
  /// In en, this message translates to:
  /// **'None — you chose to leave this unset'**
  String get reviewLeftUnset;

  /// No description provided for @reviewUnclear.
  ///
  /// In en, this message translates to:
  /// **'Unclear'**
  String get reviewUnclear;

  /// No description provided for @reviewNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get reviewNotSet;

  /// No description provided for @reviewNoDeadlineFound.
  ///
  /// In en, this message translates to:
  /// **'None found in this document'**
  String get reviewNoDeadlineFound;

  /// No description provided for @reviewNoAmountFound.
  ///
  /// In en, this message translates to:
  /// **'None found in this document'**
  String get reviewNoAmountFound;

  /// No description provided for @reviewMultipleDates.
  ///
  /// In en, this message translates to:
  /// **'Action found multiple possible dates.'**
  String get reviewMultipleDates;

  /// No description provided for @reviewMultipleDatesBody.
  ///
  /// In en, this message translates to:
  /// **'{count} dates could be the deadline. Choose the right one, enter another, or leave it unset.'**
  String reviewMultipleDatesBody(int count);

  /// No description provided for @reviewChooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose a date'**
  String get reviewChooseDate;

  /// No description provided for @reviewMultipleAmounts.
  ///
  /// In en, this message translates to:
  /// **'Action found more than one possible amount.'**
  String get reviewMultipleAmounts;

  /// No description provided for @reviewMultipleAmountsBody.
  ///
  /// In en, this message translates to:
  /// **'{count} amounts could be the one this action is about. Choose, enter another, or leave it unset.'**
  String reviewMultipleAmountsBody(int count);

  /// No description provided for @reviewChooseAmount.
  ///
  /// In en, this message translates to:
  /// **'Choose an amount'**
  String get reviewChooseAmount;

  /// No description provided for @reviewSkipStep.
  ///
  /// In en, this message translates to:
  /// **'Skip this step'**
  String get reviewSkipStep;

  /// No description provided for @reviewKeepStep.
  ///
  /// In en, this message translates to:
  /// **'Keep this step'**
  String get reviewKeepStep;

  /// No description provided for @reviewEditStep.
  ///
  /// In en, this message translates to:
  /// **'Edit step'**
  String get reviewEditStep;

  /// No description provided for @reviewCreateManually.
  ///
  /// In en, this message translates to:
  /// **'Create manually'**
  String get reviewCreateManually;

  /// No description provided for @reviewConfirmAndCreate.
  ///
  /// In en, this message translates to:
  /// **'Confirm & create action'**
  String get reviewConfirmAndCreate;

  /// No description provided for @reviewFixHighlighted.
  ///
  /// In en, this message translates to:
  /// **'Review highlighted fields'**
  String get reviewFixHighlighted;

  /// No description provided for @reviewSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get reviewSaving;

  /// No description provided for @reviewSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save this action. Nothing was lost — try again.'**
  String get reviewSaveFailed;

  /// No description provided for @reviewFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get reviewFieldTitle;

  /// No description provided for @reviewTitleHint.
  ///
  /// In en, this message translates to:
  /// **'What needs to happen?'**
  String get reviewTitleHint;

  /// No description provided for @reviewNewStep.
  ///
  /// In en, this message translates to:
  /// **'New step'**
  String get reviewNewStep;

  /// No description provided for @reviewStepHint.
  ///
  /// In en, this message translates to:
  /// **'What to do'**
  String get reviewStepHint;

  /// No description provided for @reviewDatesConflict.
  ///
  /// In en, this message translates to:
  /// **'The document mentions more than one date.'**
  String get reviewDatesConflict;

  /// No description provided for @reviewAmountsConflict.
  ///
  /// In en, this message translates to:
  /// **'The document mentions more than one amount.'**
  String get reviewAmountsConflict;

  /// The example date is the ISO format the field parses; keep the digits and the dashes exactly.
  ///
  /// In en, this message translates to:
  /// **'Another date — 2026-08-30'**
  String get reviewAnotherDate;

  /// No description provided for @reviewBadDate.
  ///
  /// In en, this message translates to:
  /// **'Not a real date. Use the format 2026-08-30.'**
  String get reviewBadDate;

  /// No description provided for @reviewTypeDate.
  ///
  /// In en, this message translates to:
  /// **'Type a date, or leave it unset below.'**
  String get reviewTypeDate;

  /// No description provided for @reviewUseThisDate.
  ///
  /// In en, this message translates to:
  /// **'Use this date'**
  String get reviewUseThisDate;

  /// No description provided for @reviewLeaveNoDeadline.
  ///
  /// In en, this message translates to:
  /// **'Leave without a deadline'**
  String get reviewLeaveNoDeadline;

  /// No description provided for @reviewAnotherAmount.
  ///
  /// In en, this message translates to:
  /// **'Another amount — 780.00'**
  String get reviewAnotherAmount;

  /// No description provided for @reviewAmountError.
  ///
  /// In en, this message translates to:
  /// **'Cannot use this amount: {reason}.'**
  String reviewAmountError(String reason);

  /// No description provided for @reviewUseThisAmount.
  ///
  /// In en, this message translates to:
  /// **'Use this amount'**
  String get reviewUseThisAmount;

  /// No description provided for @reviewLeaveNoAmount.
  ///
  /// In en, this message translates to:
  /// **'Leave without an amount'**
  String get reviewLeaveNoAmount;

  /// No description provided for @reviewThisValue.
  ///
  /// In en, this message translates to:
  /// **'This value'**
  String get reviewThisValue;

  /// No description provided for @reviewQuote.
  ///
  /// In en, this message translates to:
  /// **'“{quote}”'**
  String reviewQuote(String quote);

  /// No description provided for @reviewSeeOnCapture.
  ///
  /// In en, this message translates to:
  /// **'See it on the capture'**
  String get reviewSeeOnCapture;

  /// No description provided for @reviewViewSource.
  ///
  /// In en, this message translates to:
  /// **'View source'**
  String get reviewViewSource;

  /// No description provided for @reviewFromSource.
  ///
  /// In en, this message translates to:
  /// **'From source'**
  String get reviewFromSource;

  /// No description provided for @reviewNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Not verified'**
  String get reviewNotVerified;

  /// SAFETY: says verification failed. Must never be softened into 'probably correct'.
  ///
  /// In en, this message translates to:
  /// **'Could not verify this against the source.'**
  String get reviewCouldNotVerify;

  /// No description provided for @reviewLooksRight.
  ///
  /// In en, this message translates to:
  /// **'Looks right'**
  String get reviewLooksRight;

  /// No description provided for @reviewStageReading.
  ///
  /// In en, this message translates to:
  /// **'Reading source'**
  String get reviewStageReading;

  /// No description provided for @reviewStageUnderstanding.
  ///
  /// In en, this message translates to:
  /// **'Understanding important details'**
  String get reviewStageUnderstanding;

  /// No description provided for @reviewStageChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking what needs review'**
  String get reviewStageChecking;

  /// No description provided for @reviewNothingToDo.
  ///
  /// In en, this message translates to:
  /// **'Nothing you need to do right now.'**
  String get reviewNothingToDo;

  /// No description provided for @reviewInformationOnly.
  ///
  /// In en, this message translates to:
  /// **'This looks like information only — no deadline, payment or reply was found.'**
  String get reviewInformationOnly;

  /// No description provided for @reviewInformationOnlyWithSource.
  ///
  /// In en, this message translates to:
  /// **'This looks like information only — no deadline, payment or reply was found in this capture.'**
  String get reviewInformationOnlyWithSource;

  /// No description provided for @reviewSourceKept.
  ///
  /// In en, this message translates to:
  /// **'The source is kept either way.'**
  String get reviewSourceKept;

  /// No description provided for @reviewAddAnyway.
  ///
  /// In en, this message translates to:
  /// **'Add an action anyway'**
  String get reviewAddAnyway;

  /// No description provided for @reviewActionConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Action confirmed'**
  String get reviewActionConfirmed;

  /// No description provided for @reviewCreatedByYou.
  ///
  /// In en, this message translates to:
  /// **'Created by you.'**
  String get reviewCreatedByYou;

  /// SAFETY: attributes the confirmation to the user, not to Action.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Confirmed by you from 1 reviewed fact.} other{Confirmed by you from {count} reviewed facts.}}'**
  String reviewConfirmedFrom(int count);

  /// No description provided for @reviewConfirmedFromEdited.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Confirmed by you from 1 reviewed fact. You changed {edited} of them.} other{Confirmed by you from {count} reviewed facts. You changed {edited} of them.}}'**
  String reviewConfirmedFromEdited(int count, int edited);

  /// No description provided for @reviewSavedOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Saved on this device.'**
  String get reviewSavedOnDevice;

  /// SAFETY: keeps the reassurance that matters - the failure is in loading, not in storing. Dropping the second clause turns a display problem into apparent data loss.
  ///
  /// In en, this message translates to:
  /// **'This action could not be loaded. It is still stored on this device.'**
  String get detailLoadFailed;

  /// No description provided for @detailNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'That action is no longer here'**
  String get detailNotFoundTitle;

  /// No description provided for @detailNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'It may have been deleted on this device.'**
  String get detailNotFoundMessage;

  /// No description provided for @detailGoBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get detailGoBack;

  /// No description provided for @detailMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get detailMore;

  /// No description provided for @detailChangeUrgency.
  ///
  /// In en, this message translates to:
  /// **'Change urgency'**
  String get detailChangeUrgency;

  /// No description provided for @detailAddRecommendedStep.
  ///
  /// In en, this message translates to:
  /// **'Add a recommended step'**
  String get detailAddRecommendedStep;

  /// No description provided for @detailEditRecommendedStep.
  ///
  /// In en, this message translates to:
  /// **'Edit recommended step'**
  String get detailEditRecommendedStep;

  /// No description provided for @detailArchiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Archive this action?'**
  String get detailArchiveTitle;

  /// SAFETY: two claims that must both survive - the action is not deleted, and the capture is kept. This is the sentence someone reads before deciding, and half of it is worse than none of it.
  ///
  /// In en, this message translates to:
  /// **'It leaves your list but is not deleted, and the capture it came from is kept.'**
  String get detailArchiveBody;

  /// No description provided for @detailArchiveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get detailArchiveConfirm;

  /// No description provided for @detailArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get detailArchived;

  /// No description provided for @detailCompletedOn.
  ///
  /// In en, this message translates to:
  /// **'Completed {date}'**
  String detailCompletedOn(String date);

  /// No description provided for @detailSectionDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detailSectionDetails;

  /// No description provided for @detailSectionReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get detailSectionReminders;

  /// No description provided for @detailAllStepsDone.
  ///
  /// In en, this message translates to:
  /// **'All steps done'**
  String get detailAllStepsDone;

  /// No description provided for @detailNextEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get detailNextEyebrow;

  /// No description provided for @detailCompleteQuestion.
  ///
  /// In en, this message translates to:
  /// **'Complete this action?'**
  String get detailCompleteQuestion;

  /// No description provided for @detailMarkStepDone.
  ///
  /// In en, this message translates to:
  /// **'Mark step done'**
  String get detailMarkStepDone;

  /// No description provided for @detailCompleteAction.
  ///
  /// In en, this message translates to:
  /// **'Complete this action'**
  String get detailCompleteAction;

  /// No description provided for @detailAddDeadline.
  ///
  /// In en, this message translates to:
  /// **'Add a deadline'**
  String get detailAddDeadline;

  /// No description provided for @detailAddAmount.
  ///
  /// In en, this message translates to:
  /// **'Add an amount'**
  String get detailAddAmount;

  /// No description provided for @detailStepsProgress.
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} done'**
  String detailStepsProgress(int completed, int total);

  /// No description provided for @detailNoStepsTitle.
  ///
  /// In en, this message translates to:
  /// **'No steps yet'**
  String get detailNoStepsTitle;

  /// No description provided for @detailNoStepsMessage.
  ///
  /// In en, this message translates to:
  /// **'Break this into the moves you actually have to make.'**
  String get detailNoStepsMessage;

  /// No description provided for @detailAddFirstStep.
  ///
  /// In en, this message translates to:
  /// **'Add first step'**
  String get detailAddFirstStep;

  /// No description provided for @detailStepCompletedSemantics.
  ///
  /// In en, this message translates to:
  /// **'Completed step: {title}'**
  String detailStepCompletedSemantics(String title);

  /// No description provided for @detailStepNextSemantics.
  ///
  /// In en, this message translates to:
  /// **'Next step: {title}'**
  String detailStepNextSemantics(String title);

  /// No description provided for @detailStepSemantics.
  ///
  /// In en, this message translates to:
  /// **'Step: {title}'**
  String detailStepSemantics(String title);

  /// No description provided for @detailMarkDone.
  ///
  /// In en, this message translates to:
  /// **'Mark \"{title}\" as done'**
  String detailMarkDone(String title);

  /// No description provided for @detailMarkNotDone.
  ///
  /// In en, this message translates to:
  /// **'Mark \"{title}\" as not done'**
  String detailMarkNotDone(String title);

  /// No description provided for @detailStepOptions.
  ///
  /// In en, this message translates to:
  /// **'Step options'**
  String get detailStepOptions;

  /// No description provided for @detailMoveUp.
  ///
  /// In en, this message translates to:
  /// **'Move up'**
  String get detailMoveUp;

  /// No description provided for @detailMoveDown.
  ///
  /// In en, this message translates to:
  /// **'Move down'**
  String get detailMoveDown;

  /// No description provided for @detailDeleteStep.
  ///
  /// In en, this message translates to:
  /// **'Delete step'**
  String get detailDeleteStep;

  /// An intl date pattern, not prose. Pattern letters (d, M, y) are syntax; only their arrangement and any literal separators should change.
  ///
  /// In en, this message translates to:
  /// **'d MMM'**
  String get detailDateFormat;

  /// An intl date pattern, not prose. See detailDateFormat.
  ///
  /// In en, this message translates to:
  /// **'d MMM yyyy'**
  String get detailDateFormatWithYear;

  /// No description provided for @stepDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this step?'**
  String get stepDeleteTitle;

  /// No description provided for @stepDeleteKeep.
  ///
  /// In en, this message translates to:
  /// **'Keep it'**
  String get stepDeleteKeep;

  /// No description provided for @detailNoRemindersYet.
  ///
  /// In en, this message translates to:
  /// **'No reminders yet.'**
  String get detailNoRemindersYet;

  /// No description provided for @detailReminderLimit.
  ///
  /// In en, this message translates to:
  /// **'That is the most reminders one action can have. Remove one to add another.'**
  String get detailReminderLimit;

  /// No description provided for @detailAddReminder.
  ///
  /// In en, this message translates to:
  /// **'Add reminder'**
  String get detailAddReminder;

  /// No description provided for @detailChangeReminder.
  ///
  /// In en, this message translates to:
  /// **'Change reminder'**
  String get detailChangeReminder;

  /// No description provided for @detailRemoveReminder.
  ///
  /// In en, this message translates to:
  /// **'Remove reminder'**
  String get detailRemoveReminder;

  /// An intl date pattern, not prose. See detailDateFormat.
  ///
  /// In en, this message translates to:
  /// **'EEE d MMM, h:mm a'**
  String get detailReminderFormat;

  /// No description provided for @reminderStatePending.
  ///
  /// In en, this message translates to:
  /// **'Not set up yet'**
  String get reminderStatePending;

  /// SAFETY: the reminder exists and will not fire. Both halves are required; 'saved' alone reads as working.
  ///
  /// In en, this message translates to:
  /// **'Saved, but notifications are off'**
  String get reminderStateNotificationsOff;

  /// No description provided for @reminderStateFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t be scheduled'**
  String get reminderStateFailed;

  /// No description provided for @reminderStateRemoving.
  ///
  /// In en, this message translates to:
  /// **'Removing…'**
  String get reminderStateRemoving;

  /// No description provided for @reminderSetConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Reminder set. We\'ll nudge you.'**
  String get reminderSetConfirmation;

  /// No description provided for @reminderUpdatedConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Reminder updated.'**
  String get reminderUpdatedConfirmation;

  /// SAFETY: saved and will-alert are different promises. The sentence must keep both - that it was stored, and that it cannot notify.
  ///
  /// In en, this message translates to:
  /// **'Notifications are off, so this reminder is saved but cannot alert you yet.'**
  String get reminderNeedsPermission;

  /// SAFETY: same rule as reminderNeedsPermission: stored is not the same as working, and the user is owed both facts.
  ///
  /// In en, this message translates to:
  /// **'This reminder is saved, but Android wouldn\'t schedule it.'**
  String get reminderScheduleFailed;

  /// No description provided for @reminderLimitReached.
  ///
  /// In en, this message translates to:
  /// **'That action already has the maximum number of reminders.'**
  String get reminderLimitReached;

  /// No description provided for @reminderTimeInPast.
  ///
  /// In en, this message translates to:
  /// **'That time has already passed.'**
  String get reminderTimeInPast;

  /// No description provided for @reminderAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add a reminder'**
  String get reminderAddTitle;

  /// No description provided for @reminderChangeTitle.
  ///
  /// In en, this message translates to:
  /// **'Change this reminder'**
  String get reminderChangeTitle;

  /// No description provided for @reminderDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get reminderDateLabel;

  /// No description provided for @reminderTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get reminderTimeLabel;

  /// An intl date pattern, not prose. See detailDateFormat.
  ///
  /// In en, this message translates to:
  /// **'EEE d MMM yyyy'**
  String get reminderFieldDateFormat;

  /// An intl time pattern, not prose. A locale that uses a 24-hour clock should say HH:mm and drop the a.
  ///
  /// In en, this message translates to:
  /// **'h:mm a'**
  String get reminderFieldTimeFormat;

  /// An intl date pattern, not prose. See detailDateFormat.
  ///
  /// In en, this message translates to:
  /// **'EEEE d MMMM'**
  String get reminderSummaryDateFormat;

  /// An intl date pattern, not prose. See detailDateFormat.
  ///
  /// In en, this message translates to:
  /// **'d MMM, h:mm a'**
  String get reminderPresetFormat;

  /// SAFETY: the whole promise, spelled out before anything is created. The date and the time must both remain, because a relative phrase alone hides which hour was chosen.
  ///
  /// In en, this message translates to:
  /// **'You will be reminded on {date} at {time}.'**
  String reminderSummary(String date, String time);

  /// No description provided for @reminderTimePastError.
  ///
  /// In en, this message translates to:
  /// **'That time has already passed. Choose a later one.'**
  String get reminderTimePastError;

  /// No description provided for @reminderSet.
  ///
  /// In en, this message translates to:
  /// **'Set reminder'**
  String get reminderSet;

  /// No description provided for @reminderPresetInHour.
  ///
  /// In en, this message translates to:
  /// **'In 1 hour'**
  String get reminderPresetInHour;

  /// No description provided for @reminderPresetTomorrowMorning.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow morning'**
  String get reminderPresetTomorrowMorning;

  /// No description provided for @reminderPresetNextWeek.
  ///
  /// In en, this message translates to:
  /// **'Next week'**
  String get reminderPresetNextWeek;

  /// No description provided for @reminderPresetOnTheDay.
  ///
  /// In en, this message translates to:
  /// **'On the day'**
  String get reminderPresetOnTheDay;

  /// No description provided for @reminderPresetDayBefore.
  ///
  /// In en, this message translates to:
  /// **'1 day before'**
  String get reminderPresetDayBefore;

  /// No description provided for @reminderPresetWeekBefore.
  ///
  /// In en, this message translates to:
  /// **'1 week before'**
  String get reminderPresetWeekBefore;

  /// No description provided for @reminderPresetAtDeadline.
  ///
  /// In en, this message translates to:
  /// **'At the deadline'**
  String get reminderPresetAtDeadline;

  /// No description provided for @reminderPresetHourBefore.
  ///
  /// In en, this message translates to:
  /// **'1 hour before'**
  String get reminderPresetHourBefore;

  /// No description provided for @editNextStepTitle.
  ///
  /// In en, this message translates to:
  /// **'Recommended next step'**
  String get editNextStepTitle;

  /// No description provided for @editNextStepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A short sentence about the next useful move.'**
  String get editNextStepSubtitle;

  /// No description provided for @editNextStepHint.
  ///
  /// In en, this message translates to:
  /// **'What is the next useful move?'**
  String get editNextStepHint;

  /// No description provided for @editRemoveSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Remove the suggestion'**
  String get editRemoveSuggestion;

  /// No description provided for @editUrgencyTitle.
  ///
  /// In en, this message translates to:
  /// **'How urgent is this?'**
  String get editUrgencyTitle;

  /// No description provided for @editStepHint.
  ///
  /// In en, this message translates to:
  /// **'One concrete thing to do'**
  String get editStepHint;

  /// No description provided for @editAddStep.
  ///
  /// In en, this message translates to:
  /// **'Add step'**
  String get editAddStep;

  /// The shape of the date the field accepts, shown as a hint. The letters stand for year, month and day and should be the letters a reader of this language would expect.
  ///
  /// In en, this message translates to:
  /// **'YYYY-MM-DD'**
  String get editDateHint;

  /// No description provided for @editRemoveDeadline.
  ///
  /// In en, this message translates to:
  /// **'Remove the deadline'**
  String get editRemoveDeadline;

  /// An example amount shown as a hint. Use the decimal separator this locale actually writes.
  ///
  /// In en, this message translates to:
  /// **'96.40'**
  String get editAmountHint;

  /// No description provided for @editSaveAmount.
  ///
  /// In en, this message translates to:
  /// **'Save amount'**
  String get editSaveAmount;

  /// No description provided for @editRemoveAmount.
  ///
  /// In en, this message translates to:
  /// **'Remove the amount'**
  String get editRemoveAmount;

  /// No description provided for @securityTitle.
  ///
  /// In en, this message translates to:
  /// **'Security & privacy'**
  String get securityTitle;

  /// No description provided for @securitySectionProtection.
  ///
  /// In en, this message translates to:
  /// **'Protection'**
  String get securitySectionProtection;

  /// SAFETY: says why the control is unavailable and how to make it available. Both halves are needed; without the second the user is told no and left with nowhere to go.
  ///
  /// In en, this message translates to:
  /// **'App Lock needs a screen lock on this device. Set a PIN, pattern, password or fingerprint in your device settings first.'**
  String get securityAppLockUnavailable;

  /// SAFETY: states who does the confirming. Action never sees a biometric, and the sentence must not drift into implying that it does.
  ///
  /// In en, this message translates to:
  /// **'Action asks your device to confirm it is you.'**
  String get securityAppLockOn;

  /// No description provided for @securityAppLockOff.
  ///
  /// In en, this message translates to:
  /// **'Require your fingerprint, face or device PIN to open Action.'**
  String get securityAppLockOff;

  /// No description provided for @securityAskAgain.
  ///
  /// In en, this message translates to:
  /// **'Ask again'**
  String get securityAskAgain;

  /// No description provided for @securityAskAgainDescription.
  ///
  /// In en, this message translates to:
  /// **'How long Action may be in the background before it locks.'**
  String get securityAskAgainDescription;

  /// No description provided for @securityScreenPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Screen privacy'**
  String get securityScreenPrivacy;

  /// SAFETY: the verb is 'ask'. Android may refuse, and the copy must not promise a block this app cannot enforce.
  ///
  /// In en, this message translates to:
  /// **'Ask Android to block screenshots and screen recording, and to hide Action in the app switcher.'**
  String get securityScreenPrivacyDescription;

  /// No description provided for @securityPrivateReminders.
  ///
  /// In en, this message translates to:
  /// **'Private reminders'**
  String get securityPrivateReminders;

  /// No description provided for @securityPrivateRemindersOn.
  ///
  /// In en, this message translates to:
  /// **'Reminders say only that something needs you.'**
  String get securityPrivateRemindersOn;

  /// No description provided for @securityPrivateRemindersOff.
  ///
  /// In en, this message translates to:
  /// **'Reminders show the Action title. Turn this on to keep it off your lock screen.'**
  String get securityPrivateRemindersOff;

  /// No description provided for @securityLockNow.
  ///
  /// In en, this message translates to:
  /// **'Lock now'**
  String get securityLockNow;

  /// No description provided for @securityLockNowDescription.
  ///
  /// In en, this message translates to:
  /// **'Close the door without waiting.'**
  String get securityLockNowDescription;

  /// No description provided for @securitySectionStorage.
  ///
  /// In en, this message translates to:
  /// **'How your data is stored'**
  String get securitySectionStorage;

  /// No description provided for @securityStorageDataLabel.
  ///
  /// In en, this message translates to:
  /// **'Your Actions, captures and settings'**
  String get securityStorageDataLabel;

  /// SAFETY: three claims, and the third is the one that must never be dropped: Action adds no encryption of its own. Losing it turns an honest description into a claim of an encrypted vault that does not exist.
  ///
  /// In en, this message translates to:
  /// **'They sit in this app\'s own private storage, which other apps cannot read and which Android encrypts as part of the device\'s encryption. Action does not add a second layer of its own on top.'**
  String get securityStorageDataDetail;

  /// No description provided for @securityStorageKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'Your AI provider key'**
  String get securityStorageKeyLabel;

  /// SAFETY: names the mechanism rather than calling the key safe. Keep both facts: where it is held, and that it is never displayed again.
  ///
  /// In en, this message translates to:
  /// **'Held in the Android Keystore rather than with everything else, and never shown again after you save it.'**
  String get securityStorageKeyDetail;

  /// No description provided for @securityStorageGapLabel.
  ///
  /// In en, this message translates to:
  /// **'What that does not cover'**
  String get securityStorageGapLabel;

  /// SAFETY: the limits of the protection, stated plainly. All three parts are required - the unlocked device, the rooted system, and which control addresses which. This paragraph exists so the page cannot be read as a promise.
  ///
  /// In en, this message translates to:
  /// **'None of it is a defence against someone using your unlocked device, and a modified or rooted system can read more than a normal one. App Lock is the control that helps with the first of those.'**
  String get securityStorageGapDetail;

  /// No description provided for @securitySectionInformation.
  ///
  /// In en, this message translates to:
  /// **'Your information'**
  String get securitySectionInformation;

  /// No description provided for @securityWhereInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'Every route your data can take, and the two that leave this device.'**
  String get securityWhereInfoDescription;

  /// No description provided for @securityAppLockRefused.
  ///
  /// In en, this message translates to:
  /// **'Not confirmed, so nothing changed.'**
  String get securityAppLockRefused;

  /// SAFETY: same rule as securityAppLockUnavailable: the refusal and the remedy travel together.
  ///
  /// In en, this message translates to:
  /// **'This device has no screen lock set up. Add a PIN, pattern, password or fingerprint in your device settings, then try again.'**
  String get securityAppLockUnavailableToast;

  /// SAFETY: the switch stays off when the platform refuses. Both halves are required - that the device declined, and that the app did not pretend otherwise.
  ///
  /// In en, this message translates to:
  /// **'This device would not apply screen privacy, so it has been left off rather than shown as on.'**
  String get securityScreenPrivacyRefused;

  /// No description provided for @securityRemindersUpdatedQuiet.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 scheduled reminder updated to say less.} other{{count} scheduled reminders updated to say less.}}'**
  String securityRemindersUpdatedQuiet(int count);

  /// No description provided for @securityRemindersUpdated.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 scheduled reminder updated.} other{{count} scheduled reminders updated.}}'**
  String securityRemindersUpdated(int count);

  /// No description provided for @appLockDelayImmediately.
  ///
  /// In en, this message translates to:
  /// **'Immediately'**
  String get appLockDelayImmediately;

  /// No description provided for @appLockDelayOneMinute.
  ///
  /// In en, this message translates to:
  /// **'After 1 minute'**
  String get appLockDelayOneMinute;

  /// No description provided for @appLockDelayFiveMinutes.
  ///
  /// In en, this message translates to:
  /// **'After 5 minutes'**
  String get appLockDelayFiveMinutes;

  /// No description provided for @securityDelayImmediatelyDescription.
  ///
  /// In en, this message translates to:
  /// **'Every time Action leaves the screen'**
  String get securityDelayImmediatelyDescription;

  /// No description provided for @securityDelayOneMinuteDescription.
  ///
  /// In en, this message translates to:
  /// **'Long enough to answer a message'**
  String get securityDelayOneMinuteDescription;

  /// No description provided for @securityDelayFiveMinutesDescription.
  ///
  /// In en, this message translates to:
  /// **'Long enough to take a call'**
  String get securityDelayFiveMinutesDescription;

  /// No description provided for @securityHeroProtected.
  ///
  /// In en, this message translates to:
  /// **'Protected'**
  String get securityHeroProtected;

  /// No description provided for @securityHeroNothingOn.
  ///
  /// In en, this message translates to:
  /// **'Nothing turned on'**
  String get securityHeroNothingOn;

  /// SAFETY: two claims: nothing is sent, and nothing can be changed remotely. Both are properties of the code and both must survive.
  ///
  /// In en, this message translates to:
  /// **'Everything here works on this device. None of these settings is sent anywhere, and none of them can be changed remotely.'**
  String get securityHeroFootnote;

  /// No description provided for @securityHeadlineNone.
  ///
  /// In en, this message translates to:
  /// **'Three protections are available'**
  String get securityHeadlineNone;

  /// No description provided for @securityHeadlineOne.
  ///
  /// In en, this message translates to:
  /// **'{first} is on'**
  String securityHeadlineOne(String first);

  /// No description provided for @securityHeadlineTwo.
  ///
  /// In en, this message translates to:
  /// **'{first} and {second} are on'**
  String securityHeadlineTwo(String first, String second);

  /// No description provided for @securityHeadlineAll.
  ///
  /// In en, this message translates to:
  /// **'All three protections are on'**
  String get securityHeadlineAll;

  /// No description provided for @securityTransfersTitle.
  ///
  /// In en, this message translates to:
  /// **'What left this device'**
  String get securityTransfersTitle;

  /// SAFETY: a statement about the present state, not a promise about the future. It must stay conditional on no provider being connected.
  ///
  /// In en, this message translates to:
  /// **'No AI provider is connected, so nothing is being sent for analysis at all.'**
  String get securityTransfersNoProvider;

  /// SAFETY: four claims and every one is testable: recorded at send time rather than on success, contents never recorded, kept 90 days, never uploaded. This is the paragraph the whole receipts feature rests on.
  ///
  /// In en, this message translates to:
  /// **'Recorded here the moment something is sent, whether or not it came back. Only the tool, the provider and the size — never what was in it. Kept for 90 days on this device and sent nowhere.'**
  String get securityTransfersDescription;

  /// No description provided for @securityClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get securityClear;

  /// No description provided for @securityNothingSent.
  ///
  /// In en, this message translates to:
  /// **'Nothing has been sent'**
  String get securityNothingSent;

  /// No description provided for @securityNothingSentDescription.
  ///
  /// In en, this message translates to:
  /// **'When you run a tool that uses your AI provider, it will be listed here.'**
  String get securityNothingSentDescription;

  /// No description provided for @securityClearHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear this history?'**
  String get securityClearHistoryTitle;

  /// SAFETY: clearing the receipt does not unsend anything. The second sentence is the entire point and must not be lost.
  ///
  /// In en, this message translates to:
  /// **'The record of what was sent will be deleted from this device. It does not undo anything that was already sent.'**
  String get securityClearHistoryBody;

  /// No description provided for @securityUnnamedTool.
  ///
  /// In en, this message translates to:
  /// **'An Intelligence tool'**
  String get securityUnnamedTool;

  /// No description provided for @securityYourProvider.
  ///
  /// In en, this message translates to:
  /// **'your AI provider'**
  String get securityYourProvider;

  /// No description provided for @securityTransferPages.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page} other{{count} pages}}'**
  String securityTransferPages(int count);

  /// No description provided for @securityTransferFiles.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 file} other{{count} files}}'**
  String securityTransferFiles(int count);

  /// No description provided for @securityTransferShortText.
  ///
  /// In en, this message translates to:
  /// **'a short piece of text'**
  String get securityTransferShortText;

  /// No description provided for @securityTransferCharacters.
  ///
  /// In en, this message translates to:
  /// **'{count}k characters'**
  String securityTransferCharacters(int count);

  /// No description provided for @securitySentTo.
  ///
  /// In en, this message translates to:
  /// **'Sent to {provider}.'**
  String securitySentTo(String provider);

  /// No description provided for @securitySentToWithSize.
  ///
  /// In en, this message translates to:
  /// **'Sent to {provider} · {size}.'**
  String securitySentToWithSize(String provider, String size);

  /// No description provided for @relativeWeeks.
  ///
  /// In en, this message translates to:
  /// **'{count}w ago'**
  String relativeWeeks(int count);

  /// No description provided for @helpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get helpTitle;

  /// No description provided for @helpAddQuestion.
  ///
  /// In en, this message translates to:
  /// **'What can I add?'**
  String get helpAddQuestion;

  /// No description provided for @helpAddAnswer.
  ///
  /// In en, this message translates to:
  /// **'A screenshot, a photo of a letter or bill, or text you paste in. Anything with a date, an amount or a request works best.'**
  String get helpAddAnswer;

  /// No description provided for @helpReviewQuestion.
  ///
  /// In en, this message translates to:
  /// **'Why does Action ask me to review?'**
  String get helpReviewQuestion;

  /// SAFETY: the reason the review step exists. It must keep both halves - that a misread is possible, and that nothing is saved without confirmation.
  ///
  /// In en, this message translates to:
  /// **'Because a machine reading a document can misread it, and a deadline that is quietly wrong is worse than no deadline at all. Action shows what it found and the words it came from, and nothing is saved until you confirm it.'**
  String get helpReviewAnswer;

  /// No description provided for @helpVaryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Why do the results change if I try again?'**
  String get helpVaryQuestion;

  /// SAFETY: an admission that output varies. Never soften it into a claim of consistency the service does not provide.
  ///
  /// In en, this message translates to:
  /// **'The service that reads your document is not deterministic, so the same capture can come back slightly differently. That is also why the review step exists — you are the part that does not change.'**
  String get helpVaryAnswer;

  /// No description provided for @helpLateQuestion.
  ///
  /// In en, this message translates to:
  /// **'Why was my reminder late?'**
  String get helpLateQuestion;

  /// SAFETY: the final sentence is a refusal to promise punctual delivery, and it is the point of the answer.
  ///
  /// In en, this message translates to:
  /// **'Reminders are scheduled with Android, and Android decides exactly when to deliver them. Battery saving, Doze and manufacturer power settings can all delay one. Action never promises a reminder to the minute.'**
  String get helpLateAnswer;

  /// No description provided for @helpDataQuestion.
  ///
  /// In en, this message translates to:
  /// **'Where is my data?'**
  String get helpDataQuestion;

  /// SAFETY: names both exceptions explicitly. Losing either turns a truthful summary into a claim that everything stays local.
  ///
  /// In en, this message translates to:
  /// **'Almost all of it is on this device: your captures, Actions, steps, reminders and searches. Two exceptions — the content you ask Action to read is sent to the AI service that reads it, and a short record of a confirmed Action may be stored in the cloud under an anonymous ID. Privacy & data in Settings lists exactly what that record contains.'**
  String get helpDataAnswer;

  /// No description provided for @helpBackupQuestion.
  ///
  /// In en, this message translates to:
  /// **'Is this a backup?'**
  String get helpBackupQuestion;

  /// SAFETY: says no, and says what that means. This answer exists so nobody relies on the cloud record as a backup.
  ///
  /// In en, this message translates to:
  /// **'No. The cloud record cannot be restored to a new device, and there is no account to sign in to. If you uninstall Action or lose this device, the data on it is gone.'**
  String get helpBackupAnswer;

  /// No description provided for @helpCorrectQuestion.
  ///
  /// In en, this message translates to:
  /// **'How do I correct an Action?'**
  String get helpCorrectQuestion;

  /// SAFETY: the last sentence is a privacy claim: editing sends nothing. Keep it.
  ///
  /// In en, this message translates to:
  /// **'Open it and edit any field — the title, the deadline, the amount or the suggested next step. You can add, reorder, complete and delete steps at any time. Editing an Action never asks the AI service anything.'**
  String get helpCorrectAnswer;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy & data'**
  String get privacyTitle;

  /// SAFETY: promises that the exceptions are listed, and there are exactly two. Do not generalise it into a claim that everything stays local.
  ///
  /// In en, this message translates to:
  /// **'Action keeps as much as it can on this device. Two things are exceptions, and they are both listed below.'**
  String get privacyIntro;

  /// No description provided for @privacyGroupOnDevice.
  ///
  /// In en, this message translates to:
  /// **'On this device'**
  String get privacyGroupOnDevice;

  /// No description provided for @privacyOnDeviceCaptures.
  ///
  /// In en, this message translates to:
  /// **'Captures — the screenshots, photos and text you add, and the text read out of them.'**
  String get privacyOnDeviceCaptures;

  /// No description provided for @privacyOnDeviceActions.
  ///
  /// In en, this message translates to:
  /// **'Actions, their steps, facts and reminders.'**
  String get privacyOnDeviceActions;

  /// SAFETY: three claims about search: it runs locally, it is never transmitted, it is not retained. All three are enforced in code and all three must survive.
  ///
  /// In en, this message translates to:
  /// **'Search. Your searches run here, are never sent anywhere, and are not kept after you close the screen.'**
  String get privacyOnDeviceSearch;

  /// SAFETY: two claims: the metadata is removed before storage, and it is therefore absent when a capture is sent onward. Both are asserted in test/capture/image_metadata_test.dart.
  ///
  /// In en, this message translates to:
  /// **'Photos are stored without their location. The coordinates, time and camera details a phone writes into a picture are removed before the capture is saved, so they are not kept here and not included when you send a capture to your AI provider.'**
  String get privacyOnDevicePhotoMetadata;

  /// No description provided for @privacyGroupSentToRead.
  ///
  /// In en, this message translates to:
  /// **'Sent to be read'**
  String get privacyGroupSentToRead;

  /// SAFETY: the second sentence prevents the first from being read as local processing. It is the most easily lost claim on this screen.
  ///
  /// In en, this message translates to:
  /// **'When you ask Action to interpret a capture, that content is sent to the AI service that reads it. This is not on-device AI.'**
  String get privacySentToReadWhat;

  /// SAFETY: two limits, both required: only the chosen capture, and only on an explicit request. Nothing is ever sent in the background.
  ///
  /// In en, this message translates to:
  /// **'It is sent only for the capture you chose, and only when you ask for it.'**
  String get privacySentToReadWhen;

  /// No description provided for @privacyGroupYourProvider.
  ///
  /// In en, this message translates to:
  /// **'Sent to your own AI provider'**
  String get privacyGroupYourProvider;

  /// SAFETY: names the providers and the fact that the user's own key is used. Provider names are proper nouns and stay untranslated.
  ///
  /// In en, this message translates to:
  /// **'If you connect an AI provider in Settings, the Intelligence tools send the content you select to that provider — OpenAI, Anthropic, Google or an endpoint you chose — using your own API key.'**
  String get privacyProviderWhat;

  /// SAFETY: both sentences are required. The second is the claim that matters and the one a shortened translation would drop.
  ///
  /// In en, this message translates to:
  /// **'It goes to them directly. It does not pass through any server belonging to Action.'**
  String get privacyProviderDirect;

  /// SAFETY: three limits and none of them is decorative: chosen content only, on an explicit run only, and never in the background.
  ///
  /// In en, this message translates to:
  /// **'Only what you pick for a tool is sent, and only when you run it. Your other Actions, captures and sources are never included, and nothing is ever sent in the background.'**
  String get privacyProviderScope;

  /// SAFETY: the qualification is the point. Secure storage is described as a real but limited obstacle; a translation that stops after the first sentence turns a measured statement into a guarantee.
  ///
  /// In en, this message translates to:
  /// **'Your API key is kept in this device’s secure storage and is sent only to the provider it belongs to. Secure storage is a real obstacle to anyone with your unlocked device, but it is not absolute, and Action will not claim otherwise.'**
  String get privacyProviderKey;

  /// No description provided for @privacyProviderLocalTools.
  ///
  /// In en, this message translates to:
  /// **'Two tools never send anything: hiding sensitive details, and checking where a file came from. Both run entirely on this device.'**
  String get privacyProviderLocalTools;

  /// SAFETY: a limit of responsibility, stated plainly. It must not become a reassurance about what the provider does.
  ///
  /// In en, this message translates to:
  /// **'What your provider does with what you send is governed by your agreement with them, not by Action.'**
  String get privacyProviderAgreement;

  /// No description provided for @privacyGroupCloud.
  ///
  /// In en, this message translates to:
  /// **'Stored in the cloud'**
  String get privacyGroupCloud;

  /// SAFETY: an exhaustive list of what is uploaded. Shortening it would make the disclosure incomplete, which is the one thing it cannot be.
  ///
  /// In en, this message translates to:
  /// **'When you confirm an Action, a short record of it may be saved under an anonymous ID belonging to this installation: its title, status, urgency, category, deadline, amount, suggested next step and timestamps.'**
  String get privacyCloudWhat;

  /// SAFETY: the complement of privacyCloudWhat. Every item named here is one the code does not upload.
  ///
  /// In en, this message translates to:
  /// **'Your captures, the text read from them, an Action’s steps and facts, and your reminders are not sent.'**
  String get privacyCloudNotSent;

  /// SAFETY: says no to a reasonable assumption, and says why. Both halves required.
  ///
  /// In en, this message translates to:
  /// **'This is not a backup. There is no way to restore it to a new device, and losing this installation loses the anonymous ID with it.'**
  String get privacyCloudNotBackup;

  /// No description provided for @privacyGroupDiagnostics.
  ///
  /// In en, this message translates to:
  /// **'Diagnostics'**
  String get privacyGroupDiagnostics;

  /// No description provided for @privacyDiagnosticsWhat.
  ///
  /// In en, this message translates to:
  /// **'Action records anonymous counts of what happens in the app — that a capture was started, that an extraction worked or did not, that a search found nothing, that an Action was completed.'**
  String get privacyDiagnosticsWhat;

  /// SAFETY: the whole analytics contract in one sentence, and every clause of it is enforced on the way in. Nothing here is a generalisation that can be compressed.
  ///
  /// In en, this message translates to:
  /// **'These are counts, not contents. No title, amount, deadline, reference, captured text or search term is ever included, and neither is the anonymous ID or any identifier for an Action or capture.'**
  String get privacyDiagnosticsCounts;

  /// SAFETY: the second sentence is the limit and must survive.
  ///
  /// In en, this message translates to:
  /// **'If the app crashes, the error and where it happened are reported so it can be fixed. Action does not attach your data to those reports.'**
  String get privacyDiagnosticsCrash;

  /// No description provided for @privacySectionYourData.
  ///
  /// In en, this message translates to:
  /// **'Your data'**
  String get privacySectionYourData;

  /// No description provided for @privacyYourDataFootnote.
  ///
  /// In en, this message translates to:
  /// **'Clearing captures leaves your Actions in place. An Action whose capture is gone still works; it simply no longer shows what it came from.'**
  String get privacyYourDataFootnote;

  /// No description provided for @privacyClearCaptures.
  ///
  /// In en, this message translates to:
  /// **'Clear captures'**
  String get privacyClearCaptures;

  /// No description provided for @privacyClearCapturesDescription.
  ///
  /// In en, this message translates to:
  /// **'Deletes every capture and its image file.'**
  String get privacyClearCapturesDescription;

  /// No description provided for @privacyDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete all my data'**
  String get privacyDeleteAll;

  /// No description provided for @privacyDeleteAllDescription.
  ///
  /// In en, this message translates to:
  /// **'Actions, steps, reminders, captures and the cloud records above.'**
  String get privacyDeleteAllDescription;

  /// No description provided for @privacyClearCapturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear captures?'**
  String get privacyClearCapturesTitle;

  /// SAFETY: says what is destroyed and what is not. The second sentence is why someone is willing to press the button.
  ///
  /// In en, this message translates to:
  /// **'Every capture and its image will be deleted from this device. Your Actions stay exactly as they are.'**
  String get privacyClearCapturesBody;

  /// No description provided for @privacyCapturesDeleted.
  ///
  /// In en, this message translates to:
  /// **'Captures deleted.'**
  String get privacyCapturesDeleted;

  /// SAFETY: a partial failure reported as one. Never collapse it into a success message.
  ///
  /// In en, this message translates to:
  /// **'Some captures could not be deleted. Nothing else was changed.'**
  String get privacyCapturesPartlyDeleted;

  /// No description provided for @privacyDeleteAllTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all your data?'**
  String get privacyDeleteAllTitle;

  /// SAFETY: the last clause is the one that stops someone assuming a backup exists. All three parts are required.
  ///
  /// In en, this message translates to:
  /// **'This deletes every Action, step, reminder and capture on this device, and the cloud records listed above. It cannot be undone, and there is no backup to restore from.'**
  String get privacyDeleteAllBody;

  /// No description provided for @privacyDeleteEverything.
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get privacyDeleteEverything;

  /// SAFETY: said only when it is true of the device and the cloud both. It must not become a general success message.
  ///
  /// In en, this message translates to:
  /// **'Everything has been deleted.'**
  String get privacyDeletedAll;

  /// No description provided for @privacyDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Your data could not be deleted.'**
  String get privacyDeleteFailed;

  /// SAFETY: the subtle case: local deletion succeeded and the cloud could not be checked. Reporting this as complete deletion would be the exact lie this screen exists to avoid.
  ///
  /// In en, this message translates to:
  /// **'Everything on this device has been deleted. Action could not reach the cloud to confirm nothing is left there, and will check again.'**
  String get privacyDeletedUnverified;

  /// No description provided for @privacyDeletedApartFrom.
  ///
  /// In en, this message translates to:
  /// **'Deleted, apart from {leftovers}.'**
  String privacyDeletedApartFrom(String leftovers);

  /// No description provided for @privacyWillTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Action will try again.'**
  String get privacyWillTryAgain;

  /// No description provided for @privacyCloudCheckIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Action could not finish checking the cloud, and will try again.'**
  String get privacyCloudCheckIncomplete;

  /// No description provided for @privacyLeftoverCaptures.
  ///
  /// In en, this message translates to:
  /// **'some captures'**
  String get privacyLeftoverCaptures;

  /// No description provided for @privacyLeftoverCloudRecords.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 cloud record} other{{count} cloud records}}'**
  String privacyLeftoverCloudRecords(int count);

  /// No description provided for @privacyLeftoverJoin.
  ///
  /// In en, this message translates to:
  /// **'{first} and {second}'**
  String privacyLeftoverJoin(String first, String second);

  /// No description provided for @privacyCloudDeleted.
  ///
  /// In en, this message translates to:
  /// **'The cloud records have been deleted.'**
  String get privacyCloudDeleted;

  /// No description provided for @privacyCloudUnreachable.
  ///
  /// In en, this message translates to:
  /// **'Still could not reach them. Action will try again.'**
  String get privacyCloudUnreachable;

  /// No description provided for @privacyPendingTitle.
  ///
  /// In en, this message translates to:
  /// **'Still to delete'**
  String get privacyPendingTitle;

  /// SAFETY: an outstanding obligation, stated with the count. It must keep both remedies - that Action retries on its own, and that the user can retry now.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 cloud record could not be reached last time. Action will try again on its own, or you can retry now.} other{{count} cloud records could not be reached last time. Action will try again on its own, or you can retry now.}}'**
  String privacyPendingBody(int count);

  /// No description provided for @privacyTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get privacyTryAgain;

  /// No description provided for @evidenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Where this came from'**
  String get evidenceTitle;

  /// SAFETY: the strongest 'do not trust this yet' statement in the product. It must keep both halves — not verified, and check the original.
  ///
  /// In en, this message translates to:
  /// **'Action could not find these words in the text it read, so this value has not been verified. Check it against the original before you rely on it.'**
  String get evidenceUnverified;

  /// No description provided for @evidenceHighlighted.
  ///
  /// In en, this message translates to:
  /// **'These words were found in the text Action read from this capture, and the highlight shows where.'**
  String get evidenceHighlighted;

  /// SAFETY: the fail-closed statement for region mapping — Action refuses to point at a place it cannot support. 'It is not guessing' must survive.
  ///
  /// In en, this message translates to:
  /// **'These words were found in the text Action read from this capture. It could not work out exactly where on the image they sit, so it is not guessing.'**
  String get evidenceNoRegion;

  /// No description provided for @evidenceInText.
  ///
  /// In en, this message translates to:
  /// **'These words were found in the text this capture contains.'**
  String get evidenceInText;

  /// ICU skeleton: day, abbreviated month, 24-hour time.
  ///
  /// In en, this message translates to:
  /// **'d MMM, HH:mm'**
  String get sourceCapturedAtFormat;

  /// No description provided for @urgencyCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get urgencyCritical;

  /// No description provided for @urgencyImportant.
  ///
  /// In en, this message translates to:
  /// **'Important'**
  String get urgencyImportant;

  /// No description provided for @urgencyNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get urgencyNormal;

  /// No description provided for @urgencyLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get urgencyLow;

  /// SAFETY: the urgency Action assigns when the document did not establish one. It must stay an admission of not knowing — never rendered as a calm "Low".
  ///
  /// In en, this message translates to:
  /// **'Not sure'**
  String get urgencyUnsure;

  /// SAFETY: the snackbar shown when the local database refuses a write on the Action detail screen. Two clauses and both are required - the save did not happen, AND nothing the user had was lost. Dropping the second turns a retryable failure into apparent data loss; dropping the first lets a failure read as a success. Keep it parallel with reviewSaveFailed, which says the same two things about a different write.
  ///
  /// In en, this message translates to:
  /// **'That didn\'t save. Nothing was lost — try again.'**
  String get detailSaveFailed;

  /// Eyebrow above the provenance section on the Action detail screen: where this Action came from. Stored sentence case and uppercased at render by eyebrowCase() - never write it uppercase here, because Dart's toUpperCase maps Turkish dotted i to I and is a no-op in scripts that have no case. Keep it short; it sits at the same size and tracking as detailSectionDetails and detailSectionReminders.
  ///
  /// In en, this message translates to:
  /// **'Created from'**
  String get detailSectionCreatedFrom;

  /// Transient line while the capture behind this Action is being read from the local store. It is a lookup in progress, not a verification or an analysis - do not translate it with a verb that implies the capture is being examined, checked for correctness, or sent anywhere. Ends with a real ellipsis character.
  ///
  /// In en, this message translates to:
  /// **'Checking the original capture…'**
  String get detailSourceChecking;

  /// SAFETY: a provenance admission. The Action still names a capture, and that capture could not be found on this device. Two things must survive: it is about the ORIGINAL capture (the source this Action was made from), and its absence is stated as a fact rather than explained. The screen does not know whether it was deleted, never synced, or failed to load, so the translation must not assert a cause ('was deleted', 'has been removed') and must not imply the Action itself is damaged - the Action stays fully usable. Distinct from sourceGone, which is what the capture's own screen says when the capture is the thing you asked for.
  ///
  /// In en, this message translates to:
  /// **'The original capture is no longer available.'**
  String get detailSourceUnavailable;

  /// The bottom-bar button on a completed Action: put it back among the open ones. The counterpart of detailMarkActionComplete - the two occupy the same button and must read as opposites in the same register. 'action' is the domain noun and IS translated.
  ///
  /// In en, this message translates to:
  /// **'Reopen action'**
  String get detailReopenAction;

  /// The bottom-bar button that finishes the whole Action, as opposed to detailMarkStepDone which finishes one step. Keep the two distinguishable: a reader must be able to tell from the words alone whether they are closing the Action or ticking a step. 'action' is the domain noun and IS translated.
  ///
  /// In en, this message translates to:
  /// **'Mark action complete'**
  String get detailMarkActionComplete;

  /// Heading above the row of AI tool chips on an Action. Deliberately about getting help with this particular Action, not about 'AI' or 'assistant' - the user's mental model is understanding the thing in front of them. 'this' refers to the Action on screen; keep the reference to the current item rather than generalising to 'get help'.
  ///
  /// In en, this message translates to:
  /// **'Get help with this'**
  String get detailGetHelp;

  /// Eyebrow above the timeline of what has happened to this Action. Stored sentence case and uppercased at render by eyebrowCase(); never write it uppercase here. It is this one Action's history - not the app's, not a browsing history - and is unrelated to securityClearHistoryTitle, which is about the record of what was sent to a provider.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get detailSectionHistory;

  /// Collapses the Action's history back to its first three entries. The counterpart of detailHistoryShowAll; the two are the same button in its two states and should read as one pair.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get detailHistoryShowLess;

  /// Expands the Action's history from the first three entries to all of them. {count} is the total number of history entries and is always four or more, so no singular form is ever rendered. Languages that inflect the number's agreement may need to add the counted noun explicitly (the English elides 'entries'); if so, use the word for a history entry, not for an Action or a step.
  ///
  /// In en, this message translates to:
  /// **'Show all {count}'**
  String detailHistoryShowAll(int count);

  /// The oldest entry in an Action's history: the moment the Action came into existence. A past event in the history list, not a status label - it sits above a timestamp that says when. Used when the Action arrived with no steps; see detailHistoryCreatedWithSteps for when it did.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get detailHistoryCreated;

  /// History entry for an Action that arrived already carrying steps - the steps created within five seconds of the Action itself, which is what a confirmed draft produces. {count} is how many. Use the plural categories your language actually has; the English =1/other split is not the full set for every locale. 'step' is the same domain noun as reviewSteps and detailAddFirstStep and must be translated the same way.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Created with 1 step} other{Created with {count} steps}}'**
  String detailHistoryCreatedWithSteps(int count);

  /// SAFETY: attributes the confirmation to the user and to nobody else. This is the history entry that records that a person read the extracted values and accepted them, and it is the provenance claim the whole review flow rests on. It must stay in the second person with the user as the actor - never 'Details confirmed', 'Confirmed automatically', or anything that lets Action appear to have verified or validated the data itself. 'the details' means the extracted values the review screen showed, matching reviewConfirmedByYou.
  ///
  /// In en, this message translates to:
  /// **'You confirmed the details'**
  String get detailHistoryReviewed;

  /// History entry for one completed step; {title} is the step's own text, written by the user or carried from the draft, and is inserted verbatim. Keep it in the user's voice like the rest of the history. The curly quotation marks are typographic quotes - substitute the quotation marks your language actually uses (« », „ “, 「 」) rather than copying the English pair.
  ///
  /// In en, this message translates to:
  /// **'Finished “{title}”'**
  String detailHistoryStepFinished(String title);

  /// Stands in for the step's title inside detailHistoryStepFinished when the stored title is missing, giving 'Finished “a step”'. Indefinite and deliberately vague: the app does not know which step it was, and must not name one. Translate as it will read inside those quotation marks.
  ///
  /// In en, this message translates to:
  /// **'a step'**
  String get detailHistoryAStep;

  /// History entry recording that the user asked to be reminded, used when the time it was set for cannot be parsed. In the user's voice with the user as the actor, like the rest of the history. It must stay visibly different from the wording of the Reminders section above it (detailAddReminder, reminderSetConfirmation): the same phrase twice on one screen meaning two different things is ambiguous to a reader. It is a record that a reminder was set, never a promise that it will fire - see reminderStateNotificationsOff for the honest status wording.
  ///
  /// In en, this message translates to:
  /// **'You set a reminder'**
  String get detailHistoryReminderSet;

  /// As detailHistoryReminderSet, plus the moment the reminder is set FOR. {when} is an already-formatted local date and time (detailHistoryTimestampFormat) and must be inserted as-is. Keep the distinction the English makes between when the user set it and what it is set for; a translation that reads as 'You were reminded at {when}' says something that did not happen.
  ///
  /// In en, this message translates to:
  /// **'You set a reminder for {when}'**
  String detailHistoryReminderSetFor(String when);

  /// History entry for the moment the whole Action was completed. Phrased as marking rather than as achieving, because the app only knows the user pressed the button; keep a verb of marking. Use the same word for 'done' as commonDone and librarySegmentDone so the Action lifecycle reads as one vocabulary - and deliberately not the Goal vocabulary of goalMarkReached, which is a different lifecycle.
  ///
  /// In en, this message translates to:
  /// **'Marked done'**
  String get detailHistoryCompleted;

  /// SAFETY: the deliberately vague history entry. The store records that something about this Action was edited and does NOT record what, so this must stay an unelaborated statement that a change happened. It must never become 'Title changed', 'Edited by you', 'Updated details' or anything else naming a field, an actor or a kind of edit - inventing the what is exactly what this section refuses to do, and a padded timeline makes the real entries indistinguishable from the invented ones.
  ///
  /// In en, this message translates to:
  /// **'Last changed'**
  String get detailHistoryChanged;

  /// An intl date-and-time pattern, not prose. See detailDateFormat. Pattern letters (d, M, y, H, m) are syntax; only their arrangement, the literal separators, and the choice of a 24-hour (HH) or 12-hour (h ... a) clock should change for the locale. Every entry in an Action's history is stamped with this, so it needs to stay short.
  ///
  /// In en, this message translates to:
  /// **'d MMM yyyy, HH:mm'**
  String get detailHistoryTimestampFormat;

  /// SAFETY: names where the user's content goes — an endpoint Action knows nothing about and cannot vouch for. Two clauses must both survive: "Custom" must keep meaning "a server you chose yourself", and "OpenAI-compatible" must stay a statement about a wire protocol the server imitates. It must never render as "works with OpenAI" or as "OpenAI" alone, which would tell the reader their data goes to OpenAI when it does not. The token OpenAI stays in Latin script. The other three provider names (OpenAI, Anthropic, Google Gemini) are trademarks and are not localized at all.
  ///
  /// In en, this message translates to:
  /// **'Custom (OpenAI-compatible)'**
  String get aiProviderCustom;

  /// An input modality a model accepts, lowercase and mid-sentence: it lands inside "The model you chose cannot read {capabilities}." Not a button and not title case — do not reuse the capture-source label "Text".
  ///
  /// In en, this message translates to:
  /// **'text'**
  String get aiCapabilityText;

  /// An input modality, lowercase and mid-sentence, inside "cannot read {capabilities}". The broad word for still images: it covers screenshots and gallery picks as well as camera photos, so not "photos".
  ///
  /// In en, this message translates to:
  /// **'images'**
  String get aiCapabilityImages;

  /// SAFETY: this names a data path, not a file type. It means the model accepts a document (a PDF) as a first-class input, rather than Action pulling the text out on the device first. Widening it to "files" or narrowing it to "PDFs" misstates which of the two paths the user's document took. Inside the refusal it must keep meaning "this model will not read your document at all", never "this model prefers something else". Lowercase, mid-sentence, and must stay a different word from aiCapabilityLongDocuments.
  ///
  /// In en, this message translates to:
  /// **'documents'**
  String get aiCapabilityDocuments;

  /// SAFETY: a statement about the shape of the output — the provider can constrain it to a schema — and nothing about its quality. It must not drift into "accurate results", "reliable results" or "organised results": all three tell the reader the model is more trustworthy when it is only more parseable, which is the overclaim this product refuses. Lowercase, mid-sentence.
  ///
  /// In en, this message translates to:
  /// **'structured results'**
  String get aiCapabilityStructuredResults;

  /// An ability a model may lack, lowercase and mid-sentence inside "The model you chose cannot read {capabilities}." It means incremental delivery of the answer as it is written. The containing sentence's verb is "read", which fits this noun awkwardly even in English — pick a noun that survives that verb.
  ///
  /// In en, this message translates to:
  /// **'streaming'**
  String get aiCapabilityStreaming;

  /// An ability a model may lack, lowercase and mid-sentence inside "cannot read {capabilities}". It names a separate instruction channel, kept apart from the user's own text. Not "settings" and not "rules".
  ///
  /// In en, this message translates to:
  /// **'system instructions'**
  String get aiCapabilitySystemInstructions;

  /// SAFETY: Evidence is a fixed glossary term — the exact quoted text a fact was taken from, never a paraphrase — and this key must use the same word for it as evidenceHighlighted, evidenceInText and evidenceUnverified. Rendering it as "sources", "references" or "links" tells the reader the model still points at the original words when it does not, which is the one claim this product cannot get wrong. Lowercase, mid-sentence.
  ///
  /// In en, this message translates to:
  /// **'evidence citations'**
  String get aiCapabilityEvidenceCitations;

  /// SAFETY: it means a context window large enough for a whole document rather than an excerpt, so the translation must keep "the whole thing" apart from "a part of it". A reader who believes the model read the entire document when it read an excerpt will trust an answer that was never grounded in the pages that mattered. Must stay a different phrase from aiCapabilityDocuments in every locale, or the refusal reads "cannot read documents or documents". Lowercase, mid-sentence.
  ///
  /// In en, this message translates to:
  /// **'long documents'**
  String get aiCapabilityLongDocuments;

  /// How two items in the middle of a list of capabilities are joined. The separator is language, not punctuation: Arabic writes an Arabic comma, Chinese and Japanese write an ideographic comma, and several scripts do not want the trailing space. Applied repeatedly to build everything before the final conjunction.
  ///
  /// In en, this message translates to:
  /// **'{a}, {b}'**
  String aiCapabilityListJoin(String a, String b);

  /// Exactly two capabilities, joined. Kept apart from aiCapabilityListMore because several languages use a different conjunction when there are only two, and because the disjunction changes shape before some words (Spanish o/u). The whole result lands inside "The model you chose cannot read {capabilities}."
  ///
  /// In en, this message translates to:
  /// **'{a} or {b}'**
  String aiCapabilityListTwo(String a, String b);

  /// Three or more capabilities: {head} is everything before the last, already joined with aiCapabilityListJoin, and {last} is the final one. The result lands inside "The model you chose cannot read {capabilities}."
  ///
  /// In en, this message translates to:
  /// **'{head} or {last}'**
  String aiCapabilityListMore(String head, String last);

  /// SAFETY: an invitation, not an error. It must not read as a breakage ("Cannot use this tool", "AI is required") — the app works without AI, which settingsIntelligenceFootnote promises in the same locale, and a translation that contradicts it breaks that promise. Provider is a fixed glossary term.
  ///
  /// In en, this message translates to:
  /// **'Connect an AI provider to use this tool.'**
  String get aiFailureNotConfigured;

  /// SAFETY: a report of what the provider said, never a verdict on the key. "Your key is wrong" or "invalid key" asserts something Action cannot know — the key may be fine and the account suspended. It must also not imply the key was read, stored or sent anywhere but to the provider the user chose. The token API stays untranslated.
  ///
  /// In en, this message translates to:
  /// **'That API key was not accepted by the provider.'**
  String get aiFailureInvalidKey;

  /// SAFETY: both halves of the disjunction must survive. Action cannot tell exhausted credit from a hit quota, and collapsing to one states a fact about the reader's billing that nothing has established. "Your provider account" must also stay, so the reader knows the money is on their own key and not on Action.
  ///
  /// In en, this message translates to:
  /// **'Your provider account is out of credit or has hit its quota.'**
  String get aiFailureQuotaExceeded;

  /// Shown when the provider is throttling. The limit is the provider's, not Action's, and the second sentence is what makes the failure temporary — keep both.
  ///
  /// In en, this message translates to:
  /// **'Your provider is rate-limiting requests. Try again shortly.'**
  String get aiFailureRateLimited;

  /// SAFETY: it must stay "could not reach" — a connection that never completed — and must not become "you are offline" or "no internet", which are claims about the device rather than about the request. The reader must not be left thinking their content was sent and lost. Action is the product name and stays in Latin script.
  ///
  /// In en, this message translates to:
  /// **'Action couldn\'t reach your AI provider. Check your connection.'**
  String get aiFailureNetworkUnavailable;

  /// SAFETY: scoped to this account — "not available to your key" — never "this model does not exist" and never "not supported yet", which implies a date nobody has promised. Model ids are retired regularly, so this is the failure a working configuration drifts into. Settings must be the same word this locale uses for the settings surface.
  ///
  /// In en, this message translates to:
  /// **'That model is not available to your key. Choose another in Settings.'**
  String get aiFailureUnsupportedModel;

  /// SAFETY: a plain statement of a missing capability, not a promise about later — never "not yet supported". "The model you chose" must survive, so the reader knows the limit belongs to the model they picked and is not Action refusing on their behalf. {capabilities} is a joined list of the aiCapability* nouns and reads mid-sentence. Settings must match the settings surface name used elsewhere in this locale.
  ///
  /// In en, this message translates to:
  /// **'The model you chose cannot read {capabilities}. Pick another model in Settings.'**
  String aiFailureUnsupportedCapability(String capabilities);

  /// SAFETY: "to read at once" must survive, because it is what tells the reader nothing was silently shortened and no partial answer was produced. "The model could not process this" leaves open that an answer was generated from part of the content, which is exactly the ungrounded answer this product refuses. Must stay distinct from aiFailureInputTooLargeText: this one was sent and rejected.
  ///
  /// In en, this message translates to:
  /// **'That was too much content for this model to read at once.'**
  String get aiFailureContextTooLarge;

  /// SAFETY: this limit is Action's own and is caught on the device before anything is sent, so the copy must not read as a provider rejection. The difference between "we did not send it" and "they refused it" is a statement about where the reader's content went and about their own metered key. Must stay distinct from aiFailureContextTooLarge.
  ///
  /// In en, this message translates to:
  /// **'That is more text than can be analysed at once.'**
  String get aiFailureInputTooLargeText;

  /// SAFETY: the trouble must stay attributed to the provider, so a reader does not conclude that their content, their key or Action caused it. The second sentence is what makes it temporary; keep both.
  ///
  /// In en, this message translates to:
  /// **'Your AI provider is having trouble. Try again shortly.'**
  String get aiFailureProviderUnavailable;

  /// SAFETY: an admission about Action's own parsing. It must not become "the provider made a mistake" or "the answer was wrong" — both claim knowledge of content Action by definition could not read — and it must not suggest a partial answer was shown. Action is the product name and stays in Latin script.
  ///
  /// In en, this message translates to:
  /// **'That provider sent back something Action could not read.'**
  String get aiFailureMalformedResponse;

  /// Shown when the user stopped the run, or navigated away. It must stay the reader's own action — it is not a timeout and not a failure, and the timeout copy is a different string.
  ///
  /// In en, this message translates to:
  /// **'Stopped.'**
  String get aiFailureCancelled;

  /// SAFETY: a requirement Action enforces, not advice. Action refuses a plain-http endpoint rather than sending to it, so this must never soften to "we recommend https" and must never suggest Action can protect an http address. The literal scheme https:// is what the user has to type: keep it in Latin script, exactly as written, colon and slashes included.
  ///
  /// In en, this message translates to:
  /// **'That endpoint must be an https:// address.'**
  String get aiFailureInsecureEndpoint;

  /// SAFETY: an admission that Action does not know what happened, in the same register as the "not sure" states. It must not be sharpened into a diagnosis Action has not established — not "the provider is down", not "your key expired".
  ///
  /// In en, this message translates to:
  /// **'Something went wrong talking to your AI provider.'**
  String get aiFailureUnknown;

  /// SAFETY: the heading on the screen that covers the whole app. 'Action' is the product name and must survive verbatim in every locale - this is not the domain noun 'action'/'task' and must not be translated as one. It says the app is locked, never that data is encrypted, protected or safe: App Lock is a door on this device and the copy may not grow into a storage claim.
  ///
  /// In en, this message translates to:
  /// **'Action is locked'**
  String get appLockTitle;

  /// SAFETY: two clauses, both required. (1) Action asks the DEVICE to confirm the owner - the app is not the one doing the confirming. (2) Action never sees the fingerprint, the face or the PIN; all three items must survive, and the sentence must not soften to 'does not store' or 'keeps private', because the claim is that the biometric never reaches this app at all. 'Action' is the product name, verbatim. Keep the em dash or the locale's equivalent joiner; do not merge the halves into one clause that loses the second.
  ///
  /// In en, this message translates to:
  /// **'Confirm it is you to continue. Action asks your device — it never sees your fingerprint, face or PIN.'**
  String get appLockPrompt;

  /// No description provided for @appLockUnlocking.
  ///
  /// In en, this message translates to:
  /// **'Unlocking…'**
  String get appLockUnlocking;

  /// SAFETY: shown when the OS declined. It states what the device did NOT confirm and must not blame or accuse the reader, name a reason Action was not told (wrong finger, too many attempts), or imply Action saw anything of the attempt. The invitation to try again must survive.
  ///
  /// In en, this message translates to:
  /// **'That was not confirmed. Try again when you are ready.'**
  String get appLockNotConfirmed;

  /// SAFETY: the refusal and the remedy travel together, as in securityAppLockUnavailable and securityAppLockUnavailableToast. Both halves are required. (1) The DEVICE cannot confirm - this is a statement about what could not be determined, not a failed attempt by the reader and not a fault of the app. (2) The remedy is elsewhere: a screen lock in the device's own settings. Dropping the second half strands someone who removed their PIN with no way back in.
  ///
  /// In en, this message translates to:
  /// **'Your device cannot confirm it is you right now. Check that a screen lock is still set up in your device settings.'**
  String get appLockCannotConfirm;

  /// No description provided for @appLockWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting…'**
  String get appLockWaiting;

  /// No description provided for @appLockUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get appLockUnlock;

  /// SAFETY: passed to the platform biometric API and rendered by the OS in its own dialog, not by this app - keep it short enough for a system prompt. 'Action' is the product name, verbatim, never translated to the domain noun. It names what the credential is being used for and may not add any claim about what is stored, encrypted or transmitted.
  ///
  /// In en, this message translates to:
  /// **'Unlock Action'**
  String get appLockReasonUnlock;

  /// SAFETY: passed to the platform biometric API and shown by the OS in its own dialog. Two things must survive: that the device is confirming the owner, and which change it is confirming (turning App Lock ON). Losing the direction would let the same prompt read as switching the protection off. 'App Lock' is the feature name shown elsewhere in Security & privacy (protectionAppLock) - keep the two identical. Keep it short: a system dialog truncates.
  ///
  /// In en, this message translates to:
  /// **'Confirm it is you before turning on App Lock'**
  String get appLockReasonEnable;

  /// SAFETY: passed to the platform biometric API and shown by the OS in its own dialog. Two things must survive: that the device is confirming the owner, and which change it is confirming (turning App Lock OFF). This one guards the removal of a protection, so it must stay visibly distinct from appLockReasonEnable - a translation where on and off read alike would let someone confirm the opposite of what they asked for. 'App Lock' is the feature name shown elsewhere in Security & privacy (protectionAppLock) - keep the two identical.
  ///
  /// In en, this message translates to:
  /// **'Confirm it is you before turning off App Lock'**
  String get appLockReasonDisable;

  /// Eyebrow above the four things Action does, shown on the first-run Home. Stored in sentence case and uppercased at render by eyebrowCase() — write it normally, and if the language has no uppercase leave it as typed; the style carries on size, weight and tracking there. 'Action' is the product name and stays in Latin script (glossary rule 1), never translated and never replaced by 'the app'.
  ///
  /// In en, this message translates to:
  /// **'What Action handles'**
  String get todayCapabilityHeading;

  /// Title of the first capability row: a physical document you photograph. A noun phrase in a list of things you can hand over, so keep whatever article or classifier the language needs.
  ///
  /// In en, this message translates to:
  /// **'A letter or bill'**
  String get todayCapabilityDocumentTitle;

  /// SAFETY: a first-run promise about what automated reading does, and the modest verbs are load-bearing. 'reads' must not become 'understands'; 'finds' must not become 'always finds', 'gets right', 'verifies' or 'confirms'; no locale may add an accuracy adverb — the whole review step exists because this can be wrong. 'Action' is the product name and stays Latin. 'deadline' is glossary term 19, 'reference' is a reference or account number (the sense used in searchFieldReferences), not a citation.
  ///
  /// In en, this message translates to:
  /// **'Action reads it and finds the deadline, the amount and the reference.'**
  String get todayCapabilityDocumentBlurb;

  /// Title of the second capability row. Not the same string as todayQuickScreenshot, which is a tile label — this is a noun phrase in a list of things you can hand over and may want an article or classifier the tile label must not have.
  ///
  /// In en, this message translates to:
  /// **'A screenshot'**
  String get todayCapabilityScreenshotTitle;

  /// Blurb of the screenshot row. 'act on' is the verb form of the domain noun action (glossary rule 2, term 1): use the locale's ordinary word for taking action, never the Latin brand 'Action'.
  ///
  /// In en, this message translates to:
  /// **'Turn a message you would otherwise forget into something you can act on.'**
  String get todayCapabilityScreenshotBlurb;

  /// Title of the third capability row: text you paste in. Distinct from todayQuickText, which is a tile label; this is a noun phrase in a list of things you can hand over.
  ///
  /// In en, this message translates to:
  /// **'Some text'**
  String get todayCapabilityTextTitle;

  /// SAFETY: both sentences must survive. 'works out' is the deliberately weak verb for classification and must not become 'understands', 'knows' or 'recognises with certainty'; the second clause claims only that Action produces an interpretation of what the text is and what it demands, never that the interpretation is correct. 'Action' is the product name and stays Latin. Use the same verb here as in briefDetailFirstRun — the two can appear on screen together on first run.
  ///
  /// In en, this message translates to:
  /// **'Paste anything. Action works out what it is and what it asks of you.'**
  String get todayCapabilityTextBlurb;

  /// SAFETY: the confirmation gate in three words. The user is the one who confirms and 'everything' is the scope — it must not become 'Action confirms everything for you', 'Everything is verified' or a passive 'Everything is checked', which would move the guarantee from the user to the app. Glossary term 6: confirm, never 'approve' — the person may change what was extracted, not merely accept it. Must agree with settingsActionFootnote, which makes the same promise in a sentence.
  ///
  /// In en, this message translates to:
  /// **'You confirm everything'**
  String get todayCapabilityConfirmTitle;

  /// SAFETY: two preconditions have to survive — the evidence was shown to you, AND you assented. A translation that keeps only 'you confirm it first' has dropped the evidence half, which is the part that distinguishes this product from an app that just asks 'OK?'. 'evidence' is glossary term 14, the exact quoted text a fact came from, and must use the same word as the evidence* keys in this locale.
  ///
  /// In en, this message translates to:
  /// **'Nothing becomes a task until you have seen the evidence and said yes.'**
  String get todayCapabilityConfirmBlurb;

  /// Button under the capability list; navigates to the workspace the bottom navigation labels navIntelligence. The noun must be byte-identical to navIntelligence in this locale (glossary term 11). Deliberately NOT 'AI': 'Explore AI' or 'Try the AI' breaks the product's framing.
  ///
  /// In en, this message translates to:
  /// **'Explore Intelligence'**
  String get todayCapabilityExploreIntelligence;

  /// Shown when a picked or shared PDF has no bytes at all. A limitation, not an accusation - the English deliberately avoids 'error', 'invalid' and 'failed', and translations should too.
  ///
  /// In en, this message translates to:
  /// **'That file is empty.'**
  String get documentRejectedEmpty;

  /// Shown when a document is past Action's 25 MB cap. {size} arrives already formatted for reading ('26.1 MB', '900 bytes') - never bake a figure or a unit into the translation, and keep the placeholder where the sentence needs it. States a limit rather than a fault: no 'error', 'invalid' or 'failed'.
  ///
  /// In en, this message translates to:
  /// **'That document is {size}, which is larger than Action can work with.'**
  String documentRejectedTooLarge(String size);

  /// SAFETY: provenance. Two clauses must both survive. 'whatever it is called' says the judgement came from the file's own bytes and not from its name or from what the picker claimed - it must not be dropped as redundant, because it is the whole point of the check. The second sentence must keep naming what Action does read, so the refusal leaves the user a way forward. Do not turn this into an accusation about the sender or the file.
  ///
  /// In en, this message translates to:
  /// **'That is not a PDF, whatever it is called. Action reads PDFs and images.'**
  String get documentRejectedNotAPdf;

  /// Shown when the copy of a document on disk could not be opened at all. Says the read did not happen; must not imply the document itself is damaged.
  ///
  /// In en, this message translates to:
  /// **'That document could not be read.'**
  String get documentRejectedUnreadable;

  /// SAFETY: provenance. 'whatever it is called' says the judgement came from the bytes rather than the file name, and must survive. Shorter twin of documentRejectedNotAPdf, reached by a different check; keep them as two distinct sentences.
  ///
  /// In en, this message translates to:
  /// **'That file is not a PDF, whatever it is called.'**
  String get pdfRejectedNotAPdf;

  /// SAFETY: names the protection and Action's own inability to get past it. Both clauses required. Must never become an invitation to enter a password, and must never suggest Action could try one or send the file somewhere that might open it - the file is refused here precisely so it is not uploaded to a provider that could not read it either and would still bill the user.
  ///
  /// In en, this message translates to:
  /// **'That PDF is password-protected, so Action cannot read it.'**
  String get pdfRejectedEncrypted;

  /// SAFETY: states what Action could NOT establish. 'may be' is a hedge and must stay one - Action knows only that it could not read the file, not that the file is broken. Forbidden hardenings: 'this PDF is corrupt', 'this file is damaged', 'invalid PDF'.
  ///
  /// In en, this message translates to:
  /// **'That PDF could not be read. It may be incomplete.'**
  String get pdfRejectedDamaged;

  /// Shown when another app shared into Action but the share carried nothing usable. Blames the share, never the user.
  ///
  /// In en, this message translates to:
  /// **'There was nothing in that share to read.'**
  String get shareRejectedEmpty;

  /// Shown when another app shares a kind of file Action has no way to read. Keep the list of what it does take - that sentence is the way forward - and keep the second sentence neutral about what the file was.
  ///
  /// In en, this message translates to:
  /// **'Action can take text, images and PDFs. That was something else.'**
  String get shareRejectedUnsupportedType;

  /// SAFETY: security and provenance. Two claims, both required: the file's declared type contradicts its actual bytes, and Action has NOT opened it. Keep the second in that form - 'could not open it' turns a refusal into a failure, and any past tense implying it was opened and then discarded is wrong. Action stopped before reading the file.
  ///
  /// In en, this message translates to:
  /// **'That file is not the kind of file it says it is, so Action has not opened it.'**
  String get shareRejectedContentMismatch;

  /// Shown when a shared file is past Action's 25 MB cap. This one carries no figure; do not add one.
  ///
  /// In en, this message translates to:
  /// **'That file is too large for Action to work with.'**
  String get shareRejectedTooLarge;

  /// Shown when the platform's own copy of a shared file could not be read back. Says the read did not happen, not that the file is bad.
  ///
  /// In en, this message translates to:
  /// **'That file could not be read.'**
  String get shareRejectedUnreadable;

  /// SAFETY: says the on-device recogniser did not run at all. It must not become 'no text was found', which is a different and successful outcome with its own copy - a photo of a wall legitimately contains no text. Keep it about the recogniser, not about the picture.
  ///
  /// In en, this message translates to:
  /// **'Text recognition could not run.'**
  String get captureFailureRecognition;

  /// SAFETY: grounding. 'on this device' is the whole claim - the limit is this handset's decoder, not the picture - and must survive. Must not become 'that image is broken' or 'unsupported image', and must not suggest the image was sent anywhere to be checked; nothing left the device. The capture itself is kept, so the sentence should read as a lost automatic read rather than a lost capture.
  ///
  /// In en, this message translates to:
  /// **'That image format couldn\'t be read on this device.'**
  String get captureFailureImageFormat;

  /// No description provided for @connectSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect your AI'**
  String get connectSheetTitle;

  /// SAFETY: Two claims must both survive: the account and the key are the user's own (Action supplies neither and bills nothing), and the key goes into this device's secure storage rather than anywhere else — never upgraded to 'encrypted', 'safe' or 'protected', per the rule that governs securityStorageKeyDetail and privacyProviderKey.
  ///
  /// In en, this message translates to:
  /// **'You use your own provider account and API key. Action stores the key in this device’s secure storage.'**
  String get connectSheetSubtitle;

  /// No description provided for @connectErrorKeyMissing.
  ///
  /// In en, this message translates to:
  /// **'Paste your API key to continue.'**
  String get connectErrorKeyMissing;

  /// No description provided for @connectErrorModelMissing.
  ///
  /// In en, this message translates to:
  /// **'Choose a model, or type a model id.'**
  String get connectErrorModelMissing;

  /// No description provided for @connectErrorEndpointMissing.
  ///
  /// In en, this message translates to:
  /// **'Add the address of your endpoint.'**
  String get connectErrorEndpointMissing;

  /// SAFETY: Both clauses are required: that secure storage could not be opened, and that as a consequence nothing was stored. A translation that keeps only the first half leaves the user believing their key was saved when it was not.
  ///
  /// In en, this message translates to:
  /// **'This device\'s secure storage could not be opened, so the key was not saved.'**
  String get connectErrorSecureStorageUnavailable;

  /// SAFETY: The confirmation claim for the whole flow, and deliberately minimal: the provider answered one request. It must not inflate into 'your key is valid', 'everything is set up', or anything about the connection being secure or the chosen model working.
  ///
  /// In en, this message translates to:
  /// **'Connected.'**
  String get connectTestSucceeded;

  /// SAFETY: Same confirmation claim as connectTestSucceeded plus a count of what the key can reach; it must stay a statement about what the provider reported, not about what Action verified.
  ///
  /// In en, this message translates to:
  /// **'Connected. {count} models available.'**
  String connectTestSucceededWithModels(int count);

  /// No description provided for @connectProviderLabel.
  ///
  /// In en, this message translates to:
  /// **'Provider'**
  String get connectProviderLabel;

  /// No description provided for @connectEndpointLabel.
  ///
  /// In en, this message translates to:
  /// **'Endpoint'**
  String get connectEndpointLabel;

  /// SAFETY: Both clauses are the cleartext refusal: the requirement, and the reason it is a refusal rather than a preference. 'will not send' must stay absolute — not 'does not recommend' — and 'https://' stays literal.
  ///
  /// In en, this message translates to:
  /// **'Must be an https:// address. Action will not send your documents over an unencrypted connection.'**
  String get connectEndpointHttpsNote;

  /// No description provided for @connectApiKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'API key'**
  String get connectApiKeyLabel;

  /// No description provided for @connectApiKeyHint.
  ///
  /// In en, this message translates to:
  /// **'Paste your key'**
  String get connectApiKeyHint;

  /// SAFETY: Three separate claims, all enforced in code and none droppable: the key stays local, the only egress is the provider the user picked, and it is never redisplayed after saving. It must also not be strengthened — no 'encrypted', no 'safe', no 'nobody can access it'.
  ///
  /// In en, this message translates to:
  /// **'Your key stays on this device. Action never sends it anywhere except to the provider you chose, and cannot show it to you again after saving.'**
  String get connectKeyPrivacyNote;

  /// No description provided for @connectModelLabel.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get connectModelLabel;

  /// No description provided for @connectModelIdHint.
  ///
  /// In en, this message translates to:
  /// **'Model id'**
  String get connectModelIdHint;

  /// SAFETY: The second sentence is the escape hatch. Dropping it turns the preset chips into what they explicitly are not — a whitelist — and leaves a user whose model id was retired at a dead end, the same rule that governs ocrScriptUnreadableBody.
  ///
  /// In en, this message translates to:
  /// **'Providers retire model ids and add new ones. If the one you want is not listed, type it here.'**
  String get connectModelFreeTextNote;

  /// SAFETY: Half of a mutually exclusive action pair with connectSaveWithoutTesting; if a locale renders both buttons with the same verb the user cannot tell which one performs a live, billable call to their own provider account.
  ///
  /// In en, this message translates to:
  /// **'Connect and test'**
  String get connectAndTest;

  /// SAFETY: It is the affordance that stores an unverified key, and its distinctness from connectAndTest is the only signal that no request is made; 'without' must survive as a negation, never as a softener like 'save quickly'.
  ///
  /// In en, this message translates to:
  /// **'Save without testing'**
  String get connectSaveWithoutTesting;

  /// SAFETY: the note banner shown above an Improve-this-writing or Translate result when the fact-preservation check could not run at all — the original was a PDF the provider read for itself, so there was no local text on the device to compare the output against. This is the tool admitting a check DID NOT RUN. Two mandatory clauses: (1) Action could not compare the result against the original text, and (2) the amounts and dates in it have consequently NOT been checked. Clause (2) must stay an absolute negative. Softening it into 'may not have been checked', 'might contain differences' or 'please double-check' turns an unrun check into an apparent pass, which is the exact failure this banner exists to prevent. Equally it must never harden into a claim that something is wrong: Action found no error, it performed no comparison. Keep it distinct from the caution shown when the check DID run and found a dropped amount — that is a finding, this is the absence of one. 'Action' is the product name and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Action couldn\'t compare this against the original text, so the amounts and dates in it have not been checked.'**
  String get toolWarningFactsNotChecked;

  /// Name of the rewrite tool. Rendered on the Studio tool card, inside the card's screen-reader label, as the run screen's app-bar title, and — the reason this must be translated — as the row label in the Security centre's 'What left this device' journal, where a person audits what was sent from their own device. Keep it a short verb phrase naming what the tool does to the user's own text. It must not read as a verdict on the writing ('fix your poor writing') and must not promise a rewrite the user has not seen: the result is always shown before anything is kept. The stored identifier is unaffected by translation, so journal history stays intact.
  ///
  /// In en, this message translates to:
  /// **'Improve this writing'**
  String get toolTitleRewrite;

  /// SAFETY: the one-line description under the rewrite tool's name on the Studio card and the run screen. 'Facts kept intact' is a preservation claim, and it is backed by a check that really runs and really fails: the same tool prints a caution when an amount or date was dropped, and prints toolWarningFactsNotChecked when it could not compare at all. The translation must stay a statement of what the tool aims to preserve, never a guarantee that nothing can change — 'your facts will not be altered', 'guaranteed accurate' or any absolute would contradict the caution the same run may show. The first half names three optional styles, not three things that all happen at once. Keep the em dash or the locale's equivalent separator.
  ///
  /// In en, this message translates to:
  /// **'Clearer, shorter or more formal — facts kept intact.'**
  String get toolDescriptionRewrite;

  /// Display label for a rewrite style the user picks from chips under 'Style', and — for the chosen style — the heading rendered above the rewritten text in the result. It must read naturally in both positions. This is a label only: the underlying value is a fixed English identifier that routes the request, and translating it never changes what is asked of the model. A comparative adjective describing the resulting text ('clearer than before'), not an instruction to the reader.
  ///
  /// In en, this message translates to:
  /// **'Clearer'**
  String get toolModeRewriteClearer;

  /// Rewrite style chip and result heading, as toolModeRewriteClearer. Means suitable for workplace or business correspondence. Must stay distinguishable from toolModeReplyFormal ('Formal') in the reply tool, which is stricter and aimed at legal or official recipients; several languages default to the same word for both, so choose two different words if the language allows it. Keep the comparative sense ('more professional than the original').
  ///
  /// In en, this message translates to:
  /// **'More professional'**
  String get toolModeRewriteProfessional;

  /// Rewrite style chip and result heading, as toolModeRewriteClearer. Means cut length without losing meaning — a comparative about length only. It must not imply content is removed or summarised; this mode still returns the whole text.
  ///
  /// In en, this message translates to:
  /// **'Shorter'**
  String get toolModeRewriteShorter;

  /// Rewrite style chip and result heading, as toolModeRewriteClearer. Means the writer's existing case is made more compelling using only what they already say — no new arguments, claims or promises are added. Keep it modest for that reason; a label meaning 'convincing' or 'winning' oversells what the mode is allowed to do.
  ///
  /// In en, this message translates to:
  /// **'More persuasive'**
  String get toolModeRewritePersuasive;

  /// Rewrite style chip and result heading, as toolModeRewriteClearer. Means plain language and shorter sentences, with jargon explained rather than dropped. Must not suggest the content is simplified away or made childish — the ideas survive, the wording gets easier.
  ///
  /// In en, this message translates to:
  /// **'Simpler'**
  String get toolModeRewriteSimpler;

  /// Rewrite style chip and result heading, as toolModeRewriteClearer. Means headings or short paragraphs so the text can be scanned. About layout, not about content or tone.
  ///
  /// In en, this message translates to:
  /// **'More structured'**
  String get toolModeRewriteStructured;

  /// Rewrite style chip and result heading, as toolModeRewriteClearer. The narrowest mode: grammar, spelling and punctuation are corrected and nothing else — wording, tone, structure and length are left alone. The restricting word ('only') must survive. A label meaning just 'Grammar' overstates the mode and invites the user to expect edits it will not make.
  ///
  /// In en, this message translates to:
  /// **'Grammar only'**
  String get toolModeRewriteGrammarOnly;

  /// Heading above the bulleted list of edits the tool made to the user's text, shown under the rewritten version. Past tense, describing work already done — not 'what to change', which would read as advice the user still has to act on.
  ///
  /// In en, this message translates to:
  /// **'What changed'**
  String get toolSectionWhatChanged;

  /// Generic heading above a short remark qualifying a result. Shown in the rewrite result above toolSectionAlreadyClearBody, and reusable by other tools. One short word; a neutral aside, not a warning — cautions and warnings have their own banner with their own wording.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get toolSectionNote;

  /// SAFETY: shown under the 'Note' heading when the tool reports that the user's original text was already good. It asserts a finding about the user's own writing and about the size of the edits, and both clauses are required: (1) the text was already clear, and (2) the edits that were made are minor. Dropping clause (2) lets a lightly touched rewrite read as untouched, and a user may then skip comparing it. It must not become 'no changes were made' — a rewritten text was still produced and is shown above this note — nor 'your text was perfect', which is a stronger claim than the tool made. IMPLEMENTATION NOTE for whoever wires this up: 'below' is the English deixis and currently points the wrong way, because the 'What changed' list is rendered ABOVE this note; the agreed fix is to reorder the two sections so the English becomes true, which keeps this string and every translation of it valid. Translate the deixis as written ('the changes below') and do not reword it.
  ///
  /// In en, this message translates to:
  /// **'This was already clear. The changes below are minor.'**
  String get toolSectionAlreadyClearBody;

  /// Label carried by the rewritten document the user can copy, keep or export. Names the artefact the tool produced. Not a schema field and never sent to the model. Keep it a noun phrase naming a document, not a claim that the text is now good.
  ///
  /// In en, this message translates to:
  /// **'Improved text'**
  String get toolSectionImprovedText;

  /// Name of the reply tool. Rendered on the Studio tool card, in the card's screen-reader label, as the run screen's app-bar title, and as the row label in the Security centre's 'What left this device' journal. Keep it a verb-object phrase — the action of drafting — rather than the noun 'a draft reply': the verb form reads correctly as a journal row and preserves the sense that the writing stops at a draft. The stored identifier is unaffected by translation.
  ///
  /// In en, this message translates to:
  /// **'Draft a reply'**
  String get toolTitleDraftReply;

  /// SAFETY: the one-line description under the reply tool's name, read BEFORE the tool is run. It carries the product's no-send guarantee in the place where a user forms their expectation: Action has no mail integration and never sends anything. The reflexive — that the person sends it themselves — is the load-bearing part and must survive. 'A response you can send' or 'a reply ready to send' advertises a capability the product deliberately does not have. 'Edit' must also survive: the draft is expected to need work. Translate this in lockstep with toolWarningDraftNotSent so the tool card and the result banner cannot contradict each other.
  ///
  /// In en, this message translates to:
  /// **'A response you can edit and send yourself.'**
  String get toolDescriptionDraftReply;

  /// Display label for a reply style the user picks from chips under 'Style'. This is a label only: the underlying value is a fixed English identifier that routes the request, and translating it never changes what is asked of the model. Means neutral, courteous and businesslike — the default. Must stay distinguishable from toolModeReplyFormal in the same picker.
  ///
  /// In en, this message translates to:
  /// **'Professional'**
  String get toolModeReplyProfessional;

  /// Reply style chip, as toolModeReplyProfessional. Means three or four sentences — brief, not curt. A word meaning 'short' is fine; one meaning 'blunt' or 'abrupt' is not.
  ///
  /// In en, this message translates to:
  /// **'Concise'**
  String get toolModeReplyConcise;

  /// Reply style chip, as toolModeReplyProfessional. Means warm and direct while still serious about the substance. Not 'casual' or 'informal' — the reply may still concern money or a deadline.
  ///
  /// In en, this message translates to:
  /// **'Friendly'**
  String get toolModeReplyFriendly;

  /// Reply style chip, as toolModeReplyProfessional. The strictest register, suitable for a legal or official recipient. It sits directly beside 'Professional' in the same row of chips and the two MUST remain distinguishable after translation — many languages reach for the same word for both, which would leave the user choosing between two identical chips. If the language has only one natural word, qualify one of them (for example an official/administrative register for this one) rather than repeating it.
  ///
  /// In en, this message translates to:
  /// **'Formal'**
  String get toolModeReplyFormal;

  /// Reply style chip, as toolModeReplyProfessional. Unlike its neighbours this one names what the draft will DO, not how it will sound: it asks specific questions about what is missing or unclear and says nothing else. Keep it a verb phrase; a bare noun such as 'Clarification' loses that it is the reply's whole purpose.
  ///
  /// In en, this message translates to:
  /// **'Ask for clarification'**
  String get toolModeReplyClarification;

  /// Reply style chip, as toolModeReplyProfessional. Means the draft confirms RECEIPT of what was sent and states what the sender should expect next. Ambiguity to avoid: in English 'Confirm' also reads as a button verb, and a translation that renders it as the OK/confirm button label will read as an action on the screen rather than a kind of reply. Prefer the wording used for acknowledging a received message. It must not imply the user agrees to, accepts or approves the contents — the tool is explicitly forbidden from committing the writer to anything.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get toolModeReplyConfirmation;

  /// Reply style chip, as toolModeReplyProfessional. Only ever used because the person deliberately chose it. The draft states a disagreement and the grounds for it, drawn strictly from the material; it never threatens, never cites law and never asserts rights the material does not establish. Keep the label clearly opt-in and plain — a word meaning 'challenge' or 'object to' is right; anything suggesting a formal complaint, legal action or an appeal Action can lodge on the user's behalf is wrong.
  ///
  /// In en, this message translates to:
  /// **'Dispute this'**
  String get toolModeReplyDispute;

  /// Heading above the subject line the tool drafted for the reply. The email-header sense of the word — use whatever a mail client in this language calls that field — not 'topic' or 'the matter at hand'. A rendered heading; the identically spelled field name in the request is separate and stays English.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get toolSectionSubject;

  /// Heading above the body of the drafted reply, and the label of the draft artefact when no subject line was produced. 'Draft' carries the product guarantee that sits in the banner directly above it — nothing has been sent and nothing will be. Keep the unfinished, not-yet-sent sense; a word meaning 'your reply' or 'the reply sent' would undo it.
  ///
  /// In en, this message translates to:
  /// **'Draft reply'**
  String get toolSectionDraftReply;

  /// Heading above the bulleted list of square-bracketed gaps the tool deliberately left in the draft — things only the writer knows. It must stay a requirement addressed to the reader, not an option: 'You may want to add' would let someone send a draft still containing [brackets]. Second person, matching the you-form register used elsewhere in the app. A heading, not a field name.
  ///
  /// In en, this message translates to:
  /// **'You need to fill these in'**
  String get toolSectionPlaceholders;

  /// Label of the drafted reply the user can copy or keep, when a subject line was produced. Only the word 'Draft' and the separator are translatable; {subject} is the drafted subject line and passes through exactly as written. Keep the unfinished, not-yet-sent sense of 'Draft', as in toolSectionDraftReply. The em dash may be replaced by the locale's normal separator — Arabic and Urdu in particular should check that the join still reads correctly when {subject} is itself right-to-left.
  ///
  /// In en, this message translates to:
  /// **'Draft — {subject}'**
  String toolSectionDraftWithSubject(String subject);

  /// SAFETY: the note banner shown above every drafted reply. It is the strongest guarantee in this tool and all three claims must survive translation: (1) what is shown is a draft, (2) Action does not send anything, and (3) the person reads, edits and sends it themselves. Claim (2) is an absolute statement of fact about the product — there is no mail integration — and must never be softened into 'before sending', 'Action will not send it yet', 'nothing is sent automatically' or 'nothing has been sent', each of which implies a sending capability that does not exist. Keep the three imperatives in (3): read, edit, send. 'Action' is the product name and is not translated.
  ///
  /// In en, this message translates to:
  /// **'This is a draft. Action does not send anything — read it, edit it, and send it yourself.'**
  String get toolWarningDraftNotSent;

  /// Name of the translation tool. Rendered on the Studio tool card, in the card's screen-reader label, as the run screen's app-bar title, and as the row label in the Security centre's 'What left this device' journal. The single most important title to translate in this group: a person who opens the Studio looking for a translator is the least likely of all users to read English. One word, the plain verb.
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get toolTitleTranslate;

  /// SAFETY: the one-line description under the translation tool's name on the Studio card and the run screen. 'Kept intact' is a preservation claim about exactly the things a translation model most wants to helpfully convert — amounts, dates, reference numbers, account numbers, and the names of people and organisations — and it is backed by a check that really runs and can really fail, so the same result may carry a caution that a figure was dropped. The translation must stay a description of what the tool tries to preserve, never a guarantee that nothing can change. In particular do not turn it into a promise of accuracy: this tool makes no accuracy claim, and toolWarningTranslationNotCertified says so on every result.
  ///
  /// In en, this message translates to:
  /// **'Another language, with the numbers and names kept intact.'**
  String get toolDescriptionTranslate;

  /// Heading above the translated text, used when the tool could not identify the language the original was written in, and also the label of the translation artefact the user can copy or keep. A plain noun naming the output. The identically spelled contract name in the request is separate and stays English.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get toolSectionTranslation;

  /// Heading above the translated text when the source language was identified — 'From German to English'. Both names may be reordered or re-cased freely: several languages cannot use the English 'from X to Y' frame, and some need a different construction entirely, so translate the sentence rather than the two prepositions. {from} is the source language name as the model reported it and may arrive in any language; {to} is the target language the user asked for. Neither is translated here, so the frame will be localized while a name inside it may not be — keep the frame unambiguous on its own.
  ///
  /// In en, this message translates to:
  /// **'From {from} to {to}'**
  String toolSectionTranslationFromTo(String from, String to);

  /// Heading above the bulleted list of terms the tool deliberately did NOT translate — reference numbers, account numbers, codes and proper nouns that must survive untouched for the document to stay usable. The direction is the whole meaning and must not invert: these items are still in the source language, exactly as they were written. A rendering such as 'Translated from the original' reverses it and would tell the user their reference numbers had been converted, which is the opposite of what happened, and the opposite of what makes the document still work. 'Original' here means the original wording, not the original document.
  ///
  /// In en, this message translates to:
  /// **'Kept in the original'**
  String get toolSectionKeptInOriginal;

  /// SAFETY: the note banner shown above every translation. It is the disclaimer that stops someone filing an Action-produced translation as an official document with a court, an insurer or an immigration authority. Both halves are required and must stay in contrast: (1) what this is for — understanding the material — and (2) what it is not — a certified translation. Neither half may be dropped, and (2) must not soften into 'may not be certified' or 'not an official translation in every country'. Use whatever term this locale's legal system uses for a sworn or certified translation, so the denial lands on the real category a reader might otherwise assume. The model is separately forbidden from describing its own output as certified; these two must not drift apart.
  ///
  /// In en, this message translates to:
  /// **'A translation for understanding, not a certified translation.'**
  String get toolWarningTranslationNotCertified;

  /// Name of the structured-data tool (id 'structured-data', which stays English and is never translated). Three render sites: the Studio tool card, the tool run screen AppBar, and the row label in the Security centre's 'What left this device' journal, which resolves the stored id to this title. Keep it a verb phrase, like the other tool names. 'Table' means a grid of rows and columns inside a document; pick the word a spreadsheet or an invoice would use, not the furniture.
  ///
  /// In en, this message translates to:
  /// **'Extract a table'**
  String get toolTitleStructuredData;

  /// One-line description of the structured-data tool, shown under its title on the Studio card and on the tool run screen, and read aloud inside the card's accessibility label (studioToolSemantics / studioToolSemanticsLocal, where it is the {description} placeholder). Keep it a promise about what the user gets out and can reuse elsewhere - it must not become a claim of accuracy or completeness, which the table-layout caution exists precisely to qualify. 'fields' here is the on-screen noun for named label/value pairs, matching toolSectionFields.
  ///
  /// In en, this message translates to:
  /// **'Rows, fields and figures you can copy out.'**
  String get toolDescriptionStructuredData;

  /// Heading above the extracted grid in a structured-data result. This is the on-screen heading, not the JSON property sent to the AI provider: the schema words stay English and are untouched. Translate as the noun for a table of rows and columns.
  ///
  /// In en, this message translates to:
  /// **'Table'**
  String get toolSectionTable;

  /// Heading above the label/value pairs in a structured-data result. Deliberately the same word as the model-facing schema property 'fields' but the opposite treatment: this one is on screen and IS translated. Use the noun for named data fields on a form or a record, not a synonym for 'areas' or 'subjects'.
  ///
  /// In en, this message translates to:
  /// **'Fields'**
  String get toolSectionFields;

  /// Title of the CSV file produced from the extracted table, shown wherever that export is offered. Translate the word 'Table' and leave the token '(CSV)' exactly as it is, parentheses and capitals included, in every locale - it names the file format.
  ///
  /// In en, this message translates to:
  /// **'Table (CSV)'**
  String get toolSectionTableCsv;

  /// SAFETY: shown above a table the model itself flagged as uncertain. It states what Action could NOT establish - that each value belongs to the column it is shown in. Two clauses must both survive: the column layout could not be read reliably (not 'may contain minor errors', not 'formatting may be imperfect'), and the user must check the rows line up before using them. Keep it in the negative and keep the instruction. The failure being warned about is the wrong amount sitting beside the wrong invoice, so a translation that softens this into a note about presentation is a wrong translation.
  ///
  /// In en, this message translates to:
  /// **'The column layout of this table could not be read reliably. Check the rows line up before using them.'**
  String get toolWarningTableLayoutUncertain;

  /// Name of the deadline finder tool (id 'deadline-finder', which stays English and is never translated). Same three render sites as toolTitleStructuredData: the Studio card, the tool run screen AppBar, and the row label in the Security centre's 'What left this device' journal. This tool sends selected content to the AI provider and can save to an Action, so it is the row a person sees most often when auditing that journal. Keep it a verb phrase; 'deadlines' is the plural noun for dates by which something must be done.
  ///
  /// In en, this message translates to:
  /// **'Find deadlines'**
  String get toolTitleDeadlineFinder;

  /// One-line description of the deadline finder, shown under its title on the Studio card and on the tool run screen, and read aloud inside the card's accessibility label as the {description} placeholder. Three clauses, all three required: what is due, when it is due, and what the material says happens if it is not done. The third clause is conditional and stays conditional - it does not promise that a consequence exists, only that one is reported when the material states it.
  ///
  /// In en, this message translates to:
  /// **'What is due, when, and what happens if it is not.'**
  String get toolDescriptionDeadlineFinder;

  /// Heading above the dated obligations this run found, counting them. A real plural: the English source distinguishes only one from many, so locales with zero, two, few or many forms must supply them. It counts what this run surfaced, not what the material contains.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 deadline} other{{count} deadlines}}'**
  String toolSectionDeadlineCount(int count);

  /// SAFETY: the heading over an absence of findings, shown when a completed run surfaced no obligations. It reports the result of this run and nothing more - it must never become a claim that the material contains no deadlines, or that the person owes nothing. 'No deadlines', 'You owe nothing', 'Nothing to worry about' and 'All clear' are wrong translations. This is a result state, not the first-run empty screen, so the ban on 'Nothing here yet' wording does not apply and it must not be rewritten into an invitation to add something. Pairs with toolSectionNothingDueBody.
  ///
  /// In en, this message translates to:
  /// **'Nothing due'**
  String get toolSectionNothingDue;

  /// SAFETY: the body under toolSectionNothingDue, and the strictest sentence in this file. It asserts what Action found, never what is true of the material. The subject must stay 'Action' - the product name, untranslated, never replaced by a pronoun and never dropped, however natural a subjectless sentence is in the locale. Keep the verb of finding, keep both nouns (deadlines and obligations), and keep the scope qualifier 'in this material'. It must not become 'There are no deadlines in this document' or 'Nothing is due', which turn a null result into a guarantee.
  ///
  /// In en, this message translates to:
  /// **'Action found no deadlines or obligations in this material.'**
  String get toolSectionNothingDueBody;

  /// SAFETY: shown above the deadlines this tool suggests. Two separate product guarantees and both are required: nothing is scheduled until the user chooses it, and reminders are never set automatically. 'never' is an absolute and must not soften into 'not usually', 'normally not' or 'you can choose whether to'. Same guarantee family as captureFootnote and the confirm-before-create promise; keep both sentences.
  ///
  /// In en, this message translates to:
  /// **'Nothing is scheduled until you choose it. Reminders are never set automatically.'**
  String get toolWarningNothingScheduledAutomatically;

  /// Prefix on the consequence clause of a deadline's detail line - for example 'If not: the policy lapses'. Only the prefix is translated: {consequence} arrives from the AI provider in the language of the material, so this label may sit in front of text in another language. Keep the conditional sense - it labels what the material says happens if the obligation is not met, never a prediction by Action. Adjust the colon and spacing to the locale's own punctuation.
  ///
  /// In en, this message translates to:
  /// **'If not: {consequence}'**
  String toolLabelDeadlineConsequence(String consequence);

  /// Prefix on the list of things the material says the person must have - for example 'You need: passport, proof of address'. Only the prefix is translated: {items} is a joined list of AI provider output in the language of the material. Address the person the way the locale addresses a user elsewhere in the app. It states what the material requires, not an instruction from Action to go and obtain it. Adjust the colon and spacing to the locale's own punctuation.
  ///
  /// In en, this message translates to:
  /// **'You need: {items}'**
  String toolLabelDeadlineRequiredItems(String items);

  /// A sentence FRAGMENT, never shown alone. It is dropped into reviewAmountError — "Cannot use this amount: {reason}." — so it must stay lowercase (unless the locale capitalises mid-sentence) and must not end in a full stop. It states what the parser found, not what the user did wrong: nothing was typed. Do not turn it into an instruction ("enter an amount"); the surrounding sentence already does that job.
  ///
  /// In en, this message translates to:
  /// **'no amount given'**
  String get moneyErrorEmpty;

  /// Sentence fragment inside reviewAmountError — lowercase, no full stop. "Plain number" means digits with at most one decimal point and optional thousands grouping: no currency symbol, no trailing text, no parenthesised negative. Keep it a statement about the shape of what was typed, not a claim that the amount itself is wrong.
  ///
  /// In en, this message translates to:
  /// **'the amount is not a plain number'**
  String get moneyErrorMalformed;

  /// Sentence fragment inside reviewAmountError — lowercase, no full stop. Two ideas, both needed: the amount is negative, and a sum to pay cannot be. Do not shorten to "invalid amount", which loses the reason the reader needs to fix it.
  ///
  /// In en, this message translates to:
  /// **'a negative amount is not a payable sum'**
  String get moneyErrorNegative;

  /// Sentence fragment inside reviewAmountError — lowercase, no full stop. The number of minor-unit digits is a property of the currency, not a formatting preference: JPY has none, BHD and KWD have three, most have two. Keep it about the currency, not about "too many digits".
  ///
  /// In en, this message translates to:
  /// **'more decimal places than the currency has'**
  String get moneyErrorTooManyDecimals;

  /// SAFETY: sentence fragment inside reviewAmountError — lowercase, no full stop. It is an admission about this app, not a verdict on the currency: Action accepts an allowlist of ISO-4217 codes, and an unrecognised code usually means a symbol was misread. It must not become "that currency does not exist" or "unsupported currency", both of which assert something about the world rather than about what this build can check. Keep the first person plural or the locale's neutral equivalent.
  ///
  /// In en, this message translates to:
  /// **'the currency code is not one we recognise'**
  String get moneyErrorUnsupportedCurrency;

  /// Sentence fragment inside reviewAmountError — lowercase, no full stop. "Implausibly" is the load-bearing word: beyond the cap the digits are almost certainly a misread reference number rather than a sum of money. Keep the hedge; "the amount is too large" reads as a limit the user has hit rather than as a suspected misreading.
  ///
  /// In en, this message translates to:
  /// **'the amount is implausibly large'**
  String get moneyErrorOutOfRange;

  /// SAFETY: shown on the review screen inside reviewSignalNotice, above values the user is about to confirm. It reports that text recognition did not run — an absolute negative about a check that never happened, not a check that ran and found nothing (that is escalationNoTextRecognised, and the two must stay distinguishable). "At all" must survive as the intensifier that makes it unambiguous. Never soften into "had trouble reading".
  ///
  /// In en, this message translates to:
  /// **'Recognition could not run on this capture at all.'**
  String get escalationOcrFailed;

  /// SAFETY: both clauses are required and they are in tension on purpose — the image has the shape of a document, and recognition still returned nothing. Keep it a statement about what recognition produced, never about whether the document contains text; Action does not know that. Distinct from escalationOcrFailed, where recognition never ran.
  ///
  /// In en, this message translates to:
  /// **'This looks like a document, but no text was recognised.'**
  String get escalationNoTextRecognised;

  /// SAFETY: a statement about the gap between how much was read and how much the image implies is there — so the reader knows values may be missing rather than absent. Keep both halves: the shortfall, and that it is judged against the size of the document. Do not turn it into a quality verdict on the photo.
  ///
  /// In en, this message translates to:
  /// **'Far too little text was recognised for a document this size.'**
  String get escalationThinText;

  /// SAFETY: a certainty claim, and the subject matters — the recogniser is reporting on itself, Action is not judging the result. Keep "reported": a translation that says "several lines are unclear" turns the engine's own hedge into Action's finding about the document. "Low confidence" is the OCR engine's term; use whatever this locale uses for a recogniser's confidence score.
  ///
  /// In en, this message translates to:
  /// **'The recogniser reported low confidence on several lines.'**
  String get escalationLowLineConfidence;

  /// SAFETY: names a specific, concrete failure mode — line-by-line reading breaks the row/column relationship, so an amount can end up beside the wrong label. Both halves are mandatory: what the layout appears to be, and what is lost by reading it this way. It must stay a statement that information WAS lost, not that it might be imperfect. Related to reviewLayoutNotice, which the review screen shows instead for this signal; keep the two consistent in vocabulary but do not merge them.
  ///
  /// In en, this message translates to:
  /// **'The layout looks like a table, and reading it line by line loses which value belongs to which row.'**
  String get escalationTableLikeLayout;

  /// SAFETY: says the structure could not be established — the words arrived, the relationships between them did not. Keep the causal link between the fragmentation and the unclear structure; dropping the second clause leaves a technical observation with no consequence attached.
  ///
  /// In en, this message translates to:
  /// **'The text came back as many tiny fragments, so the structure is unclear.'**
  String get escalationFragmentedLayout;

  /// SAFETY: a statement about the output of recognition, not about the document. "Much of" is a quantifier the reader needs — it distinguishes a partly garbled read from a total failure. Do not turn it into "the document is unreadable".
  ///
  /// In en, this message translates to:
  /// **'Much of the recognised text is not readable words or numbers.'**
  String get escalationMalformedText;

  /// SAFETY: the whole point is that Action did NOT pick one. It reports an unresolved conflict in the document, and the review screen then asks the user to choose. Keep it neutral between the candidates; anything implying Action selected, preferred or guessed a date is wrong. "Presented as" belongs to the document, not to Action.
  ///
  /// In en, this message translates to:
  /// **'More than one date is presented as a deadline.'**
  String get escalationConflictingDates;

  /// SAFETY: as escalationConflictingDates, for money. Action did not choose; the user will. Keep "presented as" attached to the document and keep "the sum due" specific — the conflict is between amounts each claiming to be what is owed, not between any two numbers on the page.
  ///
  /// In en, this message translates to:
  /// **'More than one amount is presented as the sum due.'**
  String get escalationConflictingAmounts;

  /// SAFETY: the grounding admission, and the sharpest sentence in this group. It says some extracted values have no passage behind them — the app could not find where they came from. It must stay a statement about what Action could not establish, never "some values may be wrong" (a claim about the values) and never "some values are unverified" if that reads in this locale as a check that is merely pending. Use the same vocabulary as reviewCouldNotVerify and evidenceNoRegion for tracing a value back to the source text.
  ///
  /// In en, this message translates to:
  /// **'Some values could not be traced back to the document text.'**
  String get escalationUnresolvedGrounding;

  /// SAFETY: the prompt-injection disclosure. Two sentences, both mandatory: (1) the document contains text shaped like instructions to Action, and (2) it is handled as content and never obeyed. Clause (2) must stay an absolute negative — "never as instructions" — and must not soften into "should not be followed", "is usually ignored" or "has been sanitised". Nothing was cleaned or removed; it was read as ordinary document text. Keep it consistent with reviewInjectionNotice, which makes the same promise in the review screen's own words.
  ///
  /// In en, this message translates to:
  /// **'The document contains text written as if it were instructions to the app. It is treated as document content, never as instructions.'**
  String get escalationInstructionLikeContent;

  /// Shown when the extraction request never left the device or never got an answer. Two parts: what failed, and the one thing the user can do about it. "Action" is the product name and is not translated. "The service" is deliberately unnamed — do not substitute a provider's trademark.
  ///
  /// In en, this message translates to:
  /// **'Action could not reach the service. Check your connection.'**
  String get providerFailureNetwork;

  /// The request was sent but no answer arrived inside the timeout. Keep the subject as the service; it did not fail, it was slow. Do not add "try again" — the screen already offers a retry button.
  ///
  /// In en, this message translates to:
  /// **'The service took too long to answer.'**
  String get providerFailureTimedOut;

  /// One string for two failures that are indistinguishable to the reader: a quota or rate limit, and the service being down. "Temporarily" must survive — it is what tells the user this is worth retrying rather than a setting they need to change. Deliberately says nothing about quotas or billing: the user does not hold this key and cannot act on that.
  ///
  /// In en, this message translates to:
  /// **'The service is temporarily unavailable. Try again later.'**
  String get providerFailureServiceUnavailable;

  /// SAFETY: the subject is the app, never the user. The credential belongs to this build, so a translation that reads "you are not authorised" or "your account has no access" blames the reader for something they neither configured nor can fix. Keep "right now", which leaves it a current state rather than a permanent verdict.
  ///
  /// In en, this message translates to:
  /// **'This app is not authorised to use the service right now.'**
  String get providerFailureUnauthorized;

  /// SAFETY: the provider's safety filter refused the request. Keep the service as the subject and "declined" as its act — Action did not refuse, and Action makes no judgement about the document. It must not become "this document is not allowed", "unsafe content" or anything characterising what the user captured.
  ///
  /// In en, this message translates to:
  /// **'The service declined to process this document.'**
  String get providerFailureBlocked;

  /// SAFETY: the catch-all, and it still has to be honest twice over. (1) It states what Action could not do — read this document — rather than "something went wrong", which tells a person nothing. (2) "May work" stays a hedge; the cause is unknown, so a promise that a retry will succeed is a claim Action cannot support. "Action" is the product name and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Action could not read this document. Trying again may work.'**
  String get providerFailureUnknown;

  /// Sits under the disabled confirm button and is also read out in a snackbar when the button is pressed. An imperative naming the one thing to do. Here "action" is the translated domain noun (the ordinary word for a task), never the Latin brand name "Action".
  ///
  /// In en, this message translates to:
  /// **'Give this action a title.'**
  String get reviewBlockerTitle;

  /// SAFETY: shown when the document offers several candidate dates and Action has not picked one. Both options must survive — choose, or explicitly leave it unset — because "unset" is a reviewed absence rather than a gap, and offering only the first option pushes the user into inventing a deadline. "The real deadline" implies exactly one of the candidates is right; do not weaken it to "a deadline".
  ///
  /// In en, this message translates to:
  /// **'Choose which date is the real deadline, or leave it unset.'**
  String get reviewBlockerDate;

  /// SAFETY: as reviewBlockerDate, for money. Both branches are required: pick the correct amount, or record that there is none. Never phrase it so that leaving it unset reads as skipping or postponing the decision.
  ///
  /// In en, this message translates to:
  /// **'Choose which amount is right, or leave it unset.'**
  String get reviewBlockerAmount;

  /// Shown when a step the user chose to keep has an empty title. "You keep" is doing real work: skipped steps are exempt, so the sentence must stay scoped to the ones being kept rather than reading as "every step needs a title".
  ///
  /// In en, this message translates to:
  /// **'Steps you keep need a title.'**
  String get reviewBlockerStepTitle;

  /// SAFETY: a provenance label on an evidence chip — where in the document a quotation was found. The page number must stay bound to {page} and must never be dropped, rounded or offset: it is 1-indexed to match what the reader sees in a PDF viewer, and a citation pointing at the wrong page is worse than one pointing nowhere. A plural because the noun inflects with the number in Russian, Polish and Arabic even though English has one form here; write every form your locale requires. Lowercase in English because it usually follows a document name and a comma (see resultEvidenceLocation) — capitalise only if your locale demands it.
  ///
  /// In en, this message translates to:
  /// **'{page, plural, =1{page 1} other{page {page}}}'**
  String citationPage(int page);

  /// SAFETY: as citationPage, for a quotation spanning several pages. Both numbers are provenance and both must survive, in this order and unaltered. The dash is an en dash (U+2013) and is the range mark, not a hyphen — use whatever range mark this locale writes, and note that Arabic and CJK conventions differ. Do not convert the range into a count ("3 pages"): the reader needs to know which pages to open.
  ///
  /// In en, this message translates to:
  /// **'pages {start}–{end}'**
  String citationPageRange(int start, int end);

  /// SAFETY: the caution shown above a rewritten or translated result when Action's own local check found that an amount, date or reference number in the original is not present in the output. This is a finding, not a hedge — the check ran and it failed. Three things must survive: (1) the values are named and are gone from the rewrite, (2) the instruction to check before using it, and (3) the fact that this is about the rewrite, not about the original. It must never soften into "some details may have changed" or "please review", and it must never harden into a claim that the rewrite is wrong — Action knows a value is absent, not what the model meant to do. Keep it distinct from toolWarningFactsNotChecked, which says the comparison could not be made at all. {values} is a list of the user's own amounts and references joined with listSeparator and is never translated; up to four are named and the rest are summarised by rewriteDroppedFactsMore. The two plural forms are identical in English because the sentence's verb agrees with "the rewrite", not with the list — if your locale phrases this so that the list is the subject, write the forms it needs.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{The rewrite no longer contains {values}. Check it before using this.} other{The rewrite no longer contains {values}. Check it before using this.}}'**
  String rewriteDroppedFacts(int count, String values);

  /// SAFETY: rewriteDroppedFacts when more than four facts were dropped — read that key's note first; every clause there is mandatory here too. {count} is how many further values are NOT named, never the total: "and 3 more" after four listed values means seven were dropped. Getting that wrong understates a safety finding, so keep the number bound to {count} and keep it clearly additive to the list. {values} holds the four named values, joined with listSeparator, and is never translated.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{The rewrite no longer contains {values} and 1 more. Check it before using this.} other{The rewrite no longer contains {values} and {count} more. Check it before using this.}}'**
  String rewriteDroppedFactsMore(int count, String values);

  /// Joins items in a short inline list built in code — currently the dropped values in rewriteDroppedFacts. Punctuation only, and a real choice rather than a constant: Arabic writes "، " and Chinese and Japanese write "、" with no following space. Include the trailing space if and only if your locale's separator takes one. Not a sentence — do not add a word for "and".
  ///
  /// In en, this message translates to:
  /// **', '**
  String get listSeparator;

  /// SAFETY: the label for the Goal state the user marked themselves. Three claims must survive translation. (1) It names a state the person declared, never a verdict Action computed, measured or verified — nothing infers it from how many linked Actions are done, and it must not become praise, a score or a percentage. (2) It must stay a different word from the Action lifecycle vocabulary (commonDone "Done", searchFilterCompleted "Completed", librarySegmentDone), because a goal the user marked reached and a task the user finished are different claims and merging them re-imports the completion inference this product declined. (3) It must stay visibly distinct from the other two Goal states, searchFilterActive and detailArchived. Stored sentence case and uppercased for the workspace hero eyebrow by eyebrowCase(), so do not supply it in capitals.
  ///
  /// In en, this message translates to:
  /// **'Reached'**
  String get goalStatusReached;

  /// Title of the sheet for writing a new Goal, asked as a question. Near-duplicate but deliberately separate from libraryNoGoalsMessage, which defines a goal in the indicative ('A goal is something you want to happen.'); the empty state and this sheet sit one tap apart, so both should use the same verb for 'happen' in a locale. Rendered on one line in headlineSmall with no ellipsis, so a long translation wraps rather than truncates.
  ///
  /// In en, this message translates to:
  /// **'What do you want to happen?'**
  String get goalNewSheetTitle;

  /// Subtitle under goalNewSheetTitle. Two clauses and both must survive: permission to be brief, and the promise that detail can be added later. Dropping the second sentence leaves the user believing this single field is their only chance to describe the goal, which is the anxiety the copy exists to remove.
  ///
  /// In en, this message translates to:
  /// **'One sentence is enough. You can add the details after.'**
  String get goalNewSheetSubtitle;

  /// Placeholder example of a goal title. Serves two call sites: the new-goal sheet and the sheet for editing an existing goal's title. Translatable example content, like the searchField*Example keys: adapt it to a locally plausible errand rather than transliterating 'car insurance' where that is not a household concern. Not the same string as searchFieldTitlesExample ('Renew the car insurance'), which is a search example and has no full stop; keep them separate.
  ///
  /// In en, this message translates to:
  /// **'Renew the car insurance without overpaying.'**
  String get goalTitleHint;

  /// Commit button of the new-goal sheet; disabled until the field has text, so there is deliberately no validation message. Must stay a verb phrase and must not be collapsed into libraryNewGoal ('New goal'), which is the entry point that opens this sheet. 'Goal' is glossary term #4 and takes each locale's fixed translation from LOCALIZATION_GLOSSARY.md.
  ///
  /// In en, this message translates to:
  /// **'Create goal'**
  String get goalCreateAction;

  /// Title of the sheet for editing a Goal's title. The same phrase is rendered as the eyebrow label above that field on the Goal workspace, so it must not be translated two different ways; store it in sentence case and let eyebrowCase() do the uppercasing at the label site.
  ///
  /// In en, this message translates to:
  /// **'What you want'**
  String get goalTitleSheetTitle;

  /// Title of the sheet for editing a Goal's outcome. The same phrase is the eyebrow label above that field on the Goal workspace; store it in sentence case and let eyebrowCase() uppercase it there. In scripts with no case the eyebrow style carries on size, weight and tracking instead, which is expected rather than a missing feature.
  ///
  /// In en, this message translates to:
  /// **'What done looks like'**
  String get goalOutcomeSheetTitle;

  /// Title of the sheet for editing a Goal's context. Same arrangement as goalOutcomeSheetTitle: one sentence-case key, uppercased by eyebrowCase() where it is used as the field label, so the sheet title and the label cannot diverge.
  ///
  /// In en, this message translates to:
  /// **'Where it stands'**
  String get goalContextSheetTitle;

  /// Placeholder example under 'What done looks like'. Translatable example content: adapt the errand to something locally plausible, but keep the completed, resultative aspect, because the sentence is modelling a finished state rather than a thing to do.
  ///
  /// In en, this message translates to:
  /// **'The car is insured and the paperwork is filed.'**
  String get goalOutcomeHint;

  /// Placeholder example under 'Where it stands'. Translatable example content, and it is prose: 'the 18th' is an English ordinal date written out, not a DateFormat pattern and not a placeholder, so render a natural local date expression or drop the ordinal. The ' and ' joining the two clauses is part of the sentence and is translated with it, not concatenated in code.
  ///
  /// In en, this message translates to:
  /// **'I have two quotes and the renewal is on the 18th.'**
  String get goalContextHint;

  /// App bar title of the single-Goal workspace. The domain noun, translated in every locale - not the brand name Action. Singular: it names one goal on screen, so do not reuse the plural of librarySegmentGoals in the languages that case-mark.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goalWorkspaceTitle;

  /// SAFETY: the user retracting their OWN mark. Two clauses must survive: it is about the mark, and the retraction is the user's. It must not become anything implying Action determined the goal was not met - reaching a goal is never inferred from the Actions linked to it. Must also stay visibly different from goalMarkReached; the two are the opposite halves of one menu item.
  ///
  /// In en, this message translates to:
  /// **'Not reached after all'**
  String get goalUnmarkReached;

  /// SAFETY: the verb attributes the judgement to the user. Keep a verb of marking - it must not become 'Goal reached' or 'Complete goal', which read as Action asserting the outcome, a claim the app has no basis for. Do not translate it with the word used for commonDone or librarySegmentDone: 'done' is the Action lifecycle, 'reached' is the Goal one, and merging them re-imports the completion inference this product declined.
  ///
  /// In en, this message translates to:
  /// **'Mark as reached'**
  String get goalMarkReached;

  /// SAFETY: a statement of absence, not of deletion. The screen only knows the goal was not returned, so it must not become 'This goal was deleted' or 'has been removed' - asserting a cause is a claim the app cannot support. Keep it parallel with detailNotFoundTitle ('That action is no longer here') so the two read as one product.
  ///
  /// In en, this message translates to:
  /// **'That goal is no longer here.'**
  String get goalNotFound;

  /// Confirmation dialog title. Keep it an interrogative in every locale, like sourceDeleteTitle and detailArchiveTitle, so it reads as a decision point rather than as a completed act.
  ///
  /// In en, this message translates to:
  /// **'Delete this goal?'**
  String get goalDeleteTitle;

  /// SAFETY: two claims and both are required - the deletion is scoped to this device, and the Actions produced from the goal are untouched. Dropping the second turns a scoped delete into an apparent cascade, and this is the sentence someone reads before deciding. Align the second sentence with privacyClearCapturesBody and detailArchiveBody. 'Actions' here is the domain noun in the plural and IS translated; do not leave it in Latin script.
  ///
  /// In en, this message translates to:
  /// **'The goal is removed from this device. Any Actions made from it stay exactly as they are.'**
  String get goalDeleteBody;

  /// The 'outcome' field. One key, two render sites: the eyebrow above the field, uppercased at render by eyebrowCase(), and the heading of the sheet that edits it. Store it sentence case - never uppercase - because Dart's toUpperCase maps Turkish dotted i wrong and is a no-op in scripts that have no case.
  ///
  /// In en, this message translates to:
  /// **'What done looks like'**
  String get goalOutcomeLabel;

  /// Shown in place of the outcome when the field is empty. The second sentence is the reason to write one - keep it as the invitation, not as a complaint that the field is blank.
  ///
  /// In en, this message translates to:
  /// **'Not written yet. A goal is easier to plan when you have said what finishing it means.'**
  String get goalOutcomeEmpty;

  /// The 'context' field. One key, two render sites: the eyebrow above the field, uppercased at render by eyebrowCase(), and the heading of the sheet that edits it. Store it sentence case, never uppercase.
  ///
  /// In en, this message translates to:
  /// **'Where it stands'**
  String get goalContextLabel;

  /// Shown in place of the context when the field is empty. The second sentence is a fragment naming what to write, not a question - do not turn it into one.
  ///
  /// In en, this message translates to:
  /// **'Nothing written yet. What has happened so far, and what is in the way.'**
  String get goalContextEmpty;

  /// The goal's own title. One key, two render sites: the eyebrow on the hero, uppercased at render by eyebrowCase(), and the heading of the sheet that edits it. Store it sentence case. Must stay distinct from goalStatusReached, which replaces it once the goal is marked reached.
  ///
  /// In en, this message translates to:
  /// **'What you want'**
  String get goalTitleLabel;

  /// Accessible name of the pencil beside the goal title - the only name a screen reader gets for it. Keep it a verb phrase naming the object: a bare 'Edit' would be indistinguishable from the two field buttons further down the same screen.
  ///
  /// In en, this message translates to:
  /// **'Edit goal'**
  String get goalEditTooltip;

  /// SAFETY: `Action` is the product name and stays in Latin script, unchanged, in every locale. It names the tools that are available, not an outcome - it must not drift into a promise such as 'What Action will do for you'. Stored sentence case; uppercased at render by eyebrowCase().
  ///
  /// In en, this message translates to:
  /// **'What Action can do'**
  String get goalToolsLabel;

  /// SAFETY: states the limit of what the planning tools can do with too little input. It must stay 'the tools need more to work with' - never a promise about the quality of what they will return once more is written, and never an implication that Action has already read and assessed the goal. 'these' refers to the tool buttons that are hidden in this state; a locale that needs an explicit antecedent may name them.
  ///
  /// In en, this message translates to:
  /// **'Write a little more about what you want, and these will have something to work with.'**
  String get goalToolsNotReady;

  /// Name of the goal-optimizer tool, shown on its chip in the Goal workspace and on its card in the Studio. Keep it a verb phrase; do not use 'optimize' or other machine-improvement wording. Must match the wording used for this tool inside studioConnectedBlurb.
  ///
  /// In en, this message translates to:
  /// **'Improve a goal'**
  String get toolGoalOptimizerTitle;

  /// Name of the action-plan tool, shown on its chip in the Goal workspace and on its card in the Studio. Keep it a verb phrase. Must match the wording used for this tool inside studioConnectedBlurb.
  ///
  /// In en, this message translates to:
  /// **'Build a plan'**
  String get toolActionPlanTitle;

  /// SAFETY: the screen-reader label on the uncertainty glyph beside a fact. It is the only signal a blind user gets that this value could not be grounded in the source, so it must stay a negation of confirmation. It must never share a word with reviewConfirmed ('Confirmed'), and must never be softened into 'probably right' or 'unverified' — 'verify' is reserved for a check that actually ran against the source.
  ///
  /// In en, this message translates to:
  /// **'Unconfirmed'**
  String get resultFactUnconfirmed;

  /// SAFETY: heading above unticked checkboxes. 'Suggested' must survive — these are proposals, not steps already added to an Action, and nothing here is saved until the user ticks and confirms.
  ///
  /// In en, this message translates to:
  /// **'Suggested steps'**
  String get resultSuggestedSteps;

  /// SAFETY: heading above an unticked checkbox that would create a real Action. 'Suggested' must survive, or an unsaved proposal reads as an existing item. Here 'action' is the translated domain noun (the ordinary word for a task), never the Latin brand name 'Action'.
  ///
  /// In en, this message translates to:
  /// **'Suggested action'**
  String get resultSuggestedAction;

  /// SAFETY: heading over gaps the tool could not resolve — questions for the user to put to someone else. Keep it open-ended; 'Questions' is fine, anything that reads as answers, findings or things Action established is wrong.
  ///
  /// In en, this message translates to:
  /// **'Worth asking'**
  String get resultWorthAsking;

  /// SAFETY: nothing here is scheduled. A due date is only ever proposed when the source stated one, and no reminder exists until the user ticks and saves. 'Suggested' and the plain word for a deadline must both survive — never 'Reminders set' or 'Your deadlines'. Use the glossary's Deadline term, not the Reminder term: a reminder is a notification the user set, a deadline is when something is due.
  ///
  /// In en, this message translates to:
  /// **'Suggested deadlines'**
  String get resultSuggestedDeadlines;

  /// SAFETY: the generic heading used when a result mixes suggestion kinds — it may sit above a deadline and a whole Action at once. It still has to carry the 'proposal, not fact' framing; a bare noun meaning 'results' or 'findings' is a defect.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get resultSuggestions;

  /// SAFETY: the grounding headline for a whole result — it claims quoted evidence exists and how much of it. It must not become 'verified', 'proof', 'sources' or 'confirmed': the quotes support the reading, they do not prove it. The number must stay bound to {count}. Use the same Evidence vocabulary as evidenceTitle ('Where this came from') plus the word for a quotation; do not invent a second word for evidence here.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 supporting quote} other{{count} supporting quotes}}'**
  String resultSupportingQuotes(int count);

  /// SAFETY: a provenance claim shown in the confirmed-evidence colour when a quote has neither a document label nor a page. It must stay vague about location — the source the user picked — and must never name a specific document or imply the location was checked.
  ///
  /// In en, this message translates to:
  /// **'From the selected source'**
  String get resultEvidenceFromSelectedSource;

  /// Joins a document label to a page label on an evidence chip — 'Renewal notice, page 3'. Only the separator is translatable, and it is a real choice: Arabic uses '، ' and Chinese and Japanese '、'. Do not reorder unless the locale genuinely reads the page first.
  ///
  /// In en, this message translates to:
  /// **'{source}, {page}'**
  String resultEvidenceLocation(String source, String page);

  /// First named stage of a tool run, shown beside a spinner while Action assembles the request on the device. Nothing has been sent yet at this point, so the verb must stay preparatory — a locale rendering it as 'Sending' or 'Uploading' would place the send one step earlier than it happens. 'your document' is the user's own capture, singular even when several are selected, because this stage is about the request being built rather than about a count.
  ///
  /// In en, this message translates to:
  /// **'Preparing your document'**
  String get toolRunStagePreparing;

  /// SAFETY: the stage shown while a run that carries an attached document is in flight. 'the selected pages' is a scope claim and must survive: only the pages the user chose are being read, never the whole library, the whole file set, or anything Action holds. A locale that generalises this to 'Reading your documents', 'Reading your files' or just 'Reading' widens the stated scope of what was sent. Reused as a stage label only; must stay distinct from stageReading ('Reading'), which is the capture pipeline's OCR status on a card.
  ///
  /// In en, this message translates to:
  /// **'Reading the selected pages'**
  String get toolRunStageReading;

  /// The stage shown while the provider is working. One word, beside a spinner and a Stop button, so it must stay short enough not to push the Stop button off a narrow row. Deliberately neutral: it names the work, not a result, and must not become 'Thinking' or anything that ascribes a mental state to a model.
  ///
  /// In en, this message translates to:
  /// **'Analysing'**
  String get toolRunStageAnalysing;

  /// The last stage before a result appears: the reply has arrived and Action is validating and laying it out on the device. 'your review' is the thing the user is about to be shown for checking — it is the noun this product uses for a result the user reads and confirms, not a finished document, and must not become 'your report' or 'your answer'.
  ///
  /// In en, this message translates to:
  /// **'Building your review'**
  String get toolRunStageBuilding;

  /// Status word for a run that finished, in the stage line rather than on a control. Deliberately separate from commonDone, which is the button a person presses to dismiss a sheet: several of the twenty languages use a finished-state adjective here and an imperative there, and sharing one key would force one of the two to be wrong.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get toolRunStageDone;

  /// Status word for a run that stopped without a result. Keep the register calm and factual: it reports that no result exists, and must not become an apology, an error code, or a claim about whose fault it was — the failure's own sentence, shown underneath, is where the reason is stated. No full stop, matching the other stage labels.
  ///
  /// In en, this message translates to:
  /// **'That didn\'t finish'**
  String get toolRunStageFailed;

  /// Status word for a run the user stopped themselves. Must read as the user's own action rather than something that happened to them. Related but distinct from two neighbours: toolRunStop is the button ('Stop', an imperative) that produces this state, and aiFailureCancelled ('Stopped.') is the failure sentence with its full stop — this one is a bare status word with none.
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get toolRunStageCancelled;

  /// SAFETY: shown when one of the two tools that run entirely on the device — no provider, no network, no key — throws while checking. The claim is that the check did not complete, so nothing was established either way. It must not harden into a verdict ('That is wrong', 'Nothing was found'), because a failed check found nothing and disproved nothing; and it must not soften into 'That looks fine' or a passive success. Must stay distinct from aiFailureUnknown, which is about a provider call: this failure happened with nothing sent anywhere.
  ///
  /// In en, this message translates to:
  /// **'That couldn\'t be checked.'**
  String get toolRunFailureLocalCheckFailed;

  /// Shown when a stored configuration names a provider family this build no longer ships an adapter for. The cause is Action's own version, not the user's key, their account or the provider's service — a locale implying the provider itself has shut down or has rejected them sends the user to check an account that is fine. Must stay distinct from aiFailureNotConfigured (nothing connected at all) and aiFailureUnsupportedModel (the key is fine, the model id is not).
  ///
  /// In en, this message translates to:
  /// **'That AI provider is no longer available in this version.'**
  String get toolRunFailureProviderRetired;

  /// SAFETY: shown when a provider's reply arrived but did not match the contract, so Action refused to render any of it. The mandatory claim is that nothing usable came back — the whole reply was discarded. A locale that softens this into 'part of the reply could not be shown', 'the formatting was unexpected' or 'some details may be missing' implies a partial result is on screen, which is precisely the half-valid extracted data this refusal exists to prevent. 'Try again' must stay, because a retry genuinely can succeed. Must stay distinct from aiFailureMalformedResponse, which is the adapter's own wording for the same family of fault.
  ///
  /// In en, this message translates to:
  /// **'That reply did not come back in a usable form. Try again.'**
  String get toolRunFailureUnusableReply;

  /// Shown when a tool that answers questions is run with the question field empty. An instruction, not a complaint: it names the one thing the person has to do next. Caught on the device before anything is sent, so it must not read as a provider rejection. Must stay distinct from toolRunFailureInputRequired, which is the same moment for the material rather than the question.
  ///
  /// In en, this message translates to:
  /// **'Type a question first.'**
  String get toolRunFailureQuestionRequired;

  /// Shown when a tool is run with nothing selected. An instruction pointing at the picker above it. 'something' is deliberately vague because the acceptable input differs per tool — a capture, a document, an Action or a Goal — so it must not be narrowed to 'a document' or 'a capture' in translation. Caught on the device before anything is sent. Must stay distinct from toolRunFailureQuestionRequired.
  ///
  /// In en, this message translates to:
  /// **'Choose something for this tool to work on.'**
  String get toolRunFailureInputRequired;

  /// SAFETY: the caution banner above a result the provider stopped mid-answer because it hit the output limit. Two clauses, both mandatory: (1) the reply was cut short — it ended early, it did not finish — and (2) what is shown may therefore be incomplete. Dropping clause (2) leaves a partial answer reading as a whole one, which is the specific outcome this banner exists to prevent; dropping clause (1) removes the reason and leaves a vague hedge. Must not harden into a claim that the result is wrong, and must not soften into 'this reply is a summary' or 'shortened for readability' — nothing was summarised, the text simply stops. Must stay distinct from toolWarningNoSupportingQuotes, which is about evidence rather than length.
  ///
  /// In en, this message translates to:
  /// **'This reply was cut short, so it may be incomplete.'**
  String get toolWarningReplyTruncated;

  /// SAFETY: the caution banner above a result from a tool that was supposed to cite the user's document and cited nothing at all. Three clauses, each mandatory: (1) the model returned no supporting quotes, (2) consequently nothing shown is evidenced — the scope is everything on screen, not merely some of it, and (3) the user must check it against the document before acting on it. Dropping clause (2) or narrowing it to 'some claims' lets unevidenced output read as grounded; dropping clause (3) removes the only instruction the user can act on. The register stays a limit on what can be relied upon, never a verdict that the result is false — Action found no quotes, it did not find an error. 'Your model' names the model the user connected, keeping responsibility where it sits. Must stay distinct from toolWarningEvidenceNotFound (quotes were returned and a check failed to find them in the material) and from toolWarningEvidenceUnverifiable (quotes were returned but no check could run); this one is the case where no quotes came back at all.
  ///
  /// In en, this message translates to:
  /// **'Your model returned no supporting quotes, so nothing here is evidenced. Check it against the document before acting on it.'**
  String get toolWarningNoSupportingQuotes;

  /// SAFETY: The object of the removal is the connection, not the provider account; a translation that says "delete your account" or "remove your provider" misstates what the button does.
  ///
  /// In en, this message translates to:
  /// **'Remove this connection?'**
  String get aiSettingsRemoveTitle;

  /// SAFETY: Three claims and all three are enforced in AiProviderConfigController.disconnect(): the key is deleted from secure storage, AI features stop, and nothing happens to the account at the provider. A translation that stops after the first sentence turns a reassurance into an unanswered worry about billing.
  ///
  /// In en, this message translates to:
  /// **'Action will delete your API key from this device and stop using AI features. Your provider account is not affected.'**
  String get aiSettingsRemoveBody;

  /// No description provided for @aiSettingsProviderLabel.
  ///
  /// In en, this message translates to:
  /// **'Provider'**
  String get aiSettingsProviderLabel;

  /// SAFETY: Two independent claims: who charges (the user's provider, never Action) and that no request is ever issued as a side effect of the app running. Both are load-bearing; the second is the whole T9 position in intelligence_providers.dart.
  ///
  /// In en, this message translates to:
  /// **'You are billed by your provider for what you use. Action never makes a request on its own.'**
  String get aiSettingsProviderFootnoteConnected;

  /// No description provided for @aiSettingsConnectLabel.
  ///
  /// In en, this message translates to:
  /// **'Connect an AI provider'**
  String get aiSettingsConnectLabel;

  /// SAFETY: It states the BYOK arrangement — the user's own account and own key, not an Action-provided service — which is the claim the whole billing and privacy story rests on.
  ///
  /// In en, this message translates to:
  /// **'Use your own account and API key with OpenAI, Anthropic, Google Gemini, or a compatible endpoint.'**
  String get aiSettingsConnectDescription;

  /// No description provided for @aiSettingsModelLabel.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get aiSettingsModelLabel;

  /// No description provided for @aiSettingsEndpointLabel.
  ///
  /// In en, this message translates to:
  /// **'Endpoint'**
  String get aiSettingsEndpointLabel;

  /// No description provided for @aiSettingsApiKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'API key'**
  String get aiSettingsApiKeyLabel;

  /// SAFETY: This is the screen's only statement about where the secret lives, and it must describe a mechanism rather than promise safety: secure storage is a real but not absolute obstacle, and no locale may render it as "safely stored", "protected", "encrypted" or "nobody can read it".
  ///
  /// In en, this message translates to:
  /// **'Stored in this device’s secure storage.'**
  String get aiSettingsKeyStored;

  /// SAFETY: It reports that the secret is absent even though the provider config survived — the state where a restore brought back the preference but not the credential — and it must not read as a transient error or as "still connected"; the remedy sentence travels with it.
  ///
  /// In en, this message translates to:
  /// **'No key found on this device. Connect again to add one.'**
  String get aiSettingsKeyMissing;

  /// No description provided for @aiSettingsTestLabel.
  ///
  /// In en, this message translates to:
  /// **'Test connection'**
  String get aiSettingsTestLabel;

  /// SAFETY: A plain statement of a missing capability in THIS build; it must not soften into "not yet supported" or "coming soon", which promises a date nobody has committed to (same rule the ARB already applies to ocrScriptUnreadableTitle).
  ///
  /// In en, this message translates to:
  /// **'That provider is not available in this version.'**
  String get aiSettingsProviderUnavailable;

  /// SAFETY: A success claim about a live credential and endpoint. It must stay "connected" — the state the request actually proved — and never become "verified", "secure" or "your key is safe"; the zero-model case must not be reported as a richer success than it was.
  ///
  /// In en, this message translates to:
  /// **'Connected. {count} models available.'**
  String aiSettingsTestConnectedModels(int count);

  /// No description provided for @aiSettingsTestButton.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get aiSettingsTestButton;

  /// No description provided for @aiSettingsChangeProvider.
  ///
  /// In en, this message translates to:
  /// **'Change provider or model'**
  String get aiSettingsChangeProvider;

  /// SAFETY: It names the object that is destroyed — the key, not the account and not the app's data — and it is the only warning before the dialog at line 55; a vaguer label ("Disconnect", "Reset") would hide that a stored secret is deleted.
  ///
  /// In en, this message translates to:
  /// **'Remove key'**
  String get aiSettingsRemoveKey;

  /// No description provided for @aiSettingsSectionPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get aiSettingsSectionPrivacy;

  /// No description provided for @aiSettingsWhatGetsSentLabel.
  ///
  /// In en, this message translates to:
  /// **'What gets sent'**
  String get aiSettingsWhatGetsSentLabel;

  /// No description provided for @aiSettingsWhereItGoesLabel.
  ///
  /// In en, this message translates to:
  /// **'Where it goes'**
  String get aiSettingsWhereItGoesLabel;

  /// SAFETY: A statement about the present state conditional on nothing being connected, not a general promise that nothing is ever sent; the "until you connect a provider" clause is what keeps it honest and is exactly what a shortened translation drops.
  ///
  /// In en, this message translates to:
  /// **'Nothing is sent until you connect a provider.'**
  String get aiSettingsWhereItGoesNoProvider;

  /// SAFETY: The second sentence is the claim that matters — no Action-operated server is in the path — and it is the one a shortened translation drops; the first sentence's "using your key" is the BYOK claim.
  ///
  /// In en, this message translates to:
  /// **'Directly to {provider}, using your key. It does not pass through Action’s servers.'**
  String aiSettingsWhereItGoesProvider(String provider);

  /// No description provided for @aiSettingsSectionData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get aiSettingsSectionData;

  /// SAFETY: Two halves and the second is the entire point: tool ids are stored, the content they were pointed at is not. A translation that keeps only "Action remembers which tools you used" reads as a usage log of what the user reads.
  ///
  /// In en, this message translates to:
  /// **'Action remembers which tools you used, never what you used them on.'**
  String get aiSettingsDataFootnote;

  /// No description provided for @aiSettingsRecentToolsLabel.
  ///
  /// In en, this message translates to:
  /// **'Recently used tools'**
  String get aiSettingsRecentToolsLabel;

  /// No description provided for @aiSettingsRecentToolsNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get aiSettingsRecentToolsNone;

  /// SAFETY: the title line of every reminder Action posts, and the line that survives when the body does not. Three constraints. (1) 'Action' here is the product naming itself on a lock screen, so it is a brand use under glossary rule 1 and stays in Latin script in every locale, exactly like appName - it must not become the translated common noun for a task. (2) It must carry no content of its own. On a secure lock screen Android applies NotificationVisibility.private, hides the body and shows this line alone, so a title made more helpful - naming the action, its category, its amount, its deadline, or how many are waiting - defeats the private-reminder setting completely and leaks precisely what that setting exists to hide. (3) Keep it about as short as the English; Android truncates a notification title to roughly one line and the tail is simply lost.
  ///
  /// In en, this message translates to:
  /// **'Action reminder'**
  String get reminderNotificationTitle;

  /// SAFETY: the entire body of a reminder when the user has turned private reminders on, and it is deliberately contentless. Three clauses must all survive. (1) It says that something needs the person and never what: no title, no fragment of a title, no category, no amount, no date, no count. This string replaces the Action's own title outright rather than shortening or masking it, because a truncated title still discloses. (2) It must stay an ordinary, complete sentence. A body that is blank, or that reads like a placeholder or an error, makes the user distrust every reminder afterwards - saying something rather than nothing is the whole point of this line. (3) It must not add reassurance the English does not make. No 'securely', no 'privately', no 'confidential': the app is withholding the title, not proving anything about the device it is showing on. This is read on a lock screen, in a car, on a shared screen and on a paired watch, by whoever is standing there.
  ///
  /// In en, this message translates to:
  /// **'You have something to review.'**
  String get reminderNotificationPrivateBody;

  /// The name of the Android notification channel, shown in Android's own Settings under Notifications for this app and used to group reminders in the shade. 'Action' is the product name and stays in Latin script in every locale (glossary rule 1). Keep it short - Android shows it in a list and truncates. This is only the human-readable name; the channel id stays the English identifier 'action_reminders' forever, because Android keys the user's own choices about this channel to that string.
  ///
  /// In en, this message translates to:
  /// **'Action reminders'**
  String get reminderChannelName;

  /// SAFETY: the one sentence under the channel name in Android's notification settings, where a person decides whether to allow this channel at all. The clause a translation may not drop is 'you set yourself': it scopes the permission to reminders the user personally asked for, and promises that nothing else is ever posted here - no marketing, no digests, no app-initiated nudges, nothing generated on the user's behalf. Without it the sentence reads as a general notification permission, which is not what this channel is. Note 'actions' here is the lowercase domain noun, the things the user made, and IS translated - unlike the brand in reminderChannelName.
  ///
  /// In en, this message translates to:
  /// **'Reminders you set yourself for your actions.'**
  String get reminderChannelDescription;

  /// The button that ends the first-run flow, shown only on the last page. "Action" here is the product name and stays in Latin script in every locale (glossary rule 1); the surrounding verb is translated.
  ///
  /// In en, this message translates to:
  /// **'Start using Action'**
  String get onboardingStart;

  /// Screen-reader-only position in the first-run flow; the progress bars themselves are hidden from semantics. It is a live region and is re-announced on every page change, so keep it short. Both numbers must survive and may be reordered for the locale.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String onboardingProgressSemantics(int current, int total);

  /// SAFETY: the first sentence of the product and a deliberately modest capability claim — information becomes something you can act on. It must not be inflated into a promise that the app does the work for you. Lowercase "action" is the domain noun here, not the brand: translate it with the glossary's common noun (Aufgabe / tarea / tâche …), never with the Latin brand name.
  ///
  /// In en, this message translates to:
  /// **'Turn information into action'**
  String get onboardingCaptureTitle;

  /// SAFETY: two clauses, both required — the enumerated inputs (screenshot, photo, text you were sent), and that Action reads it and works out what is being asked. "works out what it is asking you to do" must not be upgraded into understanding, knowing, or doing it for you. "Action" is the product name and stays in Latin script. Do not add "on your device": this page deliberately says nothing about where the reading happens, and the last page discloses that it is not local.
  ///
  /// In en, this message translates to:
  /// **'Add a screenshot, a photo or text you have been sent. Action reads it and works out what it is asking you to do.'**
  String get onboardingCaptureBody;

  /// SAFETY: the product's central guarantee. Both the negation and the condition must survive — "you can review before saving" weakens a guarantee into an option. Never "approve": the user may change what they are shown, not merely accept it.
  ///
  /// In en, this message translates to:
  /// **'Nothing is saved until you confirm it'**
  String get onboardingReviewTitle;

  /// SAFETY: three claims, none droppable — the extraction is shown next to the exact source words it was taken from (never a paraphrase), the user can correct it, and until confirmation it has the status of a suggestion rather than a fact or a saved Action. The closing "not a fact, and not an Action" is what a shortened translation drops and it is the clause that matters. "Action shows you" is the product name and stays Latin; "not an Action" is the domain noun and is translated.
  ///
  /// In en, this message translates to:
  /// **'Action shows you what it found and the words it came from. You fix anything that is wrong. Until you confirm, it is a suggestion — not a fact, and not an Action.'**
  String get onboardingReviewBody;

  /// SAFETY: must not become a certainty claim such as "never miss a deadline". Reminders are local notifications scheduled by the operating system and the app cannot guarantee their delivery; this product does not promise outcomes. Do not substitute a stock productivity slogan.
  ///
  /// In en, this message translates to:
  /// **'Stay on top of what matters'**
  String get onboardingTrackingTitle;

  /// SAFETY: "any reminder you set for it" is the anti-overclaim — reminders are set by the user, never scheduled automatically — and dropping "you set" would promise the app does it on your behalf. "Needs attention" is a cross-reference to the section heading on the Today screen and must be rendered identically to todaySectionNeedsAttention, or this points at a screen name that does not exist. "next step" is the glossary term. "Every Action" is the domain noun the user made, so it is translated and the English token must not remain.
  ///
  /// In en, this message translates to:
  /// **'Needs attention brings forward what is overdue or close. Every Action keeps its next step, its progress and any reminder you set for it.'**
  String get onboardingTrackingBody;

  /// SAFETY: a plain lead-in that promises the four disclosures below it. It must not become a reassurance about privacy, and it must not be softened into an optional aside that reads as fine print. The colon may be moved or dropped where the locale requires. Keep it short — this page already overflows and scrolls.
  ///
  /// In en, this message translates to:
  /// **'Worth knowing before you start:'**
  String get onboardingPrivacyBody;

  /// SAFETY: two distinct claims. First, those four enumerated things are stored locally — "on this device" means they do not leave this phone and must not be rendered as "offline", which describes a network state. Second, search and reminders keep working with no connection; that is about those two features specifically and must not be generalised into "the app works offline". "Actions" is the domain noun and is translated.
  ///
  /// In en, this message translates to:
  /// **'Your Actions, captures, reminders and searches are stored on this device. Search and reminders work without a connection.'**
  String get onboardingPrivacyOnDevice;

  /// SAFETY: the admission that reading is not local. Both halves must survive — the trigger (only when you ask) and the transmission (the content goes to an outside AI service). No translation may imply on-device AI; this shorter onboarding version has no second sentence saying so, unlike privacySentToReadWhat, so the transmission must be unmistakable here. "Action" is the product name and stays in Latin script.
  ///
  /// In en, this message translates to:
  /// **'When you ask Action to read something, that content is sent to the AI service that interprets it.'**
  String get onboardingPrivacySentToRead;

  /// SAFETY: a disclosure with an exhaustive positive list and an explicit negative complement. All four enumerated fields must appear, the "anonymous ID" qualifier must stay, the hedge "may" must stay hedged because the upload is conditional, and the final sentence naming what is not sent must not be dropped — without any one of them the disclosure is incomplete. The em-dash parenthetical may be re-punctuated per locale. "a confirmed Action" is the domain noun and is translated.
  ///
  /// In en, this message translates to:
  /// **'A short record of a confirmed Action — its title, dates, amount and suggested step — may be saved to the cloud under an anonymous ID for this device. Your captures, steps and reminders are not.'**
  String get onboardingPrivacyCloud;

  /// SAFETY: both negations are required — it is not a backup, and it cannot restore to a new device. A reader who took the previous bullet for cloud sync would otherwise believe their data is recoverable when it is not. The word "backup" appears here only to be denied; the denial cannot be softened, and no reassurance about syncing may be added.
  ///
  /// In en, this message translates to:
  /// **'That record is not a backup. It cannot restore anything to a new device.'**
  String get onboardingPrivacyNotBackup;

  /// SAFETY: heading over the blockers the Goal optimizer PROPOSED, and it must stay a plain count of proposals. Three things must survive. (1) It is a count, never a score, rating, percentage or grade - this tool deliberately prints no score, because 'Goal score 82/100' sounds precise and has no checkable definition behind it. (2) It is not a verdict that these things definitely block the goal; everything the Plan tools return is a suggestion the user accepts or rejects, and nothing is saved or applied to the goal. (3) The number must stay bound to {count}. The section is dropped entirely when there is nothing to list, so there is no zero form to write - do not add one, and do not word the plural forms so that they only read correctly for large numbers. Languages with more than two plural forms (ar has six, ru and pl four) must write every form their locale requires; the English source has only two because English only has two.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 blocker} other{{count} blockers}}'**
  String toolSectionBlockerCount(int count);

  /// Heading over the simplifications the Goal optimizer suggested. The conditional mood is the whole point and must survive: these are the model's proposals about the user's own goal, so it stays a hedge ('could'), never an instruction ('Make this simpler', 'Simplify this') and never a judgement that the goal is currently badly written. Nothing under this heading is applied to the goal; the user reads it and decides. Keep it short enough to sit on one line as a section heading.
  ///
  /// In en, this message translates to:
  /// **'Could be simpler'**
  String get toolSectionCouldBeSimpler;

  /// One-line description of the 'Improve a goal' tool (key toolGoalOptimizerTitle), shown under its name on the Studio card, as the subtitle on its run screen, and in the {description} slot of studioToolSemantics / studioToolSemanticsLocal for screen readers. Three parallel clauses that mirror the three things the tool returns, in that order - keep them parallel and keep all three, because the card is a promise about what the result will contain. NOTE FOR TRANSLATORS: the first clause is deliberately the same English as toolTitleMissingInformation ('What is missing'), which is a different tool's NAME. Do not unify them: this one is a clause inside a list of capabilities and may need different grammar, case or article from a standalone tool name.
  ///
  /// In en, this message translates to:
  /// **'What is missing, what blocks it, what to do first.'**
  String get toolDescriptionGoalOptimizer;

  /// An inline dependency label shown under a suggested step in the action plan - 'After: Send the signed form'. It names the step this one waits on. {step} is the other step's title, written by the model in the user's language, and must appear exactly once. The English form freezes label-then-step order and joins with a colon; a locale that marks dependency differently (a postposition, a case-marked form, a different particle) should write it the way it naturally would rather than transliterating the colon. It must stay a statement of ORDER, not of time: this tool is forbidden from inventing dates, so nothing here may read as a deadline, a date or 'later'.
  ///
  /// In en, this message translates to:
  /// **'After: {step}'**
  String toolSectionStepDependsOn(String step);

  /// The single section heading in the action plan result; the prose beneath it is the model's summary of the plan it proposes. It heads a proposal, not a committed or saved plan - the individual steps below are unticked suggestions until the user saves them - so avoid wording that reads as 'your plan' or 'the plan you made'. Definite and short.
  ///
  /// In en, this message translates to:
  /// **'The plan'**
  String get toolSectionThePlan;

  /// One-line description of the 'Build a plan' tool (key toolActionPlanTitle), on the Studio card, the run screen subtitle, and the {description} slot of studioToolSemantics / studioToolSemanticsLocal. Two things must survive. 'Ordered' is load-bearing - the sequence is the product, and steps state what they depend on. And the sentence is a promise about what the steps BECOME when saved: 'Actions' capitalised here is the product's own object, so use exactly the term the rest of this ARB already uses for that domain noun (as in goalDeleteBody) and do not render it as a generic word for 'tasks' or 'to-dos'. Keep 'you can', which says the user chooses; the steps are not saved for them.
  ///
  /// In en, this message translates to:
  /// **'An ordered set of steps you can turn into Actions.'**
  String get toolDescriptionActionPlan;

  /// Name of the checklist tool. Three render sites, one key: the Studio card, the title bar of its run screen, and the row label in the Security centre's 'What left this device' journal (securityTransfersTitle), where an untranslated name is the one English word on an otherwise translated audit screen. An imperative naming what the user is about to do - keep it a verb phrase, not a noun ('Checklist'), so it stays parallel with the other tool names. Must remain visibly distinct from toolTitleMissingInformation.
  ///
  /// In en, this message translates to:
  /// **'Make a checklist'**
  String get toolTitleSmartChecklist;

  /// SAFETY: a coverage claim shown BEFORE the tool has run, so it must not promise completeness. The checklist is bounded by what was actually captured and by what the model could support from that material - an unread page, a failed OCR line or a missed clause simply produces fewer items, and this tool has no counterpart string telling the user what it could not see. So it must never become a guarantee that nothing was missed: not 'all your obligations', not 'the complete list', not 'every requirement you have', not 'nothing left out'. It says what the material asks of the reader, and a short checklist must never read as a clean bill. Keep 'in order' - the sequence is part of what the tool provides. Shown on the Studio card, the run screen subtitle, and in the {description} slot of studioToolSemantics / studioToolSemanticsLocal.
  ///
  /// In en, this message translates to:
  /// **'Everything this asks of you, in order.'**
  String get toolDescriptionSmartChecklist;

  /// SAFETY: an ABSENCE claim, and the sharpest kind this product has to keep honest. It counts details this tool could not find in the material - never 'details that are missing from your document', which asserts something about the document itself. A gap the model failed to notice must never be readable as a gap that does not exist, and this heading is the only thing carrying that qualification, because the section is dropped entirely when the list is empty. So: do not translate it into a finding of fault, an error count, or anything meaning 'your document is incomplete'; and never let it imply the remainder was checked and found complete. The number must stay bound to {count}. There is no zero form to write - do not add one. Locales with more than two plural forms (ar six, ru and pl four) must write every form; English has two because English has two.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 missing detail} other{{count} missing details}}'**
  String toolSectionMissingDetailCount(int count);

  /// SAFETY: the strongest claim in this tool - it asserts the tool found statements inside the user's own material that conflict. It must not weaken into a formatting remark ('These differ', 'These vary', 'Differences'), which would let a real contradiction be read past. It must not strengthen into a verdict on either side ('These are wrong', 'This is an error', 'Incorrect information'): the tool does not know which statement is right and is explicitly forbidden from guessing. Keep it a statement about the PAIR - that they disagree with each other - and keep it plural. Each bullet under it is evidence-checked against the source and can still come back unconfirmed, and any such caution is shown as a banner above this heading, so nothing here may read as proven.
  ///
  /// In en, this message translates to:
  /// **'These disagree with each other'**
  String get toolSectionContradictions;

  /// Name of the tool that finds gaps. Three render sites, one key: the Studio card, the title bar of its run screen, and the row label in the Security centre's 'What left this device' journal (securityTransfersTitle), where an untranslated name is the one English word on an otherwise translated audit screen. NOTE FOR TRANSLATORS: this is the same English as the first clause of toolDescriptionGoalOptimizer, but that is a clause in another tool's feature list and this is a standalone NAME. Do not unify them - a name may need different grammar, case, article or nominalisation. Must remain visibly distinct from toolTitleSmartChecklist.
  ///
  /// In en, this message translates to:
  /// **'What is missing'**
  String get toolTitleMissingInformation;

  /// One-line description of the 'What is missing' tool (key toolTitleMissingInformation), on the Studio card, the run screen subtitle, and the {description} slot of studioToolSemantics / studioToolSemanticsLocal. BOTH clauses must survive. The second one is the tool's actual value: it produces the questions to put to whoever sent the material, and it deliberately does not answer them or guess the missing values. Dropping it turns this line into a restatement of the tool's own name. 'Ask' must stay a question the user puts to another person, not a query typed into the app.
  ///
  /// In en, this message translates to:
  /// **'The gaps, and what to ask about them.'**
  String get toolDescriptionMissingInformation;

  /// SAFETY: two claims and the second is the one that matters — the request took too long AND it was stopped. Cancellation in this app closes the socket rather than abandoning a Future, precisely because an abandoned request on the user's own key keeps running and keeps billing. A translation that renders only "that took too long" leaves the reader unsure whether something is still running on their account. It must also not become "check your connection" (that is aiFailureNetworkUnavailable) or promise a retry.
  ///
  /// In en, this message translates to:
  /// **'That took too long and was stopped.'**
  String get aiAdapterTimedOut;

  /// SAFETY: a TLS handshake failure, and "secure" is load-bearing. Action has no certificate-validation bypass and no cleartext fallback, so this is a refusal to proceed, never a downgrade. It must not soften into a generic "connection problem" or "try again shortly" (that is aiFailureProviderUnavailable), and must not suggest the content was sent anyway.
  ///
  /// In en, this message translates to:
  /// **'The secure connection to your AI provider failed.'**
  String get aiAdapterSecureConnectionFailed;

  /// SAFETY: it names both possibilities because Action genuinely does not know which one a bare 404 meant. Collapsing it to only the model (aiFailureUnsupportedModel already says that) or only the address would state a certainty the app does not have.
  ///
  /// In en, this message translates to:
  /// **'Action could not find that model or endpoint.'**
  String get aiAdapterModelOrEndpointNotFound;

  /// SAFETY: attribution. The provider refused, not Action, and not the user's device — the reader needs to know which side said no before they change anything. It must not become "something went wrong" (that is aiFailureUnknown) and must not name a reason Action was not given.
  ///
  /// In en, this message translates to:
  /// **'Your AI provider rejected that request.'**
  String get aiAdapterRequestRejected;

  /// SAFETY: describes a mechanism, not a promise. Two clauses must survive: the store that failed is this device's secure storage, and Action could not open it — so no key was read and nothing was sent. Following the rule that governs privacyProviderKey and aiSettingsKeyStored, no locale may upgrade "secure storage" to "encrypted", "safe" or "protected", and none may render this as the key being lost or deleted.
  ///
  /// In en, this message translates to:
  /// **'Action couldn\'t open this device\'s secure storage.'**
  String get aiAdapterSecureStorageUnavailable;

  /// The custom provider is selected but its address field is empty. It must stay distinct from aiFailureNotConfigured, which is shown when no provider is connected at all: this reader has already connected one and only needs to finish it. Settings is the screen name and matches the wording in aiFailureUnsupportedModel.
  ///
  /// In en, this message translates to:
  /// **'Add the address of your AI endpoint in Settings.'**
  String get aiAdapterEndpointMissing;

  /// SAFETY: an admission that nothing usable arrived. A response came back and parsed, but carried no content, so there is no partial answer and none was inferred. A translation that reads as a generic error hides that the screen is empty because Action refused to invent the missing part; the invitation to retry must survive, because this failure is retryable.
  ///
  /// In en, this message translates to:
  /// **'That reply was incomplete. Try again.'**
  String get aiAdapterReplyIncomplete;

  /// SAFETY: attribution again, and here it is the whole sentence. The refusal came from the provider's own safety filter — Action did not inspect, judge or block the content, and does not know why the provider did. It must not become "that content is not allowed", which would make Action the accuser, and must not imply Action read or classified what the user sent.
  ///
  /// In en, this message translates to:
  /// **'Your provider declined to process that content.'**
  String get aiAdapterContentDeclined;

  /// A local cap, refused before anything is encoded or sent. {limit} is always greater than one, so English needs no plural, but a locale whose word for "files" agrees with the number should be given the agreeing form. The remedy clause must survive: it is the only thing that tells the reader the request is not lost, just too big.
  ///
  /// In en, this message translates to:
  /// **'That is more than {limit} files at once. Select fewer.'**
  String aiAdapterTooManyAttachments(int limit);

  /// "One of those" is deliberate: the check stops at the first oversized image and Action does not claim to know which of several it was. A translation that says "that image" asserts an identification the app has not made.
  ///
  /// In en, this message translates to:
  /// **'One of those images is too large to analyse.'**
  String get aiAdapterImageTooLarge;

  /// Naming the file is what makes this actionable when several are attached; the quotation marks around {filename} are part of the sentence and should become whatever quotation marks the locale uses. {limit} is a whole number of megabytes and MB is the unit symbol, unchanged in every locale.
  ///
  /// In en, this message translates to:
  /// **'\"{filename}\" is too large to analyse. The limit is {limit} MB.'**
  String aiAdapterDocumentTooLarge(String filename, int limit);

  /// SAFETY: this is the app refusing to silently truncate. All three parts are required — how long the document is, how much Action will read at once, and that the reader chooses the range — because dropping the last clause turns an invitation into a dead end, and dropping the middle one lets the reader assume Action read the beginning anyway. It never did. {count} is always greater than {limit} and both exceed one, so English needs no plural; a locale whose word for "pages" agrees with the number should be given the agreeing form.
  ///
  /// In en, this message translates to:
  /// **'\"{filename}\" has {count} pages. Action reads up to {limit} at a time — choose a range.'**
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit);

  /// The whole payload is over Action's own ceiling, checked locally, so nothing was sent and nothing was billed. "in one request" must survive: it says the material is not too large in principle, only too large together, which is what tells the reader that selecting less will work. Distinct from aiFailureContextTooLarge, which is a rejection that already cost an upload.
  ///
  /// In en, this message translates to:
  /// **'That selection is too large to send in one request.'**
  String get aiAdapterSelectionTooLarge;

  /// Empty state shown when a tool id from a route or from the recents list is no longer in the registry.
  ///
  /// In en, this message translates to:
  /// **'That tool is not available'**
  String get toolRunNotAvailableTitle;

  /// 'Action' is the product name and stays Latin script, untranslated. The hedge 'may have been' is deliberate — the app genuinely does not know why the id is unknown, so this must not harden into 'was removed'.
  ///
  /// In en, this message translates to:
  /// **'It may have been removed in a newer version of Action.'**
  String get toolRunNotAvailableMessage;

  /// Empty state inside the source picker. Two sentences; keep both — the second is the instruction. 'Capture' is the fixed product verb and must match the word used for navCapture / captureSheetTitle in this locale.
  ///
  /// In en, this message translates to:
  /// **'Nothing to work on yet. Capture something, or paste some text below.'**
  String get toolRunNoSourcesYet;

  /// Heading above the source picker when the tool takes more than one source (Compare Documents).
  ///
  /// In en, this message translates to:
  /// **'Choose what to compare'**
  String get toolRunChooseSourcesToCompare;

  /// Heading above the source picker when the tool takes one source. 'Source' is a fixed glossary term — use the same word as sourceWhatWeRead and the provenance strings in this locale.
  ///
  /// In en, this message translates to:
  /// **'Choose a source'**
  String get toolRunChooseSource;

  /// Heading above the free-form question field on tools that require a question.
  ///
  /// In en, this message translates to:
  /// **'Your question'**
  String get toolRunQuestionLabel;

  /// Placeholder in the question field. An example question, not an instruction — write a plausible example question in your own language rather than a literal gloss. 'Deadline' is a fixed glossary term.
  ///
  /// In en, this message translates to:
  /// **'What is the deadline?'**
  String get toolRunQuestionHint;

  /// Heading above the paste field. The leading 'Or' is load-bearing: it marks this as an alternative to picking a source, not a second required step. Do not reduce it to 'Paste text'.
  ///
  /// In en, this message translates to:
  /// **'Or paste some text'**
  String get toolRunFreeTextLabel;

  /// Placeholder in the paste field.
  ///
  /// In en, this message translates to:
  /// **'Paste or type here'**
  String get toolRunFreeTextHint;

  /// Heading above the chips that choose which variant of the tool to run — Clearer, Shorter, Executive and so on. It means 'which kind of output', never visual styling or appearance.
  ///
  /// In en, this message translates to:
  /// **'Style'**
  String get toolRunModeLabel;

  /// SAFETY: the label on the run button for a tool that sends nothing anywhere. 'on this device' is a data-flow claim and must stay one — it must not become 'offline', which describes a network state instead. Same claim as studioRunsOnThisDevice, in a different grammatical form; use 'check', not 'verify'.
  ///
  /// In en, this message translates to:
  /// **'Check on this device'**
  String get toolRunRunLocally;

  /// The button that starts a run, and the confirming button in the scope dialog. Must stay an active verb the user chooses — never a passive 'OK' — because this is the single point at which anything is sent.
  ///
  /// In en, this message translates to:
  /// **'Run'**
  String get toolRunRun;

  /// Aborts a request that is already in flight, which actually cancels the connection so the user is not billed for it. Must stay distinct from commonCancel, which dismisses a dialog before anything is sent, and from the 'Stopped' stage label it appears next to.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get toolRunStop;

  /// Re-runs a run that succeeded, spending the user's API key again. Must stay distinct from commonRetry ('Try again'), which retries a run that failed — both can be on screen at once and must not collapse to the same phrase.
  ///
  /// In en, this message translates to:
  /// **'Run again'**
  String get toolRunRunAgain;

  /// Label above the title of the action or goal this run is fixed to. The title follows immediately on the next line, so avoid a dangling preposition — a colon or a noun construction ('Working on:', 'Subject') is fine.
  ///
  /// In en, this message translates to:
  /// **'Working on'**
  String get toolRunWorkingOn;

  /// SAFETY: the title of the one-time consent dialog shown before any content leaves the device. It must stay a question and it must name the specific provider — a statement or a notification-style title would turn a consent gate into an announcement. {provider} is a provider name and is never translated.
  ///
  /// In en, this message translates to:
  /// **'Send this to {provider}?'**
  String toolRunFirstUseTitle(String provider);

  /// SAFETY: first paragraph of the consent dialog. Three claims must all survive: only the content the user selected is sent, it goes to the named provider, and it is sent using the user's own API key. 'API' and the provider name stay untranslated. Shown immediately above toolRunFirstUseKeyStays.
  ///
  /// In en, this message translates to:
  /// **'The content you selected will be sent to {provider} for processing, using your API key.'**
  String toolRunFirstUseBody(String provider);

  /// SAFETY: second paragraph of the consent dialog, carrying three independent negative claims that must each survive: the API key stays on this device; nothing is sent in the background; and the user's other actions and sources are not sent. Dropping 'in the background' or 'your other Actions or sources' turns a scoped disclosure into vague reassurance. TRANSLATOR NOTE: 'Action' here is the product name and stays Latin script, while 'your other Actions' is the domain noun for the things the user tracks and IS translated.
  ///
  /// In en, this message translates to:
  /// **'Your key stays on this device. Action does not send anything in the background, and does not send your other Actions or sources.'**
  String get toolRunFirstUseKeyStays;

  /// SAFETY: title of the dialog that states the scope of a large run before anything is sent. It must name the moment as pre-send — a locale rendering it as 'Running' or 'Please wait' would make a consent gate look like a progress notice. Must stay distinct from toolRunFirstUseTitle; the two dialogs can appear one after the other in the same run.
  ///
  /// In en, this message translates to:
  /// **'Before this runs'**
  String get toolRunScopeTitle;

  /// SAFETY: the scope stated before a run is sent on the user's own key. Both the quantity and the fact that it is the user's own provider connection must survive. Must stay distinct from toolRunScopeFiles and toolRunScopeText — the three describe different quantities.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page} other{{count} pages}} will be analysed using your {provider} connection.'**
  String toolRunScopePages(int count, String provider);

  /// SAFETY: the scope stated before a run is sent on the user's own key, when the count is of whole files rather than pages. Both the quantity and the fact that it is the user's own provider connection must survive. Must stay distinct from toolRunScopePages and toolRunScopeText.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 file} other{{count} files}} will be analysed using your {provider} connection.'**
  String toolRunScopeFiles(int count, String provider);

  /// SAFETY: the scope stated before a run with no pages or files to count. 'the text you selected' is the scope claim — only what the user chose is sent — and 'your {provider} connection' says whose account pays. Must stay distinct from toolRunScopePages and toolRunScopeFiles.
  ///
  /// In en, this message translates to:
  /// **'The text you selected will be sent to your {provider} connection.'**
  String toolRunScopeText(String provider);

  /// Shown in place of the tool when no AI provider is configured. Deliberately an invitation, not an error — the user has done nothing wrong, so do not render it as a failure ('Cannot use this tool', 'Not available'). 'Provider' is a fixed glossary term.
  ///
  /// In en, this message translates to:
  /// **'Connect an AI provider to use this tool'**
  String get toolRunNeedsProviderTitle;

  /// SAFETY: states who the account and the billing relationship belong to — the user, not Action. The possessive 'your own' is the whole claim and must not soften into 'an account'. Same billing point as studioDisconnectedBlurb. 'API' stays untranslated.
  ///
  /// In en, this message translates to:
  /// **'You use your own provider account and API key.'**
  String get toolRunNeedsProviderBody;

  /// Confirmation shown after the ticked steps become a new action linked to the goal the run came from. 'Action' here is the domain noun for the thing the user tracks, not the product name, and IS translated.
  ///
  /// In en, this message translates to:
  /// **'Action created from {count, plural, =1{1 step} other{{count} steps}}.'**
  String toolRunActionCreatedFromSteps(int count);

  /// Confirmation shown after the ticked steps are appended to the action the run came from. Translate as one whole sentence — several languages cannot open a clause with a bare numeral.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 step} other{{count} steps}} added.'**
  String toolRunStepsAdded(int count);

  /// Button that turns the ticked suggestions into a new action, shown when the run came from a goal. 'action' is the domain noun and is translated. The '·' is layout punctuation; the two halves may be reordered if that reads better in this language.
  ///
  /// In en, this message translates to:
  /// **'Create an action · {count, plural, =1{1 step} other{{count} steps}}'**
  String toolRunSaveCreateActionWithCount(int count);

  /// Button that appends the ticked suggestions to the action the run came from. Must stay distinct from toolRunSaveCreateActionWithCount — one creates something new, the other adds to something that exists.
  ///
  /// In en, this message translates to:
  /// **'Add to this action · {count, plural, =1{1 step} other{{count} steps}}'**
  String toolRunSaveAddToActionWithCount(int count);

  /// Short name for a captured photo, as a row title in the source picker. Not the provenance sentence provenancePhoto ('Captured from photo') — this is a bare noun.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get sourceTypeLabelPhoto;

  /// Short name for an image taken from the gallery, as a row title in the source picker.
  ///
  /// In en, this message translates to:
  /// **'Screenshot'**
  String get sourceTypeLabelScreenshot;

  /// Short name for text the user pasted in, as a row title in the source picker.
  ///
  /// In en, this message translates to:
  /// **'Pasted note'**
  String get sourceTypeLabelPastedText;

  /// Short name for an added document, as a row title in the source picker. Deliberately never the file name — a document's name is the most identifying string a capture carries.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get sourceTypeLabelDocument;

  /// Rewrite mode chip: make the text easier to follow. One of the 'Style' chips.
  ///
  /// In en, this message translates to:
  /// **'Clearer'**
  String get toolModeClearer;

  /// Rewrite mode chip. Comparative — it makes existing text more professional. Must not collapse to the same phrase as toolModeProfessional, which is a Draft a Reply mode.
  ///
  /// In en, this message translates to:
  /// **'More professional'**
  String get toolModeMoreProfessional;

  /// Rewrite mode chip: cut length without losing meaning.
  ///
  /// In en, this message translates to:
  /// **'Shorter'**
  String get toolModeShorter;

  /// Rewrite mode chip: plain language and shorter sentences.
  ///
  /// In en, this message translates to:
  /// **'Simpler'**
  String get toolModeSimpler;

  /// Rewrite mode chip: add headings or short paragraphs so the text can be scanned.
  ///
  /// In en, this message translates to:
  /// **'More structured'**
  String get toolModeMoreStructured;

  /// Rewrite mode chip: make the writer's existing case more compelling, without adding new claims.
  ///
  /// In en, this message translates to:
  /// **'More persuasive'**
  String get toolModeMorePersuasive;

  /// Rewrite mode chip: correct grammar, spelling and punctuation and change nothing else. The restriction is the point — it must not read as a general tidy-up.
  ///
  /// In en, this message translates to:
  /// **'Grammar only'**
  String get toolModeGrammarOnly;

  /// Draft a Reply mode chip: a professional register. Must not collapse to the same phrase as toolModeMoreProfessional, which is a Rewrite mode.
  ///
  /// In en, this message translates to:
  /// **'Professional'**
  String get toolModeProfessional;

  /// Draft a Reply mode chip: three or four sentences.
  ///
  /// In en, this message translates to:
  /// **'Concise'**
  String get toolModeConcise;

  /// Draft a Reply mode chip: warm and direct.
  ///
  /// In en, this message translates to:
  /// **'Friendly'**
  String get toolModeFriendly;

  /// Draft a Reply mode chip: formal register throughout, for a legal or official recipient. Must stay distinct from toolModeProfessional — formal is the stronger register.
  ///
  /// In en, this message translates to:
  /// **'Formal'**
  String get toolModeFormal;

  /// Draft a Reply mode chip: the reply asks for what is missing or unclear and nothing else.
  ///
  /// In en, this message translates to:
  /// **'Ask for clarification'**
  String get toolModeAskForClarification;

  /// Draft a Reply mode chip: the reply confirms receipt and states what happens next. A kind of reply, not a button — this is a chip in the 'Style' row and never confirms a dialog.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get toolModeConfirm;

  /// Draft a Reply mode chip: the reply challenges what was received. A neutral description of the reply's intent — it must not become an encouragement or an accusation.
  ///
  /// In en, this message translates to:
  /// **'Dispute this'**
  String get toolModeDispute;

  /// Summary mode chip: a short summary. A kind of reading, not a speed setting.
  ///
  /// In en, this message translates to:
  /// **'Quick'**
  String get toolModeQuick;

  /// Summary mode chip: cover the material section by section, keeping its structure.
  ///
  /// In en, this message translates to:
  /// **'Detailed'**
  String get toolModeDetailed;

  /// Summary mode chip: written for someone deciding what to do, leading with the decision and its consequences.
  ///
  /// In en, this message translates to:
  /// **'Executive'**
  String get toolModeExecutive;

  /// Summary mode chip: points only, with no connecting prose.
  ///
  /// In en, this message translates to:
  /// **'Key points'**
  String get toolModeKeyPoints;

  /// Summary mode chip: the summary covers what the reader has to do. 'Action' here is the domain noun for the thing the user tracks, not the product name.
  ///
  /// In en, this message translates to:
  /// **'Action-focused'**
  String get toolModeActionFocused;

  /// SAFETY: the caution banner shown above a result when Action DID check the model's quotes against the user's own material and failed to find {count} of them. Two clauses, both mandatory: (1) the quoted detail was not found in what the user selected, and (2) it is therefore marked uncertain. Dropping clause (2) leaves an unverifiable claim reading as a confirmed one; softening clause (1) into 'may differ slightly', 'is approximate' or 'was paraphrased' turns a failed check into a formatting note. Equally it must not harden into 'this detail is wrong' or 'Action found an error' — Action found no matching quote, it did not disprove the detail. Keep 'in what you selected' scoped to the user's own selection: the claim is about the material the user chose, never about the world. Must stay distinct from toolWarningEvidenceUnverifiable, which is the case where no check ran at all. The number must stay bound to {count}; do not restate it in words.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{One quoted detail could not be found in what you selected, so it is marked uncertain.} other{{count} quoted details could not be found in what you selected, so they are marked uncertain.}}'**
  String toolWarningEvidenceNotFound(int count);

  /// SAFETY: the note banner shown when Action could not run the evidence check at all — a PDF or image whose text was never extracted on this device, so there was nothing to check a quote against. The claim is 'the test never ran', which is categorically different from toolWarningEvidenceNotFound's 'the test ran and found nothing'. These two must never collapse into one 'not verified' sentence in any language: that collapse lets an unchecked quote read as a checked one. Mandatory clauses: (1) Action could not perform the check, (2) the reason is the file itself — Action never read its text — and (3) the quotes have consequently not been verified. Never soften into 'quotes are shown as provided', 'quotes may be approximate', or anything that implies the quotes were seen and accepted; never harden into a claim the quotes are wrong or the file is untrustworthy. The register is a limit of what Action could do, not a verdict on the result, but the negative claim stays absolute. 'Action' here is the product name and is not translated. Use the same Evidence vocabulary as evidenceUnverified and the word for a quotation; do not invent a second word for verified.
  ///
  /// In en, this message translates to:
  /// **'Action couldn\'t check these quotes against the file itself, so they have not been verified.'**
  String get toolWarningEvidenceUnverifiable;

  /// SAFETY: the badge on a Home card whose deadline has passed — the single most-seen piece of text in the app. Three clauses must survive. (1) It states one fact only: the deadline is {count} whole calendar days in the past. It may not add or imply what being late costs — no penalty, fee, fine, legal, court, credit, debt or risk language — because the app has no evidence for any of that and never will. (2) The number counts days, not hours, and it is not a date; it must not be turned back into a due date. (3) It must stay a statement, not an instruction: 'Overdue · 2 days', never 'Pay now'. Stored sentence case and uppercased at render by eyebrowCase(), so do not supply it in capitals. The '·' is this badge's own punctuation and may become whatever separator your language reads naturally.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Overdue · 1 day} other{Overdue · {count} days}}'**
  String triageBadgeOverdueDays(int count);

  /// The badge on a Home card whose deadline is the next calendar day. It says when, never what happens otherwise. Must stay visibly different from metaDueToday. Stored sentence case and uppercased at render by eyebrowCase(), so do not supply it in capitals.
  ///
  /// In en, this message translates to:
  /// **'Due tomorrow'**
  String get triageBadgeDueTomorrow;

  /// The badge on a Home card because a reminder the person set for themselves is due within the next day. It is not an alert, an alarm or a warning — it reports the person's own scheduled reminder. Stored sentence case and uppercased at render by eyebrowCase(), so do not supply it in capitals.
  ///
  /// In en, this message translates to:
  /// **'Reminder soon'**
  String get triageBadgeReminderSoon;

  /// SAFETY: what a screen reader says in place of the triageBadgeOverdueDays badge, and it carries exactly the same claims: the deadline is {count} whole calendar days past, and nothing about a consequence of that. It exists as its own key because the badge cannot be rewritten into speech — the old English-only code swapped the '·' for the word 'by' — so write this as your language would say it aloud, in ordinary words and without capitals or punctuation standing in for words.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Overdue by 1 day} other{Overdue by {count} days}}'**
  String triageSpokenOverdueDays(int count);

  /// What a screen reader announces for an Action card: {status} is the spoken badge (triageSpokenOverdueDays, metaDueToday, urgencyCritical, detailAllStepsDone, triageBadgeDueTomorrow, triageBadgeReminderSoon or searchFilterOverdue) and {title} is the person's own wording of the action, which must be passed through untouched. The order and the separator may both change; both placeholders must appear exactly once.
  ///
  /// In en, this message translates to:
  /// **'{status}. {title}'**
  String triageSemanticLabel(String status, String title);

  /// Shown when the person taps a completed card to ask why it is where it is. A plain statement of a state the person themselves set — not praise, not a score.
  ///
  /// In en, this message translates to:
  /// **'This is done.'**
  String get triageExplanationDone;

  /// SAFETY: the answer when an Action has no reason to be prominent. Two clauses must survive. (1) 'nothing about it is pressing' is a statement about the deadline, urgency, steps and reminders the app can actually see — it must not become a reassurance that the action is unimportant, handled, safe or that nothing is required. (2) 'yet' must survive: it says the app is describing now, not forever.
  ///
  /// In en, this message translates to:
  /// **'This is here because nothing about it is pressing yet.'**
  String get triageExplanationNothingPressing;

  /// SAFETY: the sentence shown when the person taps a badge to ask why an Action is at the top of Home. {reason} is a clause from the triageReason… keys and is inserted verbatim. Two clauses must survive. (1) The sentence explains a position in a list, and nothing more — it may not add what happens if the person ignores it (no penalty, fee, legal, credit or risk language) and it may not become an instruction or a threat. (2) The reason must stay attached to the verdict: the whole point is that the ranking is arguable, so a translation that drops {reason} and keeps only 'This needs attention' removes the explanation. Reorder the two halves freely if your language reads better with the reason first.
  ///
  /// In en, this message translates to:
  /// **'This needs attention because {reason}.'**
  String triageExplanationNeedsAttention(String reason);

  /// SAFETY: the same sentence as triageExplanationNeedsAttention for an Action that is *not* at the top. Same two clauses: it explains a position in a list and never a consequence, and {reason} must survive because it is the explanation. 'further down' is about where the card sits on the screen, not about the action mattering less.
  ///
  /// In en, this message translates to:
  /// **'This is further down because {reason}.'**
  String triageExplanationUpcoming(String reason);

  /// SAFETY: the {reason} clause when the deadline has passed but the app cannot say by how much. It states lateness only, never a consequence of it. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop — give it whatever form reads correctly inside those frames in your language.
  ///
  /// In en, this message translates to:
  /// **'it is overdue'**
  String get triageReasonOverdue;

  /// SAFETY: the {reason} clause for a deadline that went by earlier today — less than a whole calendar day, so no number of days is claimed. It states that the moment passed and nothing about what follows from that. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'its deadline has passed'**
  String get triageReasonDeadlinePassed;

  /// SAFETY: the {reason} clause when the deadline passed {count} whole calendar days ago. Two clauses must survive: the count is days past the deadline, and no consequence of being late may be added — the app knows the date and nothing else. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{it is one day overdue} other{it is {count} days overdue}}'**
  String triageReasonOverdueDays(int count);

  /// The {reason} clause for a deadline falling on today's calendar date. States when, never what happens otherwise. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'it is due today'**
  String get triageReasonDueToday;

  /// SAFETY: the {reason} clause for an Action the person set to critical urgency whose deadline is within three days. Two clauses must survive. (1) 'you marked it' — the app did not decide this, infer it or measure it; the person chose it, and the sentence must keep saying so. (2) 'its deadline is close' is a statement about the date only and may not acquire a consequence. Use the same word here as urgencyCritical, since that is the word the person was shown when they chose it. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'you marked it critical and its deadline is close'**
  String get triageReasonCriticalDueSoon;

  /// SAFETY: the {reason} clause when every step the person ticked is complete while the Action itself is still open. Two clauses must survive. (1) 'every step is done' reports ticks the person made themselves. (2) 'it just needs finishing' must stay a statement that the Action is not yet complete — it must not be softened into saying the Action is done, which is a different state the person has not chosen. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'every step is done — it just needs finishing'**
  String get triageReasonAllStepsDone;

  /// The {reason} clause for a deadline on the next calendar day. States when, never what happens otherwise. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'it is due tomorrow'**
  String get triageReasonDueTomorrow;

  /// SAFETY: the {reason} clause for a reminder that is scheduled to arrive within twenty-four hours. Two clauses must survive. (1) 'you set' — this is the person's own reminder, not a notification Action decided to send. (2) It says the reminder is scheduled, not that it has fired or is guaranteed to; the app treats a scheduled reminder and a delivered one as different facts elsewhere and this sentence must not merge them. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'you set a reminder for it within the next day'**
  String get triageReasonReminderSoon;

  /// The {reason} clause for a deadline two or three calendar days away. States when, never what happens otherwise, and must stay distinct from triageReasonDueWithinSevenDays. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'it is due within three days'**
  String get triageReasonDueWithinThreeDays;

  /// SAFETY: the {reason} clause for an Action the person set to critical urgency that has no date at all. Two clauses must survive, and both halves are the point of the sentence. (1) 'you marked it' — the urgency is the person's, never the app's judgement. (2) 'it has no deadline' is an admission that the app has no date for this, and it must not be dropped, nor turned into a date, a guess or 'no deadline yet'. Use the same word for critical as urgencyCritical. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'you marked it critical, and it has no deadline'**
  String get triageReasonCriticalNoDeadline;

  /// The {reason} clause for a deadline four to seven calendar days away. States when, never what happens otherwise, and must stay distinct from triageReasonDueWithinThreeDays. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'it is due within a week'**
  String get triageReasonDueWithinSevenDays;

  /// SAFETY: the {reason} clause for an Action the person set to important urgency. 'you marked it' must survive: the app never assigns importance, and a translation that reads 'this is important' turns the person's own setting into a verdict from the product. Use the same word as urgencyImportant, which is what the person was shown when they chose it. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'you marked it important'**
  String get triageReasonImportant;

  /// The {reason} clause for a deadline more than a week off. It compares this Action with the ones above it and claims nothing else — not that it is unimportant, and not that it can be ignored. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'its deadline is further away'**
  String get triageReasonDueLater;

  /// SAFETY: the {reason} clause for an Action with no date and no urgency preference. Two clauses must survive. (1) 'it has no deadline' is an admission that the app has no date for this — not a claim that none exists, and never replaced by a guessed one. (2) 'nothing is pressing' describes the deadline, urgency, steps and reminders the app can see, and must not become a reassurance that the action is unimportant, handled or that nothing is required of the person. A sentence fragment inserted into triageExplanationNeedsAttention / triageExplanationUpcoming: in English it carries no capital letter and no full stop.
  ///
  /// In en, this message translates to:
  /// **'it has no deadline and nothing is pressing'**
  String get triageReasonNoDeadline;

  /// The tooltip and screen-reader name of the disabled completion button on a finished Action card. It names which action is finished, because 'Completed' repeated down a list says nothing about which row it belongs to. {title} is the person's own wording and is passed through untouched.
  ///
  /// In en, this message translates to:
  /// **'Completed: {title}'**
  String cardCompletedTooltip(String title);

  /// Name of the Document Intelligence tool, keyed by the tool id 'document-intelligence'. Rendered on the Studio card, as the run screen's app-bar title, and — the one that matters — as the row label in the Security centre's 'What left this device' journal, which resolves the stored id to this title. An imperative instruction to the reader ('Understand this document'), not a description of the tool. 'document' is the ordinary word for a file the user captured, not a legal instrument. The tool id itself is never translated.
  ///
  /// In en, this message translates to:
  /// **'Understand this document'**
  String get toolTitleDocumentIntelligence;

  /// One-line blurb under the Document Intelligence title on the Studio card and the run screen, and interpolated into studioToolSemantics for screen readers. Three parallel clauses naming the three sections of the result — keep them parallel and keep all three, because they are the promise the result view then fulfils (toolSectionWhatThisIs, toolSectionWhatMatters, editNextStepTitle).
  ///
  /// In en, this message translates to:
  /// **'What it is, what matters, and what to do about it.'**
  String get toolDescriptionDocumentIntelligence;

  /// Heading above the first block of the document brief — a plain identification of the document. Rendered as a section heading in the result view. Not the JSON field 'what_this_is' sent to the model, which stays English. Keep it a question-shaped label about identity, not a summary label.
  ///
  /// In en, this message translates to:
  /// **'What this is'**
  String get toolSectionWhatThisIs;

  /// Heading above the second block of the document brief — what the document means for this reader. Rendered as a section heading. 'Matters' is significance to the reader, not importance in the abstract. Not the JSON field 'what_matters' sent to the model.
  ///
  /// In en, this message translates to:
  /// **'What matters'**
  String get toolSectionWhatMatters;

  /// Heading above the label/value facts pulled out of the document. Rendered as a section heading. The facts beneath may individually carry an 'Unconfirmed' marker, so the heading must stay a neutral label for extracted details — never 'Confirmed details' or 'The facts'. Not the JSON field 'key_facts' sent to the model.
  ///
  /// In en, this message translates to:
  /// **'Key details'**
  String get toolSectionKeyDetails;

  /// Name of the Ask-a-source tool, keyed by the tool id 'ask-document'. Rendered on the Studio card, the run screen app bar, and the Security centre transfer-journal row. 'Source' is the product's glossary noun for a captured document — use the same term already chosen for Source elsewhere in this ARB. The tool id is never translated.
  ///
  /// In en, this message translates to:
  /// **'Ask about a source'**
  String get toolTitleAskDocument;

  /// SAFETY: this is a promise about what the tool will and will not do, not a marketing line. Two clauses, both required: answers come only from the material the user selected, AND when the material does not contain the answer the tool returns nothing rather than guessing. Dropping or softening '— or nothing' turns a grounding guarantee into a boast and invites the reader to trust answers drawn from the model's general knowledge, which is the exact failure this tool exists to prevent. Do not translate it as 'or almost nothing', 'or very little', or as a promise of complete answers. Keep the em dash or the locale's equivalent break.
  ///
  /// In en, this message translates to:
  /// **'Answers grounded in what you selected — or nothing.'**
  String get toolDescriptionAskDocument;

  /// SAFETY: the heading shown when the model reported it could not answer from the selected material. It asserts only what Action failed to find, and must never become a claim about the world. Banned renderings: 'There is no answer', 'The answer is no', 'No answer exists', 'Nothing found'. The scope phrase 'in this material' is load-bearing and must survive — a not-found must read as not-found, never as a finding. It must also never read as an error or a failure of the app; not finding an answer is a correct outcome.
  ///
  /// In en, this message translates to:
  /// **'No answer in this material'**
  String get toolSectionNoAnswer;

  /// SAFETY: the body under toolSectionNoAnswer, shown when the model gave no reason of its own. A scoped negative claim with three parts that must all survive: the subject is Action (the app), the verb is failing to find, and the scope is the document the user selected. It must not generalise into 'that is not in the document', 'there is no such information' or 'the document does not say' — absence of a finding is not evidence of absence. 'Action' here is the Latin brand name, not the translated domain noun for a task. Keep the straight apostrophe: this value is byte-identical to the Dart literal.
  ///
  /// In en, this message translates to:
  /// **'Action couldn\'t find that in the selected document.'**
  String get toolSectionNoAnswerBody;

  /// Heading above the grounded answer, shown only when the model reported it could answer from the selected material. A plain noun label. Not the JSON field 'answer' sent to the model, and not the same string as toolSectionNoAnswer, which replaces this whole section when nothing was found.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get toolSectionAnswer;

  /// SAFETY: a provenance claim. The block beneath this heading is verbatim text checked against the source and styled as a quotation. It must say the words came OUT OF the document. If it is rendered as 'About the document', 'On the document' or 'Regarding the document', the reader takes a model paraphrase for the document's own words and the evidence affordance is destroyed. Use the locale's ordinary preposition of extraction, and the same glossary word for a document used in toolTitleDocumentIntelligence.
  ///
  /// In en, this message translates to:
  /// **'From the document'**
  String get toolSectionFromTheDocument;

  /// SAFETY: the caution banner shown above an answer whose supporting quote could not be located in the selected material. This is the sentence that stops an unevidenced answer being read as a confirmed one, and both halves are load-bearing. First: the quote was NOT found — not 'may not be exact', not 'could not be fully verified', not 'may be paraphrased'. Second: the explicit instruction to treat the answer as unreliable — an imperative to the reader, not a hedge about the app. Do not merge the two sentences into a single softened clause, and do not add reassurance. Assembled in Dart from two adjacent literals; it is one sentence pair here.
  ///
  /// In en, this message translates to:
  /// **'The quote behind this answer is not in the selected material. Treat the answer as unreliable.'**
  String get toolWarningQuoteNotFound;

  /// Name of the Smart Summary tool, keyed by the tool id 'smart-summary'. Rendered on the Studio card, the run screen app bar, and the Security centre transfer-journal row. An imperative verb ('Summarise'), matching the imperative style of the other tool names — not the noun 'Summary', which is a separate string. British spelling in English; use the locale's ordinary verb. The tool id is never translated.
  ///
  /// In en, this message translates to:
  /// **'Summarise'**
  String get toolTitleSmartSummary;

  /// One-line blurb under the Summarise title on the Studio card and run screen, and interpolated into studioToolSemantics. The two halves name two of the modes the user can pick: the clause before the dash is the Quick mode, the clause after it is the Action-focused mode (toolModeActionFocused) — the part of the material that changes what the reader has to do. Translate for that contrast rather than word for word; a literal rendering of 'affects you' as 'concerns you' or 'is about you' loses it. Keep the em dash or the locale's equivalent break.
  ///
  /// In en, this message translates to:
  /// **'The short version — or the version that affects you.'**
  String get toolDescriptionSmartSummary;

  /// Heading above the bullet list of the summary result. Same English as the mode label toolModeKeyPoints and it must be translated identically — the user picks that chip and then reads this heading. Not the JSON field 'key_points' sent to the model.
  ///
  /// In en, this message translates to:
  /// **'Key points'**
  String get toolSectionKeyPoints;

  /// Name of the Compare Documents tool, keyed by the tool id 'compare-documents'. Rendered on the Studio card, the run screen app bar, and the Security centre transfer-journal row. An imperative verb plus a plural noun; the tool takes two or more sources, so avoid a dual form that promises exactly two. The tool id is never translated.
  ///
  /// In en, this message translates to:
  /// **'Compare documents'**
  String get toolTitleCompareDocuments;

  /// One-line blurb under the Compare documents title on the Studio card and run screen, and interpolated into studioToolSemantics. Three parallel clauses naming the result's sections — keep them parallel and keep all three. The third clause carries the same caution as toolSectionOnlyInOne: 'missing' means text found in one source and not located in the others, so it must not become an assertion that a document is defective, incomplete or wrongly drafted. The tool explains differences; it never rules on which source is right.
  ///
  /// In en, this message translates to:
  /// **'What changed, what conflicts, what is missing.'**
  String get toolDescriptionCompareDocuments;

  /// SAFETY: heading over what the tool found to be different between the compared sources. It must stay clearly distinguishable from toolSectionConflicts ('Conflicts'): a difference is not a contradiction, and a locale that renders both headings with the same word collapses a distinction the comparison is built on. It must also stay descriptive — never 'What is wrong', 'Errors' or anything implying one source is at fault. Not the JSON field 'differences' sent to the model.
  ///
  /// In en, this message translates to:
  /// **'What differs'**
  String get toolSectionWhatDiffers;

  /// SAFETY: heading over places where the compared sources contradict each other — a stronger claim than that they merely differ. It must not soften into the word used for toolSectionWhatDiffers, and it must not harden into a judgement about which source is right or which is legally correct; the tool is explicitly forbidden from ruling on that. A plain noun for contradiction between the texts, not for a dispute between people.
  ///
  /// In en, this message translates to:
  /// **'Conflicts'**
  String get toolSectionConflicts;

  /// SAFETY: heading over content found in one of the compared sources and not located in the others. An absence claim about where the tool did and did not find text — never a claim that a document omits something it ought to contain. Banned renderings: 'Missing from the other document', 'Left out', 'Omitted'. The English is deliberately vague about how many sources there are, because the tool accepts two or more: do not force a dual or a two-document form in languages that would otherwise pick one. Not the JSON field 'only_in_one' sent to the model.
  ///
  /// In en, this message translates to:
  /// **'Only in one of them'**
  String get toolSectionOnlyInOne;

  /// SAFETY: heading over what the compared sources share. It claims overlap, not equivalence — it must never be rendered as 'The same', 'Identical' or 'No differences', which would tell the reader the documents match when the tool only found some shared content. Not the JSON field 'in_common' sent to the model.
  ///
  /// In en, this message translates to:
  /// **'In common'**
  String get toolSectionInCommon;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy, so keep it short and keep it a noun.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get sensitiveKindEmail;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy, so keep it short and keep it a noun.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get sensitiveKindPhone;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy, so keep it short and keep it a noun.
  ///
  /// In en, this message translates to:
  /// **'Payment card number'**
  String get sensitiveKindPaymentCard;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy. IBAN is an international standard and stays IBAN; translate only the words around it.
  ///
  /// In en, this message translates to:
  /// **'Bank account (IBAN)'**
  String get sensitiveKindIban;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy. Deliberately generic — the patterns are not tied to one country's scheme, so do not name a local one.
  ///
  /// In en, this message translates to:
  /// **'National identity number'**
  String get sensitiveKindNationalId;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy. Use whatever the local word is — postal code, ZIP code, CAP.
  ///
  /// In en, this message translates to:
  /// **'Postcode'**
  String get sensitiveKindPostcode;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy, so keep it short and keep it a noun.
  ///
  /// In en, this message translates to:
  /// **'Account number'**
  String get sensitiveKindAccountNumber;

  /// Names a kind of sensitive detail found in a document — a policy, invoice or claim reference. Also uppercased into the marker that replaces the value in the redacted copy.
  ///
  /// In en, this message translates to:
  /// **'Reference number'**
  String get sensitiveKindReference;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy, so keep it short and keep it a noun.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get sensitiveKindDateOfBirth;

  /// Names a kind of sensitive detail found in a document. Also uppercased into the marker that replaces the value in the redacted copy, so keep it short and keep it a noun.
  ///
  /// In en, this message translates to:
  /// **'Web address'**
  String get sensitiveKindUrl;

  /// SAFETY: the only verdict in this feature that claims something was actually checked, and it is shown only when a cryptographic signature verified. It must not be weakened into 'probably genuine' or widened into a claim about the picture's content — what was verified is the file's provenance signature, nothing else.
  ///
  /// In en, this message translates to:
  /// **'Verified provenance available'**
  String get verdictVerifiedProvenance;

  /// SAFETY: two claims, both required — a signature exists, and it was checked and passed. It must not become a claim that the image is real, unedited or not AI-generated. Only the signature was checked.
  ///
  /// In en, this message translates to:
  /// **'This file carries a signature that was checked and held up.'**
  String get verdictVerifiedProvenanceExplainer;

  /// SAFETY: the most dangerous string in the product. 'Consistent with' is the entire claim and may not be dropped: this must never read as 'this was made by AI', 'AI-generated' on its own, 'fake', or any percentage or confidence. The file declared a generative tool in its metadata; metadata is trivially edited. Keep the hedge even if the language makes it clumsy.
  ///
  /// In en, this message translates to:
  /// **'Signals consistent with AI-generated content'**
  String get verdictSignalsSynthetic;

  /// SAFETY: three claims that must all survive — the file itself says this, metadata can be edited or removed, and this is a claim rather than proof. 'not proof' is the clause a translation must never lose. Attribute the statement to the file, never to Action.
  ///
  /// In en, this message translates to:
  /// **'This file says it was made with a generative tool. Metadata can be edited or removed, so this is what the file claims, not proof.'**
  String get verdictSignalsSyntheticExplainer;

  /// SAFETY: 'consistent with' is part of the claim and may not be dropped. Editing software is ordinary; this must not read as 'doctored', 'manipulated', 'tampered with' or 'faked'.
  ///
  /// In en, this message translates to:
  /// **'Signals consistent with edited content'**
  String get verdictSignalsEdited;

  /// SAFETY: three claims that must all survive — the file itself says this, it is ordinary for photographs, and it does not by itself mean anything was faked. Dropping the second or third turns a neutral fact into an accusation.
  ///
  /// In en, this message translates to:
  /// **'This file says it passed through editing software. That is ordinary for photographs and does not by itself mean anything was faked.'**
  String get verdictSignalsEditedExplainer;

  /// SAFETY: says nothing was found, not that anything is wrong. It must not become 'unverified', 'suspicious', 'no provenance' as a defect, or any wording implying the file failed a check.
  ///
  /// In en, this message translates to:
  /// **'No reliable provenance found'**
  String get verdictNoReliableProvenance;

  /// SAFETY: three claims that must all survive — there is no provenance information, this is normal because most services strip it, and it is not a sign of anything. The last clause is the one that stops an absence being read as evidence; it may not be dropped or softened.
  ///
  /// In en, this message translates to:
  /// **'There is no provenance information in this file. That is normal — most services strip it — and it is not a sign of anything.'**
  String get verdictNoReliableProvenanceExplainer;

  /// SAFETY: the honest and most common answer, not a failure. It must not be translated as 'error', 'could not be checked', 'unknown file' or anything that reads as the tool breaking. It must also stay distinct from verdictNoReliableProvenance — those are different answers.
  ///
  /// In en, this message translates to:
  /// **'Inconclusive'**
  String get verdictInconclusive;

  /// SAFETY: states a limit of the evidence, not a suspicion about the file. Keep it about what is not known; do not add a hint that the file is therefore doubtful.
  ///
  /// In en, this message translates to:
  /// **'There is not enough information here to say where this came from.'**
  String get verdictInconclusiveExplainer;

  /// Label of a fact read out of a file's EXIF metadata: the camera make and model the file declares. The value beside it comes from the file and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get authenticitySignalCamera;

  /// Label of a fact read out of a file's EXIF metadata: the software the file declares. The value beside it comes from the file and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Software'**
  String get authenticitySignalSoftware;

  /// Label of a fact read out of a file's EXIF metadata: the image description the file carries. The value beside it comes from the file and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get authenticitySignalDescription;

  /// Label of a fact read out of a file's EXIF metadata: the copyright string the file carries. The value beside it comes from the file and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Copyright'**
  String get authenticitySignalCopyright;

  /// Label of a fact about a file's EXIF metadata: whether GPS data is present. See authenticitySignalLocationValue — the coordinates themselves are never shown.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get authenticitySignalLocation;

  /// SAFETY: a statement of presence only. Action deliberately does not display the coordinates. It must not become 'taken at', name a place, or suggest the location has been read or resolved — only that the data is in the file.
  ///
  /// In en, this message translates to:
  /// **'Location data is present in this file.'**
  String get authenticitySignalLocationValue;

  /// Label of the C2PA / Content Credentials row. Content Credentials is the standard's own name and normally stays in English, like C2PA itself.
  ///
  /// In en, this message translates to:
  /// **'Content Credentials'**
  String get authenticitySignalContentCredentials;

  /// SAFETY: 'not checked' and 'not found' are different claims and this is the first one. It must never become 'no credentials found', 'none', or anything implying a check ran and came back empty. The reason clause — that this build has no verifier — must survive.
  ///
  /// In en, this message translates to:
  /// **'Not checked — this build has no signature verifier.'**
  String get authenticitySignalContentCredentialsValue;

  /// Label of the row shown when the bytes could not be inspected at all. Its value is either authenticitySignalFileUnreadableValue or authenticitySignalFileUnrecognisedValue.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get authenticitySignalFile;

  /// Shown when decoding the bytes threw. Must stay distinct from authenticitySignalFileUnrecognisedValue: this one is 'the bytes broke the decoder', that one is 'the bytes are not a format we know'.
  ///
  /// In en, this message translates to:
  /// **'Could not be read as an image.'**
  String get authenticitySignalFileUnreadableValue;

  /// Shown when the bytes decoded to nothing known. Must stay distinct from authenticitySignalFileUnreadableValue. 'Recognised' means recognised by Action, not invalid in general.
  ///
  /// In en, this message translates to:
  /// **'Not a recognised image format.'**
  String get authenticitySignalFileUnrecognisedValue;

  /// Label of the single row shown when the thing being inspected is text rather than an image. Its value is authenticitySignalTextValue. Deliberately not shared with todayQuickText, which is the same English word as a capture button — that one can become an imperative like 'Paste text' in languages where a bare noun reads oddly on a button, and this one is a field label that must stay a noun.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get authenticitySignalText;

  /// SAFETY: two claims, both required — text cannot reliably answer the question, and Action therefore does not guess. It must never be softened into 'may be AI-generated', a likelihood, a score, or a promise of a better answer later. 'Action' here is the product name and stays in Latin script.
  ///
  /// In en, this message translates to:
  /// **'Text alone cannot reliably show whether AI was used. Action does not guess.'**
  String get authenticitySignalTextValue;

  /// Names what a file's contents actually are, from its leading bytes. Shown on its own as a fact value and inside fileMismatchNote after 'its contents are', so it reads as a noun phrase with whatever article the language uses.
  ///
  /// In en, this message translates to:
  /// **'a PNG image'**
  String get fileTypePng;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'a JPEG image'**
  String get fileTypeJpeg;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'a GIF image'**
  String get fileTypeGif;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'a WebP image'**
  String get fileTypeWebp;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'a WAV recording'**
  String get fileTypeWav;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'. PDF is a format name and stays PDF.
  ///
  /// In en, this message translates to:
  /// **'a PDF document'**
  String get fileTypePdf;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'a HEIC image'**
  String get fileTypeHeic;

  /// Names what a file's contents actually are. Deliberately vague: the byte signature covers MP4, MOV, M4A and more, so do not name a specific format here.
  ///
  /// In en, this message translates to:
  /// **'a video file'**
  String get fileTypeVideo;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'a TIFF image'**
  String get fileTypeTiff;

  /// Names what a file's contents actually are — a Windows BMP file. Lowercase 'bitmap' is the everyday word, not the format's initials.
  ///
  /// In en, this message translates to:
  /// **'a bitmap image'**
  String get fileTypeBitmap;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'an RTF document'**
  String get fileTypeRtf;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'a Zip archive'**
  String get fileTypeZip;

  /// Names what a file's contents actually are. gzip is a tool name and is conventionally lowercase.
  ///
  /// In en, this message translates to:
  /// **'a gzip archive'**
  String get fileTypeGzip;

  /// Names what a file's contents actually are. 7-Zip is a product name and stays as written.
  ///
  /// In en, this message translates to:
  /// **'a 7-Zip archive'**
  String get fileTypeSevenZip;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'a RAR archive'**
  String get fileTypeRar;

  /// SAFETY: names a format, and only a format. Action is not a virus scanner and holds no opinion about whether the file is dangerous. It must not become 'executable file — be careful', a warning, or anything with 'malware', 'virus' or 'unsafe' in it. Windows is a product name and stays as written.
  ///
  /// In en, this message translates to:
  /// **'a Windows program'**
  String get fileTypeWindowsProgram;

  /// SAFETY: names a format, and only a format. Action is not a virus scanner and holds no opinion about whether the file is dangerous. It must not become a warning. Linux is a product name and stays as written.
  ///
  /// In en, this message translates to:
  /// **'a Linux program'**
  String get fileTypeLinuxProgram;

  /// Names what a file's contents actually are. PostScript is a format name and stays as written.
  ///
  /// In en, this message translates to:
  /// **'a PostScript document'**
  String get fileTypePostScript;

  /// Names what a file's contents actually are. Ogg is a format name and stays as written.
  ///
  /// In en, this message translates to:
  /// **'an Ogg recording'**
  String get fileTypeOgg;

  /// Names what a file's contents actually are. Shown on its own and inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'an MP3 recording'**
  String get fileTypeMp3;

  /// Names what a file's contents actually are. The one entry with no article in English, because it is a mass noun — use whatever reads naturally, including inside fileMismatchNote after 'its contents are'.
  ///
  /// In en, this message translates to:
  /// **'plain text'**
  String get fileTypePlainText;

  /// SAFETY: shown when a file's extension disagrees with its actual bytes. Two clauses that must both survive — that this can be an honest mistake, and that it is also how a file gets opened by something other than what you expected. Dropping the first turns a neutral observation into an accusation; dropping the second removes the only reason to show it at all. It must not be turned into a malware warning: Action does not scan for malware and says nothing about whether the file is dangerous. {contents} is one of the fileType… strings and arrives already translated; {extension} is the letters after the dot, and the straight quotes around it are part of the sentence.
  ///
  /// In en, this message translates to:
  /// **'This file is named \".{extension}\" but its contents are {contents}. That can be an honest mistake, and it is also how a file gets opened by something other than what you expected.'**
  String fileMismatchNote(String extension, String contents);

  /// A file size under one kilobyte. The English source formatted every count as 'bytes'; the plural is the correction, so use your language's own plural categories rather than mirroring English's two.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 byte} other{{count} bytes}}'**
  String fileSizeBytes(int count);

  /// A file size in kilobytes. {size} arrives already formatted for the locale, decimal separator and digits included. Translate the unit only if your language has its own abbreviation for it — many keep KB. Same English as sourceKilobytes and deliberately a separate key: that one takes a whole number and this one a decimal string, so they cannot share a signature.
  ///
  /// In en, this message translates to:
  /// **'{size} KB'**
  String fileSizeKilobytes(String size);

  /// A file size in megabytes. {size} arrives already formatted for the locale. Translate the unit only if your language has its own abbreviation for it — many keep MB.
  ///
  /// In en, this message translates to:
  /// **'{size} MB'**
  String fileSizeMegabytes(String size);

  /// A file size in gigabytes. {size} arrives already formatted for the locale. Translate the unit only if your language has its own abbreviation for it — many keep GB.
  ///
  /// In en, this message translates to:
  /// **'{size} GB'**
  String fileSizeGigabytes(String size);

  /// SAFETY: the name for the worst finding the credential scanner can make - the private half of a key pair, found in text the user was about to share. It is the key itself, not a token derived from it. Use the established cryptographic term in this language; a rendering meaning 'personal key', 'secret code' or 'password' understates it and changes how urgently a reader acts. It must not be softened into anything meaning 'private data' or 'confidential information'. Also used as the label for an assignment named `private_key`, so it has to read correctly both as a heading over a masked key block and as a row label.
  ///
  /// In en, this message translates to:
  /// **'Private key'**
  String get credentialKindPrivateKey;

  /// SAFETY: the name for a credential issued by a service provider, found in text the user was about to share. 'API' is the industry abbreviation and stays as it is in every language that uses it; what may be translated is the word for key. It must keep naming a thing that grants access - never a word meaning 'identifier', 'reference' or 'code', which would let a reader dismiss it. Reused as the label for an assignment named `api_key` or `apikey`, so it must work as a row label as well as a heading.
  ///
  /// In en, this message translates to:
  /// **'API key'**
  String get credentialKindApiKey;

  /// SAFETY: the name for a database or service URI that carries a password inside it, such as postgres://user:password@host. Use the developer term this language actually uses for that string; the label has to be recognisable to someone who wrote the config file. It must stay a name for a credential-bearing address, never a neutral word for 'address' or 'link' - the whole point is that it opens something and carries the means to open it.
  ///
  /// In en, this message translates to:
  /// **'Connection string'**
  String get credentialKindConnectionString;

  /// SAFETY: the name for a JSON Web Token or similar bearer token found in the text. It must keep the sense of something that grants access on presentation - anyone holding it can use it. Never render it as 'access code', 'ticket' or 'identifier'. Reused as the label for an assignment named `access_token`, so it must read as a row label as well as a heading.
  ///
  /// In en, this message translates to:
  /// **'Access token'**
  String get credentialKindAccessToken;

  /// SAFETY: the name for an `Authorization:` or `X-API-Key:` line pasted out of a terminal or a network inspector. Use the term this language's developers use for an HTTP header; the header name itself is protocol syntax and is never translated. The label must keep pointing at a header carrying a live credential, not at 'permission' or 'authorisation' in the abstract sense of being allowed to do something.
  ///
  /// In en, this message translates to:
  /// **'Authorization header'**
  String get credentialKindAuthorizationHeader;

  /// SAFETY: the name for a `name = value` assignment whose name was a secret-ish keyword - password, api_key, client_secret. The 'or' is deliberate and must survive: the scanner knows the keyword said secret, and does not know which of the two kinds of secret it is. A translation that picks one and drops the other asserts more than the scan established. Distinct from credentialLabelPassword, which is the narrower label used when the keyword actually said password.
  ///
  /// In en, this message translates to:
  /// **'Password or key'**
  String get credentialKindPasswordOrKey;

  /// SAFETY: the name for the weakest finding in the scanner - a long random-looking string with no keyword to explain it, found by entropy alone. 'Possible' is the load-bearing word and must appear in the translation; without it the label asserts a credential that the scan did not establish, and the accompanying advice (credentialAdviceHighEntropyString) then contradicts the label. Forbidden renderings: anything meaning 'Secret found', 'Hidden secret' or 'Detected credential'.
  ///
  /// In en, this message translates to:
  /// **'Possible secret'**
  String get credentialKindPossibleSecret;

  /// SAFETY: what to do about a private key block found in text about to be shared. Two clauses and both are required. The first is the remedy: take it out AND replace the key pair - deleting the text alone is not the fix, and a translation that keeps only 'remove this' gives dangerous advice. The second clause is the refusal to reassure: once a private key has been seen it cannot be made safe again. That sentence must not be softened into 'should be replaced', 'is best rotated' or anything conditional; it is stating an irreversible fact, not a recommendation. Never introduce a word meaning 'safe', 'secure' or 'protected' as something the user can restore this key to.
  ///
  /// In en, this message translates to:
  /// **'Remove this before sharing, and replace the key pair. A private key cannot be made safe again once it has been seen.'**
  String get credentialAdvicePrivateKey;

  /// SAFETY: the single most important sentence in the credential scanner, and the one the tests assert on. Two clauses, both mandatory. First: revoke the key WITH THE PROVIDER and issue a new one - the action happens on the provider's side, not in this app and not in the document, and the translation must keep the provider as the place the revocation happens. Second: removing the key from the document does not disable it. That clause is the whole refusal to reassure - it exists because deleting the line and stopping there is the most common mistake made after a key leaks, and the user is left believing they have fixed something they have not. It must not be dropped, merged into the first clause, or weakened into 'may not be enough' or 'is not always sufficient'; it is an absolute statement. Use the standard term the local developer community uses for revoking or invalidating a key.
  ///
  /// In en, this message translates to:
  /// **'Revoke this key with the provider and issue a new one. Removing it from the document does not disable it.'**
  String get credentialAdviceProviderApiKey;

  /// SAFETY: what to do about a connection string found in shared text. Two clauses, both required. The first names why this finding is worse than a bare password: it carries the credential AND the address that credential opens, so a reader gets both halves at once. The second is conditional on purpose - change the password IF it has already been shared - and the condition must survive rather than becoming an unconditional order; the scanner does not know whether the text left the device. Do not add any clause implying the string is safe once redacted.
  ///
  /// In en, this message translates to:
  /// **'This carries a password and the address it opens. Change the password if this has already been shared.'**
  String get credentialAdviceConnectionString;

  /// SAFETY: what to do about a JSON Web Token. The whole sentence is a refusal to reassure and every part of it carries weight. 'often expire, but not always' must keep both halves - a translation that keeps only 'these expire' turns a hedge into a dismissal and tells the user to ignore a live credential. The second sentence sets the default: treat it as live, and the burden is on the user to know otherwise. 'unless you know when it expires' must stay a condition the user has to satisfy, never a reassurance that it has probably expired.
  ///
  /// In en, this message translates to:
  /// **'Tokens like this often expire, but not always. Treat it as live unless you know when it expires.'**
  String get credentialAdviceJsonWebToken;

  /// SAFETY: what to do about an Authorization header found in pasted text. The first sentence is the remedy and must say to remove the VALUE, not the header line in general. The second sentence is the reason and must keep 'a working token' - the point is that the token in a pasted log is usually still live, not an expired artefact. 'by accident' must survive: this is a description of how leaks happen, not an accusation. Do not turn 'one of the most common ways' into a claim about frequency the app cannot support, and do not drop the hedge so it reads as 'the most common way'.
  ///
  /// In en, this message translates to:
  /// **'Remove the header value. Pasted request logs are one of the most common ways a working token gets shared by accident.'**
  String get credentialAdviceAuthorizationHeader;

  /// SAFETY: what to do about a secret written as `name = value` in a file. Two clauses, both required. The first names two acceptable destinations - an environment variable or a secret store - and both must survive, because a reader offered only one may have neither available. Use the terms developers in this language actually use for those two things. The second clause is conditional and must stay conditional: change the value IF the file has been shared. The scanner does not know whether it was.
  ///
  /// In en, this message translates to:
  /// **'Move this into an environment variable or a secret store, and change the value if the file has been shared.'**
  String get credentialAdviceKeyedAssignment;

  /// SAFETY: the advice for the entropy pass, which is the one that can cry wolf. The first sentence is an admission of ignorance and must stay one: Action cannot tell what this string is. It must not become 'Action is not sure' softened toward a lean either way, and it must certainly not become 'Action found a secret'. 'it may equally be an identifier or a checksum' carries the balance - the word meaning 'equally' or 'just as likely' must survive, because without it the sentence reads as a hedged accusation rather than a genuine coin toss. Both innocent possibilities must be named. 'Action' is the product name and is never translated. The em dash may become whatever this language uses to join the two halves.
  ///
  /// In en, this message translates to:
  /// **'Action cannot tell what this is. Check it before sharing — it may equally be an identifier or a checksum.'**
  String get credentialAdviceHighEntropyString;

  /// SAFETY: the label on a finding whose prefix identified it as a key issued by Anthropic. 'Anthropic' is a company name and stays verbatim in every language and every script - do not transliterate it. 'API' stays as the abbreviation. Only the word for key may be translated, and it must keep meaning a credential that grants access, never 'code' or 'identifier'. The label sits beside a masked value in the findings list and is what tells the user which account to go and revoke.
  ///
  /// In en, this message translates to:
  /// **'Anthropic API key'**
  String get credentialLabelAnthropicApiKey;

  /// SAFETY: the label for a key matched by the `sk-proj-` prefix. 'OpenAI' is a company name and stays verbatim - not transliterated, not spaced, not case-changed. 'project' names OpenAI's own scoping concept for these keys and should use whatever word that vendor's own documentation uses in this language if one exists. The word for key must keep meaning a credential that grants access. Must stay distinguishable from credentialLabelOpenAiStyleApiKey, which is the weaker, unattributed match.
  ///
  /// In en, this message translates to:
  /// **'OpenAI project key'**
  String get credentialLabelOpenAiProjectKey;

  /// SAFETY: the label for a bare `sk-` prefixed key, which follows OpenAI's shape but is used by many other services too. '-style' is the hedge and is the load-bearing part: the scanner is naming a SHAPE, not asserting the vendor. A translation that drops it and says 'OpenAI API key' makes a claim about whose key this is that the match does not support, and would send a user to revoke it at the wrong provider. Use whatever construction this language uses for 'in the style of' or 'of the X kind'. 'OpenAI' and 'API' stay verbatim.
  ///
  /// In en, this message translates to:
  /// **'OpenAI-style API key'**
  String get credentialLabelOpenAiStyleApiKey;

  /// SAFETY: the label for a key matched by the `AIza` prefix. 'Google' is a company name and stays verbatim. 'API' stays as the abbreviation. Only the word for key may be translated, and it must keep meaning a credential that grants access.
  ///
  /// In en, this message translates to:
  /// **'Google API key'**
  String get credentialLabelGoogleApiKey;

  /// SAFETY: the label for a `ya29.` access token. 'Google' is a company name and 'OAuth' is a protocol name; both stay verbatim in every language and script. Only the word for token may be translated, and it must keep the sense of something that grants access on presentation. Must stay distinguishable from credentialLabelGoogleApiKey - they are revoked in different places.
  ///
  /// In en, this message translates to:
  /// **'Google OAuth token'**
  String get credentialLabelGoogleOAuthToken;

  /// SAFETY: the label for a `ghp_`/`gho_`/`ghu_`/`ghs_`/`ghr_` token. 'GitHub' is a product name and stays verbatim, including its internal capital H. Only the word for token may be translated, and it must keep meaning a live credential rather than a symbol or a marker.
  ///
  /// In en, this message translates to:
  /// **'GitHub token'**
  String get credentialLabelGitHubToken;

  /// SAFETY: the label for an `xox`-prefixed token. 'Slack' is a product name and stays verbatim - never translated to the ordinary adjective meaning loose or slow, which is a real risk here. Only the word for token may be translated, and it must keep meaning a live credential.
  ///
  /// In en, this message translates to:
  /// **'Slack token'**
  String get credentialLabelSlackToken;

  /// SAFETY: the label for an `AKIA` access key identifier. 'AWS' is a product name and stays verbatim. The rest names Amazon's own term for this value; use the wording AWS documentation uses in this language if there is one, and keep 'ID' recognisable. The label must not lose the sense that this is half of a credential pair that grants access to an account - a reader who reads it as a mere identifier will not go and revoke it.
  ///
  /// In en, this message translates to:
  /// **'AWS access key ID'**
  String get credentialLabelAwsAccessKeyId;

  /// SAFETY: the label for a `glpat-` personal access token. 'GitLab' is a product name and stays verbatim, including its internal capital L. Only the word for token may be translated, and it must keep meaning a live credential.
  ///
  /// In en, this message translates to:
  /// **'GitLab token'**
  String get credentialLabelGitLabToken;

  /// SAFETY: the label for an `npm_` token. 'npm' is a product name, is written lowercase by its own convention, and stays verbatim - do not capitalise it to fit a sentence-case rule. Only the word for token may be translated, and it must keep meaning a live credential that can publish packages.
  ///
  /// In en, this message translates to:
  /// **'npm token'**
  String get credentialLabelNpmToken;

  /// SAFETY: the label for an assignment whose name contained 'passphrase'. Where this language distinguishes a passphrase from a password, keep the distinction - a passphrase usually unlocks a key rather than an account, and collapsing it into the ordinary word for password loses that. Where no distinction exists, the ordinary word is correct. Must keep naming a secret, never a hint or a prompt.
  ///
  /// In en, this message translates to:
  /// **'Passphrase'**
  String get credentialLabelPassphrase;

  /// SAFETY: the label for an assignment whose name contained 'password' or 'passwd'. The everyday word for a password in this language. It must name the secret itself, not a password field, a password prompt or a password policy. Distinct from credentialKindPasswordOrKey, which is the broader label used when the keyword did not say which kind of secret this is.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get credentialLabelPassword;

  /// SAFETY: the label for an assignment whose name contained 'refresh'. Use the standard OAuth term this language's developers use. It must keep meaning the long-lived credential that mints new access tokens - a reader who mistakes it for something short-lived will under-react. Must stay distinguishable from credentialKindAccessToken.
  ///
  /// In en, this message translates to:
  /// **'Refresh token'**
  String get credentialLabelRefreshToken;

  /// SAFETY: the label for an assignment whose name contained 'token' but nothing more specific. It is deliberately generic: the scanner knows only that the author called it a token. It must keep meaning a credential that grants access on presentation, and must not drift into the other senses of the word - a lexical token, a placeholder, a physical token, or a gesture.
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get credentialLabelToken;

  /// SAFETY: the label for an assignment whose name contained 'client'. Use the standard OAuth term this language's developers use for the secret half of a client credential pair. 'client' here is the application, not a customer - a translation that renders it as the word for a customer or a purchaser makes the label meaningless to the developer who wrote the config file.
  ///
  /// In en, this message translates to:
  /// **'Client secret'**
  String get credentialLabelClientSecret;

  /// SAFETY: the label for an assignment whose name contained 'credential'. The general term for something that grants access. It must not be softened into a word meaning 'identity', 'qualification' or 'reference', which are the everyday senses of the English word and none of which convey that this value opens something.
  ///
  /// In en, this message translates to:
  /// **'Credential'**
  String get credentialLabelCredential;

  /// SAFETY: the fallback label for an assignment whose name matched the keyword list but said nothing more specific. It is the least informative label the scanner has and should stay a plain noun meaning a value that must not be disclosed. It must not become an adjective meaning 'hidden' or 'confidential' describing something else, and it must not be softened - a reader still has to understand this is a live credential to act on.
  ///
  /// In en, this message translates to:
  /// **'Secret'**
  String get credentialLabelSecret;

  /// SAFETY: the most dangerous string in the product to translate. It is the link inspector's verdict when nothing structural stood out, and the app's own tests assert that no verdict it can produce contains a word meaning safe. This is a report that the check found nothing, NOT a statement that the link is safe - a phishing page on a short, correctly spelled HTTPS hostname produces exactly this verdict. Forbidden renderings: anything meaning 'Safe', 'Looks safe', 'No problems', 'No risk', 'Clean', 'OK', 'Verified', 'Trusted' or a green tick in words. 'obvious' is load-bearing and must appear: it scopes the claim to what was visible in how the address is written. Keep it a noun phrase about signals, not a judgement about the link. If this language has no natural word for 'signal' in this sense, use its word for indication or sign - never for danger, and never for approval.
  ///
  /// In en, this message translates to:
  /// **'No obvious signals'**
  String get linkVerdictNoObviousSignals;

  /// SAFETY: the link inspector's middle verdict, used when exactly one non-urgent observation was made. It has to sit clearly between linkVerdictNoObviousSignals and linkVerdictTreatWithCaution - a translation that lands too close to either collapses a three-level scale into two. It advises a second look; it does not allege anything. Never render it as a word meaning 'suspicious', 'risky' or 'unsafe', and never as anything reassuring.
  ///
  /// In en, this message translates to:
  /// **'Worth checking'**
  String get linkVerdictWorthChecking;

  /// SAFETY: the link inspector's strongest verdict, used when a serious signal was seen or several minor ones were. It is the strongest thing this product will say about a link, and it still stops short of an accusation: the inspector reads the address only and never fetches the page, so it cannot know intent. It must stay advice about how to proceed - never a word meaning 'dangerous', 'malicious', 'fraudulent', 'phishing', 'blocked' or 'harmful', all of which claim knowledge the app does not have.
  ///
  /// In en, this message translates to:
  /// **'Treat with caution'**
  String get linkVerdictTreatWithCaution;

  /// SAFETY: the sentence under the verdict when no signals were found, and the one a reader is most likely to over-read as an all-clear. Three parts and all three are required. First, the scope: what was examined is HOW THE LINK IS WRITTEN, not the page it leads to - that limitation must survive, because it is what makes the rest honest. Second, the explicit withdrawal of reassurance: 'That is not the same as knowing the page is trustworthy'. A test asserts the English still contains 'not the same as'; the translation must carry the same explicit denial rather than merely implying it, and must not be shortened into a hedge like 'may still be unsafe'. Third, where judgement actually sits: only the reader can decide whether they expected this link. That clause hands the decision to the person and must not be dropped or turned into advice from the app. The em dash may become whatever this language uses to join the last two halves.
  ///
  /// In en, this message translates to:
  /// **'Nothing unusual in how this link is written. That is not the same as knowing the page is trustworthy — only you can judge whether you expected it.'**
  String get linkSummaryNoObviousSignals;

  /// SAFETY: the sentence under the verdict when exactly one observation was made. 'One thing' counts observations, not problems, and must not become 'one problem', 'one warning' or 'one risk'. 'before you open it' must survive: the whole value of this tool is that it is read before the tap, and it never opens or fetches anything itself. Keep it advisory and keep it calm - it is the middle of a three-level scale.
  ///
  /// In en, this message translates to:
  /// **'One thing about this link is worth a look before you open it.'**
  String get linkSummaryWorthChecking;

  /// SAFETY: the sentence under the strongest verdict. 'about how this link is written' is the scope limitation and must survive - the app read the address, not the page, and this clause is what stops the sentence becoming an accusation. 'Several things' counts observations, not proven problems. 'before you open it' must survive for the same reason as in linkSummaryWorthChecking. Do not introduce any word meaning dangerous, fraudulent or malicious.
  ///
  /// In en, this message translates to:
  /// **'Several things about how this link is written are worth checking before you open it.'**
  String get linkSummaryTreatWithCaution;

  /// SAFETY: the short chip title for a link that uses http rather than https. It states an absence of transport encryption, which is a fact about the address. It must not be inflated into 'Insecure' or 'Unsafe' - plenty of http links are harmless - and must not be softened into 'Older connection'. A few words only; it sits in a chip or a row title beside the fuller sentence in linkDetailNotHttps.
  ///
  /// In en, this message translates to:
  /// **'Not encrypted'**
  String get linkSignalNotHttps;

  /// SAFETY: the chip title for a URL whose scheme is not http or https - tel:, mailto:, javascript:, or an app's own scheme. It states what the link is not, which is all the inspector knows. Do not render it as 'Suspicious link' or 'App link'; the scheme may be entirely ordinary. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Not a web link'**
  String get linkSignalNonWebScheme;

  /// SAFETY: the chip title for a URL carrying user:password in its authority. It is a statement of fact about the address, and it is the most concrete thing the inspector ever says. Keep it plain and keep it short; the consequence is spelled out in linkDetailEmbeddedCredentials. Do not turn it into 'Leaked password' - nothing has necessarily leaked yet, which is why the user is being shown this before they share it.
  ///
  /// In en, this message translates to:
  /// **'Password in the link'**
  String get linkSignalEmbeddedCredentials;

  /// SAFETY: the chip title for a URL with an @ in the authority, where the part a reader scans first is not the host. 'Hidden' describes what the construction does to a reader, not an intent - the inspector cannot know intent. The phrase must keep pointing at there being a REAL address different from the apparent one, since that is the entire finding. Do not render it as 'Fake address' or 'Deceptive link'. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Hidden real address'**
  String get linkSignalMisleadingAuthority;

  /// The chip title for a URL whose host is a raw IP address rather than a name. A neutral statement of what was seen; numeric hosts are common on local networks and test servers, so it must not be worded as an allegation. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Numeric address'**
  String get linkSignalIpLiteralHost;

  /// SAFETY: the chip title for a host containing an `xn--` label, which is how an internationalised domain name is transported. This is completely normal for domains written in non-Latin scripts - and readers of several of the twenty languages this app ships in use such domains daily. The chip must therefore stay a neutral observation and must not be worded as a warning or an accusation. Keep it distinct from linkSignalEncodedHost, which is about percent-escapes and is a different finding. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Encoded characters in the name'**
  String get linkSignalPunycodeHost;

  /// SAFETY: the chip title for a host mixing Latin letters with Cyrillic or Greek ones that look identical to them. 'Mixed' is the observation; it is not itself proof of a homograph attack. Use this language's ordinary word for writing systems or alphabets. It must stay a description of what the name contains, not a verdict on why. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Mixed alphabets in the name'**
  String get linkSignalMixedScriptHost;

  /// SAFETY: the chip title for percent-escapes appearing inside the hostname, which is not where they belong. Must stay distinct from linkSignalPunycodeHost - that one is about `xn--` and is usually innocent, this one is about `%` sequences in a place they have no business being. Collapsing the two into one wording in this language would merge two different findings. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Escaped characters in the name'**
  String get linkSignalEncodedHost;

  /// The chip title for a URL connecting on a port that is not the default for its scheme. 'port' is the networking term and should use whatever word developers in this language use. Neutral: unusual ports are ordinary on test servers. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Unusual port'**
  String get linkSignalUnusualPort;

  /// The chip title for a hostname with more than four dot-separated labels. 'parts' deliberately avoids the jargon 'subdomains' or 'labels', because this line is read by people who do not know what a subdomain is; keep it in everyday words in this language too. Neutral - many legitimate sites have deep names. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Many parts in the name'**
  String get linkSignalDeepSubdomain;

  /// SAFETY: the chip title for a hostname with something like `.com.` sitting in the middle, so the familiar-looking part of the name is not the part that controls the site. 'Familiar' refers to what the reader recognises, and 'the wrong place' to its position in the name - both halves are needed for the phrase to mean anything. Do not render it as 'Fake domain' or 'Impersonation'; the inspector observed a shape, not an intent. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Familiar name in the wrong place'**
  String get linkSignalPublicSuffixInSubdomain;

  /// The chip title for a link on a known URL-shortening domain. Use whatever this language calls a shortened link. Neutral - shorteners are used constantly and innocently; the finding is only that the destination cannot be read. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Shortened link'**
  String get linkSignalShortener;

  /// SAFETY: the chip title for a link whose path ends in an installer or script extension. It says what the link does - it fetches something that runs - rather than what that something is, which the inspector cannot know. Do not render it as 'Virus', 'Malware' or 'Dangerous download'. Keep 'program' in everyday words rather than jargon. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Downloads a program'**
  String get linkSignalExecutableTarget;

  /// SAFETY: the chip title for a link carrying a second address in a query parameter such as `url=` or `next=`. The hedge is in the verb: it MAY send you on, since the inspector never follows the link to find out. Keep it in everyday words - a reader who does not know what a redirect is must still understand the phrase. Do not render it as 'Redirects to a malicious site'. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Sends you on somewhere else'**
  String get linkSignalRedirectParameter;

  /// The chip title for an unusually long URL or hostname. A neutral statement of a measurement; length alone means nothing, and the reason it is worth noticing is in linkDetailVeryLongUrl. Two or three words only - this is the shortest chip in the set.
  ///
  /// In en, this message translates to:
  /// **'Very long'**
  String get linkSignalVeryLongUrl;

  /// SAFETY: the chip title used when the pasted string could not be parsed as a web address at all. 'readable' means readable BY THE APP - it is a statement about what Action could not determine, not about the string being malformed or malicious. Keep it an admission rather than a verdict; the user pasted something and deserves an answer either way. A few words only.
  ///
  /// In en, this message translates to:
  /// **'Not a readable link'**
  String get linkSignalUnparseable;

  /// SAFETY: the sentence explaining an unencrypted link. 'http' is protocol syntax and stays verbatim, lowercase. The consequence clause is the point and must survive precisely: what is at risk is what the user TYPES INTO the page, and the exposure is IN TRANSIT ('on the way there'). Do not broaden it into 'the page is not secure' or 'your data is not safe', which claim more, and do not narrow it to passwords only. Do not add any reassurance about what https would mean.
  ///
  /// In en, this message translates to:
  /// **'This link uses http, so anything you type into the page can be read on the way there.'**
  String get linkDetailNotHttps;

  /// SAFETY: the sentence for a link whose scheme is not http or https. {scheme} is the scheme exactly as the user typed it (tel, mailto, javascript, an app's own) and is never translated; keep the quotation marks and the trailing colon around it, since together they show the reader what to look for in the address. The second sentence must keep its hedge - 'may ask another app to do something' - because the inspector does not know what the scheme will do or which app will answer. Do not render it as 'will open another app' or 'runs code'.
  ///
  /// In en, this message translates to:
  /// **'This opens with \"{scheme}:\" rather than a web page. It may ask another app to do something.'**
  String linkDetailNonWebScheme(String scheme);

  /// SAFETY: the sentence for a link carrying user:password in its authority. Both halves are required. The first states the fact: the credentials are IN the link. The second states the consequence that makes it urgent - wherever the link travels, the credentials travel too. 'Anywhere it is shared' must stay a general statement covering every future copy, forward and screenshot, not a warning about one particular act of sharing. Do not soften it into 'could be seen by others'.
  ///
  /// In en, this message translates to:
  /// **'A username and password are written into this link. Anywhere it is shared, they go with it.'**
  String get linkDetailEmbeddedCredentials;

  /// SAFETY: the sentence for a URL with an @ in its authority - the classic deceptive-URL construction. Two facts, both required. First, that the browser IGNORES everything before the @ symbol; the @ character is literal syntax and stays verbatim inside its quotation marks. Second, naming the real destination, which is {host} - the host exactly as written in the link, never translated, transliterated or reordered. A test asserts the English still names the real host, so the placeholder must appear in every translation. Keep the quotation marks around the host so a reader can see where the name starts and stops. Do not add a judgement about the link.
  ///
  /// In en, this message translates to:
  /// **'Everything before the \"@\" is ignored by the browser. The real destination is \"{host}\".'**
  String linkDetailMisleadingAuthority(String host);

  /// SAFETY: the sentence for a URL whose host is a raw IP address. {host} is the address as written and is never translated or reformatted; keep it in quotation marks. 'almost always' is the load-bearing hedge in the second sentence and must survive - numeric hosts are entirely ordinary on local networks, and a translation reading 'legitimate sites use a name' turns an observation into a false rule. The em dash may become whatever this language uses to attach the explanatory phrase.
  ///
  /// In en, this message translates to:
  /// **'This goes to \"{host}\" — a raw address rather than a name. Legitimate sites almost always use a name.'**
  String linkDetailIpLiteralHost(String host);

  /// SAFETY: the most carefully balanced sentence in the link inspector, and the one most likely to be mistranslated into an insult. Two claims and BOTH must survive with equal weight. First: this is NORMAL FOR MANY LANGUAGES - readers of several of the twenty languages this app ships in own such domains, and a translation that drops or downgrades this clause tells them their own alphabet is suspicious. Second: it is also how a name can be made to look like a familiar one. The word joining them ('and it is also') must keep them as two coexisting truths, not as a concession followed by the real point. 'non-Latin' names the Latin script specifically and should use this language's term for that writing system; do not render it as 'foreign' or 'strange' characters. Never introduce a word meaning fake, fraudulent or dangerous.
  ///
  /// In en, this message translates to:
  /// **'The site name contains non-Latin characters, stored encoded. This is normal for many languages, and it is also how a name can be made to look like a familiar one.'**
  String get linkDetailPunycodeHost;

  /// SAFETY: the sentence for a hostname mixing Latin with Cyrillic or Greek look-alikes. The first sentence must keep 'that look the same' - the resemblance is the entire reason this is worth showing, and without it the sentence merely says the name is multilingual. 'Latin' names the writing system, not the language; use this language's term for the script. The second sentence is the actionable advice and must survive as a concrete instruction to read the name one character at a time. Do not add any claim that the site is impersonating anything.
  ///
  /// In en, this message translates to:
  /// **'The site name mixes Latin letters with letters from another alphabet that look the same. Read it character by character.'**
  String get linkDetailMixedScriptHost;

  /// SAFETY: the sentence for percent-escapes inside a hostname. 'escape codes' should use whatever term this language uses for percent-encoding; keep it understandable to a non-developer. 'which is not where they belong' is the observation that makes this a finding at all and must survive. The second sentence keeps its hedge - they CAN hide what the name says, not that they are hiding anything here. Do not render it as 'the name is disguised'.
  ///
  /// In en, this message translates to:
  /// **'The site name contains escape codes, which is not where they belong. They can hide what the name actually says.'**
  String get linkDetailEncodedHost;

  /// The sentence for a URL on a non-default port. {port} is a network port number - an identifier, not a quantity, so it is passed as written and must never be given digit grouping, a decimal separator or locale digit substitution that would change what the reader must type or compare. The second sentence is balanced on purpose and both halves are required: common for test servers, unusual for public sites. Dropping the first half turns a neutral observation into a warning.
  ///
  /// In en, this message translates to:
  /// **'This connects on port {port} rather than the usual one. That is common for test servers and unusual for public sites.'**
  String linkDetailUnusualPort(String port);

  /// SAFETY: the sentence for a hostname with many dot-separated labels. English needs only the 'other' form here because this never fires below five parts, but locales with more plural categories should supply the ones their grammar requires - that is why this is a plural rather than a plain placeholder. Two facts, both required. First, how many parts the name has, bound to {count} and not restated in words. Second, that ONLY THE LAST TWO decide who runs the site and the rest can be set to anything - this is the explanation that makes the count meaningful, and without it the sentence is a number with no consequence. 'parts' stays in everyday words rather than becoming 'subdomains' or 'labels'. Keep it a fact about how names work, not an allegation about this one.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{The name has {count} parts. Only the last two decide who runs the site; the rest can be set to anything.}}'**
  String linkDetailDeepSubdomain(int count);

  /// SAFETY: the sentence for a hostname with a public suffix planted inside it, such as paypal.com.secure-login.example. {suffix} is the planted suffix as written - com, org, io - and is never translated. The dots printed either side of it are literal and must stay, because they are what the reader is being shown how to spot; keep the quotation marks too. {host} is the registrable domain that actually controls the site, exactly as written and never translated. Both facts are required: what makes the beginning look convincing, and which name is really in charge. 'actually' carries the correction and must survive. Do not add any word meaning fake, fraudulent or phishing - the inspector observed a shape in a string, nothing more.
  ///
  /// In en, this message translates to:
  /// **'This name contains \".{suffix}.\" in the middle, which makes the beginning look like the site. The site is actually \"{host}\".'**
  String linkDetailPublicSuffixInSubdomain(String suffix, String host);

  /// SAFETY: the sentence for a link on a known shortening domain. Both halves are required. The first states what a shortener does. The second is the honest limit and is the point: the destination CANNOT be determined without opening the link - Action does not follow it, because following it would send the user's browsing somewhere. It must stay an absolute statement of what cannot be known, never 'it is hard to tell' or 'Action could not check this time'. Do not imply the link is untrustworthy; shorteners are used constantly and innocently.
  ///
  /// In en, this message translates to:
  /// **'A shortening service hides the real destination. You cannot tell where this goes without opening it.'**
  String get linkDetailShortener;

  /// SAFETY: the sentence for a link whose path ends in an installer or script extension. {fileExtension} is the extension as matched, including its leading dot (for example .apk or .exe), and is never translated; keep the quotation marks around it. The consequence clause must keep both halves of its contrast: something that CAN RUN on the device, as opposed to a page to read. 'can run' is the hedge - the inspector knows the extension, not what the file does. Never render this as 'this is a virus', 'this will install malware' or anything asserting the file is harmful.
  ///
  /// In en, this message translates to:
  /// **'This link ends in \"{fileExtension}\", so it downloads something that can run on your device rather than a page to read.'**
  String linkDetailExecutableTarget(String fileExtension);

  /// SAFETY: the sentence for a link carrying another URL in a query parameter. {parameter} is the query key exactly as written in the address - url, redirect, next, r - and is never translated, since the reader is being told what to look for in the string. {host} is the host the link appears to go to, also verbatim. Keep the quotation marks around both. 'may take you' is the load-bearing hedge and must not become 'will take you': Action reads the address and never follows it, so it does not know whether the redirect is honoured. 'setting' is the everyday word chosen instead of 'query parameter'; keep it non-technical in this language too.
  ///
  /// In en, this message translates to:
  /// **'This link carries a second address in its \"{parameter}\" setting, so opening it may take you somewhere other than \"{host}\".'**
  String linkDetailRedirectParameter(String parameter, String host);

  /// SAFETY: the sentence for an unusually long URL or hostname. Both halves are required. The first is why length matters to a reader; the second is the specific mechanism - the part of the address that actually decides where the request goes can be pushed off the end of an address bar. That mechanism is the finding, and a translation that keeps only 'long links are hard to read' loses it. 'can be' stays a possibility, not a claim about this link.
  ///
  /// In en, this message translates to:
  /// **'Long links are harder to read, and the part that decides the destination can be pushed out of sight.'**
  String get linkDetailVeryLongUrl;

  /// SAFETY: the sentence shown when the pasted string could not be parsed as a URL. The first sentence is an admission of what Action COULD NOT DETERMINE, and it must stay one - never 'this is not a valid link' or 'this link is broken', which assert something about the string rather than about the app's ability to read it. 'Action' is the product name and is never translated. The second sentence is general advice and must stay general; it is not a verdict on this particular string.
  ///
  /// In en, this message translates to:
  /// **'Action could not read this as a web address. Be careful with links that do not look like links.'**
  String get linkDetailUnparseable;

  /// Tool name for the on-device redaction tool. Appears on its Studio card, as the run screen's app-bar title, as a chip on a capture and on an Action, and as the row label in the Security centre's transfer journal. Keep it an imperative naming what the tool does to the material, and keep it short enough for a card row and an app bar. 'Hide' is the deliberate verb: this tool finds sensitive spans and offers a copy without them, so a rendering meaning 'protect', 'secure' or 'anonymise' overclaims. Must stay consistent with the phrase already used in privacyProviderLocalTools, which names this tool in prose.
  ///
  /// In en, this message translates to:
  /// **'Hide sensitive details'**
  String get toolTitleRedaction;

  /// One line under the redaction tool's title on its Studio card and run screen. Two halves, both wanted: it finds what should not be shared, and it produces a copy. 'clean copy' means a copy with the found details removed from the text; it must NOT be rendered with the local word for 'safe', 'secure' or 'protected' copy, which would promise something the tool's own coverage warning (toolWarningRedactionCoverage) then withdraws. 'Find' is the honest verb, never 'detects all' or 'removes everything'.
  ///
  /// In en, this message translates to:
  /// **'Find what should not be shared, and make a clean copy.'**
  String get toolDescriptionRedaction;

  /// Section heading when the redaction tool was given no readable text at all, so no scan ran. It reports an empty input, not an empty result: it must not be worded like a finding ('Nothing sensitive', 'All clear'). Keep it distinct in wording from toolSectionRedactionNothingFound, which is what a scan that actually ran says.
  ///
  /// In en, this message translates to:
  /// **'Nothing to scan'**
  String get toolSectionRedactionNothingToScan;

  /// Body under toolSectionRedactionNothingToScan. Instructional, not a finding. Two things must survive: that this tool works on text only, and the qualifier 'whose text has been read' - it points at a capture on which recognition has already run, not merely at a capture that exists. A user who selects an unread photo needs to understand why nothing happened. Use the same words for note, pasted message and capture as the Library uses.
  ///
  /// In en, this message translates to:
  /// **'This tool reads text. Select a note, a pasted message, or a capture whose text has been read.'**
  String get toolSectionRedactionNothingToScanBody;

  /// SAFETY: the heading shown after a scan ran over the text and matched nothing. It is an absence of findings, never a statement of safety. The hedge in 'obvious' is load-bearing and must appear in the translation - it is what pairs this heading with the coverage limit in toolWarningRedactionCoverage. Forbidden renderings: anything meaning 'Nothing sensitive here', 'Nothing to hide', 'Clean', 'Safe to share', 'Secure' or 'Verified'. Keep it a report of what this pass turned up, and keep it distinct from toolSectionRedactionNothingToScan, which fires when nothing was scanned at all; the two must not collapse into one sentence even where a language would naturally say them alike.
  ///
  /// In en, this message translates to:
  /// **'Nothing obvious found'**
  String get toolSectionRedactionNothingFound;

  /// SAFETY: the body under toolSectionRedactionNothingFound, and the sentence that makes that heading honest. It must remain an enumeration of exactly the four categories that were looked for - email addresses, phone numbers, card numbers, reference numbers - and must not generalise into 'found nothing sensitive' or 'found no personal data'. All four items must survive; dropping one silently widens the claim. Keep 'in this text' so the scope stays the text that was scanned. 'Action' is the product name and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Action found no email addresses, phone numbers, card numbers or reference numbers in this text.'**
  String get toolSectionRedactionNothingFoundBody;

  /// SAFETY: heading over the list of sensitive spans this pass matched, with how many. It is a count of what was found, never a claim of completeness - never 'everything worth hiding', 'all sensitive details' or 'all personal data found'. 'worth hiding' is advisory: these are candidates the user reviews and unticks, not a verdict that each one is sensitive. The number must stay bound to {count} and must not be restated in words. Locales with more than two plural categories should supply them; several of the twenty need forms English does not have.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 thing worth hiding} other{{count} things worth hiding}}'**
  String toolSectionRedactionFindings(int count);

  /// SAFETY: the label on the result block holding the rewritten text, which the user can copy or keep. Action uses the word 'redacted' only where the data is genuinely gone from the copy, and this label is that claim. Use the local legal or journalistic term for text that has been struck out and removed - not a word meaning 'hidden', 'masked', 'blurred' or 'covered', which describe an overlay that leaves the original underneath, and never a word meaning 'safe copy', 'clean copy' or 'secure copy', which claims more than the removal of the matched spans. Keep it a name for the copy, not a description of what happened.
  ///
  /// In en, this message translates to:
  /// **'Redacted copy'**
  String get toolSectionRedactedCopy;

  /// SAFETY: the coverage limit, rendered in the note banner ABOVE the findings it qualifies. Both halves are mandatory: (1) what is matched, which is patterns of a recognisable shape, and (2) that it will not catch everything sensitive. Clause (2) must stay an absolute limit, not 'may occasionally miss something'. The closing instruction 'read the copy before you share it' must stay an imperative addressed to the reader; softening it into a suggestion ('you might want to check') removes the only step that covers what the scanner cannot see. Never reword this into a reassurance about how thorough the scan is.
  ///
  /// In en, this message translates to:
  /// **'This finds patterns like emails, phone numbers and account numbers. It will not catch everything sensitive — read the copy before you share it.'**
  String get toolWarningRedactionCoverage;

  /// SAFETY: shown whenever an image or a PDF was part of the selection. Three claims, all required: Action cannot redact those formats, drawing over a picture leaves the original data underneath, and therefore the option is not offered. It is a statement of a capability that does not exist - never 'not yet supported', 'coming soon' or 'not available in this version', all of which promise a date nobody has given. The explanation must survive in full: it is what stops a reader from producing a fake redaction with a drawing app. Use the same word for 'redact' as toolSectionRedactedCopy. 'Action' is the product name and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Action cannot redact images or PDF files. Covering something in a picture would leave the original underneath it, so it is not offered.'**
  String get toolWarningRedactionFormatLimit;

  /// Tool name for the on-device authenticity inspector. Appears on its Studio card, as the run screen's app-bar title, and as the row label in the Security centre's transfer journal. 'Check' means look at what is there, not establish or confirm - the tool never verifies an origin. Do not render it as 'Verify the source', 'Prove where this came from' or 'Authenticate this file'. Keep it consistent with the phrase 'checking where a file came from' already used in privacyProviderLocalTools.
  ///
  /// In en, this message translates to:
  /// **'Check where this came from'**
  String get toolTitleAuthenticity;

  /// SAFETY: the one line under the authenticity tool's title, and the sentence that sets what the whole tool promises. 'declares' is deliberate: the file makes a claim about itself, and Action repeats it without endorsing it. It must not become 'Verifies where a file came from', 'Shows a file's real origin', 'Confirms a file is genuine' or anything with a word meaning authentic, verified or proven. Keep the possessive - it is the file's own account of itself, not a fact Action established. The tool never returns a percentage or a score, so no wording may imply one.
  ///
  /// In en, this message translates to:
  /// **'What a file declares about its own origin.'**
  String get toolDescriptionAuthenticity;

  /// Section heading when the authenticity tool was given neither an image nor any text, so nothing was examined. It reports an empty input, not a result: it must not read as a finding about a file ('Nothing found', 'No metadata'). Keep it distinct from headings that report what an inspection turned up.
  ///
  /// In en, this message translates to:
  /// **'Nothing to inspect'**
  String get toolSectionAuthenticityNothingToInspect;

  /// Instructional body under toolSectionAuthenticityNothingToInspect. It names the two things this tool can be pointed at. Keep it one short imperative sentence; use the same words for image and text as the capture picker.
  ///
  /// In en, this message translates to:
  /// **'Select an image or some text.'**
  String get toolSectionAuthenticityNothingToInspectBody;

  /// SAFETY: the heading over the metadata the file declares - camera, software, timestamps and so on. The heading is the hedge for every value beneath it, so the framing must survive intact: these are claims the file makes, not facts Action verified. It must not become 'What this file is', 'File details', 'File information', 'Origin' or 'Where this came from'. Keep the reflexive sense of 'about itself'. It is deliberately in tension with toolSectionAuthenticityFileItself below it, and that contrast has to be visible to the reader in this language too. Metadata can be edited or stripped, which is the point toolWarningAuthenticityNotProof makes above these sections.
  ///
  /// In en, this message translates to:
  /// **'What this file says about itself'**
  String get toolSectionAuthenticityFileSignals;

  /// Heading over the facts derived from the bytes rather than from the declared metadata - what the contents actually are, how large the file is, and its digest. It is deliberately contrasted with toolSectionAuthenticityFileSignals ('What this file says about itself'): that section is what the file claims, this one is what Action measured. Translate the pair together so the contrast between a claim and a measurement survives; do not use the same noun for both.
  ///
  /// In en, this message translates to:
  /// **'The file itself'**
  String get toolSectionAuthenticityFileItself;

  /// The label on the fact naming what kind of file the bytes actually are - 'a PNG image', 'a PDF document'. One word, in the sense of what the file contains rather than a list of items inside it or a table of contents. Its value arrives from the format table in file_identity.dart, or from toolSectionFileUnknownFormat when nothing matched.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get toolSectionFileContents;

  /// SAFETY: the value shown for Contents when Action could not identify the bytes. The limit is on Action, not on the file, and the wording has to keep it there. Forbidden renderings: 'Unknown file', 'Unrecognised format', 'Invalid file', 'Corrupt', 'Not supported' - each turns an admission about Action's own format table into a verdict on the user's file. Keep Action as the subject of the not-knowing. 'Action' is the product name and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Not a format Action knows'**
  String get toolSectionFileUnknownFormat;

  /// The label on the fact giving the file's size in bytes, shown in a readable unit. One word, the ordinary noun for file size. The value itself is formatted in file_identity.dart and still carries English unit strings - see crossFileNotes.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get toolSectionFileSize;

  /// The label on the fact giving the file's cryptographic digest, printed in groups of four so a person can compare it by eye against a download page. NOT translated in any locale: it is the standard name of the algorithm, and a reader comparing it against a checksum published elsewhere must see the same token. Keep the Latin letters, the hyphen and the digits exactly, including in locales that use another script or another set of digits.
  ///
  /// In en, this message translates to:
  /// **'SHA-256'**
  String get toolSectionFileDigest;

  /// SAFETY: emitted on every single authenticity run, deliberately, so the limit always travels with the answer instead of living in a help page. Three claims, all mandatory: (1) the tool reports what the file declares, (2) metadata can be edited or stripped, so none of it is proof, and (3) the reader must not use this to accuse anyone. Clause (2) must keep the absolute 'none of it is proof' - not 'may not be conclusive' or 'should be treated with care'. Clause (3) must stay an imperative addressed to the reader, never advisory ('it is best not to') and never dropped for length. Use the word for proof or evidence in the legal sense. 'Action' does not appear here; do not add it.
  ///
  /// In en, this message translates to:
  /// **'This reports what a file declares about itself. Metadata can be edited or stripped, so none of it is proof. Do not use this to accuse anyone.'**
  String get toolWarningAuthenticityNotProof;

  /// Tool name for the on-device credential scanner. Appears on its Studio card, as the run screen's app-bar title, as a chip on a capture and on an Action, and as the row label in the Security centre's transfer journal. 'keys' means API keys, access tokens and private keys - the things that grant access - not physical keys and not keyboard keys; choose the term a developer or an account holder would recognise. 'Check for' means look for, never 'protect' or 'secure'.
  ///
  /// In en, this message translates to:
  /// **'Check for keys and passwords'**
  String get toolTitleCredentialScanner;

  /// One line under the credential scanner's title on its Studio card and run screen. Keep the timing - before you share - because that is the moment the tool exists for. 'credentials' is the general term covering API keys, tokens, private keys and passwords. Do not render it as a promise to remove or block them; this line offers finding, and the removal of a key from a copy is separately qualified by toolWarningCredentialRevoke.
  ///
  /// In en, this message translates to:
  /// **'Find credentials before you share something.'**
  String get toolDescriptionCredentialScanner;

  /// Section heading when the credential scanner was given no text at all, so no scan ran. It reports an empty input, not an empty result. It must NOT be phrased so that it could be mistaken for toolSectionCredentialNoneFound ('No credentials found'), which is what a scan that actually ran says - the two headings must stay visibly different in this language even where the natural phrasing would make them alike, because one means 'nothing was examined' and the other means 'something was examined and nothing matched'.
  ///
  /// In en, this message translates to:
  /// **'Nothing to check'**
  String get toolSectionCredentialNothingToCheck;

  /// Instructional body under toolSectionCredentialNothingToCheck. Two things must survive: the qualifier 'whose text has been read', which points at a capture on which recognition has already run rather than any capture, and the closing statement that this tool reads text only - it explains why an image or an un-read PDF produced nothing.
  ///
  /// In en, this message translates to:
  /// **'Paste some text, or choose a capture whose text has been read. This tool reads text only.'**
  String get toolSectionCredentialNothingToCheckBody;

  /// SAFETY: the most dangerous string in this file. It is shown when the scanner ran and matched nothing, and it states an absence of findings - never an assurance. Forbidden renderings: anything meaning 'No credentials in this file', 'There are no secrets here', 'Nothing to worry about', 'Clean', 'Safe to share', 'Secure' or 'Verified'. The subject is the scan's result, not the text's nature. It always appears together with the coverage limit in toolWarningCredentialCoverage, which is rendered above it; both must arrive translated in the same release, because this heading alone reads as an all-clear.
  ///
  /// In en, this message translates to:
  /// **'No credentials found'**
  String get toolSectionCredentialNoneFound;

  /// SAFETY: the body that keeps toolSectionCredentialNoneFound from reading as proof. The hedge is 'did not find anything shaped like' - the scanner matches shapes, so a secret with an unusual shape is invisible to it. That framing must survive: never 'there is no API key in this text' and never 'no secrets were detected'. All four named categories must survive - API key, private key, token, password - and so must 'in this text', which scopes the claim to what was scanned. 'API key' and 'token' should use the terms a developer in this language actually uses. 'Action' is the product name and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Action did not find anything shaped like an API key, a private key, a token or a password in this text.'**
  String get toolSectionCredentialNoneFoundBody;

  /// SAFETY: heading over credentials matched with high confidence, because a known keyword or a known key format identified them. This heading is definite on purpose, and toolSectionCredentialPossibleFindings is hedged on purpose; the pair encodes the confidence split, and the two must not converge into one wording in this language. Keep it a count of what was found in this text, never a claim that all credentials were found. The number must stay bound to {count} and must not be restated in words. Supply every plural category the language needs.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 credential found} other{{count} credentials found}}'**
  String toolSectionCredentialFindings(int count);

  /// SAFETY: heading over random-looking strings that no keyword explains - a build identifier looks much the same as a leaked key. The modal 'might be' is the entire difference between this heading and toolSectionCredentialFindings; a locale that drops it turns a guess into an asserted leak, and the facts underneath are individually marked unconfirmed for the same reason. Keep the vagueness of 'thing' rather than naming a credential type. The number must stay bound to {count}. Supply every plural category the language needs.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 thing that might be a secret} other{{count} things that might be secrets}}'**
  String toolSectionCredentialPossibleFindings(int count);

  /// SAFETY: the label on the result block holding the rewritten text, which the user can copy or keep. It says exactly what was done - the credentials that were found are gone from this copy - and nothing more. It must not become 'Safe copy', 'Secure copy', 'Clean copy' or 'Sanitised copy': the caution in toolWarningCredentialRevoke states that removing a key does not disable it, and a title promising safety contradicts the caution beside it. It also must not imply that every credential was removed, only the ones listed above it. Use the same word for 'credentials' as toolDescriptionCredentialScanner.
  ///
  /// In en, this message translates to:
  /// **'Copy with the credentials removed'**
  String get toolSectionCredentialRedactedCopy;

  /// SAFETY: the actionable half of this tool, and the one string here whose loss costs the user money. Two claims, both mandatory: (1) redaction is not revocation - a key removed from a document keeps working - and (2) the remedy, if it has already been shared, is to revoke it with the provider that issued it and issue a new one. Clause (1) must stay a flat statement, never 'may still be active'. Clause (2) must stay imperative and must keep both steps, revoke and reissue, and must keep the provider as the place where that happens - Action cannot revoke anything. 'revoke' should use the term the language's account and API dashboards use.
  ///
  /// In en, this message translates to:
  /// **'Removing a key from a document does not disable it. If one of these has already been shared, revoke it with the provider and issue a new one.'**
  String get toolWarningCredentialRevoke;

  /// SAFETY: the coverage limit that qualifies both the empty and the populated result; it is rendered in the note banner above them. Three parts, all required: what is matched is credentials with a recognisable shape, the concrete counter-example of a password written out in a sentence, and the instruction to read the text as well. The counter-example must survive in a form a reader recognises - it is what shows them what the scanner cannot see - and must not be generalised into 'some credentials may not be found'. The closing instruction stays an imperative addressed to the reader.
  ///
  /// In en, this message translates to:
  /// **'This finds credentials with a recognisable shape. A password written out in a sentence will not be found, so read the text as well.'**
  String get toolWarningCredentialCoverage;

  /// Tool name for the on-device link inspector. Appears on its Studio card, as the run screen's app-bar title, as a chip on a capture and on an Action, and as the row label in the Security centre's transfer journal. 'Check' means read and report on, never 'verify' or 'scan for threats'. Do not render it as 'Is this link safe?', 'Check a link is safe' or anything naming safety - this tool refuses to make that claim anywhere in its output. Keep it two or three words for a card row and an app bar.
  ///
  /// In en, this message translates to:
  /// **'Check a link'**
  String get toolTitleLinkInspector;

  /// SAFETY: the one line under the link inspector's title, and the sentence that sets the expectation for the whole tool. The subject is the address as written - the spelling of the host, the scheme, the shape of the URL - and what a person can notice in it without opening anything. It must not become 'Checks whether a link is safe', 'Scans links for threats', 'Tells you if a link is dangerous' or anything using words meaning safe, secure, trusted or malicious: the tool's own tests assert that no string it produces contains them. 'before you open it' must survive - it is what tells the reader nothing is fetched.
  ///
  /// In en, this message translates to:
  /// **'What an address gives away before you open it.'**
  String get toolDescriptionLinkInspector;

  /// SAFETY: shown when the tool searched the text and matched no addresses. It reports the result of that search and nothing about the text's character - never 'nothing suspicious', 'this text is clean' or 'no dangerous links'. Keep it a plain statement that no link was found in the text that was searched.
  ///
  /// In en, this message translates to:
  /// **'No links found'**
  String get toolSectionLinkNoneFound;

  /// Instructional body under toolSectionLinkNoneFound, naming the two ways to give this tool something to read. One short sentence; use the same word for capture as the Library uses.
  ///
  /// In en, this message translates to:
  /// **'Paste a link, or choose a capture that contains one.'**
  String get toolSectionLinkNoneFoundBody;

  /// Heading over the per-link list, giving how many addresses were found in the text. The English singular carries no numeral, but the ICU plural is kept so a language that needs a numeral, a classifier or another form can supply one; supply every category the language needs. The count is capped at twelve, so a long document can show fewer links than it contains - the heading must therefore not be worded as 'all links in this text'. Keep 'in this text' so the scope stays what was scanned. The number must stay bound to {count}.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{The link in this text} other{{count} links in this text}}'**
  String toolSectionLinkFindings(int count);

  /// SAFETY: the label used in place of a host name when Action could not parse the address into one. It says Action could not read the address, not that the address is bad. Forbidden renderings: 'Invalid', 'Broken link', 'Bad address', 'Malformed', 'Unsafe' - each converts a parsing limit into a verdict on the link, which is the exact failure this tool is built to avoid. Prefer a word meaning 'could not be read'.
  ///
  /// In en, this message translates to:
  /// **'Unreadable'**
  String get toolSectionLinkUnreadableHost;

  /// Joins one observation's short summary to its explanation in a bullet under a link. Only the separator and the order are translatable; both halves are runtime text produced by the link inspector. The separator is a real choice - a full stop and a space in most locales, a full-width stop in Japanese and Chinese - and the order may be reversed only where the language genuinely reads the explanation first. Do not add words, and do not add a trailing stop of your own: {detail} already ends the sentence.
  ///
  /// In en, this message translates to:
  /// **'{summary}. {detail}'**
  String toolSectionLinkObservationLine(String summary, String detail);

  /// SAFETY: shown when every inspected address produced no observations. It is a statement about spelling and structure - how the addresses are written - and never about where they lead or whether the pages can be trusted. A phishing page served over HTTPS from a short, correctly spelled host produces exactly this heading. Forbidden renderings: 'These links look fine', 'No problems found', 'Nothing suspicious', 'These links are safe', 'No threats detected' - the tool's own tests assert that no string it can produce contains a word meaning safe, trusted or malicious. Keep 'in how these are written' or its nearest equivalent; without that clause the heading is a defect. It must always be read together with toolSectionLinkNothingUnusualBody immediately below it.
  ///
  /// In en, this message translates to:
  /// **'Nothing unusual in how these are written'**
  String get toolSectionLinkNothingUnusual;

  /// SAFETY: the disclaimer that makes toolSectionLinkNothingUnusual safe to show. Two sentences, both mandatory: (1) the absence of anything unusual is not knowledge that the pages are trustworthy, and (2) the judgement belongs to the reader, whose test is whether they expected these links. It must never be shortened to the first sentence alone, and clause (1) must stay a flat denial - not 'does not necessarily mean' or 'is no guarantee', which read as a technicality rather than a limit. Keep the second person: the reader is the one who judges, not Action.
  ///
  /// In en, this message translates to:
  /// **'That is not the same as knowing the pages are trustworthy. Only you can judge whether you expected them.'**
  String get toolSectionLinkNothingUnusualBody;

  /// SAFETY: a data-flow claim, literally true - nothing is resolved, fetched or followed. Four parts, all mandatory: only the address is read, the link is not opened, the site is not looked up, and no reputation or blocklist service is consulted; plus the reason, that doing any of those would send the user's browsing to somebody else. The three negatives must remain three separate negatives - collapsing them into 'checks links privately', 'works offline' or 'does not share your data' loses the specific promises. Do not add a claim Action does not make. 'Action' is the product name and is not translated.
  ///
  /// In en, this message translates to:
  /// **'Action reads the address only. It does not open the link, look up the site, or check any reputation service — doing that would send your browsing somewhere.'**
  String get toolWarningLinkAddressOnly;

  /// SAFETY: the sentence that states outright that an absence of signals is not safety, and the one that stops the empty result from reading as an all-clear. Clause (1), that a link with no signals can still be harmful, must stay a flat assertion in the present tense - not 'might still be', 'is not guaranteed to be safe' or any hedge that turns a warning into a formality. Clause (2) must keep the scope: what is checked is how an address is written, which is not everything there is to know about where it goes. Rendered in the caution banner above the findings, so it must read as a warning on its own, before the reader has seen a single result.
  ///
  /// In en, this message translates to:
  /// **'A link with no signals can still be harmful. This finds problems in how an address is written, which is not everything there is to know about where it goes.'**
  String get toolWarningLinkNoSignals;

  /// Heading over the goal optimiser's restatement of the objective the user is pursuing. A heading over the model's reading of the goal, not a prompt asking the user to type one - deliberately not shared with goalTitleSheetTitle, which carries the same English in the opposite register. Second person: it is the reader's objective, not the app's.
  ///
  /// In en, this message translates to:
  /// **'What you want'**
  String get toolSectionObjective;

  /// Heading over the goal optimiser's summary of how far the goal has got. 'It' is the goal, so a locale that must name the subject should name the goal rather than the user. Deliberately not shared with goalContextSheetTitle, which prompts the user to type this instead of reporting it.
  ///
  /// In en, this message translates to:
  /// **'Where it stands'**
  String get toolSectionCurrentState;

  /// Heading over the single next step the tool suggests. 'Recommended' must stay a recommendation - not an instruction and not a decision already taken - because nothing here is scheduled or acted on until the user chooses it. Singular: exactly one step follows.
  ///
  /// In en, this message translates to:
  /// **'Recommended next step'**
  String get toolSectionRecommendedNextStep;

  /// Heading over the advice shown after the credential scanner finds something that looks like a key, token or password. Addressed to the reader as the person who will act. Keep it short - it sits directly above a short list of instructions.
  ///
  /// In en, this message translates to:
  /// **'What to do'**
  String get toolSectionCredentialAdvice;

  /// Title of the artifact holding the generated summary, shown on the artifact card and used as its filename stem when it is copied out. A noun naming the document, not a verb telling the reader to summarise.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get toolSectionSummary;

  /// The separator placed between the clauses of ONE suggestion detail line - for example between 'If not: your cover lapses' and 'You need: your policy number'. This is NOT a list separator (see listSeparator) and not sentence punctuation: it divides parts of a single line. Include whatever spacing your locale needs, inside the string, on both sides. CJK locales commonly want a middle dot or a full-width space; Arabic may prefer a spaced dash with the right bidirectional marks. A locale that genuinely wants no visible separator should say so with a single space rather than an empty string, because an empty string runs the clauses together.
  ///
  /// In en, this message translates to:
  /// **' · '**
  String get toolDetailSeparator;
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
