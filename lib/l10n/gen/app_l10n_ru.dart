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
      'Два инструмента не отправляют ничего и никогда: скрытие чувствительных сведений и проверка того, откуда взялся файл. Оба работают целиком на этом устройстве.';

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
}
