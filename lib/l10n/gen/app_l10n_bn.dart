// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppL10nBn extends AppL10n {
  AppL10nBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get commonDone => 'হয়ে গেছে';

  @override
  String get commonSave => 'সেভ';

  @override
  String get commonClose => 'বন্ধ';

  @override
  String get commonBack => 'পেছনে';

  @override
  String get commonRetry => 'আবার চেষ্টা করুন';

  @override
  String get commonDelete => 'মুছে ফেলুন';

  @override
  String get commonRemove => 'সরান';

  @override
  String get commonContinue => 'চালিয়ে যান';

  @override
  String get commonOpen => 'খুলুন';

  @override
  String get commonCopy => 'কপি';

  @override
  String get commonCopied => 'কপি হয়েছে';

  @override
  String get commonEdit => 'সম্পাদনা';

  @override
  String get commonAdd => 'যোগ করুন';

  @override
  String get commonOn => 'চালু';

  @override
  String get commonOff => 'বন্ধ';

  @override
  String get commonUnknown => 'অজানা';

  @override
  String get commonChecking => 'দেখা হচ্ছে…';

  @override
  String get commonSettings => 'সেটিংস';

  @override
  String get commonDismiss => 'সরিয়ে দিন';

  @override
  String get commonUndo => 'আগের অবস্থায়';

  @override
  String get commonSkip => 'এড়িয়ে যান';

  @override
  String get commonNotNow => 'এখন নয়';

  @override
  String get commonSomethingWentWrong => 'কিছু একটা ভুল হয়েছে।';

  @override
  String get navToday => 'আজ';

  @override
  String get navLibrary => 'লাইব্রেরি';

  @override
  String get navIntelligence => 'ইন্টেলিজেন্স';

  @override
  String get navSearch => 'খুঁজুন';

  @override
  String get navCapture => 'কিছু ক্যাপচার করুন';

  @override
  String get todayGreetingMorning => 'শুভ সকাল';

  @override
  String get todayGreetingAfternoon => 'শুভ অপরাহ্ন';

  @override
  String get todayGreetingEvening => 'শুভ সন্ধ্যা';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'আপনার কাজগুলো লোড করা যায়নি। সেগুলো এখনও এই ডিভাইসেই আছে।';

  @override
  String get todaySectionNeedsAttention => 'মনোযোগ দরকার';

  @override
  String get todaySectionAlsoNeedsAttention => 'এগুলোরও মনোযোগ দরকার';

  @override
  String get todaySectionWaitingForReview => 'পর্যালোচনার অপেক্ষায়';

  @override
  String get todaySectionComingUp => 'সামনে আসছে';

  @override
  String todaySeeAllCaptures(int count) {
    return 'সব $countটি ক্যাপচার দেখুন';
  }

  @override
  String get todaySeeAllInLibrary => 'লাইব্রেরিতে সব দেখুন';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি শেষ',
      one: '১টি শেষ',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি কাজ শেষ হয়েছে। লাইব্রেরি খুলুন।',
      one: '১টি কাজ শেষ হয়েছে। লাইব্রেরি খুলুন।',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'শুরু করুন';

  @override
  String get todayQuickPhoto => 'ছবি';

  @override
  String get todayQuickScreenshot => 'স্ক্রিনশট';

  @override
  String get todayQuickText => 'লেখা';

  @override
  String get todayQuickTools =>
      'একটি লিঙ্ক যাচাই করুন, বা লেখার ভেতর কী খুঁজুন';

  @override
  String get briefBadgeNeedsYou => 'আপনাকে দরকার';

  @override
  String get briefBadgeToReview => 'পর্যালোচনার জন্য';

  @override
  String get briefBadgeAhead => 'সামনে';

  @override
  String get briefBadgeStartHere => 'এখান থেকে শুরু';

  @override
  String get briefBadgeClear => 'সব পরিষ্কার';

  @override
  String get briefNext => 'পরবর্তী';

  @override
  String briefOpenAction(String title) {
    return '$title খুলুন';
  }

  @override
  String briefMarkDone(String title) {
    return '\"$title\" শেষ হিসেবে চিহ্নিত করুন';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি কাজের আপনার মনোযোগ দরকার',
      one: '১টি কাজের আপনার মনোযোগ দরকার',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্যাপচারও পর্যালোচনার অপেক্ষায়।',
      one: '১টি ক্যাপচারও পর্যালোচনার অপেক্ষায়।',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্যাপচার আপনার অপেক্ষায়',
      one: '১টি ক্যাপচার আপনার অপেক্ষায়',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'কোনো কিছুর সময় পেরোয়নি।';

  @override
  String get briefHeadlineNothingToday => 'আজ কিছুরই আপনাকে দরকার নেই';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি কাজ সামনে আসছে।',
      one: '১টি কাজ সামনে আসছে।',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'আপনার সব পরিষ্কার';

  @override
  String get briefDetailClear => 'কিছুরই সময় হয়নি, কিছুই অপেক্ষা করছে না।';

  @override
  String get briefHeadlineFirstRun => 'যেকোনো কিছু দিয়ে শুরু করুন';

  @override
  String get briefDetailFirstRun =>
      'একটি চিঠি, একটি স্ক্রিনশট, একটি নোট — Action বুঝে নেবে সেটি কী।';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsSectionPersonalise => 'নিজের মতো করুন';

  @override
  String get settingsAppearance => 'চেহারা';

  @override
  String get settingsAppearanceDescription => 'হালকা, গাঢ়, বা ডিভাইস যা করছে।';

  @override
  String get settingsLanguageDescription =>
      'Action আপনার সঙ্গে যে ভাষায় কথা বলে।';

  @override
  String get appearanceSystem => 'সিস্টেম';

  @override
  String get appearanceLight => 'হালকা';

  @override
  String get appearanceDark => 'গাঢ়';

  @override
  String get appearanceSystemDescription => 'ডিভাইসের সেটিং অনুসরণ করুন';

  @override
  String get appearanceLightDescription => 'সবসময় হালকা';

  @override
  String get appearanceDarkDescription => 'সবসময় গাঢ়';

  @override
  String get languageTitle => 'ভাষা';

  @override
  String get languageSubtitle =>
      'পরিবর্তন সঙ্গে সঙ্গে কার্যকর হয়। কোথাও কিছু পাঠানো হয় না; পছন্দটি এই ডিভাইসেই রাখা থাকে।';

  @override
  String get languageSectionChoose => 'একটি ভাষা বেছে নিন';

  @override
  String get languageSystem => 'সিস্টেম';

  @override
  String get languageSystemDescription => 'ডিভাইসের ভাষা অনুসরণ করুন';

  @override
  String get languageDraftNote =>
      'Action-এর লেখা মূলত ইংরেজিতে তৈরি। বাকি অনুবাদগুলো একটি নির্দিষ্ট শব্দতালিকা মেনে খসড়া করা হয়েছে এবং স্বয়ংক্রিয়ভাবে যাচাই হয়েছে, কিন্তু কোনো মাতৃভাষী এখনও সেগুলো পড়ে দেখেননি। যেখানে শব্দের নির্ভুলতা জরুরি — গোপনীয়তা, নিরাপত্তা, এবং Action কী দাবি করে ও কী করে না — সেখানে ইংরেজিই মূল সূত্র।';

  @override
  String get ocrScriptTitle => 'লেখা শনাক্তকরণ';

  @override
  String get ocrScriptSubtitle =>
      'ছবির দিকে তাকালে Action যে লিপি পড়ে। শনাক্তকরণ এই ডিভাইসেই হয়; পড়ার জন্য কোনো ক্যাপচার কোথাও পাঠানো হয় না।';

  @override
  String get ocrScriptSectionChoose => 'লিপি';

  @override
  String get ocrScriptFollowLanguage => 'অ্যাপের ভাষা অনুসরণ করুন';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'এখন $script';
  }

  @override
  String get ocrScriptLatin => 'রোমান';

  @override
  String get ocrScriptChinese => 'চীনা';

  @override
  String get ocrScriptDevanagari => 'দেবনাগরী';

  @override
  String get ocrScriptJapanese => 'জাপানি';

  @override
  String get ocrScriptKorean => 'কোরীয়';

  @override
  String get ocrScriptLatinDescription =>
      'ইংরেজি, স্প্যানিশ, ফরাসি, জার্মান এবং রোমান অক্ষরে লেখা বাকি ভাষাগুলো।';

  @override
  String get ocrScriptChineseDescription => 'সরলীকৃত ও প্রচলিত চীনা।';

  @override
  String get ocrScriptDevanagariDescription =>
      'হিন্দি, মারাঠি ও নেপালি। বাংলা, তামিল বা তেলুগু নয় — এদের প্রত্যেকের লিপি আলাদা।';

  @override
  String get ocrScriptJapaneseDescription => 'জাপানি।';

  @override
  String get ocrScriptKoreanDescription => 'কোরীয়।';

  @override
  String get ocrScriptFootnote =>
      'রোমান ছাড়া প্রতিটি পছন্দই রোমান অক্ষরও পড়ে, তাই একটি বেছে নিলে লিপি বদলায় না, যোগ হয়। এই বদল এখন থেকে তোলা ছবির ক্ষেত্রে খাটে, আগে পড়া হয়ে যাওয়া ছবির ক্ষেত্রে নয়।';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action $language লিপি পড়তে পারে না';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'এর জন্য ডিভাইসে কোনো শনাক্তকারী নেই। ছবিতে রোমান অক্ষরে লেখা যা কিছু থাকবে তা তবু পড়া হবে, বাকিটা খালি ফিরবে। ওই লেখা আপনি বরং টাইপ করতে বা পেস্ট করতে পারেন।';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action এখন $script পড়ার জন্য সেট করা। এই ছবি অন্য কোনো লিপিতে হলে সেটিংসে বদলে নিয়ে আবার পড়ান।';
  }

  @override
  String get settingsTextRecognition => 'লেখা শনাক্তকরণ';

  @override
  String get settingsTextRecognitionDescription =>
      'ছবি থেকে Action যে লিপি পড়ে।';

  @override
  String get settingsIntelligenceFootnote =>
      'AI ছাড়াই Action কাজ করে। নিজের প্রোভাইডার যুক্ত করলে ডকুমেন্ট বিশ্লেষণ, পরিকল্পনা ও খসড়া লেখার টুল যোগ হয়।';

  @override
  String get settingsAiProvider => 'AI প্রোভাইডার';

  @override
  String get settingsAiNotConnected =>
      'যুক্ত নয়। নিজের অ্যাকাউন্ট ও API কী ব্যবহার করুন।';

  @override
  String settingsAiConnected(String provider) {
    return '$provider-এর সঙ্গে যুক্ত।';
  }

  @override
  String get settingsSectionPrivacySecurity => 'গোপনীয়তা ও নিরাপত্তা';

  @override
  String get settingsSecurity => 'নিরাপত্তা';

  @override
  String get settingsWhereInfoLives => 'আপনার তথ্য কোথায় থাকে';

  @override
  String get settingsWhereInfoLivesDescription =>
      'কী এই ডিভাইসে থেকে যায়, আর কী যায় না।';

  @override
  String get protectionAppLock => 'অ্যাপ লক';

  @override
  String get protectionScreenPrivacy => 'স্ক্রিন গোপনীয়তা';

  @override
  String get protectionPrivateReminders => 'ব্যক্তিগত রিমাইন্ডার';

  @override
  String get protectionSummaryNone =>
      'অ্যাপ লক, স্ক্রিন গোপনীয়তা, আর কী এই ডিভাইস ছেড়ে যায়।';

  @override
  String protectionSummaryOne(String first) {
    return '$first চালু আছে।';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first ও $second চালু আছে।';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second ও $third চালু আছে।';
  }

  @override
  String get settingsSectionReminders => 'রিমাইন্ডার';

  @override
  String get settingsRemindersFootnote =>
      'ব্যাটারি সেটিং ও ডিভাইস কীভাবে ব্যবহার হচ্ছে তার উপর নির্ভর করে অ্যান্ড্রয়েড আপনার নির্ধারিত সময়ের একটু পরে রিমাইন্ডার দেখাতে পারে।';

  @override
  String get settingsNotifications => 'নোটিফিকেশন';

  @override
  String get settingsNotificationsOnDescription =>
      'আপনার সেট করা রিমাইন্ডার দেখানো যাবে।';

  @override
  String get settingsNotificationsOffDescription =>
      'Action-এর জন্য বন্ধ, তাই রিমাইন্ডার দেখা যাবে না।';

  @override
  String get settingsNotificationsUnknown => 'যাচাই করা যায়নি।';

  @override
  String get settingsNotificationsAllowed => 'অনুমোদিত';

  @override
  String get settingsOpenSystemSettings => 'সেটিংস খুলুন';

  @override
  String get settingsActionFootnote =>
      'Action এলোমেলো তথ্যকে পরিষ্কার পরবর্তী ধাপে বদলে দেয়। সংরক্ষণের আগে সবকিছু আপনি নিজে নিশ্চিত করেন।';

  @override
  String get settingsHelp => 'সহায়তা';

  @override
  String get settingsHelpDescription => 'Action কীভাবে কাজ করে, আর কী করবে না।';

  @override
  String get settingsVersion => 'সংস্করণ';

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'এইমাত্র';

  @override
  String relativeMinutes(int count) {
    return '$count মিনিট আগে';
  }

  @override
  String relativeHours(int count) {
    return '$count ঘণ্টা আগে';
  }

  @override
  String get relativeYesterday => 'গতকাল';

  @override
  String relativeDays(int count) {
    return '$count দিন আগে';
  }

  @override
  String get libraryTitle => 'লাইব্রেরি';

  @override
  String get librarySubtitle =>
      'Action আপনার জন্য যা কিছু রেখেছে, সবই এখানে। আর সবটাই এই ডিভাইসে থাকে।';

  @override
  String get librarySegmentActions => 'কাজ';

  @override
  String get librarySegmentCaptures => 'ক্যাপচার';

  @override
  String get librarySegmentGoals => 'লক্ষ্য';

  @override
  String get librarySegmentDone => 'সম্পন্ন';

  @override
  String get libraryNewGoal => 'নতুন লক্ষ্য';

  @override
  String get libraryNoGoalsTitle => 'এখনও কোনো লক্ষ্য নেই';

  @override
  String get libraryNoGoalsMessage =>
      'লক্ষ্য হলো এমন কিছু যা আপনি ঘটাতে চান। কী নেই, কী আটকে আছে, আর প্রথমে কী করতে হবে — Action তা খুঁজে দিতে পারে।';

  @override
  String get libraryNoDoneTitle => 'এখনও কিছু শেষ হয়নি';

  @override
  String get libraryNoDoneMessage =>
      'আপনি যেসব কাজ শেষ করবেন, সেগুলো এখানে রাখা থাকবে।';

  @override
  String get libraryNoOpenTitle => 'খোলা কোনো কাজ নেই';

  @override
  String get libraryNoOpenMessage =>
      'কিছু একটা ক্যাপচার করুন, Action বুঝে নেবে কী করা দরকার।';

  @override
  String get libraryNoCapturesTitle => 'এখনও কিছু ক্যাপচার করা হয়নি';

  @override
  String get libraryNoCapturesMessage =>
      'আপনার যোগ করা ছবি, স্ক্রিনশট আর লেখা প্রথমে এখানেই আসে। আপনি না বলা পর্যন্ত কিছুই বিশ্লেষণ করা হয় না।';

  @override
  String get libraryGoalNoActions => 'এখান থেকে কিছু তৈরি হয়নি';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'এই লক্ষ্য থেকে $countটি কাজ',
      one: 'এই লক্ষ্য থেকে ১টি কাজ',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'কাজ ও ক্যাপচারে খুঁজুন';

  @override
  String get searchClear => 'মুছুন';

  @override
  String get searchPrivacyNote =>
      'এই ডিভাইসেই খোঁজা হয়। আপনি যা টাইপ করেন তার কিছুই বাইরে যায় না।';

  @override
  String get searchYouCanSearch => 'যা যা খুঁজতে পারেন';

  @override
  String get searchFieldTitles => 'শিরোনাম';

  @override
  String get searchFieldTitlesExample => 'গাড়ির বিমা নবায়ন';

  @override
  String get searchFieldReferences => 'রেফারেন্স নম্বর';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'প্রতিষ্ঠান';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'কাজের ভেতরের ধাপ';

  @override
  String get searchFieldStepsExample => 'ফর্মটি আপলোড করুন';

  @override
  String get searchFieldCaptureText => 'ক্যাপচার থেকে পড়া লেখা';

  @override
  String get searchFieldCaptureTextExample => 'নবায়নের নোটিশ';

  @override
  String searchNoMatchesTitle(String query) {
    return '\"$query\"-এর কোনো মিল নেই';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'কম শব্দ দিয়ে দেখুন, বা রেফারেন্স নম্বরটি যেভাবে আছে ঠিক সেভাবে লিখুন।';

  @override
  String get searchNoMatchesClearFilters =>
      'কম শব্দ দিয়ে দেখুন, বা ফিল্টারগুলো মুছে দিন।';

  @override
  String get searchFilterActive => 'চলমান';

  @override
  String get searchFilterCompleted => 'সম্পন্ন';

  @override
  String get searchFilterOverdue => 'সময় পেরিয়েছে';

  @override
  String get searchFilterThisWeek => 'এই সপ্তাহ';

  @override
  String get searchFilterCritical => 'জরুরি';

  @override
  String get searchFilterCreatedByYou => 'আপনার তৈরি';

  @override
  String get searchFilterArchived => 'সংরক্ষিত';

  @override
  String get searchFilterClear => 'ফিল্টার মুছুন';

  @override
  String get searchIncompleteActions =>
      'আপনার কাজগুলোতে খোঁজা যায়নি, তাই এই ফলাফল অসম্পূর্ণ হতে পারে।';

  @override
  String get searchIncompleteCaptures =>
      'আপনার ক্যাপচারগুলোতে খোঁজা যায়নি, তাই এই ফলাফল অসম্পূর্ণ হতে পারে।';

  @override
  String get searchIncompleteBoth =>
      'আপনার কাজ বা ক্যাপচার কোনোটিতেই খোঁজা যায়নি, তাই এই ফলাফল অসম্পূর্ণ হতে পারে।';

  @override
  String get searchMatchTitle => 'শিরোনাম';

  @override
  String get searchMatchNextStep => 'পরবর্তী ধাপ';

  @override
  String get searchMatchStep => 'ধাপ';

  @override
  String get searchMatchSummary => 'সারসংক্ষেপ';

  @override
  String get searchMatchFromCapture => 'ক্যাপচার থেকে';

  @override
  String get studioSuggested => 'আপনার শেষ ক্যাপচারের জন্য প্রস্তাবিত';

  @override
  String get studioRecentlyUsed => 'সম্প্রতি ব্যবহৃত';

  @override
  String get studioReady => 'প্রস্তুত';

  @override
  String get studioNotConnected => 'যুক্ত নয়';

  @override
  String get studioHeroTitle => 'Action ইন্টেলিজেন্স';

  @override
  String get studioConnectedBlurb =>
      'একটি ডকুমেন্ট বুঝুন, লক্ষ্য উন্নত করুন, পরিকল্পনা সাজান, উত্তরের খসড়া লিখুন, বা সামনে যা আছে তা যাচাই করুন।';

  @override
  String studioDisconnectedBlurb(int count) {
    return 'ডকুমেন্ট বোঝা, পরিকল্পনা ও লেখার জন্য $countটি টুল। ব্যবহার করতে নিজের AI অ্যাকাউন্ট যুক্ত করুন — বিল আপনার প্রোভাইডার নেয়, Action কখনও নয়।';
  }

  @override
  String get studioConnectAi => 'AI যুক্ত করুন';

  @override
  String get studioHowItWorks => 'কীভাবে কাজ করে';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'এর $countটি এখনই ওসব ছাড়াই চলে, পুরোপুরি এই ডিভাইসে।',
      one: 'এর ১টি এখনই ওসব ছাড়াই চলে, পুরোপুরি এই ডিভাইসে।',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'এই ডিভাইসেই চলে';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title। $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title। $description এই ডিভাইসেই চলে।';
  }

  @override
  String get categoryUnderstand => 'বুঝুন';

  @override
  String get categoryUnderstandBlurb => 'আপনার কাছে যা আছে তার মানে বের করুন।';

  @override
  String get categoryPlan => 'পরিকল্পনা';

  @override
  String get categoryPlanBlurb => 'এটিকে করার মতো কিছুতে বদলান।';

  @override
  String get categoryCreate => 'তৈরি';

  @override
  String get categoryCreateBlurb => 'লিখুন, উন্নত করুন, অনুবাদ করুন।';

  @override
  String get categoryExtract => 'বের করুন';

  @override
  String get categoryExtractBlurb => 'যে বিবরণগুলো জরুরি, সেগুলো টেনে আনুন।';

  @override
  String get categoryVerify => 'যাচাই';

  @override
  String get categoryVerifyBlurb => 'সামনে যা আছে তা পরখ করুন।';

  @override
  String get captureSheetTitle => 'কিছু ক্যাপচার করুন';

  @override
  String get captureSheetSubtitle =>
      'যা পুরো পড়তে ইচ্ছে করছে না, Action-কে দিয়ে দিন।';

  @override
  String get captureTakePhoto => 'ছবি তুলুন';

  @override
  String get captureTakePhotoSubtitle => 'সামনে থাকা চিঠি, বিল বা নোটিশ';

  @override
  String get captureChooseImage => 'ছবি বেছে নিন';

  @override
  String get captureChooseImageSubtitle => 'এই ডিভাইসে থাকা স্ক্রিনশট বা ছবি';

  @override
  String get capturePasteText => 'লেখা পেস্ট করুন';

  @override
  String get capturePasteTextSubtitle => 'ইমেইল, মেসেজ বা নোটিশ';

  @override
  String get captureChoosePdf => 'PDF বেছে নিন';

  @override
  String get captureChoosePdfSubtitle =>
      'আপনার কাছে থাকা স্টেটমেন্ট, চিঠি বা ফর্ম';

  @override
  String get captureFootnote =>
      'ক্যাপচার এই ডিভাইসেই থাকে। আপনি না বলা পর্যন্ত অনলাইনে কিছুই বিশ্লেষণ করা হয় না।';

  @override
  String get captureCouldNotOpen => 'ওটা খোলা গেল না। অন্যভাবে চেষ্টা করুন।';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title। $subtitle';
  }

  @override
  String get stageReading => 'পড়া হচ্ছে';

  @override
  String get stageNeedsReview => 'পর্যালোচনা দরকার';

  @override
  String get stageActionCreated => 'কাজ তৈরি হয়েছে';

  @override
  String get stageNoText => 'কোনো লেখা পাওয়া যায়নি';

  @override
  String get stageCouldNotBeRead => 'পড়া যায়নি';

  @override
  String get stageReadingPreview => 'লেখা পড়া হচ্ছে…';

  @override
  String get stageFailedPreview => 'এটি এই ডিভাইসে পড়া যায়নি।';

  @override
  String get provenancePhoto => 'ছবি থেকে নেওয়া';

  @override
  String get provenanceImage => 'গ্যালারির ছবি থেকে নেওয়া';

  @override
  String get provenancePastedText => 'পেস্ট করা লেখা থেকে নেওয়া';

  @override
  String get provenanceDocument => 'ডকুমেন্ট হিসেবে যোগ করা';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'শেষ হয়েছে $when';
  }

  @override
  String metaOverdue(String date) {
    return 'সময় পেরিয়েছে · সময় ছিল $date';
  }

  @override
  String get metaDueToday => 'আজকের মধ্যে';

  @override
  String metaDueOn(String date) {
    return '$date-এর মধ্যে';
  }

  @override
  String get metaCreatedByYou => 'আপনার তৈরি';

  @override
  String get categoryPayment => 'পেমেন্ট';

  @override
  String get categoryRenewal => 'নবায়ন';

  @override
  String get categoryAppointment => 'অ্যাপয়েন্টমেন্ট';

  @override
  String get categoryBooking => 'বুকিং';

  @override
  String get categoryTravel => 'ভ্রমণ';

  @override
  String get categoryDeadline => 'সময়সীমা';

  @override
  String get categoryResponse => 'উত্তর দরকার';

  @override
  String get categoryDelivery => 'ডেলিভারি';

  @override
  String get categoryDocument => 'ডকুমেন্ট';

  @override
  String get categoryNoActionRequired => 'কিছু করার নেই';

  @override
  String get categoryUnsure => 'নিশ্চিত নয়';

  @override
  String get errorEnterManually => 'নিজে লিখে দিন';

  @override
  String get sourceWhatWeRead => 'আমরা যা পড়েছি';

  @override
  String get sourceDelete => 'ক্যাপচার মুছুন';

  @override
  String get sourceGone => 'ওই ক্যাপচার আর নেই।';

  @override
  String get sourceDeleteTitle => 'এই ক্যাপচার মুছে ফেলবেন?';

  @override
  String get sourceDeleteBody =>
      'ছবিটি এবং তা থেকে পড়া লেখা এই ডিভাইস থেকে সরে যাবে।';

  @override
  String get sourceDeleteKeep => 'থাক';

  @override
  String get sourceOpenAction => 'কাজটি খুলুন';

  @override
  String sourceOpenActions(int count) {
    return '$countটি কাজ খুলুন';
  }

  @override
  String get sourceCreateAnother => 'এটি থেকে আরেকটি তৈরি করুন';

  @override
  String get sourceCreateAction => 'এটি থেকে একটি কাজ তৈরি করুন';

  @override
  String get sourceDoMore => 'এটি দিয়ে আরও কিছু করুন';

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
    return '$format $size KB থেকে';
  }

  @override
  String get sourceTextFound => 'লেখা পাওয়া গেছে';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines লাইন · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Action যে লেখা পড়েছে সেটি এই। তা থেকে যা তৈরি হয়েছে তা নিচে।';

  @override
  String get sourceNotInterpreted =>
      'এখনও কিছু ব্যাখ্যা করা হয়নি। Action পরামর্শ দেবে এটি দিয়ে কী করা যায়, আর কিছু তৈরি হওয়ার আগে আপনি নিশ্চিত করেন।';

  @override
  String get sourceNoTextExplainer =>
      'হাতের লেখায়, খুব কম আলোয়, বা এমন লিপিতে এটি হতে পারে যা এই ডিভাইস এখনও পড়তে পারে না।';

  @override
  String get sourceReadFailed => 'এটি পড়া গেল না';

  @override
  String get sourceReadFailedReason => 'লেখা শনাক্তকরণ শেষ হয়নি।';

  @override
  String get sourceTryReadingAgain => 'আবার পড়ার চেষ্টা করুন';

  @override
  String get sourceTypeInstead => 'বরং বিবরণ টাইপ করুন';

  @override
  String get sourceTypeWhatItSays => 'যা লেখা আছে তা টাইপ করুন';

  @override
  String get sourceTypeHint => 'তারিখ, অঙ্ক, আর কী চাওয়া হচ্ছে।';

  @override
  String get sourceMadeFromThis => 'এই ক্যাপচার থেকে তৈরি';

  @override
  String sourceMadeFromThisCount(int count) {
    return 'এই ক্যাপচার থেকে $countটি তৈরি';
  }

  @override
  String get sourceTheDocument => 'নথিটি';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count পৃষ্ঠা',
      one: '১ পৃষ্ঠা',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'পৃষ্ঠার সংখ্যা জানা নেই';

  @override
  String get sourceDocumentNotRead =>
      'এই নথির ভিতরে কী আছে Action তা পড়েনি। যে সরঞ্জামের এটি দরকার তা চালালে ফাইলটি আপনার যুক্ত করা AI সরবরাহকারীর কাছে যাবে, এবং তার আগে আপনাকে জানানো হবে।';

  @override
  String get previewSaveFailed => 'ওটি সেভ করা গেল না। আবার চেষ্টা করুন।';

  @override
  String get previewTitle => 'ক্যাপচারটি দেখে নিন';

  @override
  String get previewImageFailed => 'ওই ছবিটি খোলা গেল না।';

  @override
  String get previewHint =>
      'দেখে নিন লেখা পড়ার মতো আছে আর জরুরি কিছু কেটে যায়নি।';

  @override
  String get previewRetake => 'আবার তুলুন';

  @override
  String get pasteTitle => 'লেখা পেস্ট করুন';

  @override
  String get pasteHint =>
      'যে ইমেল, বার্তা বা বিজ্ঞপ্তি পুরোটা পড়তে ইচ্ছে করছে না, সেটি পেস্ট করুন।';

  @override
  String get pasteFootnote =>
      'যাতে তারিখ, অঙ্ক বা কোনো অনুরোধ আছে, তা ভালো কাজ করে।';

  @override
  String get pasteEnough => 'মনে হচ্ছে কাজ চালানোর মতো যথেষ্ট।';

  @override
  String get pasteMore => 'আর একটু লেখা হলে ফল ভালো হবে।';

  @override
  String get reviewLoadFailed => 'এই ক্যাপচারটি লোড করা গেল না।';

  @override
  String get reviewConfirmed => 'নিশ্চিত';

  @override
  String get reviewNeedsReview => 'পর্যালোচনা দরকার';

  @override
  String get reviewReview => 'পর্যালোচনা করুন';

  @override
  String get reviewHighConfidence => 'উঁচু আস্থা';

  @override
  String get reviewConfirmedByYou => 'আপনি নিশ্চিত করেছেন';

  @override
  String get reviewMissing => 'নেই';

  @override
  String get reviewNotUnderstood =>
      'Action এই উৎসের যথেষ্ট অংশ নির্ভরযোগ্যভাবে বুঝতে পারেনি।';

  @override
  String get reviewNotUnderstoodBody =>
      'ক্যাপচারটি অক্ষত আছে এবং কিছুই হারায়নি। আপনি নিজেই বিবরণ লিখতে পারেন, আর উৎসটি মিলিয়ে দেখার জন্য জোড়া থাকে।';

  @override
  String get reviewEnterDetails => 'বিবরণ লিখুন';

  @override
  String get reviewKeepSource => 'উৎসটি পরে দেখার জন্য রাখুন';

  @override
  String reviewEngine(String engine) {
    return 'ইঞ্জিন: $engine';
  }

  @override
  String get reviewManualNotice =>
      'এই কাজটি আপনি নিজেই তৈরি করছেন। আপনি এখানে যা লিখবেন কেবল তাই ব্যবহার হবে।';

  @override
  String get reviewUntitled => 'শিরোনামহীন কাজ';

  @override
  String get reviewEditTitle => 'শিরোনাম বদলান';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি মান আপনার পর্যালোচনা চায়।',
      one: 'এটি নিশ্চিত করার আগে ১টি মান আপনার পর্যালোচনা চায়।',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'মূল তথ্য';

  @override
  String get reviewNotFound => 'পাওয়া যায়নি';

  @override
  String get reviewSuggestedNextStep => 'প্রস্তাবিত পরের ধাপ';

  @override
  String get reviewWhyThisMatters => 'কেন এটি জরুরি';

  @override
  String get reviewSteps => 'ধাপ';

  @override
  String get reviewAddStep => 'ধাপ যোগ করুন';

  @override
  String get reviewInjectionNotice =>
      'এই উৎসের কিছু লেখা নথির তথ্য নয়, বরং নির্দেশের মতো দেখাচ্ছিল, তাই Action সেটি বাদ দিয়েছে।';

  @override
  String get reviewLayoutNotice =>
      'এই নথির বিন্যাসে এমন সম্পর্ক থাকতে পারে যা লেখা তুলে আনার সময় পুরোপুরি রক্ষা করা যায়নি। নিশ্চিত করার আগে নিচের মানগুলো উৎসের সঙ্গে মিলিয়ে নিন।';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason নিচের মানগুলো উৎসের সঙ্গে মিলিয়ে নিন।';
  }

  @override
  String get reviewDeadline => 'সময়সীমা';

  @override
  String get reviewAmount => 'পরিমাণ';

  @override
  String get reviewLeftUnset => 'কিছু নেই — আপনি এটি ফাঁকা রাখা বেছে নিয়েছেন';

  @override
  String get reviewUnclear => 'স্পষ্ট নয়';

  @override
  String get reviewNotSet => 'ঠিক করা হয়নি';

  @override
  String get reviewNoDeadlineFound => 'এই নথিতে কোনোটি পাওয়া যায়নি';

  @override
  String get reviewNoAmountFound => 'এই নথিতে কোনো পরিমাণ পাওয়া যায়নি';

  @override
  String get reviewMultipleDates => 'Action একাধিক সম্ভাব্য তারিখ পেয়েছে।';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$countটি তারিখ সময়সীমা হতে পারে। ঠিকটি বেছে নিন, অন্য একটি লিখুন, বা ফাঁকা রাখুন।';
  }

  @override
  String get reviewChooseDate => 'একটি তারিখ বেছে নিন';

  @override
  String get reviewMultipleAmounts =>
      'Action একের বেশি সম্ভাব্য পরিমাণ পেয়েছে।';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$countটি পরিমাণের কোনোটি এই কাজের হতে পারে। একটি বেছে নিন, অন্য একটি লিখুন, বা ফাঁকা রাখুন।';
  }

  @override
  String get reviewChooseAmount => 'একটি পরিমাণ বেছে নিন';

  @override
  String get reviewSkipStep => 'এই ধাপটি বাদ দিন';

  @override
  String get reviewKeepStep => 'এই ধাপটি রাখুন';

  @override
  String get reviewEditStep => 'ধাপ বদলান';

  @override
  String get reviewCreateManually => 'নিজে তৈরি করুন';

  @override
  String get reviewConfirmAndCreate => 'নিশ্চিত করে কাজ তৈরি করুন';

  @override
  String get reviewFixHighlighted => 'চিহ্নিত ঘরগুলো দেখুন';

  @override
  String get reviewSaving => 'সেভ হচ্ছে…';

  @override
  String get reviewSaveFailed =>
      'এই কাজটি সেভ করা গেল না। কিছুই হারায়নি — আবার চেষ্টা করুন।';

  @override
  String get reviewFieldTitle => 'শিরোনাম';

  @override
  String get reviewTitleHint => 'কী হওয়া দরকার?';

  @override
  String get reviewNewStep => 'নতুন ধাপ';

  @override
  String get reviewStepHint => 'কী করতে হবে';

  @override
  String get reviewDatesConflict => 'নথিতে একের বেশি তারিখ আছে।';

  @override
  String get reviewAmountsConflict => 'নথিতে একের বেশি পরিমাণ আছে।';

  @override
  String get reviewAnotherDate => 'অন্য তারিখ — 2026-08-30';

  @override
  String get reviewBadDate =>
      'এটি সত্যিকারের তারিখ নয়। 2026-08-30 ছাঁদে লিখুন।';

  @override
  String get reviewTypeDate => 'একটি তারিখ টাইপ করুন, বা নিচে ফাঁকা রাখুন।';

  @override
  String get reviewUseThisDate => 'এই তারিখটি নিন';

  @override
  String get reviewLeaveNoDeadline => 'সময়সীমা ছাড়াই এগোন';

  @override
  String get reviewAnotherAmount => 'অন্য পরিমাণ — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'এই পরিমাণ ব্যবহার করা যাবে না: $reason।';
  }

  @override
  String get reviewUseThisAmount => 'এই পরিমাণটি নিন';

  @override
  String get reviewLeaveNoAmount => 'পরিমাণ ছাড়াই এগোন';

  @override
  String get reviewThisValue => 'এই মান';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => 'ক্যাপচারে দেখুন';

  @override
  String get reviewViewSource => 'উৎস দেখুন';

  @override
  String get reviewFromSource => 'উৎস থেকে';

  @override
  String get reviewNotVerified => 'মিলিয়ে দেখা হয়নি';

  @override
  String get reviewCouldNotVerify => 'এটি উৎসের সঙ্গে মিলিয়ে দেখা গেল না।';

  @override
  String get reviewLooksRight => 'ঠিক মনে হচ্ছে';

  @override
  String get reviewStageReading => 'উৎস পড়া হচ্ছে';

  @override
  String get reviewStageUnderstanding => 'জরুরি বিবরণ বোঝা হচ্ছে';

  @override
  String get reviewStageChecking => 'কীসের পর্যালোচনা দরকার তা দেখা হচ্ছে';

  @override
  String get reviewNothingToDo => 'এই মুহূর্তে আপনার কিছু করার নেই।';

  @override
  String get reviewInformationOnly =>
      'এটি কেবল তথ্য বলে মনে হচ্ছে — কোনো সময়সীমা, টাকা বা উত্তরের অনুরোধ পাওয়া যায়নি।';

  @override
  String get reviewInformationOnlyWithSource =>
      'এটি কেবল তথ্য বলে মনে হচ্ছে — এই ক্যাপচারে কোনো সময়সীমা, টাকা বা উত্তরের অনুরোধ পাওয়া যায়নি।';

  @override
  String get reviewSourceKept => 'উৎসটি যেভাবেই হোক রাখা থাকে।';

  @override
  String get reviewAddAnyway => 'তবুও একটি কাজ যোগ করুন';

  @override
  String get reviewActionConfirmed => 'কাজ নিশ্চিত হয়েছে';

  @override
  String get reviewCreatedByYou => 'আপনি তৈরি করেছেন।';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পর্যালোচিত তথ্যের ভিত্তিতে আপনি নিশ্চিত করেছেন।',
      one: '১টি পর্যালোচিত তথ্যের ভিত্তিতে আপনি নিশ্চিত করেছেন।',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$countটি পর্যালোচিত তথ্যের ভিত্তিতে আপনি নিশ্চিত করেছেন। এর মধ্যে $editedটি আপনি বদলেছেন।',
      one:
          '১টি পর্যালোচিত তথ্যের ভিত্তিতে আপনি নিশ্চিত করেছেন। এর মধ্যে $editedটি আপনি বদলেছেন।',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'এই ডিভাইসেই সেভ হয়েছে।';

  @override
  String get evidenceTitle => 'এটি কোথা থেকে এসেছে';

  @override
  String get evidenceUnverified =>
      'Action যে লেখা পড়েছে তাতে এই শব্দগুলো পায়নি, তাই এই মানটি মিলিয়ে দেখা হয়নি। এর উপর ভরসা করার আগে মূলটির সঙ্গে মিলিয়ে নিন।';

  @override
  String get evidenceHighlighted =>
      'Action এই ক্যাপচার থেকে যে লেখা পড়েছে তাতে এই শব্দগুলো ছিল, আর চিহ্নটি দেখাচ্ছে কোথায়।';

  @override
  String get evidenceNoRegion =>
      'Action এই ক্যাপচার থেকে যে লেখা পড়েছে তাতে এই শব্দগুলো ছিল। ছবির ঠিক কোন জায়গায় সেগুলো আছে তা বের করা যায়নি, আর এখানে আন্দাজ করা হয় না।';

  @override
  String get evidenceInText => 'এই ক্যাপচারে যে লেখা আছে তাতে এই শব্দগুলো ছিল।';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'অতি জরুরি';

  @override
  String get urgencyImportant => 'গুরুত্বপূর্ণ';

  @override
  String get urgencyNormal => 'সাধারণ';

  @override
  String get urgencyLow => 'কম';

  @override
  String get urgencyUnsure => 'নিশ্চিত নয়';
}
