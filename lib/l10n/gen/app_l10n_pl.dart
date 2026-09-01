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

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Przed chwilą';

  @override
  String relativeMinutes(int count) {
    return '$count min temu';
  }

  @override
  String relativeHours(int count) {
    return '$count godz. temu';
  }

  @override
  String get relativeYesterday => 'Wczoraj';

  @override
  String relativeDays(int count) {
    return '$count dni temu';
  }

  @override
  String get libraryTitle => 'Biblioteka';

  @override
  String get librarySubtitle =>
      'Wszystko, co Action dla Ciebie przechowuje. I wszystko to zostaje na tym urządzeniu.';

  @override
  String get librarySegmentActions => 'Zadania';

  @override
  String get librarySegmentCaptures => 'Przechwycenia';

  @override
  String get librarySegmentGoals => 'Cele';

  @override
  String get librarySegmentDone => 'Zrobione';

  @override
  String get libraryNewGoal => 'Nowy cel';

  @override
  String get libraryNoGoalsTitle => 'Jeszcze żadnych celów';

  @override
  String get libraryNoGoalsMessage =>
      'Cel to coś, co chcesz doprowadzić do skutku. Action potrafi znaleźć, czego brakuje, co to blokuje i od czego zacząć.';

  @override
  String get libraryNoDoneTitle => 'Jeszcze nic nieukończone';

  @override
  String get libraryNoDoneMessage =>
      'Zadania, które skończysz, będą tu przechowywane.';

  @override
  String get libraryNoOpenTitle => 'Brak otwartych zadań';

  @override
  String get libraryNoOpenMessage =>
      'Przechwyć coś, a Action ustali, co trzeba zrobić.';

  @override
  String get libraryNoCapturesTitle => 'Jeszcze nic nieprzechwycone';

  @override
  String get libraryNoCapturesMessage =>
      'Zdjęcia, zrzuty ekranu i teksty, które dodasz, trafiają najpierw tutaj. Nic nie jest analizowane, dopóki o to nie poprosisz.';

  @override
  String get libraryGoalNoActions => 'Nic z tego jeszcze nie powstało';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zadania z tego celu',
      many: '$count zadań z tego celu',
      few: '$count zadania z tego celu',
      one: '1 zadanie z tego celu',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Szukaj w zadaniach i przechwyceniach';

  @override
  String get searchClear => 'Wyczyść';

  @override
  String get searchPrivacyNote =>
      'Wyszukiwanie odbywa się na tym urządzeniu. Nic, co tu wpiszesz, go nie opuszcza.';

  @override
  String get searchYouCanSearch => 'MOŻESZ SZUKAĆ';

  @override
  String get searchFieldTitles => 'Tytuły';

  @override
  String get searchFieldTitlesExample => 'Odnowić ubezpieczenie samochodu';

  @override
  String get searchFieldReferences => 'Numery referencyjne';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Instytucje';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Kroki wewnątrz zadania';

  @override
  String get searchFieldStepsExample => 'Wgrać formularz';

  @override
  String get searchFieldCaptureText => 'Tekst odczytany z przechwycenia';

  @override
  String get searchFieldCaptureTextExample => 'zawiadomienie o odnowieniu';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Brak wyników dla „$query”';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Spróbuj mniej słów albo numeru referencyjnego dokładnie tak, jak wygląda.';

  @override
  String get searchNoMatchesClearFilters =>
      'Spróbuj mniej słów albo wyczyść filtry.';

  @override
  String get searchFilterActive => 'Otwarte';

  @override
  String get searchFilterCompleted => 'Ukończone';

  @override
  String get searchFilterOverdue => 'Po terminie';

  @override
  String get searchFilterThisWeek => 'W tym tygodniu';

  @override
  String get searchFilterCritical => 'Krytyczne';

  @override
  String get searchFilterCreatedByYou => 'Utworzone przez Ciebie';

  @override
  String get searchFilterArchived => 'Zarchiwizowane';

  @override
  String get searchFilterClear => 'Wyczyść filtry';

  @override
  String get searchIncompleteActions =>
      'Nie udało się przeszukać Twoich zadań, więc te wyniki mogą być niepełne.';

  @override
  String get searchIncompleteCaptures =>
      'Nie udało się przeszukać Twoich przechwyceń, więc te wyniki mogą być niepełne.';

  @override
  String get searchIncompleteBoth =>
      'Nie udało się przeszukać ani Twoich zadań, ani przechwyceń, więc te wyniki mogą być niepełne.';

  @override
  String get searchMatchTitle => 'Tytuł';

  @override
  String get searchMatchNextStep => 'Następny krok';

  @override
  String get searchMatchStep => 'Krok';

  @override
  String get searchMatchSummary => 'Podsumowanie';

  @override
  String get searchMatchFromCapture => 'Z przechwycenia';

  @override
  String get studioSuggested => 'Sugerowane do ostatniego przechwycenia';

  @override
  String get studioRecentlyUsed => 'Ostatnio używane';

  @override
  String get studioReady => 'GOTOWE';

  @override
  String get studioNotConnected => 'NIEPODŁĄCZONE';

  @override
  String get studioHeroTitle => 'Inteligencja Action';

  @override
  String get studioConnectedBlurb =>
      'Zrozum dokument, dopracuj cel, ułóż plan, napisz szkic odpowiedzi albo sprawdź to, co masz przed sobą.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count narzędzi do rozumienia dokumentów, planowania i pisania. Podłącz własne konto AI, żeby z nich korzystać — rozlicza Cię Twój dostawca, nigdy Action.';
  }

  @override
  String get studioConnectAi => 'Podłącz AI';

  @override
  String get studioHowItWorks => 'Jak to działa';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count z nich już działa bez tego wszystkiego, w całości na tym urządzeniu.',
      many:
          '$count z nich już działa bez tego wszystkiego, w całości na tym urządzeniu.',
      few:
          '$count z nich już działają bez tego wszystkiego, w całości na tym urządzeniu.',
      one: '1 z nich już działa bez tego wszystkiego, w całości na tym urządzeniu.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Działa na tym urządzeniu';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Działa na tym urządzeniu.';
  }

  @override
  String get categoryUnderstand => 'Zrozum';

  @override
  String get categoryUnderstandBlurb => 'Nadaj sens temu, co masz.';

  @override
  String get categoryPlan => 'Zaplanuj';

  @override
  String get categoryPlanBlurb => 'Zamień to w coś, co da się zrobić.';

  @override
  String get categoryCreate => 'Napisz';

  @override
  String get categoryCreateBlurb => 'Napisz, popraw, przetłumacz.';

  @override
  String get categoryExtract => 'Wyciągnij';

  @override
  String get categoryExtractBlurb => 'Wydobądź szczegóły, które się liczą.';

  @override
  String get categoryVerify => 'Sprawdź';

  @override
  String get categoryVerifyBlurb => 'Sprawdź to, co masz przed sobą.';

  @override
  String get captureSheetTitle => 'Przechwyć coś';

  @override
  String get captureSheetSubtitle =>
      'Oddaj Action wszystko, czego wolisz nie czytać w całości.';

  @override
  String get captureTakePhoto => 'Zrób zdjęcie';

  @override
  String get captureTakePhotoSubtitle =>
      'List, rachunek albo pismo, które masz przed sobą';

  @override
  String get captureChooseImage => 'Wybierz obraz';

  @override
  String get captureChooseImageSubtitle =>
      'Zrzut ekranu albo zdjęcie, które już jest na tym urządzeniu';

  @override
  String get capturePasteText => 'Wklej tekst';

  @override
  String get capturePasteTextSubtitle => 'E-mail, wiadomość albo pismo';

  @override
  String get captureChoosePdf => 'Wybierz PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'Wyciąg, list albo formularz, który już masz';

  @override
  String get captureFootnote =>
      'Przechwycenia zostają na tym urządzeniu. Nic nie jest analizowane online, dopóki o to nie poprosisz.';

  @override
  String get captureCouldNotOpen =>
      'Nie udało się tego otworzyć. Spróbuj inaczej.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Odczytywanie';

  @override
  String get stageNeedsReview => 'Do sprawdzenia';

  @override
  String get stageActionCreated => 'Zadanie utworzone';

  @override
  String get stageNoText => 'Nie znaleziono tekstu';

  @override
  String get stageCouldNotBeRead => 'Nie udało się odczytać';

  @override
  String get stageReadingPreview => 'Odczytywanie tekstu…';

  @override
  String get stageFailedPreview =>
      'Tego nie udało się odczytać na tym urządzeniu.';

  @override
  String get provenancePhoto => 'Przechwycone ze zdjęcia';

  @override
  String get provenanceImage => 'Przechwycone z obrazu';

  @override
  String get provenancePastedText => 'Przechwycone z wklejonego tekstu';

  @override
  String get provenanceDocument => 'Dodane jako dokument';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Zrobione $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Po terminie · termin był $date';
  }

  @override
  String get metaDueToday => 'Termin dzisiaj';

  @override
  String metaDueOn(String date) {
    return 'Termin $date';
  }

  @override
  String get metaCreatedByYou => 'Utworzone przez Ciebie';

  @override
  String get categoryPayment => 'Płatność';

  @override
  String get categoryRenewal => 'Odnowienie';

  @override
  String get categoryAppointment => 'Wizyta';

  @override
  String get categoryBooking => 'Rezerwacja';

  @override
  String get categoryTravel => 'Podróż';

  @override
  String get categoryDeadline => 'Termin';

  @override
  String get categoryResponse => 'Wymaga odpowiedzi';

  @override
  String get categoryDelivery => 'Dostawa';

  @override
  String get categoryDocument => 'Dokument';

  @override
  String get categoryNoActionRequired => 'Nic do zrobienia';

  @override
  String get categoryUnsure => 'Nie wiadomo';

  @override
  String get errorEnterManually => 'Wpisz ręcznie';
}
