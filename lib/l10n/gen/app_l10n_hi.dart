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
}
