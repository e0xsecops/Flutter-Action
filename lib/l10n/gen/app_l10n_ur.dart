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
}
