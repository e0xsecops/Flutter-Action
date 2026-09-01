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
}
