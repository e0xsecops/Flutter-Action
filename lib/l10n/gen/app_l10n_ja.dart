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
  String get ocrScriptTitle => '文字認識';

  @override
  String get ocrScriptSubtitle =>
      'Action が写真を見るときに読み取る文字体系です。認識はこの端末で行われ、読み取りのために取り込みがどこかへ送られることはありません。';

  @override
  String get ocrScriptSectionChoose => '文字体系';

  @override
  String get ocrScriptFollowLanguage => 'アプリの言語に合わせる';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return '現在は$script';
  }

  @override
  String get ocrScriptLatin => 'ラテン文字';

  @override
  String get ocrScriptChinese => '中国語';

  @override
  String get ocrScriptDevanagari => 'デーヴァナーガリー';

  @override
  String get ocrScriptJapanese => '日本語';

  @override
  String get ocrScriptKorean => '韓国語';

  @override
  String get ocrScriptLatinDescription => '英語、スペイン語、フランス語、ドイツ語など、ラテン文字で書かれる言語。';

  @override
  String get ocrScriptChineseDescription => '簡体字と繁体字の中国語。';

  @override
  String get ocrScriptDevanagariDescription =>
      'ヒンディー語、マラーティー語、ネパール語。ベンガル語・タミル語・テルグ語は含みません — いずれも別の文字体系です。';

  @override
  String get ocrScriptJapaneseDescription => '日本語。';

  @override
  String get ocrScriptKoreanDescription => '韓国語。';

  @override
  String get ocrScriptFootnote =>
      'ラテン文字以外のどれを選んでもラテン文字は読めるので、選択は文字体系の入れ替えではなく追加です。この変更はこれから撮る写真に適用され、すでに読み取った写真には適用されません。';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action は$languageの文字を読めません';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'この文字体系に対応する認識機能が端末にありません。写真のうちラテン文字で書かれた部分は引き続き読み取られ、それ以外は空のまま返ります。その文字は代わりに入力するか貼り付けてください。';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action は$scriptを読む設定です。この写真が別の文字体系なら、設定で変更してもう一度読み取ってください。';
  }

  @override
  String get settingsTextRecognition => '文字認識';

  @override
  String get settingsTextRecognitionDescription => 'Action が写真から読み取る文字体系。';

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

  @override
  String get sourceWhatWeRead => '読み取った内容';

  @override
  String get sourceDelete => '取り込みを削除';

  @override
  String get sourceGone => 'その取り込みはもうありません。';

  @override
  String get sourceDeleteTitle => 'この取り込みを削除しますか？';

  @override
  String get sourceDeleteBody => '画像と、そこから読み取った文字がこの端末から取り除かれます。';

  @override
  String get sourceDeleteKeep => '残す';

  @override
  String get sourceOpenAction => 'タスクを開く';

  @override
  String sourceOpenActions(int count) {
    return '$count件のタスクを開く';
  }

  @override
  String get sourceCreateAnother => 'これからもう一つ作る';

  @override
  String get sourceCreateAction => 'これからタスクを作る';

  @override
  String get sourceDoMore => 'これでさらに何かする';

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
    return '$format $size KB から';
  }

  @override
  String get sourceTextFound => '文字が見つかりました';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines行 · $ms ms';
  }

  @override
  String get sourceReadExplainer => 'これは Action が読み取った文字です。そこから作られたものは下にあります。';

  @override
  String get sourceNotInterpreted =>
      'まだ何も解釈していません。Action がこれをどう扱うか提案し、何かが作られる前にあなたが確認します。';

  @override
  String get sourceNoTextExplainer =>
      '手書き、光が非常に少ない場合、またはこの端末がまだ読めない文字体系のときに起こります。';

  @override
  String get sourceReadFailed => 'これは読み取れませんでした';

  @override
  String get sourceReadFailedReason => '文字認識が最後まで終わりませんでした。';

  @override
  String get sourceTryReadingAgain => 'もう一度読み取る';

  @override
  String get sourceTypeInstead => '代わりに内容を入力する';

  @override
  String get sourceTypeWhatItSays => '書かれている内容を入力';

  @override
  String get sourceTypeHint => '日付、金額、そして何を求められているか。';

  @override
  String get sourceMadeFromThis => 'この取り込みから作られたもの';

  @override
  String sourceMadeFromThisCount(int count) {
    return 'この取り込みから$count件';
  }

  @override
  String get sourceTheDocument => '書類';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countページ',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'ページ数は不明';

  @override
  String get sourceDocumentNotRead =>
      'Action はこの書類の中身を読んでいません。それを必要とするツールを使うと、ファイルはあなたが接続した AI プロバイダーに送られ、その前にお知らせします。';

  @override
  String get previewSaveFailed => '保存できませんでした。もう一度お試しください。';

  @override
  String get previewTitle => '取り込みを確認';

  @override
  String get previewImageFailed => 'その画像は開けませんでした。';

  @override
  String get previewHint => '文字が読める状態か、大事な部分が切れていないか確かめてください。';

  @override
  String get previewRetake => '撮り直す';

  @override
  String get pasteTitle => '文章を貼り付け';

  @override
  String get pasteHint => '読み通したくないメール・メッセージ・通知を貼り付けてください。';

  @override
  String get pasteFootnote => '日付、金額、依頼が入っているものはうまくいきます。';

  @override
  String get pasteEnough => '取りかかるには十分そうです。';

  @override
  String get pasteMore => 'もう少し文章があると結果がよくなります。';

  @override
  String get reviewLoadFailed => 'この取り込みを読み込めませんでした。';

  @override
  String get reviewConfirmed => '確認済み';

  @override
  String get reviewNeedsReview => '要確認';

  @override
  String get reviewReview => '確認する';

  @override
  String get reviewHighConfidence => '確度が高い';

  @override
  String get reviewConfirmedByYou => 'あなたが確認しました';

  @override
  String get reviewMissing => '見当たりません';

  @override
  String get reviewNotUnderstood => 'Action はこのソースを十分に、確かなかたちで理解できませんでした。';

  @override
  String get reviewNotUnderstoodBody =>
      '取り込みはそのまま残っていて、失われたものはありません。内容はご自分で入力でき、ソースは参照用に付いたままです。';

  @override
  String get reviewEnterDetails => '内容を入力する';

  @override
  String get reviewKeepSource => 'ソースを後のために残す';

  @override
  String reviewEngine(String engine) {
    return 'エンジン: $engine';
  }

  @override
  String get reviewManualNotice => 'このタスクはご自分で作成しています。使われるのはここに入力した内容だけです。';

  @override
  String get reviewUntitled => '名称未設定のタスク';

  @override
  String get reviewEditTitle => '名称を編集';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '確定する前に$count件の値をご確認ください。',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => '重要な項目';

  @override
  String get reviewNotFound => '見つかりません';

  @override
  String get reviewSuggestedNextStep => '次にやることの提案';

  @override
  String get reviewWhyThisMatters => 'これが重要な理由';

  @override
  String get reviewSteps => '手順';

  @override
  String get reviewAddStep => '手順を追加';

  @override
  String get reviewInjectionNotice =>
      'このソースの一部の文字が、書類の内容ではなく指示のように見えたため、Action はそれを無視しました。';

  @override
  String get reviewLayoutNotice =>
      'この書類のレイアウトには、文字の抽出では完全に保てなかった対応関係が含まれている可能性があります。確定する前に、下の値をソースと照らし合わせてください。';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason 下の値をソースと照らし合わせてください。';
  }

  @override
  String get reviewDeadline => '期限';

  @override
  String get reviewAmount => '金額';

  @override
  String get reviewLeftUnset => 'なし — 未設定のままにすることを選びました';

  @override
  String get reviewUnclear => 'はっきりしません';

  @override
  String get reviewNotSet => '未設定';

  @override
  String get reviewNoDeadlineFound => 'この書類には見つかりませんでした';

  @override
  String get reviewNoAmountFound => 'この書類に金額は見つかりませんでした';

  @override
  String get reviewMultipleDates => 'Action は候補となる日付を複数見つけました。';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count件の日付が期限の候補です。正しいものを選ぶか、別の日付を入力するか、未設定のままにしてください。';
  }

  @override
  String get reviewChooseDate => '日付を選ぶ';

  @override
  String get reviewMultipleAmounts => 'Action は候補となる金額を複数見つけました。';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count件の金額が候補です。一つ選ぶか、別の金額を入力するか、未設定のままにしてください。';
  }

  @override
  String get reviewChooseAmount => '金額を選ぶ';

  @override
  String get reviewSkipStep => 'この手順を飛ばす';

  @override
  String get reviewKeepStep => 'この手順を残す';

  @override
  String get reviewEditStep => '手順を編集';

  @override
  String get reviewCreateManually => '自分で作る';

  @override
  String get reviewConfirmAndCreate => '確認してタスクを作成';

  @override
  String get reviewFixHighlighted => '印の付いた項目を確認';

  @override
  String get reviewSaving => '保存中…';

  @override
  String get reviewSaveFailed => 'このタスクを保存できませんでした。失われたものはありません — もう一度お試しください。';

  @override
  String get reviewFieldTitle => '名称';

  @override
  String get reviewTitleHint => '何を行う必要がありますか？';

  @override
  String get reviewNewStep => '新しい手順';

  @override
  String get reviewStepHint => '何をするか';

  @override
  String get reviewDatesConflict => '書類に日付が複数あります。';

  @override
  String get reviewAmountsConflict => '書類に金額が複数あります。';

  @override
  String get reviewAnotherDate => '別の日付 — 2026-08-30';

  @override
  String get reviewBadDate => '実在する日付ではありません。2026-08-30 の形式で入力してください。';

  @override
  String get reviewTypeDate => '日付を入力するか、下で未設定のままにしてください。';

  @override
  String get reviewUseThisDate => 'この日付を使う';

  @override
  String get reviewLeaveNoDeadline => '期限なしで進む';

  @override
  String get reviewAnotherAmount => '別の金額 — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'この金額は使えません: $reason。';
  }

  @override
  String get reviewUseThisAmount => 'この金額を使う';

  @override
  String get reviewLeaveNoAmount => '金額なしで進む';

  @override
  String get reviewThisValue => 'この値';

  @override
  String reviewQuote(String quote) {
    return '「$quote」';
  }

  @override
  String get reviewSeeOnCapture => '取り込みの上で見る';

  @override
  String get reviewViewSource => 'ソースを見る';

  @override
  String get reviewFromSource => 'ソースから';

  @override
  String get reviewNotVerified => '未照合';

  @override
  String get reviewCouldNotVerify => 'これをソースと照らし合わせられませんでした。';

  @override
  String get reviewLooksRight => '合っていそうです';

  @override
  String get reviewStageReading => 'ソースを読み取り中';

  @override
  String get reviewStageUnderstanding => '重要な項目を読み解き中';

  @override
  String get reviewStageChecking => '確認が必要な箇所を点検中';

  @override
  String get reviewNothingToDo => 'いま行うことはありません。';

  @override
  String get reviewInformationOnly =>
      'これはお知らせだけのようです — 期限も支払いも返信の依頼も見つかりませんでした。';

  @override
  String get reviewInformationOnlyWithSource =>
      'これはお知らせだけのようです — この取り込みには期限も支払いも返信の依頼も見つかりませんでした。';

  @override
  String get reviewSourceKept => 'どちらの場合もソースは残ります。';

  @override
  String get reviewAddAnyway => 'それでもタスクを追加する';

  @override
  String get reviewActionConfirmed => 'タスクを確認しました';

  @override
  String get reviewCreatedByYou => 'あなたが作成しました。';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '確認済みの$count件の項目にもとづき、あなたが確定しました。',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '確認済みの$count件の項目にもとづき、あなたが確定しました。うち$edited件を変更しました。',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'この端末に保存しました。';

  @override
  String get detailLoadFailed => 'このタスクを読み込めませんでした。この端末には引き続き保存されています。';

  @override
  String get detailNotFoundTitle => 'そのタスクはもうありません';

  @override
  String get detailNotFoundMessage => 'この端末で削除されたのかもしれません。';

  @override
  String get detailGoBack => '戻る';

  @override
  String get detailMore => 'その他';

  @override
  String get detailChangeUrgency => '緊急度を変更';

  @override
  String get detailAddRecommendedStep => 'おすすめの手順を追加';

  @override
  String get detailEditRecommendedStep => 'おすすめの手順を編集';

  @override
  String get detailArchiveTitle => 'このタスクをアーカイブしますか？';

  @override
  String get detailArchiveBody => '一覧からは外れますが削除はされず、元になった取り込みもそのまま残ります。';

  @override
  String get detailArchiveConfirm => 'アーカイブ';

  @override
  String get detailArchived => 'アーカイブ済み';

  @override
  String detailCompletedOn(String date) {
    return '$dateに完了';
  }

  @override
  String get detailSectionDetails => '詳細';

  @override
  String get detailSectionReminders => 'リマインダー';

  @override
  String get detailAllStepsDone => 'すべての手順が完了';

  @override
  String get detailNextEyebrow => '次';

  @override
  String get detailCompleteQuestion => 'このタスクを完了しますか？';

  @override
  String get detailMarkStepDone => '手順を完了にする';

  @override
  String get detailCompleteAction => 'このタスクを完了する';

  @override
  String get detailAddDeadline => '期限を追加';

  @override
  String get detailAddAmount => '金額を追加';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$total件中$completed件完了';
  }

  @override
  String get detailNoStepsTitle => 'まだ手順はありません';

  @override
  String get detailNoStepsMessage => '実際にやることに分けてみてください。';

  @override
  String get detailAddFirstStep => '最初の手順を追加';

  @override
  String detailStepCompletedSemantics(String title) {
    return '完了した手順: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return '次の手順: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return '手順: $title';
  }

  @override
  String detailMarkDone(String title) {
    return '「$title」を完了にする';
  }

  @override
  String detailMarkNotDone(String title) {
    return '「$title」を未完了にする';
  }

  @override
  String get detailStepOptions => '手順の操作';

  @override
  String get detailMoveUp => '上へ';

  @override
  String get detailMoveDown => '下へ';

  @override
  String get detailDeleteStep => '手順を削除';

  @override
  String get detailDateFormat => 'M月d日';

  @override
  String get detailDateFormatWithYear => 'yyyy年M月d日';

  @override
  String get stepDeleteTitle => 'この手順を削除しますか？';

  @override
  String get stepDeleteKeep => '残す';

  @override
  String get detailNoRemindersYet => 'リマインダーはまだありません。';

  @override
  String get detailReminderLimit =>
      '1つのタスクに設定できるリマインダーはこれが上限です。追加するには1つ削除してください。';

  @override
  String get detailAddReminder => 'リマインダーを追加';

  @override
  String get detailChangeReminder => 'リマインダーを変更';

  @override
  String get detailRemoveReminder => 'リマインダーを削除';

  @override
  String get detailReminderFormat => 'M月d日(EEE) HH:mm';

  @override
  String get reminderStatePending => 'まだ設定されていません';

  @override
  String get reminderStateNotificationsOff => '保存済みですが通知はオフです';

  @override
  String get reminderStateFailed => '予定に入れられませんでした';

  @override
  String get reminderStateRemoving => '削除中…';

  @override
  String get reminderSetConfirmation => 'リマインダーを設定しました。お知らせします。';

  @override
  String get reminderUpdatedConfirmation => 'リマインダーを更新しました。';

  @override
  String get reminderNeedsPermission =>
      '通知がオフのため、このリマインダーは保存されましたがまだお知らせできません。';

  @override
  String get reminderScheduleFailed =>
      'このリマインダーは保存されましたが、Android が予定に入れませんでした。';

  @override
  String get reminderLimitReached => 'そのタスクにはすでに上限までリマインダーがあります。';

  @override
  String get reminderTimeInPast => 'その時刻はすでに過ぎています。';

  @override
  String get reminderAddTitle => 'リマインダーを追加';

  @override
  String get reminderChangeTitle => 'このリマインダーを変更';

  @override
  String get reminderDateLabel => '日付';

  @override
  String get reminderTimeLabel => '時刻';

  @override
  String get reminderFieldDateFormat => 'yyyy年M月d日(EEE)';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'M月d日EEEE';

  @override
  String get reminderPresetFormat => 'M月d日 HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return '$dateの$timeにお知らせします。';
  }

  @override
  String get reminderTimePastError => 'その時刻はすでに過ぎています。あとの時刻を選んでください。';

  @override
  String get reminderSet => 'リマインダーを設定';

  @override
  String get reminderPresetInHour => '1時間後';

  @override
  String get reminderPresetTomorrowMorning => '明日の朝';

  @override
  String get reminderPresetNextWeek => '来週';

  @override
  String get reminderPresetOnTheDay => '当日';

  @override
  String get reminderPresetDayBefore => '1日前';

  @override
  String get reminderPresetWeekBefore => '1週間前';

  @override
  String get reminderPresetAtDeadline => '期限のとき';

  @override
  String get reminderPresetHourBefore => '1時間前';

  @override
  String get editNextStepTitle => 'おすすめの次の手順';

  @override
  String get editNextStepSubtitle => '次にやると良いことを一文で。';

  @override
  String get editNextStepHint => '次にやると良いことは何ですか？';

  @override
  String get editRemoveSuggestion => '提案を削除';

  @override
  String get editUrgencyTitle => 'どれくらい急ぎですか？';

  @override
  String get editStepHint => '具体的にやること1つ';

  @override
  String get editAddStep => '手順を追加';

  @override
  String get editDateHint => 'YYYY-MM-DD';

  @override
  String get editRemoveDeadline => '期限を削除';

  @override
  String get editAmountHint => '96.40';

  @override
  String get editSaveAmount => '金額を保存';

  @override
  String get editRemoveAmount => '金額を削除';

  @override
  String get securityTitle => 'セキュリティとプライバシー';

  @override
  String get securitySectionProtection => '保護';

  @override
  String get securityAppLockUnavailable =>
      'アプリロックにはこの端末の画面ロックが必要です。まず端末の設定で PIN、パターン、パスワード、指紋のいずれかを設定してください。';

  @override
  String get securityAppLockOn => 'Action は、本人かどうかの確認を端末に任せます。';

  @override
  String get securityAppLockOff => 'Action を開くのに指紋・顔・端末の PIN を求めます。';

  @override
  String get securityAskAgain => '再度たずねる';

  @override
  String get securityAskAgainDescription =>
      'ロックがかかるまで Action がバックグラウンドにいられる時間。';

  @override
  String get securityScreenPrivacy => '画面のプライバシー';

  @override
  String get securityScreenPrivacyDescription =>
      'スクリーンショットと画面録画をブロックし、アプリ切り替え画面で Action を隠すよう Android に求めます。';

  @override
  String get securityPrivateReminders => '非公開のリマインダー';

  @override
  String get securityPrivateRemindersOn => 'リマインダーは「何かがある」とだけ伝えます。';

  @override
  String get securityPrivateRemindersOff =>
      'リマインダーにはタスク名が出ます。ロック画面に出したくないときはこれをオンにしてください。';

  @override
  String get securityLockNow => '今すぐロック';

  @override
  String get securityLockNowDescription => '待たずに戸締まりをします。';

  @override
  String get securitySectionStorage => 'データの保存のしかた';

  @override
  String get securityStorageDataLabel => 'あなたのタスク・取り込み・設定';

  @override
  String get securityStorageDataDetail =>
      'これらはこのアプリ自身の非公開ストレージにあり、他のアプリからは読めず、Android が端末の暗号化の一部として暗号化します。Action がその上に独自の二層目を重ねることはありません。';

  @override
  String get securityStorageKeyLabel => 'AI プロバイダーの鍵';

  @override
  String get securityStorageKeyDetail =>
      '他のものと一緒ではなく Android Keystore に保管され、保存後は二度と表示されません。';

  @override
  String get securityStorageGapLabel => 'これで守られないこと';

  @override
  String get securityStorageGapDetail =>
      'いずれもロック解除された端末を他人が使う場合の防御にはなりませんし、改造や root 化された環境は通常より多くを読み取れます。その最初の場合に効くのがアプリロックです。';

  @override
  String get securitySectionInformation => 'あなたの情報';

  @override
  String get securityWhereInfoDescription => 'データが通りうるすべての経路と、この端末を出ていく二つ。';

  @override
  String get securityAppLockRefused => '確認されなかったため、何も変わっていません。';

  @override
  String get securityAppLockUnavailableToast =>
      'この端末には画面ロックが設定されていません。端末の設定で PIN、パターン、パスワード、指紋のいずれかを追加してから、もう一度お試しください。';

  @override
  String get securityScreenPrivacyRefused =>
      'この端末は画面のプライバシーを適用しなかったため、オンと表示するのではなくオフのままにしてあります。';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '予定済みのリマインダー$count件が伝える内容を減らしました。',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '予定済みのリマインダー$count件を更新しました。',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'すぐに';

  @override
  String get appLockDelayOneMinute => '1 分後';

  @override
  String get appLockDelayFiveMinutes => '5 分後';

  @override
  String get securityDelayImmediatelyDescription => 'Action が画面から離れるたび';

  @override
  String get securityDelayOneMinuteDescription => 'メッセージに返信できるくらい';

  @override
  String get securityDelayFiveMinutesDescription => '電話に出られるくらい';

  @override
  String get securityHeroProtected => '保護中';

  @override
  String get securityHeroNothingOn => '何もオンになっていません';

  @override
  String get securityHeroFootnote =>
      'ここにあるものはすべてこの端末で動きます。これらの設定はどこにも送信されず、遠隔から変更されることもありません。';

  @override
  String get securityHeadlineNone => '三つの保護が使えます';

  @override
  String securityHeadlineOne(String first) {
    return '$first がオン';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first と $second がオン';
  }

  @override
  String get securityHeadlineAll => '三つの保護がすべてオン';

  @override
  String get securityTransfersTitle => 'この端末から出ていったもの';

  @override
  String get securityTransfersNoProvider =>
      'AI プロバイダーが接続されていないため、解析のために送られているものは何もありません。';

  @override
  String get securityTransfersDescription =>
      '何かが送信された瞬間に、返ってきたかどうかに関係なくここへ記録します。記録するのはツール、プロバイダー、サイズだけ — 中身は決して残しません。この端末に90日間保存され、どこにも送信されません。';

  @override
  String get securityClear => '消去';

  @override
  String get securityNothingSent => 'まだ何も送信されていません';

  @override
  String get securityNothingSentDescription => 'AI プロバイダーを使うツールを実行すると、ここに並びます。';

  @override
  String get securityClearHistoryTitle => 'この履歴を消去しますか？';

  @override
  String get securityClearHistoryBody =>
      '何を送ったかの記録がこの端末から削除されます。すでに送信されたものが取り消されるわけではありません。';

  @override
  String get securityUnnamedTool => 'Intelligence のツール';

  @override
  String get securityYourProvider => 'あなたの AI プロバイダー';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countページ',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countファイル',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => '短い文章';

  @override
  String securityTransferCharacters(int count) {
    return '$count千文字';
  }

  @override
  String securitySentTo(String provider) {
    return '$provider に送信しました。';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return '$provider に送信しました · $size。';
  }

  @override
  String relativeWeeks(int count) {
    return '$count週間前';
  }

  @override
  String get helpTitle => 'ヘルプ';

  @override
  String get helpAddQuestion => '何を追加できますか？';

  @override
  String get helpAddAnswer =>
      'スクリーンショット、手紙や請求書の写真、貼り付けた文章。日付・金額・依頼が入っているものがいちばん向いています。';

  @override
  String get helpReviewQuestion => 'Action はなぜ確認を求めるのですか？';

  @override
  String get helpReviewAnswer =>
      '文書を読む機械は読み違えることがあり、静かに間違った期限は期限がないことより悪いからです。Action は見つけたものと、その元になった語を示します。そして、あなたが確認するまで何も保存されません。';

  @override
  String get helpVaryQuestion => 'もう一度試すと結果が変わるのはなぜですか？';

  @override
  String get helpVaryAnswer =>
      '文書を読むサービスは決定的ではないため、同じ取り込みでも少し違って返ってくることがあります。確認の手順があるのはそのためでもあります — 変わらない部分はあなたです。';

  @override
  String get helpLateQuestion => 'リマインダーが遅れたのはなぜですか？';

  @override
  String get helpLateAnswer =>
      'リマインダーは Android を通して予約され、いつ届けるかを決めるのは Android です。バッテリー節約、Doze、メーカーの電源設定はいずれも遅延の原因になります。Action は分単位のリマインダーを約束しません。';

  @override
  String get helpDataQuestion => '私のデータはどこにありますか？';

  @override
  String get helpDataAnswer =>
      'ほとんどはこの端末にあります。取り込み、タスク、手順、リマインダー、検索です。例外は二つ — Action に読ませるよう頼んだ内容は、それを読む AI サービスに送られます。そして確定したタスクの短い記録が、この端末の匿名 ID のもとでクラウドに保存されることがあります。設定の「プライバシーとデータ」に、その記録の中身が正確に書かれています。';

  @override
  String get helpBackupQuestion => 'これはバックアップですか？';

  @override
  String get helpBackupAnswer =>
      'いいえ。クラウドの記録を新しい端末に復元することはできず、ログインするアカウントもありません。Action を削除したりこの端末をなくしたりすると、そこにあったデータはなくなります。';

  @override
  String get helpCorrectQuestion => 'タスクはどう直しますか？';

  @override
  String get helpCorrectAnswer =>
      '開いて好きな項目を編集してください — 名称、期限、金額、提案された次の手順。手順はいつでも追加・並べ替え・完了・削除ができます。タスクの編集で AI サービスに何かを問い合わせることはありません。';

  @override
  String get privacyTitle => 'プライバシーとデータ';

  @override
  String get privacyIntro => 'Action はできるかぎりをこの端末に留めます。例外は二つで、どちらも下に挙げてあります。';

  @override
  String get privacyGroupOnDevice => 'この端末の中';

  @override
  String get privacyOnDeviceCaptures =>
      '取り込み — 追加したスクリーンショット・写真・文章と、そこから読み取った文字。';

  @override
  String get privacyOnDeviceActions => 'タスクと、その手順・項目・リマインダー。';

  @override
  String get privacyOnDeviceSearch => '検索。検索はここで動き、どこにも送られず、画面を閉じたあとは残りません。';

  @override
  String get privacyOnDevicePhotoMetadata =>
      '写真は位置情報なしで保存されます。撮影地の座標・時刻・カメラの機種情報は、取り込みが保存される前に取り除かれるため、ここにも残らず、取り込みを AI プロバイダーへ送るときにも含まれません。';

  @override
  String get privacyGroupSentToRead => '読み取りのために送られるもの';

  @override
  String get privacySentToReadWhat =>
      '取り込みの解釈を Action に頼むと、その内容は読み取る AI サービスへ送られます。これは端末内で動く AI ではありません。';

  @override
  String get privacySentToReadWhen => '送られるのは選んだ取り込みだけで、送られるのは頼んだときだけです。';

  @override
  String get privacyGroupYourProvider => 'あなた自身の AI プロバイダーへ送られるもの';

  @override
  String get privacyProviderWhat =>
      '設定で AI プロバイダーを接続すると、Intelligence のツールはあなたが選んだ内容をそのプロバイダー — OpenAI、Anthropic、Google、または選んだ endpoint — へ、あなた自身の API キーで送ります。';

  @override
  String get privacyProviderDirect =>
      '送り先は直接そこです。Action に属するサーバーを経由することはありません。';

  @override
  String get privacyProviderScope =>
      '送られるのはツールのために選んだものだけ、しかも実行したときだけです。ほかのタスク・取り込み・ソースが含まれることはなく、バックグラウンドで何かが送られることもありません。';

  @override
  String get privacyProviderKey =>
      'API キーはこの端末の安全な保管領域に置かれ、そのキーが属するプロバイダーにだけ送られます。安全な保管領域は、ロック解除された端末を手にした相手に対する実際の障壁ですが、絶対ではありません。Action はそれ以上のことを主張しません。';

  @override
  String get privacyProviderLocalTools =>
      '何も送らないツールが二つあります。機微な情報を隠すことと、ファイルの出どころを調べることです。どちらも完全にこの端末で動きます。';

  @override
  String get privacyProviderAgreement =>
      '送ったものをプロバイダーがどう扱うかは、Action ではなく、あなたと相手との取り決めによります。';

  @override
  String get privacyGroupCloud => 'クラウドに保存されるもの';

  @override
  String get privacyCloudWhat =>
      'タスクを確定すると、その短い記録がこのインストールの匿名 ID のもとで保存されることがあります。名称、状態、緊急度、分類、期限、金額、提案された次の手順、そして時刻です。';

  @override
  String get privacyCloudNotSent => '取り込み、そこから読み取った文字、タスクの手順と項目、リマインダーは送られません。';

  @override
  String get privacyCloudNotBackup =>
      'これはバックアップではありません。新しい端末に復元する方法はなく、このインストールを失えば匿名 ID も一緒に失われます。';

  @override
  String get privacyGroupDiagnostics => '診断';

  @override
  String get privacyDiagnosticsWhat =>
      'Action はアプリ内で何が起きたかを匿名の件数として記録します — 取り込みが始まったこと、抽出が成功したかどうか、検索が何も見つけなかったこと、タスクが完了したこと。';

  @override
  String get privacyDiagnosticsCounts =>
      'これは件数であって中身ではありません。名称・金額・期限・参照番号・取り込んだ文章・検索語が含まれることはなく、匿名 ID も、タスクや取り込みの識別子も含まれません。';

  @override
  String get privacyDiagnosticsCrash =>
      'アプリが落ちた場合、直せるようにエラーと発生箇所が報告されます。Action がその報告にあなたのデータを添えることはありません。';

  @override
  String get privacySectionYourData => 'あなたのデータ';

  @override
  String get privacyYourDataFootnote =>
      '取り込みを消してもタスクはそのまま残ります。取り込みがなくなったタスクも動きます。何から生まれたかを示さなくなるだけです。';

  @override
  String get privacyClearCaptures => '取り込みを消去';

  @override
  String get privacyClearCapturesDescription => 'すべての取り込みと画像ファイルを削除します。';

  @override
  String get privacyDeleteAll => 'データをすべて削除';

  @override
  String get privacyDeleteAllDescription => 'タスク、手順、リマインダー、取り込み、そして上のクラウド記録。';

  @override
  String get privacyClearCapturesTitle => '取り込みを消去しますか？';

  @override
  String get privacyClearCapturesBody =>
      'すべての取り込みとその画像がこの端末から削除されます。タスクはそのままの形で残ります。';

  @override
  String get privacyCapturesDeleted => '取り込みを削除しました。';

  @override
  String get privacyCapturesPartlyDeleted =>
      '一部の取り込みは削除できませんでした。ほかには何も変更していません。';

  @override
  String get privacyDeleteAllTitle => 'データをすべて削除しますか？';

  @override
  String get privacyDeleteAllBody =>
      'この端末のすべてのタスク・手順・リマインダー・取り込みと、上に挙げたクラウド記録を削除します。取り消すことはできず、復元できるバックアップもありません。';

  @override
  String get privacyDeleteEverything => 'すべて削除';

  @override
  String get privacyDeletedAll => 'すべて削除しました。';

  @override
  String get privacyDeleteFailed => 'データを削除できませんでした。';

  @override
  String get privacyDeletedUnverified =>
      'この端末のものはすべて削除しました。Action はクラウドに接続して何も残っていないことを確認できなかったため、あらためて確認します。';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return '$leftoversを除いて削除しました。';
  }

  @override
  String get privacyWillTryAgain => 'Action はもう一度試します。';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action はクラウドの確認を終えられなかったため、もう一度試します。';

  @override
  String get privacyLeftoverCaptures => '一部の取り込み';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'クラウド記録$count件',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$firstと$second';
  }

  @override
  String get privacyCloudDeleted => 'クラウドの記録を削除しました。';

  @override
  String get privacyCloudUnreachable => 'やはり接続できませんでした。Action はもう一度試します。';

  @override
  String get privacyPendingTitle => 'まだ削除できていないもの';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '前回はクラウド記録$count件に接続できませんでした。Action が自動でもう一度試しますし、いますぐ再試行することもできます。',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'もう一度試す';

  @override
  String get evidenceTitle => 'この出どころ';

  @override
  String get evidenceUnverified =>
      'Action は読み取った文字の中にこれらの語を見つけられなかったため、この値は照合されていません。頼りにする前に原本と照らし合わせてください。';

  @override
  String get evidenceHighlighted =>
      'これらの語は Action がこの取り込みから読み取った文字の中にあり、ハイライトがその位置を示しています。';

  @override
  String get evidenceNoRegion =>
      'これらの語は Action がこの取り込みから読み取った文字の中にありました。画像上のどこにあるかは特定できず、推測はしていません。';

  @override
  String get evidenceInText => 'これらの語は、この取り込みが含む文字の中にありました。';

  @override
  String get sourceCapturedAtFormat => 'M月d日 HH:mm';

  @override
  String get urgencyCritical => '非常に重大';

  @override
  String get urgencyImportant => '重要';

  @override
  String get urgencyNormal => 'ふつう';

  @override
  String get urgencyLow => '低い';

  @override
  String get urgencyUnsure => '判断できません';

  @override
  String get detailSaveFailed => '保存できませんでした。失われたものはありません — もう一度お試しください。';

  @override
  String get detailSectionCreatedFrom => '作成元';

  @override
  String get detailSourceChecking => '元の取り込みを読み込んでいます…';

  @override
  String get detailSourceUnavailable => '元の取り込みはもう利用できません。';

  @override
  String get detailReopenAction => 'タスクを再開する';

  @override
  String get detailMarkActionComplete => 'タスクを完了にする';

  @override
  String get detailGetHelp => 'これについて手伝ってもらう';

  @override
  String get detailSectionHistory => '履歴';

  @override
  String get detailHistoryShowLess => '表示を減らす';

  @override
  String detailHistoryShowAll(int count) {
    return '$count件をすべて表示';
  }

  @override
  String get detailHistoryCreated => '作成されました';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '手順$count件とともに作成されました',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'あなたが内容を確認しました';

  @override
  String detailHistoryStepFinished(String title) {
    return '「$title」を完了しました';
  }

  @override
  String get detailHistoryAStep => 'ある手順';

  @override
  String get detailHistoryReminderSet => 'あなたがリマインダーを設定しました';

  @override
  String detailHistoryReminderSetFor(String when) {
    return '$whenのリマインダーをあなたが設定しました';
  }

  @override
  String get detailHistoryCompleted => '完了にしました';

  @override
  String get detailHistoryChanged => '最後に変更されました';

  @override
  String get detailHistoryTimestampFormat => 'yyyy年M月d日 HH:mm';

  @override
  String get aiProviderCustom => 'カスタム (OpenAI 互換)';

  @override
  String get aiCapabilityText => '文章';

  @override
  String get aiCapabilityImages => '画像';

  @override
  String get aiCapabilityDocuments => '書類そのもの';

  @override
  String get aiCapabilityStructuredResults => '構造化された結果';

  @override
  String get aiCapabilityStreaming => 'ストリーミング';

  @override
  String get aiCapabilitySystemInstructions => 'システム指示';

  @override
  String get aiCapabilityEvidenceCitations => '根拠の引用';

  @override
  String get aiCapabilityLongDocuments => '長い書類';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a、$b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$aまたは$b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$headまたは$last';
  }

  @override
  String get aiFailureNotConfigured => 'このツールを使うには AI プロバイダーを接続してください。';

  @override
  String get aiFailureInvalidKey => 'その API キーはプロバイダーに受け入れられませんでした。';

  @override
  String get aiFailureQuotaExceeded =>
      'あなたのプロバイダーのアカウントは、残高が尽きているか、利用枠の上限に達しています。';

  @override
  String get aiFailureRateLimited =>
      'あなたのプロバイダーがリクエストを制限しています。しばらくしてからもう一度お試しください。';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action はあなたの AI プロバイダーに接続できませんでした。通信状況を確認してください。';

  @override
  String get aiFailureUnsupportedModel =>
      'そのモデルはあなたのキーでは利用できません。設定で別のモデルを選んでください。';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return '選んだモデルは$capabilitiesを読み取れません。設定で別のモデルを選んでください。';
  }

  @override
  String get aiFailureContextTooLarge => 'このモデルが一度に読み取るには、内容が多すぎました。';

  @override
  String get aiFailureInputTooLargeText => 'これは一度に解析できる文章の量を超えています。';

  @override
  String get aiFailureProviderUnavailable =>
      'あなたの AI プロバイダーで問題が起きています。しばらくしてからもう一度お試しください。';

  @override
  String get aiFailureMalformedResponse =>
      'そのプロバイダーは、Action が読み取れないものを返してきました。';

  @override
  String get aiFailureCancelled => '中止しました。';

  @override
  String get aiFailureInsecureEndpoint =>
      'その endpoint は https:// のアドレスである必要があります。';

  @override
  String get aiFailureUnknown => 'あなたの AI プロバイダーとのやり取りで問題が発生しました。';

  @override
  String get appLockTitle => 'Action はロックされています';

  @override
  String get appLockPrompt =>
      '続けるには本人であることを確認してください。Action は端末にたずねます — 指紋・顔・PIN を Action が見ることは決してありません。';

  @override
  String get appLockUnlocking => 'ロックを解除しています…';

  @override
  String get appLockNotConfirmed => '確認されませんでした。準備ができたらもう一度お試しください。';

  @override
  String get appLockCannotConfirm =>
      'この端末はいま、本人であることを確認できません。端末の設定で画面ロックが設定されたままか確認してください。';

  @override
  String get appLockWaiting => '待機中…';

  @override
  String get appLockUnlock => 'ロックを解除';

  @override
  String get appLockReasonUnlock => 'Action のロックを解除';

  @override
  String get appLockReasonEnable => 'アプリロックをオンにする前に本人であることを確認します';

  @override
  String get appLockReasonDisable => 'アプリロックをオフにする前に本人であることを確認します';

  @override
  String get todayCapabilityHeading => 'Action が扱うもの';

  @override
  String get todayCapabilityDocumentTitle => '手紙や請求書';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action がそれを読み取り、期限・金額・受付番号を見つけます。';

  @override
  String get todayCapabilityScreenshotTitle => 'スクリーンショット1枚';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'そのままでは忘れてしまうメッセージを、行動に移せるものに変えます。';

  @override
  String get todayCapabilityTextTitle => '何かの文章';

  @override
  String get todayCapabilityTextBlurb =>
      '何でも貼り付けてください。それが何で、あなたに何を求めているのかを Action が見きわめます。';

  @override
  String get todayCapabilityConfirmTitle => 'すべてあなたが確認します';

  @override
  String get todayCapabilityConfirmBlurb => '根拠を見て、あなたが「はい」と言うまで、何もタスクにはなりません。';

  @override
  String get todayCapabilityExploreIntelligence => 'インテリジェンスを見てみる';

  @override
  String get documentRejectedEmpty => 'そのファイルは空です。';

  @override
  String documentRejectedTooLarge(String size) {
    return 'その書類は $size で、Action が扱える大きさを超えています。';
  }

  @override
  String get documentRejectedNotAPdf =>
      '名前が何であれ、これは PDF ではありません。Action が読めるのは PDF と画像です。';

  @override
  String get documentRejectedUnreadable => 'その書類は読み取れませんでした。';

  @override
  String get pdfRejectedNotAPdf => '名前が何であれ、そのファイルは PDF ではありません。';

  @override
  String get pdfRejectedEncrypted => 'その PDF はパスワードで保護されているため、Action は読み取れません。';

  @override
  String get pdfRejectedDamaged => 'その PDF は読み取れませんでした。不完全な可能性があります。';

  @override
  String get shareRejectedEmpty => 'その共有には読み取れるものがありませんでした。';

  @override
  String get shareRejectedUnsupportedType =>
      'Action が受け取れるのは文章・画像・PDF です。それは別のものでした。';

  @override
  String get shareRejectedContentMismatch =>
      'そのファイルは、名乗っている種類のファイルではないため、Action は開いていません。';

  @override
  String get shareRejectedTooLarge => 'そのファイルは大きすぎて、Action では扱えません。';

  @override
  String get shareRejectedUnreadable => 'そのファイルは読み取れませんでした。';

  @override
  String get captureFailureRecognition => '文字認識を実行できませんでした。';

  @override
  String get captureFailureImageFormat => 'その画像形式はこの端末では読み取れませんでした。';

  @override
  String get connectSheetTitle => 'ご自身の AI を接続する';

  @override
  String get connectSheetSubtitle =>
      'ご自身のプロバイダーのアカウントと API キーを使います。Action はそのキーをこの端末の安全な保管領域に保存します。';

  @override
  String get connectErrorKeyMissing => '続けるには API キーを貼り付けてください。';

  @override
  String get connectErrorModelMissing => 'モデルを選ぶか、モデル ID を入力してください。';

  @override
  String get connectErrorEndpointMissing => 'ご自身の endpoint のアドレスを入力してください。';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'この端末の安全な保管領域を開けなかったため、キーは保存されませんでした。';

  @override
  String get connectTestSucceeded => '接続しました。';

  @override
  String connectTestSucceededWithModels(int count) {
    return '接続しました。$count個のモデルが利用できます。';
  }

  @override
  String get connectProviderLabel => 'プロバイダー';

  @override
  String get connectEndpointLabel => 'endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'https:// のアドレスである必要があります。Action は、暗号化されていない接続であなたの書類を送信することはありません。';

  @override
  String get connectApiKeyLabel => 'API キー';

  @override
  String get connectApiKeyHint => 'キーを貼り付け';

  @override
  String get connectKeyPrivacyNote =>
      'あなたのキーはこの端末に留まります。Action がそれを送るのは、あなたが選んだプロバイダーだけで、ほかのどこへも送りません。また、保存したあとに再び表示することはできません。';

  @override
  String get connectModelLabel => 'モデル';

  @override
  String get connectModelIdHint => 'モデル ID';

  @override
  String get connectModelFreeTextNote =>
      'プロバイダーはモデル ID を廃止したり、新しいものを追加したりします。使いたいものが一覧にない場合は、ここに入力してください。';

  @override
  String get connectAndTest => '接続してテストする';

  @override
  String get connectSaveWithoutTesting => 'テストせずに保存する';

  @override
  String get toolWarningFactsNotChecked =>
      'Action はこれを元の文章と照らし合わせられなかったため、この中の金額と日付は確認されていません。';

  @override
  String get toolTitleRewrite => 'この文章を整える';

  @override
  String get toolDescriptionRewrite => '明確に、短く、あるいは改まった調子に — 事実はそのままに。';

  @override
  String get toolModeRewriteClearer => 'より明確に';

  @override
  String get toolModeRewriteProfessional => 'よりビジネス向けに';

  @override
  String get toolModeRewriteShorter => 'より短く';

  @override
  String get toolModeRewritePersuasive => 'より説得力のある形に';

  @override
  String get toolModeRewriteSimpler => 'よりやさしく';

  @override
  String get toolModeRewriteStructured => 'より整理された構成に';

  @override
  String get toolModeRewriteGrammarOnly => '文法だけ';

  @override
  String get toolSectionWhatChanged => '変わった点';

  @override
  String get toolSectionNote => '補足';

  @override
  String get toolSectionAlreadyClearBody => 'これはもともと明確でした。下の変更はわずかです。';

  @override
  String get toolSectionImprovedText => '整えた文章';

  @override
  String get toolTitleDraftReply => '返信を下書きする';

  @override
  String get toolDescriptionDraftReply => 'あなたが編集し、あなた自身の手で送る返信です。';

  @override
  String get toolModeReplyProfessional => 'ビジネス向け';

  @override
  String get toolModeReplyConcise => '簡潔';

  @override
  String get toolModeReplyFriendly => '親しみやすい';

  @override
  String get toolModeReplyFormal => '公式文書向け';

  @override
  String get toolModeReplyClarification => '説明を求める';

  @override
  String get toolModeReplyConfirmation => '受領を伝える';

  @override
  String get toolModeReplyDispute => '異議を伝える';

  @override
  String get toolSectionSubject => '件名';

  @override
  String get toolSectionDraftReply => '返信の下書き';

  @override
  String get toolSectionPlaceholders => 'これらはあなたが埋める必要があります';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return '下書き — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'これは下書きです。Action は何も送信しません — 読んで、編集して、あなた自身の手で送ってください。';

  @override
  String get toolTitleTranslate => '翻訳する';

  @override
  String get toolDescriptionTranslate => '別の言語へ。数字と名前はそのままに。';

  @override
  String get toolSectionTranslation => '翻訳';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return '$fromから$toへ';
  }

  @override
  String get toolSectionKeptInOriginal => '原文のまま残したもの';

  @override
  String get toolWarningTranslationNotCertified =>
      '内容を理解するための翻訳であり、認証翻訳ではありません。';

  @override
  String get toolTitleStructuredData => '表を取り出す';

  @override
  String get toolDescriptionStructuredData => '行・項目・数値を、そのままコピーして使えます。';

  @override
  String get toolSectionTable => '表';

  @override
  String get toolSectionFields => '項目';

  @override
  String get toolSectionTableCsv => '表 (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'この表の列の構成を確かに読み取ることはできませんでした。使う前に、行がずれていないか確かめてください。';

  @override
  String get toolTitleDeadlineFinder => '期限を見つける';

  @override
  String get toolDescriptionDeadlineFinder =>
      '何をすべきか、いつまでか、そして果たさなかった場合に何が起きると書かれているか。';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '期限$count件',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => '見つかりませんでした';

  @override
  String get toolSectionNothingDueBody => 'Action はこの資料の中に期限も義務も見つけませんでした。';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'あなたが選ぶまで、何も予定に入りません。リマインダーが自動で設定されることは決してありません。';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return '果たさなかった場合: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return '必要なもの: $items';
  }

  @override
  String get moneyErrorEmpty => '金額が入力されていません';

  @override
  String get moneyErrorMalformed => '金額が数字だけの形になっていません';

  @override
  String get moneyErrorNegative => 'マイナスの金額は支払う額になりません';

  @override
  String get moneyErrorTooManyDecimals => 'その通貨が持つ桁数より小数点以下が多すぎます';

  @override
  String get moneyErrorUnsupportedCurrency => 'このアプリが認識できる通貨コードではありません';

  @override
  String get moneyErrorOutOfRange => '金額とは考えにくいほど大きい値です';

  @override
  String get escalationOcrFailed => 'この取り込みでは文字認識をまったく実行できませんでした。';

  @override
  String get escalationNoTextRecognised => 'これは書類のように見えますが、文字は認識されませんでした。';

  @override
  String get escalationThinText => 'この大きさの書類にしては、認識された文字が少なすぎます。';

  @override
  String get escalationLowLineConfidence => '認識機能が、複数の行で確度が低いと報告しました。';

  @override
  String get escalationTableLikeLayout =>
      'レイアウトが表のように見え、一行ずつ読み取ると、どの値がどの行のものかという対応関係が失われます。';

  @override
  String get escalationFragmentedLayout => '文字が非常に細かい断片として返ってきたため、構造がはっきりしません。';

  @override
  String get escalationMalformedText => '認識された文字の多くは、読める語や数字になっていません。';

  @override
  String get escalationConflictingDates => '複数の日付が期限として示されています。';

  @override
  String get escalationConflictingAmounts => '複数の金額が支払うべき額として示されています。';

  @override
  String get escalationUnresolvedGrounding =>
      '一部の値は、書類の文字の中まで元をたどることができませんでした。';

  @override
  String get escalationInstructionLikeContent =>
      'この書類には、アプリへの指示であるかのように書かれた文字が含まれています。それは書類の内容として扱われ、指示として扱われることは決してありません。';

  @override
  String get providerFailureNetwork => 'Action はサービスに接続できませんでした。通信状況を確認してください。';

  @override
  String get providerFailureTimedOut => 'サービスが答えるまでに時間がかかりすぎました。';

  @override
  String get providerFailureServiceUnavailable =>
      'サービスは一時的に利用できません。しばらくしてからもう一度お試しください。';

  @override
  String get providerFailureUnauthorized => 'このアプリはいま、このサービスを使う権限がありません。';

  @override
  String get providerFailureBlocked => 'サービスはこの書類の処理を断りました。';

  @override
  String get providerFailureUnknown =>
      'Action はこの書類を読み取れませんでした。もう一度試すとうまくいくかもしれません。';

  @override
  String get reviewBlockerTitle => 'このタスクに名称を付けてください。';

  @override
  String get reviewBlockerDate => 'どの日付が本当の期限かを選ぶか、未設定のままにしてください。';

  @override
  String get reviewBlockerAmount => 'どの金額が正しいかを選ぶか、未設定のままにしてください。';

  @override
  String get reviewBlockerStepTitle => '残す手順には名称が必要です。';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: '$pageページ',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return '$start〜$endページ';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '書き直した文章には$valuesが含まれなくなっています。使う前に確認してください。',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '書き直した文章には$valuesとほか$count件が含まれなくなっています。使う前に確認してください。',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => '、';

  @override
  String get goalStatusReached => '達成';

  @override
  String get goalNewSheetTitle => '何を実現したいですか？';

  @override
  String get goalNewSheetSubtitle => '一文で十分です。詳しいことはあとから追加できます。';

  @override
  String get goalTitleHint => '払いすぎずに自動車保険を更新する。';

  @override
  String get goalCreateAction => '目標を作成';

  @override
  String get goalTitleSheetTitle => '実現したいこと';

  @override
  String get goalOutcomeSheetTitle => 'どうなれば完了か';

  @override
  String get goalContextSheetTitle => 'いまの状況';

  @override
  String get goalOutcomeHint => '車に保険がかかり、書類の提出が終わっている。';

  @override
  String get goalContextHint => '見積もりが2件あり、更新日は18日。';

  @override
  String get goalWorkspaceTitle => '目標';

  @override
  String get goalUnmarkReached => 'やはり達成していない';

  @override
  String get goalMarkReached => '達成にする';

  @override
  String get goalNotFound => 'その目標はもうありません。';

  @override
  String get goalDeleteTitle => 'この目標を削除しますか？';

  @override
  String get goalDeleteBody => 'この目標はこの端末から取り除かれます。そこから作られたタスクは、そのままの形で残ります。';

  @override
  String get goalOutcomeLabel => 'どうなれば完了か';

  @override
  String get goalOutcomeEmpty => 'まだ書かれていません。終わりの形を言葉にしておくと、目標は計画しやすくなります。';

  @override
  String get goalContextLabel => 'いまの状況';

  @override
  String get goalContextEmpty => 'まだ何も書かれていません。ここまでに何があったか、そして何が妨げになっているか。';

  @override
  String get goalTitleLabel => '実現したいこと';

  @override
  String get goalEditTooltip => '目標を編集';

  @override
  String get goalToolsLabel => 'Action にできること';

  @override
  String get goalToolsNotReady => '実現したいことをもう少し書き足すと、これらのツールが扱える材料がそろいます。';

  @override
  String get toolGoalOptimizerTitle => '目標を練り直す';

  @override
  String get toolActionPlanTitle => '計画を組む';

  @override
  String get resultFactUnconfirmed => '未確認';

  @override
  String get resultSuggestedSteps => '提案された手順';

  @override
  String get resultSuggestedAction => '提案されたタスク';

  @override
  String get resultWorthAsking => '尋ねておきたいこと';

  @override
  String get resultSuggestedDeadlines => '提案された期限';

  @override
  String get resultSuggestions => '提案';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '根拠となる引用$count件',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => '選んだソースから';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source、$page';
  }

  @override
  String get toolRunStagePreparing => '書類を準備しています';

  @override
  String get toolRunStageReading => '選んだページを読み取っています';

  @override
  String get toolRunStageAnalysing => '解析中';

  @override
  String get toolRunStageBuilding => '確認する内容を組み立てています';

  @override
  String get toolRunStageDone => '完了しました';

  @override
  String get toolRunStageFailed => '最後まで終わりませんでした';

  @override
  String get toolRunStageCancelled => '中止しました';

  @override
  String get toolRunFailureLocalCheckFailed => 'それを確かめられませんでした。';

  @override
  String get toolRunFailureProviderRetired =>
      'その AI プロバイダーは、このバージョンでは利用できなくなりました。';

  @override
  String get toolRunFailureUnusableReply => 'その返答は使える形で返ってきませんでした。もう一度お試しください。';

  @override
  String get toolRunFailureQuestionRequired => 'まず質問を入力してください。';

  @override
  String get toolRunFailureInputRequired => 'このツールが扱うものを選んでください。';

  @override
  String get toolWarningReplyTruncated => 'この返答は途中で打ち切られたため、内容が欠けている可能性があります。';

  @override
  String get toolWarningNoSupportingQuotes =>
      'あなたのモデルは根拠となる引用を一つも返さなかったため、ここにあるものには何一つ根拠がありません。頼りにする前に、書類と照らし合わせて確かめてください。';

  @override
  String get aiSettingsRemoveTitle => 'この接続を取り除きますか？';

  @override
  String get aiSettingsRemoveBody =>
      'Action はあなたの API キーをこの端末から削除し、AI 機能の利用を停止します。プロバイダー側のアカウントには影響しません。';

  @override
  String get aiSettingsProviderLabel => 'プロバイダー';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      '使った分の料金を請求するのはあなたのプロバイダーです。Action がひとりでにリクエストを送ることは決してありません。';

  @override
  String get aiSettingsConnectLabel => 'AI プロバイダーを接続する';

  @override
  String get aiSettingsConnectDescription =>
      'OpenAI、Anthropic、Google Gemini、または互換の endpoint で、ご自身のアカウントと API キーを使います。';

  @override
  String get aiSettingsModelLabel => 'モデル';

  @override
  String get aiSettingsEndpointLabel => 'endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'API キー';

  @override
  String get aiSettingsKeyStored => 'この端末の安全な保管領域に保存されます。';

  @override
  String get aiSettingsKeyMissing => 'この端末にキーが見つかりません。追加するには、もう一度接続してください。';

  @override
  String get aiSettingsTestLabel => '接続をテストする';

  @override
  String get aiSettingsProviderUnavailable => 'そのプロバイダーはこのバージョンでは利用できません。';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return '接続しました。$count個のモデルが利用できます。';
  }

  @override
  String get aiSettingsTestButton => 'テスト';

  @override
  String get aiSettingsChangeProvider => 'プロバイダーまたはモデルを変更';

  @override
  String get aiSettingsRemoveKey => 'キーを削除';

  @override
  String get aiSettingsSectionPrivacy => 'プライバシー';

  @override
  String get aiSettingsWhatGetsSentLabel => '送られるもの';

  @override
  String get aiSettingsWhereItGoesLabel => '送り先';

  @override
  String get aiSettingsWhereItGoesNoProvider => 'プロバイダーを接続するまで、何も送られません。';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'あなたのキーを使って、直接 $provider へ。Action に属するサーバーを経由することはありません。';
  }

  @override
  String get aiSettingsSectionData => 'データ';

  @override
  String get aiSettingsDataFootnote =>
      'Action が覚えているのは、どのツールを使ったかだけです。それを何に対して使ったかは決して覚えません。';

  @override
  String get aiSettingsRecentToolsLabel => '最近使ったツール';

  @override
  String get aiSettingsRecentToolsNone => 'なし';

  @override
  String get reminderNotificationTitle => 'Action のリマインダー';

  @override
  String get reminderNotificationPrivateBody => '確認が必要なものがあります。';

  @override
  String get reminderChannelName => 'Action のリマインダー';

  @override
  String get reminderChannelDescription => 'あなたが自分のタスクのために自分で設定したリマインダー。';

  @override
  String get onboardingStart => 'Action を使いはじめる';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return '$totalステップ中$currentステップ目';
  }

  @override
  String get onboardingCaptureTitle => '情報をタスクに変える';

  @override
  String get onboardingCaptureBody =>
      'スクリーンショット、写真、送られてきた文章を追加してください。Action がそれを読み取り、あなたに何を求めているのかを見きわめます。';

  @override
  String get onboardingReviewTitle => 'あなたが確認するまで、何も保存されません';

  @override
  String get onboardingReviewBody =>
      'Action は見つけたものと、その元になった語を示します。間違っているところはあなたが直します。あなたが確認するまで、それは提案であって、事実でもタスクでもありません。';

  @override
  String get onboardingTrackingTitle => '大事なことを把握しておく';

  @override
  String get onboardingTrackingBody =>
      '「対応が必要」は、期限が過ぎたものや近いものを前に出します。どのタスクも、次の一手、進み具合、そしてあなたが設定したリマインダーを持ち続けます。';

  @override
  String get onboardingPrivacyBody => 'はじめる前に知っておいてほしいこと:';

  @override
  String get onboardingPrivacyOnDevice =>
      'あなたのタスク、取り込み、リマインダー、検索はこの端末に保存されます。検索とリマインダーは通信がなくても動きます。';

  @override
  String get onboardingPrivacySentToRead =>
      '何かを読み取るよう Action に頼むと、その内容は、それを解釈する AI サービスへ送られます。';

  @override
  String get onboardingPrivacyCloud =>
      '確定したタスクの短い記録 — 名称、日付、金額、提案された次の手順 — が、この端末の匿名 ID のもとでクラウドに保存されることがあります。あなたの取り込み、手順、リマインダーは送られません。';

  @override
  String get onboardingPrivacyNotBackup =>
      'その記録はバックアップではありません。新しい端末に何かを復元することはできません。';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '妨げ$count件',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'もっと単純にできるかもしれません';

  @override
  String get toolDescriptionGoalOptimizer => '何が足りないか、何が妨げているか、まず何をすべきか。';

  @override
  String toolSectionStepDependsOn(String step) {
    return '$stepのあと';
  }

  @override
  String get toolSectionThePlan => '計画';

  @override
  String get toolDescriptionActionPlan => '順序のある手順の集まり。そのままタスクに変えられます。';

  @override
  String get toolTitleSmartChecklist => 'チェックリストを作る';

  @override
  String get toolDescriptionSmartChecklist => 'これがあなたに求めていることを、順番に。';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '見つからなかった項目$count件',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'これらは互いに食い違っています';

  @override
  String get toolTitleMissingInformation => '足りないものを探す';

  @override
  String get toolDescriptionMissingInformation => '足りない点と、それについて相手に尋ねるべきこと。';

  @override
  String get aiAdapterTimedOut => '時間がかかりすぎたため、中止しました。';

  @override
  String get aiAdapterSecureConnectionFailed => 'あなたの AI プロバイダーとの安全な接続に失敗しました。';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action はそのモデルまたは endpoint を見つけられませんでした。';

  @override
  String get aiAdapterRequestRejected => 'あなたの AI プロバイダーがそのリクエストを拒否しました。';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action はこの端末の安全な保管領域を開けませんでした。';

  @override
  String get aiAdapterEndpointMissing =>
      '設定で、ご自身の AI の endpoint のアドレスを入力してください。';

  @override
  String get aiAdapterReplyIncomplete => 'その返答は不完全でした。もう一度お試しください。';

  @override
  String get aiAdapterContentDeclined => 'あなたのプロバイダーは、その内容の処理を断りました。';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'それは一度に扱える$limit個を超えるファイル数です。選ぶ数を減らしてください。';
  }

  @override
  String get aiAdapterImageTooLarge => 'それらの画像のうち1枚が、解析するには大きすぎます。';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '「$filename」は解析するには大きすぎます。上限は $limit MB です。';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '「$filename」は$countページあります。Action が一度に読めるのは$limitページまでです — 範囲を選んでください。';
  }

  @override
  String get aiAdapterSelectionTooLarge => '選んだ内容は、一度のリクエストで送るには多すぎます。';

  @override
  String get toolRunNotAvailableTitle => 'そのツールは利用できません';

  @override
  String get toolRunNotAvailableMessage => 'Action の新しいバージョンで取り除かれたのかもしれません。';

  @override
  String get toolRunNoSourcesYet => 'まだ扱えるものがありません。何かを取り込むか、下にテキストを貼り付けてください。';

  @override
  String get toolRunChooseSourcesToCompare => '比べるものを選ぶ';

  @override
  String get toolRunChooseSource => 'ソースを選ぶ';

  @override
  String get toolRunQuestionLabel => 'あなたの質問';

  @override
  String get toolRunQuestionHint => '期限はいつですか？';

  @override
  String get toolRunFreeTextLabel => 'または、テキストを貼り付ける';

  @override
  String get toolRunFreeTextHint => 'ここに貼り付けるか入力してください';

  @override
  String get toolRunModeLabel => '仕上げ方';

  @override
  String get toolRunRunLocally => 'この端末の中で確かめる';

  @override
  String get toolRunRun => '実行';

  @override
  String get toolRunStop => '中止';

  @override
  String get toolRunRunAgain => 'もう一度実行';

  @override
  String get toolRunWorkingOn => '対象';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'これを $provider に送りますか？';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'あなたが選んだ内容が、あなたの API キーを使って、処理のために $provider へ送られます。';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'あなたのキーはこの端末に留まります。Action がバックグラウンドで何かを送ることはなく、ほかのタスクやソースを送ることもありません。';

  @override
  String get toolRunScopeTitle => '実行する前に';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countページが、あなたの $provider 接続を使って解析されます。',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のファイルが、あなたの $provider 接続を使って解析されます。',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'あなたが選んだテキストが、あなたの $provider 接続へ送られます。';
  }

  @override
  String get toolRunNeedsProviderTitle => 'このツールを使うには AI プロバイダーを接続してください';

  @override
  String get toolRunNeedsProviderBody => 'ご自身のプロバイダーのアカウントと API キーを使います。';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '手順$count件からタスクを作成しました。',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '手順$count件を追加しました。',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'タスクを作成 · 手順$count件',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このタスクに追加 · 手順$count件',
    );
    return '$_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => '写真';

  @override
  String get sourceTypeLabelScreenshot => 'スクリーンショット';

  @override
  String get sourceTypeLabelPastedText => '貼り付けたメモ';

  @override
  String get sourceTypeLabelDocument => '書類';

  @override
  String get toolModeClearer => 'より明確に';

  @override
  String get toolModeMoreProfessional => 'よりビジネス向けに';

  @override
  String get toolModeShorter => 'より短く';

  @override
  String get toolModeSimpler => 'よりやさしく';

  @override
  String get toolModeMoreStructured => 'より整理された構成に';

  @override
  String get toolModeMorePersuasive => 'より説得力のある形に';

  @override
  String get toolModeGrammarOnly => '文法だけ';

  @override
  String get toolModeProfessional => 'ビジネス向け';

  @override
  String get toolModeConcise => '簡潔';

  @override
  String get toolModeFriendly => '親しみやすい';

  @override
  String get toolModeFormal => '公式文書向け';

  @override
  String get toolModeAskForClarification => '説明を求める';

  @override
  String get toolModeConfirm => '受領を伝える';

  @override
  String get toolModeDispute => '異議を伝える';

  @override
  String get toolModeQuick => '手短に';

  @override
  String get toolModeDetailed => '詳しく';

  @override
  String get toolModeExecutive => '判断する人向け';

  @override
  String get toolModeKeyPoints => '要点';

  @override
  String get toolModeActionFocused => 'やることを中心に';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '引用された記述のうち$count件が、あなたが選んだ資料の中に見つからなかったため、未確認として印を付けています。',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action はこれらの引用をファイルそのものと照らし合わせられなかったため、引用は照合されていません。';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '期限切れ · $count日',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => '明日が期限';

  @override
  String get triageBadgeReminderSoon => 'まもなくリマインダー';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '期限を$count日過ぎています',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status。$title';
  }

  @override
  String get triageExplanationDone => 'これは完了しています。';

  @override
  String get triageExplanationNothingPressing =>
      'これがここにあるのは、いまのところ急を要する点が何もないからです。';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return '$reasonため、これは対応が必要です。';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return '$reasonため、これは下の方に表示されています。';
  }

  @override
  String get triageReasonOverdue => '期限を過ぎている';

  @override
  String get triageReasonDeadlinePassed => '期限の時刻が過ぎている';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '期限を$count日過ぎている',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => '今日が期限になっている';

  @override
  String get triageReasonCriticalDueSoon => 'あなたが「非常に重大」と設定していて、期限が近づいている';

  @override
  String get triageReasonAllStepsDone => 'すべての手順が完了していて、あとはこのタスクを完了にするだけになっている';

  @override
  String get triageReasonDueTomorrow => '明日が期限になっている';

  @override
  String get triageReasonReminderSoon => 'あなたがこれから1日以内のリマインダーを設定している';

  @override
  String get triageReasonDueWithinThreeDays => '期限が3日以内に来る';

  @override
  String get triageReasonCriticalNoDeadline => 'あなたが「非常に重大」と設定していて、期限が設定されていない';

  @override
  String get triageReasonDueWithinSevenDays => '期限が1週間以内に来る';

  @override
  String get triageReasonImportant => 'あなたが「重要」と設定している';

  @override
  String get triageReasonDueLater => '期限がもっと先にある';

  @override
  String get triageReasonNoDeadline => '期限が設定されておらず、急を要する点も何もない';

  @override
  String cardCompletedTooltip(String title) {
    return '完了: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'この書類を読み解く';

  @override
  String get toolDescriptionDocumentIntelligence => 'これが何か、何が大事か、そして何をすべきか。';

  @override
  String get toolSectionWhatThisIs => 'これが何か';

  @override
  String get toolSectionWhatMatters => '何が大事か';

  @override
  String get toolSectionKeyDetails => '主な項目';

  @override
  String get toolTitleAskDocument => 'ソースについて質問する';

  @override
  String get toolDescriptionAskDocument => 'あなたが選んだものにもとづく答え — なければ、何も返しません。';

  @override
  String get toolSectionNoAnswer => 'この資料の中に答えは見つかりませんでした';

  @override
  String get toolSectionNoAnswerBody => 'Action は、選んだ書類の中にそれを見つけられませんでした。';

  @override
  String get toolSectionAnswer => '答え';

  @override
  String get toolSectionFromTheDocument => '書類から';

  @override
  String get toolWarningQuoteNotFound =>
      'この答えのもとになった引用は、選んだ資料の中にありません。この答えは信頼できないものとして扱ってください。';

  @override
  String get toolTitleSmartSummary => '要約する';

  @override
  String get toolDescriptionSmartSummary =>
      '短くまとめたもの — あるいは、あなたが何をすべきかを左右する部分。';

  @override
  String get toolSectionKeyPoints => '要点';

  @override
  String get toolTitleCompareDocuments => '書類を比べる';

  @override
  String get toolDescriptionCompareDocuments => '何が変わったか、何が食い違っているか、何が見当たらないか。';

  @override
  String get toolSectionWhatDiffers => '違うところ';

  @override
  String get toolSectionConflicts => '食い違い';

  @override
  String get toolSectionOnlyInOne => 'どれか一つにしかないもの';

  @override
  String get toolSectionInCommon => '共通しているところ';

  @override
  String get sensitiveKindEmail => 'メールアドレス';

  @override
  String get sensitiveKindPhone => '電話番号';

  @override
  String get sensitiveKindPaymentCard => '決済カード番号';

  @override
  String get sensitiveKindIban => '銀行口座 (IBAN)';

  @override
  String get sensitiveKindNationalId => '国民識別番号';

  @override
  String get sensitiveKindPostcode => '郵便番号';

  @override
  String get sensitiveKindAccountNumber => '口座番号';

  @override
  String get sensitiveKindReference => '受付番号';

  @override
  String get sensitiveKindDateOfBirth => '生年月日';

  @override
  String get sensitiveKindUrl => 'ウェブアドレス';

  @override
  String get verdictVerifiedProvenance => '検証済みの出どころがあります';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'このファイルには署名があり、それを検証した結果、その署名は正しいものでした。';

  @override
  String get verdictSignalsSynthetic => 'AI が生成した内容と符合する兆候';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'このファイルは、生成ツールで作られたと申告しています。メタデータは編集も削除もできるため、これはファイルが主張していることであって、証拠ではありません。';

  @override
  String get verdictSignalsEdited => '編集された内容と符合する兆候';

  @override
  String get verdictSignalsEditedExplainer =>
      'このファイルは、編集ソフトを通ったと申告しています。写真では当たり前のことで、それだけで何かが偽造されたことを意味するわけではありません。';

  @override
  String get verdictNoReliableProvenance => '信頼できる出どころは見つかりませんでした';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'このファイルには出どころの情報がありません。これは普通のことで — 多くのサービスが取り除きます — 何かの印になるものではありません。';

  @override
  String get verdictInconclusive => '決め手がありません';

  @override
  String get verdictInconclusiveExplainer => 'ここには、これがどこから来たのかを言えるだけの情報がありません。';

  @override
  String get authenticitySignalCamera => 'カメラ';

  @override
  String get authenticitySignalSoftware => 'ソフトウェア';

  @override
  String get authenticitySignalDescription => '説明';

  @override
  String get authenticitySignalCopyright => '著作権';

  @override
  String get authenticitySignalLocation => '位置情報';

  @override
  String get authenticitySignalLocationValue => 'このファイルには位置情報が含まれています。';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      '確認していません — このビルドには署名の検証機能がありません。';

  @override
  String get authenticitySignalFile => 'ファイル';

  @override
  String get authenticitySignalFileUnreadableValue => '画像として読み取れませんでした。';

  @override
  String get authenticitySignalFileUnrecognisedValue => '認識できる画像形式ではありません。';

  @override
  String get authenticitySignalText => 'テキスト';

  @override
  String get authenticitySignalTextValue =>
      'テキストだけでは、AI が使われたかどうかを確かに示すことはできません。Action は推測しません。';

  @override
  String get fileTypePng => 'PNG 画像';

  @override
  String get fileTypeJpeg => 'JPEG 画像';

  @override
  String get fileTypeGif => 'GIF 画像';

  @override
  String get fileTypeWebp => 'WebP 画像';

  @override
  String get fileTypeWav => 'WAV 音声';

  @override
  String get fileTypePdf => 'PDF 書類';

  @override
  String get fileTypeHeic => 'HEIC 画像';

  @override
  String get fileTypeVideo => '動画ファイル';

  @override
  String get fileTypeTiff => 'TIFF 画像';

  @override
  String get fileTypeBitmap => 'ビットマップ画像';

  @override
  String get fileTypeRtf => 'RTF 書類';

  @override
  String get fileTypeZip => 'Zip アーカイブ';

  @override
  String get fileTypeGzip => 'gzip アーカイブ';

  @override
  String get fileTypeSevenZip => '7-Zip アーカイブ';

  @override
  String get fileTypeRar => 'RAR アーカイブ';

  @override
  String get fileTypeWindowsProgram => 'Windows のプログラム';

  @override
  String get fileTypeLinuxProgram => 'Linux のプログラム';

  @override
  String get fileTypePostScript => 'PostScript 書類';

  @override
  String get fileTypeOgg => 'Ogg 音声';

  @override
  String get fileTypeMp3 => 'MP3 音声';

  @override
  String get fileTypePlainText => 'プレーンテキスト';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'このファイルの名前は「.$extension」ですが、中身は$contentsです。それは単なる間違いであることもありますし、思っていたものとは別のもので開かれてしまう道筋でもあります。';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countバイト',
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
  String get credentialKindPrivateKey => '秘密鍵';

  @override
  String get credentialKindApiKey => 'API キー';

  @override
  String get credentialKindConnectionString => '接続文字列';

  @override
  String get credentialKindAccessToken => 'アクセストークン';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization ヘッダー';

  @override
  String get credentialKindPasswordOrKey => 'パスワードまたは鍵';

  @override
  String get credentialKindPossibleSecret => 'シークレットの可能性がある値';

  @override
  String get credentialAdvicePrivateKey =>
      '共有する前にこれを取り除き、鍵ペアを作り直してください。秘密鍵は一度見られてしまうと、二度と元の状態には戻せません。';

  @override
  String get credentialAdviceProviderApiKey =>
      'このキーはプロバイダー側で失効させ、新しいものを発行してください。書類から取り除いても、このキーが使えなくなるわけではありません。';

  @override
  String get credentialAdviceConnectionString =>
      'これはパスワードと、そのパスワードで開く先のアドレスの両方を含んでいます。すでに共有してしまっている場合は、パスワードを変更してください。';

  @override
  String get credentialAdviceJsonWebToken =>
      'この種のトークンは期限切れになることが多いものの、必ずそうなるとは限りません。いつ期限が切れるかが分かっていない限り、まだ有効なものとして扱ってください。';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'ヘッダーの値を取り除いてください。貼り付けたリクエストのログは、有効なトークンがうっかり共有されてしまう、最もよくある経路の一つです。';

  @override
  String get credentialAdviceKeyedAssignment =>
      'これは環境変数かシークレットストアに移してください。そして、そのファイルを共有してしまっている場合は、値を変更してください。';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action にはこれが何なのか判断できません。共有する前に確認してください — これは識別子やチェックサムである可能性も同じくらいあります。';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic の API キー';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI のプロジェクトキー';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'OpenAI 形式の API キー';

  @override
  String get credentialLabelGoogleApiKey => 'Google の API キー';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google の OAuth トークン';

  @override
  String get credentialLabelGitHubToken => 'GitHub のトークン';

  @override
  String get credentialLabelSlackToken => 'Slack のトークン';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS アクセスキー ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab のトークン';

  @override
  String get credentialLabelNpmToken => 'npm のトークン';

  @override
  String get credentialLabelPassphrase => 'パスフレーズ';

  @override
  String get credentialLabelPassword => 'パスワード';

  @override
  String get credentialLabelRefreshToken => 'リフレッシュトークン';

  @override
  String get credentialLabelToken => 'トークン';

  @override
  String get credentialLabelClientSecret => 'クライアントシークレット';

  @override
  String get credentialLabelCredential => '認証情報';

  @override
  String get credentialLabelSecret => 'シークレット';

  @override
  String get linkVerdictNoObviousSignals => '目立った兆候なし';

  @override
  String get linkVerdictWorthChecking => '確かめておきたい点あり';

  @override
  String get linkVerdictTreatWithCaution => '慎重に扱ってください';

  @override
  String get linkSummaryNoObviousSignals =>
      'このリンクの書かれ方に、変わったところはありません。それは、その先のページが信頼できると分かっていることとは別のことです — このリンクが自分の予期していたものかどうかを判断できるのは、あなただけです。';

  @override
  String get linkSummaryWorthChecking => 'このリンクには、開く前に見ておきたい点が一つあります。';

  @override
  String get linkSummaryTreatWithCaution =>
      'このリンクの書かれ方には、開く前に確かめておきたい点がいくつかあります。';

  @override
  String get linkSignalNotHttps => '暗号化なし';

  @override
  String get linkSignalNonWebScheme => 'ウェブのリンクではない';

  @override
  String get linkSignalEmbeddedCredentials => 'リンクの中にパスワード';

  @override
  String get linkSignalMisleadingAuthority => '本当のアドレスが隠れている';

  @override
  String get linkSignalIpLiteralHost => '数字だけのアドレス';

  @override
  String get linkSignalPunycodeHost => '名前にエンコードされた文字';

  @override
  String get linkSignalMixedScriptHost => '名前に複数の文字体系が混在';

  @override
  String get linkSignalEncodedHost => '名前にエスケープされた文字';

  @override
  String get linkSignalUnusualPort => '通常とは違うポート';

  @override
  String get linkSignalDeepSubdomain => '名前の部分が多い';

  @override
  String get linkSignalPublicSuffixInSubdomain => '見慣れた名前が違う位置に';

  @override
  String get linkSignalShortener => '短縮リンク';

  @override
  String get linkSignalExecutableTarget => 'プログラムをダウンロードする';

  @override
  String get linkSignalRedirectParameter => '別の場所へ送られることがある';

  @override
  String get linkSignalVeryLongUrl => 'とても長い';

  @override
  String get linkSignalUnparseable => 'リンクとして読み取れない';

  @override
  String get linkDetailNotHttps =>
      'このリンクは http を使っているため、そのページに入力したものは、届くまでの途中で読み取られることがあります。';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'これはウェブページではなく「$scheme:」で始まります。別のアプリに何かをするよう求める可能性があります。';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'このリンクの中には、ユーザー名とパスワードが書き込まれています。このリンクが共有される先には、どこであれそれらも一緒についていきます。';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return '「@」より前の部分は、ブラウザーにはすべて無視されます。本当の行き先は「$host」です。';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'これは「$host」へ向かいます — 名前ではなく、数字そのままのアドレスです。まっとうなサイトは、ほとんどの場合は名前を使います。';
  }

  @override
  String get linkDetailPunycodeHost =>
      'このサイト名にはラテン文字以外の文字が含まれていて、エンコードされた形で保存されています。これは多くの言語にとって当たり前のことであり、同時に、名前を見慣れたものに似せることができる仕組みでもあります。';

  @override
  String get linkDetailMixedScriptHost =>
      'このサイト名は、ラテン文字と、それと見た目がそっくりな別の文字体系の文字を混ぜています。一文字ずつ読んでください。';

  @override
  String get linkDetailEncodedHost =>
      'このサイト名にはエスケープコードが含まれていますが、本来そこに入るものではありません。エスケープコードは、その名前が実際に何と書いてあるのかを隠すことがあります。';

  @override
  String linkDetailUnusualPort(String port) {
    return 'これは通常のポートではなく、ポート $port に接続します。テスト用のサーバーではよくあることで、公開されたサイトでは珍しいことです。';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'この名前は$count個の部分でできています。サイトの持ち主を決めるのは最後の二つだけで、残りは何とでも設定できます。',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'この名前は途中に「.$suffix.」を含んでいるため、先頭の部分がそのサイトのように見えます。実際のサイトは「$host」です。';
  }

  @override
  String get linkDetailShortener =>
      '短縮サービスは本当の行き先を隠します。開いてみないかぎり、これがどこへ行くのかは分かりません。';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'このリンクは「$fileExtension」で終わっているため、読むためのページではなく、この端末で実行できるものをダウンロードします。';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'このリンクは「$parameter」という設定の中に、もう一つのアドレスを持っています。そのため、開くと「$host」以外の場所へ連れていかれることがあります。';
  }

  @override
  String get linkDetailVeryLongUrl =>
      '長いリンクは読み取りにくく、行き先を決める部分が見えないところへ押し出されてしまうことがあります。';

  @override
  String get linkDetailUnparseable =>
      'Action はこれをウェブアドレスとして読み取れませんでした。リンクらしく見えないリンクには気をつけてください。';

  @override
  String get toolTitleRedaction => '機微な情報を隠す';

  @override
  String get toolDescriptionRedaction => '共有すべきでないものを見つけて、それを取り除いた写しを作ります。';

  @override
  String get toolSectionRedactionNothingToScan => '調べる文章がありません';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'このツールが読むのは文章です。メモ、貼り付けたメッセージ、または文字の読み取りが済んだ取り込みを選んでください。';

  @override
  String get toolSectionRedactionNothingFound => '目立つものは見つかりませんでした';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action はこの文章の中に、メールアドレス・電話番号・カード番号・受付番号を見つけませんでした。';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '隠しておきたいもの$count件',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => '墨消しした写し';

  @override
  String get toolWarningRedactionCoverage =>
      'これはメールアドレス・電話番号・口座番号のような型を見つけます。機微なものをすべて捕まえられるわけではありません — 共有する前に、写しを読んでください。';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action は画像や PDF ファイルを墨消しできません。画像の上から覆っても、その下には元のものが残ってしまうため、この機能は用意していません。';

  @override
  String get toolTitleAuthenticity => '出どころを調べる';

  @override
  String get toolDescriptionAuthenticity => 'ファイルが自分の出どころについて申告していること。';

  @override
  String get toolSectionAuthenticityNothingToInspect => '調べる対象がありません';

  @override
  String get toolSectionAuthenticityNothingToInspectBody => '画像かテキストを選んでください。';

  @override
  String get toolSectionAuthenticityFileSignals => 'このファイルが自分について言っていること';

  @override
  String get toolSectionAuthenticityFileItself => 'ファイルそのもの';

  @override
  String get toolSectionFileContents => '中身';

  @override
  String get toolSectionFileUnknownFormat => 'Action が知っている形式ではありません';

  @override
  String get toolSectionFileSize => 'サイズ';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'ここに出るのは、ファイルが自分について申告していることです。メタデータは編集も削除もできるため、そのどれも証拠にはなりません。これを使って誰かを責めないでください。';

  @override
  String get toolTitleCredentialScanner => '鍵やパスワードを探す';

  @override
  String get toolDescriptionCredentialScanner => '何かを共有する前に、認証情報を見つけます。';

  @override
  String get toolSectionCredentialNothingToCheck => '確認するものがありません';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'テキストを貼り付けるか、文字の読み取りが済んだ取り込みを選んでください。このツールが読むのはテキストだけです。';

  @override
  String get toolSectionCredentialNoneFound => '認証情報は見つかりませんでした';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action はこの文章の中に、API キー・秘密鍵・トークン・パスワードのような形をしたものを見つけませんでした。';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '認証情報$count件が見つかりました',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'シークレットかもしれないもの$count件',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy => '見つかった認証情報を取り除いた写し';

  @override
  String get toolWarningCredentialRevoke =>
      '書類からキーを取り除いても、そのキーが使えなくなるわけではありません。これらのいずれかをすでに共有してしまっている場合は、プロバイダー側で失効させ、新しいものを発行してください。';

  @override
  String get toolWarningCredentialCoverage =>
      'これが見つけられるのは、見分けのつく形をした認証情報です。文章の中に言葉で書かれたパスワードは見つかりませんので、文章そのものも読んでください。';

  @override
  String get toolTitleLinkInspector => 'リンクを調べる';

  @override
  String get toolDescriptionLinkInspector => '開く前に、アドレスから読み取れること。';

  @override
  String get toolSectionLinkNoneFound => 'リンクは見つかりませんでした';

  @override
  String get toolSectionLinkNoneFoundBody => 'リンクを貼り付けるか、リンクを含む取り込みを選んでください。';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'この文章の中のリンク$count件',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => '読み取れません';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary。$detail';
  }

  @override
  String get toolSectionLinkNothingUnusual => 'これらの書かれ方に、変わったところはありません';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'それは、その先のページが信頼できると分かっていることとは別のことです。それらが自分の予期していたものかどうかを判断できるのは、あなただけです。';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action が読むのはアドレスだけです。リンクを開くことも、サイトを調べることも、評判を判定するサービスに問い合わせることもしません — そうすれば、あなたがどこを見ているかが外へ送られてしまうからです。';

  @override
  String get toolWarningLinkNoSignals =>
      '兆候が一つもないリンクでも、害になることはあります。ここで見つけられるのはアドレスの書かれ方にある問題であり、その先がどこへ行くのかについて知るべきことのすべてではありません。';

  @override
  String get toolSectionObjective => 'あなたが望んでいること';

  @override
  String get toolSectionCurrentState => '目標の現状';

  @override
  String get toolSectionRecommendedNextStep => 'おすすめの次の手順';

  @override
  String get toolSectionCredentialAdvice => '何をすべきか';

  @override
  String get toolSectionSummary => '要約';

  @override
  String get toolDetailSeparator => '・';
}
