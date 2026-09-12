// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppL10nHi extends AppL10n {
  AppL10nHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonDone => 'हो गया';

  @override
  String get commonSave => 'सेव करें';

  @override
  String get commonClose => 'बंद करें';

  @override
  String get commonBack => 'वापस';

  @override
  String get commonRetry => 'फिर कोशिश करें';

  @override
  String get commonDelete => 'हटाएँ';

  @override
  String get commonRemove => 'निकालें';

  @override
  String get commonContinue => 'जारी रखें';

  @override
  String get commonOpen => 'खोलें';

  @override
  String get commonCopy => 'कॉपी';

  @override
  String get commonCopied => 'कॉपी हो गया';

  @override
  String get commonEdit => 'संपादित करें';

  @override
  String get commonAdd => 'जोड़ें';

  @override
  String get commonOn => 'चालू';

  @override
  String get commonOff => 'बंद';

  @override
  String get commonUnknown => 'अज्ञात';

  @override
  String get commonChecking => 'जाँच रहे हैं…';

  @override
  String get commonSettings => 'सेटिंग्स';

  @override
  String get commonDismiss => 'हटाएँ';

  @override
  String get commonUndo => 'पहले जैसा करें';

  @override
  String get commonSkip => 'छोड़ें';

  @override
  String get commonNotNow => 'अभी नहीं';

  @override
  String get commonSomethingWentWrong => 'कुछ गड़बड़ हो गई।';

  @override
  String get navToday => 'आज';

  @override
  String get navLibrary => 'लाइब्रेरी';

  @override
  String get navIntelligence => 'इंटेलिजेंस';

  @override
  String get navSearch => 'खोज';

  @override
  String get navCapture => 'कुछ कैप्चर करें';

  @override
  String get todayGreetingMorning => 'सुप्रभात';

  @override
  String get todayGreetingAfternoon => 'नमस्कार';

  @override
  String get todayGreetingEvening => 'शुभ संध्या';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'आपके काम लोड नहीं हो सके। वे अब भी इसी डिवाइस पर सुरक्षित हैं।';

  @override
  String get todaySectionNeedsAttention => 'ध्यान चाहिए';

  @override
  String get todaySectionAlsoNeedsAttention => 'इन्हें भी ध्यान चाहिए';

  @override
  String get todaySectionWaitingForReview => 'समीक्षा की प्रतीक्षा में';

  @override
  String get todaySectionComingUp => 'आगे आ रहा है';

  @override
  String todaySeeAllCaptures(int count) {
    return 'सभी $count कैप्चर देखें';
  }

  @override
  String get todaySeeAllInLibrary => 'लाइब्रेरी में सब देखें';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पूरे',
      one: '1 पूरा',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count काम पूरे हुए। लाइब्रेरी खोलें।',
      one: '1 काम पूरा हुआ। लाइब्रेरी खोलें।',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'इससे शुरू करें';

  @override
  String get todayQuickPhoto => 'फ़ोटो';

  @override
  String get todayQuickScreenshot => 'स्क्रीनशॉट';

  @override
  String get todayQuickText => 'टेक्स्ट';

  @override
  String get todayQuickTools =>
      'कोई लिंक जाँचें, या टेक्स्ट में कुंजियाँ खोजें';

  @override
  String get briefBadgeNeedsYou => 'आपकी ज़रूरत है';

  @override
  String get briefBadgeToReview => 'समीक्षा के लिए';

  @override
  String get briefBadgeAhead => 'आगे';

  @override
  String get briefBadgeStartHere => 'यहाँ से शुरू करें';

  @override
  String get briefBadgeClear => 'सब साफ़';

  @override
  String get briefNext => 'अगला';

  @override
  String briefOpenAction(String title) {
    return '$title खोलें';
  }

  @override
  String briefMarkDone(String title) {
    return '\"$title\" को पूरा चिह्नित करें';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कामों को आपके ध्यान की ज़रूरत है',
      one: '1 काम को आपके ध्यान की ज़रूरत है',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कैप्चर भी समीक्षा की प्रतीक्षा में हैं।',
      one: '1 कैप्चर भी समीक्षा की प्रतीक्षा में है।',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कैप्चर आपका इंतज़ार कर रहे हैं',
      one: '1 कैप्चर आपका इंतज़ार कर रहा है',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'कुछ भी देर से नहीं है।';

  @override
  String get briefHeadlineNothingToday => 'आज किसी को आपकी ज़रूरत नहीं';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count काम आगे आ रहे हैं।',
      one: '1 काम आगे आ रहा है।',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'आपका सब साफ़ है';

  @override
  String get briefDetailClear => 'न कुछ बकाया है, न कुछ प्रतीक्षा में।';

  @override
  String get briefHeadlineFirstRun => 'कुछ भी लेकर शुरू करें';

  @override
  String get briefDetailFirstRun =>
      'एक चिट्ठी, एक स्क्रीनशॉट, एक नोट — Action समझ लेगा कि यह क्या है।';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsSectionPersonalise => 'अपने मुताबिक़';

  @override
  String get settingsAppearance => 'रूप';

  @override
  String get settingsAppearanceDescription =>
      'हल्का, गहरा, या जो डिवाइस कर रहा है।';

  @override
  String get settingsLanguageDescription =>
      'जिस भाषा में Action आपसे बात करता है।';

  @override
  String get appearanceSystem => 'सिस्टम';

  @override
  String get appearanceLight => 'हल्का';

  @override
  String get appearanceDark => 'गहरा';

  @override
  String get appearanceSystemDescription => 'डिवाइस की सेटिंग के अनुसार';

  @override
  String get appearanceLightDescription => 'हमेशा हल्का';

  @override
  String get appearanceDarkDescription => 'हमेशा गहरा';

  @override
  String get languageTitle => 'भाषा';

  @override
  String get languageSubtitle =>
      'बदलाव तुरंत लागू होते हैं। कुछ भी कहीं नहीं भेजा जाता; चुनाव इसी डिवाइस पर रहता है।';

  @override
  String get languageSectionChoose => 'भाषा चुनें';

  @override
  String get languageSystem => 'सिस्टम';

  @override
  String get languageSystemDescription => 'डिवाइस की भाषा के अनुसार';

  @override
  String get languageDraftNote =>
      'Action के शब्द मूल रूप से अंग्रेज़ी में लिखे गए हैं। बाकी अनुवाद एक तय शब्दावली के आधार पर तैयार किए गए और अपने-आप जाँचे गए हैं, पर अब तक किसी मूल वक्ता ने उन्हें नहीं पढ़ा। जहाँ शब्दों की सटीकता मायने रखती है — निजता, सुरक्षा, और Action क्या दावा करता है और क्या नहीं — वहाँ अंग्रेज़ी ही संदर्भ है।';

  @override
  String get ocrScriptTitle => 'पाठ पहचान';

  @override
  String get ocrScriptSubtitle =>
      'वह लिपि जिसे Action किसी फ़ोटो में पढ़ता है। पहचान इसी डिवाइस पर होती है; पढ़ने के लिए कोई कैप्चर कहीं नहीं भेजा जाता।';

  @override
  String get ocrScriptSectionChoose => 'लिपि';

  @override
  String get ocrScriptFollowLanguage => 'ऐप की भाषा का पालन करें';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'अभी $script';
  }

  @override
  String get ocrScriptLatin => 'रोमन';

  @override
  String get ocrScriptChinese => 'चीनी';

  @override
  String get ocrScriptDevanagari => 'देवनागरी';

  @override
  String get ocrScriptJapanese => 'जापानी';

  @override
  String get ocrScriptKorean => 'कोरियाई';

  @override
  String get ocrScriptLatinDescription =>
      'अंग्रेज़ी, स्पेनिश, फ़्रेंच, जर्मन और रोमन अक्षरों में लिखी जाने वाली बाकी भाषाएँ।';

  @override
  String get ocrScriptChineseDescription => 'सरलीकृत और पारंपरिक चीनी।';

  @override
  String get ocrScriptDevanagariDescription =>
      'हिन्दी, मराठी और नेपाली। बांग्ला, तमिल या तेलुगु नहीं — इनमें से हर एक की लिपि अलग है।';

  @override
  String get ocrScriptJapaneseDescription => 'जापानी।';

  @override
  String get ocrScriptKoreanDescription => 'कोरियाई।';

  @override
  String get ocrScriptFootnote =>
      'रोमन के अलावा हर विकल्प रोमन अक्षर भी पढ़ता है, इसलिए कोई एक चुनना लिपि को बदलता नहीं, जोड़ता है। यह बदलाव अब से ली गई फ़ोटो पर लागू होता है, पहले पढ़ी जा चुकी फ़ोटो पर नहीं।';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action $language लिपि नहीं पढ़ सकता';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'इसके लिए डिवाइस पर कोई पहचानकर्ता नहीं है। फ़ोटो में रोमन अक्षरों में लिखा जो कुछ भी होगा वह फिर भी पढ़ा जाएगा, बाकी खाली लौटेगा। आप वह पाठ ख़ुद टाइप या पेस्ट कर सकते हैं।';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action अभी $script पढ़ने के लिए सेट है। अगर यह फ़ोटो किसी और लिपि में है, तो सेटिंग्स में बदलकर इसे दोबारा पढ़वाएँ।';
  }

  @override
  String get settingsTextRecognition => 'पाठ पहचान';

  @override
  String get settingsTextRecognitionDescription =>
      'वह लिपि जिसे Action फ़ोटो में पढ़ता है।';

  @override
  String get settingsIntelligenceFootnote =>
      'Action बिना AI के भी चलता है। अपना प्रोवाइडर जोड़ने पर दस्तावेज़ विश्लेषण, योजना और मसौदा लिखने के टूल जुड़ जाते हैं।';

  @override
  String get settingsAiProvider => 'AI प्रोवाइडर';

  @override
  String get settingsAiNotConnected =>
      'जुड़ा नहीं है। अपना खाता और API कुंजी इस्तेमाल करें।';

  @override
  String settingsAiConnected(String provider) {
    return '$provider से जुड़ा है।';
  }

  @override
  String get settingsSectionPrivacySecurity => 'निजता और सुरक्षा';

  @override
  String get settingsSecurity => 'सुरक्षा';

  @override
  String get settingsWhereInfoLives => 'आपकी जानकारी कहाँ रहती है';

  @override
  String get settingsWhereInfoLivesDescription =>
      'क्या इस डिवाइस पर रहता है, और क्या नहीं।';

  @override
  String get protectionAppLock => 'ऐप लॉक';

  @override
  String get protectionScreenPrivacy => 'स्क्रीन निजता';

  @override
  String get protectionPrivateReminders => 'निजी रिमाइंडर';

  @override
  String get protectionSummaryNone =>
      'ऐप लॉक, स्क्रीन निजता, और क्या इस डिवाइस से बाहर जाता है।';

  @override
  String protectionSummaryOne(String first) {
    return '$first चालू है।';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first और $second चालू हैं।';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second और $third चालू हैं।';
  }

  @override
  String get settingsSectionReminders => 'रिमाइंडर';

  @override
  String get settingsRemindersFootnote =>
      'बैटरी सेटिंग्स और डिवाइस के इस्तेमाल के हिसाब से Android रिमाइंडर आपके तय समय से थोड़ा बाद में दिखा सकता है।';

  @override
  String get settingsNotifications => 'सूचनाएँ';

  @override
  String get settingsNotificationsOnDescription =>
      'आपके सेट किए रिमाइंडर दिखाए जा सकते हैं।';

  @override
  String get settingsNotificationsOffDescription =>
      'Action के लिए बंद हैं, इसलिए रिमाइंडर नहीं दिखेंगे।';

  @override
  String get settingsNotificationsUnknown => 'जाँचा नहीं जा सका।';

  @override
  String get settingsNotificationsAllowed => 'अनुमति है';

  @override
  String get settingsOpenSystemSettings => 'सेटिंग्स खोलें';

  @override
  String get settingsActionFootnote =>
      'Action बिखरी जानकारी को साफ़ अगले कदमों में बदल देता है। सहेजे जाने से पहले हर चीज़ की पुष्टि आप करते हैं।';

  @override
  String get settingsHelp => 'सहायता';

  @override
  String get settingsHelpDescription =>
      'Action कैसे काम करता है, और क्या नहीं करेगा।';

  @override
  String get settingsVersion => 'संस्करण';

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'अभी-अभी';

  @override
  String relativeMinutes(int count) {
    return '$count मिनट पहले';
  }

  @override
  String relativeHours(int count) {
    return '$count घंटे पहले';
  }

  @override
  String get relativeYesterday => 'कल';

  @override
  String relativeDays(int count) {
    return '$count दिन पहले';
  }

  @override
  String get libraryTitle => 'लाइब्रेरी';

  @override
  String get librarySubtitle =>
      'Action ने आपके लिए जो कुछ रखा है, सब यहाँ है। और यह सब इसी डिवाइस पर रहता है।';

  @override
  String get librarySegmentActions => 'काम';

  @override
  String get librarySegmentCaptures => 'कैप्चर';

  @override
  String get librarySegmentGoals => 'लक्ष्य';

  @override
  String get librarySegmentDone => 'पूरे';

  @override
  String get libraryNewGoal => 'नया लक्ष्य';

  @override
  String get libraryNoGoalsTitle => 'अभी कोई लक्ष्य नहीं';

  @override
  String get libraryNoGoalsMessage =>
      'लक्ष्य वह है जो आप होते हुए देखना चाहते हैं। क्या छूट रहा है, क्या अटका है और पहले क्या करना है — Action यह खोज सकता है।';

  @override
  String get libraryNoDoneTitle => 'अभी कुछ पूरा नहीं हुआ';

  @override
  String get libraryNoDoneMessage =>
      'आप जो काम पूरे करेंगे, वे यहाँ रखे जाएँगे।';

  @override
  String get libraryNoOpenTitle => 'कोई खुला काम नहीं';

  @override
  String get libraryNoOpenMessage =>
      'कुछ कैप्चर करें, Action समझ लेगा कि क्या करना है।';

  @override
  String get libraryNoCapturesTitle => 'अभी कुछ कैप्चर नहीं हुआ';

  @override
  String get libraryNoCapturesMessage =>
      'आपके जोड़े गए फ़ोटो, स्क्रीनशॉट और टेक्स्ट पहले यहीं आते हैं। जब तक आप न कहें, कुछ भी विश्लेषित नहीं होता।';

  @override
  String get libraryGoalNoActions => 'इससे अभी कुछ नहीं बना';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'इस लक्ष्य से $count काम',
      one: 'इस लक्ष्य से 1 काम',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'कामों और कैप्चर में खोजें';

  @override
  String get searchClear => 'साफ़ करें';

  @override
  String get searchPrivacyNote =>
      'खोज इसी डिवाइस पर होती है। यहाँ आप जो लिखते हैं, उसमें से कुछ भी बाहर नहीं जाता।';

  @override
  String get searchYouCanSearch => 'आप खोज सकते हैं';

  @override
  String get searchFieldTitles => 'शीर्षक';

  @override
  String get searchFieldTitlesExample => 'कार बीमा नवीनीकरण';

  @override
  String get searchFieldReferences => 'संदर्भ संख्याएँ';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'संस्थाएँ';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'किसी काम के भीतर के कदम';

  @override
  String get searchFieldStepsExample => 'फ़ॉर्म अपलोड करें';

  @override
  String get searchFieldCaptureText => 'कैप्चर से पढ़ा गया पाठ';

  @override
  String get searchFieldCaptureTextExample => 'नवीनीकरण सूचना';

  @override
  String searchNoMatchesTitle(String query) {
    return '\"$query\" के लिए कुछ नहीं मिला';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'कम शब्द आज़माएँ, या संदर्भ संख्या ठीक वैसे ही लिखें जैसे वह दिखती है।';

  @override
  String get searchNoMatchesClearFilters =>
      'कम शब्द आज़माएँ, या फ़िल्टर हटा दें।';

  @override
  String get searchFilterActive => 'चालू';

  @override
  String get searchFilterCompleted => 'पूरे';

  @override
  String get searchFilterOverdue => 'समय बीत चुका';

  @override
  String get searchFilterThisWeek => 'इस हफ़्ते';

  @override
  String get searchFilterCritical => 'अति आवश्यक';

  @override
  String get searchFilterCreatedByYou => 'आपके बनाए';

  @override
  String get searchFilterArchived => 'संग्रहित';

  @override
  String get searchFilterClear => 'फ़िल्टर हटाएँ';

  @override
  String get searchIncompleteActions =>
      'आपके कामों में खोजा नहीं जा सका, इसलिए ये नतीजे अधूरे हो सकते हैं।';

  @override
  String get searchIncompleteCaptures =>
      'आपके कैप्चर में खोजा नहीं जा सका, इसलिए ये नतीजे अधूरे हो सकते हैं।';

  @override
  String get searchIncompleteBoth =>
      'न आपके कामों में और न कैप्चर में खोजा जा सका, इसलिए ये नतीजे अधूरे हो सकते हैं।';

  @override
  String get searchMatchTitle => 'शीर्षक';

  @override
  String get searchMatchNextStep => 'अगला कदम';

  @override
  String get searchMatchStep => 'कदम';

  @override
  String get searchMatchSummary => 'सारांश';

  @override
  String get searchMatchFromCapture => 'कैप्चर से';

  @override
  String get studioSuggested => 'आपके पिछले कैप्चर के लिए सुझाव';

  @override
  String get studioRecentlyUsed => 'हाल में इस्तेमाल';

  @override
  String get studioReady => 'तैयार';

  @override
  String get studioNotConnected => 'जुड़ा नहीं';

  @override
  String get studioHeroTitle => 'Action इंटेलिजेंस';

  @override
  String get studioConnectedBlurb =>
      'कोई दस्तावेज़ समझें, लक्ष्य बेहतर करें, योजना बनाएँ, जवाब का मसौदा लिखें, या सामने जो है उसे जाँचें।';

  @override
  String studioDisconnectedBlurb(int count) {
    return 'दस्तावेज़ समझने, योजना बनाने और लिखने के लिए $count टूल। इस्तेमाल के लिए अपना AI खाता जोड़ें — शुल्क आपका प्रोवाइडर लेता है, Action कभी नहीं।';
  }

  @override
  String get studioConnectAi => 'AI जोड़ें';

  @override
  String get studioHowItWorks => 'यह कैसे काम करता है';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'इनमें से $count अभी भी उस सबके बिना चलते हैं, पूरी तरह इसी डिवाइस पर।',
      one: 'इनमें से 1 अभी भी उस सबके बिना चलता है, पूरी तरह इसी डिवाइस पर।',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'इसी डिवाइस पर चलता है';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title। $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title। $description इसी डिवाइस पर चलता है।';
  }

  @override
  String get categoryUnderstand => 'समझें';

  @override
  String get categoryUnderstandBlurb => 'आपके पास जो है, उसका मतलब निकालें।';

  @override
  String get categoryPlan => 'योजना';

  @override
  String get categoryPlanBlurb => 'इसे ऐसी चीज़ में बदलें जो आप कर सकें।';

  @override
  String get categoryCreate => 'बनाएँ';

  @override
  String get categoryCreateBlurb => 'लिखें, सुधारें, अनुवाद करें।';

  @override
  String get categoryExtract => 'निकालें';

  @override
  String get categoryExtractBlurb => 'जो ब्यौरे मायने रखते हैं, वे निकालें।';

  @override
  String get categoryVerify => 'जाँचें';

  @override
  String get categoryVerifyBlurb => 'सामने जो है उसे जाँचें।';

  @override
  String get captureSheetTitle => 'कुछ कैप्चर करें';

  @override
  String get captureSheetSubtitle =>
      'जो पूरा पढ़ने का मन न हो, वह Action को दे दें।';

  @override
  String get captureTakePhoto => 'फ़ोटो लें';

  @override
  String get captureTakePhotoSubtitle => 'सामने रखी चिट्ठी, बिल या सूचना';

  @override
  String get captureChooseImage => 'कोई छवि चुनें';

  @override
  String get captureChooseImageSubtitle =>
      'इस डिवाइस पर पहले से मौजूद स्क्रीनशॉट या फ़ोटो';

  @override
  String get capturePasteText => 'टेक्स्ट पेस्ट करें';

  @override
  String get capturePasteTextSubtitle => 'कोई ईमेल, संदेश या सूचना';

  @override
  String get captureChoosePdf => 'PDF चुनें';

  @override
  String get captureChoosePdfSubtitle =>
      'आपके पास पहले से मौजूद विवरण, चिट्ठी या फ़ॉर्म';

  @override
  String get captureFootnote =>
      'कैप्चर इसी डिवाइस पर रहते हैं। जब तक आप न कहें, ऑनलाइन कुछ भी विश्लेषित नहीं होता।';

  @override
  String get captureCouldNotOpen =>
      'वह नहीं खुल सका। किसी और तरीके से आज़माएँ।';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title। $subtitle';
  }

  @override
  String get stageReading => 'पढ़ा जा रहा है';

  @override
  String get stageNeedsReview => 'समीक्षा चाहिए';

  @override
  String get stageActionCreated => 'काम बन गया';

  @override
  String get stageNoText => 'कोई पाठ नहीं मिला';

  @override
  String get stageCouldNotBeRead => 'पढ़ा नहीं जा सका';

  @override
  String get stageReadingPreview => 'पाठ पढ़ा जा रहा है…';

  @override
  String get stageFailedPreview => 'यह इस डिवाइस पर पढ़ा नहीं जा सका।';

  @override
  String get provenancePhoto => 'फ़ोटो से लिया गया';

  @override
  String get provenanceImage => 'छवि से लिया गया';

  @override
  String get provenancePastedText => 'पेस्ट किए पाठ से लिया गया';

  @override
  String get provenanceDocument => 'दस्तावेज़ के रूप में जोड़ा गया';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'पूरा हुआ $when';
  }

  @override
  String metaOverdue(String date) {
    return 'समय बीता · समय था $date';
  }

  @override
  String get metaDueToday => 'आज तक';

  @override
  String metaDueOn(String date) {
    return '$date तक';
  }

  @override
  String get metaCreatedByYou => 'आपका बनाया';

  @override
  String get categoryPayment => 'भुगतान';

  @override
  String get categoryRenewal => 'नवीनीकरण';

  @override
  String get categoryAppointment => 'मुलाक़ात';

  @override
  String get categoryBooking => 'बुकिंग';

  @override
  String get categoryTravel => 'यात्रा';

  @override
  String get categoryDeadline => 'समय-सीमा';

  @override
  String get categoryResponse => 'जवाब चाहिए';

  @override
  String get categoryDelivery => 'डिलीवरी';

  @override
  String get categoryDocument => 'दस्तावेज़';

  @override
  String get categoryNoActionRequired => 'कुछ करने को नहीं';

  @override
  String get categoryUnsure => 'पक्का नहीं';

  @override
  String get errorEnterManually => 'ख़ुद लिखकर डालें';

  @override
  String get sourceWhatWeRead => 'हमने जो पढ़ा';

  @override
  String get sourceDelete => 'कैप्चर हटाएँ';

  @override
  String get sourceGone => 'वह कैप्चर अब उपलब्ध नहीं है।';

  @override
  String get sourceDeleteTitle => 'यह कैप्चर हटाएँ?';

  @override
  String get sourceDeleteBody =>
      'तस्वीर और उससे पढ़ा गया पाठ इस डिवाइस से हटा दिए जाते हैं।';

  @override
  String get sourceDeleteKeep => 'रहने दें';

  @override
  String get sourceOpenAction => 'काम खोलें';

  @override
  String sourceOpenActions(int count) {
    return '$count काम खोलें';
  }

  @override
  String get sourceCreateAnother => 'इससे एक और बनाएँ';

  @override
  String get sourceCreateAction => 'इससे एक काम बनाएँ';

  @override
  String get sourceDoMore => 'इसके साथ और करें';

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
    return '$format $size KB से';
  }

  @override
  String get sourceTextFound => 'पाठ मिला';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines पंक्तियाँ · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'यह वह पाठ है जो Action ने पढ़ा। इससे जो बना, वह नीचे है।';

  @override
  String get sourceNotInterpreted =>
      'अभी तक कुछ भी समझा नहीं गया है। Action सुझाएगा कि इसका क्या किया जाए, और कुछ भी बनने से पहले आप पुष्टि करते हैं।';

  @override
  String get sourceNoTextExplainer =>
      'ऐसा हस्तलेख में, बहुत कम रोशनी में, या ऐसी लिपि में हो सकता है जिसे यह डिवाइस अभी नहीं पढ़ पाता।';

  @override
  String get sourceReadFailed => 'इसे पढ़ा नहीं जा सका';

  @override
  String get sourceReadFailedReason => 'पाठ पहचान पूरी नहीं हुई।';

  @override
  String get sourceTryReadingAgain => 'फिर से पढ़ने की कोशिश करें';

  @override
  String get sourceTypeInstead => 'इसके बजाय ब्योरा टाइप करें';

  @override
  String get sourceTypeWhatItSays => 'जो लिखा है वह टाइप करें';

  @override
  String get sourceTypeHint => 'तारीख़ें, रकम, और क्या माँगा जा रहा है।';

  @override
  String get sourceMadeFromThis => 'इस कैप्चर से बना';

  @override
  String sourceMadeFromThisCount(int count) {
    return 'इस कैप्चर से $count बने';
  }

  @override
  String get sourceTheDocument => 'दस्तावेज़';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पृष्ठ',
      one: '1 पृष्ठ',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'पृष्ठों की संख्या अज्ञात';

  @override
  String get sourceDocumentNotRead =>
      'Action ने यह नहीं पढ़ा कि इस दस्तावेज़ के अंदर क्या है। जब आप ऐसा कोई उपकरण चलाएँगे जिसे इसकी ज़रूरत है, तो फ़ाइल आपके जोड़े हुए AI प्रदाता के पास जाएगी, और ऐसा होने से पहले आपको बता दिया जाएगा।';

  @override
  String get previewSaveFailed => 'वह सहेजा नहीं जा सका। फिर कोशिश करें।';

  @override
  String get previewTitle => 'कैप्चर जाँच लें';

  @override
  String get previewImageFailed => 'वह तस्वीर खोली नहीं जा सकी।';

  @override
  String get previewHint =>
      'देख लें कि पाठ पढ़ने लायक है और कुछ ज़रूरी कटा नहीं है।';

  @override
  String get previewRetake => 'दोबारा लें';

  @override
  String get pasteTitle => 'पाठ पेस्ट करें';

  @override
  String get pasteHint =>
      'वह ईमेल, संदेश या सूचना पेस्ट करें जिसे आप पूरा पढ़ना नहीं चाहते।';

  @override
  String get pasteFootnote =>
      'जिसमें तारीख़, रकम या कोई माँग हो, वह अच्छा काम करता है।';

  @override
  String get pasteEnough => 'लगता है काम चलाने भर है।';

  @override
  String get pasteMore => 'थोड़ा और पाठ बेहतर नतीजा देगा।';

  @override
  String get reviewLoadFailed => 'यह कैप्चर लोड नहीं हो सका।';

  @override
  String get reviewConfirmed => 'पुष्ट';

  @override
  String get reviewNeedsReview => 'समीक्षा चाहिए';

  @override
  String get reviewReview => 'समीक्षा करें';

  @override
  String get reviewHighConfidence => 'भरोसा ऊँचा';

  @override
  String get reviewConfirmedByYou => 'आपने पुष्ट किया';

  @override
  String get reviewMissing => 'नदारद';

  @override
  String get reviewNotUnderstood =>
      'Action इस स्रोत का पर्याप्त हिस्सा भरोसे के साथ नहीं समझ पाया।';

  @override
  String get reviewNotUnderstoodBody =>
      'कैप्चर सही-सलामत है और कुछ खोया नहीं। आप ब्योरा ख़ुद भर सकते हैं, और स्रोत संदर्भ के लिए जुड़ा रहता है।';

  @override
  String get reviewEnterDetails => 'ब्योरा भरें';

  @override
  String get reviewKeepSource => 'स्रोत बाद के लिए रखें';

  @override
  String reviewEngine(String engine) {
    return 'इंजन: $engine';
  }

  @override
  String get reviewManualNotice =>
      'यह काम आप ख़ुद बना रहे हैं। सिर्फ़ वही इस्तेमाल होगा जो आप यहाँ भरते हैं।';

  @override
  String get reviewUntitled => 'बिना शीर्षक का काम';

  @override
  String get reviewEditTitle => 'शीर्षक बदलें';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मानों की आपकी समीक्षा चाहिए।',
      one: 'इसकी पुष्टि से पहले 1 मान की आपकी समीक्षा चाहिए।',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'मुख्य बातें';

  @override
  String get reviewNotFound => 'नहीं मिला';

  @override
  String get reviewSuggestedNextStep => 'सुझाया गया अगला कदम';

  @override
  String get reviewWhyThisMatters => 'यह क्यों मायने रखता है';

  @override
  String get reviewSteps => 'कदम';

  @override
  String get reviewAddStep => 'कदम जोड़ें';

  @override
  String get reviewInjectionNotice =>
      'इस स्रोत का कुछ पाठ दस्तावेज़ की जानकारी नहीं, बल्कि निर्देश जैसा लग रहा था, इसलिए Action ने उसे छोड़ दिया।';

  @override
  String get reviewLayoutNotice =>
      'इस दस्तावेज़ की सजावट में ऐसे संबंध हो सकते हैं जिन्हें पाठ निकालने की प्रक्रिया पूरी तरह नहीं बचा पाई। पुष्टि से पहले नीचे के मानों को स्रोत से मिलाकर देखें।';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason नीचे के मानों को स्रोत से मिलाकर देखें।';
  }

  @override
  String get reviewDeadline => 'समय-सीमा';

  @override
  String get reviewAmount => 'रकम';

  @override
  String get reviewLeftUnset => 'कोई नहीं — आपने इसे खाली छोड़ना चुना';

  @override
  String get reviewUnclear => 'साफ़ नहीं';

  @override
  String get reviewNotSet => 'तय नहीं';

  @override
  String get reviewNoDeadlineFound => 'इस दस्तावेज़ में कोई नहीं मिली';

  @override
  String get reviewNoAmountFound => 'इस दस्तावेज़ में कोई रकम नहीं मिली';

  @override
  String get reviewMultipleDates => 'Action को कई संभावित तारीख़ें मिलीं।';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count तारीख़ें समय-सीमा हो सकती हैं। सही वाली चुनें, कोई और भरें, या खाली छोड़ दें।';
  }

  @override
  String get reviewChooseDate => 'तारीख़ चुनें';

  @override
  String get reviewMultipleAmounts =>
      'Action को एक से ज़्यादा संभावित रकम मिली।';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count रकमों में से कोई इस काम की हो सकती है। एक चुनें, कोई और भरें, या खाली छोड़ दें।';
  }

  @override
  String get reviewChooseAmount => 'रकम चुनें';

  @override
  String get reviewSkipStep => 'यह कदम छोड़ें';

  @override
  String get reviewKeepStep => 'यह कदम रखें';

  @override
  String get reviewEditStep => 'कदम बदलें';

  @override
  String get reviewCreateManually => 'ख़ुद बनाएँ';

  @override
  String get reviewConfirmAndCreate => 'पुष्टि करें और काम बनाएँ';

  @override
  String get reviewFixHighlighted => 'चिह्नित खाने देखें';

  @override
  String get reviewSaving => 'सहेजा जा रहा है…';

  @override
  String get reviewSaveFailed =>
      'यह काम सहेजा नहीं जा सका। कुछ खोया नहीं — फिर कोशिश करें।';

  @override
  String get reviewFieldTitle => 'शीर्षक';

  @override
  String get reviewTitleHint => 'क्या होना चाहिए?';

  @override
  String get reviewNewStep => 'नया कदम';

  @override
  String get reviewStepHint => 'क्या करना है';

  @override
  String get reviewDatesConflict => 'दस्तावेज़ में एक से ज़्यादा तारीख़ है।';

  @override
  String get reviewAmountsConflict => 'दस्तावेज़ में एक से ज़्यादा रकम है।';

  @override
  String get reviewAnotherDate => 'कोई और तारीख़ — 2026-08-30';

  @override
  String get reviewBadDate =>
      'यह असली तारीख़ नहीं है। 2026-08-30 का रूप इस्तेमाल करें।';

  @override
  String get reviewTypeDate =>
      'कोई तारीख़ टाइप करें, या नीचे इसे खाली छोड़ दें।';

  @override
  String get reviewUseThisDate => 'यही तारीख़ लें';

  @override
  String get reviewLeaveNoDeadline => 'बिना समय-सीमा के आगे बढ़ें';

  @override
  String get reviewAnotherAmount => 'कोई और रकम — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'यह रकम इस्तेमाल नहीं हो सकती: $reason।';
  }

  @override
  String get reviewUseThisAmount => 'यही रकम लें';

  @override
  String get reviewLeaveNoAmount => 'बिना रकम के आगे बढ़ें';

  @override
  String get reviewThisValue => 'यह मान';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => 'कैप्चर पर देखें';

  @override
  String get reviewViewSource => 'स्रोत देखें';

  @override
  String get reviewFromSource => 'स्रोत से';

  @override
  String get reviewNotVerified => 'मिलान नहीं हुआ';

  @override
  String get reviewCouldNotVerify => 'इसका स्रोत से मिलान नहीं किया जा सका।';

  @override
  String get reviewLooksRight => 'सही लगता है';

  @override
  String get reviewStageReading => 'स्रोत पढ़ा जा रहा है';

  @override
  String get reviewStageUnderstanding => 'ज़रूरी ब्योरा समझा जा रहा है';

  @override
  String get reviewStageChecking => 'देखा जा रहा है कि किसकी समीक्षा चाहिए';

  @override
  String get reviewNothingToDo => 'अभी आपको कुछ करने की ज़रूरत नहीं।';

  @override
  String get reviewInformationOnly =>
      'यह सिर्फ़ जानकारी लगती है — कोई समय-सीमा, भुगतान या जवाब की माँग नहीं मिली।';

  @override
  String get reviewInformationOnlyWithSource =>
      'यह सिर्फ़ जानकारी लगती है — इस कैप्चर में कोई समय-सीमा, भुगतान या जवाब की माँग नहीं मिली।';

  @override
  String get reviewSourceKept => 'स्रोत दोनों ही हाल में रखा जाता है।';

  @override
  String get reviewAddAnyway => 'फिर भी एक काम जोड़ें';

  @override
  String get reviewActionConfirmed => 'काम की पुष्टि हुई';

  @override
  String get reviewCreatedByYou => 'आपने बनाया।';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count समीक्षित तथ्यों के आधार पर आपने पुष्टि की।',
      one: '1 समीक्षित तथ्य के आधार पर आपने पुष्टि की।',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count समीक्षित तथ्यों के आधार पर आपने पुष्टि की। आपने उनमें से $edited बदले।',
      one:
          '1 समीक्षित तथ्य के आधार पर आपने पुष्टि की। आपने उनमें से $edited बदले।',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'इसी डिवाइस पर सहेजा गया।';

  @override
  String get detailLoadFailed =>
      'यह काम लोड नहीं हो सका। यह अब भी इसी डिवाइस पर सहेजा हुआ है।';

  @override
  String get detailNotFoundTitle => 'वह काम अब यहाँ नहीं है';

  @override
  String get detailNotFoundMessage => 'शायद इसे इसी डिवाइस पर हटा दिया गया हो।';

  @override
  String get detailGoBack => 'वापस जाएँ';

  @override
  String get detailMore => 'और';

  @override
  String get detailChangeUrgency => 'ज़रूरत का स्तर बदलें';

  @override
  String get detailAddRecommendedStep => 'सुझाया गया कदम जोड़ें';

  @override
  String get detailEditRecommendedStep => 'सुझाया गया कदम बदलें';

  @override
  String get detailArchiveTitle => 'यह काम संग्रह में डालें?';

  @override
  String get detailArchiveBody =>
      'यह आपकी सूची से हट जाता है पर मिटता नहीं, और जिस कैप्चर से यह बना वह भी रखा रहता है।';

  @override
  String get detailArchiveConfirm => 'संग्रह में डालें';

  @override
  String get detailArchived => 'संग्रह में';

  @override
  String detailCompletedOn(String date) {
    return '$date को पूरा हुआ';
  }

  @override
  String get detailSectionDetails => 'ब्योरा';

  @override
  String get detailSectionReminders => 'याद दिलाने वाले';

  @override
  String get detailAllStepsDone => 'सारे कदम पूरे';

  @override
  String get detailNextEyebrow => 'आगे';

  @override
  String get detailCompleteQuestion => 'यह काम पूरा करें?';

  @override
  String get detailMarkStepDone => 'कदम पूरा बताएँ';

  @override
  String get detailCompleteAction => 'यह काम पूरा करें';

  @override
  String get detailAddDeadline => 'समय-सीमा जोड़ें';

  @override
  String get detailAddAmount => 'रकम जोड़ें';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$total में से $completed पूरे';
  }

  @override
  String get detailNoStepsTitle => 'अभी कोई कदम नहीं';

  @override
  String get detailNoStepsMessage =>
      'इसे उन कामों में बाँटें जो आपको सचमुच करने हैं।';

  @override
  String get detailAddFirstStep => 'पहला कदम जोड़ें';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'पूरा हुआ कदम: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'अगला कदम: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'कदम: $title';
  }

  @override
  String detailMarkDone(String title) {
    return '“$title” को पूरा बताएँ';
  }

  @override
  String detailMarkNotDone(String title) {
    return '“$title” को अधूरा बताएँ';
  }

  @override
  String get detailStepOptions => 'कदम के विकल्प';

  @override
  String get detailMoveUp => 'ऊपर ले जाएँ';

  @override
  String get detailMoveDown => 'नीचे ले जाएँ';

  @override
  String get detailDeleteStep => 'कदम हटाएँ';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'यह कदम हटाएँ?';

  @override
  String get stepDeleteKeep => 'रहने दें';

  @override
  String get detailNoRemindersYet => 'अभी कोई याद दिलाने वाला नहीं।';

  @override
  String get detailReminderLimit =>
      'एक काम में इससे ज़्यादा याद दिलाने वाले नहीं हो सकते। दूसरा जोड़ने के लिए एक हटाएँ।';

  @override
  String get detailAddReminder => 'याद दिलाने वाला जोड़ें';

  @override
  String get detailChangeReminder => 'याद दिलाने वाला बदलें';

  @override
  String get detailRemoveReminder => 'याद दिलाने वाला हटाएँ';

  @override
  String get detailReminderFormat => 'EEE d MMM, h:mm a';

  @override
  String get reminderStatePending => 'अभी सेट नहीं हुआ';

  @override
  String get reminderStateNotificationsOff => 'सहेजा गया, पर सूचनाएँ बंद हैं';

  @override
  String get reminderStateFailed => 'शेड्यूल नहीं हो सका';

  @override
  String get reminderStateRemoving => 'हटाया जा रहा है…';

  @override
  String get reminderSetConfirmation =>
      'याद दिलाने वाला सेट हो गया। हम टोक देंगे।';

  @override
  String get reminderUpdatedConfirmation => 'याद दिलाने वाला बदल गया।';

  @override
  String get reminderNeedsPermission =>
      'सूचनाएँ बंद हैं, इसलिए यह याद दिलाने वाला सहेजा तो गया है पर अभी आपको बता नहीं सकता।';

  @override
  String get reminderScheduleFailed =>
      'यह याद दिलाने वाला सहेजा गया है, पर Android ने इसे शेड्यूल नहीं किया।';

  @override
  String get reminderLimitReached =>
      'उस काम में पहले से ही अधिकतम याद दिलाने वाले हैं।';

  @override
  String get reminderTimeInPast => 'वह समय बीत चुका है।';

  @override
  String get reminderAddTitle => 'याद दिलाने वाला जोड़ें';

  @override
  String get reminderChangeTitle => 'यह याद दिलाने वाला बदलें';

  @override
  String get reminderDateLabel => 'तारीख़';

  @override
  String get reminderTimeLabel => 'समय';

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
    return 'आपको $date को $time बजे याद दिलाया जाएगा।';
  }

  @override
  String get reminderTimePastError =>
      'वह समय बीत चुका है। कोई बाद का समय चुनें।';

  @override
  String get reminderSet => 'याद दिलाने वाला सेट करें';

  @override
  String get reminderPresetInHour => '1 घंटे में';

  @override
  String get reminderPresetTomorrowMorning => 'कल सुबह';

  @override
  String get reminderPresetNextWeek => 'अगले हफ़्ते';

  @override
  String get reminderPresetOnTheDay => 'उसी दिन';

  @override
  String get reminderPresetDayBefore => '1 दिन पहले';

  @override
  String get reminderPresetWeekBefore => '1 हफ़्ता पहले';

  @override
  String get reminderPresetAtDeadline => 'समय-सीमा पर';

  @override
  String get reminderPresetHourBefore => '1 घंटा पहले';

  @override
  String get editNextStepTitle => 'सुझाया गया अगला कदम';

  @override
  String get editNextStepSubtitle => 'अगले काम के बारे में एक छोटा वाक्य।';

  @override
  String get editNextStepHint => 'अगला काम की बात क्या है?';

  @override
  String get editRemoveSuggestion => 'सुझाव हटाएँ';

  @override
  String get editUrgencyTitle => 'यह कितना ज़रूरी है?';

  @override
  String get editStepHint => 'करने लायक एक ठोस चीज़';

  @override
  String get editAddStep => 'कदम जोड़ें';

  @override
  String get editDateHint => 'वववव-मम-दद';

  @override
  String get editRemoveDeadline => 'समय-सीमा हटाएँ';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => 'रकम सहेजें';

  @override
  String get editRemoveAmount => 'रकम हटाएँ';

  @override
  String get securityTitle => 'सुरक्षा और निजता';

  @override
  String get securitySectionProtection => 'सुरक्षा उपाय';

  @override
  String get securityAppLockUnavailable =>
      'ऐप लॉक के लिए इस डिवाइस पर स्क्रीन लॉक चाहिए। पहले डिवाइस सेटिंग्स में पिन, पैटर्न, पासवर्ड या फ़िंगरप्रिंट सेट करें।';

  @override
  String get securityAppLockOn =>
      'Action आपके डिवाइस से पुष्टि कराता है कि यह आप ही हैं।';

  @override
  String get securityAppLockOff =>
      'Action खोलने के लिए अपना फ़िंगरप्रिंट, चेहरा या डिवाइस पिन माँगें।';

  @override
  String get securityAskAgain => 'फिर पूछें';

  @override
  String get securityAskAgainDescription =>
      'लॉक होने से पहले Action कितनी देर पृष्ठभूमि में रह सकता है।';

  @override
  String get securityScreenPrivacy => 'स्क्रीन निजता';

  @override
  String get securityScreenPrivacyDescription =>
      'Android से कहें कि स्क्रीनशॉट और स्क्रीन रिकॉर्डिंग रोके, और ऐप स्विचर में Action को छिपाए।';

  @override
  String get securityPrivateReminders => 'निजी याद दिलाने वाले';

  @override
  String get securityPrivateRemindersOn =>
      'याद दिलाने वाले सिर्फ़ इतना कहते हैं कि कुछ आपका इंतज़ार कर रहा है।';

  @override
  String get securityPrivateRemindersOff =>
      'याद दिलाने वाले काम का शीर्षक दिखाते हैं। इसे चालू करें ताकि वह लॉक स्क्रीन पर न आए।';

  @override
  String get securityLockNow => 'अभी लॉक करें';

  @override
  String get securityLockNowDescription => 'बिना इंतज़ार किए दरवाज़ा बंद करें।';

  @override
  String get securitySectionStorage => 'आपका डेटा कैसे रखा जाता है';

  @override
  String get securityStorageDataLabel => 'आपके काम, कैप्चर और सेटिंग्स';

  @override
  String get securityStorageDataDetail =>
      'ये इसी ऐप के अपने निजी स्टोरेज में रहते हैं, जिसे दूसरे ऐप पढ़ नहीं सकते और जिसे Android डिवाइस एन्क्रिप्शन के हिस्से के तौर पर एन्क्रिप्ट करता है। Action इसके ऊपर अपनी दूसरी परत नहीं जोड़ता।';

  @override
  String get securityStorageKeyLabel => 'आपकी AI प्रदाता कुंजी';

  @override
  String get securityStorageKeyDetail =>
      'बाकी सब के साथ नहीं, बल्कि Android Keystore में रखी जाती है, और सहेजने के बाद दोबारा कभी नहीं दिखाई जाती।';

  @override
  String get securityStorageGapLabel => 'इससे क्या नहीं बचता';

  @override
  String get securityStorageGapDetail =>
      'इनमें से कुछ भी उस व्यक्ति से नहीं बचाता जो आपका खुला हुआ डिवाइस इस्तेमाल कर रहा हो, और बदला हुआ या रूट किया हुआ सिस्टम सामान्य से ज़्यादा पढ़ सकता है। ऐप लॉक वही सेटिंग है जो पहली स्थिति में मदद करती है।';

  @override
  String get securitySectionInformation => 'आपकी जानकारी';

  @override
  String get securityWhereInfoDescription =>
      'आपके डेटा के हर रास्ते, और वे दो जो इस डिवाइस से बाहर जाते हैं।';

  @override
  String get securityAppLockRefused => 'पुष्टि नहीं हुई, इसलिए कुछ नहीं बदला।';

  @override
  String get securityAppLockUnavailableToast =>
      'इस डिवाइस पर कोई स्क्रीन लॉक सेट नहीं है। डिवाइस सेटिंग्स में पिन, पैटर्न, पासवर्ड या फ़िंगरप्रिंट जोड़ें, फिर दोबारा कोशिश करें।';

  @override
  String get securityScreenPrivacyRefused =>
      'इस डिवाइस ने स्क्रीन निजता लागू नहीं की, इसलिए इसे चालू दिखाने के बजाय बंद ही रहने दिया गया।';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count निर्धारित याद दिलाने वाले अब कम बताते हैं।',
      one: '1 निर्धारित याद दिलाने वाला अब कम बताता है।',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count निर्धारित याद दिलाने वाले अपडेट हुए।',
      one: '1 निर्धारित याद दिलाने वाला अपडेट हुआ।',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'तुरंत';

  @override
  String get appLockDelayOneMinute => '1 मिनट बाद';

  @override
  String get appLockDelayFiveMinutes => '5 मिनट बाद';

  @override
  String get securityDelayImmediatelyDescription =>
      'जब भी Action स्क्रीन से हटे';

  @override
  String get securityDelayOneMinuteDescription =>
      'एक संदेश का जवाब देने भर का समय';

  @override
  String get securityDelayFiveMinutesDescription => 'एक कॉल लेने भर का समय';

  @override
  String get securityHeroProtected => 'सुरक्षित रखा गया';

  @override
  String get securityHeroNothingOn => 'कुछ भी चालू नहीं';

  @override
  String get securityHeroFootnote =>
      'यहाँ का सब कुछ इसी डिवाइस पर चलता है। इनमें से कोई भी सेटिंग कहीं नहीं भेजी जाती, और किसी को दूर से बदला नहीं जा सकता।';

  @override
  String get securityHeadlineNone => 'तीन सुरक्षा उपाय उपलब्ध हैं';

  @override
  String securityHeadlineOne(String first) {
    return '$first चालू है';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first और $second चालू हैं';
  }

  @override
  String get securityHeadlineAll => 'तीनों सुरक्षा उपाय चालू हैं';

  @override
  String get securityTransfersTitle => 'इस डिवाइस से क्या गया';

  @override
  String get securityTransfersNoProvider =>
      'कोई AI प्रदाता जुड़ा नहीं है, इसलिए विश्लेषण के लिए कुछ भी नहीं भेजा जा रहा।';

  @override
  String get securityTransfersDescription =>
      'जिस क्षण कुछ भेजा जाता है उसी क्षण यहाँ दर्ज होता है, चाहे जवाब आया हो या नहीं। सिर्फ़ उपकरण, प्रदाता और आकार — कभी भी उसमें क्या था वह नहीं। इसी डिवाइस पर 90 दिन रखा जाता है और कहीं नहीं भेजा जाता।';

  @override
  String get securityClear => 'मिटाएँ';

  @override
  String get securityNothingSent => 'कुछ भी नहीं भेजा गया';

  @override
  String get securityNothingSentDescription =>
      'जब आप ऐसा उपकरण चलाएँगे जो आपके AI प्रदाता का इस्तेमाल करता है, वह यहाँ दिखेगा।';

  @override
  String get securityClearHistoryTitle => 'यह इतिहास मिटाएँ?';

  @override
  String get securityClearHistoryBody =>
      'क्या-क्या भेजा गया, उसका रिकॉर्ड इस डिवाइस से हटा दिया जाएगा। यह पहले भेजी जा चुकी किसी चीज़ को वापस नहीं लाता।';

  @override
  String get securityUnnamedTool => 'एक Intelligence उपकरण';

  @override
  String get securityYourProvider => 'आपके AI प्रदाता';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पृष्ठ',
      one: '1 पृष्ठ',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ाइलें',
      one: '1 फ़ाइल',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'थोड़ा-सा पाठ';

  @override
  String securityTransferCharacters(int count) {
    return '$count हज़ार अक्षर';
  }

  @override
  String securitySentTo(String provider) {
    return '$provider को भेजा गया।';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '$provider को भेजा गया · $size।';
  }

  @override
  String relativeWeeks(int count) {
    return '$count हफ़्ते पहले';
  }

  @override
  String get helpTitle => 'मदद';

  @override
  String get helpAddQuestion => 'मैं क्या जोड़ सकता हूँ?';

  @override
  String get helpAddAnswer =>
      'एक स्क्रीनशॉट, किसी चिट्ठी या बिल की तस्वीर, या ऐसा पाठ जो आप पेस्ट करें। जिसमें तारीख़, रकम या कोई माँग हो, वह सबसे अच्छा चलता है।';

  @override
  String get helpReviewQuestion =>
      'Action मुझसे समीक्षा करने को क्यों कहता है?';

  @override
  String get helpReviewAnswer =>
      'क्योंकि दस्तावेज़ पढ़ने वाली मशीन उसे ग़लत पढ़ सकती है, और चुपचाप ग़लत समय-सीमा किसी समय-सीमा न होने से भी बुरी है। Action दिखाता है कि उसे क्या मिला और किन शब्दों से मिला, और जब तक आप पुष्टि नहीं करते तब तक कुछ नहीं सहेजा जाता।';

  @override
  String get helpVaryQuestion =>
      'दोबारा कोशिश करने पर नतीजे क्यों बदल जाते हैं?';

  @override
  String get helpVaryAnswer =>
      'आपका दस्तावेज़ पढ़ने वाली सेवा नियतात्मक नहीं है, इसलिए वही कैप्चर थोड़ा अलग लौट सकता है। समीक्षा का चरण इसीलिए भी है — आप वह हिस्सा हैं जो बदलता नहीं।';

  @override
  String get helpLateQuestion => 'मेरा याद दिलाने वाला देर से क्यों आया?';

  @override
  String get helpLateAnswer =>
      'याद दिलाने वाले Android के ज़रिए तय होते हैं, और Android ही तय करता है कि उन्हें ठीक कब पहुँचाना है। बैटरी बचत, Doze और निर्माता की पावर सेटिंग्स किसी को भी देर करा सकती हैं। Action कभी मिनट-दर-मिनट याद दिलाने का वादा नहीं करता।';

  @override
  String get helpDataQuestion => 'मेरा डेटा कहाँ है?';

  @override
  String get helpDataAnswer =>
      'लगभग सब कुछ इसी डिवाइस पर है: आपके कैप्चर, काम, कदम, याद दिलाने वाले और खोजें। दो अपवाद — जो सामग्री आप Action से पढ़वाना चाहते हैं वह उसे पढ़ने वाली AI सेवा को भेजी जाती है, और पुष्ट किए गए काम का एक छोटा रिकॉर्ड एक गुमनाम पहचान के तहत क्लाउड में रखा जा सकता है। सेटिंग्स में निजता और डेटा ठीक-ठीक बताता है कि उस रिकॉर्ड में क्या होता है।';

  @override
  String get helpBackupQuestion => 'क्या यह बैकअप है?';

  @override
  String get helpBackupAnswer =>
      'नहीं। क्लाउड रिकॉर्ड को नए डिवाइस पर वापस नहीं लाया जा सकता, और लॉग इन करने के लिए कोई खाता नहीं है। अगर आप Action हटा देते हैं या यह डिवाइस खो देते हैं, तो उस पर का डेटा चला जाता है।';

  @override
  String get helpCorrectQuestion => 'मैं किसी काम को कैसे ठीक करूँ?';

  @override
  String get helpCorrectAnswer =>
      'उसे खोलें और कोई भी खाना बदलें — शीर्षक, समय-सीमा, रकम या सुझाया गया अगला कदम। आप कदम कभी भी जोड़, क्रम बदल, पूरा और हटा सकते हैं। किसी काम को बदलना AI सेवा से कभी कुछ नहीं पूछता।';

  @override
  String get privacyTitle => 'निजता और डेटा';

  @override
  String get privacyIntro =>
      'Action जितना हो सके उतना इसी डिवाइस पर रखता है। दो चीज़ें अपवाद हैं, और दोनों नीचे दी गई हैं।';

  @override
  String get privacyGroupOnDevice => 'इस डिवाइस पर';

  @override
  String get privacyOnDeviceCaptures =>
      'कैप्चर — आपके जोड़े स्क्रीनशॉट, तस्वीरें और पाठ, और उनसे पढ़ा गया पाठ।';

  @override
  String get privacyOnDeviceActions =>
      'काम, उनके कदम, ब्योरे और याद दिलाने वाले।';

  @override
  String get privacyOnDeviceSearch =>
      'खोज। आपकी खोजें यहीं चलती हैं, कहीं नहीं भेजी जातीं, और स्क्रीन बंद करने के बाद रखी नहीं जातीं।';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'तस्वीरें उनके स्थान के बिना रखी जाती हैं। फ़ोन जो निर्देशांक, समय और कैमरे का ब्योरा तस्वीर के भीतर लिखता है, वे कैप्चर सहेजे जाने से पहले हटा दिए जाते हैं, इसलिए वे न यहाँ रहते हैं और न तब जाते हैं जब आप कोई कैप्चर अपने AI प्रदाता को भेजते हैं।';

  @override
  String get privacyGroupSentToRead => 'पढ़े जाने के लिए भेजा गया';

  @override
  String get privacySentToReadWhat =>
      'जब आप Action से किसी कैप्चर को समझने को कहते हैं, वह सामग्री उसे पढ़ने वाली AI सेवा को भेजी जाती है। यह डिवाइस पर चलने वाली AI नहीं है।';

  @override
  String get privacySentToReadWhen =>
      'सिर्फ़ वही कैप्चर भेजा जाता है जो आपने चुना, और सिर्फ़ तब जब आप कहते हैं।';

  @override
  String get privacyGroupYourProvider => 'आपके अपने AI प्रदाता को भेजा गया';

  @override
  String get privacyProviderWhat =>
      'अगर आप सेटिंग्स में कोई AI प्रदाता जोड़ते हैं, तो Intelligence उपकरण आपकी चुनी सामग्री उस प्रदाता को भेजते हैं — OpenAI, Anthropic, Google या आपका चुना कोई endpoint — आपकी अपनी API कुंजी से।';

  @override
  String get privacyProviderDirect =>
      'यह सीधे उन्हीं के पास जाता है। यह Action के किसी सर्वर से होकर नहीं गुज़रता।';

  @override
  String get privacyProviderScope =>
      'सिर्फ़ वही भेजा जाता है जो आप किसी उपकरण के लिए चुनते हैं, और सिर्फ़ तब जब आप उसे चलाते हैं। आपके बाकी काम, कैप्चर और स्रोत कभी शामिल नहीं होते, और पृष्ठभूमि में कभी कुछ नहीं भेजा जाता।';

  @override
  String get privacyProviderKey =>
      'आपकी API कुंजी इस डिवाइस के सुरक्षित स्टोरेज में रखी जाती है और सिर्फ़ उसी प्रदाता को भेजी जाती है जिसकी वह है। सुरक्षित स्टोरेज उस व्यक्ति के लिए असली अड़चन है जिसके पास आपका खुला डिवाइस हो, पर वह पूर्ण नहीं है, और Action इससे उलट कुछ नहीं कहेगा।';

  @override
  String get privacyProviderLocalTools =>
      'दो उपकरण कभी कुछ नहीं भेजते: संवेदनशील ब्योरे छिपाना, और यह जाँचना कि कोई फ़ाइल कहाँ से आई। दोनों पूरी तरह इसी डिवाइस पर चलते हैं।';

  @override
  String get privacyProviderAgreement =>
      'आप जो भेजते हैं उसका आपका प्रदाता क्या करता है, यह उनके साथ आपके समझौते से तय होता है, Action से नहीं।';

  @override
  String get privacyGroupCloud => 'क्लाउड में रखा गया';

  @override
  String get privacyCloudWhat =>
      'जब आप किसी काम की पुष्टि करते हैं, उसका एक छोटा रिकॉर्ड इस इंस्टॉलेशन की गुमनाम पहचान के तहत सहेजा जा सकता है: शीर्षक, स्थिति, ज़रूरत, श्रेणी, समय-सीमा, रकम, सुझाया गया अगला कदम और समय-मुहरें।';

  @override
  String get privacyCloudNotSent =>
      'आपके कैप्चर, उनसे पढ़ा गया पाठ, किसी काम के कदम और ब्योरे, और आपके याद दिलाने वाले नहीं भेजे जाते।';

  @override
  String get privacyCloudNotBackup =>
      'यह बैकअप नहीं है। इसे नए डिवाइस पर वापस लाने का कोई तरीक़ा नहीं है, और यह इंस्टॉलेशन खोने पर गुमनाम पहचान भी साथ चली जाती है।';

  @override
  String get privacyGroupDiagnostics => 'डायग्नोस्टिक्स';

  @override
  String get privacyDiagnosticsWhat =>
      'Action ऐप में क्या हो रहा है इसकी गुमनाम गिनती रखता है — कि कोई कैप्चर शुरू हुआ, कि कोई निष्कर्षण चला या नहीं, कि किसी खोज को कुछ नहीं मिला, कि कोई काम पूरा हुआ।';

  @override
  String get privacyDiagnosticsCounts =>
      'ये गिनतियाँ हैं, सामग्री नहीं। कोई शीर्षक, रकम, समय-सीमा, संदर्भ, कैप्चर किया पाठ या खोज शब्द कभी शामिल नहीं होता, और न ही गुमनाम पहचान या किसी काम या कैप्चर का कोई पहचानकर्ता।';

  @override
  String get privacyDiagnosticsCrash =>
      'अगर ऐप क्रैश होता है, तो त्रुटि और वह कहाँ हुई यह बताया जाता है ताकि उसे ठीक किया जा सके। Action उन रिपोर्टों के साथ आपका डेटा नहीं जोड़ता।';

  @override
  String get privacySectionYourData => 'आपका डेटा';

  @override
  String get privacyYourDataFootnote =>
      'कैप्चर मिटाने से आपके काम अपनी जगह रहते हैं। जिस काम का कैप्चर चला गया वह फिर भी चलता है; बस अब यह नहीं दिखाता कि वह किससे बना था।';

  @override
  String get privacyClearCaptures => 'कैप्चर मिटाएँ';

  @override
  String get privacyClearCapturesDescription =>
      'हर कैप्चर और उसकी तस्वीर फ़ाइल हटा देता है।';

  @override
  String get privacyDeleteAll => 'मेरा सारा डेटा हटाएँ';

  @override
  String get privacyDeleteAllDescription =>
      'काम, कदम, याद दिलाने वाले, कैप्चर और ऊपर दिए क्लाउड रिकॉर्ड।';

  @override
  String get privacyClearCapturesTitle => 'कैप्चर मिटाएँ?';

  @override
  String get privacyClearCapturesBody =>
      'हर कैप्चर और उसकी तस्वीर इस डिवाइस से हटा दी जाएगी। आपके काम बिल्कुल वैसे ही रहते हैं जैसे हैं।';

  @override
  String get privacyCapturesDeleted => 'कैप्चर हटा दिए गए।';

  @override
  String get privacyCapturesPartlyDeleted =>
      'कुछ कैप्चर हटाए नहीं जा सके। और कुछ नहीं बदला गया।';

  @override
  String get privacyDeleteAllTitle => 'आपका सारा डेटा हटाएँ?';

  @override
  String get privacyDeleteAllBody =>
      'यह इस डिवाइस के हर काम, कदम, याद दिलाने वाले और कैप्चर को, और ऊपर दिए क्लाउड रिकॉर्ड को हटा देता है। इसे वापस नहीं लाया जा सकता, और बहाल करने के लिए कोई बैकअप नहीं है।';

  @override
  String get privacyDeleteEverything => 'सब कुछ हटाएँ';

  @override
  String get privacyDeletedAll => 'सब कुछ हटा दिया गया।';

  @override
  String get privacyDeleteFailed => 'आपका डेटा हटाया नहीं जा सका।';

  @override
  String get privacyDeletedUnverified =>
      'इस डिवाइस का सब कुछ हटा दिया गया। Action क्लाउड तक नहीं पहुँच सका कि पुष्टि कर सके वहाँ कुछ बचा नहीं है, और वह फिर देखेगा।';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '$leftovers को छोड़कर हटा दिया गया।';
  }

  @override
  String get privacyWillTryAgain => 'Action फिर कोशिश करेगा।';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action क्लाउड की जाँच पूरी नहीं कर सका, और फिर कोशिश करेगा।';

  @override
  String get privacyLeftoverCaptures => 'कुछ कैप्चर';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लाउड रिकॉर्ड',
      one: '1 क्लाउड रिकॉर्ड',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first और $second';
  }

  @override
  String get privacyCloudDeleted => 'क्लाउड रिकॉर्ड हटा दिए गए।';

  @override
  String get privacyCloudUnreachable =>
      'फिर भी उन तक नहीं पहुँचा जा सका। Action फिर कोशिश करेगा।';

  @override
  String get privacyPendingTitle => 'अभी हटाना बाक़ी';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'पिछली बार $count क्लाउड रिकॉर्ड तक नहीं पहुँचा जा सका। Action ख़ुद फिर कोशिश करेगा, या आप अभी दोबारा कोशिश कर सकते हैं।',
      one: 'पिछली बार 1 क्लाउड रिकॉर्ड तक नहीं पहुँचा जा सका। Action ख़ुद फिर कोशिश करेगा, या आप अभी दोबारा कोशिश कर सकते हैं।',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'फिर कोशिश करें';

  @override
  String get evidenceTitle => 'यह कहाँ से आया';

  @override
  String get evidenceUnverified =>
      'Action को ये शब्द अपने पढ़े हुए पाठ में नहीं मिले, इसलिए इस मान का मिलान नहीं हुआ। इस पर भरोसा करने से पहले इसे मूल से मिलाकर देखें।';

  @override
  String get evidenceHighlighted =>
      'ये शब्द उस पाठ में थे जो Action ने इस कैप्चर से पढ़ा, और निशान दिखाता है कि कहाँ।';

  @override
  String get evidenceNoRegion =>
      'ये शब्द उस पाठ में थे जो Action ने इस कैप्चर से पढ़ा। तस्वीर में ये ठीक कहाँ हैं, यह पता नहीं चल सका, और यहाँ अंदाज़ा नहीं लगाया जाता।';

  @override
  String get evidenceInText => 'ये शब्द उस पाठ में थे जो इस कैप्चर में है।';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'अत्यावश्यक';

  @override
  String get urgencyImportant => 'ज़रूरी';

  @override
  String get urgencyNormal => 'सामान्य';

  @override
  String get urgencyLow => 'कम';

  @override
  String get urgencyUnsure => 'पक्का नहीं';

  @override
  String get detailSaveFailed =>
      'वह सहेजा नहीं जा सका। कुछ खोया नहीं — फिर कोशिश करें।';

  @override
  String get detailSectionCreatedFrom => 'किससे बना';

  @override
  String get detailSourceChecking => 'मूल कैप्चर ढूँढा जा रहा है…';

  @override
  String get detailSourceUnavailable => 'मूल कैप्चर अब उपलब्ध नहीं है।';

  @override
  String get detailReopenAction => 'काम फिर खोलें';

  @override
  String get detailMarkActionComplete => 'काम पूरा बताएँ';

  @override
  String get detailGetHelp => 'इसमें मदद लें';

  @override
  String get detailSectionHistory => 'इतिहास';

  @override
  String get detailHistoryShowLess => 'कम दिखाएँ';

  @override
  String detailHistoryShowAll(int count) {
    return 'सभी $count प्रविष्टियाँ दिखाएँ';
  }

  @override
  String get detailHistoryCreated => 'बनाया गया';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कदमों के साथ बनाया गया',
      one: '1 कदम के साथ बनाया गया',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'आपने ब्योरे की पुष्टि की';

  @override
  String detailHistoryStepFinished(String title) {
    return '“$title” पूरा किया';
  }

  @override
  String get detailHistoryAStep => 'एक कदम';

  @override
  String get detailHistoryReminderSet => 'आपने एक याद दिलाने वाला सेट किया';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'आपने $when के लिए एक याद दिलाने वाला सेट किया';
  }

  @override
  String get detailHistoryCompleted => 'पूरा बताया गया';

  @override
  String get detailHistoryChanged => 'आख़िरी बार बदला गया';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'कस्टम (OpenAI-संगत)';

  @override
  String get aiCapabilityText => 'पाठ';

  @override
  String get aiCapabilityImages => 'छवियाँ';

  @override
  String get aiCapabilityDocuments => 'दस्तावेज़';

  @override
  String get aiCapabilityStructuredResults => 'संरचित नतीजे';

  @override
  String get aiCapabilityStreaming => 'स्ट्रीमिंग';

  @override
  String get aiCapabilitySystemInstructions => 'सिस्टम निर्देश';

  @override
  String get aiCapabilityEvidenceCitations => 'प्रमाण के उद्धरण';

  @override
  String get aiCapabilityLongDocuments => 'लंबे दस्तावेज़';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a या $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head या $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'इस उपकरण को इस्तेमाल करने के लिए कोई AI प्रदाता जोड़ें।';

  @override
  String get aiFailureInvalidKey =>
      'उस API कुंजी को प्रदाता ने स्वीकार नहीं किया।';

  @override
  String get aiFailureQuotaExceeded =>
      'आपके प्रदाता खाते में क्रेडिट ख़त्म हो गया है, या उसका कोटा पूरा हो गया है।';

  @override
  String get aiFailureRateLimited =>
      'आपका प्रदाता अनुरोधों की दर सीमित कर रहा है। थोड़ी देर बाद फिर कोशिश करें।';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action आपके AI प्रदाता तक नहीं पहुँच सका। अपना कनेक्शन जाँचें।';

  @override
  String get aiFailureUnsupportedModel =>
      'वह मॉडल आपकी कुंजी के लिए उपलब्ध नहीं है। सेटिंग्स में कोई दूसरा चुनें।';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'आपने जो मॉडल चुना है वह $capabilities नहीं पढ़ सकता। सेटिंग्स में कोई दूसरा मॉडल चुनें।';
  }

  @override
  String get aiFailureContextTooLarge =>
      'यह इतनी सामग्री थी कि यह मॉडल उसे एक बार में नहीं पढ़ सकता।';

  @override
  String get aiFailureInputTooLargeText =>
      'यह इतना पाठ है कि एक बार में इसका विश्लेषण नहीं हो सकता।';

  @override
  String get aiFailureProviderUnavailable =>
      'आपके AI प्रदाता को दिक़्क़त आ रही है। थोड़ी देर बाद फिर कोशिश करें।';

  @override
  String get aiFailureMalformedResponse =>
      'उस प्रदाता ने ऐसा कुछ लौटाया जिसे Action पढ़ नहीं सका।';

  @override
  String get aiFailureCancelled => 'रोक दिया गया।';

  @override
  String get aiFailureInsecureEndpoint =>
      'वह endpoint एक https:// पता होना चाहिए।';

  @override
  String get aiFailureUnknown =>
      'आपके AI प्रदाता से बात करते हुए कुछ गड़बड़ हो गई।';

  @override
  String get appLockTitle => 'Action लॉक है';

  @override
  String get appLockPrompt =>
      'जारी रखने के लिए पुष्टि करें कि यह आप ही हैं। Action आपके डिवाइस से पूछता है — वह आपका फ़िंगरप्रिंट, चेहरा या पिन कभी नहीं देखता।';

  @override
  String get appLockUnlocking => 'अनलॉक हो रहा है…';

  @override
  String get appLockNotConfirmed =>
      'उसकी पुष्टि नहीं हुई। जब आप तैयार हों, फिर कोशिश करें।';

  @override
  String get appLockCannotConfirm =>
      'आपका डिवाइस अभी पुष्टि नहीं कर सकता कि यह आप ही हैं। देख लें कि डिवाइस सेटिंग्स में स्क्रीन लॉक अब भी सेट है।';

  @override
  String get appLockWaiting => 'इंतज़ार है…';

  @override
  String get appLockUnlock => 'अनलॉक करें';

  @override
  String get appLockReasonUnlock => 'Action अनलॉक करें';

  @override
  String get appLockReasonEnable =>
      'ऐप लॉक चालू करने से पहले पुष्टि करें कि यह आप ही हैं';

  @override
  String get appLockReasonDisable =>
      'ऐप लॉक बंद करने से पहले पुष्टि करें कि यह आप ही हैं';

  @override
  String get todayCapabilityHeading => 'Action क्या सँभालता है';

  @override
  String get todayCapabilityDocumentTitle => 'कोई चिट्ठी या बिल';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action इसे पढ़ता है और समय-सीमा, रकम और संदर्भ संख्या ढूँढता है।';

  @override
  String get todayCapabilityScreenshotTitle => 'कोई स्क्रीनशॉट';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'जो संदेश वरना भूल जाता, उसे ऐसी चीज़ में बदलें जो आप कर सकें।';

  @override
  String get todayCapabilityTextTitle => 'कुछ पाठ';

  @override
  String get todayCapabilityTextBlurb =>
      'कुछ भी पेस्ट करें। Action समझ लेता है कि यह क्या है और आपसे क्या माँगता है।';

  @override
  String get todayCapabilityConfirmTitle => 'हर चीज़ की पुष्टि आप करते हैं';

  @override
  String get todayCapabilityConfirmBlurb =>
      'जब तक आप प्रमाण देख न लें और हाँ न कह दें, तब तक कुछ भी काम नहीं बनता।';

  @override
  String get todayCapabilityExploreIntelligence => 'इंटेलिजेंस देखें';

  @override
  String get documentRejectedEmpty => 'वह फ़ाइल ख़ाली है।';

  @override
  String documentRejectedTooLarge(String size) {
    return 'वह दस्तावेज़ $size का है, जो Action के काम करने की सीमा से बड़ा है।';
  }

  @override
  String get documentRejectedNotAPdf =>
      'नाम चाहे जो हो, वह PDF नहीं है। Action PDF और छवियाँ पढ़ता है।';

  @override
  String get documentRejectedUnreadable => 'वह दस्तावेज़ पढ़ा नहीं जा सका।';

  @override
  String get pdfRejectedNotAPdf => 'नाम चाहे जो हो, वह फ़ाइल PDF नहीं है।';

  @override
  String get pdfRejectedEncrypted =>
      'वह PDF पासवर्ड से सुरक्षित है, इसलिए Action उसे पढ़ नहीं सकता।';

  @override
  String get pdfRejectedDamaged =>
      'वह PDF पढ़ी नहीं जा सकी। हो सकता है वह अधूरी हो।';

  @override
  String get shareRejectedEmpty => 'उस शेयर में पढ़ने लायक कुछ नहीं था।';

  @override
  String get shareRejectedUnsupportedType =>
      'Action पाठ, छवियाँ और PDF ले सकता है। वह कुछ और था।';

  @override
  String get shareRejectedContentMismatch =>
      'वह फ़ाइल उस तरह की नहीं है जैसा वह ख़ुद को बताती है, इसलिए Action ने उसे खोला नहीं है।';

  @override
  String get shareRejectedTooLarge =>
      'वह फ़ाइल इतनी बड़ी है कि Action उसके साथ काम नहीं कर सकता।';

  @override
  String get shareRejectedUnreadable => 'वह फ़ाइल पढ़ी नहीं जा सकी।';

  @override
  String get captureFailureRecognition => 'पाठ पहचान चल ही नहीं सकी।';

  @override
  String get captureFailureImageFormat =>
      'वह छवि प्रारूप इस डिवाइस पर पढ़ा नहीं जा सका।';

  @override
  String get connectSheetTitle => 'अपना AI जोड़ें';

  @override
  String get connectSheetSubtitle =>
      'आप अपना ही प्रदाता खाता और API कुंजी इस्तेमाल करते हैं। Action कुंजी को इस डिवाइस के सुरक्षित स्टोरेज में रखता है।';

  @override
  String get connectErrorKeyMissing =>
      'जारी रखने के लिए अपनी API कुंजी पेस्ट करें।';

  @override
  String get connectErrorModelMissing =>
      'कोई मॉडल चुनें, या मॉडल आईडी टाइप करें।';

  @override
  String get connectErrorEndpointMissing => 'अपने endpoint का पता जोड़ें।';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'इस डिवाइस का सुरक्षित स्टोरेज खोला नहीं जा सका, इसलिए कुंजी सहेजी नहीं गई।';

  @override
  String get connectTestSucceeded => 'जुड़ गया।';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'जुड़ गया। $count मॉडल उपलब्ध हैं।';
  }

  @override
  String get connectProviderLabel => 'प्रदाता';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'यह एक https:// पता होना चाहिए। Action आपके दस्तावेज़ बिना एन्क्रिप्शन वाले कनेक्शन पर नहीं भेजेगा।';

  @override
  String get connectApiKeyLabel => 'API कुंजी';

  @override
  String get connectApiKeyHint => 'अपनी कुंजी पेस्ट करें';

  @override
  String get connectKeyPrivacyNote =>
      'आपकी कुंजी इसी डिवाइस पर रहती है। Action इसे आपके चुने प्रदाता के अलावा कहीं नहीं भेजता, और सहेजने के बाद इसे आपको दोबारा नहीं दिखा सकता।';

  @override
  String get connectModelLabel => 'मॉडल';

  @override
  String get connectModelIdHint => 'मॉडल आईडी';

  @override
  String get connectModelFreeTextNote =>
      'प्रदाता मॉडल आईडी हटाते रहते हैं और नई जोड़ते रहते हैं। अगर आपको जो चाहिए वह सूची में नहीं है, तो उसे यहाँ टाइप करें।';

  @override
  String get connectAndTest => 'जोड़ें और जाँचें';

  @override
  String get connectSaveWithoutTesting => 'बिना जाँचे सहेजें';

  @override
  String get toolWarningFactsNotChecked =>
      'Action इसकी तुलना मूल पाठ से नहीं कर सका, इसलिए इसमें दी गई रकमों और तारीख़ों की जाँच नहीं हुई है।';

  @override
  String get toolTitleRewrite => 'इस लेखन को सुधारें';

  @override
  String get toolDescriptionRewrite =>
      'ज़्यादा साफ़, ज़्यादा छोटा या ज़्यादा औपचारिक — तथ्य ज्यों के त्यों।';

  @override
  String get toolModeRewriteClearer => 'ज़्यादा साफ़';

  @override
  String get toolModeRewriteProfessional => 'ज़्यादा पेशेवर';

  @override
  String get toolModeRewriteShorter => 'ज़्यादा छोटा';

  @override
  String get toolModeRewritePersuasive => 'ज़्यादा असरदार';

  @override
  String get toolModeRewriteSimpler => 'ज़्यादा सरल';

  @override
  String get toolModeRewriteStructured => 'ज़्यादा व्यवस्थित';

  @override
  String get toolModeRewriteGrammarOnly => 'सिर्फ़ व्याकरण';

  @override
  String get toolSectionWhatChanged => 'क्या बदला';

  @override
  String get toolSectionNote => 'नोट';

  @override
  String get toolSectionAlreadyClearBody =>
      'यह पहले से ही साफ़ था। नीचे दिए बदलाव मामूली हैं।';

  @override
  String get toolSectionImprovedText => 'सुधारा गया पाठ';

  @override
  String get toolTitleDraftReply => 'जवाब का मसौदा लिखें';

  @override
  String get toolDescriptionDraftReply =>
      'ऐसा जवाब जिसे आप संपादित कर सकते हैं और ख़ुद भेज सकते हैं।';

  @override
  String get toolModeReplyProfessional => 'पेशेवर';

  @override
  String get toolModeReplyConcise => 'संक्षिप्त';

  @override
  String get toolModeReplyFriendly => 'दोस्ताना';

  @override
  String get toolModeReplyFormal => 'औपचारिक';

  @override
  String get toolModeReplyClarification => 'स्पष्टीकरण माँगें';

  @override
  String get toolModeReplyConfirmation => 'प्राप्ति की पुष्टि';

  @override
  String get toolModeReplyDispute => 'इससे असहमति जताएँ';

  @override
  String get toolSectionSubject => 'विषय';

  @override
  String get toolSectionDraftReply => 'जवाब का मसौदा';

  @override
  String get toolSectionPlaceholders => 'ये आपको भरने हैं';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'मसौदा — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'यह एक मसौदा है। Action कुछ भी नहीं भेजता — इसे पढ़ें, संपादित करें, और ख़ुद भेजें।';

  @override
  String get toolTitleTranslate => 'अनुवाद करें';

  @override
  String get toolDescriptionTranslate =>
      'दूसरी भाषा, और उसमें संख्याएँ और नाम ज्यों के त्यों।';

  @override
  String get toolSectionTranslation => 'अनुवाद';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '$from से $to में';
  }

  @override
  String get toolSectionKeptInOriginal => 'मूल रूप में ही रखा गया';

  @override
  String get toolWarningTranslationNotCertified =>
      'समझने के लिए किया गया अनुवाद, प्रमाणित अनुवाद नहीं।';

  @override
  String get toolTitleStructuredData => 'तालिका निकालें';

  @override
  String get toolDescriptionStructuredData =>
      'पंक्तियाँ, खाने और आँकड़े, जिन्हें आप कॉपी करके ले जा सकते हैं।';

  @override
  String get toolSectionTable => 'तालिका';

  @override
  String get toolSectionFields => 'खाने';

  @override
  String get toolSectionTableCsv => 'तालिका (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'इस तालिका के स्तंभों की सजावट भरोसे के साथ नहीं पढ़ी जा सकी। इस्तेमाल से पहले देख लें कि पंक्तियाँ सही बैठ रही हैं।';

  @override
  String get toolTitleDeadlineFinder => 'समय-सीमाएँ खोजें';

  @override
  String get toolDescriptionDeadlineFinder =>
      'क्या करना है, कब तक करना है, और न करने पर क्या होता है।';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count समय-सीमाएँ',
      one: '1 समय-सीमा',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'कुछ बाक़ी नहीं';

  @override
  String get toolSectionNothingDueBody =>
      'Action को इस सामग्री में कोई समय-सीमा या बाध्यता नहीं मिली।';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'जब तक आप न चुनें, कुछ भी निर्धारित नहीं होता। याद दिलाने वाले कभी अपने-आप सेट नहीं होते।';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'न हुआ तो: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'आपको चाहिए: $items';
  }

  @override
  String get moneyErrorEmpty => 'कोई रकम नहीं दी गई';

  @override
  String get moneyErrorMalformed => 'रकम सादी संख्या नहीं है';

  @override
  String get moneyErrorNegative => 'ऋणात्मक रकम देय रकम नहीं हो सकती';

  @override
  String get moneyErrorTooManyDecimals =>
      'इस मुद्रा में जितने दशमलव स्थान होते हैं, उससे ज़्यादा हैं';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'मुद्रा कोड ऐसा है जिसे हम नहीं पहचानते';

  @override
  String get moneyErrorOutOfRange => 'रकम इतनी बड़ी है कि सही नहीं लगती';

  @override
  String get escalationOcrFailed => 'इस कैप्चर पर पाठ पहचान चल ही नहीं सकी।';

  @override
  String get escalationNoTextRecognised =>
      'यह दस्तावेज़ जैसा लगता है, पर कोई पाठ पहचाना नहीं गया।';

  @override
  String get escalationThinText =>
      'इतने बड़े दस्तावेज़ के हिसाब से बहुत ही कम पाठ पहचाना गया।';

  @override
  String get escalationLowLineConfidence =>
      'पहचानकर्ता ने कई पंक्तियों पर कम भरोसा बताया।';

  @override
  String get escalationTableLikeLayout =>
      'सजावट तालिका जैसी लगती है, और उसे पंक्ति-दर-पंक्ति पढ़ने से यह खो जाता है कि कौन-सा मान किस पंक्ति का है।';

  @override
  String get escalationFragmentedLayout =>
      'पाठ बहुत सारे छोटे-छोटे टुकड़ों में लौटा, इसलिए ढाँचा साफ़ नहीं है।';

  @override
  String get escalationMalformedText =>
      'पहचाने गए पाठ का बड़ा हिस्सा पढ़े जाने लायक शब्द या संख्याएँ नहीं है।';

  @override
  String get escalationConflictingDates =>
      'एक से ज़्यादा तारीख़ को समय-सीमा के रूप में पेश किया गया है।';

  @override
  String get escalationConflictingAmounts =>
      'एक से ज़्यादा रकम को देय रकम के रूप में पेश किया गया है।';

  @override
  String get escalationUnresolvedGrounding =>
      'कुछ मानों का दस्तावेज़ के पाठ से मिलान नहीं किया जा सका।';

  @override
  String get escalationInstructionLikeContent =>
      'इस दस्तावेज़ में ऐसा पाठ है जो ऐसे लिखा गया है मानो वह ऐप को दिए गए निर्देश हों। उसे दस्तावेज़ की सामग्री माना जाता है, निर्देश कभी नहीं।';

  @override
  String get providerFailureNetwork =>
      'Action सेवा तक नहीं पहुँच सका। अपना कनेक्शन जाँचें।';

  @override
  String get providerFailureTimedOut => 'सेवा ने जवाब देने में बहुत देर लगाई।';

  @override
  String get providerFailureServiceUnavailable =>
      'सेवा फ़िलहाल उपलब्ध नहीं है। बाद में फिर कोशिश करें।';

  @override
  String get providerFailureUnauthorized =>
      'यह ऐप अभी इस सेवा को इस्तेमाल करने के लिए अधिकृत नहीं है।';

  @override
  String get providerFailureBlocked =>
      'सेवा ने इस दस्तावेज़ को संसाधित करने से मना कर दिया।';

  @override
  String get providerFailureUnknown =>
      'Action इस दस्तावेज़ को पढ़ नहीं सका। फिर कोशिश करने पर शायद काम बन जाए।';

  @override
  String get reviewBlockerTitle => 'इस काम को कोई शीर्षक दें।';

  @override
  String get reviewBlockerDate =>
      'चुनें कि असली समय-सीमा कौन-सी तारीख़ है, या इसे खाली छोड़ दें।';

  @override
  String get reviewBlockerAmount =>
      'चुनें कि कौन-सी रकम सही है, या इसे खाली छोड़ दें।';

  @override
  String get reviewBlockerStepTitle =>
      'आप जो कदम रखते हैं, उन्हें शीर्षक चाहिए।';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'पृष्ठ $page',
      one: 'पृष्ठ 1',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'पृष्ठ $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'नए पाठ में अब $values नहीं है। इस्तेमाल से पहले इसे जाँच लें।',
      one: 'नए पाठ में अब $values नहीं है। इस्तेमाल से पहले इसे जाँच लें।',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'नए पाठ में अब $values और $count अन्य मान नहीं हैं। इस्तेमाल से पहले इसे जाँच लें।',
      one:
          'नए पाठ में अब $values और 1 अन्य मान नहीं है। इस्तेमाल से पहले इसे जाँच लें।',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'हासिल हुआ';

  @override
  String get goalNewSheetTitle => 'आप क्या होते हुए देखना चाहते हैं?';

  @override
  String get goalNewSheetSubtitle =>
      'एक वाक्य काफ़ी है। ब्योरा आप बाद में जोड़ सकते हैं।';

  @override
  String get goalTitleHint => 'ज़्यादा पैसे दिए बिना कार बीमा नवीनीकरण कराएँ।';

  @override
  String get goalCreateAction => 'लक्ष्य बनाएँ';

  @override
  String get goalTitleSheetTitle => 'आप क्या चाहते हैं';

  @override
  String get goalOutcomeSheetTitle => 'पूरा होना कैसा दिखता है';

  @override
  String get goalContextSheetTitle => 'अभी क्या स्थिति है';

  @override
  String get goalOutcomeHint =>
      'कार का बीमा हो गया है और काग़ज़ात जमा हो गए हैं।';

  @override
  String get goalContextHint =>
      'मेरे पास दो कोटेशन हैं और नवीनीकरण 18 तारीख़ को है।';

  @override
  String get goalWorkspaceTitle => 'लक्ष्य';

  @override
  String get goalUnmarkReached => 'आख़िरकार हासिल नहीं हुआ';

  @override
  String get goalMarkReached => 'हासिल हुआ बताएँ';

  @override
  String get goalNotFound => 'वह लक्ष्य अब यहाँ नहीं है।';

  @override
  String get goalDeleteTitle => 'यह लक्ष्य हटाएँ?';

  @override
  String get goalDeleteBody =>
      'लक्ष्य इस डिवाइस से हटा दिया जाता है। इससे बने कोई भी काम बिल्कुल वैसे ही रहते हैं जैसे हैं।';

  @override
  String get goalOutcomeLabel => 'पूरा होना कैसा दिखता है';

  @override
  String get goalOutcomeEmpty =>
      'अभी लिखा नहीं गया। जब आप कह देते हैं कि इसका पूरा होना क्या है, तो लक्ष्य की योजना बनाना आसान हो जाता है।';

  @override
  String get goalContextLabel => 'अभी क्या स्थिति है';

  @override
  String get goalContextEmpty =>
      'अभी कुछ नहीं लिखा गया। अब तक क्या हुआ, और रास्ते में क्या है।';

  @override
  String get goalTitleLabel => 'आप क्या चाहते हैं';

  @override
  String get goalEditTooltip => 'लक्ष्य बदलें';

  @override
  String get goalToolsLabel => 'Action क्या कर सकता है';

  @override
  String get goalToolsNotReady =>
      'आप क्या चाहते हैं, इस बारे में थोड़ा और लिखें, तो इन उपकरणों के पास काम करने लायक कुछ होगा।';

  @override
  String get toolGoalOptimizerTitle => 'लक्ष्य बेहतर करें';

  @override
  String get toolActionPlanTitle => 'योजना बनाएँ';

  @override
  String get resultFactUnconfirmed => 'पुष्टि नहीं हुई';

  @override
  String get resultSuggestedSteps => 'सुझाए गए कदम';

  @override
  String get resultSuggestedAction => 'सुझाया गया काम';

  @override
  String get resultWorthAsking => 'पूछने लायक सवाल';

  @override
  String get resultSuggestedDeadlines => 'सुझाई गई समय-सीमाएँ';

  @override
  String get resultSuggestions => 'सुझाव';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सहायक उद्धरण',
      one: '1 सहायक उद्धरण',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'चुने गए स्रोत से';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'आपका दस्तावेज़ तैयार किया जा रहा है';

  @override
  String get toolRunStageReading => 'चुने गए पृष्ठ पढ़े जा रहे हैं';

  @override
  String get toolRunStageAnalysing => 'विश्लेषण हो रहा है';

  @override
  String get toolRunStageBuilding => 'आपकी समीक्षा तैयार की जा रही है';

  @override
  String get toolRunStageDone => 'पूरा हुआ';

  @override
  String get toolRunStageFailed => 'वह पूरा नहीं हुआ';

  @override
  String get toolRunStageCancelled => 'रोक दिया गया';

  @override
  String get toolRunFailureLocalCheckFailed => 'उसकी जाँच नहीं हो सकी।';

  @override
  String get toolRunFailureProviderRetired =>
      'वह AI प्रदाता इस संस्करण में अब उपलब्ध नहीं है।';

  @override
  String get toolRunFailureUnusableReply =>
      'वह जवाब इस्तेमाल लायक रूप में नहीं आया। फिर कोशिश करें।';

  @override
  String get toolRunFailureQuestionRequired => 'पहले कोई सवाल टाइप करें।';

  @override
  String get toolRunFailureInputRequired =>
      'इस उपकरण को जिस पर काम करना है, वह चुनें।';

  @override
  String get toolWarningReplyTruncated =>
      'यह जवाब बीच में ही कट गया, इसलिए यह अधूरा हो सकता है।';

  @override
  String get toolWarningNoSupportingQuotes =>
      'आपके मॉडल ने कोई सहायक उद्धरण नहीं लौटाया, इसलिए यहाँ किसी भी बात का कोई प्रमाण नहीं है। इस पर कुछ करने से पहले इसे दस्तावेज़ से मिलाकर देखें।';

  @override
  String get aiSettingsRemoveTitle => 'यह कनेक्शन हटाएँ?';

  @override
  String get aiSettingsRemoveBody =>
      'Action आपकी API कुंजी इस डिवाइस से हटा देगा और AI सुविधाएँ इस्तेमाल करना बंद कर देगा। आपके प्रदाता खाते पर इसका कोई असर नहीं पड़ता।';

  @override
  String get aiSettingsProviderLabel => 'प्रदाता';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'आप जितना इस्तेमाल करते हैं, उसका शुल्क आपका प्रदाता लेता है। Action अपने-आप कभी कोई अनुरोध नहीं करता।';

  @override
  String get aiSettingsConnectLabel => 'कोई AI प्रदाता जोड़ें';

  @override
  String get aiSettingsConnectDescription =>
      'OpenAI, Anthropic, Google Gemini, या किसी संगत endpoint के साथ अपना ही खाता और API कुंजी इस्तेमाल करें।';

  @override
  String get aiSettingsModelLabel => 'मॉडल';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API कुंजी';

  @override
  String get aiSettingsKeyStored =>
      'इस डिवाइस के सुरक्षित स्टोरेज में रखी जाती है।';

  @override
  String get aiSettingsKeyMissing =>
      'इस डिवाइस पर कोई कुंजी नहीं मिली। कोई जोड़ने के लिए फिर से जुड़ें।';

  @override
  String get aiSettingsTestLabel => 'कनेक्शन जाँचें';

  @override
  String get aiSettingsProviderUnavailable =>
      'वह प्रदाता इस संस्करण में उपलब्ध नहीं है।';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'जुड़ गया। $count मॉडल उपलब्ध हैं।';
  }

  @override
  String get aiSettingsTestButton => 'जाँचें';

  @override
  String get aiSettingsChangeProvider => 'प्रदाता या मॉडल बदलें';

  @override
  String get aiSettingsRemoveKey => 'कुंजी हटाएँ';

  @override
  String get aiSettingsSectionPrivacy => 'निजता';

  @override
  String get aiSettingsWhatGetsSentLabel => 'क्या भेजा जाता है';

  @override
  String get aiSettingsWhereItGoesLabel => 'यह कहाँ जाता है';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'जब तक आप कोई प्रदाता नहीं जोड़ते, कुछ भी नहीं भेजा जाता।';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'सीधे $provider को, आपकी कुंजी से। यह Action के किसी सर्वर से होकर नहीं गुज़रता।';
  }

  @override
  String get aiSettingsSectionData => 'डेटा';

  @override
  String get aiSettingsDataFootnote =>
      'Action यह याद रखता है कि आपने कौन-से उपकरण इस्तेमाल किए, यह कभी नहीं कि आपने उन्हें किस पर इस्तेमाल किया।';

  @override
  String get aiSettingsRecentToolsLabel => 'हाल में इस्तेमाल किए उपकरण';

  @override
  String get aiSettingsRecentToolsNone => 'कोई नहीं';

  @override
  String get reminderNotificationTitle => 'Action रिमाइंडर';

  @override
  String get reminderNotificationPrivateBody => 'आपको कुछ देखना है।';

  @override
  String get reminderChannelName => 'Action के रिमाइंडर';

  @override
  String get reminderChannelDescription =>
      'आपके अपने कामों के लिए आपके ख़ुद सेट किए रिमाइंडर।';

  @override
  String get onboardingStart => 'Action इस्तेमाल करना शुरू करें';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return '$total में से चरण $current';
  }

  @override
  String get onboardingCaptureTitle => 'जानकारी को काम में बदलें';

  @override
  String get onboardingCaptureBody =>
      'कोई स्क्रीनशॉट, कोई फ़ोटो, या आपको भेजा गया कोई पाठ जोड़ें। Action उसे पढ़ता है और पता लगाता है कि वह आपसे क्या करने को कह रहा है।';

  @override
  String get onboardingReviewTitle =>
      'जब तक आप पुष्टि नहीं करते, कुछ भी सहेजा नहीं जाता';

  @override
  String get onboardingReviewBody =>
      'Action आपको दिखाता है कि उसे क्या मिला और वह किन शब्दों से आया। जो ग़लत हो उसे आप ठीक करते हैं। जब तक आप पुष्टि नहीं करते, यह एक सुझाव है — कोई तथ्य नहीं, और कोई काम नहीं।';

  @override
  String get onboardingTrackingTitle => 'जो मायने रखता है, उस पर नज़र रखें';

  @override
  String get onboardingTrackingBody =>
      '“ध्यान चाहिए” वह सामने ले आता है जिसका समय बीत चुका है या पास आ रहा है। हर काम अपना अगला कदम, अपनी प्रगति और आपका उसके लिए सेट किया कोई भी याद दिलाने वाला साथ रखता है।';

  @override
  String get onboardingPrivacyBody => 'शुरू करने से पहले जान लेना ज़रूरी है:';

  @override
  String get onboardingPrivacyOnDevice =>
      'आपके काम, कैप्चर, याद दिलाने वाले और खोजें इसी डिवाइस पर रखे जाते हैं। खोज और याद दिलाने वाले बिना कनेक्शन के भी चलते हैं।';

  @override
  String get onboardingPrivacySentToRead =>
      'जब आप Action से कुछ पढ़ने को कहते हैं, वह सामग्री उसे समझने वाली AI सेवा को भेजी जाती है।';

  @override
  String get onboardingPrivacyCloud =>
      'किसी पुष्ट किए गए काम का एक छोटा रिकॉर्ड — उसका शीर्षक, तारीख़ें, रकम और सुझाया गया कदम — इस डिवाइस की गुमनाम पहचान के तहत क्लाउड में सहेजा जा सकता है। आपके कैप्चर, कदम और याद दिलाने वाले नहीं सहेजे जाते।';

  @override
  String get onboardingPrivacyNotBackup =>
      'वह रिकॉर्ड बैकअप नहीं है। यह किसी नए डिवाइस पर कुछ भी वापस नहीं ला सकता।';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count अड़चनें',
      one: '1 अड़चन',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'यह और सरल हो सकता है';

  @override
  String get toolDescriptionGoalOptimizer =>
      'क्या छूट रहा है, क्या अटका रहा है, और पहले क्या करना है।';

  @override
  String toolSectionStepDependsOn(String step) {
    return '$step के बाद';
  }

  @override
  String get toolSectionThePlan => 'योजना';

  @override
  String get toolDescriptionActionPlan =>
      'क्रम से लगे कदम, जिन्हें आप कामों में बदल सकते हैं।';

  @override
  String get toolTitleSmartChecklist => 'चेकलिस्ट बनाएँ';

  @override
  String get toolDescriptionSmartChecklist =>
      'यह आपसे जो-जो माँगता है, क्रम से।';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count छूटे हुए ब्योरे',
      one: '1 छूटा हुआ ब्योरा',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'ये एक-दूसरे से टकराते हैं';

  @override
  String get toolTitleMissingInformation => 'क्या-क्या छूट रहा है';

  @override
  String get toolDescriptionMissingInformation =>
      'जहाँ-जहाँ कमी है, और उनके बारे में क्या पूछना है।';

  @override
  String get aiAdapterTimedOut => 'उसमें बहुत देर लगी, इसलिए उसे रोक दिया गया।';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'आपके AI प्रदाता से सुरक्षित कनेक्शन नहीं बन सका।';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action को वह मॉडल या endpoint नहीं मिला।';

  @override
  String get aiAdapterRequestRejected =>
      'आपके AI प्रदाता ने वह अनुरोध ठुकरा दिया।';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action इस डिवाइस का सुरक्षित स्टोरेज खोल नहीं सका।';

  @override
  String get aiAdapterEndpointMissing =>
      'सेटिंग्स में अपने AI endpoint का पता जोड़ें।';

  @override
  String get aiAdapterReplyIncomplete => 'वह जवाब अधूरा था। फिर कोशिश करें।';

  @override
  String get aiAdapterContentDeclined =>
      'आपके प्रदाता ने वह सामग्री संसाधित करने से मना कर दिया।';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'यह एक बार में $limit फ़ाइलों से ज़्यादा है। कम चुनें।';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'उनमें से कोई एक छवि इतनी बड़ी है कि उसका विश्लेषण नहीं हो सकता।';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '“$filename” इतनी बड़ी है कि उसका विश्लेषण नहीं हो सकता। सीमा $limit MB है।';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '“$filename” में $count पृष्ठ हैं। Action एक बार में ज़्यादा से ज़्यादा $limit पढ़ता है — कोई दायरा चुनें।';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'वह चुनाव इतना बड़ा है कि उसे एक ही अनुरोध में नहीं भेजा जा सकता।';

  @override
  String get toolRunNotAvailableTitle => 'वह उपकरण उपलब्ध नहीं है';

  @override
  String get toolRunNotAvailableMessage =>
      'हो सकता है इसे Action के किसी नए संस्करण में हटा दिया गया हो।';

  @override
  String get toolRunNoSourcesYet =>
      'अभी काम करने के लिए कुछ नहीं है। कुछ कैप्चर करें, या नीचे कुछ पाठ पेस्ट करें।';

  @override
  String get toolRunChooseSourcesToCompare => 'चुनें कि किनकी तुलना करनी है';

  @override
  String get toolRunChooseSource => 'कोई स्रोत चुनें';

  @override
  String get toolRunQuestionLabel => 'आपका सवाल';

  @override
  String get toolRunQuestionHint => 'समय-सीमा कब है?';

  @override
  String get toolRunFreeTextLabel => 'या कुछ पाठ पेस्ट करें';

  @override
  String get toolRunFreeTextHint => 'यहाँ पेस्ट करें या टाइप करें';

  @override
  String get toolRunModeLabel => 'शैली';

  @override
  String get toolRunRunLocally => 'इसी डिवाइस पर जाँचें';

  @override
  String get toolRunRun => 'चलाएँ';

  @override
  String get toolRunStop => 'रोकें';

  @override
  String get toolRunRunAgain => 'फिर से चलाएँ';

  @override
  String get toolRunWorkingOn => 'किस पर काम हो रहा है';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'यह $provider को भेजें?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'आपने जो सामग्री चुनी है, वह आपकी API कुंजी से, संसाधित करने के लिए $provider को भेजी जाएगी।';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'आपकी कुंजी इसी डिवाइस पर रहती है। Action पृष्ठभूमि में कुछ नहीं भेजता, और आपके बाकी काम या स्रोत नहीं भेजता।';

  @override
  String get toolRunScopeTitle => 'यह चलने से पहले';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'आपके $provider कनेक्शन से $count पृष्ठों का विश्लेषण किया जाएगा।',
      one: 'आपके $provider कनेक्शन से 1 पृष्ठ का विश्लेषण किया जाएगा।',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'आपके $provider कनेक्शन से $count फ़ाइलों का विश्लेषण किया जाएगा।',
      one: 'आपके $provider कनेक्शन से 1 फ़ाइल का विश्लेषण किया जाएगा।',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'आपने जो पाठ चुना है, वह आपके $provider कनेक्शन को भेजा जाएगा।';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'इस उपकरण को इस्तेमाल करने के लिए कोई AI प्रदाता जोड़ें';

  @override
  String get toolRunNeedsProviderBody =>
      'आप अपना ही प्रदाता खाता और API कुंजी इस्तेमाल करते हैं।';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कदमों से काम बनाया गया।',
      one: '1 कदम से काम बनाया गया।',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कदम जोड़े गए।',
      one: '1 कदम जोड़ा गया।',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कदम',
      one: '1 कदम',
    );
    return 'एक काम बनाएँ · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कदम',
      one: '1 कदम',
    );
    return 'इस काम में जोड़ें · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'फ़ोटो';

  @override
  String get sourceTypeLabelScreenshot => 'स्क्रीनशॉट';

  @override
  String get sourceTypeLabelPastedText => 'पेस्ट किया नोट';

  @override
  String get sourceTypeLabelDocument => 'दस्तावेज़';

  @override
  String get toolModeClearer => 'ज़्यादा साफ़';

  @override
  String get toolModeMoreProfessional => 'ज़्यादा पेशेवर';

  @override
  String get toolModeShorter => 'ज़्यादा छोटा';

  @override
  String get toolModeSimpler => 'ज़्यादा सरल';

  @override
  String get toolModeMoreStructured => 'ज़्यादा व्यवस्थित';

  @override
  String get toolModeMorePersuasive => 'ज़्यादा असरदार';

  @override
  String get toolModeGrammarOnly => 'सिर्फ़ व्याकरण';

  @override
  String get toolModeProfessional => 'पेशेवर';

  @override
  String get toolModeConcise => 'संक्षिप्त';

  @override
  String get toolModeFriendly => 'दोस्ताना';

  @override
  String get toolModeFormal => 'औपचारिक';

  @override
  String get toolModeAskForClarification => 'स्पष्टीकरण माँगें';

  @override
  String get toolModeConfirm => 'प्राप्ति की पुष्टि';

  @override
  String get toolModeDispute => 'इससे असहमति जताएँ';

  @override
  String get toolModeQuick => 'संक्षेप में';

  @override
  String get toolModeDetailed => 'विस्तार से';

  @override
  String get toolModeExecutive => 'कार्यकारी';

  @override
  String get toolModeKeyPoints => 'मुख्य बिंदु';

  @override
  String get toolModeActionFocused => 'कामों पर केंद्रित';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'आपने जो चुना उसमें उद्धृत किए गए $count ब्योरे नहीं मिले, इसलिए उन्हें अनिश्चित चिह्नित किया गया है।',
      one: 'आपने जो चुना उसमें उद्धृत किया गया 1 ब्योरा नहीं मिला, इसलिए उसे अनिश्चित चिह्नित किया गया है।',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action इन उद्धरणों की जाँच ख़ुद उस फ़ाइल से नहीं कर सका, इसलिए इनका मिलान नहीं हुआ है।';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'समय बीता · $count दिन',
      one: 'समय बीता · 1 दिन',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'कल तक';

  @override
  String get triageBadgeReminderSoon => 'याद दिलाने वाला जल्द';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'समय बीते $count दिन हो गए',
      one: 'समय बीते 1 दिन हो गया',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status। $title';
  }

  @override
  String get triageExplanationDone => 'यह पूरा हो चुका है।';

  @override
  String get triageExplanationNothingPressing =>
      'यह यहाँ इसलिए है क्योंकि अभी इसमें जल्दी की कोई बात नहीं है।';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'इसे ध्यान चाहिए क्योंकि $reason।';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'यह नीचे इसलिए है क्योंकि $reason।';
  }

  @override
  String get triageReasonOverdue => 'इसका समय बीत चुका है';

  @override
  String get triageReasonDeadlinePassed => 'इसकी समय-सीमा बीत चुकी है';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'इसका समय बीते $count दिन हो गए हैं',
      one: 'इसका समय बीते 1 दिन हो गया है',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'इसकी समय-सीमा आज है';

  @override
  String get triageReasonCriticalDueSoon =>
      'आपने इसे अत्यावश्यक बताया है और इसकी समय-सीमा पास है';

  @override
  String get triageReasonAllStepsDone =>
      'इसके सारे कदम पूरे हैं — बस इसे पूरा बताना बाक़ी है';

  @override
  String get triageReasonDueTomorrow => 'इसकी समय-सीमा कल है';

  @override
  String get triageReasonReminderSoon =>
      'आपने इसके लिए अगले एक दिन के भीतर का याद दिलाने वाला सेट किया है';

  @override
  String get triageReasonDueWithinThreeDays =>
      'इसकी समय-सीमा तीन दिन के भीतर है';

  @override
  String get triageReasonCriticalNoDeadline =>
      'आपने इसे अत्यावश्यक बताया है, और इसकी कोई समय-सीमा नहीं है';

  @override
  String get triageReasonDueWithinSevenDays =>
      'इसकी समय-सीमा एक हफ़्ते के भीतर है';

  @override
  String get triageReasonImportant => 'आपने इसे ज़रूरी बताया है';

  @override
  String get triageReasonDueLater => 'इसकी समय-सीमा अभी दूर है';

  @override
  String get triageReasonNoDeadline =>
      'इसकी कोई समय-सीमा नहीं है और जल्दी की कोई बात नहीं है';

  @override
  String cardCompletedTooltip(String title) {
    return 'पूरा हुआ: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'इस दस्तावेज़ को समझें';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'यह क्या है, क्या मायने रखता है, और इसका क्या करना है।';

  @override
  String get toolSectionWhatThisIs => 'यह क्या है';

  @override
  String get toolSectionWhatMatters => 'क्या मायने रखता है';

  @override
  String get toolSectionKeyDetails => 'मुख्य ब्योरे';

  @override
  String get toolTitleAskDocument => 'किसी स्रोत के बारे में पूछें';

  @override
  String get toolDescriptionAskDocument =>
      'जवाब सिर्फ़ उसी पर टिके जो आपने चुना — या फिर कुछ नहीं।';

  @override
  String get toolSectionNoAnswer => 'इस सामग्री में कोई जवाब नहीं मिला';

  @override
  String get toolSectionNoAnswerBody =>
      'आपके चुने हुए दस्तावेज़ में Action को वह नहीं मिला।';

  @override
  String get toolSectionAnswer => 'जवाब';

  @override
  String get toolSectionFromTheDocument => 'दस्तावेज़ में से';

  @override
  String get toolWarningQuoteNotFound =>
      'इस जवाब के पीछे का उद्धरण चुनी हुई सामग्री में नहीं है। इस जवाब को अविश्वसनीय मानें।';

  @override
  String get toolTitleSmartSummary => 'सारांश बनाएँ';

  @override
  String get toolDescriptionSmartSummary =>
      'छोटा रूप — या वह हिस्सा जो बदलता है कि आपको क्या करना है।';

  @override
  String get toolSectionKeyPoints => 'मुख्य बिंदु';

  @override
  String get toolTitleCompareDocuments => 'दस्तावेज़ों की तुलना करें';

  @override
  String get toolDescriptionCompareDocuments =>
      'क्या बदला, कहाँ विरोधाभास है, क्या नहीं मिला।';

  @override
  String get toolSectionWhatDiffers => 'क्या अलग है';

  @override
  String get toolSectionConflicts => 'विरोधाभास';

  @override
  String get toolSectionOnlyInOne => 'सिर्फ़ किसी एक में';

  @override
  String get toolSectionInCommon => 'जो साझा है';

  @override
  String get sensitiveKindEmail => 'ईमेल पता';

  @override
  String get sensitiveKindPhone => 'फ़ोन नंबर';

  @override
  String get sensitiveKindPaymentCard => 'भुगतान कार्ड नंबर';

  @override
  String get sensitiveKindIban => 'बैंक खाता (IBAN)';

  @override
  String get sensitiveKindNationalId => 'राष्ट्रीय पहचान संख्या';

  @override
  String get sensitiveKindPostcode => 'पिन कोड';

  @override
  String get sensitiveKindAccountNumber => 'खाता संख्या';

  @override
  String get sensitiveKindReference => 'संदर्भ संख्या';

  @override
  String get sensitiveKindDateOfBirth => 'जन्म तिथि';

  @override
  String get sensitiveKindUrl => 'वेब पता';

  @override
  String get verdictVerifiedProvenance => 'सत्यापित उद्गम उपलब्ध है';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'इस फ़ाइल में एक हस्ताक्षर है, जिसे जाँचा गया और वह सही निकला।';

  @override
  String get verdictSignalsSynthetic => 'AI से बनी सामग्री के अनुरूप संकेत';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'यह फ़ाइल कहती है कि इसे किसी जेनरेटिव उपकरण से बनाया गया था। मेटाडेटा को बदला या हटाया जा सकता है, इसलिए यह फ़ाइल का दावा है, प्रमाण नहीं।';

  @override
  String get verdictSignalsEdited => 'संपादित सामग्री के अनुरूप संकेत';

  @override
  String get verdictSignalsEditedExplainer =>
      'यह फ़ाइल कहती है कि यह संपादन सॉफ़्टवेयर से होकर गुज़री है। तस्वीरों के लिए यह आम बात है, और अपने-आप में इसका मतलब यह नहीं कि कुछ नक़ली बनाया गया।';

  @override
  String get verdictNoReliableProvenance =>
      'उद्गम की कोई भरोसेमंद जानकारी नहीं मिली';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'इस फ़ाइल में उद्गम की कोई जानकारी नहीं है। यह सामान्य है — ज़्यादातर सेवाएँ उसे हटा देती हैं — और यह किसी बात का संकेत नहीं है।';

  @override
  String get verdictInconclusive => 'अनिर्णायक';

  @override
  String get verdictInconclusiveExplainer =>
      'यह कहने के लिए यहाँ पर्याप्त जानकारी नहीं है कि यह कहाँ से आया।';

  @override
  String get authenticitySignalCamera => 'कैमरा';

  @override
  String get authenticitySignalSoftware => 'सॉफ़्टवेयर';

  @override
  String get authenticitySignalDescription => 'विवरण';

  @override
  String get authenticitySignalCopyright => 'कॉपीराइट';

  @override
  String get authenticitySignalLocation => 'स्थान';

  @override
  String get authenticitySignalLocationValue =>
      'इस फ़ाइल में स्थान का डेटा मौजूद है।';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'जाँचा नहीं गया — इस बिल्ड में हस्ताक्षर जाँचने वाला कुछ नहीं है।';

  @override
  String get authenticitySignalFile => 'फ़ाइल';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'इसे छवि के रूप में पढ़ा नहीं जा सका।';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'यह कोई पहचानी हुई छवि फ़ॉर्मैट नहीं है।';

  @override
  String get authenticitySignalText => 'पाठ';

  @override
  String get authenticitySignalTextValue =>
      'अकेले पाठ से भरोसे के साथ यह नहीं बताया जा सकता कि AI इस्तेमाल हुआ या नहीं। Action अंदाज़ा नहीं लगाता।';

  @override
  String get fileTypePng => 'PNG छवि';

  @override
  String get fileTypeJpeg => 'JPEG छवि';

  @override
  String get fileTypeGif => 'GIF छवि';

  @override
  String get fileTypeWebp => 'WebP छवि';

  @override
  String get fileTypeWav => 'WAV रिकॉर्डिंग';

  @override
  String get fileTypePdf => 'PDF दस्तावेज़';

  @override
  String get fileTypeHeic => 'HEIC छवि';

  @override
  String get fileTypeVideo => 'वीडियो फ़ाइल';

  @override
  String get fileTypeTiff => 'TIFF छवि';

  @override
  String get fileTypeBitmap => 'बिटमैप छवि';

  @override
  String get fileTypeRtf => 'RTF दस्तावेज़';

  @override
  String get fileTypeZip => 'Zip आर्काइव';

  @override
  String get fileTypeGzip => 'gzip आर्काइव';

  @override
  String get fileTypeSevenZip => '7-Zip आर्काइव';

  @override
  String get fileTypeRar => 'RAR आर्काइव';

  @override
  String get fileTypeWindowsProgram => 'Windows प्रोग्राम';

  @override
  String get fileTypeLinuxProgram => 'Linux प्रोग्राम';

  @override
  String get fileTypePostScript => 'PostScript दस्तावेज़';

  @override
  String get fileTypeOgg => 'Ogg रिकॉर्डिंग';

  @override
  String get fileTypeMp3 => 'MP3 रिकॉर्डिंग';

  @override
  String get fileTypePlainText => 'सादा पाठ';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'इस फ़ाइल के नाम में \".$extension\" है, पर इसकी सामग्री $contents है। यह सीधी-सादी ग़लती भी हो सकती है, और यही वह तरीक़ा भी है जिससे कोई फ़ाइल उस चीज़ से खुल जाती है जिसकी आपने उम्मीद नहीं की थी।';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बाइट',
      one: '1 बाइट',
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
  String get credentialKindPrivateKey => 'निजी कुंजी';

  @override
  String get credentialKindApiKey => 'API कुंजी';

  @override
  String get credentialKindConnectionString => 'कनेक्शन स्ट्रिंग';

  @override
  String get credentialKindAccessToken => 'एक्सेस टोकन';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization हेडर';

  @override
  String get credentialKindPasswordOrKey => 'पासवर्ड या कुंजी';

  @override
  String get credentialKindPossibleSecret => 'संभावित सीक्रेट';

  @override
  String get credentialAdvicePrivateKey =>
      'साझा करने से पहले इसे हटाएँ, और कुंजी-युग्म बदलें। निजी कुंजी एक बार देखी जा चुकने के बाद फिर कभी सुरक्षित नहीं की जा सकती।';

  @override
  String get credentialAdviceProviderApiKey =>
      'इस कुंजी को प्रदाता के यहाँ रद्द कराएँ और नई जारी कराएँ। दस्तावेज़ से हटा देने भर से यह बंद नहीं होती।';

  @override
  String get credentialAdviceConnectionString =>
      'इसमें पासवर्ड भी है और वह पता भी जिसे वह खोलता है। अगर इसे पहले ही साझा किया जा चुका है, तो पासवर्ड बदलें।';

  @override
  String get credentialAdviceJsonWebToken =>
      'ऐसे टोकन अक्सर ख़त्म हो जाते हैं, पर हमेशा नहीं। जब तक आपको पता न हो कि यह कब ख़त्म होता है, इसे चालू ही मानें।';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'हेडर का मान हटाएँ। पेस्ट किए गए रिक्वेस्ट लॉग उन सबसे आम तरीक़ों में से एक हैं जिनसे कोई चालू टोकन ग़लती से साझा हो जाता है।';

  @override
  String get credentialAdviceKeyedAssignment =>
      'इसे किसी एनवायरनमेंट वेरिएबल या सीक्रेट स्टोर में ले जाएँ, और अगर फ़ाइल साझा हो चुकी है तो यह मान बदल दें।';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action यह नहीं बता सकता कि यह क्या है। साझा करने से पहले इसे देख लें — यह उतनी ही आसानी से कोई पहचानकर्ता या चेकसम भी हो सकता है।';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API कुंजी';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI प्रोजेक्ट कुंजी';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI जैसी API कुंजी';

  @override
  String get credentialLabelGoogleApiKey => 'Google API कुंजी';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth टोकन';

  @override
  String get credentialLabelGitHubToken => 'GitHub टोकन';

  @override
  String get credentialLabelSlackToken => 'Slack टोकन';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS एक्सेस कुंजी ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab टोकन';

  @override
  String get credentialLabelNpmToken => 'npm टोकन';

  @override
  String get credentialLabelPassphrase => 'पासफ़्रेज़';

  @override
  String get credentialLabelPassword => 'पासवर्ड';

  @override
  String get credentialLabelRefreshToken => 'रिफ़्रेश टोकन';

  @override
  String get credentialLabelToken => 'टोकन';

  @override
  String get credentialLabelClientSecret => 'क्लाइंट सीक्रेट';

  @override
  String get credentialLabelCredential => 'क्रेडेंशियल';

  @override
  String get credentialLabelSecret => 'सीक्रेट';

  @override
  String get linkVerdictNoObviousSignals => 'कोई ज़ाहिर संकेत नहीं';

  @override
  String get linkVerdictWorthChecking => 'जाँच लेने लायक़';

  @override
  String get linkVerdictTreatWithCaution => 'सावधानी बरतें';

  @override
  String get linkSummaryNoObviousSignals =>
      'इस लिंक के लिखे जाने के तरीक़े में कुछ भी असामान्य नहीं है। यह जान लेने के बराबर नहीं है कि वह पृष्ठ भरोसेमंद है — सिर्फ़ आप ही तय कर सकते हैं कि आपने इसकी उम्मीद की थी या नहीं।';

  @override
  String get linkSummaryWorthChecking =>
      'इस लिंक के बारे में एक बात खोलने से पहले देख लेने लायक़ है।';

  @override
  String get linkSummaryTreatWithCaution =>
      'यह लिंक जिस तरह लिखा गया है, उसमें कई बातें खोलने से पहले जाँच लेने लायक़ हैं।';

  @override
  String get linkSignalNotHttps => 'एन्क्रिप्टेड नहीं';

  @override
  String get linkSignalNonWebScheme => 'वेब लिंक नहीं';

  @override
  String get linkSignalEmbeddedCredentials => 'लिंक में पासवर्ड';

  @override
  String get linkSignalMisleadingAuthority => 'असली पता छिपा हुआ';

  @override
  String get linkSignalIpLiteralHost => 'अंकों वाला पता';

  @override
  String get linkSignalPunycodeHost => 'नाम में एन्कोडेड अक्षर';

  @override
  String get linkSignalMixedScriptHost => 'नाम में मिली-जुली वर्णमालाएँ';

  @override
  String get linkSignalEncodedHost => 'नाम में एस्केप किए अक्षर';

  @override
  String get linkSignalUnusualPort => 'असामान्य पोर्ट';

  @override
  String get linkSignalDeepSubdomain => 'नाम में कई हिस्से';

  @override
  String get linkSignalPublicSuffixInSubdomain => 'जाना-पहचाना नाम ग़लत जगह पर';

  @override
  String get linkSignalShortener => 'छोटा किया गया लिंक';

  @override
  String get linkSignalExecutableTarget => 'कोई प्रोग्राम डाउनलोड करता है';

  @override
  String get linkSignalRedirectParameter => 'आपको कहीं और भेज सकता है';

  @override
  String get linkSignalVeryLongUrl => 'बहुत लंबा';

  @override
  String get linkSignalUnparseable => 'लिंक के रूप में नहीं पढ़ा जा सका';

  @override
  String get linkDetailNotHttps =>
      'यह लिंक http इस्तेमाल करता है, इसलिए आप पृष्ठ पर जो कुछ टाइप करेंगे, वह रास्ते में पढ़ा जा सकता है।';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'यह किसी वेब पृष्ठ से नहीं, बल्कि \"$scheme:\" से खुलता है। यह किसी दूसरे ऐप से कुछ करने को कह सकता है।';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'इस लिंक में उपयोगकर्ता नाम और पासवर्ड लिखे हुए हैं। यह जहाँ कहीं भी साझा हो, वे साथ जाते हैं।';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return '\"@\" से पहले का सब कुछ ब्राउज़र नज़रअंदाज़ कर देता है। असली मंज़िल \"$host\" है।';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'यह \"$host\" पर जाता है — नाम नहीं, बल्कि कच्चा पता। वैध साइटें लगभग हमेशा नाम इस्तेमाल करती हैं।';
  }

  @override
  String get linkDetailPunycodeHost =>
      'साइट के नाम में ग़ैर-लैटिन अक्षर हैं, जो एन्कोड करके रखे गए हैं। कई भाषाओं के लिए यह सामान्य है, और इसी तरह किसी नाम को जाने-पहचाने नाम जैसा दिखाया भी जा सकता है।';

  @override
  String get linkDetailMixedScriptHost =>
      'साइट का नाम लैटिन अक्षरों में किसी दूसरी वर्णमाला के ऐसे अक्षर मिलाता है जो बिल्कुल वैसे ही दिखते हैं। इसे एक-एक अक्षर करके पढ़ें।';

  @override
  String get linkDetailEncodedHost =>
      'साइट के नाम में एस्केप कोड हैं, और उनकी जगह यह नहीं है। वे छिपा सकते हैं कि नाम असल में क्या कहता है।';

  @override
  String linkDetailUnusualPort(String port) {
    return 'यह सामान्य पोर्ट के बजाय पोर्ट $port पर जुड़ता है। टेस्ट सर्वर के लिए यह आम है और सार्वजनिक साइटों के लिए असामान्य।';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'नाम में $count हिस्से हैं। सिर्फ़ आख़िरी दो तय करते हैं कि साइट कौन चलाता है; बाक़ी कुछ भी रखे जा सकते हैं।',
      one:
          'नाम में $count हिस्सा है। सिर्फ़ आख़िरी दो तय करते हैं कि साइट कौन चलाता है; बाक़ी कुछ भी रखे जा सकते हैं।',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'इस नाम के बीच में \".$suffix.\" है, जिससे शुरुआत का हिस्सा ही साइट जैसा लगता है। साइट असल में \"$host\" है।';
  }

  @override
  String get linkDetailShortener =>
      'छोटा करने वाली सेवा असली मंज़िल छिपा देती है। बिना खोले आप नहीं बता सकते कि यह कहाँ जाता है।';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'यह लिंक \"$fileExtension\" पर ख़त्म होता है, इसलिए यह पढ़ने के लिए कोई पृष्ठ नहीं, बल्कि ऐसी चीज़ डाउनलोड करता है जो आपके डिवाइस पर चल सकती है।';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'इस लिंक की \"$parameter\" सेटिंग में एक दूसरा पता भी है, इसलिए इसे खोलने पर यह आपको \"$host\" के अलावा कहीं और ले जा सकता है।';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'लंबे लिंक पढ़ने में ज़्यादा मुश्किल होते हैं, और जो हिस्सा मंज़िल तय करता है वह नज़र से बाहर धकेला जा सकता है।';

  @override
  String get linkDetailUnparseable =>
      'Action इसे वेब पते के रूप में नहीं पढ़ सका। जो लिंक लिंक जैसे न दिखें, उनसे सावधान रहें।';

  @override
  String get toolTitleRedaction => 'संवेदनशील ब्यौरे छिपाएँ';

  @override
  String get toolDescriptionRedaction =>
      'जो साझा नहीं होना चाहिए उसे खोजें, और एक साफ़़ प्रति बनाएँ।';

  @override
  String get toolSectionRedactionNothingToScan => 'खँगालने के लिए कुछ नहीं';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'यह उपकरण पाठ पढ़ता है। कोई नोट, कोई पेस्ट किया संदेश, या ऐसा कैप्चर चुनें जिसका पाठ पढ़ा जा चुका है।';

  @override
  String get toolSectionRedactionNothingFound => 'कुछ ज़ाहिर नहीं मिला';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action को इस पाठ में कोई ईमेल पता, फ़ोन नंबर, कार्ड नंबर या संदर्भ संख्या नहीं मिली।';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'छिपाने लायक़ $count चीज़ें',
      one: 'छिपाने लायक़ 1 चीज़',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'विलोपित प्रति';

  @override
  String get toolWarningRedactionCoverage =>
      'यह ईमेल, फ़ोन नंबर और खाता संख्या जैसी बनावट वाली चीज़ें खोजता है। यह हर संवेदनशील चीज़ नहीं पकड़ेगा — साझा करने से पहले प्रति पढ़ लें।';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action छवियों या PDF फ़ाइलों में से कुछ विलोपित नहीं कर सकता। तस्वीर में किसी चीज़ को ढक देने पर मूल उसके नीचे बना रहता, इसलिए यह विकल्प दिया ही नहीं जाता।';

  @override
  String get toolTitleAuthenticity => 'जाँचें कि यह कहाँ से आया';

  @override
  String get toolDescriptionAuthenticity =>
      'कोई फ़ाइल ख़ुद क्या कहती है कि वह कहाँ से आई।';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'परखने के लिए कुछ नहीं';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'कोई छवि या कुछ पाठ चुनें।';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'यह फ़ाइल ख़ुद अपने बारे में क्या कहती है';

  @override
  String get toolSectionAuthenticityFileItself => 'ख़ुद फ़ाइल';

  @override
  String get toolSectionFileContents => 'सामग्री';

  @override
  String get toolSectionFileUnknownFormat =>
      'ऐसा फ़ॉर्मैट जिसे Action नहीं जानता';

  @override
  String get toolSectionFileSize => 'आकार';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'यह वही बताता है जो कोई फ़ाइल ख़ुद अपने बारे में कहती है। मेटाडेटा बदला या हटाया जा सकता है, इसलिए इनमें से कुछ भी प्रमाण नहीं है। इसके आधार पर किसी पर आरोप न लगाएँ।';

  @override
  String get toolTitleCredentialScanner => 'कुंजियाँ और पासवर्ड खोजें';

  @override
  String get toolDescriptionCredentialScanner =>
      'कुछ साझा करने से पहले क्रेडेंशियल खोजें।';

  @override
  String get toolSectionCredentialNothingToCheck => 'जाँचने के लिए कुछ नहीं';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'कुछ पाठ पेस्ट करें, या ऐसा कैप्चर चुनें जिसका पाठ पढ़ा जा चुका है। यह उपकरण सिर्फ़ पाठ पढ़ता है।';

  @override
  String get toolSectionCredentialNoneFound => 'कोई क्रेडेंशियल नहीं मिला';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action को इस पाठ में ऐसा कुछ नहीं मिला जिसकी बनावट API कुंजी, निजी कुंजी, टोकन या पासवर्ड जैसी हो।';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्रेडेंशियल मिले',
      one: '1 क्रेडेंशियल मिला',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count चीज़ें जो सीक्रेट हो सकती हैं',
      one: '1 चीज़ जो सीक्रेट हो सकती है',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'क्रेडेंशियल हटाकर बनाई गई प्रति';

  @override
  String get toolWarningCredentialRevoke =>
      'दस्तावेज़ से कुंजी हटा देने भर से वह बंद नहीं होती। अगर इनमें से कोई पहले ही साझा हो चुकी है, तो उसे प्रदाता के यहाँ रद्द कराएँ और नई जारी कराएँ।';

  @override
  String get toolWarningCredentialCoverage =>
      'यह ऐसे क्रेडेंशियल खोजता है जिनकी बनावट पहचानी जा सके। किसी वाक्य में लिखा हुआ पासवर्ड नहीं मिलेगा, इसलिए पाठ ख़ुद भी पढ़ लें।';

  @override
  String get toolTitleLinkInspector => 'कोई लिंक जाँचें';

  @override
  String get toolDescriptionLinkInspector =>
      'खोलने से पहले कोई पता ख़ुद क्या बता देता है।';

  @override
  String get toolSectionLinkNoneFound => 'कोई लिंक नहीं मिला';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'कोई लिंक पेस्ट करें, या ऐसा कैप्चर चुनें जिसमें कोई लिंक हो।';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'इस पाठ में मिले $count लिंक',
      one: 'इस पाठ में मिला लिंक',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'पढ़ा नहीं जा सका';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary। $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'इनके लिखे जाने के तरीक़े में कुछ भी असामान्य नहीं';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'यह जान लेने के बराबर नहीं है कि वे पृष्ठ भरोसेमंद हैं। सिर्फ़ आप ही तय कर सकते हैं कि आपने इनकी उम्मीद की थी या नहीं।';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action सिर्फ़ पता पढ़ता है। वह न तो लिंक खोलता है, न साइट के बारे में कहीं जाकर पता लगाता है, न प्रतिष्ठा जाँचने वाली किसी सेवा से पूछता है — ऐसा करने पर आप क्या देख रहे हैं, यह किसी और के पास चला जाता।';

  @override
  String get toolWarningLinkNoSignals =>
      'जिस लिंक में कोई संकेत न मिले, वह भी नुक़सान पहुँचा सकता है। यह इतना ही खोजता है कि पता जिस तरह लिखा गया है उसमें क्या गड़बड़ी है, और वह कहाँ ले जाता है — इस बारे में जानने लायक़ सब कुछ इतना भर नहीं है।';

  @override
  String get toolSectionObjective => 'आपका मक़सद';

  @override
  String get toolSectionCurrentState => 'लक्ष्य अभी कहाँ तक पहुँचा';

  @override
  String get toolSectionRecommendedNextStep => 'सुझाया गया अगला कदम';

  @override
  String get toolSectionCredentialAdvice => 'क्या करें';

  @override
  String get toolSectionSummary => 'सारांश';

  @override
  String get toolDetailSeparator => ' · ';
}
