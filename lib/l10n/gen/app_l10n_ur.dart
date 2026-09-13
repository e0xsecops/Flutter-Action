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
  String get ocrScriptTitle => 'متن کی شناخت';

  @override
  String get ocrScriptSubtitle =>
      'وہ رسم الخط جو Action کسی تصویر میں پڑھتا ہے۔ شناخت اسی ڈیوائس پر ہوتی ہے؛ پڑھنے کے لیے کوئی کیپچر کہیں نہیں بھیجا جاتا۔';

  @override
  String get ocrScriptSectionChoose => 'رسم الخط';

  @override
  String get ocrScriptFollowLanguage => 'ایپ کی زبان کے مطابق';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'اس وقت $script';
  }

  @override
  String get ocrScriptLatin => 'رومن';

  @override
  String get ocrScriptChinese => 'چینی';

  @override
  String get ocrScriptDevanagari => 'دیوناگری';

  @override
  String get ocrScriptJapanese => 'جاپانی';

  @override
  String get ocrScriptKorean => 'کورین';

  @override
  String get ocrScriptLatinDescription =>
      'انگریزی، ہسپانوی، فرانسیسی، جرمن اور رومن حروف میں لکھی جانے والی باقی زبانیں۔';

  @override
  String get ocrScriptChineseDescription => 'سادہ اور روایتی چینی۔';

  @override
  String get ocrScriptDevanagariDescription =>
      'ہندی، مراٹھی اور نیپالی۔ بنگالی، تامل یا تیلگو نہیں — ان میں سے ہر ایک کا رسم الخط الگ ہے۔';

  @override
  String get ocrScriptJapaneseDescription => 'جاپانی۔';

  @override
  String get ocrScriptKoreanDescription => 'کورین۔';

  @override
  String get ocrScriptFootnote =>
      'رومن کے سوا ہر انتخاب رومن حروف بھی پڑھتا ہے، اس لیے کوئی ایک چننا رسم الخط بدلتا نہیں بلکہ بڑھاتا ہے۔ یہ تبدیلی اب کے بعد لی گئی تصویروں پر لاگو ہوتی ہے، پہلے پڑھی جا چکی تصویروں پر نہیں۔';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action $language رسم الخط نہیں پڑھ سکتا';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'اس کے لیے ڈیوائس پر کوئی شناخت کار موجود نہیں۔ تصویروں میں رومن حروف میں لکھا جو کچھ ہو گا وہ پھر بھی پڑھا جائے گا، باقی خالی واپس آئے گا۔ وہ متن آپ خود ٹائپ یا پیسٹ کر سکتے ہیں۔';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action اس وقت $script پڑھنے پر مقرر ہے۔ اگر یہ تصویر کسی اور رسم الخط میں ہے تو ترتیبات میں بدل کر اسے دوبارہ پڑھوائیں۔';
  }

  @override
  String get settingsTextRecognition => 'متن کی شناخت';

  @override
  String get settingsTextRecognitionDescription =>
      'وہ رسم الخط جو Action تصویروں میں پڑھتا ہے۔';

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

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'ابھی ابھی';

  @override
  String relativeMinutes(int count) {
    return '$count منٹ پہلے';
  }

  @override
  String relativeHours(int count) {
    return '$count گھنٹے پہلے';
  }

  @override
  String get relativeYesterday => 'کل';

  @override
  String relativeDays(int count) {
    return '$count دن پہلے';
  }

  @override
  String get libraryTitle => 'لائبریری';

  @override
  String get librarySubtitle =>
      'جو کچھ Action نے آپ کے لیے رکھا ہے، سب یہاں ہے۔ اور یہ سب اسی ڈیوائس پر رہتا ہے۔';

  @override
  String get librarySegmentActions => 'کام';

  @override
  String get librarySegmentCaptures => 'کیپچر';

  @override
  String get librarySegmentGoals => 'مقاصد';

  @override
  String get librarySegmentDone => 'مکمل';

  @override
  String get libraryNewGoal => 'نیا مقصد';

  @override
  String get libraryNoGoalsTitle => 'ابھی کوئی مقصد نہیں';

  @override
  String get libraryNoGoalsMessage =>
      'مقصد وہ ہے جو آپ ہوتا دیکھنا چاہتے ہیں۔ کیا کمی ہے، کیا رکاوٹ ہے، اور پہلے کیا کرنا ہے — Action یہ تلاش کر سکتا ہے۔';

  @override
  String get libraryNoDoneTitle => 'ابھی کچھ مکمل نہیں ہوا';

  @override
  String get libraryNoDoneMessage =>
      'جو کام آپ ختم کریں گے وہ یہاں محفوظ رہیں گے۔';

  @override
  String get libraryNoOpenTitle => 'کوئی کھلا کام نہیں';

  @override
  String get libraryNoOpenMessage =>
      'کچھ کیپچر کریں، Action سمجھ لے گا کہ کیا کرنا ہے۔';

  @override
  String get libraryNoCapturesTitle => 'ابھی کچھ کیپچر نہیں ہوا';

  @override
  String get libraryNoCapturesMessage =>
      'آپ کی شامل کردہ تصاویر، اسکرین شاٹس اور متن پہلے یہیں آتے ہیں۔ جب تک آپ نہ کہیں، کچھ بھی تجزیہ نہیں کیا جاتا۔';

  @override
  String get libraryGoalNoActions => 'اس سے ابھی کچھ نہیں بنا';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'اس مقصد سے $count کام',
      one: 'اس مقصد سے 1 کام',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'کاموں اور کیپچر میں تلاش کریں';

  @override
  String get searchClear => 'صاف کریں';

  @override
  String get searchPrivacyNote =>
      'تلاش اسی ڈیوائس پر ہوتی ہے۔ آپ یہاں جو لکھتے ہیں، اس میں سے کچھ باہر نہیں جاتا۔';

  @override
  String get searchYouCanSearch => 'آپ تلاش کر سکتے ہیں';

  @override
  String get searchFieldTitles => 'عنوانات';

  @override
  String get searchFieldTitlesExample => 'گاڑی کی بیمہ کی تجدید';

  @override
  String get searchFieldReferences => 'حوالہ نمبر';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'ادارے';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'کسی کام کے اندر کے قدم';

  @override
  String get searchFieldStepsExample => 'فارم اپ لوڈ کریں';

  @override
  String get searchFieldCaptureText => 'کیپچر سے پڑھا گیا متن';

  @override
  String get searchFieldCaptureTextExample => 'تجدید کا نوٹس';

  @override
  String searchNoMatchesTitle(String query) {
    return '\"$query\" کے لیے کچھ نہیں ملا';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'کم الفاظ آزمائیں، یا حوالہ نمبر بالکل ویسے ہی لکھیں جیسے وہ نظر آتا ہے۔';

  @override
  String get searchNoMatchesClearFilters =>
      'کم الفاظ آزمائیں، یا فلٹرز ہٹا دیں۔';

  @override
  String get searchFilterActive => 'جاری';

  @override
  String get searchFilterCompleted => 'مکمل';

  @override
  String get searchFilterOverdue => 'تاخیر کا شکار';

  @override
  String get searchFilterThisWeek => 'اس ہفتے';

  @override
  String get searchFilterCritical => 'نہایت اہم';

  @override
  String get searchFilterCreatedByYou => 'آپ کے بنائے ہوئے';

  @override
  String get searchFilterArchived => 'محفوظ شدہ';

  @override
  String get searchFilterClear => 'فلٹرز ہٹائیں';

  @override
  String get searchIncompleteActions =>
      'آپ کے کاموں میں تلاش نہیں ہو سکی، اس لیے یہ نتائج نامکمل ہو سکتے ہیں۔';

  @override
  String get searchIncompleteCaptures =>
      'آپ کے کیپچر میں تلاش نہیں ہو سکی، اس لیے یہ نتائج نامکمل ہو سکتے ہیں۔';

  @override
  String get searchIncompleteBoth =>
      'نہ آپ کے کاموں میں اور نہ کیپچر میں تلاش ہو سکی، اس لیے یہ نتائج نامکمل ہو سکتے ہیں۔';

  @override
  String get searchMatchTitle => 'عنوان';

  @override
  String get searchMatchNextStep => 'اگلا قدم';

  @override
  String get searchMatchStep => 'قدم';

  @override
  String get searchMatchSummary => 'خلاصہ';

  @override
  String get searchMatchFromCapture => 'کیپچر سے';

  @override
  String get studioSuggested => 'آپ کے آخری کیپچر کے لیے تجویز';

  @override
  String get studioRecentlyUsed => 'حال ہی میں استعمال شدہ';

  @override
  String get studioReady => 'تیار';

  @override
  String get studioNotConnected => 'منسلک نہیں';

  @override
  String get studioHeroTitle => 'Action انٹیلیجنس';

  @override
  String get studioConnectedBlurb =>
      'کوئی دستاویز سمجھیں، مقصد بہتر کریں، منصوبہ بنائیں، جواب کا مسودہ لکھیں، یا جو سامنے ہے اسے جانچیں۔';

  @override
  String studioDisconnectedBlurb(int count) {
    return 'دستاویزات سمجھنے، منصوبہ بندی اور لکھنے کے لیے $count اوزار۔ استعمال کے لیے اپنا AI اکاؤنٹ جوڑیں — بل آپ کا فراہم کنندہ لیتا ہے، Action کبھی نہیں۔';
  }

  @override
  String get studioConnectAi => 'AI جوڑیں';

  @override
  String get studioHowItWorks => 'یہ کیسے کام کرتا ہے';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'ان میں سے $count اس سب کے بغیر ہی چلتے ہیں، پوری طرح اسی ڈیوائس پر۔',
      one: 'ان میں سے 1 اس سب کے بغیر ہی چلتا ہے، پوری طرح اسی ڈیوائس پر۔',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'اسی ڈیوائس پر چلتا ہے';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title۔ $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title۔ $description اسی ڈیوائس پر چلتا ہے۔';
  }

  @override
  String get categoryUnderstand => 'سمجھیں';

  @override
  String get categoryUnderstandBlurb => 'جو آپ کے پاس ہے اس کا مطلب نکالیں۔';

  @override
  String get categoryPlan => 'منصوبہ';

  @override
  String get categoryPlanBlurb => 'اسے ایسی چیز میں بدلیں جو آپ کر سکیں۔';

  @override
  String get categoryCreate => 'لکھیں';

  @override
  String get categoryCreateBlurb => 'لکھیں، بہتر کریں، ترجمہ کریں۔';

  @override
  String get categoryExtract => 'نکالیں';

  @override
  String get categoryExtractBlurb => 'جو تفصیلات اہم ہیں وہ نکالیں۔';

  @override
  String get categoryVerify => 'جانچیں';

  @override
  String get categoryVerifyBlurb => 'جو سامنے ہے اسے جانچیں۔';

  @override
  String get captureSheetTitle => 'کچھ کیپچر کریں';

  @override
  String get captureSheetSubtitle =>
      'جو پورا پڑھنے کو دل نہ چاہے، وہ Action کو دے دیں۔';

  @override
  String get captureTakePhoto => 'تصویر لیں';

  @override
  String get captureTakePhotoSubtitle => 'سامنے رکھا خط، بل یا نوٹس';

  @override
  String get captureChooseImage => 'کوئی تصویر منتخب کریں';

  @override
  String get captureChooseImageSubtitle =>
      'اس ڈیوائس پر پہلے سے موجود اسکرین شاٹ یا تصویر';

  @override
  String get capturePasteText => 'متن چسپاں کریں';

  @override
  String get capturePasteTextSubtitle => 'کوئی ای میل، پیغام یا نوٹس';

  @override
  String get captureChoosePdf => 'PDF منتخب کریں';

  @override
  String get captureChoosePdfSubtitle =>
      'آپ کے پاس پہلے سے موجود گوشوارہ، خط یا فارم';

  @override
  String get captureFootnote =>
      'کیپچر اسی ڈیوائس پر رہتے ہیں۔ جب تک آپ نہ کہیں، آن لائن کچھ بھی تجزیہ نہیں کیا جاتا۔';

  @override
  String get captureCouldNotOpen =>
      'وہ نہیں کھل سکا۔ کسی اور طریقے سے آزمائیں۔';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title۔ $subtitle';
  }

  @override
  String get stageReading => 'پڑھا جا رہا ہے';

  @override
  String get stageNeedsReview => 'جائزہ درکار';

  @override
  String get stageActionCreated => 'کام بن گیا';

  @override
  String get stageNoText => 'کوئی متن نہیں ملا';

  @override
  String get stageCouldNotBeRead => 'پڑھا نہیں جا سکا';

  @override
  String get stageReadingPreview => 'متن پڑھا جا رہا ہے…';

  @override
  String get stageFailedPreview => 'یہ اس ڈیوائس پر پڑھا نہیں جا سکا۔';

  @override
  String get provenancePhoto => 'تصویر سے لیا گیا';

  @override
  String get provenanceImage => 'امیج سے لیا گیا';

  @override
  String get provenancePastedText => 'چسپاں کیے متن سے لیا گیا';

  @override
  String get provenanceDocument => 'دستاویز کے طور پر شامل';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'مکمل ہوا $when';
  }

  @override
  String metaOverdue(String date) {
    return 'تاخیر · آخری تاریخ $date تھی';
  }

  @override
  String get metaDueToday => 'آج تک';

  @override
  String metaDueOn(String date) {
    return '$date تک';
  }

  @override
  String get metaCreatedByYou => 'آپ کا بنایا ہوا';

  @override
  String get categoryPayment => 'ادائیگی';

  @override
  String get categoryRenewal => 'تجدید';

  @override
  String get categoryAppointment => 'ملاقات';

  @override
  String get categoryBooking => 'بکنگ';

  @override
  String get categoryTravel => 'سفر';

  @override
  String get categoryDeadline => 'آخری تاریخ';

  @override
  String get categoryResponse => 'جواب درکار';

  @override
  String get categoryDelivery => 'ترسیل';

  @override
  String get categoryDocument => 'دستاویز';

  @override
  String get categoryNoActionRequired => 'کچھ کرنے کو نہیں';

  @override
  String get categoryUnsure => 'یقینی نہیں';

  @override
  String get errorEnterManually => 'خود لکھ کر درج کریں';

  @override
  String get sourceWhatWeRead => 'ہم نے جو پڑھا';

  @override
  String get sourceDelete => 'کیپچر حذف کریں';

  @override
  String get sourceGone => 'وہ کیپچر اب دستیاب نہیں۔';

  @override
  String get sourceDeleteTitle => 'یہ کیپچر حذف کریں؟';

  @override
  String get sourceDeleteBody =>
      'تصویر اور اس سے پڑھا گیا متن اس ڈیوائس سے ہٹا دیے جاتے ہیں۔';

  @override
  String get sourceDeleteKeep => 'رہنے دیں';

  @override
  String get sourceOpenAction => 'کام کھولیں';

  @override
  String sourceOpenActions(int count) {
    return '$count کام کھولیں';
  }

  @override
  String get sourceCreateAnother => 'اس سے ایک اور بنائیں';

  @override
  String get sourceCreateAction => 'اس سے ایک کام بنائیں';

  @override
  String get sourceDoMore => 'اس کے ساتھ مزید کریں';

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
    return '$format $size KB سے';
  }

  @override
  String get sourceTextFound => 'متن مل گیا';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines سطریں · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'یہ وہ متن ہے جو Action نے پڑھا۔ اس سے جو بنا وہ نیچے ہے۔';

  @override
  String get sourceNotInterpreted =>
      'ابھی کچھ بھی اخذ نہیں کیا گیا۔ Action تجویز دے گا کہ اس کا کیا کیا جائے، اور کچھ بننے سے پہلے آپ تصدیق کرتے ہیں۔';

  @override
  String get sourceNoTextExplainer =>
      'ایسا ہاتھ کی لکھائی میں، بہت کم روشنی میں، یا ایسے رسم الخط میں ہو سکتا ہے جو یہ ڈیوائس ابھی نہیں پڑھ سکتی۔';

  @override
  String get sourceReadFailed => 'یہ پڑھا نہ جا سکا';

  @override
  String get sourceReadFailedReason => 'متن کی شناخت مکمل نہیں ہوئی۔';

  @override
  String get sourceTryReadingAgain => 'دوبارہ پڑھنے کی کوشش کریں';

  @override
  String get sourceTypeInstead => 'اس کے بجائے تفصیل ٹائپ کریں';

  @override
  String get sourceTypeWhatItSays => 'جو لکھا ہے وہ ٹائپ کریں';

  @override
  String get sourceTypeHint => 'تاریخیں، رقمیں، اور کیا مانگا جا رہا ہے۔';

  @override
  String get sourceMadeFromThis => 'اس کیپچر سے بنا';

  @override
  String sourceMadeFromThisCount(int count) {
    return 'اس کیپچر سے $count بنے';
  }

  @override
  String get sourceTheDocument => 'دستاویز';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات',
      one: '1 صفحہ',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'صفحات کی تعداد معلوم نہیں';

  @override
  String get sourceDocumentNotRead =>
      'Action نے یہ نہیں پڑھا کہ اس دستاویز کے اندر کیا ہے۔ جب آپ ایسا کوئی آلہ چلائیں گے جسے اس کی ضرورت ہے، تو فائل آپ کے جوڑے ہوئے AI فراہم کنندہ کو جائے گی، اور ایسا ہونے سے پہلے آپ کو بتا دیا جائے گا۔';

  @override
  String get previewSaveFailed => 'وہ محفوظ نہ ہو سکا۔ دوبارہ کوشش کریں۔';

  @override
  String get previewTitle => 'کیپچر دیکھ لیں';

  @override
  String get previewImageFailed => 'وہ تصویر کھل نہ سکی۔';

  @override
  String get previewHint =>
      'دیکھ لیں کہ متن پڑھنے کے قابل ہے اور کوئی ضروری چیز کٹی نہیں۔';

  @override
  String get previewRetake => 'دوبارہ لیں';

  @override
  String get pasteTitle => 'متن پیسٹ کریں';

  @override
  String get pasteHint =>
      'وہ ای میل، پیغام یا اطلاع پیسٹ کریں جو آپ پورا پڑھنا نہیں چاہتے۔';

  @override
  String get pasteFootnote =>
      'جس میں تاریخ، رقم یا کوئی مطالبہ ہو، وہ اچھا کام کرتا ہے۔';

  @override
  String get pasteEnough => 'لگتا ہے کام چلانے کو کافی ہے۔';

  @override
  String get pasteMore => 'تھوڑا اور متن بہتر نتیجہ دے گا۔';

  @override
  String get reviewLoadFailed => 'یہ کیپچر لوڈ نہ ہو سکا۔';

  @override
  String get reviewConfirmed => 'تصدیق شدہ';

  @override
  String get reviewNeedsReview => 'جائزہ درکار';

  @override
  String get reviewReview => 'جائزہ لیں';

  @override
  String get reviewHighConfidence => 'بھروسا زیادہ';

  @override
  String get reviewConfirmedByYou => 'آپ نے تصدیق کی';

  @override
  String get reviewMissing => 'موجود نہیں';

  @override
  String get reviewNotUnderstood =>
      'Action اس ماخذ کا خاطر خواہ حصہ بھروسے کے ساتھ نہ سمجھ سکا۔';

  @override
  String get reviewNotUnderstoodBody =>
      'کیپچر سلامت ہے اور کچھ ضائع نہیں ہوا۔ آپ تفصیل خود لکھ سکتے ہیں، اور ماخذ حوالے کے لیے منسلک رہتا ہے۔';

  @override
  String get reviewEnterDetails => 'تفصیل درج کریں';

  @override
  String get reviewKeepSource => 'ماخذ بعد کے لیے رکھیں';

  @override
  String reviewEngine(String engine) {
    return 'انجن: $engine';
  }

  @override
  String get reviewManualNotice =>
      'یہ کام آپ خود بنا رہے ہیں۔ صرف وہی استعمال ہو گا جو آپ یہاں لکھیں گے۔';

  @override
  String get reviewUntitled => 'بغیر عنوان کا کام';

  @override
  String get reviewEditTitle => 'عنوان بدلیں';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قدروں کا آپ کا جائزہ درکار ہے۔',
      one: 'اس کی تصدیق سے پہلے 1 قدر کا آپ کا جائزہ درکار ہے۔',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'اہم باتیں';

  @override
  String get reviewNotFound => 'نہیں ملا';

  @override
  String get reviewSuggestedNextStep => 'تجویز کردہ اگلا قدم';

  @override
  String get reviewWhyThisMatters => 'یہ کیوں اہم ہے';

  @override
  String get reviewSteps => 'قدم';

  @override
  String get reviewAddStep => 'قدم شامل کریں';

  @override
  String get reviewInjectionNotice =>
      'اس ماخذ کا کچھ متن دستاویز کی معلومات کے بجائے ہدایات جیسا لگ رہا تھا، اس لیے Action نے اسے نظرانداز کر دیا۔';

  @override
  String get reviewLayoutNotice =>
      'اس دستاویز کی ترتیب میں ایسے تعلق ہو سکتے ہیں جنہیں متن نکالنے کا عمل پوری طرح محفوظ نہ رکھ سکا۔ تصدیق سے پہلے نیچے کی قدروں کو ماخذ سے ملا کر دیکھیں۔';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason نیچے کی قدروں کو ماخذ سے ملا کر دیکھیں۔';
  }

  @override
  String get reviewDeadline => 'آخری تاریخ';

  @override
  String get reviewAmount => 'رقم';

  @override
  String get reviewLeftUnset => 'کوئی نہیں — آپ نے اسے خالی چھوڑنا چنا';

  @override
  String get reviewUnclear => 'واضح نہیں';

  @override
  String get reviewNotSet => 'مقرر نہیں';

  @override
  String get reviewNoDeadlineFound => 'اس دستاویز میں کوئی نہیں ملی';

  @override
  String get reviewNoAmountFound => 'اس دستاویز میں کوئی رقم نہیں ملی';

  @override
  String get reviewMultipleDates => 'Action کو کئی ممکنہ تاریخیں ملیں۔';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count تاریخیں آخری تاریخ ہو سکتی ہیں۔ درست چنیں، کوئی اور لکھیں، یا خالی چھوڑ دیں۔';
  }

  @override
  String get reviewChooseDate => 'ایک تاریخ چنیں';

  @override
  String get reviewMultipleAmounts =>
      'Action کو ایک سے زیادہ ممکنہ رقمیں ملیں۔';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count رقموں میں سے کوئی اس کام کی ہو سکتی ہے۔ ایک چنیں، کوئی اور لکھیں، یا خالی چھوڑ دیں۔';
  }

  @override
  String get reviewChooseAmount => 'ایک رقم چنیں';

  @override
  String get reviewSkipStep => 'یہ قدم چھوڑ دیں';

  @override
  String get reviewKeepStep => 'یہ قدم رکھیں';

  @override
  String get reviewEditStep => 'قدم بدلیں';

  @override
  String get reviewCreateManually => 'خود بنائیں';

  @override
  String get reviewConfirmAndCreate => 'تصدیق کر کے کام بنائیں';

  @override
  String get reviewFixHighlighted => 'نشان زدہ خانے دیکھیں';

  @override
  String get reviewSaving => 'محفوظ ہو رہا ہے…';

  @override
  String get reviewSaveFailed =>
      'یہ کام محفوظ نہ ہو سکا۔ کچھ ضائع نہیں ہوا — دوبارہ کوشش کریں۔';

  @override
  String get reviewFieldTitle => 'عنوان';

  @override
  String get reviewTitleHint => 'کیا ہونا چاہیے؟';

  @override
  String get reviewNewStep => 'نیا قدم';

  @override
  String get reviewStepHint => 'کیا کرنا ہے';

  @override
  String get reviewDatesConflict => 'دستاویز میں ایک سے زیادہ تاریخ ہے۔';

  @override
  String get reviewAmountsConflict => 'دستاویز میں ایک سے زیادہ رقم ہے۔';

  @override
  String get reviewAnotherDate => 'کوئی اور تاریخ — 2026-08-30';

  @override
  String get reviewBadDate =>
      'یہ اصل تاریخ نہیں۔ 2026-08-30 کی شکل استعمال کریں۔';

  @override
  String get reviewTypeDate =>
      'کوئی تاریخ ٹائپ کریں، یا نیچے اسے خالی چھوڑ دیں۔';

  @override
  String get reviewUseThisDate => 'یہی تاریخ لیں';

  @override
  String get reviewLeaveNoDeadline => 'آخری تاریخ کے بغیر آگے بڑھیں';

  @override
  String get reviewAnotherAmount => 'کوئی اور رقم — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'یہ رقم استعمال نہیں ہو سکتی: $reason۔';
  }

  @override
  String get reviewUseThisAmount => 'یہی رقم لیں';

  @override
  String get reviewLeaveNoAmount => 'رقم کے بغیر آگے بڑھیں';

  @override
  String get reviewThisValue => 'یہ قدر';

  @override
  String reviewQuote(String quote) {
    return '”$quote“';
  }

  @override
  String get reviewSeeOnCapture => 'کیپچر پر دیکھیں';

  @override
  String get reviewViewSource => 'ماخذ دیکھیں';

  @override
  String get reviewFromSource => 'ماخذ سے';

  @override
  String get reviewNotVerified => 'ملایا نہیں گیا';

  @override
  String get reviewCouldNotVerify => 'اسے ماخذ سے ملا کر نہ دیکھا جا سکا۔';

  @override
  String get reviewLooksRight => 'درست لگتا ہے';

  @override
  String get reviewStageReading => 'ماخذ پڑھا جا رہا ہے';

  @override
  String get reviewStageUnderstanding => 'اہم تفصیلات سمجھی جا رہی ہیں';

  @override
  String get reviewStageChecking => 'دیکھا جا رہا ہے کہ کس کا جائزہ درکار ہے';

  @override
  String get reviewNothingToDo => 'ابھی آپ کو کچھ کرنے کی ضرورت نہیں۔';

  @override
  String get reviewInformationOnly =>
      'یہ صرف معلومات لگتی ہے — کوئی آخری تاریخ، ادائیگی یا جواب کا تقاضا نہیں ملا۔';

  @override
  String get reviewInformationOnlyWithSource =>
      'یہ صرف معلومات لگتی ہے — اس کیپچر میں کوئی آخری تاریخ، ادائیگی یا جواب کا تقاضا نہیں ملا۔';

  @override
  String get reviewSourceKept => 'ماخذ ہر صورت میں محفوظ رہتا ہے۔';

  @override
  String get reviewAddAnyway => 'پھر بھی ایک کام شامل کریں';

  @override
  String get reviewActionConfirmed => 'کام کی تصدیق ہو گئی';

  @override
  String get reviewCreatedByYou => 'آپ نے بنایا۔';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count جائزہ شدہ باتوں کی بنیاد پر آپ نے تصدیق کی۔',
      one: '1 جائزہ شدہ بات کی بنیاد پر آپ نے تصدیق کی۔',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count جائزہ شدہ باتوں کی بنیاد پر آپ نے تصدیق کی۔ ان میں سے $edited آپ نے بدلیں۔',
      one:
          '1 جائزہ شدہ بات کی بنیاد پر آپ نے تصدیق کی۔ ان میں سے $edited آپ نے بدلیں۔',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'اسی ڈیوائس پر محفوظ ہوا۔';

  @override
  String get detailLoadFailed =>
      'یہ کام لوڈ نہ ہو سکا۔ یہ اب بھی اسی ڈیوائس پر محفوظ ہے۔';

  @override
  String get detailNotFoundTitle => 'وہ کام اب یہاں نہیں ہے';

  @override
  String get detailNotFoundMessage =>
      'شاید اسے اسی ڈیوائس پر حذف کر دیا گیا ہو۔';

  @override
  String get detailGoBack => 'واپس جائیں';

  @override
  String get detailMore => 'مزید';

  @override
  String get detailChangeUrgency => 'عجلت بدلیں';

  @override
  String get detailAddRecommendedStep => 'تجویز کردہ قدم شامل کریں';

  @override
  String get detailEditRecommendedStep => 'تجویز کردہ قدم بدلیں';

  @override
  String get detailArchiveTitle => 'یہ کام محفوظ خانے میں رکھیں؟';

  @override
  String get detailArchiveBody =>
      'یہ آپ کی فہرست سے نکل جاتا ہے مگر حذف نہیں ہوتا، اور جس کیپچر سے یہ بنا وہ بھی رہتا ہے۔';

  @override
  String get detailArchiveConfirm => 'محفوظ خانے میں';

  @override
  String get detailArchived => 'محفوظ خانے میں';

  @override
  String detailCompletedOn(String date) {
    return '$date کو مکمل ہوا';
  }

  @override
  String get detailSectionDetails => 'تفصیل';

  @override
  String get detailSectionReminders => 'یاد دہانیاں';

  @override
  String get detailAllStepsDone => 'سارے قدم مکمل';

  @override
  String get detailNextEyebrow => 'اگلا';

  @override
  String get detailCompleteQuestion => 'یہ کام مکمل کریں؟';

  @override
  String get detailMarkStepDone => 'قدم مکمل نشان زد کریں';

  @override
  String get detailCompleteAction => 'یہ کام مکمل کریں';

  @override
  String get detailAddDeadline => 'آخری تاریخ شامل کریں';

  @override
  String get detailAddAmount => 'رقم شامل کریں';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$total میں سے $completed مکمل';
  }

  @override
  String get detailNoStepsTitle => 'ابھی کوئی قدم نہیں';

  @override
  String get detailNoStepsMessage =>
      'اسے اُن کاموں میں بانٹیں جو واقعی آپ کو کرنے ہیں۔';

  @override
  String get detailAddFirstStep => 'پہلا قدم شامل کریں';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'مکمل قدم: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'اگلا قدم: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'قدم: $title';
  }

  @override
  String detailMarkDone(String title) {
    return '”$title“ کو مکمل نشان زد کریں';
  }

  @override
  String detailMarkNotDone(String title) {
    return '”$title“ کو نامکمل نشان زد کریں';
  }

  @override
  String get detailStepOptions => 'قدم کے اختیارات';

  @override
  String get detailMoveUp => 'اوپر لے جائیں';

  @override
  String get detailMoveDown => 'نیچے لے جائیں';

  @override
  String get detailDeleteStep => 'قدم حذف کریں';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'یہ قدم حذف کریں؟';

  @override
  String get stepDeleteKeep => 'رہنے دیں';

  @override
  String get detailNoRemindersYet => 'ابھی کوئی یاد دہانی نہیں۔';

  @override
  String get detailReminderLimit =>
      'ایک کام میں اس سے زیادہ یاد دہانیاں نہیں ہو سکتیں۔ دوسری شامل کرنے کے لیے ایک ہٹائیں۔';

  @override
  String get detailAddReminder => 'یاد دہانی شامل کریں';

  @override
  String get detailChangeReminder => 'یاد دہانی بدلیں';

  @override
  String get detailRemoveReminder => 'یاد دہانی ہٹائیں';

  @override
  String get detailReminderFormat => 'EEE d MMM, h:mm a';

  @override
  String get reminderStatePending => 'ابھی ترتیب نہیں دی گئی';

  @override
  String get reminderStateNotificationsOff => 'محفوظ ہے، مگر اطلاعات بند ہیں';

  @override
  String get reminderStateFailed => 'وقت مقرر نہ ہو سکا';

  @override
  String get reminderStateRemoving => 'ہٹایا جا رہا ہے…';

  @override
  String get reminderSetConfirmation => 'یاد دہانی لگ گئی۔ ہم یاد دلا دیں گے۔';

  @override
  String get reminderUpdatedConfirmation => 'یاد دہانی بدل گئی۔';

  @override
  String get reminderNeedsPermission =>
      'اطلاعات بند ہیں، اس لیے یہ یاد دہانی محفوظ تو ہے مگر ابھی آپ کو بتا نہیں سکتی۔';

  @override
  String get reminderScheduleFailed =>
      'یہ یاد دہانی محفوظ ہے، مگر Android نے اس کا وقت مقرر نہیں کیا۔';

  @override
  String get reminderLimitReached =>
      'اُس کام میں پہلے ہی زیادہ سے زیادہ یاد دہانیاں موجود ہیں۔';

  @override
  String get reminderTimeInPast => 'وہ وقت گزر چکا ہے۔';

  @override
  String get reminderAddTitle => 'یاد دہانی شامل کریں';

  @override
  String get reminderChangeTitle => 'یہ یاد دہانی بدلیں';

  @override
  String get reminderDateLabel => 'تاریخ';

  @override
  String get reminderTimeLabel => 'وقت';

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
    return 'آپ کو $date کو $time بجے یاد دلایا جائے گا۔';
  }

  @override
  String get reminderTimePastError =>
      'وہ وقت گزر چکا ہے۔ کوئی بعد کا وقت چنیں۔';

  @override
  String get reminderSet => 'یاد دہانی لگائیں';

  @override
  String get reminderPresetInHour => '1 گھنٹے میں';

  @override
  String get reminderPresetTomorrowMorning => 'کل صبح';

  @override
  String get reminderPresetNextWeek => 'اگلے ہفتے';

  @override
  String get reminderPresetOnTheDay => 'اُسی دن';

  @override
  String get reminderPresetDayBefore => '1 دن پہلے';

  @override
  String get reminderPresetWeekBefore => '1 ہفتہ پہلے';

  @override
  String get reminderPresetAtDeadline => 'آخری تاریخ پر';

  @override
  String get reminderPresetHourBefore => '1 گھنٹہ پہلے';

  @override
  String get editNextStepTitle => 'تجویز کردہ اگلا قدم';

  @override
  String get editNextStepSubtitle =>
      'اگلے مفید کام کے بارے میں ایک مختصر جملہ۔';

  @override
  String get editNextStepHint => 'اگلا مفید کام کیا ہے؟';

  @override
  String get editRemoveSuggestion => 'تجویز ہٹائیں';

  @override
  String get editUrgencyTitle => 'یہ کتنا عجلت طلب ہے؟';

  @override
  String get editStepHint => 'کرنے کے لیے ایک ٹھوس کام';

  @override
  String get editAddStep => 'قدم شامل کریں';

  @override
  String get editDateHint => 'سسسس-مم-دد';

  @override
  String get editRemoveDeadline => 'آخری تاریخ ہٹائیں';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => 'رقم محفوظ کریں';

  @override
  String get editRemoveAmount => 'رقم ہٹائیں';

  @override
  String get securityTitle => 'سلامتی اور نجی معاملات';

  @override
  String get securitySectionProtection => 'تحفظ';

  @override
  String get securityAppLockUnavailable =>
      'ایپ لاک کے لیے اس ڈیوائس پر اسکرین لاک ضروری ہے۔ پہلے ڈیوائس کی ترتیبات میں پن، پیٹرن، پاس ورڈ یا فنگر پرنٹ مقرر کریں۔';

  @override
  String get securityAppLockOn =>
      'Action آپ کی ڈیوائس سے تصدیق کراتا ہے کہ یہ آپ ہی ہیں۔';

  @override
  String get securityAppLockOff =>
      'Action کھولنے کے لیے اپنا فنگر پرنٹ، چہرہ یا ڈیوائس پن درکار کریں۔';

  @override
  String get securityAskAgain => 'دوبارہ پوچھیں';

  @override
  String get securityAskAgainDescription =>
      'لاک ہونے سے پہلے Action کتنی دیر پس منظر میں رہ سکتا ہے۔';

  @override
  String get securityScreenPrivacy => 'اسکرین کی نجی حیثیت';

  @override
  String get securityScreenPrivacyDescription =>
      'Android سے کہیں کہ اسکرین شاٹ اور اسکرین ریکارڈنگ روکے، اور ایپ سوئچر میں Action چھپائے۔';

  @override
  String get securityPrivateReminders => 'نجی یاد دہانیاں';

  @override
  String get securityPrivateRemindersOn =>
      'یاد دہانیاں صرف یہ کہتی ہیں کہ کوئی چیز آپ کی منتظر ہے۔';

  @override
  String get securityPrivateRemindersOff =>
      'یاد دہانیاں کام کا عنوان دکھاتی ہیں۔ اسے آن کریں تاکہ وہ لاک اسکرین پر نہ آئے۔';

  @override
  String get securityLockNow => 'ابھی لاک کریں';

  @override
  String get securityLockNowDescription => 'انتظار کیے بغیر دروازہ بند کریں۔';

  @override
  String get securitySectionStorage => 'آپ کا ڈیٹا کیسے رکھا جاتا ہے';

  @override
  String get securityStorageDataLabel => 'آپ کے کام، کیپچر اور ترتیبات';

  @override
  String get securityStorageDataDetail =>
      'یہ اسی ایپ کی اپنی نجی ذخیرہ گاہ میں رہتے ہیں، جسے دوسری ایپس پڑھ نہیں سکتیں اور جسے Android ڈیوائس کی خفیہ کاری کے حصے کے طور پر خفیہ کرتا ہے۔ Action اس کے اوپر اپنی دوسری تہہ نہیں ڈالتا۔';

  @override
  String get securityStorageKeyLabel => 'آپ کی AI فراہم کنندہ کلید';

  @override
  String get securityStorageKeyDetail =>
      'باقی سب کے ساتھ نہیں بلکہ Android Keystore میں رکھی جاتی ہے، اور محفوظ کرنے کے بعد دوبارہ کبھی نہیں دکھائی جاتی۔';

  @override
  String get securityStorageGapLabel => 'یہ کس چیز کا احاطہ نہیں کرتا';

  @override
  String get securityStorageGapDetail =>
      'ان میں سے کوئی چیز اس شخص سے نہیں بچاتی جو آپ کی کھلی ہوئی ڈیوائس استعمال کر رہا ہو، اور بدلا ہوا یا روٹ شدہ نظام عام نظام سے زیادہ پڑھ سکتا ہے۔ ایپ لاک وہ ترتیب ہے جو پہلی صورت میں مدد دیتی ہے۔';

  @override
  String get securitySectionInformation => 'آپ کی معلومات';

  @override
  String get securityWhereInfoDescription =>
      'ہر وہ راستہ جو آپ کا ڈیٹا لے سکتا ہے، اور وہ دو جو اس ڈیوائس سے باہر جاتے ہیں۔';

  @override
  String get securityAppLockRefused => 'تصدیق نہیں ہوئی، اس لیے کچھ نہیں بدلا۔';

  @override
  String get securityAppLockUnavailableToast =>
      'اس ڈیوائس پر کوئی اسکرین لاک مقرر نہیں۔ ڈیوائس کی ترتیبات میں پن، پیٹرن، پاس ورڈ یا فنگر پرنٹ شامل کریں، پھر دوبارہ کوشش کریں۔';

  @override
  String get securityScreenPrivacyRefused =>
      'اس ڈیوائس نے اسکرین کی نجی حیثیت لاگو نہیں کی، اس لیے اسے آن دکھانے کے بجائے بند ہی رہنے دیا گیا۔';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count طے شدہ یاد دہانیاں اب کم بتاتی ہیں۔',
      one: '1 طے شدہ یاد دہانی اب کم بتاتی ہے۔',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count طے شدہ یاد دہانیاں اپ ڈیٹ ہوئیں۔',
      one: '1 طے شدہ یاد دہانی اپ ڈیٹ ہوئی۔',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'فوراً';

  @override
  String get appLockDelayOneMinute => '1 منٹ بعد';

  @override
  String get appLockDelayFiveMinutes => '5 منٹ بعد';

  @override
  String get securityDelayImmediatelyDescription =>
      'جب بھی Action اسکرین سے ہٹے';

  @override
  String get securityDelayOneMinuteDescription =>
      'ایک پیغام کا جواب دینے جتنا وقت';

  @override
  String get securityDelayFiveMinutesDescription => 'ایک کال سننے جتنا وقت';

  @override
  String get securityHeroProtected => 'محفوظ رکھا گیا';

  @override
  String get securityHeroNothingOn => 'کچھ بھی آن نہیں';

  @override
  String get securityHeroFootnote =>
      'یہاں کی ہر چیز اسی ڈیوائس پر چلتی ہے۔ ان ترتیبات میں سے کوئی کہیں نہیں بھیجی جاتی، اور کسی کو دور سے بدلا نہیں جا سکتا۔';

  @override
  String get securityHeadlineNone => 'تین تحفظات دستیاب ہیں';

  @override
  String securityHeadlineOne(String first) {
    return '$first آن ہے';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first اور $second آن ہیں';
  }

  @override
  String get securityHeadlineAll => 'تینوں تحفظات آن ہیں';

  @override
  String get securityTransfersTitle => 'اس ڈیوائس سے کیا گیا';

  @override
  String get securityTransfersNoProvider =>
      'کوئی AI فراہم کنندہ جڑا ہوا نہیں، اس لیے تجزیے کے لیے کچھ بھی نہیں بھیجا جا رہا۔';

  @override
  String get securityTransfersDescription =>
      'جس لمحے کچھ بھیجا جاتا ہے اسی لمحے یہاں لکھا جاتا ہے، چاہے جواب آیا ہو یا نہ آیا ہو۔ صرف آلہ، فراہم کنندہ اور حجم — اس کے اندر کیا تھا وہ کبھی نہیں۔ اسی ڈیوائس پر 90 دن رکھا جاتا ہے اور کہیں نہیں بھیجا جاتا۔';

  @override
  String get securityClear => 'صاف کریں';

  @override
  String get securityNothingSent => 'کچھ نہیں بھیجا گیا';

  @override
  String get securityNothingSentDescription =>
      'جب آپ ایسا آلہ چلائیں گے جو آپ کا AI فراہم کنندہ استعمال کرے، وہ یہاں درج ہو گا۔';

  @override
  String get securityClearHistoryTitle => 'یہ تاریخ صاف کریں؟';

  @override
  String get securityClearHistoryBody =>
      'کیا کچھ بھیجا گیا اس کا ریکارڈ اس ڈیوائس سے حذف ہو جائے گا۔ یہ اُس چیز کو واپس نہیں لاتا جو پہلے ہی بھیجی جا چکی ہے۔';

  @override
  String get securityUnnamedTool => 'ایک Intelligence آلہ';

  @override
  String get securityYourProvider => 'آپ کے AI فراہم کنندہ';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات',
      one: '1 صفحہ',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فائلیں',
      one: '1 فائل',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'ایک مختصر متن';

  @override
  String securityTransferCharacters(int count) {
    return '$count ہزار حروف';
  }

  @override
  String securitySentTo(String provider) {
    return '$provider کو بھیجا گیا۔';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '$provider کو بھیجا گیا · $size۔';
  }

  @override
  String relativeWeeks(int count) {
    return '$count ہفتے پہلے';
  }

  @override
  String get helpTitle => 'مدد';

  @override
  String get helpAddQuestion => 'میں کیا شامل کر سکتا ہوں؟';

  @override
  String get helpAddAnswer =>
      'ایک اسکرین شاٹ، کسی خط یا بل کی تصویر، یا وہ متن جو آپ پیسٹ کریں۔ جس میں تاریخ، رقم یا کوئی مطالبہ ہو وہ سب سے بہتر چلتا ہے۔';

  @override
  String get helpReviewQuestion => 'Action مجھ سے جائزہ لینے کو کیوں کہتا ہے؟';

  @override
  String get helpReviewAnswer =>
      'کیونکہ دستاویز پڑھنے والی مشین اسے غلط پڑھ سکتی ہے، اور خاموشی سے غلط آخری تاریخ کسی آخری تاریخ کے نہ ہونے سے بھی بری ہے۔ Action دکھاتا ہے کہ اسے کیا ملا اور کن الفاظ سے ملا، اور جب تک آپ تصدیق نہ کریں کچھ محفوظ نہیں ہوتا۔';

  @override
  String get helpVaryQuestion => 'دوبارہ کوشش پر نتائج کیوں بدل جاتے ہیں؟';

  @override
  String get helpVaryAnswer =>
      'آپ کی دستاویز پڑھنے والی سروس متعین نہیں، اس لیے وہی کیپچر کچھ مختلف واپس آ سکتا ہے۔ جائزے کا مرحلہ اسی لیے بھی ہے — آپ ہی وہ حصہ ہیں جو نہیں بدلتا۔';

  @override
  String get helpLateQuestion => 'میری یاد دہانی دیر سے کیوں آئی؟';

  @override
  String get helpLateAnswer =>
      'یاد دہانیاں Android کے ذریعے طے ہوتی ہیں، اور Android ہی طے کرتا ہے کہ انہیں ٹھیک کب پہنچانا ہے۔ بیٹری بچت، Doze اور بنانے والے کی پاور ترتیبات کسی کو بھی دیر کرا سکتی ہیں۔ Action کبھی منٹ کے حساب سے یاد دہانی کا وعدہ نہیں کرتا۔';

  @override
  String get helpDataQuestion => 'میرا ڈیٹا کہاں ہے؟';

  @override
  String get helpDataAnswer =>
      'تقریباً سب کچھ اسی ڈیوائس پر ہے: آپ کے کیپچر، کام، قدم، یاد دہانیاں اور تلاشیں۔ دو استثنا — جو مواد آپ Action سے پڑھوانا چاہتے ہیں وہ اسے پڑھنے والی AI سروس کو جاتا ہے، اور تصدیق شدہ کام کا ایک مختصر ریکارڈ گمنام شناخت کے تحت کلاؤڈ میں رکھا جا سکتا ہے۔ ترتیبات میں نجی معاملات اور ڈیٹا بالکل بتاتا ہے کہ اس ریکارڈ میں کیا ہوتا ہے۔';

  @override
  String get helpBackupQuestion => 'کیا یہ بیک اپ ہے؟';

  @override
  String get helpBackupAnswer =>
      'نہیں۔ کلاؤڈ کا ریکارڈ نئی ڈیوائس پر بحال نہیں کیا جا سکتا، اور لاگ اِن کرنے کے لیے کوئی اکاؤنٹ بھی نہیں۔ اگر آپ Action ہٹا دیں یا یہ ڈیوائس کھو دیں تو اس پر موجود ڈیٹا چلا جاتا ہے۔';

  @override
  String get helpCorrectQuestion => 'میں کسی کام کو کیسے درست کروں؟';

  @override
  String get helpCorrectAnswer =>
      'اسے کھولیں اور کوئی بھی خانہ بدلیں — عنوان، آخری تاریخ، رقم یا تجویز کردہ اگلا قدم۔ آپ قدم کسی بھی وقت شامل، ترتیب، مکمل اور حذف کر سکتے ہیں۔ کسی کام میں ترمیم AI سروس سے کبھی کچھ نہیں پوچھتی۔';

  @override
  String get privacyTitle => 'نجی معاملات اور ڈیٹا';

  @override
  String get privacyIntro =>
      'Action جتنا ہو سکے اتنا اسی ڈیوائس پر رکھتا ہے۔ دو چیزیں استثنا ہیں، اور دونوں نیچے درج ہیں۔';

  @override
  String get privacyGroupOnDevice => 'اس ڈیوائس پر';

  @override
  String get privacyOnDeviceCaptures =>
      'کیپچر — آپ کے شامل کردہ اسکرین شاٹ، تصاویر اور متن، اور ان سے پڑھا گیا متن۔';

  @override
  String get privacyOnDeviceActions =>
      'کام، اُن کے قدم، تفصیلات اور یاد دہانیاں۔';

  @override
  String get privacyOnDeviceSearch =>
      'تلاش۔ آپ کی تلاشیں یہیں چلتی ہیں، کہیں نہیں بھیجی جاتیں، اور اسکرین بند کرنے کے بعد رکھی نہیں جاتیں۔';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'تصاویر اپنے مقام کے بغیر محفوظ ہوتی ہیں۔ فون تصویر کے اندر جو نقاط، وقت اور کیمرے کی تفصیل لکھتا ہے وہ کیپچر محفوظ ہونے سے پہلے ہٹا دی جاتی ہے، اس لیے وہ نہ یہاں رہتی ہے اور نہ اُس وقت جاتی ہے جب آپ کوئی کیپچر اپنے AI فراہم کنندہ کو بھیجتے ہیں۔';

  @override
  String get privacyGroupSentToRead => 'پڑھے جانے کے لیے بھیجا گیا';

  @override
  String get privacySentToReadWhat =>
      'جب آپ Action سے کسی کیپچر کو سمجھنے کو کہتے ہیں، وہ مواد اسے پڑھنے والی AI سروس کو بھیجا جاتا ہے۔ یہ ڈیوائس پر چلنے والی AI نہیں ہے۔';

  @override
  String get privacySentToReadWhen =>
      'صرف وہی کیپچر بھیجا جاتا ہے جو آپ نے چنا، اور صرف تب جب آپ کہیں۔';

  @override
  String get privacyGroupYourProvider =>
      'آپ کے اپنے AI فراہم کنندہ کو بھیجا گیا';

  @override
  String get privacyProviderWhat =>
      'اگر آپ ترتیبات میں کوئی AI فراہم کنندہ جوڑیں تو Intelligence کے آلات آپ کا منتخب کردہ مواد اُس فراہم کنندہ کو بھیجتے ہیں — OpenAI، Anthropic، Google یا آپ کا چنا ہوا کوئی endpoint — آپ ہی کی API کلید سے۔';

  @override
  String get privacyProviderDirect =>
      'یہ سیدھا اُن ہی کے پاس جاتا ہے۔ یہ Action کے کسی سرور سے ہو کر نہیں گزرتا۔';

  @override
  String get privacyProviderScope =>
      'کسی آلے کے لیے آپ جو چنتے ہیں صرف وہی بھیجا جاتا ہے، اور صرف تب جب آپ اسے چلاتے ہیں۔ آپ کے دوسرے کام، کیپچر اور ماخذ کبھی شامل نہیں ہوتے، اور پس منظر میں کبھی کچھ نہیں بھیجا جاتا۔';

  @override
  String get privacyProviderKey =>
      'آپ کی API کلید اس ڈیوائس کی محفوظ ذخیرہ گاہ میں رکھی جاتی ہے اور صرف اُسی فراہم کنندہ کو بھیجی جاتی ہے جس کی وہ ہے۔ محفوظ ذخیرہ گاہ اُس شخص کے لیے حقیقی رکاوٹ ہے جس کے پاس آپ کی کھلی ڈیوائس ہو، مگر وہ مطلق نہیں، اور Action اس کے برعکس کچھ نہیں کہے گا۔';

  @override
  String get privacyProviderLocalTools =>
      'کچھ آلات کبھی کچھ نہیں بھیجتے: حساس تفصیلات چھپانا، یہ جانچنا کہ کوئی فائل کہاں سے آئی، اسناد تلاش کرنا اور کوئی لنک جانچنا، یہ سب مکمل طور پر اسی ڈیوائس پر چلتے ہیں۔';

  @override
  String get privacyProviderAgreement =>
      'آپ جو بھیجتے ہیں اس کے ساتھ آپ کا فراہم کنندہ کیا کرتا ہے، یہ اُن کے ساتھ آپ کے معاہدے سے طے ہوتا ہے، Action سے نہیں۔';

  @override
  String get privacyGroupCloud => 'کلاؤڈ میں محفوظ';

  @override
  String get privacyCloudWhat =>
      'جب آپ کسی کام کی تصدیق کرتے ہیں تو اس کا ایک مختصر ریکارڈ اس تنصیب کی گمنام شناخت کے تحت محفوظ ہو سکتا ہے: عنوان، حالت، عجلت، زمرہ، آخری تاریخ، رقم، تجویز کردہ اگلا قدم اور وقت کی مہریں۔';

  @override
  String get privacyCloudNotSent =>
      'آپ کے کیپچر، اُن سے پڑھا گیا متن، کسی کام کے قدم اور تفصیلات، اور آپ کی یاد دہانیاں نہیں بھیجی جاتیں۔';

  @override
  String get privacyCloudNotBackup =>
      'یہ بیک اپ نہیں ہے۔ اسے نئی ڈیوائس پر بحال کرنے کا کوئی راستہ نہیں، اور یہ تنصیب کھونے پر گمنام شناخت بھی ساتھ چلی جاتی ہے۔';

  @override
  String get privacyGroupDiagnostics => 'تشخیص';

  @override
  String get privacyDiagnosticsWhat =>
      'Action ایپ میں جو ہوتا ہے اس کی گمنام گنتی رکھتا ہے — کہ کوئی کیپچر شروع ہوا، کہ کوئی اخذ چلا یا نہیں، کہ کسی تلاش کو کچھ نہ ملا، کہ کوئی کام مکمل ہوا۔';

  @override
  String get privacyDiagnosticsCounts =>
      'یہ گنتیاں ہیں، مواد نہیں۔ کوئی عنوان، رقم، آخری تاریخ، حوالہ، کیپچر کیا گیا متن یا تلاش کا لفظ کبھی شامل نہیں ہوتا، اور نہ ہی گمنام شناخت یا کسی کام یا کیپچر کا کوئی شناخت کنندہ۔';

  @override
  String get privacyDiagnosticsCrash =>
      'اگر ایپ بند ہو جائے تو خرابی اور وہ کہاں ہوئی یہ بتایا جاتا ہے تاکہ اسے ٹھیک کیا جا سکے۔ Action اُن رپورٹوں کے ساتھ آپ کا ڈیٹا منسلک نہیں کرتا۔';

  @override
  String get privacySectionYourData => 'آپ کا ڈیٹا';

  @override
  String get privacyYourDataFootnote =>
      'کیپچر صاف کرنے سے آپ کے کام اپنی جگہ رہتے ہیں۔ جس کام کا کیپچر چلا گیا وہ پھر بھی چلتا ہے؛ بس اب یہ نہیں دکھاتا کہ وہ کس سے بنا تھا۔';

  @override
  String get privacyClearCaptures => 'کیپچر صاف کریں';

  @override
  String get privacyClearCapturesDescription =>
      'ہر کیپچر اور اس کی تصویر کی فائل حذف کر دیتا ہے۔';

  @override
  String get privacyDeleteAll => 'میرا سارا ڈیٹا حذف کریں';

  @override
  String get privacyDeleteAllDescription =>
      'کام، قدم، یاد دہانیاں، کیپچر اور اوپر دیے گئے کلاؤڈ ریکارڈ۔';

  @override
  String get privacyClearCapturesTitle => 'کیپچر صاف کریں؟';

  @override
  String get privacyClearCapturesBody =>
      'ہر کیپچر اور اس کی تصویر اس ڈیوائس سے حذف ہو جائے گی۔ آپ کے کام بالکل ویسے ہی رہتے ہیں جیسے ہیں۔';

  @override
  String get privacyCapturesDeleted => 'کیپچر حذف ہو گئے۔';

  @override
  String get privacyCapturesPartlyDeleted =>
      'کچھ کیپچر حذف نہ ہو سکے۔ اور کچھ نہیں بدلا گیا۔';

  @override
  String get privacyDeleteAllTitle => 'آپ کا سارا ڈیٹا حذف کریں؟';

  @override
  String get privacyDeleteAllBody =>
      'یہ اس ڈیوائس کے ہر کام، قدم، یاد دہانی اور کیپچر کو، اور اوپر درج کلاؤڈ ریکارڈ کو حذف کر دیتا ہے۔ اسے واپس نہیں لایا جا سکتا، اور بحال کرنے کے لیے کوئی بیک اپ بھی نہیں۔';

  @override
  String get privacyDeleteEverything => 'سب کچھ حذف کریں';

  @override
  String get privacyDeletedAll => 'سب کچھ حذف ہو گیا۔';

  @override
  String get privacyDeleteFailed => 'آپ کا ڈیٹا حذف نہ ہو سکا۔';

  @override
  String get privacyDeletedUnverified =>
      'اس ڈیوائس کا سب کچھ حذف ہو گیا۔ Action کلاؤڈ تک نہ پہنچ سکا کہ تصدیق کرے وہاں کچھ باقی نہیں، اور دوبارہ دیکھے گا۔';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '$leftovers کے سوا حذف ہو گیا۔';
  }

  @override
  String get privacyWillTryAgain => 'Action دوبارہ کوشش کرے گا۔';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action کلاؤڈ کی جانچ مکمل نہ کر سکا، اور دوبارہ کوشش کرے گا۔';

  @override
  String get privacyLeftoverCaptures => 'کچھ کیپچر';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلاؤڈ ریکارڈ',
      one: '1 کلاؤڈ ریکارڈ',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first اور $second';
  }

  @override
  String get privacyCloudDeleted => 'کلاؤڈ ریکارڈ حذف ہو گئے۔';

  @override
  String get privacyCloudUnreachable =>
      'پھر بھی اُن تک نہ پہنچا جا سکا۔ Action دوبارہ کوشش کرے گا۔';

  @override
  String get privacyPendingTitle => 'ابھی حذف ہونا باقی';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'پچھلی بار $count کلاؤڈ ریکارڈ تک نہ پہنچا جا سکا۔ Action خود دوبارہ کوشش کرے گا، یا آپ ابھی کوشش کر سکتے ہیں۔',
      one: 'پچھلی بار 1 کلاؤڈ ریکارڈ تک نہ پہنچا جا سکا۔ Action خود دوبارہ کوشش کرے گا، یا آپ ابھی کوشش کر سکتے ہیں۔',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'دوبارہ کوشش کریں';

  @override
  String get evidenceTitle => 'یہ کہاں سے آیا';

  @override
  String get evidenceUnverified =>
      'Action کو یہ الفاظ اپنے پڑھے ہوئے متن میں نہیں ملے، اس لیے اس قدر کو ملایا نہیں گیا۔ اس پر بھروسا کرنے سے پہلے اسے اصل سے ملا کر دیکھیں۔';

  @override
  String get evidenceHighlighted =>
      'یہ الفاظ اُس متن میں تھے جو Action نے اس کیپچر سے پڑھا، اور نشان دکھاتا ہے کہاں۔';

  @override
  String get evidenceNoRegion =>
      'یہ الفاظ اُس متن میں تھے جو Action نے اس کیپچر سے پڑھا۔ تصویر میں یہ ٹھیک کہاں ہیں، یہ معلوم نہ ہو سکا، اور یہاں اندازہ نہیں لگایا جاتا۔';

  @override
  String get evidenceInText =>
      'یہ الفاظ اُس متن میں تھے جو اس کیپچر میں موجود ہے۔';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'نہایت اہم';

  @override
  String get urgencyImportant => 'اہم';

  @override
  String get urgencyNormal => 'معمولی';

  @override
  String get urgencyLow => 'کم';

  @override
  String get urgencyUnsure => 'یقین نہیں';

  @override
  String get detailSaveFailed =>
      'یہ محفوظ نہ ہو سکا۔ کچھ ضائع نہیں ہوا — دوبارہ کوشش کریں۔';

  @override
  String get detailSectionCreatedFrom => 'کس سے بنا';

  @override
  String get detailSourceChecking => 'اصل کیپچر لایا جا رہا ہے…';

  @override
  String get detailSourceUnavailable => 'اصل کیپچر اب دستیاب نہیں رہا۔';

  @override
  String get detailReopenAction => 'کام دوبارہ کھولیں';

  @override
  String get detailMarkActionComplete => 'کام مکمل نشان زد کریں';

  @override
  String get detailGetHelp => 'اس میں مدد لیں';

  @override
  String get detailSectionHistory => 'تاریخچہ';

  @override
  String get detailHistoryShowLess => 'کم دکھائیں';

  @override
  String detailHistoryShowAll(int count) {
    return 'سارے $count اندراجات دکھائیں';
  }

  @override
  String get detailHistoryCreated => 'بنایا گیا';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قدموں کے ساتھ بنایا گیا',
      one: '1 قدم کے ساتھ بنایا گیا',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'آپ نے تفصیلات کی تصدیق کی';

  @override
  String detailHistoryStepFinished(String title) {
    return 'آپ نے ”$title“ مکمل کیا';
  }

  @override
  String get detailHistoryAStep => 'کوئی قدم';

  @override
  String get detailHistoryReminderSet => 'آپ نے ایک یاد دہانی مقرر کی';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'آپ نے $when کے لیے یاد دہانی مقرر کی';
  }

  @override
  String get detailHistoryCompleted => 'مکمل نشان زد کیا گیا';

  @override
  String get detailHistoryChanged => 'آخری بار تبدیل ہوا';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom =>
      'اپنا منتخب کردہ (OpenAI سے مطابقت رکھنے والا)';

  @override
  String get aiCapabilityText => 'متن';

  @override
  String get aiCapabilityImages => 'تصاویر';

  @override
  String get aiCapabilityDocuments => 'دستاویزات';

  @override
  String get aiCapabilityStructuredResults => 'مقررہ ساخت کے نتائج';

  @override
  String get aiCapabilityStreaming => 'بتدریج ترسیل';

  @override
  String get aiCapabilitySystemInstructions => 'سسٹم ہدایات';

  @override
  String get aiCapabilityEvidenceCitations => 'ثبوت کے حوالے';

  @override
  String get aiCapabilityLongDocuments => 'طویل دستاویزات';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a، $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a یا $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head یا $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'یہ آلہ استعمال کرنے کے لیے کوئی AI فراہم کنندہ جوڑیں۔';

  @override
  String get aiFailureInvalidKey => 'وہ API کلید فراہم کنندہ نے قبول نہیں کی۔';

  @override
  String get aiFailureQuotaExceeded =>
      'آپ کے فراہم کنندہ اکاؤنٹ کا کریڈٹ ختم ہو چکا ہے یا وہ اپنے کوٹے تک پہنچ گیا ہے۔';

  @override
  String get aiFailureRateLimited =>
      'آپ کا فراہم کنندہ درخواستوں کی رفتار محدود کر رہا ہے۔ تھوڑی دیر بعد دوبارہ کوشش کریں۔';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action آپ کے AI فراہم کنندہ تک نہ پہنچ سکا۔ اپنا کنکشن دیکھیں۔';

  @override
  String get aiFailureUnsupportedModel =>
      'وہ ماڈل آپ کی کلید کے لیے دستیاب نہیں۔ ترتیبات میں کوئی اور چنیں۔';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'آپ کا چنا ہوا ماڈل $capabilities نہیں پڑھ سکتا۔ ترتیبات میں کوئی اور ماڈل چنیں۔';
  }

  @override
  String get aiFailureContextTooLarge =>
      'یہ اتنا مواد تھا کہ یہ ماڈل اسے ایک ہی بار میں نہیں پڑھ سکتا۔';

  @override
  String get aiFailureInputTooLargeText =>
      'یہ اتنا متن ہے کہ ایک ہی بار میں اس کا تجزیہ نہیں ہو سکتا۔';

  @override
  String get aiFailureProviderUnavailable =>
      'آپ کے AI فراہم کنندہ کو دشواری پیش آ رہی ہے۔ تھوڑی دیر بعد دوبارہ کوشش کریں۔';

  @override
  String get aiFailureMalformedResponse =>
      'اُس فراہم کنندہ نے ایسا کچھ واپس بھیجا جو Action پڑھ نہ سکا۔';

  @override
  String get aiFailureCancelled => 'روک دیا گیا۔';

  @override
  String get aiFailureInsecureEndpoint =>
      'اُس endpoint کا https:// پتہ ہونا لازمی ہے۔';

  @override
  String get aiFailureUnknown =>
      'آپ کے AI فراہم کنندہ سے بات کرتے ہوئے کچھ غلط ہو گیا۔';

  @override
  String get appLockTitle => 'Action لاک ہے';

  @override
  String get appLockPrompt =>
      'جاری رکھنے کے لیے تصدیق کریں کہ یہ آپ ہی ہیں۔ Action آپ کی ڈیوائس سے پوچھتا ہے — وہ خود آپ کا فنگر پرنٹ، چہرہ یا پن کبھی نہیں دیکھتا۔';

  @override
  String get appLockUnlocking => 'لاک کھولا جا رہا ہے…';

  @override
  String get appLockNotConfirmed =>
      'تصدیق نہیں ہوئی۔ جب تیار ہوں تو دوبارہ کوشش کریں۔';

  @override
  String get appLockCannotConfirm =>
      'آپ کی ڈیوائس ابھی تصدیق نہیں کر سکتی کہ یہ آپ ہی ہیں۔ ڈیوائس کی ترتیبات میں دیکھیں کہ اسکرین لاک اب بھی مقرر ہے۔';

  @override
  String get appLockWaiting => 'انتظار…';

  @override
  String get appLockUnlock => 'لاک کھولیں';

  @override
  String get appLockReasonUnlock => 'Action کا لاک کھولیں';

  @override
  String get appLockReasonEnable =>
      'ایپ لاک آن کرنے سے پہلے تصدیق کریں کہ یہ آپ ہی ہیں';

  @override
  String get appLockReasonDisable =>
      'ایپ لاک آف کرنے سے پہلے تصدیق کریں کہ یہ آپ ہی ہیں';

  @override
  String get todayCapabilityHeading => 'Action کیا سنبھالتا ہے';

  @override
  String get todayCapabilityDocumentTitle => 'کوئی خط یا بل';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action اسے پڑھتا ہے اور آخری تاریخ، رقم اور حوالہ نمبر ڈھونڈ لیتا ہے۔';

  @override
  String get todayCapabilityScreenshotTitle => 'کوئی اسکرین شاٹ';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'جو پیغام ورنہ بھول جاتا، اسے ایسی چیز میں بدلیں جس پر آپ عمل کر سکیں۔';

  @override
  String get todayCapabilityTextTitle => 'کچھ متن';

  @override
  String get todayCapabilityTextBlurb =>
      'کچھ بھی چسپاں کریں۔ Action خود سمجھ لے گا کہ یہ کیا ہے اور آپ سے کیا مانگتا ہے۔';

  @override
  String get todayCapabilityConfirmTitle => 'ہر چیز کی تصدیق آپ کرتے ہیں';

  @override
  String get todayCapabilityConfirmBlurb =>
      'جب تک آپ ثبوت دیکھ کر ہاں نہ کہہ دیں، کوئی چیز کام نہیں بنتی۔';

  @override
  String get todayCapabilityExploreIntelligence => 'انٹیلیجنس دیکھیں';

  @override
  String get documentRejectedEmpty => 'وہ فائل خالی ہے۔';

  @override
  String documentRejectedTooLarge(String size) {
    return 'وہ دستاویز $size کی ہے، جو Action کے کام کرنے کی حد سے بڑی ہے۔';
  }

  @override
  String get documentRejectedNotAPdf =>
      'نام جو بھی ہو، یہ PDF نہیں ہے۔ PDF اور تصاویر Action پڑھ لیتا ہے۔';

  @override
  String get documentRejectedUnreadable => 'وہ دستاویز پڑھی نہ جا سکی۔';

  @override
  String get pdfRejectedNotAPdf => 'نام جو بھی ہو، وہ فائل PDF نہیں ہے۔';

  @override
  String get pdfRejectedEncrypted =>
      'وہ PDF پاس ورڈ سے محفوظ ہے، اس لیے Action اسے نہیں پڑھ سکتا۔';

  @override
  String get pdfRejectedDamaged =>
      'وہ PDF پڑھی نہ جا سکی۔ ہو سکتا ہے وہ نامکمل ہو۔';

  @override
  String get shareRejectedEmpty => 'اُس شیئر میں پڑھنے کو کچھ نہیں تھا۔';

  @override
  String get shareRejectedUnsupportedType =>
      'Action متن، تصاویر اور PDF لے سکتا ہے۔ وہ کوئی اور چیز تھی۔';

  @override
  String get shareRejectedContentMismatch =>
      'وہ فائل اُس قسم کی نہیں جس کا وہ دعویٰ کرتی ہے، اس لیے Action نے اسے کھولا ہی نہیں۔';

  @override
  String get shareRejectedTooLarge =>
      'وہ فائل اتنی بڑی ہے کہ Action اس کے ساتھ کام نہیں کر سکتا۔';

  @override
  String get shareRejectedUnreadable => 'وہ فائل پڑھی نہ جا سکی۔';

  @override
  String get captureFailureRecognition => 'متن کی شناخت چل ہی نہ سکی۔';

  @override
  String get captureFailureImageFormat =>
      'وہ امیج فارمیٹ اس ڈیوائس پر پڑھا نہ جا سکا۔';

  @override
  String get connectSheetTitle => 'اپنا AI جوڑیں';

  @override
  String get connectSheetSubtitle =>
      'آپ اپنا ہی فراہم کنندہ اکاؤنٹ اور API کلید استعمال کرتے ہیں۔ Action یہ کلید اسی ڈیوائس کی محفوظ ذخیرہ گاہ میں رکھتا ہے۔';

  @override
  String get connectErrorKeyMissing =>
      'جاری رکھنے کے لیے اپنی API کلید چسپاں کریں۔';

  @override
  String get connectErrorModelMissing =>
      'کوئی ماڈل چنیں، یا ماڈل کی id ٹائپ کریں۔';

  @override
  String get connectErrorEndpointMissing => 'اپنے endpoint کا پتہ شامل کریں۔';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'اس ڈیوائس کی محفوظ ذخیرہ گاہ کھل نہ سکی، اس لیے کلید محفوظ نہیں ہوئی۔';

  @override
  String get connectTestSucceeded => 'منسلک ہو گیا۔';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'منسلک ہو گیا۔ $count ماڈل دستیاب ہیں۔';
  }

  @override
  String get connectProviderLabel => 'فراہم کنندہ';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'پتہ https:// ہونا لازمی ہے۔ Action آپ کی دستاویزات بغیر خفیہ کاری والے کنکشن پر نہیں بھیجے گا۔';

  @override
  String get connectApiKeyLabel => 'API کلید';

  @override
  String get connectApiKeyHint => 'اپنی کلید چسپاں کریں';

  @override
  String get connectKeyPrivacyNote =>
      'آپ کی کلید اسی ڈیوائس پر رہتی ہے۔ Action اسے آپ کے چنے ہوئے فراہم کنندہ کے سوا کہیں نہیں بھیجتا، اور محفوظ کرنے کے بعد اسے آپ کو دوبارہ نہیں دکھا سکتا۔';

  @override
  String get connectModelLabel => 'ماڈل';

  @override
  String get connectModelIdHint => 'ماڈل id';

  @override
  String get connectModelFreeTextNote =>
      'فراہم کنندہ پرانے ماڈل id ہٹاتے اور نئے شامل کرتے رہتے ہیں۔ اگر آپ کا مطلوبہ ماڈل فہرست میں نہ ہو تو اسے یہاں ٹائپ کریں۔';

  @override
  String get connectAndTest => 'جوڑ کر آزمائیں';

  @override
  String get connectSaveWithoutTesting => 'آزمائے بغیر محفوظ کریں';

  @override
  String get toolWarningFactsNotChecked =>
      'Action اس کا اصل متن سے موازنہ نہ کر سکا، اس لیے اس میں موجود رقموں اور تاریخوں کو جانچا نہیں گیا۔';

  @override
  String get toolTitleRewrite => 'یہ تحریر بہتر کریں';

  @override
  String get toolDescriptionRewrite =>
      'زیادہ واضح، زیادہ مختصر یا زیادہ رسمی — حقائق جوں کے توں رکھے جاتے ہیں۔';

  @override
  String get toolModeRewriteClearer => 'زیادہ واضح';

  @override
  String get toolModeRewriteProfessional => 'زیادہ پیشہ ورانہ';

  @override
  String get toolModeRewriteShorter => 'زیادہ مختصر';

  @override
  String get toolModeRewritePersuasive => 'زیادہ قائل کن';

  @override
  String get toolModeRewriteSimpler => 'زیادہ سادہ';

  @override
  String get toolModeRewriteStructured => 'زیادہ منظم';

  @override
  String get toolModeRewriteGrammarOnly => 'صرف قواعد';

  @override
  String get toolSectionWhatChanged => 'کیا بدلا';

  @override
  String get toolSectionNote => 'نوٹ';

  @override
  String get toolSectionAlreadyClearBody =>
      'یہ پہلے ہی واضح تھا۔ نیچے دی گئی تبدیلیاں معمولی ہیں۔';

  @override
  String get toolSectionImprovedText => 'بہتر کی گئی تحریر';

  @override
  String get toolTitleDraftReply => 'جواب کا مسودہ لکھیں';

  @override
  String get toolDescriptionDraftReply =>
      'ایک جواب جس میں آپ ترمیم کر سکتے ہیں اور جسے آپ خود بھیجتے ہیں۔';

  @override
  String get toolModeReplyProfessional => 'پیشہ ورانہ';

  @override
  String get toolModeReplyConcise => 'مختصر';

  @override
  String get toolModeReplyFriendly => 'دوستانہ';

  @override
  String get toolModeReplyFormal => 'رسمی';

  @override
  String get toolModeReplyClarification => 'وضاحت طلب کریں';

  @override
  String get toolModeReplyConfirmation => 'موصولی کی اطلاع';

  @override
  String get toolModeReplyDispute => 'اس پر اعتراض کریں';

  @override
  String get toolSectionSubject => 'موضوع';

  @override
  String get toolSectionDraftReply => 'جواب کا مسودہ';

  @override
  String get toolSectionPlaceholders => 'یہ آپ کو خود بھرنے ہیں';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'مسودہ — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'یہ ایک مسودہ ہے۔ Action کچھ نہیں بھیجتا — اسے پڑھیں، اس میں ترمیم کریں، اور خود بھیجیں۔';

  @override
  String get toolTitleTranslate => 'ترجمہ کریں';

  @override
  String get toolDescriptionTranslate =>
      'کوئی دوسری زبان، جس میں عدد اور نام جوں کے توں رکھے جاتے ہیں۔';

  @override
  String get toolSectionTranslation => 'ترجمہ';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '$from سے $to میں';
  }

  @override
  String get toolSectionKeptInOriginal => 'اصل الفاظ میں رکھے گئے';

  @override
  String get toolWarningTranslationNotCertified =>
      'یہ سمجھنے کے لیے ترجمہ ہے، مصدقہ ترجمہ نہیں۔';

  @override
  String get toolTitleStructuredData => 'جدول نکالیں';

  @override
  String get toolDescriptionStructuredData =>
      'سطریں، خانے اور اعداد جنہیں آپ کاپی کر کے لے جا سکتے ہیں۔';

  @override
  String get toolSectionTable => 'جدول';

  @override
  String get toolSectionFields => 'خانے';

  @override
  String get toolSectionTableCsv => 'جدول (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'اس جدول کے کالموں کی ترتیب بھروسے کے ساتھ پڑھی نہ جا سکی۔ استعمال سے پہلے دیکھ لیں کہ سطریں ٹھیک ملتی ہیں۔';

  @override
  String get toolTitleDeadlineFinder => 'آخری تاریخیں ڈھونڈیں';

  @override
  String get toolDescriptionDeadlineFinder =>
      'کیا واجب ہے، کب ہے، اور اگر نہ ہوا تو کیا ہوتا ہے۔';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count آخری تاریخیں',
      one: '1 آخری تاریخ',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'کچھ واجب نہیں ملا';

  @override
  String get toolSectionNothingDueBody =>
      'Action کو اس مواد میں کوئی آخری تاریخ یا ذمہ داری نہیں ملی۔';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'جب تک آپ نہ چنیں، کسی چیز کا وقت مقرر نہیں ہوتا۔ یاد دہانیاں کبھی خودکار طور پر نہیں لگتیں۔';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'اگر نہ ہوا: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'آپ کو درکار: $items';
  }

  @override
  String get moneyErrorEmpty => 'کوئی رقم نہیں دی گئی';

  @override
  String get moneyErrorMalformed => 'رقم سادہ عدد نہیں ہے';

  @override
  String get moneyErrorNegative => 'منفی رقم قابلِ ادائیگی رقم نہیں ہوتی';

  @override
  String get moneyErrorTooManyDecimals =>
      'اعشاریے کے بعد اتنے ہندسے جتنے اس کرنسی میں نہیں ہوتے';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'یہ کرنسی کوڈ ہمارے پہچانے ہوئے کوڈوں میں نہیں';

  @override
  String get moneyErrorOutOfRange => 'رقم اتنی بڑی ہے کہ قابلِ یقین نہیں';

  @override
  String get escalationOcrFailed => 'اس کیپچر پر شناخت بالکل نہ چل سکی۔';

  @override
  String get escalationNoTextRecognised =>
      'یہ دستاویز لگتی ہے، مگر کوئی متن شناخت نہ ہو سکا۔';

  @override
  String get escalationThinText =>
      'اتنی بڑی دستاویز کے لحاظ سے بہت ہی کم متن شناخت ہوا۔';

  @override
  String get escalationLowLineConfidence =>
      'شناخت کار نے کئی سطروں پر بھروسا کم بتایا۔';

  @override
  String get escalationTableLikeLayout =>
      'ترتیب جدول جیسی لگتی ہے، اور اسے سطر بہ سطر پڑھنے سے یہ کھو جاتا ہے کہ کون سی قدر کس سطر کی ہے۔';

  @override
  String get escalationFragmentedLayout =>
      'متن بہت سے چھوٹے چھوٹے ٹکڑوں کی صورت میں واپس آیا، اس لیے اس کی ساخت واضح نہیں۔';

  @override
  String get escalationMalformedText =>
      'شناخت شدہ متن کا بڑا حصہ ایسے الفاظ یا اعداد نہیں جو پڑھے جا سکیں۔';

  @override
  String get escalationConflictingDates =>
      'ایک سے زیادہ تاریخ کو آخری تاریخ کے طور پر پیش کیا گیا ہے۔';

  @override
  String get escalationConflictingAmounts =>
      'ایک سے زیادہ رقم کو واجب الادا رقم کے طور پر پیش کیا گیا ہے۔';

  @override
  String get escalationUnresolvedGrounding =>
      'کچھ قدروں کو دستاویز کے متن سے ملا کر نہ دیکھا جا سکا۔';

  @override
  String get escalationInstructionLikeContent =>
      'دستاویز میں ایسا متن موجود ہے جو ایپ کو دی گئی ہدایات کی طرح لکھا ہوا ہے۔ اسے دستاویز کے مواد کے طور پر لیا جاتا ہے، کبھی ہدایات کے طور پر نہیں۔';

  @override
  String get providerFailureNetwork =>
      'Action سروس تک نہ پہنچ سکا۔ اپنا کنکشن دیکھیں۔';

  @override
  String get providerFailureTimedOut =>
      'سروس نے جواب دینے میں بہت زیادہ وقت لیا۔';

  @override
  String get providerFailureServiceUnavailable =>
      'سروس عارضی طور پر دستیاب نہیں۔ بعد میں دوبارہ کوشش کریں۔';

  @override
  String get providerFailureUnauthorized =>
      'اس ایپ کو ابھی یہ سروس استعمال کرنے کی اجازت نہیں۔';

  @override
  String get providerFailureBlocked =>
      'سروس نے اس دستاویز پر کارروائی سے انکار کر دیا۔';

  @override
  String get providerFailureUnknown =>
      'Action یہ دستاویز نہ پڑھ سکا۔ دوبارہ کوشش کرنے سے شاید کام بن جائے۔';

  @override
  String get reviewBlockerTitle => 'اس کام کو کوئی عنوان دیں۔';

  @override
  String get reviewBlockerDate =>
      'چنیں کہ اصل آخری تاریخ کون سی ہے، یا اسے خالی چھوڑ دیں۔';

  @override
  String get reviewBlockerAmount =>
      'چنیں کہ کون سی رقم درست ہے، یا اسے خالی چھوڑ دیں۔';

  @override
  String get reviewBlockerStepTitle =>
      'جو قدم آپ رکھیں گے، ان کا عنوان ہونا ضروری ہے۔';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'صفحہ $page',
      one: 'صفحہ 1',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'صفحات $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'نئی تحریر میں اب $values موجود نہیں۔ استعمال سے پہلے اسے دیکھ لیں۔',
      one: 'نئی تحریر میں اب $values موجود نہیں۔ استعمال سے پہلے اسے دیکھ لیں۔',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'نئی تحریر میں اب $values اور مزید $count قدریں موجود نہیں۔ استعمال سے پہلے اسے دیکھ لیں۔',
      one:
          'نئی تحریر میں اب $values اور مزید 1 قدر موجود نہیں۔ استعمال سے پہلے اسے دیکھ لیں۔',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => '، ';

  @override
  String get goalStatusReached => 'حاصل ہو گیا';

  @override
  String get goalNewSheetTitle => 'آپ کیا ہوتا دیکھنا چاہتے ہیں؟';

  @override
  String get goalNewSheetSubtitle =>
      'ایک جملہ کافی ہے۔ تفصیل آپ بعد میں شامل کر سکتے ہیں۔';

  @override
  String get goalTitleHint => 'گاڑی کی بیمہ کی تجدید، بغیر زیادہ پیسے دیے۔';

  @override
  String get goalCreateAction => 'مقصد بنائیں';

  @override
  String get goalTitleSheetTitle => 'آپ کیا چاہتے ہیں';

  @override
  String get goalOutcomeSheetTitle => 'مکمل ہونا کیسا ہو گا';

  @override
  String get goalContextSheetTitle => 'معاملہ کہاں کھڑا ہے';

  @override
  String get goalOutcomeHint =>
      'گاڑی کا بیمہ ہو چکا ہے اور کاغذات جمع ہو چکے ہیں۔';

  @override
  String get goalContextHint =>
      'میرے پاس دو تخمینے ہیں اور تجدید 18 تاریخ کو ہے۔';

  @override
  String get goalWorkspaceTitle => 'مقصد';

  @override
  String get goalUnmarkReached => 'حاصل ہونے کا نشان واپس لیں';

  @override
  String get goalMarkReached => 'حاصل شدہ نشان زد کریں';

  @override
  String get goalNotFound => 'وہ مقصد اب یہاں نہیں ہے۔';

  @override
  String get goalDeleteTitle => 'یہ مقصد حذف کریں؟';

  @override
  String get goalDeleteBody =>
      'یہ مقصد اس ڈیوائس سے ہٹا دیا جاتا ہے۔ اس سے بنے ہوئے کام بالکل ویسے ہی رہتے ہیں جیسے ہیں۔';

  @override
  String get goalOutcomeLabel => 'مکمل ہونا کیسا ہو گا';

  @override
  String get goalOutcomeEmpty =>
      'ابھی لکھا نہیں گیا۔ جب آپ بتا دیں کہ اس کا مکمل ہونا کیا ہے تو مقصد کی منصوبہ بندی آسان ہو جاتی ہے۔';

  @override
  String get goalContextLabel => 'معاملہ کہاں کھڑا ہے';

  @override
  String get goalContextEmpty =>
      'ابھی کچھ نہیں لکھا گیا۔ اب تک کیا ہوا، اور کیا رکاوٹ ہے۔';

  @override
  String get goalTitleLabel => 'آپ کیا چاہتے ہیں';

  @override
  String get goalEditTooltip => 'مقصد میں ترمیم کریں';

  @override
  String get goalToolsLabel => 'Action کیا کر سکتا ہے';

  @override
  String get goalToolsNotReady =>
      'آپ کیا چاہتے ہیں، اس کے بارے میں تھوڑا اور لکھیں تو ان آلات کے پاس کام کرنے کو کچھ ہو گا۔';

  @override
  String get toolGoalOptimizerTitle => 'مقصد بہتر کریں';

  @override
  String get toolActionPlanTitle => 'منصوبہ بنائیں';

  @override
  String get resultFactUnconfirmed => 'تصدیق نہیں ہوئی';

  @override
  String get resultSuggestedSteps => 'تجویز کردہ قدم';

  @override
  String get resultSuggestedAction => 'تجویز کردہ کام';

  @override
  String get resultWorthAsking => 'پوچھنے لائق سوالات';

  @override
  String get resultSuggestedDeadlines => 'تجویز کردہ آخری تاریخیں';

  @override
  String get resultSuggestions => 'تجاویز';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تائیدی اقتباسات',
      one: '1 تائیدی اقتباس',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'منتخب کردہ ماخذ سے';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source، $page';
  }

  @override
  String get toolRunStagePreparing => 'آپ کی دستاویز تیار کی جا رہی ہے';

  @override
  String get toolRunStageReading => 'منتخب کردہ صفحات پڑھے جا رہے ہیں';

  @override
  String get toolRunStageAnalysing => 'تجزیہ جاری';

  @override
  String get toolRunStageBuilding => 'آپ کا جائزہ تیار کیا جا رہا ہے';

  @override
  String get toolRunStageDone => 'مکمل';

  @override
  String get toolRunStageFailed => 'یہ مکمل نہ ہو سکا';

  @override
  String get toolRunStageCancelled => 'آپ نے روک دیا';

  @override
  String get toolRunFailureLocalCheckFailed => 'اس کی جانچ نہ ہو سکی۔';

  @override
  String get toolRunFailureProviderRetired =>
      'وہ AI فراہم کنندہ اس ورژن میں اب دستیاب نہیں۔';

  @override
  String get toolRunFailureUnusableReply =>
      'وہ جواب ایسی شکل میں واپس نہیں آیا جو استعمال کے قابل ہو۔ دوبارہ کوشش کریں۔';

  @override
  String get toolRunFailureQuestionRequired => 'پہلے کوئی سوال ٹائپ کریں۔';

  @override
  String get toolRunFailureInputRequired => 'چنیں کہ یہ آلہ کس چیز پر کام کرے۔';

  @override
  String get toolWarningReplyTruncated =>
      'یہ جواب بیچ میں ہی کٹ گیا، اس لیے ہو سکتا ہے یہ نامکمل ہو۔';

  @override
  String get toolWarningNoSupportingQuotes =>
      'آپ کے ماڈل نے کوئی تائیدی اقتباس واپس نہیں کیا، اس لیے یہاں کسی بھی چیز کے پیچھے کوئی ثبوت نہیں ہے۔ اس پر عمل کرنے سے پہلے اسے دستاویز سے ملا کر دیکھیں۔';

  @override
  String get aiSettingsRemoveTitle => 'یہ کنکشن ہٹائیں؟';

  @override
  String get aiSettingsRemoveBody =>
      'Action آپ کی API کلید اس ڈیوائس سے حذف کر دے گا اور AI خصوصیات استعمال کرنا بند کر دے گا۔ آپ کے فراہم کنندہ اکاؤنٹ پر اس کا کوئی اثر نہیں پڑتا۔';

  @override
  String get aiSettingsProviderLabel => 'فراہم کنندہ';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'آپ جو استعمال کرتے ہیں اس کا بل آپ کا فراہم کنندہ لیتا ہے۔ Action خود سے کبھی کوئی درخواست نہیں بھیجتا۔';

  @override
  String get aiSettingsConnectLabel => 'کوئی AI فراہم کنندہ جوڑیں';

  @override
  String get aiSettingsConnectDescription =>
      'OpenAI، Anthropic، Google Gemini، یا کسی مطابقت رکھنے والے endpoint کے ساتھ اپنا ہی اکاؤنٹ اور اپنی ہی API کلید استعمال کریں۔';

  @override
  String get aiSettingsModelLabel => 'ماڈل';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API کلید';

  @override
  String get aiSettingsKeyStored =>
      'اس ڈیوائس کی محفوظ ذخیرہ گاہ میں رکھی جاتی ہے۔';

  @override
  String get aiSettingsKeyMissing =>
      'اس ڈیوائس پر کوئی کلید نہیں ملی۔ نئی شامل کرنے کے لیے دوبارہ جوڑیں۔';

  @override
  String get aiSettingsTestLabel => 'کنکشن آزمائیں';

  @override
  String get aiSettingsProviderUnavailable =>
      'وہ فراہم کنندہ اس ورژن میں دستیاب نہیں۔';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'منسلک ہو گیا۔ $count ماڈل دستیاب ہیں۔';
  }

  @override
  String get aiSettingsTestButton => 'آزمائیں';

  @override
  String get aiSettingsChangeProvider => 'فراہم کنندہ یا ماڈل بدلیں';

  @override
  String get aiSettingsRemoveKey => 'کلید ہٹائیں';

  @override
  String get aiSettingsSectionPrivacy => 'نجی معاملات';

  @override
  String get aiSettingsWhatGetsSentLabel => 'کیا بھیجا جاتا ہے';

  @override
  String get aiSettingsWhereItGoesLabel => 'یہ کہاں جاتا ہے';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'جب تک آپ کوئی فراہم کنندہ نہ جوڑیں، کچھ نہیں بھیجا جاتا۔';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'سیدھا $provider کو، آپ ہی کی کلید سے۔ یہ Action کے کسی سرور سے ہو کر نہیں گزرتا۔';
  }

  @override
  String get aiSettingsSectionData => 'ڈیٹا';

  @override
  String get aiSettingsDataFootnote =>
      'Action یہ یاد رکھتا ہے کہ آپ نے کون سے آلات استعمال کیے، یہ کبھی نہیں کہ آپ نے انہیں کس چیز پر استعمال کیا۔';

  @override
  String get aiSettingsRecentToolsLabel => 'حال ہی میں استعمال شدہ آلات';

  @override
  String get aiSettingsRecentToolsNone => 'کوئی نہیں';

  @override
  String get reminderNotificationTitle => 'Action یاد دہانی';

  @override
  String get reminderNotificationPrivateBody =>
      'کوئی چیز آپ کے جائزے کی منتظر ہے۔';

  @override
  String get reminderChannelName => 'Action یاد دہانیاں';

  @override
  String get reminderChannelDescription =>
      'وہ یاد دہانیاں جو آپ اپنے کاموں کے لیے خود مقرر کرتے ہیں۔';

  @override
  String get onboardingStart => 'Action استعمال کرنا شروع کریں';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return '$total میں سے قدم $current';
  }

  @override
  String get onboardingCaptureTitle => 'معلومات کو کام میں بدلیں';

  @override
  String get onboardingCaptureBody =>
      'کوئی اسکرین شاٹ، تصویر، یا وہ متن شامل کریں جو آپ کو بھیجا گیا ہے۔ Action اسے پڑھتا ہے اور نکال لیتا ہے کہ اس میں آپ سے کیا کرنے کو کہا جا رہا ہے۔';

  @override
  String get onboardingReviewTitle =>
      'جب تک آپ تصدیق نہ کریں، کچھ محفوظ نہیں ہوتا';

  @override
  String get onboardingReviewBody =>
      'Action آپ کو دکھاتا ہے کہ اسے کیا ملا اور کن الفاظ سے ملا۔ جو غلط ہو وہ آپ درست کر دیتے ہیں۔ آپ کی تصدیق سے پہلے یہ ایک تجویز ہے — نہ کوئی حقیقت، اور نہ کوئی کام۔';

  @override
  String get onboardingTrackingTitle => 'جو اہم ہے اس پر نظر رکھیں';

  @override
  String get onboardingTrackingBody =>
      'توجہ درکار وہ سامنے لے آتا ہے جو گزر چکا ہے یا قریب ہے۔ ہر کام اپنا اگلا قدم، اپنی پیش رفت اور آپ کی مقرر کردہ ہر یاد دہانی اپنے ساتھ رکھتا ہے۔';

  @override
  String get onboardingPrivacyBody => 'شروع کرنے سے پہلے جاننے کی باتیں:';

  @override
  String get onboardingPrivacyOnDevice =>
      'آپ کے کام، کیپچر، یاد دہانیاں اور تلاشیں اسی ڈیوائس پر رکھے جاتے ہیں۔ تلاش اور یاد دہانیاں بغیر کنکشن کے بھی چلتی ہیں۔';

  @override
  String get onboardingPrivacySentToRead =>
      'جب آپ Action سے کچھ پڑھنے کو کہتے ہیں، وہ مواد اسے سمجھنے والی AI سروس کو بھیجا جاتا ہے۔';

  @override
  String get onboardingPrivacyCloud =>
      'کسی تصدیق شدہ کام کا ایک مختصر ریکارڈ — اس کا عنوان، تاریخیں، رقم اور تجویز کردہ قدم — اس ڈیوائس کی گمنام شناخت کے تحت کلاؤڈ میں محفوظ ہو سکتا ہے۔ آپ کے کیپچر، قدم اور یاد دہانیاں نہیں۔';

  @override
  String get onboardingPrivacyNotBackup =>
      'وہ ریکارڈ بیک اپ نہیں ہے۔ یہ کسی نئی ڈیوائس پر کچھ بھی بحال نہیں کر سکتا۔';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رکاوٹیں',
      one: '1 رکاوٹ',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'یہ سادہ تر ہو سکتا ہے';

  @override
  String get toolDescriptionGoalOptimizer =>
      'کیا کمی ہے، کیا رکاوٹ ہے، اور پہلے کیا کرنا ہے۔';

  @override
  String toolSectionStepDependsOn(String step) {
    return '$step کے بعد';
  }

  @override
  String get toolSectionThePlan => 'منصوبہ';

  @override
  String get toolDescriptionActionPlan =>
      'ترتیب وار قدموں کا ایک سلسلہ، جنہیں آپ کاموں میں بدل سکتے ہیں۔';

  @override
  String get toolTitleSmartChecklist => 'چیک لسٹ بنائیں';

  @override
  String get toolDescriptionSmartChecklist =>
      'یہ آپ سے جو کچھ مانگتا ہے، ترتیب کے ساتھ۔';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تفصیلات نہیں ملیں',
      one: '1 تفصیل نہیں ملی',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'یہ آپس میں متضاد ہیں';

  @override
  String get toolTitleMissingInformation => 'کیا کچھ غائب ہے';

  @override
  String get toolDescriptionMissingInformation =>
      'کہاں کمی ہے، اور اس بارے میں کیا پوچھنا ہے۔';

  @override
  String get aiAdapterTimedOut =>
      'اس میں بہت زیادہ وقت لگا، اس لیے اسے روک دیا گیا۔';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'آپ کے AI فراہم کنندہ سے محفوظ کنکشن ناکام رہا۔';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action کو وہ ماڈل یا endpoint نہیں مل سکا۔';

  @override
  String get aiAdapterRequestRejected =>
      'آپ کے AI فراہم کنندہ نے وہ درخواست مسترد کر دی۔';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action اس ڈیوائس کی محفوظ ذخیرہ گاہ نہ کھول سکا۔';

  @override
  String get aiAdapterEndpointMissing =>
      'ترتیبات میں اپنے AI endpoint کا پتہ شامل کریں۔';

  @override
  String get aiAdapterReplyIncomplete =>
      'وہ جواب نامکمل تھا۔ دوبارہ کوشش کریں۔';

  @override
  String get aiAdapterContentDeclined =>
      'آپ کے فراہم کنندہ نے اُس مواد پر کارروائی سے انکار کر دیا۔';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'یہ ایک ساتھ $limit سے زیادہ فائلیں ہیں۔ کم چنیں۔';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'ان تصاویر میں سے ایک تجزیے کے لیے بہت بڑی ہے۔';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '”$filename“ تجزیے کے لیے بہت بڑی ہے۔ حد $limit MB ہے۔';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '”$filename“ میں $count صفحات ہیں۔ Action ایک بار میں زیادہ سے زیادہ $limit پڑھتا ہے — صفحات کا کوئی ایک حصہ چنیں۔';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'آپ کا چنا ہوا مواد اتنا زیادہ ہے کہ ایک ہی درخواست میں نہیں بھیجا جا سکتا۔';

  @override
  String get toolRunNotAvailableTitle => 'وہ آلہ دستیاب نہیں';

  @override
  String get toolRunNotAvailableMessage =>
      'ہو سکتا ہے اسے Action کے کسی نئے ورژن میں ہٹا دیا گیا ہو۔';

  @override
  String get toolRunNoSourcesYet =>
      'ابھی کام کرنے کو کچھ نہیں۔ کچھ کیپچر کریں، یا نیچے کچھ متن چسپاں کریں۔';

  @override
  String get toolRunChooseSourcesToCompare => 'چنیں کہ کن کا موازنہ کرنا ہے';

  @override
  String get toolRunChooseSource => 'کوئی ماخذ چنیں';

  @override
  String get toolRunQuestionLabel => 'آپ کا سوال';

  @override
  String get toolRunQuestionHint => 'آخری تاریخ کیا ہے؟';

  @override
  String get toolRunFreeTextLabel => 'یا کچھ متن چسپاں کریں';

  @override
  String get toolRunFreeTextHint => 'یہاں چسپاں کریں یا ٹائپ کریں';

  @override
  String get toolRunModeLabel => 'انداز';

  @override
  String get toolRunRunLocally => 'اسی ڈیوائس پر جانچیں';

  @override
  String get toolRunRun => 'چلائیں';

  @override
  String get toolRunStop => 'روکیں';

  @override
  String get toolRunRunAgain => 'دوبارہ چلائیں';

  @override
  String get toolRunWorkingOn => 'جس پر کام ہو رہا ہے:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'یہ $provider کو بھیجیں؟';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'آپ کا چنا ہوا مواد کارروائی کے لیے $provider کو بھیجا جائے گا، آپ ہی کی API کلید سے۔';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'آپ کی کلید اسی ڈیوائس پر رہتی ہے۔ Action پس منظر میں کچھ نہیں بھیجتا، اور آپ کے دوسرے کام یا ماخذ بھی نہیں بھیجتا۔';

  @override
  String get toolRunScopeTitle => 'چلنے سے پہلے';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات',
      one: '1 صفحے',
    );
    return '$_temp0 کا تجزیہ آپ کے $provider کنکشن سے کیا جائے گا۔';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فائلوں',
      one: '1 فائل',
    );
    return '$_temp0 کا تجزیہ آپ کے $provider کنکشن سے کیا جائے گا۔';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'آپ کا چنا ہوا متن آپ کے $provider کنکشن کو بھیجا جائے گا۔';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'یہ آلہ استعمال کرنے کے لیے کوئی AI فراہم کنندہ جوڑیں';

  @override
  String get toolRunNeedsProviderBody =>
      'آپ اپنا ہی فراہم کنندہ اکاؤنٹ اور API کلید استعمال کرتے ہیں۔';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قدموں سے کام بنا دیا گیا۔',
      one: '1 قدم سے کام بنا دیا گیا۔',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قدم شامل کر دیے گئے۔',
      one: '1 قدم شامل کر دیا گیا۔',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قدم',
      one: '1 قدم',
    );
    return 'کام بنائیں · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قدم',
      one: '1 قدم',
    );
    return 'اس کام میں شامل کریں · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'تصویر';

  @override
  String get sourceTypeLabelScreenshot => 'اسکرین شاٹ';

  @override
  String get sourceTypeLabelPastedText => 'چسپاں کی گئی تحریر';

  @override
  String get sourceTypeLabelDocument => 'دستاویز';

  @override
  String get toolModeClearer => 'زیادہ واضح';

  @override
  String get toolModeMoreProfessional => 'زیادہ پیشہ ورانہ';

  @override
  String get toolModeShorter => 'زیادہ مختصر';

  @override
  String get toolModeSimpler => 'زیادہ سادہ';

  @override
  String get toolModeMoreStructured => 'زیادہ منظم';

  @override
  String get toolModeMorePersuasive => 'زیادہ قائل کن';

  @override
  String get toolModeGrammarOnly => 'صرف قواعد';

  @override
  String get toolModeProfessional => 'پیشہ ورانہ';

  @override
  String get toolModeConcise => 'مختصر';

  @override
  String get toolModeFriendly => 'دوستانہ';

  @override
  String get toolModeFormal => 'رسمی';

  @override
  String get toolModeAskForClarification => 'وضاحت طلب کریں';

  @override
  String get toolModeConfirm => 'موصولی کی اطلاع';

  @override
  String get toolModeDispute => 'اس پر اعتراض کریں';

  @override
  String get toolModeQuick => 'سرسری';

  @override
  String get toolModeDetailed => 'تفصیلی';

  @override
  String get toolModeExecutive => 'فیصلے کے لیے';

  @override
  String get toolModeKeyPoints => 'اہم نکات';

  @override
  String get toolModeActionFocused => 'کام پر مرکوز';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count اقتباس شدہ تفصیلیں آپ کے منتخب کردہ مواد میں نہ مل سکیں، اس لیے انہیں غیر یقینی نشان زد کیا گیا ہے۔',
      one: 'ایک اقتباس شدہ تفصیل آپ کے منتخب کردہ مواد میں نہ مل سکی، اس لیے اسے غیر یقینی نشان زد کیا گیا ہے۔',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action ان اقتباسات کو خود فائل سے ملا کر نہ دیکھ سکا، اس لیے انہیں ملایا نہیں گیا۔';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تاخیر · $count دن',
      one: 'تاخیر · 1 دن',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'کل تک';

  @override
  String get triageBadgeReminderSoon => 'یاد دہانی قریب';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دن کی تاخیر ہو چکی ہے',
      one: 'ایک دن کی تاخیر ہو چکی ہے',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status۔ $title';
  }

  @override
  String get triageExplanationDone => 'یہ مکمل ہے۔';

  @override
  String get triageExplanationNothingPressing =>
      'یہ یہاں اس لیے ہے کہ ابھی اس کی کوئی بات فوری نہیں۔';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'اس پر توجہ درکار ہے کیونکہ $reason۔';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'یہ فہرست میں نیچے اس لیے ہے کیونکہ $reason۔';
  }

  @override
  String get triageReasonOverdue => 'یہ تاخیر کا شکار ہے';

  @override
  String get triageReasonDeadlinePassed => 'اس کی آخری تاریخ گزر چکی ہے';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'اسے $count دن کی تاخیر ہو چکی ہے',
      one: 'اسے ایک دن کی تاخیر ہو چکی ہے',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'اس کی آخری تاریخ آج ہے';

  @override
  String get triageReasonCriticalDueSoon =>
      'آپ نے اسے نہایت اہم نشان زد کیا اور اس کی آخری تاریخ قریب ہے';

  @override
  String get triageReasonAllStepsDone =>
      'سارے قدم مکمل ہیں — بس اسے ختم کرنا باقی ہے';

  @override
  String get triageReasonDueTomorrow => 'اس کی آخری تاریخ کل ہے';

  @override
  String get triageReasonReminderSoon =>
      'آپ نے اس کے لیے اگلے ایک دن کے اندر یاد دہانی مقرر کی ہے';

  @override
  String get triageReasonDueWithinThreeDays =>
      'اس کی آخری تاریخ تین دن کے اندر ہے';

  @override
  String get triageReasonCriticalNoDeadline =>
      'آپ نے اسے نہایت اہم نشان زد کیا، اور اس کی کوئی آخری تاریخ نہیں';

  @override
  String get triageReasonDueWithinSevenDays =>
      'اس کی آخری تاریخ ایک ہفتے کے اندر ہے';

  @override
  String get triageReasonImportant => 'آپ نے اسے اہم نشان زد کیا';

  @override
  String get triageReasonDueLater => 'اس کی آخری تاریخ زیادہ دور ہے';

  @override
  String get triageReasonNoDeadline =>
      'اس کی کوئی آخری تاریخ نہیں اور کوئی بات فوری نہیں';

  @override
  String cardCompletedTooltip(String title) {
    return 'مکمل: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'یہ دستاویز سمجھیں';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'یہ کیا ہے، کیا اہم ہے، اور اس کا کیا کرنا ہے۔';

  @override
  String get toolSectionWhatThisIs => 'یہ کیا ہے';

  @override
  String get toolSectionWhatMatters => 'کیا اہم ہے';

  @override
  String get toolSectionKeyDetails => 'اہم تفصیلات';

  @override
  String get toolTitleAskDocument => 'ماخذ کے بارے میں پوچھیں';

  @override
  String get toolDescriptionAskDocument =>
      'جواب صرف آپ کے منتخب کردہ مواد سے — ورنہ کچھ نہیں۔';

  @override
  String get toolSectionNoAnswer => 'اس مواد میں جواب نہیں ملا';

  @override
  String get toolSectionNoAnswerBody =>
      'Action کو منتخب کردہ دستاویز میں وہ چیز نہیں مل سکی۔';

  @override
  String get toolSectionAnswer => 'جواب';

  @override
  String get toolSectionFromTheDocument => 'دستاویز میں سے';

  @override
  String get toolWarningQuoteNotFound =>
      'اس جواب کے پیچھے موجود اقتباس منتخب کردہ مواد میں نہیں ہے۔ اس جواب کو ناقابلِ اعتبار سمجھیں۔';

  @override
  String get toolTitleSmartSummary => 'خلاصہ کریں';

  @override
  String get toolDescriptionSmartSummary =>
      'مختصر صورت — یا وہ صورت جو بتائے کہ آپ کو کیا کرنا ہے۔';

  @override
  String get toolSectionKeyPoints => 'اہم نکات';

  @override
  String get toolTitleCompareDocuments => 'دستاویزات کا موازنہ کریں';

  @override
  String get toolDescriptionCompareDocuments =>
      'کیا بدلا، کہاں تضاد ہے، کیا موجود نہیں۔';

  @override
  String get toolSectionWhatDiffers => 'کیا مختلف ہے';

  @override
  String get toolSectionConflicts => 'تضادات';

  @override
  String get toolSectionOnlyInOne => 'صرف ایک ہی میں';

  @override
  String get toolSectionInCommon => 'جو مشترک ہے';

  @override
  String get sensitiveKindEmail => 'ای میل پتہ';

  @override
  String get sensitiveKindPhone => 'فون نمبر';

  @override
  String get sensitiveKindPaymentCard => 'ادائیگی کارڈ نمبر';

  @override
  String get sensitiveKindIban => 'بینک اکاؤنٹ (IBAN)';

  @override
  String get sensitiveKindNationalId => 'قومی شناختی نمبر';

  @override
  String get sensitiveKindPostcode => 'پوسٹ کوڈ';

  @override
  String get sensitiveKindAccountNumber => 'اکاؤنٹ نمبر';

  @override
  String get sensitiveKindReference => 'حوالہ نمبر';

  @override
  String get sensitiveKindDateOfBirth => 'تاریخ پیدائش';

  @override
  String get sensitiveKindUrl => 'ویب پتہ';

  @override
  String get verdictVerifiedProvenance => 'اصل کی تصدیق شدہ معلومات دستیاب ہیں';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'اس فائل پر ایک دستخط ہے جسے جانچا گیا اور وہ پورا اترا۔';

  @override
  String get verdictSignalsSynthetic =>
      'ایسی علامتیں جو AI سے بنائے گئے مواد سے مطابقت رکھتی ہیں';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'یہ فائل کہتی ہے کہ اسے کسی تخلیقی آلے سے بنایا گیا۔ میٹا ڈیٹا بدلا یا ہٹایا جا سکتا ہے، اس لیے یہ فائل کا دعویٰ ہے، ثبوت نہیں۔';

  @override
  String get verdictSignalsEdited =>
      'ایسی علامتیں جو ترمیم شدہ مواد سے مطابقت رکھتی ہیں';

  @override
  String get verdictSignalsEditedExplainer =>
      'یہ فائل کہتی ہے کہ یہ کسی ترمیمی سافٹ ویئر سے گزری ہے۔ تصویروں کے لیے یہ عام بات ہے، اور اس سے بذاتِ خود یہ نہیں نکلتا کہ کچھ جعلی بنایا گیا ہے۔';

  @override
  String get verdictNoReliableProvenance =>
      'اصل کے بارے میں کوئی قابلِ اعتماد معلومات نہیں ملیں';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'اس فائل میں اصل کے بارے میں کوئی معلومات نہیں ہیں۔ یہ معمول کی بات ہے — بیشتر سروسیں انہیں ہٹا دیتی ہیں — اور یہ کسی چیز کی علامت نہیں۔';

  @override
  String get verdictInconclusive => 'کوئی حتمی نتیجہ نہیں';

  @override
  String get verdictInconclusiveExplainer =>
      'یہاں اتنی معلومات نہیں کہ بتایا جا سکے یہ کہاں سے آئی۔';

  @override
  String get authenticitySignalCamera => 'کیمرہ';

  @override
  String get authenticitySignalSoftware => 'سافٹ ویئر';

  @override
  String get authenticitySignalDescription => 'تفصیل';

  @override
  String get authenticitySignalCopyright => 'کاپی رائٹ';

  @override
  String get authenticitySignalLocation => 'مقام';

  @override
  String get authenticitySignalLocationValue =>
      'اس فائل میں مقام کا ڈیٹا موجود ہے۔';

  @override
  String get authenticitySignalContentCredentials =>
      'Content Credentials (مواد کی اسناد)';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'جانچا نہیں گیا — اس بلڈ میں دستخط جانچنے والا حصہ موجود نہیں۔';

  @override
  String get authenticitySignalFile => 'فائل';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'تصویر کے طور پر پڑھی نہ جا سکی۔';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'یہ کوئی پہچانا ہوا امیج فارمیٹ نہیں۔';

  @override
  String get authenticitySignalText => 'متن';

  @override
  String get authenticitySignalTextValue =>
      'صرف متن سے بھروسے کے ساتھ یہ نہیں بتایا جا سکتا کہ AI استعمال ہوا یا نہیں۔ Action اندازہ نہیں لگاتا۔';

  @override
  String get fileTypePng => 'ایک PNG تصویر';

  @override
  String get fileTypeJpeg => 'ایک JPEG تصویر';

  @override
  String get fileTypeGif => 'ایک GIF تصویر';

  @override
  String get fileTypeWebp => 'ایک WebP تصویر';

  @override
  String get fileTypeWav => 'ایک WAV ریکارڈنگ';

  @override
  String get fileTypePdf => 'ایک PDF دستاویز';

  @override
  String get fileTypeHeic => 'ایک HEIC تصویر';

  @override
  String get fileTypeVideo => 'ایک ویڈیو فائل';

  @override
  String get fileTypeTiff => 'ایک TIFF تصویر';

  @override
  String get fileTypeBitmap => 'ایک بٹ میپ تصویر';

  @override
  String get fileTypeRtf => 'ایک RTF دستاویز';

  @override
  String get fileTypeZip => 'ایک Zip آرکائیو';

  @override
  String get fileTypeGzip => 'ایک gzip آرکائیو';

  @override
  String get fileTypeSevenZip => 'ایک 7-Zip آرکائیو';

  @override
  String get fileTypeRar => 'ایک RAR آرکائیو';

  @override
  String get fileTypeWindowsProgram => 'ایک Windows پروگرام';

  @override
  String get fileTypeLinuxProgram => 'ایک Linux پروگرام';

  @override
  String get fileTypePostScript => 'ایک PostScript دستاویز';

  @override
  String get fileTypeOgg => 'ایک Ogg ریکارڈنگ';

  @override
  String get fileTypeMp3 => 'ایک MP3 ریکارڈنگ';

  @override
  String get fileTypePlainText => 'سادہ متن';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'اس فائل کا نام \".$extension\" ہے، مگر اس کا مواد $contents ہے۔ یہ سچ مچ کی بھول بھی ہو سکتی ہے، اور کوئی فائل اُس چیز سے کھلنے کا راستہ بھی یہی ہے جس کی آپ کو توقع نہ تھی۔';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count بائٹس',
      one: '1 بائٹ',
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
  String get credentialKindPrivateKey => 'نجی کلید';

  @override
  String get credentialKindApiKey => 'API کلید';

  @override
  String get credentialKindConnectionString => 'کنکشن اسٹرنگ';

  @override
  String get credentialKindAccessToken => 'رسائی ٹوکن';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization ہیڈر';

  @override
  String get credentialKindPasswordOrKey => 'پاس ورڈ یا کلید';

  @override
  String get credentialKindPossibleSecret => 'ممکنہ راز';

  @override
  String get credentialAdvicePrivateKey =>
      'شیئر کرنے سے پہلے اسے ہٹا دیں، اور کلیدوں کا جوڑا بدل دیں۔ نجی کلید ایک بار دیکھ لی جائے تو اسے دوبارہ محفوظ نہیں بنایا جا سکتا۔';

  @override
  String get credentialAdviceProviderApiKey =>
      'یہ کلید اپنے فراہم کنندہ کے ہاں منسوخ کریں اور نئی جاری کروائیں۔ دستاویز سے ہٹا دینے سے یہ بند نہیں ہوتی۔';

  @override
  String get credentialAdviceConnectionString =>
      'اس میں پاس ورڈ بھی ہے اور وہ پتہ بھی جو یہ کھولتا ہے۔ اگر یہ پہلے ہی شیئر ہو چکا ہے تو پاس ورڈ بدل دیں۔';

  @override
  String get credentialAdviceJsonWebToken =>
      'اس طرح کے ٹوکن اکثر ختم ہو جاتے ہیں، مگر ہمیشہ نہیں۔ جب تک آپ کو معلوم نہ ہو کہ یہ کب ختم ہوتا ہے، اسے فعال ہی سمجھیں۔';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'ہیڈر کی قدر ہٹا دیں۔ چسپاں کیے گئے درخواست کے لاگ اُن سب سے عام راستوں میں سے ایک ہیں جن سے کوئی فعال ٹوکن غلطی سے شیئر ہو جاتا ہے۔';

  @override
  String get credentialAdviceKeyedAssignment =>
      'اسے کسی environment variable یا کسی secret store میں منتقل کریں، اور اگر فائل شیئر ہو چکی ہے تو یہ قدر بدل دیں۔';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action یہ نہیں بتا سکتا کہ یہ کیا ہے۔ شیئر کرنے سے پہلے اسے دیکھ لیں — یہ اتنی ہی آسانی سے کوئی شناخت کنندہ یا چیک سم بھی ہو سکتا ہے۔';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API کلید';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI پروجیکٹ کلید';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI طرز کی API کلید';

  @override
  String get credentialLabelGoogleApiKey => 'Google API کلید';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth ٹوکن';

  @override
  String get credentialLabelGitHubToken => 'GitHub ٹوکن';

  @override
  String get credentialLabelSlackToken => 'Slack ٹوکن';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS رسائی کلید ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab ٹوکن';

  @override
  String get credentialLabelNpmToken => 'npm ٹوکن';

  @override
  String get credentialLabelPassphrase => 'پاس فریز';

  @override
  String get credentialLabelPassword => 'پاس ورڈ';

  @override
  String get credentialLabelRefreshToken => 'ریفریش ٹوکن';

  @override
  String get credentialLabelToken => 'ٹوکن';

  @override
  String get credentialLabelClientSecret => 'کلائنٹ سیکریٹ';

  @override
  String get credentialLabelCredential => 'کریڈنشل';

  @override
  String get credentialLabelSecret => 'سیکریٹ';

  @override
  String get linkVerdictNoObviousSignals => 'کوئی نمایاں علامت نہیں';

  @override
  String get linkVerdictWorthChecking => 'جانچ لینا بہتر';

  @override
  String get linkVerdictTreatWithCaution => 'احتیاط سے کام لیں';

  @override
  String get linkSummaryNoObviousSignals =>
      'اس لنک کے لکھے جانے کے انداز میں کچھ غیرمعمولی نہیں۔ یہ جاننے کے برابر نہیں کہ وہ صفحہ قابلِ بھروسا ہے — صرف آپ ہی فیصلہ کر سکتے ہیں کہ آپ کو اس کی توقع تھی یا نہیں۔';

  @override
  String get linkSummaryWorthChecking =>
      'اس لنک کی ایک بات ایسی ہے جسے کھولنے سے پہلے ایک نظر دیکھ لینا بہتر ہے۔';

  @override
  String get linkSummaryTreatWithCaution =>
      'اس لنک کے لکھے جانے کے انداز میں کئی باتیں ایسی ہیں جنہیں کھولنے سے پہلے جانچ لینا بہتر ہے۔';

  @override
  String get linkSignalNotHttps => 'خفیہ کاری کے بغیر';

  @override
  String get linkSignalNonWebScheme => 'ویب لنک نہیں';

  @override
  String get linkSignalEmbeddedCredentials => 'لنک میں پاس ورڈ';

  @override
  String get linkSignalMisleadingAuthority => 'اصل پتہ چھپا ہوا';

  @override
  String get linkSignalIpLiteralHost => 'عددی پتہ';

  @override
  String get linkSignalPunycodeHost => 'نام میں اِنکوڈ شدہ حروف';

  @override
  String get linkSignalMixedScriptHost => 'نام میں ملے جلے رسم الخط';

  @override
  String get linkSignalEncodedHost => 'نام میں ایسکیپ کوڈ';

  @override
  String get linkSignalUnusualPort => 'غیرمعمولی پورٹ';

  @override
  String get linkSignalDeepSubdomain => 'نام میں بہت سے حصے';

  @override
  String get linkSignalPublicSuffixInSubdomain => 'جانا پہچانا نام غلط جگہ';

  @override
  String get linkSignalShortener => 'مختصر کیا گیا لنک';

  @override
  String get linkSignalExecutableTarget => 'کوئی پروگرام ڈاؤن لوڈ کرتا ہے';

  @override
  String get linkSignalRedirectParameter => 'آپ کو آگے کہیں اور بھیجتا ہے';

  @override
  String get linkSignalVeryLongUrl => 'بہت لمبا';

  @override
  String get linkSignalUnparseable => 'لنک پڑھا نہ جا سکا';

  @override
  String get linkDetailNotHttps =>
      'یہ لنک http استعمال کرتا ہے، اس لیے آپ اُس صفحے میں جو کچھ لکھیں گے وہ راستے میں پڑھا جا سکتا ہے۔';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'یہ کسی ویب صفحے کے بجائے \"$scheme:\" سے کھلتا ہے۔ ہو سکتا ہے یہ کسی دوسری ایپ سے کچھ کرنے کو کہے۔';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'اس لنک کے اندر ایک صارف نام اور پاس ورڈ لکھا ہوا ہے۔ یہ لنک جہاں کہیں شیئر ہو گا، وہ بھی اس کے ساتھ ہی جائیں گے۔';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return '\"@\" سے پہلے کی ہر چیز براؤزر نظرانداز کر دیتا ہے۔ اصل منزل \"$host\" ہے۔';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'یہ \"$host\" پر جاتا ہے — کوئی نام نہیں بلکہ خام پتہ۔ جائز سائٹیں تقریباً ہمیشہ نام استعمال کرتی ہیں۔';
  }

  @override
  String get linkDetailPunycodeHost =>
      'سائٹ کے نام میں غیر رومن حروف ہیں، جو اِنکوڈ شدہ صورت میں رکھے جاتے ہیں۔ بہت سی زبانوں کے لیے یہ بالکل معمول کی بات ہے، اور اسی طریقے سے کوئی نام کسی جانے پہچانے نام جیسا بھی بنایا جا سکتا ہے۔';

  @override
  String get linkDetailMixedScriptHost =>
      'سائٹ کے نام میں رومن حروف کے ساتھ کسی دوسرے رسم الخط کے وہ حروف ملے ہوئے ہیں جو بالکل ویسے ہی دکھتے ہیں۔ اسے حرف بہ حرف پڑھیں۔';

  @override
  String get linkDetailEncodedHost =>
      'سائٹ کے نام میں ایسکیپ کوڈ (فیصد والے کوڈ) موجود ہیں، اور اُن کی جگہ یہ نہیں ہے۔ یہ چھپا سکتے ہیں کہ نام دراصل کیا کہتا ہے۔';

  @override
  String linkDetailUnusualPort(String port) {
    return 'یہ عام پورٹ کے بجائے پورٹ $port پر جُڑتا ہے۔ آزمائشی سرورز کے لیے یہ عام بات ہے اور عوامی سائٹوں کے لیے غیرمعمولی۔';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'نام کے $count حصے ہیں۔ سائٹ کون چلاتا ہے یہ صرف آخری دو حصے طے کرتے ہیں؛ باقی کچھ بھی رکھے جا سکتے ہیں۔',
      one:
          'نام کا $count حصہ ہے۔ سائٹ کون چلاتا ہے یہ صرف آخری دو حصے طے کرتے ہیں؛ باقی کچھ بھی رکھے جا سکتے ہیں۔',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'اس نام کے بیچ میں \".$suffix.\" موجود ہے، جس سے شروع کا حصہ ہی سائٹ لگنے لگتا ہے۔ سائٹ دراصل \"$host\" ہے۔';
  }

  @override
  String get linkDetailShortener =>
      'لنک مختصر کرنے والی سروس اصل منزل چھپا دیتی ہے۔ اسے کھولے بغیر آپ یہ جان ہی نہیں سکتے کہ یہ کہاں جاتا ہے۔';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'یہ لنک \"$fileExtension\" پر ختم ہوتا ہے، اس لیے یہ پڑھنے کے لیے کوئی صفحہ نہیں بلکہ ایسی چیز ڈاؤن لوڈ کرتا ہے جو آپ کی ڈیوائس پر چل سکتی ہے۔';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'اس لنک کی \"$parameter\" ترتیب میں ایک دوسرا پتہ بھی موجود ہے، اس لیے اسے کھولنے پر ہو سکتا ہے آپ \"$host\" کے بجائے کہیں اور پہنچ جائیں۔';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'لمبے لنک پڑھنا زیادہ مشکل ہوتا ہے، اور جو حصہ منزل طے کرتا ہے وہ نظر سے باہر دھکیلا جا سکتا ہے۔';

  @override
  String get linkDetailUnparseable =>
      'Action اسے ویب پتے کے طور پر نہ پڑھ سکا۔ ایسے لنکوں کے ساتھ محتاط رہیں جو لنک جیسے نہیں لگتے۔';

  @override
  String get toolTitleRedaction => 'حساس تفصیلات چھپائیں';

  @override
  String get toolDescriptionRedaction =>
      'ڈھونڈیں کہ کیا شیئر نہیں ہونا چاہیے، اور ایک ایسی نقل بنائیں جس میں وہ نہ ہو۔';

  @override
  String get toolSectionRedactionNothingToScan => 'اسکین کرنے کو کچھ نہیں';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'یہ آلہ متن پڑھتا ہے۔ کوئی نوٹ، کوئی چسپاں کیا گیا پیغام، یا ایسا کیپچر چنیں جس کا متن پڑھا جا چکا ہو۔';

  @override
  String get toolSectionRedactionNothingFound => 'کوئی نمایاں چیز نہیں ملی';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action کو اس متن میں کوئی ای میل پتہ، فون نمبر، کارڈ نمبر یا حوالہ نمبر نہیں ملا۔';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count چیزیں جنہیں چھپانا بہتر ہے',
      one: '1 چیز جسے چھپانا بہتر ہے',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'حذف شدہ تفصیلات والی نقل';

  @override
  String get toolWarningRedactionCoverage =>
      'یہ ای میل، فون نمبر اور اکاؤنٹ نمبر جیسے سانچے ڈھونڈتا ہے۔ یہ ہر حساس چیز نہیں پکڑ سکے گا — شیئر کرنے سے پہلے نقل خود پڑھ لیں۔';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action تصاویر یا PDF فائلوں سے تفصیلات حذف نہیں کر سکتا۔ تصویر میں کسی چیز کو ڈھانپنے سے اصل چیز اس کے نیچے موجود رہے گی، اس لیے یہ سہولت دی ہی نہیں جاتی۔';

  @override
  String get toolTitleAuthenticity => 'جانچیں کہ یہ کہاں سے آیا';

  @override
  String get toolDescriptionAuthenticity =>
      'کوئی فائل اپنے ماخذ کے بارے میں خود کیا دعویٰ کرتی ہے۔';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'جانچنے کو کچھ نہیں';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'کوئی تصویر یا کچھ متن منتخب کریں۔';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'یہ فائل خود اپنے بارے میں کیا کہتی ہے';

  @override
  String get toolSectionAuthenticityFileItself => 'فائل بذاتِ خود';

  @override
  String get toolSectionFileContents => 'مواد';

  @override
  String get toolSectionFileUnknownFormat => 'ایسا فارمیٹ جو Action نہیں جانتا';

  @override
  String get toolSectionFileSize => 'حجم';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'یہ وہی بتاتا ہے جو کوئی فائل خود اپنے بارے میں کہتی ہے۔ میٹا ڈیٹا میں ترمیم ہو سکتی ہے یا اسے ہٹایا جا سکتا ہے، اس لیے اس میں سے کوئی چیز ثبوت نہیں۔ اس کی بنیاد پر کسی پر الزام نہ لگائیں۔';

  @override
  String get toolTitleCredentialScanner => 'کلیدیں اور پاس ورڈ تلاش کریں';

  @override
  String get toolDescriptionCredentialScanner =>
      'کچھ شیئر کرنے سے پہلے کریڈنشل ڈھونڈ لیں۔';

  @override
  String get toolSectionCredentialNothingToCheck => 'جانچنے کو کوئی متن نہیں';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'کچھ متن چسپاں کریں، یا ایسا کیپچر چنیں جس کا متن پڑھا جا چکا ہو۔ یہ آلہ صرف متن پڑھتا ہے۔';

  @override
  String get toolSectionCredentialNoneFound => 'کوئی کریڈنشل نہیں ملا';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action کو اس متن میں ایسی کوئی چیز نہیں ملی جس کی ساخت API کلید، پرائیویٹ کلید، ٹوکن یا پاس ورڈ جیسی ہو۔';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کریڈنشل ملے',
      one: '1 کریڈنشل ملا',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count چیزیں جو شاید سیکریٹ ہوں',
      one: '1 چیز جو شاید سیکریٹ ہو',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'وہ نقل جس سے کریڈنشل ہٹا دیے گئے';

  @override
  String get toolWarningCredentialRevoke =>
      'کسی دستاویز سے کلید ہٹا دینے سے وہ کلید بےکار نہیں ہو جاتی۔ اگر ان میں سے کوئی پہلے ہی شیئر ہو چکی ہے تو اسے فراہم کنندہ کے ہاں منسوخ کریں اور نئی جاری کروائیں۔';

  @override
  String get toolWarningCredentialCoverage =>
      'یہ ایسے کریڈنشل ڈھونڈتا ہے جن کی ساخت پہچانی جا سکتی ہو۔ جملے کے اندر لکھا ہوا پاس ورڈ نہیں ملے گا، اس لیے متن خود بھی پڑھیں۔';

  @override
  String get toolTitleLinkInspector => 'کوئی لنک جانچیں';

  @override
  String get toolDescriptionLinkInspector =>
      'کوئی پتہ کھولنے سے پہلے ہی کیا کچھ ظاہر کر دیتا ہے۔';

  @override
  String get toolSectionLinkNoneFound => 'کوئی لنک نہیں ملا';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'کوئی لنک چسپاں کریں، یا ایسا کیپچر چنیں جس میں کوئی لنک ہو۔';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'اس متن میں $count لنک',
      one: 'اس متن میں موجود لنک',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'پڑھا نہ جا سکا';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary۔ $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'ان کے لکھے جانے کے انداز میں کچھ غیرمعمولی نہیں';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'یہ جاننے کے برابر نہیں کہ وہ صفحات قابلِ بھروسا ہیں۔ صرف آپ ہی فیصلہ کر سکتے ہیں کہ آپ کو ان کی توقع تھی یا نہیں۔';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action صرف پتہ پڑھتا ہے۔ وہ نہ لنک کھولتا ہے، نہ سائٹ کے بارے میں کہیں پوچھتا ہے، اور نہ ساکھ جانچنے والی کسی سروس سے رجوع کرتا ہے — ایسا کرنے سے آپ کی براؤزنگ کہیں اور پہنچ جاتی۔';

  @override
  String get toolWarningLinkNoSignals =>
      'جس لنک پر کوئی علامت نہ ملے وہ بھی نقصان دہ ہو سکتا ہے۔ یہ پتے کے لکھے جانے کے انداز میں خرابیاں ڈھونڈتا ہے، اور یہ سب کچھ نہیں جو اس کی منزل کے بارے میں جاننا چاہیے۔';

  @override
  String get toolSectionObjective => 'آپ کا مقصود';

  @override
  String get toolSectionCurrentState => 'اب تک کی صورتِ حال';

  @override
  String get toolSectionRecommendedNextStep => 'تجویز کردہ اگلا قدم';

  @override
  String get toolSectionCredentialAdvice => 'کیا کرنا ہے';

  @override
  String get toolSectionSummary => 'خلاصہ';

  @override
  String get toolDetailSeparator => ' · ';
}
