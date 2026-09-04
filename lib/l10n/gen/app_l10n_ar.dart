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
}
