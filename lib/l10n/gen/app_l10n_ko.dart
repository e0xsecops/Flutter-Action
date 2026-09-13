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
  String get securityTitle => '보안과 개인정보';

  @override
  String get securitySectionProtection => '보호';

  @override
  String get securityAppLockUnavailable =>
      '앱 잠금에는 이 기기의 화면 잠금이 필요합니다. 기기 설정에서 PIN, 패턴, 비밀번호 또는 지문을 먼저 설정하세요.';

  @override
  String get securityAppLockOn => 'Action은 본인이 맞는지 기기에 확인을 맡깁니다.';

  @override
  String get securityAppLockOff => 'Action을 열 때 지문, 얼굴 또는 기기 PIN을 요구합니다.';

  @override
  String get securityAskAgain => '다시 묻기';

  @override
  String get securityAskAgainDescription => '잠기기까지 Action이 백그라운드에 머물 수 있는 시간.';

  @override
  String get securityScreenPrivacy => '화면 보호';

  @override
  String get securityScreenPrivacyDescription =>
      '화면 캡처와 화면 녹화를 막고, 앱 전환기에서 Action을 숨기도록 Android에 요청합니다.';

  @override
  String get securityPrivateReminders => '비공개 알림';

  @override
  String get securityPrivateRemindersOn => '알림은 무언가가 기다린다는 것만 말합니다.';

  @override
  String get securityPrivateRemindersOff =>
      '알림에 할 일의 제목이 보입니다. 잠금 화면에 뜨지 않게 하려면 이걸 켜세요.';

  @override
  String get securityLockNow => '지금 잠그기';

  @override
  String get securityLockNowDescription => '기다리지 않고 문을 닫습니다.';

  @override
  String get securitySectionStorage => '데이터가 저장되는 방식';

  @override
  String get securityStorageDataLabel => '당신의 할 일, 캡처, 설정';

  @override
  String get securityStorageDataDetail =>
      '이 앱 자신의 비공개 저장소에 있으며, 다른 앱은 읽을 수 없고 Android가 기기 암호화의 일부로 암호화합니다. Action이 그 위에 자체적인 두 번째 층을 더하지는 않습니다.';

  @override
  String get securityStorageKeyLabel => '당신의 AI 제공자 키';

  @override
  String get securityStorageKeyDetail =>
      '나머지와 함께 두지 않고 Android Keystore에 보관하며, 저장한 뒤에는 다시 보여 주지 않습니다.';

  @override
  String get securityStorageGapLabel => '이것으로 덮이지 않는 것';

  @override
  String get securityStorageGapDetail =>
      '그중 어느 것도 잠금이 풀린 당신의 기기를 누가 쓰는 상황을 막지는 못하며, 변조되거나 루팅된 시스템은 보통보다 더 많이 읽을 수 있습니다. 앱 잠금이 그중 첫 번째에 도움이 되는 설정입니다.';

  @override
  String get securitySectionInformation => '당신의 정보';

  @override
  String get securityWhereInfoDescription =>
      '당신의 데이터가 갈 수 있는 모든 경로와, 이 기기를 떠나는 두 가지.';

  @override
  String get securityAppLockRefused => '확인되지 않아 아무것도 바뀌지 않았습니다.';

  @override
  String get securityAppLockUnavailableToast =>
      '이 기기에는 화면 잠금이 설정되어 있지 않습니다. 기기 설정에서 PIN, 패턴, 비밀번호 또는 지문을 추가한 뒤 다시 시도하세요.';

  @override
  String get securityScreenPrivacyRefused =>
      '이 기기가 화면 보호를 적용하지 않아, 켜진 것으로 표시하는 대신 꺼진 채로 두었습니다.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '예약된 알림 $count개가 이제 덜 말합니다.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '예약된 알림 $count개를 수정했습니다.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => '즉시';

  @override
  String get appLockDelayOneMinute => '1분 뒤';

  @override
  String get appLockDelayFiveMinutes => '5분 뒤';

  @override
  String get securityDelayImmediatelyDescription => 'Action이 화면에서 벗어날 때마다';

  @override
  String get securityDelayOneMinuteDescription => '메시지 하나에 답할 만큼';

  @override
  String get securityDelayFiveMinutesDescription => '전화 한 통을 받을 만큼';

  @override
  String get securityHeroProtected => '보호 중';

  @override
  String get securityHeroNothingOn => '켜진 것이 없음';

  @override
  String get securityHeroFootnote =>
      '여기 있는 모든 것은 이 기기에서 작동합니다. 이 설정들은 어디로도 전송되지 않고, 원격으로 바뀔 수도 없습니다.';

  @override
  String get securityHeadlineNone => '세 가지 보호를 쓸 수 있습니다';

  @override
  String securityHeadlineOne(String first) {
    return '$first 켜짐';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first과(와) $second 켜짐';
  }

  @override
  String get securityHeadlineAll => '세 가지 보호가 모두 켜짐';

  @override
  String get securityTransfersTitle => '이 기기를 떠난 것';

  @override
  String get securityTransfersNoProvider =>
      '연결된 AI 제공자가 없어서 분석을 위해 보내지는 것이 전혀 없습니다.';

  @override
  String get securityTransfersDescription =>
      '무언가 전송되는 순간에, 응답이 돌아왔는지와 상관없이 여기에 기록됩니다. 도구와 제공자와 크기만 — 안에 무엇이 있었는지는 절대 남기지 않습니다. 이 기기에 90일 보관되며 어디로도 보내지 않습니다.';

  @override
  String get securityClear => '지우기';

  @override
  String get securityNothingSent => '보낸 것이 없습니다';

  @override
  String get securityNothingSentDescription => 'AI 제공자를 쓰는 도구를 실행하면 여기에 표시됩니다.';

  @override
  String get securityClearHistoryTitle => '이 기록을 지울까요?';

  @override
  String get securityClearHistoryBody =>
      '무엇을 보냈는지에 대한 기록이 이 기기에서 삭제됩니다. 이미 보낸 것을 되돌리지는 않습니다.';

  @override
  String get securityUnnamedTool => 'Intelligence 도구';

  @override
  String get securityYourProvider => '당신의 AI 제공자';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count쪽',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '파일 $count개',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => '짧은 글';

  @override
  String securityTransferCharacters(int count) {
    return '$count천 자';
  }

  @override
  String securitySentTo(String provider) {
    return '$provider(으)로 보냈습니다.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '$provider(으)로 보냈습니다 · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return '$count주 전';
  }

  @override
  String get helpTitle => '도움말';

  @override
  String get helpAddQuestion => '무엇을 추가할 수 있나요?';

  @override
  String get helpAddAnswer =>
      '스크린숏, 편지나 청구서 사진, 또는 붙여넣은 글. 날짜, 금액, 요청이 들어 있는 것이 가장 잘 맞습니다.';

  @override
  String get helpReviewQuestion => 'Action은 왜 검토하라고 하나요?';

  @override
  String get helpReviewAnswer =>
      '문서를 읽는 기계는 잘못 읽을 수 있고, 조용히 틀린 기한은 기한이 아예 없는 것보다 나쁘기 때문입니다. Action은 무엇을 찾았고 어떤 단어에서 나왔는지 보여 주며, 당신이 확인하기 전에는 아무것도 저장하지 않습니다.';

  @override
  String get helpVaryQuestion => '다시 시도하면 결과가 왜 달라지나요?';

  @override
  String get helpVaryAnswer =>
      '문서를 읽는 서비스는 결정적이지 않아서, 같은 캡처라도 조금 다르게 돌아올 수 있습니다. 검토 단계가 있는 이유이기도 합니다 — 변하지 않는 쪽은 당신입니다.';

  @override
  String get helpLateQuestion => '알림이 왜 늦게 왔나요?';

  @override
  String get helpLateAnswer =>
      '알림은 Android를 통해 예약되고, 정확히 언제 전달할지는 Android가 정합니다. 배터리 절약, Doze, 제조사의 전원 설정이 모두 알림을 늦출 수 있습니다. Action은 분 단위로 알림을 약속하지 않습니다.';

  @override
  String get helpDataQuestion => '제 데이터는 어디에 있나요?';

  @override
  String get helpDataAnswer =>
      '거의 모두 이 기기에 있습니다. 캡처, 할 일, 단계, 알림, 검색이 그렇습니다. 예외가 둘 — Action에게 읽어 달라고 한 내용은 그것을 읽는 AI 서비스로 전송되고, 확인된 할 일의 짧은 기록이 익명 식별자 아래 클라우드에 저장될 수 있습니다. 설정의 개인정보와 데이터에 그 기록에 무엇이 들어가는지 정확히 적혀 있습니다.';

  @override
  String get helpBackupQuestion => '이게 백업인가요?';

  @override
  String get helpBackupAnswer =>
      '아닙니다. 클라우드 기록은 새 기기로 복원할 수 없고, 로그인할 계정도 없습니다. Action을 지우거나 이 기기를 잃어버리면 거기 있던 데이터는 사라집니다.';

  @override
  String get helpCorrectQuestion => '할 일을 어떻게 고치나요?';

  @override
  String get helpCorrectAnswer =>
      '그 할 일을 열고 어떤 항목이든 수정하세요 — 제목, 기한, 금액, 제안된 다음 단계. 단계는 언제든 추가하고 순서를 바꾸고 완료하고 지울 수 있습니다. 할 일을 수정하는 것은 AI 서비스에 아무것도 묻지 않습니다.';

  @override
  String get privacyTitle => '개인정보와 데이터';

  @override
  String get privacyIntro =>
      'Action은 가능한 만큼을 이 기기에 둡니다. 두 가지가 예외이고, 둘 다 아래에 적어 두었습니다.';

  @override
  String get privacyGroupOnDevice => '이 기기 안';

  @override
  String get privacyOnDeviceCaptures => '캡처 — 당신이 추가한 스크린숏, 사진, 글과 거기서 읽어 낸 글.';

  @override
  String get privacyOnDeviceActions => '할 일과 그 단계, 항목, 알림.';

  @override
  String get privacyOnDeviceSearch =>
      '검색. 검색은 여기서 돌아가고, 어디로도 보내지지 않으며, 화면을 닫은 뒤에는 남지 않습니다.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      '사진은 위치 없이 저장됩니다. 휴대전화가 사진 안에 적어 넣는 좌표, 시각, 카메라 정보는 캡처가 저장되기 전에 제거되므로 여기에도 남지 않고, 캡처를 AI 제공자에게 보낼 때도 함께 가지 않습니다.';

  @override
  String get privacyGroupSentToRead => '읽히기 위해 전송되는 것';

  @override
  String get privacySentToReadWhat =>
      '캡처를 해석해 달라고 Action에 요청하면 그 내용은 그것을 읽는 AI 서비스로 전송됩니다. 이것은 기기에서 도는 AI가 아닙니다.';

  @override
  String get privacySentToReadWhen => '당신이 고른 캡처만, 그리고 요청했을 때만 전송됩니다.';

  @override
  String get privacyGroupYourProvider => '당신 자신의 AI 제공자로 전송되는 것';

  @override
  String get privacyProviderWhat =>
      '설정에서 AI 제공자를 연결하면, Intelligence 도구는 당신이 선택한 내용을 그 제공자에게 — OpenAI, Anthropic, Google 또는 당신이 고른 endpoint — 당신 자신의 API 키로 보냅니다.';

  @override
  String get privacyProviderDirect =>
      '그들에게 곧바로 갑니다. Action에 속한 어떤 서버도 거치지 않습니다.';

  @override
  String get privacyProviderScope =>
      '도구를 위해 고른 것만, 그리고 실행할 때만 전송됩니다. 다른 할 일과 캡처와 원본은 절대 포함되지 않고, 백그라운드에서 무언가 전송되는 일도 없습니다.';

  @override
  String get privacyProviderKey =>
      '당신의 API 키는 이 기기의 보안 저장소에 보관되며 그 키가 속한 제공자에게만 전송됩니다. 보안 저장소는 잠금이 풀린 당신의 기기를 손에 넣은 사람에게 실제 장애물이지만 절대적이지는 않으며, Action은 그렇지 않은 척하지 않습니다.';

  @override
  String get privacyProviderLocalTools =>
      '아무것도 보내지 않는 도구들이 있습니다. 민감한 내용을 가리기, 파일이 어디서 왔는지 확인하기, 자격 증명 찾기, 링크 살펴보기는 모두 전부 이 기기에서 돕니다.';

  @override
  String get privacyProviderAgreement =>
      '당신이 보낸 것을 제공자가 어떻게 다루는지는 Action이 아니라 그들과의 약정이 정합니다.';

  @override
  String get privacyGroupCloud => '클라우드에 저장되는 것';

  @override
  String get privacyCloudWhat =>
      '할 일을 확인하면 그 짧은 기록이 이 설치본의 익명 식별자 아래 저장될 수 있습니다. 제목, 상태, 긴급도, 분류, 기한, 금액, 제안된 다음 단계, 그리고 시각입니다.';

  @override
  String get privacyCloudNotSent =>
      '당신의 캡처, 거기서 읽어 낸 글, 할 일의 단계와 항목, 그리고 알림은 전송되지 않습니다.';

  @override
  String get privacyCloudNotBackup =>
      '이것은 백업이 아닙니다. 새 기기로 복원할 방법이 없고, 이 설치본을 잃으면 익명 식별자도 함께 사라집니다.';

  @override
  String get privacyGroupDiagnostics => '진단';

  @override
  String get privacyDiagnosticsWhat =>
      'Action은 앱에서 무슨 일이 일어났는지를 익명 횟수로 기록합니다 — 캡처가 시작되었다는 것, 추출이 됐는지 안 됐는지, 검색이 아무것도 못 찾았다는 것, 할 일이 완료되었다는 것.';

  @override
  String get privacyDiagnosticsCounts =>
      '이것은 횟수이지 내용이 아닙니다. 제목, 금액, 기한, 참조번호, 캡처한 글, 검색어는 결코 들어가지 않으며, 익명 식별자나 할 일 또는 캡처의 어떤 식별자도 들어가지 않습니다.';

  @override
  String get privacyDiagnosticsCrash =>
      '앱이 멈추면 고칠 수 있도록 오류와 발생한 위치가 보고됩니다. Action은 그 보고에 당신의 데이터를 붙이지 않습니다.';

  @override
  String get privacySectionYourData => '당신의 데이터';

  @override
  String get privacyYourDataFootnote =>
      '캡처를 지워도 할 일은 그대로 남습니다. 캡처가 사라진 할 일도 여전히 작동합니다. 다만 무엇에서 나왔는지를 더는 보여 주지 않을 뿐입니다.';

  @override
  String get privacyClearCaptures => '캡처 지우기';

  @override
  String get privacyClearCapturesDescription => '모든 캡처와 그 이미지 파일을 삭제합니다.';

  @override
  String get privacyDeleteAll => '내 데이터 전부 삭제';

  @override
  String get privacyDeleteAllDescription => '할 일, 단계, 알림, 캡처, 그리고 위의 클라우드 기록.';

  @override
  String get privacyClearCapturesTitle => '캡처를 지울까요?';

  @override
  String get privacyClearCapturesBody =>
      '모든 캡처와 그 이미지가 이 기기에서 삭제됩니다. 할 일은 지금 그대로 남습니다.';

  @override
  String get privacyCapturesDeleted => '캡처를 삭제했습니다.';

  @override
  String get privacyCapturesPartlyDeleted =>
      '일부 캡처는 삭제하지 못했습니다. 다른 것은 아무것도 바뀌지 않았습니다.';

  @override
  String get privacyDeleteAllTitle => '데이터를 전부 삭제할까요?';

  @override
  String get privacyDeleteAllBody =>
      '이 기기의 모든 할 일, 단계, 알림, 캡처와 위에 적은 클라우드 기록을 삭제합니다. 되돌릴 수 없고, 복원할 백업도 없습니다.';

  @override
  String get privacyDeleteEverything => '전부 삭제';

  @override
  String get privacyDeletedAll => '전부 삭제했습니다.';

  @override
  String get privacyDeleteFailed => '데이터를 삭제하지 못했습니다.';

  @override
  String get privacyDeletedUnverified =>
      '이 기기의 모든 것을 삭제했습니다. Action이 클라우드에 연결해 거기 남은 것이 없는지 확인하지 못했고, 다시 확인할 것입니다.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '$leftovers을(를) 빼고 삭제했습니다.';
  }

  @override
  String get privacyWillTryAgain => 'Action이 다시 시도합니다.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action이 클라우드 확인을 끝내지 못했고, 다시 시도합니다.';

  @override
  String get privacyLeftoverCaptures => '일부 캡처';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클라우드 기록 $count개',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first과(와) $second';
  }

  @override
  String get privacyCloudDeleted => '클라우드 기록을 삭제했습니다.';

  @override
  String get privacyCloudUnreachable => '여전히 연결하지 못했습니다. Action이 다시 시도합니다.';

  @override
  String get privacyPendingTitle => '아직 삭제할 것';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '지난번에 클라우드 기록 $count개에 연결하지 못했습니다. Action이 알아서 다시 시도하며, 지금 직접 다시 시도할 수도 있습니다.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => '다시 시도';

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

  @override
  String get detailSaveFailed => '저장하지 못했습니다. 잃어버린 것은 없습니다 — 다시 시도해 주세요.';

  @override
  String get detailSectionCreatedFrom => '만든 원본';

  @override
  String get detailSourceChecking => '원본 캡처를 불러오는 중…';

  @override
  String get detailSourceUnavailable => '원본 캡처를 더 이상 찾을 수 없습니다.';

  @override
  String get detailReopenAction => '할 일 다시 열기';

  @override
  String get detailMarkActionComplete => '할 일 전체를 완료로 표시';

  @override
  String get detailGetHelp => '이것에 대해 도움 받기';

  @override
  String get detailSectionHistory => '이력';

  @override
  String get detailHistoryShowLess => '간단히 보기';

  @override
  String detailHistoryShowAll(int count) {
    return '이력 $count개 모두 보기';
  }

  @override
  String get detailHistoryCreated => '만들어짐';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '단계 $count개와 함께 만들어짐',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => '당신이 세부 정보를 확인했습니다';

  @override
  String detailHistoryStepFinished(String title) {
    return '“$title” 끝냄';
  }

  @override
  String get detailHistoryAStep => '어떤 단계';

  @override
  String get detailHistoryReminderSet => '당신이 알림을 걸어 두었습니다';

  @override
  String detailHistoryReminderSetFor(String when) {
    return '당신이 $when에 알리도록 알림을 걸어 두었습니다';
  }

  @override
  String get detailHistoryCompleted => '완료로 표시함';

  @override
  String get detailHistoryChanged => '마지막으로 바뀜';

  @override
  String get detailHistoryTimestampFormat => 'yyyy년 M월 d일 HH:mm';

  @override
  String get aiProviderCustom => '직접 지정 (OpenAI 호환)';

  @override
  String get aiCapabilityText => '글';

  @override
  String get aiCapabilityImages => '이미지';

  @override
  String get aiCapabilityDocuments => '문서';

  @override
  String get aiCapabilityStructuredResults => '구조화된 결과';

  @override
  String get aiCapabilityStreaming => '스트리밍 응답';

  @override
  String get aiCapabilitySystemInstructions => '시스템 지시문';

  @override
  String get aiCapabilityEvidenceCitations => '근거 인용';

  @override
  String get aiCapabilityLongDocuments => '긴 문서 전체';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a 또는 $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head 또는 $last';
  }

  @override
  String get aiFailureNotConfigured => '이 도구를 쓰려면 AI 제공자를 연결하세요.';

  @override
  String get aiFailureInvalidKey => '그 API 키를 제공자가 받아들이지 않았습니다.';

  @override
  String get aiFailureQuotaExceeded => '당신의 제공자 계정에 크레딧이 없거나 할당량을 다 썼습니다.';

  @override
  String get aiFailureRateLimited =>
      '당신의 제공자가 요청 속도를 제한하고 있습니다. 잠시 뒤에 다시 시도해 보세요.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action이 당신의 AI 제공자에 닿지 못했습니다. 연결을 확인해 보세요.';

  @override
  String get aiFailureUnsupportedModel =>
      '그 모델은 당신의 키로는 쓸 수 없습니다. 설정에서 다른 모델을 고르세요.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return '당신이 고른 모델은 $capabilities을(를) 읽지 못합니다. 설정에서 다른 모델을 고르세요.';
  }

  @override
  String get aiFailureContextTooLarge => '이 모델이 한 번에 읽기에는 내용이 너무 많았습니다.';

  @override
  String get aiFailureInputTooLargeText => '한 번에 분석할 수 있는 양보다 글이 많습니다.';

  @override
  String get aiFailureProviderUnavailable =>
      '당신의 AI 제공자에 문제가 생겼습니다. 잠시 뒤에 다시 시도해 보세요.';

  @override
  String get aiFailureMalformedResponse => '그 제공자가 Action이 읽을 수 없는 것을 돌려보냈습니다.';

  @override
  String get aiFailureCancelled => '중지했습니다.';

  @override
  String get aiFailureInsecureEndpoint => '그 endpoint는 https:// 주소여야 합니다.';

  @override
  String get aiFailureUnknown => '당신의 AI 제공자와 주고받는 중에 무언가 잘못되었습니다.';

  @override
  String get appLockTitle => 'Action이 잠겨 있습니다';

  @override
  String get appLockPrompt =>
      '계속하려면 본인이 맞는지 확인하세요. Action은 당신의 기기에 확인을 맡깁니다 — 당신의 지문도, 얼굴도, PIN도 결코 보지 않습니다.';

  @override
  String get appLockUnlocking => '잠금을 푸는 중…';

  @override
  String get appLockNotConfirmed => '확인되지 않았습니다. 준비되면 다시 시도하세요.';

  @override
  String get appLockCannotConfirm =>
      '지금은 당신의 기기가 본인이 맞는지 확인하지 못합니다. 기기 설정에 화면 잠금이 아직 설정되어 있는지 확인하세요.';

  @override
  String get appLockWaiting => '기다리는 중…';

  @override
  String get appLockUnlock => '잠금 해제';

  @override
  String get appLockReasonUnlock => 'Action 잠금 해제';

  @override
  String get appLockReasonEnable => '앱 잠금을 켜기 전에 본인 확인';

  @override
  String get appLockReasonDisable => '앱 잠금을 끄기 전에 본인 확인';

  @override
  String get todayCapabilityHeading => 'Action이 다루는 것';

  @override
  String get todayCapabilityDocumentTitle => '편지나 청구서 한 장';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action이 그것을 읽고 기한과 금액과 접수 번호를 찾아냅니다.';

  @override
  String get todayCapabilityScreenshotTitle => '스크린샷 한 장';

  @override
  String get todayCapabilityScreenshotBlurb =>
      '그냥 두면 잊어버릴 메시지를, 행동에 옮길 수 있는 것으로 바꾸세요.';

  @override
  String get todayCapabilityTextTitle => '글 몇 줄';

  @override
  String get todayCapabilityTextBlurb =>
      '무엇이든 붙여넣으세요. Action이 그것이 무엇이고 당신에게 무엇을 요구하는지 알아냅니다.';

  @override
  String get todayCapabilityConfirmTitle => '모든 것을 당신이 확인합니다';

  @override
  String get todayCapabilityConfirmBlurb =>
      '당신이 근거를 보고 그렇다고 말하기 전에는 어느 것도 할 일이 되지 않습니다.';

  @override
  String get todayCapabilityExploreIntelligence => '인텔리전스 둘러보기';

  @override
  String get documentRejectedEmpty => '그 파일은 비어 있습니다.';

  @override
  String documentRejectedTooLarge(String size) {
    return '그 문서는 $size 크기로, Action이 다룰 수 있는 것보다 큽니다.';
  }

  @override
  String get documentRejectedNotAPdf =>
      '이름이 무엇이든 그것은 PDF가 아닙니다. Action은 PDF와 이미지를 읽습니다.';

  @override
  String get documentRejectedUnreadable => '그 문서를 읽지 못했습니다.';

  @override
  String get pdfRejectedNotAPdf => '이름이 무엇이든 그 파일은 PDF가 아닙니다.';

  @override
  String get pdfRejectedEncrypted => '그 PDF는 비밀번호로 잠겨 있어서 Action이 읽지 못합니다.';

  @override
  String get pdfRejectedDamaged => '그 PDF를 읽지 못했습니다. 파일이 온전하지 않을 수도 있습니다.';

  @override
  String get shareRejectedEmpty => '그 공유 안에는 읽을 것이 없었습니다.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action은 텍스트와 이미지와 PDF를 받을 수 있습니다. 그건 그 밖의 것이었습니다.';

  @override
  String get shareRejectedContentMismatch =>
      '그 파일은 스스로 밝힌 종류의 파일이 아니어서, Action은 그것을 열지 않았습니다.';

  @override
  String get shareRejectedTooLarge => '그 파일은 Action이 다루기에 너무 큽니다.';

  @override
  String get shareRejectedUnreadable => '그 파일을 읽지 못했습니다.';

  @override
  String get captureFailureRecognition => '문자 인식을 실행하지 못했습니다.';

  @override
  String get captureFailureImageFormat => '그 이미지 형식은 이 기기에서 읽지 못했습니다.';

  @override
  String get connectSheetTitle => '당신의 AI 연결하기';

  @override
  String get connectSheetSubtitle =>
      '당신 자신의 제공자 계정과 API 키를 씁니다. Action은 그 키를 이 기기의 보안 저장소에 보관합니다.';

  @override
  String get connectErrorKeyMissing => '계속하려면 API 키를 붙여넣으세요.';

  @override
  String get connectErrorModelMissing => '모델을 고르거나 모델 id를 입력하세요.';

  @override
  String get connectErrorEndpointMissing => '당신의 endpoint 주소를 입력하세요.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      '이 기기의 보안 저장소를 열지 못해서 키가 저장되지 않았습니다.';

  @override
  String get connectTestSucceeded => '연결되었습니다.';

  @override
  String connectTestSucceededWithModels(int count) {
    return '연결되었습니다. 모델 $count개를 쓸 수 있습니다.';
  }

  @override
  String get connectProviderLabel => '제공자';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'https:// 주소여야 합니다. Action은 암호화되지 않은 연결로 당신의 문서를 보내지 않습니다.';

  @override
  String get connectApiKeyLabel => 'API 키';

  @override
  String get connectApiKeyHint => '키를 붙여넣으세요';

  @override
  String get connectKeyPrivacyNote =>
      '당신의 키는 이 기기에 남습니다. Action은 당신이 고른 제공자 외에는 어디에도 그것을 보내지 않으며, 저장한 뒤에는 다시 보여 주지 못합니다.';

  @override
  String get connectModelLabel => '모델';

  @override
  String get connectModelIdHint => '모델 id';

  @override
  String get connectModelFreeTextNote =>
      '제공자는 모델 id를 없애기도 하고 새로 추가하기도 합니다. 원하는 것이 목록에 없으면 여기에 직접 입력하세요.';

  @override
  String get connectAndTest => '연결하고 테스트';

  @override
  String get connectSaveWithoutTesting => '테스트 없이 저장';

  @override
  String get toolWarningFactsNotChecked =>
      'Action이 이것을 원본 글과 대조하지 못했으므로, 여기 있는 금액과 날짜는 확인되지 않았습니다.';

  @override
  String get toolTitleRewrite => '글 다듬기';

  @override
  String get toolDescriptionRewrite =>
      '더 분명하게, 더 짧게, 또는 더 격식 있게 — 사실은 그대로 둔 채.';

  @override
  String get toolModeRewriteClearer => '더 분명하게';

  @override
  String get toolModeRewriteProfessional => '더 업무적으로';

  @override
  String get toolModeRewriteShorter => '더 짧게';

  @override
  String get toolModeRewritePersuasive => '더 설득력 있게';

  @override
  String get toolModeRewriteSimpler => '더 쉽게';

  @override
  String get toolModeRewriteStructured => '더 짜임새 있게';

  @override
  String get toolModeRewriteGrammarOnly => '문법만';

  @override
  String get toolSectionWhatChanged => '무엇이 바뀌었나';

  @override
  String get toolSectionNote => '참고';

  @override
  String get toolSectionAlreadyClearBody => '이 글은 이미 분명했습니다. 아래의 변경은 사소합니다.';

  @override
  String get toolSectionImprovedText => '다듬은 글';

  @override
  String get toolTitleDraftReply => '답장 초안 쓰기';

  @override
  String get toolDescriptionDraftReply => '당신이 직접 고쳐서 보내는 답장.';

  @override
  String get toolModeReplyProfessional => '정중하게';

  @override
  String get toolModeReplyConcise => '간결하게';

  @override
  String get toolModeReplyFriendly => '친근하게';

  @override
  String get toolModeReplyFormal => '격식 있게';

  @override
  String get toolModeReplyClarification => '설명 요청하기';

  @override
  String get toolModeReplyConfirmation => '수신 확인하기';

  @override
  String get toolModeReplyDispute => '반박하기';

  @override
  String get toolSectionSubject => '제목';

  @override
  String get toolSectionDraftReply => '답장 초안';

  @override
  String get toolSectionPlaceholders => '이건 당신이 채워야 합니다';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return '초안 — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      '이건 초안입니다. Action은 아무것도 보내지 않습니다 — 당신이 읽고, 고치고, 직접 보내세요.';

  @override
  String get toolTitleTranslate => '번역하기';

  @override
  String get toolDescriptionTranslate => '다른 언어로, 숫자와 이름은 그대로 둔 채.';

  @override
  String get toolSectionTranslation => '번역';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '$from에서 $to(으)로 번역';
  }

  @override
  String get toolSectionKeptInOriginal => '원문 그대로 둔 것';

  @override
  String get toolWarningTranslationNotCertified =>
      '이해를 돕기 위한 번역이며, 공증 번역이 아닙니다.';

  @override
  String get toolTitleStructuredData => '표 뽑아내기';

  @override
  String get toolDescriptionStructuredData => '복사해 쓸 수 있는 행과 항목과 숫자.';

  @override
  String get toolSectionTable => '표';

  @override
  String get toolSectionFields => '항목';

  @override
  String get toolSectionTableCsv => '표 (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      '이 표의 열 구성은 제대로 읽어내지 못했습니다. 쓰기 전에 행이 맞게 놓였는지 맞춰 보세요.';

  @override
  String get toolTitleDeadlineFinder => '기한 찾기';

  @override
  String get toolDescriptionDeadlineFinder =>
      '무엇을, 언제까지 해야 하고, 하지 않으면 어떻게 된다고 하는지.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기한 $count개',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => '기한이 된 것 없음';

  @override
  String get toolSectionNothingDueBody => 'Action은 이 자료에서 기한도 의무도 찾지 못했습니다.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      '당신이 고르기 전에는 아무것도 예약되지 않습니다. 알림이 저절로 설정되는 일은 결코 없습니다.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return '그러지 않으면: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return '필요한 것: $items';
  }

  @override
  String get moneyErrorEmpty => '금액이 입력되지 않았습니다';

  @override
  String get moneyErrorMalformed => '금액이 일반 숫자 형태가 아닙니다';

  @override
  String get moneyErrorNegative => '금액이 음수이며, 음수는 낼 수 있는 금액이 아닙니다';

  @override
  String get moneyErrorTooManyDecimals => '이 통화가 가지는 것보다 소수 자릿수가 많습니다';

  @override
  String get moneyErrorUnsupportedCurrency => '이 통화 코드는 저희가 아는 코드가 아닙니다';

  @override
  String get moneyErrorOutOfRange => '금액이 실제 금액이라고 보기 어려울 만큼 큽니다';

  @override
  String get escalationOcrFailed => '이 캡처에서는 문자 인식이 아예 실행되지 못했습니다.';

  @override
  String get escalationNoTextRecognised => '이것은 문서처럼 보이지만, 글자는 하나도 인식되지 않았습니다.';

  @override
  String get escalationThinText => '이 크기의 문서치고는 인식된 글이 너무나 적습니다.';

  @override
  String get escalationLowLineConfidence => '인식기가 여러 줄에서 신뢰도가 낮다고 보고했습니다.';

  @override
  String get escalationTableLikeLayout =>
      '배치가 표처럼 보이며, 이것을 한 줄씩 읽으면 어떤 값이 어느 행에 속하는지가 사라집니다.';

  @override
  String get escalationFragmentedLayout =>
      '글이 아주 작은 조각으로 여럿 나뉘어 돌아와서, 구조를 알 수 없습니다.';

  @override
  String get escalationMalformedText => '인식된 글의 상당 부분이 읽을 수 있는 단어나 숫자가 아닙니다.';

  @override
  String get escalationConflictingDates => '하나가 넘는 날짜가 기한으로 제시되어 있습니다.';

  @override
  String get escalationConflictingAmounts => '하나가 넘는 금액이 내야 할 금액으로 제시되어 있습니다.';

  @override
  String get escalationUnresolvedGrounding =>
      '일부 값은 문서의 글에서 어디서 나왔는지 찾지 못했습니다.';

  @override
  String get escalationInstructionLikeContent =>
      '이 문서에는 앱에 내리는 지시문처럼 쓰인 글이 들어 있습니다. 그것은 문서 내용으로 다루며, 결코 지시로 다루지 않습니다.';

  @override
  String get providerFailureNetwork =>
      'Action이 그 서비스에 연결하지 못했습니다. 연결 상태를 확인하세요.';

  @override
  String get providerFailureTimedOut => '그 서비스가 답하는 데 너무 오래 걸렸습니다.';

  @override
  String get providerFailureServiceUnavailable =>
      '그 서비스를 일시적으로 쓸 수 없습니다. 나중에 다시 시도하세요.';

  @override
  String get providerFailureUnauthorized => '이 앱은 지금 그 서비스를 쓸 권한이 없습니다.';

  @override
  String get providerFailureBlocked => '그 서비스가 이 문서의 처리를 거절했습니다.';

  @override
  String get providerFailureUnknown =>
      'Action이 이 문서를 읽지 못했습니다. 다시 시도하면 될 수도 있습니다.';

  @override
  String get reviewBlockerTitle => '이 할 일에 제목을 붙이세요.';

  @override
  String get reviewBlockerDate => '어느 날짜가 진짜 기한인지 고르거나, 비워 두기로 하세요.';

  @override
  String get reviewBlockerAmount => '어느 금액이 맞는지 고르거나, 비워 두기로 하세요.';

  @override
  String get reviewBlockerStepTitle => '남기기로 한 단계에는 제목이 필요합니다.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: '$page쪽',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return '$start~$end쪽';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '고쳐 쓴 글에 $values이(가) 더 이상 들어 있지 않습니다. 이걸 쓰기 전에 확인하세요.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '고쳐 쓴 글에 $values 외 $count개가 더 이상 들어 있지 않습니다. 이걸 쓰기 전에 확인하세요.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => '달성';

  @override
  String get goalNewSheetTitle => '무엇이 이루어지길 바라나요?';

  @override
  String get goalNewSheetSubtitle => '한 문장이면 충분합니다. 자세한 것은 나중에 더할 수 있습니다.';

  @override
  String get goalTitleHint => '더 내지 않고 자동차 보험 갱신하기.';

  @override
  String get goalCreateAction => '목표 만들기';

  @override
  String get goalTitleSheetTitle => '이루고 싶은 것';

  @override
  String get goalOutcomeSheetTitle => '끝났다는 건 어떤 모습인가';

  @override
  String get goalContextSheetTitle => '지금 어디까지 왔나';

  @override
  String get goalOutcomeHint => '차가 보험에 들어 있고 서류 제출도 끝나 있다.';

  @override
  String get goalContextHint => '견적을 두 개 받았고 갱신일은 18일이다.';

  @override
  String get goalWorkspaceTitle => '목표';

  @override
  String get goalUnmarkReached => '달성 표시 되돌리기';

  @override
  String get goalMarkReached => '달성으로 표시';

  @override
  String get goalNotFound => '그 목표는 더 이상 없습니다.';

  @override
  String get goalDeleteTitle => '이 목표를 삭제할까요?';

  @override
  String get goalDeleteBody =>
      '이 목표가 이 기기에서 삭제됩니다. 이 목표에서 만들어진 할 일은 지금 그대로 남습니다.';

  @override
  String get goalOutcomeLabel => '끝났다는 건 어떤 모습인가';

  @override
  String get goalOutcomeEmpty =>
      '아직 쓰지 않았습니다. 끝낸다는 것이 무엇인지 적어 두면 목표를 세우기가 더 쉬워집니다.';

  @override
  String get goalContextLabel => '지금 어디까지 왔나';

  @override
  String get goalContextEmpty =>
      '아직 아무것도 쓰지 않았습니다. 지금까지 무슨 일이 있었는지, 그리고 무엇이 막고 있는지.';

  @override
  String get goalTitleLabel => '이루고 싶은 것';

  @override
  String get goalEditTooltip => '목표 편집';

  @override
  String get goalToolsLabel => 'Action이 할 수 있는 일';

  @override
  String get goalToolsNotReady => '이루고 싶은 것을 조금 더 적으면, 이 도구들이 다룰 거리가 생깁니다.';

  @override
  String get toolGoalOptimizerTitle => '목표 다듬기';

  @override
  String get toolActionPlanTitle => '계획 세우기';

  @override
  String get resultFactUnconfirmed => '확인되지 않음';

  @override
  String get resultSuggestedSteps => '제안된 단계';

  @override
  String get resultSuggestedAction => '제안된 할 일';

  @override
  String get resultWorthAsking => '물어볼 만한 것';

  @override
  String get resultSuggestedDeadlines => '제안된 기한';

  @override
  String get resultSuggestions => '제안';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '뒷받침하는 인용 $count개',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => '선택한 원본에서';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => '문서를 준비하는 중';

  @override
  String get toolRunStageReading => '선택한 쪽을 읽는 중';

  @override
  String get toolRunStageAnalysing => '분석 중';

  @override
  String get toolRunStageBuilding => '검토할 내용을 구성하는 중';

  @override
  String get toolRunStageDone => '완료됨';

  @override
  String get toolRunStageFailed => '끝나지 않음';

  @override
  String get toolRunStageCancelled => '중지함';

  @override
  String get toolRunFailureLocalCheckFailed => '그건 확인하지 못했습니다.';

  @override
  String get toolRunFailureProviderRetired => '그 AI 제공자는 이 버전에 더 이상 없습니다.';

  @override
  String get toolRunFailureUnusableReply =>
      '그 응답은 쓸 수 있는 형태로 돌아오지 않았습니다. 다시 시도해 보세요.';

  @override
  String get toolRunFailureQuestionRequired => '먼저 질문을 입력하세요.';

  @override
  String get toolRunFailureInputRequired => '이 도구가 다룰 것을 고르세요.';

  @override
  String get toolWarningReplyTruncated => '이 응답은 중간에 끊겼으므로 내용이 불완전할 수 있습니다.';

  @override
  String get toolWarningNoSupportingQuotes =>
      '당신의 모델이 뒷받침하는 인용을 하나도 돌려주지 않았으므로, 여기 있는 어떤 것에도 근거가 없습니다. 이것을 근거로 움직이기 전에 문서와 맞춰 보세요.';

  @override
  String get aiSettingsRemoveTitle => '이 연결을 제거할까요?';

  @override
  String get aiSettingsRemoveBody =>
      'Action이 이 기기에서 당신의 API 키를 삭제하고 AI 기능 사용을 중단합니다. 당신의 제공자 계정에는 아무 영향이 없습니다.';

  @override
  String get aiSettingsProviderLabel => '제공자';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      '쓴 만큼의 요금은 당신의 제공자가 청구합니다. Action은 스스로 요청을 보내는 일이 결코 없습니다.';

  @override
  String get aiSettingsConnectLabel => 'AI 제공자 연결';

  @override
  String get aiSettingsConnectDescription =>
      'OpenAI, Anthropic, Google Gemini 또는 호환되는 endpoint에서 당신 자신의 계정과 API 키를 쓰세요.';

  @override
  String get aiSettingsModelLabel => '모델';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API 키';

  @override
  String get aiSettingsKeyStored => '이 기기의 보안 저장소에 보관됩니다.';

  @override
  String get aiSettingsKeyMissing => '이 기기에서 키를 찾지 못했습니다. 다시 연결해 하나 추가하세요.';

  @override
  String get aiSettingsTestLabel => '연결 테스트';

  @override
  String get aiSettingsProviderUnavailable => '그 제공자는 이 버전에 없습니다.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return '연결되었습니다. 모델 $count개를 쓸 수 있습니다.';
  }

  @override
  String get aiSettingsTestButton => '테스트';

  @override
  String get aiSettingsChangeProvider => '제공자 또는 모델 바꾸기';

  @override
  String get aiSettingsRemoveKey => '키 제거';

  @override
  String get aiSettingsSectionPrivacy => '개인정보';

  @override
  String get aiSettingsWhatGetsSentLabel => '전송되는 것';

  @override
  String get aiSettingsWhereItGoesLabel => '어디로 가는가';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      '제공자를 연결하기 전까지는 아무것도 전송되지 않습니다.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return '당신의 키로 $provider에 곧바로 갑니다. Action에 속한 어떤 서버도 거치지 않습니다.';
  }

  @override
  String get aiSettingsSectionData => '데이터';

  @override
  String get aiSettingsDataFootnote =>
      'Action은 당신이 어떤 도구를 썼는지는 기억하지만, 그 도구를 무엇에 썼는지는 결코 기억하지 않습니다.';

  @override
  String get aiSettingsRecentToolsLabel => '최근에 쓴 도구';

  @override
  String get aiSettingsRecentToolsNone => '없음';

  @override
  String get reminderNotificationTitle => 'Action 알림';

  @override
  String get reminderNotificationPrivateBody => '확인할 것이 있습니다.';

  @override
  String get reminderChannelName => 'Action 알림';

  @override
  String get reminderChannelDescription => '당신이 직접 할 일에 설정한 알림입니다.';

  @override
  String get onboardingStart => 'Action 시작하기';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return '$total단계 중 $current단계';
  }

  @override
  String get onboardingCaptureTitle => '정보를 할 일로 바꾸세요';

  @override
  String get onboardingCaptureBody =>
      '스크린샷, 사진, 또는 받은 글을 추가하세요. Action이 그것을 읽고 무엇을 하라는 것인지 알아냅니다.';

  @override
  String get onboardingReviewTitle => '당신이 확인하기 전에는 아무것도 저장되지 않습니다';

  @override
  String get onboardingReviewBody =>
      'Action은 무엇을 찾았고 그것이 어떤 단어에서 나왔는지 보여 줍니다. 틀린 것은 당신이 고칩니다. 당신이 확인하기 전까지 그것은 제안일 뿐, 사실도 아니고 할 일도 아닙니다.';

  @override
  String get onboardingTrackingTitle => '중요한 것을 계속 챙기세요';

  @override
  String get onboardingTrackingBody =>
      '확인이 필요함은 기한이 지났거나 가까운 것을 앞으로 끌어옵니다. 모든 할 일은 그 다음 단계와 진행 상황, 그리고 당신이 설정한 알림을 지니고 있습니다.';

  @override
  String get onboardingPrivacyBody => '시작하기 전에 알아 둘 것:';

  @override
  String get onboardingPrivacyOnDevice =>
      '당신의 할 일, 캡처, 알림, 검색은 이 기기에 저장됩니다. 검색과 알림은 연결 없이도 작동합니다.';

  @override
  String get onboardingPrivacySentToRead =>
      '무언가를 읽어 달라고 Action에 요청하면, 그 내용은 그것을 해석하는 AI 서비스로 전송됩니다.';

  @override
  String get onboardingPrivacyCloud =>
      '확인된 할 일의 짧은 기록 — 제목, 날짜, 금액, 제안된 단계 — 이 이 기기의 익명 식별자 아래 클라우드에 저장될 수 있습니다. 당신의 캡처와 단계와 알림은 저장되지 않습니다.';

  @override
  String get onboardingPrivacyNotBackup =>
      '그 기록은 백업이 아닙니다. 새 기기로 무엇도 복원할 수 없습니다.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '막는 것 $count개',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => '더 단순해질 수 있는 것';

  @override
  String get toolDescriptionGoalOptimizer =>
      '무엇이 빠졌는지, 무엇이 막고 있는지, 먼저 무엇을 해야 하는지.';

  @override
  String toolSectionStepDependsOn(String step) {
    return '$step 다음에';
  }

  @override
  String get toolSectionThePlan => '계획';

  @override
  String get toolDescriptionActionPlan => '할 일로 바꿀 수 있는, 순서가 정해진 단계 묶음.';

  @override
  String get toolTitleSmartChecklist => '체크리스트 만들기';

  @override
  String get toolDescriptionSmartChecklist => '이것이 당신에게 요구하는 것을, 순서대로.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '찾지 못한 항목 $count개',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => '이것들은 서로 어긋납니다';

  @override
  String get toolTitleMissingInformation => '무엇이 빠졌나';

  @override
  String get toolDescriptionMissingInformation =>
      '빠진 부분, 그리고 그에 대해 무엇을 물어야 하는지.';

  @override
  String get aiAdapterTimedOut => '그건 너무 오래 걸려서 중지했습니다.';

  @override
  String get aiAdapterSecureConnectionFailed => '당신의 AI 제공자로 가는 보안 연결에 실패했습니다.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action이 그 모델 또는 endpoint를 찾지 못했습니다.';

  @override
  String get aiAdapterRequestRejected => '당신의 AI 제공자가 그 요청을 거부했습니다.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action이 이 기기의 보안 저장소를 열지 못했습니다.';

  @override
  String get aiAdapterEndpointMissing => '설정에서 당신의 AI endpoint 주소를 추가하세요.';

  @override
  String get aiAdapterReplyIncomplete => '그 응답은 불완전했습니다. 다시 시도하세요.';

  @override
  String get aiAdapterContentDeclined => '당신의 제공자가 그 내용의 처리를 거절했습니다.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return '한 번에 $limit개가 넘는 파일입니다. 더 적게 고르세요.';
  }

  @override
  String get aiAdapterImageTooLarge => '그 이미지들 중 하나가 분석하기에 너무 큽니다.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '“$filename”은(는) 분석하기에 너무 큽니다. 제한은 $limit MB입니다.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '“$filename”은(는) $count쪽입니다. Action은 한 번에 $limit쪽까지 읽으므로, 범위를 고르세요.';
  }

  @override
  String get aiAdapterSelectionTooLarge => '그 선택은 한 번의 요청으로 보내기에 너무 큽니다.';

  @override
  String get toolRunNotAvailableTitle => '그 도구는 쓸 수 없습니다';

  @override
  String get toolRunNotAvailableMessage => '더 새로운 버전의 Action에서 없어졌을 수 있습니다.';

  @override
  String get toolRunNoSourcesYet => '아직 다룰 것이 없습니다. 무언가 캡처하거나, 아래에 글을 붙여넣으세요.';

  @override
  String get toolRunChooseSourcesToCompare => '무엇을 비교할지 고르기';

  @override
  String get toolRunChooseSource => '원본 고르기';

  @override
  String get toolRunQuestionLabel => '당신의 질문';

  @override
  String get toolRunQuestionHint => '기한이 언제인가요?';

  @override
  String get toolRunFreeTextLabel => '또는 글 붙여넣기';

  @override
  String get toolRunFreeTextHint => '여기에 붙여넣거나 입력하세요';

  @override
  String get toolRunModeLabel => '방식';

  @override
  String get toolRunRunLocally => '이 기기에서 확인하기';

  @override
  String get toolRunRun => '실행';

  @override
  String get toolRunStop => '중지';

  @override
  String get toolRunRunAgain => '다시 실행';

  @override
  String get toolRunWorkingOn => '작업 대상';

  @override
  String toolRunFirstUseTitle(String provider) {
    return '이것을 $provider(으)로 보낼까요?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return '당신이 선택한 내용이 당신의 API 키를 써서 처리를 위해 $provider(으)로 전송됩니다.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      '당신의 키는 이 기기에 남습니다. Action은 백그라운드에서 아무것도 전송하지 않으며, 당신의 다른 할 일이나 원본도 전송하지 않습니다.';

  @override
  String get toolRunScopeTitle => '실행하기 전에';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count쪽',
    );
    return '$_temp0이 당신의 $provider 연결을 통해 분석됩니다.';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '파일 $count개',
    );
    return '$_temp0가 당신의 $provider 연결을 통해 분석됩니다.';
  }

  @override
  String toolRunScopeText(String provider) {
    return '당신이 선택한 글이 당신의 $provider 연결로 전송됩니다.';
  }

  @override
  String get toolRunNeedsProviderTitle => '이 도구를 쓰려면 AI 제공자를 연결하세요';

  @override
  String get toolRunNeedsProviderBody => '당신 자신의 제공자 계정과 API 키를 씁니다.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '단계 $count개로 할 일을 만들었습니다.',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '단계 $count개를 추가했습니다.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '단계 $count개',
    );
    return '할 일 만들기 · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '단계 $count개',
    );
    return '이 할 일에 추가 · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => '사진';

  @override
  String get sourceTypeLabelScreenshot => '스크린샷';

  @override
  String get sourceTypeLabelPastedText => '붙여넣은 글';

  @override
  String get sourceTypeLabelDocument => '문서';

  @override
  String get toolModeClearer => '더 명확하게';

  @override
  String get toolModeMoreProfessional => '더 전문적으로';

  @override
  String get toolModeShorter => '더 짧게';

  @override
  String get toolModeSimpler => '더 쉽게';

  @override
  String get toolModeMoreStructured => '더 구조적으로';

  @override
  String get toolModeMorePersuasive => '더 설득력 있게';

  @override
  String get toolModeGrammarOnly => '문법만';

  @override
  String get toolModeProfessional => '전문적인 어조';

  @override
  String get toolModeConcise => '간결하게';

  @override
  String get toolModeFriendly => '친근한 어조';

  @override
  String get toolModeFormal => '격식 있는 어조';

  @override
  String get toolModeAskForClarification => '설명 요청하기';

  @override
  String get toolModeConfirm => '확인 회신';

  @override
  String get toolModeDispute => '이의 제기하기';

  @override
  String get toolModeQuick => '빠르게 훑기';

  @override
  String get toolModeDetailed => '자세하게';

  @override
  String get toolModeExecutive => '의사결정용';

  @override
  String get toolModeKeyPoints => '핵심 요점';

  @override
  String get toolModeActionFocused => '할 일 중심';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '인용된 내용 $count개를 당신이 선택한 자료에서 찾지 못했으므로, 불확실로 표시했습니다.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action이 이 인용들을 파일 자체와 대조하지 못했으므로, 이 인용들은 대조되지 않았습니다.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기한 초과 · $count일',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => '내일까지';

  @override
  String get triageBadgeReminderSoon => '곧 알림';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기한이 $count일 지났습니다',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title.';
  }

  @override
  String get triageExplanationDone => '이건 완료되었습니다.';

  @override
  String get triageExplanationNothingPressing => '이건 아직 급한 것이 하나도 없어서 여기 있습니다.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return '$reason 확인이 필요합니다.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return '$reason 더 아래쪽에 있습니다.';
  }

  @override
  String get triageReasonOverdue => '기한이 지나서';

  @override
  String get triageReasonDeadlinePassed => '기한 시각이 지나서';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기한이 $count일 지나서',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => '오늘이 기한이라서';

  @override
  String get triageReasonCriticalDueSoon => '당신이 매우 급함으로 표시했고 기한이 가까워서';

  @override
  String get triageReasonAllStepsDone => '모든 단계가 끝났고 마무리만 남아서';

  @override
  String get triageReasonDueTomorrow => '내일이 기한이라서';

  @override
  String get triageReasonReminderSoon => '하루 안에 올 알림을 당신이 설정해 두어서';

  @override
  String get triageReasonDueWithinThreeDays => '기한이 사흘 안이라서';

  @override
  String get triageReasonCriticalNoDeadline => '당신이 매우 급함으로 표시했고, 기한은 없어서';

  @override
  String get triageReasonDueWithinSevenDays => '기한이 일주일 안이라서';

  @override
  String get triageReasonImportant => '당신이 중요로 표시해서';

  @override
  String get triageReasonDueLater => '기한이 더 멀어서';

  @override
  String get triageReasonNoDeadline => '기한이 없고 급한 것도 없어서';

  @override
  String cardCompletedTooltip(String title) {
    return '완료됨: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => '이 문서 이해하기';

  @override
  String get toolDescriptionDocumentIntelligence =>
      '무엇인지, 무엇이 중요한지, 그리고 그에 대해 무엇을 해야 하는지.';

  @override
  String get toolSectionWhatThisIs => '이것이 무엇인가';

  @override
  String get toolSectionWhatMatters => '무엇이 중요한가';

  @override
  String get toolSectionKeyDetails => '핵심 항목';

  @override
  String get toolTitleAskDocument => '원본에 물어보기';

  @override
  String get toolDescriptionAskDocument =>
      '당신이 선택한 내용에 근거한 답 — 아니면 아무 답도 하지 않습니다.';

  @override
  String get toolSectionNoAnswer => '이 자료에서는 답을 찾지 못함';

  @override
  String get toolSectionNoAnswerBody => 'Action이 선택한 문서에서 그것을 찾지 못했습니다.';

  @override
  String get toolSectionAnswer => '답';

  @override
  String get toolSectionFromTheDocument => '문서에서';

  @override
  String get toolWarningQuoteNotFound =>
      '이 답변의 근거가 된 인용은 선택한 자료에 없습니다. 이 답변은 믿을 수 없는 것으로 다루세요.';

  @override
  String get toolTitleSmartSummary => '요약하기';

  @override
  String get toolDescriptionSmartSummary => '짧게 간추린 것 — 또는 당신이 해야 할 일을 바꾸는 부분.';

  @override
  String get toolSectionKeyPoints => '핵심 요점';

  @override
  String get toolTitleCompareDocuments => '문서 비교하기';

  @override
  String get toolDescriptionCompareDocuments =>
      '무엇이 달라졌는지, 무엇이 서로 어긋나는지, 무엇이 보이지 않는지.';

  @override
  String get toolSectionWhatDiffers => '다른 점';

  @override
  String get toolSectionConflicts => '서로 어긋나는 점';

  @override
  String get toolSectionOnlyInOne => '한 곳에만 있는 내용';

  @override
  String get toolSectionInCommon => '공통된 내용';

  @override
  String get sensitiveKindEmail => '이메일 주소';

  @override
  String get sensitiveKindPhone => '전화번호';

  @override
  String get sensitiveKindPaymentCard => '결제 카드 번호';

  @override
  String get sensitiveKindIban => '은행 계좌(IBAN)';

  @override
  String get sensitiveKindNationalId => '국가 신분증 번호';

  @override
  String get sensitiveKindPostcode => '우편번호';

  @override
  String get sensitiveKindAccountNumber => '계좌번호';

  @override
  String get sensitiveKindReference => '참조번호';

  @override
  String get sensitiveKindDateOfBirth => '생년월일';

  @override
  String get sensitiveKindUrl => '웹 주소';

  @override
  String get verdictVerifiedProvenance => '확인된 출처 정보가 있음';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      '이 파일은 서명을 지니고 있으며, 그 서명을 확인한 결과 문제없이 통과했습니다.';

  @override
  String get verdictSignalsSynthetic => 'AI로 생성한 내용과 들어맞는 신호';

  @override
  String get verdictSignalsSyntheticExplainer =>
      '이 파일은 생성 도구로 만들어졌다고 스스로 밝히고 있습니다. 메타데이터는 고치거나 지울 수 있으므로, 이것은 파일이 주장하는 내용일 뿐 증거가 아닙니다.';

  @override
  String get verdictSignalsEdited => '편집된 내용과 들어맞는 신호';

  @override
  String get verdictSignalsEditedExplainer =>
      '이 파일은 편집 소프트웨어를 거쳤다고 스스로 밝히고 있습니다. 사진에서는 흔한 일이며, 그것만으로 무언가를 꾸며냈다는 뜻은 아닙니다.';

  @override
  String get verdictNoReliableProvenance => '믿을 만한 출처 정보를 찾지 못함';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      '이 파일에는 출처 정보가 없습니다. 대부분의 서비스가 그것을 떼어내기 때문에 흔한 일이며, 무언가를 뜻하는 징후가 아닙니다.';

  @override
  String get verdictInconclusive => '단정할 수 없음';

  @override
  String get verdictInconclusiveExplainer =>
      '이것이 어디서 왔는지 말하기에는 여기 있는 정보가 충분하지 않습니다.';

  @override
  String get authenticitySignalCamera => '카메라';

  @override
  String get authenticitySignalSoftware => '소프트웨어';

  @override
  String get authenticitySignalDescription => '설명';

  @override
  String get authenticitySignalCopyright => '저작권';

  @override
  String get authenticitySignalLocation => '위치';

  @override
  String get authenticitySignalLocationValue => '이 파일에 위치 데이터가 들어 있습니다.';

  @override
  String get authenticitySignalContentCredentials =>
      'Content Credentials(콘텐츠 자격 증명)';

  @override
  String get authenticitySignalContentCredentialsValue =>
      '확인하지 않음 — 이 빌드에는 서명을 검증하는 기능이 없습니다.';

  @override
  String get authenticitySignalFile => '파일';

  @override
  String get authenticitySignalFileUnreadableValue => '이미지로 읽어 들이지 못했습니다.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      '알아볼 수 있는 이미지 형식이 아닙니다.';

  @override
  String get authenticitySignalText => '텍스트';

  @override
  String get authenticitySignalTextValue =>
      '글만으로는 AI가 쓰였는지 믿을 만하게 알아낼 수 없습니다. Action은 추측하지 않습니다.';

  @override
  String get fileTypePng => 'PNG 이미지';

  @override
  String get fileTypeJpeg => 'JPEG 이미지';

  @override
  String get fileTypeGif => 'GIF 이미지';

  @override
  String get fileTypeWebp => 'WebP 이미지';

  @override
  String get fileTypeWav => 'WAV 녹음 파일';

  @override
  String get fileTypePdf => 'PDF 문서';

  @override
  String get fileTypeHeic => 'HEIC 이미지';

  @override
  String get fileTypeVideo => '동영상 파일';

  @override
  String get fileTypeTiff => 'TIFF 이미지';

  @override
  String get fileTypeBitmap => '비트맵 이미지';

  @override
  String get fileTypeRtf => 'RTF 문서';

  @override
  String get fileTypeZip => 'Zip 압축 파일';

  @override
  String get fileTypeGzip => 'gzip 압축 파일';

  @override
  String get fileTypeSevenZip => '7-Zip 압축 파일';

  @override
  String get fileTypeRar => 'RAR 압축 파일';

  @override
  String get fileTypeWindowsProgram => 'Windows 프로그램';

  @override
  String get fileTypeLinuxProgram => 'Linux 프로그램';

  @override
  String get fileTypePostScript => 'PostScript 문서';

  @override
  String get fileTypeOgg => 'Ogg 녹음 파일';

  @override
  String get fileTypeMp3 => 'MP3 녹음 파일';

  @override
  String get fileTypePlainText => '일반 텍스트';

  @override
  String fileMismatchNote(String extension, String contents) {
    return '이 파일의 이름은 \".$extension\"이지만, 그 내용물은 $contents입니다. 단순한 실수일 수도 있고, 당신이 예상한 것과 다른 프로그램으로 파일이 열리게 되는 방식이기도 합니다.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count바이트',
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
  String get credentialKindPrivateKey => '개인 키';

  @override
  String get credentialKindApiKey => 'API 키';

  @override
  String get credentialKindConnectionString => '연결 문자열';

  @override
  String get credentialKindAccessToken => '액세스 토큰';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization 헤더';

  @override
  String get credentialKindPasswordOrKey => '비밀번호 또는 키';

  @override
  String get credentialKindPossibleSecret => '비밀 값일 수 있는 문자열';

  @override
  String get credentialAdvicePrivateKey =>
      '공유하기 전에 이것을 지우고, 키 쌍을 교체하세요. 개인 키는 한번 남의 눈에 들어오고 나면 다시는 안전해질 수 없습니다.';

  @override
  String get credentialAdviceProviderApiKey =>
      '이 키를 제공자 쪽에서 폐기하고 새 키를 발급하세요. 문서에서 지우는 것만으로는 그 키가 무효가 되지 않습니다.';

  @override
  String get credentialAdviceConnectionString =>
      '여기에는 비밀번호와, 그 비밀번호로 열리는 주소가 함께 들어 있습니다. 이것을 이미 공유했다면 비밀번호를 바꾸세요.';

  @override
  String get credentialAdviceJsonWebToken =>
      '이런 토큰은 만료되는 경우가 많지만, 항상 그런 것은 아닙니다. 언제 만료되는지 알고 있는 것이 아니라면 아직 살아 있는 것으로 다루세요.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      '헤더의 값을 지우세요. 붙여넣은 요청 로그는 살아 있는 토큰이 실수로 공유되는 가장 흔한 경로 가운데 하나입니다.';

  @override
  String get credentialAdviceKeyedAssignment =>
      '이것을 환경 변수나 비밀 저장소로 옮기고, 그 파일을 공유한 적이 있다면 값을 바꾸세요.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action은 이것이 무엇인지 알 수 없습니다. 공유하기 전에 확인해 보세요 — 식별자이거나 체크섬일 가능성도 똑같이 있습니다.';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API 키';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI 프로젝트 키';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI 형식의 API 키';

  @override
  String get credentialLabelGoogleApiKey => 'Google API 키';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth 토큰';

  @override
  String get credentialLabelGitHubToken => 'GitHub 토큰';

  @override
  String get credentialLabelSlackToken => 'Slack 토큰';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS 액세스 키 ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab 토큰';

  @override
  String get credentialLabelNpmToken => 'npm 토큰';

  @override
  String get credentialLabelPassphrase => '암호 구문';

  @override
  String get credentialLabelPassword => '비밀번호';

  @override
  String get credentialLabelRefreshToken => '리프레시 토큰';

  @override
  String get credentialLabelToken => '토큰';

  @override
  String get credentialLabelClientSecret => '클라이언트 시크릿';

  @override
  String get credentialLabelCredential => '자격 증명';

  @override
  String get credentialLabelSecret => '비밀 값';

  @override
  String get linkVerdictNoObviousSignals => '뚜렷한 신호 없음';

  @override
  String get linkVerdictWorthChecking => '확인해 볼 만함';

  @override
  String get linkVerdictTreatWithCaution => '주의해서 다룰 것';

  @override
  String get linkSummaryNoObviousSignals =>
      '이 링크가 적힌 방식에는 특이한 점이 없습니다. 그렇다고 이 페이지를 믿을 만하다고 아는 것과 같은 말은 아닙니다 — 이 링크를 당신이 예상했는지는 오직 당신만이 판단할 수 있습니다.';

  @override
  String get linkSummaryWorthChecking => '이 링크에는 열기 전에 한번 살펴볼 만한 점이 하나 있습니다.';

  @override
  String get linkSummaryTreatWithCaution =>
      '이 링크가 적힌 방식에는 열기 전에 확인해 볼 만한 점이 여럿 있습니다.';

  @override
  String get linkSignalNotHttps => '암호화되지 않음';

  @override
  String get linkSignalNonWebScheme => '웹 링크가 아님';

  @override
  String get linkSignalEmbeddedCredentials => '링크 안에 비밀번호';

  @override
  String get linkSignalMisleadingAuthority => '가려진 진짜 주소';

  @override
  String get linkSignalIpLiteralHost => '숫자로 된 주소';

  @override
  String get linkSignalPunycodeHost => '이름에 인코딩된 문자';

  @override
  String get linkSignalMixedScriptHost => '이름에 섞인 여러 문자 체계';

  @override
  String get linkSignalEncodedHost => '이름에 이스케이프된 문자';

  @override
  String get linkSignalUnusualPort => '흔치 않은 포트';

  @override
  String get linkSignalDeepSubdomain => '여러 부분으로 된 이름';

  @override
  String get linkSignalPublicSuffixInSubdomain => '엉뚱한 자리에 있는 익숙한 이름';

  @override
  String get linkSignalShortener => '단축 링크';

  @override
  String get linkSignalExecutableTarget => '프로그램을 내려받음';

  @override
  String get linkSignalRedirectParameter => '다른 곳으로 보낼 수 있음';

  @override
  String get linkSignalVeryLongUrl => '아주 긴 주소';

  @override
  String get linkSignalUnparseable => '읽어 낼 수 없는 링크';

  @override
  String get linkDetailNotHttps =>
      '이 링크는 http를 씁니다. 그래서 그 페이지에 당신이 입력하는 것은 전달되는 도중에 읽힐 수 있습니다.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return '이것은 웹 페이지가 아니라 \"$scheme:\"(으)로 열립니다. 다른 앱에 무언가를 시키는 것일 수 있습니다.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      '이 링크 안에 사용자 이름과 비밀번호가 적혀 있습니다. 이 링크가 공유되는 곳마다 그것들도 함께 갑니다.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return '브라우저는 \"@\" 앞에 있는 것을 전부 무시합니다. 실제로 가는 곳은 \"$host\"입니다.';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return '이것은 \"$host\"(으)로 갑니다 — 이름이 아니라 숫자로 된 주소입니다. 제대로 된 사이트는 거의 언제나 이름을 씁니다.';
  }

  @override
  String get linkDetailPunycodeHost =>
      '이 사이트 이름에는 로마자가 아닌 문자가 들어 있고, 인코딩된 형태로 저장되어 있습니다. 이것은 많은 언어에서 정상적인 일이며, 동시에 어떤 이름을 익숙한 이름처럼 보이게 만드는 방법이기도 합니다.';

  @override
  String get linkDetailMixedScriptHost =>
      '이 사이트 이름은 로마자와, 그것과 똑같아 보이는 다른 문자 체계의 글자를 섞어 쓰고 있습니다. 한 글자씩 짚어 가며 읽어 보세요.';

  @override
  String get linkDetailEncodedHost =>
      '이 사이트 이름에는 이스케이프 코드가 들어 있는데, 그것이 있을 자리가 아닙니다. 그런 코드는 이름이 실제로 무엇이라고 적혀 있는지를 가릴 수 있습니다.';

  @override
  String linkDetailUnusualPort(String port) {
    return '이것은 보통 쓰는 포트가 아니라 $port 포트로 연결합니다. 테스트 서버에서는 흔한 일이고, 공개된 사이트에서는 드문 일입니다.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '이 이름은 $count개의 부분으로 되어 있습니다. 누가 이 사이트를 운영하는지는 마지막 두 부분만이 정하고, 나머지는 무엇으로든 정할 수 있습니다.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return '이 이름의 가운데에 \".$suffix.\"이 들어 있어서, 앞부분이 사이트인 것처럼 보입니다. 실제 사이트는 \"$host\"입니다.';
  }

  @override
  String get linkDetailShortener =>
      '단축 서비스가 진짜 목적지를 가립니다. 열어 보지 않고서는 이것이 어디로 가는지 알 수 없습니다.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return '이 링크는 \"$fileExtension\"(으)로 끝나므로, 읽을 페이지가 아니라 당신의 기기에서 실행될 수 있는 것을 내려받습니다.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return '이 링크는 \"$parameter\" 설정에 또 다른 주소를 담고 있어서, 열면 \"$host\"이 아닌 다른 곳으로 데려갈 수 있습니다.';
  }

  @override
  String get linkDetailVeryLongUrl =>
      '긴 링크는 읽기가 더 어렵고, 목적지를 정하는 부분이 눈에 보이지 않는 곳까지 밀려날 수 있습니다.';

  @override
  String get linkDetailUnparseable =>
      'Action은 이것을 웹 주소로 읽어 내지 못했습니다. 링크처럼 보이지 않는 링크는 조심하세요.';

  @override
  String get toolTitleRedaction => '민감한 내용 가리기';

  @override
  String get toolDescriptionRedaction => '공유하면 안 되는 것을 찾아, 그것을 뺀 사본을 만듭니다.';

  @override
  String get toolSectionRedactionNothingToScan => '살펴볼 글이 없음';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      '이 도구는 글을 읽습니다. 메모나 붙여넣은 메시지, 또는 글을 이미 읽어 낸 캡처를 고르세요.';

  @override
  String get toolSectionRedactionNothingFound => '뚜렷한 것은 찾지 못함';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action은 이 글에서 이메일 주소, 전화번호, 카드 번호, 참조번호를 찾지 못했습니다.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '가릴 만한 것 $count개',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => '삭제 처리한 사본';

  @override
  String get toolWarningRedactionCoverage =>
      '이 도구는 이메일 주소, 전화번호, 계좌번호 같은 형태를 찾습니다. 민감한 것을 전부 잡아내지는 못합니다. 공유하기 전에 사본을 직접 읽어 보세요.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action은 이미지와 PDF 파일은 삭제 처리할 수 없습니다. 그림에서 무언가를 덮어도 원본은 그 아래에 그대로 남기 때문에, 이 기능은 제공하지 않습니다.';

  @override
  String get toolTitleAuthenticity => '이것이 어디서 왔는지 확인하기';

  @override
  String get toolDescriptionAuthenticity => '파일이 자신의 출처에 대해 스스로 밝히는 내용.';

  @override
  String get toolSectionAuthenticityNothingToInspect => '살펴볼 것이 없음';

  @override
  String get toolSectionAuthenticityNothingToInspectBody => '이미지나 텍스트를 선택하세요.';

  @override
  String get toolSectionAuthenticityFileSignals => '이 파일이 스스로에 대해 말하는 것';

  @override
  String get toolSectionAuthenticityFileItself => '파일 그 자체';

  @override
  String get toolSectionFileContents => '내용물';

  @override
  String get toolSectionFileUnknownFormat => 'Action이 아는 형식이 아님';

  @override
  String get toolSectionFileSize => '크기';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      '이 도구는 파일이 스스로에 대해 밝히는 내용을 그대로 전합니다. 메타데이터는 고치거나 지울 수 있으므로, 그중 어느 것도 증거가 되지 않습니다. 이것을 근거로 누군가를 탓하지 마세요.';

  @override
  String get toolTitleCredentialScanner => '키와 비밀번호 찾기';

  @override
  String get toolDescriptionCredentialScanner => '무언가를 공유하기 전에 자격 증명을 찾아내세요.';

  @override
  String get toolSectionCredentialNothingToCheck => '검사할 것이 없음';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      '텍스트를 붙여넣거나, 글을 이미 읽어 낸 캡처를 고르세요. 이 도구는 텍스트만 읽습니다.';

  @override
  String get toolSectionCredentialNoneFound => '자격 증명을 찾지 못함';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action은 이 텍스트에서 API 키, 개인 키, 토큰, 비밀번호처럼 생긴 것을 아무것도 찾지 못했습니다.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '찾은 자격 증명 $count개',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '비밀일 수도 있는 것 $count개',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy => '찾은 자격 증명을 지운 사본';

  @override
  String get toolWarningCredentialRevoke =>
      '문서에서 키를 지워도 그 키는 작동을 멈추지 않습니다. 이 중 하나라도 이미 공유했다면, 그 키를 발급한 제공자에서 폐기하고 새 키를 발급받으세요.';

  @override
  String get toolWarningCredentialCoverage =>
      '이 도구는 알아볼 수 있는 형태를 가진 자격 증명을 찾습니다. 문장 안에 풀어 쓴 비밀번호는 찾아내지 못합니다. 그러니 텍스트도 직접 읽어 보세요.';

  @override
  String get toolTitleLinkInspector => '링크 살펴보기';

  @override
  String get toolDescriptionLinkInspector => '열어 보기 전에 주소가 드러내는 것.';

  @override
  String get toolSectionLinkNoneFound => '링크를 찾지 못함';

  @override
  String get toolSectionLinkNoneFoundBody => '링크를 붙여넣거나, 링크가 들어 있는 캡처를 고르세요.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이 텍스트 속 링크 $count개',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => '읽어 내지 못함';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary — $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual => '이 주소들이 적힌 방식에서 특이한 점 없음';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      '그것은 그 페이지들을 믿을 만하다고 아는 것과는 다릅니다. 이 링크들을 당신이 예상하고 있었는지는 당신만 판단할 수 있습니다.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action은 주소만 읽습니다. 링크를 열지 않고, 사이트를 조회하지 않으며, 어떤 평판 서비스에도 물어보지 않습니다 — 그렇게 하면 당신이 무엇을 보는지가 다른 곳으로 전송되기 때문입니다.';

  @override
  String get toolWarningLinkNoSignals =>
      '눈에 띄는 신호가 없는 링크도 해로울 수 있습니다. 이 도구는 주소가 적힌 방식에서 문제를 찾을 뿐이며, 그것은 그 주소가 어디로 데려가는지에 대해 알아야 할 전부가 아닙니다.';

  @override
  String get toolSectionObjective => '당신이 원하는 것';

  @override
  String get toolSectionCurrentState => '목표의 현재 상황';

  @override
  String get toolSectionRecommendedNextStep => '권하는 다음 단계';

  @override
  String get toolSectionCredentialAdvice => '무엇을 해야 하나';

  @override
  String get toolSectionSummary => '요약';

  @override
  String get toolDetailSeparator => ' · ';
}
