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
      'دو آلات کبھی کچھ نہیں بھیجتے: حساس تفصیلات چھپانا، اور یہ جانچنا کہ کوئی فائل کہاں سے آئی۔ دونوں مکمل طور پر اسی ڈیوائس پر چلتے ہیں۔';

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
}
