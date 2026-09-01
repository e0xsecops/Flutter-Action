// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppL10nJa extends AppL10n {
  AppL10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonDone => '完了';

  @override
  String get commonSave => '保存';

  @override
  String get commonClose => '閉じる';

  @override
  String get commonBack => '戻る';

  @override
  String get commonRetry => '再試行';

  @override
  String get commonDelete => '削除';

  @override
  String get commonRemove => '取り除く';

  @override
  String get commonContinue => '続ける';

  @override
  String get commonOpen => '開く';

  @override
  String get commonCopy => 'コピー';

  @override
  String get commonCopied => 'コピーしました';

  @override
  String get commonEdit => '編集';

  @override
  String get commonAdd => '追加';

  @override
  String get commonOn => 'オン';

  @override
  String get commonOff => 'オフ';

  @override
  String get commonUnknown => '不明';

  @override
  String get commonChecking => '確認中…';

  @override
  String get commonSettings => '設定';

  @override
  String get commonDismiss => '閉じる';

  @override
  String get commonUndo => '元に戻す';

  @override
  String get commonSkip => 'スキップ';

  @override
  String get commonNotNow => 'あとで';

  @override
  String get commonSomethingWentWrong => '問題が発生しました。';

  @override
  String get navToday => '今日';

  @override
  String get navLibrary => 'ライブラリ';

  @override
  String get navIntelligence => 'インテリジェンス';

  @override
  String get navSearch => '検索';

  @override
  String get navCapture => '何かを取り込む';

  @override
  String get todayGreetingMorning => 'おはようございます';

  @override
  String get todayGreetingAfternoon => 'こんにちは';

  @override
  String get todayGreetingEvening => 'こんばんは';

  @override
  String get todayDateFormat => 'M月d日 · EEEE';

  @override
  String get todayActionsLoadFailed => 'タスクを読み込めませんでした。データはこの端末に残っています。';

  @override
  String get todaySectionNeedsAttention => '対応が必要';

  @override
  String get todaySectionAlsoNeedsAttention => 'こちらも対応が必要';

  @override
  String get todaySectionWaitingForReview => '確認待ち';

  @override
  String get todaySectionComingUp => 'この先の予定';

  @override
  String todaySeeAllCaptures(int count) {
    return '$count件の取り込みをすべて見る';
  }

  @override
  String get todaySeeAllInLibrary => 'ライブラリですべて見る';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件完了',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のタスクが完了しました。ライブラリを開きます。',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'まずはここから';

  @override
  String get todayQuickPhoto => '写真';

  @override
  String get todayQuickScreenshot => 'スクリーンショット';

  @override
  String get todayQuickText => 'テキスト';

  @override
  String get todayQuickTools => 'リンクを調べる、またはテキストの中の鍵を探す';

  @override
  String get briefBadgeNeedsYou => '対応が必要';

  @override
  String get briefBadgeToReview => '確認待ち';

  @override
  String get briefBadgeAhead => 'この先';

  @override
  String get briefBadgeStartHere => 'ここから';

  @override
  String get briefBadgeClear => '空';

  @override
  String get briefNext => '次';

  @override
  String briefOpenAction(String title) {
    return '$titleを開く';
  }

  @override
  String briefMarkDone(String title) {
    return '「$title」を完了にする';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のタスクに対応が必要です',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の取り込みも確認待ちです。',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の取り込みが待っています',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => '期限切れはありません。';

  @override
  String get briefHeadlineNothingToday => '今日は対応が必要なものはありません';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のタスクがこの先にあります。',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'すべて片づきました';

  @override
  String get briefDetailClear => '期限が来ているものも、待っているものもありません。';

  @override
  String get briefHeadlineFirstRun => '何からでも始められます';

  @override
  String get briefDetailFirstRun => '手紙、スクリーンショット、メモ — Action がそれが何かを見きわめます。';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsSectionPersonalise => 'カスタマイズ';

  @override
  String get settingsAppearance => '外観';

  @override
  String get settingsAppearanceDescription => 'ライト、ダーク、または端末に合わせる。';

  @override
  String get settingsLanguageDescription => 'Action があなたに話しかける言語。';

  @override
  String get appearanceSystem => '端末に合わせる';

  @override
  String get appearanceLight => 'ライト';

  @override
  String get appearanceDark => 'ダーク';

  @override
  String get appearanceSystemDescription => '端末の設定に従う';

  @override
  String get appearanceLightDescription => '常にライト';

  @override
  String get appearanceDarkDescription => '常にダーク';

  @override
  String get languageTitle => '言語';

  @override
  String get languageSubtitle => '変更はすぐに反映されます。どこにも送信されず、選択はこの端末に保存されます。';

  @override
  String get languageSectionChoose => '言語を選ぶ';

  @override
  String get languageSystem => '端末に合わせる';

  @override
  String get languageSystemDescription => '端末の言語に従う';

  @override
  String get languageDraftNote =>
      'Action の文章はもともと英語で書かれています。ほかの言語は固定された用語集にもとづいて下訳を作成し、機械的に検査したもので、母語話者による確認はまだ行われていません。言い回しの正確さが重要な箇所 — プライバシー、セキュリティ、Action が主張することとしないこと — については、英語が基準として残ります。';

  @override
  String get settingsIntelligenceFootnote =>
      'Action は AI がなくても使えます。ご自身のプロバイダーを接続すると、書類の分析・計画・下書きのツールが加わります。';

  @override
  String get settingsAiProvider => 'AI プロバイダー';

  @override
  String get settingsAiNotConnected => '未接続。ご自身のアカウントと API キーを使います。';

  @override
  String settingsAiConnected(String provider) {
    return '$provider に接続済み。';
  }

  @override
  String get settingsSectionPrivacySecurity => 'プライバシーとセキュリティ';

  @override
  String get settingsSecurity => 'セキュリティ';

  @override
  String get settingsWhereInfoLives => 'あなたの情報がどこにあるか';

  @override
  String get settingsWhereInfoLivesDescription => 'この端末に残るもの、残らないもの。';

  @override
  String get protectionAppLock => 'アプリロック';

  @override
  String get protectionScreenPrivacy => '画面のプライバシー';

  @override
  String get protectionPrivateReminders => '内容を伏せた通知';

  @override
  String get protectionSummaryNone => 'アプリロック、画面のプライバシー、そして何がこの端末を出ていくか。';

  @override
  String protectionSummaryOne(String first) {
    return '$first がオンです。';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first と $second がオンです。';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first、$second、$third がオンです。';
  }

  @override
  String get settingsSectionReminders => 'リマインダー';

  @override
  String get settingsRemindersFootnote =>
      '電池の設定や端末の使われ方によっては、Android が設定した時刻より少し遅れてリマインダーを表示することがあります。';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsNotificationsOnDescription => '設定したリマインダーを表示できます。';

  @override
  String get settingsNotificationsOffDescription =>
      'Action ではオフのため、リマインダーは表示されません。';

  @override
  String get settingsNotificationsUnknown => '確認できませんでした。';

  @override
  String get settingsNotificationsAllowed => '許可済み';

  @override
  String get settingsOpenSystemSettings => '設定を開く';

  @override
  String get settingsActionFootnote =>
      'Action は雑然とした情報を、はっきりした次の一手に変えます。保存される前に、すべてあなたが確認します。';

  @override
  String get settingsHelp => 'ヘルプ';

  @override
  String get settingsHelpDescription => 'Action の仕組みと、Action がしないこと。';

  @override
  String get settingsVersion => 'バージョン';
}
