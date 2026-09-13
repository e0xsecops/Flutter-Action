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
      '有些工具从不发送任何东西：隐去敏感信息、查看文件来自哪里、找出凭据以及查看链接，全都完全在本机运行。';

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

  @override
  String get detailSaveFailed => '没能保存。什么都没丢——请再试一次。';

  @override
  String get detailSectionCreatedFrom => '创建自';

  @override
  String get detailSourceChecking => '正在查找原始采集…';

  @override
  String get detailSourceUnavailable => '原始采集已经找不到了。';

  @override
  String get detailReopenAction => '重新打开这项待办';

  @override
  String get detailMarkActionComplete => '把这项待办标为已完成';

  @override
  String get detailGetHelp => '就这项待办获得帮助';

  @override
  String get detailSectionHistory => '历史';

  @override
  String get detailHistoryShowLess => '收起';

  @override
  String detailHistoryShowAll(int count) {
    return '显示全部 $count 条';
  }

  @override
  String get detailHistoryCreated => '已创建';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '创建时带有 $count 个步骤',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => '你确认了这些内容';

  @override
  String detailHistoryStepFinished(String title) {
    return '完成了“$title”';
  }

  @override
  String get detailHistoryAStep => '某个步骤';

  @override
  String get detailHistoryReminderSet => '你设了一条提醒';

  @override
  String detailHistoryReminderSetFor(String when) {
    return '你设了一条 $when 的提醒';
  }

  @override
  String get detailHistoryCompleted => '标为已完成';

  @override
  String get detailHistoryChanged => '最后一次改动';

  @override
  String get detailHistoryTimestampFormat => 'yyyy年M月d日 HH:mm';

  @override
  String get aiProviderCustom => '自定义（兼容 OpenAI）';

  @override
  String get aiCapabilityText => '文字';

  @override
  String get aiCapabilityImages => '图片';

  @override
  String get aiCapabilityDocuments => '文档';

  @override
  String get aiCapabilityStructuredResults => '结构化结果';

  @override
  String get aiCapabilityStreaming => '流式输出';

  @override
  String get aiCapabilitySystemInstructions => '系统指令';

  @override
  String get aiCapabilityEvidenceCitations => '原文出处引用';

  @override
  String get aiCapabilityLongDocuments => '整份长文档';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a、$b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a或$b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head或$last';
  }

  @override
  String get aiFailureNotConfigured => '接入一个 AI 提供方后即可使用这个工具。';

  @override
  String get aiFailureInvalidKey => '提供方没有接受那个 API 密钥。';

  @override
  String get aiFailureQuotaExceeded => '你在提供方那里的账号余额已经用完，或者已经达到配额。';

  @override
  String get aiFailureRateLimited => '你的提供方正在限制请求频率。请稍后再试。';

  @override
  String get aiFailureNetworkUnavailable => 'Action 没能连上你的 AI 提供方。请检查你的网络连接。';

  @override
  String get aiFailureUnsupportedModel => '那个模型对你的密钥不可用。请在设置中另选一个。';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return '你选的模型读不了$capabilities。请在设置中另选一个模型。';
  }

  @override
  String get aiFailureContextTooLarge => '那些内容太多了，这个模型没法一次读完。';

  @override
  String get aiFailureInputTooLargeText => '那段文字超出了一次能分析的量。';

  @override
  String get aiFailureProviderUnavailable => '你的 AI 提供方出了问题。请稍后再试。';

  @override
  String get aiFailureMalformedResponse => '那个提供方回传了 Action 读不了的东西。';

  @override
  String get aiFailureCancelled => '已停止。';

  @override
  String get aiFailureInsecureEndpoint => '那个 endpoint 必须是 https:// 地址。';

  @override
  String get aiFailureUnknown => '跟你的 AI 提供方沟通时出了点问题。';

  @override
  String get appLockTitle => 'Action 已锁定';

  @override
  String get appLockPrompt => '确认是你本人才能继续。Action 请你的设备来确认——它从不会看到你的指纹、面容或 PIN。';

  @override
  String get appLockUnlocking => '正在解锁…';

  @override
  String get appLockNotConfirmed => '那次没有得到确认。准备好了再试一次。';

  @override
  String get appLockCannotConfirm => '你的设备现在无法确认是你本人。请在设备设置里检查屏幕锁是否还在。';

  @override
  String get appLockWaiting => '正在等待…';

  @override
  String get appLockUnlock => '解锁';

  @override
  String get appLockReasonUnlock => '解锁 Action';

  @override
  String get appLockReasonEnable => '确认是你本人，然后开启应用锁';

  @override
  String get appLockReasonDisable => '确认是你本人，然后关闭应用锁';

  @override
  String get todayCapabilityHeading => 'Action 能处理什么';

  @override
  String get todayCapabilityDocumentTitle => '一封信或一张账单';

  @override
  String get todayCapabilityDocumentBlurb => 'Action 读它，找出期限、金额和参考编号。';

  @override
  String get todayCapabilityScreenshotTitle => '一张截屏';

  @override
  String get todayCapabilityScreenshotBlurb => '把一条本来会被你忘掉的消息，变成一件你能着手去做的事。';

  @override
  String get todayCapabilityTextTitle => '一段文字';

  @override
  String get todayCapabilityTextBlurb => '粘贴任何东西。Action 会判断出它是什么，以及它要求你做什么。';

  @override
  String get todayCapabilityConfirmTitle => '一切都由你确认';

  @override
  String get todayCapabilityConfirmBlurb => '在你看过原文出处并点头之前，什么都不会变成一项待办。';

  @override
  String get todayCapabilityExploreIntelligence => '探索智能';

  @override
  String get documentRejectedEmpty => '那个文件是空的。';

  @override
  String documentRejectedTooLarge(String size) {
    return '那份文档有 $size，超过了 Action 能处理的大小。';
  }

  @override
  String get documentRejectedNotAPdf => '不管它叫什么名字，那都不是 PDF。Action 能读 PDF 和图片。';

  @override
  String get documentRejectedUnreadable => '那份文档读不出来。';

  @override
  String get pdfRejectedNotAPdf => '不管它叫什么名字，那个文件都不是 PDF。';

  @override
  String get pdfRejectedEncrypted => '那个 PDF 有密码保护，所以 Action 读不了它。';

  @override
  String get pdfRejectedDamaged => '那个 PDF 读不出来。它可能是不完整的。';

  @override
  String get shareRejectedEmpty => '那次分享里没有可读的东西。';

  @override
  String get shareRejectedUnsupportedType => 'Action 能接收文字、图片和 PDF。那是别的东西。';

  @override
  String get shareRejectedContentMismatch => '那个文件不是它自称的那种文件，所以 Action 没有打开它。';

  @override
  String get shareRejectedTooLarge => '那个文件太大，Action 处理不了。';

  @override
  String get shareRejectedUnreadable => '那个文件读不出来。';

  @override
  String get captureFailureRecognition => '文字识别没能运行。';

  @override
  String get captureFailureImageFormat => '那种图片格式在这台设备上读不了。';

  @override
  String get connectSheetTitle => '接入你的 AI';

  @override
  String get connectSheetSubtitle =>
      '你用自己的提供方账号和 API 密钥。Action 把密钥存在这台设备的安全存储里。';

  @override
  String get connectErrorKeyMissing => '粘贴你的 API 密钥才能继续。';

  @override
  String get connectErrorModelMissing => '选一个模型，或者自己输入模型 id。';

  @override
  String get connectErrorEndpointMissing => '填上你的 endpoint 地址。';

  @override
  String get connectErrorSecureStorageUnavailable => '这台设备的安全存储打不开，所以密钥没有保存。';

  @override
  String get connectTestSucceeded => '已接入。';

  @override
  String connectTestSucceededWithModels(int count) {
    return '已接入。有 $count 个模型可用。';
  }

  @override
  String get connectProviderLabel => '提供方';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      '必须是 https:// 地址。Action 不会通过未加密的连接发送你的文档。';

  @override
  String get connectApiKeyLabel => 'API 密钥';

  @override
  String get connectApiKeyHint => '粘贴你的密钥';

  @override
  String get connectKeyPrivacyNote =>
      '你的密钥留在这台设备上。除了你选定的那个提供方，Action 从不把它发往任何地方，而且保存之后无法再显示给你看。';

  @override
  String get connectModelLabel => '模型';

  @override
  String get connectModelIdHint => '模型 id';

  @override
  String get connectModelFreeTextNote =>
      '提供方会淘汰旧的模型 id，也会加上新的。如果你要的那个不在列表里，就在这里自己输入。';

  @override
  String get connectAndTest => '接入并测试';

  @override
  String get connectSaveWithoutTesting => '不测试，直接保存';

  @override
  String get toolWarningFactsNotChecked => 'Action 没能把这个和原文比对，所以里面的金额和日期没有核对过。';

  @override
  String get toolTitleRewrite => '改进这段文字';

  @override
  String get toolDescriptionRewrite => '更清楚、更简短，或更商务——事实原样保留。';

  @override
  String get toolModeRewriteClearer => '更清楚';

  @override
  String get toolModeRewriteProfessional => '更商务';

  @override
  String get toolModeRewriteShorter => '更简短';

  @override
  String get toolModeRewritePersuasive => '更有说服力';

  @override
  String get toolModeRewriteSimpler => '更好懂';

  @override
  String get toolModeRewriteStructured => '更有条理';

  @override
  String get toolModeRewriteGrammarOnly => '只改语法';

  @override
  String get toolSectionWhatChanged => '改了什么';

  @override
  String get toolSectionNote => '备注';

  @override
  String get toolSectionAlreadyClearBody => '这段本来就已经很清楚了。下面的改动很小。';

  @override
  String get toolSectionImprovedText => '改进后的文字';

  @override
  String get toolTitleDraftReply => '起草一封回复';

  @override
  String get toolDescriptionDraftReply => '一封你可以自己修改、自己发送的回复。';

  @override
  String get toolModeReplyProfessional => '商务';

  @override
  String get toolModeReplyConcise => '简短';

  @override
  String get toolModeReplyFriendly => '友好';

  @override
  String get toolModeReplyFormal => '正式';

  @override
  String get toolModeReplyClarification => '请对方说明清楚';

  @override
  String get toolModeReplyConfirmation => '确认收到';

  @override
  String get toolModeReplyDispute => '对此提出异议';

  @override
  String get toolSectionSubject => '主题';

  @override
  String get toolSectionDraftReply => '回复草稿';

  @override
  String get toolSectionPlaceholders => '这些需要你填上';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return '草稿 —— $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      '这是一份草稿。Action 不发送任何东西——请你自己读一遍、自己改一改，再自己发出去。';

  @override
  String get toolTitleTranslate => '翻译';

  @override
  String get toolDescriptionTranslate => '换成另一种语言，数字和名称原样保留。';

  @override
  String get toolSectionTranslation => '译文';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '从$from译成$to';
  }

  @override
  String get toolSectionKeptInOriginal => '保留原文未译';

  @override
  String get toolWarningTranslationNotCertified => '这是供你理解用的译文，不是经认证的翻译件。';

  @override
  String get toolTitleStructuredData => '提取一张表格';

  @override
  String get toolDescriptionStructuredData => '可以复制出来的行、字段和数字。';

  @override
  String get toolSectionTable => '表格';

  @override
  String get toolSectionFields => '字段';

  @override
  String get toolSectionTableCsv => '表格 (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      '这张表格的分列方式没能可靠地读出来。使用之前，请检查每一行是否对得上。';

  @override
  String get toolTitleDeadlineFinder => '找出期限';

  @override
  String get toolDescriptionDeadlineFinder => '有什么要做、什么时候到期，以及没做会怎样。';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个期限',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => '没有到期的';

  @override
  String get toolSectionNothingDueBody => 'Action 在这份材料里没有找到期限或义务。';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      '在你选定之前，什么都不会被排期。提醒从不会自动设置。';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return '如果没做：$consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return '你需要：$items';
  }

  @override
  String get moneyErrorEmpty => '没有给出金额';

  @override
  String get moneyErrorMalformed => '金额不是一个纯数字';

  @override
  String get moneyErrorNegative => '负数的金额不是一笔应付的款项';

  @override
  String get moneyErrorTooManyDecimals => '小数位比这种货币本身的位数还多';

  @override
  String get moneyErrorUnsupportedCurrency => '这个货币代码我们不认识';

  @override
  String get moneyErrorOutOfRange => '金额大得不合常理';

  @override
  String get escalationOcrFailed => '对这项采集，识别根本没能运行。';

  @override
  String get escalationNoTextRecognised => '这看起来是一份文档，但没有识别出任何文字。';

  @override
  String get escalationThinText => '按这份文档的篇幅来说，识别出来的文字太少了。';

  @override
  String get escalationLowLineConfidence => '识别器报告说有好几行的置信度偏低。';

  @override
  String get escalationTableLikeLayout => '这个版式看起来是一张表格，而逐行读取会丢掉哪个数值属于哪一行。';

  @override
  String get escalationFragmentedLayout => '文字是以很多细碎的片段返回的，所以结构不清楚。';

  @override
  String get escalationMalformedText => '识别出来的文字有很大一部分不是能读通的词或数字。';

  @override
  String get escalationConflictingDates => '不止一个日期被写成了期限。';

  @override
  String get escalationConflictingAmounts => '不止一个金额被写成了应付的款项。';

  @override
  String get escalationUnresolvedGrounding => '有些数值没能和文档里的文字比对上。';

  @override
  String get escalationInstructionLikeContent =>
      '这份文档里有些文字写得像是给应用的指令。它被当作文档内容处理，绝不会当作指令。';

  @override
  String get providerFailureNetwork => 'Action 没能连上那项服务。请检查你的网络连接。';

  @override
  String get providerFailureTimedOut => '那项服务太久没有给出回应。';

  @override
  String get providerFailureServiceUnavailable => '那项服务暂时用不了。请稍后再试。';

  @override
  String get providerFailureUnauthorized => '这个应用目前没有获得使用那项服务的授权。';

  @override
  String get providerFailureBlocked => '那项服务拒绝处理这份文档。';

  @override
  String get providerFailureUnknown => 'Action 没能读出这份文档。再试一次可能会成功。';

  @override
  String get reviewBlockerTitle => '给这项待办起个标题。';

  @override
  String get reviewBlockerDate => '选出哪个日期才是真正的期限，或者留空。';

  @override
  String get reviewBlockerAmount => '选出哪个金额是对的，或者留空。';

  @override
  String get reviewBlockerStepTitle => '你保留的步骤需要有标题。';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: '第 $page 页',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return '第 $start–$end 页';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '改写后的结果里已经没有 $values 了。使用之前请先核对。',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '改写后的结果里已经没有 $values，另外还有 $count 项也没有了。使用之前请先核对。',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => '、';

  @override
  String get goalStatusReached => '已达成';

  @override
  String get goalNewSheetTitle => '你希望发生什么？';

  @override
  String get goalNewSheetSubtitle => '一句话就够了。细节可以之后再补。';

  @override
  String get goalTitleHint => '续保车险，别多花钱。';

  @override
  String get goalCreateAction => '创建目标';

  @override
  String get goalTitleSheetTitle => '你想要什么';

  @override
  String get goalOutcomeSheetTitle => '做成了是什么样';

  @override
  String get goalContextSheetTitle => '现在的情况';

  @override
  String get goalOutcomeHint => '车险已经续上，材料也交了。';

  @override
  String get goalContextHint => '我拿到了两份报价，续保日期是 18 号。';

  @override
  String get goalWorkspaceTitle => '目标';

  @override
  String get goalUnmarkReached => '其实还没达成，撤销这个标记';

  @override
  String get goalMarkReached => '标为已达成';

  @override
  String get goalNotFound => '那个目标已经不在了。';

  @override
  String get goalDeleteTitle => '删除这个目标？';

  @override
  String get goalDeleteBody => '这个目标会从本机移除。由它做出的待办完全保持原样。';

  @override
  String get goalOutcomeLabel => '做成了是什么样';

  @override
  String get goalOutcomeEmpty => '还没有写。说清楚做完是什么样，目标会更好规划。';

  @override
  String get goalContextLabel => '现在的情况';

  @override
  String get goalContextEmpty => '还什么都没写。到目前为止发生了什么，以及什么挡在路上。';

  @override
  String get goalTitleLabel => '你想要什么';

  @override
  String get goalEditTooltip => '编辑目标';

  @override
  String get goalToolsLabel => 'Action 能做什么';

  @override
  String get goalToolsNotReady => '把你想要的再多写一点，这些工具才有东西可用。';

  @override
  String get toolGoalOptimizerTitle => '打磨一个目标';

  @override
  String get toolActionPlanTitle => '搭一个计划';

  @override
  String get resultFactUnconfirmed => '未确认';

  @override
  String get resultSuggestedSteps => '建议的步骤';

  @override
  String get resultSuggestedAction => '建议的待办';

  @override
  String get resultWorthAsking => '值得问一问';

  @override
  String get resultSuggestedDeadlines => '建议的期限';

  @override
  String get resultSuggestions => '建议';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条原文引用',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => '来自你选的那份来源';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source、$page';
  }

  @override
  String get toolRunStagePreparing => '正在准备你的文档';

  @override
  String get toolRunStageReading => '正在读取你选的那些页';

  @override
  String get toolRunStageAnalysing => '正在分析';

  @override
  String get toolRunStageBuilding => '正在整理你要核对的内容';

  @override
  String get toolRunStageDone => '已完成';

  @override
  String get toolRunStageFailed => '那次没有走完';

  @override
  String get toolRunStageCancelled => '已由你停止';

  @override
  String get toolRunFailureLocalCheckFailed => '那次检查没能完成。';

  @override
  String get toolRunFailureProviderRetired => '这个版本已经不再支持那个 AI 提供方。';

  @override
  String get toolRunFailureUnusableReply => '那次回复的形式没法使用，里面的内容一点也没有采用。请再试一次。';

  @override
  String get toolRunFailureQuestionRequired => '先输入一个问题。';

  @override
  String get toolRunFailureInputRequired => '选点东西让这个工具来处理。';

  @override
  String get toolWarningReplyTruncated => '这次回复中途被截断了，所以看到的内容可能不完整。';

  @override
  String get toolWarningNoSupportingQuotes =>
      '你的模型没有返回任何原文引用，所以这里的内容全都没有原文出处。据此行动之前，请对照文档核对。';

  @override
  String get aiSettingsRemoveTitle => '移除这个连接？';

  @override
  String get aiSettingsRemoveBody =>
      'Action 会从这台设备上删除你的 API 密钥，并停止使用 AI 功能。你在提供方那里的账号不受影响。';

  @override
  String get aiSettingsProviderLabel => '提供方';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      '你用了多少，由你的提供方向你收费。Action 从不自己发起请求。';

  @override
  String get aiSettingsConnectLabel => '接入一个 AI 提供方';

  @override
  String get aiSettingsConnectDescription =>
      '用你自己的账号和 API 密钥，连接 OpenAI、Anthropic、Google Gemini，或任何兼容的 endpoint。';

  @override
  String get aiSettingsModelLabel => '模型';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API 密钥';

  @override
  String get aiSettingsKeyStored => '保存在这台设备的安全存储里。';

  @override
  String get aiSettingsKeyMissing => '这台设备上没有找到密钥。重新接入一次才能加上。';

  @override
  String get aiSettingsTestLabel => '测试连接';

  @override
  String get aiSettingsProviderUnavailable => '那个提供方在这个版本里用不了。';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return '已接入。有 $count 个模型可用。';
  }

  @override
  String get aiSettingsTestButton => '测试';

  @override
  String get aiSettingsChangeProvider => '更换提供方或模型';

  @override
  String get aiSettingsRemoveKey => '删除密钥';

  @override
  String get aiSettingsSectionPrivacy => '隐私';

  @override
  String get aiSettingsWhatGetsSentLabel => '发送的是什么';

  @override
  String get aiSettingsWhereItGoesLabel => '它去哪里';

  @override
  String get aiSettingsWhereItGoesNoProvider => '在你接入提供方之前，什么都不会发送。';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return '直接发给 $provider，用的是你的密钥。不经过任何属于 Action 的服务器。';
  }

  @override
  String get aiSettingsSectionData => '数据';

  @override
  String get aiSettingsDataFootnote => 'Action 记住你用过哪些工具，绝不记住你用它们处理了什么。';

  @override
  String get aiSettingsRecentToolsLabel => '最近用过的工具';

  @override
  String get aiSettingsRecentToolsNone => '没有';

  @override
  String get reminderNotificationTitle => 'Action 提醒';

  @override
  String get reminderNotificationPrivateBody => '有件事等着你处理。';

  @override
  String get reminderChannelName => 'Action 提醒';

  @override
  String get reminderChannelDescription => '你自己为你的待办设置的提醒。';

  @override
  String get onboardingStart => '开始使用 Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return '第 $current 步，共 $total 步';
  }

  @override
  String get onboardingCaptureTitle => '把信息变成待办';

  @override
  String get onboardingCaptureBody =>
      '添加一张截屏、一张照片，或别人发给你的文字。Action 会读它，并判断出它要求你做什么。';

  @override
  String get onboardingReviewTitle => '在你确认之前，什么都不会被保存';

  @override
  String get onboardingReviewBody =>
      'Action 会显示它找到了什么，以及这些内容来自哪些字。有错的地方由你改。在你确认之前，它只是一条建议——不是事实，也不是一项待办。';

  @override
  String get onboardingTrackingTitle => '对要紧的事心里有数';

  @override
  String get onboardingTrackingBody =>
      '“需要处理”会把已经逾期或快要到期的排到前面。每一项待办都带着它的下一步、它的进度，以及你为它设的提醒。';

  @override
  String get onboardingPrivacyBody => '开始之前，有几件事值得你知道：';

  @override
  String get onboardingPrivacyOnDevice => '你的待办、采集、提醒和搜索都存在这台设备上。搜索和提醒不联网也能用。';

  @override
  String get onboardingPrivacySentToRead =>
      '当你请 Action 解读什么东西时，那份内容会发送给解读它的 AI 服务。';

  @override
  String get onboardingPrivacyCloud =>
      '一项已确认待办的简短记录——它的标题、日期、金额和建议的步骤——可能会以这台设备的匿名标识保存到云端。你的采集、步骤和提醒不会。';

  @override
  String get onboardingPrivacyNotBackup => '那条记录不是备份。它无法把任何东西恢复到新设备上。';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个卡点',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => '也许可以更简单';

  @override
  String get toolDescriptionGoalOptimizer => '缺了什么、卡在哪里，以及先做什么。';

  @override
  String toolSectionStepDependsOn(String step) {
    return '需先完成：$step';
  }

  @override
  String get toolSectionThePlan => '这个计划';

  @override
  String get toolDescriptionActionPlan => '一组有先后顺序的步骤，你可以把它们变成待办。';

  @override
  String get toolTitleSmartChecklist => '列一份清单';

  @override
  String get toolDescriptionSmartChecklist => '这份材料要求你做的事，按先后顺序排好。';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 处没找到的细节',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => '这几处互相矛盾';

  @override
  String get toolTitleMissingInformation => '找出缺失的信息';

  @override
  String get toolDescriptionMissingInformation => '有哪些空缺，以及该就此去问什么。';

  @override
  String get aiAdapterTimedOut => '那次请求太久了，已经被停止。';

  @override
  String get aiAdapterSecureConnectionFailed => '与你的 AI 提供方之间的安全连接没有建立成功。';

  @override
  String get aiAdapterModelOrEndpointNotFound => 'Action 没有找到那个模型或 endpoint。';

  @override
  String get aiAdapterRequestRejected => '你的 AI 提供方拒绝了那个请求。';

  @override
  String get aiAdapterSecureStorageUnavailable => 'Action 打不开这台设备的安全存储。';

  @override
  String get aiAdapterEndpointMissing => '在设置里填上你的 AI endpoint 地址。';

  @override
  String get aiAdapterReplyIncomplete => '那次回复不完整，没有内容可用。请再试一次。';

  @override
  String get aiAdapterContentDeclined => '你的提供方拒绝处理那份内容。';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return '那一次超过了 $limit 个文件。请少选一些。';
  }

  @override
  String get aiAdapterImageTooLarge => '那些图片里有一张太大，没法分析。';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '“$filename”太大，没法分析。上限是 $limit MB。';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '“$filename”有 $count 页。Action 一次最多读 $limit 页——请选一个页码范围。';
  }

  @override
  String get aiAdapterSelectionTooLarge => '你选的内容太多，没法在一次请求里发送。';

  @override
  String get toolRunNotAvailableTitle => '那个工具用不了';

  @override
  String get toolRunNotAvailableMessage => '它可能在较新的 Action 版本里被移除了。';

  @override
  String get toolRunNoSourcesYet => '还没有可处理的东西。采集点什么，或者在下面粘贴一些文字。';

  @override
  String get toolRunChooseSourcesToCompare => '选择要对比的内容';

  @override
  String get toolRunChooseSource => '选择一项来源';

  @override
  String get toolRunQuestionLabel => '你的问题';

  @override
  String get toolRunQuestionHint => '期限是什么时候？';

  @override
  String get toolRunFreeTextLabel => '或者粘贴一段文字';

  @override
  String get toolRunFreeTextHint => '在这里粘贴或输入';

  @override
  String get toolRunModeLabel => '风格';

  @override
  String get toolRunRunLocally => '在这台设备上检查';

  @override
  String get toolRunRun => '运行';

  @override
  String get toolRunStop => '停止';

  @override
  String get toolRunRunAgain => '再运行一次';

  @override
  String get toolRunWorkingOn => '正在处理：';

  @override
  String toolRunFirstUseTitle(String provider) {
    return '把这些发送给 $provider 吗？';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return '你选中的内容会用你的 API 密钥发送给 $provider 处理。';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      '你的密钥留在这台设备上。Action 不会在后台发送任何东西，也不会发送你其他的待办或来源。';

  @override
  String get toolRunScopeTitle => '在运行之前';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '将通过你的 $provider 连接分析 $count 页。',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '将通过你的 $provider 连接分析 $count 个文件。',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return '你选中的那段文字会发送到你的 $provider 连接。';
  }

  @override
  String get toolRunNeedsProviderTitle => '接入一个 AI 提供方即可使用这个工具';

  @override
  String get toolRunNeedsProviderBody => '你用的是你自己的提供方账号和 API 密钥。';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已根据 $count 个步骤创建一项待办。',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已添加 $count 个步骤。',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个步骤',
    );
    return '创建一项待办 · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个步骤',
    );
    return '添加到这项待办 · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => '照片';

  @override
  String get sourceTypeLabelScreenshot => '截屏';

  @override
  String get sourceTypeLabelPastedText => '粘贴的文字';

  @override
  String get sourceTypeLabelDocument => '文档';

  @override
  String get toolModeClearer => '更清楚';

  @override
  String get toolModeMoreProfessional => '更商务';

  @override
  String get toolModeShorter => '更简短';

  @override
  String get toolModeSimpler => '更好懂';

  @override
  String get toolModeMoreStructured => '更有条理';

  @override
  String get toolModeMorePersuasive => '更有说服力';

  @override
  String get toolModeGrammarOnly => '只改语法';

  @override
  String get toolModeProfessional => '商务';

  @override
  String get toolModeConcise => '简短';

  @override
  String get toolModeFriendly => '友好';

  @override
  String get toolModeFormal => '正式';

  @override
  String get toolModeAskForClarification => '请对方说明清楚';

  @override
  String get toolModeConfirm => '确认收到';

  @override
  String get toolModeDispute => '对此提出异议';

  @override
  String get toolModeQuick => '速览';

  @override
  String get toolModeDetailed => '详尽';

  @override
  String get toolModeExecutive => '给决策者';

  @override
  String get toolModeKeyPoints => '要点';

  @override
  String get toolModeActionFocused => '侧重待办';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 处引用的细节没能在你选中的内容里找到，所以它们被标为不确定。',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action 没能把这些引文拿去和文件本身比对，所以它们没有比对过。';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已逾期 · $count 天',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => '明天到期';

  @override
  String get triageBadgeReminderSoon => '提醒将至';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已逾期 $count 天',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status。$title';
  }

  @override
  String get triageExplanationDone => '这项已经完成了。';

  @override
  String get triageExplanationNothingPressing => '它在这里，是因为目前它还没有什么急迫的地方。';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return '这项需要留意，因为$reason。';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return '这项排在靠下的位置，因为$reason。';
  }

  @override
  String get triageReasonOverdue => '它已经逾期';

  @override
  String get triageReasonDeadlinePassed => '它的期限已经过了';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '它已经逾期 $count 天',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => '它今天到期';

  @override
  String get triageReasonCriticalDueSoon => '你把它标成了紧要，而且它的期限快到了';

  @override
  String get triageReasonAllStepsDone => '每个步骤都已完成——它只差最后收尾';

  @override
  String get triageReasonDueTomorrow => '它明天到期';

  @override
  String get triageReasonReminderSoon => '你为它设了一条将在一天之内到点的提醒';

  @override
  String get triageReasonDueWithinThreeDays => '它将在三天内到期';

  @override
  String get triageReasonCriticalNoDeadline => '你把它标成了紧要，而且它没有期限';

  @override
  String get triageReasonDueWithinSevenDays => '它将在一周内到期';

  @override
  String get triageReasonImportant => '你把它标成了重要';

  @override
  String get triageReasonDueLater => '它的期限还更远一些';

  @override
  String get triageReasonNoDeadline => '它没有期限，也没有什么急迫的地方';

  @override
  String cardCompletedTooltip(String title) {
    return '已完成：$title';
  }

  @override
  String get toolTitleDocumentIntelligence => '读懂这份文档';

  @override
  String get toolDescriptionDocumentIntelligence => '它是什么、哪些要紧，以及该怎么办。';

  @override
  String get toolSectionWhatThisIs => '这是什么';

  @override
  String get toolSectionWhatMatters => '哪些要紧';

  @override
  String get toolSectionKeyDetails => '关键细节';

  @override
  String get toolTitleAskDocument => '就一项采集提问';

  @override
  String get toolDescriptionAskDocument => '答案只出自你选中的内容——找不到就什么都不给。';

  @override
  String get toolSectionNoAnswer => '这份材料里没有找到答案';

  @override
  String get toolSectionNoAnswerBody => 'Action 没能在你选中的那份文档里找到这个。';

  @override
  String get toolSectionAnswer => '答案';

  @override
  String get toolSectionFromTheDocument => '摘自这份文档';

  @override
  String get toolWarningQuoteNotFound => '这个答案所依据的引文不在你选中的材料里。请把这个答案当作不可靠的。';

  @override
  String get toolTitleSmartSummary => '做一份摘要';

  @override
  String get toolDescriptionSmartSummary => '简短的那一版——或者只讲与你要做的事有关的那一版。';

  @override
  String get toolSectionKeyPoints => '要点';

  @override
  String get toolTitleCompareDocuments => '对比多份文档';

  @override
  String get toolDescriptionCompareDocuments => '有什么变了、哪里相互矛盾、哪些内容没有找到。';

  @override
  String get toolSectionWhatDiffers => '有什么不同';

  @override
  String get toolSectionConflicts => '相互矛盾之处';

  @override
  String get toolSectionOnlyInOne => '只出现在其中一份里';

  @override
  String get toolSectionInCommon => '共同之处';

  @override
  String get sensitiveKindEmail => '电子邮件地址';

  @override
  String get sensitiveKindPhone => '电话号码';

  @override
  String get sensitiveKindPaymentCard => '支付卡号';

  @override
  String get sensitiveKindIban => '银行账户（IBAN）';

  @override
  String get sensitiveKindNationalId => '身份证件号码';

  @override
  String get sensitiveKindPostcode => '邮政编码';

  @override
  String get sensitiveKindAccountNumber => '账户号码';

  @override
  String get sensitiveKindReference => '参考编号';

  @override
  String get sensitiveKindDateOfBirth => '出生日期';

  @override
  String get sensitiveKindUrl => '网址';

  @override
  String get verdictVerifiedProvenance => '有经过核验的来源信息';

  @override
  String get verdictVerifiedProvenanceExplainer => '这个文件带有一个签名，该签名经过检查并且通过了。';

  @override
  String get verdictSignalsSynthetic => '有与 AI 生成内容相符的迹象';

  @override
  String get verdictSignalsSyntheticExplainer =>
      '这个文件自称是用生成式工具做出来的。元数据可以被修改或删除，所以这只是文件自己的说法，不是证据。';

  @override
  String get verdictSignalsEdited => '有与经过编辑的内容相符的迹象';

  @override
  String get verdictSignalsEditedExplainer =>
      '这个文件自称经过了编辑软件处理。这对照片来说很寻常，本身并不意味着有什么东西是伪造的。';

  @override
  String get verdictNoReliableProvenance => '没有找到可靠的来源信息';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      '这个文件里没有来源信息。这很正常——大多数服务都会把它去掉——而且这说明不了任何事情。';

  @override
  String get verdictInconclusive => '无法得出结论';

  @override
  String get verdictInconclusiveExplainer => '这里的信息不足以说明它是从哪儿来的。';

  @override
  String get authenticitySignalCamera => '相机';

  @override
  String get authenticitySignalSoftware => '软件';

  @override
  String get authenticitySignalDescription => '描述';

  @override
  String get authenticitySignalCopyright => '版权';

  @override
  String get authenticitySignalLocation => '位置';

  @override
  String get authenticitySignalLocationValue => '这个文件里含有位置数据。';

  @override
  String get authenticitySignalContentCredentials =>
      'Content Credentials（内容凭证）';

  @override
  String get authenticitySignalContentCredentialsValue =>
      '没有检查过——这个版本里没有签名验证器。';

  @override
  String get authenticitySignalFile => '文件';

  @override
  String get authenticitySignalFileUnreadableValue => '没能按图片读出来。';

  @override
  String get authenticitySignalFileUnrecognisedValue => '不是能认出的图片格式。';

  @override
  String get authenticitySignalText => '文字';

  @override
  String get authenticitySignalTextValue => '光凭文字无法可靠地看出是否用了 AI。Action 不做猜测。';

  @override
  String get fileTypePng => '一张 PNG 图片';

  @override
  String get fileTypeJpeg => '一张 JPEG 图片';

  @override
  String get fileTypeGif => '一张 GIF 图片';

  @override
  String get fileTypeWebp => '一张 WebP 图片';

  @override
  String get fileTypeWav => '一段 WAV 录音';

  @override
  String get fileTypePdf => '一份 PDF 文档';

  @override
  String get fileTypeHeic => '一张 HEIC 图片';

  @override
  String get fileTypeVideo => '一个视频文件';

  @override
  String get fileTypeTiff => '一张 TIFF 图片';

  @override
  String get fileTypeBitmap => '一张位图图片';

  @override
  String get fileTypeRtf => '一份 RTF 文档';

  @override
  String get fileTypeZip => '一个 Zip 压缩包';

  @override
  String get fileTypeGzip => '一个 gzip 压缩包';

  @override
  String get fileTypeSevenZip => '一个 7-Zip 压缩包';

  @override
  String get fileTypeRar => '一个 RAR 压缩包';

  @override
  String get fileTypeWindowsProgram => '一个 Windows 程序';

  @override
  String get fileTypeLinuxProgram => '一个 Linux 程序';

  @override
  String get fileTypePostScript => '一份 PostScript 文档';

  @override
  String get fileTypeOgg => '一段 Ogg 录音';

  @override
  String get fileTypeMp3 => '一段 MP3 录音';

  @override
  String get fileTypePlainText => '纯文本';

  @override
  String fileMismatchNote(String extension, String contents) {
    return '这个文件名叫 \".$extension\"，但它的内容是$contents。这可能只是无心之失，同时这也正是一个文件被你意料之外的程序打开的方式。';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 字节',
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
  String get credentialKindPrivateKey => '私钥';

  @override
  String get credentialKindApiKey => 'API 密钥';

  @override
  String get credentialKindConnectionString => '连接字符串';

  @override
  String get credentialKindAccessToken => '访问令牌';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization 请求头';

  @override
  String get credentialKindPasswordOrKey => '密码或密钥';

  @override
  String get credentialKindPossibleSecret => '可能是机密';

  @override
  String get credentialAdvicePrivateKey =>
      '分享之前把它删掉，并且更换这对密钥。私钥一旦被人看到，就再也无法变回安全的了。';

  @override
  String get credentialAdviceProviderApiKey =>
      '到提供方那里吊销这个密钥，并签发一个新的。把它从文档里删掉并不会让它失效。';

  @override
  String get credentialAdviceConnectionString =>
      '它里面既有一个密码，也有这个密码能打开的地址。如果它已经被分享出去过，就去改掉那个密码。';

  @override
  String get credentialAdviceJsonWebToken =>
      '这类令牌通常会过期，但并不总是这样。除非你知道它什么时候过期，否则就把它当作仍然有效的。';

  @override
  String get credentialAdviceAuthorizationHeader =>
      '把这个请求头的值删掉。粘贴出来的请求日志，是一个仍然可用的令牌被无意间分享出去的最常见途径之一。';

  @override
  String get credentialAdviceKeyedAssignment =>
      '把它挪进环境变量或密钥管理服务里，并且如果这个文件已经被分享过，就改掉这个值。';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action 判断不出这是什么。分享之前请先核实——它同样可能是一个标识符或一个校验和。';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API 密钥';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI 项目密钥';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI 风格的 API 密钥';

  @override
  String get credentialLabelGoogleApiKey => 'Google API 密钥';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth 令牌';

  @override
  String get credentialLabelGitHubToken => 'GitHub 令牌';

  @override
  String get credentialLabelSlackToken => 'Slack 令牌';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS 访问密钥 ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab 令牌';

  @override
  String get credentialLabelNpmToken => 'npm 令牌';

  @override
  String get credentialLabelPassphrase => '密码短语';

  @override
  String get credentialLabelPassword => '密码';

  @override
  String get credentialLabelRefreshToken => '刷新令牌';

  @override
  String get credentialLabelToken => '令牌';

  @override
  String get credentialLabelClientSecret => '客户端密钥';

  @override
  String get credentialLabelCredential => '凭据';

  @override
  String get credentialLabelSecret => '机密值';

  @override
  String get linkVerdictNoObviousSignals => '没有明显迹象';

  @override
  String get linkVerdictWorthChecking => '值得看一眼';

  @override
  String get linkVerdictTreatWithCaution => '请谨慎对待';

  @override
  String get linkSummaryNoObviousSignals =>
      '这个链接的写法没有什么不寻常的地方。但这和知道那个页面值得信赖并不是一回事——只有你才能判断这是不是你预料之中的链接。';

  @override
  String get linkSummaryWorthChecking => '关于这个链接，有一处值得你在打开之前先看一眼。';

  @override
  String get linkSummaryTreatWithCaution => '这个链接的写法有好几处值得你在打开之前先看一看。';

  @override
  String get linkSignalNotHttps => '没有加密';

  @override
  String get linkSignalNonWebScheme => '不是网页链接';

  @override
  String get linkSignalEmbeddedCredentials => '链接里带着密码';

  @override
  String get linkSignalMisleadingAuthority => '真实地址被藏住了';

  @override
  String get linkSignalIpLiteralHost => '数字地址';

  @override
  String get linkSignalPunycodeHost => '名称里有编码字符';

  @override
  String get linkSignalMixedScriptHost => '名称里混用了不同的字母';

  @override
  String get linkSignalEncodedHost => '名称里有转义字符';

  @override
  String get linkSignalUnusualPort => '端口不常见';

  @override
  String get linkSignalDeepSubdomain => '名称分成很多段';

  @override
  String get linkSignalPublicSuffixInSubdomain => '眼熟的名字放错了位置';

  @override
  String get linkSignalShortener => '短链接';

  @override
  String get linkSignalExecutableTarget => '会下载一个程序';

  @override
  String get linkSignalRedirectParameter => '可能把你转到别处';

  @override
  String get linkSignalVeryLongUrl => '特别长';

  @override
  String get linkSignalUnparseable => '读不出来的链接';

  @override
  String get linkDetailNotHttps =>
      '这个链接用的是 http，所以你在那个页面上输入的任何内容，在送过去的路上都可能被人读到。';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return '这个链接打开的是“$scheme:”，而不是一个网页。它可能会请另一个应用去做点什么。';
  }

  @override
  String get linkDetailEmbeddedCredentials => '这个链接里写进了用户名和密码。它被分享到哪里，它们就跟到哪里。';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return '浏览器会忽略“@”之前的所有内容。真正的目的地是“$host”。';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return '这个链接指向“$host”——一个原始地址，而不是一个名称。正规站点几乎总是用名称。';
  }

  @override
  String get linkDetailPunycodeHost =>
      '这个站点名称含有非拉丁字母的字符，以编码形式存放。这对很多语言来说都很正常，同时这也是让一个名称看上去像另一个眼熟名称的做法。';

  @override
  String get linkDetailMixedScriptHost =>
      '这个站点名称把拉丁字母和另一种字母里长得一模一样的字母混在了一起。请一个字符一个字符地读一遍。';

  @override
  String get linkDetailEncodedHost =>
      '这个站点名称里含有转义码，而那里本不该出现它们。它们可能把名称实际写的内容藏起来。';

  @override
  String linkDetailUnusualPort(String port) {
    return '这个链接连的是 $port 端口，而不是通常的那个端口。这在测试服务器上很常见，在公开站点上则不常见。';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这个名称有 $count 段。只有最后两段决定这个站点归谁运营；其余部分可以随便设成什么。',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return '这个名称中间含有“.$suffix.”，于是开头那部分看上去才像是这个站点。实际上这个站点是“$host”。';
  }

  @override
  String get linkDetailShortener => '短链接服务把真正的目的地藏了起来。不打开它，你就无法知道它通向哪里。';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return '这个链接以“$fileExtension”结尾，所以它下载的是一个能在你设备上运行的东西，而不是一个供你阅读的页面。';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return '这个链接在它的“$parameter”设置里带着第二个地址，所以打开它可能会把你带到“$host”以外的地方。';
  }

  @override
  String get linkDetailVeryLongUrl => '长链接更难读，而且决定目的地的那一部分可能被挤到看不见的地方去。';

  @override
  String get linkDetailUnparseable =>
      'Action 没能把它当作一个网址读出来。对那些看起来不像链接的链接，请多加小心。';

  @override
  String get toolTitleRedaction => '隐去敏感信息';

  @override
  String get toolDescriptionRedaction => '找出不该分享的内容，再做一份去掉它们的副本。';

  @override
  String get toolSectionRedactionNothingToScan => '没有可扫描的内容';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      '这个工具读的是文字。请选一条便签、一条粘贴进来的消息，或者一项已经读出文字的采集。';

  @override
  String get toolSectionRedactionNothingFound => '没有找到明显的东西';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      '在这段文字里，Action 没有找到电子邮件地址、电话号码、卡号或参考编号。';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 处值得隐去的内容',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => '隐去后的副本';

  @override
  String get toolWarningRedactionCoverage =>
      '它找的是电子邮件地址、电话号码、账号这类有固定形态的内容。它不会把所有敏感信息都找出来——分享之前，请把副本读一遍。';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action 无法隐去图片和 PDF 文件里的内容。在图片上盖住一处，原始内容还留在下面，所以这里不提供这个选项。';

  @override
  String get toolTitleAuthenticity => '查看文件来自哪里';

  @override
  String get toolDescriptionAuthenticity => '一个文件自己声称它来自哪里。';

  @override
  String get toolSectionAuthenticityNothingToInspect => '没有可查看的内容';

  @override
  String get toolSectionAuthenticityNothingToInspectBody => '请选一张图片或一段文字。';

  @override
  String get toolSectionAuthenticityFileSignals => '这个文件自己说了什么';

  @override
  String get toolSectionAuthenticityFileItself => '文件本身';

  @override
  String get toolSectionFileContents => '内容';

  @override
  String get toolSectionFileUnknownFormat => 'Action 不认识的格式';

  @override
  String get toolSectionFileSize => '大小';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      '这里报告的是文件自己声称的内容。元数据可以被修改，也可以被抹掉，所以这里没有任何一项能当作证据。不要拿它去指控任何人。';

  @override
  String get toolTitleCredentialScanner => '查找密钥和密码';

  @override
  String get toolDescriptionCredentialScanner => '在你分享之前，先找出里面的凭据。';

  @override
  String get toolSectionCredentialNothingToCheck => '没有可检查的内容';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      '粘贴一段文字，或者选一项已经读出文字的采集。这个工具只读文字。';

  @override
  String get toolSectionCredentialNoneFound => '没有找到凭据';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      '在这段文字里，Action 没有找到形态像 API 密钥、私钥、令牌或密码的东西。';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '找到 $count 项凭据',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 处可能是机密值的东西',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy => '去掉了这些凭据的副本';

  @override
  String get toolWarningCredentialRevoke =>
      '把一个密钥从文档里删掉，并不会让它失效。如果其中某一个已经分享出去了，请到签发它的提供方那里撤销它，并重新签发一个新的。';

  @override
  String get toolWarningCredentialCoverage =>
      '它找的是形态可辨认的凭据。写在句子里的一个密码是找不到的，所以请把这段文字也读一遍。';

  @override
  String get toolTitleLinkInspector => '查看一个链接';

  @override
  String get toolDescriptionLinkInspector => '在你打开之前，一个地址已经透露了什么。';

  @override
  String get toolSectionLinkNoneFound => '没有找到链接';

  @override
  String get toolSectionLinkNoneFoundBody => '粘贴一个链接，或者选一项含有链接的采集。';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这段文字里的 $count 个链接',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => '读不出来';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary。$detail';
  }

  @override
  String get toolSectionLinkNothingUnusual => '这些链接的写法没有什么不寻常的地方';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      '这和知道那些页面值得信赖并不是一回事。只有你才能判断它们是不是你预料之中的。';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action 只读这个地址。它不会打开这个链接，不会去查询这个站点，也不会去查任何信誉服务——那样做就等于把你的浏览行踪送到别人那里。';

  @override
  String get toolWarningLinkNoSignals =>
      '一个没有任何迹象的链接照样会造成伤害。这里找的是地址写法上的问题，而这并不是关于它通向哪里的全部。';

  @override
  String get toolSectionObjective => '你想达成的事';

  @override
  String get toolSectionCurrentState => '目标进展到哪一步';

  @override
  String get toolSectionRecommendedNextStep => '建议的下一步';

  @override
  String get toolSectionCredentialAdvice => '该怎么做';

  @override
  String get toolSectionSummary => '摘要';

  @override
  String get toolDetailSeparator => ' · ';
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
      '有些工具从不发送任何东西：隐去敏感信息、查看文件来自哪里、找出凭据以及查看链接，全都完全在本机运行。';

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

  @override
  String get detailSaveFailed => '没能保存。什么都没丢——请再试一次。';

  @override
  String get detailSectionCreatedFrom => '创建自';

  @override
  String get detailSourceChecking => '正在查找原始采集…';

  @override
  String get detailSourceUnavailable => '原始采集已经找不到了。';

  @override
  String get detailReopenAction => '重新打开这项待办';

  @override
  String get detailMarkActionComplete => '把这项待办标为已完成';

  @override
  String get detailGetHelp => '就这项待办获得帮助';

  @override
  String get detailSectionHistory => '历史';

  @override
  String get detailHistoryShowLess => '收起';

  @override
  String detailHistoryShowAll(int count) {
    return '显示全部 $count 条';
  }

  @override
  String get detailHistoryCreated => '已创建';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '创建时带有 $count 个步骤',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => '你确认了这些内容';

  @override
  String detailHistoryStepFinished(String title) {
    return '完成了“$title”';
  }

  @override
  String get detailHistoryAStep => '某个步骤';

  @override
  String get detailHistoryReminderSet => '你设了一条提醒';

  @override
  String detailHistoryReminderSetFor(String when) {
    return '你设了一条 $when 的提醒';
  }

  @override
  String get detailHistoryCompleted => '标为已完成';

  @override
  String get detailHistoryChanged => '最后一次改动';

  @override
  String get detailHistoryTimestampFormat => 'yyyy年M月d日 HH:mm';

  @override
  String get aiProviderCustom => '自定义（兼容 OpenAI）';

  @override
  String get aiCapabilityText => '文字';

  @override
  String get aiCapabilityImages => '图片';

  @override
  String get aiCapabilityDocuments => '文档';

  @override
  String get aiCapabilityStructuredResults => '结构化结果';

  @override
  String get aiCapabilityStreaming => '流式输出';

  @override
  String get aiCapabilitySystemInstructions => '系统指令';

  @override
  String get aiCapabilityEvidenceCitations => '原文出处引用';

  @override
  String get aiCapabilityLongDocuments => '整份长文档';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a、$b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a或$b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head或$last';
  }

  @override
  String get aiFailureNotConfigured => '接入一个 AI 提供方后即可使用这个工具。';

  @override
  String get aiFailureInvalidKey => '提供方没有接受那个 API 密钥。';

  @override
  String get aiFailureQuotaExceeded => '你在提供方那里的账号余额已经用完，或者已经达到配额。';

  @override
  String get aiFailureRateLimited => '你的提供方正在限制请求频率。请稍后再试。';

  @override
  String get aiFailureNetworkUnavailable => 'Action 没能连上你的 AI 提供方。请检查你的网络连接。';

  @override
  String get aiFailureUnsupportedModel => '那个模型对你的密钥不可用。请在设置中另选一个。';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return '你选的模型读不了$capabilities。请在设置中另选一个模型。';
  }

  @override
  String get aiFailureContextTooLarge => '那些内容太多了，这个模型没法一次读完。';

  @override
  String get aiFailureInputTooLargeText => '那段文字超出了一次能分析的量。';

  @override
  String get aiFailureProviderUnavailable => '你的 AI 提供方出了问题。请稍后再试。';

  @override
  String get aiFailureMalformedResponse => '那个提供方回传了 Action 读不了的东西。';

  @override
  String get aiFailureCancelled => '已停止。';

  @override
  String get aiFailureInsecureEndpoint => '那个 endpoint 必须是 https:// 地址。';

  @override
  String get aiFailureUnknown => '跟你的 AI 提供方沟通时出了点问题。';

  @override
  String get appLockTitle => 'Action 已锁定';

  @override
  String get appLockPrompt => '确认是你本人才能继续。Action 请你的设备来确认——它从不会看到你的指纹、面容或 PIN。';

  @override
  String get appLockUnlocking => '正在解锁…';

  @override
  String get appLockNotConfirmed => '那次没有得到确认。准备好了再试一次。';

  @override
  String get appLockCannotConfirm => '你的设备现在无法确认是你本人。请在设备设置里检查屏幕锁是否还在。';

  @override
  String get appLockWaiting => '正在等待…';

  @override
  String get appLockUnlock => '解锁';

  @override
  String get appLockReasonUnlock => '解锁 Action';

  @override
  String get appLockReasonEnable => '确认是你本人，然后开启应用锁';

  @override
  String get appLockReasonDisable => '确认是你本人，然后关闭应用锁';

  @override
  String get todayCapabilityHeading => 'Action 能处理什么';

  @override
  String get todayCapabilityDocumentTitle => '一封信或一张账单';

  @override
  String get todayCapabilityDocumentBlurb => 'Action 读它，找出期限、金额和参考编号。';

  @override
  String get todayCapabilityScreenshotTitle => '一张截屏';

  @override
  String get todayCapabilityScreenshotBlurb => '把一条本来会被你忘掉的消息，变成一件你能着手去做的事。';

  @override
  String get todayCapabilityTextTitle => '一段文字';

  @override
  String get todayCapabilityTextBlurb => '粘贴任何东西。Action 会判断出它是什么，以及它要求你做什么。';

  @override
  String get todayCapabilityConfirmTitle => '一切都由你确认';

  @override
  String get todayCapabilityConfirmBlurb => '在你看过原文出处并点头之前，什么都不会变成一项待办。';

  @override
  String get todayCapabilityExploreIntelligence => '探索智能';

  @override
  String get documentRejectedEmpty => '那个文件是空的。';

  @override
  String documentRejectedTooLarge(String size) {
    return '那份文档有 $size，超过了 Action 能处理的大小。';
  }

  @override
  String get documentRejectedNotAPdf => '不管它叫什么名字，那都不是 PDF。Action 能读 PDF 和图片。';

  @override
  String get documentRejectedUnreadable => '那份文档读不出来。';

  @override
  String get pdfRejectedNotAPdf => '不管它叫什么名字，那个文件都不是 PDF。';

  @override
  String get pdfRejectedEncrypted => '那个 PDF 有密码保护，所以 Action 读不了它。';

  @override
  String get pdfRejectedDamaged => '那个 PDF 读不出来。它可能是不完整的。';

  @override
  String get shareRejectedEmpty => '那次分享里没有可读的东西。';

  @override
  String get shareRejectedUnsupportedType => 'Action 能接收文字、图片和 PDF。那是别的东西。';

  @override
  String get shareRejectedContentMismatch => '那个文件不是它自称的那种文件，所以 Action 没有打开它。';

  @override
  String get shareRejectedTooLarge => '那个文件太大，Action 处理不了。';

  @override
  String get shareRejectedUnreadable => '那个文件读不出来。';

  @override
  String get captureFailureRecognition => '文字识别没能运行。';

  @override
  String get captureFailureImageFormat => '那种图片格式在这台设备上读不了。';

  @override
  String get connectSheetTitle => '接入你的 AI';

  @override
  String get connectSheetSubtitle =>
      '你用自己的提供方账号和 API 密钥。Action 把密钥存在这台设备的安全存储里。';

  @override
  String get connectErrorKeyMissing => '粘贴你的 API 密钥才能继续。';

  @override
  String get connectErrorModelMissing => '选一个模型，或者自己输入模型 id。';

  @override
  String get connectErrorEndpointMissing => '填上你的 endpoint 地址。';

  @override
  String get connectErrorSecureStorageUnavailable => '这台设备的安全存储打不开，所以密钥没有保存。';

  @override
  String get connectTestSucceeded => '已接入。';

  @override
  String connectTestSucceededWithModels(int count) {
    return '已接入。有 $count 个模型可用。';
  }

  @override
  String get connectProviderLabel => '提供方';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      '必须是 https:// 地址。Action 不会通过未加密的连接发送你的文档。';

  @override
  String get connectApiKeyLabel => 'API 密钥';

  @override
  String get connectApiKeyHint => '粘贴你的密钥';

  @override
  String get connectKeyPrivacyNote =>
      '你的密钥留在这台设备上。除了你选定的那个提供方，Action 从不把它发往任何地方，而且保存之后无法再显示给你看。';

  @override
  String get connectModelLabel => '模型';

  @override
  String get connectModelIdHint => '模型 id';

  @override
  String get connectModelFreeTextNote =>
      '提供方会淘汰旧的模型 id，也会加上新的。如果你要的那个不在列表里，就在这里自己输入。';

  @override
  String get connectAndTest => '接入并测试';

  @override
  String get connectSaveWithoutTesting => '不测试，直接保存';

  @override
  String get toolWarningFactsNotChecked => 'Action 没能把这个和原文比对，所以里面的金额和日期没有核对过。';

  @override
  String get toolTitleRewrite => '改进这段文字';

  @override
  String get toolDescriptionRewrite => '更清楚、更简短，或更商务——事实原样保留。';

  @override
  String get toolModeRewriteClearer => '更清楚';

  @override
  String get toolModeRewriteProfessional => '更商务';

  @override
  String get toolModeRewriteShorter => '更简短';

  @override
  String get toolModeRewritePersuasive => '更有说服力';

  @override
  String get toolModeRewriteSimpler => '更好懂';

  @override
  String get toolModeRewriteStructured => '更有条理';

  @override
  String get toolModeRewriteGrammarOnly => '只改语法';

  @override
  String get toolSectionWhatChanged => '改了什么';

  @override
  String get toolSectionNote => '备注';

  @override
  String get toolSectionAlreadyClearBody => '这段本来就已经很清楚了。下面的改动很小。';

  @override
  String get toolSectionImprovedText => '改进后的文字';

  @override
  String get toolTitleDraftReply => '起草一封回复';

  @override
  String get toolDescriptionDraftReply => '一封你可以自己修改、自己发送的回复。';

  @override
  String get toolModeReplyProfessional => '商务';

  @override
  String get toolModeReplyConcise => '简短';

  @override
  String get toolModeReplyFriendly => '友好';

  @override
  String get toolModeReplyFormal => '正式';

  @override
  String get toolModeReplyClarification => '请对方说明清楚';

  @override
  String get toolModeReplyConfirmation => '确认收到';

  @override
  String get toolModeReplyDispute => '对此提出异议';

  @override
  String get toolSectionSubject => '主题';

  @override
  String get toolSectionDraftReply => '回复草稿';

  @override
  String get toolSectionPlaceholders => '这些需要你填上';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return '草稿 —— $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      '这是一份草稿。Action 不发送任何东西——请你自己读一遍、自己改一改，再自己发出去。';

  @override
  String get toolTitleTranslate => '翻译';

  @override
  String get toolDescriptionTranslate => '换成另一种语言，数字和名称原样保留。';

  @override
  String get toolSectionTranslation => '译文';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '从$from译成$to';
  }

  @override
  String get toolSectionKeptInOriginal => '保留原文未译';

  @override
  String get toolWarningTranslationNotCertified => '这是供你理解用的译文，不是经认证的翻译件。';

  @override
  String get toolTitleStructuredData => '提取一张表格';

  @override
  String get toolDescriptionStructuredData => '可以复制出来的行、字段和数字。';

  @override
  String get toolSectionTable => '表格';

  @override
  String get toolSectionFields => '字段';

  @override
  String get toolSectionTableCsv => '表格 (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      '这张表格的分列方式没能可靠地读出来。使用之前，请检查每一行是否对得上。';

  @override
  String get toolTitleDeadlineFinder => '找出期限';

  @override
  String get toolDescriptionDeadlineFinder => '有什么要做、什么时候到期，以及没做会怎样。';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个期限',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => '没有到期的';

  @override
  String get toolSectionNothingDueBody => 'Action 在这份材料里没有找到期限或义务。';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      '在你选定之前，什么都不会被排期。提醒从不会自动设置。';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return '如果没做：$consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return '你需要：$items';
  }

  @override
  String get moneyErrorEmpty => '没有给出金额';

  @override
  String get moneyErrorMalformed => '金额不是一个纯数字';

  @override
  String get moneyErrorNegative => '负数的金额不是一笔应付的款项';

  @override
  String get moneyErrorTooManyDecimals => '小数位比这种货币本身的位数还多';

  @override
  String get moneyErrorUnsupportedCurrency => '这个货币代码我们不认识';

  @override
  String get moneyErrorOutOfRange => '金额大得不合常理';

  @override
  String get escalationOcrFailed => '对这项采集，识别根本没能运行。';

  @override
  String get escalationNoTextRecognised => '这看起来是一份文档，但没有识别出任何文字。';

  @override
  String get escalationThinText => '按这份文档的篇幅来说，识别出来的文字太少了。';

  @override
  String get escalationLowLineConfidence => '识别器报告说有好几行的置信度偏低。';

  @override
  String get escalationTableLikeLayout => '这个版式看起来是一张表格，而逐行读取会丢掉哪个数值属于哪一行。';

  @override
  String get escalationFragmentedLayout => '文字是以很多细碎的片段返回的，所以结构不清楚。';

  @override
  String get escalationMalformedText => '识别出来的文字有很大一部分不是能读通的词或数字。';

  @override
  String get escalationConflictingDates => '不止一个日期被写成了期限。';

  @override
  String get escalationConflictingAmounts => '不止一个金额被写成了应付的款项。';

  @override
  String get escalationUnresolvedGrounding => '有些数值没能和文档里的文字比对上。';

  @override
  String get escalationInstructionLikeContent =>
      '这份文档里有些文字写得像是给应用的指令。它被当作文档内容处理，绝不会当作指令。';

  @override
  String get providerFailureNetwork => 'Action 没能连上那项服务。请检查你的网络连接。';

  @override
  String get providerFailureTimedOut => '那项服务太久没有给出回应。';

  @override
  String get providerFailureServiceUnavailable => '那项服务暂时用不了。请稍后再试。';

  @override
  String get providerFailureUnauthorized => '这个应用目前没有获得使用那项服务的授权。';

  @override
  String get providerFailureBlocked => '那项服务拒绝处理这份文档。';

  @override
  String get providerFailureUnknown => 'Action 没能读出这份文档。再试一次可能会成功。';

  @override
  String get reviewBlockerTitle => '给这项待办起个标题。';

  @override
  String get reviewBlockerDate => '选出哪个日期才是真正的期限，或者留空。';

  @override
  String get reviewBlockerAmount => '选出哪个金额是对的，或者留空。';

  @override
  String get reviewBlockerStepTitle => '你保留的步骤需要有标题。';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: '第 $page 页',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return '第 $start–$end 页';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '改写后的结果里已经没有 $values 了。使用之前请先核对。',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '改写后的结果里已经没有 $values，另外还有 $count 项也没有了。使用之前请先核对。',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => '、';

  @override
  String get goalStatusReached => '已达成';

  @override
  String get goalNewSheetTitle => '你希望发生什么？';

  @override
  String get goalNewSheetSubtitle => '一句话就够了。细节可以之后再补。';

  @override
  String get goalTitleHint => '续保车险，别多花钱。';

  @override
  String get goalCreateAction => '创建目标';

  @override
  String get goalTitleSheetTitle => '你想要什么';

  @override
  String get goalOutcomeSheetTitle => '做成了是什么样';

  @override
  String get goalContextSheetTitle => '现在的情况';

  @override
  String get goalOutcomeHint => '车险已经续上，材料也交了。';

  @override
  String get goalContextHint => '我拿到了两份报价，续保日期是 18 号。';

  @override
  String get goalWorkspaceTitle => '目标';

  @override
  String get goalUnmarkReached => '其实还没达成，撤销这个标记';

  @override
  String get goalMarkReached => '标为已达成';

  @override
  String get goalNotFound => '那个目标已经不在了。';

  @override
  String get goalDeleteTitle => '删除这个目标？';

  @override
  String get goalDeleteBody => '这个目标会从本机移除。由它做出的待办完全保持原样。';

  @override
  String get goalOutcomeLabel => '做成了是什么样';

  @override
  String get goalOutcomeEmpty => '还没有写。说清楚做完是什么样，目标会更好规划。';

  @override
  String get goalContextLabel => '现在的情况';

  @override
  String get goalContextEmpty => '还什么都没写。到目前为止发生了什么，以及什么挡在路上。';

  @override
  String get goalTitleLabel => '你想要什么';

  @override
  String get goalEditTooltip => '编辑目标';

  @override
  String get goalToolsLabel => 'Action 能做什么';

  @override
  String get goalToolsNotReady => '把你想要的再多写一点，这些工具才有东西可用。';

  @override
  String get toolGoalOptimizerTitle => '打磨一个目标';

  @override
  String get toolActionPlanTitle => '搭一个计划';

  @override
  String get resultFactUnconfirmed => '未确认';

  @override
  String get resultSuggestedSteps => '建议的步骤';

  @override
  String get resultSuggestedAction => '建议的待办';

  @override
  String get resultWorthAsking => '值得问一问';

  @override
  String get resultSuggestedDeadlines => '建议的期限';

  @override
  String get resultSuggestions => '建议';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条原文引用',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => '来自你选的那份来源';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source、$page';
  }

  @override
  String get toolRunStagePreparing => '正在准备你的文档';

  @override
  String get toolRunStageReading => '正在读取你选的那些页';

  @override
  String get toolRunStageAnalysing => '正在分析';

  @override
  String get toolRunStageBuilding => '正在整理你要核对的内容';

  @override
  String get toolRunStageDone => '已完成';

  @override
  String get toolRunStageFailed => '那次没有走完';

  @override
  String get toolRunStageCancelled => '已由你停止';

  @override
  String get toolRunFailureLocalCheckFailed => '那次检查没能完成。';

  @override
  String get toolRunFailureProviderRetired => '这个版本已经不再支持那个 AI 提供方。';

  @override
  String get toolRunFailureUnusableReply => '那次回复的形式没法使用，里面的内容一点也没有采用。请再试一次。';

  @override
  String get toolRunFailureQuestionRequired => '先输入一个问题。';

  @override
  String get toolRunFailureInputRequired => '选点东西让这个工具来处理。';

  @override
  String get toolWarningReplyTruncated => '这次回复中途被截断了，所以看到的内容可能不完整。';

  @override
  String get toolWarningNoSupportingQuotes =>
      '你的模型没有返回任何原文引用，所以这里的内容全都没有原文出处。据此行动之前，请对照文档核对。';

  @override
  String get aiSettingsRemoveTitle => '移除这个连接？';

  @override
  String get aiSettingsRemoveBody =>
      'Action 会从这台设备上删除你的 API 密钥，并停止使用 AI 功能。你在提供方那里的账号不受影响。';

  @override
  String get aiSettingsProviderLabel => '提供方';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      '你用了多少，由你的提供方向你收费。Action 从不自己发起请求。';

  @override
  String get aiSettingsConnectLabel => '接入一个 AI 提供方';

  @override
  String get aiSettingsConnectDescription =>
      '用你自己的账号和 API 密钥，连接 OpenAI、Anthropic、Google Gemini，或任何兼容的 endpoint。';

  @override
  String get aiSettingsModelLabel => '模型';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API 密钥';

  @override
  String get aiSettingsKeyStored => '保存在这台设备的安全存储里。';

  @override
  String get aiSettingsKeyMissing => '这台设备上没有找到密钥。重新接入一次才能加上。';

  @override
  String get aiSettingsTestLabel => '测试连接';

  @override
  String get aiSettingsProviderUnavailable => '那个提供方在这个版本里用不了。';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return '已接入。有 $count 个模型可用。';
  }

  @override
  String get aiSettingsTestButton => '测试';

  @override
  String get aiSettingsChangeProvider => '更换提供方或模型';

  @override
  String get aiSettingsRemoveKey => '删除密钥';

  @override
  String get aiSettingsSectionPrivacy => '隐私';

  @override
  String get aiSettingsWhatGetsSentLabel => '发送的是什么';

  @override
  String get aiSettingsWhereItGoesLabel => '它去哪里';

  @override
  String get aiSettingsWhereItGoesNoProvider => '在你接入提供方之前，什么都不会发送。';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return '直接发给 $provider，用的是你的密钥。不经过任何属于 Action 的服务器。';
  }

  @override
  String get aiSettingsSectionData => '数据';

  @override
  String get aiSettingsDataFootnote => 'Action 记住你用过哪些工具，绝不记住你用它们处理了什么。';

  @override
  String get aiSettingsRecentToolsLabel => '最近用过的工具';

  @override
  String get aiSettingsRecentToolsNone => '没有';

  @override
  String get reminderNotificationTitle => 'Action 提醒';

  @override
  String get reminderNotificationPrivateBody => '有件事等着你处理。';

  @override
  String get reminderChannelName => 'Action 提醒';

  @override
  String get reminderChannelDescription => '你自己为你的待办设置的提醒。';

  @override
  String get onboardingStart => '开始使用 Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return '第 $current 步，共 $total 步';
  }

  @override
  String get onboardingCaptureTitle => '把信息变成待办';

  @override
  String get onboardingCaptureBody =>
      '添加一张截屏、一张照片，或别人发给你的文字。Action 会读它，并判断出它要求你做什么。';

  @override
  String get onboardingReviewTitle => '在你确认之前，什么都不会被保存';

  @override
  String get onboardingReviewBody =>
      'Action 会显示它找到了什么，以及这些内容来自哪些字。有错的地方由你改。在你确认之前，它只是一条建议——不是事实，也不是一项待办。';

  @override
  String get onboardingTrackingTitle => '对要紧的事心里有数';

  @override
  String get onboardingTrackingBody =>
      '“需要处理”会把已经逾期或快要到期的排到前面。每一项待办都带着它的下一步、它的进度，以及你为它设的提醒。';

  @override
  String get onboardingPrivacyBody => '开始之前，有几件事值得你知道：';

  @override
  String get onboardingPrivacyOnDevice => '你的待办、采集、提醒和搜索都存在这台设备上。搜索和提醒不联网也能用。';

  @override
  String get onboardingPrivacySentToRead =>
      '当你请 Action 解读什么东西时，那份内容会发送给解读它的 AI 服务。';

  @override
  String get onboardingPrivacyCloud =>
      '一项已确认待办的简短记录——它的标题、日期、金额和建议的步骤——可能会以这台设备的匿名标识保存到云端。你的采集、步骤和提醒不会。';

  @override
  String get onboardingPrivacyNotBackup => '那条记录不是备份。它无法把任何东西恢复到新设备上。';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个卡点',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => '也许可以更简单';

  @override
  String get toolDescriptionGoalOptimizer => '缺了什么、卡在哪里，以及先做什么。';

  @override
  String toolSectionStepDependsOn(String step) {
    return '需先完成：$step';
  }

  @override
  String get toolSectionThePlan => '这个计划';

  @override
  String get toolDescriptionActionPlan => '一组有先后顺序的步骤，你可以把它们变成待办。';

  @override
  String get toolTitleSmartChecklist => '列一份清单';

  @override
  String get toolDescriptionSmartChecklist => '这份材料要求你做的事，按先后顺序排好。';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 处没找到的细节',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => '这几处互相矛盾';

  @override
  String get toolTitleMissingInformation => '找出缺失的信息';

  @override
  String get toolDescriptionMissingInformation => '有哪些空缺，以及该就此去问什么。';

  @override
  String get aiAdapterTimedOut => '那次请求太久了，已经被停止。';

  @override
  String get aiAdapterSecureConnectionFailed => '与你的 AI 提供方之间的安全连接没有建立成功。';

  @override
  String get aiAdapterModelOrEndpointNotFound => 'Action 没有找到那个模型或 endpoint。';

  @override
  String get aiAdapterRequestRejected => '你的 AI 提供方拒绝了那个请求。';

  @override
  String get aiAdapterSecureStorageUnavailable => 'Action 打不开这台设备的安全存储。';

  @override
  String get aiAdapterEndpointMissing => '在设置里填上你的 AI endpoint 地址。';

  @override
  String get aiAdapterReplyIncomplete => '那次回复不完整，没有内容可用。请再试一次。';

  @override
  String get aiAdapterContentDeclined => '你的提供方拒绝处理那份内容。';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return '那一次超过了 $limit 个文件。请少选一些。';
  }

  @override
  String get aiAdapterImageTooLarge => '那些图片里有一张太大，没法分析。';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '“$filename”太大，没法分析。上限是 $limit MB。';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '“$filename”有 $count 页。Action 一次最多读 $limit 页——请选一个页码范围。';
  }

  @override
  String get aiAdapterSelectionTooLarge => '你选的内容太多，没法在一次请求里发送。';

  @override
  String get toolRunNotAvailableTitle => '那个工具用不了';

  @override
  String get toolRunNotAvailableMessage => '它可能在较新的 Action 版本里被移除了。';

  @override
  String get toolRunNoSourcesYet => '还没有可处理的东西。采集点什么，或者在下面粘贴一些文字。';

  @override
  String get toolRunChooseSourcesToCompare => '选择要对比的内容';

  @override
  String get toolRunChooseSource => '选择一项来源';

  @override
  String get toolRunQuestionLabel => '你的问题';

  @override
  String get toolRunQuestionHint => '期限是什么时候？';

  @override
  String get toolRunFreeTextLabel => '或者粘贴一段文字';

  @override
  String get toolRunFreeTextHint => '在这里粘贴或输入';

  @override
  String get toolRunModeLabel => '风格';

  @override
  String get toolRunRunLocally => '在这台设备上检查';

  @override
  String get toolRunRun => '运行';

  @override
  String get toolRunStop => '停止';

  @override
  String get toolRunRunAgain => '再运行一次';

  @override
  String get toolRunWorkingOn => '正在处理：';

  @override
  String toolRunFirstUseTitle(String provider) {
    return '把这些发送给 $provider 吗？';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return '你选中的内容会用你的 API 密钥发送给 $provider 处理。';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      '你的密钥留在这台设备上。Action 不会在后台发送任何东西，也不会发送你其他的待办或来源。';

  @override
  String get toolRunScopeTitle => '在运行之前';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '将通过你的 $provider 连接分析 $count 页。',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '将通过你的 $provider 连接分析 $count 个文件。',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return '你选中的那段文字会发送到你的 $provider 连接。';
  }

  @override
  String get toolRunNeedsProviderTitle => '接入一个 AI 提供方即可使用这个工具';

  @override
  String get toolRunNeedsProviderBody => '你用的是你自己的提供方账号和 API 密钥。';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已根据 $count 个步骤创建一项待办。',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已添加 $count 个步骤。',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个步骤',
    );
    return '创建一项待办 · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个步骤',
    );
    return '添加到这项待办 · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => '照片';

  @override
  String get sourceTypeLabelScreenshot => '截屏';

  @override
  String get sourceTypeLabelPastedText => '粘贴的文字';

  @override
  String get sourceTypeLabelDocument => '文档';

  @override
  String get toolModeClearer => '更清楚';

  @override
  String get toolModeMoreProfessional => '更商务';

  @override
  String get toolModeShorter => '更简短';

  @override
  String get toolModeSimpler => '更好懂';

  @override
  String get toolModeMoreStructured => '更有条理';

  @override
  String get toolModeMorePersuasive => '更有说服力';

  @override
  String get toolModeGrammarOnly => '只改语法';

  @override
  String get toolModeProfessional => '商务';

  @override
  String get toolModeConcise => '简短';

  @override
  String get toolModeFriendly => '友好';

  @override
  String get toolModeFormal => '正式';

  @override
  String get toolModeAskForClarification => '请对方说明清楚';

  @override
  String get toolModeConfirm => '确认收到';

  @override
  String get toolModeDispute => '对此提出异议';

  @override
  String get toolModeQuick => '速览';

  @override
  String get toolModeDetailed => '详尽';

  @override
  String get toolModeExecutive => '给决策者';

  @override
  String get toolModeKeyPoints => '要点';

  @override
  String get toolModeActionFocused => '侧重待办';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 处引用的细节没能在你选中的内容里找到，所以它们被标为不确定。',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action 没能把这些引文拿去和文件本身比对，所以它们没有比对过。';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已逾期 · $count 天',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => '明天到期';

  @override
  String get triageBadgeReminderSoon => '提醒将至';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已逾期 $count 天',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status。$title';
  }

  @override
  String get triageExplanationDone => '这项已经完成了。';

  @override
  String get triageExplanationNothingPressing => '它在这里，是因为目前它还没有什么急迫的地方。';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return '这项需要留意，因为$reason。';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return '这项排在靠下的位置，因为$reason。';
  }

  @override
  String get triageReasonOverdue => '它已经逾期';

  @override
  String get triageReasonDeadlinePassed => '它的期限已经过了';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '它已经逾期 $count 天',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => '它今天到期';

  @override
  String get triageReasonCriticalDueSoon => '你把它标成了紧要，而且它的期限快到了';

  @override
  String get triageReasonAllStepsDone => '每个步骤都已完成——它只差最后收尾';

  @override
  String get triageReasonDueTomorrow => '它明天到期';

  @override
  String get triageReasonReminderSoon => '你为它设了一条将在一天之内到点的提醒';

  @override
  String get triageReasonDueWithinThreeDays => '它将在三天内到期';

  @override
  String get triageReasonCriticalNoDeadline => '你把它标成了紧要，而且它没有期限';

  @override
  String get triageReasonDueWithinSevenDays => '它将在一周内到期';

  @override
  String get triageReasonImportant => '你把它标成了重要';

  @override
  String get triageReasonDueLater => '它的期限还更远一些';

  @override
  String get triageReasonNoDeadline => '它没有期限，也没有什么急迫的地方';

  @override
  String cardCompletedTooltip(String title) {
    return '已完成：$title';
  }

  @override
  String get toolTitleDocumentIntelligence => '读懂这份文档';

  @override
  String get toolDescriptionDocumentIntelligence => '它是什么、哪些要紧，以及该怎么办。';

  @override
  String get toolSectionWhatThisIs => '这是什么';

  @override
  String get toolSectionWhatMatters => '哪些要紧';

  @override
  String get toolSectionKeyDetails => '关键细节';

  @override
  String get toolTitleAskDocument => '就一项采集提问';

  @override
  String get toolDescriptionAskDocument => '答案只出自你选中的内容——找不到就什么都不给。';

  @override
  String get toolSectionNoAnswer => '这份材料里没有找到答案';

  @override
  String get toolSectionNoAnswerBody => 'Action 没能在你选中的那份文档里找到这个。';

  @override
  String get toolSectionAnswer => '答案';

  @override
  String get toolSectionFromTheDocument => '摘自这份文档';

  @override
  String get toolWarningQuoteNotFound => '这个答案所依据的引文不在你选中的材料里。请把这个答案当作不可靠的。';

  @override
  String get toolTitleSmartSummary => '做一份摘要';

  @override
  String get toolDescriptionSmartSummary => '简短的那一版——或者只讲与你要做的事有关的那一版。';

  @override
  String get toolSectionKeyPoints => '要点';

  @override
  String get toolTitleCompareDocuments => '对比多份文档';

  @override
  String get toolDescriptionCompareDocuments => '有什么变了、哪里相互矛盾、哪些内容没有找到。';

  @override
  String get toolSectionWhatDiffers => '有什么不同';

  @override
  String get toolSectionConflicts => '相互矛盾之处';

  @override
  String get toolSectionOnlyInOne => '只出现在其中一份里';

  @override
  String get toolSectionInCommon => '共同之处';

  @override
  String get sensitiveKindEmail => '电子邮件地址';

  @override
  String get sensitiveKindPhone => '电话号码';

  @override
  String get sensitiveKindPaymentCard => '支付卡号';

  @override
  String get sensitiveKindIban => '银行账户（IBAN）';

  @override
  String get sensitiveKindNationalId => '身份证件号码';

  @override
  String get sensitiveKindPostcode => '邮政编码';

  @override
  String get sensitiveKindAccountNumber => '账户号码';

  @override
  String get sensitiveKindReference => '参考编号';

  @override
  String get sensitiveKindDateOfBirth => '出生日期';

  @override
  String get sensitiveKindUrl => '网址';

  @override
  String get verdictVerifiedProvenance => '有经过核验的来源信息';

  @override
  String get verdictVerifiedProvenanceExplainer => '这个文件带有一个签名，该签名经过检查并且通过了。';

  @override
  String get verdictSignalsSynthetic => '有与 AI 生成内容相符的迹象';

  @override
  String get verdictSignalsSyntheticExplainer =>
      '这个文件自称是用生成式工具做出来的。元数据可以被修改或删除，所以这只是文件自己的说法，不是证据。';

  @override
  String get verdictSignalsEdited => '有与经过编辑的内容相符的迹象';

  @override
  String get verdictSignalsEditedExplainer =>
      '这个文件自称经过了编辑软件处理。这对照片来说很寻常，本身并不意味着有什么东西是伪造的。';

  @override
  String get verdictNoReliableProvenance => '没有找到可靠的来源信息';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      '这个文件里没有来源信息。这很正常——大多数服务都会把它去掉——而且这说明不了任何事情。';

  @override
  String get verdictInconclusive => '无法得出结论';

  @override
  String get verdictInconclusiveExplainer => '这里的信息不足以说明它是从哪儿来的。';

  @override
  String get authenticitySignalCamera => '相机';

  @override
  String get authenticitySignalSoftware => '软件';

  @override
  String get authenticitySignalDescription => '描述';

  @override
  String get authenticitySignalCopyright => '版权';

  @override
  String get authenticitySignalLocation => '位置';

  @override
  String get authenticitySignalLocationValue => '这个文件里含有位置数据。';

  @override
  String get authenticitySignalContentCredentials =>
      'Content Credentials（内容凭证）';

  @override
  String get authenticitySignalContentCredentialsValue =>
      '没有检查过——这个版本里没有签名验证器。';

  @override
  String get authenticitySignalFile => '文件';

  @override
  String get authenticitySignalFileUnreadableValue => '没能按图片读出来。';

  @override
  String get authenticitySignalFileUnrecognisedValue => '不是能认出的图片格式。';

  @override
  String get authenticitySignalText => '文字';

  @override
  String get authenticitySignalTextValue => '光凭文字无法可靠地看出是否用了 AI。Action 不做猜测。';

  @override
  String get fileTypePng => '一张 PNG 图片';

  @override
  String get fileTypeJpeg => '一张 JPEG 图片';

  @override
  String get fileTypeGif => '一张 GIF 图片';

  @override
  String get fileTypeWebp => '一张 WebP 图片';

  @override
  String get fileTypeWav => '一段 WAV 录音';

  @override
  String get fileTypePdf => '一份 PDF 文档';

  @override
  String get fileTypeHeic => '一张 HEIC 图片';

  @override
  String get fileTypeVideo => '一个视频文件';

  @override
  String get fileTypeTiff => '一张 TIFF 图片';

  @override
  String get fileTypeBitmap => '一张位图图片';

  @override
  String get fileTypeRtf => '一份 RTF 文档';

  @override
  String get fileTypeZip => '一个 Zip 压缩包';

  @override
  String get fileTypeGzip => '一个 gzip 压缩包';

  @override
  String get fileTypeSevenZip => '一个 7-Zip 压缩包';

  @override
  String get fileTypeRar => '一个 RAR 压缩包';

  @override
  String get fileTypeWindowsProgram => '一个 Windows 程序';

  @override
  String get fileTypeLinuxProgram => '一个 Linux 程序';

  @override
  String get fileTypePostScript => '一份 PostScript 文档';

  @override
  String get fileTypeOgg => '一段 Ogg 录音';

  @override
  String get fileTypeMp3 => '一段 MP3 录音';

  @override
  String get fileTypePlainText => '纯文本';

  @override
  String fileMismatchNote(String extension, String contents) {
    return '这个文件名叫 \".$extension\"，但它的内容是$contents。这可能只是无心之失，同时这也正是一个文件被你意料之外的程序打开的方式。';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 字节',
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
  String get credentialKindPrivateKey => '私钥';

  @override
  String get credentialKindApiKey => 'API 密钥';

  @override
  String get credentialKindConnectionString => '连接字符串';

  @override
  String get credentialKindAccessToken => '访问令牌';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization 请求头';

  @override
  String get credentialKindPasswordOrKey => '密码或密钥';

  @override
  String get credentialKindPossibleSecret => '可能是机密';

  @override
  String get credentialAdvicePrivateKey =>
      '分享之前把它删掉，并且更换这对密钥。私钥一旦被人看到，就再也无法变回安全的了。';

  @override
  String get credentialAdviceProviderApiKey =>
      '到提供方那里吊销这个密钥，并签发一个新的。把它从文档里删掉并不会让它失效。';

  @override
  String get credentialAdviceConnectionString =>
      '它里面既有一个密码，也有这个密码能打开的地址。如果它已经被分享出去过，就去改掉那个密码。';

  @override
  String get credentialAdviceJsonWebToken =>
      '这类令牌通常会过期，但并不总是这样。除非你知道它什么时候过期，否则就把它当作仍然有效的。';

  @override
  String get credentialAdviceAuthorizationHeader =>
      '把这个请求头的值删掉。粘贴出来的请求日志，是一个仍然可用的令牌被无意间分享出去的最常见途径之一。';

  @override
  String get credentialAdviceKeyedAssignment =>
      '把它挪进环境变量或密钥管理服务里，并且如果这个文件已经被分享过，就改掉这个值。';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action 判断不出这是什么。分享之前请先核实——它同样可能是一个标识符或一个校验和。';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API 密钥';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI 项目密钥';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI 风格的 API 密钥';

  @override
  String get credentialLabelGoogleApiKey => 'Google API 密钥';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth 令牌';

  @override
  String get credentialLabelGitHubToken => 'GitHub 令牌';

  @override
  String get credentialLabelSlackToken => 'Slack 令牌';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS 访问密钥 ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab 令牌';

  @override
  String get credentialLabelNpmToken => 'npm 令牌';

  @override
  String get credentialLabelPassphrase => '密码短语';

  @override
  String get credentialLabelPassword => '密码';

  @override
  String get credentialLabelRefreshToken => '刷新令牌';

  @override
  String get credentialLabelToken => '令牌';

  @override
  String get credentialLabelClientSecret => '客户端密钥';

  @override
  String get credentialLabelCredential => '凭据';

  @override
  String get credentialLabelSecret => '机密值';

  @override
  String get linkVerdictNoObviousSignals => '没有明显迹象';

  @override
  String get linkVerdictWorthChecking => '值得看一眼';

  @override
  String get linkVerdictTreatWithCaution => '请谨慎对待';

  @override
  String get linkSummaryNoObviousSignals =>
      '这个链接的写法没有什么不寻常的地方。但这和知道那个页面值得信赖并不是一回事——只有你才能判断这是不是你预料之中的链接。';

  @override
  String get linkSummaryWorthChecking => '关于这个链接，有一处值得你在打开之前先看一眼。';

  @override
  String get linkSummaryTreatWithCaution => '这个链接的写法有好几处值得你在打开之前先看一看。';

  @override
  String get linkSignalNotHttps => '没有加密';

  @override
  String get linkSignalNonWebScheme => '不是网页链接';

  @override
  String get linkSignalEmbeddedCredentials => '链接里带着密码';

  @override
  String get linkSignalMisleadingAuthority => '真实地址被藏住了';

  @override
  String get linkSignalIpLiteralHost => '数字地址';

  @override
  String get linkSignalPunycodeHost => '名称里有编码字符';

  @override
  String get linkSignalMixedScriptHost => '名称里混用了不同的字母';

  @override
  String get linkSignalEncodedHost => '名称里有转义字符';

  @override
  String get linkSignalUnusualPort => '端口不常见';

  @override
  String get linkSignalDeepSubdomain => '名称分成很多段';

  @override
  String get linkSignalPublicSuffixInSubdomain => '眼熟的名字放错了位置';

  @override
  String get linkSignalShortener => '短链接';

  @override
  String get linkSignalExecutableTarget => '会下载一个程序';

  @override
  String get linkSignalRedirectParameter => '可能把你转到别处';

  @override
  String get linkSignalVeryLongUrl => '特别长';

  @override
  String get linkSignalUnparseable => '读不出来的链接';

  @override
  String get linkDetailNotHttps =>
      '这个链接用的是 http，所以你在那个页面上输入的任何内容，在送过去的路上都可能被人读到。';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return '这个链接打开的是“$scheme:”，而不是一个网页。它可能会请另一个应用去做点什么。';
  }

  @override
  String get linkDetailEmbeddedCredentials => '这个链接里写进了用户名和密码。它被分享到哪里，它们就跟到哪里。';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return '浏览器会忽略“@”之前的所有内容。真正的目的地是“$host”。';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return '这个链接指向“$host”——一个原始地址，而不是一个名称。正规站点几乎总是用名称。';
  }

  @override
  String get linkDetailPunycodeHost =>
      '这个站点名称含有非拉丁字母的字符，以编码形式存放。这对很多语言来说都很正常，同时这也是让一个名称看上去像另一个眼熟名称的做法。';

  @override
  String get linkDetailMixedScriptHost =>
      '这个站点名称把拉丁字母和另一种字母里长得一模一样的字母混在了一起。请一个字符一个字符地读一遍。';

  @override
  String get linkDetailEncodedHost =>
      '这个站点名称里含有转义码，而那里本不该出现它们。它们可能把名称实际写的内容藏起来。';

  @override
  String linkDetailUnusualPort(String port) {
    return '这个链接连的是 $port 端口，而不是通常的那个端口。这在测试服务器上很常见，在公开站点上则不常见。';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这个名称有 $count 段。只有最后两段决定这个站点归谁运营；其余部分可以随便设成什么。',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return '这个名称中间含有“.$suffix.”，于是开头那部分看上去才像是这个站点。实际上这个站点是“$host”。';
  }

  @override
  String get linkDetailShortener => '短链接服务把真正的目的地藏了起来。不打开它，你就无法知道它通向哪里。';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return '这个链接以“$fileExtension”结尾，所以它下载的是一个能在你设备上运行的东西，而不是一个供你阅读的页面。';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return '这个链接在它的“$parameter”设置里带着第二个地址，所以打开它可能会把你带到“$host”以外的地方。';
  }

  @override
  String get linkDetailVeryLongUrl => '长链接更难读，而且决定目的地的那一部分可能被挤到看不见的地方去。';

  @override
  String get linkDetailUnparseable =>
      'Action 没能把它当作一个网址读出来。对那些看起来不像链接的链接，请多加小心。';

  @override
  String get toolTitleRedaction => '隐去敏感信息';

  @override
  String get toolDescriptionRedaction => '找出不该分享的内容，再做一份去掉它们的副本。';

  @override
  String get toolSectionRedactionNothingToScan => '没有可扫描的内容';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      '这个工具读的是文字。请选一条便签、一条粘贴进来的消息，或者一项已经读出文字的采集。';

  @override
  String get toolSectionRedactionNothingFound => '没有找到明显的东西';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      '在这段文字里，Action 没有找到电子邮件地址、电话号码、卡号或参考编号。';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 处值得隐去的内容',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => '隐去后的副本';

  @override
  String get toolWarningRedactionCoverage =>
      '它找的是电子邮件地址、电话号码、账号这类有固定形态的内容。它不会把所有敏感信息都找出来——分享之前，请把副本读一遍。';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action 无法隐去图片和 PDF 文件里的内容。在图片上盖住一处，原始内容还留在下面，所以这里不提供这个选项。';

  @override
  String get toolTitleAuthenticity => '查看文件来自哪里';

  @override
  String get toolDescriptionAuthenticity => '一个文件自己声称它来自哪里。';

  @override
  String get toolSectionAuthenticityNothingToInspect => '没有可查看的内容';

  @override
  String get toolSectionAuthenticityNothingToInspectBody => '请选一张图片或一段文字。';

  @override
  String get toolSectionAuthenticityFileSignals => '这个文件自己说了什么';

  @override
  String get toolSectionAuthenticityFileItself => '文件本身';

  @override
  String get toolSectionFileContents => '内容';

  @override
  String get toolSectionFileUnknownFormat => 'Action 不认识的格式';

  @override
  String get toolSectionFileSize => '大小';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      '这里报告的是文件自己声称的内容。元数据可以被修改，也可以被抹掉，所以这里没有任何一项能当作证据。不要拿它去指控任何人。';

  @override
  String get toolTitleCredentialScanner => '查找密钥和密码';

  @override
  String get toolDescriptionCredentialScanner => '在你分享之前，先找出里面的凭据。';

  @override
  String get toolSectionCredentialNothingToCheck => '没有可检查的内容';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      '粘贴一段文字，或者选一项已经读出文字的采集。这个工具只读文字。';

  @override
  String get toolSectionCredentialNoneFound => '没有找到凭据';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      '在这段文字里，Action 没有找到形态像 API 密钥、私钥、令牌或密码的东西。';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '找到 $count 项凭据',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 处可能是机密值的东西',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy => '去掉了这些凭据的副本';

  @override
  String get toolWarningCredentialRevoke =>
      '把一个密钥从文档里删掉，并不会让它失效。如果其中某一个已经分享出去了，请到签发它的提供方那里撤销它，并重新签发一个新的。';

  @override
  String get toolWarningCredentialCoverage =>
      '它找的是形态可辨认的凭据。写在句子里的一个密码是找不到的，所以请把这段文字也读一遍。';

  @override
  String get toolTitleLinkInspector => '查看一个链接';

  @override
  String get toolDescriptionLinkInspector => '在你打开之前，一个地址已经透露了什么。';

  @override
  String get toolSectionLinkNoneFound => '没有找到链接';

  @override
  String get toolSectionLinkNoneFoundBody => '粘贴一个链接，或者选一项含有链接的采集。';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这段文字里的 $count 个链接',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => '读不出来';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary。$detail';
  }

  @override
  String get toolSectionLinkNothingUnusual => '这些链接的写法没有什么不寻常的地方';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      '这和知道那些页面值得信赖并不是一回事。只有你才能判断它们是不是你预料之中的。';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action 只读这个地址。它不会打开这个链接，不会去查询这个站点，也不会去查任何信誉服务——那样做就等于把你的浏览行踪送到别人那里。';

  @override
  String get toolWarningLinkNoSignals =>
      '一个没有任何迹象的链接照样会造成伤害。这里找的是地址写法上的问题，而这并不是关于它通向哪里的全部。';

  @override
  String get toolSectionObjective => '你想达成的事';

  @override
  String get toolSectionCurrentState => '目标进展到哪一步';

  @override
  String get toolSectionRecommendedNextStep => '建议的下一步';

  @override
  String get toolSectionCredentialAdvice => '该怎么做';

  @override
  String get toolSectionSummary => '摘要';

  @override
  String get toolDetailSeparator => ' · ';
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
      '有些工具從不傳送任何東西：隱去敏感資訊、查看檔案來自哪裡、找出憑證以及檢查連結，全都完全在本機執行。';

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

  @override
  String get detailSaveFailed => '這個沒能儲存。什麼都沒丟——請再試一次。';

  @override
  String get detailSectionCreatedFrom => '建立來源';

  @override
  String get detailSourceChecking => '正在載入原始擷取…';

  @override
  String get detailSourceUnavailable => '原始擷取已經無法取得。';

  @override
  String get detailReopenAction => '重新開啟這項待辦';

  @override
  String get detailMarkActionComplete => '把這項待辦標為已完成';

  @override
  String get detailGetHelp => '就這項待辦尋求協助';

  @override
  String get detailSectionHistory => '歷程';

  @override
  String get detailHistoryShowLess => '顯示較少';

  @override
  String detailHistoryShowAll(int count) {
    return '顯示全部 $count 筆';
  }

  @override
  String get detailHistoryCreated => '已建立';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '建立時已有 $count 個步驟',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => '你確認了這些詳細資料';

  @override
  String detailHistoryStepFinished(String title) {
    return '完成了「$title」';
  }

  @override
  String get detailHistoryAStep => '某個步驟';

  @override
  String get detailHistoryReminderSet => '你設了一則提醒';

  @override
  String detailHistoryReminderSetFor(String when) {
    return '你設了一則提醒，時間是 $when';
  }

  @override
  String get detailHistoryCompleted => '標記為完成';

  @override
  String get detailHistoryChanged => '最後變更';

  @override
  String get detailHistoryTimestampFormat => 'yyyy年M月d日 HH:mm';

  @override
  String get aiProviderCustom => '自訂（OpenAI 相容）';

  @override
  String get aiCapabilityText => '文字';

  @override
  String get aiCapabilityImages => '圖片';

  @override
  String get aiCapabilityDocuments => '文件';

  @override
  String get aiCapabilityStructuredResults => '結構化結果';

  @override
  String get aiCapabilityStreaming => '串流輸出';

  @override
  String get aiCapabilitySystemInstructions => '系統指令';

  @override
  String get aiCapabilityEvidenceCitations => '原文出處';

  @override
  String get aiCapabilityLongDocuments => '長篇文件';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a、$b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a或$b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head或$last';
  }

  @override
  String get aiFailureNotConfigured => '接上 AI 服務商即可使用這個工具。';

  @override
  String get aiFailureInvalidKey => '服務商沒有接受那個 API 金鑰。';

  @override
  String get aiFailureQuotaExceeded => '你的服務商帳號已經沒有額度，或是已達用量上限。';

  @override
  String get aiFailureRateLimited => '你的服務商正在限制請求速率。請稍後再試。';

  @override
  String get aiFailureNetworkUnavailable => 'Action 聯繫不上你的 AI 服務商。請檢查你的連線。';

  @override
  String get aiFailureUnsupportedModel => '你的金鑰無法使用那個模型。請在設定中換一個。';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return '你選的模型無法讀取$capabilities。請在設定中換一個模型。';
  }

  @override
  String get aiFailureContextTooLarge => '那些內容太多了，這個模型沒辦法一次讀完。';

  @override
  String get aiFailureInputTooLargeText => '那段文字超過一次能分析的量。';

  @override
  String get aiFailureProviderUnavailable => '你的 AI 服務商那邊出了狀況。請稍後再試。';

  @override
  String get aiFailureMalformedResponse => '那個服務商回傳了 Action 讀不了的內容。';

  @override
  String get aiFailureCancelled => '已停止。';

  @override
  String get aiFailureInsecureEndpoint => '那個 endpoint 必須是 https:// 位址。';

  @override
  String get aiFailureUnknown => '與你的 AI 服務商溝通時出了點問題。';

  @override
  String get appLockTitle => 'Action 已鎖定';

  @override
  String get appLockPrompt =>
      '確認是你本人才能繼續。Action 會請你的裝置確認 —— 它從來看不到你的指紋、臉部或 PIN。';

  @override
  String get appLockUnlocking => '正在解鎖…';

  @override
  String get appLockNotConfirmed => '那次沒有得到確認。準備好了再試一次。';

  @override
  String get appLockCannotConfirm => '你的裝置現在無法確認是你本人。請到裝置設定檢查螢幕鎖是否仍然設定著。';

  @override
  String get appLockWaiting => '等待中…';

  @override
  String get appLockUnlock => '解鎖';

  @override
  String get appLockReasonUnlock => '解鎖 Action';

  @override
  String get appLockReasonEnable => '開啟應用程式鎖前，請確認是你本人';

  @override
  String get appLockReasonDisable => '關閉應用程式鎖前，請確認是你本人';

  @override
  String get todayCapabilityHeading => 'Action 能處理什麼';

  @override
  String get todayCapabilityDocumentTitle => '一封信或一張帳單';

  @override
  String get todayCapabilityDocumentBlurb => 'Action 會讀它，並找出期限、金額和參考編號。';

  @override
  String get todayCapabilityScreenshotTitle => '一張螢幕截圖';

  @override
  String get todayCapabilityScreenshotBlurb => '把一則本來會忘掉的訊息，變成你能動手做的事。';

  @override
  String get todayCapabilityTextTitle => '一段文字';

  @override
  String get todayCapabilityTextBlurb => '貼上任何東西。Action 會判斷出它是什麼，以及它要你做什麼。';

  @override
  String get todayCapabilityConfirmTitle => '一切都由你確認';

  @override
  String get todayCapabilityConfirmBlurb => '在你看過原文出處並點頭之前，什麼都不會變成待辦。';

  @override
  String get todayCapabilityExploreIntelligence => '探索智慧';

  @override
  String get documentRejectedEmpty => '那個檔案是空的。';

  @override
  String documentRejectedTooLarge(String size) {
    return '那份文件是 $size，超過 Action 能處理的大小。';
  }

  @override
  String get documentRejectedNotAPdf => '不管它叫什麼名字，那都不是 PDF。Action 讀得了 PDF 和圖片。';

  @override
  String get documentRejectedUnreadable => '那份文件讀不出來。';

  @override
  String get pdfRejectedNotAPdf => '不管它叫什麼名字，那個檔案都不是 PDF。';

  @override
  String get pdfRejectedEncrypted => '那個 PDF 有密碼保護，所以 Action 讀不了它。';

  @override
  String get pdfRejectedDamaged => '那個 PDF 讀不出來。它可能不完整。';

  @override
  String get shareRejectedEmpty => '那次分享裡沒有可以讀的東西。';

  @override
  String get shareRejectedUnsupportedType => 'Action 可以接收文字、圖片和 PDF。那是別的東西。';

  @override
  String get shareRejectedContentMismatch => '那個檔案不是它自稱的那種檔案，所以 Action 沒有打開它。';

  @override
  String get shareRejectedTooLarge => '那個檔案太大，Action 處理不了。';

  @override
  String get shareRejectedUnreadable => '那個檔案讀不出來。';

  @override
  String get captureFailureRecognition => '文字辨識沒能執行。';

  @override
  String get captureFailureImageFormat => '那種圖片格式在這台裝置上讀不了。';

  @override
  String get connectSheetTitle => '接上你的 AI';

  @override
  String get connectSheetSubtitle =>
      '你使用自己的服務商帳號和 API 金鑰。Action 把金鑰存在這台裝置的安全儲存區裡。';

  @override
  String get connectErrorKeyMissing => '貼上你的 API 金鑰才能繼續。';

  @override
  String get connectErrorModelMissing => '選一個模型，或輸入一個模型 ID。';

  @override
  String get connectErrorEndpointMissing => '填上你的 endpoint 位址。';

  @override
  String get connectErrorSecureStorageUnavailable => '這台裝置的安全儲存區打不開，所以金鑰沒有存下來。';

  @override
  String get connectTestSucceeded => '已接上。';

  @override
  String connectTestSucceededWithModels(int count) {
    return '已接上。有 $count 個模型可用。';
  }

  @override
  String get connectProviderLabel => '服務商';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      '必須是 https:// 位址。Action 不會透過未加密的連線傳送你的文件。';

  @override
  String get connectApiKeyLabel => 'API 金鑰';

  @override
  String get connectApiKeyHint => '貼上你的金鑰';

  @override
  String get connectKeyPrivacyNote =>
      '你的金鑰留在這台裝置上。除了你選的服務商，Action 不會把它傳送到任何地方，而且儲存之後也無法再顯示給你看。';

  @override
  String get connectModelLabel => '模型';

  @override
  String get connectModelIdHint => '模型 ID';

  @override
  String get connectModelFreeTextNote =>
      '服務商會淘汰舊的模型 ID，也會加入新的。如果清單上沒有你要的那個，就在這裡輸入。';

  @override
  String get connectAndTest => '接上並測試';

  @override
  String get connectSaveWithoutTesting => '不測試就儲存';

  @override
  String get toolWarningFactsNotChecked =>
      'Action 沒能把這份結果拿去和原文比對，所以其中的金額和日期並未經過檢查。';

  @override
  String get toolTitleRewrite => '潤飾這段文字';

  @override
  String get toolDescriptionRewrite => '更清楚、更簡短或更正式 —— 事實原樣保留。';

  @override
  String get toolModeRewriteClearer => '更清楚';

  @override
  String get toolModeRewriteProfessional => '更專業';

  @override
  String get toolModeRewriteShorter => '更簡短';

  @override
  String get toolModeRewritePersuasive => '更有說服力';

  @override
  String get toolModeRewriteSimpler => '更淺白';

  @override
  String get toolModeRewriteStructured => '更有條理';

  @override
  String get toolModeRewriteGrammarOnly => '只改文法';

  @override
  String get toolSectionWhatChanged => '改了什麼';

  @override
  String get toolSectionNote => '附註';

  @override
  String get toolSectionAlreadyClearBody => '這段文字本來就已經很清楚。下面的改動幅度不大。';

  @override
  String get toolSectionImprovedText => '潤飾後的文字';

  @override
  String get toolTitleDraftReply => '起草一封回覆';

  @override
  String get toolDescriptionDraftReply => '一份你可以自己修改、自己寄出的回覆。';

  @override
  String get toolModeReplyProfessional => '專業';

  @override
  String get toolModeReplyConcise => '簡潔';

  @override
  String get toolModeReplyFriendly => '友善';

  @override
  String get toolModeReplyFormal => '正式';

  @override
  String get toolModeReplyClarification => '請對方說明清楚';

  @override
  String get toolModeReplyConfirmation => '回覆已收到';

  @override
  String get toolModeReplyDispute => '提出異議';

  @override
  String get toolSectionSubject => '主旨';

  @override
  String get toolSectionDraftReply => '回覆草稿';

  @override
  String get toolSectionPlaceholders => '這些需要你自己填上';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return '草稿 —— $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      '這是一份草稿。Action 不會寄送任何東西 —— 請你自己讀過、自己改過，再自己寄出。';

  @override
  String get toolTitleTranslate => '翻譯';

  @override
  String get toolDescriptionTranslate => '換成另一種語言，數字和名稱原樣保留。';

  @override
  String get toolSectionTranslation => '譯文';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '從$from譯為$to';
  }

  @override
  String get toolSectionKeptInOriginal => '保留原文未譯';

  @override
  String get toolWarningTranslationNotCertified => '這是供你理解內容用的翻譯，不是經過認證的正式譯本。';

  @override
  String get toolTitleStructuredData => '抽出表格';

  @override
  String get toolDescriptionStructuredData => '可以複製出去的列、欄位和數字。';

  @override
  String get toolSectionTable => '表格';

  @override
  String get toolSectionFields => '欄位';

  @override
  String get toolSectionTableCsv => '表格 (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      '這個表格的欄位配置沒能可靠地讀出來。使用前請先確認每一列的內容有對齊。';

  @override
  String get toolTitleDeadlineFinder => '找出期限';

  @override
  String get toolDescriptionDeadlineFinder => '有什麼要辦、什麼時候要辦，以及沒辦到會怎樣。';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項期限',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => '沒有到期的事項';

  @override
  String get toolSectionNothingDueBody => 'Action 在這份材料裡沒有找到任何期限或必須履行的事項。';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      '在你選定之前，什麼都不會排上時間。提醒絕不會自動設定。';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return '沒做到的話：$consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return '你需要：$items';
  }

  @override
  String get moneyErrorEmpty => '沒有填金額';

  @override
  String get moneyErrorMalformed => '這個金額不是單純的數字';

  @override
  String get moneyErrorNegative => '金額是負數，而應付的款項不會是負數';

  @override
  String get moneyErrorTooManyDecimals => '小數位數比這種貨幣本身的位數還多';

  @override
  String get moneyErrorUnsupportedCurrency => '這個貨幣代碼不是我們認得的代碼';

  @override
  String get moneyErrorOutOfRange => '這個金額大得不像真的';

  @override
  String get escalationOcrFailed => '文字辨識在這項擷取上根本沒能執行。';

  @override
  String get escalationNoTextRecognised => '這看起來像一份文件，但沒有辨識出任何文字。';

  @override
  String get escalationThinText => '以這麼大一份文件來說，辨識出來的文字少得太多了。';

  @override
  String get escalationLowLineConfidence => '辨識引擎回報有好幾行的信心度偏低。';

  @override
  String get escalationTableLikeLayout => '這個版面看起來像表格，而逐行讀取會失去哪個數值屬於哪一列的對應關係。';

  @override
  String get escalationFragmentedLayout => '讀回來的文字是許多零碎的片段，所以結構並不清楚。';

  @override
  String get escalationMalformedText => '辨識出來的文字有很大一部分不是讀得懂的字詞或數字。';

  @override
  String get escalationConflictingDates => '文件裡有不只一個日期被呈現為期限。';

  @override
  String get escalationConflictingAmounts => '文件裡有不只一個金額被呈現為應付的款項。';

  @override
  String get escalationUnresolvedGrounding => '有些數值沒能追溯回文件裡的文字。';

  @override
  String get escalationInstructionLikeContent =>
      '這份文件裡有些文字寫得像是給應用程式的指令。它會被當成文件內容處理，絕不會被當成指令。';

  @override
  String get providerFailureNetwork => 'Action 聯繫不上該服務。請檢查你的連線。';

  @override
  String get providerFailureTimedOut => '該服務太久沒有回應。';

  @override
  String get providerFailureServiceUnavailable => '該服務暫時無法使用。請稍後再試。';

  @override
  String get providerFailureUnauthorized => '這個應用程式目前沒有取得使用該服務的授權。';

  @override
  String get providerFailureBlocked => '該服務拒絕處理這份文件。';

  @override
  String get providerFailureUnknown => 'Action 沒能讀懂這份文件。再試一次也許可以。';

  @override
  String get reviewBlockerTitle => '給這項待辦一個標題。';

  @override
  String get reviewBlockerDate => '選出哪一個日期才是真正的期限，或者選擇不設定。';

  @override
  String get reviewBlockerAmount => '選出哪一個金額才是對的，或者選擇不設定。';

  @override
  String get reviewBlockerStepTitle => '你要保留的步驟需要有標題。';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: '第 $page 頁',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return '第 $start–$end 頁';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '改寫後的文字裡已經沒有 $values。使用之前請先檢查。',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '改寫後的文字裡已經沒有 $values，另外還有 $count 項也不見了。使用之前請先檢查。',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => '、';

  @override
  String get goalStatusReached => '已達成';

  @override
  String get goalNewSheetTitle => '你希望發生什麼？';

  @override
  String get goalNewSheetSubtitle => '一句話就夠了。細節可以之後再補。';

  @override
  String get goalTitleHint => '續保車險，但不要多花錢。';

  @override
  String get goalCreateAction => '建立目標';

  @override
  String get goalTitleSheetTitle => '你想要什麼';

  @override
  String get goalOutcomeSheetTitle => '做完是什麼樣子';

  @override
  String get goalContextSheetTitle => '目前進展到哪';

  @override
  String get goalOutcomeHint => '車險已經保好，文件也都歸檔了。';

  @override
  String get goalContextHint => '我拿到了兩份報價，續保日是 18 號。';

  @override
  String get goalWorkspaceTitle => '目標';

  @override
  String get goalUnmarkReached => '其實還沒達成';

  @override
  String get goalMarkReached => '標為已達成';

  @override
  String get goalNotFound => '那個目標已經不在了。';

  @override
  String get goalDeleteTitle => '刪除這個目標？';

  @override
  String get goalDeleteBody => '這個目標會從這台裝置上刪除。從它產生的待辦完全保持原樣。';

  @override
  String get goalOutcomeLabel => '做完是什麼樣子';

  @override
  String get goalOutcomeEmpty => '還沒有寫。先說清楚做完代表什麼，目標會比較好規劃。';

  @override
  String get goalContextLabel => '目前進展到哪';

  @override
  String get goalContextEmpty => '還沒有寫任何東西。到目前為止發生了什麼，以及卡在哪裡。';

  @override
  String get goalTitleLabel => '你想要什麼';

  @override
  String get goalEditTooltip => '編輯目標';

  @override
  String get goalToolsLabel => 'Action 能做什麼';

  @override
  String get goalToolsNotReady => '再多寫一點你想要什麼，這些工具才有東西可以用。';

  @override
  String get toolGoalOptimizerTitle => '打磨一個目標';

  @override
  String get toolActionPlanTitle => '搭一個計畫';

  @override
  String get resultFactUnconfirmed => '未經確認';

  @override
  String get resultSuggestedSteps => '建議的步驟';

  @override
  String get resultSuggestedAction => '建議的待辦';

  @override
  String get resultWorthAsking => '值得問清楚的';

  @override
  String get resultSuggestedDeadlines => '建議的期限';

  @override
  String get resultSuggestions => '建議事項';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 段佐證引文',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => '來自你選取的來源';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source、$page';
  }

  @override
  String get toolRunStagePreparing => '正在準備你的文件';

  @override
  String get toolRunStageReading => '正在讀取你選取的頁面';

  @override
  String get toolRunStageAnalysing => '分析中';

  @override
  String get toolRunStageBuilding => '正在整理你要核對的內容';

  @override
  String get toolRunStageDone => '已完成';

  @override
  String get toolRunStageFailed => '那次沒有跑完';

  @override
  String get toolRunStageCancelled => '已停止';

  @override
  String get toolRunFailureLocalCheckFailed => '那次檢查沒能完成。';

  @override
  String get toolRunFailureProviderRetired => '這個版本已經不再支援那個 AI 服務商。';

  @override
  String get toolRunFailureUnusableReply => '那次回覆傳回來的形式沒辦法使用。請再試一次。';

  @override
  String get toolRunFailureQuestionRequired => '請先輸入一個問題。';

  @override
  String get toolRunFailureInputRequired => '選一個東西讓這個工具處理。';

  @override
  String get toolWarningReplyTruncated => '這次回覆中途就被截斷了，所以你看到的內容可能不完整。';

  @override
  String get toolWarningNoSupportingQuotes =>
      '你的模型沒有回傳任何佐證引文，所以這裡的每一項都沒有佐證。在依此行動之前，請對照文件核對。';

  @override
  String get aiSettingsRemoveTitle => '移除這個連接？';

  @override
  String get aiSettingsRemoveBody =>
      'Action 會從這台裝置刪除你的 API 金鑰，並停止使用 AI 功能。你在服務商那邊的帳號不受影響。';

  @override
  String get aiSettingsProviderLabel => '服務商';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      '你用了多少，由你的服務商向你收費。Action 從不會自行發出請求。';

  @override
  String get aiSettingsConnectLabel => '接上一個 AI 服務商';

  @override
  String get aiSettingsConnectDescription =>
      '使用你自己的帳號和 API 金鑰，搭配 OpenAI、Anthropic、Google Gemini 或相容的 endpoint。';

  @override
  String get aiSettingsModelLabel => '模型';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API 金鑰';

  @override
  String get aiSettingsKeyStored => '存放在這台裝置的安全儲存區裡。';

  @override
  String get aiSettingsKeyMissing => '在這台裝置上找不到金鑰。請重新接上以新增一把。';

  @override
  String get aiSettingsTestLabel => '測試連線';

  @override
  String get aiSettingsProviderUnavailable => '這個版本沒有提供那個服務商。';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return '已接上。有 $count 個模型可用。';
  }

  @override
  String get aiSettingsTestButton => '測試';

  @override
  String get aiSettingsChangeProvider => '更換服務商或模型';

  @override
  String get aiSettingsRemoveKey => '刪除金鑰';

  @override
  String get aiSettingsSectionPrivacy => '隱私';

  @override
  String get aiSettingsWhatGetsSentLabel => '會傳送什麼';

  @override
  String get aiSettingsWhereItGoesLabel => '會傳送到哪裡';

  @override
  String get aiSettingsWhereItGoesNoProvider => '在你接上服務商之前，不會傳送任何東西。';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return '直接傳給 $provider，用的是你的金鑰。它不會經過 Action 的伺服器。';
  }

  @override
  String get aiSettingsSectionData => '資料';

  @override
  String get aiSettingsDataFootnote => 'Action 只記得你用過哪些工具，絕不記得你把它們用在什麼內容上。';

  @override
  String get aiSettingsRecentToolsLabel => '最近用過的工具';

  @override
  String get aiSettingsRecentToolsNone => '無';

  @override
  String get reminderNotificationTitle => 'Action 提醒';

  @override
  String get reminderNotificationPrivateBody => '你有東西要查看。';

  @override
  String get reminderChannelName => 'Action 提醒事項';

  @override
  String get reminderChannelDescription => '你自己為待辦設定的提醒。';

  @override
  String get onboardingStart => '開始使用 Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return '第 $current 步，共 $total 步';
  }

  @override
  String get onboardingCaptureTitle => '把資訊變成待辦';

  @override
  String get onboardingCaptureBody =>
      '加入一張螢幕截圖、一張照片，或別人傳給你的文字。Action 會讀它，並判斷出它要你做什麼。';

  @override
  String get onboardingReviewTitle => '在你確認之前，什麼都不會儲存';

  @override
  String get onboardingReviewBody =>
      'Action 會顯示它找到了什麼，以及那些內容來自哪些字。有錯的地方由你修正。在你確認之前，它只是一項建議 —— 不是事實，也不是一項待辦。';

  @override
  String get onboardingTrackingTitle => '掌握要緊的事';

  @override
  String get onboardingTrackingBody =>
      '「需要處理」會把已逾期或快到期的往前排。每一項待辦都會保留它的下一步、它的進度，以及你為它設定的任何提醒。';

  @override
  String get onboardingPrivacyBody => '開始之前，有幾件事值得先知道：';

  @override
  String get onboardingPrivacyOnDevice =>
      '你的待辦、擷取、提醒和搜尋都儲存在這台裝置上。搜尋和提醒不需要連線也能運作。';

  @override
  String get onboardingPrivacySentToRead =>
      '當你請 Action 解讀某個東西時，那份內容會傳送給讀它的 AI 服務。';

  @override
  String get onboardingPrivacyCloud =>
      '一項待辦經你確認後，它的一則簡短紀錄 —— 標題、日期、金額和建議的步驟 —— 可能會以這台裝置的匿名識別碼儲存到雲端。你的擷取、步驟和提醒則不會。';

  @override
  String get onboardingPrivacyNotBackup => '那則紀錄不是備份。它無法把任何東西還原到新的裝置上。';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項阻礙',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => '可以更簡單';

  @override
  String get toolDescriptionGoalOptimizer => '缺了什麼、卡在哪裡、先做什麼。';

  @override
  String toolSectionStepDependsOn(String step) {
    return '接在$step之後';
  }

  @override
  String get toolSectionThePlan => '這份計畫';

  @override
  String get toolDescriptionActionPlan => '一組有先後順序的步驟，你可以把它們變成待辦。';

  @override
  String get toolTitleSmartChecklist => '列一份檢查清單';

  @override
  String get toolDescriptionSmartChecklist => '這份內容要你做的事，依序列出。';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項沒找到的細節',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => '這幾處內容彼此矛盾';

  @override
  String get toolTitleMissingInformation => '缺少什麼';

  @override
  String get toolDescriptionMissingInformation => '有哪些缺漏，以及該為這些缺漏向對方問什麼。';

  @override
  String get aiAdapterTimedOut => '那次花的時間太久，已經停止了。';

  @override
  String get aiAdapterSecureConnectionFailed => '與你的 AI 服務商之間的安全連線失敗了。';

  @override
  String get aiAdapterModelOrEndpointNotFound => 'Action 找不到那個模型或那個 endpoint。';

  @override
  String get aiAdapterRequestRejected => '你的 AI 服務商拒絕了那個請求。';

  @override
  String get aiAdapterSecureStorageUnavailable => 'Action 沒能打開這台裝置的安全儲存區。';

  @override
  String get aiAdapterEndpointMissing => '請在設定中填上你的 AI endpoint 位址。';

  @override
  String get aiAdapterReplyIncomplete => '那則回應不完整。請再試一次。';

  @override
  String get aiAdapterContentDeclined => '你的服務商拒絕處理那份內容。';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return '那超過一次 $limit 個檔案的上限。請少選一些。';
  }

  @override
  String get aiAdapterImageTooLarge => '那些圖片裡有一張太大，無法分析。';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '「$filename」太大，無法分析。上限是 $limit MB。';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '「$filename」有 $count 頁。Action 一次最多讀 $limit 頁 —— 請選一段範圍。';
  }

  @override
  String get aiAdapterSelectionTooLarge => '你選的內容太多，沒辦法放在一個請求裡一起傳送。';

  @override
  String get toolRunNotAvailableTitle => '那個工具無法使用';

  @override
  String get toolRunNotAvailableMessage => '它可能在較新版本的 Action 中被移除了。';

  @override
  String get toolRunNoSourcesYet => '還沒有可以處理的東西。擷取點什麼，或在下面貼上一些文字。';

  @override
  String get toolRunChooseSourcesToCompare => '選擇要比較的內容';

  @override
  String get toolRunChooseSource => '選擇一份來源';

  @override
  String get toolRunQuestionLabel => '你的問題';

  @override
  String get toolRunQuestionHint => '期限是什麼時候？';

  @override
  String get toolRunFreeTextLabel => '或者貼上一段文字';

  @override
  String get toolRunFreeTextHint => '在這裡貼上或輸入';

  @override
  String get toolRunModeLabel => '風格';

  @override
  String get toolRunRunLocally => '在這台裝置上檢查';

  @override
  String get toolRunRun => '執行';

  @override
  String get toolRunStop => '停止';

  @override
  String get toolRunRunAgain => '再執行一次';

  @override
  String get toolRunWorkingOn => '處理對象：';

  @override
  String toolRunFirstUseTitle(String provider) {
    return '要把這些內容傳送給 $provider 嗎？';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return '你選取的內容會用你的 API 金鑰傳送給 $provider 處理。';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      '你的金鑰留在這台裝置上。Action 不會在背景傳送任何東西，也不會傳送你其他的待辦或來源。';

  @override
  String get toolRunScopeTitle => '在執行之前';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '會用你的 $provider 連線分析 $count 頁。',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '會用你的 $provider 連線分析 $count 個檔案。',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return '你選取的文字會傳送到你的 $provider 連線。';
  }

  @override
  String get toolRunNeedsProviderTitle => '接上 AI 服務商就能使用這個工具';

  @override
  String get toolRunNeedsProviderBody => '你使用自己的服務商帳號和 API 金鑰。';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已用 $count 個步驟建立一項待辦。',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已新增 $count 個步驟。',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個步驟',
    );
    return '建立一項待辦 · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個步驟',
    );
    return '加到這項待辦 · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => '照片';

  @override
  String get sourceTypeLabelScreenshot => '螢幕截圖';

  @override
  String get sourceTypeLabelPastedText => '貼上的筆記';

  @override
  String get sourceTypeLabelDocument => '文件';

  @override
  String get toolModeClearer => '更清楚';

  @override
  String get toolModeMoreProfessional => '更專業';

  @override
  String get toolModeShorter => '更簡短';

  @override
  String get toolModeSimpler => '更淺白';

  @override
  String get toolModeMoreStructured => '更有結構';

  @override
  String get toolModeMorePersuasive => '更有說服力';

  @override
  String get toolModeGrammarOnly => '只改文法';

  @override
  String get toolModeProfessional => '專業';

  @override
  String get toolModeConcise => '精簡';

  @override
  String get toolModeFriendly => '友善';

  @override
  String get toolModeFormal => '正式';

  @override
  String get toolModeAskForClarification => '要求釐清';

  @override
  String get toolModeConfirm => '確認收到';

  @override
  String get toolModeDispute => '提出異議';

  @override
  String get toolModeQuick => '速覽';

  @override
  String get toolModeDetailed => '詳細';

  @override
  String get toolModeExecutive => '決策導向';

  @override
  String get toolModeKeyPoints => '重點';

  @override
  String get toolModeActionFocused => '待辦導向';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 處引用的細節無法在你選取的內容裡找到，所以它們被標為不確定。',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action 沒能把這些引文拿去和檔案本身比對，所以它們沒有經過比對。';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已逾期 · $count 天',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => '明天到期';

  @override
  String get triageBadgeReminderSoon => '提醒即將到來';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已經逾期 $count 天',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status。$title';
  }

  @override
  String get triageExplanationDone => '這一項已經完成了。';

  @override
  String get triageExplanationNothingPressing => '它在這裡，是因為目前還沒有什麼緊迫的地方。';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return '這一項需要處理，因為$reason。';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return '這一項排在比較下面，因為$reason。';
  }

  @override
  String get triageReasonOverdue => '它已經逾期了';

  @override
  String get triageReasonDeadlinePassed => '它的期限已經過了';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '它已經逾期 $count 天了',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => '它今天到期';

  @override
  String get triageReasonCriticalDueSoon => '你把它標成緊要，而且它的期限快到了';

  @override
  String get triageReasonAllStepsDone => '每個步驟都完成了，只差把它標為完成';

  @override
  String get triageReasonDueTomorrow => '它明天到期';

  @override
  String get triageReasonReminderSoon => '你為它設了一則提醒，就在接下來一天之內';

  @override
  String get triageReasonDueWithinThreeDays => '它三天內到期';

  @override
  String get triageReasonCriticalNoDeadline => '你把它標成緊要，而且它沒有期限';

  @override
  String get triageReasonDueWithinSevenDays => '它一週內到期';

  @override
  String get triageReasonImportant => '你把它標成重要';

  @override
  String get triageReasonDueLater => '它的期限比較遠';

  @override
  String get triageReasonNoDeadline => '它沒有期限，也沒有什麼緊迫的地方';

  @override
  String cardCompletedTooltip(String title) {
    return '已完成：$title';
  }

  @override
  String get toolTitleDocumentIntelligence => '讀懂這份文件';

  @override
  String get toolDescriptionDocumentIntelligence => '這是什麼、哪裡要緊、該怎麼處理。';

  @override
  String get toolSectionWhatThisIs => '這是什麼';

  @override
  String get toolSectionWhatMatters => '哪裡要緊';

  @override
  String get toolSectionKeyDetails => '關鍵細節';

  @override
  String get toolTitleAskDocument => '詢問一份來源';

  @override
  String get toolDescriptionAskDocument => '答案只出自你選取的內容 —— 否則就不給答案。';

  @override
  String get toolSectionNoAnswer => '這份材料裡找不到答案';

  @override
  String get toolSectionNoAnswerBody => 'Action 沒能在你選取的文件裡找到那個。';

  @override
  String get toolSectionAnswer => '答案';

  @override
  String get toolSectionFromTheDocument => '出自這份文件';

  @override
  String get toolWarningQuoteNotFound => '支持這個答案的引文不在你選取的材料裡。請把這個答案當成不可靠。';

  @override
  String get toolTitleSmartSummary => '整理摘要';

  @override
  String get toolDescriptionSmartSummary => '精簡的那一版 —— 或者會改變你要做什麼的那一版。';

  @override
  String get toolSectionKeyPoints => '重點';

  @override
  String get toolTitleCompareDocuments => '比較多份文件';

  @override
  String get toolDescriptionCompareDocuments => '有什麼變了、有什麼互相牴觸、有什麼沒有出現。';

  @override
  String get toolSectionWhatDiffers => '有哪些不同';

  @override
  String get toolSectionConflicts => '互相牴觸之處';

  @override
  String get toolSectionOnlyInOne => '只在其中一份裡出現';

  @override
  String get toolSectionInCommon => '共同之處';

  @override
  String get sensitiveKindEmail => '電子郵件地址';

  @override
  String get sensitiveKindPhone => '電話號碼';

  @override
  String get sensitiveKindPaymentCard => '支付卡號碼';

  @override
  String get sensitiveKindIban => '銀行帳戶（IBAN）';

  @override
  String get sensitiveKindNationalId => '國民身分號碼';

  @override
  String get sensitiveKindPostcode => '郵遞區號';

  @override
  String get sensitiveKindAccountNumber => '帳戶號碼';

  @override
  String get sensitiveKindReference => '參考編號';

  @override
  String get sensitiveKindDateOfBirth => '出生日期';

  @override
  String get sensitiveKindUrl => '網址';

  @override
  String get verdictVerifiedProvenance => '有已驗證的來源證明';

  @override
  String get verdictVerifiedProvenanceExplainer => '這個檔案帶有一個簽章，它經過檢查並且通過了。';

  @override
  String get verdictSignalsSynthetic => '有與 AI 生成內容相符的跡象';

  @override
  String get verdictSignalsSyntheticExplainer =>
      '這個檔案自稱是用生成式工具做出來的。中繼資料可以被編輯或移除，所以這是檔案自己的說法，不是證據。';

  @override
  String get verdictSignalsEdited => '有與經過編輯的內容相符的跡象';

  @override
  String get verdictSignalsEditedExplainer =>
      '這個檔案自稱經過編輯軟體處理。這對照片來說是很平常的事，本身並不表示有任何東西被造假。';

  @override
  String get verdictNoReliableProvenance => '找不到可靠的來源資訊';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      '這個檔案裡沒有來源資訊。這很正常——大多數服務都會把它清掉——也不代表任何事。';

  @override
  String get verdictInconclusive => '無法判定';

  @override
  String get verdictInconclusiveExplainer => '這裡的資訊不足以說出它是從哪裡來的。';

  @override
  String get authenticitySignalCamera => '相機';

  @override
  String get authenticitySignalSoftware => '軟體';

  @override
  String get authenticitySignalDescription => '描述';

  @override
  String get authenticitySignalCopyright => '版權';

  @override
  String get authenticitySignalLocation => '位置';

  @override
  String get authenticitySignalLocationValue => '這個檔案裡有位置資料。';

  @override
  String get authenticitySignalContentCredentials =>
      'Content Credentials（內容憑證）';

  @override
  String get authenticitySignalContentCredentialsValue => '未檢查——這個版本沒有簽章驗證器。';

  @override
  String get authenticitySignalFile => '檔案';

  @override
  String get authenticitySignalFileUnreadableValue => '無法當成圖片讀取。';

  @override
  String get authenticitySignalFileUnrecognisedValue => '不是認得出來的圖片格式。';

  @override
  String get authenticitySignalText => '文字';

  @override
  String get authenticitySignalTextValue => '光靠文字無法可靠地看出有沒有用到 AI。Action 不做猜測。';

  @override
  String get fileTypePng => '一張 PNG 圖片';

  @override
  String get fileTypeJpeg => '一張 JPEG 圖片';

  @override
  String get fileTypeGif => '一張 GIF 圖片';

  @override
  String get fileTypeWebp => '一張 WebP 圖片';

  @override
  String get fileTypeWav => '一段 WAV 錄音';

  @override
  String get fileTypePdf => '一份 PDF 文件';

  @override
  String get fileTypeHeic => '一張 HEIC 圖片';

  @override
  String get fileTypeVideo => '一個影片檔案';

  @override
  String get fileTypeTiff => '一張 TIFF 圖片';

  @override
  String get fileTypeBitmap => '一張點陣圖';

  @override
  String get fileTypeRtf => '一份 RTF 文件';

  @override
  String get fileTypeZip => '一個 Zip 壓縮檔';

  @override
  String get fileTypeGzip => '一個 gzip 壓縮檔';

  @override
  String get fileTypeSevenZip => '一個 7-Zip 壓縮檔';

  @override
  String get fileTypeRar => '一個 RAR 壓縮檔';

  @override
  String get fileTypeWindowsProgram => '一個 Windows 程式';

  @override
  String get fileTypeLinuxProgram => '一個 Linux 程式';

  @override
  String get fileTypePostScript => '一份 PostScript 文件';

  @override
  String get fileTypeOgg => '一段 Ogg 錄音';

  @override
  String get fileTypeMp3 => '一段 MP3 錄音';

  @override
  String get fileTypePlainText => '純文字';

  @override
  String fileMismatchNote(String extension, String contents) {
    return '這個檔案名為「.$extension」，但它的內容是$contents。這可能只是單純弄錯了，而這也正是一個檔案會被你預期之外的程式打開的原因。';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位元組',
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
  String get credentialKindPrivateKey => '私密金鑰';

  @override
  String get credentialKindApiKey => 'API 金鑰';

  @override
  String get credentialKindConnectionString => '連線字串';

  @override
  String get credentialKindAccessToken => '存取權杖';

  @override
  String get credentialKindAuthorizationHeader => '授權標頭';

  @override
  String get credentialKindPasswordOrKey => '密碼或金鑰';

  @override
  String get credentialKindPossibleSecret => '可能是密鑰';

  @override
  String get credentialAdvicePrivateKey =>
      '分享之前請把它移除，並且更換整組金鑰對。私密金鑰一旦被人看過，就再也回不到安全的狀態。';

  @override
  String get credentialAdviceProviderApiKey =>
      '請到發出這把金鑰的服務商那裡撤銷它，並重新產生一把新的。把它從文件裡刪掉並不會讓它失效。';

  @override
  String get credentialAdviceConnectionString =>
      '這裡面同時帶著一組密碼，以及那組密碼所打開的位址。如果這段內容已經分享出去了，請更改密碼。';

  @override
  String get credentialAdviceJsonWebToken =>
      '這類權杖通常會過期，但並非總是如此。除非你知道它什麼時候到期，否則就當它仍然有效。';

  @override
  String get credentialAdviceAuthorizationHeader =>
      '請移除這個標頭的值。貼出來的請求紀錄，是一個仍然有效的權杖不小心被分享出去最常見的途徑之一。';

  @override
  String get credentialAdviceKeyedAssignment =>
      '請把它改放到環境變數或密鑰儲存庫裡；如果這個檔案已經分享出去了，也請更改這個值。';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action 無法判斷這是什麼。分享之前請先確認一下——它同樣有可能只是一組識別碼或一個總和檢查碼。';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic API 金鑰';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI 專案金鑰';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI 格式的 API 金鑰';

  @override
  String get credentialLabelGoogleApiKey => 'Google API 金鑰';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google OAuth 權杖';

  @override
  String get credentialLabelGitHubToken => 'GitHub 權杖';

  @override
  String get credentialLabelSlackToken => 'Slack 權杖';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS 存取金鑰 ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab 權杖';

  @override
  String get credentialLabelNpmToken => 'npm 權杖';

  @override
  String get credentialLabelPassphrase => '通行密語';

  @override
  String get credentialLabelPassword => '密碼';

  @override
  String get credentialLabelRefreshToken => '更新權杖';

  @override
  String get credentialLabelToken => '權杖';

  @override
  String get credentialLabelClientSecret => '用戶端密鑰';

  @override
  String get credentialLabelCredential => '憑證';

  @override
  String get credentialLabelSecret => '密鑰';

  @override
  String get linkVerdictNoObviousSignals => '沒有明顯的跡象';

  @override
  String get linkVerdictWorthChecking => '值得看一下';

  @override
  String get linkVerdictTreatWithCaution => '請謹慎看待';

  @override
  String get linkSummaryNoObviousSignals =>
      '這個連結的寫法沒有任何不尋常的地方。這和知道那個網頁值得信任並不是同一回事——只有你能判斷這是不是你預期會收到的連結。';

  @override
  String get linkSummaryWorthChecking => '這個連結有一件事，值得你在打開它之前先看一下。';

  @override
  String get linkSummaryTreatWithCaution => '這個連結的寫法有好幾件事，值得你在打開它之前先查看一下。';

  @override
  String get linkSignalNotHttps => '未加密';

  @override
  String get linkSignalNonWebScheme => '不是網頁連結';

  @override
  String get linkSignalEmbeddedCredentials => '連結裡有密碼';

  @override
  String get linkSignalMisleadingAuthority => '真正的網址被藏起來';

  @override
  String get linkSignalIpLiteralHost => '純數字位址';

  @override
  String get linkSignalPunycodeHost => '名稱裡有編碼過的字元';

  @override
  String get linkSignalMixedScriptHost => '名稱混用了不同字母';

  @override
  String get linkSignalEncodedHost => '名稱裡有跳脫字元';

  @override
  String get linkSignalUnusualPort => '不常見的連接埠';

  @override
  String get linkSignalDeepSubdomain => '名稱有很多段';

  @override
  String get linkSignalPublicSuffixInSubdomain => '眼熟的名稱出現在錯的位置';

  @override
  String get linkSignalShortener => '短網址';

  @override
  String get linkSignalExecutableTarget => '會下載一個程式';

  @override
  String get linkSignalRedirectParameter => '可能把你送到別的地方';

  @override
  String get linkSignalVeryLongUrl => '非常長';

  @override
  String get linkSignalUnparseable => '讀不出來的連結';

  @override
  String get linkDetailNotHttps =>
      '這個連結用的是 http，所以你在那個頁面上輸入的任何內容，都可能在送過去的途中被人讀到。';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return '這個是以「$scheme:」開頭，而不是一個網頁。它可能會要求另一個應用程式做某件事。';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      '這個連結裡寫著一組使用者名稱和密碼。不論它被分享到哪裡，這兩樣都會跟著一起去。';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return '瀏覽器會忽略「@」之前的所有內容。真正的目的地是「$host」。';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return '這會連到「$host」——一個純數字位址，而不是一個名稱。正當的網站幾乎都會使用名稱。';
  }

  @override
  String get linkDetailPunycodeHost =>
      '這個網站名稱含有非拉丁字元，以編碼的形式儲存。這對許多語言來說很正常，而這同時也是讓一個名稱看起來像某個眼熟名稱的做法。';

  @override
  String get linkDetailMixedScriptHost =>
      '這個網站名稱把拉丁字母和另一種字母系統中長得一模一樣的字母混在一起。請一個字元一個字元地讀。';

  @override
  String get linkDetailEncodedHost =>
      '這個網站名稱裡有跳脫碼，而那並不是它們該出現的地方。它們可以遮掩名稱實際上寫的是什麼。';

  @override
  String linkDetailUnusualPort(String port) {
    return '這會連到連接埠 $port，而不是慣用的那一個。這在測試伺服器上很常見，在公開網站上則不常見。';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '這個名稱有 $count 段。只有最後兩段決定誰在經營這個網站，其餘的都可以設成任何內容。',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return '這個名稱的中間有「.$suffix.」，因此開頭那部分看起來像是網站本身。實際上的網站是「$host」。';
  }

  @override
  String get linkDetailShortener => '短網址服務把真正的目的地藏了起來。不打開它，你就無法知道這會通往哪裡。';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return '這個連結以「$fileExtension」結尾，所以它下載的是可以在你裝置上執行的東西，而不是一個可以閱讀的網頁。';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return '這個連結在它的「$parameter」設定裡帶了第二個位址，所以打開它可能會把你送到「$host」以外的地方。';
  }

  @override
  String get linkDetailVeryLongUrl => '長的連結比較難讀，而決定目的地的那一段可能會被推到看不見的地方。';

  @override
  String get linkDetailUnparseable => 'Action 無法把它讀成一個網址。對於看起來不像連結的連結，請小心。';

  @override
  String get toolTitleRedaction => '隱去敏感資訊';

  @override
  String get toolDescriptionRedaction => '找出不該分享的內容，並做出一份乾淨的副本。';

  @override
  String get toolSectionRedactionNothingToScan => '沒有可掃描的內容';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      '這個工具讀的是文字。請選一則筆記、一段貼上的訊息，或是一項已經讀出文字的擷取。';

  @override
  String get toolSectionRedactionNothingFound => '沒有找到明顯的內容';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action 在這段文字裡沒有找到電子郵件地址、電話號碼、卡號或參考編號。';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項值得隱去的內容',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => '隱去後的副本';

  @override
  String get toolWarningRedactionCoverage =>
      '這會找出電子郵件、電話號碼和帳戶號碼這類有固定形式的內容。它不會抓到所有敏感的東西——分享之前請先把這份副本讀過一遍。';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action 無法隱去圖片或 PDF 檔案裡的內容。在圖片上蓋住某個東西，原本的內容仍然留在底下，所以不提供這個做法。';

  @override
  String get toolTitleAuthenticity => '查看這是從哪裡來的';

  @override
  String get toolDescriptionAuthenticity => '一個檔案對自己的來源是怎麼說的。';

  @override
  String get toolSectionAuthenticityNothingToInspect => '沒有東西可以檢視';

  @override
  String get toolSectionAuthenticityNothingToInspectBody => '選一張圖片或一段文字。';

  @override
  String get toolSectionAuthenticityFileSignals => '這個檔案對自己的說法';

  @override
  String get toolSectionAuthenticityFileItself => '檔案本身';

  @override
  String get toolSectionFileContents => '內容';

  @override
  String get toolSectionFileUnknownFormat => 'Action 不認得的格式';

  @override
  String get toolSectionFileSize => '大小';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      '這裡報告的是一個檔案對自己的宣稱。中繼資料可以被修改或抹除，所以其中沒有任何一項算得上證據。不要拿這些去指控任何人。';

  @override
  String get toolTitleCredentialScanner => '檢查有沒有金鑰和密碼';

  @override
  String get toolDescriptionCredentialScanner => '在你把東西分享出去之前，先找出裡面的認證資訊。';

  @override
  String get toolSectionCredentialNothingToCheck => '沒有東西可以檢查';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      '貼上一段文字，或選一項已經讀出文字的擷取。這個工具只讀文字。';

  @override
  String get toolSectionCredentialNoneFound => '沒有找到認證資訊';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action 在這段文字裡沒有找到任何外觀像 API 金鑰、私密金鑰、權杖或密碼的東西。';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '找到 $count 項認證資訊',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項可能是機密的東西',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy => '已移除這些認證資訊的副本';

  @override
  String get toolWarningCredentialRevoke =>
      '把金鑰從文件裡移除，並不會讓它失效。如果其中有哪一把已經分享出去，請到發出它的服務商那裡撤銷它，並重新產生一把新的。';

  @override
  String get toolWarningCredentialCoverage =>
      '這個工具找得到外觀可以辨認的認證資訊。寫在句子裡的密碼不會被找出來，所以請你也把文字讀過一遍。';

  @override
  String get toolTitleLinkInspector => '檢查一個連結';

  @override
  String get toolDescriptionLinkInspector => '一個網址在你打開它之前，就已經透露了什麼。';

  @override
  String get toolSectionLinkNoneFound => '沒有找到連結';

  @override
  String get toolSectionLinkNoneFoundBody => '貼上一個連結，或選一項裡面有連結的擷取。';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '這段文字裡的 $count 個連結',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => '讀不出來';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary。$detail';
  }

  @override
  String get toolSectionLinkNothingUnusual => '這些網址的寫法沒有什麼不尋常';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      '這不等於知道那些頁面值得信任。只有你能判斷這些連結是不是你原本就預期會看到的。';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action 只讀網址本身。它不會打開這個連結，不會去查這個網站，也不會向任何信譽評等服務查詢 —— 那樣做就等於把你瀏覽的內容送到別人那裡。';

  @override
  String get toolWarningLinkNoSignals =>
      '一個沒有出現任何訊號的連結，一樣可能是有害的。這裡找的是網址寫法上的問題，而那並不是關於它會把你帶到哪裡的全部。';

  @override
  String get toolSectionObjective => '你想要達成的事';

  @override
  String get toolSectionCurrentState => '這個目標的進展';

  @override
  String get toolSectionRecommendedNextStep => '建議的下一步';

  @override
  String get toolSectionCredentialAdvice => '該怎麼做';

  @override
  String get toolSectionSummary => '摘要';

  @override
  String get toolDetailSeparator => '・';
}
