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
}
