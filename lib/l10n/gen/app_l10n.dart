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
