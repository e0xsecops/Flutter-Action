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
  String get ocrScriptTitle => '문자 인식';

  @override
  String get ocrScriptSubtitle =>
      'Action이 사진을 볼 때 읽는 문자 체계입니다. 인식은 이 기기에서 이루어지며, 읽기 위해 캡처가 어디로도 전송되지 않습니다.';

  @override
  String get ocrScriptSectionChoose => '문자 체계';

  @override
  String get ocrScriptFollowLanguage => '앱 언어 따르기';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return '현재 $script';
  }

  @override
  String get ocrScriptLatin => '로마자';

  @override
  String get ocrScriptChinese => '중국어';

  @override
  String get ocrScriptDevanagari => '데바나가리';

  @override
  String get ocrScriptJapanese => '일본어';

  @override
  String get ocrScriptKorean => '한국어';

  @override
  String get ocrScriptLatinDescription =>
      '영어, 스페인어, 프랑스어, 독일어를 비롯해 로마자로 쓰는 언어들.';

  @override
  String get ocrScriptChineseDescription => '중국어 간체와 번체.';

  @override
  String get ocrScriptDevanagariDescription =>
      '힌디어, 마라티어, 네팔어. 벵골어·타밀어·텔루구어는 아닙니다 — 각각 다른 문자 체계입니다.';

  @override
  String get ocrScriptJapaneseDescription => '일본어.';

  @override
  String get ocrScriptKoreanDescription => '한국어.';

  @override
  String get ocrScriptFootnote =>
      '로마자를 제외한 모든 선택지는 로마자도 읽으므로, 하나를 고르는 것은 문자 체계를 바꾸는 것이 아니라 더하는 것입니다. 이 변경은 지금부터 찍는 사진에 적용되며, 이미 읽은 사진에는 적용되지 않습니다.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action은 $language 문자를 읽지 못합니다';
  }

  @override
  String get ocrScriptUnreadableBody =>
      '이 문자를 위한 기기 내 인식기가 없습니다. 사진에서 로마자로 쓰인 부분은 그대로 읽히고, 나머지는 비어서 돌아옵니다. 그 글은 대신 직접 입력하거나 붙여넣을 수 있습니다.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action은 $script을(를) 읽도록 설정되어 있습니다. 이 사진이 다른 문자 체계라면 설정에서 바꾼 뒤 다시 읽어 보세요.';
  }

  @override
  String get settingsTextRecognition => '문자 인식';

  @override
  String get settingsTextRecognitionDescription => 'Action이 사진에서 읽는 문자 체계.';

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

  @override
  String get sourceWhatWeRead => '읽어 낸 내용';

  @override
  String get sourceDelete => '캡처 삭제';

  @override
  String get sourceGone => '그 캡처는 더 이상 없습니다.';

  @override
  String get sourceDeleteTitle => '이 캡처를 삭제할까요?';

  @override
  String get sourceDeleteBody => '이미지와 거기서 읽은 글이 이 기기에서 지워집니다.';

  @override
  String get sourceDeleteKeep => '그대로 두기';

  @override
  String get sourceOpenAction => '할 일 열기';

  @override
  String sourceOpenActions(int count) {
    return '할 일 $count개 열기';
  }

  @override
  String get sourceCreateAnother => '이걸로 하나 더 만들기';

  @override
  String get sourceCreateAction => '이걸로 할 일 만들기';

  @override
  String get sourceDoMore => '이걸로 더 해 보기';

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
    return '$format $size KB에서';
  }

  @override
  String get sourceTextFound => '글을 찾았습니다';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines줄 · $ms ms';
  }

  @override
  String get sourceReadExplainer => 'Action이 읽은 글입니다. 이걸로 만들어진 것은 아래에 있습니다.';

  @override
  String get sourceNotInterpreted =>
      '아직 아무것도 해석하지 않았습니다. Action이 이걸로 무엇을 할지 제안하고, 무언가 만들어지기 전에 당신이 확인합니다.';

  @override
  String get sourceNoTextExplainer =>
      '손글씨, 아주 어두운 조명, 또는 이 기기가 아직 읽지 못하는 문자에서 이런 일이 생길 수 있습니다.';

  @override
  String get sourceReadFailed => '이건 읽지 못했습니다';

  @override
  String get sourceReadFailedReason => '문자 인식이 끝까지 진행되지 않았습니다.';

  @override
  String get sourceTryReadingAgain => '다시 읽어 보기';

  @override
  String get sourceTypeInstead => '대신 내용을 입력하기';

  @override
  String get sourceTypeWhatItSays => '적혀 있는 내용을 입력하세요';

  @override
  String get sourceTypeHint => '날짜, 금액, 그리고 무엇을 요구하는지.';

  @override
  String get sourceMadeFromThis => '이 캡처로 만든 것';

  @override
  String sourceMadeFromThisCount(int count) {
    return '이 캡처로 만든 것 $count개';
  }

  @override
  String get sourceTheDocument => '문서';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count쪽',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => '쪽수를 알 수 없음';

  @override
  String get sourceDocumentNotRead =>
      'Action은 이 문서 안에 무엇이 있는지 읽지 않았습니다. 그것이 필요한 도구를 실행하면 파일이 당신이 연결한 AI 제공자에게 전달되며, 그 전에 알려 드립니다.';

  @override
  String get previewSaveFailed => '저장하지 못했습니다. 다시 시도해 주세요.';

  @override
  String get previewTitle => '캡처 확인';

  @override
  String get previewImageFailed => '그 이미지를 열지 못했습니다.';

  @override
  String get previewHint => '글이 읽히는지, 중요한 부분이 잘리지 않았는지 확인하세요.';

  @override
  String get previewRetake => '다시 찍기';

  @override
  String get pasteTitle => '글 붙여넣기';

  @override
  String get pasteHint => '끝까지 읽고 싶지 않은 메일, 메시지, 안내문을 붙여넣으세요.';

  @override
  String get pasteFootnote => '날짜, 금액, 요청이 들어 있는 글이 잘 맞습니다.';

  @override
  String get pasteEnough => '작업하기에 충분해 보입니다.';

  @override
  String get pasteMore => '글이 조금 더 있으면 결과가 좋아집니다.';

  @override
  String get reviewLoadFailed => '이 캡처를 불러오지 못했습니다.';

  @override
  String get reviewConfirmed => '확인됨';

  @override
  String get reviewNeedsReview => '검토 필요';

  @override
  String get reviewReview => '검토하기';

  @override
  String get reviewHighConfidence => '신뢰도 높음';

  @override
  String get reviewConfirmedByYou => '당신이 확인함';

  @override
  String get reviewMissing => '없음';

  @override
  String get reviewNotUnderstood => 'Action이 이 원본을 믿을 만큼 충분히 이해하지 못했습니다.';

  @override
  String get reviewNotUnderstoodBody =>
      '캡처는 그대로 있고 잃어버린 것은 없습니다. 내용은 직접 입력할 수 있고, 원본은 참고용으로 계속 붙어 있습니다.';

  @override
  String get reviewEnterDetails => '내용 입력하기';

  @override
  String get reviewKeepSource => '원본을 나중을 위해 남겨두기';

  @override
  String reviewEngine(String engine) {
    return '엔진: $engine';
  }

  @override
  String get reviewManualNotice => '이 할 일은 당신이 직접 만들고 있습니다. 여기 입력한 내용만 쓰입니다.';

  @override
  String get reviewUntitled => '제목 없는 할 일';

  @override
  String get reviewEditTitle => '제목 수정';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이걸 확인하기 전에 값 $count개를 검토해야 합니다.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => '핵심 정보';

  @override
  String get reviewNotFound => '찾지 못함';

  @override
  String get reviewSuggestedNextStep => '제안된 다음 단계';

  @override
  String get reviewWhyThisMatters => '이것이 중요한 이유';

  @override
  String get reviewSteps => '단계';

  @override
  String get reviewAddStep => '단계 추가';

  @override
  String get reviewInjectionNotice =>
      '이 원본의 일부 글이 문서의 사실이 아니라 지시문처럼 보여서 Action이 무시했습니다.';

  @override
  String get reviewLayoutNotice =>
      '이 문서의 배치에는 글 추출이 온전히 살리지 못한 관계가 담겨 있을 수 있습니다. 확인하기 전에 아래 값을 원본과 대조하세요.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason 아래 값을 원본과 대조하세요.';
  }

  @override
  String get reviewDeadline => '기한';

  @override
  String get reviewAmount => '금액';

  @override
  String get reviewLeftUnset => '없음 — 비워 두기로 선택했습니다';

  @override
  String get reviewUnclear => '분명하지 않음';

  @override
  String get reviewNotSet => '설정 안 함';

  @override
  String get reviewNoDeadlineFound => '이 문서에서 찾지 못했습니다';

  @override
  String get reviewNoAmountFound => '이 문서에서 금액을 찾지 못했습니다';

  @override
  String get reviewMultipleDates => 'Action이 가능한 날짜를 여럿 찾았습니다.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '날짜 $count개가 기한일 수 있습니다. 맞는 것을 고르거나, 다른 날짜를 입력하거나, 비워 두세요.';
  }

  @override
  String get reviewChooseDate => '날짜 고르기';

  @override
  String get reviewMultipleAmounts => 'Action이 가능한 금액을 하나 넘게 찾았습니다.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '금액 $count개가 여기서 말하는 금액일 수 있습니다. 하나를 고르거나, 다른 금액을 입력하거나, 비워 두세요.';
  }

  @override
  String get reviewChooseAmount => '금액 고르기';

  @override
  String get reviewSkipStep => '이 단계 건너뛰기';

  @override
  String get reviewKeepStep => '이 단계 남기기';

  @override
  String get reviewEditStep => '단계 수정';

  @override
  String get reviewCreateManually => '직접 만들기';

  @override
  String get reviewConfirmAndCreate => '확인하고 할 일 만들기';

  @override
  String get reviewFixHighlighted => '표시된 항목 검토';

  @override
  String get reviewSaving => '저장 중…';

  @override
  String get reviewSaveFailed =>
      '이 할 일을 저장하지 못했습니다. 잃어버린 것은 없습니다 — 다시 시도해 주세요.';

  @override
  String get reviewFieldTitle => '제목';

  @override
  String get reviewTitleHint => '무엇이 이루어져야 하나요?';

  @override
  String get reviewNewStep => '새 단계';

  @override
  String get reviewStepHint => '무엇을 할지';

  @override
  String get reviewDatesConflict => '문서에 날짜가 하나 넘게 나옵니다.';

  @override
  String get reviewAmountsConflict => '문서에 금액이 하나 넘게 나옵니다.';

  @override
  String get reviewAnotherDate => '다른 날짜 — 2026-08-30';

  @override
  String get reviewBadDate => '실제 날짜가 아닙니다. 2026-08-30 형식을 쓰세요.';

  @override
  String get reviewTypeDate => '날짜를 입력하거나, 아래에서 비워 두세요.';

  @override
  String get reviewUseThisDate => '이 날짜 사용';

  @override
  String get reviewLeaveNoDeadline => '기한 없이 진행';

  @override
  String get reviewAnotherAmount => '다른 금액 — 780.00';

  @override
  String reviewAmountError(String reason) {
    return '이 금액은 쓸 수 없습니다: $reason.';
  }

  @override
  String get reviewUseThisAmount => '이 금액 사용';

  @override
  String get reviewLeaveNoAmount => '금액 없이 진행';

  @override
  String get reviewThisValue => '이 값';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => '캡처에서 보기';

  @override
  String get reviewViewSource => '원본 보기';

  @override
  String get reviewFromSource => '원본에서';

  @override
  String get reviewNotVerified => '대조 안 됨';

  @override
  String get reviewCouldNotVerify => '이것을 원본과 대조하지 못했습니다.';

  @override
  String get reviewLooksRight => '맞아 보입니다';

  @override
  String get reviewStageReading => '원본 읽는 중';

  @override
  String get reviewStageUnderstanding => '중요한 내용 파악 중';

  @override
  String get reviewStageChecking => '검토가 필요한 부분 확인 중';

  @override
  String get reviewNothingToDo => '지금 하실 일은 없습니다.';

  @override
  String get reviewInformationOnly => '안내로만 보입니다 — 기한도, 결제도, 회신 요청도 찾지 못했습니다.';

  @override
  String get reviewInformationOnlyWithSource =>
      '안내로만 보입니다 — 이 캡처에서 기한도, 결제도, 회신 요청도 찾지 못했습니다.';

  @override
  String get reviewSourceKept => '어느 쪽이든 원본은 남습니다.';

  @override
  String get reviewAddAnyway => '그래도 할 일 추가';

  @override
  String get reviewActionConfirmed => '할 일 확인됨';

  @override
  String get reviewCreatedByYou => '당신이 만들었습니다.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '검토한 정보 $count개를 바탕으로 당신이 확인했습니다.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '검토한 정보 $count개를 바탕으로 당신이 확인했습니다. 그중 $edited개를 바꿨습니다.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => '이 기기에 저장했습니다.';

  @override
  String get detailLoadFailed => '이 할 일을 불러오지 못했습니다. 이 기기에는 그대로 저장되어 있습니다.';

  @override
  String get detailNotFoundTitle => '그 할 일은 더 이상 없습니다';

  @override
  String get detailNotFoundMessage => '이 기기에서 삭제되었을 수 있습니다.';

  @override
  String get detailGoBack => '돌아가기';

  @override
  String get detailMore => '더 보기';

  @override
  String get detailChangeUrgency => '긴급도 바꾸기';

  @override
  String get detailAddRecommendedStep => '추천 단계 추가';

  @override
  String get detailEditRecommendedStep => '추천 단계 수정';

  @override
  String get detailArchiveTitle => '이 할 일을 보관할까요?';

  @override
  String get detailArchiveBody => '목록에서는 빠지지만 삭제되지는 않고, 이것이 나온 캡처도 그대로 남습니다.';

  @override
  String get detailArchiveConfirm => '보관';

  @override
  String get detailArchived => '보관됨';

  @override
  String detailCompletedOn(String date) {
    return '$date에 완료';
  }

  @override
  String get detailSectionDetails => '세부 정보';

  @override
  String get detailSectionReminders => '알림';

  @override
  String get detailAllStepsDone => '모든 단계 완료';

  @override
  String get detailNextEyebrow => '다음';

  @override
  String get detailCompleteQuestion => '이 할 일을 완료할까요?';

  @override
  String get detailMarkStepDone => '단계를 완료로 표시';

  @override
  String get detailCompleteAction => '이 할 일 완료하기';

  @override
  String get detailAddDeadline => '기한 추가';

  @override
  String get detailAddAmount => '금액 추가';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$total개 중 $completed개 완료';
  }

  @override
  String get detailNoStepsTitle => '아직 단계가 없습니다';

  @override
  String get detailNoStepsMessage => '실제로 해야 하는 움직임으로 쪼개 보세요.';

  @override
  String get detailAddFirstStep => '첫 단계 추가';

  @override
  String detailStepCompletedSemantics(String title) {
    return '완료된 단계: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return '다음 단계: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return '단계: $title';
  }

  @override
  String detailMarkDone(String title) {
    return '“$title”을(를) 완료로 표시';
  }

  @override
  String detailMarkNotDone(String title) {
    return '“$title”을(를) 미완료로 표시';
  }

  @override
  String get detailStepOptions => '단계 옵션';

  @override
  String get detailMoveUp => '위로';

  @override
  String get detailMoveDown => '아래로';

  @override
  String get detailDeleteStep => '단계 삭제';

  @override
  String get detailDateFormat => 'M월 d일';

  @override
  String get detailDateFormatWithYear => 'yyyy년 M월 d일';

  @override
  String get stepDeleteTitle => '이 단계를 삭제할까요?';

  @override
  String get stepDeleteKeep => '그대로 두기';

  @override
  String get detailNoRemindersYet => '아직 알림이 없습니다.';

  @override
  String get detailReminderLimit =>
      '할 일 하나에 둘 수 있는 알림은 이것이 최대입니다. 하나를 지워야 새로 추가할 수 있습니다.';

  @override
  String get detailAddReminder => '알림 추가';

  @override
  String get detailChangeReminder => '알림 바꾸기';

  @override
  String get detailRemoveReminder => '알림 지우기';

  @override
  String get detailReminderFormat => 'M월 d일 (EEE) HH:mm';

  @override
  String get reminderStatePending => '아직 설정되지 않음';

  @override
  String get reminderStateNotificationsOff => '저장됨, 하지만 알림이 꺼져 있음';

  @override
  String get reminderStateFailed => '예약하지 못했습니다';

  @override
  String get reminderStateRemoving => '지우는 중…';

  @override
  String get reminderSetConfirmation => '알림을 설정했습니다. 저희가 알려 드릴게요.';

  @override
  String get reminderUpdatedConfirmation => '알림을 수정했습니다.';

  @override
  String get reminderNeedsPermission =>
      '알림이 꺼져 있어 이 알림은 저장되었지만 아직 알려 드릴 수 없습니다.';

  @override
  String get reminderScheduleFailed => '이 알림은 저장되었지만 Android가 예약해 주지 않았습니다.';

  @override
  String get reminderLimitReached => '그 할 일에는 이미 최대 개수의 알림이 있습니다.';

  @override
  String get reminderTimeInPast => '그 시각은 이미 지났습니다.';

  @override
  String get reminderAddTitle => '알림 추가';

  @override
  String get reminderChangeTitle => '이 알림 바꾸기';

  @override
  String get reminderDateLabel => '날짜';

  @override
  String get reminderTimeLabel => '시각';

  @override
  String get reminderFieldDateFormat => 'yyyy년 M월 d일 (EEE)';

  @override
  String get reminderFieldTimeFormat => 'a h:mm';

  @override
  String get reminderSummaryDateFormat => 'M월 d일 EEEE';

  @override
  String get reminderPresetFormat => 'M월 d일 a h:mm';

  @override
  String reminderSummary(String date, String time) {
    return '$date $time에 알려 드립니다.';
  }

  @override
  String get reminderTimePastError => '그 시각은 이미 지났습니다. 더 늦은 시각을 고르세요.';

  @override
  String get reminderSet => '알림 설정';

  @override
  String get reminderPresetInHour => '1시간 뒤';

  @override
  String get reminderPresetTomorrowMorning => '내일 아침';

  @override
  String get reminderPresetNextWeek => '다음 주';

  @override
  String get reminderPresetOnTheDay => '당일';

  @override
  String get reminderPresetDayBefore => '1일 전';

  @override
  String get reminderPresetWeekBefore => '1주 전';

  @override
  String get reminderPresetAtDeadline => '기한에';

  @override
  String get reminderPresetHourBefore => '1시간 전';

  @override
  String get editNextStepTitle => '추천하는 다음 단계';

  @override
  String get editNextStepSubtitle => '다음에 하면 좋은 일을 한 문장으로.';

  @override
  String get editNextStepHint => '다음에 하면 좋은 일은 무엇인가요?';

  @override
  String get editRemoveSuggestion => '제안 지우기';

  @override
  String get editUrgencyTitle => '얼마나 급한가요?';

  @override
  String get editStepHint => '구체적으로 할 일 한 가지';

  @override
  String get editAddStep => '단계 추가';

  @override
  String get editDateHint => 'YYYY-MM-DD';

  @override
  String get editRemoveDeadline => '기한 지우기';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => '금액 저장';

  @override
  String get editRemoveAmount => '금액 지우기';

  @override
  String get evidenceTitle => '이건 어디서 왔나';

  @override
  String get evidenceUnverified =>
      'Action이 읽은 글에서 이 단어들을 찾지 못했으므로 이 값은 대조되지 않았습니다. 믿고 쓰기 전에 원본과 맞춰 보세요.';

  @override
  String get evidenceHighlighted =>
      '이 단어들은 Action이 이 캡처에서 읽은 글에 있었고, 강조 표시가 그 위치를 보여 줍니다.';

  @override
  String get evidenceNoRegion =>
      '이 단어들은 Action이 이 캡처에서 읽은 글에 있었습니다. 이미지의 정확히 어디인지는 알아내지 못했고, 짐작하지 않습니다.';

  @override
  String get evidenceInText => '이 단어들은 이 캡처가 담고 있는 글에 있었습니다.';

  @override
  String get sourceCapturedAtFormat => 'M월 d일 HH:mm';

  @override
  String get urgencyCritical => '매우 급함';

  @override
  String get urgencyImportant => '중요';

  @override
  String get urgencyNormal => '보통';

  @override
  String get urgencyLow => '낮음';

  @override
  String get urgencyUnsure => '알 수 없음';
}
