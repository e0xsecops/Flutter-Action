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
}
