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
}
