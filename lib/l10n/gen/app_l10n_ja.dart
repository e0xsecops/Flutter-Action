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

  @override
  String get dateShortFormat => 'M月d日';

  @override
  String get dateLongFormat => 'yyyy年M月d日';

  @override
  String get relativeJustNow => 'たった今';

  @override
  String relativeMinutes(int count) {
    return '$count分前';
  }

  @override
  String relativeHours(int count) {
    return '$count時間前';
  }

  @override
  String get relativeYesterday => '昨日';

  @override
  String relativeDays(int count) {
    return '$count日前';
  }

  @override
  String get libraryTitle => 'ライブラリ';

  @override
  String get librarySubtitle => 'Action があなたのために預かっているものすべて。そのすべてがこの端末に留まります。';

  @override
  String get librarySegmentActions => 'タスク';

  @override
  String get librarySegmentCaptures => '取り込み';

  @override
  String get librarySegmentGoals => '目標';

  @override
  String get librarySegmentDone => '完了';

  @override
  String get libraryNewGoal => '新しい目標';

  @override
  String get libraryNoGoalsTitle => 'まだ目標はありません';

  @override
  String get libraryNoGoalsMessage =>
      '目標とは、あなたが実現したいことです。何が足りないか、何が妨げているか、まず何をすべきかを Action が見つけられます。';

  @override
  String get libraryNoDoneTitle => 'まだ完了したものはありません';

  @override
  String get libraryNoDoneMessage => '終えたタスクはここに残ります。';

  @override
  String get libraryNoOpenTitle => '未完了のタスクはありません';

  @override
  String get libraryNoOpenMessage => '何か取り込めば、Action が何をすべきか見きわめます。';

  @override
  String get libraryNoCapturesTitle => 'まだ何も取り込んでいません';

  @override
  String get libraryNoCapturesMessage =>
      '追加した写真・スクリーンショット・テキストは、まずここに届きます。あなたが頼むまで、何も解析されません。';

  @override
  String get libraryGoalNoActions => 'ここからはまだ何も生まれていません';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'この目標からのタスク$count件',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'タスクと取り込みを検索';

  @override
  String get searchClear => '消去';

  @override
  String get searchPrivacyNote => 'この端末の中で検索します。ここに入力したものは端末から出ません。';

  @override
  String get searchYouCanSearch => '検索できるもの';

  @override
  String get searchFieldTitles => 'タイトル';

  @override
  String get searchFieldTitlesExample => '自動車保険の更新';

  @override
  String get searchFieldReferences => '受付番号';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => '組織名';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'タスクの中の手順';

  @override
  String get searchFieldStepsExample => '書類をアップロードする';

  @override
  String get searchFieldCaptureText => '取り込みから読み取った文字';

  @override
  String get searchFieldCaptureTextExample => '更新のお知らせ';

  @override
  String searchNoMatchesTitle(String query) {
    return '「$query」に一致するものはありません';
  }

  @override
  String get searchNoMatchesTryFewer => '語を減らすか、受付番号を書かれているとおりに入力してみてください。';

  @override
  String get searchNoMatchesClearFilters => '語を減らすか、絞り込みを解除してみてください。';

  @override
  String get searchFilterActive => '未完了';

  @override
  String get searchFilterCompleted => '完了';

  @override
  String get searchFilterOverdue => '期限切れ';

  @override
  String get searchFilterThisWeek => '今週';

  @override
  String get searchFilterCritical => '重要';

  @override
  String get searchFilterCreatedByYou => '自分で作成';

  @override
  String get searchFilterArchived => 'アーカイブ済み';

  @override
  String get searchFilterClear => '絞り込みを解除';

  @override
  String get searchIncompleteActions => 'タスクを検索できなかったため、この結果は不完全な可能性があります。';

  @override
  String get searchIncompleteCaptures => '取り込みを検索できなかったため、この結果は不完全な可能性があります。';

  @override
  String get searchIncompleteBoth => 'タスクも取り込みも検索できなかったため、この結果は不完全な可能性があります。';

  @override
  String get searchMatchTitle => 'タイトル';

  @override
  String get searchMatchNextStep => '次の一手';

  @override
  String get searchMatchStep => '手順';

  @override
  String get searchMatchSummary => '要約';

  @override
  String get searchMatchFromCapture => '取り込みより';

  @override
  String get studioSuggested => '直近の取り込みへのおすすめ';

  @override
  String get studioRecentlyUsed => '最近使ったもの';

  @override
  String get studioReady => '準備完了';

  @override
  String get studioNotConnected => '未接続';

  @override
  String get studioHeroTitle => 'Action インテリジェンス';

  @override
  String get studioConnectedBlurb =>
      '書類を読み解く、目標を練り直す、計画を組む、返信の下書きを書く、目の前のものを確かめる。';

  @override
  String studioDisconnectedBlurb(int count) {
    return '書類の読み解き・計画・作文のための$count個のツール。ご自身の AI アカウントを接続すると使えます。料金を請求するのはあなたのプロバイダーで、Action ではありません。';
  }

  @override
  String get studioConnectAi => 'AI を接続';

  @override
  String get studioHowItWorks => '仕組み';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'そのうち$count個は、接続なしで、すべてこの端末の中で動きます。',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'この端末の中で動きます';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title。$description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title。$description この端末の中で動きます。';
  }

  @override
  String get categoryUnderstand => '読み解く';

  @override
  String get categoryUnderstandBlurb => '手元のものの意味をつかむ。';

  @override
  String get categoryPlan => '計画する';

  @override
  String get categoryPlanBlurb => '実行できる形に変える。';

  @override
  String get categoryCreate => '書く';

  @override
  String get categoryCreateBlurb => '書く、直す、訳す。';

  @override
  String get categoryExtract => '取り出す';

  @override
  String get categoryExtractBlurb => '大事な項目を抜き出す。';

  @override
  String get categoryVerify => '確かめる';

  @override
  String get categoryVerifyBlurb => '目の前のものを確かめる。';

  @override
  String get captureSheetTitle => '何かを取り込む';

  @override
  String get captureSheetSubtitle => '読み通したくないものは、Action に渡してください。';

  @override
  String get captureTakePhoto => '写真を撮る';

  @override
  String get captureTakePhotoSubtitle => '目の前にある手紙・請求書・通知';

  @override
  String get captureChooseImage => '画像を選ぶ';

  @override
  String get captureChooseImageSubtitle => 'この端末にあるスクリーンショットや写真';

  @override
  String get capturePasteText => 'テキストを貼り付ける';

  @override
  String get capturePasteTextSubtitle => 'メール・メッセージ・通知';

  @override
  String get captureChoosePdf => 'PDF を選ぶ';

  @override
  String get captureChoosePdfSubtitle => 'すでにお持ちの明細・手紙・申込書';

  @override
  String get captureFootnote =>
      '取り込んだものはこの端末に残ります。あなたが頼むまで、オンラインで解析されることはありません。';

  @override
  String get captureCouldNotOpen => 'それは開けませんでした。別の方法でお試しください。';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title。$subtitle';
  }

  @override
  String get stageReading => '読み取り中';

  @override
  String get stageNeedsReview => '要確認';

  @override
  String get stageActionCreated => 'タスクを作成済み';

  @override
  String get stageNoText => '文字が見つかりません';

  @override
  String get stageCouldNotBeRead => '読み取れませんでした';

  @override
  String get stageReadingPreview => '文字を読み取っています…';

  @override
  String get stageFailedPreview => 'これはこの端末では読み取れませんでした。';

  @override
  String get provenancePhoto => '写真から取り込み';

  @override
  String get provenanceImage => '画像から取り込み';

  @override
  String get provenancePastedText => '貼り付けたテキストから取り込み';

  @override
  String get provenanceDocument => '書類として追加';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return '完了 $when';
  }

  @override
  String metaOverdue(String date) {
    return '期限切れ · 期限は $date でした';
  }

  @override
  String get metaDueToday => '今日が期限';

  @override
  String metaDueOn(String date) {
    return '期限 $date';
  }

  @override
  String get metaCreatedByYou => '自分で作成';

  @override
  String get categoryPayment => '支払い';

  @override
  String get categoryRenewal => '更新';

  @override
  String get categoryAppointment => '予約・面談';

  @override
  String get categoryBooking => '予約';

  @override
  String get categoryTravel => '旅行';

  @override
  String get categoryDeadline => '期限';

  @override
  String get categoryResponse => '返信が必要';

  @override
  String get categoryDelivery => '配達';

  @override
  String get categoryDocument => '書類';

  @override
  String get categoryNoActionRequired => 'することはありません';

  @override
  String get categoryUnsure => '判断できません';

  @override
  String get errorEnterManually => '自分で入力する';
}
