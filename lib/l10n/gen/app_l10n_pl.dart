// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppL10nPl extends AppL10n {
  AppL10nPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonDone => 'Gotowe';

  @override
  String get commonSave => 'Zapisz';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get commonBack => 'Wstecz';

  @override
  String get commonRetry => 'Spróbuj ponownie';

  @override
  String get commonDelete => 'Usuń';

  @override
  String get commonRemove => 'Wyjmij';

  @override
  String get commonContinue => 'Dalej';

  @override
  String get commonOpen => 'Otwórz';

  @override
  String get commonCopy => 'Kopiuj';

  @override
  String get commonCopied => 'Skopiowano';

  @override
  String get commonEdit => 'Edytuj';

  @override
  String get commonAdd => 'Dodaj';

  @override
  String get commonOn => 'Wł.';

  @override
  String get commonOff => 'Wył.';

  @override
  String get commonUnknown => 'Nieznane';

  @override
  String get commonChecking => 'Sprawdzanie…';

  @override
  String get commonSettings => 'Ustawienia';

  @override
  String get commonDismiss => 'Odrzuć';

  @override
  String get commonUndo => 'Cofnij';

  @override
  String get commonSkip => 'Pomiń';

  @override
  String get commonNotNow => 'Nie teraz';

  @override
  String get commonSomethingWentWrong => 'Coś poszło nie tak.';

  @override
  String get navToday => 'Dzisiaj';

  @override
  String get navLibrary => 'Biblioteka';

  @override
  String get navIntelligence => 'Inteligencja';

  @override
  String get navSearch => 'Szukaj';

  @override
  String get navCapture => 'Przechwyć coś';

  @override
  String get todayGreetingMorning => 'Dzień dobry';

  @override
  String get todayGreetingAfternoon => 'Dzień dobry';

  @override
  String get todayGreetingEvening => 'Dobry wieczór';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Nie udało się wczytać Twoich zadań. Nadal są zapisane na tym urządzeniu.';

  @override
  String get todaySectionNeedsAttention => 'Wymaga uwagi';

  @override
  String get todaySectionAlsoNeedsAttention => 'To również wymaga uwagi';

  @override
  String get todaySectionWaitingForReview => 'Czeka na sprawdzenie';

  @override
  String get todaySectionComingUp => 'Przed Tobą';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Zobacz wszystkie przechwycenia ($count)';
  }

  @override
  String get todaySeeAllInLibrary => 'Zobacz wszystko w Bibliotece';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zrobionego',
      many: '$count zrobionych',
      few: '$count zrobione',
      one: '1 zrobione',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ukończono $count zadania. Otwórz bibliotekę.',
      many: 'Ukończono $count zadań. Otwórz bibliotekę.',
      few: 'Ukończono $count zadania. Otwórz bibliotekę.',
      one: 'Ukończono 1 zadanie. Otwórz bibliotekę.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'ZACZNIJ OD';

  @override
  String get todayQuickPhoto => 'Zdjęcie';

  @override
  String get todayQuickScreenshot => 'Zrzut ekranu';

  @override
  String get todayQuickText => 'Tekst';

  @override
  String get todayQuickTools => 'Sprawdź link albo znajdź klucze w tekście';

  @override
  String get briefBadgeNeedsYou => 'POTRZEBUJE CIĘ';

  @override
  String get briefBadgeToReview => 'DO SPRAWDZENIA';

  @override
  String get briefBadgeAhead => 'PRZED TOBĄ';

  @override
  String get briefBadgeStartHere => 'ZACZNIJ TUTAJ';

  @override
  String get briefBadgeClear => 'PUSTO';

  @override
  String get briefNext => 'NASTĘPNE';

  @override
  String briefOpenAction(String title) {
    return 'Otwórz $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Oznacz „$title” jako zrobione';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zadania wymaga Twojej uwagi',
      many: '$count zadań wymaga Twojej uwagi',
      few: '$count zadania wymagają Twojej uwagi',
      one: '1 zadanie wymaga Twojej uwagi',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przechwycenia także czeka na sprawdzenie.',
      many: '$count przechwyceń także czeka na sprawdzenie.',
      few: '$count przechwycenia także czekają na sprawdzenie.',
      one: '1 przechwycenie także czeka na sprawdzenie.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przechwycenia czeka na Ciebie',
      many: '$count przechwyceń czeka na Ciebie',
      few: '$count przechwycenia czekają na Ciebie',
      one: '1 przechwycenie czeka na Ciebie',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Nic nie jest po terminie.';

  @override
  String get briefHeadlineNothingToday => 'Dziś nic Cię nie potrzebuje';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zadania jest przed Tobą.',
      many: '$count zadań jest przed Tobą.',
      few: '$count zadania są przed Tobą.',
      one: '1 zadanie jest przed Tobą.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Masz czysto';

  @override
  String get briefDetailClear => 'Nic nie jest na dziś i nic nie czeka.';

  @override
  String get briefHeadlineFirstRun => 'Zacznij od czegokolwiek';

  @override
  String get briefDetailFirstRun =>
      'List, zrzut ekranu, notatka — Action rozpozna, co to jest.';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get settingsSectionPersonalise => 'Personalizacja';

  @override
  String get settingsAppearance => 'Wygląd';

  @override
  String get settingsAppearanceDescription =>
      'Jasny, ciemny albo tak jak urządzenie.';

  @override
  String get settingsLanguageDescription =>
      'Język, w którym Action mówi do Ciebie.';

  @override
  String get appearanceSystem => 'Systemowy';

  @override
  String get appearanceLight => 'Jasny';

  @override
  String get appearanceDark => 'Ciemny';

  @override
  String get appearanceSystemDescription => 'Zgodnie z ustawieniem urządzenia';

  @override
  String get appearanceLightDescription => 'Zawsze jasny';

  @override
  String get appearanceDarkDescription => 'Zawsze ciemny';

  @override
  String get languageTitle => 'Język';

  @override
  String get languageSubtitle =>
      'Zmiany działają od razu. Nic nigdzie nie jest wysyłane; wybór zostaje na tym urządzeniu.';

  @override
  String get languageSectionChoose => 'Wybierz język';

  @override
  String get languageSystem => 'Systemowy';

  @override
  String get languageSystemDescription => 'Zgodnie z językiem urządzenia';

  @override
  String get languageDraftNote =>
      'Angielski to język, w którym napisano teksty Action. Pozostałe tłumaczenia powstały według stałego słownika i zostały sprawdzone automatycznie, ale nikt, dla kogo są to języki ojczyste, jeszcze ich nie przeczytał. Tam, gdzie liczy się dokładne sformułowanie — prywatność, bezpieczeństwo, to, co Action twierdzi i czego nie twierdzi — punktem odniesienia pozostaje angielski.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action działa bez AI. Podłączenie własnego dostawcy dodaje narzędzia do analizy dokumentów, planowania i pisania szkiców.';

  @override
  String get settingsAiProvider => 'Dostawca AI';

  @override
  String get settingsAiNotConnected =>
      'Niepodłączony. Użyj własnego konta i klucza API.';

  @override
  String settingsAiConnected(String provider) {
    return 'Podłączono do $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Prywatność i bezpieczeństwo';

  @override
  String get settingsSecurity => 'Bezpieczeństwo';

  @override
  String get settingsWhereInfoLives => 'Gdzie są Twoje informacje';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Co zostaje na tym urządzeniu, a co nie.';

  @override
  String get protectionAppLock => 'Blokada aplikacji';

  @override
  String get protectionScreenPrivacy => 'prywatność ekranu';

  @override
  String get protectionPrivateReminders => 'prywatne przypomnienia';

  @override
  String get protectionSummaryNone =>
      'Blokada aplikacji, prywatność ekranu i to, co opuszcza to urządzenie.';

  @override
  String protectionSummaryOne(String first) {
    return '$first jest włączona.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first i $second są włączone.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second i $third są włączone.';
  }

  @override
  String get settingsSectionReminders => 'Przypomnienia';

  @override
  String get settingsRemindersFootnote =>
      'Android może dostarczyć przypomnienie nieco później niż o ustawionej porze — zależnie od ustawień baterii i sposobu korzystania z urządzenia.';

  @override
  String get settingsNotifications => 'Powiadomienia';

  @override
  String get settingsNotificationsOnDescription =>
      'Ustawione przez Ciebie przypomnienia mogą być pokazywane.';

  @override
  String get settingsNotificationsOffDescription =>
      'Wyłączone dla Action, więc przypomnienia się nie pojawią.';

  @override
  String get settingsNotificationsUnknown => 'Nie udało się sprawdzić.';

  @override
  String get settingsNotificationsAllowed => 'Dozwolone';

  @override
  String get settingsOpenSystemSettings => 'Otwórz ustawienia';

  @override
  String get settingsActionFootnote =>
      'Action zamienia bałagan informacyjny w jasne następne kroki. Wszystko potwierdzasz Ty, zanim zostanie zapisane.';

  @override
  String get settingsHelp => 'Pomoc';

  @override
  String get settingsHelpDescription => 'Jak Action działa i czego nie zrobi.';

  @override
  String get settingsVersion => 'Wersja';
}
