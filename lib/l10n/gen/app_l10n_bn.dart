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
}
