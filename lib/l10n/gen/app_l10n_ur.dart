// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppL10nUr extends AppL10n {
  AppL10nUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'منسوخ';

  @override
  String get commonDone => 'ہو گیا';

  @override
  String get commonSave => 'محفوظ کریں';

  @override
  String get commonClose => 'بند کریں';

  @override
  String get commonBack => 'واپس';

  @override
  String get commonRetry => 'دوبارہ کوشش کریں';

  @override
  String get commonDelete => 'حذف کریں';

  @override
  String get commonRemove => 'نکالیں';

  @override
  String get commonContinue => 'جاری رکھیں';

  @override
  String get commonOpen => 'کھولیں';

  @override
  String get commonCopy => 'کاپی';

  @override
  String get commonCopied => 'کاپی ہو گیا';

  @override
  String get commonEdit => 'ترمیم';

  @override
  String get commonAdd => 'شامل کریں';

  @override
  String get commonOn => 'آن';

  @override
  String get commonOff => 'آف';

  @override
  String get commonUnknown => 'نامعلوم';

  @override
  String get commonChecking => 'جانچا جا رہا ہے…';

  @override
  String get commonSettings => 'ترتیبات';

  @override
  String get commonDismiss => 'ہٹا دیں';

  @override
  String get commonUndo => 'واپس لائیں';

  @override
  String get commonSkip => 'چھوڑیں';

  @override
  String get commonNotNow => 'ابھی نہیں';

  @override
  String get commonSomethingWentWrong => 'کچھ غلط ہو گیا۔';

  @override
  String get navToday => 'آج';

  @override
  String get navLibrary => 'لائبریری';

  @override
  String get navIntelligence => 'انٹیلیجنس';

  @override
  String get navSearch => 'تلاش';

  @override
  String get navCapture => 'کچھ کیپچر کریں';

  @override
  String get todayGreetingMorning => 'صبح بخیر';

  @override
  String get todayGreetingAfternoon => 'السلام علیکم';

  @override
  String get todayGreetingEvening => 'شام بخیر';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'آپ کے کام لوڈ نہیں ہو سکے۔ وہ اب بھی اسی ڈیوائس پر محفوظ ہیں۔';

  @override
  String get todaySectionNeedsAttention => 'توجہ درکار';

  @override
  String get todaySectionAlsoNeedsAttention => 'ان کو بھی توجہ درکار';

  @override
  String get todaySectionWaitingForReview => 'جائزے کے منتظر';

  @override
  String get todaySectionComingUp => 'آگے آنے والے';

  @override
  String todaySeeAllCaptures(int count) {
    return 'تمام $count کیپچر دیکھیں';
  }

  @override
  String get todaySeeAllInLibrary => 'لائبریری میں سب دیکھیں';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مکمل',
      one: '1 مکمل',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کام مکمل ہوئے۔ لائبریری کھولیں۔',
      one: '1 کام مکمل ہوا۔ لائبریری کھولیں۔',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'اس سے شروع کریں';

  @override
  String get todayQuickPhoto => 'تصویر';

  @override
  String get todayQuickScreenshot => 'اسکرین شاٹ';

  @override
  String get todayQuickText => 'متن';

  @override
  String get todayQuickTools => 'کوئی لنک جانچیں، یا متن میں کلیدیں تلاش کریں';

  @override
  String get briefBadgeNeedsYou => 'آپ درکار ہیں';

  @override
  String get briefBadgeToReview => 'جائزے کے لیے';

  @override
  String get briefBadgeAhead => 'آگے';

  @override
  String get briefBadgeStartHere => 'یہاں سے شروع کریں';

  @override
  String get briefBadgeClear => 'سب صاف';

  @override
  String get briefNext => 'اگلا';

  @override
  String briefOpenAction(String title) {
    return '$title کھولیں';
  }

  @override
  String briefMarkDone(String title) {
    return '\"$title\" کو مکمل نشان زد کریں';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کاموں کو آپ کی توجہ درکار ہے',
      one: '1 کام کو آپ کی توجہ درکار ہے',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کیپچر بھی جائزے کے منتظر ہیں۔',
      one: '1 کیپچر بھی جائزے کا منتظر ہے۔',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کیپچر آپ کے منتظر ہیں',
      one: '1 کیپچر آپ کا منتظر ہے',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'کچھ بھی تاخیر کا شکار نہیں۔';

  @override
  String get briefHeadlineNothingToday => 'آج کسی چیز کو آپ کی ضرورت نہیں';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کام آگے آ رہے ہیں۔',
      one: '1 کام آگے آ رہا ہے۔',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'آپ کا سب صاف ہے';

  @override
  String get briefDetailClear => 'نہ کچھ واجب ہے، نہ کچھ منتظر۔';

  @override
  String get briefHeadlineFirstRun => 'کسی بھی چیز سے شروع کریں';

  @override
  String get briefDetailFirstRun =>
      'ایک خط، ایک اسکرین شاٹ، ایک نوٹ — Action خود سمجھ لے گا کہ یہ کیا ہے۔';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get settingsSectionPersonalise => 'اپنی پسند کے مطابق';

  @override
  String get settingsAppearance => 'ظاہری شکل';

  @override
  String get settingsAppearanceDescription =>
      'روشن، گہرا، یا جو ڈیوائس کر رہی ہو۔';

  @override
  String get settingsLanguageDescription =>
      'وہ زبان جس میں Action آپ سے بات کرتا ہے۔';

  @override
  String get appearanceSystem => 'سسٹم';

  @override
  String get appearanceLight => 'روشن';

  @override
  String get appearanceDark => 'گہرا';

  @override
  String get appearanceSystemDescription => 'ڈیوائس کی ترتیب کے مطابق';

  @override
  String get appearanceLightDescription => 'ہمیشہ روشن';

  @override
  String get appearanceDarkDescription => 'ہمیشہ گہرا';

  @override
  String get languageTitle => 'زبان';

  @override
  String get languageSubtitle =>
      'تبدیلیاں فوراً لاگو ہوتی ہیں۔ کچھ بھی کہیں نہیں بھیجا جاتا؛ انتخاب اسی ڈیوائس پر محفوظ رہتا ہے۔';

  @override
  String get languageSectionChoose => 'ایک زبان منتخب کریں';

  @override
  String get languageSystem => 'سسٹم';

  @override
  String get languageSystemDescription => 'ڈیوائس کی زبان کے مطابق';

  @override
  String get languageDraftNote =>
      'Action کے الفاظ انگریزی میں لکھے گئے ہیں۔ باقی تراجم ایک طے شدہ لغت کے مطابق تیار کیے گئے اور خودکار طور پر جانچے گئے ہیں، مگر ابھی تک کسی مادری بولنے والے نے انہیں نہیں پڑھا۔ جہاں الفاظ کی درستی اہم ہے — پرائیویسی، سیکیورٹی، اور Action کیا دعویٰ کرتا ہے اور کیا نہیں — وہاں انگریزی ہی حوالہ رہتی ہے۔';

  @override
  String get settingsIntelligenceFootnote =>
      'Action AI کے بغیر بھی کام کرتا ہے۔ اپنا فراہم کنندہ جوڑنے سے دستاویز کے تجزیے، منصوبہ بندی اور مسودہ لکھنے کے اوزار شامل ہو جاتے ہیں۔';

  @override
  String get settingsAiProvider => 'AI فراہم کنندہ';

  @override
  String get settingsAiNotConnected =>
      'منسلک نہیں۔ اپنا اکاؤنٹ اور API کلید استعمال کریں۔';

  @override
  String settingsAiConnected(String provider) {
    return '$provider سے منسلک۔';
  }

  @override
  String get settingsSectionPrivacySecurity => 'پرائیویسی اور سیکیورٹی';

  @override
  String get settingsSecurity => 'سیکیورٹی';

  @override
  String get settingsWhereInfoLives => 'آپ کی معلومات کہاں رہتی ہیں';

  @override
  String get settingsWhereInfoLivesDescription =>
      'کیا اس ڈیوائس پر رہتا ہے، اور کیا نہیں۔';

  @override
  String get protectionAppLock => 'ایپ لاک';

  @override
  String get protectionScreenPrivacy => 'اسکرین پرائیویسی';

  @override
  String get protectionPrivateReminders => 'نجی یاد دہانیاں';

  @override
  String get protectionSummaryNone =>
      'ایپ لاک، اسکرین پرائیویسی، اور کیا اس ڈیوائس سے باہر جاتا ہے۔';

  @override
  String protectionSummaryOne(String first) {
    return '$first آن ہے۔';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first اور $second آن ہیں۔';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first، $second اور $third آن ہیں۔';
  }

  @override
  String get settingsSectionReminders => 'یاد دہانیاں';

  @override
  String get settingsRemindersFootnote =>
      'بیٹری کی ترتیبات اور ڈیوائس کے استعمال کے مطابق Android یاد دہانی آپ کے مقررہ وقت سے تھوڑی دیر بعد دکھا سکتا ہے۔';

  @override
  String get settingsNotifications => 'اطلاعات';

  @override
  String get settingsNotificationsOnDescription =>
      'آپ کی مقرر کردہ یاد دہانیاں دکھائی جا سکتی ہیں۔';

  @override
  String get settingsNotificationsOffDescription =>
      'Action کے لیے بند ہیں، اس لیے یاد دہانیاں ظاہر نہیں ہوں گی۔';

  @override
  String get settingsNotificationsUnknown => 'جانچا نہیں جا سکا۔';

  @override
  String get settingsNotificationsAllowed => 'اجازت ہے';

  @override
  String get settingsOpenSystemSettings => 'ترتیبات کھولیں';

  @override
  String get settingsActionFootnote =>
      'Action بکھری ہوئی معلومات کو واضح اگلے قدموں میں بدل دیتا ہے۔ محفوظ ہونے سے پہلے ہر چیز کی تصدیق آپ کرتے ہیں۔';

  @override
  String get settingsHelp => 'مدد';

  @override
  String get settingsHelpDescription =>
      'Action کیسے کام کرتا ہے، اور کیا نہیں کرے گا۔';

  @override
  String get settingsVersion => 'ورژن';
}
