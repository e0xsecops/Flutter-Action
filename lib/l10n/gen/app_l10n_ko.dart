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

  @override
  String get dateShortFormat => 'M월 d일';

  @override
  String get dateLongFormat => 'yyyy년 M월 d일';

  @override
  String get relativeJustNow => '방금';

  @override
  String relativeMinutes(int count) {
    return '$count분 전';
  }

  @override
  String relativeHours(int count) {
    return '$count시간 전';
  }

  @override
  String get relativeYesterday => '어제';

  @override
  String relativeDays(int count) {
    return '$count일 전';
  }

  @override
  String get libraryTitle => '보관함';

  @override
  String get librarySubtitle =>
      'Action이 당신을 위해 보관 중인 모든 것. 그리고 그 전부가 이 기기에 남습니다.';

  @override
  String get librarySegmentActions => '할 일';

  @override
  String get librarySegmentCaptures => '캡처';

  @override
  String get librarySegmentGoals => '목표';

  @override
  String get librarySegmentDone => '완료';

  @override
  String get libraryNewGoal => '새 목표';

  @override
  String get libraryNoGoalsTitle => '아직 목표가 없습니다';

  @override
  String get libraryNoGoalsMessage =>
      '목표는 당신이 이루고 싶은 일입니다. 무엇이 빠졌는지, 무엇이 막고 있는지, 먼저 무엇을 해야 하는지를 Action이 찾아줄 수 있습니다.';

  @override
  String get libraryNoDoneTitle => '아직 완료한 것이 없습니다';

  @override
  String get libraryNoDoneMessage => '끝낸 할 일은 여기에 보관됩니다.';

  @override
  String get libraryNoOpenTitle => '진행 중인 할 일이 없습니다';

  @override
  String get libraryNoOpenMessage => '무언가 캡처하면 Action이 무엇을 해야 하는지 알아냅니다.';

  @override
  String get libraryNoCapturesTitle => '아직 캡처한 것이 없습니다';

  @override
  String get libraryNoCapturesMessage =>
      '추가한 사진, 스크린샷, 글은 먼저 여기로 옵니다. 당신이 요청하기 전까지 아무것도 분석되지 않습니다.';

  @override
  String get libraryGoalNoActions => '아직 여기서 만들어진 것이 없습니다';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이 목표에서 나온 할 일 $count개',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => '할 일과 캡처 검색';

  @override
  String get searchClear => '지우기';

  @override
  String get searchPrivacyNote => '이 기기 안에서 검색합니다. 여기에 입력한 것은 기기를 벗어나지 않습니다.';

  @override
  String get searchYouCanSearch => '검색할 수 있는 것';

  @override
  String get searchFieldTitles => '제목';

  @override
  String get searchFieldTitlesExample => '자동차 보험 갱신';

  @override
  String get searchFieldReferences => '접수 번호';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => '기관';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => '할 일 안의 단계';

  @override
  String get searchFieldStepsExample => '서식 업로드하기';

  @override
  String get searchFieldCaptureText => '캡처에서 읽어낸 글';

  @override
  String get searchFieldCaptureTextExample => '갱신 안내';

  @override
  String searchNoMatchesTitle(String query) {
    return '\"$query\"에 대한 결과가 없습니다';
  }

  @override
  String get searchNoMatchesTryFewer => '단어를 줄이거나, 접수 번호를 적힌 그대로 입력해 보세요.';

  @override
  String get searchNoMatchesClearFilters => '단어를 줄이거나, 필터를 지워 보세요.';

  @override
  String get searchFilterActive => '진행 중';

  @override
  String get searchFilterCompleted => '완료';

  @override
  String get searchFilterOverdue => '기한 초과';

  @override
  String get searchFilterThisWeek => '이번 주';

  @override
  String get searchFilterCritical => '중요';

  @override
  String get searchFilterCreatedByYou => '직접 만든 것';

  @override
  String get searchFilterArchived => '보관됨';

  @override
  String get searchFilterClear => '필터 지우기';

  @override
  String get searchIncompleteActions => '할 일을 검색하지 못해 이 결과는 불완전할 수 있습니다.';

  @override
  String get searchIncompleteCaptures => '캡처를 검색하지 못해 이 결과는 불완전할 수 있습니다.';

  @override
  String get searchIncompleteBoth => '할 일도 캡처도 검색하지 못해 이 결과는 불완전할 수 있습니다.';

  @override
  String get searchMatchTitle => '제목';

  @override
  String get searchMatchNextStep => '다음 단계';

  @override
  String get searchMatchStep => '단계';

  @override
  String get searchMatchSummary => '요약';

  @override
  String get searchMatchFromCapture => '캡처에서';

  @override
  String get studioSuggested => '최근 캡처에 어울리는 도구';

  @override
  String get studioRecentlyUsed => '최근 사용';

  @override
  String get studioReady => '준비됨';

  @override
  String get studioNotConnected => '연결 안 됨';

  @override
  String get studioHeroTitle => 'Action 인텔리전스';

  @override
  String get studioConnectedBlurb =>
      '문서를 이해하고, 목표를 다듬고, 계획을 세우고, 답장 초안을 쓰고, 눈앞의 것을 확인하세요.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '문서 이해, 계획, 글쓰기를 위한 도구 $count개. 직접 AI 계정을 연결하면 쓸 수 있습니다 — 요금은 당신의 제공업체가 청구하며, Action은 결코 청구하지 않습니다.';
  }

  @override
  String get studioConnectAi => 'AI 연결';

  @override
  String get studioHowItWorks => '작동 방식';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '그중 $count개는 그런 것 없이도, 전부 이 기기 안에서 이미 작동합니다.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => '이 기기에서 실행됩니다';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description 이 기기에서 실행됩니다.';
  }

  @override
  String get categoryUnderstand => '이해';

  @override
  String get categoryUnderstandBlurb => '가진 것의 뜻을 파악하세요.';

  @override
  String get categoryPlan => '계획';

  @override
  String get categoryPlanBlurb => '실행할 수 있는 형태로 바꾸세요.';

  @override
  String get categoryCreate => '작성';

  @override
  String get categoryCreateBlurb => '쓰고, 다듬고, 옮기세요.';

  @override
  String get categoryExtract => '추출';

  @override
  String get categoryExtractBlurb => '중요한 항목을 뽑아내세요.';

  @override
  String get categoryVerify => '확인';

  @override
  String get categoryVerifyBlurb => '눈앞의 것을 확인하세요.';

  @override
  String get captureSheetTitle => '무언가 캡처하기';

  @override
  String get captureSheetSubtitle => '끝까지 읽기 싫은 것은 Action에 넘기세요.';

  @override
  String get captureTakePhoto => '사진 찍기';

  @override
  String get captureTakePhotoSubtitle => '눈앞에 있는 편지, 청구서, 통지서';

  @override
  String get captureChooseImage => '이미지 선택';

  @override
  String get captureChooseImageSubtitle => '이 기기에 이미 있는 스크린샷이나 사진';

  @override
  String get capturePasteText => '텍스트 붙여넣기';

  @override
  String get capturePasteTextSubtitle => '이메일, 메시지, 통지';

  @override
  String get captureChoosePdf => 'PDF 선택';

  @override
  String get captureChoosePdfSubtitle => '이미 갖고 있는 명세서, 편지, 서식';

  @override
  String get captureFootnote =>
      '캡처는 이 기기에 남습니다. 당신이 요청하기 전에는 온라인에서 아무것도 분석되지 않습니다.';

  @override
  String get captureCouldNotOpen => '그것을 열지 못했습니다. 다른 방법으로 해 보세요.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => '읽는 중';

  @override
  String get stageNeedsReview => '검토 필요';

  @override
  String get stageActionCreated => '할 일 생성됨';

  @override
  String get stageNoText => '글을 찾지 못함';

  @override
  String get stageCouldNotBeRead => '읽지 못함';

  @override
  String get stageReadingPreview => '글을 읽고 있습니다…';

  @override
  String get stageFailedPreview => '이것은 이 기기에서 읽지 못했습니다.';

  @override
  String get provenancePhoto => '사진에서 캡처';

  @override
  String get provenanceImage => '이미지에서 캡처';

  @override
  String get provenancePastedText => '붙여넣은 글에서 캡처';

  @override
  String get provenanceDocument => '문서로 추가됨';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return '완료 $when';
  }

  @override
  String metaOverdue(String date) {
    return '기한 초과 · 기한은 $date였습니다';
  }

  @override
  String get metaDueToday => '오늘까지';

  @override
  String metaDueOn(String date) {
    return '$date까지';
  }

  @override
  String get metaCreatedByYou => '직접 만든 것';

  @override
  String get categoryPayment => '결제';

  @override
  String get categoryRenewal => '갱신';

  @override
  String get categoryAppointment => '예약';

  @override
  String get categoryBooking => '예약 확정';

  @override
  String get categoryTravel => '여행';

  @override
  String get categoryDeadline => '기한';

  @override
  String get categoryResponse => '답장 필요';

  @override
  String get categoryDelivery => '배송';

  @override
  String get categoryDocument => '문서';

  @override
  String get categoryNoActionRequired => '할 일 없음';

  @override
  String get categoryUnsure => '확실하지 않음';

  @override
  String get errorEnterManually => '직접 입력하기';
}
