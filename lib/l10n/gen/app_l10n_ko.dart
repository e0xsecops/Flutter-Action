// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppL10nKo extends AppL10n {
  AppL10nKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => '취소';

  @override
  String get commonDone => '완료';

  @override
  String get commonSave => '저장';

  @override
  String get commonClose => '닫기';

  @override
  String get commonBack => '뒤로';

  @override
  String get commonRetry => '다시 시도';

  @override
  String get commonDelete => '삭제';

  @override
  String get commonRemove => '제거';

  @override
  String get commonContinue => '계속';

  @override
  String get commonOpen => '열기';

  @override
  String get commonCopy => '복사';

  @override
  String get commonCopied => '복사됨';

  @override
  String get commonEdit => '편집';

  @override
  String get commonAdd => '추가';

  @override
  String get commonOn => '켜짐';

  @override
  String get commonOff => '꺼짐';

  @override
  String get commonUnknown => '알 수 없음';

  @override
  String get commonChecking => '확인 중…';

  @override
  String get commonSettings => '설정';

  @override
  String get commonDismiss => '닫기';

  @override
  String get commonUndo => '실행 취소';

  @override
  String get commonSkip => '건너뛰기';

  @override
  String get commonNotNow => '나중에';

  @override
  String get commonSomethingWentWrong => '문제가 발생했습니다.';

  @override
  String get navToday => '오늘';

  @override
  String get navLibrary => '보관함';

  @override
  String get navIntelligence => '인텔리전스';

  @override
  String get navSearch => '검색';

  @override
  String get navCapture => '무언가 캡처하기';

  @override
  String get todayGreetingMorning => '좋은 아침입니다';

  @override
  String get todayGreetingAfternoon => '안녕하세요';

  @override
  String get todayGreetingEvening => '좋은 저녁입니다';

  @override
  String get todayDateFormat => 'M월 d일 · EEEE';

  @override
  String get todayActionsLoadFailed => '할 일을 불러오지 못했습니다. 데이터는 이 기기에 그대로 있습니다.';

  @override
  String get todaySectionNeedsAttention => '확인이 필요함';

  @override
  String get todaySectionAlsoNeedsAttention => '이것도 확인이 필요함';

  @override
  String get todaySectionWaitingForReview => '검토 대기 중';

  @override
  String get todaySectionComingUp => '예정된 일';

  @override
  String todaySeeAllCaptures(int count) {
    return '캡처 $count개 모두 보기';
  }

  @override
  String get todaySeeAllInLibrary => '보관함에서 모두 보기';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 완료',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '할 일 $count개를 완료했습니다. 보관함을 엽니다.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => '이렇게 시작하기';

  @override
  String get todayQuickPhoto => '사진';

  @override
  String get todayQuickScreenshot => '스크린샷';

  @override
  String get todayQuickText => '텍스트';

  @override
  String get todayQuickTools => '링크를 살펴보거나, 텍스트 속 키를 찾아보세요';

  @override
  String get briefBadgeNeedsYou => '확인 필요';

  @override
  String get briefBadgeToReview => '검토 대기';

  @override
  String get briefBadgeAhead => '예정';

  @override
  String get briefBadgeStartHere => '여기서 시작';

  @override
  String get briefBadgeClear => '비어 있음';

  @override
  String get briefNext => '다음';

  @override
  String briefOpenAction(String title) {
    return '$title 열기';
  }

  @override
  String briefMarkDone(String title) {
    return '\"$title\"을(를) 완료로 표시';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '할 일 $count개에 확인이 필요합니다',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '캡처 $count개도 검토를 기다리고 있습니다.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '캡처 $count개가 기다리고 있습니다',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => '기한이 지난 항목은 없습니다.';

  @override
  String get briefHeadlineNothingToday => '오늘은 확인할 것이 없습니다';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '할 일 $count개가 예정되어 있습니다.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => '모두 정리되었습니다';

  @override
  String get briefDetailClear => '기한이 된 것도, 기다리는 것도 없습니다.';

  @override
  String get briefHeadlineFirstRun => '무엇으로든 시작해 보세요';

  @override
  String get briefDetailFirstRun => '편지, 스크린샷, 메모 — Action이 무엇인지 알아냅니다.';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsSectionPersonalise => '개인 설정';

  @override
  String get settingsAppearance => '화면 모드';

  @override
  String get settingsAppearanceDescription => '밝게, 어둡게, 또는 기기 설정에 맞춰서.';

  @override
  String get settingsLanguageDescription => 'Action이 당신에게 말하는 언어.';

  @override
  String get appearanceSystem => '시스템';

  @override
  String get appearanceLight => '밝게';

  @override
  String get appearanceDark => '어둡게';

  @override
  String get appearanceSystemDescription => '기기 설정 따르기';

  @override
  String get appearanceLightDescription => '항상 밝게';

  @override
  String get appearanceDarkDescription => '항상 어둡게';

  @override
  String get languageTitle => '언어';

  @override
  String get languageSubtitle =>
      '변경 사항은 바로 적용됩니다. 어디로도 전송되지 않으며, 선택은 이 기기에 저장됩니다.';

  @override
  String get languageSectionChoose => '언어 선택';

  @override
  String get languageSystem => '시스템';

  @override
  String get languageSystemDescription => '기기 언어 따르기';

  @override
  String get languageDraftNote =>
      'Action의 문구는 영어로 작성되었습니다. 다른 번역은 고정된 용어집에 따라 초안을 만들고 자동으로 검사했지만, 아직 원어민이 읽어보지 않았습니다. 표현의 정확성이 중요한 부분 — 개인정보, 보안, Action이 주장하는 것과 주장하지 않는 것 — 에서는 영어가 기준으로 남습니다.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action은 AI 없이도 작동합니다. 직접 제공업체를 연결하면 문서 분석, 계획 세우기, 초안 작성 도구가 추가됩니다.';

  @override
  String get settingsAiProvider => 'AI 제공업체';

  @override
  String get settingsAiNotConnected => '연결되지 않음. 본인의 계정과 API 키를 사용하세요.';

  @override
  String settingsAiConnected(String provider) {
    return '$provider에 연결됨.';
  }

  @override
  String get settingsSectionPrivacySecurity => '개인정보 및 보안';

  @override
  String get settingsSecurity => '보안';

  @override
  String get settingsWhereInfoLives => '당신의 정보가 있는 곳';

  @override
  String get settingsWhereInfoLivesDescription => '이 기기에 남는 것과 남지 않는 것.';

  @override
  String get protectionAppLock => '앱 잠금';

  @override
  String get protectionScreenPrivacy => '화면 보호';

  @override
  String get protectionPrivateReminders => '내용 감춘 알림';

  @override
  String get protectionSummaryNone => '앱 잠금, 화면 보호, 그리고 무엇이 이 기기를 떠나는지.';

  @override
  String protectionSummaryOne(String first) {
    return '$first이(가) 켜져 있습니다.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first과(와) $second이(가) 켜져 있습니다.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second, $third이(가) 켜져 있습니다.';
  }

  @override
  String get settingsSectionReminders => '알림';

  @override
  String get settingsRemindersFootnote =>
      '배터리 설정과 기기 사용 방식에 따라 Android가 설정한 시각보다 조금 늦게 알림을 표시할 수 있습니다.';

  @override
  String get settingsNotifications => '알림 표시';

  @override
  String get settingsNotificationsOnDescription => '설정한 알림을 표시할 수 있습니다.';

  @override
  String get settingsNotificationsOffDescription =>
      'Action에 대해 꺼져 있어 알림이 표시되지 않습니다.';

  @override
  String get settingsNotificationsUnknown => '확인할 수 없습니다.';

  @override
  String get settingsNotificationsAllowed => '허용됨';

  @override
  String get settingsOpenSystemSettings => '설정 열기';

  @override
  String get settingsActionFootnote =>
      'Action은 어수선한 정보를 분명한 다음 단계로 바꿉니다. 저장되기 전에 모든 것을 당신이 확인합니다.';

  @override
  String get settingsHelp => '도움말';

  @override
  String get settingsHelpDescription => 'Action이 어떻게 작동하는지, 그리고 무엇을 하지 않는지.';

  @override
  String get settingsVersion => '버전';
}
