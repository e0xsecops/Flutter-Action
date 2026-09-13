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
  String get ocrScriptTitle => 'التعرّف على النص';

  @override
  String get ocrScriptSubtitle =>
      'نظام الكتابة الذي يقرأه Action في الصورة. يجري التعرّف على هذا الجهاز؛ ولا يُرسل أي التقاط إلى أي جهة لقراءته.';

  @override
  String get ocrScriptSectionChoose => 'نظام الكتابة';

  @override
  String get ocrScriptFollowLanguage => 'اتّبع لغة التطبيق';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'حاليًا $script';
  }

  @override
  String get ocrScriptLatin => 'اللاتينية';

  @override
  String get ocrScriptChinese => 'الصينية';

  @override
  String get ocrScriptDevanagari => 'الديفاناغارية';

  @override
  String get ocrScriptJapanese => 'اليابانية';

  @override
  String get ocrScriptKorean => 'الكورية';

  @override
  String get ocrScriptLatinDescription =>
      'الإنجليزية والإسبانية والفرنسية والألمانية وبقية اللغات المكتوبة بحروف لاتينية.';

  @override
  String get ocrScriptChineseDescription => 'الصينية المبسّطة والتقليدية.';

  @override
  String get ocrScriptDevanagariDescription =>
      'الهندية والماراثية والنيبالية. وليست البنغالية ولا التاميلية ولا التيلوغوية — لكل واحدة منها نظام كتابة مختلف.';

  @override
  String get ocrScriptJapaneseDescription => 'اليابانية.';

  @override
  String get ocrScriptKoreanDescription => 'الكورية.';

  @override
  String get ocrScriptFootnote =>
      'كل خيار عدا اللاتينية يقرأ الحروف اللاتينية أيضًا، فاختيار أحدها يضيف نظام كتابة ولا يستبدله. ويسري التغيير على الصور المُلتقطة من الآن فصاعدًا، لا على ما قُرئ من قبل.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'لا يستطيع Action قراءة كتابة $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'لا يوجد لها محرك تعرّف على الجهاز. ستظل الصور تُقرأ في كل ما كُتب بحروف لاتينية، وسيعود الباقي فارغًا. ويمكنك كتابة ذلك النص أو لصقه بدلًا من ذلك.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action مضبوط على قراءة $script. إن كانت هذه الصورة بنظام كتابة آخر، فغيّره في الإعدادات ثم اقرأها من جديد.';
  }

  @override
  String get settingsTextRecognition => 'التعرّف على النص';

  @override
  String get settingsTextRecognitionDescription =>
      'نظام الكتابة الذي يقرأه Action من الصور.';

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

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'الآن';

  @override
  String relativeMinutes(int count) {
    return 'قبل $count د';
  }

  @override
  String relativeHours(int count) {
    return 'قبل $count س';
  }

  @override
  String get relativeYesterday => 'أمس';

  @override
  String relativeDays(int count) {
    return 'قبل $count ي';
  }

  @override
  String get libraryTitle => 'المكتبة';

  @override
  String get librarySubtitle =>
      'كل ما يحتفظ به Action من أجلك. وكله يبقى على هذا الجهاز.';

  @override
  String get librarySegmentActions => 'الإجراءات';

  @override
  String get librarySegmentCaptures => 'الالتقاطات';

  @override
  String get librarySegmentGoals => 'الأهداف';

  @override
  String get librarySegmentDone => 'المنجَز';

  @override
  String get libraryNewGoal => 'هدف جديد';

  @override
  String get libraryNoGoalsTitle => 'لا أهداف بعد';

  @override
  String get libraryNoGoalsMessage =>
      'الهدف شيء تريد أن يحدث. ويستطيع Action أن يجد ما ينقصه، وما يعوقه، وما تبدأ به.';

  @override
  String get libraryNoDoneTitle => 'لم يكتمل شيء بعد';

  @override
  String get libraryNoDoneMessage => 'الإجراءات التي تنهيها ستُحفَظ هنا.';

  @override
  String get libraryNoOpenTitle => 'لا إجراءات مفتوحة';

  @override
  String get libraryNoOpenMessage =>
      'التقط شيئًا وسيستنتج Action ما يلزم عمله.';

  @override
  String get libraryNoCapturesTitle => 'لم يُلتقط شيء بعد';

  @override
  String get libraryNoCapturesMessage =>
      'الصور ولقطات الشاشة والنصوص التي تضيفها تصل إلى هنا أولًا. ولا يُحلَّل شيء حتى تطلب ذلك.';

  @override
  String get libraryGoalNoActions => 'لم يُنشأ منه شيء بعد';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count إجراء من هذا الهدف',
      many: '$count إجراءً من هذا الهدف',
      few: '$count إجراءات من هذا الهدف',
      two: 'إجراءان من هذا الهدف',
      one: 'إجراء واحد من هذا الهدف',
      zero: 'لا إجراءات من هذا الهدف',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'ابحث في الإجراءات والالتقاطات';

  @override
  String get searchClear => 'مسح';

  @override
  String get searchPrivacyNote =>
      'البحث يجري على هذا الجهاز. ولا يغادره شيء مما تكتبه هنا.';

  @override
  String get searchYouCanSearch => 'يمكنك البحث في';

  @override
  String get searchFieldTitles => 'العناوين';

  @override
  String get searchFieldTitlesExample => 'تجديد تأمين السيارة';

  @override
  String get searchFieldReferences => 'الأرقام المرجعية';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'الجهات';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'الخطوات داخل الإجراء';

  @override
  String get searchFieldStepsExample => 'ارفع النموذج';

  @override
  String get searchFieldCaptureText => 'النص المقروء من الالتقاط';

  @override
  String get searchFieldCaptureTextExample => 'إشعار التجديد';

  @override
  String searchNoMatchesTitle(String query) {
    return 'لا نتائج لـ \"$query\"';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'جرّب كلمات أقل، أو رقمًا مرجعيًا كما يظهر تمامًا.';

  @override
  String get searchNoMatchesClearFilters =>
      'جرّب كلمات أقل، أو امسح عوامل التصفية.';

  @override
  String get searchFilterActive => 'نشط';

  @override
  String get searchFilterCompleted => 'مكتمل';

  @override
  String get searchFilterOverdue => 'متأخر';

  @override
  String get searchFilterThisWeek => 'هذا الأسبوع';

  @override
  String get searchFilterCritical => 'حرِج';

  @override
  String get searchFilterCreatedByYou => 'أنشأته أنت';

  @override
  String get searchFilterArchived => 'مؤرشف';

  @override
  String get searchFilterClear => 'مسح عوامل التصفية';

  @override
  String get searchIncompleteActions =>
      'تعذّر البحث في إجراءاتك، لذا قد تكون هذه النتائج ناقصة.';

  @override
  String get searchIncompleteCaptures =>
      'تعذّر البحث في التقاطاتك، لذا قد تكون هذه النتائج ناقصة.';

  @override
  String get searchIncompleteBoth =>
      'تعذّر البحث في إجراءاتك أو التقاطاتك، لذا قد تكون هذه النتائج ناقصة.';

  @override
  String get searchMatchTitle => 'العنوان';

  @override
  String get searchMatchNextStep => 'الخطوة التالية';

  @override
  String get searchMatchStep => 'خطوة';

  @override
  String get searchMatchSummary => 'الملخّص';

  @override
  String get searchMatchFromCapture => 'من الالتقاط';

  @override
  String get studioSuggested => 'مقترح لآخر التقاط لديك';

  @override
  String get studioRecentlyUsed => 'استُخدم مؤخرًا';

  @override
  String get studioReady => 'جاهز';

  @override
  String get studioNotConnected => 'غير مرتبط';

  @override
  String get studioHeroTitle => 'ذكاء Action';

  @override
  String get studioConnectedBlurb =>
      'افهم مستندًا، حسّن هدفًا، ابنِ خطة، اكتب مسودة رد، أو افحص ما تنظر إليه.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count أداة لفهم المستندات والتخطيط والكتابة. اربط حساب الذكاء الاصطناعي الخاص بك لاستخدامها — يحاسبك مزوّدك، ولا يحاسبك Action أبدًا.';
  }

  @override
  String get studioConnectAi => 'ربط الذكاء الاصطناعي';

  @override
  String get studioHowItWorks => 'كيف يعمل';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count منها تعمل أصلًا دون أي من ذلك، على هذا الجهاز بالكامل.',
      many: '$count منها تعمل أصلًا دون أي من ذلك، على هذا الجهاز بالكامل.',
      few: '$count منها تعمل أصلًا دون أي من ذلك، على هذا الجهاز بالكامل.',
      two: 'اثنتان منها تعملان أصلًا دون أي من ذلك، على هذا الجهاز بالكامل.',
      one: 'واحدة منها تعمل أصلًا دون أي من ذلك، على هذا الجهاز بالكامل.',
      zero: 'لا أداة منها تعمل دون ذلك.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'يعمل على هذا الجهاز';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description يعمل على هذا الجهاز.';
  }

  @override
  String get categoryUnderstand => 'افهم';

  @override
  String get categoryUnderstandBlurb => 'استوعب ما لديك.';

  @override
  String get categoryPlan => 'خطّط';

  @override
  String get categoryPlanBlurb => 'حوّله إلى شيء يمكنك عمله.';

  @override
  String get categoryCreate => 'أنشئ';

  @override
  String get categoryCreateBlurb => 'اكتبه، حسّنه، ترجمه.';

  @override
  String get categoryExtract => 'استخرج';

  @override
  String get categoryExtractBlurb => 'استخرج التفاصيل المهمة.';

  @override
  String get categoryVerify => 'تحقّق';

  @override
  String get categoryVerifyBlurb => 'افحص ما تنظر إليه.';

  @override
  String get captureSheetTitle => 'التقاط شيء';

  @override
  String get captureSheetSubtitle =>
      'سلّم Action أي شيء تفضّل ألا تقرأه كاملًا.';

  @override
  String get captureTakePhoto => 'التقاط صورة';

  @override
  String get captureTakePhotoSubtitle => 'رسالة أو فاتورة أو إشعار أمامك';

  @override
  String get captureChooseImage => 'اختيار صورة';

  @override
  String get captureChooseImageSubtitle =>
      'لقطة شاشة أو صورة موجودة على هذا الجهاز';

  @override
  String get capturePasteText => 'لصق نص';

  @override
  String get capturePasteTextSubtitle => 'بريد إلكتروني أو رسالة أو إشعار';

  @override
  String get captureChoosePdf => 'اختيار ملف PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'كشف حساب أو رسالة أو نموذج لديك بالفعل';

  @override
  String get captureFootnote =>
      'تبقى الالتقاطات على هذا الجهاز. ولا يُحلَّل شيء عبر الإنترنت حتى تطلب ذلك.';

  @override
  String get captureCouldNotOpen => 'تعذّر فتح ذلك. جرّب طريقة أخرى.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'قيد القراءة';

  @override
  String get stageNeedsReview => 'يحتاج مراجعة';

  @override
  String get stageActionCreated => 'أُنشئ إجراء';

  @override
  String get stageNoText => 'لم يُعثر على نص';

  @override
  String get stageCouldNotBeRead => 'تعذّرت قراءته';

  @override
  String get stageReadingPreview => 'جارٍ قراءة النص…';

  @override
  String get stageFailedPreview => 'تعذّرت قراءة هذا على هذا الجهاز.';

  @override
  String get provenancePhoto => 'مُلتقط من صورة';

  @override
  String get provenanceImage => 'مُلتقط من صورة محفوظة';

  @override
  String get provenancePastedText => 'مُلتقط من نص ملصوق';

  @override
  String get provenanceDocument => 'أُضيف كمستند';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'أُنجز $when';
  }

  @override
  String metaOverdue(String date) {
    return 'متأخر · كان مستحقًا في $date';
  }

  @override
  String get metaDueToday => 'مستحق اليوم';

  @override
  String metaDueOn(String date) {
    return 'مستحق في $date';
  }

  @override
  String get metaCreatedByYou => 'أنشأته أنت';

  @override
  String get categoryPayment => 'دفعة';

  @override
  String get categoryRenewal => 'تجديد';

  @override
  String get categoryAppointment => 'موعد';

  @override
  String get categoryBooking => 'حجز';

  @override
  String get categoryTravel => 'سفر';

  @override
  String get categoryDeadline => 'موعد نهائي';

  @override
  String get categoryResponse => 'يحتاج ردًا';

  @override
  String get categoryDelivery => 'تسليم';

  @override
  String get categoryDocument => 'مستند';

  @override
  String get categoryNoActionRequired => 'لا يلزم إجراء';

  @override
  String get categoryUnsure => 'غير مؤكد';

  @override
  String get errorEnterManually => 'أدخِله يدويًا';

  @override
  String get sourceWhatWeRead => 'ما قرأناه';

  @override
  String get sourceDelete => 'حذف الالتقاط';

  @override
  String get sourceGone => 'لم يعد ذلك الالتقاط متاحًا.';

  @override
  String get sourceDeleteTitle => 'حذف هذا الالتقاط؟';

  @override
  String get sourceDeleteBody =>
      'تُزال الصورة والنص المقروء منها من هذا الجهاز.';

  @override
  String get sourceDeleteKeep => 'إبقاء';

  @override
  String get sourceOpenAction => 'فتح الإجراء';

  @override
  String sourceOpenActions(int count) {
    return 'فتح $count إجراءات';
  }

  @override
  String get sourceCreateAnother => 'إنشاء آخر من هذا';

  @override
  String get sourceCreateAction => 'إنشاء إجراء من هذا';

  @override
  String get sourceDoMore => 'افعل المزيد بهذا';

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
    return '$size ك.ب';
  }

  @override
  String sourceConvertedFrom(String format, String size) {
    return 'من $format $size ك.ب';
  }

  @override
  String get sourceTextFound => 'عُثر على نص';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines سطرًا · $ms م.ث';
  }

  @override
  String get sourceReadExplainer =>
      'هذا هو النص الذي قرأه Action. وما نتج عنه في الأسفل.';

  @override
  String get sourceNotInterpreted =>
      'لم يُفسَّر شيء بعد. سيقترح Action ما يمكن عمله بهذا، وأنت من يؤكّد قبل إنشاء أي شيء.';

  @override
  String get sourceNoTextExplainer =>
      'يحدث هذا مع الخط اليدوي، أو الإضاءة الضعيفة جدًا، أو كتابة لا يستطيع هذا الجهاز قراءتها بعد.';

  @override
  String get sourceReadFailed => 'تعذّرت قراءة هذا';

  @override
  String get sourceReadFailedReason => 'لم يكتمل التعرّف على النص.';

  @override
  String get sourceTryReadingAgain => 'حاول القراءة من جديد';

  @override
  String get sourceTypeInstead => 'اكتب التفاصيل بدلًا من ذلك';

  @override
  String get sourceTypeWhatItSays => 'اكتب ما هو مكتوب';

  @override
  String get sourceTypeHint => 'التواريخ والمبالغ وما هو مطلوب.';

  @override
  String get sourceMadeFromThis => 'أُنشئ من هذا الالتقاط';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count أُنشئت من هذا الالتقاط';
  }

  @override
  String get sourceTheDocument => 'المستند';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحة',
      many: '$count صفحة',
      few: '$count صفحات',
      two: 'صفحتان',
      one: 'صفحة واحدة',
      zero: 'لا صفحات',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'عدد الصفحات غير معروف';

  @override
  String get sourceDocumentNotRead =>
      'لم يقرأ Action ما بداخل هذا المستند. وعندما تشغّل أداة تحتاج إلى ذلك، سيذهب الملف إلى مزوّد الذكاء الاصطناعي الذي وصّلته، وستُبلَّغ قبل حدوث ذلك.';

  @override
  String get previewSaveFailed => 'تعذّر حفظ ذلك. حاول مرة أخرى.';

  @override
  String get previewTitle => 'تحقّق من الالتقاط';

  @override
  String get previewImageFailed => 'تعذّر فتح تلك الصورة.';

  @override
  String get previewHint => 'تأكّد من أن النص مقروء وأن شيئًا مهمًا لم يُقتطع.';

  @override
  String get previewRetake => 'التقاط من جديد';

  @override
  String get pasteTitle => 'لصق نص';

  @override
  String get pasteHint =>
      'الصق البريد أو الرسالة أو الإشعار الذي تفضّل ألا تقرأه كاملًا.';

  @override
  String get pasteFootnote => 'كل ما فيه تاريخ أو مبلغ أو طلب يعطي نتيجة جيدة.';

  @override
  String get pasteEnough => 'يبدو أن هذا يكفي للعمل عليه.';

  @override
  String get pasteMore => 'نص أكثر قليلًا سيعطي نتيجة أفضل.';

  @override
  String get reviewLoadFailed => 'تعذّر تحميل هذا الالتقاط.';

  @override
  String get reviewConfirmed => 'مؤكَّد';

  @override
  String get reviewNeedsReview => 'يحتاج مراجعة';

  @override
  String get reviewReview => 'راجِع';

  @override
  String get reviewHighConfidence => 'ثقة عالية';

  @override
  String get reviewConfirmedByYou => 'أكّدته بنفسك';

  @override
  String get reviewMissing => 'ناقص';

  @override
  String get reviewNotUnderstood =>
      'لم يستطع Action فهم قدر كافٍ من هذا المصدر فهمًا موثوقًا.';

  @override
  String get reviewNotUnderstoodBody =>
      'الالتقاط سليم ولم يضِع شيء. يمكنك إدخال التفاصيل بنفسك، ويبقى المصدر مرفقًا للرجوع إليه.';

  @override
  String get reviewEnterDetails => 'أدخل التفاصيل';

  @override
  String get reviewKeepSource => 'احتفظ بالمصدر لوقت لاحق';

  @override
  String reviewEngine(String engine) {
    return 'المحرك: $engine';
  }

  @override
  String get reviewManualNotice =>
      'أنت من ينشئ هذا الإجراء بنفسك. ولن يُستخدم إلا ما تُدخله هنا.';

  @override
  String get reviewUntitled => 'إجراء بلا عنوان';

  @override
  String get reviewEditTitle => 'تعديل العنوان';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قيمة تحتاج مراجعتك.',
      many: '$count قيمة تحتاج مراجعتك.',
      few: '$count قيم تحتاج مراجعتك.',
      two: 'قيمتان تحتاجان مراجعتك.',
      one: 'قيمة واحدة تحتاج مراجعتك قبل أن يمكن تأكيد هذا.',
      zero: 'لا قيم تحتاج مراجعتك.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'المعلومات الأساسية';

  @override
  String get reviewNotFound => 'غير موجود';

  @override
  String get reviewSuggestedNextStep => 'الخطوة التالية المقترحة';

  @override
  String get reviewWhyThisMatters => 'لماذا هذا مهم';

  @override
  String get reviewSteps => 'الخطوات';

  @override
  String get reviewAddStep => 'أضف خطوة';

  @override
  String get reviewInjectionNotice =>
      'بدا بعض النص في هذا المصدر كأنه تعليمات لا معلومات من المستند، فتجاهله Action.';

  @override
  String get reviewLayoutNotice =>
      'قد يحتوي تخطيط هذا المستند على علاقات لم يستطع استخراج النص الحفاظ عليها كاملة. قارن القيم أدناه بالمصدر قبل التأكيد.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason قارن القيم أدناه بالمصدر.';
  }

  @override
  String get reviewDeadline => 'الموعد النهائي';

  @override
  String get reviewAmount => 'المبلغ';

  @override
  String get reviewLeftUnset => 'لا شيء — اخترت تركه غير محدَّد';

  @override
  String get reviewUnclear => 'غير واضح';

  @override
  String get reviewNotSet => 'غير محدَّد';

  @override
  String get reviewNoDeadlineFound => 'لم يُعثر على أي منه في هذا المستند';

  @override
  String get reviewNoAmountFound => 'لم يُعثر على أي مبلغ في هذا المستند';

  @override
  String get reviewMultipleDates => 'عثر Action على عدة تواريخ محتملة.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count تواريخ قد تكون الموعد النهائي. اختر الصحيح، أو أدخل غيره، أو اتركه غير محدَّد.';
  }

  @override
  String get reviewChooseDate => 'اختر تاريخًا';

  @override
  String get reviewMultipleAmounts => 'عثر Action على أكثر من مبلغ محتمل.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count مبالغ قد يكون أحدها المقصود هنا. اختر واحدًا، أو أدخل غيره، أو اتركه غير محدَّد.';
  }

  @override
  String get reviewChooseAmount => 'اختر مبلغًا';

  @override
  String get reviewSkipStep => 'تخطَّ هذه الخطوة';

  @override
  String get reviewKeepStep => 'أبقِ هذه الخطوة';

  @override
  String get reviewEditStep => 'تعديل الخطوة';

  @override
  String get reviewCreateManually => 'أنشئ يدويًا';

  @override
  String get reviewConfirmAndCreate => 'أكّد وأنشئ الإجراء';

  @override
  String get reviewFixHighlighted => 'راجع الحقول المميّزة';

  @override
  String get reviewSaving => 'جارٍ الحفظ…';

  @override
  String get reviewSaveFailed =>
      'تعذّر حفظ هذا الإجراء. لم يضِع شيء — حاول مرة أخرى.';

  @override
  String get reviewFieldTitle => 'العنوان';

  @override
  String get reviewTitleHint => 'ما الذي يجب أن يحدث؟';

  @override
  String get reviewNewStep => 'خطوة جديدة';

  @override
  String get reviewStepHint => 'ما العمل';

  @override
  String get reviewDatesConflict => 'يذكر المستند أكثر من تاريخ.';

  @override
  String get reviewAmountsConflict => 'يذكر المستند أكثر من مبلغ.';

  @override
  String get reviewAnotherDate => 'تاريخ آخر — 2026-08-30';

  @override
  String get reviewBadDate => 'ليس تاريخًا حقيقيًا. استخدم صيغة 2026-08-30.';

  @override
  String get reviewTypeDate => 'اكتب تاريخًا، أو اتركه غير محدَّد في الأسفل.';

  @override
  String get reviewUseThisDate => 'استخدم هذا التاريخ';

  @override
  String get reviewLeaveNoDeadline => 'المتابعة بلا موعد نهائي';

  @override
  String get reviewAnotherAmount => 'مبلغ آخر — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'لا يمكن استخدام هذا المبلغ: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'استخدم هذا المبلغ';

  @override
  String get reviewLeaveNoAmount => 'المتابعة بلا مبلغ';

  @override
  String get reviewThisValue => 'هذه القيمة';

  @override
  String reviewQuote(String quote) {
    return '«$quote»';
  }

  @override
  String get reviewSeeOnCapture => 'اعرضه على الالتقاط';

  @override
  String get reviewViewSource => 'عرض المصدر';

  @override
  String get reviewFromSource => 'من المصدر';

  @override
  String get reviewNotVerified => 'لم يُطابَق';

  @override
  String get reviewCouldNotVerify => 'تعذّرت مطابقة هذا بالمصدر.';

  @override
  String get reviewLooksRight => 'يبدو صحيحًا';

  @override
  String get reviewStageReading => 'قراءة المصدر';

  @override
  String get reviewStageUnderstanding => 'فهم التفاصيل المهمة';

  @override
  String get reviewStageChecking => 'فحص ما يحتاج إلى مراجعة';

  @override
  String get reviewNothingToDo => 'لا شيء عليك فعله الآن.';

  @override
  String get reviewInformationOnly =>
      'يبدو هذا معلومات فقط — لم يُعثر على موعد نهائي ولا دفعة ولا طلب رد.';

  @override
  String get reviewInformationOnlyWithSource =>
      'يبدو هذا معلومات فقط — لم يُعثر في هذا الالتقاط على موعد نهائي ولا دفعة ولا طلب رد.';

  @override
  String get reviewSourceKept => 'يُحتفظ بالمصدر في الحالتين.';

  @override
  String get reviewAddAnyway => 'أضف إجراءً على أي حال';

  @override
  String get reviewActionConfirmed => 'تم تأكيد الإجراء';

  @override
  String get reviewCreatedByYou => 'أنشأته بنفسك.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'أكّدته بنفسك اعتمادًا على $count معلومة مراجَعة.',
      many: 'أكّدته بنفسك اعتمادًا على $count معلومة مراجَعة.',
      few: 'أكّدته بنفسك اعتمادًا على $count معلومات مراجَعة.',
      two: 'أكّدته بنفسك اعتمادًا على معلومتين مراجَعتين.',
      one: 'أكّدته بنفسك اعتمادًا على معلومة واحدة مراجَعة.',
      zero: 'أكّدته بنفسك.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'أكّدته بنفسك اعتمادًا على $count معلومة مراجَعة. وغيّرت $edited منها.',
      many:
          'أكّدته بنفسك اعتمادًا على $count معلومة مراجَعة. وغيّرت $edited منها.',
      few:
          'أكّدته بنفسك اعتمادًا على $count معلومات مراجَعة. وغيّرت $edited منها.',
      two: 'أكّدته بنفسك اعتمادًا على معلومتين مراجَعتين. وغيّرت $edited منها.',
      one:
          'أكّدته بنفسك اعتمادًا على معلومة واحدة مراجَعة. وغيّرت $edited منها.',
      zero: 'أكّدته بنفسك. وغيّرت $edited منها.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'محفوظ على هذا الجهاز.';

  @override
  String get detailLoadFailed =>
      'تعذّر تحميل هذا الإجراء. وهو ما يزال محفوظًا على هذا الجهاز.';

  @override
  String get detailNotFoundTitle => 'ذلك الإجراء لم يعد هنا';

  @override
  String get detailNotFoundMessage => 'ربما حُذف على هذا الجهاز.';

  @override
  String get detailGoBack => 'رجوع';

  @override
  String get detailMore => 'المزيد';

  @override
  String get detailChangeUrgency => 'تغيير الأولوية';

  @override
  String get detailAddRecommendedStep => 'إضافة خطوة مقترحة';

  @override
  String get detailEditRecommendedStep => 'تعديل الخطوة المقترحة';

  @override
  String get detailArchiveTitle => 'أرشفة هذا الإجراء؟';

  @override
  String get detailArchiveBody =>
      'يخرج من قائمتك لكنه لا يُحذف، ويبقى الالتقاط الذي جاء منه محفوظًا.';

  @override
  String get detailArchiveConfirm => 'أرشفة';

  @override
  String get detailArchived => 'مؤرشف';

  @override
  String detailCompletedOn(String date) {
    return 'اكتمل في $date';
  }

  @override
  String get detailSectionDetails => 'التفاصيل';

  @override
  String get detailSectionReminders => 'التذكيرات';

  @override
  String get detailAllStepsDone => 'كل الخطوات تمّت';

  @override
  String get detailNextEyebrow => 'التالي';

  @override
  String get detailCompleteQuestion => 'إتمام هذا الإجراء؟';

  @override
  String get detailMarkStepDone => 'وضع علامة تمّت على الخطوة';

  @override
  String get detailCompleteAction => 'إتمام هذا الإجراء';

  @override
  String get detailAddDeadline => 'إضافة موعد نهائي';

  @override
  String get detailAddAmount => 'إضافة مبلغ';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed من $total تمّت';
  }

  @override
  String get detailNoStepsTitle => 'لا خطوات بعد';

  @override
  String get detailNoStepsMessage =>
      'قسّم هذا إلى الخطوات التي عليك فعلها بالفعل.';

  @override
  String get detailAddFirstStep => 'إضافة أول خطوة';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'خطوة مكتملة: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'الخطوة التالية: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'خطوة: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'وضع علامة تمّت على «$title»';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'وضع علامة لم تتم على «$title»';
  }

  @override
  String get detailStepOptions => 'خيارات الخطوة';

  @override
  String get detailMoveUp => 'تحريك لأعلى';

  @override
  String get detailMoveDown => 'تحريك لأسفل';

  @override
  String get detailDeleteStep => 'حذف الخطوة';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'حذف هذه الخطوة؟';

  @override
  String get stepDeleteKeep => 'إبقاؤها';

  @override
  String get detailNoRemindersYet => 'لا تذكيرات بعد.';

  @override
  String get detailReminderLimit =>
      'هذا أقصى عدد من التذكيرات لإجراء واحد. أزل واحدًا لإضافة آخر.';

  @override
  String get detailAddReminder => 'إضافة تذكير';

  @override
  String get detailChangeReminder => 'تغيير التذكير';

  @override
  String get detailRemoveReminder => 'إزالة التذكير';

  @override
  String get detailReminderFormat => 'EEE d MMM، h:mm a';

  @override
  String get reminderStatePending => 'لم يُضبط بعد';

  @override
  String get reminderStateNotificationsOff => 'محفوظ، لكن الإشعارات مغلقة';

  @override
  String get reminderStateFailed => 'تعذّرت جدولته';

  @override
  String get reminderStateRemoving => 'جارٍ الإزالة…';

  @override
  String get reminderSetConfirmation => 'ضُبط التذكير. سننبّهك.';

  @override
  String get reminderUpdatedConfirmation => 'حُدّث التذكير.';

  @override
  String get reminderNeedsPermission =>
      'الإشعارات مغلقة، فهذا التذكير محفوظ لكنه لا يستطيع تنبيهك بعد.';

  @override
  String get reminderScheduleFailed =>
      'هذا التذكير محفوظ، لكن أندرويد لم يجدوله.';

  @override
  String get reminderLimitReached =>
      'ذلك الإجراء لديه بالفعل أقصى عدد من التذكيرات.';

  @override
  String get reminderTimeInPast => 'ذلك الوقت قد مضى.';

  @override
  String get reminderAddTitle => 'إضافة تذكير';

  @override
  String get reminderChangeTitle => 'تغيير هذا التذكير';

  @override
  String get reminderDateLabel => 'التاريخ';

  @override
  String get reminderTimeLabel => 'الوقت';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'h:mm a';

  @override
  String get reminderSummaryDateFormat => 'EEEE d MMMM';

  @override
  String get reminderPresetFormat => 'd MMM، h:mm a';

  @override
  String reminderSummary(String date, String time) {
    return 'سيصلك تذكير في $date الساعة $time.';
  }

  @override
  String get reminderTimePastError => 'ذلك الوقت قد مضى. اختر وقتًا لاحقًا.';

  @override
  String get reminderSet => 'ضبط التذكير';

  @override
  String get reminderPresetInHour => 'بعد ساعة';

  @override
  String get reminderPresetTomorrowMorning => 'صباح الغد';

  @override
  String get reminderPresetNextWeek => 'الأسبوع القادم';

  @override
  String get reminderPresetOnTheDay => 'في اليوم نفسه';

  @override
  String get reminderPresetDayBefore => 'قبل يوم واحد';

  @override
  String get reminderPresetWeekBefore => 'قبل أسبوع واحد';

  @override
  String get reminderPresetAtDeadline => 'عند الموعد النهائي';

  @override
  String get reminderPresetHourBefore => 'قبل ساعة واحدة';

  @override
  String get editNextStepTitle => 'الخطوة التالية المقترحة';

  @override
  String get editNextStepSubtitle => 'جملة قصيرة عن الخطوة المفيدة التالية.';

  @override
  String get editNextStepHint => 'ما الخطوة المفيدة التالية؟';

  @override
  String get editRemoveSuggestion => 'إزالة الاقتراح';

  @override
  String get editUrgencyTitle => 'ما مدى إلحاح هذا؟';

  @override
  String get editStepHint => 'شيء واحد ملموس لفعله';

  @override
  String get editAddStep => 'إضافة خطوة';

  @override
  String get editDateHint => 'سسسس-شش-يي';

  @override
  String get editRemoveDeadline => 'إزالة الموعد النهائي';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => 'حفظ المبلغ';

  @override
  String get editRemoveAmount => 'إزالة المبلغ';

  @override
  String get securityTitle => 'الأمان والخصوصية';

  @override
  String get securitySectionProtection => 'الحماية';

  @override
  String get securityAppLockUnavailable =>
      'يحتاج قفل التطبيق إلى قفل شاشة على هذا الجهاز. اضبط أولًا رمز PIN أو نمطًا أو كلمة مرور أو بصمة من إعدادات الجهاز.';

  @override
  String get securityAppLockOn => 'يطلب Action من جهازك أن يؤكّد أنك أنت.';

  @override
  String get securityAppLockOff =>
      'اشتراط بصمتك أو وجهك أو رمز الجهاز لفتح Action.';

  @override
  String get securityAskAgain => 'اسأل مجددًا';

  @override
  String get securityAskAgainDescription =>
      'كم يمكن أن يبقى Action في الخلفية قبل أن يُقفل.';

  @override
  String get securityScreenPrivacy => 'خصوصية الشاشة';

  @override
  String get securityScreenPrivacyDescription =>
      'اطلب من أندرويد منع لقطات الشاشة وتسجيلها، وإخفاء Action في مبدّل التطبيقات.';

  @override
  String get securityPrivateReminders => 'تذكيرات خاصة';

  @override
  String get securityPrivateRemindersOn =>
      'لا تقول التذكيرات سوى أن شيئًا ينتظرك.';

  @override
  String get securityPrivateRemindersOff =>
      'تعرض التذكيرات عنوان الإجراء. فعّل هذا لإبقائه بعيدًا عن شاشة القفل.';

  @override
  String get securityLockNow => 'أقفل الآن';

  @override
  String get securityLockNowDescription => 'إغلاق الباب دون انتظار.';

  @override
  String get securitySectionStorage => 'كيف تُحفظ بياناتك';

  @override
  String get securityStorageDataLabel => 'إجراءاتك والتقاطاتك وإعداداتك';

  @override
  String get securityStorageDataDetail =>
      'تقع في التخزين الخاص بهذا التطبيق نفسه، الذي لا تستطيع التطبيقات الأخرى قراءته والذي يشفّره أندرويد ضمن تشفير الجهاز. ولا يضيف Action فوقه طبقة ثانية خاصة به.';

  @override
  String get securityStorageKeyLabel => 'مفتاح مزوّد الذكاء الاصطناعي الخاص بك';

  @override
  String get securityStorageKeyDetail =>
      'محفوظ في Android Keystore بدلًا من أن يكون مع البقية، ولا يُعرض مرة أخرى بعد حفظه.';

  @override
  String get securityStorageGapLabel => 'ما لا يغطّيه ذلك';

  @override
  String get securityStorageGapDetail =>
      'لا شيء من ذلك يحمي من شخص يستخدم جهازك وهو غير مقفل، والنظام المعدّل أو المروّت يستطيع قراءة أكثر مما يقرأه النظام العادي. وقفل التطبيق هو الإعداد الذي يساعد في الحالة الأولى.';

  @override
  String get securitySectionInformation => 'معلوماتك';

  @override
  String get securityWhereInfoDescription =>
      'كل مسار يمكن أن تسلكه بياناتك، والمساران اللذان يغادران هذا الجهاز.';

  @override
  String get securityAppLockRefused => 'لم يتم التأكيد، فلم يتغيّر شيء.';

  @override
  String get securityAppLockUnavailableToast =>
      'هذا الجهاز لا يحتوي على قفل شاشة. أضف رمز PIN أو نمطًا أو كلمة مرور أو بصمة من إعدادات الجهاز ثم حاول مرة أخرى.';

  @override
  String get securityScreenPrivacyRefused =>
      'لم يطبّق هذا الجهاز خصوصية الشاشة، فتُركت مُطفأة بدل أن تُعرض على أنها مفعّلة.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حُدِّث $count تذكير مجدول ليقول أقل.',
      many: 'حُدِّث $count تذكيرًا مجدولًا ليقول أقل.',
      few: 'حُدِّثت $count تذكيرات مجدولة لتقول أقل.',
      two: 'حُدِّث تذكيران مجدولان ليقولا أقل.',
      one: 'حُدِّث تذكير مجدول واحد ليقول أقل.',
      zero: 'لم يُحدَّث أي تذكير مجدول.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حُدِّث $count تذكير مجدول.',
      many: 'حُدِّث $count تذكيرًا مجدولًا.',
      few: 'حُدِّثت $count تذكيرات مجدولة.',
      two: 'حُدِّث تذكيران مجدولان.',
      one: 'حُدِّث تذكير مجدول واحد.',
      zero: 'لم يُحدَّث أي تذكير مجدول.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'فورًا';

  @override
  String get appLockDelayOneMinute => 'بعد دقيقة واحدة';

  @override
  String get appLockDelayFiveMinutes => 'بعد 5 دقائق';

  @override
  String get securityDelayImmediatelyDescription =>
      'في كل مرة يغادر فيها Action الشاشة';

  @override
  String get securityDelayOneMinuteDescription => 'يكفي للرد على رسالة';

  @override
  String get securityDelayFiveMinutesDescription => 'يكفي للرد على مكالمة';

  @override
  String get securityHeroProtected => 'محمي';

  @override
  String get securityHeroNothingOn => 'لا شيء مفعّل';

  @override
  String get securityHeroFootnote =>
      'كل ما هنا يعمل على هذا الجهاز. ولا يُرسل أي من هذه الإعدادات إلى أي جهة، ولا يمكن تغيير أي منها عن بُعد.';

  @override
  String get securityHeadlineNone => 'تتوفر ثلاث حمايات';

  @override
  String securityHeadlineOne(String first) {
    return '$first مفعّل';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first و$second مفعّلان';
  }

  @override
  String get securityHeadlineAll => 'الحمايات الثلاث كلها مفعّلة';

  @override
  String get securityTransfersTitle => 'ما غادر هذا الجهاز';

  @override
  String get securityTransfersNoProvider =>
      'لا يوجد مزوّد ذكاء اصطناعي موصول، فلا يُرسل أي شيء للتحليل إطلاقًا.';

  @override
  String get securityTransfersDescription =>
      'يُسجَّل هنا لحظة إرسال أي شيء، سواء عاد جواب أم لا. الأداة والمزوّد والحجم فقط — وليس ما بداخله أبدًا. يُحفظ 90 يومًا على هذا الجهاز ولا يُرسل إلى أي مكان.';

  @override
  String get securityClear => 'مسح';

  @override
  String get securityNothingSent => 'لم يُرسل شيء';

  @override
  String get securityNothingSentDescription =>
      'عندما تشغّل أداة تستخدم مزوّد الذكاء الاصطناعي الخاص بك، ستظهر هنا.';

  @override
  String get securityClearHistoryTitle => 'مسح هذا السجل؟';

  @override
  String get securityClearHistoryBody =>
      'سيُحذف سجل ما أُرسل من هذا الجهاز. وهو لا يتراجع عن أي شيء أُرسل من قبل.';

  @override
  String get securityUnnamedTool => 'أداة من Intelligence';

  @override
  String get securityYourProvider => 'مزوّد الذكاء الاصطناعي الخاص بك';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحة',
      many: '$count صفحة',
      few: '$count صفحات',
      two: 'صفحتان',
      one: 'صفحة واحدة',
      zero: 'لا صفحات',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملف',
      many: '$count ملفًا',
      few: '$count ملفات',
      two: 'ملفان',
      one: 'ملف واحد',
      zero: 'لا ملفات',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'نص قصير';

  @override
  String securityTransferCharacters(int count) {
    return '$count ألف حرف';
  }

  @override
  String securitySentTo(String provider) {
    return 'أُرسل إلى $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'أُرسل إلى $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return 'قبل $count أسبوع';
  }

  @override
  String get helpTitle => 'المساعدة';

  @override
  String get helpAddQuestion => 'ماذا يمكنني أن أضيف؟';

  @override
  String get helpAddAnswer =>
      'لقطة شاشة، أو صورة لرسالة أو فاتورة، أو نصًا تلصقه. وأفضل ما ينفع هو كل ما فيه تاريخ أو مبلغ أو طلب.';

  @override
  String get helpReviewQuestion => 'لماذا يطلب Action مني المراجعة؟';

  @override
  String get helpReviewAnswer =>
      'لأن آلة تقرأ مستندًا قد تخطئ في قراءته، ولأن موعدًا نهائيًا خاطئًا في صمت أسوأ من غياب الموعد أصلًا. يعرض Action ما وجده والكلمات التي جاء منها، ولا يُحفظ شيء حتى تؤكّده أنت.';

  @override
  String get helpVaryQuestion => 'لماذا تتغيّر النتائج إذا حاولت مرة أخرى؟';

  @override
  String get helpVaryAnswer =>
      'الخدمة التي تقرأ مستندك ليست حتمية، فقد يعود الالتقاط نفسه مختلفًا قليلًا. ولهذا أيضًا توجد خطوة المراجعة — أنت الجزء الذي لا يتغيّر.';

  @override
  String get helpLateQuestion => 'لماذا تأخّر تذكيري؟';

  @override
  String get helpLateAnswer =>
      'تُجدوَل التذكيرات عبر أندرويد، وأندرويد هو من يقرّر متى يسلّمها بالضبط. وقد يؤخّر أيًّا منها توفير البطارية أو Doze أو إعدادات الطاقة من الشركة المصنّعة. ولا يعد Action أبدًا بتذكير بالدقيقة.';

  @override
  String get helpDataQuestion => 'أين بياناتي؟';

  @override
  String get helpDataAnswer =>
      'كلها تقريبًا على هذا الجهاز: التقاطاتك وإجراءاتك وخطواتك وتذكيراتك وعمليات بحثك. استثناءان — المحتوى الذي تطلب من Action قراءته يُرسل إلى خدمة الذكاء الاصطناعي التي تقرأه، وقد يُحفظ سجل قصير لإجراء مؤكَّد في السحابة تحت معرّف مجهول. وقسم الخصوصية والبيانات في الإعدادات يذكر بالضبط ما يحتويه ذلك السجل.';

  @override
  String get helpBackupQuestion => 'هل هذه نسخة احتياطية؟';

  @override
  String get helpBackupAnswer =>
      'لا. لا يمكن استعادة السجل السحابي إلى جهاز جديد، ولا يوجد حساب لتسجّل الدخول إليه. وإذا أزلت Action أو فقدت هذا الجهاز، فإن البيانات التي عليه تذهب.';

  @override
  String get helpCorrectQuestion => 'كيف أصحّح إجراءً؟';

  @override
  String get helpCorrectAnswer =>
      'افتحه وعدّل أي حقل — العنوان أو الموعد النهائي أو المبلغ أو الخطوة التالية المقترحة. ويمكنك إضافة الخطوات وإعادة ترتيبها وإتمامها وحذفها في أي وقت. وتعديل إجراء لا يسأل خدمة الذكاء الاصطناعي عن أي شيء أبدًا.';

  @override
  String get privacyTitle => 'الخصوصية والبيانات';

  @override
  String get privacyIntro =>
      'يُبقي Action على هذا الجهاز كل ما يستطيع. وهناك أمران استثناء، وكلاهما مذكور أدناه.';

  @override
  String get privacyGroupOnDevice => 'على هذا الجهاز';

  @override
  String get privacyOnDeviceCaptures =>
      'الالتقاطات — لقطات الشاشة والصور والنصوص التي تضيفها، والنص المقروء منها.';

  @override
  String get privacyOnDeviceActions =>
      'الإجراءات بخطواتها ومعلوماتها وتذكيراتها.';

  @override
  String get privacyOnDeviceSearch =>
      'البحث. عمليات بحثك تجري هنا، ولا تُرسل إلى أي مكان أبدًا، ولا يُحتفظ بها بعد إغلاق الشاشة.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'تُحفظ الصور دون موقعها. فالإحداثيات والوقت وتفاصيل الكاميرا التي يكتبها الهاتف داخل الصورة تُزال قبل حفظ الالتقاط، فلا تبقى هنا ولا تُرسل معه عندما ترسل التقاطًا إلى مزوّد الذكاء الاصطناعي الخاص بك.';

  @override
  String get privacyGroupSentToRead => 'يُرسل ليُقرأ';

  @override
  String get privacySentToReadWhat =>
      'عندما تطلب من Action تفسير التقاط، يُرسل ذلك المحتوى إلى خدمة الذكاء الاصطناعي التي تقرأه. وهذا ليس ذكاءً اصطناعيًا على الجهاز.';

  @override
  String get privacySentToReadWhen =>
      'لا يُرسل إلا الالتقاط الذي اخترته، وفقط عندما تطلب ذلك.';

  @override
  String get privacyGroupYourProvider =>
      'يُرسل إلى مزوّد الذكاء الاصطناعي الخاص بك';

  @override
  String get privacyProviderWhat =>
      'إذا وصّلت مزوّد ذكاء اصطناعي في الإعدادات، ترسل أدوات Intelligence المحتوى الذي تختاره إلى ذلك المزوّد — OpenAI أو Anthropic أو Google أو endpoint اخترته — باستخدام مفتاح API الخاص بك.';

  @override
  String get privacyProviderDirect =>
      'يذهب إليهم مباشرة. ولا يمر عبر أي خادم يخص Action.';

  @override
  String get privacyProviderScope =>
      'لا يُرسل إلا ما تختاره لأداة، وفقط عند تشغيلها. ولا تُدرَج أبدًا إجراءاتك والتقاطاتك ومصادرك الأخرى، ولا يُرسل شيء في الخلفية أبدًا.';

  @override
  String get privacyProviderKey =>
      'يُحفظ مفتاح API الخاص بك في التخزين الآمن لهذا الجهاز ولا يُرسل إلا إلى المزوّد الذي يخصّه. والتخزين الآمن عائق حقيقي أمام من يمسك جهازك غير المقفل، لكنه ليس مطلقًا، ولن يدّعي Action غير ذلك.';

  @override
  String get privacyProviderLocalTools =>
      'بعض الأدوات لا ترسل شيئًا أبدًا: إخفاء التفاصيل الحساسة، والتحقق من مصدر ملف، والعثور على بيانات الاعتماد، وفحص رابط، كلها تعمل بالكامل على هذا الجهاز.';

  @override
  String get privacyProviderAgreement =>
      'ما يفعله مزوّدك بما ترسله يحكمه اتفاقك معه، لا Action.';

  @override
  String get privacyGroupCloud => 'محفوظ في السحابة';

  @override
  String get privacyCloudWhat =>
      'عندما تؤكّد إجراءً، قد يُحفظ سجل قصير له تحت معرّف مجهول يخص هذا التثبيت: عنوانه وحالته وأولويته وفئته وموعده النهائي ومبلغه والخطوة التالية المقترحة والطوابع الزمنية.';

  @override
  String get privacyCloudNotSent =>
      'التقاطاتك، والنص المقروء منها، وخطوات إجراء ومعلوماته، وتذكيراتك — كل ذلك لا يُرسل.';

  @override
  String get privacyCloudNotBackup =>
      'هذه ليست نسخة احتياطية. ولا سبيل لاستعادتها إلى جهاز جديد، وفقدان هذا التثبيت يأخذ معه المعرّف المجهول.';

  @override
  String get privacyGroupDiagnostics => 'التشخيص';

  @override
  String get privacyDiagnosticsWhat =>
      'يسجّل Action أعدادًا مجهولة لما يحدث في التطبيق — أن التقاطًا قد بدأ، وأن استخلاصًا نجح أو لم ينجح، وأن بحثًا لم يجد شيئًا، وأن إجراءً قد اكتمل.';

  @override
  String get privacyDiagnosticsCounts =>
      'هذه أعداد لا محتويات. ولا يُدرج فيها أبدًا أي عنوان أو مبلغ أو موعد نهائي أو مرجع أو نص ملتقط أو كلمة بحث، ولا المعرّف المجهول ولا أي معرّف لإجراء أو التقاط.';

  @override
  String get privacyDiagnosticsCrash =>
      'إذا تعطّل التطبيق، يُبلَّغ عن الخطأ وموضع حدوثه ليتسنى إصلاحه. ولا يرفق Action بياناتك بتلك التقارير.';

  @override
  String get privacySectionYourData => 'بياناتك';

  @override
  String get privacyYourDataFootnote =>
      'مسح الالتقاطات يترك إجراءاتك في مكانها. والإجراء الذي ذهب التقاطه يظل يعمل؛ إنما لم يعد يعرض ما جاء منه.';

  @override
  String get privacyClearCaptures => 'مسح الالتقاطات';

  @override
  String get privacyClearCapturesDescription => 'يحذف كل التقاط وملف صورته.';

  @override
  String get privacyDeleteAll => 'حذف كل بياناتي';

  @override
  String get privacyDeleteAllDescription =>
      'الإجراءات والخطوات والتذكيرات والالتقاطات والسجلات السحابية أعلاه.';

  @override
  String get privacyClearCapturesTitle => 'مسح الالتقاطات؟';

  @override
  String get privacyClearCapturesBody =>
      'سيُحذف كل التقاط وصورته من هذا الجهاز. وتبقى إجراءاتك كما هي تمامًا.';

  @override
  String get privacyCapturesDeleted => 'حُذفت الالتقاطات.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'تعذّر حذف بعض الالتقاطات. ولم يتغيّر شيء آخر.';

  @override
  String get privacyDeleteAllTitle => 'حذف كل بياناتك؟';

  @override
  String get privacyDeleteAllBody =>
      'هذا يحذف كل إجراء وخطوة وتذكير والتقاط على هذا الجهاز، والسجلات السحابية المذكورة أعلاه. ولا يمكن التراجع عنه، ولا توجد نسخة احتياطية للاستعادة منها.';

  @override
  String get privacyDeleteEverything => 'حذف كل شيء';

  @override
  String get privacyDeletedAll => 'حُذف كل شيء.';

  @override
  String get privacyDeleteFailed => 'تعذّر حذف بياناتك.';

  @override
  String get privacyDeletedUnverified =>
      'حُذف كل ما على هذا الجهاز. ولم يستطع Action الوصول إلى السحابة ليؤكّد أنه لم يبقَ شيء هناك، وسيتحقق مرة أخرى.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'حُذف، عدا $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'سيحاول Action مرة أخرى.';

  @override
  String get privacyCloudCheckIncomplete =>
      'لم يستطع Action إنهاء التحقق من السحابة، وسيحاول مرة أخرى.';

  @override
  String get privacyLeftoverCaptures => 'بعض الالتقاطات';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سجل سحابي',
      many: '$count سجلًا سحابيًا',
      few: '$count سجلات سحابية',
      two: 'سجلان سحابيان',
      one: 'سجل سحابي واحد',
      zero: 'لا سجلات سحابية',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first و$second';
  }

  @override
  String get privacyCloudDeleted => 'حُذفت السجلات السحابية.';

  @override
  String get privacyCloudUnreachable =>
      'ما زال الوصول إليها متعذّرًا. سيحاول Action مرة أخرى.';

  @override
  String get privacyPendingTitle => 'ما زال للحذف';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'تعذّر الوصول إلى $count سجل سحابي آخر مرة. سيحاول Action من تلقاء نفسه، أو يمكنك المحاولة الآن.',
      many:
          'تعذّر الوصول إلى $count سجلًا سحابيًا آخر مرة. سيحاول Action من تلقاء نفسه، أو يمكنك المحاولة الآن.',
      few:
          'تعذّر الوصول إلى $count سجلات سحابية آخر مرة. سيحاول Action من تلقاء نفسه، أو يمكنك المحاولة الآن.',
      two: 'تعذّر الوصول إلى سجلين سحابيين آخر مرة. سيحاول Action من تلقاء نفسه، أو يمكنك المحاولة الآن.',
      one: 'تعذّر الوصول إلى سجل سحابي واحد آخر مرة. سيحاول Action من تلقاء نفسه، أو يمكنك المحاولة الآن.',
      zero: 'تعذّر الوصول إلى سجلات سحابية آخر مرة. سيحاول Action من تلقاء نفسه، أو يمكنك المحاولة الآن.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'أعد المحاولة';

  @override
  String get evidenceTitle => 'من أين جاء هذا';

  @override
  String get evidenceUnverified =>
      'لم يجد Action هذه الكلمات في النص الذي قرأه، لذلك لم تُطابَق هذه القيمة. قارنها بالأصل قبل أن تعتمد عليها.';

  @override
  String get evidenceHighlighted =>
      'كانت هذه الكلمات في النص الذي قرأه Action من هذا الالتقاط، والتمييز يبيّن موضعها.';

  @override
  String get evidenceNoRegion =>
      'كانت هذه الكلمات في النص الذي قرأه Action من هذا الالتقاط. ولم يتبيّن موضعها الدقيق على الصورة، وهو لا يخمّن.';

  @override
  String get evidenceInText =>
      'كانت هذه الكلمات في النص الذي يحتويه هذا الالتقاط.';

  @override
  String get sourceCapturedAtFormat => 'd MMM، HH:mm';

  @override
  String get urgencyCritical => 'حرِج';

  @override
  String get urgencyImportant => 'مهم';

  @override
  String get urgencyNormal => 'عادي';

  @override
  String get urgencyLow => 'منخفض';

  @override
  String get urgencyUnsure => 'غير مؤكَّد';

  @override
  String get detailSaveFailed => 'تعذّر حفظ ذلك. لم يضِع شيء — حاول مرة أخرى.';

  @override
  String get detailSectionCreatedFrom => 'أُنشئ من';

  @override
  String get detailSourceChecking => 'جارٍ البحث عن الالتقاط الأصلي…';

  @override
  String get detailSourceUnavailable => 'لم يعد الالتقاط الأصلي متاحًا.';

  @override
  String get detailReopenAction => 'إعادة فتح الإجراء';

  @override
  String get detailMarkActionComplete => 'تعليم الإجراء كمنجز';

  @override
  String get detailGetHelp => 'احصل على مساعدة في هذا';

  @override
  String get detailSectionHistory => 'السجل';

  @override
  String get detailHistoryShowLess => 'عرض أقل';

  @override
  String detailHistoryShowAll(int count) {
    return 'عرض الكل ($count)';
  }

  @override
  String get detailHistoryCreated => 'أُنشئ';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'أُنشئ بـ$count خطوة',
      many: 'أُنشئ بـ$count خطوة',
      few: 'أُنشئ بـ$count خطوات',
      two: 'أُنشئ بخطوتين',
      one: 'أُنشئ بخطوة واحدة',
      zero: 'أُنشئ بلا خطوات',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'أكّدت التفاصيل بنفسك';

  @override
  String detailHistoryStepFinished(String title) {
    return 'أنجزتَ «$title»';
  }

  @override
  String get detailHistoryAStep => 'خطوة';

  @override
  String get detailHistoryReminderSet => 'ضبطتَ تذكيرًا';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'ضبطتَ تذكيرًا لموعد $when';
  }

  @override
  String get detailHistoryCompleted => 'عُلِّم كمنجز';

  @override
  String get detailHistoryChanged => 'آخر تغيير';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy، HH:mm';

  @override
  String get aiProviderCustom => 'مخصّص (متوافق مع واجهة OpenAI)';

  @override
  String get aiCapabilityText => 'النصوص';

  @override
  String get aiCapabilityImages => 'الصور';

  @override
  String get aiCapabilityDocuments => 'المستندات';

  @override
  String get aiCapabilityStructuredResults => 'النتائج المهيكلة';

  @override
  String get aiCapabilityStreaming => 'البث التدريجي';

  @override
  String get aiCapabilitySystemInstructions => 'تعليمات النظام';

  @override
  String get aiCapabilityEvidenceCitations => 'اقتباسات الدليل';

  @override
  String get aiCapabilityLongDocuments => 'المستندات الطويلة';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a، $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a أو $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head أو $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'اربط مزوّد ذكاء اصطناعي لاستخدام هذه الأداة.';

  @override
  String get aiFailureInvalidKey => 'لم يقبل المزوّد مفتاح API ذاك.';

  @override
  String get aiFailureQuotaExceeded =>
      'حسابك لدى المزوّد إمّا نفد رصيده أو بلغ حصّته.';

  @override
  String get aiFailureRateLimited =>
      'مزوّدك يحدّ من معدّل الطلبات. أعد المحاولة بعد قليل.';

  @override
  String get aiFailureNetworkUnavailable =>
      'تعذّر على Action الوصول إلى مزوّد الذكاء الاصطناعي الخاص بك. تحقّق من اتصالك.';

  @override
  String get aiFailureUnsupportedModel =>
      'ذلك النموذج غير متاح لمفتاحك. اختر غيره من الإعدادات.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'لا يستطيع النموذج الذي اخترته قراءة $capabilities. اختر نموذجًا آخر من الإعدادات.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'كان ذلك محتوى أكثر مما يستطيع هذا النموذج قراءته دفعة واحدة.';

  @override
  String get aiFailureInputTooLargeText =>
      'هذا نص أكثر مما يمكن تحليله دفعة واحدة.';

  @override
  String get aiFailureProviderUnavailable =>
      'يواجه مزوّد الذكاء الاصطناعي الخاص بك مشكلة. أعد المحاولة بعد قليل.';

  @override
  String get aiFailureMalformedResponse =>
      'أعاد ذلك المزوّد شيئًا لم يستطع Action قراءته.';

  @override
  String get aiFailureCancelled => 'أوقفتَه.';

  @override
  String get aiFailureInsecureEndpoint =>
      'يجب أن يكون ذلك الـendpoint عنوان https://.';

  @override
  String get aiFailureUnknown =>
      'حدث خطأ ما أثناء التواصل مع مزوّد الذكاء الاصطناعي الخاص بك.';

  @override
  String get appLockTitle => 'Action مقفل';

  @override
  String get appLockPrompt =>
      'أكّد أنك أنت للمتابعة. يطلب Action ذلك من جهازك — وهو لا يرى بصمتك ولا وجهك ولا رمز PIN أبدًا.';

  @override
  String get appLockUnlocking => 'جارٍ فتح القفل…';

  @override
  String get appLockNotConfirmed =>
      'لم يتم التأكيد. أعد المحاولة متى كنت مستعدًا.';

  @override
  String get appLockCannotConfirm =>
      'لا يستطيع جهازك الآن أن يؤكّد أنك أنت. تحقّق من أن قفل الشاشة ما زال مضبوطًا في إعدادات الجهاز.';

  @override
  String get appLockWaiting => 'بالانتظار…';

  @override
  String get appLockUnlock => 'فتح القفل';

  @override
  String get appLockReasonUnlock => 'فتح قفل Action';

  @override
  String get appLockReasonEnable => 'أكّد أنك أنت قبل تفعيل قفل التطبيق';

  @override
  String get appLockReasonDisable => 'أكّد أنك أنت قبل إيقاف قفل التطبيق';

  @override
  String get todayCapabilityHeading => 'ما الذي يتولّاه Action';

  @override
  String get todayCapabilityDocumentTitle => 'رسالة أو فاتورة';

  @override
  String get todayCapabilityDocumentBlurb =>
      'يقرؤها Action ويجد الموعد النهائي والمبلغ والرقم المرجعي.';

  @override
  String get todayCapabilityScreenshotTitle => 'لقطة شاشة لديك';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'حوّل رسالة كنت ستنساها إلى شيء يمكنك اتخاذ إجراء بشأنه.';

  @override
  String get todayCapabilityTextTitle => 'بعض النص';

  @override
  String get todayCapabilityTextBlurb =>
      'الصق أي شيء. ويستنتج Action ما هو وما الذي يطلبه منك.';

  @override
  String get todayCapabilityConfirmTitle => 'أنت تؤكّد كل شيء';

  @override
  String get todayCapabilityConfirmBlurb =>
      'لا يصير شيء إجراءً قبل أن ترى الدليل وتوافق.';

  @override
  String get todayCapabilityExploreIntelligence => 'استكشف الذكاء';

  @override
  String get documentRejectedEmpty => 'ذلك الملف فارغ.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'حجم ذلك المستند $size، وهو أكبر مما يستطيع Action العمل عليه.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'هذا ليس ملف PDF مهما كان اسمه. ويقرأ Action ملفات PDF والصور.';

  @override
  String get documentRejectedUnreadable => 'تعذّرت قراءة ذلك المستند.';

  @override
  String get pdfRejectedNotAPdf => 'ذلك الملف ليس PDF مهما كان اسمه.';

  @override
  String get pdfRejectedEncrypted =>
      'ملف PDF ذاك محمي بكلمة مرور، فلا يستطيع Action قراءته.';

  @override
  String get pdfRejectedDamaged => 'تعذّرت قراءة ملف PDF ذاك. وقد يكون ناقصًا.';

  @override
  String get shareRejectedEmpty => 'لم يكن في تلك المشاركة شيء يُقرأ.';

  @override
  String get shareRejectedUnsupportedType =>
      'يستطيع Action أخذ النصوص والصور وملفات PDF. وكان ذلك شيئًا آخر.';

  @override
  String get shareRejectedContentMismatch =>
      'ذلك الملف ليس من النوع الذي يقول إنه منه، ولذلك لم يفتحه Action.';

  @override
  String get shareRejectedTooLarge => 'ذلك الملف أكبر من أن يعمل عليه Action.';

  @override
  String get shareRejectedUnreadable => 'تعذّرت قراءة ذلك الملف.';

  @override
  String get captureFailureRecognition => 'تعذّر تشغيل التعرّف على النص.';

  @override
  String get captureFailureImageFormat =>
      'تعذّرت قراءة صيغة تلك الصورة على هذا الجهاز.';

  @override
  String get connectSheetTitle => 'اربط الذكاء الاصطناعي الخاص بك';

  @override
  String get connectSheetSubtitle =>
      'أنت تستخدم حسابك ومفتاح API الخاصين بك لدى المزوّد. ويحفظ Action المفتاح في التخزين الآمن لهذا الجهاز.';

  @override
  String get connectErrorKeyMissing => 'الصق مفتاح API الخاص بك للمتابعة.';

  @override
  String get connectErrorModelMissing => 'اختر نموذجًا، أو اكتب معرّف نموذج.';

  @override
  String get connectErrorEndpointMissing => 'أضف عنوان الـendpoint الخاص بك.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'تعذّر فتح التخزين الآمن لهذا الجهاز، فلم يُحفظ المفتاح.';

  @override
  String get connectTestSucceeded => 'تم الربط.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'تم الربط. عدد النماذج المتاحة: $count.';
  }

  @override
  String get connectProviderLabel => 'المزوّد';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'يجب أن يكون عنوانًا بصيغة https://. ولن يرسل Action مستنداتك عبر اتصال غير مشفَّر.';

  @override
  String get connectApiKeyLabel => 'مفتاح API';

  @override
  String get connectApiKeyHint => 'الصق مفتاحك';

  @override
  String get connectKeyPrivacyNote =>
      'يبقى مفتاحك على هذا الجهاز. ولا يرسله Action إلى أي جهة أبدًا سوى المزوّد الذي اخترته، ولا يستطيع عرضه عليك مرة أخرى بعد الحفظ.';

  @override
  String get connectModelLabel => 'النموذج';

  @override
  String get connectModelIdHint => 'معرّف النموذج';

  @override
  String get connectModelFreeTextNote =>
      'يوقف المزوّدون معرّفات نماذج ويضيفون غيرها. وإن لم يكن المعرّف الذي تريده مدرجًا، فاكتبه هنا.';

  @override
  String get connectAndTest => 'اربط واختبر';

  @override
  String get connectSaveWithoutTesting => 'احفظ دون اختبار';

  @override
  String get toolWarningFactsNotChecked =>
      'تعذّر على Action مقارنة هذا بالنص الأصلي، ولذلك لم تُفحص المبالغ والتواريخ التي فيه.';

  @override
  String get toolTitleRewrite => 'حسّن هذه الكتابة';

  @override
  String get toolDescriptionRewrite =>
      'أوضح أو أقصر أو أكثر رسمية — مع إبقاء المعلومات كما هي.';

  @override
  String get toolModeRewriteClearer => 'أوضح';

  @override
  String get toolModeRewriteProfessional => 'أكثر مهنية';

  @override
  String get toolModeRewriteShorter => 'أقصر';

  @override
  String get toolModeRewritePersuasive => 'أكثر إقناعًا';

  @override
  String get toolModeRewriteSimpler => 'أبسط';

  @override
  String get toolModeRewriteStructured => 'أكثر تنظيمًا';

  @override
  String get toolModeRewriteGrammarOnly => 'القواعد فقط';

  @override
  String get toolSectionWhatChanged => 'ما الذي تغيّر';

  @override
  String get toolSectionNote => 'ملاحظة';

  @override
  String get toolSectionAlreadyClearBody =>
      'كان هذا واضحًا أصلًا. والتغييرات أدناه طفيفة.';

  @override
  String get toolSectionImprovedText => 'النص المحسَّن';

  @override
  String get toolTitleDraftReply => 'اكتب مسودة رد';

  @override
  String get toolDescriptionDraftReply => 'رد يمكنك تعديله وإرساله بنفسك.';

  @override
  String get toolModeReplyProfessional => 'مهني';

  @override
  String get toolModeReplyConcise => 'موجز';

  @override
  String get toolModeReplyFriendly => 'ودود';

  @override
  String get toolModeReplyFormal => 'رسمي';

  @override
  String get toolModeReplyClarification => 'اطلب توضيحًا';

  @override
  String get toolModeReplyConfirmation => 'أكّد الاستلام';

  @override
  String get toolModeReplyDispute => 'اعترض على هذا';

  @override
  String get toolSectionSubject => 'الموضوع';

  @override
  String get toolSectionDraftReply => 'مسودة الرد';

  @override
  String get toolSectionPlaceholders => 'عليك ملء هذه الفراغات';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'مسودة — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'هذه مسودة. لا يرسل Action شيئًا — اقرأها وعدّلها وأرسلها بنفسك.';

  @override
  String get toolTitleTranslate => 'ترجم';

  @override
  String get toolDescriptionTranslate =>
      'لغة أخرى، مع إبقاء الأرقام والأسماء كما هي.';

  @override
  String get toolSectionTranslation => 'الترجمة';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'من $from إلى $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'أُبقيت كما في الأصل';

  @override
  String get toolWarningTranslationNotCertified =>
      'ترجمة للفهم، وليست ترجمة معتمدة.';

  @override
  String get toolTitleStructuredData => 'استخرج جدولًا';

  @override
  String get toolDescriptionStructuredData => 'صفوف وحقول وأرقام يمكنك نسخها.';

  @override
  String get toolSectionTable => 'الجدول';

  @override
  String get toolSectionFields => 'الحقول';

  @override
  String get toolSectionTableCsv => 'الجدول (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'تعذّرت قراءة تخطيط أعمدة هذا الجدول قراءة موثوقة. تحقّق من أن الصفوف متقابلة بشكل صحيح قبل استخدامها.';

  @override
  String get toolTitleDeadlineFinder => 'ابحث عن المواعيد النهائية';

  @override
  String get toolDescriptionDeadlineFinder =>
      'ما المستحق، ومتى، وماذا يحدث إن لم يُنفَّذ.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count موعد نهائي',
      many: '$count موعدًا نهائيًا',
      few: '$count مواعيد نهائية',
      two: 'موعدان نهائيان',
      one: 'موعد نهائي واحد',
      zero: 'لا مواعيد نهائية',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'لا شيء مستحق';

  @override
  String get toolSectionNothingDueBody =>
      'لم يجد Action مواعيد نهائية ولا التزامات في هذا المحتوى.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'لا يُجدوَل شيء حتى تختاره. ولا تُضبط التذكيرات تلقائيًا أبدًا.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'إن لم يُنفَّذ: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'تحتاج: $items';
  }

  @override
  String get moneyErrorEmpty => 'لم يُذكر أي مبلغ';

  @override
  String get moneyErrorMalformed => 'المبلغ ليس رقمًا مجرّدًا';

  @override
  String get moneyErrorNegative => 'المبلغ السالب ليس مبلغًا مستحق الدفع';

  @override
  String get moneyErrorTooManyDecimals => 'خانات عشرية أكثر مما لهذه العملة';

  @override
  String get moneyErrorUnsupportedCurrency => 'رمز العملة ليس مما نعرفه';

  @override
  String get moneyErrorOutOfRange => 'المبلغ كبير على نحو غير معقول';

  @override
  String get escalationOcrFailed =>
      'تعذّر تشغيل التعرّف على النص في هذا الالتقاط إطلاقًا.';

  @override
  String get escalationNoTextRecognised =>
      'يبدو هذا مستندًا، لكن لم يجر التعرّف على أي نص.';

  @override
  String get escalationThinText =>
      'النص الذي جرى التعرّف عليه أقل بكثير مما يقتضيه مستند بهذا الحجم.';

  @override
  String get escalationLowLineConfidence =>
      'أبلغ محرّك التعرّف عن ثقة منخفضة في عدة أسطر.';

  @override
  String get escalationTableLikeLayout =>
      'يبدو التخطيط جدولًا، وقراءته سطرًا سطرًا تُضيّع معرفة أي قيمة تخص أي صف.';

  @override
  String get escalationFragmentedLayout =>
      'عاد النص في صورة أجزاء صغيرة كثيرة، ولذلك فالبنية غير واضحة.';

  @override
  String get escalationMalformedText =>
      'كثير من النص الذي جرى التعرّف عليه ليس كلمات أو أرقامًا مقروءة.';

  @override
  String get escalationConflictingDates =>
      'أكثر من تاريخ معروض على أنه الموعد النهائي.';

  @override
  String get escalationConflictingAmounts =>
      'أكثر من مبلغ معروض على أنه المبلغ المستحق.';

  @override
  String get escalationUnresolvedGrounding =>
      'تعذّرت مطابقة بعض القيم بنص المستند.';

  @override
  String get escalationInstructionLikeContent =>
      'يحتوي المستند على نص مكتوب كأنه تعليمات للتطبيق. ويُعامَل على أنه محتوى مستند، لا تعليمات أبدًا.';

  @override
  String get providerFailureNetwork =>
      'تعذّر على Action الوصول إلى الخدمة. تحقّق من اتصالك.';

  @override
  String get providerFailureTimedOut =>
      'استغرقت الخدمة وقتًا أطول من اللازم للرد.';

  @override
  String get providerFailureServiceUnavailable =>
      'الخدمة غير متاحة مؤقتًا. أعد المحاولة لاحقًا.';

  @override
  String get providerFailureUnauthorized =>
      'هذا التطبيق غير مخوَّل باستخدام الخدمة في الوقت الحالي.';

  @override
  String get providerFailureBlocked => 'رفضت الخدمة معالجة هذا المستند.';

  @override
  String get providerFailureUnknown =>
      'تعذّر على Action قراءة هذا المستند. وقد تنجح إعادة المحاولة.';

  @override
  String get reviewBlockerTitle => 'أعطِ هذا الإجراء عنوانًا.';

  @override
  String get reviewBlockerDate =>
      'اختر التاريخ الذي هو الموعد النهائي الحقيقي، أو اتركه غير محدَّد.';

  @override
  String get reviewBlockerAmount => 'اختر المبلغ الصحيح، أو اتركه غير محدَّد.';

  @override
  String get reviewBlockerStepTitle => 'الخطوات التي تُبقيها تحتاج عنوانًا.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'صفحة $page',
      many: 'صفحة $page',
      few: 'صفحة $page',
      two: 'صفحة $page',
      one: 'صفحة $page',
      zero: 'صفحة $page',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'الصفحات من $start إلى $end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'لم يعد النص الناتج يحتوي على $values. راجعه قبل استخدامه.',
      many: 'لم يعد النص الناتج يحتوي على $values. راجعه قبل استخدامه.',
      few: 'لم يعد النص الناتج يحتوي على $values. راجعه قبل استخدامه.',
      two: 'لم يعد النص الناتج يحتوي على $values. راجعه قبل استخدامه.',
      one: 'لم يعد النص الناتج يحتوي على $values. راجعه قبل استخدامه.',
      zero: 'لم يعد النص الناتج يحتوي على $values. راجعه قبل استخدامه.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'لم يعد النص الناتج يحتوي على $values و$count قيمة أخرى. راجعه قبل استخدامه.',
      many:
          'لم يعد النص الناتج يحتوي على $values و$count قيمة أخرى. راجعه قبل استخدامه.',
      few:
          'لم يعد النص الناتج يحتوي على $values و$count قيم أخرى. راجعه قبل استخدامه.',
      two:
          'لم يعد النص الناتج يحتوي على $values وقيمتين أخريين. راجعه قبل استخدامه.',
      one:
          'لم يعد النص الناتج يحتوي على $values وقيمة واحدة أخرى. راجعه قبل استخدامه.',
      zero: 'لم يعد النص الناتج يحتوي على $values. راجعه قبل استخدامه.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => '، ';

  @override
  String get goalStatusReached => 'تحقَّق';

  @override
  String get goalNewSheetTitle => 'ما الذي تريد أن يحدث؟';

  @override
  String get goalNewSheetSubtitle =>
      'جملة واحدة تكفي. ويمكنك إضافة التفاصيل لاحقًا.';

  @override
  String get goalTitleHint => 'تجديد تأمين السيارة دون دفع مبلغ زائد.';

  @override
  String get goalCreateAction => 'إنشاء هدف';

  @override
  String get goalTitleSheetTitle => 'ما الذي تريده';

  @override
  String get goalOutcomeSheetTitle => 'كيف يبدو الإنجاز';

  @override
  String get goalContextSheetTitle => 'أين وصلت الأمور';

  @override
  String get goalOutcomeHint => 'السيارة مؤمَّنة والأوراق مُقدَّمة.';

  @override
  String get goalContextHint => 'لديّ عرضا سعر والتجديد في الثامن عشر.';

  @override
  String get goalWorkspaceTitle => 'الهدف';

  @override
  String get goalUnmarkReached => 'أزِل علامة التحقّق التي وضعتَها';

  @override
  String get goalMarkReached => 'تعليم الهدف كمتحقّق';

  @override
  String get goalNotFound => 'ذلك الهدف لم يعد هنا.';

  @override
  String get goalDeleteTitle => 'حذف هذا الهدف؟';

  @override
  String get goalDeleteBody =>
      'يُحذف الهدف من هذا الجهاز. وتبقى أي إجراءات أُنشئت منه كما هي تمامًا.';

  @override
  String get goalOutcomeLabel => 'كيف يبدو الإنجاز';

  @override
  String get goalOutcomeEmpty =>
      'لم تكتبه بعد. والتخطيط للهدف أسهل متى قلتَ ما الذي يعنيه إنجازه.';

  @override
  String get goalContextLabel => 'أين وصلت الأمور';

  @override
  String get goalContextEmpty =>
      'لم يُكتب شيء بعد. ما حدث حتى الآن، وما يقف في الطريق.';

  @override
  String get goalTitleLabel => 'ما الذي تريده';

  @override
  String get goalEditTooltip => 'تعديل الهدف';

  @override
  String get goalToolsLabel => 'ما الذي يستطيع Action فعله';

  @override
  String get goalToolsNotReady =>
      'اكتب مزيدًا عمّا تريده، عندئذٍ يكون لدى هذه الأدوات ما تعمل عليه.';

  @override
  String get toolGoalOptimizerTitle => 'حسّن هدفًا';

  @override
  String get toolActionPlanTitle => 'ابنِ خطة';

  @override
  String get resultFactUnconfirmed => 'غير مؤكَّد';

  @override
  String get resultSuggestedSteps => 'خطوات مقترحة';

  @override
  String get resultSuggestedAction => 'إجراء مقترح';

  @override
  String get resultWorthAsking => 'أسئلة يجدر طرحها';

  @override
  String get resultSuggestedDeadlines => 'مواعيد نهائية مقترحة';

  @override
  String get resultSuggestions => 'اقتراحات';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count اقتباس داعم',
      many: '$count اقتباسًا داعمًا',
      few: '$count اقتباسات داعمة',
      two: 'اقتباسان داعمان',
      one: 'اقتباس داعم واحد',
      zero: 'لا اقتباسات داعمة',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'من المصدر الذي اخترته';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source، $page';
  }

  @override
  String get toolRunStagePreparing => 'جارٍ تحضير مستندك';

  @override
  String get toolRunStageReading => 'جارٍ قراءة الصفحات التي اخترتها';

  @override
  String get toolRunStageAnalysing => 'جارٍ التحليل';

  @override
  String get toolRunStageBuilding => 'جارٍ تجهيز مراجعتك';

  @override
  String get toolRunStageDone => 'انتهى';

  @override
  String get toolRunStageFailed => 'لم يكتمل ذلك';

  @override
  String get toolRunStageCancelled => 'أوقفتَه';

  @override
  String get toolRunFailureLocalCheckFailed => 'تعذّر فحص ذلك.';

  @override
  String get toolRunFailureProviderRetired =>
      'لم يعد مزوّد الذكاء الاصطناعي ذاك متاحًا في هذه النسخة.';

  @override
  String get toolRunFailureUnusableReply =>
      'لم يعد ذلك الرد في صورة صالحة للاستخدام. أعد المحاولة.';

  @override
  String get toolRunFailureQuestionRequired => 'اكتب سؤالًا أولًا.';

  @override
  String get toolRunFailureInputRequired => 'اختر شيئًا لتعمل عليه هذه الأداة.';

  @override
  String get toolWarningReplyTruncated =>
      'انقطع هذا الرد قبل أن ينتهي، ولذلك قد يكون ناقصًا.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'لم يُعِد نموذجك أي اقتباسات داعمة، ولذلك لا شيء هنا مدعوم بدليل. قارنه بالمستند قبل أن تتصرّف بناءً عليه.';

  @override
  String get aiSettingsRemoveTitle => 'إزالة هذا الربط؟';

  @override
  String get aiSettingsRemoveBody =>
      'سيحذف Action مفتاح API الخاص بك من هذا الجهاز ويتوقف عن استخدام ميزات الذكاء الاصطناعي. ولا يتأثر حسابك لدى المزوّد.';

  @override
  String get aiSettingsProviderLabel => 'المزوّد';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'يحاسبك مزوّدك على ما تستخدمه. ولا يرسل Action أي طلب من تلقاء نفسه أبدًا.';

  @override
  String get aiSettingsConnectLabel => 'اربط مزوّد ذكاء اصطناعي';

  @override
  String get aiSettingsConnectDescription =>
      'استخدم حسابك ومفتاح API الخاصين بك مع OpenAI أو Anthropic أو Google Gemini، أو مع endpoint متوافق.';

  @override
  String get aiSettingsModelLabel => 'النموذج';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'مفتاح API';

  @override
  String get aiSettingsKeyStored => 'محفوظ في التخزين الآمن لهذا الجهاز.';

  @override
  String get aiSettingsKeyMissing =>
      'لم يُعثر على مفتاح على هذا الجهاز. اربط من جديد لإضافة واحد.';

  @override
  String get aiSettingsTestLabel => 'اختبار الاتصال';

  @override
  String get aiSettingsProviderUnavailable =>
      'ذلك المزوّد غير متاح في هذه النسخة.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'تم الربط. عدد النماذج المتاحة: $count.';
  }

  @override
  String get aiSettingsTestButton => 'اختبار';

  @override
  String get aiSettingsChangeProvider => 'تغيير المزوّد أو النموذج';

  @override
  String get aiSettingsRemoveKey => 'إزالة المفتاح';

  @override
  String get aiSettingsSectionPrivacy => 'الخصوصية';

  @override
  String get aiSettingsWhatGetsSentLabel => 'ما الذي يُرسل';

  @override
  String get aiSettingsWhereItGoesLabel => 'إلى أين يذهب';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'لا يُرسل شيء حتى تربط مزوّدًا.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'مباشرة إلى $provider، باستخدام مفتاحك. ولا يمر عبر خوادم Action.';
  }

  @override
  String get aiSettingsSectionData => 'البيانات';

  @override
  String get aiSettingsDataFootnote =>
      'يتذكّر Action أي الأدوات استخدمتَ، ولا يتذكّر أبدًا ما استخدمتها عليه.';

  @override
  String get aiSettingsRecentToolsLabel => 'الأدوات المستخدمة مؤخرًا';

  @override
  String get aiSettingsRecentToolsNone => 'لا شيء';

  @override
  String get reminderNotificationTitle => 'تذكير Action';

  @override
  String get reminderNotificationPrivateBody => 'لديك شيء يحتاج مراجعتك.';

  @override
  String get reminderChannelName => 'تذكيرات Action';

  @override
  String get reminderChannelDescription =>
      'التذكيرات التي تضبطها بنفسك لإجراءاتك.';

  @override
  String get onboardingStart => 'ابدأ باستخدام Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get onboardingCaptureTitle => 'حوّل المعلومات إلى إجراء';

  @override
  String get onboardingCaptureBody =>
      'أضف لقطة شاشة أو صورة أو نصًا وصلك. يقرؤه Action ويستنتج ما الذي يطلبه منك.';

  @override
  String get onboardingReviewTitle => 'لا يُحفظ شيء حتى تؤكّده أنت';

  @override
  String get onboardingReviewBody =>
      'يعرض لك Action ما وجده والكلمات التي جاء منها. وأنت تصحّح ما كان خطأ. وإلى أن تؤكّده، هو اقتراح — لا معلومة، ولا إجراء.';

  @override
  String get onboardingTrackingTitle => 'ابقَ على اطّلاع بما يهم';

  @override
  String get onboardingTrackingBody =>
      'يقدّم «يحتاج انتباهك» ما فات موعده أو اقترب. ويحتفظ كل إجراء بخطوته التالية وتقدّمه وأي تذكير تضبطه له.';

  @override
  String get onboardingPrivacyBody => 'ما يجدر أن تعرفه قبل أن تبدأ:';

  @override
  String get onboardingPrivacyOnDevice =>
      'إجراءاتك والتقاطاتك وتذكيراتك وعمليات بحثك مخزّنة على هذا الجهاز. ويعمل البحث والتذكيرات دون اتصال.';

  @override
  String get onboardingPrivacySentToRead =>
      'عندما تطلب من Action قراءة شيء، يُرسل ذلك المحتوى إلى خدمة الذكاء الاصطناعي التي تفسّره.';

  @override
  String get onboardingPrivacyCloud =>
      'قد يُحفظ سجل قصير لإجراء مؤكَّد — عنوانه وتواريخه ومبلغه وخطوته المقترحة — في السحابة تحت معرّف مجهول يخص هذا الجهاز. أما التقاطاتك وخطواتك وتذكيراتك فلا تُحفظ.';

  @override
  String get onboardingPrivacyNotBackup =>
      'ذلك السجل ليس نسخة احتياطية. ولا يستطيع استعادة أي شيء إلى جهاز جديد.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عائق',
      many: '$count عائقًا',
      few: '$count عوائق',
      two: 'عائقان',
      one: 'عائق واحد',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'يمكن أن يكون أبسط';

  @override
  String get toolDescriptionGoalOptimizer =>
      'ما الناقص، وما الذي يعيقه، وما تبدأ به.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'بعد: $step';
  }

  @override
  String get toolSectionThePlan => 'الخطة';

  @override
  String get toolDescriptionActionPlan =>
      'مجموعة خطوات مرتّبة يمكنك تحويلها إلى إجراءات.';

  @override
  String get toolTitleSmartChecklist => 'اصنع قائمة تحقُّق';

  @override
  String get toolDescriptionSmartChecklist => 'كل ما يطلبه هذا منك، بالترتيب.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تفصيل ناقص',
      many: '$count تفصيلًا ناقصًا',
      few: '$count تفاصيل ناقصة',
      two: 'تفصيلان ناقصان',
      one: 'تفصيل واحد ناقص',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'هذه تتعارض فيما بينها';

  @override
  String get toolTitleMissingInformation => 'المعلومات الناقصة';

  @override
  String get toolDescriptionMissingInformation =>
      'الثغرات، والأسئلة التي تطرحها بشأنها.';

  @override
  String get aiAdapterTimedOut => 'استغرق ذلك وقتًا أطول من اللازم، فأُوقف.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'فشل الاتصال الآمن بمزوّد الذكاء الاصطناعي الخاص بك.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'لم يستطع Action العثور على ذلك النموذج أو الـendpoint.';

  @override
  String get aiAdapterRequestRejected =>
      'رفض مزوّد الذكاء الاصطناعي الخاص بك ذلك الطلب.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'لم يستطع Action فتح التخزين الآمن لهذا الجهاز.';

  @override
  String get aiAdapterEndpointMissing =>
      'أضف عنوان الـendpoint الخاص بك من الإعدادات.';

  @override
  String get aiAdapterReplyIncomplete => 'كان ذلك الرد ناقصًا. أعد المحاولة.';

  @override
  String get aiAdapterContentDeclined => 'رفض مزوّدك معالجة ذلك المحتوى.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'هذا أكثر من $limit ملفات دفعة واحدة. اختر عددًا أقل.';
  }

  @override
  String get aiAdapterImageTooLarge => 'إحدى تلك الصور أكبر من أن تُحلَّل.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '«$filename» أكبر من أن يُحلَّل. والحد الأقصى $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '«$filename» فيه $count صفحة. ويقرأ Action حتى $limit صفحة دفعة واحدة — اختر نطاقًا.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'ما اخترته أكبر من أن يُرسل في طلب واحد.';

  @override
  String get toolRunNotAvailableTitle => 'تلك الأداة غير متاحة';

  @override
  String get toolRunNotAvailableMessage =>
      'ربما أُزيلت في نسخة أحدث من Action.';

  @override
  String get toolRunNoSourcesYet =>
      'لا شيء للعمل عليه بعد. التقط شيئًا، أو الصق نصًا في الأسفل.';

  @override
  String get toolRunChooseSourcesToCompare => 'اختر ما تريد مقارنته';

  @override
  String get toolRunChooseSource => 'اختر مصدرًا';

  @override
  String get toolRunQuestionLabel => 'سؤالك';

  @override
  String get toolRunQuestionHint => 'ما الموعد النهائي؟';

  @override
  String get toolRunFreeTextLabel => 'أو الصق نصًا';

  @override
  String get toolRunFreeTextHint => 'الصق أو اكتب هنا';

  @override
  String get toolRunModeLabel => 'الأسلوب';

  @override
  String get toolRunRunLocally => 'افحص على هذا الجهاز';

  @override
  String get toolRunRun => 'شغّل';

  @override
  String get toolRunStop => 'أوقف';

  @override
  String get toolRunRunAgain => 'شغّل مرة أخرى';

  @override
  String get toolRunWorkingOn => 'العمل على:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'إرسال هذا إلى $provider؟';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'سيُرسل المحتوى الذي اخترته إلى $provider لمعالجته، باستخدام مفتاح API الخاص بك.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'يبقى مفتاحك على هذا الجهاز. ولا يرسل Action شيئًا في الخلفية، ولا يرسل إجراءاتك أو مصادرك الأخرى.';

  @override
  String get toolRunScopeTitle => 'قبل أن يُشغَّل هذا';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ستُحلَّل $count صفحة باستخدام اتصالك بـ$provider.',
      many: 'ستُحلَّل $count صفحة باستخدام اتصالك بـ$provider.',
      few: 'ستُحلَّل $count صفحات باستخدام اتصالك بـ$provider.',
      two: 'ستُحلَّل صفحتان باستخدام اتصالك بـ$provider.',
      one: 'ستُحلَّل صفحة واحدة باستخدام اتصالك بـ$provider.',
      zero: 'لن تُحلَّل أي صفحة باستخدام اتصالك بـ$provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سيُحلَّل $count ملف باستخدام اتصالك بـ$provider.',
      many: 'سيُحلَّل $count ملفًا باستخدام اتصالك بـ$provider.',
      few: 'ستُحلَّل $count ملفات باستخدام اتصالك بـ$provider.',
      two: 'سيُحلَّل ملفان باستخدام اتصالك بـ$provider.',
      one: 'سيُحلَّل ملف واحد باستخدام اتصالك بـ$provider.',
      zero: 'لن يُحلَّل أي ملف باستخدام اتصالك بـ$provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'سيُرسل النص الذي اخترته عبر اتصالك بـ$provider.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'اربط مزوّد ذكاء اصطناعي لاستخدام هذه الأداة';

  @override
  String get toolRunNeedsProviderBody =>
      'أنت تستخدم حسابك ومفتاح API الخاصين بك لدى المزوّد.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'أُنشئ إجراء من $count خطوة.',
      many: 'أُنشئ إجراء من $count خطوة.',
      few: 'أُنشئ إجراء من $count خطوات.',
      two: 'أُنشئ إجراء من خطوتين.',
      one: 'أُنشئ إجراء من خطوة واحدة.',
      zero: 'أُنشئ إجراء دون خطوات.',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'أُضيفت $count خطوة.',
      many: 'أُضيفت $count خطوة.',
      few: 'أُضيفت $count خطوات.',
      two: 'أُضيفت خطوتان.',
      one: 'أُضيفت خطوة واحدة.',
      zero: 'لم تُضف أي خطوة.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خطوة',
      many: '$count خطوة',
      few: '$count خطوات',
      two: 'خطوتان',
      one: 'خطوة واحدة',
      zero: 'بلا خطوات',
    );
    return 'إنشاء إجراء · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خطوة',
      many: '$count خطوة',
      few: '$count خطوات',
      two: 'خطوتان',
      one: 'خطوة واحدة',
      zero: 'بلا خطوات',
    );
    return 'إضافة إلى هذا الإجراء · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'صورة';

  @override
  String get sourceTypeLabelScreenshot => 'لقطة شاشة';

  @override
  String get sourceTypeLabelPastedText => 'نص ملصوق';

  @override
  String get sourceTypeLabelDocument => 'مستند';

  @override
  String get toolModeClearer => 'أوضح';

  @override
  String get toolModeMoreProfessional => 'أكثر مهنية';

  @override
  String get toolModeShorter => 'أقصر';

  @override
  String get toolModeSimpler => 'أبسط';

  @override
  String get toolModeMoreStructured => 'أكثر تنظيمًا';

  @override
  String get toolModeMorePersuasive => 'أكثر إقناعًا';

  @override
  String get toolModeGrammarOnly => 'القواعد فقط';

  @override
  String get toolModeProfessional => 'مهني';

  @override
  String get toolModeConcise => 'موجز';

  @override
  String get toolModeFriendly => 'ودود';

  @override
  String get toolModeFormal => 'رسمي';

  @override
  String get toolModeAskForClarification => 'اطلب توضيحًا';

  @override
  String get toolModeConfirm => 'أكّد الاستلام';

  @override
  String get toolModeDispute => 'اعترض على هذا';

  @override
  String get toolModeQuick => 'لمحة سريعة';

  @override
  String get toolModeDetailed => 'مفصّل';

  @override
  String get toolModeExecutive => 'تنفيذي';

  @override
  String get toolModeKeyPoints => 'النقاط الأساسية';

  @override
  String get toolModeActionFocused => 'مركّز على الإجراءات';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count تفصيل مقتبس لم يُعثر عليه في ما اخترته، ولذلك عُلِّم بأنه غير مؤكَّد.',
      many:
          '$count تفصيلًا مقتبسًا لم يُعثر عليه في ما اخترته، ولذلك عُلِّم بأنه غير مؤكَّد.',
      few:
          '$count تفاصيل مقتبسة لم يُعثر عليها في ما اخترته، ولذلك عُلِّمت بأنها غير مؤكَّدة.',
      two: 'تفصيلان مقتبسان لم يُعثر عليهما في ما اخترته، ولذلك عُلِّما بأنهما غير مؤكَّدين.',
      one: 'تفصيل واحد مقتبس لم يُعثر عليه في ما اخترته، ولذلك عُلِّم بأنه غير مؤكَّد.',
      zero:
          '$count تفصيل مقتبس لم يُعثر عليه في ما اخترته، ولذلك عُلِّم بأنه غير مؤكَّد.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'تعذّر على Action مقارنة هذه الاقتباسات بالملف نفسه، ولذلك لم تُطابَق.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'متأخر · $count يوم',
      many: 'متأخر · $count يومًا',
      few: 'متأخر · $count أيام',
      two: 'متأخر · يومان',
      one: 'متأخر · يوم واحد',
      zero: 'متأخر · $count يوم',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'مستحق غدًا';

  @override
  String get triageBadgeReminderSoon => 'تذكير قريبًا';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'متأخر بـ$count يوم',
      many: 'متأخر بـ$count يومًا',
      few: 'متأخر بـ$count أيام',
      two: 'متأخر بيومين',
      one: 'متأخر بيوم واحد',
      zero: 'متأخر بـ$count يوم',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status، $title';
  }

  @override
  String get triageExplanationDone => 'هذا منجز.';

  @override
  String get triageExplanationNothingPressing =>
      'هذا هنا لأن لا شيء فيه مُلِحّ بعد.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return '$reason، ولذلك يحتاج إلى انتباهك.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return '$reason، ولذلك يظهر أدنى في القائمة.';
  }

  @override
  String get triageReasonOverdue => 'هذا متأخر';

  @override
  String get triageReasonDeadlinePassed => 'موعده النهائي قد مضى';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'هذا متأخر بـ$count يوم',
      many: 'هذا متأخر بـ$count يومًا',
      few: 'هذا متأخر بـ$count أيام',
      two: 'هذا متأخر بيومين',
      one: 'هذا متأخر بيوم واحد',
      zero: 'هذا متأخر بـ$count يوم',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'هذا مستحق اليوم';

  @override
  String get triageReasonCriticalDueSoon =>
      'أنت وسمته بأنه حرِج وموعده النهائي قريب';

  @override
  String get triageReasonAllStepsDone => 'كل الخطوات تمّت، ولم يبقَ إلا إنهاؤه';

  @override
  String get triageReasonDueTomorrow => 'هذا مستحق غدًا';

  @override
  String get triageReasonReminderSoon =>
      'أنت ضبطت له تذكيرًا خلال اليوم القادم';

  @override
  String get triageReasonDueWithinThreeDays => 'هذا مستحق خلال ثلاثة أيام';

  @override
  String get triageReasonCriticalNoDeadline =>
      'أنت وسمته بأنه حرِج، وليس له موعد نهائي';

  @override
  String get triageReasonDueWithinSevenDays => 'هذا مستحق خلال أسبوع';

  @override
  String get triageReasonImportant => 'أنت وسمته بأنه مهم';

  @override
  String get triageReasonDueLater => 'موعده النهائي أبعد';

  @override
  String get triageReasonNoDeadline => 'ليس له موعد نهائي ولا شيء فيه مُلِحّ';

  @override
  String cardCompletedTooltip(String title) {
    return 'منجز: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'افهم هذا المستند';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'ما هو، وما المهم فيه، وما العمل بشأنه.';

  @override
  String get toolSectionWhatThisIs => 'ما هذا المستند';

  @override
  String get toolSectionWhatMatters => 'ما المهم فيه';

  @override
  String get toolSectionKeyDetails => 'التفاصيل الأساسية';

  @override
  String get toolTitleAskDocument => 'اسأل عن مصدر';

  @override
  String get toolDescriptionAskDocument =>
      'إجابات مستندة إلى ما اخترته — أو لا شيء.';

  @override
  String get toolSectionNoAnswer => 'لا إجابة في هذا المحتوى';

  @override
  String get toolSectionNoAnswerBody =>
      'لم يجد Action ذلك في المستند الذي اخترته.';

  @override
  String get toolSectionAnswer => 'الإجابة';

  @override
  String get toolSectionFromTheDocument => 'من المستند';

  @override
  String get toolWarningQuoteNotFound =>
      'الاقتباس الذي تستند إليه هذه الإجابة ليس موجودًا في المحتوى الذي اخترته. عامِل الإجابة على أنها غير موثوقة.';

  @override
  String get toolTitleSmartSummary => 'لخّص';

  @override
  String get toolDescriptionSmartSummary =>
      'النسخة القصيرة — أو النسخة التي تغيّر ما عليك فعله.';

  @override
  String get toolSectionKeyPoints => 'النقاط الأساسية';

  @override
  String get toolTitleCompareDocuments => 'قارن المستندات';

  @override
  String get toolDescriptionCompareDocuments =>
      'ما الذي تغيّر، وما الذي يتعارض، وما الذي لم يُعثر عليه.';

  @override
  String get toolSectionWhatDiffers => 'ما الذي يختلف';

  @override
  String get toolSectionConflicts => 'التعارضات';

  @override
  String get toolSectionOnlyInOne => 'ما ورد في واحد منها فقط';

  @override
  String get toolSectionInCommon => 'المشترك بينها';

  @override
  String get sensitiveKindEmail => 'عنوان بريد إلكتروني';

  @override
  String get sensitiveKindPhone => 'رقم هاتف';

  @override
  String get sensitiveKindPaymentCard => 'رقم بطاقة دفع';

  @override
  String get sensitiveKindIban => 'حساب بنكي (IBAN)';

  @override
  String get sensitiveKindNationalId => 'رقم هوية وطنية';

  @override
  String get sensitiveKindPostcode => 'رمز بريدي';

  @override
  String get sensitiveKindAccountNumber => 'رقم حساب';

  @override
  String get sensitiveKindReference => 'رقم مرجعي';

  @override
  String get sensitiveKindDateOfBirth => 'تاريخ الميلاد';

  @override
  String get sensitiveKindUrl => 'عنوان ويب';

  @override
  String get verdictVerifiedProvenance => 'يتوفّر إثبات منشأ مُتحقَّق منه';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'يحمل هذا الملف توقيعًا جرى فحصه فاجتاز الفحص.';

  @override
  String get verdictSignalsSynthetic =>
      'إشارات تتوافق مع محتوى مولَّد بالذكاء الاصطناعي';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'يقول هذا الملف إنه أُنشئ بأداة توليدية. والبيانات الوصفية يمكن تعديلها أو إزالتها، فهذا ما يدّعيه الملف، وليس دليلًا.';

  @override
  String get verdictSignalsEdited => 'إشارات تتوافق مع محتوى جرى تعديله';

  @override
  String get verdictSignalsEditedExplainer =>
      'يقول هذا الملف إنه مرّ ببرنامج تحرير. وهذا أمر عادي في الصور، ولا يعني بحد ذاته أن شيئًا قد زُوِّر.';

  @override
  String get verdictNoReliableProvenance => 'لم يُعثر على بيانات منشأ موثوقة';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'لا توجد بيانات منشأ في هذا الملف. وهذا أمر عادي — إذ تزيلها معظم الخدمات — وهو لا يدل على شيء.';

  @override
  String get verdictInconclusive => 'غير حاسم';

  @override
  String get verdictInconclusiveExplainer =>
      'ليس هنا ما يكفي من المعلومات لتحديد من أين جاء هذا.';

  @override
  String get authenticitySignalCamera => 'الكاميرا';

  @override
  String get authenticitySignalSoftware => 'البرنامج';

  @override
  String get authenticitySignalDescription => 'الوصف';

  @override
  String get authenticitySignalCopyright => 'حقوق النشر';

  @override
  String get authenticitySignalLocation => 'الموقع';

  @override
  String get authenticitySignalLocationValue =>
      'توجد بيانات موقع في هذا الملف.';

  @override
  String get authenticitySignalContentCredentials =>
      'بيانات اعتماد المحتوى (Content Credentials)';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'لم يُفحص — لا يحتوي هذا الإصدار على أداة للتحقّق من التوقيع.';

  @override
  String get authenticitySignalFile => 'الملف';

  @override
  String get authenticitySignalFileUnreadableValue => 'تعذّرت قراءته كصورة.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'ليست صيغة صورة معروفة.';

  @override
  String get authenticitySignalText => 'النص';

  @override
  String get authenticitySignalTextValue =>
      'النص وحده لا يمكنه أن يبيّن بموثوقية ما إذا كان قد استُخدم فيه ذكاء اصطناعي. ولا يخمّن Action.';

  @override
  String get fileTypePng => 'صورة PNG';

  @override
  String get fileTypeJpeg => 'صورة JPEG';

  @override
  String get fileTypeGif => 'صورة GIF';

  @override
  String get fileTypeWebp => 'صورة WebP';

  @override
  String get fileTypeWav => 'تسجيل WAV';

  @override
  String get fileTypePdf => 'مستند PDF';

  @override
  String get fileTypeHeic => 'صورة HEIC';

  @override
  String get fileTypeVideo => 'ملف فيديو';

  @override
  String get fileTypeTiff => 'صورة TIFF';

  @override
  String get fileTypeBitmap => 'صورة نقطية';

  @override
  String get fileTypeRtf => 'مستند RTF';

  @override
  String get fileTypeZip => 'أرشيف Zip';

  @override
  String get fileTypeGzip => 'أرشيف gzip';

  @override
  String get fileTypeSevenZip => 'أرشيف 7-Zip';

  @override
  String get fileTypeRar => 'أرشيف RAR';

  @override
  String get fileTypeWindowsProgram => 'برنامج Windows';

  @override
  String get fileTypeLinuxProgram => 'برنامج Linux';

  @override
  String get fileTypePostScript => 'مستند PostScript';

  @override
  String get fileTypeOgg => 'تسجيل Ogg';

  @override
  String get fileTypeMp3 => 'تسجيل MP3';

  @override
  String get fileTypePlainText => 'نص عادي';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'اسم هذا الملف \".$extension\" لكن محتواه $contents. وقد يكون ذلك خطأً غير مقصود، وهو أيضًا الطريقة التي يُفتح بها ملف ببرنامج غير الذي توقّعته.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count بايت',
      many: '$count بايتًا',
      few: '$count بايتات',
      two: 'بايتان',
      one: 'بايت واحد',
      zero: '$count بايت',
    );
    return '$_temp0';
  }

  @override
  String fileSizeKilobytes(String size) {
    return '$size ك.ب';
  }

  @override
  String fileSizeMegabytes(String size) {
    return '$size م.ب';
  }

  @override
  String fileSizeGigabytes(String size) {
    return '$size ج.ب';
  }

  @override
  String get credentialKindPrivateKey => 'مفتاح خاص';

  @override
  String get credentialKindApiKey => 'مفتاح API';

  @override
  String get credentialKindConnectionString => 'سلسلة اتصال';

  @override
  String get credentialKindAccessToken => 'رمز وصول';

  @override
  String get credentialKindAuthorizationHeader => 'ترويسة Authorization';

  @override
  String get credentialKindPasswordOrKey => 'كلمة مرور أو مفتاح';

  @override
  String get credentialKindPossibleSecret => 'سرّ محتمل';

  @override
  String get credentialAdvicePrivateKey =>
      'أزل هذا قبل المشاركة، واستبدل زوج المفاتيح. فالمفتاح الخاص لا يمكن أن يعود آمنًا بعد أن يُرى.';

  @override
  String get credentialAdviceProviderApiKey =>
      'ألغِ هذا المفتاح لدى المزوّد وأصدر غيره. وإزالته من المستند لا تُعطّله.';

  @override
  String get credentialAdviceConnectionString =>
      'هذه تحمل كلمة المرور والعنوان الذي تفتحه معًا. غيّر كلمة المرور إن كنت قد شاركتها من قبل.';

  @override
  String get credentialAdviceJsonWebToken =>
      'الرموز المماثلة تنتهي صلاحيتها غالبًا، لكن ليس دائمًا. عامله على أنه فعّال ما لم تكن تعرف متى تنتهي صلاحيته.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'أزل قيمة الترويسة. فسجلّات الطلبات الملصوقة من أكثر الطرق شيوعًا في مشاركة رمز فعّال دون قصد.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'انقل هذا إلى متغيّر بيئة أو إلى مخزن أسرار، وغيّر القيمة إن كنت قد شاركت الملف.';

  @override
  String get credentialAdviceHighEntropyString =>
      'لا يستطيع Action تحديد ما هذا. تحقّق منه قبل المشاركة — فقد يكون معرّفًا أو مجموع تحقّق بالقدر نفسه.';

  @override
  String get credentialLabelAnthropicApiKey => 'مفتاح API من Anthropic';

  @override
  String get credentialLabelOpenAiProjectKey => 'مفتاح مشروع من OpenAI';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'مفتاح API بنمط OpenAI';

  @override
  String get credentialLabelGoogleApiKey => 'مفتاح API من Google';

  @override
  String get credentialLabelGoogleOAuthToken => 'رمز OAuth من Google';

  @override
  String get credentialLabelGitHubToken => 'رمز GitHub';

  @override
  String get credentialLabelSlackToken => 'رمز Slack';

  @override
  String get credentialLabelAwsAccessKeyId => 'معرّف مفتاح وصول AWS';

  @override
  String get credentialLabelGitLabToken => 'رمز GitLab';

  @override
  String get credentialLabelNpmToken => 'رمز npm';

  @override
  String get credentialLabelPassphrase => 'عبارة مرور';

  @override
  String get credentialLabelPassword => 'كلمة مرور';

  @override
  String get credentialLabelRefreshToken => 'رمز التحديث';

  @override
  String get credentialLabelToken => 'رمز مميّز';

  @override
  String get credentialLabelClientSecret => 'سرّ العميل';

  @override
  String get credentialLabelCredential => 'بيانات اعتماد';

  @override
  String get credentialLabelSecret => 'سرّ';

  @override
  String get linkVerdictNoObviousSignals => 'لا مؤشرات ظاهرة';

  @override
  String get linkVerdictWorthChecking => 'يستحق نظرة';

  @override
  String get linkVerdictTreatWithCaution => 'تعامل معه بحذر';

  @override
  String get linkSummaryNoObviousSignals =>
      'لا شيء غير معتاد في طريقة كتابة هذا الرابط. وهذا ليس مثل معرفة أنّ الصفحة جديرة بالثقة — وحدك من يمكنه الحكم على ما إذا كنت تتوقّع هذا الرابط.';

  @override
  String get linkSummaryWorthChecking =>
      'في هذا الرابط أمر واحد يستحق النظر قبل أن تفتحه.';

  @override
  String get linkSummaryTreatWithCaution =>
      'عدة أمور في طريقة كتابة هذا الرابط تستحق التحقق قبل أن تفتحه.';

  @override
  String get linkSignalNotHttps => 'غير مشفَّر';

  @override
  String get linkSignalNonWebScheme => 'ليس رابط ويب';

  @override
  String get linkSignalEmbeddedCredentials => 'كلمة مرور داخل الرابط';

  @override
  String get linkSignalMisleadingAuthority => 'العنوان الحقيقي مخفيّ';

  @override
  String get linkSignalIpLiteralHost => 'عنوان رقمي';

  @override
  String get linkSignalPunycodeHost => 'أحرف مرمَّزة في الاسم';

  @override
  String get linkSignalMixedScriptHost => 'أبجديات مختلطة في الاسم';

  @override
  String get linkSignalEncodedHost => 'رموز هروب في الاسم';

  @override
  String get linkSignalUnusualPort => 'منفذ غير معتاد';

  @override
  String get linkSignalDeepSubdomain => 'أجزاء كثيرة في الاسم';

  @override
  String get linkSignalPublicSuffixInSubdomain => 'اسم مألوف في غير موضعه';

  @override
  String get linkSignalShortener => 'رابط مختصَر';

  @override
  String get linkSignalExecutableTarget => 'ينزّل برنامجًا';

  @override
  String get linkSignalRedirectParameter => 'قد ينقلك إلى مكان آخر';

  @override
  String get linkSignalVeryLongUrl => 'طويل جدًا';

  @override
  String get linkSignalUnparseable => 'رابط تعذّرت قراءته';

  @override
  String get linkDetailNotHttps =>
      'يستخدم هذا الرابط http، فكل ما تكتبه في الصفحة يمكن أن يُقرأ في الطريق إليها.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'يبدأ هذا بـ«$scheme:» لا بصفحة ويب. وقد يطلب من تطبيق آخر أن يفعل شيئًا.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'اسم مستخدم وكلمة مرور مكتوبان داخل هذا الرابط. وأينما شُورِك الرابط، انتقلا معه.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'يتجاهل المتصفّح كل ما قبل «@». والوجهة الحقيقية هي «$host».';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'يذهب هذا إلى «$host» — عنوان خام لا اسم. والمواقع الشرعية تكاد تستخدم اسمًا دائمًا.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'يحتوي اسم الموقع على أحرف غير لاتينية، مخزَّنة بترميز. وهذا أمر عادي في لغات كثيرة، وهو أيضًا ما يتيح جعل اسم يبدو كاسم مألوف.';

  @override
  String get linkDetailMixedScriptHost =>
      'يمزج اسم الموقع أحرفًا لاتينية بأحرف من أبجدية أخرى تبدو مطابقة لها. اقرأه حرفًا حرفًا.';

  @override
  String get linkDetailEncodedHost =>
      'يحتوي اسم الموقع على رموز هروب، وليس هذا موضعها. ويمكنها أن تخفي ما يقوله الاسم فعلًا.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'يتّصل هذا عبر المنفذ $port بدلًا من المنفذ المعتاد. وهذا شائع في خوادم الاختبار وغير معتاد في المواقع العامة.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'للاسم $count جزء. والجزآن الأخيران وحدهما يحدّدان من يدير الموقع؛ أما البقية فيمكن ضبطها على أي شيء.',
      many:
          'للاسم $count جزءًا. والجزآن الأخيران وحدهما يحدّدان من يدير الموقع؛ أما البقية فيمكن ضبطها على أي شيء.',
      few:
          'للاسم $count أجزاء. والجزآن الأخيران وحدهما يحدّدان من يدير الموقع؛ أما البقية فيمكن ضبطها على أي شيء.',
      two: 'للاسم جزآن. والجزآن الأخيران وحدهما يحدّدان من يدير الموقع؛ أما البقية فيمكن ضبطها على أي شيء.',
      one: 'للاسم جزء واحد. والجزآن الأخيران وحدهما يحدّدان من يدير الموقع؛ أما البقية فيمكن ضبطها على أي شيء.',
      zero: 'لا أجزاء في الاسم. والجزآن الأخيران وحدهما يحدّدان من يدير الموقع؛ أما البقية فيمكن ضبطها على أي شيء.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'يحتوي هذا الاسم على «.$suffix.» في وسطه، ما يجعل بدايته تبدو وكأنها الموقع. والموقع في الحقيقة هو «$host».';
  }

  @override
  String get linkDetailShortener =>
      'تخفي خدمة الاختصار الوجهة الحقيقية. ولا يمكنك معرفة إلى أين يذهب هذا دون فتحه.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'ينتهي هذا الرابط بـ«$fileExtension»، فهو ينزّل شيئًا يمكن أن يعمل على جهازك، لا صفحة تقرؤها.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'يحمل هذا الرابط عنوانًا ثانيًا في خانة «$parameter»، وفتحه قد يأخذك إلى مكان غير «$host».';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'الروابط الطويلة أصعب في القراءة، والجزء الذي يحدّد الوجهة قد يُدفع خارج مجال النظر.';

  @override
  String get linkDetailUnparseable =>
      'لم يستطع Action قراءة هذا كعنوان ويب. وكن حذرًا مع الروابط التي لا تبدو روابط.';

  @override
  String get toolTitleRedaction => 'إخفاء التفاصيل الحساسة';

  @override
  String get toolDescriptionRedaction =>
      'اعثر على ما لا ينبغي مشاركته، واصنع نسخة خالية منه.';

  @override
  String get toolSectionRedactionNothingToScan => 'لا شيء لفحصه';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'تقرأ هذه الأداة النصوص. اختر ملاحظة أو رسالة ملصوقة أو التقاطًا قُرئ نصه.';

  @override
  String get toolSectionRedactionNothingFound => 'لم يُعثر على شيء ظاهر';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'لم يجد Action في هذا النص عناوين بريد إلكتروني ولا أرقام هواتف ولا أرقام بطاقات ولا أرقامًا مرجعية.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شيء يستحق الإخفاء',
      many: '$count شيئًا يستحق الإخفاء',
      few: '$count أشياء تستحق الإخفاء',
      two: 'شيئان يستحقان الإخفاء',
      one: 'شيء واحد يستحق الإخفاء',
      zero: 'لا شيء يستحق الإخفاء',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'نسخة منقَّحة';

  @override
  String get toolWarningRedactionCoverage =>
      'تعثر هذه الأداة على أنماط مثل عناوين البريد وأرقام الهواتف وأرقام الحسابات. ولن تلتقط كل ما هو حسّاس — اقرأ النسخة قبل أن تشاركها.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'لا يستطيع Action تنقيح الصور ولا ملفات PDF. فتغطية شيء داخل صورة تُبقي الأصل تحتها، ولذلك لا تُعرض هذه الإمكانية.';

  @override
  String get toolTitleAuthenticity => 'افحص مصدر هذا';

  @override
  String get toolDescriptionAuthenticity => 'ما يصرّح به الملف عن أصله.';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'لا شيء لمعاينته';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'اختر صورة أو نصًا.';

  @override
  String get toolSectionAuthenticityFileSignals => 'ما يقوله هذا الملف عن نفسه';

  @override
  String get toolSectionAuthenticityFileItself => 'الملف نفسه';

  @override
  String get toolSectionFileContents => 'المحتوى';

  @override
  String get toolSectionFileUnknownFormat => 'صيغة لا يعرفها Action';

  @override
  String get toolSectionFileSize => 'الحجم';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'يعرض هذا ما يصرّح به الملف عن نفسه. والبيانات الوصفية يمكن تعديلها أو إزالتها، فليس أيٌّ منها دليلًا. لا تستخدم هذا لاتهام أحد.';

  @override
  String get toolTitleCredentialScanner => 'ابحث عن المفاتيح وكلمات المرور';

  @override
  String get toolDescriptionCredentialScanner =>
      'اعثر على بيانات الاعتماد قبل أن تشارك شيئًا.';

  @override
  String get toolSectionCredentialNothingToCheck => 'لا نصّ للفحص';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'الصق نصًا، أو اختر التقاطًا قُرئ نصه. وهذه الأداة تقرأ النصوص فقط.';

  @override
  String get toolSectionCredentialNoneFound => 'لم يُعثر على بيانات اعتماد';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'لم يجد Action في هذا النص شيئًا على هيئة مفتاح API أو مفتاح خاص أو رمز مميّز أو كلمة مرور.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'عُثر على $count من بيانات الاعتماد',
      many: 'عُثر على $count من بيانات الاعتماد',
      few: 'عُثر على $count من بيانات الاعتماد',
      two: 'عُثر على بيانات اعتماد اثنتين',
      one: 'عُثر على بيانات اعتماد واحدة',
      zero: 'لم يُعثر على بيانات اعتماد',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شيء قد يكون سرًّا',
      many: '$count شيئًا قد يكون سرًّا',
      few: '$count أشياء قد تكون أسرارًا',
      two: 'شيئان قد يكونان سرَّين',
      one: 'شيء واحد قد يكون سرًّا',
      zero: 'لا شيء قد يكون سرًّا',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'نسخة أُزيلت منها بيانات الاعتماد';

  @override
  String get toolWarningCredentialRevoke =>
      'إزالة مفتاح من مستند لا تُعطّله. وإذا كان أحدها قد شُورِك بالفعل، فأبطِل صلاحيته لدى المزوّد وأصدر واحدًا جديدًا.';

  @override
  String get toolWarningCredentialCoverage =>
      'تعثر هذه الأداة على بيانات الاعتماد ذات الهيئة المعروفة. أما كلمة مرور مكتوبة داخل جملة فلن يُعثر عليها، فاقرأ النص أيضًا.';

  @override
  String get toolTitleLinkInspector => 'افحص رابطًا';

  @override
  String get toolDescriptionLinkInspector =>
      'ما يكشفه العنوان عن نفسه قبل أن تفتحه.';

  @override
  String get toolSectionLinkNoneFound => 'لم يُعثر على روابط';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'الصق رابطًا، أو اختر التقاطًا يحتوي على رابط.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رابط في هذا النص',
      many: '$count رابطًا في هذا النص',
      few: '$count روابط في هذا النص',
      two: 'الرابطان في هذا النص',
      one: 'الرابط في هذا النص',
      zero: 'لا روابط في هذا النص',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'تعذّرت قراءته';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary.‏ $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'لا شيء غير معتاد في طريقة كتابتها';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'وهذا ليس مثل معرفة أنّ الصفحات جديرة بالثقة. وحدك من يمكنه الحكم على ما إذا كنت تتوقّعها.';

  @override
  String get toolWarningLinkAddressOnly =>
      'يقرأ Action العنوان فقط. فهو لا يفتح الرابط، ولا يستعلم عن الموقع، ولا يسأل أي خدمة سمعة — لأن فعل ذلك يرسل تصفّحك إلى جهة أخرى.';

  @override
  String get toolWarningLinkNoSignals =>
      'الرابط الذي لا مؤشرات فيه يمكن أن يكون ضارًا رغم ذلك. تجد هذه الأداة مشكلات في طريقة كتابة العنوان، وهذا ليس كل ما ينبغي معرفته عن وجهته.';

  @override
  String get toolSectionObjective => 'هدفك';

  @override
  String get toolSectionCurrentState => 'ما وصل إليه الهدف';

  @override
  String get toolSectionRecommendedNextStep => 'الخطوة التالية المقترحة';

  @override
  String get toolSectionCredentialAdvice => 'ما عليك فعله';

  @override
  String get toolSectionSummary => 'الملخّص';

  @override
  String get toolDetailSeparator => '‏ — ‏';
}
