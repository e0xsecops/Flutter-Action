// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppL10nRu extends AppL10n {
  AppL10nRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonDone => 'Готово';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonRemove => 'Убрать';

  @override
  String get commonContinue => 'Продолжить';

  @override
  String get commonOpen => 'Открыть';

  @override
  String get commonCopy => 'Копировать';

  @override
  String get commonCopied => 'Скопировано';

  @override
  String get commonEdit => 'Изменить';

  @override
  String get commonAdd => 'Добавить';

  @override
  String get commonOn => 'Вкл.';

  @override
  String get commonOff => 'Выкл.';

  @override
  String get commonUnknown => 'Неизвестно';

  @override
  String get commonChecking => 'Проверяем…';

  @override
  String get commonSettings => 'Настройки';

  @override
  String get commonDismiss => 'Скрыть';

  @override
  String get commonUndo => 'Отменить';

  @override
  String get commonSkip => 'Пропустить';

  @override
  String get commonNotNow => 'Не сейчас';

  @override
  String get commonSomethingWentWrong => 'Что-то пошло не так.';

  @override
  String get navToday => 'Сегодня';

  @override
  String get navLibrary => 'Библиотека';

  @override
  String get navIntelligence => 'Интеллект';

  @override
  String get navSearch => 'Поиск';

  @override
  String get navCapture => 'Добавить что-нибудь';

  @override
  String get todayGreetingMorning => 'Доброе утро';

  @override
  String get todayGreetingAfternoon => 'Добрый день';

  @override
  String get todayGreetingEvening => 'Добрый вечер';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Не удалось загрузить ваши задачи. Они по-прежнему хранятся на этом устройстве.';

  @override
  String get todaySectionNeedsAttention => 'Требует внимания';

  @override
  String get todaySectionAlsoNeedsAttention => 'Тоже требует внимания';

  @override
  String get todaySectionWaitingForReview => 'Ждёт проверки';

  @override
  String get todaySectionComingUp => 'Впереди';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Показать все добавленное ($count)';
  }

  @override
  String get todaySeeAllInLibrary => 'Показать всё в Библиотеке';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сделано',
      many: '$count сделано',
      few: '$count сделаны',
      one: '1 сделана',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выполнено $count задачи. Открыть библиотеку.',
      many: 'Выполнено $count задач. Открыть библиотеку.',
      few: 'Выполнено $count задачи. Открыть библиотеку.',
      one: 'Выполнена 1 задача. Открыть библиотеку.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'НАЧНИТЕ С';

  @override
  String get todayQuickPhoto => 'Фото';

  @override
  String get todayQuickScreenshot => 'Скриншот';

  @override
  String get todayQuickText => 'Текст';

  @override
  String get todayQuickTools => 'Проверьте ссылку или найдите ключи в тексте';

  @override
  String get briefBadgeNeedsYou => 'НУЖНЫ ВЫ';

  @override
  String get briefBadgeToReview => 'НА ПРОВЕРКУ';

  @override
  String get briefBadgeAhead => 'ВПЕРЕДИ';

  @override
  String get briefBadgeStartHere => 'НАЧНИТЕ ЗДЕСЬ';

  @override
  String get briefBadgeClear => 'ПУСТО';

  @override
  String get briefNext => 'ДАЛЕЕ';

  @override
  String briefOpenAction(String title) {
    return 'Открыть $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Отметить «$title» выполненной';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count задачи требуют вашего внимания',
      many: '$count задач требуют вашего внимания',
      few: '$count задачи требуют вашего внимания',
      one: '1 задача требует вашего внимания',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ещё $count добавленных ждут проверки.',
      many: 'Ещё $count добавленных ждут проверки.',
      few: 'Ещё $count добавленных ждут проверки.',
      one: 'Ещё 1 добавленное ждёт проверки.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count добавленных ждут вас',
      many: '$count добавленных ждут вас',
      few: '$count добавленных ждут вас',
      one: '1 добавленное ждёт вас',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Просроченного нет.';

  @override
  String get briefHeadlineNothingToday => 'Сегодня от вас ничего не требуется';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Впереди $count задачи.',
      many: 'Впереди $count задач.',
      few: 'Впереди $count задачи.',
      one: 'Впереди 1 задача.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'У вас всё чисто';

  @override
  String get briefDetailClear =>
      'Ничего не подходит по сроку и ничего не ждёт.';

  @override
  String get briefHeadlineFirstRun => 'Начните с чего угодно';

  @override
  String get briefDetailFirstRun =>
      'Письмо, скриншот, заметка — Action разберётся, что это.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsSectionPersonalise => 'Персонализация';

  @override
  String get settingsAppearance => 'Оформление';

  @override
  String get settingsAppearanceDescription =>
      'Светлое, тёмное или как на устройстве.';

  @override
  String get settingsLanguageDescription =>
      'Язык, на котором Action говорит с вами.';

  @override
  String get appearanceSystem => 'Как в системе';

  @override
  String get appearanceLight => 'Светлое';

  @override
  String get appearanceDark => 'Тёмное';

  @override
  String get appearanceSystemDescription => 'Следовать настройке устройства';

  @override
  String get appearanceLightDescription => 'Всегда светлое';

  @override
  String get appearanceDarkDescription => 'Всегда тёмное';

  @override
  String get languageTitle => 'Язык';

  @override
  String get languageSubtitle =>
      'Изменения применяются сразу. Ничего никуда не отправляется; выбор хранится на этом устройстве.';

  @override
  String get languageSectionChoose => 'Выберите язык';

  @override
  String get languageSystem => 'Как в системе';

  @override
  String get languageSystemDescription => 'Следовать языку устройства';

  @override
  String get languageDraftNote =>
      'Тексты Action написаны на английском. Остальные переводы подготовлены по фиксированному глоссарию и проверены автоматически, но их ещё не читал носитель языка. Там, где важна точность формулировки — конфиденциальность, безопасность, что Action утверждает и что отказывается утверждать, — эталоном остаётся английский.';

  @override
  String get ocrScriptTitle => 'Распознавание текста';

  @override
  String get ocrScriptSubtitle =>
      'Письменность, которую Action читает на фотографии. Распознавание происходит на этом устройстве; ничего из добавленного никуда не отправляется для чтения.';

  @override
  String get ocrScriptSectionChoose => 'Письменность';

  @override
  String get ocrScriptFollowLanguage => 'Следовать языку приложения';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Сейчас $script';
  }

  @override
  String get ocrScriptLatin => 'Латиница';

  @override
  String get ocrScriptChinese => 'Китайская';

  @override
  String get ocrScriptDevanagari => 'Деванагари';

  @override
  String get ocrScriptJapanese => 'Японская';

  @override
  String get ocrScriptKorean => 'Корейская';

  @override
  String get ocrScriptLatinDescription =>
      'Английский, испанский, французский, немецкий и остальные языки, которые пишут латиницей.';

  @override
  String get ocrScriptChineseDescription =>
      'Упрощённый и традиционный китайский.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Хинди, маратхи и непальский. Не бенгальский, тамильский и не телугу — у каждого из них своя письменность.';

  @override
  String get ocrScriptJapaneseDescription => 'Японский.';

  @override
  String get ocrScriptKoreanDescription => 'Корейский.';

  @override
  String get ocrScriptFootnote =>
      'Любой вариант, кроме латиницы, читает и латинские буквы, поэтому выбор добавляет письменность, а не заменяет её. Изменение действует на снимки, сделанные с этого момента, а не на уже прочитанные.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action не читает письменность $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Для неё на устройстве нет распознавания. Фотографии по-прежнему будут прочитаны в той части, что написана латиницей, остальное вернётся пустым. Этот текст можно ввести или вставить вручную.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action настроена читать $script. Если на этом снимке другая письменность, измените настройку и прочитайте его заново.';
  }

  @override
  String get settingsTextRecognition => 'Распознавание текста';

  @override
  String get settingsTextRecognitionDescription =>
      'Письменность, которую Action читает на фотографиях.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action работает и без ИИ. Подключение собственного провайдера добавляет инструменты анализа документов, планирования и черновиков.';

  @override
  String get settingsAiProvider => 'Провайдер ИИ';

  @override
  String get settingsAiNotConnected =>
      'Не подключён. Используйте свою учётную запись и ключ API.';

  @override
  String settingsAiConnected(String provider) {
    return 'Подключено к $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity =>
      'Конфиденциальность и безопасность';

  @override
  String get settingsSecurity => 'Безопасность';

  @override
  String get settingsWhereInfoLives => 'Где хранится ваша информация';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Что остаётся на этом устройстве, а что нет.';

  @override
  String get protectionAppLock => 'Блокировка приложения';

  @override
  String get protectionScreenPrivacy => 'защита экрана';

  @override
  String get protectionPrivateReminders => 'скрытые напоминания';

  @override
  String get protectionSummaryNone =>
      'Блокировка приложения, защита экрана и то, что покидает это устройство.';

  @override
  String protectionSummaryOne(String first) {
    return '$first — включено.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first и $second — включены.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second и $third — включены.';
  }

  @override
  String get settingsSectionReminders => 'Напоминания';

  @override
  String get settingsRemindersFootnote =>
      'Android может показать напоминание немного позже назначенного времени — в зависимости от настроек батареи и того, как используется устройство.';

  @override
  String get settingsNotifications => 'Уведомления';

  @override
  String get settingsNotificationsOnDescription =>
      'Заданные вами напоминания могут показываться.';

  @override
  String get settingsNotificationsOffDescription =>
      'Отключены для Action, поэтому напоминания не появятся.';

  @override
  String get settingsNotificationsUnknown => 'Не удалось проверить.';

  @override
  String get settingsNotificationsAllowed => 'Разрешены';

  @override
  String get settingsOpenSystemSettings => 'Открыть настройки';

  @override
  String get settingsActionFootnote =>
      'Action превращает беспорядочную информацию в понятные следующие шаги. Всё подтверждаете вы, прежде чем это будет сохранено.';

  @override
  String get settingsHelp => 'Справка';

  @override
  String get settingsHelpDescription =>
      'Как Action работает и чего он делать не будет.';

  @override
  String get settingsVersion => 'Версия';

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Только что';

  @override
  String relativeMinutes(int count) {
    return '$count мин назад';
  }

  @override
  String relativeHours(int count) {
    return '$count ч назад';
  }

  @override
  String get relativeYesterday => 'Вчера';

  @override
  String relativeDays(int count) {
    return '$count дн назад';
  }

  @override
  String get libraryTitle => 'Библиотека';

  @override
  String get librarySubtitle =>
      'Всё, что Action хранит для вас. И всё это остаётся на этом устройстве.';

  @override
  String get librarySegmentActions => 'Задачи';

  @override
  String get librarySegmentCaptures => 'Добавленное';

  @override
  String get librarySegmentGoals => 'Цели';

  @override
  String get librarySegmentDone => 'Готово';

  @override
  String get libraryNewGoal => 'Новая цель';

  @override
  String get libraryNoGoalsTitle => 'Целей пока нет';

  @override
  String get libraryNoGoalsMessage =>
      'Цель — это то, чего вы хотите добиться. Action может найти, чего не хватает, что мешает и с чего начать.';

  @override
  String get libraryNoDoneTitle => 'Пока ничего не завершено';

  @override
  String get libraryNoDoneMessage =>
      'Задачи, которые вы закончите, будут храниться здесь.';

  @override
  String get libraryNoOpenTitle => 'Открытых задач нет';

  @override
  String get libraryNoOpenMessage =>
      'Добавьте что-нибудь, и Action разберётся, что нужно сделать.';

  @override
  String get libraryNoCapturesTitle => 'Пока ничего не добавлено';

  @override
  String get libraryNoCapturesMessage =>
      'Фотографии, скриншоты и тексты, которые вы добавляете, попадают сначала сюда. Ничего не анализируется, пока вы не попросите.';

  @override
  String get libraryGoalNoActions => 'Из неё пока ничего не появилось';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count задачи из этой цели',
      many: '$count задач из этой цели',
      few: '$count задачи из этой цели',
      one: '$count задача из этой цели',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Поиск по задачам и добавленному';

  @override
  String get searchClear => 'Очистить';

  @override
  String get searchPrivacyNote =>
      'Поиск идёт на этом устройстве. Ничего из того, что вы вводите здесь, его не покидает.';

  @override
  String get searchYouCanSearch => 'МОЖНО ИСКАТЬ';

  @override
  String get searchFieldTitles => 'Заголовки';

  @override
  String get searchFieldTitlesExample => 'Продлить автостраховку';

  @override
  String get searchFieldReferences => 'Номера обращений';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Организации';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Шаги внутри задачи';

  @override
  String get searchFieldStepsExample => 'Загрузить бланк';

  @override
  String get searchFieldCaptureText => 'Текст, прочитанный из добавленного';

  @override
  String get searchFieldCaptureTextExample => 'уведомление о продлении';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Ничего не найдено по запросу «$query»';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Попробуйте меньше слов или номер обращения ровно так, как он написан.';

  @override
  String get searchNoMatchesClearFilters =>
      'Попробуйте меньше слов или снимите фильтры.';

  @override
  String get searchFilterActive => 'Активные';

  @override
  String get searchFilterCompleted => 'Завершённые';

  @override
  String get searchFilterOverdue => 'Просроченные';

  @override
  String get searchFilterThisWeek => 'На этой неделе';

  @override
  String get searchFilterCritical => 'Критичные';

  @override
  String get searchFilterCreatedByYou => 'Созданные вами';

  @override
  String get searchFilterArchived => 'В архиве';

  @override
  String get searchFilterClear => 'Снять фильтры';

  @override
  String get searchIncompleteActions =>
      'Не удалось выполнить поиск по вашим задачам, поэтому результаты могут быть неполными.';

  @override
  String get searchIncompleteCaptures =>
      'Не удалось выполнить поиск по добавленному, поэтому результаты могут быть неполными.';

  @override
  String get searchIncompleteBoth =>
      'Не удалось выполнить поиск ни по задачам, ни по добавленному, поэтому результаты могут быть неполными.';

  @override
  String get searchMatchTitle => 'Заголовок';

  @override
  String get searchMatchNextStep => 'Следующий шаг';

  @override
  String get searchMatchStep => 'Шаг';

  @override
  String get searchMatchSummary => 'Краткое изложение';

  @override
  String get searchMatchFromCapture => 'Из добавленного';

  @override
  String get studioSuggested => 'Предложено для последнего добавленного';

  @override
  String get studioRecentlyUsed => 'Недавно использованные';

  @override
  String get studioReady => 'ГОТОВО';

  @override
  String get studioNotConnected => 'НЕ ПОДКЛЮЧЕНО';

  @override
  String get studioHeroTitle => 'Интеллект Action';

  @override
  String get studioConnectedBlurb =>
      'Разобраться в документе, уточнить цель, построить план, набросать ответ или проверить то, что перед вами.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count инструментов для разбора документов, планирования и письма. Подключите собственную учётную запись ИИ, чтобы ими пользоваться, — счёт выставляет ваш провайдер, а не Action.';
  }

  @override
  String get studioConnectAi => 'Подключить ИИ';

  @override
  String get studioHowItWorks => 'Как это работает';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count из них уже работают без всего этого, целиком на этом устройстве.',
      many:
          '$count из них уже работают без всего этого, целиком на этом устройстве.',
      few:
          '$count из них уже работают без всего этого, целиком на этом устройстве.',
      one:
          '$count из них уже работает без всего этого, целиком на этом устройстве.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Работает на этом устройстве';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Работает на этом устройстве.';
  }

  @override
  String get categoryUnderstand => 'Разобраться';

  @override
  String get categoryUnderstandBlurb => 'Понять, что у вас есть.';

  @override
  String get categoryPlan => 'Спланировать';

  @override
  String get categoryPlanBlurb => 'Превратить это в то, что можно сделать.';

  @override
  String get categoryCreate => 'Написать';

  @override
  String get categoryCreateBlurb => 'Написать, улучшить, перевести.';

  @override
  String get categoryExtract => 'Извлечь';

  @override
  String get categoryExtractBlurb => 'Вытащить те детали, которые важны.';

  @override
  String get categoryVerify => 'Проверить';

  @override
  String get categoryVerifyBlurb => 'Проверить то, что перед вами.';

  @override
  String get captureSheetTitle => 'Добавить что-нибудь';

  @override
  String get captureSheetSubtitle =>
      'Отдайте Action всё, что вам не хочется читать целиком.';

  @override
  String get captureTakePhoto => 'Сделать фото';

  @override
  String get captureTakePhotoSubtitle =>
      'Письмо, счёт или уведомление перед вами';

  @override
  String get captureChooseImage => 'Выбрать изображение';

  @override
  String get captureChooseImageSubtitle =>
      'Скриншот или фото, которые уже есть на этом устройстве';

  @override
  String get capturePasteText => 'Вставить текст';

  @override
  String get capturePasteTextSubtitle => 'Письмо, сообщение или уведомление';

  @override
  String get captureChoosePdf => 'Выбрать PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'Выписка, письмо или бланк, который у вас уже есть';

  @override
  String get captureFootnote =>
      'Добавленное остаётся на этом устройстве. Ничего не анализируется в сети, пока вы не попросите.';

  @override
  String get captureCouldNotOpen => 'Это не удалось открыть. Попробуйте иначе.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Читается';

  @override
  String get stageNeedsReview => 'Нужна проверка';

  @override
  String get stageActionCreated => 'Задача создана';

  @override
  String get stageNoText => 'Текст не найден';

  @override
  String get stageCouldNotBeRead => 'Не удалось прочитать';

  @override
  String get stageReadingPreview => 'Читаем текст…';

  @override
  String get stageFailedPreview =>
      'Это не удалось прочитать на этом устройстве.';

  @override
  String get provenancePhoto => 'Из фотографии';

  @override
  String get provenanceImage => 'Из изображения';

  @override
  String get provenancePastedText => 'Из вставленного текста';

  @override
  String get provenanceDocument => 'Добавлено как документ';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Готово $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Просрочено · срок был $date';
  }

  @override
  String get metaDueToday => 'Срок сегодня';

  @override
  String metaDueOn(String date) {
    return 'Срок $date';
  }

  @override
  String get metaCreatedByYou => 'Создано вами';

  @override
  String get categoryPayment => 'Платёж';

  @override
  String get categoryRenewal => 'Продление';

  @override
  String get categoryAppointment => 'Приём';

  @override
  String get categoryBooking => 'Бронирование';

  @override
  String get categoryTravel => 'Поездка';

  @override
  String get categoryDeadline => 'Срок';

  @override
  String get categoryResponse => 'Нужен ответ';

  @override
  String get categoryDelivery => 'Доставка';

  @override
  String get categoryDocument => 'Документ';

  @override
  String get categoryNoActionRequired => 'Ничего делать не нужно';

  @override
  String get categoryUnsure => 'Неясно';

  @override
  String get errorEnterManually => 'Ввести вручную';

  @override
  String get sourceWhatWeRead => 'Что мы прочитали';

  @override
  String get sourceDelete => 'Удалить добавленное';

  @override
  String get sourceGone => 'Это добавленное больше недоступно.';

  @override
  String get sourceDeleteTitle => 'Удалить это добавленное?';

  @override
  String get sourceDeleteBody =>
      'Изображение и прочитанный из него текст удаляются с этого устройства.';

  @override
  String get sourceDeleteKeep => 'Оставить';

  @override
  String get sourceOpenAction => 'Открыть задачу';

  @override
  String sourceOpenActions(int count) {
    return 'Открыть задачи: $count';
  }

  @override
  String get sourceCreateAnother => 'Создать из этого ещё одну';

  @override
  String get sourceCreateAction => 'Создать из этого задачу';

  @override
  String get sourceDoMore => 'Сделать с этим больше';

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
    return '$size КБ';
  }

  @override
  String sourceConvertedFrom(String format, String size) {
    return 'из $format $size КБ';
  }

  @override
  String get sourceTextFound => 'Текст найден';

  @override
  String sourceOcrStats(int lines, int ms) {
    return 'строк: $lines · $ms мс';
  }

  @override
  String get sourceReadExplainer =>
      'Это текст, который прочитала Action. Что из него получилось — ниже.';

  @override
  String get sourceNotInterpreted =>
      'Пока ничего не истолковано. Action предложит, что с этим сделать, а вы подтверждаете, прежде чем что-либо будет создано.';

  @override
  String get sourceNoTextExplainer =>
      'Так бывает с рукописным текстом, при очень слабом свете или с письменностью, которую это устройство пока не читает.';

  @override
  String get sourceReadFailed => 'Не удалось это прочитать';

  @override
  String get sourceReadFailedReason =>
      'Распознавание текста не было доведено до конца.';

  @override
  String get sourceTryReadingAgain => 'Попробовать прочитать снова';

  @override
  String get sourceTypeInstead => 'Ввести данные вручную';

  @override
  String get sourceTypeWhatItSays => 'Введите, что там написано';

  @override
  String get sourceTypeHint => 'Даты, суммы и то, о чём просят.';

  @override
  String get sourceMadeFromThis => 'Создано из этого добавленного';

  @override
  String sourceMadeFromThisCount(int count) {
    return 'Создано из этого добавленного: $count';
  }

  @override
  String get sourceTheDocument => 'Документ';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '1 страница',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Число страниц неизвестно';

  @override
  String get sourceDocumentNotRead =>
      'Action не читала, что внутри этого документа. Когда вы запустите инструмент, которому это нужно, файл уйдёт к подключённому вами поставщику ИИ, и вас предупредят об этом заранее.';

  @override
  String get previewSaveFailed =>
      'Не удалось это сохранить. Попробуйте ещё раз.';

  @override
  String get previewTitle => 'Проверьте добавленное';

  @override
  String get previewImageFailed => 'Это изображение не удалось открыть.';

  @override
  String get previewHint =>
      'Убедитесь, что текст читается и ничего важного не обрезано.';

  @override
  String get previewRetake => 'Снять заново';

  @override
  String get pasteTitle => 'Вставить текст';

  @override
  String get pasteHint =>
      'Вставьте письмо, сообщение или уведомление, которое вам не хочется читать целиком.';

  @override
  String get pasteFootnote =>
      'Хорошо подходит всё, где есть дата, сумма или просьба.';

  @override
  String get pasteEnough => 'Похоже, этого достаточно для работы.';

  @override
  String get pasteMore => 'Немного больше текста даст лучший результат.';

  @override
  String get reviewLoadFailed => 'Не удалось загрузить это добавленное.';

  @override
  String get reviewConfirmed => 'Подтверждено';

  @override
  String get reviewNeedsReview => 'Нужна проверка';

  @override
  String get reviewReview => 'Проверить';

  @override
  String get reviewHighConfidence => 'Высокая уверенность';

  @override
  String get reviewConfirmedByYou => 'Подтверждено вами';

  @override
  String get reviewMissing => 'Отсутствует';

  @override
  String get reviewNotUnderstood =>
      'Action не смогла надёжно понять достаточную часть этого источника.';

  @override
  String get reviewNotUnderstoodBody =>
      'С добавленным ничего не случилось, и ничего не потеряно. Вы можете ввести данные сами, а источник останется прикреплённым для справки.';

  @override
  String get reviewEnterDetails => 'Ввести данные';

  @override
  String get reviewKeepSource => 'Сохранить источник на потом';

  @override
  String reviewEngine(String engine) {
    return 'Движок: $engine';
  }

  @override
  String get reviewManualNotice =>
      'Эту задачу вы создаёте сами. Использовано будет только то, что вы введёте здесь.';

  @override
  String get reviewUntitled => 'Задача без названия';

  @override
  String get reviewEditTitle => 'Изменить название';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count значения нужно проверить.',
      many: '$count значений нужно проверить.',
      few: '$count значения нужно проверить.',
      one:
          '1 значение нужно проверить, прежде чем это можно будет подтвердить.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Главные данные';

  @override
  String get reviewNotFound => 'Не найдено';

  @override
  String get reviewSuggestedNextStep => 'Предлагаемый следующий шаг';

  @override
  String get reviewWhyThisMatters => 'Почему это важно';

  @override
  String get reviewSteps => 'Шаги';

  @override
  String get reviewAddStep => 'Добавить шаг';

  @override
  String get reviewInjectionNotice =>
      'Часть текста в этом источнике выглядела как указания, а не как данные документа, поэтому Action её не учла.';

  @override
  String get reviewLayoutNotice =>
      'В разметке этого документа могут быть связи, которые извлечение текста сохранило не полностью. Сверьте значения ниже с источником, прежде чем подтверждать.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Сверьте значения ниже с источником.';
  }

  @override
  String get reviewDeadline => 'Срок';

  @override
  String get reviewAmount => 'Сумма';

  @override
  String get reviewLeftUnset => 'Нет — вы решили оставить это незаданным';

  @override
  String get reviewUnclear => 'Неясно';

  @override
  String get reviewNotSet => 'Не задано';

  @override
  String get reviewNoDeadlineFound => 'В этом документе не найден';

  @override
  String get reviewNoAmountFound => 'В этом документе не найдена';

  @override
  String get reviewMultipleDates => 'Action нашла несколько возможных дат.';

  @override
  String reviewMultipleDatesBody(int count) {
    return 'Сроком могут быть $count даты. Выберите нужную, введите другую или оставьте незаданной.';
  }

  @override
  String get reviewChooseDate => 'Выбрать дату';

  @override
  String get reviewMultipleAmounts =>
      'Action нашла больше одной возможной суммы.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return 'Речь может идти о $count суммах. Выберите одну, введите другую или оставьте незаданной.';
  }

  @override
  String get reviewChooseAmount => 'Выбрать сумму';

  @override
  String get reviewSkipStep => 'Пропустить этот шаг';

  @override
  String get reviewKeepStep => 'Оставить этот шаг';

  @override
  String get reviewEditStep => 'Изменить шаг';

  @override
  String get reviewCreateManually => 'Создать вручную';

  @override
  String get reviewConfirmAndCreate => 'Подтвердить и создать задачу';

  @override
  String get reviewFixHighlighted => 'Проверьте отмеченные поля';

  @override
  String get reviewSaving => 'Сохранение…';

  @override
  String get reviewSaveFailed =>
      'Не удалось сохранить эту задачу. Ничего не потеряно — попробуйте ещё раз.';

  @override
  String get reviewFieldTitle => 'Название';

  @override
  String get reviewTitleHint => 'Что должно произойти?';

  @override
  String get reviewNewStep => 'Новый шаг';

  @override
  String get reviewStepHint => 'Что сделать';

  @override
  String get reviewDatesConflict => 'В документе упомянута не одна дата.';

  @override
  String get reviewAmountsConflict => 'В документе упомянута не одна сумма.';

  @override
  String get reviewAnotherDate => 'Другая дата — 2026-08-30';

  @override
  String get reviewBadDate =>
      'Это не настоящая дата. Используйте формат 2026-08-30.';

  @override
  String get reviewTypeDate => 'Введите дату или оставьте её незаданной ниже.';

  @override
  String get reviewUseThisDate => 'Использовать эту дату';

  @override
  String get reviewLeaveNoDeadline => 'Продолжить без срока';

  @override
  String get reviewAnotherAmount => 'Другая сумма — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Эту сумму использовать нельзя: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Использовать эту сумму';

  @override
  String get reviewLeaveNoAmount => 'Продолжить без суммы';

  @override
  String get reviewThisValue => 'Это значение';

  @override
  String reviewQuote(String quote) {
    return '«$quote»';
  }

  @override
  String get reviewSeeOnCapture => 'Показать на добавленном';

  @override
  String get reviewViewSource => 'Открыть источник';

  @override
  String get reviewFromSource => 'Из источника';

  @override
  String get reviewNotVerified => 'Не сверено';

  @override
  String get reviewCouldNotVerify => 'Не удалось сверить это с источником.';

  @override
  String get reviewLooksRight => 'Выглядит верно';

  @override
  String get reviewStageReading => 'Чтение источника';

  @override
  String get reviewStageUnderstanding => 'Разбор важных деталей';

  @override
  String get reviewStageChecking => 'Проверка того, что нужно просмотреть';

  @override
  String get reviewNothingToDo => 'Прямо сейчас от вас ничего не требуется.';

  @override
  String get reviewInformationOnly =>
      'Похоже, это просто сведения — ни срока, ни платежа, ни просьбы ответить не найдено.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Похоже, это просто сведения — в этом добавленном ни срока, ни платежа, ни просьбы ответить не найдено.';

  @override
  String get reviewSourceKept => 'Источник сохраняется в любом случае.';

  @override
  String get reviewAddAnyway => 'Всё равно добавить задачу';

  @override
  String get reviewActionConfirmed => 'Задача подтверждена';

  @override
  String get reviewCreatedByYou => 'Создана вами.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Подтверждена вами на основании $count проверенных фактов.',
      many: 'Подтверждена вами на основании $count проверенных фактов.',
      few: 'Подтверждена вами на основании $count проверенных фактов.',
      one: 'Подтверждена вами на основании 1 проверенного факта.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Подтверждена вами на основании $count проверенных фактов. Вы изменили $edited из них.',
      many:
          'Подтверждена вами на основании $count проверенных фактов. Вы изменили $edited из них.',
      few:
          'Подтверждена вами на основании $count проверенных фактов. Вы изменили $edited из них.',
      one:
          'Подтверждена вами на основании 1 проверенного факта. Вы изменили $edited из них.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Сохранена на этом устройстве.';

  @override
  String get detailLoadFailed =>
      'Не удалось загрузить эту задачу. Она по-прежнему хранится на этом устройстве.';

  @override
  String get detailNotFoundTitle => 'Этой задачи здесь больше нет';

  @override
  String get detailNotFoundMessage =>
      'Возможно, она была удалена на этом устройстве.';

  @override
  String get detailGoBack => 'Назад';

  @override
  String get detailMore => 'Ещё';

  @override
  String get detailChangeUrgency => 'Изменить срочность';

  @override
  String get detailAddRecommendedStep => 'Добавить рекомендованный шаг';

  @override
  String get detailEditRecommendedStep => 'Изменить рекомендованный шаг';

  @override
  String get detailArchiveTitle => 'Отправить эту задачу в архив?';

  @override
  String get detailArchiveBody =>
      'Она уходит из списка, но не удаляется, а добавленное, из которого она возникла, сохраняется.';

  @override
  String get detailArchiveConfirm => 'В архив';

  @override
  String get detailArchived => 'В архиве';

  @override
  String detailCompletedOn(String date) {
    return 'Выполнена $date';
  }

  @override
  String get detailSectionDetails => 'Подробности';

  @override
  String get detailSectionReminders => 'Напоминания';

  @override
  String get detailAllStepsDone => 'Все шаги сделаны';

  @override
  String get detailNextEyebrow => 'Дальше';

  @override
  String get detailCompleteQuestion => 'Завершить эту задачу?';

  @override
  String get detailMarkStepDone => 'Отметить шаг сделанным';

  @override
  String get detailCompleteAction => 'Завершить эту задачу';

  @override
  String get detailAddDeadline => 'Добавить срок';

  @override
  String get detailAddAmount => 'Добавить сумму';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed из $total сделано';
  }

  @override
  String get detailNoStepsTitle => 'Шагов пока нет';

  @override
  String get detailNoStepsMessage =>
      'Разложите это на действия, которые вам действительно предстоит сделать.';

  @override
  String get detailAddFirstStep => 'Добавить первый шаг';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Шаг выполнен: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Следующий шаг: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Шаг: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Отметить «$title» как сделанное';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Отметить «$title» как несделанное';
  }

  @override
  String get detailStepOptions => 'Действия с шагом';

  @override
  String get detailMoveUp => 'Выше';

  @override
  String get detailMoveDown => 'Ниже';

  @override
  String get detailDeleteStep => 'Удалить шаг';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Удалить этот шаг?';

  @override
  String get stepDeleteKeep => 'Оставить';

  @override
  String get detailNoRemindersYet => 'Напоминаний пока нет.';

  @override
  String get detailReminderLimit =>
      'Больше напоминаний у одной задачи быть не может. Удалите одно, чтобы добавить другое.';

  @override
  String get detailAddReminder => 'Добавить напоминание';

  @override
  String get detailChangeReminder => 'Изменить напоминание';

  @override
  String get detailRemoveReminder => 'Удалить напоминание';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Ещё не настроено';

  @override
  String get reminderStateNotificationsOff =>
      'Сохранено, но уведомления выключены';

  @override
  String get reminderStateFailed => 'Не удалось запланировать';

  @override
  String get reminderStateRemoving => 'Удаление…';

  @override
  String get reminderSetConfirmation =>
      'Напоминание поставлено. Мы вас подтолкнём.';

  @override
  String get reminderUpdatedConfirmation => 'Напоминание обновлено.';

  @override
  String get reminderNeedsPermission =>
      'Уведомления выключены, поэтому это напоминание сохранено, но пока не может вас известить.';

  @override
  String get reminderScheduleFailed =>
      'Это напоминание сохранено, но Android не стал его планировать.';

  @override
  String get reminderLimitReached =>
      'У этой задачи уже максимальное число напоминаний.';

  @override
  String get reminderTimeInPast => 'Это время уже прошло.';

  @override
  String get reminderAddTitle => 'Добавить напоминание';

  @override
  String get reminderChangeTitle => 'Изменить это напоминание';

  @override
  String get reminderDateLabel => 'Дата';

  @override
  String get reminderTimeLabel => 'Время';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'EEEE, d MMMM';

  @override
  String get reminderPresetFormat => 'd MMM, HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'Мы напомним вам $date в $time.';
  }

  @override
  String get reminderTimePastError =>
      'Это время уже прошло. Выберите более позднее.';

  @override
  String get reminderSet => 'Поставить напоминание';

  @override
  String get reminderPresetInHour => 'Через 1 час';

  @override
  String get reminderPresetTomorrowMorning => 'Завтра утром';

  @override
  String get reminderPresetNextWeek => 'На следующей неделе';

  @override
  String get reminderPresetOnTheDay => 'В тот же день';

  @override
  String get reminderPresetDayBefore => 'За 1 день';

  @override
  String get reminderPresetWeekBefore => 'За 1 неделю';

  @override
  String get reminderPresetAtDeadline => 'В момент срока';

  @override
  String get reminderPresetHourBefore => 'За 1 час';

  @override
  String get editNextStepTitle => 'Рекомендованный следующий шаг';

  @override
  String get editNextStepSubtitle =>
      'Одно короткое предложение о следующем полезном действии.';

  @override
  String get editNextStepHint => 'Какое следующее полезное действие?';

  @override
  String get editRemoveSuggestion => 'Убрать предложение';

  @override
  String get editUrgencyTitle => 'Насколько это срочно?';

  @override
  String get editStepHint => 'Одно конкретное дело';

  @override
  String get editAddStep => 'Добавить шаг';

  @override
  String get editDateHint => 'ГГГГ-ММ-ДД';

  @override
  String get editRemoveDeadline => 'Убрать срок';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Сохранить сумму';

  @override
  String get editRemoveAmount => 'Убрать сумму';

  @override
  String get securityTitle => 'Безопасность и приватность';

  @override
  String get securitySectionProtection => 'Защита';

  @override
  String get securityAppLockUnavailable =>
      'Блокировке приложения нужна блокировка экрана на этом устройстве. Сначала задайте PIN-код, графический ключ, пароль или отпечаток в настройках устройства.';

  @override
  String get securityAppLockOn =>
      'Action просит ваше устройство подтвердить, что это вы.';

  @override
  String get securityAppLockOff =>
      'Требовать отпечаток, лицо или PIN-код устройства, чтобы открыть Action.';

  @override
  String get securityAskAgain => 'Спрашивать снова';

  @override
  String get securityAskAgainDescription =>
      'Сколько Action может быть в фоне, прежде чем заблокируется.';

  @override
  String get securityScreenPrivacy => 'Приватность экрана';

  @override
  String get securityScreenPrivacyDescription =>
      'Попросить Android блокировать снимки и запись экрана и скрывать Action в списке приложений.';

  @override
  String get securityPrivateReminders => 'Приватные напоминания';

  @override
  String get securityPrivateRemindersOn =>
      'Напоминания говорят только, что что-то вас ждёт.';

  @override
  String get securityPrivateRemindersOff =>
      'Напоминания показывают название задачи. Включите это, чтобы оно не попадало на экран блокировки.';

  @override
  String get securityLockNow => 'Заблокировать сейчас';

  @override
  String get securityLockNowDescription => 'Закрыть дверь, не дожидаясь.';

  @override
  String get securitySectionStorage => 'Как хранятся ваши данные';

  @override
  String get securityStorageDataLabel => 'Ваши задачи, добавленное и настройки';

  @override
  String get securityStorageDataDetail =>
      'Они лежат в собственном приватном хранилище этого приложения, которое другие приложения прочитать не могут и которое Android шифрует в рамках шифрования устройства. Action не добавляет поверх второй собственный слой.';

  @override
  String get securityStorageKeyLabel => 'Ваш ключ поставщика ИИ';

  @override
  String get securityStorageKeyDetail =>
      'Хранится в Android Keystore, а не вместе со всем остальным, и после сохранения больше не показывается.';

  @override
  String get securityStorageGapLabel => 'Что это не покрывает';

  @override
  String get securityStorageGapDetail =>
      'Ничто из этого не защищает от того, кто пользуется вашим разблокированным устройством, а изменённая или рутованная система может прочитать больше обычной. Блокировка приложения — та настройка, которая помогает с первым случаем.';

  @override
  String get securitySectionInformation => 'Ваши сведения';

  @override
  String get securityWhereInfoDescription =>
      'Все пути, которыми могут пойти ваши данные, и два из них покидают это устройство.';

  @override
  String get securityAppLockRefused =>
      'Не подтверждено, поэтому ничего не изменилось.';

  @override
  String get securityAppLockUnavailableToast =>
      'На этом устройстве не настроена блокировка экрана. Добавьте PIN-код, графический ключ, пароль или отпечаток в настройках устройства и попробуйте снова.';

  @override
  String get securityScreenPrivacyRefused =>
      'Это устройство не стало применять приватность экрана, поэтому она оставлена выключенной, а не показана как включённая.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count запланированных напоминаний теперь говорят меньше.',
      many: '$count запланированных напоминаний теперь говорят меньше.',
      few: '$count запланированных напоминания теперь говорят меньше.',
      one: '1 запланированное напоминание теперь говорит меньше.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Обновлено $count запланированных напоминаний.',
      many: 'Обновлено $count запланированных напоминаний.',
      few: 'Обновлено $count запланированных напоминания.',
      one: 'Обновлено 1 запланированное напоминание.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Сразу';

  @override
  String get appLockDelayOneMinute => 'Через 1 минуту';

  @override
  String get appLockDelayFiveMinutes => 'Через 5 минут';

  @override
  String get securityDelayImmediatelyDescription =>
      'Каждый раз, когда Action уходит с экрана';

  @override
  String get securityDelayOneMinuteDescription =>
      'Достаточно, чтобы ответить на сообщение';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Достаточно, чтобы поговорить по телефону';

  @override
  String get securityHeroProtected => 'Под защитой';

  @override
  String get securityHeroNothingOn => 'Ничего не включено';

  @override
  String get securityHeroFootnote =>
      'Всё здесь работает на этом устройстве. Ни одна из этих настроек никуда не отправляется, и ни одну нельзя изменить удалённо.';

  @override
  String get securityHeadlineNone => 'Доступны три вида защиты';

  @override
  String securityHeadlineOne(String first) {
    return '$first включена';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first и $second включены';
  }

  @override
  String get securityHeadlineAll => 'Все три вида защиты включены';

  @override
  String get securityTransfersTitle => 'Что покинуло это устройство';

  @override
  String get securityTransfersNoProvider =>
      'Поставщик ИИ не подключён, поэтому на анализ вообще ничего не отправляется.';

  @override
  String get securityTransfersDescription =>
      'Записывается здесь в момент отправки, независимо от того, пришёл ответ или нет. Только инструмент, поставщик и размер — никогда содержимое. Хранится 90 дней на этом устройстве и никуда не отправляется.';

  @override
  String get securityClear => 'Очистить';

  @override
  String get securityNothingSent => 'Ничего не отправлялось';

  @override
  String get securityNothingSentDescription =>
      'Когда вы запустите инструмент, который использует вашего поставщика ИИ, он появится здесь.';

  @override
  String get securityClearHistoryTitle => 'Очистить эту историю?';

  @override
  String get securityClearHistoryBody =>
      'Запись о том, что было отправлено, будет удалена с этого устройства. Она не отменяет ничего из уже отправленного.';

  @override
  String get securityUnnamedTool => 'Инструмент Intelligence';

  @override
  String get securityYourProvider => 'вашему поставщику ИИ';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '1 страница',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '1 файл',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'короткий текст';

  @override
  String securityTransferCharacters(int count) {
    return '$count тыс. символов';
  }

  @override
  String securitySentTo(String provider) {
    return 'Отправлено: $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Отправлено: $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return '$count нед. назад';
  }

  @override
  String get helpTitle => 'Справка';

  @override
  String get helpAddQuestion => 'Что я могу добавить?';

  @override
  String get helpAddAnswer =>
      'Скриншот, фотографию письма или счёта либо текст, который вы вставите. Лучше всего подходит всё, где есть дата, сумма или просьба.';

  @override
  String get helpReviewQuestion => 'Почему Action просит меня проверить?';

  @override
  String get helpReviewAnswer =>
      'Потому что машина, читающая документ, может прочитать его неверно, а срок, который тихо оказался неправильным, хуже, чем отсутствие срока. Action показывает, что нашла и из каких слов, и ничего не сохраняется, пока вы не подтвердите.';

  @override
  String get helpVaryQuestion =>
      'Почему результаты меняются, если попробовать ещё раз?';

  @override
  String get helpVaryAnswer =>
      'Сервис, который читает ваш документ, недетерминирован, поэтому одно и то же добавленное может вернуться немного другим. Именно поэтому существует шаг проверки — вы та часть, которая не меняется.';

  @override
  String get helpLateQuestion => 'Почему напоминание пришло с опозданием?';

  @override
  String get helpLateAnswer =>
      'Напоминания планируются через Android, и именно Android решает, когда именно их доставить. Энергосбережение, Doze и настройки питания производителя могут задержать любое из них. Action никогда не обещает напоминание минута в минуту.';

  @override
  String get helpDataQuestion => 'Где мои данные?';

  @override
  String get helpDataAnswer =>
      'Почти всё — на этом устройстве: ваше добавленное, задачи, шаги, напоминания и поиски. Два исключения — содержимое, которое вы просите Action прочитать, отправляется сервису ИИ, который его читает, и короткая запись о подтверждённой задаче может храниться в облаке под анонимным идентификатором. Раздел «Приватность и данные» в настройках перечисляет, что именно входит в эту запись.';

  @override
  String get helpBackupQuestion => 'Это резервная копия?';

  @override
  String get helpBackupAnswer =>
      'Нет. Облачную запись нельзя восстановить на новом устройстве, и нет учётной записи, в которую можно войти. Если вы удалите Action или потеряете это устройство, данные на нём пропадут.';

  @override
  String get helpCorrectQuestion => 'Как исправить задачу?';

  @override
  String get helpCorrectAnswer =>
      'Откройте её и измените любое поле — название, срок, сумму или предложенный следующий шаг. Шаги можно добавлять, переставлять, завершать и удалять в любой момент. Правка задачи никогда ни о чём не спрашивает сервис ИИ.';

  @override
  String get privacyTitle => 'Приватность и данные';

  @override
  String get privacyIntro =>
      'Action держит на этом устройстве всё, что может. Два исключения, и оба перечислены ниже.';

  @override
  String get privacyGroupOnDevice => 'На этом устройстве';

  @override
  String get privacyOnDeviceCaptures =>
      'Добавленное — скриншоты, фотографии и тексты, которые вы добавляете, и прочитанный из них текст.';

  @override
  String get privacyOnDeviceActions => 'Задачи, их шаги, данные и напоминания.';

  @override
  String get privacyOnDeviceSearch =>
      'Поиск. Ваши поиски выполняются здесь, никуда не отправляются и не сохраняются после того, как вы закроете экран.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Фотографии хранятся без их местоположения. Координаты, время и данные камеры, которые телефон записывает внутрь снимка, удаляются до сохранения добавленного, поэтому они не остаются здесь и не попадают вашему поставщику ИИ вместе со снимком.';

  @override
  String get privacyGroupSentToRead => 'Отправляется, чтобы быть прочитанным';

  @override
  String get privacySentToReadWhat =>
      'Когда вы просите Action истолковать добавленное, это содержимое отправляется сервису ИИ, который его читает. Это не ИИ на устройстве.';

  @override
  String get privacySentToReadWhen =>
      'Отправляется только то добавленное, которое вы выбрали, и только когда вы об этом просите.';

  @override
  String get privacyGroupYourProvider =>
      'Отправляется вашему собственному поставщику ИИ';

  @override
  String get privacyProviderWhat =>
      'Если вы подключите поставщика ИИ в настройках, инструменты Intelligence отправят выбранное вами содержимое этому поставщику — OpenAI, Anthropic, Google или выбранному вами endpoint — с вашим собственным ключом API.';

  @override
  String get privacyProviderDirect =>
      'Оно уходит прямо к ним. Оно не проходит ни через один сервер, принадлежащий Action.';

  @override
  String get privacyProviderScope =>
      'Отправляется только то, что вы выбрали для инструмента, и только когда вы его запускаете. Ваши другие задачи, добавленное и источники никогда не включаются, и в фоне никогда ничего не отправляется.';

  @override
  String get privacyProviderKey =>
      'Ваш ключ API хранится в защищённом хранилище этого устройства и отправляется только тому поставщику, которому принадлежит. Защищённое хранилище — реальное препятствие для того, у кого ваше разблокированное устройство, но оно не абсолютно, и Action не станет утверждать обратное.';

  @override
  String get privacyProviderLocalTools =>
      'Некоторые инструменты не отправляют ничего и никогда: скрытие чувствительных сведений, проверка того, откуда взялся файл, поиск учётных данных и проверка ссылки работают целиком на этом устройстве.';

  @override
  String get privacyProviderAgreement =>
      'Что ваш поставщик делает с тем, что вы отправляете, определяется вашим соглашением с ним, а не Action.';

  @override
  String get privacyGroupCloud => 'Хранится в облаке';

  @override
  String get privacyCloudWhat =>
      'Когда вы подтверждаете задачу, её короткая запись может сохраниться под анонимным идентификатором этой установки: название, статус, срочность, категория, срок, сумма, предложенный следующий шаг и отметки времени.';

  @override
  String get privacyCloudNotSent =>
      'Ваше добавленное, прочитанный из него текст, шаги и данные задачи, а также ваши напоминания не отправляются.';

  @override
  String get privacyCloudNotBackup =>
      'Это не резервная копия. Восстановить её на новом устройстве невозможно, а потеря этой установки уносит с собой и анонимный идентификатор.';

  @override
  String get privacyGroupDiagnostics => 'Диагностика';

  @override
  String get privacyDiagnosticsWhat =>
      'Action ведёт анонимный подсчёт того, что происходит в приложении — что добавление началось, что разбор сработал или нет, что поиск ничего не нашёл, что задача завершена.';

  @override
  String get privacyDiagnosticsCounts =>
      'Это счётчики, а не содержимое. Туда никогда не попадают ни название, ни сумма, ни срок, ни номер, ни добавленный текст, ни поисковый запрос — как и анонимный идентификатор или любой идентификатор задачи либо добавленного.';

  @override
  String get privacyDiagnosticsCrash =>
      'Если приложение падает, ошибка и место, где это произошло, отправляются, чтобы это можно было исправить. Action не прикладывает к таким отчётам ваши данные.';

  @override
  String get privacySectionYourData => 'Ваши данные';

  @override
  String get privacyYourDataFootnote =>
      'Очистка добавленного оставляет ваши задачи на месте. Задача, чьё добавленное исчезло, продолжает работать; она просто больше не показывает, из чего возникла.';

  @override
  String get privacyClearCaptures => 'Очистить добавленное';

  @override
  String get privacyClearCapturesDescription =>
      'Удаляет всё добавленное и файлы его изображений.';

  @override
  String get privacyDeleteAll => 'Удалить все мои данные';

  @override
  String get privacyDeleteAllDescription =>
      'Задачи, шаги, напоминания, добавленное и облачные записи выше.';

  @override
  String get privacyClearCapturesTitle => 'Очистить добавленное?';

  @override
  String get privacyClearCapturesBody =>
      'Всё добавленное и его изображения будут удалены с этого устройства. Ваши задачи останутся ровно такими, какие есть.';

  @override
  String get privacyCapturesDeleted => 'Добавленное удалено.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Часть добавленного удалить не удалось. Больше ничего не изменилось.';

  @override
  String get privacyDeleteAllTitle => 'Удалить все ваши данные?';

  @override
  String get privacyDeleteAllBody =>
      'Это удаляет каждую задачу, шаг, напоминание и добавленное на этом устройстве, а также перечисленные выше облачные записи. Отменить это нельзя, и нет резервной копии, из которой можно восстановить.';

  @override
  String get privacyDeleteEverything => 'Удалить всё';

  @override
  String get privacyDeletedAll => 'Всё удалено.';

  @override
  String get privacyDeleteFailed => 'Ваши данные не удалось удалить.';

  @override
  String get privacyDeletedUnverified =>
      'Всё на этом устройстве удалено. Action не смогла связаться с облаком, чтобы подтвердить, что там ничего не осталось, и проверит ещё раз.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Удалено, кроме: $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action попробует ещё раз.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action не смогла закончить проверку облака и попробует ещё раз.';

  @override
  String get privacyLeftoverCaptures => 'часть добавленного';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count облачной записи',
      many: '$count облачных записей',
      few: '$count облачные записи',
      one: '1 облачная запись',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first и $second';
  }

  @override
  String get privacyCloudDeleted => 'Облачные записи удалены.';

  @override
  String get privacyCloudUnreachable =>
      'Связаться с ними по-прежнему не вышло. Action попробует ещё раз.';

  @override
  String get privacyPendingTitle => 'Осталось удалить';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'В прошлый раз не удалось связаться с $count облачными записями. Action попробует сама, или вы можете повторить сейчас.',
      many:
          'В прошлый раз не удалось связаться с $count облачными записями. Action попробует сама, или вы можете повторить сейчас.',
      few:
          'В прошлый раз не удалось связаться с $count облачными записями. Action попробует сама, или вы можете повторить сейчас.',
      one: 'В прошлый раз не удалось связаться с 1 облачной записью. Action попробует сама, или вы можете повторить сейчас.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Повторить';

  @override
  String get evidenceTitle => 'Откуда это взято';

  @override
  String get evidenceUnverified =>
      'Action не нашла этих слов в прочитанном тексте, поэтому это значение не сверено. Сравните его с оригиналом, прежде чем на него полагаться.';

  @override
  String get evidenceHighlighted =>
      'Эти слова были в тексте, который Action прочитала из этого добавленного, и выделение показывает где.';

  @override
  String get evidenceNoRegion =>
      'Эти слова были в тексте, который Action прочитала из этого добавленного. Где именно на изображении они находятся, установить не удалось, и догадки здесь не строятся.';

  @override
  String get evidenceInText =>
      'Эти слова были в тексте, который содержится в этом добавленном.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Критично';

  @override
  String get urgencyImportant => 'Важно';

  @override
  String get urgencyNormal => 'Обычно';

  @override
  String get urgencyLow => 'Низкая';

  @override
  String get urgencyUnsure => 'Неизвестно';

  @override
  String get detailSaveFailed =>
      'Это не сохранилось. Ничего не потеряно — попробуйте ещё раз.';

  @override
  String get detailSectionCreatedFrom => 'Создано из';

  @override
  String get detailSourceChecking => 'Загружаем исходное добавленное…';

  @override
  String get detailSourceUnavailable =>
      'Исходное добавленное больше недоступно.';

  @override
  String get detailReopenAction => 'Вернуть задачу в работу';

  @override
  String get detailMarkActionComplete => 'Отметить задачу выполненной';

  @override
  String get detailGetHelp => 'Помощь с этой задачей';

  @override
  String get detailSectionHistory => 'История';

  @override
  String get detailHistoryShowLess => 'Показать меньше';

  @override
  String detailHistoryShowAll(int count) {
    return 'Показать все записи: $count';
  }

  @override
  String get detailHistoryCreated => 'Создана';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Создана с $count шагами',
      many: 'Создана с $count шагами',
      few: 'Создана с $count шагами',
      one: 'Создана с $count шагом',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'Вы подтвердили данные';

  @override
  String detailHistoryStepFinished(String title) {
    return 'Завершено «$title»';
  }

  @override
  String get detailHistoryAStep => 'шаг';

  @override
  String get detailHistoryReminderSet => 'Вы поставили напоминание';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'Вы поставили напоминание на $when';
  }

  @override
  String get detailHistoryCompleted => 'Отмечена как выполненная';

  @override
  String get detailHistoryChanged => 'Последнее изменение';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Свой (совместимый с OpenAI)';

  @override
  String get aiCapabilityText => 'текстом';

  @override
  String get aiCapabilityImages => 'изображениями';

  @override
  String get aiCapabilityDocuments => 'документами';

  @override
  String get aiCapabilityStructuredResults => 'структурированными результатами';

  @override
  String get aiCapabilityStreaming => 'потоковой выдачей';

  @override
  String get aiCapabilitySystemInstructions => 'системными инструкциями';

  @override
  String get aiCapabilityEvidenceCitations => 'цитатами из источника';

  @override
  String get aiCapabilityLongDocuments => 'длинными документами';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a или $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head или $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'Подключите поставщика ИИ, чтобы пользоваться этим инструментом.';

  @override
  String get aiFailureInvalidKey => 'Поставщик не принял этот ключ API.';

  @override
  String get aiFailureQuotaExceeded =>
      'На вашей учётной записи у поставщика закончились средства или исчерпана квота.';

  @override
  String get aiFailureRateLimited =>
      'Ваш поставщик ограничивает частоту запросов. Повторите через некоторое время.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action не смогла связаться с вашим поставщиком ИИ. Проверьте соединение.';

  @override
  String get aiFailureUnsupportedModel =>
      'Эта модель недоступна для вашего ключа. Выберите другую в настройках.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'Выбранная вами модель не умеет работать с $capabilities. Выберите в настройках другую модель.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'Этого содержимого слишком много, чтобы эта модель прочитала его за один раз.';

  @override
  String get aiFailureInputTooLargeText =>
      'Этого текста больше, чем можно проанализировать за один раз.';

  @override
  String get aiFailureProviderUnavailable =>
      'У вашего поставщика ИИ неполадки. Повторите через некоторое время.';

  @override
  String get aiFailureMalformedResponse =>
      'Этот поставщик вернул что-то, что Action не смогла прочитать.';

  @override
  String get aiFailureCancelled => 'Остановлено.';

  @override
  String get aiFailureInsecureEndpoint =>
      'Этот endpoint должен быть адресом https://.';

  @override
  String get aiFailureUnknown =>
      'Что-то пошло не так при обращении к вашему поставщику ИИ.';

  @override
  String get appLockTitle => 'Action заблокирована';

  @override
  String get appLockPrompt =>
      'Подтвердите, что это вы, чтобы продолжить. Action просит об этом ваше устройство — она никогда не видит ни вашего отпечатка, ни лица, ни PIN-кода.';

  @override
  String get appLockUnlocking => 'Разблокируем…';

  @override
  String get appLockNotConfirmed =>
      'Это не подтверждено. Попробуйте снова, когда будете готовы.';

  @override
  String get appLockCannotConfirm =>
      'Сейчас ваше устройство не может подтвердить, что это вы. Проверьте, что в настройках устройства по-прежнему задана блокировка экрана.';

  @override
  String get appLockWaiting => 'Ожидание…';

  @override
  String get appLockUnlock => 'Разблокировать';

  @override
  String get appLockReasonUnlock => 'Разблокировать Action';

  @override
  String get appLockReasonEnable =>
      'Подтвердите, что это вы, чтобы включить блокировку приложения';

  @override
  String get appLockReasonDisable =>
      'Подтвердите, что это вы, чтобы выключить блокировку приложения';

  @override
  String get todayCapabilityHeading => 'С чем работает Action';

  @override
  String get todayCapabilityDocumentTitle => 'Письмо или счёт';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action читает его и находит срок, сумму и номер обращения.';

  @override
  String get todayCapabilityScreenshotTitle => 'Скриншот';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Превратите сообщение, о котором вы иначе забудете, в то, что можно сделать.';

  @override
  String get todayCapabilityTextTitle => 'Какой-нибудь текст';

  @override
  String get todayCapabilityTextBlurb =>
      'Вставьте что угодно. Action разберётся, что это и чего от вас просят.';

  @override
  String get todayCapabilityConfirmTitle => 'Всё подтверждаете вы';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Ничто не становится задачей, пока вы не увидите цитаты из источника и не согласитесь.';

  @override
  String get todayCapabilityExploreIntelligence => 'Открыть Интеллект';

  @override
  String get documentRejectedEmpty => 'Этот файл пустой.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'Этот документ занимает $size — это больше, чем Action может обработать.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'Это не PDF, как бы он ни назывался. Action читает PDF и изображения.';

  @override
  String get documentRejectedUnreadable =>
      'Этот документ не удалось прочитать.';

  @override
  String get pdfRejectedNotAPdf => 'Этот файл не PDF, как бы он ни назывался.';

  @override
  String get pdfRejectedEncrypted =>
      'Этот PDF защищён паролем, поэтому Action не может его прочитать.';

  @override
  String get pdfRejectedDamaged =>
      'Этот PDF не удалось прочитать. Возможно, он неполный.';

  @override
  String get shareRejectedEmpty =>
      'В присланном не оказалось ничего, что можно прочитать.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action принимает текст, изображения и PDF. Это было что-то другое.';

  @override
  String get shareRejectedContentMismatch =>
      'Этот файл не того типа, каким себя называет, поэтому Action его не открывала.';

  @override
  String get shareRejectedTooLarge =>
      'Этот файл слишком большой, чтобы Action могла его обработать.';

  @override
  String get shareRejectedUnreadable => 'Этот файл не удалось прочитать.';

  @override
  String get captureFailureRecognition =>
      'Распознавание текста не смогло запуститься.';

  @override
  String get captureFailureImageFormat =>
      'Этот формат изображения не удалось прочитать на этом устройстве.';

  @override
  String get connectSheetTitle => 'Подключите свой ИИ';

  @override
  String get connectSheetSubtitle =>
      'Вы пользуетесь собственной учётной записью у поставщика и собственным ключом API. Action хранит ключ в защищённом хранилище этого устройства.';

  @override
  String get connectErrorKeyMissing =>
      'Вставьте свой ключ API, чтобы продолжить.';

  @override
  String get connectErrorModelMissing =>
      'Выберите модель или введите идентификатор модели.';

  @override
  String get connectErrorEndpointMissing => 'Добавьте адрес своего endpoint.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'Не удалось открыть защищённое хранилище этого устройства, поэтому ключ не сохранён.';

  @override
  String get connectTestSucceeded => 'Подключено.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Подключено. Доступно моделей: $count.';
  }

  @override
  String get connectProviderLabel => 'Поставщик';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'Это должен быть адрес https://. Action не станет отправлять ваши документы по незашифрованному соединению.';

  @override
  String get connectApiKeyLabel => 'Ключ API';

  @override
  String get connectApiKeyHint => 'Вставьте свой ключ';

  @override
  String get connectKeyPrivacyNote =>
      'Ваш ключ остаётся на этом устройстве. Action никогда не отправляет его никуда, кроме выбранного вами поставщика, и после сохранения больше не может вам его показать.';

  @override
  String get connectModelLabel => 'Модель';

  @override
  String get connectModelIdHint => 'Идентификатор модели';

  @override
  String get connectModelFreeTextNote =>
      'Поставщики выводят идентификаторы моделей из обращения и добавляют новые. Если нужного нет в списке, введите его здесь.';

  @override
  String get connectAndTest => 'Подключить и проверить';

  @override
  String get connectSaveWithoutTesting => 'Сохранить без проверки';

  @override
  String get toolWarningFactsNotChecked =>
      'Action не смогла сравнить это с исходным текстом, поэтому суммы и даты в нём не проверены.';

  @override
  String get toolTitleRewrite => 'Улучшить этот текст';

  @override
  String get toolDescriptionRewrite =>
      'Понятнее, короче или в более деловом тоне — факты остаются на месте.';

  @override
  String get toolModeRewriteClearer => 'Понятнее';

  @override
  String get toolModeRewriteProfessional => 'Более деловой';

  @override
  String get toolModeRewriteShorter => 'Короче';

  @override
  String get toolModeRewritePersuasive => 'Убедительнее';

  @override
  String get toolModeRewriteSimpler => 'Проще';

  @override
  String get toolModeRewriteStructured => 'Структурнее';

  @override
  String get toolModeRewriteGrammarOnly => 'Только грамматика';

  @override
  String get toolSectionWhatChanged => 'Что изменилось';

  @override
  String get toolSectionNote => 'Примечание';

  @override
  String get toolSectionAlreadyClearBody =>
      'Здесь и так всё было понятно. Изменения ниже — незначительные.';

  @override
  String get toolSectionImprovedText => 'Улучшенный текст';

  @override
  String get toolTitleDraftReply => 'Набросать ответ';

  @override
  String get toolDescriptionDraftReply =>
      'Ответ, который вы сами отредактируете и отправите.';

  @override
  String get toolModeReplyProfessional => 'Деловой';

  @override
  String get toolModeReplyConcise => 'Краткий';

  @override
  String get toolModeReplyFriendly => 'Дружелюбный';

  @override
  String get toolModeReplyFormal => 'Официальный';

  @override
  String get toolModeReplyClarification => 'Попросить уточнить';

  @override
  String get toolModeReplyConfirmation => 'Подтвердить получение';

  @override
  String get toolModeReplyDispute => 'Возразить';

  @override
  String get toolSectionSubject => 'Тема';

  @override
  String get toolSectionDraftReply => 'Черновик ответа';

  @override
  String get toolSectionPlaceholders => 'Это нужно заполнить вам';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Черновик — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'Это черновик. Action ничего не отправляет — прочитайте его, отредактируйте и отправьте сами.';

  @override
  String get toolTitleTranslate => 'Перевести';

  @override
  String get toolDescriptionTranslate =>
      'Другой язык, а числа и имена остаются на месте.';

  @override
  String get toolSectionTranslation => 'Перевод';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'Перевод: $from → $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'Оставлено как в оригинале';

  @override
  String get toolWarningTranslationNotCertified =>
      'Перевод для понимания, а не заверенный перевод.';

  @override
  String get toolTitleStructuredData => 'Извлечь таблицу';

  @override
  String get toolDescriptionStructuredData =>
      'Строки, поля и числа, которые можно скопировать.';

  @override
  String get toolSectionTable => 'Таблица';

  @override
  String get toolSectionFields => 'Поля';

  @override
  String get toolSectionTableCsv => 'Таблица (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'Разметку столбцов этой таблицы не удалось прочитать надёжно. Прежде чем ими пользоваться, проверьте, что значения стоят в своих строках.';

  @override
  String get toolTitleDeadlineFinder => 'Найти сроки';

  @override
  String get toolDescriptionDeadlineFinder =>
      'Что нужно сделать, к какому сроку и что будет, если этого не сделать.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count срока',
      many: '$count сроков',
      few: '$count срока',
      one: '$count срок',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Сроков не найдено';

  @override
  String get toolSectionNothingDueBody =>
      'Action не нашла в этом материале ни сроков, ни обязательств.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'Ничего не планируется, пока вы это не выберете. Напоминания никогда не ставятся автоматически.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'Если нет: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'Вам нужно: $items';
  }

  @override
  String get moneyErrorEmpty => 'сумма не указана';

  @override
  String get moneyErrorMalformed => 'сумма записана не обычным числом';

  @override
  String get moneyErrorNegative =>
      'отрицательная сумма не может быть суммой к оплате';

  @override
  String get moneyErrorTooManyDecimals =>
      'знаков после запятой больше, чем есть у этой валюты';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'этот код валюты мы не распознаём';

  @override
  String get moneyErrorOutOfRange => 'сумма неправдоподобно большая';

  @override
  String get escalationOcrFailed =>
      'Распознавание на этом добавленном вообще не смогло запуститься.';

  @override
  String get escalationNoTextRecognised =>
      'Похоже на документ, но текст не распознан.';

  @override
  String get escalationThinText =>
      'Для документа такого размера распознано слишком мало текста.';

  @override
  String get escalationLowLineConfidence =>
      'Распознаватель сообщил о низкой уверенности в нескольких строках.';

  @override
  String get escalationTableLikeLayout =>
      'Разметка похожа на таблицу, и при чтении строка за строкой теряется, какое значение к какой строке относится.';

  @override
  String get escalationFragmentedLayout =>
      'Текст вернулся множеством мелких обрывков, поэтому структура неясна.';

  @override
  String get escalationMalformedText =>
      'Значительная часть распознанного текста — это не читаемые слова и не числа.';

  @override
  String get escalationConflictingDates =>
      'Как срок представлена не одна дата.';

  @override
  String get escalationConflictingAmounts =>
      'Как сумма к оплате представлена не одна сумма.';

  @override
  String get escalationUnresolvedGrounding =>
      'Некоторые значения не удалось сверить с текстом документа.';

  @override
  String get escalationInstructionLikeContent =>
      'В документе есть текст, написанный так, будто это указания приложению. Он воспринимается как содержимое документа и никогда — как указания.';

  @override
  String get providerFailureNetwork =>
      'Action не смогла связаться с сервисом. Проверьте соединение.';

  @override
  String get providerFailureTimedOut => 'Сервис слишком долго не отвечал.';

  @override
  String get providerFailureServiceUnavailable =>
      'Сервис временно недоступен. Повторите позже.';

  @override
  String get providerFailureUnauthorized =>
      'Сейчас у этого приложения нет прав на использование сервиса.';

  @override
  String get providerFailureBlocked =>
      'Сервис отказался обрабатывать этот документ.';

  @override
  String get providerFailureUnknown =>
      'Action не смогла прочитать этот документ. Возможно, повторная попытка сработает.';

  @override
  String get reviewBlockerTitle => 'Дайте этой задаче название.';

  @override
  String get reviewBlockerDate =>
      'Выберите, какая дата — настоящий срок, или оставьте его незаданным.';

  @override
  String get reviewBlockerAmount =>
      'Выберите, какая сумма верна, или оставьте её незаданной.';

  @override
  String get reviewBlockerStepTitle =>
      'Шагам, которые вы оставляете, нужно название.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'страница $page',
      many: 'страница $page',
      few: 'страница $page',
      one: 'страница $page',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'страницы $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'В переписанном тексте больше нет этих значений: $values. Проверьте его, прежде чем им пользоваться.',
      many:
          'В переписанном тексте больше нет этих значений: $values. Проверьте его, прежде чем им пользоваться.',
      few:
          'В переписанном тексте больше нет этих значений: $values. Проверьте его, прежде чем им пользоваться.',
      one:
          'В переписанном тексте больше нет этого значения: $values. Проверьте его, прежде чем им пользоваться.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'В переписанном тексте больше нет этих значений: $values — и ещё $count. Проверьте его, прежде чем им пользоваться.',
      many:
          'В переписанном тексте больше нет этих значений: $values — и ещё $count. Проверьте его, прежде чем им пользоваться.',
      few:
          'В переписанном тексте больше нет этих значений: $values — и ещё $count. Проверьте его, прежде чем им пользоваться.',
      one:
          'В переписанном тексте больше нет этих значений: $values — и ещё $count. Проверьте его, прежде чем им пользоваться.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Достигнута';

  @override
  String get goalNewSheetTitle => 'Чего вы хотите добиться?';

  @override
  String get goalNewSheetSubtitle =>
      'Хватит одного предложения. Подробности можно добавить потом.';

  @override
  String get goalTitleHint => 'Продлить автостраховку, не переплатив.';

  @override
  String get goalCreateAction => 'Создать цель';

  @override
  String get goalTitleSheetTitle => 'Чего вы хотите';

  @override
  String get goalOutcomeSheetTitle => 'Как выглядит результат';

  @override
  String get goalContextSheetTitle => 'Как обстоят дела';

  @override
  String get goalOutcomeHint => 'Машина застрахована, документы поданы.';

  @override
  String get goalContextHint => 'У меня два предложения, а продление — 18-го.';

  @override
  String get goalWorkspaceTitle => 'Цель';

  @override
  String get goalUnmarkReached => 'Снять отметку «достигнута»';

  @override
  String get goalMarkReached => 'Отметить как достигнутую';

  @override
  String get goalNotFound => 'Этой цели здесь больше нет.';

  @override
  String get goalDeleteTitle => 'Удалить эту цель?';

  @override
  String get goalDeleteBody =>
      'Цель удаляется с этого устройства. Все задачи, созданные из неё, останутся ровно такими, какие есть.';

  @override
  String get goalOutcomeLabel => 'Что значит «сделано»';

  @override
  String get goalOutcomeEmpty =>
      'Пока не написано. Цель проще спланировать, когда сказано, что значит её завершить.';

  @override
  String get goalContextLabel => 'Как обстоят дела';

  @override
  String get goalContextEmpty =>
      'Пока ничего не написано. Что произошло на данный момент и что мешает.';

  @override
  String get goalTitleLabel => 'Чего вы хотите';

  @override
  String get goalEditTooltip => 'Изменить цель';

  @override
  String get goalToolsLabel => 'Что умеет Action';

  @override
  String get goalToolsNotReady =>
      'Напишите чуть больше о том, чего вы хотите, — и этим инструментам будет с чем работать.';

  @override
  String get toolGoalOptimizerTitle => 'Уточнить цель';

  @override
  String get toolActionPlanTitle => 'Построить план';

  @override
  String get resultFactUnconfirmed => 'Не подтверждено';

  @override
  String get resultSuggestedSteps => 'Предлагаемые шаги';

  @override
  String get resultSuggestedAction => 'Предлагаемая задача';

  @override
  String get resultWorthAsking => 'О чём стоит спросить';

  @override
  String get resultSuggestedDeadlines => 'Предлагаемые сроки';

  @override
  String get resultSuggestions => 'Предложения';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count подкрепляющей цитаты',
      many: '$count подкрепляющих цитат',
      few: '$count подкрепляющие цитаты',
      one: '$count подкрепляющая цитата',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'Из выбранного источника';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Готовим ваш документ';

  @override
  String get toolRunStageReading => 'Читаем выбранные страницы';

  @override
  String get toolRunStageAnalysing => 'Анализируем';

  @override
  String get toolRunStageBuilding => 'Собираем то, что вы проверите';

  @override
  String get toolRunStageDone => 'Завершено';

  @override
  String get toolRunStageFailed => 'Это не завершилось';

  @override
  String get toolRunStageCancelled => 'Остановлено';

  @override
  String get toolRunFailureLocalCheckFailed => 'Это не удалось проверить.';

  @override
  String get toolRunFailureProviderRetired =>
      'Этот поставщик ИИ больше недоступен в этой версии.';

  @override
  String get toolRunFailureUnusableReply =>
      'Этот ответ пришёл в непригодном для использования виде. Попробуйте ещё раз.';

  @override
  String get toolRunFailureQuestionRequired => 'Сначала введите вопрос.';

  @override
  String get toolRunFailureInputRequired =>
      'Выберите, с чем этому инструменту работать.';

  @override
  String get toolWarningReplyTruncated =>
      'Этот ответ оборвался, поэтому он может быть неполным.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Ваша модель не вернула ни одной подкрепляющей цитаты, поэтому ничто здесь не подкреплено. Сверьте это с документом, прежде чем действовать.';

  @override
  String get aiSettingsRemoveTitle => 'Убрать это подключение?';

  @override
  String get aiSettingsRemoveBody =>
      'Action удалит ваш ключ API с этого устройства и перестанет пользоваться функциями ИИ. Вашей учётной записи у поставщика это не касается.';

  @override
  String get aiSettingsProviderLabel => 'Поставщик';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'Счёт за использованное выставляет ваш поставщик. Action никогда не отправляет запрос сама по себе.';

  @override
  String get aiSettingsConnectLabel => 'Подключить поставщика ИИ';

  @override
  String get aiSettingsConnectDescription =>
      'Используйте собственную учётную запись и ключ API с OpenAI, Anthropic, Google Gemini или совместимым endpoint.';

  @override
  String get aiSettingsModelLabel => 'Модель';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'Ключ API';

  @override
  String get aiSettingsKeyStored =>
      'Хранится в защищённом хранилище этого устройства.';

  @override
  String get aiSettingsKeyMissing =>
      'На этом устройстве ключ не найден. Подключитесь снова, чтобы добавить его.';

  @override
  String get aiSettingsTestLabel => 'Проверить подключение';

  @override
  String get aiSettingsProviderUnavailable =>
      'Этот поставщик недоступен в этой версии.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Подключено. Доступно моделей: $count.';
  }

  @override
  String get aiSettingsTestButton => 'Проверить';

  @override
  String get aiSettingsChangeProvider => 'Изменить поставщика или модель';

  @override
  String get aiSettingsRemoveKey => 'Удалить ключ';

  @override
  String get aiSettingsSectionPrivacy => 'Приватность';

  @override
  String get aiSettingsWhatGetsSentLabel => 'Что отправляется';

  @override
  String get aiSettingsWhereItGoesLabel => 'Куда это уходит';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'Ничего не отправляется, пока вы не подключите поставщика.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Прямо к $provider, с вашим ключом. Это не проходит через серверы Action.';
  }

  @override
  String get aiSettingsSectionData => 'Данные';

  @override
  String get aiSettingsDataFootnote =>
      'Action запоминает, какими инструментами вы пользовались, и никогда — к чему вы их применяли.';

  @override
  String get aiSettingsRecentToolsLabel => 'Недавно использованные инструменты';

  @override
  String get aiSettingsRecentToolsNone => 'Нет';

  @override
  String get reminderNotificationTitle => 'Напоминание Action';

  @override
  String get reminderNotificationPrivateBody => 'Вам нужно кое-что проверить.';

  @override
  String get reminderChannelName => 'Напоминания Action';

  @override
  String get reminderChannelDescription =>
      'Напоминания, которые вы сами поставили для своих задач.';

  @override
  String get onboardingStart => 'Начать пользоваться Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'Шаг $current из $total';
  }

  @override
  String get onboardingCaptureTitle => 'Превратите информацию в задачи';

  @override
  String get onboardingCaptureBody =>
      'Добавьте скриншот, фотографию или присланный вам текст. Action прочитает это и разберётся, чего от вас просят.';

  @override
  String get onboardingReviewTitle =>
      'Ничего не сохраняется, пока вы это не подтвердите';

  @override
  String get onboardingReviewBody =>
      'Action показывает, что нашла и из каких слов это взято. Вы исправляете всё, что неверно. Пока вы не подтвердите, это предложение — не факт и не задача.';

  @override
  String get onboardingTrackingTitle => 'Держите под контролем то, что важно';

  @override
  String get onboardingTrackingBody =>
      '«Требует внимания» выносит вперёд просроченное и то, что близко. У каждой задачи есть свой следующий шаг, свой прогресс и любые напоминания, которые вы для неё поставили.';

  @override
  String get onboardingPrivacyBody => 'Что стоит знать до начала:';

  @override
  String get onboardingPrivacyOnDevice =>
      'Ваши задачи, добавленное, напоминания и поиски хранятся на этом устройстве. Поиск и напоминания работают без подключения к сети.';

  @override
  String get onboardingPrivacySentToRead =>
      'Когда вы просите Action что-то прочитать, это содержимое отправляется сервису ИИ, который его истолковывает.';

  @override
  String get onboardingPrivacyCloud =>
      'Короткая запись о подтверждённой задаче — её название, даты, сумма и предлагаемый шаг — может сохраниться в облаке под анонимным идентификатором этого устройства. Ваше добавленное, шаги и напоминания — нет.';

  @override
  String get onboardingPrivacyNotBackup =>
      'Эта запись — не резервная копия. Восстановить с её помощью что-либо на новом устройстве невозможно.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count препятствия',
      many: '$count препятствий',
      few: '$count препятствия',
      one: '$count препятствие',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Могло бы быть проще';

  @override
  String get toolDescriptionGoalOptimizer =>
      'Чего не хватает, что мешает, с чего начать.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'После: $step';
  }

  @override
  String get toolSectionThePlan => 'План';

  @override
  String get toolDescriptionActionPlan =>
      'Упорядоченный набор шагов, которые вы можете превратить в задачи.';

  @override
  String get toolTitleSmartChecklist => 'Составить чек-лист';

  @override
  String get toolDescriptionSmartChecklist =>
      'Всё, чего это от вас требует, по порядку.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count недостающей детали',
      many: '$count недостающих деталей',
      few: '$count недостающие детали',
      one: '$count недостающая деталь',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions =>
      'Эти утверждения противоречат друг другу';

  @override
  String get toolTitleMissingInformation => 'Чего не хватает';

  @override
  String get toolDescriptionMissingInformation =>
      'Пробелы и о чём по ним спросить.';

  @override
  String get aiAdapterTimedOut =>
      'Это заняло слишком много времени и было остановлено.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'Защищённое соединение с вашим поставщиком ИИ не удалось установить.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action не нашла такую модель или такой endpoint.';

  @override
  String get aiAdapterRequestRejected =>
      'Ваш поставщик ИИ отклонил этот запрос.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action не смогла открыть защищённое хранилище этого устройства.';

  @override
  String get aiAdapterEndpointMissing =>
      'Добавьте адрес вашего endpoint ИИ в Настройках.';

  @override
  String get aiAdapterReplyIncomplete =>
      'Этот ответ оказался неполным. Попробуйте ещё раз.';

  @override
  String get aiAdapterContentDeclined =>
      'Ваш поставщик отказался обрабатывать это содержимое.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'Это больше $limit файлов за раз. Выберите меньше.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'Одно из этих изображений слишком велико для анализа.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return 'Файл «$filename» слишком велик для анализа. Предел — $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return 'Страниц в файле «$filename»: $count. Action читает не больше $limit за раз — выберите диапазон.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'Этот выбор слишком велик, чтобы отправить его одним запросом.';

  @override
  String get toolRunNotAvailableTitle => 'Этот инструмент недоступен';

  @override
  String get toolRunNotAvailableMessage =>
      'Возможно, он был удалён в более новой версии Action.';

  @override
  String get toolRunNoSourcesYet =>
      'Пока не с чем работать. Добавьте что-нибудь или вставьте текст ниже.';

  @override
  String get toolRunChooseSourcesToCompare => 'Выберите, что сравнить';

  @override
  String get toolRunChooseSource => 'Выберите источник';

  @override
  String get toolRunQuestionLabel => 'Ваш вопрос';

  @override
  String get toolRunQuestionHint => 'Какой срок?';

  @override
  String get toolRunFreeTextLabel => 'Или вставьте текст';

  @override
  String get toolRunFreeTextHint => 'Вставьте или введите здесь';

  @override
  String get toolRunModeLabel => 'Стиль';

  @override
  String get toolRunRunLocally => 'Проверить на этом устройстве';

  @override
  String get toolRunRun => 'Запустить';

  @override
  String get toolRunStop => 'Остановить';

  @override
  String get toolRunRunAgain => 'Запустить снова';

  @override
  String get toolRunWorkingOn => 'Над чем работаем:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'Отправить это в $provider?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'Выбранное вами содержимое будет отправлено в $provider на обработку, с вашим ключом API.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'Ваш ключ остаётся на этом устройстве. Action ничего не отправляет в фоне и не отправляет ваши другие задачи и источники.';

  @override
  String get toolRunScopeTitle => 'Перед запуском';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count страницы будут проанализированы через ваше подключение к $provider.',
      many:
          '$count страниц будут проанализированы через ваше подключение к $provider.',
      few:
          '$count страницы будут проанализированы через ваше подключение к $provider.',
      one:
          '$count страница будет проанализирована через ваше подключение к $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count файла будут проанализированы через ваше подключение к $provider.',
      many:
          '$count файлов будут проанализированы через ваше подключение к $provider.',
      few:
          '$count файла будут проанализированы через ваше подключение к $provider.',
      one:
          '$count файл будет проанализирован через ваше подключение к $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'Выбранный вами текст будет отправлен через ваше подключение к $provider.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Подключите поставщика ИИ, чтобы пользоваться этим инструментом';

  @override
  String get toolRunNeedsProviderBody =>
      'Вы используете собственную учётную запись у поставщика и собственный ключ API.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Задача создана из $count шага.',
      many: 'Задача создана из $count шагов.',
      few: 'Задача создана из $count шагов.',
      one: 'Задача создана из $count шага.',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Добавлено $count шага.',
      many: 'Добавлено $count шагов.',
      few: 'Добавлено $count шага.',
      one: 'Добавлен $count шаг.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count шага',
      many: '$count шагов',
      few: '$count шага',
      one: '$count шаг',
    );
    return 'Создать задачу · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count шага',
      many: '$count шагов',
      few: '$count шага',
      one: '$count шаг',
    );
    return 'Добавить в эту задачу · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Фото';

  @override
  String get sourceTypeLabelScreenshot => 'Скриншот';

  @override
  String get sourceTypeLabelPastedText => 'Вставленная заметка';

  @override
  String get sourceTypeLabelDocument => 'Документ';

  @override
  String get toolModeClearer => 'Понятнее';

  @override
  String get toolModeMoreProfessional => 'Профессиональнее';

  @override
  String get toolModeShorter => 'Короче';

  @override
  String get toolModeSimpler => 'Проще';

  @override
  String get toolModeMoreStructured => 'Структурированнее';

  @override
  String get toolModeMorePersuasive => 'Убедительнее';

  @override
  String get toolModeGrammarOnly => 'Только грамматика';

  @override
  String get toolModeProfessional => 'Деловой';

  @override
  String get toolModeConcise => 'Краткий';

  @override
  String get toolModeFriendly => 'Дружелюбный';

  @override
  String get toolModeFormal => 'Официальный';

  @override
  String get toolModeAskForClarification => 'Попросить уточнить';

  @override
  String get toolModeConfirm => 'Подтвердить получение';

  @override
  String get toolModeDispute => 'Оспорить';

  @override
  String get toolModeQuick => 'Коротко';

  @override
  String get toolModeDetailed => 'Подробно';

  @override
  String get toolModeExecutive => 'Для принятия решения';

  @override
  String get toolModeKeyPoints => 'Ключевые моменты';

  @override
  String get toolModeActionFocused => 'С упором на задачи';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count процитированной детали не удалось найти в том, что вы выбрали, поэтому они помечены как неподтверждённые.',
      many:
          '$count процитированных деталей не удалось найти в том, что вы выбрали, поэтому они помечены как неподтверждённые.',
      few:
          '$count процитированные детали не удалось найти в том, что вы выбрали, поэтому они помечены как неподтверждённые.',
      one:
          '$count процитированную деталь не удалось найти в том, что вы выбрали, поэтому она помечена как неподтверждённая.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action не смогла сверить эти цитаты с самим файлом, поэтому они не сверены.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Просрочено · $count дня',
      many: 'Просрочено · $count дней',
      few: 'Просрочено · $count дня',
      one: 'Просрочено · $count день',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Срок завтра';

  @override
  String get triageBadgeReminderSoon => 'Скоро напоминание';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Просрочено на $count дня',
      many: 'Просрочено на $count дней',
      few: 'Просрочено на $count дня',
      one: 'Просрочено на $count день',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'Эта задача сделана.';

  @override
  String get triageExplanationNothingPressing =>
      'Эта задача здесь, потому что пока ничего не поджимает.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'Эта задача требует внимания, потому что $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'Эта задача ниже в списке, потому что $reason.';
  }

  @override
  String get triageReasonOverdue => 'она просрочена';

  @override
  String get triageReasonDeadlinePassed => 'её срок прошёл';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'она просрочена на $count дня',
      many: 'она просрочена на $count дней',
      few: 'она просрочена на $count дня',
      one: 'она просрочена на $count день',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'её срок сегодня';

  @override
  String get triageReasonCriticalDueSoon =>
      'вы отметили её как критичную, и её срок близко';

  @override
  String get triageReasonAllStepsDone =>
      'все шаги сделаны — осталось её завершить';

  @override
  String get triageReasonDueTomorrow => 'её срок завтра';

  @override
  String get triageReasonReminderSoon =>
      'вы поставили для неё напоминание в ближайшие сутки';

  @override
  String get triageReasonDueWithinThreeDays => 'её срок — в ближайшие три дня';

  @override
  String get triageReasonCriticalNoDeadline =>
      'вы отметили её как критичную, а срока у неё нет';

  @override
  String get triageReasonDueWithinSevenDays => 'её срок — в ближайшую неделю';

  @override
  String get triageReasonImportant => 'вы отметили её как важную';

  @override
  String get triageReasonDueLater => 'её срок дальше';

  @override
  String get triageReasonNoDeadline => 'срока у неё нет и ничего не поджимает';

  @override
  String cardCompletedTooltip(String title) {
    return 'Выполнена: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Разобраться в этом документе';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'Что это, что важно и что с этим делать.';

  @override
  String get toolSectionWhatThisIs => 'Что это такое';

  @override
  String get toolSectionWhatMatters => 'Что важно';

  @override
  String get toolSectionKeyDetails => 'Ключевые детали';

  @override
  String get toolTitleAskDocument => 'Спросить об источнике';

  @override
  String get toolDescriptionAskDocument =>
      'Ответы, основанные только на том, что вы выбрали, — или ничего.';

  @override
  String get toolSectionNoAnswer => 'Ответ в этом материале не найден';

  @override
  String get toolSectionNoAnswerBody =>
      'Action не смогла найти это в выбранном документе.';

  @override
  String get toolSectionAnswer => 'Ответ';

  @override
  String get toolSectionFromTheDocument => 'Из документа';

  @override
  String get toolWarningQuoteNotFound =>
      'Цитаты, на которой основан этот ответ, в выбранном материале нет. Считайте этот ответ ненадёжным.';

  @override
  String get toolTitleSmartSummary => 'Изложить кратко';

  @override
  String get toolDescriptionSmartSummary =>
      'Коротко — или только то, что требует от вас действий.';

  @override
  String get toolSectionKeyPoints => 'Ключевые моменты';

  @override
  String get toolTitleCompareDocuments => 'Сравнить документы';

  @override
  String get toolDescriptionCompareDocuments =>
      'Что изменилось, что противоречит, чего нет.';

  @override
  String get toolSectionWhatDiffers => 'Чем различаются';

  @override
  String get toolSectionConflicts => 'Противоречия';

  @override
  String get toolSectionOnlyInOne => 'Только в одном из них';

  @override
  String get toolSectionInCommon => 'Что общего';

  @override
  String get sensitiveKindEmail => 'Электронная почта';

  @override
  String get sensitiveKindPhone => 'Номер телефона';

  @override
  String get sensitiveKindPaymentCard => 'Номер платёжной карты';

  @override
  String get sensitiveKindIban => 'Банковский счёт (IBAN)';

  @override
  String get sensitiveKindNationalId => 'Номер удостоверения личности';

  @override
  String get sensitiveKindPostcode => 'Почтовый индекс';

  @override
  String get sensitiveKindAccountNumber => 'Номер счёта';

  @override
  String get sensitiveKindReference => 'Справочный номер';

  @override
  String get sensitiveKindDateOfBirth => 'Дата рождения';

  @override
  String get sensitiveKindUrl => 'Веб-адрес';

  @override
  String get verdictVerifiedProvenance =>
      'Есть проверенные сведения о происхождении';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'В этом файле есть подпись, и она прошла проверку.';

  @override
  String get verdictSignalsSynthetic =>
      'Признаки, соответствующие содержимому, созданному ИИ';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'Этот файл сообщает, что он создан генеративным инструментом. Метаданные можно изменить или удалить, поэтому это утверждение самого файла, а не доказательство.';

  @override
  String get verdictSignalsEdited =>
      'Признаки, соответствующие отредактированному содержимому';

  @override
  String get verdictSignalsEditedExplainer =>
      'Этот файл сообщает, что прошёл через программу для редактирования. Для фотографий это обычное дело и само по себе не означает, что что-то подделали.';

  @override
  String get verdictNoReliableProvenance =>
      'Надёжных сведений о происхождении не найдено';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'В этом файле нет сведений о происхождении. Это нормально — большинство сервисов их удаляет — и ни о чём не говорит.';

  @override
  String get verdictInconclusive => 'Однозначного вывода нет';

  @override
  String get verdictInconclusiveExplainer =>
      'Здесь недостаточно сведений, чтобы сказать, откуда это взялось.';

  @override
  String get authenticitySignalCamera => 'Камера';

  @override
  String get authenticitySignalSoftware => 'Программа';

  @override
  String get authenticitySignalDescription => 'Описание';

  @override
  String get authenticitySignalCopyright => 'Авторские права';

  @override
  String get authenticitySignalLocation => 'Местоположение';

  @override
  String get authenticitySignalLocationValue =>
      'В этом файле есть данные о местоположении.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Не проверялось — в этой сборке нет средства проверки подписи.';

  @override
  String get authenticitySignalFile => 'Файл';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'Не удалось прочитать как изображение.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'Формат изображения не распознан.';

  @override
  String get authenticitySignalText => 'Текст';

  @override
  String get authenticitySignalTextValue =>
      'По одному тексту нельзя надёжно определить, использовался ли ИИ. Action не гадает.';

  @override
  String get fileTypePng => 'изображение PNG';

  @override
  String get fileTypeJpeg => 'изображение JPEG';

  @override
  String get fileTypeGif => 'изображение GIF';

  @override
  String get fileTypeWebp => 'изображение WebP';

  @override
  String get fileTypeWav => 'аудиозапись WAV';

  @override
  String get fileTypePdf => 'документ PDF';

  @override
  String get fileTypeHeic => 'изображение HEIC';

  @override
  String get fileTypeVideo => 'видеофайл';

  @override
  String get fileTypeTiff => 'изображение TIFF';

  @override
  String get fileTypeBitmap => 'растровое изображение';

  @override
  String get fileTypeRtf => 'документ RTF';

  @override
  String get fileTypeZip => 'архив Zip';

  @override
  String get fileTypeGzip => 'архив gzip';

  @override
  String get fileTypeSevenZip => 'архив 7-Zip';

  @override
  String get fileTypeRar => 'архив RAR';

  @override
  String get fileTypeWindowsProgram => 'программа Windows';

  @override
  String get fileTypeLinuxProgram => 'программа Linux';

  @override
  String get fileTypePostScript => 'документ PostScript';

  @override
  String get fileTypeOgg => 'аудиозапись Ogg';

  @override
  String get fileTypeMp3 => 'аудиозапись MP3';

  @override
  String get fileTypePlainText => 'простой текст';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'Этот файл называется \".$extension\", а его содержимое — $contents. Это может быть честной ошибкой, а ещё именно так файл и открывается не тем, чем вы ожидали.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count байта',
      many: '$count байт',
      few: '$count байта',
      one: '$count байт',
    );
    return '$_temp0';
  }

  @override
  String fileSizeKilobytes(String size) {
    return '$size КБ';
  }

  @override
  String fileSizeMegabytes(String size) {
    return '$size МБ';
  }

  @override
  String fileSizeGigabytes(String size) {
    return '$size ГБ';
  }

  @override
  String get credentialKindPrivateKey => 'Закрытый ключ';

  @override
  String get credentialKindApiKey => 'Ключ API';

  @override
  String get credentialKindConnectionString => 'Строка подключения';

  @override
  String get credentialKindAccessToken => 'Токен доступа';

  @override
  String get credentialKindAuthorizationHeader => 'Заголовок Authorization';

  @override
  String get credentialKindPasswordOrKey => 'Пароль или ключ';

  @override
  String get credentialKindPossibleSecret => 'Возможный секрет';

  @override
  String get credentialAdvicePrivateKey =>
      'Уберите это, прежде чем делиться, и замените пару ключей. Увиденный однажды закрытый ключ уже нельзя снова сделать безопасным.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Отзовите этот ключ у поставщика и выпустите новый. Удаление из документа его не отключает.';

  @override
  String get credentialAdviceConnectionString =>
      'Здесь и пароль, и адрес, который он открывает. Смените пароль, если этим уже делились.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Такие токены часто истекают, но не всегда. Считайте его действующим, пока не узнаете, когда он истекает.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Уберите значение заголовка. Вставленные логи запросов — один из самых частых способов случайно поделиться рабочим токеном.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Перенесите это в переменную окружения или в хранилище секретов и смените значение, если файлом уже делились.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action не может определить, что это. Проверьте это, прежде чем делиться, — с тем же успехом это может быть идентификатором или контрольной суммой.';

  @override
  String get credentialLabelAnthropicApiKey => 'Ключ API Anthropic';

  @override
  String get credentialLabelOpenAiProjectKey => 'Ключ проекта OpenAI';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'Ключ API в стиле OpenAI';

  @override
  String get credentialLabelGoogleApiKey => 'Ключ API Google';

  @override
  String get credentialLabelGoogleOAuthToken => 'Токен OAuth Google';

  @override
  String get credentialLabelGitHubToken => 'Токен GitHub';

  @override
  String get credentialLabelSlackToken => 'Токен Slack';

  @override
  String get credentialLabelAwsAccessKeyId => 'Идентификатор ключа доступа AWS';

  @override
  String get credentialLabelGitLabToken => 'Токен GitLab';

  @override
  String get credentialLabelNpmToken => 'Токен npm';

  @override
  String get credentialLabelPassphrase => 'Парольная фраза';

  @override
  String get credentialLabelPassword => 'Пароль';

  @override
  String get credentialLabelRefreshToken => 'Токен обновления';

  @override
  String get credentialLabelToken => 'Токен';

  @override
  String get credentialLabelClientSecret => 'Секрет клиента';

  @override
  String get credentialLabelCredential => 'Учётные данные';

  @override
  String get credentialLabelSecret => 'Секрет';

  @override
  String get linkVerdictNoObviousSignals => 'Явных признаков нет';

  @override
  String get linkVerdictWorthChecking => 'Стоит проверить';

  @override
  String get linkVerdictTreatWithCaution => 'Отнеситесь с осторожностью';

  @override
  String get linkSummaryNoObviousSignals =>
      'В том, как написана эта ссылка, нет ничего необычного. Это не то же самое, что знать, что странице можно доверять, — только вы можете судить, ждали ли вы её.';

  @override
  String get linkSummaryWorthChecking =>
      'В этой ссылке есть одна вещь, на которую стоит взглянуть, прежде чем открывать её.';

  @override
  String get linkSummaryTreatWithCaution =>
      'В том, как написана эта ссылка, есть несколько вещей, которые стоит проверить, прежде чем открывать её.';

  @override
  String get linkSignalNotHttps => 'Без шифрования';

  @override
  String get linkSignalNonWebScheme => 'Не веб-ссылка';

  @override
  String get linkSignalEmbeddedCredentials => 'Пароль в ссылке';

  @override
  String get linkSignalMisleadingAuthority => 'Настоящий адрес скрыт';

  @override
  String get linkSignalIpLiteralHost => 'Числовой адрес';

  @override
  String get linkSignalPunycodeHost => 'Закодированные символы в имени';

  @override
  String get linkSignalMixedScriptHost => 'Смешанные алфавиты в имени';

  @override
  String get linkSignalEncodedHost => 'Экранированные символы в имени';

  @override
  String get linkSignalUnusualPort => 'Необычный порт';

  @override
  String get linkSignalDeepSubdomain => 'Много частей в имени';

  @override
  String get linkSignalPublicSuffixInSubdomain =>
      'Знакомое имя не на своём месте';

  @override
  String get linkSignalShortener => 'Сокращённая ссылка';

  @override
  String get linkSignalExecutableTarget => 'Скачивает программу';

  @override
  String get linkSignalRedirectParameter => 'Уводит вас в другое место';

  @override
  String get linkSignalVeryLongUrl => 'Очень длинная';

  @override
  String get linkSignalUnparseable => 'Ссылку не удалось прочитать';

  @override
  String get linkDetailNotHttps =>
      'Эта ссылка использует http, поэтому всё, что вы введёте на странице, можно прочитать по дороге туда.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'Это открывается через \"$scheme:\", а не как веб-страница. Оно может попросить другое приложение что-то сделать.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'В эту ссылку вписаны имя пользователя и пароль. Куда бы ею ни поделились, они идут вместе с ней.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'Всё, что стоит до \"@\", браузер игнорирует. Настоящий адрес назначения — \"$host\".';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'Она ведёт на \"$host\" — это голый адрес, а не имя. Настоящие сайты почти всегда используют имя.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'В имени сайта есть нелатинские символы, они хранятся в закодированном виде. Для многих языков это нормально, и точно так же имя можно сделать похожим на знакомое.';

  @override
  String get linkDetailMixedScriptHost =>
      'В имени сайта латинские буквы смешаны с буквами другого алфавита, которые выглядят так же. Прочитайте его по одному символу.';

  @override
  String get linkDetailEncodedHost =>
      'В имени сайта есть коды экранирования, а им там не место. Они могут скрыть то, что имя говорит на самом деле.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'Подключение идёт через порт $port, а не через обычный. Для тестовых серверов это обычное дело, а для публичных сайтов — необычно.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'В имени $count части. Только последние две определяют, кто управляет сайтом; остальные можно задать какими угодно.',
      many:
          'В имени $count частей. Только последние две определяют, кто управляет сайтом; остальные можно задать какими угодно.',
      few:
          'В имени $count части. Только последние две определяют, кто управляет сайтом; остальные можно задать какими угодно.',
      one:
          'В имени $count часть. Только последние две определяют, кто управляет сайтом; остальные можно задать какими угодно.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'В середине этого имени стоит \".$suffix.\", из-за чего начало выглядит как сам сайт. На самом деле сайт — это \"$host\".';
  }

  @override
  String get linkDetailShortener =>
      'Сервис сокращения ссылок скрывает настоящий адрес назначения. Узнать, куда она ведёт, не открыв её, нельзя.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'Эта ссылка заканчивается на \"$fileExtension\", поэтому она скачивает не страницу для чтения, а то, что может запуститься на вашем устройстве.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'Эта ссылка несёт второй адрес в настройке \"$parameter\", поэтому, открыв её, вы можете попасть не на \"$host\", а куда-то ещё.';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'Длинные ссылки труднее читать, а часть, которая определяет адрес назначения, может оказаться вытесненной за пределы видимости.';

  @override
  String get linkDetailUnparseable =>
      'Action не смогла прочитать это как веб-адрес. Будьте осторожны со ссылками, которые не выглядят как ссылки.';

  @override
  String get toolTitleRedaction => 'Скрыть чувствительные сведения';

  @override
  String get toolDescriptionRedaction =>
      'Найти то, чем делиться не стоит, и сделать копию без этого.';

  @override
  String get toolSectionRedactionNothingToScan => 'Нечего сканировать';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'Этот инструмент читает текст. Выберите заметку, вставленное сообщение или добавленное, текст которого уже прочитан.';

  @override
  String get toolSectionRedactionNothingFound => 'Ничего очевидного не найдено';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action не нашла в этом тексте ни адресов электронной почты, ни номеров телефонов, ни номеров карт, ни справочных номеров.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count вещи, которые стоит скрыть',
      many: '$count вещей, которые стоит скрыть',
      few: '$count вещи, которые стоит скрыть',
      one: '$count вещь, которую стоит скрыть',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Копия с изъятыми сведениями';

  @override
  String get toolWarningRedactionCoverage =>
      'Это находит шаблоны вроде адресов электронной почты, номеров телефонов и номеров счетов. Всё чувствительное оно не поймает — прочитайте копию, прежде чем ею делиться.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action не может изымать сведения из изображений и файлов PDF. Если что-то закрасить на картинке, под закраской останется оригинал, поэтому такой возможности здесь нет.';

  @override
  String get toolTitleAuthenticity => 'Проверить, откуда это взялось';

  @override
  String get toolDescriptionAuthenticity =>
      'Что файл заявляет о собственном происхождении.';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'Нечего изучать';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Выберите изображение или текст.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'Что этот файл говорит о себе';

  @override
  String get toolSectionAuthenticityFileItself => 'Сам файл';

  @override
  String get toolSectionFileContents => 'Содержимое';

  @override
  String get toolSectionFileUnknownFormat => 'Такого формата Action не знает';

  @override
  String get toolSectionFileSize => 'Размер';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'Здесь сообщается то, что файл заявляет о себе. Метаданные можно изменить или убрать, поэтому ничто из этого не является доказательством. Не используйте это, чтобы кого-то обвинить.';

  @override
  String get toolTitleCredentialScanner => 'Найти ключи и пароли';

  @override
  String get toolDescriptionCredentialScanner =>
      'Найти учётные данные, прежде чем чем-то делиться.';

  @override
  String get toolSectionCredentialNothingToCheck => 'Нечего проверять';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Вставьте текст или выберите добавленное, текст которого уже прочитан. Этот инструмент читает только текст.';

  @override
  String get toolSectionCredentialNoneFound => 'Учётных данных не найдено';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action не нашла в этом тексте ничего, что по форме походило бы на ключ API, закрытый ключ, токен или пароль.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Найдено $count набора учётных данных',
      many: 'Найдено $count наборов учётных данных',
      few: 'Найдено $count набора учётных данных',
      one: 'Найден $count набор учётных данных',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count вещи, которые могут быть секретами',
      many: '$count вещей, которые могут быть секретами',
      few: '$count вещи, которые могут быть секретами',
      one: '$count вещь, которая может быть секретом',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Копия с удалёнными учётными данными';

  @override
  String get toolWarningCredentialRevoke =>
      'Удаление ключа из документа его не отключает. Если чем-то из этого уже делились, отзовите его у поставщика и выпустите новый.';

  @override
  String get toolWarningCredentialCoverage =>
      'Это находит учётные данные с узнаваемой формой. Пароль, записанный словами в предложении, найден не будет, поэтому прочитайте текст и сами.';

  @override
  String get toolTitleLinkInspector => 'Проверить ссылку';

  @override
  String get toolDescriptionLinkInspector =>
      'Что адрес выдаёт, прежде чем вы его откроете.';

  @override
  String get toolSectionLinkNoneFound => 'Ссылок не найдено';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Вставьте ссылку или выберите добавленное, в котором она есть.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ссылки в этом тексте',
      many: '$count ссылок в этом тексте',
      few: '$count ссылки в этом тексте',
      one: '$count ссылка в этом тексте',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'Не удалось прочитать';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'В том, как они написаны, нет ничего необычного';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'Это не то же самое, что знать, что этим страницам можно доверять. Судить о том, ждали ли вы их, можете только вы.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action читает только адрес. Она не открывает ссылку, не ищет сведения о сайте и не обращается ни к одному сервису репутации — от этого сведения о том, что вы открываете, ушли бы к кому-то ещё.';

  @override
  String get toolWarningLinkNoSignals =>
      'Ссылка без признаков всё равно может навредить. Это находит проблемы в том, как написан адрес, а это не всё, что можно знать о том, куда он ведёт.';

  @override
  String get toolSectionObjective => 'Ваша цель';

  @override
  String get toolSectionCurrentState => 'Как продвигается цель';

  @override
  String get toolSectionRecommendedNextStep => 'Рекомендованный следующий шаг';

  @override
  String get toolSectionCredentialAdvice => 'Что делать';

  @override
  String get toolSectionSummary => 'Краткое изложение';

  @override
  String get toolDetailSeparator => ' · ';
}
