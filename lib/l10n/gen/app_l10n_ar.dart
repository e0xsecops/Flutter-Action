// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppL10nAr extends AppL10n {
  AppL10nAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonDone => 'تم';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get commonBack => 'رجوع';

  @override
  String get commonRetry => 'أعد المحاولة';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonRemove => 'إزالة';

  @override
  String get commonContinue => 'متابعة';

  @override
  String get commonOpen => 'فتح';

  @override
  String get commonCopy => 'نسخ';

  @override
  String get commonCopied => 'تم النسخ';

  @override
  String get commonEdit => 'تعديل';

  @override
  String get commonAdd => 'إضافة';

  @override
  String get commonOn => 'مفعّل';

  @override
  String get commonOff => 'متوقف';

  @override
  String get commonUnknown => 'غير معروف';

  @override
  String get commonChecking => 'جارٍ التحقق…';

  @override
  String get commonSettings => 'الإعدادات';

  @override
  String get commonDismiss => 'تجاهل';

  @override
  String get commonUndo => 'تراجع';

  @override
  String get commonSkip => 'تخطٍّ';

  @override
  String get commonNotNow => 'ليس الآن';

  @override
  String get commonSomethingWentWrong => 'حدث خطأ ما.';

  @override
  String get navToday => 'اليوم';

  @override
  String get navLibrary => 'المكتبة';

  @override
  String get navIntelligence => 'الذكاء';

  @override
  String get navSearch => 'بحث';

  @override
  String get navCapture => 'التقاط شيء';

  @override
  String get todayGreetingMorning => 'صباح الخير';

  @override
  String get todayGreetingAfternoon => 'طاب يومك';

  @override
  String get todayGreetingEvening => 'مساء الخير';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'تعذّر تحميل إجراءاتك. وهي ما زالت مخزّنة على هذا الجهاز.';

  @override
  String get todaySectionNeedsAttention => 'يحتاج انتباهك';

  @override
  String get todaySectionAlsoNeedsAttention => 'يحتاج انتباهك أيضًا';

  @override
  String get todaySectionWaitingForReview => 'بانتظار المراجعة';

  @override
  String get todaySectionComingUp => 'قادم قريبًا';

  @override
  String todaySeeAllCaptures(int count) {
    return 'عرض كل الالتقاطات ($count)';
  }

  @override
  String get todaySeeAllInLibrary => 'عرض الكل في المكتبة';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مكتمل',
      many: '$count مكتملًا',
      few: '$count مكتملة',
      two: 'مكتملان',
      one: 'مكتمل واحد',
      zero: 'لا شيء مكتمل',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count إجراء مكتمل. افتح المكتبة.',
      many: '$count إجراءً مكتملًا. افتح المكتبة.',
      few: '$count إجراءات مكتملة. افتح المكتبة.',
      two: 'إجراءان مكتملان. افتح المكتبة.',
      one: 'إجراء واحد مكتمل. افتح المكتبة.',
      zero: 'لا إجراءات مكتملة. افتح المكتبة.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'ابدأ بـ';

  @override
  String get todayQuickPhoto => 'صورة';

  @override
  String get todayQuickScreenshot => 'لقطة شاشة';

  @override
  String get todayQuickText => 'نص';

  @override
  String get todayQuickTools => 'افحص رابطًا، أو ابحث عن مفاتيح داخل نص';

  @override
  String get briefBadgeNeedsYou => 'يحتاجك';

  @override
  String get briefBadgeToReview => 'للمراجعة';

  @override
  String get briefBadgeAhead => 'أمامك';

  @override
  String get briefBadgeStartHere => 'ابدأ من هنا';

  @override
  String get briefBadgeClear => 'لا شيء معلّق';

  @override
  String get briefNext => 'التالي';

  @override
  String briefOpenAction(String title) {
    return 'فتح $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'تعليم \"$title\" كمنجز';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count إجراء يحتاج انتباهك',
      many: '$count إجراءً يحتاج انتباهك',
      few: '$count إجراءات تحتاج انتباهك',
      two: 'إجراءان يحتاجان انتباهك',
      one: 'إجراء واحد يحتاج انتباهك',
      zero: 'لا شيء يحتاج انتباهك',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count التقاط بانتظار المراجعة أيضًا.',
      many: '$count التقاطًا بانتظار المراجعة أيضًا.',
      few: '$count التقاطات بانتظار المراجعة أيضًا.',
      two: 'التقاطان بانتظار المراجعة أيضًا.',
      one: 'التقاط واحد بانتظار المراجعة أيضًا.',
      zero: 'لا التقاطات بانتظار المراجعة.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count التقاط بانتظارك',
      many: '$count التقاطًا بانتظارك',
      few: '$count التقاطات بانتظارك',
      two: 'التقاطان بانتظارك',
      one: 'التقاط واحد بانتظارك',
      zero: 'لا التقاطات بانتظارك',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'لا شيء متأخر.';

  @override
  String get briefHeadlineNothingToday => 'لا شيء يحتاجك اليوم';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count إجراء قادم.',
      many: '$count إجراءً قادمًا.',
      few: '$count إجراءات قادمة.',
      two: 'إجراءان قادمان.',
      one: 'إجراء واحد قادم.',
      zero: 'لا إجراءات قادمة.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'لا شيء معلّق لديك';

  @override
  String get briefDetailClear => 'لا شيء مستحق ولا شيء بالانتظار.';

  @override
  String get briefHeadlineFirstRun => 'ابدأ بأي شيء';

  @override
  String get briefDetailFirstRun =>
      'رسالة، لقطة شاشة، ملاحظة — وAction يستنتج ما هي.';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsSectionPersonalise => 'التخصيص';

  @override
  String get settingsAppearance => 'المظهر';

  @override
  String get settingsAppearanceDescription => 'فاتح، داكن، أو ما يفعله الجهاز.';

  @override
  String get settingsLanguageDescription => 'اللغة التي يخاطبك بها Action.';

  @override
  String get appearanceSystem => 'النظام';

  @override
  String get appearanceLight => 'فاتح';

  @override
  String get appearanceDark => 'داكن';

  @override
  String get appearanceSystemDescription => 'اتّبع إعداد الجهاز';

  @override
  String get appearanceLightDescription => 'فاتح دائمًا';

  @override
  String get appearanceDarkDescription => 'داكن دائمًا';

  @override
  String get languageTitle => 'اللغة';

  @override
  String get languageSubtitle =>
      'يسري التغيير فورًا. لا يُرسَل شيء إلى أي جهة؛ يُحفَظ الاختيار على هذا الجهاز.';

  @override
  String get languageSectionChoose => 'اختر لغة';

  @override
  String get languageSystem => 'النظام';

  @override
  String get languageSystemDescription => 'اتّبع لغة الجهاز';

  @override
  String get languageDraftNote =>
      'الإنجليزية هي اللغة التي كُتبت بها نصوص Action. أمّا الترجمات الأخرى فقد صيغت وفق مسرد ثابت وفُحصت آليًا، ولم يراجعها بعدُ ناطق أصلي. وحيثما كانت دقة الصياغة مهمة — الخصوصية، الأمان، وما يقوله Action وما يمتنع عن قوله — تبقى الإنجليزية هي المرجع.';

  @override
  String get settingsIntelligenceFootnote =>
      'يعمل Action من دون ذكاء اصطناعي. وربط مزوّدك الخاص يضيف أدوات تحليل المستندات والتخطيط والصياغة.';

  @override
  String get settingsAiProvider => 'مزوّد الذكاء الاصطناعي';

  @override
  String get settingsAiNotConnected =>
      'غير مرتبط. استخدم حسابك ومفتاح API الخاص بك.';

  @override
  String settingsAiConnected(String provider) {
    return 'مرتبط بـ $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'الخصوصية والأمان';

  @override
  String get settingsSecurity => 'الأمان';

  @override
  String get settingsWhereInfoLives => 'أين تعيش معلوماتك';

  @override
  String get settingsWhereInfoLivesDescription =>
      'ما يبقى على هذا الجهاز، وما لا يبقى.';

  @override
  String get protectionAppLock => 'قفل التطبيق';

  @override
  String get protectionScreenPrivacy => 'خصوصية الشاشة';

  @override
  String get protectionPrivateReminders => 'التذكيرات الخاصة';

  @override
  String get protectionSummaryNone =>
      'قفل التطبيق، وخصوصية الشاشة، وما يغادر هذا الجهاز.';

  @override
  String protectionSummaryOne(String first) {
    return '$first مفعّل.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first و$second مفعّلان.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first و$second و$third مفعّلة.';
  }

  @override
  String get settingsSectionReminders => 'التذكيرات';

  @override
  String get settingsRemindersFootnote =>
      'قد يصل التذكير من أندرويد بعد الوقت الذي حدّدته بقليل، بحسب إعدادات البطارية وطريقة استخدام الجهاز.';

  @override
  String get settingsNotifications => 'الإشعارات';

  @override
  String get settingsNotificationsOnDescription =>
      'يمكن عرض التذكيرات التي تضبطها.';

  @override
  String get settingsNotificationsOffDescription =>
      'معطّلة لتطبيق Action، لذا لن تظهر التذكيرات.';

  @override
  String get settingsNotificationsUnknown => 'تعذّر التحقق.';

  @override
  String get settingsNotificationsAllowed => 'مسموح';

  @override
  String get settingsOpenSystemSettings => 'فتح الإعدادات';

  @override
  String get settingsActionFootnote =>
      'يحوّل Action المعلومات المبعثرة إلى خطوات تالية واضحة. وأنت تؤكّد كل شيء قبل حفظه.';

  @override
  String get settingsHelp => 'المساعدة';

  @override
  String get settingsHelpDescription => 'كيف يعمل Action، وما الذي لن يفعله.';

  @override
  String get settingsVersion => 'الإصدار';
}
