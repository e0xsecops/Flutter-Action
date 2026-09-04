// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppL10nZh extends AppL10n {
  AppL10nZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDone => '完成';

  @override
  String get commonSave => '保存';

  @override
  String get commonClose => '关闭';

  @override
  String get commonBack => '返回';

  @override
  String get commonRetry => '重试';

  @override
  String get commonDelete => '删除';

  @override
  String get commonRemove => '移出';

  @override
  String get commonContinue => '继续';

  @override
  String get commonOpen => '打开';

  @override
  String get commonCopy => '复制';

  @override
  String get commonCopied => '已复制';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonAdd => '添加';

  @override
  String get commonOn => '开';

  @override
  String get commonOff => '关';

  @override
  String get commonUnknown => '未知';

  @override
  String get commonChecking => '正在检查…';

  @override
  String get commonSettings => '设置';

  @override
  String get commonDismiss => '忽略';

  @override
  String get commonUndo => '撤销';

  @override
  String get commonSkip => '跳过';

  @override
  String get commonNotNow => '以后再说';

  @override
  String get commonSomethingWentWrong => '出了点问题。';

  @override
  String get navToday => '今天';

  @override
  String get navLibrary => '资料库';

  @override
  String get navIntelligence => '智能';

  @override
  String get navSearch => '搜索';

  @override
  String get navCapture => '采集内容';

  @override
  String get todayGreetingMorning => '早上好';

  @override
  String get todayGreetingAfternoon => '下午好';

  @override
  String get todayGreetingEvening => '晚上好';

  @override
  String get todayDateFormat => 'M月d日 · EEEE';

  @override
  String get todayActionsLoadFailed => '无法载入你的待办。它们仍然保存在这台设备上。';

  @override
  String get todaySectionNeedsAttention => '需要处理';

  @override
  String get todaySectionAlsoNeedsAttention => '这些也需要处理';

  @override
  String get todaySectionWaitingForReview => '等待核对';

  @override
  String get todaySectionComingUp => '即将到来';

  @override
  String todaySeeAllCaptures(int count) {
    return '查看全部 $count 项采集';
  }

  @override
  String get todaySeeAllInLibrary => '在资料库中查看全部';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已完成 $count 项',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已完成 $count 项待办。打开资料库。',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => '从这里开始';

  @override
  String get todayQuickPhoto => '照片';

  @override
  String get todayQuickScreenshot => '截屏';

  @override
  String get todayQuickText => '文本';

  @override
  String get todayQuickTools => '查看一个链接，或在文本中找出密钥';

  @override
  String get briefBadgeNeedsYou => '需要你';

  @override
  String get briefBadgeToReview => '待核对';

  @override
  String get briefBadgeAhead => '在前面';

  @override
  String get briefBadgeStartHere => '从这里开始';

  @override
  String get briefBadgeClear => '已清空';

  @override
  String get briefNext => '下一步';

  @override
  String briefOpenAction(String title) {
    return '打开 $title';
  }

  @override
  String briefMarkDone(String title) {
    return '将“$title”标记为完成';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项待办需要你处理',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '还有 $count 项采集等待核对。',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项采集在等你',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => '没有逾期的事。';

  @override
  String get briefHeadlineNothingToday => '今天没有需要你处理的事';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 项待办即将到来。',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => '你这边都清空了';

  @override
  String get briefDetailClear => '没有到期的，也没有等待的。';

  @override
  String get briefHeadlineFirstRun => '从任何东西开始';

  @override
  String get briefDetailFirstRun => '一封信、一张截屏、一条便签 —— Action 会判断出它是什么。';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsSectionPersonalise => '个性化';

  @override
  String get settingsAppearance => '外观';

  @override
  String get settingsAppearanceDescription => '浅色、深色，或跟随设备。';

  @override
  String get settingsLanguageDescription => 'Action 与你对话所用的语言。';

  @override
  String get appearanceSystem => '跟随系统';

  @override
  String get appearanceLight => '浅色';

  @override
  String get appearanceDark => '深色';

  @override
  String get appearanceSystemDescription => '跟随设备设置';

  @override
  String get appearanceLightDescription => '始终浅色';

  @override
  String get appearanceDarkDescription => '始终深色';

  @override
  String get languageTitle => '语言';

  @override
  String get languageSubtitle => '更改立即生效。不会发送到任何地方；选择保存在这台设备上。';

  @override
  String get languageSectionChoose => '选择语言';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get languageSystemDescription => '跟随设备语言';

  @override
  String get languageDraftNote =>
      'Action 的文案原本是用英文写的。其余译文按照固定术语表起草，并经过自动检查，但尚未由母语者通读。凡是措辞的准确性要紧的地方 —— 隐私、安全，以及 Action 声称什么、不声称什么 —— 英文仍是基准。';

  @override
  String get ocrScriptTitle => '文字识别';

  @override
  String get ocrScriptSubtitle =>
      'Action 看照片时读取的书写系统。识别在本机进行；不会为了读取而把任何采集发送到任何地方。';

  @override
  String get ocrScriptSectionChoose => '书写系统';

  @override
  String get ocrScriptFollowLanguage => '跟随应用语言';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return '当前为$script';
  }

  @override
  String get ocrScriptLatin => '拉丁字母';

  @override
  String get ocrScriptChinese => '中文';

  @override
  String get ocrScriptDevanagari => '天城文';

  @override
  String get ocrScriptJapanese => '日文';

  @override
  String get ocrScriptKorean => '韩文';

  @override
  String get ocrScriptLatinDescription => '英语、西班牙语、法语、德语，以及其他用拉丁字母书写的语言。';

  @override
  String get ocrScriptChineseDescription => '简体中文和繁体中文。';

  @override
  String get ocrScriptDevanagariDescription =>
      '印地语、马拉地语和尼泊尔语。不含孟加拉语、泰米尔语或泰卢固语——它们各自是不同的书写系统。';

  @override
  String get ocrScriptJapaneseDescription => '日文。';

  @override
  String get ocrScriptKoreanDescription => '韩文。';

  @override
  String get ocrScriptFootnote =>
      '除拉丁字母外的每一项也都能读拉丁字母，所以选择一项是增加一种书写系统，而不是换掉一种。此改动对从现在起拍的照片生效，对已经读过的照片不生效。';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action 读不了$language文字';
  }

  @override
  String get ocrScriptUnreadableBody =>
      '本机没有对应的识别模型。照片中凡是用拉丁字母写的内容仍会被读取，其余部分会是空的。你可以改为自己输入或粘贴那段文字。';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action 目前设为读取$script。如果这张照片是另一种书写系统，请在设置中更改后重新读取。';
  }

  @override
  String get settingsTextRecognition => '文字识别';

  @override
  String get settingsTextRecognitionDescription => 'Action 从照片中读取的书写系统。';

  @override
  String get settingsIntelligenceFootnote =>
      '没有 AI，Action 一样能用。接入你自己的服务商后，会增加文档分析、规划和起草工具。';

  @override
  String get settingsAiProvider => 'AI 服务商';

  @override
  String get settingsAiNotConnected => '未接入。使用你自己的账号和 API 密钥。';

  @override
  String settingsAiConnected(String provider) {
    return '已接入 $provider。';
  }

  @override
  String get settingsSectionPrivacySecurity => '隐私与安全';

  @override
  String get settingsSecurity => '安全';

  @override
  String get settingsWhereInfoLives => '你的信息存放在哪里';

  @override
  String get settingsWhereInfoLivesDescription => '什么留在这台设备上，什么不留。';

  @override
  String get protectionAppLock => '应用锁';

  @override
  String get protectionScreenPrivacy => '屏幕隐私';

  @override
  String get protectionPrivateReminders => '隐藏内容的提醒';

  @override
  String get protectionSummaryNone => '应用锁、屏幕隐私，以及什么会离开这台设备。';

  @override
  String protectionSummaryOne(String first) {
    return '$first 已开启。';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first 和 $second 已开启。';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first、$second 和 $third 已开启。';
  }

  @override
  String get settingsSectionReminders => '提醒';

  @override
  String get settingsRemindersFootnote =>
      '视电池设置和设备使用情况，Android 可能比你设定的时间稍晚送达提醒。';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsNotificationsOnDescription => '你设置的提醒可以显示。';

  @override
  String get settingsNotificationsOffDescription => '已为 Action 关闭，因此提醒不会出现。';

  @override
  String get settingsNotificationsUnknown => '无法检查。';

  @override
  String get settingsNotificationsAllowed => '已允许';

  @override
  String get settingsOpenSystemSettings => '打开设置';

  @override
  String get settingsActionFootnote => 'Action 把杂乱的信息变成清楚的下一步。保存之前，一切都由你确认。';

  @override
  String get settingsHelp => '帮助';

  @override
  String get settingsHelpDescription => 'Action 如何工作，以及它不会做什么。';

  @override
  String get settingsVersion => '版本';

  @override
  String get dateShortFormat => 'M月d日';

  @override
  String get dateLongFormat => 'yyyy年M月d日';

  @override
  String get relativeJustNow => '刚刚';

  @override
  String relativeMinutes(int count) {
    return '$count 分钟前';
  }

  @override
  String relativeHours(int count) {
    return '$count 小时前';
  }

  @override
  String get relativeYesterday => '昨天';

  @override
  String relativeDays(int count) {
    return '$count 天前';
  }

  @override
  String get libraryTitle => '资料库';

  @override
  String get librarySubtitle => 'Action 为你保管的一切。而这些全都留在这台设备上。';

  @override
  String get librarySegmentActions => '待办';

  @override
  String get librarySegmentCaptures => '采集';

  @override
  String get librarySegmentGoals => '目标';

  @override
  String get librarySegmentDone => '已完成';

  @override
  String get libraryNewGoal => '新建目标';

  @override
  String get libraryNoGoalsTitle => '还没有目标';

  @override
  String get libraryNoGoalsMessage => '目标是你希望发生的事。Action 能找出缺了什么、卡在哪里，以及先做什么。';

  @override
  String get libraryNoDoneTitle => '还没有完成的事';

  @override
  String get libraryNoDoneMessage => '你完成的待办会保存在这里。';

  @override
  String get libraryNoOpenTitle => '没有未完成的待办';

  @override
  String get libraryNoOpenMessage => '采集点什么，Action 会判断出需要做什么。';

  @override
  String get libraryNoCapturesTitle => '还没有采集任何东西';

  @override
  String get libraryNoCapturesMessage => '你添加的照片、截屏和文字会先落在这里。在你开口之前，什么都不会被分析。';

  @override
  String get libraryGoalNoActions => '还没有从中产生什么';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '来自这个目标的 $count 项待办',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => '搜索待办和采集';

  @override
  String get searchClear => '清除';

  @override
  String get searchPrivacyNote => '在这台设备上搜索。你在这里输入的内容不会离开设备。';

  @override
  String get searchYouCanSearch => '你可以搜索';

  @override
  String get searchFieldTitles => '标题';

  @override
  String get searchFieldTitlesExample => '续保车险';

  @override
  String get searchFieldReferences => '参考编号';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => '机构';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => '待办里的步骤';

  @override
  String get searchFieldStepsExample => '上传表格';

  @override
  String get searchFieldCaptureText => '从采集中读出的文字';

  @override
  String get searchFieldCaptureTextExample => '续期通知';

  @override
  String searchNoMatchesTitle(String query) {
    return '没有与“$query”匹配的结果';
  }

  @override
  String get searchNoMatchesTryFewer => '试试少用几个词，或按原样输入参考编号。';

  @override
  String get searchNoMatchesClearFilters => '试试少用几个词，或清除筛选。';

  @override
  String get searchFilterActive => '进行中';

  @override
  String get searchFilterCompleted => '已完成';

  @override
  String get searchFilterOverdue => '已逾期';

  @override
  String get searchFilterThisWeek => '本周';

  @override
  String get searchFilterCritical => '紧要';

  @override
  String get searchFilterCreatedByYou => '你创建的';

  @override
  String get searchFilterArchived => '已归档';

  @override
  String get searchFilterClear => '清除筛选';

  @override
  String get searchIncompleteActions => '无法搜索你的待办，因此这些结果可能不完整。';

  @override
  String get searchIncompleteCaptures => '无法搜索你的采集，因此这些结果可能不完整。';

  @override
  String get searchIncompleteBoth => '待办和采集都无法搜索，因此这些结果可能不完整。';

  @override
  String get searchMatchTitle => '标题';

  @override
  String get searchMatchNextStep => '下一步';

  @override
  String get searchMatchStep => '步骤';

  @override
  String get searchMatchSummary => '摘要';

  @override
  String get searchMatchFromCapture => '来自采集';

  @override
  String get studioSuggested => '为你最近一次采集推荐';

  @override
  String get studioRecentlyUsed => '最近用过';

  @override
  String get studioReady => '已就绪';

  @override
  String get studioNotConnected => '未接入';

  @override
  String get studioHeroTitle => 'Action 智能';

  @override
  String get studioConnectedBlurb => '读懂一份文件、打磨一个目标、搭一个计划、起草一封回复，或核对眼前的东西。';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count 个用于读懂文件、规划和写作的工具。接入你自己的 AI 账号即可使用 —— 向你收费的是你的服务商，从来不是 Action。';
  }

  @override
  String get studioConnectAi => '接入 AI';

  @override
  String get studioHowItWorks => '工作方式';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '其中 $count 个现在就能用，不需要这些，完全在这台设备上运行。',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => '在这台设备上运行';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title。$description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title。$description 在这台设备上运行。';
  }

  @override
  String get categoryUnderstand => '读懂';

  @override
  String get categoryUnderstandBlurb => '弄明白手上的东西。';

  @override
  String get categoryPlan => '规划';

  @override
  String get categoryPlanBlurb => '把它变成能动手做的事。';

  @override
  String get categoryCreate => '写作';

  @override
  String get categoryCreateBlurb => '写出来、改好、译过去。';

  @override
  String get categoryExtract => '提取';

  @override
  String get categoryExtractBlurb => '把要紧的信息挑出来。';

  @override
  String get categoryVerify => '核对';

  @override
  String get categoryVerifyBlurb => '核对眼前的东西。';

  @override
  String get captureSheetTitle => '采集内容';

  @override
  String get captureSheetSubtitle => '你不想通篇读的东西，交给 Action。';

  @override
  String get captureTakePhoto => '拍一张照片';

  @override
  String get captureTakePhotoSubtitle => '眼前的信件、账单或通知';

  @override
  String get captureChooseImage => '选一张图片';

  @override
  String get captureChooseImageSubtitle => '这台设备上已有的截屏或照片';

  @override
  String get capturePasteText => '粘贴文字';

  @override
  String get capturePasteTextSubtitle => '一封邮件、一条消息或一份通知';

  @override
  String get captureChoosePdf => '选一个 PDF';

  @override
  String get captureChoosePdfSubtitle => '你手上已有的对账单、信件或表格';

  @override
  String get captureFootnote => '采集的内容留在这台设备上。在你开口之前，不会有任何联网分析。';

  @override
  String get captureCouldNotOpen => '打不开那个。换个方式试试。';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title。$subtitle';
  }

  @override
  String get stageReading => '读取中';

  @override
  String get stageNeedsReview => '需核对';

  @override
  String get stageActionCreated => '已创建待办';

  @override
  String get stageNoText => '未找到文字';

  @override
  String get stageCouldNotBeRead => '无法读取';

  @override
  String get stageReadingPreview => '正在读取文字…';

  @override
  String get stageFailedPreview => '这个在本设备上无法读取。';

  @override
  String get provenancePhoto => '从照片采集';

  @override
  String get provenanceImage => '从图片采集';

  @override
  String get provenancePastedText => '从粘贴的文字采集';

  @override
  String get provenanceDocument => '作为文件添加';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return '完成于 $when';
  }

  @override
  String metaOverdue(String date) {
    return '已逾期 · 原定 $date';
  }

  @override
  String get metaDueToday => '今天到期';

  @override
  String metaDueOn(String date) {
    return '$date 到期';
  }

  @override
  String get metaCreatedByYou => '你创建的';

  @override
  String get categoryPayment => '付款';

  @override
  String get categoryRenewal => '续期';

  @override
  String get categoryAppointment => '预约';

  @override
  String get categoryBooking => '订位';

  @override
  String get categoryTravel => '出行';

  @override
  String get categoryDeadline => '截止日期';

  @override
  String get categoryResponse => '需要回复';

  @override
  String get categoryDelivery => '配送';

  @override
  String get categoryDocument => '文件';

  @override
  String get categoryNoActionRequired => '无需处理';

  @override
  String get categoryUnsure => '不确定';

  @override
  String get errorEnterManually => '手动输入';

  @override
  String get sourceWhatWeRead => '我们读到的内容';

  @override
  String get sourceDelete => '删除采集';

  @override
  String get sourceGone => '那项采集已经不在了。';

  @override
  String get sourceDeleteTitle => '删除这项采集？';

  @override
  String get sourceDeleteBody => '图片以及从中读出的文字会从本机移除。';

  @override
  String get sourceDeleteKeep => '保留';

  @override
  String get sourceOpenAction => '打开待办';

  @override
  String sourceOpenActions(int count) {
    return '打开 $count 项待办';
  }

  @override
  String get sourceCreateAnother => '再据此创建一项';

  @override
  String get sourceCreateAction => '据此创建一项待办';

  @override
  String get sourceDoMore => '用它做更多事';

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
    return '来自 $format $size KB';
  }

  @override
  String get sourceTextFound => '找到文字';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines 行 · $ms ms';
  }

  @override
  String get sourceReadExplainer => '这是 Action 读到的文字。据此做出的东西在下面。';

  @override
  String get sourceNotInterpreted =>
      '目前还没有做任何解读。Action 会建议拿它做什么，在任何东西被创建之前由你确认。';

  @override
  String get sourceNoTextExplainer => '手写字、光线极暗，或本机还读不了的书写系统，都可能出现这种情况。';

  @override
  String get sourceReadFailed => '这个读不出来';

  @override
  String get sourceReadFailedReason => '文字识别没有走完。';

  @override
  String get sourceTryReadingAgain => '再读一次';

  @override
  String get sourceTypeInstead => '改为自己输入内容';

  @override
  String get sourceTypeWhatItSays => '把上面写的内容打出来';

  @override
  String get sourceTypeHint => '日期、金额，以及要求做什么。';

  @override
  String get sourceMadeFromThis => '由这项采集做出的';

  @override
  String sourceMadeFromThisCount(int count) {
    return '由这项采集做出 $count 项';
  }

  @override
  String get sourceTheDocument => '文档';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 页',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => '页数未知';

  @override
  String get sourceDocumentNotRead =>
      'Action 没有读过这份文档里面的内容。当你运行需要读它的工具时，文件会送到你连接的 AI 提供方，并且会在发送前告知你。';

  @override
  String get previewSaveFailed => '没能保存。请再试一次。';

  @override
  String get previewTitle => '核对采集';

  @override
  String get previewImageFailed => '那张图片打不开。';

  @override
  String get previewHint => '确认文字清晰可读，重要部分没有被截掉。';

  @override
  String get previewRetake => '重拍';

  @override
  String get pasteTitle => '粘贴文字';

  @override
  String get pasteHint => '把你不想通篇读的邮件、消息或通知粘贴进来。';

  @override
  String get pasteFootnote => '含有日期、金额或某项请求的内容效果最好。';

  @override
  String get pasteEnough => '看起来够用了。';

  @override
  String get pasteMore => '再多一点文字，结果会更好。';

  @override
  String get reviewLoadFailed => '这项采集加载不出来。';

  @override
  String get reviewConfirmed => '已确认';

  @override
  String get reviewNeedsReview => '需要核对';

  @override
  String get reviewReview => '核对';

  @override
  String get reviewHighConfidence => '把握较大';

  @override
  String get reviewConfirmedByYou => '由你确认';

  @override
  String get reviewMissing => '缺失';

  @override
  String get reviewNotUnderstood => 'Action 没能可靠地看懂这份来源里足够多的内容。';

  @override
  String get reviewNotUnderstoodBody => '采集完好无损，什么都没丢。你可以自己填写内容，来源也会继续附着以供对照。';

  @override
  String get reviewEnterDetails => '填写内容';

  @override
  String get reviewKeepSource => '把来源留着以后看';

  @override
  String reviewEngine(String engine) {
    return '引擎：$engine';
  }

  @override
  String get reviewManualNotice => '这项待办是你自己创建的。只会用到你在这里填的内容。';

  @override
  String get reviewUntitled => '未命名的待办';

  @override
  String get reviewEditTitle => '编辑标题';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '确认之前，有 $count 项数值需要你核对。',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => '关键信息';

  @override
  String get reviewNotFound => '没找到';

  @override
  String get reviewSuggestedNextStep => '建议的下一步';

  @override
  String get reviewWhyThisMatters => '为什么这件事要紧';

  @override
  String get reviewSteps => '步骤';

  @override
  String get reviewAddStep => '添加步骤';

  @override
  String get reviewInjectionNotice => '这份来源里有些文字看起来像指令而不是文档信息，所以 Action 没有采用。';

  @override
  String get reviewLayoutNotice =>
      '这份文档的版式里可能有一些对应关系，文字提取没能完整保留。确认之前请把下面的数值和来源比对一下。';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason 请把下面的数值和来源比对一下。';
  }

  @override
  String get reviewDeadline => '期限';

  @override
  String get reviewAmount => '金额';

  @override
  String get reviewLeftUnset => '没有——你选择了留空';

  @override
  String get reviewUnclear => '不清楚';

  @override
  String get reviewNotSet => '未设定';

  @override
  String get reviewNoDeadlineFound => '这份文档里没找到';

  @override
  String get reviewNoAmountFound => '这份文档里没找到金额';

  @override
  String get reviewMultipleDates => 'Action 找到了多个可能的日期。';

  @override
  String reviewMultipleDatesBody(int count) {
    return '有 $count 个日期可能是期限。选出正确的，输入另一个，或者留空。';
  }

  @override
  String get reviewChooseDate => '选一个日期';

  @override
  String get reviewMultipleAmounts => 'Action 找到了不止一个可能的金额。';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '有 $count 个金额可能是这里说的那个。选一个，输入另一个，或者留空。';
  }

  @override
  String get reviewChooseAmount => '选一个金额';

  @override
  String get reviewSkipStep => '跳过这一步';

  @override
  String get reviewKeepStep => '保留这一步';

  @override
  String get reviewEditStep => '编辑步骤';

  @override
  String get reviewCreateManually => '自己创建';

  @override
  String get reviewConfirmAndCreate => '确认并创建待办';

  @override
  String get reviewFixHighlighted => '核对标出的字段';

  @override
  String get reviewSaving => '正在保存…';

  @override
  String get reviewSaveFailed => '这项待办没能保存。什么都没丢——请再试一次。';

  @override
  String get reviewFieldTitle => '标题';

  @override
  String get reviewTitleHint => '需要做成什么？';

  @override
  String get reviewNewStep => '新步骤';

  @override
  String get reviewStepHint => '要做什么';

  @override
  String get reviewDatesConflict => '文档里提到了不止一个日期。';

  @override
  String get reviewAmountsConflict => '文档里提到了不止一个金额。';

  @override
  String get reviewAnotherDate => '另一个日期 — 2026-08-30';

  @override
  String get reviewBadDate => '这不是一个真实日期。请用 2026-08-30 的格式。';

  @override
  String get reviewTypeDate => '输入一个日期，或者在下面留空。';

  @override
  String get reviewUseThisDate => '用这个日期';

  @override
  String get reviewLeaveNoDeadline => '不设期限继续';

  @override
  String get reviewAnotherAmount => '另一个金额 — 780.00';

  @override
  String reviewAmountError(String reason) {
    return '这个金额用不了：$reason。';
  }

  @override
  String get reviewUseThisAmount => '用这个金额';

  @override
  String get reviewLeaveNoAmount => '不设金额继续';

  @override
  String get reviewThisValue => '这个数值';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => '在采集上查看';

  @override
  String get reviewViewSource => '查看来源';

  @override
  String get reviewFromSource => '来自来源';

  @override
  String get reviewNotVerified => '未比对';

  @override
  String get reviewCouldNotVerify => '没能把这个和来源比对上。';

  @override
  String get reviewLooksRight => '看着没问题';

  @override
  String get reviewStageReading => '正在读取来源';

  @override
  String get reviewStageUnderstanding => '正在理解重要信息';

  @override
  String get reviewStageChecking => '正在检查哪些需要核对';

  @override
  String get reviewNothingToDo => '眼下你不需要做什么。';

  @override
  String get reviewInformationOnly => '这看起来只是告知——没有找到期限、付款或要求回复。';

  @override
  String get reviewInformationOnlyWithSource =>
      '这看起来只是告知——这项采集里没有找到期限、付款或要求回复。';

  @override
  String get reviewSourceKept => '无论如何来源都会留着。';

  @override
  String get reviewAddAnyway => '仍然添加一项待办';

  @override
  String get reviewActionConfirmed => '待办已确认';

  @override
  String get reviewCreatedByYou => '由你创建。';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '根据 $count 条已核对的信息，由你确认。',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '根据 $count 条已核对的信息，由你确认。其中 $edited 条是你改过的。',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => '已保存在本机。';

  @override
  String get detailLoadFailed => '这项待办加载不出来。它仍然保存在本机。';

  @override
  String get detailNotFoundTitle => '那项待办已经不在了';

  @override
  String get detailNotFoundMessage => '可能已在本机删除。';

  @override
  String get detailGoBack => '返回';

  @override
  String get detailMore => '更多';

  @override
  String get detailChangeUrgency => '更改紧急程度';

  @override
  String get detailAddRecommendedStep => '添加建议的步骤';

  @override
  String get detailEditRecommendedStep => '编辑建议的步骤';

  @override
  String get detailArchiveTitle => '归档这项待办？';

  @override
  String get detailArchiveBody => '它会离开你的列表，但不会被删除，采集它的那份内容也会保留。';

  @override
  String get detailArchiveConfirm => '归档';

  @override
  String get detailArchived => '已归档';

  @override
  String detailCompletedOn(String date) {
    return '$date 完成';
  }

  @override
  String get detailSectionDetails => '详情';

  @override
  String get detailSectionReminders => '提醒';

  @override
  String get detailAllStepsDone => '所有步骤已完成';

  @override
  String get detailNextEyebrow => '接下来';

  @override
  String get detailCompleteQuestion => '完成这项待办？';

  @override
  String get detailMarkStepDone => '把步骤标为已完成';

  @override
  String get detailCompleteAction => '完成这项待办';

  @override
  String get detailAddDeadline => '添加期限';

  @override
  String get detailAddAmount => '添加金额';

  @override
  String detailStepsProgress(int completed, int total) {
    return '已完成 $completed/$total';
  }

  @override
  String get detailNoStepsTitle => '还没有步骤';

  @override
  String get detailNoStepsMessage => '把它拆成你真正要做的动作。';

  @override
  String get detailAddFirstStep => '添加第一个步骤';

  @override
  String detailStepCompletedSemantics(String title) {
    return '已完成的步骤：$title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return '下一个步骤：$title';
  }

  @override
  String detailStepSemantics(String title) {
    return '步骤：$title';
  }

  @override
  String detailMarkDone(String title) {
    return '把“$title”标为已完成';
  }

  @override
  String detailMarkNotDone(String title) {
    return '把“$title”标为未完成';
  }

  @override
  String get detailStepOptions => '步骤选项';

  @override
  String get detailMoveUp => '上移';

  @override
  String get detailMoveDown => '下移';

  @override
  String get detailDeleteStep => '删除步骤';

  @override
  String get detailDateFormat => 'M月d日';

  @override
  String get detailDateFormatWithYear => 'yyyy年M月d日';

  @override
  String get stepDeleteTitle => '删除这个步骤？';

  @override
  String get stepDeleteKeep => '保留';

  @override
  String get detailNoRemindersYet => '还没有提醒。';

  @override
  String get detailReminderLimit => '一项待办最多只能有这么多提醒。删掉一个才能再加一个。';

  @override
  String get detailAddReminder => '添加提醒';

  @override
  String get detailChangeReminder => '更改提醒';

  @override
  String get detailRemoveReminder => '删除提醒';

  @override
  String get detailReminderFormat => 'M月d日 EEE HH:mm';

  @override
  String get reminderStatePending => '还未设置';

  @override
  String get reminderStateNotificationsOff => '已保存，但通知是关闭的';

  @override
  String get reminderStateFailed => '没能排上时间';

  @override
  String get reminderStateRemoving => '正在删除…';

  @override
  String get reminderSetConfirmation => '提醒已设置。到时会提醒你。';

  @override
  String get reminderUpdatedConfirmation => '提醒已更新。';

  @override
  String get reminderNeedsPermission => '通知已关闭，所以这条提醒已保存，但还不能通知你。';

  @override
  String get reminderScheduleFailed => '这条提醒已保存，但 Android 没有为它排上时间。';

  @override
  String get reminderLimitReached => '那项待办的提醒数量已经到上限了。';

  @override
  String get reminderTimeInPast => '那个时间已经过去了。';

  @override
  String get reminderAddTitle => '添加提醒';

  @override
  String get reminderChangeTitle => '更改这条提醒';

  @override
  String get reminderDateLabel => '日期';

  @override
  String get reminderTimeLabel => '时间';

  @override
  String get reminderFieldDateFormat => 'yyyy年M月d日 EEE';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'M月d日EEEE';

  @override
  String get reminderPresetFormat => 'M月d日 HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return '将在 $date $time 提醒你。';
  }

  @override
  String get reminderTimePastError => '那个时间已经过去了。选一个更晚的。';

  @override
  String get reminderSet => '设置提醒';

  @override
  String get reminderPresetInHour => '1 小时后';

  @override
  String get reminderPresetTomorrowMorning => '明天早上';

  @override
  String get reminderPresetNextWeek => '下周';

  @override
  String get reminderPresetOnTheDay => '当天';

  @override
  String get reminderPresetDayBefore => '提前 1 天';

  @override
  String get reminderPresetWeekBefore => '提前 1 周';

  @override
  String get reminderPresetAtDeadline => '到期时';

  @override
  String get reminderPresetHourBefore => '提前 1 小时';

  @override
  String get editNextStepTitle => '建议的下一步';

  @override
  String get editNextStepSubtitle => '用一句话说清下一步该做什么。';

  @override
  String get editNextStepHint => '下一步做什么最有用？';

  @override
  String get editRemoveSuggestion => '删除建议';

  @override
  String get editUrgencyTitle => '这件事有多急？';

  @override
  String get editStepHint => '一件具体要做的事';

  @override
  String get editAddStep => '添加步骤';

  @override
  String get editDateHint => 'YYYY-MM-DD';

  @override
  String get editRemoveDeadline => '删除期限';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => '保存金额';

  @override
  String get editRemoveAmount => '删除金额';

  @override
  String get securityTitle => '安全与隐私';

  @override
  String get securitySectionProtection => '保护';

  @override
  String get securityAppLockUnavailable =>
      '应用锁需要本机设有屏幕锁。请先在设备设置里设置 PIN、图案、密码或指纹。';

  @override
  String get securityAppLockOn => 'Action 请你的设备确认是你本人。';

  @override
  String get securityAppLockOff => '打开 Action 时需要你的指纹、面容或设备 PIN。';

  @override
  String get securityAskAgain => '再次询问';

  @override
  String get securityAskAgainDescription => 'Action 在后台停留多久后锁定。';

  @override
  String get securityScreenPrivacy => '屏幕隐私';

  @override
  String get securityScreenPrivacyDescription =>
      '请求 Android 阻止截屏和录屏，并在应用切换器中隐藏 Action。';

  @override
  String get securityPrivateReminders => '私密提醒';

  @override
  String get securityPrivateRemindersOn => '提醒只说有事等着你。';

  @override
  String get securityPrivateRemindersOff => '提醒会显示待办的标题。打开这项可以让它不出现在锁屏上。';

  @override
  String get securityLockNow => '立即锁定';

  @override
  String get securityLockNowDescription => '不用等，直接关门。';

  @override
  String get securitySectionStorage => '你的数据怎么存';

  @override
  String get securityStorageDataLabel => '你的待办、采集和设置';

  @override
  String get securityStorageDataDetail =>
      '它们放在本应用自己的私有存储里，其他应用读不到，Android 会作为设备加密的一部分加密它们。Action 没有在上面再加一层自己的加密。';

  @override
  String get securityStorageKeyLabel => '你的 AI 提供方密钥';

  @override
  String get securityStorageKeyDetail =>
      '存在 Android Keystore 里，而不是和其他东西放在一起，保存之后不会再显示。';

  @override
  String get securityStorageGapLabel => '这些覆盖不到的地方';

  @override
  String get securityStorageGapDetail =>
      '这些都挡不住有人拿着你已解锁的设备使用，被改动或已 root 的系统也能读到比正常系统更多的东西。应用锁是对前一种情况有帮助的那项设置。';

  @override
  String get securitySectionInformation => '你的信息';

  @override
  String get securityWhereInfoDescription => '你的数据可能走的每条路，以及离开本机的那两条。';

  @override
  String get securityAppLockRefused => '没有确认，所以什么都没变。';

  @override
  String get securityAppLockUnavailableToast =>
      '本机没有设置屏幕锁。请在设备设置里添加 PIN、图案、密码或指纹，然后再试一次。';

  @override
  String get securityScreenPrivacyRefused => '本机没有应用屏幕隐私，所以它保持关闭，而不是被显示成已开启。';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条已排期的提醒现在说得更少了。',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已更新 $count 条已排期的提醒。',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => '立即';

  @override
  String get appLockDelayOneMinute => '1 分钟后';

  @override
  String get appLockDelayFiveMinutes => '5 分钟后';

  @override
  String get securityDelayImmediatelyDescription => '每次 Action 离开屏幕时';

  @override
  String get securityDelayOneMinuteDescription => '够回一条消息';

  @override
  String get securityDelayFiveMinutesDescription => '够接一个电话';

  @override
  String get securityHeroProtected => '已保护';

  @override
  String get securityHeroNothingOn => '什么都没开';

  @override
  String get securityHeroFootnote => '这里的一切都在本机运行。这些设置都不会被发送到任何地方，也都不能被远程更改。';

  @override
  String get securityHeadlineNone => '有三项保护可用';

  @override
  String securityHeadlineOne(String first) {
    return '$first 已开启';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first 和 $second 已开启';
  }

  @override
  String get securityHeadlineAll => '三项保护全部开启';

  @override
  String get securityTransfersTitle => '有什么离开了本机';

  @override
  String get securityTransfersNoProvider => '没有连接 AI 提供方，所以根本没有任何东西被送去分析。';

  @override
  String get securityTransfersDescription =>
      '在有东西被发出去的那一刻就记在这里，不管有没有回来。只记工具、提供方和大小——绝不记里面是什么。在本机保留 90 天，不发往任何地方。';

  @override
  String get securityClear => '清除';

  @override
  String get securityNothingSent => '还没有发送过任何东西';

  @override
  String get securityNothingSentDescription => '当你运行用到你的 AI 提供方的工具时，它会列在这里。';

  @override
  String get securityClearHistoryTitle => '清除这份记录？';

  @override
  String get securityClearHistoryBody => '关于发送过什么的记录会从本机删除。这并不会撤回任何已经发出去的东西。';

  @override
  String get securityUnnamedTool => '一个 Intelligence 工具';

  @override
  String get securityYourProvider => '你的 AI 提供方';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 页',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => '一小段文字';

  @override
  String securityTransferCharacters(int count) {
    return '$count 千字符';
  }

  @override
  String securitySentTo(String provider) {
    return '已发送至 $provider。';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '已发送至 $provider · $size。';
  }

  @override
  String relativeWeeks(int count) {
    return '$count 周前';
  }

  @override
  String get helpTitle => '帮助';

  @override
  String get helpAddQuestion => '我可以添加什么？';

  @override
  String get helpAddAnswer => '一张截图，一张信件或账单的照片，或者你粘贴进来的文字。含有日期、金额或某项请求的内容效果最好。';

  @override
  String get helpReviewQuestion => 'Action 为什么要我核对？';

  @override
  String get helpReviewAnswer =>
      '因为读文档的机器可能读错，而一个悄悄弄错的期限比没有期限更糟。Action 会显示它找到了什么、来自哪些字，而且在你确认之前什么都不会保存。';

  @override
  String get helpVaryQuestion => '为什么再试一次结果会变？';

  @override
  String get helpVaryAnswer =>
      '读你文档的服务不是确定性的，所以同一项采集可能返回得略有不同。核对这一步存在也正是因为这个——不变的那一部分是你。';

  @override
  String get helpLateQuestion => '我的提醒为什么迟到了？';

  @override
  String get helpLateAnswer =>
      '提醒由 Android 排期，具体什么时候送达由 Android 决定。省电、Doze 和厂商的电源设置都可能让它延迟。Action 从不承诺分秒不差的提醒。';

  @override
  String get helpDataQuestion => '我的数据在哪里？';

  @override
  String get helpDataAnswer =>
      '几乎全都在本机：你的采集、待办、步骤、提醒和搜索。两个例外——你请 Action 读的内容会送到读它的 AI 服务，而一条已确认待办的简短记录可能以匿名标识存在云端。设置里的“隐私与数据”会准确列出那条记录包含什么。';

  @override
  String get helpBackupQuestion => '这是备份吗？';

  @override
  String get helpBackupAnswer =>
      '不是。云端记录无法恢复到新设备，也没有账号可以登录。如果你卸载 Action 或丢了这台设备，上面的数据就没了。';

  @override
  String get helpCorrectQuestion => '我怎么改一项待办？';

  @override
  String get helpCorrectAnswer =>
      '打开它，然后编辑任意字段——标题、期限、金额或建议的下一步。步骤随时可以添加、调整顺序、完成和删除。编辑一项待办从不向 AI 服务询问任何东西。';

  @override
  String get privacyTitle => '隐私与数据';

  @override
  String get privacyIntro => 'Action 尽量把一切都留在本机。有两件事是例外，两件都列在下面。';

  @override
  String get privacyGroupOnDevice => '在本机';

  @override
  String get privacyOnDeviceCaptures => '采集——你添加的截图、照片和文字，以及从中读出的文字。';

  @override
  String get privacyOnDeviceActions => '待办，及其步骤、要点和提醒。';

  @override
  String get privacyOnDeviceSearch => '搜索。你的搜索在这里运行，从不发往任何地方，关掉屏幕后也不保留。';

  @override
  String get privacyOnDevicePhotoMetadata =>
      '照片保存时不带位置。手机写进图片里的坐标、时间和相机信息，会在采集被保存之前移除，所以它们既不留在这里，你把采集发给自己的 AI 提供方时也不会跟着走。';

  @override
  String get privacyGroupSentToRead => '发出去供阅读';

  @override
  String get privacySentToReadWhat =>
      '当你请 Action 解读一项采集时，那份内容会发送给读它的 AI 服务。这不是运行在设备上的 AI。';

  @override
  String get privacySentToReadWhen => '只发送你选中的那一项采集，而且只在你提出请求时。';

  @override
  String get privacyGroupYourProvider => '发给你自己的 AI 提供方';

  @override
  String get privacyProviderWhat =>
      '如果你在设置里连接了 AI 提供方，Intelligence 工具会用你自己的 API 密钥，把你选中的内容发给该提供方——OpenAI、Anthropic、Google 或你选定的 endpoint。';

  @override
  String get privacyProviderDirect => '它直接发给他们。不经过任何属于 Action 的服务器。';

  @override
  String get privacyProviderScope =>
      '只发送你为某个工具挑选的内容，而且只在你运行它时。你其他的待办、采集和来源永远不会被一并带上，后台也从不发送任何东西。';

  @override
  String get privacyProviderKey =>
      '你的 API 密钥保存在本机的安全存储中，并且只发送给它所属的那个提供方。对于拿到你已解锁设备的人来说，安全存储是一道真实的阻碍，但它并非绝对，Action 也不会声称相反。';

  @override
  String get privacyProviderLocalTools =>
      '有两个工具从不发送任何东西：隐去敏感信息，以及查看文件来自哪里。两者完全在本机运行。';

  @override
  String get privacyProviderAgreement =>
      '你的提供方拿你发过去的东西做什么，由你与他们的协议决定，而不是由 Action 决定。';

  @override
  String get privacyGroupCloud => '存在云端';

  @override
  String get privacyCloudWhat =>
      '当你确认一项待办时，它的一条简短记录可能以这次安装的匿名标识保存下来：标题、状态、紧急程度、类别、期限、金额、建议的下一步和时间戳。';

  @override
  String get privacyCloudNotSent => '你的采集、从中读出的文字、一项待办的步骤和要点，以及你的提醒，都不会被发送。';

  @override
  String get privacyCloudNotBackup => '这不是备份。没有办法把它恢复到新设备，丢失这次安装也会一并丢失那个匿名标识。';

  @override
  String get privacyGroupDiagnostics => '诊断';

  @override
  String get privacyDiagnosticsWhat =>
      'Action 记录应用里发生了什么的匿名计数——某次采集开始了，某次提取成功或失败，某次搜索没找到东西，某项待办完成了。';

  @override
  String get privacyDiagnosticsCounts =>
      '这些是计数，不是内容。任何标题、金额、期限、编号、采集到的文字或搜索词都不会被带上，匿名标识以及待办或采集的任何标识符也不会。';

  @override
  String get privacyDiagnosticsCrash =>
      '如果应用崩溃，错误和发生的位置会被上报，以便修复。Action 不会把你的数据附在那些报告里。';

  @override
  String get privacySectionYourData => '你的数据';

  @override
  String get privacyYourDataFootnote =>
      '清除采集不会动你的待办。采集已经没有的待办照样能用，只是不再显示它是从哪来的。';

  @override
  String get privacyClearCaptures => '清除采集';

  @override
  String get privacyClearCapturesDescription => '删除每一项采集及其图片文件。';

  @override
  String get privacyDeleteAll => '删除我的所有数据';

  @override
  String get privacyDeleteAllDescription => '待办、步骤、提醒、采集，以及上面的云端记录。';

  @override
  String get privacyClearCapturesTitle => '清除采集？';

  @override
  String get privacyClearCapturesBody => '每一项采集及其图片都会从本机删除。你的待办完全保持原样。';

  @override
  String get privacyCapturesDeleted => '采集已删除。';

  @override
  String get privacyCapturesPartlyDeleted => '有些采集没能删除。其他什么都没有改动。';

  @override
  String get privacyDeleteAllTitle => '删除你的所有数据？';

  @override
  String get privacyDeleteAllBody =>
      '这会删除本机的每一项待办、步骤、提醒和采集，以及上面列出的云端记录。无法撤销，也没有备份可以恢复。';

  @override
  String get privacyDeleteEverything => '全部删除';

  @override
  String get privacyDeletedAll => '全部已删除。';

  @override
  String get privacyDeleteFailed => '你的数据未能删除。';

  @override
  String get privacyDeletedUnverified =>
      '本机上的一切都已删除。Action 没能连上云端确认那里没有残留，会再检查一次。';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '已删除，$leftovers除外。';
  }

  @override
  String get privacyWillTryAgain => 'Action 会再试一次。';

  @override
  String get privacyCloudCheckIncomplete => 'Action 没能查完云端，会再试一次。';

  @override
  String get privacyLeftoverCaptures => '部分采集';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条云端记录',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first和$second';
  }

  @override
  String get privacyCloudDeleted => '云端记录已删除。';

  @override
  String get privacyCloudUnreachable => '仍然联系不上它们。Action 会再试一次。';

  @override
  String get privacyPendingTitle => '还需删除';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '上次有 $count 条云端记录联系不上。Action 会自己再试，你也可以现在重试。',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => '重试';

  @override
  String get evidenceTitle => '这是哪儿来的';

  @override
  String get evidenceUnverified =>
      'Action 没能在读到的文字里找到这些词，所以这个数值没有比对过。在依赖它之前，请对照原件核实。';

  @override
  String get evidenceHighlighted => '这些词出现在 Action 从这项采集里读到的文字中，高亮显示了位置。';

  @override
  String get evidenceNoRegion =>
      '这些词出现在 Action 从这项采集里读到的文字中。它没能确定这些词在图片上的确切位置，也不会去猜。';

  @override
  String get evidenceInText => '这些词出现在这项采集所含的文字中。';

  @override
  String get sourceCapturedAtFormat => 'M月d日 HH:mm';

  @override
  String get urgencyCritical => '紧要';

  @override
  String get urgencyImportant => '重要';

  @override
  String get urgencyNormal => '一般';

  @override
  String get urgencyLow => '较低';

  @override
  String get urgencyUnsure => '说不准';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppL10nZhHans extends AppL10nZh {
  AppL10nZhHans() : super('zh_Hans');

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDone => '完成';

  @override
  String get commonSave => '保存';

  @override
  String get commonClose => '关闭';

  @override
  String get commonBack => '返回';

  @override
  String get commonRetry => '重试';

  @override
  String get commonDelete => '删除';

  @override
  String get commonRemove => '移出';

  @override
  String get commonContinue => '继续';

  @override
  String get commonOpen => '打开';

  @override
  String get commonCopy => '复制';

  @override
  String get commonCopied => '已复制';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonAdd => '添加';

  @override
  String get commonOn => '开';

  @override
  String get commonOff => '关';

  @override
  String get commonUnknown => '未知';

  @override
  String get commonChecking => '正在检查…';

  @override
  String get commonSettings => '设置';

  @override
  String get commonDismiss => '忽略';

  @override
  String get commonUndo => '撤销';

  @override
  String get commonSkip => '跳过';

  @override
  String get commonNotNow => '以后再说';

  @override
  String get commonSomethingWentWrong => '出了点问题。';

  @override
  String get navToday => '今天';

  @override
  String get navLibrary => '资料库';

  @override
  String get navIntelligence => '智能';

  @override
  String get navSearch => '搜索';

  @override
  String get navCapture => '采集内容';

  @override
  String get todayGreetingMorning => '早上好';

  @override
  String get todayGreetingAfternoon => '下午好';

  @override
  String get todayGreetingEvening => '晚上好';

  @override
  String get todayDateFormat => 'M月d日 · EEEE';

  @override
  String get todayActionsLoadFailed => '无法载入你的待办。它们仍然保存在这台设备上。';

  @override
  String get todaySectionNeedsAttention => '需要处理';

  @override
  String get todaySectionAlsoNeedsAttention => '这些也需要处理';

  @override
  String get todaySectionWaitingForReview => '等待核对';

  @override
  String get todaySectionComingUp => '即将到来';

  @override
  String todaySeeAllCaptures(int count) {
    return '查看全部 $count 项采集';
  }

  @override
  String get todaySeeAllInLibrary => '在资料库中查看全部';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已完成 $count 项',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已完成 $count 项待办。打开资料库。',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => '从这里开始';

  @override
  String get todayQuickPhoto => '照片';

  @override
  String get todayQuickScreenshot => '截屏';

  @override
  String get todayQuickText => '文本';

  @override
  String get todayQuickTools => '查看一个链接，或在文本中找出密钥';

  @override
  String get briefBadgeNeedsYou => '需要你';

  @override
  String get briefBadgeToReview => '待核对';

  @override
  String get briefBadgeAhead => '在前面';

  @override
  String get briefBadgeStartHere => '从这里开始';

  @override
  String get briefBadgeClear => '已清空';

  @override
  String get briefNext => '下一步';

  @override
  String briefOpenAction(String title) {
    return '打开 $title';
  }

  @override
  String briefMarkDone(String title) {
    return '将“$title”标记为完成';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项待办需要你处理',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '还有 $count 项采集等待核对。',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项采集在等你',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => '没有逾期的事。';

  @override
  String get briefHeadlineNothingToday => '今天没有需要你处理的事';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 项待办即将到来。',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => '你这边都清空了';

  @override
  String get briefDetailClear => '没有到期的，也没有等待的。';

  @override
  String get briefHeadlineFirstRun => '从任何东西开始';

  @override
  String get briefDetailFirstRun => '一封信、一张截屏、一条便签 —— Action 会判断出它是什么。';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsSectionPersonalise => '个性化';

  @override
  String get settingsAppearance => '外观';

  @override
  String get settingsAppearanceDescription => '浅色、深色，或跟随设备。';

  @override
  String get settingsLanguageDescription => 'Action 与你对话所用的语言。';

  @override
  String get appearanceSystem => '跟随系统';

  @override
  String get appearanceLight => '浅色';

  @override
  String get appearanceDark => '深色';

  @override
  String get appearanceSystemDescription => '跟随设备设置';

  @override
  String get appearanceLightDescription => '始终浅色';

  @override
  String get appearanceDarkDescription => '始终深色';

  @override
  String get languageTitle => '语言';

  @override
  String get languageSubtitle => '更改立即生效。不会发送到任何地方；选择保存在这台设备上。';

  @override
  String get languageSectionChoose => '选择语言';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get languageSystemDescription => '跟随设备语言';

  @override
  String get languageDraftNote =>
      'Action 的文案原本是用英文写的。其余译文按照固定术语表起草，并经过自动检查，但尚未由母语者通读。凡是措辞的准确性要紧的地方 —— 隐私、安全，以及 Action 声称什么、不声称什么 —— 英文仍是基准。';

  @override
  String get ocrScriptTitle => '文字识别';

  @override
  String get ocrScriptSubtitle =>
      'Action 看照片时读取的书写系统。识别在本机进行；不会为了读取而把任何采集发送到任何地方。';

  @override
  String get ocrScriptSectionChoose => '书写系统';

  @override
  String get ocrScriptFollowLanguage => '跟随应用语言';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return '当前为$script';
  }

  @override
  String get ocrScriptLatin => '拉丁字母';

  @override
  String get ocrScriptChinese => '中文';

  @override
  String get ocrScriptDevanagari => '天城文';

  @override
  String get ocrScriptJapanese => '日文';

  @override
  String get ocrScriptKorean => '韩文';

  @override
  String get ocrScriptLatinDescription => '英语、西班牙语、法语、德语，以及其他用拉丁字母书写的语言。';

  @override
  String get ocrScriptChineseDescription => '简体中文和繁体中文。';

  @override
  String get ocrScriptDevanagariDescription =>
      '印地语、马拉地语和尼泊尔语。不含孟加拉语、泰米尔语或泰卢固语——它们各自是不同的书写系统。';

  @override
  String get ocrScriptJapaneseDescription => '日文。';

  @override
  String get ocrScriptKoreanDescription => '韩文。';

  @override
  String get ocrScriptFootnote =>
      '除拉丁字母外的每一项也都能读拉丁字母，所以选择一项是增加一种书写系统，而不是换掉一种。此改动对从现在起拍的照片生效，对已经读过的照片不生效。';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action 读不了$language文字';
  }

  @override
  String get ocrScriptUnreadableBody =>
      '本机没有对应的识别模型。照片中凡是用拉丁字母写的内容仍会被读取，其余部分会是空的。你可以改为自己输入或粘贴那段文字。';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action 目前设为读取$script。如果这张照片是另一种书写系统，请在设置中更改后重新读取。';
  }

  @override
  String get settingsTextRecognition => '文字识别';

  @override
  String get settingsTextRecognitionDescription => 'Action 从照片中读取的书写系统。';

  @override
  String get settingsIntelligenceFootnote =>
      '没有 AI，Action 一样能用。接入你自己的服务商后，会增加文档分析、规划和起草工具。';

  @override
  String get settingsAiProvider => 'AI 服务商';

  @override
  String get settingsAiNotConnected => '未接入。使用你自己的账号和 API 密钥。';

  @override
  String settingsAiConnected(String provider) {
    return '已接入 $provider。';
  }

  @override
  String get settingsSectionPrivacySecurity => '隐私与安全';

  @override
  String get settingsSecurity => '安全';

  @override
  String get settingsWhereInfoLives => '你的信息存放在哪里';

  @override
  String get settingsWhereInfoLivesDescription => '什么留在这台设备上，什么不留。';

  @override
  String get protectionAppLock => '应用锁';

  @override
  String get protectionScreenPrivacy => '屏幕隐私';

  @override
  String get protectionPrivateReminders => '隐藏内容的提醒';

  @override
  String get protectionSummaryNone => '应用锁、屏幕隐私，以及什么会离开这台设备。';

  @override
  String protectionSummaryOne(String first) {
    return '$first 已开启。';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first 和 $second 已开启。';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first、$second 和 $third 已开启。';
  }

  @override
  String get settingsSectionReminders => '提醒';

  @override
  String get settingsRemindersFootnote =>
      '视电池设置和设备使用情况，Android 可能比你设定的时间稍晚送达提醒。';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsNotificationsOnDescription => '你设置的提醒可以显示。';

  @override
  String get settingsNotificationsOffDescription => '已为 Action 关闭，因此提醒不会出现。';

  @override
  String get settingsNotificationsUnknown => '无法检查。';

  @override
  String get settingsNotificationsAllowed => '已允许';

  @override
  String get settingsOpenSystemSettings => '打开设置';

  @override
  String get settingsActionFootnote => 'Action 把杂乱的信息变成清楚的下一步。保存之前，一切都由你确认。';

  @override
  String get settingsHelp => '帮助';

  @override
  String get settingsHelpDescription => 'Action 如何工作，以及它不会做什么。';

  @override
  String get settingsVersion => '版本';

  @override
  String get dateShortFormat => 'M月d日';

  @override
  String get dateLongFormat => 'yyyy年M月d日';

  @override
  String get relativeJustNow => '刚刚';

  @override
  String relativeMinutes(int count) {
    return '$count 分钟前';
  }

  @override
  String relativeHours(int count) {
    return '$count 小时前';
  }

  @override
  String get relativeYesterday => '昨天';

  @override
  String relativeDays(int count) {
    return '$count 天前';
  }

  @override
  String get libraryTitle => '资料库';

  @override
  String get librarySubtitle => 'Action 为你保管的一切。而这些全都留在这台设备上。';

  @override
  String get librarySegmentActions => '待办';

  @override
  String get librarySegmentCaptures => '采集';

  @override
  String get librarySegmentGoals => '目标';

  @override
  String get librarySegmentDone => '已完成';

  @override
  String get libraryNewGoal => '新建目标';

  @override
  String get libraryNoGoalsTitle => '还没有目标';

  @override
  String get libraryNoGoalsMessage => '目标是你希望发生的事。Action 能找出缺了什么、卡在哪里，以及先做什么。';

  @override
  String get libraryNoDoneTitle => '还没有完成的事';

  @override
  String get libraryNoDoneMessage => '你完成的待办会保存在这里。';

  @override
  String get libraryNoOpenTitle => '没有未完成的待办';

  @override
  String get libraryNoOpenMessage => '采集点什么，Action 会判断出需要做什么。';

  @override
  String get libraryNoCapturesTitle => '还没有采集任何东西';

  @override
  String get libraryNoCapturesMessage => '你添加的照片、截屏和文字会先落在这里。在你开口之前，什么都不会被分析。';

  @override
  String get libraryGoalNoActions => '还没有从中产生什么';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '来自这个目标的 $count 项待办',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => '搜索待办和采集';

  @override
  String get searchClear => '清除';

  @override
  String get searchPrivacyNote => '在这台设备上搜索。你在这里输入的内容不会离开设备。';

  @override
  String get searchYouCanSearch => '你可以搜索';

  @override
  String get searchFieldTitles => '标题';

  @override
  String get searchFieldTitlesExample => '续保车险';

  @override
  String get searchFieldReferences => '参考编号';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => '机构';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => '待办里的步骤';

  @override
  String get searchFieldStepsExample => '上传表格';

  @override
  String get searchFieldCaptureText => '从采集中读出的文字';

  @override
  String get searchFieldCaptureTextExample => '续期通知';

  @override
  String searchNoMatchesTitle(String query) {
    return '没有与“$query”匹配的结果';
  }

  @override
  String get searchNoMatchesTryFewer => '试试少用几个词，或按原样输入参考编号。';

  @override
  String get searchNoMatchesClearFilters => '试试少用几个词，或清除筛选。';

  @override
  String get searchFilterActive => '进行中';

  @override
  String get searchFilterCompleted => '已完成';

  @override
  String get searchFilterOverdue => '已逾期';

  @override
  String get searchFilterThisWeek => '本周';

  @override
  String get searchFilterCritical => '紧要';

  @override
  String get searchFilterCreatedByYou => '你创建的';

  @override
  String get searchFilterArchived => '已归档';

  @override
  String get searchFilterClear => '清除筛选';

  @override
  String get searchIncompleteActions => '无法搜索你的待办，因此这些结果可能不完整。';

  @override
  String get searchIncompleteCaptures => '无法搜索你的采集，因此这些结果可能不完整。';

  @override
  String get searchIncompleteBoth => '待办和采集都无法搜索，因此这些结果可能不完整。';

  @override
  String get searchMatchTitle => '标题';

  @override
  String get searchMatchNextStep => '下一步';

  @override
  String get searchMatchStep => '步骤';

  @override
  String get searchMatchSummary => '摘要';

  @override
  String get searchMatchFromCapture => '来自采集';

  @override
  String get studioSuggested => '为你最近一次采集推荐';

  @override
  String get studioRecentlyUsed => '最近用过';

  @override
  String get studioReady => '已就绪';

  @override
  String get studioNotConnected => '未接入';

  @override
  String get studioHeroTitle => 'Action 智能';

  @override
  String get studioConnectedBlurb => '读懂一份文件、打磨一个目标、搭一个计划、起草一封回复，或核对眼前的东西。';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count 个用于读懂文件、规划和写作的工具。接入你自己的 AI 账号即可使用 —— 向你收费的是你的服务商，从来不是 Action。';
  }

  @override
  String get studioConnectAi => '接入 AI';

  @override
  String get studioHowItWorks => '工作方式';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '其中 $count 个现在就能用，不需要这些，完全在这台设备上运行。',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => '在这台设备上运行';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title。$description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title。$description 在这台设备上运行。';
  }

  @override
  String get categoryUnderstand => '读懂';

  @override
  String get categoryUnderstandBlurb => '弄明白手上的东西。';

  @override
  String get categoryPlan => '规划';

  @override
  String get categoryPlanBlurb => '把它变成能动手做的事。';

  @override
  String get categoryCreate => '写作';

  @override
  String get categoryCreateBlurb => '写出来、改好、译过去。';

  @override
  String get categoryExtract => '提取';

  @override
  String get categoryExtractBlurb => '把要紧的信息挑出来。';

  @override
  String get categoryVerify => '核对';

  @override
  String get categoryVerifyBlurb => '核对眼前的东西。';

  @override
  String get captureSheetTitle => '采集内容';

  @override
  String get captureSheetSubtitle => '你不想通篇读的东西，交给 Action。';

  @override
  String get captureTakePhoto => '拍一张照片';

  @override
  String get captureTakePhotoSubtitle => '眼前的信件、账单或通知';

  @override
  String get captureChooseImage => '选一张图片';

  @override
  String get captureChooseImageSubtitle => '这台设备上已有的截屏或照片';

  @override
  String get capturePasteText => '粘贴文字';

  @override
  String get capturePasteTextSubtitle => '一封邮件、一条消息或一份通知';

  @override
  String get captureChoosePdf => '选一个 PDF';

  @override
  String get captureChoosePdfSubtitle => '你手上已有的对账单、信件或表格';

  @override
  String get captureFootnote => '采集的内容留在这台设备上。在你开口之前，不会有任何联网分析。';

  @override
  String get captureCouldNotOpen => '打不开那个。换个方式试试。';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title。$subtitle';
  }

  @override
  String get stageReading => '读取中';

  @override
  String get stageNeedsReview => '需核对';

  @override
  String get stageActionCreated => '已创建待办';

  @override
  String get stageNoText => '未找到文字';

  @override
  String get stageCouldNotBeRead => '无法读取';

  @override
  String get stageReadingPreview => '正在读取文字…';

  @override
  String get stageFailedPreview => '这个在本设备上无法读取。';

  @override
  String get provenancePhoto => '从照片采集';

  @override
  String get provenanceImage => '从图片采集';

  @override
  String get provenancePastedText => '从粘贴的文字采集';

  @override
  String get provenanceDocument => '作为文件添加';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return '完成于 $when';
  }

  @override
  String metaOverdue(String date) {
    return '已逾期 · 原定 $date';
  }

  @override
  String get metaDueToday => '今天到期';

  @override
  String metaDueOn(String date) {
    return '$date 到期';
  }

  @override
  String get metaCreatedByYou => '你创建的';

  @override
  String get categoryPayment => '付款';

  @override
  String get categoryRenewal => '续期';

  @override
  String get categoryAppointment => '预约';

  @override
  String get categoryBooking => '订位';

  @override
  String get categoryTravel => '出行';

  @override
  String get categoryDeadline => '截止日期';

  @override
  String get categoryResponse => '需要回复';

  @override
  String get categoryDelivery => '配送';

  @override
  String get categoryDocument => '文件';

  @override
  String get categoryNoActionRequired => '无需处理';

  @override
  String get categoryUnsure => '不确定';

  @override
  String get errorEnterManually => '手动输入';

  @override
  String get sourceWhatWeRead => '我们读到的内容';

  @override
  String get sourceDelete => '删除采集';

  @override
  String get sourceGone => '那项采集已经不在了。';

  @override
  String get sourceDeleteTitle => '删除这项采集？';

  @override
  String get sourceDeleteBody => '图片以及从中读出的文字会从本机移除。';

  @override
  String get sourceDeleteKeep => '保留';

  @override
  String get sourceOpenAction => '打开待办';

  @override
  String sourceOpenActions(int count) {
    return '打开 $count 项待办';
  }

  @override
  String get sourceCreateAnother => '再据此创建一项';

  @override
  String get sourceCreateAction => '据此创建一项待办';

  @override
  String get sourceDoMore => '用它做更多事';

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
    return '来自 $format $size KB';
  }

  @override
  String get sourceTextFound => '找到文字';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines 行 · $ms ms';
  }

  @override
  String get sourceReadExplainer => '这是 Action 读到的文字。据此做出的东西在下面。';

  @override
  String get sourceNotInterpreted =>
      '目前还没有做任何解读。Action 会建议拿它做什么，在任何东西被创建之前由你确认。';

  @override
  String get sourceNoTextExplainer => '手写字、光线极暗，或本机还读不了的书写系统，都可能出现这种情况。';

  @override
  String get sourceReadFailed => '这个读不出来';

  @override
  String get sourceReadFailedReason => '文字识别没有走完。';

  @override
  String get sourceTryReadingAgain => '再读一次';

  @override
  String get sourceTypeInstead => '改为自己输入内容';

  @override
  String get sourceTypeWhatItSays => '把上面写的内容打出来';

  @override
  String get sourceTypeHint => '日期、金额，以及要求做什么。';

  @override
  String get sourceMadeFromThis => '由这项采集做出的';

  @override
  String sourceMadeFromThisCount(int count) {
    return '由这项采集做出 $count 项';
  }

  @override
  String get sourceTheDocument => '文档';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 页',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => '页数未知';

  @override
  String get sourceDocumentNotRead =>
      'Action 没有读过这份文档里面的内容。当你运行需要读它的工具时，文件会送到你连接的 AI 提供方，并且会在发送前告知你。';

  @override
  String get previewSaveFailed => '没能保存。请再试一次。';

  @override
  String get previewTitle => '核对采集';

  @override
  String get previewImageFailed => '那张图片打不开。';

  @override
  String get previewHint => '确认文字清晰可读，重要部分没有被截掉。';

  @override
  String get previewRetake => '重拍';

  @override
  String get pasteTitle => '粘贴文字';

  @override
  String get pasteHint => '把你不想通篇读的邮件、消息或通知粘贴进来。';

  @override
  String get pasteFootnote => '含有日期、金额或某项请求的内容效果最好。';

  @override
  String get pasteEnough => '看起来够用了。';

  @override
  String get pasteMore => '再多一点文字，结果会更好。';

  @override
  String get reviewLoadFailed => '这项采集加载不出来。';

  @override
  String get reviewConfirmed => '已确认';

  @override
  String get reviewNeedsReview => '需要核对';

  @override
  String get reviewReview => '核对';

  @override
  String get reviewHighConfidence => '把握较大';

  @override
  String get reviewConfirmedByYou => '由你确认';

  @override
  String get reviewMissing => '缺失';

  @override
  String get reviewNotUnderstood => 'Action 没能可靠地看懂这份来源里足够多的内容。';

  @override
  String get reviewNotUnderstoodBody => '采集完好无损，什么都没丢。你可以自己填写内容，来源也会继续附着以供对照。';

  @override
  String get reviewEnterDetails => '填写内容';

  @override
  String get reviewKeepSource => '把来源留着以后看';

  @override
  String reviewEngine(String engine) {
    return '引擎：$engine';
  }

  @override
  String get reviewManualNotice => '这项待办是你自己创建的。只会用到你在这里填的内容。';

  @override
  String get reviewUntitled => '未命名的待办';

  @override
  String get reviewEditTitle => '编辑标题';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '确认之前，有 $count 项数值需要你核对。',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => '关键信息';

  @override
  String get reviewNotFound => '没找到';

  @override
  String get reviewSuggestedNextStep => '建议的下一步';

  @override
  String get reviewWhyThisMatters => '为什么这件事要紧';

  @override
  String get reviewSteps => '步骤';

  @override
  String get reviewAddStep => '添加步骤';

  @override
  String get reviewInjectionNotice => '这份来源里有些文字看起来像指令而不是文档信息，所以 Action 没有采用。';

  @override
  String get reviewLayoutNotice =>
      '这份文档的版式里可能有一些对应关系，文字提取没能完整保留。确认之前请把下面的数值和来源比对一下。';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason 请把下面的数值和来源比对一下。';
  }

  @override
  String get reviewDeadline => '期限';

  @override
  String get reviewAmount => '金额';

  @override
  String get reviewLeftUnset => '没有——你选择了留空';

  @override
  String get reviewUnclear => '不清楚';

  @override
  String get reviewNotSet => '未设定';

  @override
  String get reviewNoDeadlineFound => '这份文档里没找到';

  @override
  String get reviewNoAmountFound => '这份文档里没找到金额';

  @override
  String get reviewMultipleDates => 'Action 找到了多个可能的日期。';

  @override
  String reviewMultipleDatesBody(int count) {
    return '有 $count 个日期可能是期限。选出正确的，输入另一个，或者留空。';
  }

  @override
  String get reviewChooseDate => '选一个日期';

  @override
  String get reviewMultipleAmounts => 'Action 找到了不止一个可能的金额。';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '有 $count 个金额可能是这里说的那个。选一个，输入另一个，或者留空。';
  }

  @override
  String get reviewChooseAmount => '选一个金额';

  @override
  String get reviewSkipStep => '跳过这一步';

  @override
  String get reviewKeepStep => '保留这一步';

  @override
  String get reviewEditStep => '编辑步骤';

  @override
  String get reviewCreateManually => '自己创建';

  @override
  String get reviewConfirmAndCreate => '确认并创建待办';

  @override
  String get reviewFixHighlighted => '核对标出的字段';

  @override
  String get reviewSaving => '正在保存…';

  @override
  String get reviewSaveFailed => '这项待办没能保存。什么都没丢——请再试一次。';

  @override
  String get reviewFieldTitle => '标题';

  @override
  String get reviewTitleHint => '需要做成什么？';

  @override
  String get reviewNewStep => '新步骤';

  @override
  String get reviewStepHint => '要做什么';

  @override
  String get reviewDatesConflict => '文档里提到了不止一个日期。';

  @override
  String get reviewAmountsConflict => '文档里提到了不止一个金额。';

  @override
  String get reviewAnotherDate => '另一个日期 — 2026-08-30';

  @override
  String get reviewBadDate => '这不是一个真实日期。请用 2026-08-30 的格式。';

  @override
  String get reviewTypeDate => '输入一个日期，或者在下面留空。';

  @override
  String get reviewUseThisDate => '用这个日期';

  @override
  String get reviewLeaveNoDeadline => '不设期限继续';

  @override
  String get reviewAnotherAmount => '另一个金额 — 780.00';

  @override
  String reviewAmountError(String reason) {
    return '这个金额用不了：$reason。';
  }

  @override
  String get reviewUseThisAmount => '用这个金额';

  @override
  String get reviewLeaveNoAmount => '不设金额继续';

  @override
  String get reviewThisValue => '这个数值';

  @override
  String reviewQuote(String quote) {
    return '“$quote”';
  }

  @override
  String get reviewSeeOnCapture => '在采集上查看';

  @override
  String get reviewViewSource => '查看来源';

  @override
  String get reviewFromSource => '来自来源';

  @override
  String get reviewNotVerified => '未比对';

  @override
  String get reviewCouldNotVerify => '没能把这个和来源比对上。';

  @override
  String get reviewLooksRight => '看着没问题';

  @override
  String get reviewStageReading => '正在读取来源';

  @override
  String get reviewStageUnderstanding => '正在理解重要信息';

  @override
  String get reviewStageChecking => '正在检查哪些需要核对';

  @override
  String get reviewNothingToDo => '眼下你不需要做什么。';

  @override
  String get reviewInformationOnly => '这看起来只是告知——没有找到期限、付款或要求回复。';

  @override
  String get reviewInformationOnlyWithSource =>
      '这看起来只是告知——这项采集里没有找到期限、付款或要求回复。';

  @override
  String get reviewSourceKept => '无论如何来源都会留着。';

  @override
  String get reviewAddAnyway => '仍然添加一项待办';

  @override
  String get reviewActionConfirmed => '待办已确认';

  @override
  String get reviewCreatedByYou => '由你创建。';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '根据 $count 条已核对的信息，由你确认。',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '根据 $count 条已核对的信息，由你确认。其中 $edited 条是你改过的。',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => '已保存在本机。';

  @override
  String get detailLoadFailed => '这项待办加载不出来。它仍然保存在本机。';

  @override
  String get detailNotFoundTitle => '那项待办已经不在了';

  @override
  String get detailNotFoundMessage => '可能已在本机删除。';

  @override
  String get detailGoBack => '返回';

  @override
  String get detailMore => '更多';

  @override
  String get detailChangeUrgency => '更改紧急程度';

  @override
  String get detailAddRecommendedStep => '添加建议的步骤';

  @override
  String get detailEditRecommendedStep => '编辑建议的步骤';

  @override
  String get detailArchiveTitle => '归档这项待办？';

  @override
  String get detailArchiveBody => '它会离开你的列表，但不会被删除，采集它的那份内容也会保留。';

  @override
  String get detailArchiveConfirm => '归档';

  @override
  String get detailArchived => '已归档';

  @override
  String detailCompletedOn(String date) {
    return '$date 完成';
  }

  @override
  String get detailSectionDetails => '详情';

  @override
  String get detailSectionReminders => '提醒';

  @override
  String get detailAllStepsDone => '所有步骤已完成';

  @override
  String get detailNextEyebrow => '接下来';

  @override
  String get detailCompleteQuestion => '完成这项待办？';

  @override
  String get detailMarkStepDone => '把步骤标为已完成';

  @override
  String get detailCompleteAction => '完成这项待办';

  @override
  String get detailAddDeadline => '添加期限';

  @override
  String get detailAddAmount => '添加金额';

  @override
  String detailStepsProgress(int completed, int total) {
    return '已完成 $completed/$total';
  }

  @override
  String get detailNoStepsTitle => '还没有步骤';

  @override
  String get detailNoStepsMessage => '把它拆成你真正要做的动作。';

  @override
  String get detailAddFirstStep => '添加第一个步骤';

  @override
  String detailStepCompletedSemantics(String title) {
    return '已完成的步骤：$title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return '下一个步骤：$title';
  }

  @override
  String detailStepSemantics(String title) {
    return '步骤：$title';
  }

  @override
  String detailMarkDone(String title) {
    return '把“$title”标为已完成';
  }

  @override
  String detailMarkNotDone(String title) {
    return '把“$title”标为未完成';
  }

  @override
  String get detailStepOptions => '步骤选项';

  @override
  String get detailMoveUp => '上移';

  @override
  String get detailMoveDown => '下移';

  @override
  String get detailDeleteStep => '删除步骤';

  @override
  String get detailDateFormat => 'M月d日';

  @override
  String get detailDateFormatWithYear => 'yyyy年M月d日';

  @override
  String get stepDeleteTitle => '删除这个步骤？';

  @override
  String get stepDeleteKeep => '保留';

  @override
  String get detailNoRemindersYet => '还没有提醒。';

  @override
  String get detailReminderLimit => '一项待办最多只能有这么多提醒。删掉一个才能再加一个。';

  @override
  String get detailAddReminder => '添加提醒';

  @override
  String get detailChangeReminder => '更改提醒';

  @override
  String get detailRemoveReminder => '删除提醒';

  @override
  String get detailReminderFormat => 'M月d日 EEE HH:mm';

  @override
  String get reminderStatePending => '还未设置';

  @override
  String get reminderStateNotificationsOff => '已保存，但通知是关闭的';

  @override
  String get reminderStateFailed => '没能排上时间';

  @override
  String get reminderStateRemoving => '正在删除…';

  @override
  String get reminderSetConfirmation => '提醒已设置。到时会提醒你。';

  @override
  String get reminderUpdatedConfirmation => '提醒已更新。';

  @override
  String get reminderNeedsPermission => '通知已关闭，所以这条提醒已保存，但还不能通知你。';

  @override
  String get reminderScheduleFailed => '这条提醒已保存，但 Android 没有为它排上时间。';

  @override
  String get reminderLimitReached => '那项待办的提醒数量已经到上限了。';

  @override
  String get reminderTimeInPast => '那个时间已经过去了。';

  @override
  String get reminderAddTitle => '添加提醒';

  @override
  String get reminderChangeTitle => '更改这条提醒';

  @override
  String get reminderDateLabel => '日期';

  @override
  String get reminderTimeLabel => '时间';

  @override
  String get reminderFieldDateFormat => 'yyyy年M月d日 EEE';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'M月d日EEEE';

  @override
  String get reminderPresetFormat => 'M月d日 HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return '将在 $date $time 提醒你。';
  }

  @override
  String get reminderTimePastError => '那个时间已经过去了。选一个更晚的。';

  @override
  String get reminderSet => '设置提醒';

  @override
  String get reminderPresetInHour => '1 小时后';

  @override
  String get reminderPresetTomorrowMorning => '明天早上';

  @override
  String get reminderPresetNextWeek => '下周';

  @override
  String get reminderPresetOnTheDay => '当天';

  @override
  String get reminderPresetDayBefore => '提前 1 天';

  @override
  String get reminderPresetWeekBefore => '提前 1 周';

  @override
  String get reminderPresetAtDeadline => '到期时';

  @override
  String get reminderPresetHourBefore => '提前 1 小时';

  @override
  String get editNextStepTitle => '建议的下一步';

  @override
  String get editNextStepSubtitle => '用一句话说清下一步该做什么。';

  @override
  String get editNextStepHint => '下一步做什么最有用？';

  @override
  String get editRemoveSuggestion => '删除建议';

  @override
  String get editUrgencyTitle => '这件事有多急？';

  @override
  String get editStepHint => '一件具体要做的事';

  @override
  String get editAddStep => '添加步骤';

  @override
  String get editDateHint => 'YYYY-MM-DD';

  @override
  String get editRemoveDeadline => '删除期限';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => '保存金额';

  @override
  String get editRemoveAmount => '删除金额';

  @override
  String get securityTitle => '安全与隐私';

  @override
  String get securitySectionProtection => '保护';

  @override
  String get securityAppLockUnavailable =>
      '应用锁需要本机设有屏幕锁。请先在设备设置里设置 PIN、图案、密码或指纹。';

  @override
  String get securityAppLockOn => 'Action 请你的设备确认是你本人。';

  @override
  String get securityAppLockOff => '打开 Action 时需要你的指纹、面容或设备 PIN。';

  @override
  String get securityAskAgain => '再次询问';

  @override
  String get securityAskAgainDescription => 'Action 在后台停留多久后锁定。';

  @override
  String get securityScreenPrivacy => '屏幕隐私';

  @override
  String get securityScreenPrivacyDescription =>
      '请求 Android 阻止截屏和录屏，并在应用切换器中隐藏 Action。';

  @override
  String get securityPrivateReminders => '私密提醒';

  @override
  String get securityPrivateRemindersOn => '提醒只说有事等着你。';

  @override
  String get securityPrivateRemindersOff => '提醒会显示待办的标题。打开这项可以让它不出现在锁屏上。';

  @override
  String get securityLockNow => '立即锁定';

  @override
  String get securityLockNowDescription => '不用等，直接关门。';

  @override
  String get securitySectionStorage => '你的数据怎么存';

  @override
  String get securityStorageDataLabel => '你的待办、采集和设置';

  @override
  String get securityStorageDataDetail =>
      '它们放在本应用自己的私有存储里，其他应用读不到，Android 会作为设备加密的一部分加密它们。Action 没有在上面再加一层自己的加密。';

  @override
  String get securityStorageKeyLabel => '你的 AI 提供方密钥';

  @override
  String get securityStorageKeyDetail =>
      '存在 Android Keystore 里，而不是和其他东西放在一起，保存之后不会再显示。';

  @override
  String get securityStorageGapLabel => '这些覆盖不到的地方';

  @override
  String get securityStorageGapDetail =>
      '这些都挡不住有人拿着你已解锁的设备使用，被改动或已 root 的系统也能读到比正常系统更多的东西。应用锁是对前一种情况有帮助的那项设置。';

  @override
  String get securitySectionInformation => '你的信息';

  @override
  String get securityWhereInfoDescription => '你的数据可能走的每条路，以及离开本机的那两条。';

  @override
  String get securityAppLockRefused => '没有确认，所以什么都没变。';

  @override
  String get securityAppLockUnavailableToast =>
      '本机没有设置屏幕锁。请在设备设置里添加 PIN、图案、密码或指纹，然后再试一次。';

  @override
  String get securityScreenPrivacyRefused => '本机没有应用屏幕隐私，所以它保持关闭，而不是被显示成已开启。';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条已排期的提醒现在说得更少了。',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已更新 $count 条已排期的提醒。',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => '立即';

  @override
  String get appLockDelayOneMinute => '1 分钟后';

  @override
  String get appLockDelayFiveMinutes => '5 分钟后';

  @override
  String get securityDelayImmediatelyDescription => '每次 Action 离开屏幕时';

  @override
  String get securityDelayOneMinuteDescription => '够回一条消息';

  @override
  String get securityDelayFiveMinutesDescription => '够接一个电话';

  @override
  String get securityHeroProtected => '已保护';

  @override
  String get securityHeroNothingOn => '什么都没开';

  @override
  String get securityHeroFootnote => '这里的一切都在本机运行。这些设置都不会被发送到任何地方，也都不能被远程更改。';

  @override
  String get securityHeadlineNone => '有三项保护可用';

  @override
  String securityHeadlineOne(String first) {
    return '$first 已开启';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first 和 $second 已开启';
  }

  @override
  String get securityHeadlineAll => '三项保护全部开启';

  @override
  String get securityTransfersTitle => '有什么离开了本机';

  @override
  String get securityTransfersNoProvider => '没有连接 AI 提供方，所以根本没有任何东西被送去分析。';

  @override
  String get securityTransfersDescription =>
      '在有东西被发出去的那一刻就记在这里，不管有没有回来。只记工具、提供方和大小——绝不记里面是什么。在本机保留 90 天，不发往任何地方。';

  @override
  String get securityClear => '清除';

  @override
  String get securityNothingSent => '还没有发送过任何东西';

  @override
  String get securityNothingSentDescription => '当你运行用到你的 AI 提供方的工具时，它会列在这里。';

  @override
  String get securityClearHistoryTitle => '清除这份记录？';

  @override
  String get securityClearHistoryBody => '关于发送过什么的记录会从本机删除。这并不会撤回任何已经发出去的东西。';

  @override
  String get securityUnnamedTool => '一个 Intelligence 工具';

  @override
  String get securityYourProvider => '你的 AI 提供方';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 页',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => '一小段文字';

  @override
  String securityTransferCharacters(int count) {
    return '$count 千字符';
  }

  @override
  String securitySentTo(String provider) {
    return '已发送至 $provider。';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '已发送至 $provider · $size。';
  }

  @override
  String relativeWeeks(int count) {
    return '$count 周前';
  }

  @override
  String get helpTitle => '帮助';

  @override
  String get helpAddQuestion => '我可以添加什么？';

  @override
  String get helpAddAnswer => '一张截图，一张信件或账单的照片，或者你粘贴进来的文字。含有日期、金额或某项请求的内容效果最好。';

  @override
  String get helpReviewQuestion => 'Action 为什么要我核对？';

  @override
  String get helpReviewAnswer =>
      '因为读文档的机器可能读错，而一个悄悄弄错的期限比没有期限更糟。Action 会显示它找到了什么、来自哪些字，而且在你确认之前什么都不会保存。';

  @override
  String get helpVaryQuestion => '为什么再试一次结果会变？';

  @override
  String get helpVaryAnswer =>
      '读你文档的服务不是确定性的，所以同一项采集可能返回得略有不同。核对这一步存在也正是因为这个——不变的那一部分是你。';

  @override
  String get helpLateQuestion => '我的提醒为什么迟到了？';

  @override
  String get helpLateAnswer =>
      '提醒由 Android 排期，具体什么时候送达由 Android 决定。省电、Doze 和厂商的电源设置都可能让它延迟。Action 从不承诺分秒不差的提醒。';

  @override
  String get helpDataQuestion => '我的数据在哪里？';

  @override
  String get helpDataAnswer =>
      '几乎全都在本机：你的采集、待办、步骤、提醒和搜索。两个例外——你请 Action 读的内容会送到读它的 AI 服务，而一条已确认待办的简短记录可能以匿名标识存在云端。设置里的“隐私与数据”会准确列出那条记录包含什么。';

  @override
  String get helpBackupQuestion => '这是备份吗？';

  @override
  String get helpBackupAnswer =>
      '不是。云端记录无法恢复到新设备，也没有账号可以登录。如果你卸载 Action 或丢了这台设备，上面的数据就没了。';

  @override
  String get helpCorrectQuestion => '我怎么改一项待办？';

  @override
  String get helpCorrectAnswer =>
      '打开它，然后编辑任意字段——标题、期限、金额或建议的下一步。步骤随时可以添加、调整顺序、完成和删除。编辑一项待办从不向 AI 服务询问任何东西。';

  @override
  String get privacyTitle => '隐私与数据';

  @override
  String get privacyIntro => 'Action 尽量把一切都留在本机。有两件事是例外，两件都列在下面。';

  @override
  String get privacyGroupOnDevice => '在本机';

  @override
  String get privacyOnDeviceCaptures => '采集——你添加的截图、照片和文字，以及从中读出的文字。';

  @override
  String get privacyOnDeviceActions => '待办，及其步骤、要点和提醒。';

  @override
  String get privacyOnDeviceSearch => '搜索。你的搜索在这里运行，从不发往任何地方，关掉屏幕后也不保留。';

  @override
  String get privacyOnDevicePhotoMetadata =>
      '照片保存时不带位置。手机写进图片里的坐标、时间和相机信息，会在采集被保存之前移除，所以它们既不留在这里，你把采集发给自己的 AI 提供方时也不会跟着走。';

  @override
  String get privacyGroupSentToRead => '发出去供阅读';

  @override
  String get privacySentToReadWhat =>
      '当你请 Action 解读一项采集时，那份内容会发送给读它的 AI 服务。这不是运行在设备上的 AI。';

  @override
  String get privacySentToReadWhen => '只发送你选中的那一项采集，而且只在你提出请求时。';

  @override
  String get privacyGroupYourProvider => '发给你自己的 AI 提供方';

  @override
  String get privacyProviderWhat =>
      '如果你在设置里连接了 AI 提供方，Intelligence 工具会用你自己的 API 密钥，把你选中的内容发给该提供方——OpenAI、Anthropic、Google 或你选定的 endpoint。';

  @override
  String get privacyProviderDirect => '它直接发给他们。不经过任何属于 Action 的服务器。';

  @override
  String get privacyProviderScope =>
      '只发送你为某个工具挑选的内容，而且只在你运行它时。你其他的待办、采集和来源永远不会被一并带上，后台也从不发送任何东西。';

  @override
  String get privacyProviderKey =>
      '你的 API 密钥保存在本机的安全存储中，并且只发送给它所属的那个提供方。对于拿到你已解锁设备的人来说，安全存储是一道真实的阻碍，但它并非绝对，Action 也不会声称相反。';

  @override
  String get privacyProviderLocalTools =>
      '有两个工具从不发送任何东西：隐去敏感信息，以及查看文件来自哪里。两者完全在本机运行。';

  @override
  String get privacyProviderAgreement =>
      '你的提供方拿你发过去的东西做什么，由你与他们的协议决定，而不是由 Action 决定。';

  @override
  String get privacyGroupCloud => '存在云端';

  @override
  String get privacyCloudWhat =>
      '当你确认一项待办时，它的一条简短记录可能以这次安装的匿名标识保存下来：标题、状态、紧急程度、类别、期限、金额、建议的下一步和时间戳。';

  @override
  String get privacyCloudNotSent => '你的采集、从中读出的文字、一项待办的步骤和要点，以及你的提醒，都不会被发送。';

  @override
  String get privacyCloudNotBackup => '这不是备份。没有办法把它恢复到新设备，丢失这次安装也会一并丢失那个匿名标识。';

  @override
  String get privacyGroupDiagnostics => '诊断';

  @override
  String get privacyDiagnosticsWhat =>
      'Action 记录应用里发生了什么的匿名计数——某次采集开始了，某次提取成功或失败，某次搜索没找到东西，某项待办完成了。';

  @override
  String get privacyDiagnosticsCounts =>
      '这些是计数，不是内容。任何标题、金额、期限、编号、采集到的文字或搜索词都不会被带上，匿名标识以及待办或采集的任何标识符也不会。';

  @override
  String get privacyDiagnosticsCrash =>
      '如果应用崩溃，错误和发生的位置会被上报，以便修复。Action 不会把你的数据附在那些报告里。';

  @override
  String get privacySectionYourData => '你的数据';

  @override
  String get privacyYourDataFootnote =>
      '清除采集不会动你的待办。采集已经没有的待办照样能用，只是不再显示它是从哪来的。';

  @override
  String get privacyClearCaptures => '清除采集';

  @override
  String get privacyClearCapturesDescription => '删除每一项采集及其图片文件。';

  @override
  String get privacyDeleteAll => '删除我的所有数据';

  @override
  String get privacyDeleteAllDescription => '待办、步骤、提醒、采集，以及上面的云端记录。';

  @override
  String get privacyClearCapturesTitle => '清除采集？';

  @override
  String get privacyClearCapturesBody => '每一项采集及其图片都会从本机删除。你的待办完全保持原样。';

  @override
  String get privacyCapturesDeleted => '采集已删除。';

  @override
  String get privacyCapturesPartlyDeleted => '有些采集没能删除。其他什么都没有改动。';

  @override
  String get privacyDeleteAllTitle => '删除你的所有数据？';

  @override
  String get privacyDeleteAllBody =>
      '这会删除本机的每一项待办、步骤、提醒和采集，以及上面列出的云端记录。无法撤销，也没有备份可以恢复。';

  @override
  String get privacyDeleteEverything => '全部删除';

  @override
  String get privacyDeletedAll => '全部已删除。';

  @override
  String get privacyDeleteFailed => '你的数据未能删除。';

  @override
  String get privacyDeletedUnverified =>
      '本机上的一切都已删除。Action 没能连上云端确认那里没有残留，会再检查一次。';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '已删除，$leftovers除外。';
  }

  @override
  String get privacyWillTryAgain => 'Action 会再试一次。';

  @override
  String get privacyCloudCheckIncomplete => 'Action 没能查完云端，会再试一次。';

  @override
  String get privacyLeftoverCaptures => '部分采集';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条云端记录',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first和$second';
  }

  @override
  String get privacyCloudDeleted => '云端记录已删除。';

  @override
  String get privacyCloudUnreachable => '仍然联系不上它们。Action 会再试一次。';

  @override
  String get privacyPendingTitle => '还需删除';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '上次有 $count 条云端记录联系不上。Action 会自己再试，你也可以现在重试。',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => '重试';

  @override
  String get evidenceTitle => '这是哪儿来的';

  @override
  String get evidenceUnverified =>
      'Action 没能在读到的文字里找到这些词，所以这个数值没有比对过。在依赖它之前，请对照原件核实。';

  @override
  String get evidenceHighlighted => '这些词出现在 Action 从这项采集里读到的文字中，高亮显示了位置。';

  @override
  String get evidenceNoRegion =>
      '这些词出现在 Action 从这项采集里读到的文字中。它没能确定这些词在图片上的确切位置，也不会去猜。';

  @override
  String get evidenceInText => '这些词出现在这项采集所含的文字中。';

  @override
  String get sourceCapturedAtFormat => 'M月d日 HH:mm';

  @override
  String get urgencyCritical => '紧要';

  @override
  String get urgencyImportant => '重要';

  @override
  String get urgencyNormal => '一般';

  @override
  String get urgencyLow => '较低';

  @override
  String get urgencyUnsure => '说不准';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppL10nZhHant extends AppL10nZh {
  AppL10nZhHant() : super('zh_Hant');

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDone => '完成';

  @override
  String get commonSave => '儲存';

  @override
  String get commonClose => '關閉';

  @override
  String get commonBack => '返回';

  @override
  String get commonRetry => '重試';

  @override
  String get commonDelete => '刪除';

  @override
  String get commonRemove => '移出';

  @override
  String get commonContinue => '繼續';

  @override
  String get commonOpen => '開啟';

  @override
  String get commonCopy => '複製';

  @override
  String get commonCopied => '已複製';

  @override
  String get commonEdit => '編輯';

  @override
  String get commonAdd => '新增';

  @override
  String get commonOn => '開';

  @override
  String get commonOff => '關';

  @override
  String get commonUnknown => '未知';

  @override
  String get commonChecking => '正在檢查…';

  @override
  String get commonSettings => '設定';

  @override
  String get commonDismiss => '忽略';

  @override
  String get commonUndo => '復原';

  @override
  String get commonSkip => '略過';

  @override
  String get commonNotNow => '之後再說';

  @override
  String get commonSomethingWentWrong => '出了點問題。';

  @override
  String get navToday => '今天';

  @override
  String get navLibrary => '資料庫';

  @override
  String get navIntelligence => '智慧';

  @override
  String get navSearch => '搜尋';

  @override
  String get navCapture => '擷取內容';

  @override
  String get todayGreetingMorning => '早安';

  @override
  String get todayGreetingAfternoon => '午安';

  @override
  String get todayGreetingEvening => '晚安';

  @override
  String get todayDateFormat => 'M月d日 · EEEE';

  @override
  String get todayActionsLoadFailed => '無法載入你的待辦。它們仍然儲存在這台裝置上。';

  @override
  String get todaySectionNeedsAttention => '需要處理';

  @override
  String get todaySectionAlsoNeedsAttention => '這些也需要處理';

  @override
  String get todaySectionWaitingForReview => '等待核對';

  @override
  String get todaySectionComingUp => '即將到來';

  @override
  String todaySeeAllCaptures(int count) {
    return '查看全部 $count 項擷取';
  }

  @override
  String get todaySeeAllInLibrary => '在資料庫中查看全部';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已完成 $count 項',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已完成 $count 項待辦。開啟資料庫。',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => '從這裡開始';

  @override
  String get todayQuickPhoto => '照片';

  @override
  String get todayQuickScreenshot => '螢幕截圖';

  @override
  String get todayQuickText => '文字';

  @override
  String get todayQuickTools => '檢查一個連結，或在文字中找出密鑰';

  @override
  String get briefBadgeNeedsYou => '需要你';

  @override
  String get briefBadgeToReview => '待核對';

  @override
  String get briefBadgeAhead => '在前面';

  @override
  String get briefBadgeStartHere => '從這裡開始';

  @override
  String get briefBadgeClear => '已清空';

  @override
  String get briefNext => '下一步';

  @override
  String briefOpenAction(String title) {
    return '開啟 $title';
  }

  @override
  String briefMarkDone(String title) {
    return '將「$title」標記為完成';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項待辦需要你處理',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '還有 $count 項擷取等待核對。',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項擷取在等你',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => '沒有逾期的事。';

  @override
  String get briefHeadlineNothingToday => '今天沒有需要你處理的事';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 項待辦即將到來。',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => '你這邊都清空了';

  @override
  String get briefDetailClear => '沒有到期的，也沒有等待的。';

  @override
  String get briefHeadlineFirstRun => '從任何東西開始';

  @override
  String get briefDetailFirstRun => '一封信、一張螢幕截圖、一則筆記 —— Action 會判斷出它是什麼。';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsSectionPersonalise => '個人化';

  @override
  String get settingsAppearance => '外觀';

  @override
  String get settingsAppearanceDescription => '淺色、深色，或跟隨裝置。';

  @override
  String get settingsLanguageDescription => 'Action 與你對話所用的語言。';

  @override
  String get appearanceSystem => '跟隨系統';

  @override
  String get appearanceLight => '淺色';

  @override
  String get appearanceDark => '深色';

  @override
  String get appearanceSystemDescription => '跟隨裝置設定';

  @override
  String get appearanceLightDescription => '永遠淺色';

  @override
  String get appearanceDarkDescription => '永遠深色';

  @override
  String get languageTitle => '語言';

  @override
  String get languageSubtitle => '變更立即生效。不會傳送到任何地方；選擇儲存在這台裝置上。';

  @override
  String get languageSectionChoose => '選擇語言';

  @override
  String get languageSystem => '跟隨系統';

  @override
  String get languageSystemDescription => '跟隨裝置語言';

  @override
  String get languageDraftNote =>
      'Action 的文案原本是用英文寫的。其餘譯文依照固定術語表起草，並經過自動檢查，但尚未由母語者通讀。凡是措辭準確性要緊的地方 —— 隱私、安全，以及 Action 聲稱什麼、不聲稱什麼 —— 英文仍是基準。';

  @override
  String get ocrScriptTitle => '文字辨識';

  @override
  String get ocrScriptSubtitle =>
      'Action 看照片時讀取的書寫系統。辨識在本機進行；不會為了讀取而把任何擷取傳送到任何地方。';

  @override
  String get ocrScriptSectionChoose => '書寫系統';

  @override
  String get ocrScriptFollowLanguage => '跟隨應用程式語言';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return '目前為$script';
  }

  @override
  String get ocrScriptLatin => '拉丁字母';

  @override
  String get ocrScriptChinese => '中文';

  @override
  String get ocrScriptDevanagari => '天城文';

  @override
  String get ocrScriptJapanese => '日文';

  @override
  String get ocrScriptKorean => '韓文';

  @override
  String get ocrScriptLatinDescription => '英語、西班牙語、法語、德語，以及其他以拉丁字母書寫的語言。';

  @override
  String get ocrScriptChineseDescription => '簡體中文和繁體中文。';

  @override
  String get ocrScriptDevanagariDescription =>
      '印地語、馬拉地語和尼泊爾語。不含孟加拉語、坦米爾語或泰盧固語——它們各自是不同的書寫系統。';

  @override
  String get ocrScriptJapaneseDescription => '日文。';

  @override
  String get ocrScriptKoreanDescription => '韓文。';

  @override
  String get ocrScriptFootnote =>
      '除拉丁字母外的每一項也都讀得了拉丁字母，所以選擇一項是增加一種書寫系統，而不是換掉一種。此變更對從現在起拍的照片生效，對已經讀過的照片不生效。';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action 讀不了$language文字';
  }

  @override
  String get ocrScriptUnreadableBody =>
      '本機沒有對應的辨識模型。照片中凡是以拉丁字母書寫的內容仍會被讀取，其餘部分會是空的。你可以改為自己輸入或貼上那段文字。';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action 目前設為讀取$script。如果這張照片是另一種書寫系統，請在設定中更改後重新讀取。';
  }

  @override
  String get settingsTextRecognition => '文字辨識';

  @override
  String get settingsTextRecognitionDescription => 'Action 從照片中讀取的書寫系統。';

  @override
  String get settingsIntelligenceFootnote =>
      '沒有 AI，Action 一樣能用。接上你自己的服務商後，會增加文件分析、規劃與起草工具。';

  @override
  String get settingsAiProvider => 'AI 服務商';

  @override
  String get settingsAiNotConnected => '未接上。使用你自己的帳號和 API 金鑰。';

  @override
  String settingsAiConnected(String provider) {
    return '已接上 $provider。';
  }

  @override
  String get settingsSectionPrivacySecurity => '隱私與安全';

  @override
  String get settingsSecurity => '安全';

  @override
  String get settingsWhereInfoLives => '你的資訊存放在哪裡';

  @override
  String get settingsWhereInfoLivesDescription => '什麼留在這台裝置上，什麼不留。';

  @override
  String get protectionAppLock => '應用程式鎖';

  @override
  String get protectionScreenPrivacy => '螢幕隱私';

  @override
  String get protectionPrivateReminders => '隱藏內容的提醒';

  @override
  String get protectionSummaryNone => '應用程式鎖、螢幕隱私，以及什麼會離開這台裝置。';

  @override
  String protectionSummaryOne(String first) {
    return '$first 已開啟。';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first 和 $second 已開啟。';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first、$second 和 $third 已開啟。';
  }

  @override
  String get settingsSectionReminders => '提醒';

  @override
  String get settingsRemindersFootnote =>
      '視電池設定與裝置使用情況，Android 可能比你設定的時間稍晚送達提醒。';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsNotificationsOnDescription => '你設定的提醒可以顯示。';

  @override
  String get settingsNotificationsOffDescription => '已為 Action 關閉，因此提醒不會出現。';

  @override
  String get settingsNotificationsUnknown => '無法檢查。';

  @override
  String get settingsNotificationsAllowed => '已允許';

  @override
  String get settingsOpenSystemSettings => '開啟設定';

  @override
  String get settingsActionFootnote => 'Action 把雜亂的資訊變成清楚的下一步。儲存之前，一切都由你確認。';

  @override
  String get settingsHelp => '說明';

  @override
  String get settingsHelpDescription => 'Action 如何運作，以及它不會做什麼。';

  @override
  String get settingsVersion => '版本';

  @override
  String get dateShortFormat => 'M月d日';

  @override
  String get dateLongFormat => 'yyyy年M月d日';

  @override
  String get relativeJustNow => '剛剛';

  @override
  String relativeMinutes(int count) {
    return '$count 分鐘前';
  }

  @override
  String relativeHours(int count) {
    return '$count 小時前';
  }

  @override
  String get relativeYesterday => '昨天';

  @override
  String relativeDays(int count) {
    return '$count 天前';
  }

  @override
  String get libraryTitle => '資料庫';

  @override
  String get librarySubtitle => 'Action 為你保管的一切。而這些全都留在這台裝置上。';

  @override
  String get librarySegmentActions => '待辦';

  @override
  String get librarySegmentCaptures => '擷取';

  @override
  String get librarySegmentGoals => '目標';

  @override
  String get librarySegmentDone => '已完成';

  @override
  String get libraryNewGoal => '新增目標';

  @override
  String get libraryNoGoalsTitle => '還沒有目標';

  @override
  String get libraryNoGoalsMessage => '目標是你希望發生的事。Action 能找出缺了什麼、卡在哪裡，以及先做什麼。';

  @override
  String get libraryNoDoneTitle => '還沒有完成的事';

  @override
  String get libraryNoDoneMessage => '你完成的待辦會保存在這裡。';

  @override
  String get libraryNoOpenTitle => '沒有未完成的待辦';

  @override
  String get libraryNoOpenMessage => '擷取點什麼，Action 會判斷出需要做什麼。';

  @override
  String get libraryNoCapturesTitle => '還沒有擷取任何東西';

  @override
  String get libraryNoCapturesMessage =>
      '你加入的照片、螢幕截圖和文字會先落在這裡。在你開口之前，什麼都不會被分析。';

  @override
  String get libraryGoalNoActions => '還沒有從中產生什麼';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '來自這個目標的 $count 項待辦',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => '搜尋待辦與擷取';

  @override
  String get searchClear => '清除';

  @override
  String get searchPrivacyNote => '在這台裝置上搜尋。你在這裡輸入的內容不會離開裝置。';

  @override
  String get searchYouCanSearch => '你可以搜尋';

  @override
  String get searchFieldTitles => '標題';

  @override
  String get searchFieldTitlesExample => '續保車險';

  @override
  String get searchFieldReferences => '參考編號';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => '機構';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => '待辦裡的步驟';

  @override
  String get searchFieldStepsExample => '上傳表格';

  @override
  String get searchFieldCaptureText => '從擷取中讀出的文字';

  @override
  String get searchFieldCaptureTextExample => '續期通知';

  @override
  String searchNoMatchesTitle(String query) {
    return '沒有與「$query」相符的結果';
  }

  @override
  String get searchNoMatchesTryFewer => '試試少用幾個字，或按原樣輸入參考編號。';

  @override
  String get searchNoMatchesClearFilters => '試試少用幾個字，或清除篩選。';

  @override
  String get searchFilterActive => '進行中';

  @override
  String get searchFilterCompleted => '已完成';

  @override
  String get searchFilterOverdue => '已逾期';

  @override
  String get searchFilterThisWeek => '本週';

  @override
  String get searchFilterCritical => '緊要';

  @override
  String get searchFilterCreatedByYou => '你建立的';

  @override
  String get searchFilterArchived => '已封存';

  @override
  String get searchFilterClear => '清除篩選';

  @override
  String get searchIncompleteActions => '無法搜尋你的待辦，因此這些結果可能不完整。';

  @override
  String get searchIncompleteCaptures => '無法搜尋你的擷取，因此這些結果可能不完整。';

  @override
  String get searchIncompleteBoth => '待辦和擷取都無法搜尋，因此這些結果可能不完整。';

  @override
  String get searchMatchTitle => '標題';

  @override
  String get searchMatchNextStep => '下一步';

  @override
  String get searchMatchStep => '步驟';

  @override
  String get searchMatchSummary => '摘要';

  @override
  String get searchMatchFromCapture => '來自擷取';

  @override
  String get studioSuggested => '為你最近一次擷取推薦';

  @override
  String get studioRecentlyUsed => '最近用過';

  @override
  String get studioReady => '已就緒';

  @override
  String get studioNotConnected => '未接上';

  @override
  String get studioHeroTitle => 'Action 智慧';

  @override
  String get studioConnectedBlurb => '讀懂一份文件、打磨一個目標、搭一個計畫、起草一封回覆，或核對眼前的東西。';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count 個用於讀懂文件、規劃與寫作的工具。接上你自己的 AI 帳號即可使用 —— 向你收費的是你的服務商，從來不是 Action。';
  }

  @override
  String get studioConnectAi => '接上 AI';

  @override
  String get studioHowItWorks => '運作方式';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '其中 $count 個現在就能用，不需要這些，完全在這台裝置上執行。',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => '在這台裝置上執行';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title。$description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title。$description 在這台裝置上執行。';
  }

  @override
  String get categoryUnderstand => '讀懂';

  @override
  String get categoryUnderstandBlurb => '弄明白手上的東西。';

  @override
  String get categoryPlan => '規劃';

  @override
  String get categoryPlanBlurb => '把它變成能動手做的事。';

  @override
  String get categoryCreate => '寫作';

  @override
  String get categoryCreateBlurb => '寫出來、改好、譯過去。';

  @override
  String get categoryExtract => '擷取重點';

  @override
  String get categoryExtractBlurb => '把要緊的資訊挑出來。';

  @override
  String get categoryVerify => '核對';

  @override
  String get categoryVerifyBlurb => '核對眼前的東西。';

  @override
  String get captureSheetTitle => '擷取內容';

  @override
  String get captureSheetSubtitle => '你不想通篇讀的東西，交給 Action。';

  @override
  String get captureTakePhoto => '拍一張照片';

  @override
  String get captureTakePhotoSubtitle => '眼前的信件、帳單或通知';

  @override
  String get captureChooseImage => '選一張圖片';

  @override
  String get captureChooseImageSubtitle => '這台裝置上已有的螢幕截圖或照片';

  @override
  String get capturePasteText => '貼上文字';

  @override
  String get capturePasteTextSubtitle => '一封郵件、一則訊息或一份通知';

  @override
  String get captureChoosePdf => '選一個 PDF';

  @override
  String get captureChoosePdfSubtitle => '你手上已有的對帳單、信件或表格';

  @override
  String get captureFootnote => '擷取的內容留在這台裝置上。在你開口之前，不會有任何連網分析。';

  @override
  String get captureCouldNotOpen => '打不開那個。換個方式試試。';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title。$subtitle';
  }

  @override
  String get stageReading => '讀取中';

  @override
  String get stageNeedsReview => '需核對';

  @override
  String get stageActionCreated => '已建立待辦';

  @override
  String get stageNoText => '找不到文字';

  @override
  String get stageCouldNotBeRead => '無法讀取';

  @override
  String get stageReadingPreview => '正在讀取文字…';

  @override
  String get stageFailedPreview => '這個在本裝置上無法讀取。';

  @override
  String get provenancePhoto => '從照片擷取';

  @override
  String get provenanceImage => '從圖片擷取';

  @override
  String get provenancePastedText => '從貼上的文字擷取';

  @override
  String get provenanceDocument => '以文件形式加入';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return '完成於 $when';
  }

  @override
  String metaOverdue(String date) {
    return '已逾期 · 原定 $date';
  }

  @override
  String get metaDueToday => '今天到期';

  @override
  String metaDueOn(String date) {
    return '$date 到期';
  }

  @override
  String get metaCreatedByYou => '你建立的';

  @override
  String get categoryPayment => '付款';

  @override
  String get categoryRenewal => '續期';

  @override
  String get categoryAppointment => '預約';

  @override
  String get categoryBooking => '訂位';

  @override
  String get categoryTravel => '出行';

  @override
  String get categoryDeadline => '截止日期';

  @override
  String get categoryResponse => '需要回覆';

  @override
  String get categoryDelivery => '配送';

  @override
  String get categoryDocument => '文件';

  @override
  String get categoryNoActionRequired => '無需處理';

  @override
  String get categoryUnsure => '不確定';

  @override
  String get errorEnterManually => '手動輸入';

  @override
  String get sourceWhatWeRead => '我們讀到的內容';

  @override
  String get sourceDelete => '刪除擷取';

  @override
  String get sourceGone => '那項擷取已經不在了。';

  @override
  String get sourceDeleteTitle => '刪除這項擷取？';

  @override
  String get sourceDeleteBody => '圖片以及從中讀出的文字會從本機移除。';

  @override
  String get sourceDeleteKeep => '保留';

  @override
  String get sourceOpenAction => '開啟待辦';

  @override
  String sourceOpenActions(int count) {
    return '開啟 $count 項待辦';
  }

  @override
  String get sourceCreateAnother => '再據此建立一項';

  @override
  String get sourceCreateAction => '據此建立一項待辦';

  @override
  String get sourceDoMore => '用它做更多事';

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
    return '來自 $format $size KB';
  }

  @override
  String get sourceTextFound => '找到文字';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines 行 · $ms ms';
  }

  @override
  String get sourceReadExplainer => '這是 Action 讀到的文字。據此做出的東西在下面。';

  @override
  String get sourceNotInterpreted =>
      '目前還沒有做任何解讀。Action 會建議拿它做什麼，在任何東西被建立之前由你確認。';

  @override
  String get sourceNoTextExplainer => '手寫字、光線極暗，或本機還讀不了的書寫系統，都可能出現這種情況。';

  @override
  String get sourceReadFailed => '這個讀不出來';

  @override
  String get sourceReadFailedReason => '文字辨識沒有走完。';

  @override
  String get sourceTryReadingAgain => '再讀一次';

  @override
  String get sourceTypeInstead => '改為自己輸入內容';

  @override
  String get sourceTypeWhatItSays => '把上面寫的內容打出來';

  @override
  String get sourceTypeHint => '日期、金額，以及要求做什麼。';

  @override
  String get sourceMadeFromThis => '由這項擷取做出的';

  @override
  String sourceMadeFromThisCount(int count) {
    return '由這項擷取做出 $count 項';
  }

  @override
  String get sourceTheDocument => '文件';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 頁',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => '頁數未知';

  @override
  String get sourceDocumentNotRead =>
      'Action 沒有讀過這份文件裡面的內容。當你執行需要讀它的工具時，檔案會送到你連接的 AI 供應方，並且會在傳送前告知你。';

  @override
  String get previewSaveFailed => '沒能儲存。請再試一次。';

  @override
  String get previewTitle => '核對擷取';

  @override
  String get previewImageFailed => '那張圖片打不開。';

  @override
  String get previewHint => '確認文字清晰可讀，重要部分沒有被截掉。';

  @override
  String get previewRetake => '重拍';

  @override
  String get pasteTitle => '貼上文字';

  @override
  String get pasteHint => '把你不想通篇讀的郵件、訊息或通知貼進來。';

  @override
  String get pasteFootnote => '含有日期、金額或某項請求的內容效果最好。';

  @override
  String get pasteEnough => '看起來夠用了。';

  @override
  String get pasteMore => '再多一點文字，結果會更好。';

  @override
  String get reviewLoadFailed => '這項擷取載入不出來。';

  @override
  String get reviewConfirmed => '已確認';

  @override
  String get reviewNeedsReview => '需要核對';

  @override
  String get reviewReview => '核對';

  @override
  String get reviewHighConfidence => '把握較大';

  @override
  String get reviewConfirmedByYou => '由你確認';

  @override
  String get reviewMissing => '缺少';

  @override
  String get reviewNotUnderstood => 'Action 沒能可靠地看懂這份來源裡足夠多的內容。';

  @override
  String get reviewNotUnderstoodBody => '擷取完好無損，什麼都沒丟。你可以自己填寫內容，來源也會繼續附著以供對照。';

  @override
  String get reviewEnterDetails => '填寫內容';

  @override
  String get reviewKeepSource => '把來源留著以後看';

  @override
  String reviewEngine(String engine) {
    return '引擎：$engine';
  }

  @override
  String get reviewManualNotice => '這項待辦是你自己建立的。只會用到你在這裡填的內容。';

  @override
  String get reviewUntitled => '未命名的待辦';

  @override
  String get reviewEditTitle => '編輯標題';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '確認之前，有 $count 項數值需要你核對。',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => '關鍵資訊';

  @override
  String get reviewNotFound => '沒找到';

  @override
  String get reviewSuggestedNextStep => '建議的下一步';

  @override
  String get reviewWhyThisMatters => '為什麼這件事要緊';

  @override
  String get reviewSteps => '步驟';

  @override
  String get reviewAddStep => '新增步驟';

  @override
  String get reviewInjectionNotice => '這份來源裡有些文字看起來像指令而不是文件資訊，所以 Action 沒有採用。';

  @override
  String get reviewLayoutNotice =>
      '這份文件的版面裡可能有一些對應關係，文字擷取沒能完整保留。確認之前請把下面的數值和來源比對一下。';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason 請把下面的數值和來源比對一下。';
  }

  @override
  String get reviewDeadline => '期限';

  @override
  String get reviewAmount => '金額';

  @override
  String get reviewLeftUnset => '沒有——你選擇了留空';

  @override
  String get reviewUnclear => '不清楚';

  @override
  String get reviewNotSet => '未設定';

  @override
  String get reviewNoDeadlineFound => '這份文件裡沒找到';

  @override
  String get reviewNoAmountFound => '這份文件裡沒找到金額';

  @override
  String get reviewMultipleDates => 'Action 找到了多個可能的日期。';

  @override
  String reviewMultipleDatesBody(int count) {
    return '有 $count 個日期可能是期限。選出正確的，輸入另一個，或者留空。';
  }

  @override
  String get reviewChooseDate => '選一個日期';

  @override
  String get reviewMultipleAmounts => 'Action 找到了不只一個可能的金額。';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '有 $count 個金額可能是這裡說的那個。選一個，輸入另一個，或者留空。';
  }

  @override
  String get reviewChooseAmount => '選一個金額';

  @override
  String get reviewSkipStep => '略過這一步';

  @override
  String get reviewKeepStep => '保留這一步';

  @override
  String get reviewEditStep => '編輯步驟';

  @override
  String get reviewCreateManually => '自己建立';

  @override
  String get reviewConfirmAndCreate => '確認並建立待辦';

  @override
  String get reviewFixHighlighted => '核對標出的欄位';

  @override
  String get reviewSaving => '正在儲存…';

  @override
  String get reviewSaveFailed => '這項待辦沒能儲存。什麼都沒丟——請再試一次。';

  @override
  String get reviewFieldTitle => '標題';

  @override
  String get reviewTitleHint => '需要做成什麼？';

  @override
  String get reviewNewStep => '新步驟';

  @override
  String get reviewStepHint => '要做什麼';

  @override
  String get reviewDatesConflict => '文件裡提到了不只一個日期。';

  @override
  String get reviewAmountsConflict => '文件裡提到了不只一個金額。';

  @override
  String get reviewAnotherDate => '另一個日期 — 2026-08-30';

  @override
  String get reviewBadDate => '這不是一個真實日期。請用 2026-08-30 的格式。';

  @override
  String get reviewTypeDate => '輸入一個日期，或者在下面留空。';

  @override
  String get reviewUseThisDate => '用這個日期';

  @override
  String get reviewLeaveNoDeadline => '不設期限繼續';

  @override
  String get reviewAnotherAmount => '另一個金額 — 780.00';

  @override
  String reviewAmountError(String reason) {
    return '這個金額用不了：$reason。';
  }

  @override
  String get reviewUseThisAmount => '用這個金額';

  @override
  String get reviewLeaveNoAmount => '不設金額繼續';

  @override
  String get reviewThisValue => '這個數值';

  @override
  String reviewQuote(String quote) {
    return '「$quote」';
  }

  @override
  String get reviewSeeOnCapture => '在擷取上查看';

  @override
  String get reviewViewSource => '查看來源';

  @override
  String get reviewFromSource => '來自來源';

  @override
  String get reviewNotVerified => '未比對';

  @override
  String get reviewCouldNotVerify => '沒能把這個和來源比對上。';

  @override
  String get reviewLooksRight => '看著沒問題';

  @override
  String get reviewStageReading => '正在讀取來源';

  @override
  String get reviewStageUnderstanding => '正在理解重要資訊';

  @override
  String get reviewStageChecking => '正在檢查哪些需要核對';

  @override
  String get reviewNothingToDo => '眼下你不需要做什麼。';

  @override
  String get reviewInformationOnly => '這看起來只是告知——沒有找到期限、付款或要求回覆。';

  @override
  String get reviewInformationOnlyWithSource =>
      '這看起來只是告知——這項擷取裡沒有找到期限、付款或要求回覆。';

  @override
  String get reviewSourceKept => '無論如何來源都會留著。';

  @override
  String get reviewAddAnyway => '仍然新增一項待辦';

  @override
  String get reviewActionConfirmed => '待辦已確認';

  @override
  String get reviewCreatedByYou => '由你建立。';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '根據 $count 條已核對的資訊，由你確認。',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '根據 $count 條已核對的資訊，由你確認。其中 $edited 條是你改過的。',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => '已儲存在本機。';

  @override
  String get detailLoadFailed => '這項待辦載入不出來。它仍然儲存在本機。';

  @override
  String get detailNotFoundTitle => '那項待辦已經不在了';

  @override
  String get detailNotFoundMessage => '可能已在本機刪除。';

  @override
  String get detailGoBack => '返回';

  @override
  String get detailMore => '更多';

  @override
  String get detailChangeUrgency => '變更緊急程度';

  @override
  String get detailAddRecommendedStep => '新增建議的步驟';

  @override
  String get detailEditRecommendedStep => '編輯建議的步驟';

  @override
  String get detailArchiveTitle => '封存這項待辦？';

  @override
  String get detailArchiveBody => '它會離開你的清單，但不會被刪除，擷取它的那份內容也會保留。';

  @override
  String get detailArchiveConfirm => '封存';

  @override
  String get detailArchived => '已封存';

  @override
  String detailCompletedOn(String date) {
    return '$date 完成';
  }

  @override
  String get detailSectionDetails => '詳細資料';

  @override
  String get detailSectionReminders => '提醒';

  @override
  String get detailAllStepsDone => '所有步驟已完成';

  @override
  String get detailNextEyebrow => '接下來';

  @override
  String get detailCompleteQuestion => '完成這項待辦？';

  @override
  String get detailMarkStepDone => '把步驟標為已完成';

  @override
  String get detailCompleteAction => '完成這項待辦';

  @override
  String get detailAddDeadline => '新增期限';

  @override
  String get detailAddAmount => '新增金額';

  @override
  String detailStepsProgress(int completed, int total) {
    return '已完成 $completed/$total';
  }

  @override
  String get detailNoStepsTitle => '還沒有步驟';

  @override
  String get detailNoStepsMessage => '把它拆成你真正要做的動作。';

  @override
  String get detailAddFirstStep => '新增第一個步驟';

  @override
  String detailStepCompletedSemantics(String title) {
    return '已完成的步驟：$title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return '下一個步驟：$title';
  }

  @override
  String detailStepSemantics(String title) {
    return '步驟：$title';
  }

  @override
  String detailMarkDone(String title) {
    return '把「$title」標為已完成';
  }

  @override
  String detailMarkNotDone(String title) {
    return '把「$title」標為未完成';
  }

  @override
  String get detailStepOptions => '步驟選項';

  @override
  String get detailMoveUp => '上移';

  @override
  String get detailMoveDown => '下移';

  @override
  String get detailDeleteStep => '刪除步驟';

  @override
  String get detailDateFormat => 'M月d日';

  @override
  String get detailDateFormatWithYear => 'yyyy年M月d日';

  @override
  String get stepDeleteTitle => '刪除這個步驟？';

  @override
  String get stepDeleteKeep => '保留';

  @override
  String get detailNoRemindersYet => '還沒有提醒。';

  @override
  String get detailReminderLimit => '一項待辦最多只能有這麼多提醒。刪掉一個才能再加一個。';

  @override
  String get detailAddReminder => '新增提醒';

  @override
  String get detailChangeReminder => '變更提醒';

  @override
  String get detailRemoveReminder => '刪除提醒';

  @override
  String get detailReminderFormat => 'M月d日 EEE HH:mm';

  @override
  String get reminderStatePending => '還未設定';

  @override
  String get reminderStateNotificationsOff => '已儲存，但通知是關閉的';

  @override
  String get reminderStateFailed => '沒能排上時間';

  @override
  String get reminderStateRemoving => '正在刪除…';

  @override
  String get reminderSetConfirmation => '提醒已設定。到時會提醒你。';

  @override
  String get reminderUpdatedConfirmation => '提醒已更新。';

  @override
  String get reminderNeedsPermission => '通知已關閉，所以這則提醒已儲存，但還不能通知你。';

  @override
  String get reminderScheduleFailed => '這則提醒已儲存，但 Android 沒有為它排上時間。';

  @override
  String get reminderLimitReached => '那項待辦的提醒數量已經到上限了。';

  @override
  String get reminderTimeInPast => '那個時間已經過去了。';

  @override
  String get reminderAddTitle => '新增提醒';

  @override
  String get reminderChangeTitle => '變更這則提醒';

  @override
  String get reminderDateLabel => '日期';

  @override
  String get reminderTimeLabel => '時間';

  @override
  String get reminderFieldDateFormat => 'yyyy年M月d日 EEE';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'M月d日EEEE';

  @override
  String get reminderPresetFormat => 'M月d日 HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return '將在 $date $time 提醒你。';
  }

  @override
  String get reminderTimePastError => '那個時間已經過去了。選一個更晚的。';

  @override
  String get reminderSet => '設定提醒';

  @override
  String get reminderPresetInHour => '1 小時後';

  @override
  String get reminderPresetTomorrowMorning => '明天早上';

  @override
  String get reminderPresetNextWeek => '下週';

  @override
  String get reminderPresetOnTheDay => '當天';

  @override
  String get reminderPresetDayBefore => '提前 1 天';

  @override
  String get reminderPresetWeekBefore => '提前 1 週';

  @override
  String get reminderPresetAtDeadline => '到期時';

  @override
  String get reminderPresetHourBefore => '提前 1 小時';

  @override
  String get editNextStepTitle => '建議的下一步';

  @override
  String get editNextStepSubtitle => '用一句話說清下一步該做什麼。';

  @override
  String get editNextStepHint => '下一步做什麼最有用？';

  @override
  String get editRemoveSuggestion => '刪除建議';

  @override
  String get editUrgencyTitle => '這件事有多急？';

  @override
  String get editStepHint => '一件具體要做的事';

  @override
  String get editAddStep => '新增步驟';

  @override
  String get editDateHint => 'YYYY-MM-DD';

  @override
  String get editRemoveDeadline => '刪除期限';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => '儲存金額';

  @override
  String get editRemoveAmount => '刪除金額';

  @override
  String get securityTitle => '安全與隱私';

  @override
  String get securitySectionProtection => '保護';

  @override
  String get securityAppLockUnavailable =>
      '應用程式鎖需要本機設有螢幕鎖。請先在裝置設定裡設定 PIN、圖形、密碼或指紋。';

  @override
  String get securityAppLockOn => 'Action 請你的裝置確認是你本人。';

  @override
  String get securityAppLockOff => '開啟 Action 時需要你的指紋、臉部或裝置 PIN。';

  @override
  String get securityAskAgain => '再次詢問';

  @override
  String get securityAskAgainDescription => 'Action 在背景停留多久後鎖定。';

  @override
  String get securityScreenPrivacy => '螢幕隱私';

  @override
  String get securityScreenPrivacyDescription =>
      '請求 Android 阻擋截圖與螢幕錄影，並在應用程式切換器中隱藏 Action。';

  @override
  String get securityPrivateReminders => '私密提醒';

  @override
  String get securityPrivateRemindersOn => '提醒只說有事在等你。';

  @override
  String get securityPrivateRemindersOff => '提醒會顯示待辦的標題。開啟這項可以讓它不出現在鎖定畫面上。';

  @override
  String get securityLockNow => '立即鎖定';

  @override
  String get securityLockNowDescription => '不用等，直接關門。';

  @override
  String get securitySectionStorage => '你的資料怎麼存';

  @override
  String get securityStorageDataLabel => '你的待辦、擷取和設定';

  @override
  String get securityStorageDataDetail =>
      '它們放在本應用程式自己的私有儲存區裡，其他應用程式讀不到，Android 會作為裝置加密的一部分加密它們。Action 沒有在上面再加一層自己的加密。';

  @override
  String get securityStorageKeyLabel => '你的 AI 供應方金鑰';

  @override
  String get securityStorageKeyDetail =>
      '存在 Android Keystore 裡，而不是和其他東西放在一起，儲存之後不會再顯示。';

  @override
  String get securityStorageGapLabel => '這些涵蓋不到的地方';

  @override
  String get securityStorageGapDetail =>
      '這些都擋不住有人拿著你已解鎖的裝置使用，被改動或已 root 的系統也能讀到比正常系統更多的東西。應用程式鎖是對前一種情況有幫助的那項設定。';

  @override
  String get securitySectionInformation => '你的資訊';

  @override
  String get securityWhereInfoDescription => '你的資料可能走的每條路，以及離開本機的那兩條。';

  @override
  String get securityAppLockRefused => '沒有確認，所以什麼都沒變。';

  @override
  String get securityAppLockUnavailableToast =>
      '本機沒有設定螢幕鎖。請在裝置設定裡新增 PIN、圖形、密碼或指紋，然後再試一次。';

  @override
  String get securityScreenPrivacyRefused => '本機沒有套用螢幕隱私，所以它保持關閉，而不是被顯示成已開啟。';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則已排程的提醒現在說得更少了。',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已更新 $count 則已排程的提醒。',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => '立即';

  @override
  String get appLockDelayOneMinute => '1 分鐘後';

  @override
  String get appLockDelayFiveMinutes => '5 分鐘後';

  @override
  String get securityDelayImmediatelyDescription => '每次 Action 離開畫面時';

  @override
  String get securityDelayOneMinuteDescription => '夠回一則訊息';

  @override
  String get securityDelayFiveMinutesDescription => '夠接一通電話';

  @override
  String get securityHeroProtected => '已保護';

  @override
  String get securityHeroNothingOn => '什麼都沒開';

  @override
  String get securityHeroFootnote => '這裡的一切都在本機執行。這些設定都不會被傳送到任何地方，也都不能被遠端更改。';

  @override
  String get securityHeadlineNone => '有三項保護可用';

  @override
  String securityHeadlineOne(String first) {
    return '$first 已開啟';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first 和 $second 已開啟';
  }

  @override
  String get securityHeadlineAll => '三項保護全部開啟';

  @override
  String get securityTransfersTitle => '有什麼離開了本機';

  @override
  String get securityTransfersNoProvider => '沒有連接 AI 供應方，所以根本沒有任何東西被送去分析。';

  @override
  String get securityTransfersDescription =>
      '在有東西被送出去的那一刻就記在這裡，不管有沒有回來。只記工具、供應方和大小——絕不記裡面是什麼。在本機保留 90 天，不傳往任何地方。';

  @override
  String get securityClear => '清除';

  @override
  String get securityNothingSent => '還沒有傳送過任何東西';

  @override
  String get securityNothingSentDescription => '當你執行用到你的 AI 供應方的工具時，它會列在這裡。';

  @override
  String get securityClearHistoryTitle => '清除這份紀錄？';

  @override
  String get securityClearHistoryBody => '關於傳送過什麼的紀錄會從本機刪除。這並不會收回任何已經送出去的東西。';

  @override
  String get securityUnnamedTool => '一個 Intelligence 工具';

  @override
  String get securityYourProvider => '你的 AI 供應方';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 頁',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個檔案',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => '一小段文字';

  @override
  String securityTransferCharacters(int count) {
    return '$count 千字元';
  }

  @override
  String securitySentTo(String provider) {
    return '已傳送至 $provider。';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '已傳送至 $provider · $size。';
  }

  @override
  String relativeWeeks(int count) {
    return '$count 週前';
  }

  @override
  String get helpTitle => '說明';

  @override
  String get helpAddQuestion => '我可以加入什麼？';

  @override
  String get helpAddAnswer => '一張截圖，一張信件或帳單的照片，或者你貼進來的文字。含有日期、金額或某項請求的內容效果最好。';

  @override
  String get helpReviewQuestion => 'Action 為什麼要我核對？';

  @override
  String get helpReviewAnswer =>
      '因為讀文件的機器可能讀錯，而一個悄悄弄錯的期限比沒有期限更糟。Action 會顯示它找到了什麼、來自哪些字，而且在你確認之前什麼都不會儲存。';

  @override
  String get helpVaryQuestion => '為什麼再試一次結果會變？';

  @override
  String get helpVaryAnswer =>
      '讀你文件的服務不是確定性的，所以同一項擷取可能回來得略有不同。核對這一步存在也正是因為這個——不變的那一部分是你。';

  @override
  String get helpLateQuestion => '我的提醒為什麼遲到了？';

  @override
  String get helpLateAnswer =>
      '提醒由 Android 排程，具體什麼時候送達由 Android 決定。省電、Doze 和廠商的電源設定都可能讓它延遲。Action 從不承諾分秒不差的提醒。';

  @override
  String get helpDataQuestion => '我的資料在哪裡？';

  @override
  String get helpDataAnswer =>
      '幾乎全都在本機：你的擷取、待辦、步驟、提醒和搜尋。兩個例外——你請 Action 讀的內容會送到讀它的 AI 服務，而一則已確認待辦的簡短紀錄可能以匿名識別碼存在雲端。設定裡的「隱私與資料」會準確列出那則紀錄包含什麼。';

  @override
  String get helpBackupQuestion => '這是備份嗎？';

  @override
  String get helpBackupAnswer =>
      '不是。雲端紀錄無法還原到新裝置，也沒有帳號可以登入。如果你解除安裝 Action 或遺失這台裝置，上面的資料就沒了。';

  @override
  String get helpCorrectQuestion => '我怎麼改一項待辦？';

  @override
  String get helpCorrectAnswer =>
      '開啟它，然後編輯任何欄位——標題、期限、金額或建議的下一步。步驟隨時可以新增、調整順序、完成和刪除。編輯一項待辦從不向 AI 服務詢問任何東西。';

  @override
  String get privacyTitle => '隱私與資料';

  @override
  String get privacyIntro => 'Action 盡量把一切都留在本機。有兩件事是例外，兩件都列在下面。';

  @override
  String get privacyGroupOnDevice => '在本機';

  @override
  String get privacyOnDeviceCaptures => '擷取——你加入的截圖、照片和文字，以及從中讀出的文字。';

  @override
  String get privacyOnDeviceActions => '待辦，及其步驟、要點和提醒。';

  @override
  String get privacyOnDeviceSearch => '搜尋。你的搜尋在這裡執行，從不傳往任何地方，關掉畫面後也不保留。';

  @override
  String get privacyOnDevicePhotoMetadata =>
      '照片儲存時不帶位置。手機寫進圖片裡的座標、時間和相機資訊，會在擷取被儲存之前移除，所以它們既不留在這裡，你把擷取傳給自己的 AI 供應方時也不會跟著走。';

  @override
  String get privacyGroupSentToRead => '送出去供閱讀';

  @override
  String get privacySentToReadWhat =>
      '當你請 Action 解讀一項擷取時，那份內容會傳送給讀它的 AI 服務。這不是在裝置上執行的 AI。';

  @override
  String get privacySentToReadWhen => '只傳送你選取的那一項擷取，而且只在你提出請求時。';

  @override
  String get privacyGroupYourProvider => '傳給你自己的 AI 供應方';

  @override
  String get privacyProviderWhat =>
      '如果你在設定裡連接了 AI 供應方，Intelligence 工具會用你自己的 API 金鑰，把你選取的內容傳給該供應方——OpenAI、Anthropic、Google 或你選定的 endpoint。';

  @override
  String get privacyProviderDirect => '它直接傳給他們。不經過任何屬於 Action 的伺服器。';

  @override
  String get privacyProviderScope =>
      '只傳送你為某個工具挑選的內容，而且只在你執行它時。你其他的待辦、擷取和來源永遠不會被一併帶上，背景也從不傳送任何東西。';

  @override
  String get privacyProviderKey =>
      '你的 API 金鑰保存在本機的安全儲存區中，而且只傳送給它所屬的那個供應方。對於拿到你已解鎖裝置的人來說，安全儲存區是一道真實的阻礙，但它並非絕對，Action 也不會宣稱相反。';

  @override
  String get privacyProviderLocalTools =>
      '有兩個工具從不傳送任何東西：隱去敏感資訊，以及查看檔案來自哪裡。兩者完全在本機執行。';

  @override
  String get privacyProviderAgreement =>
      '你的供應方拿你傳過去的東西做什麼，由你與他們的協議決定，而不是由 Action 決定。';

  @override
  String get privacyGroupCloud => '存在雲端';

  @override
  String get privacyCloudWhat =>
      '當你確認一項待辦時，它的一則簡短紀錄可能以這次安裝的匿名識別碼儲存下來：標題、狀態、緊急程度、類別、期限、金額、建議的下一步和時間戳記。';

  @override
  String get privacyCloudNotSent => '你的擷取、從中讀出的文字、一項待辦的步驟和要點，以及你的提醒，都不會被傳送。';

  @override
  String get privacyCloudNotBackup => '這不是備份。沒有辦法把它還原到新裝置，遺失這次安裝也會一併遺失那個匿名識別碼。';

  @override
  String get privacyGroupDiagnostics => '診斷';

  @override
  String get privacyDiagnosticsWhat =>
      'Action 記錄應用程式裡發生了什麼的匿名計數——某次擷取開始了，某次擷取內容成功或失敗，某次搜尋沒找到東西，某項待辦完成了。';

  @override
  String get privacyDiagnosticsCounts =>
      '這些是計數，不是內容。任何標題、金額、期限、編號、擷取到的文字或搜尋詞都不會被帶上，匿名識別碼以及待辦或擷取的任何識別碼也不會。';

  @override
  String get privacyDiagnosticsCrash =>
      '如果應用程式當掉，錯誤和發生的位置會被回報，以便修正。Action 不會把你的資料附在那些報告裡。';

  @override
  String get privacySectionYourData => '你的資料';

  @override
  String get privacyYourDataFootnote =>
      '清除擷取不會動你的待辦。擷取已經沒有的待辦照樣能用，只是不再顯示它是從哪來的。';

  @override
  String get privacyClearCaptures => '清除擷取';

  @override
  String get privacyClearCapturesDescription => '刪除每一項擷取及其圖片檔案。';

  @override
  String get privacyDeleteAll => '刪除我的所有資料';

  @override
  String get privacyDeleteAllDescription => '待辦、步驟、提醒、擷取，以及上面的雲端紀錄。';

  @override
  String get privacyClearCapturesTitle => '清除擷取？';

  @override
  String get privacyClearCapturesBody => '每一項擷取及其圖片都會從本機刪除。你的待辦完全保持原樣。';

  @override
  String get privacyCapturesDeleted => '擷取已刪除。';

  @override
  String get privacyCapturesPartlyDeleted => '有些擷取沒能刪除。其他什麼都沒有變動。';

  @override
  String get privacyDeleteAllTitle => '刪除你的所有資料？';

  @override
  String get privacyDeleteAllBody =>
      '這會刪除本機的每一項待辦、步驟、提醒和擷取，以及上面列出的雲端紀錄。無法復原，也沒有備份可以還原。';

  @override
  String get privacyDeleteEverything => '全部刪除';

  @override
  String get privacyDeletedAll => '全部已刪除。';

  @override
  String get privacyDeleteFailed => '你的資料未能刪除。';

  @override
  String get privacyDeletedUnverified =>
      '本機上的一切都已刪除。Action 沒能連上雲端確認那裡沒有殘留，會再檢查一次。';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '已刪除，$leftovers除外。';
  }

  @override
  String get privacyWillTryAgain => 'Action 會再試一次。';

  @override
  String get privacyCloudCheckIncomplete => 'Action 沒能查完雲端，會再試一次。';

  @override
  String get privacyLeftoverCaptures => '部分擷取';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則雲端紀錄',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first和$second';
  }

  @override
  String get privacyCloudDeleted => '雲端紀錄已刪除。';

  @override
  String get privacyCloudUnreachable => '仍然聯繫不上它們。Action 會再試一次。';

  @override
  String get privacyPendingTitle => '還需刪除';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '上次有 $count 則雲端紀錄聯繫不上。Action 會自己再試，你也可以現在重試。',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => '重試';

  @override
  String get evidenceTitle => '這是哪來的';

  @override
  String get evidenceUnverified =>
      'Action 沒能在讀到的文字裡找到這些詞，所以這個數值沒有比對過。在依賴它之前，請對照原件核實。';

  @override
  String get evidenceHighlighted => '這些詞出現在 Action 從這項擷取裡讀到的文字中，醒目標示顯示了位置。';

  @override
  String get evidenceNoRegion =>
      '這些詞出現在 Action 從這項擷取裡讀到的文字中。它沒能確定這些詞在圖片上的確切位置，也不會去猜。';

  @override
  String get evidenceInText => '這些詞出現在這項擷取所含的文字中。';

  @override
  String get sourceCapturedAtFormat => 'M月d日 HH:mm';

  @override
  String get urgencyCritical => '緊要';

  @override
  String get urgencyImportant => '重要';

  @override
  String get urgencyNormal => '一般';

  @override
  String get urgencyLow => '較低';

  @override
  String get urgencyUnsure => '說不準';
}
