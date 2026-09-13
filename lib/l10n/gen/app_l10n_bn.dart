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
  String get detailLoadFailed =>
      'এই কাজটি লোড করা গেল না। এটি এখনও এই ডিভাইসেই সেভ করা আছে।';

  @override
  String get detailNotFoundTitle => 'সেই কাজটি আর এখানে নেই';

  @override
  String get detailNotFoundMessage => 'হয়তো এই ডিভাইসেই এটি মুছে ফেলা হয়েছে।';

  @override
  String get detailGoBack => 'ফিরে যান';

  @override
  String get detailMore => 'আরও';

  @override
  String get detailChangeUrgency => 'জরুরি মাত্রা বদলান';

  @override
  String get detailAddRecommendedStep => 'প্রস্তাবিত ধাপ যোগ করুন';

  @override
  String get detailEditRecommendedStep => 'প্রস্তাবিত ধাপ বদলান';

  @override
  String get detailArchiveTitle => 'এই কাজটি সংরক্ষণে রাখবেন?';

  @override
  String get detailArchiveBody =>
      'এটি আপনার তালিকা থেকে সরে যায় কিন্তু মুছে যায় না, আর যে ক্যাপচার থেকে এটি এসেছে সেটিও রাখা থাকে।';

  @override
  String get detailArchiveConfirm => 'সংরক্ষণে রাখুন';

  @override
  String get detailArchived => 'সংরক্ষণে';

  @override
  String detailCompletedOn(String date) {
    return '$date তারিখে শেষ হয়েছে';
  }

  @override
  String get detailSectionDetails => 'বিবরণ';

  @override
  String get detailSectionReminders => 'মনে করিয়ে দেওয়া';

  @override
  String get detailAllStepsDone => 'সব ধাপ শেষ';

  @override
  String get detailNextEyebrow => 'পরবর্তী';

  @override
  String get detailCompleteQuestion => 'এই কাজটি শেষ করবেন?';

  @override
  String get detailMarkStepDone => 'ধাপটি শেষ বলে চিহ্নিত করুন';

  @override
  String get detailCompleteAction => 'এই কাজটি শেষ করুন';

  @override
  String get detailAddDeadline => 'সময়সীমা যোগ করুন';

  @override
  String get detailAddAmount => 'পরিমাণ যোগ করুন';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$totalটির মধ্যে $completedটি শেষ';
  }

  @override
  String get detailNoStepsTitle => 'এখনও কোনো ধাপ নেই';

  @override
  String get detailNoStepsMessage =>
      'যে কাজগুলো আপনাকে সত্যিই করতে হবে, সেই ভাগে ভাগ করুন।';

  @override
  String get detailAddFirstStep => 'প্রথম ধাপ যোগ করুন';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'শেষ হওয়া ধাপ: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'পরের ধাপ: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'ধাপ: $title';
  }

  @override
  String detailMarkDone(String title) {
    return '“$title” শেষ বলে চিহ্নিত করুন';
  }

  @override
  String detailMarkNotDone(String title) {
    return '“$title” অসম্পূর্ণ বলে চিহ্নিত করুন';
  }

  @override
  String get detailStepOptions => 'ধাপের বিকল্প';

  @override
  String get detailMoveUp => 'উপরে সরান';

  @override
  String get detailMoveDown => 'নিচে সরান';

  @override
  String get detailDeleteStep => 'ধাপ মুছুন';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'এই ধাপটি মুছবেন?';

  @override
  String get stepDeleteKeep => 'থাক';

  @override
  String get detailNoRemindersYet => 'এখনও কিছু মনে করিয়ে দেওয়ার নেই।';

  @override
  String get detailReminderLimit =>
      'একটি কাজে এর বেশি মনে করিয়ে দেওয়া রাখা যায় না। আরেকটি যোগ করতে একটি সরান।';

  @override
  String get detailAddReminder => 'মনে করিয়ে দেওয়া যোগ করুন';

  @override
  String get detailChangeReminder => 'মনে করিয়ে দেওয়া বদলান';

  @override
  String get detailRemoveReminder => 'মনে করিয়ে দেওয়া সরান';

  @override
  String get detailReminderFormat => 'EEE d MMM, h:mm a';

  @override
  String get reminderStatePending => 'এখনও সেট হয়নি';

  @override
  String get reminderStateNotificationsOff =>
      'সেভ হয়েছে, কিন্তু বিজ্ঞপ্তি বন্ধ';

  @override
  String get reminderStateFailed => 'সময় ঠিক করা গেল না';

  @override
  String get reminderStateRemoving => 'সরানো হচ্ছে…';

  @override
  String get reminderSetConfirmation =>
      'মনে করিয়ে দেওয়া সেট হয়েছে। আমরা মনে করিয়ে দেব।';

  @override
  String get reminderUpdatedConfirmation => 'মনে করিয়ে দেওয়া বদলেছে।';

  @override
  String get reminderNeedsPermission =>
      'বিজ্ঞপ্তি বন্ধ আছে, তাই এটি সেভ হয়েছে ঠিকই কিন্তু এখনও আপনাকে জানাতে পারবে না।';

  @override
  String get reminderScheduleFailed =>
      'এটি সেভ হয়েছে, কিন্তু Android এর সময় ঠিক করতে চায়নি।';

  @override
  String get reminderLimitReached =>
      'সেই কাজে ইতিমধ্যেই সর্বোচ্চ সংখ্যক মনে করিয়ে দেওয়া আছে।';

  @override
  String get reminderTimeInPast => 'সেই সময় পেরিয়ে গেছে।';

  @override
  String get reminderAddTitle => 'একটি মনে করিয়ে দেওয়া যোগ করুন';

  @override
  String get reminderChangeTitle => 'এই মনে করিয়ে দেওয়া বদলান';

  @override
  String get reminderDateLabel => 'তারিখ';

  @override
  String get reminderTimeLabel => 'সময়';

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
    return 'আপনাকে $date তারিখে $time-এ মনে করিয়ে দেওয়া হবে।';
  }

  @override
  String get reminderTimePastError =>
      'সেই সময় পেরিয়ে গেছে। পরের কোনো সময় বেছে নিন।';

  @override
  String get reminderSet => 'মনে করিয়ে দেওয়া সেট করুন';

  @override
  String get reminderPresetInHour => '১ ঘণ্টা পরে';

  @override
  String get reminderPresetTomorrowMorning => 'কাল সকালে';

  @override
  String get reminderPresetNextWeek => 'আগামী সপ্তাহে';

  @override
  String get reminderPresetOnTheDay => 'সেই দিনেই';

  @override
  String get reminderPresetDayBefore => '১ দিন আগে';

  @override
  String get reminderPresetWeekBefore => '১ সপ্তাহ আগে';

  @override
  String get reminderPresetAtDeadline => 'সময়সীমার সময়ে';

  @override
  String get reminderPresetHourBefore => '১ ঘণ্টা আগে';

  @override
  String get editNextStepTitle => 'প্রস্তাবিত পরের ধাপ';

  @override
  String get editNextStepSubtitle => 'পরের কাজের বিষয়ে একটি ছোট বাক্য।';

  @override
  String get editNextStepHint => 'পরের কাজের ধাপটি কী?';

  @override
  String get editRemoveSuggestion => 'প্রস্তাব সরান';

  @override
  String get editUrgencyTitle => 'এটি কতটা জরুরি?';

  @override
  String get editStepHint => 'করার মতো একটি নির্দিষ্ট কাজ';

  @override
  String get editAddStep => 'ধাপ যোগ করুন';

  @override
  String get editDateHint => 'বববব-মম-দদ';

  @override
  String get editRemoveDeadline => 'সময়সীমা সরান';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => 'পরিমাণ সেভ করুন';

  @override
  String get editRemoveAmount => 'পরিমাণ সরান';

  @override
  String get securityTitle => 'নিরাপত্তা ও গোপনীয়তা';

  @override
  String get securitySectionProtection => 'সুরক্ষা';

  @override
  String get securityAppLockUnavailable =>
      'অ্যাপ লকের জন্য এই ডিভাইসে স্ক্রিন লক দরকার। আগে ডিভাইস সেটিংসে একটি পিন, প্যাটার্ন, পাসওয়ার্ড বা আঙুলের ছাপ ঠিক করুন।';

  @override
  String get securityAppLockOn =>
      'Action আপনার ডিভাইসকে বলে নিশ্চিত করতে যে এটি আপনিই।';

  @override
  String get securityAppLockOff =>
      'Action খুলতে আপনার আঙুলের ছাপ, মুখ বা ডিভাইসের পিন লাগবে।';

  @override
  String get securityAskAgain => 'আবার জিজ্ঞেস করুন';

  @override
  String get securityAskAgainDescription =>
      'লক হওয়ার আগে Action কতক্ষণ পেছনে থাকতে পারবে।';

  @override
  String get securityScreenPrivacy => 'স্ক্রিন গোপনীয়তা';

  @override
  String get securityScreenPrivacyDescription =>
      'Android-কে বলুন স্ক্রিনশট ও স্ক্রিন রেকর্ডিং আটকাতে, আর অ্যাপ সুইচারে Action লুকিয়ে রাখতে।';

  @override
  String get securityPrivateReminders => 'ব্যক্তিগত মনে করিয়ে দেওয়া';

  @override
  String get securityPrivateRemindersOn =>
      'মনে করিয়ে দেওয়া শুধু বলে যে কিছু একটা আপনার অপেক্ষায়।';

  @override
  String get securityPrivateRemindersOff =>
      'মনে করিয়ে দেওয়ায় কাজের শিরোনাম দেখায়। সেটি লক স্ক্রিনে না আসতে দিতে এটি চালু করুন।';

  @override
  String get securityLockNow => 'এখনই লক করুন';

  @override
  String get securityLockNowDescription => 'অপেক্ষা না করে দরজা বন্ধ করুন।';

  @override
  String get securitySectionStorage => 'আপনার তথ্য কীভাবে রাখা হয়';

  @override
  String get securityStorageDataLabel => 'আপনার কাজ, ক্যাপচার ও সেটিংস';

  @override
  String get securityStorageDataDetail =>
      'এগুলো এই অ্যাপের নিজস্ব ব্যক্তিগত সংরক্ষণে থাকে, যা অন্য অ্যাপ পড়তে পারে না এবং যা Android ডিভাইস এনক্রিপশনের অংশ হিসেবে এনক্রিপ্ট করে। Action এর উপরে নিজের দ্বিতীয় কোনো স্তর যোগ করে না।';

  @override
  String get securityStorageKeyLabel => 'আপনার AI সরবরাহকারীর চাবি';

  @override
  String get securityStorageKeyDetail =>
      'বাকি সবের সঙ্গে নয়, Android Keystore-এ রাখা হয়, আর সেভ করার পর আর কখনো দেখানো হয় না।';

  @override
  String get securityStorageGapLabel => 'এটি যা ঢাকে না';

  @override
  String get securityStorageGapDetail =>
      'এর কোনোটিই এমন কারো থেকে রক্ষা করে না যে আপনার আনলক করা ডিভাইস ব্যবহার করছে, আর বদলে ফেলা বা রুট করা সিস্টেম সাধারণের চেয়ে বেশি পড়তে পারে। অ্যাপ লক সেই ব্যবস্থাটি যা প্রথমটিতে সাহায্য করে।';

  @override
  String get securitySectionInformation => 'আপনার তথ্য';

  @override
  String get securityWhereInfoDescription =>
      'আপনার তথ্যের প্রতিটি পথ, আর যে দুটি এই ডিভাইস ছেড়ে যায়।';

  @override
  String get securityAppLockRefused => 'নিশ্চিত করা হয়নি, তাই কিছুই বদলায়নি।';

  @override
  String get securityAppLockUnavailableToast =>
      'এই ডিভাইসে কোনো স্ক্রিন লক ঠিক করা নেই। ডিভাইস সেটিংসে একটি পিন, প্যাটার্ন, পাসওয়ার্ড বা আঙুলের ছাপ যোগ করে আবার চেষ্টা করুন।';

  @override
  String get securityScreenPrivacyRefused =>
      'এই ডিভাইস স্ক্রিন গোপনীয়তা প্রয়োগ করতে চায়নি, তাই চালু দেখানোর বদলে সেটি বন্ধই রাখা হয়েছে।';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি নির্ধারিত মনে করিয়ে দেওয়া এখন কম বলে।',
      one: '১টি নির্ধারিত মনে করিয়ে দেওয়া এখন কম বলে।',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি নির্ধারিত মনে করিয়ে দেওয়া হালনাগাদ হয়েছে।',
      one: '১টি নির্ধারিত মনে করিয়ে দেওয়া হালনাগাদ হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'সঙ্গে সঙ্গে';

  @override
  String get appLockDelayOneMinute => '১ মিনিট পরে';

  @override
  String get appLockDelayFiveMinutes => '৫ মিনিট পরে';

  @override
  String get securityDelayImmediatelyDescription =>
      'যতবার Action পর্দা ছেড়ে যায়';

  @override
  String get securityDelayOneMinuteDescription =>
      'একটি বার্তার উত্তর দেওয়ার মতো সময়';

  @override
  String get securityDelayFiveMinutesDescription => 'একটি ফোন ধরার মতো সময়';

  @override
  String get securityHeroProtected => 'সুরক্ষিত রাখা';

  @override
  String get securityHeroNothingOn => 'কিছুই চালু নেই';

  @override
  String get securityHeroFootnote =>
      'এখানকার সবকিছু এই ডিভাইসেই কাজ করে। এই সেটিংসের কোনোটিই কোথাও পাঠানো হয় না, আর কোনোটিই দূর থেকে বদলানো যায় না।';

  @override
  String get securityHeadlineNone => 'তিনটি সুরক্ষা রয়েছে';

  @override
  String securityHeadlineOne(String first) {
    return '$first চালু';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first এবং $second চালু';
  }

  @override
  String get securityHeadlineAll => 'তিনটি সুরক্ষাই চালু';

  @override
  String get securityTransfersTitle => 'এই ডিভাইস থেকে কী গেছে';

  @override
  String get securityTransfersNoProvider =>
      'কোনো AI সরবরাহকারী যুক্ত নেই, তাই বিশ্লেষণের জন্য কিছুই পাঠানো হচ্ছে না।';

  @override
  String get securityTransfersDescription =>
      'যে মুহূর্তে কিছু পাঠানো হয় সেই মুহূর্তেই এখানে লেখা হয়, উত্তর ফিরুক বা না ফিরুক। শুধু সরঞ্জাম, সরবরাহকারী আর আকার — ভেতরে কী ছিল তা কখনোই নয়। এই ডিভাইসে ৯০ দিন রাখা হয় এবং কোথাও পাঠানো হয় না।';

  @override
  String get securityClear => 'মুছুন';

  @override
  String get securityNothingSent => 'কিছুই পাঠানো হয়নি';

  @override
  String get securityNothingSentDescription =>
      'আপনি যখন এমন সরঞ্জাম চালাবেন যা আপনার AI সরবরাহকারী ব্যবহার করে, সেটি এখানে থাকবে।';

  @override
  String get securityClearHistoryTitle => 'এই ইতিহাস মুছবেন?';

  @override
  String get securityClearHistoryBody =>
      'কী পাঠানো হয়েছিল তার নথি এই ডিভাইস থেকে মুছে যাবে। যা আগেই পাঠানো হয়ে গেছে তা এটি ফিরিয়ে আনে না।';

  @override
  String get securityUnnamedTool => 'একটি Intelligence সরঞ্জাম';

  @override
  String get securityYourProvider => 'আপনার AI সরবরাহকারীর কাছে';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count পৃষ্ঠা',
      one: '১ পৃষ্ঠা',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ফাইল',
      one: '১টি ফাইল',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'ছোট একটুকরো লেখা';

  @override
  String securityTransferCharacters(int count) {
    return '$count হাজার অক্ষর';
  }

  @override
  String securitySentTo(String provider) {
    return '$provider-কে পাঠানো হয়েছে।';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '$provider-কে পাঠানো হয়েছে · $size।';
  }

  @override
  String relativeWeeks(int count) {
    return '$count সপ্তাহ আগে';
  }

  @override
  String get helpTitle => 'সহায়তা';

  @override
  String get helpAddQuestion => 'আমি কী যোগ করতে পারি?';

  @override
  String get helpAddAnswer =>
      'একটি স্ক্রিনশট, কোনো চিঠি বা বিলের ছবি, বা আপনার পেস্ট করা লেখা। যাতে তারিখ, অঙ্ক বা কোনো অনুরোধ আছে তা সবচেয়ে ভালো চলে।';

  @override
  String get helpReviewQuestion => 'Action কেন আমাকে পর্যালোচনা করতে বলে?';

  @override
  String get helpReviewAnswer =>
      'কারণ নথি পড়া যন্ত্র সেটি ভুল পড়তে পারে, আর চুপচাপ ভুল হয়ে থাকা সময়সীমা কোনো সময়সীমা না থাকার চেয়েও খারাপ। Action দেখায় সে কী পেয়েছে আর কোন শব্দ থেকে পেয়েছে, আর আপনি নিশ্চিত না করা পর্যন্ত কিছুই সেভ হয় না।';

  @override
  String get helpVaryQuestion => 'আবার চেষ্টা করলে ফল বদলে যায় কেন?';

  @override
  String get helpVaryAnswer =>
      'আপনার নথি যে সেবা পড়ে সেটি নির্ধারিত নয়, তাই একই ক্যাপচার একটু আলাদা হয়ে ফিরতে পারে। পর্যালোচনার ধাপটি সে কারণেও আছে — আপনিই সেই অংশ যা বদলায় না।';

  @override
  String get helpLateQuestion => 'আমার মনে করিয়ে দেওয়া দেরিতে এল কেন?';

  @override
  String get helpLateAnswer =>
      'মনে করিয়ে দেওয়া Android দিয়ে নির্ধারিত হয়, আর ঠিক কখন পৌঁছে দেবে তা Android ঠিক করে। ব্যাটারি সাশ্রয়, Doze আর নির্মাতার পাওয়ার সেটিংস যেকোনো একটিকে দেরি করাতে পারে। Action কখনোই মিনিট ধরে মনে করিয়ে দেওয়ার প্রতিশ্রুতি দেয় না।';

  @override
  String get helpDataQuestion => 'আমার তথ্য কোথায়?';

  @override
  String get helpDataAnswer =>
      'প্রায় সবই এই ডিভাইসে: আপনার ক্যাপচার, কাজ, ধাপ, মনে করিয়ে দেওয়া আর খোঁজ। দুটি ব্যতিক্রম — আপনি Action-কে যে লেখা পড়তে বলেন তা যে AI সেবা পড়ে তার কাছে যায়, আর নিশ্চিত করা কাজের একটি সংক্ষিপ্ত নথি বেনামি পরিচয়ে ক্লাউডে রাখা হতে পারে। সেটিংসে গোপনীয়তা ও ডেটা ঠিক কী কী সেই নথিতে থাকে তা বলে দেয়।';

  @override
  String get helpBackupQuestion => 'এটি কি ব্যাকআপ?';

  @override
  String get helpBackupAnswer =>
      'না। ক্লাউডের নথি নতুন ডিভাইসে ফিরিয়ে আনা যায় না, আর লগ ইন করার মতো কোনো অ্যাকাউন্টও নেই। আপনি Action মুছে ফেললে বা এই ডিভাইস হারালে, এতে থাকা তথ্য চলে যায়।';

  @override
  String get helpCorrectQuestion => 'আমি কোনো কাজ কীভাবে ঠিক করব?';

  @override
  String get helpCorrectAnswer =>
      'সেটি খুলে যেকোনো ঘর বদলান — শিরোনাম, সময়সীমা, পরিমাণ বা প্রস্তাবিত পরের ধাপ। ধাপ যেকোনো সময় যোগ, সাজানো, শেষ ও মুছে ফেলা যায়। কোনো কাজ বদলানো AI সেবাকে কখনো কিছু জিজ্ঞেস করে না।';

  @override
  String get privacyTitle => 'গোপনীয়তা ও ডেটা';

  @override
  String get privacyIntro =>
      'Action যতটা পারে ততটা এই ডিভাইসেই রাখে। দুটি জিনিস ব্যতিক্রম, আর দুটিই নিচে দেওয়া আছে।';

  @override
  String get privacyGroupOnDevice => 'এই ডিভাইসে';

  @override
  String get privacyOnDeviceCaptures =>
      'ক্যাপচার — আপনার যোগ করা স্ক্রিনশট, ছবি ও লেখা, আর সেগুলো থেকে পড়া লেখা।';

  @override
  String get privacyOnDeviceActions =>
      'কাজ, তাদের ধাপ, তথ্য ও মনে করিয়ে দেওয়া।';

  @override
  String get privacyOnDeviceSearch =>
      'খোঁজ। আপনার খোঁজ এখানেই চলে, কোথাও পাঠানো হয় না, আর পর্দা বন্ধ করার পর রাখা হয় না।';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'ছবি তার অবস্থান ছাড়াই রাখা হয়। ফোন ছবির ভেতরে যে স্থানাঙ্ক, সময় ও ক্যামেরার বিবরণ লেখে তা ক্যাপচার সেভ হওয়ার আগেই সরিয়ে ফেলা হয়, তাই সেগুলো এখানে থাকে না এবং আপনি কোনো ক্যাপচার আপনার AI সরবরাহকারীকে পাঠালে সেগুলোও যায় না।';

  @override
  String get privacyGroupSentToRead => 'পড়ার জন্য পাঠানো';

  @override
  String get privacySentToReadWhat =>
      'আপনি যখন Action-কে কোনো ক্যাপচার বুঝতে বলেন, সেই লেখা যে AI সেবা পড়ে তার কাছে পাঠানো হয়। এটি ডিভাইসে চলা AI নয়।';

  @override
  String get privacySentToReadWhen =>
      'আপনি যে ক্যাপচারটি বেছেছেন কেবল সেটিই পাঠানো হয়, আর কেবল যখন আপনি বলেন।';

  @override
  String get privacyGroupYourProvider => 'আপনার নিজের AI সরবরাহকারীকে পাঠানো';

  @override
  String get privacyProviderWhat =>
      'আপনি সেটিংসে কোনো AI সরবরাহকারী যুক্ত করলে, Intelligence সরঞ্জামগুলো আপনার বেছে নেওয়া লেখা সেই সরবরাহকারীকে পাঠায় — OpenAI, Anthropic, Google বা আপনার বেছে নেওয়া কোনো endpoint — আপনার নিজের API চাবি দিয়ে।';

  @override
  String get privacyProviderDirect =>
      'এটি সরাসরি তাদের কাছেই যায়। Action-এর কোনো সার্ভারের ভেতর দিয়ে যায় না।';

  @override
  String get privacyProviderScope =>
      'কোনো সরঞ্জামের জন্য আপনি যা বাছেন কেবল তাই পাঠানো হয়, আর কেবল যখন আপনি সেটি চালান। আপনার অন্য কাজ, ক্যাপচার ও উৎস কখনো যুক্ত হয় না, আর পেছনে কখনো কিছু পাঠানো হয় না।';

  @override
  String get privacyProviderKey =>
      'আপনার API চাবি এই ডিভাইসের নিরাপদ সংরক্ষণে রাখা হয় এবং কেবল যে সরবরাহকারীর সেটি, তার কাছেই পাঠানো হয়। নিরাপদ সংরক্ষণ আপনার আনলক করা ডিভাইস হাতে পাওয়া কারো জন্য সত্যিকারের বাধা, কিন্তু তা চূড়ান্ত নয়, আর Action এর উল্টো কিছু দাবি করবে না।';

  @override
  String get privacyProviderLocalTools =>
      'কিছু সরঞ্জাম কখনোই কিছু পাঠায় না: স্পর্শকাতর বিবরণ আড়াল করা, কোনো ফাইল কোথা থেকে এসেছে তা যাচাই করা, ক্রেডেনশিয়াল খুঁজে বের করা আর কোনো লিঙ্ক যাচাই করা — সবই পুরোপুরি এই ডিভাইসে চলে।';

  @override
  String get privacyProviderAgreement =>
      'আপনি যা পাঠান তা নিয়ে আপনার সরবরাহকারী কী করে তা তাদের সঙ্গে আপনার চুক্তিতে ঠিক হয়, Action-এ নয়।';

  @override
  String get privacyGroupCloud => 'ক্লাউডে রাখা';

  @override
  String get privacyCloudWhat =>
      'আপনি কোনো কাজ নিশ্চিত করলে তার একটি সংক্ষিপ্ত নথি এই ইনস্টলেশনের বেনামি পরিচয়ে রাখা হতে পারে: শিরোনাম, অবস্থা, জরুরি মাত্রা, শ্রেণি, সময়সীমা, পরিমাণ, প্রস্তাবিত পরের ধাপ এবং সময়ের ছাপ।';

  @override
  String get privacyCloudNotSent =>
      'আপনার ক্যাপচার, সেগুলো থেকে পড়া লেখা, কোনো কাজের ধাপ ও তথ্য, আর আপনার মনে করিয়ে দেওয়া পাঠানো হয় না।';

  @override
  String get privacyCloudNotBackup =>
      'এটি ব্যাকআপ নয়। নতুন ডিভাইসে এটি ফিরিয়ে আনার উপায় নেই, আর এই ইনস্টলেশন হারালে বেনামি পরিচয়ও সঙ্গে চলে যায়।';

  @override
  String get privacyGroupDiagnostics => 'ডায়াগনস্টিকস';

  @override
  String get privacyDiagnosticsWhat =>
      'Action অ্যাপে কী ঘটছে তার বেনামি গণনা রাখে — যে একটি ক্যাপচার শুরু হয়েছে, যে একটি নিষ্কাশন কাজ করেছে বা করেনি, যে একটি খোঁজে কিছু মেলেনি, যে একটি কাজ শেষ হয়েছে।';

  @override
  String get privacyDiagnosticsCounts =>
      'এগুলো গণনা, বিষয়বস্তু নয়। কোনো শিরোনাম, পরিমাণ, সময়সীমা, নির্দেশ সংখ্যা, ক্যাপচার করা লেখা বা খোঁজের শব্দ কখনো যায় না, বেনামি পরিচয় বা কোনো কাজ বা ক্যাপচারের কোনো শনাক্তকারীও নয়।';

  @override
  String get privacyDiagnosticsCrash =>
      'অ্যাপ ক্র্যাশ করলে ত্রুটি আর সেটি কোথায় ঘটেছে তা জানানো হয় যাতে ঠিক করা যায়। Action ওই প্রতিবেদনের সঙ্গে আপনার তথ্য জুড়ে দেয় না।';

  @override
  String get privacySectionYourData => 'আপনার ডেটা';

  @override
  String get privacyYourDataFootnote =>
      'ক্যাপচার মুছলে আপনার কাজ জায়গামতোই থাকে। যে কাজের ক্যাপচার আর নেই সেটিও চলে; কেবল আর দেখায় না যে সেটি কী থেকে এসেছিল।';

  @override
  String get privacyClearCaptures => 'ক্যাপচার মুছুন';

  @override
  String get privacyClearCapturesDescription =>
      'প্রতিটি ক্যাপচার ও তার ছবির ফাইল মুছে দেয়।';

  @override
  String get privacyDeleteAll => 'আমার সব ডেটা মুছুন';

  @override
  String get privacyDeleteAllDescription =>
      'কাজ, ধাপ, মনে করিয়ে দেওয়া, ক্যাপচার আর উপরের ক্লাউড নথি।';

  @override
  String get privacyClearCapturesTitle => 'ক্যাপচার মুছবেন?';

  @override
  String get privacyClearCapturesBody =>
      'প্রতিটি ক্যাপচার আর তার ছবি এই ডিভাইস থেকে মুছে যাবে। আপনার কাজ ঠিক যেমন আছে তেমনই থাকে।';

  @override
  String get privacyCapturesDeleted => 'ক্যাপচার মুছে ফেলা হয়েছে।';

  @override
  String get privacyCapturesPartlyDeleted =>
      'কিছু ক্যাপচার মোছা যায়নি। আর কিছুই বদলানো হয়নি।';

  @override
  String get privacyDeleteAllTitle => 'আপনার সব ডেটা মুছবেন?';

  @override
  String get privacyDeleteAllBody =>
      'এটি এই ডিভাইসের প্রতিটি কাজ, ধাপ, মনে করিয়ে দেওয়া ও ক্যাপচার এবং উপরে দেওয়া ক্লাউড নথি মুছে দেয়। এটি ফেরানো যায় না, আর ফিরিয়ে আনার মতো কোনো ব্যাকআপও নেই।';

  @override
  String get privacyDeleteEverything => 'সবকিছু মুছুন';

  @override
  String get privacyDeletedAll => 'সবকিছু মুছে ফেলা হয়েছে।';

  @override
  String get privacyDeleteFailed => 'আপনার ডেটা মোছা যায়নি।';

  @override
  String get privacyDeletedUnverified =>
      'এই ডিভাইসের সবকিছু মুছে ফেলা হয়েছে। সেখানে কিছু বাকি নেই তা নিশ্চিত করতে Action ক্লাউডে পৌঁছাতে পারেনি, আর আবার দেখবে।';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '$leftovers ছাড়া মুছে ফেলা হয়েছে।';
  }

  @override
  String get privacyWillTryAgain => 'Action আবার চেষ্টা করবে।';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action ক্লাউড যাচাই শেষ করতে পারেনি, আর আবার চেষ্টা করবে।';

  @override
  String get privacyLeftoverCaptures => 'কিছু ক্যাপচার';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লাউড নথি',
      one: '১টি ক্লাউড নথি',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first এবং $second';
  }

  @override
  String get privacyCloudDeleted => 'ক্লাউড নথি মুছে ফেলা হয়েছে।';

  @override
  String get privacyCloudUnreachable =>
      'এখনো তাদের কাছে পৌঁছানো যায়নি। Action আবার চেষ্টা করবে।';

  @override
  String get privacyPendingTitle => 'এখনো মুছতে বাকি';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'গতবার $countটি ক্লাউড নথির কাছে পৌঁছানো যায়নি। Action নিজেই আবার চেষ্টা করবে, অথবা আপনি এখনই চেষ্টা করতে পারেন।',
      one: 'গতবার ১টি ক্লাউড নথির কাছে পৌঁছানো যায়নি। Action নিজেই আবার চেষ্টা করবে, অথবা আপনি এখনই চেষ্টা করতে পারেন।',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'আবার চেষ্টা করুন';

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

  @override
  String get detailSaveFailed =>
      'ওটি সেভ করা গেল না। কিছুই হারায়নি — আবার চেষ্টা করুন।';

  @override
  String get detailSectionCreatedFrom => 'যা থেকে তৈরি';

  @override
  String get detailSourceChecking => 'মূল ক্যাপচারটি আনা হচ্ছে…';

  @override
  String get detailSourceUnavailable => 'মূল ক্যাপচারটি আর পাওয়া যাচ্ছে না।';

  @override
  String get detailReopenAction => 'কাজটি আবার খুলুন';

  @override
  String get detailMarkActionComplete => 'কাজটি শেষ বলে চিহ্নিত করুন';

  @override
  String get detailGetHelp => 'এটি নিয়ে সাহায্য নিন';

  @override
  String get detailSectionHistory => 'ইতিহাস';

  @override
  String get detailHistoryShowLess => 'কম দেখুন';

  @override
  String detailHistoryShowAll(int count) {
    return 'সব $countটি দেখুন';
  }

  @override
  String get detailHistoryCreated => 'তৈরি হয়েছে';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ধাপ নিয়ে তৈরি হয়েছে',
      one: '১টি ধাপ নিয়ে তৈরি হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'আপনি বিবরণগুলো নিশ্চিত করেছেন';

  @override
  String detailHistoryStepFinished(String title) {
    return '“$title” শেষ করেছেন';
  }

  @override
  String get detailHistoryAStep => 'একটি ধাপ';

  @override
  String get detailHistoryReminderSet => 'আপনি মনে করিয়ে দিতে বলেছিলেন';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'আপনি $when-এর জন্য মনে করিয়ে দিতে বলেছিলেন';
  }

  @override
  String get detailHistoryCompleted => 'শেষ বলে চিহ্নিত';

  @override
  String get detailHistoryChanged => 'সর্বশেষ বদল';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'নিজের বেছে নেওয়া (OpenAI-সঙ্গতিপূর্ণ)';

  @override
  String get aiCapabilityText => 'লেখা';

  @override
  String get aiCapabilityImages => 'ছবি';

  @override
  String get aiCapabilityDocuments => 'নথিপত্র';

  @override
  String get aiCapabilityStructuredResults => 'কাঠামোবদ্ধ ফলাফল';

  @override
  String get aiCapabilityStreaming => 'স্ট্রিমিং';

  @override
  String get aiCapabilitySystemInstructions => 'সিস্টেম নির্দেশনা';

  @override
  String get aiCapabilityEvidenceCitations => 'প্রমাণের উদ্ধৃতি';

  @override
  String get aiCapabilityLongDocuments => 'দীর্ঘ নথি';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a বা $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head বা $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'এই সরঞ্জামটি ব্যবহার করতে একটি AI সরবরাহকারী যুক্ত করুন।';

  @override
  String get aiFailureInvalidKey => 'ওই API চাবিটি সরবরাহকারী গ্রহণ করেনি।';

  @override
  String get aiFailureQuotaExceeded =>
      'আপনার সরবরাহকারী অ্যাকাউন্টে ক্রেডিট ফুরিয়েছে, অথবা সেটি তার কোটায় পৌঁছে গেছে।';

  @override
  String get aiFailureRateLimited =>
      'আপনার সরবরাহকারী অনুরোধের হার সীমিত করছে। একটু পরে আবার চেষ্টা করুন।';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action আপনার AI সরবরাহকারীর কাছে পৌঁছাতে পারেনি। আপনার সংযোগ দেখে নিন।';

  @override
  String get aiFailureUnsupportedModel =>
      'ওই মডেলটি আপনার চাবির জন্য পাওয়া যাচ্ছে না। সেটিংসে অন্য একটি বেছে নিন।';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'আপনার বেছে নেওয়া মডেল $capabilities পড়তে পারে না। সেটিংসে অন্য একটি মডেল বেছে নিন।';
  }

  @override
  String get aiFailureContextTooLarge =>
      'ওটা এই মডেলের একবারে পড়ার পক্ষে অনেক বেশি বিষয়বস্তু ছিল।';

  @override
  String get aiFailureInputTooLargeText =>
      'একবারে যতটা লেখা বিশ্লেষণ করা যায়, এটি তার চেয়ে বেশি।';

  @override
  String get aiFailureProviderUnavailable =>
      'আপনার AI সরবরাহকারীর কোথাও সমস্যা হচ্ছে। একটু পরে আবার চেষ্টা করুন।';

  @override
  String get aiFailureMalformedResponse =>
      'ওই সরবরাহকারী এমন কিছু ফেরত পাঠিয়েছে যা Action পড়তে পারেনি।';

  @override
  String get aiFailureCancelled => 'থামানো হয়েছে।';

  @override
  String get aiFailureInsecureEndpoint =>
      'ওই endpoint-কে একটি https:// ঠিকানা হতে হবে।';

  @override
  String get aiFailureUnknown =>
      'আপনার AI সরবরাহকারীর সঙ্গে কথা বলার সময় কিছু একটা ভুল হয়েছে।';

  @override
  String get appLockTitle => 'Action লক করা আছে';

  @override
  String get appLockPrompt =>
      'চালিয়ে যেতে নিশ্চিত করুন যে এটি আপনিই। Action আপনার ডিভাইসকে জিজ্ঞেস করে — আপনার আঙুলের ছাপ, মুখ বা পিন সে কখনো দেখে না।';

  @override
  String get appLockUnlocking => 'আনলক করা হচ্ছে…';

  @override
  String get appLockNotConfirmed =>
      'ওটি নিশ্চিত হয়নি। প্রস্তুত হলে আবার চেষ্টা করুন।';

  @override
  String get appLockCannotConfirm =>
      'আপনার ডিভাইস এই মুহূর্তে নিশ্চিত করতে পারছে না যে এটি আপনিই। ডিভাইস সেটিংসে স্ক্রিন লক এখনও ঠিক করা আছে কি না দেখে নিন।';

  @override
  String get appLockWaiting => 'অপেক্ষা করা হচ্ছে…';

  @override
  String get appLockUnlock => 'আনলক করুন';

  @override
  String get appLockReasonUnlock => 'Action আনলক করুন';

  @override
  String get appLockReasonEnable =>
      'অ্যাপ লক চালু করার আগে নিশ্চিত করুন যে এটি আপনিই';

  @override
  String get appLockReasonDisable =>
      'অ্যাপ লক বন্ধ করার আগে নিশ্চিত করুন যে এটি আপনিই';

  @override
  String get todayCapabilityHeading => 'Action কী কী সামলায়';

  @override
  String get todayCapabilityDocumentTitle => 'একটি চিঠি বা বিল';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action সেটি পড়ে, আর সময়সীমা, পরিমাণ ও রেফারেন্স নম্বর খুঁজে বের করে।';

  @override
  String get todayCapabilityScreenshotTitle => 'একটি স্ক্রিনশট';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'যে বার্তাটি না হলে ভুলেই যেতেন, সেটিকে এমন কিছুতে বদলান যা নিয়ে আপনি কাজ করতে পারেন।';

  @override
  String get todayCapabilityTextTitle => 'কিছু লেখা';

  @override
  String get todayCapabilityTextBlurb =>
      'যা খুশি পেস্ট করুন। Action বুঝে নেয় সেটি কী, আর সেটি আপনার কাছে কী চায়।';

  @override
  String get todayCapabilityConfirmTitle => 'সবকিছু আপনি নিশ্চিত করেন';

  @override
  String get todayCapabilityConfirmBlurb =>
      'আপনি প্রমাণ দেখে হ্যাঁ না বলা পর্যন্ত কিছুই কাজ হয়ে ওঠে না।';

  @override
  String get todayCapabilityExploreIntelligence => 'ইন্টেলিজেন্স ঘুরে দেখুন';

  @override
  String get documentRejectedEmpty => 'ওই ফাইলটি খালি।';

  @override
  String documentRejectedTooLarge(String size) {
    return 'ওই নথিটি $size, যা Action যতটা নিয়ে কাজ করতে পারে তার চেয়ে বড়।';
  }

  @override
  String get documentRejectedNotAPdf =>
      'নাম যাই হোক, ওটি PDF নয়। Action PDF আর ছবি পড়ে।';

  @override
  String get documentRejectedUnreadable => 'ওই নথিটি পড়া গেল না।';

  @override
  String get pdfRejectedNotAPdf => 'নাম যাই হোক, ওই ফাইলটি PDF নয়।';

  @override
  String get pdfRejectedEncrypted =>
      'ওই PDF-টি পাসওয়ার্ড দিয়ে আটকানো, তাই Action সেটি পড়তে পারছে না।';

  @override
  String get pdfRejectedDamaged =>
      'ওই PDF-টি পড়া গেল না। সেটি অসম্পূর্ণ হতে পারে।';

  @override
  String get shareRejectedEmpty => 'ওই শেয়ারে পড়ার মতো কিছু ছিল না।';

  @override
  String get shareRejectedUnsupportedType =>
      'Action লেখা, ছবি আর PDF নিতে পারে। ওটি অন্য কিছু ছিল।';

  @override
  String get shareRejectedContentMismatch =>
      'ওই ফাইলটি নিজেকে যে ধরনের বলছে সেটি তা নয়, তাই Action সেটি খোলেনি।';

  @override
  String get shareRejectedTooLarge =>
      'Action-এর কাজ করার পক্ষে ওই ফাইলটি খুব বড়।';

  @override
  String get shareRejectedUnreadable => 'ওই ফাইলটি পড়া গেল না।';

  @override
  String get captureFailureRecognition => 'লেখা শনাক্তকরণ চালানো গেল না।';

  @override
  String get captureFailureImageFormat =>
      'ওই ছবির ফরম্যাট এই ডিভাইসে পড়া গেল না।';

  @override
  String get connectSheetTitle => 'আপনার AI যুক্ত করুন';

  @override
  String get connectSheetSubtitle =>
      'আপনি নিজের সরবরাহকারী অ্যাকাউন্ট ও API চাবি ব্যবহার করেন। Action চাবিটি এই ডিভাইসের নিরাপদ সংরক্ষণে রাখে।';

  @override
  String get connectErrorKeyMissing =>
      'চালিয়ে যেতে আপনার API চাবি পেস্ট করুন।';

  @override
  String get connectErrorModelMissing =>
      'একটি মডেল বেছে নিন, অথবা একটি মডেল আইডি টাইপ করুন।';

  @override
  String get connectErrorEndpointMissing =>
      'আপনার endpoint-এর ঠিকানা যোগ করুন।';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'এই ডিভাইসের নিরাপদ সংরক্ষণ খোলা গেল না, তাই চাবিটি সেভ হয়নি।';

  @override
  String get connectTestSucceeded => 'যুক্ত হয়েছে।';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'যুক্ত হয়েছে। $countটি মডেল পাওয়া যাচ্ছে।';
  }

  @override
  String get connectProviderLabel => 'সরবরাহকারী';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'একটি https:// ঠিকানা হতে হবে। Action আপনার নথি এনক্রিপ্ট করা নয় এমন সংযোগের উপর দিয়ে পাঠাবে না।';

  @override
  String get connectApiKeyLabel => 'API চাবি';

  @override
  String get connectApiKeyHint => 'আপনার চাবি পেস্ট করুন';

  @override
  String get connectKeyPrivacyNote =>
      'আপনার চাবি এই ডিভাইসেই থাকে। আপনার বেছে নেওয়া সরবরাহকারী ছাড়া Action সেটি আর কোথাও পাঠায় না, আর সেভ করার পর সেটি আপনাকে আর দেখাতেও পারে না।';

  @override
  String get connectModelLabel => 'মডেল';

  @override
  String get connectModelIdHint => 'মডেল আইডি';

  @override
  String get connectModelFreeTextNote =>
      'সরবরাহকারীরা পুরোনো মডেল আইডি তুলে নেয় আর নতুন যোগ করে। আপনি যেটি চান সেটি তালিকায় না থাকলে এখানে টাইপ করুন।';

  @override
  String get connectAndTest => 'যুক্ত করে পরখ করুন';

  @override
  String get connectSaveWithoutTesting => 'পরখ না করেই সেভ করুন';

  @override
  String get toolWarningFactsNotChecked =>
      'Action এটিকে মূল লেখার সঙ্গে মিলিয়ে দেখতে পারেনি, তাই এর ভেতরের পরিমাণ ও তারিখগুলো মিলিয়ে দেখা হয়নি।';

  @override
  String get toolTitleRewrite => 'এই লেখাটি উন্নত করুন';

  @override
  String get toolDescriptionRewrite =>
      'আরও স্পষ্ট, আরও ছোট বা আরও আনুষ্ঠানিক — তথ্য অক্ষত রেখে।';

  @override
  String get toolModeRewriteClearer => 'আরও স্পষ্ট';

  @override
  String get toolModeRewriteProfessional => 'আরও পেশাদার';

  @override
  String get toolModeRewriteShorter => 'আরও ছোট';

  @override
  String get toolModeRewritePersuasive => 'আরও জোরালো';

  @override
  String get toolModeRewriteSimpler => 'আরও সহজ';

  @override
  String get toolModeRewriteStructured => 'আরও গোছানো';

  @override
  String get toolModeRewriteGrammarOnly => 'শুধু ব্যাকরণ';

  @override
  String get toolSectionWhatChanged => 'কী কী বদলেছে';

  @override
  String get toolSectionNote => 'নোট';

  @override
  String get toolSectionAlreadyClearBody =>
      'এটি আগে থেকেই স্পষ্ট ছিল। নিচের বদলগুলো সামান্য।';

  @override
  String get toolSectionImprovedText => 'উন্নত করা লেখা';

  @override
  String get toolTitleDraftReply => 'উত্তরের খসড়া লিখুন';

  @override
  String get toolDescriptionDraftReply =>
      'এমন একটি উত্তর, যা আপনি নিজে বদলে নিয়ে নিজেই পাঠাবেন।';

  @override
  String get toolModeReplyProfessional => 'পেশাদার';

  @override
  String get toolModeReplyConcise => 'সংক্ষিপ্ত';

  @override
  String get toolModeReplyFriendly => 'বন্ধুত্বপূর্ণ';

  @override
  String get toolModeReplyFormal => 'আনুষ্ঠানিক';

  @override
  String get toolModeReplyClarification => 'স্পষ্ট করতে বলুন';

  @override
  String get toolModeReplyConfirmation => 'প্রাপ্তি জানান';

  @override
  String get toolModeReplyDispute => 'এর সঙ্গে দ্বিমত জানান';

  @override
  String get toolSectionSubject => 'বিষয়';

  @override
  String get toolSectionDraftReply => 'উত্তরের খসড়া';

  @override
  String get toolSectionPlaceholders => 'এগুলো আপনাকে পূরণ করতে হবে';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'খসড়া — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'এটি একটি খসড়া। Action কিছুই পাঠায় না — পড়ুন, বদলান, আর নিজেই পাঠান।';

  @override
  String get toolTitleTranslate => 'অনুবাদ করুন';

  @override
  String get toolDescriptionTranslate =>
      'অন্য একটি ভাষা, আর অঙ্ক ও নামগুলো অক্ষত রেখে।';

  @override
  String get toolSectionTranslation => 'অনুবাদ';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '$from থেকে $to ভাষায়';
  }

  @override
  String get toolSectionKeptInOriginal => 'মূলে যেমন ছিল তেমনই রাখা হয়েছে';

  @override
  String get toolWarningTranslationNotCertified =>
      'বোঝার জন্য একটি অনুবাদ, সত্যায়িত অনুবাদ নয়।';

  @override
  String get toolTitleStructuredData => 'একটি সারণি বের করুন';

  @override
  String get toolDescriptionStructuredData =>
      'সারি, ঘর আর অঙ্ক — যা আপনি কপি করে নিতে পারেন।';

  @override
  String get toolSectionTable => 'সারণি';

  @override
  String get toolSectionFields => 'ঘর';

  @override
  String get toolSectionTableCsv => 'সারণি (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'এই সারণির কলাম বিন্যাস নির্ভরযোগ্যভাবে পড়া যায়নি। ব্যবহার করার আগে সারিগুলো ঠিকমতো মিলছে কি না দেখে নিন।';

  @override
  String get toolTitleDeadlineFinder => 'সময়সীমা খুঁজুন';

  @override
  String get toolDescriptionDeadlineFinder =>
      'কী বাকি আছে, কখন, আর না করলে কী হয়।';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি সময়সীমা',
      one: '১টি সময়সীমা',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'কিছুরই সময় হয়নি';

  @override
  String get toolSectionNothingDueBody =>
      'এই উপকরণে Action কোনো সময়সীমা বা দায় পায়নি।';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'আপনি না বাছা পর্যন্ত কিছুই নির্ধারিত হয় না। মনে করিয়ে দেওয়া কখনোই আপনাআপনি সেট হয় না।';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'না করলে: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'আপনার লাগবে: $items';
  }

  @override
  String get moneyErrorEmpty => 'কোনো পরিমাণ দেওয়া হয়নি';

  @override
  String get moneyErrorMalformed => 'পরিমাণটি সাধারণ সংখ্যা নয়';

  @override
  String get moneyErrorNegative => 'ঋণাত্মক পরিমাণ প্রদেয় অঙ্ক নয়';

  @override
  String get moneyErrorTooManyDecimals =>
      'মুদ্রাটিতে যতগুলো দশমিক ঘর আছে তার চেয়ে বেশি';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'মুদ্রার কোডটি আমাদের চেনা কোনোটি নয়';

  @override
  String get moneyErrorOutOfRange => 'পরিমাণটি অবিশ্বাস্য রকম বড়';

  @override
  String get escalationOcrFailed => 'এই ক্যাপচারে শনাক্তকরণ আদৌ চালানো যায়নি।';

  @override
  String get escalationNoTextRecognised =>
      'এটি দেখতে নথির মতো, কিন্তু কোনো লেখা শনাক্ত হয়নি।';

  @override
  String get escalationThinText =>
      'এত বড় একটি নথির তুলনায় খুবই সামান্য লেখা শনাক্ত হয়েছে।';

  @override
  String get escalationLowLineConfidence =>
      'শনাক্তকারী কয়েকটি লাইনে নিজের কম আস্থার কথা জানিয়েছে।';

  @override
  String get escalationTableLikeLayout =>
      'বিন্যাসটি দেখতে সারণির মতো, আর লাইন ধরে ধরে পড়লে কোন মান কোন সারির তা হারিয়ে যায়।';

  @override
  String get escalationFragmentedLayout =>
      'লেখাটি অনেক ছোট ছোট টুকরো হয়ে ফিরেছে, তাই এর কাঠামো স্পষ্ট নয়।';

  @override
  String get escalationMalformedText =>
      'শনাক্ত হওয়া লেখার অনেকটাই পড়ার মতো শব্দ বা সংখ্যা নয়।';

  @override
  String get escalationConflictingDates =>
      'একের বেশি তারিখকে সময়সীমা হিসেবে দেখানো হয়েছে।';

  @override
  String get escalationConflictingAmounts =>
      'একের বেশি পরিমাণকে প্রদেয় অঙ্ক হিসেবে দেখানো হয়েছে।';

  @override
  String get escalationUnresolvedGrounding =>
      'কিছু মান নথির লেখার সঙ্গে মিলিয়ে দেখা গেল না।';

  @override
  String get escalationInstructionLikeContent =>
      'নথিটিতে এমন লেখা আছে যা অ্যাপের প্রতি নির্দেশের মতো করে লেখা। সেটি নথির বিষয়বস্তু হিসেবেই ধরা হয়, কখনোই নির্দেশ হিসেবে নয়।';

  @override
  String get providerFailureNetwork =>
      'Action সেবাটির কাছে পৌঁছাতে পারেনি। আপনার সংযোগ দেখে নিন।';

  @override
  String get providerFailureTimedOut =>
      'সেবাটি উত্তর দিতে অনেক বেশি সময় নিয়েছে।';

  @override
  String get providerFailureServiceUnavailable =>
      'সেবাটি সাময়িকভাবে পাওয়া যাচ্ছে না। পরে আবার চেষ্টা করুন।';

  @override
  String get providerFailureUnauthorized =>
      'এই অ্যাপ এই মুহূর্তে সেবাটি ব্যবহারের অনুমতি পাচ্ছে না।';

  @override
  String get providerFailureBlocked =>
      'সেবাটি এই নথিটি প্রক্রিয়া করতে রাজি হয়নি।';

  @override
  String get providerFailureUnknown =>
      'Action এই নথিটি পড়তে পারেনি। আবার চেষ্টা করলে কাজ হতে পারে।';

  @override
  String get reviewBlockerTitle => 'এই কাজটির একটি শিরোনাম দিন।';

  @override
  String get reviewBlockerDate =>
      'কোন তারিখটি আসল সময়সীমা তা বেছে নিন, অথবা ফাঁকা রাখুন।';

  @override
  String get reviewBlockerAmount =>
      'কোন পরিমাণটি ঠিক তা বেছে নিন, অথবা ফাঁকা রাখুন।';

  @override
  String get reviewBlockerStepTitle =>
      'আপনি যে ধাপগুলো রাখছেন তাদের শিরোনাম দরকার।';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'পৃষ্ঠা $page',
      one: 'পৃষ্ঠা ১',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'পৃষ্ঠা $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'নতুন লেখাটিতে আর $values নেই। ব্যবহারের আগে এটি দেখে নিন।',
      one: 'নতুন লেখাটিতে আর $values নেই। ব্যবহারের আগে এটি দেখে নিন।',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'নতুন লেখাটিতে আর $values এবং আরও $countটি নেই। ব্যবহারের আগে এটি দেখে নিন।',
      one:
          'নতুন লেখাটিতে আর $values এবং আরও ১টি নেই। ব্যবহারের আগে এটি দেখে নিন।',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'পৌঁছেছে';

  @override
  String get goalNewSheetTitle => 'আপনি কী ঘটাতে চান?';

  @override
  String get goalNewSheetSubtitle =>
      'একটি বাক্যই যথেষ্ট। বিবরণ পরে যোগ করতে পারবেন।';

  @override
  String get goalTitleHint => 'বেশি টাকা না দিয়ে গাড়ির বিমা নবায়ন করা।';

  @override
  String get goalCreateAction => 'লক্ষ্য তৈরি করুন';

  @override
  String get goalTitleSheetTitle => 'আপনি যা চান';

  @override
  String get goalOutcomeSheetTitle => 'শেষ হলে কেমন দেখাবে';

  @override
  String get goalContextSheetTitle => 'কোথায় দাঁড়িয়ে আছে';

  @override
  String get goalOutcomeHint =>
      'গাড়ির বিমা হয়ে গেছে আর কাগজপত্র জমা দেওয়া হয়ে গেছে।';

  @override
  String get goalContextHint => 'আমার কাছে দুটি দর আছে আর নবায়ন ১৮ তারিখে।';

  @override
  String get goalWorkspaceTitle => 'লক্ষ্য';

  @override
  String get goalUnmarkReached => 'আসলে পৌঁছায়নি — চিহ্নটি তুলে নিন';

  @override
  String get goalMarkReached => 'পৌঁছেছে বলে চিহ্নিত করুন';

  @override
  String get goalNotFound => 'সেই লক্ষ্যটি আর এখানে নেই।';

  @override
  String get goalDeleteTitle => 'এই লক্ষ্যটি মুছে ফেলবেন?';

  @override
  String get goalDeleteBody =>
      'লক্ষ্যটি এই ডিভাইস থেকে মুছে যায়। সেটি থেকে তৈরি যেকোনো কাজ ঠিক যেমন আছে তেমনই থাকে।';

  @override
  String get goalOutcomeLabel => 'শেষ হলে কেমন দেখাবে';

  @override
  String get goalOutcomeEmpty =>
      'এখনও লেখা হয়নি। শেষ হওয়া মানে কী, সেটি বলে রাখলে লক্ষ্যটির পরিকল্পনা করা সহজ হয়।';

  @override
  String get goalContextLabel => 'কোথায় দাঁড়িয়ে আছে';

  @override
  String get goalContextEmpty =>
      'এখনও কিছু লেখা হয়নি। এ পর্যন্ত কী হয়েছে, আর কী বাধা হয়ে আছে।';

  @override
  String get goalTitleLabel => 'আপনি যা চান';

  @override
  String get goalEditTooltip => 'লক্ষ্য সম্পাদনা করুন';

  @override
  String get goalToolsLabel => 'Action কী কী করতে পারে';

  @override
  String get goalToolsNotReady =>
      'আপনি কী চান সে সম্পর্কে আর একটু লিখুন, তাহলে এই সরঞ্জামগুলো কাজ করার মতো কিছু পাবে।';

  @override
  String get toolGoalOptimizerTitle => 'লক্ষ্য উন্নত করুন';

  @override
  String get toolActionPlanTitle => 'পরিকল্পনা সাজান';

  @override
  String get resultFactUnconfirmed => 'নিশ্চিত করা হয়নি';

  @override
  String get resultSuggestedSteps => 'প্রস্তাবিত ধাপ';

  @override
  String get resultSuggestedAction => 'প্রস্তাবিত কাজ';

  @override
  String get resultWorthAsking => 'জিজ্ঞেস করে নেওয়ার মতো';

  @override
  String get resultSuggestedDeadlines => 'প্রস্তাবিত সময়সীমা';

  @override
  String get resultSuggestions => 'প্রস্তাব';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি সমর্থনকারী উদ্ধৃতি',
      one: '১টি সমর্থনকারী উদ্ধৃতি',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'বেছে নেওয়া উৎস থেকে';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source-এর $page';
  }

  @override
  String get toolRunStagePreparing => 'আপনার নথিটি প্রস্তুত করা হচ্ছে';

  @override
  String get toolRunStageReading => 'বেছে নেওয়া পৃষ্ঠাগুলো পড়া হচ্ছে';

  @override
  String get toolRunStageAnalysing => 'বিশ্লেষণ চলছে';

  @override
  String get toolRunStageBuilding => 'আপনার পর্যালোচনা সাজানো হচ্ছে';

  @override
  String get toolRunStageDone => 'সম্পন্ন';

  @override
  String get toolRunStageFailed => 'ওটি শেষ হয়নি';

  @override
  String get toolRunStageCancelled => 'আপনি থামিয়েছেন';

  @override
  String get toolRunFailureLocalCheckFailed => 'ওটি যাচাই করা গেল না।';

  @override
  String get toolRunFailureProviderRetired =>
      'এই সংস্করণে ওই AI সরবরাহকারীটি আর নেই।';

  @override
  String get toolRunFailureUnusableReply =>
      'ওই উত্তরটি কাজে লাগানোর মতো রূপে ফেরেনি। আবার চেষ্টা করুন।';

  @override
  String get toolRunFailureQuestionRequired => 'আগে একটি প্রশ্ন লিখুন।';

  @override
  String get toolRunFailureInputRequired =>
      'এই সরঞ্জামটি কী নিয়ে কাজ করবে তা বেছে নিন।';

  @override
  String get toolWarningReplyTruncated =>
      'এই উত্তরটি মাঝপথে কেটে গেছে, তাই এখানে যা আছে তা অসম্পূর্ণ হতে পারে।';

  @override
  String get toolWarningNoSupportingQuotes =>
      'আপনার মডেল কোনো সমর্থনকারী উদ্ধৃতি ফেরত দেয়নি, তাই এখানে কিছুরই সপক্ষে উদ্ধৃতি নেই। এটি নিয়ে কিছু করার আগে নথির সঙ্গে মিলিয়ে নিন।';

  @override
  String get aiSettingsRemoveTitle => 'এই সংযোগটি সরাবেন?';

  @override
  String get aiSettingsRemoveBody =>
      'Action এই ডিভাইস থেকে আপনার API চাবি মুছে দেবে এবং AI সুবিধাগুলো ব্যবহার করা বন্ধ করবে। আপনার সরবরাহকারী অ্যাকাউন্টে এর কোনো প্রভাব পড়ে না।';

  @override
  String get aiSettingsProviderLabel => 'সরবরাহকারী';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'আপনি যতটুকু ব্যবহার করেন তার বিল আপনার সরবরাহকারী আপনার কাছ থেকে নেয়। Action নিজে থেকে কখনো কোনো অনুরোধ পাঠায় না।';

  @override
  String get aiSettingsConnectLabel => 'একটি AI সরবরাহকারী যুক্ত করুন';

  @override
  String get aiSettingsConnectDescription =>
      'OpenAI, Anthropic, Google Gemini, বা সঙ্গতিপূর্ণ কোনো endpoint-এর সঙ্গে আপনার নিজের অ্যাকাউন্ট ও API চাবি ব্যবহার করুন।';

  @override
  String get aiSettingsModelLabel => 'মডেল';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API চাবি';

  @override
  String get aiSettingsKeyStored => 'এই ডিভাইসের নিরাপদ সংরক্ষণে রাখা হয়েছে।';

  @override
  String get aiSettingsKeyMissing =>
      'এই ডিভাইসে কোনো চাবি পাওয়া যায়নি। একটি যোগ করতে আবার যুক্ত করুন।';

  @override
  String get aiSettingsTestLabel => 'সংযোগ পরখ করুন';

  @override
  String get aiSettingsProviderUnavailable =>
      'এই সংস্করণে ওই সরবরাহকারীটি পাওয়া যায় না।';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'যুক্ত হয়েছে। $countটি মডেল পাওয়া যাচ্ছে।';
  }

  @override
  String get aiSettingsTestButton => 'পরখ করুন';

  @override
  String get aiSettingsChangeProvider => 'সরবরাহকারী বা মডেল বদলান';

  @override
  String get aiSettingsRemoveKey => 'চাবি সরান';

  @override
  String get aiSettingsSectionPrivacy => 'গোপনীয়তা';

  @override
  String get aiSettingsWhatGetsSentLabel => 'কী পাঠানো হয়';

  @override
  String get aiSettingsWhereItGoesLabel => 'কোথায় যায়';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'আপনি কোনো সরবরাহকারী যুক্ত না করা পর্যন্ত কিছুই পাঠানো হয় না।';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'সরাসরি $provider-এর কাছে, আপনার চাবি দিয়ে। এটি Action-এর সার্ভারের ভেতর দিয়ে যায় না।';
  }

  @override
  String get aiSettingsSectionData => 'ডেটা';

  @override
  String get aiSettingsDataFootnote =>
      'আপনি কোন কোন সরঞ্জাম ব্যবহার করেছেন Action তা মনে রাখে, কিন্তু সেগুলো কীসের উপর ব্যবহার করেছেন তা কখনোই নয়।';

  @override
  String get aiSettingsRecentToolsLabel => 'সম্প্রতি ব্যবহৃত সরঞ্জাম';

  @override
  String get aiSettingsRecentToolsNone => 'কিছুই নেই';

  @override
  String get reminderNotificationTitle => 'Action রিমাইন্ডার';

  @override
  String get reminderNotificationPrivateBody =>
      'আপনার দেখার মতো কিছু একটা আছে।';

  @override
  String get reminderChannelName => 'Action-এর রিমাইন্ডার';

  @override
  String get reminderChannelDescription =>
      'আপনার কাজের জন্য আপনি নিজে যেসব মনে করিয়ে দেওয়া সেট করেন।';

  @override
  String get onboardingStart => 'Action ব্যবহার শুরু করুন';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'ধাপ $current, মোট $totalটির মধ্যে';
  }

  @override
  String get onboardingCaptureTitle => 'তথ্যকে কাজে বদলে নিন';

  @override
  String get onboardingCaptureBody =>
      'একটি স্ক্রিনশট, একটি ছবি, বা আপনাকে পাঠানো কোনো লেখা যোগ করুন। Action সেটি পড়ে, আর বুঝে নেয় সেটি আপনাকে কী করতে বলছে।';

  @override
  String get onboardingReviewTitle =>
      'আপনি নিশ্চিত না করা পর্যন্ত কিছুই সেভ হয় না';

  @override
  String get onboardingReviewBody =>
      'Action দেখায় সে কী পেয়েছে আর কোন শব্দ থেকে পেয়েছে। ভুল কিছু থাকলে আপনি সেটি ঠিক করেন। আপনি নিশ্চিত না করা পর্যন্ত এটি একটি প্রস্তাব — কোনো তথ্য নয়, আর কোনো কাজও নয়।';

  @override
  String get onboardingTrackingTitle => 'যা জরুরি তার উপর নজর রাখুন';

  @override
  String get onboardingTrackingBody =>
      '“মনোযোগ দরকার” যা দেরি হয়ে গেছে বা কাছে এসে গেছে তা সামনে এনে দেয়। প্রতিটি কাজ তার পরের ধাপ, তার অগ্রগতি আর আপনার সেট করা যেকোনো মনে করিয়ে দেওয়া ধরে রাখে।';

  @override
  String get onboardingPrivacyBody => 'শুরু করার আগে জেনে রাখা ভালো:';

  @override
  String get onboardingPrivacyOnDevice =>
      'আপনার কাজ, ক্যাপচার, মনে করিয়ে দেওয়া আর খোঁজ এই ডিভাইসে রাখা হয়। খোঁজ আর মনে করিয়ে দেওয়া সংযোগ ছাড়াই কাজ করে।';

  @override
  String get onboardingPrivacySentToRead =>
      'আপনি যখন Action-কে কিছু পড়তে বলেন, সেই বিষয়বস্তু যে AI সেবা তা ব্যাখ্যা করে তার কাছে পাঠানো হয়।';

  @override
  String get onboardingPrivacyCloud =>
      'নিশ্চিত করা কোনো কাজের একটি সংক্ষিপ্ত নথি — তার শিরোনাম, তারিখ, পরিমাণ ও প্রস্তাবিত ধাপ — এই ডিভাইসের একটি বেনামি পরিচয়ে ক্লাউডে রাখা হতে পারে। আপনার ক্যাপচার, ধাপ ও মনে করিয়ে দেওয়া রাখা হয় না।';

  @override
  String get onboardingPrivacyNotBackup =>
      'সেই নথি কোনো ব্যাকআপ নয়। এটি নতুন কোনো ডিভাইসে কিছুই ফিরিয়ে আনতে পারে না।';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি বাধা',
      one: '১টি বাধা',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'আরও সহজ হতে পারত';

  @override
  String get toolDescriptionGoalOptimizer =>
      'কী নেই, কী বাধা দিচ্ছে, আর আগে কী করতে হবে।';

  @override
  String toolSectionStepDependsOn(String step) {
    return '$step-এর পরে';
  }

  @override
  String get toolSectionThePlan => 'পরিকল্পনাটি';

  @override
  String get toolDescriptionActionPlan =>
      'ধারাবাহিক কয়েকটি ধাপ, যেগুলো আপনি কাজে বদলে নিতে পারেন।';

  @override
  String get toolTitleSmartChecklist => 'একটি চেকলিস্ট বানান';

  @override
  String get toolDescriptionSmartChecklist =>
      'এটি আপনার কাছে যা যা চায়, ক্রম অনুসারে।';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি বিবরণ পাওয়া যায়নি',
      one: '১টি বিবরণ পাওয়া যায়নি',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'এগুলো পরস্পরের সঙ্গে সাংঘর্ষিক';

  @override
  String get toolTitleMissingInformation => 'যা অনুপস্থিত';

  @override
  String get toolDescriptionMissingInformation =>
      'কোথায় ফাঁক আছে, আর সেগুলো নিয়ে কী জিজ্ঞেস করতে হবে।';

  @override
  String get aiAdapterTimedOut =>
      'ওটি অনেক বেশি সময় নিচ্ছিল, তাই সেটি থামিয়ে দেওয়া হয়েছে।';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'আপনার AI সরবরাহকারীর সঙ্গে নিরাপদ সংযোগটি ব্যর্থ হয়েছে।';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action ওই মডেল বা endpoint খুঁজে পায়নি।';

  @override
  String get aiAdapterRequestRejected =>
      'আপনার AI সরবরাহকারী ওই অনুরোধটি প্রত্যাখ্যান করেছে।';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action এই ডিভাইসের নিরাপদ সংরক্ষণ খুলতে পারেনি।';

  @override
  String get aiAdapterEndpointMissing =>
      'সেটিংসে আপনার AI endpoint-এর ঠিকানা যোগ করুন।';

  @override
  String get aiAdapterReplyIncomplete =>
      'ওই উত্তরটি অসম্পূর্ণ ছিল। আবার চেষ্টা করুন।';

  @override
  String get aiAdapterContentDeclined =>
      'ওই বিষয়বস্তু প্রক্রিয়া করতে আপনার সরবরাহকারী রাজি হয়নি।';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'একবারে এটি $limitটির বেশি ফাইল। কম বেছে নিন।';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'ওগুলোর মধ্যে একটি ছবি বিশ্লেষণ করার পক্ষে খুব বড়।';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '“$filename” বিশ্লেষণ করার পক্ষে খুব বড়। সীমা $limit MB।';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '“$filename”-এ $countটি পৃষ্ঠা আছে। Action একবারে $limitটি পর্যন্ত পড়ে — একটি পরিসর বেছে নিন।';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'একটি অনুরোধে পাঠানোর পক্ষে ওই নির্বাচনটি খুব বড়।';

  @override
  String get toolRunNotAvailableTitle => 'ওই সরঞ্জামটি পাওয়া যাচ্ছে না';

  @override
  String get toolRunNotAvailableMessage =>
      'Action-এর কোনো নতুন সংস্করণে হয়তো এটি সরিয়ে ফেলা হয়েছে।';

  @override
  String get toolRunNoSourcesYet =>
      'কাজ করার মতো এখনও কিছু নেই। কিছু ক্যাপচার করুন, অথবা নিচে কিছু লেখা পেস্ট করুন।';

  @override
  String get toolRunChooseSourcesToCompare => 'কী কী তুলনা করবেন বেছে নিন';

  @override
  String get toolRunChooseSource => 'একটি উৎস বেছে নিন';

  @override
  String get toolRunQuestionLabel => 'আপনার প্রশ্ন';

  @override
  String get toolRunQuestionHint => 'সময়সীমা কবে?';

  @override
  String get toolRunFreeTextLabel => 'অথবা কিছু লেখা পেস্ট করুন';

  @override
  String get toolRunFreeTextHint => 'এখানে পেস্ট করুন বা টাইপ করুন';

  @override
  String get toolRunModeLabel => 'ধরন';

  @override
  String get toolRunRunLocally => 'এই ডিভাইসেই যাচাই করুন';

  @override
  String get toolRunRun => 'চালান';

  @override
  String get toolRunStop => 'থামান';

  @override
  String get toolRunRunAgain => 'আবার চালান';

  @override
  String get toolRunWorkingOn => 'যা নিয়ে কাজ হচ্ছে:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'এটি $provider-কে পাঠাবেন?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'আপনি যে বিষয়বস্তু বেছে নিয়েছেন তা আপনার API চাবি ব্যবহার করে প্রক্রিয়া করার জন্য $provider-এর কাছে পাঠানো হবে।';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'আপনার চাবি এই ডিভাইসেই থাকে। Action পেছনে কিছু পাঠায় না, আর আপনার অন্য কাজ বা উৎসও পাঠায় না।';

  @override
  String get toolRunScopeTitle => 'চালানোর আগে';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'আপনার $provider সংযোগ ব্যবহার করে $countটি পৃষ্ঠা বিশ্লেষণ করা হবে।',
      one: 'আপনার $provider সংযোগ ব্যবহার করে ১টি পৃষ্ঠা বিশ্লেষণ করা হবে।',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'আপনার $provider সংযোগ ব্যবহার করে $countটি ফাইল বিশ্লেষণ করা হবে।',
      one: 'আপনার $provider সংযোগ ব্যবহার করে ১টি ফাইল বিশ্লেষণ করা হবে।',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'আপনি যে লেখাটি বেছে নিয়েছেন তা আপনার $provider সংযোগে পাঠানো হবে।';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'এই সরঞ্জামটি ব্যবহার করতে একটি AI সরবরাহকারী যুক্ত করুন';

  @override
  String get toolRunNeedsProviderBody =>
      'আপনি নিজের সরবরাহকারী অ্যাকাউন্ট ও API চাবি ব্যবহার করেন।';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ধাপ থেকে কাজ তৈরি হয়েছে।',
      one: '১টি ধাপ থেকে কাজ তৈরি হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ধাপ যোগ হয়েছে।',
      one: '১টি ধাপ যোগ হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'একটি কাজ তৈরি করুন · $countটি ধাপ',
      one: 'একটি কাজ তৈরি করুন · ১টি ধাপ',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'এই কাজে যোগ করুন · $countটি ধাপ',
      one: 'এই কাজে যোগ করুন · ১টি ধাপ',
    );
    return '$_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'ছবি';

  @override
  String get sourceTypeLabelScreenshot => 'স্ক্রিনশট';

  @override
  String get sourceTypeLabelPastedText => 'পেস্ট করা নোট';

  @override
  String get sourceTypeLabelDocument => 'নথি';

  @override
  String get toolModeClearer => 'আরও স্পষ্ট';

  @override
  String get toolModeMoreProfessional => 'আরও পেশাদার';

  @override
  String get toolModeShorter => 'আরও ছোট';

  @override
  String get toolModeSimpler => 'আরও সহজ';

  @override
  String get toolModeMoreStructured => 'আরও গোছানো';

  @override
  String get toolModeMorePersuasive => 'আরও জোরালো';

  @override
  String get toolModeGrammarOnly => 'শুধু ব্যাকরণ';

  @override
  String get toolModeProfessional => 'পেশাদার';

  @override
  String get toolModeConcise => 'সংক্ষিপ্ত';

  @override
  String get toolModeFriendly => 'বন্ধুত্বপূর্ণ';

  @override
  String get toolModeFormal => 'আনুষ্ঠানিক';

  @override
  String get toolModeAskForClarification => 'স্পষ্ট করতে বলুন';

  @override
  String get toolModeConfirm => 'প্রাপ্তি জানান';

  @override
  String get toolModeDispute => 'এর সঙ্গে দ্বিমত জানান';

  @override
  String get toolModeQuick => 'এক নজরে';

  @override
  String get toolModeDetailed => 'বিস্তারিত';

  @override
  String get toolModeExecutive => 'সিদ্ধান্তের জন্য';

  @override
  String get toolModeKeyPoints => 'মূল কথাগুলো';

  @override
  String get toolModeActionFocused => 'করণীয়কেন্দ্রিক';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'উদ্ধৃত $countটি তথ্য আপনি যা বেছে নিয়েছেন তার মধ্যে পাওয়া যায়নি, তাই সেগুলোকে অনিশ্চিত হিসেবে চিহ্নিত করা হয়েছে।',
      one: 'উদ্ধৃত একটি তথ্য আপনি যা বেছে নিয়েছেন তার মধ্যে পাওয়া যায়নি, তাই সেটিকে অনিশ্চিত হিসেবে চিহ্নিত করা হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action এই উদ্ধৃতিগুলো ফাইলটির সঙ্গেই মিলিয়ে দেখতে পারেনি, তাই সেগুলো মিলিয়ে দেখা হয়নি।';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'সময় পেরিয়েছে · $count দিন',
      one: 'সময় পেরিয়েছে · ১ দিন',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'আগামীকালের মধ্যে';

  @override
  String get triageBadgeReminderSoon => 'রিমাইন্ডার শিগগিরই';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'সময়সীমা $count দিন পেরিয়ে গেছে',
      one: 'সময়সীমা এক দিন পেরিয়ে গেছে',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status। $title';
  }

  @override
  String get triageExplanationDone => 'এটি শেষ হয়েছে।';

  @override
  String get triageExplanationNothingPressing =>
      'এটি এখানে আছে কারণ এখনও এর তাড়ার মতো কিছু নেই।';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'এদিকে নজর দেওয়া দরকার, কারণ $reason।';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'এটি তালিকায় আরও নিচে আছে, কারণ $reason।';
  }

  @override
  String get triageReasonOverdue => 'এর সময় পেরিয়ে গেছে';

  @override
  String get triageReasonDeadlinePassed =>
      'এর নির্ধারিত সময়সীমা পার হয়ে গেছে';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'এর সময় $count দিন পেরিয়ে গেছে',
      one: 'এর সময় এক দিন পেরিয়ে গেছে',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'এটি আজকের মধ্যে করতে হবে';

  @override
  String get triageReasonCriticalDueSoon =>
      'আপনি এটিকে অতি জরুরি চিহ্নিত করেছেন আর এর সময়সীমা কাছে এসে গেছে';

  @override
  String get triageReasonAllStepsDone => 'সব ধাপ শেষ — কেবল কাজটি শেষ করা বাকি';

  @override
  String get triageReasonDueTomorrow => 'এটি আগামীকালের মধ্যে করতে হবে';

  @override
  String get triageReasonReminderSoon =>
      'আপনি এর জন্য আগামী এক দিনের মধ্যে একটি রিমাইন্ডার সেট করে রেখেছেন';

  @override
  String get triageReasonDueWithinThreeDays => 'এটি তিন দিনের মধ্যে করতে হবে';

  @override
  String get triageReasonCriticalNoDeadline =>
      'আপনি এটিকে অতি জরুরি চিহ্নিত করেছেন, আর এর কোনো সময়সীমা নেই';

  @override
  String get triageReasonDueWithinSevenDays => 'এটি এক সপ্তাহের মধ্যে করতে হবে';

  @override
  String get triageReasonImportant => 'আপনি এটিকে গুরুত্বপূর্ণ চিহ্নিত করেছেন';

  @override
  String get triageReasonDueLater => 'এর সময়সীমা আরও দূরে';

  @override
  String get triageReasonNoDeadline =>
      'এর কোনো সময়সীমা নেই আর তাড়ার মতো কিছু নেই';

  @override
  String cardCompletedTooltip(String title) {
    return 'শেষ হয়েছে: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'এই নথিটি বুঝে নিন';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'এটি কী, কী গুরুত্বপূর্ণ, আর এ নিয়ে কী করতে হবে।';

  @override
  String get toolSectionWhatThisIs => 'এটি কী';

  @override
  String get toolSectionWhatMatters => 'আপনার জন্য যা গুরুত্বপূর্ণ';

  @override
  String get toolSectionKeyDetails => 'মূল বিবরণ';

  @override
  String get toolTitleAskDocument => 'উৎস সম্পর্কে জিজ্ঞেস করুন';

  @override
  String get toolDescriptionAskDocument =>
      'উত্তর আসে আপনি যা বেছে নিয়েছেন তার ভেতর থেকেই — নয়তো কিছুই নয়।';

  @override
  String get toolSectionNoAnswer => 'এই উপকরণে কোনো উত্তর মেলেনি';

  @override
  String get toolSectionNoAnswerBody =>
      'Action আপনার বেছে নেওয়া নথিতে সেটি খুঁজে পায়নি।';

  @override
  String get toolSectionAnswer => 'উত্তর';

  @override
  String get toolSectionFromTheDocument => 'নথি থেকে';

  @override
  String get toolWarningQuoteNotFound =>
      'এই উত্তরের পেছনের উদ্ধৃতিটি বেছে নেওয়া উপকরণে নেই। উত্তরটিকে অনির্ভরযোগ্য ধরে নিন।';

  @override
  String get toolTitleSmartSummary => 'সংক্ষেপ করুন';

  @override
  String get toolDescriptionSmartSummary =>
      'ছোট সংস্করণ — কিংবা যেটুকু আপনার করণীয় বদলে দেয়।';

  @override
  String get toolSectionKeyPoints => 'মূল কথাগুলো';

  @override
  String get toolTitleCompareDocuments => 'নথি তুলনা করুন';

  @override
  String get toolDescriptionCompareDocuments =>
      'কী বদলেছে, কী পরস্পরবিরোধী, কী নেই।';

  @override
  String get toolSectionWhatDiffers => 'কোথায় অমিল';

  @override
  String get toolSectionConflicts => 'পরস্পরবিরোধী তথ্য';

  @override
  String get toolSectionOnlyInOne => 'কেবল একটিতেই আছে';

  @override
  String get toolSectionInCommon => 'যা সবগুলোতেই আছে';

  @override
  String get sensitiveKindEmail => 'ইমেইল ঠিকানা';

  @override
  String get sensitiveKindPhone => 'ফোন নম্বর';

  @override
  String get sensitiveKindPaymentCard => 'পেমেন্ট কার্ড নম্বর';

  @override
  String get sensitiveKindIban => 'ব্যাংক অ্যাকাউন্ট (IBAN)';

  @override
  String get sensitiveKindNationalId => 'জাতীয় পরিচয় নম্বর';

  @override
  String get sensitiveKindPostcode => 'পোস্ট কোড';

  @override
  String get sensitiveKindAccountNumber => 'অ্যাকাউন্ট নম্বর';

  @override
  String get sensitiveKindReference => 'রেফারেন্স নম্বর';

  @override
  String get sensitiveKindDateOfBirth => 'জন্মতারিখ';

  @override
  String get sensitiveKindUrl => 'ওয়েব ঠিকানা';

  @override
  String get verdictVerifiedProvenance => 'যাচাই করা উৎস-পরিচয় রয়েছে';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'এই ফাইলে একটি স্বাক্ষর আছে, আর সেটি পরীক্ষা করা হয়েছে এবং টিকে গেছে।';

  @override
  String get verdictSignalsSynthetic =>
      'AI দিয়ে তৈরি বিষয়বস্তুর সঙ্গে মেলে এমন লক্ষণ';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'ফাইলটি বলছে এটি একটি জেনারেটিভ সরঞ্জাম দিয়ে তৈরি। মেটাডেটা বদলে দেওয়া বা সরিয়ে ফেলা যায়, তাই এটি ফাইলের দাবি, প্রমাণ নয়।';

  @override
  String get verdictSignalsEdited =>
      'সম্পাদিত বিষয়বস্তুর সঙ্গে মেলে এমন লক্ষণ';

  @override
  String get verdictSignalsEditedExplainer =>
      'ফাইলটি বলছে এটি সম্পাদনার সফটওয়্যারের ভেতর দিয়ে গেছে। ছবির ক্ষেত্রে এটি সাধারণ ব্যাপার, আর এতেই বোঝা যায় না যে কিছু জাল করা হয়েছে।';

  @override
  String get verdictNoReliableProvenance =>
      'নির্ভরযোগ্য কোনো উৎস-পরিচয় পাওয়া যায়নি';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'এই ফাইলে উৎস-পরিচয়ের কোনো তথ্য নেই। এটি স্বাভাবিক — বেশির ভাগ সেবা তা মুছে দেয় — আর এটি কিছুরই লক্ষণ নয়।';

  @override
  String get verdictInconclusive => 'অমীমাংসিত';

  @override
  String get verdictInconclusiveExplainer =>
      'এটি কোথা থেকে এসেছে তা বলার মতো যথেষ্ট তথ্য এখানে নেই।';

  @override
  String get authenticitySignalCamera => 'ক্যামেরা';

  @override
  String get authenticitySignalSoftware => 'সফটওয়্যার';

  @override
  String get authenticitySignalDescription => 'বিবরণ';

  @override
  String get authenticitySignalCopyright => 'কপিরাইট';

  @override
  String get authenticitySignalLocation => 'অবস্থান';

  @override
  String get authenticitySignalLocationValue =>
      'এই ফাইলে অবস্থানের তথ্য রয়েছে।';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'পরীক্ষা করা হয়নি — এই বিল্ডে স্বাক্ষর যাচাই করার কিছু নেই।';

  @override
  String get authenticitySignalFile => 'ফাইল';

  @override
  String get authenticitySignalFileUnreadableValue => 'ছবি হিসেবে পড়া গেল না।';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'চেনা কোনো ছবির ফরম্যাট নয়।';

  @override
  String get authenticitySignalText => 'লেখা';

  @override
  String get authenticitySignalTextValue =>
      'শুধু লেখা দেখে নির্ভরযোগ্যভাবে বলা যায় না AI ব্যবহার হয়েছে কি না। Action আন্দাজ করে না।';

  @override
  String get fileTypePng => 'একটি PNG ছবি';

  @override
  String get fileTypeJpeg => 'একটি JPEG ছবি';

  @override
  String get fileTypeGif => 'একটি GIF ছবি';

  @override
  String get fileTypeWebp => 'একটি WebP ছবি';

  @override
  String get fileTypeWav => 'একটি WAV রেকর্ডিং';

  @override
  String get fileTypePdf => 'একটি PDF নথি';

  @override
  String get fileTypeHeic => 'একটি HEIC ছবি';

  @override
  String get fileTypeVideo => 'একটি ভিডিও ফাইল';

  @override
  String get fileTypeTiff => 'একটি TIFF ছবি';

  @override
  String get fileTypeBitmap => 'একটি বিটম্যাপ ছবি';

  @override
  String get fileTypeRtf => 'একটি RTF নথি';

  @override
  String get fileTypeZip => 'একটি Zip আর্কাইভ';

  @override
  String get fileTypeGzip => 'একটি gzip আর্কাইভ';

  @override
  String get fileTypeSevenZip => 'একটি 7-Zip আর্কাইভ';

  @override
  String get fileTypeRar => 'একটি RAR আর্কাইভ';

  @override
  String get fileTypeWindowsProgram => 'একটি Windows প্রোগ্রাম';

  @override
  String get fileTypeLinuxProgram => 'একটি Linux প্রোগ্রাম';

  @override
  String get fileTypePostScript => 'একটি PostScript নথি';

  @override
  String get fileTypeOgg => 'একটি Ogg রেকর্ডিং';

  @override
  String get fileTypeMp3 => 'একটি MP3 রেকর্ডিং';

  @override
  String get fileTypePlainText => 'সাধারণ লেখা';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'এই ফাইলের নাম \".$extension\" দিয়ে শেষ, কিন্তু এর ভেতরে আছে $contents। এটি নিছক ভুলও হতে পারে, আবার এভাবেই কোনো ফাইল আপনি যা ভেবেছিলেন তার বদলে অন্য কিছু দিয়ে খুলে যায়।';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count বাইট',
      one: '$count বাইট',
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
  String get credentialKindPrivateKey => 'প্রাইভেট চাবি';

  @override
  String get credentialKindApiKey => 'API চাবি';

  @override
  String get credentialKindConnectionString => 'কানেকশন স্ট্রিং';

  @override
  String get credentialKindAccessToken => 'অ্যাকসেস টোকেন';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization হেডার';

  @override
  String get credentialKindPasswordOrKey => 'পাসওয়ার্ড বা চাবি';

  @override
  String get credentialKindPossibleSecret => 'সম্ভাব্য গোপন মান';

  @override
  String get credentialAdvicePrivateKey =>
      'শেয়ার করার আগে এটি সরিয়ে ফেলুন, আর চাবি-জোড়াটি বদলে নিন। কোনো প্রাইভেট চাবি একবার দেখা হয়ে গেলে তাকে আর নিরাপদ করা যায় না।';

  @override
  String get credentialAdviceProviderApiKey =>
      'এই চাবিটি সরবরাহকারীর কাছে গিয়ে বাতিল করুন এবং নতুন একটি নিন। নথি থেকে সরিয়ে ফেললে এটি অকেজো হয় না।';

  @override
  String get credentialAdviceConnectionString =>
      'এটি একটি পাসওয়ার্ড আর সেই পাসওয়ার্ড যে ঠিকানা খোলে, দুটোই বয়ে নিয়ে যায়। এটি যদি ইতিমধ্যে শেয়ার হয়ে থাকে, তবে পাসওয়ার্ডটি বদলে ফেলুন।';

  @override
  String get credentialAdviceJsonWebToken =>
      'এ ধরনের টোকেনের মেয়াদ প্রায়ই ফুরিয়ে যায়, তবে সবসময় নয়। কখন এর মেয়াদ শেষ হয় তা জানা না থাকলে একে সচল ধরে নিন।';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'হেডারের মানটি সরিয়ে ফেলুন। পেস্ট করা রিকোয়েস্ট লগ হলো সচল টোকেন ভুলবশত শেয়ার হয়ে যাওয়ার সবচেয়ে প্রচলিত পথগুলোর একটি।';

  @override
  String get credentialAdviceKeyedAssignment =>
      'এটিকে কোনো এনভায়রনমেন্ট ভেরিয়েবলে বা সিক্রেট স্টোরে সরিয়ে নিন, আর ফাইলটি শেয়ার হয়ে থাকলে মানটি বদলে ফেলুন।';

  @override
  String get credentialAdviceHighEntropyString =>
      'এটি কী, Action তা বলতে পারে না। শেয়ার করার আগে দেখে নিন — এটি সমানভাবেই কোনো শনাক্তকারী বা কোনো চেকসাম হতে পারে।';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API চাবি';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI প্রজেক্ট চাবি';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI-ধাঁচের API চাবি';

  @override
  String get credentialLabelGoogleApiKey => 'Google API চাবি';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth টোকেন';

  @override
  String get credentialLabelGitHubToken => 'GitHub টোকেন';

  @override
  String get credentialLabelSlackToken => 'Slack টোকেন';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS অ্যাকসেস চাবির ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab টোকেন';

  @override
  String get credentialLabelNpmToken => 'npm টোকেন';

  @override
  String get credentialLabelPassphrase => 'পাসফ্রেজ';

  @override
  String get credentialLabelPassword => 'পাসওয়ার্ড';

  @override
  String get credentialLabelRefreshToken => 'রিফ্রেশ টোকেন';

  @override
  String get credentialLabelToken => 'টোকেন';

  @override
  String get credentialLabelClientSecret => 'ক্লায়েন্ট সিক্রেট';

  @override
  String get credentialLabelCredential => 'ক্রেডেনশিয়াল';

  @override
  String get credentialLabelSecret => 'গোপন মান';

  @override
  String get linkVerdictNoObviousSignals => 'স্পষ্ট কোনো লক্ষণ নেই';

  @override
  String get linkVerdictWorthChecking => 'একবার দেখে নেওয়ার মতো';

  @override
  String get linkVerdictTreatWithCaution => 'সাবধানে এগোন';

  @override
  String get linkSummaryNoObviousSignals =>
      'এই লিঙ্কটি যেভাবে লেখা, তাতে অস্বাভাবিক কিছু নেই। পাতাটি ভরসাযোগ্য কি না তা জানার সঙ্গে এটি এক নয় — আপনি এটি আশা করেছিলেন কি না, তা কেবল আপনিই বিচার করতে পারেন।';

  @override
  String get linkSummaryWorthChecking =>
      'খোলার আগে এই লিঙ্কের একটি বিষয় দেখে নেওয়ার মতো।';

  @override
  String get linkSummaryTreatWithCaution =>
      'এই লিঙ্কটি যেভাবে লেখা, খোলার আগে তার কয়েকটি বিষয় দেখে নেওয়ার মতো।';

  @override
  String get linkSignalNotHttps => 'এনক্রিপ্ট করা নয়';

  @override
  String get linkSignalNonWebScheme => 'ওয়েব লিঙ্ক নয়';

  @override
  String get linkSignalEmbeddedCredentials => 'লিঙ্কের ভেতরে পাসওয়ার্ড';

  @override
  String get linkSignalMisleadingAuthority => 'আসল ঠিকানা আড়ালে';

  @override
  String get linkSignalIpLiteralHost => 'সংখ্যার ঠিকানা';

  @override
  String get linkSignalPunycodeHost => 'নামে এনকোড করা অক্ষর';

  @override
  String get linkSignalMixedScriptHost => 'নামে মেশানো বর্ণমালা';

  @override
  String get linkSignalEncodedHost => 'নামে এসকেপ করা অক্ষর';

  @override
  String get linkSignalUnusualPort => 'অস্বাভাবিক পোর্ট';

  @override
  String get linkSignalDeepSubdomain => 'নামে অনেকগুলো অংশ';

  @override
  String get linkSignalPublicSuffixInSubdomain => 'চেনা নাম ভুল জায়গায়';

  @override
  String get linkSignalShortener => 'ছোট করা লিঙ্ক';

  @override
  String get linkSignalExecutableTarget => 'একটি প্রোগ্রাম নামায়';

  @override
  String get linkSignalRedirectParameter => 'আপনাকে অন্য কোথাও পাঠাতে পারে';

  @override
  String get linkSignalVeryLongUrl => 'খুব লম্বা';

  @override
  String get linkSignalUnparseable => 'পড়া যায়নি এমন লিঙ্ক';

  @override
  String get linkDetailNotHttps =>
      'এই লিঙ্ক http ব্যবহার করে, তাই পাতাটিতে আপনি যা কিছু টাইপ করবেন তা পথেই পড়ে ফেলা যায়।';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'এটি কোনো ওয়েব পাতা নয়, \"$scheme:\" দিয়ে খোলে। এটি অন্য কোনো অ্যাপকে কিছু করতে বলতে পারে।';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'এই লিঙ্কের ভেতরেই একটি ইউজারনেম আর পাসওয়ার্ড লেখা আছে। লিঙ্কটি যেখানেই শেয়ার হোক, ওগুলোও সঙ্গে যায়।';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return '\"@\"-এর আগের সবকিছু ব্রাউজার উপেক্ষা করে। আসল গন্তব্য \"$host\"।';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'এটি যায় \"$host\"-এ — কোনো নাম নয়, স্রেফ একটি ঠিকানা। বৈধ সাইটগুলো প্রায় সবসময়ই নাম ব্যবহার করে।';
  }

  @override
  String get linkDetailPunycodeHost =>
      'সাইটের নামে রোমান নয় এমন অক্ষর আছে, যা এনকোড করা অবস্থায় রাখা হয়েছে। অনেক ভাষার ক্ষেত্রেই এটি স্বাভাবিক, আবার এভাবেই কোনো নামকে চেনা কোনো নামের মতো দেখাতেও করা যায়।';

  @override
  String get linkDetailMixedScriptHost =>
      'সাইটের নামে রোমান অক্ষরের সঙ্গে অন্য একটি বর্ণমালার এমন অক্ষর মেশানো আছে যেগুলো দেখতে একই রকম। নামটি অক্ষর ধরে ধরে পড়ুন।';

  @override
  String get linkDetailEncodedHost =>
      'সাইটের নামে এসকেপ কোড আছে, অথচ ওগুলোর জায়গা ওখানে নয়। নামটি আসলে কী বলছে, ওগুলো তা ঢেকে রাখতে পারে।';

  @override
  String linkDetailUnusualPort(String port) {
    return 'এটি চেনা পোর্টে নয়, $port পোর্টে যুক্ত হয়। টেস্ট সার্ভারের ক্ষেত্রে এটি সাধারণ, আর সর্বসাধারণের সাইটের ক্ষেত্রে অস্বাভাবিক।';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'নামটিতে $countটি অংশ আছে। সাইটটি কে চালায় তা ঠিক করে কেবল শেষ দুটি; বাকিগুলোতে যা খুশি বসানো যায়।',
      one:
          'নামটিতে $countটি অংশ আছে। সাইটটি কে চালায় তা ঠিক করে কেবল শেষ দুটি; বাকিগুলোতে যা খুশি বসানো যায়।',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'এই নামের মাঝখানে \".$suffix.\" আছে, যার ফলে শুরুর অংশটাকেই সাইট বলে মনে হয়। সাইটটি আসলে \"$host\"।';
  }

  @override
  String get linkDetailShortener =>
      'লিঙ্ক ছোট করার একটি সেবা আসল গন্তব্য আড়াল করে রাখে। না খুলে এটি কোথায় যায় তা বলা যায় না।';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'এই লিঙ্ক \"$fileExtension\" দিয়ে শেষ, তাই এটি পড়ার মতো কোনো পাতা নয়, বরং আপনার ডিভাইসে চলতে পারে এমন কিছু নামায়।';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'এই লিঙ্কের \"$parameter\" সেটিংয়ে দ্বিতীয় একটি ঠিকানা আছে, তাই এটি খুললে আপনি \"$host\" ছাড়া অন্য কোথাও পৌঁছে যেতে পারেন।';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'লম্বা লিঙ্ক পড়া কঠিন, আর গন্তব্য কোনটি তা যে অংশ ঠিক করে সেটি চোখের আড়ালে সরে যেতে পারে।';

  @override
  String get linkDetailUnparseable =>
      'Action এটিকে ওয়েব ঠিকানা হিসেবে পড়তে পারেনি। যেসব লিঙ্ক দেখতে লিঙ্কের মতো নয়, সেগুলোর ব্যাপারে সতর্ক থাকুন।';

  @override
  String get toolTitleRedaction => 'স্পর্শকাতর বিবরণ আড়াল করুন';

  @override
  String get toolDescriptionRedaction =>
      'যা শেয়ার করা উচিত নয় তা খুঁজে বের করুন, আর একটি পরিষ্কার অনুলিপি বানান।';

  @override
  String get toolSectionRedactionNothingToScan => 'স্ক্যান করার মতো কিছু নেই';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'এই সরঞ্জাম লেখা পড়ে। একটি নোট, একটি পেস্ট করা বার্তা, বা যার লেখা ইতিমধ্যে পড়া হয়ে গেছে এমন একটি ক্যাপচার বেছে নিন।';

  @override
  String get toolSectionRedactionNothingFound => 'স্পষ্ট কিছু পাওয়া যায়নি';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'এই লেখায় Action কোনো ইমেইল ঠিকানা, ফোন নম্বর, কার্ড নম্বর বা রেফারেন্স নম্বর পায়নি।';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'আড়াল করার মতো $countটি জিনিস',
      one: 'আড়াল করার মতো $countটি জিনিস',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'কেটে বাদ দেওয়া অনুলিপি';

  @override
  String get toolWarningRedactionCoverage =>
      'এটি ইমেইল, ফোন নম্বর আর অ্যাকাউন্ট নম্বরের মতো ছাঁদ খুঁজে বের করে। স্পর্শকাতর সবকিছু এটি ধরতে পারবে না — শেয়ার করার আগে অনুলিপিটি পড়ে নিন।';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action ছবি বা PDF ফাইল থেকে কিছু কেটে বাদ দিতে পারে না। ছবির ভেতরে কিছু ঢেকে দিলে মূলটি তার নিচে থেকেই যাবে, তাই এই সুযোগ দেওয়া হয় না।';

  @override
  String get toolTitleAuthenticity => 'এটি কোথা থেকে এসেছে যাচাই করুন';

  @override
  String get toolDescriptionAuthenticity =>
      'নিজের উৎস নিয়ে কোনো ফাইল যা দাবি করে।';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'পরখ করার মতো কিছু নেই';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'একটি ছবি বা কিছু লেখা বেছে নিন।';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'এই ফাইল নিজের সম্পর্কে যা বলে';

  @override
  String get toolSectionAuthenticityFileItself => 'ফাইলটি নিজে';

  @override
  String get toolSectionFileContents => 'বিষয়বস্তু';

  @override
  String get toolSectionFileUnknownFormat => 'Action এই ফরম্যাট চেনে না';

  @override
  String get toolSectionFileSize => 'আকার';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'একটি ফাইল নিজের সম্পর্কে যা দাবি করে, এখানে তাই জানানো হয়। মেটাডেটা বদলে দেওয়া বা মুছে ফেলা যায়, তাই এর কোনোটিই প্রমাণ নয়। এটি দিয়ে কাউকে দোষারোপ করবেন না।';

  @override
  String get toolTitleCredentialScanner => 'চাবি ও পাসওয়ার্ড খুঁজে দেখুন';

  @override
  String get toolDescriptionCredentialScanner =>
      'কিছু শেয়ার করার আগে ক্রেডেনশিয়াল খুঁজে নিন।';

  @override
  String get toolSectionCredentialNothingToCheck => 'দেখার মতো কিছু নেই';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'কিছু লেখা পেস্ট করুন, বা যার লেখা ইতিমধ্যে পড়া হয়ে গেছে এমন একটি ক্যাপচার বেছে নিন। এই সরঞ্জাম কেবল লেখাই পড়ে।';

  @override
  String get toolSectionCredentialNoneFound =>
      'কোনো ক্রেডেনশিয়াল পাওয়া যায়নি';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'এই লেখায় API চাবি, প্রাইভেট চাবি, টোকেন বা পাসওয়ার্ডের ছাঁদে আছে এমন কিছু Action পায়নি।';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্রেডেনশিয়াল পাওয়া গেছে',
      one: '$countটি ক্রেডেনশিয়াল পাওয়া গেছে',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি জিনিস গোপন কিছু হতে পারে',
      one: '$countটি জিনিস গোপন কিছু হতে পারে',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'ক্রেডেনশিয়াল সরিয়ে নেওয়া অনুলিপি';

  @override
  String get toolWarningCredentialRevoke =>
      'নথি থেকে কোনো চাবি সরিয়ে ফেললে সেটি অকেজো হয় না। এগুলোর কোনোটি যদি ইতিমধ্যে শেয়ার হয়ে থাকে, তবে সেটি সরবরাহকারীর কাছে গিয়ে বাতিল করুন এবং নতুন একটি নিন।';

  @override
  String get toolWarningCredentialCoverage =>
      'এটি চেনা ছাঁদের ক্রেডেনশিয়াল খুঁজে বের করে। বাক্যের ভেতরে লিখে রাখা কোনো পাসওয়ার্ড এটি পাবে না, তাই লেখাটিও নিজে পড়ে নিন।';

  @override
  String get toolTitleLinkInspector => 'একটি লিঙ্ক যাচাই করুন';

  @override
  String get toolDescriptionLinkInspector =>
      'খোলার আগেই একটি ঠিকানা যা ফাঁস করে দেয়।';

  @override
  String get toolSectionLinkNoneFound => 'কোনো লিঙ্ক পাওয়া যায়নি';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'একটি লিঙ্ক পেস্ট করুন, বা এমন একটি ক্যাপচার বেছে নিন যাতে লিঙ্ক আছে।';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'এই লেখার $countটি লিঙ্ক',
      one: 'এই লেখার লিঙ্কটি',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'পড়া যায়নি';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary। $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'এগুলো যেভাবে লেখা, তাতে অস্বাভাবিক কিছু নেই';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'পাতাগুলো ভরসাযোগ্য কি না তা জানার সঙ্গে এটি এক নয়। আপনি এগুলো আশা করেছিলেন কি না, তা কেবল আপনিই বিচার করতে পারেন।';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action কেবল ঠিকানাটিই পড়ে। এটি লিঙ্কটি খোলে না, সাইটটির খোঁজ নেয় না, আর সুনাম যাচাইয়ের কোনো সেবাকেও কিছু জিজ্ঞেস করে না — তা করলে আপনি কী দেখছেন সেই খবর অন্য কোথাও চলে যেত।';

  @override
  String get toolWarningLinkNoSignals =>
      'কোনো লক্ষণ নেই এমন লিঙ্কও ক্ষতি করতে পারে। একটি ঠিকানা যেভাবে লেখা তাতে কী সমস্যা আছে এটি কেবল তাই খুঁজে বের করে, আর লিঙ্কটি কোথায় যায় সে সম্পর্কে জানার সবটুকু সেটি নয়।';

  @override
  String get toolSectionObjective => 'আপনার লক্ষ্য';

  @override
  String get toolSectionCurrentState => 'লক্ষ্যের এখনকার অবস্থা';

  @override
  String get toolSectionRecommendedNextStep => 'প্রস্তাবিত পরের ধাপ';

  @override
  String get toolSectionCredentialAdvice => 'কী করবেন';

  @override
  String get toolSectionSummary => 'সারসংক্ষেপ';

  @override
  String get toolDetailSeparator => ' · ';
}
