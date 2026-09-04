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
}
