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
  String get ocrScriptTitle => 'Rozpoznawanie tekstu';

  @override
  String get ocrScriptSubtitle =>
      'System pisma, który Action odczytuje na zdjęciu. Rozpoznawanie odbywa się na tym urządzeniu; żadne przechwycenie nie jest nigdzie wysyłane do odczytu.';

  @override
  String get ocrScriptSectionChoose => 'System pisma';

  @override
  String get ocrScriptFollowLanguage => 'Zgodnie z językiem aplikacji';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Obecnie $script';
  }

  @override
  String get ocrScriptLatin => 'Łacińskie';

  @override
  String get ocrScriptChinese => 'Chińskie';

  @override
  String get ocrScriptDevanagari => 'Dewanagari';

  @override
  String get ocrScriptJapanese => 'Japońskie';

  @override
  String get ocrScriptKorean => 'Koreańskie';

  @override
  String get ocrScriptLatinDescription =>
      'Angielski, hiszpański, francuski, niemiecki i pozostałe języki zapisywane literami łacińskimi.';

  @override
  String get ocrScriptChineseDescription => 'Chiński uproszczony i tradycyjny.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Hindi, marathi i nepalski. Nie bengalski, tamilski ani telugu — każdy z nich to inny system pisma.';

  @override
  String get ocrScriptJapaneseDescription => 'Japoński.';

  @override
  String get ocrScriptKoreanDescription => 'Koreański.';

  @override
  String get ocrScriptFootnote =>
      'Każdy wybór poza łacińskim odczytuje także litery łacińskie, więc wybranie go dodaje system pisma, a nie zamienia go. Zmiana dotyczy zdjęć robionych od teraz, nie tych już odczytanych.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action nie odczyta pisma $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Nie ma dla niego rozpoznawania na urządzeniu. Zdjęcia nadal będą odczytywane w zakresie tego, co zapisano literami łacińskimi, a reszta wróci pusta. Ten tekst możesz zamiast tego wpisać lub wkleić.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action jest ustawiona na odczyt: $script. Jeśli to zdjęcie jest w innym systemie pisma, zmień to w Ustawieniach i odczytaj je ponownie.';
  }

  @override
  String get settingsTextRecognition => 'Rozpoznawanie tekstu';

  @override
  String get settingsTextRecognitionDescription =>
      'System pisma, który Action odczytuje ze zdjęć.';

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

  @override
  String get sourceWhatWeRead => 'Co odczytaliśmy';

  @override
  String get sourceDelete => 'Usuń przechwycenie';

  @override
  String get sourceGone => 'To przechwycenie nie jest już dostępne.';

  @override
  String get sourceDeleteTitle => 'Usunąć to przechwycenie?';

  @override
  String get sourceDeleteBody =>
      'Obraz i odczytany z niego tekst zostaną usunięte z tego urządzenia.';

  @override
  String get sourceDeleteKeep => 'Zachowaj';

  @override
  String get sourceOpenAction => 'Otwórz zadanie';

  @override
  String sourceOpenActions(int count) {
    return 'Otwórz zadania: $count';
  }

  @override
  String get sourceCreateAnother => 'Utwórz z tego kolejne';

  @override
  String get sourceCreateAction => 'Utwórz z tego zadanie';

  @override
  String get sourceDoMore => 'Zrób z tym więcej';

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
    return 'z $format $size KB';
  }

  @override
  String get sourceTextFound => 'Znaleziono tekst';

  @override
  String sourceOcrStats(int lines, int ms) {
    return 'wiersze: $lines · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'To jest tekst, który Action odczytała. Co z niego powstało, widać poniżej.';

  @override
  String get sourceNotInterpreted =>
      'Nic jeszcze nie zostało zinterpretowane. Action zaproponuje, co z tym zrobić, a Ty potwierdzasz, zanim cokolwiek powstanie.';

  @override
  String get sourceNoTextExplainer =>
      'Zdarza się to przy piśmie odręcznym, bardzo słabym świetle albo piśmie, którego to urządzenie jeszcze nie odczyta.';

  @override
  String get sourceReadFailed => 'Nie udało się tego odczytać';

  @override
  String get sourceReadFailedReason =>
      'Rozpoznawanie tekstu nie zostało ukończone.';

  @override
  String get sourceTryReadingAgain => 'Spróbuj odczytać ponownie';

  @override
  String get sourceTypeInstead => 'Wpisz dane zamiast tego';

  @override
  String get sourceTypeWhatItSays => 'Wpisz, co tam jest napisane';

  @override
  String get sourceTypeHint => 'Daty, kwoty i to, o co się prosi.';

  @override
  String get sourceMadeFromThis => 'Powstało z tego przechwycenia';

  @override
  String sourceMadeFromThisCount(int count) {
    return 'Powstało z tego przechwycenia: $count';
  }

  @override
  String get sourceTheDocument => 'Dokument';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '1 strona',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Nieznana liczba stron';

  @override
  String get sourceDocumentNotRead =>
      'Action nie odczytała tego, co jest w środku tego dokumentu. Gdy uruchomisz narzędzie, które tego wymaga, plik trafi do podłączonego przez Ciebie dostawcy AI, a Ty zostaniesz o tym uprzedzony.';

  @override
  String get previewSaveFailed =>
      'Nie udało się tego zapisać. Spróbuj ponownie.';

  @override
  String get previewTitle => 'Sprawdź przechwycenie';

  @override
  String get previewImageFailed => 'Nie udało się otworzyć tego obrazu.';

  @override
  String get previewHint =>
      'Upewnij się, że tekst jest czytelny i nic ważnego nie zostało ucięte.';

  @override
  String get previewRetake => 'Zrób ponownie';

  @override
  String get pasteTitle => 'Wklej tekst';

  @override
  String get pasteHint =>
      'Wklej e-mail, wiadomość lub pismo, którego wolisz nie czytać w całości.';

  @override
  String get pasteFootnote =>
      'Dobrze sprawdza się wszystko, co zawiera datę, kwotę albo prośbę.';

  @override
  String get pasteEnough => 'Wygląda na to, że wystarczy do pracy.';

  @override
  String get pasteMore => 'Trochę więcej tekstu da lepszy wynik.';

  @override
  String get reviewLoadFailed => 'Nie udało się wczytać tego przechwycenia.';

  @override
  String get reviewConfirmed => 'Potwierdzone';

  @override
  String get reviewNeedsReview => 'Wymaga sprawdzenia';

  @override
  String get reviewReview => 'Sprawdź';

  @override
  String get reviewHighConfidence => 'Wysoka pewność';

  @override
  String get reviewConfirmedByYou => 'Potwierdzone przez Ciebie';

  @override
  String get reviewMissing => 'Brakuje';

  @override
  String get reviewNotUnderstood =>
      'Action nie zdołała wiarygodnie zrozumieć wystarczająco dużo z tego źródła.';

  @override
  String get reviewNotUnderstoodBody =>
      'Przechwycenie jest nienaruszone i nic nie przepadło. Możesz wpisać dane samodzielnie, a źródło pozostaje dołączone dla odniesienia.';

  @override
  String get reviewEnterDetails => 'Wpisz dane';

  @override
  String get reviewKeepSource => 'Zachowaj źródło na później';

  @override
  String reviewEngine(String engine) {
    return 'Silnik: $engine';
  }

  @override
  String get reviewManualNotice =>
      'To zadanie tworzysz sam. Użyte zostanie wyłącznie to, co tu wpiszesz.';

  @override
  String get reviewUntitled => 'Zadanie bez tytułu';

  @override
  String get reviewEditTitle => 'Edytuj tytuł';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wartości wymaga Twojego sprawdzenia.',
      many: '$count wartości wymaga Twojego sprawdzenia.',
      few: '$count wartości wymagają Twojego sprawdzenia.',
      one: '1 wartość wymaga Twojego sprawdzenia, zanim będzie można to potwierdzić.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Najważniejsze dane';

  @override
  String get reviewNotFound => 'Nie znaleziono';

  @override
  String get reviewSuggestedNextStep => 'Proponowany następny krok';

  @override
  String get reviewWhyThisMatters => 'Dlaczego to ważne';

  @override
  String get reviewSteps => 'Kroki';

  @override
  String get reviewAddStep => 'Dodaj krok';

  @override
  String get reviewInjectionNotice =>
      'Część tekstu w tym źródle wyglądała na polecenia, a nie na dane z dokumentu, więc Action to pominęła.';

  @override
  String get reviewLayoutNotice =>
      'Układ tego dokumentu może zawierać zależności, których wydobycie tekstu nie zdołało w pełni zachować. Porównaj poniższe wartości ze źródłem, zanim potwierdzisz.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Porównaj poniższe wartości ze źródłem.';
  }

  @override
  String get reviewDeadline => 'Termin';

  @override
  String get reviewAmount => 'Kwota';

  @override
  String get reviewLeftUnset => 'Brak — sam zdecydowałeś tego nie ustawiać';

  @override
  String get reviewUnclear => 'Niejasne';

  @override
  String get reviewNotSet => 'Nieustawione';

  @override
  String get reviewNoDeadlineFound => 'Nie znaleziono go w tym dokumencie';

  @override
  String get reviewNoAmountFound => 'Nie znaleziono jej w tym dokumencie';

  @override
  String get reviewMultipleDates => 'Action znalazła kilka możliwych dat.';

  @override
  String reviewMultipleDatesBody(int count) {
    return 'Terminem mogą być te daty: $count. Wybierz właściwą, wpisz inną albo zostaw nieustawioną.';
  }

  @override
  String get reviewChooseDate => 'Wybierz datę';

  @override
  String get reviewMultipleAmounts =>
      'Action znalazła więcej niż jedną możliwą kwotę.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return 'Kwot, o które może tu chodzić, jest $count. Wybierz jedną, wpisz inną albo zostaw nieustawioną.';
  }

  @override
  String get reviewChooseAmount => 'Wybierz kwotę';

  @override
  String get reviewSkipStep => 'Pomiń ten krok';

  @override
  String get reviewKeepStep => 'Zachowaj ten krok';

  @override
  String get reviewEditStep => 'Edytuj krok';

  @override
  String get reviewCreateManually => 'Utwórz ręcznie';

  @override
  String get reviewConfirmAndCreate => 'Potwierdź i utwórz zadanie';

  @override
  String get reviewFixHighlighted => 'Sprawdź zaznaczone pola';

  @override
  String get reviewSaving => 'Zapisywanie…';

  @override
  String get reviewSaveFailed =>
      'Nie udało się zapisać tego zadania. Nic nie przepadło — spróbuj ponownie.';

  @override
  String get reviewFieldTitle => 'Tytuł';

  @override
  String get reviewTitleHint => 'Co ma się wydarzyć?';

  @override
  String get reviewNewStep => 'Nowy krok';

  @override
  String get reviewStepHint => 'Co zrobić';

  @override
  String get reviewDatesConflict => 'Dokument wymienia więcej niż jedną datę.';

  @override
  String get reviewAmountsConflict =>
      'Dokument wymienia więcej niż jedną kwotę.';

  @override
  String get reviewAnotherDate => 'Inna data — 2026-08-30';

  @override
  String get reviewBadDate =>
      'To nie jest prawdziwa data. Użyj formatu 2026-08-30.';

  @override
  String get reviewTypeDate =>
      'Wpisz datę albo zostaw ją nieustawioną poniżej.';

  @override
  String get reviewUseThisDate => 'Użyj tej daty';

  @override
  String get reviewLeaveNoDeadline => 'Dalej bez terminu';

  @override
  String get reviewAnotherAmount => 'Inna kwota — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Nie można użyć tej kwoty: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Użyj tej kwoty';

  @override
  String get reviewLeaveNoAmount => 'Dalej bez kwoty';

  @override
  String get reviewThisValue => 'Ta wartość';

  @override
  String reviewQuote(String quote) {
    return '„$quote”';
  }

  @override
  String get reviewSeeOnCapture => 'Pokaż na przechwyceniu';

  @override
  String get reviewViewSource => 'Zobacz źródło';

  @override
  String get reviewFromSource => 'Ze źródła';

  @override
  String get reviewNotVerified => 'Niesprawdzone';

  @override
  String get reviewCouldNotVerify => 'Nie udało się tego sprawdzić ze źródłem.';

  @override
  String get reviewLooksRight => 'Wygląda poprawnie';

  @override
  String get reviewStageReading => 'Odczytywanie źródła';

  @override
  String get reviewStageUnderstanding => 'Rozumienie ważnych szczegółów';

  @override
  String get reviewStageChecking => 'Sprawdzanie, co wymaga przejrzenia';

  @override
  String get reviewNothingToDo => 'W tej chwili nie musisz nic robić.';

  @override
  String get reviewInformationOnly =>
      'To wygląda wyłącznie na informację — nie znaleziono terminu, płatności ani prośby o odpowiedź.';

  @override
  String get reviewInformationOnlyWithSource =>
      'To wygląda wyłącznie na informację — w tym przechwyceniu nie znaleziono terminu, płatności ani prośby o odpowiedź.';

  @override
  String get reviewSourceKept => 'Źródło zostaje zachowane tak czy inaczej.';

  @override
  String get reviewAddAnyway => 'Mimo to dodaj zadanie';

  @override
  String get reviewActionConfirmed => 'Zadanie potwierdzone';

  @override
  String get reviewCreatedByYou => 'Utworzone przez Ciebie.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Potwierdzone przez Ciebie na podstawie $count sprawdzonych informacji.',
      many:
          'Potwierdzone przez Ciebie na podstawie $count sprawdzonych informacji.',
      few:
          'Potwierdzone przez Ciebie na podstawie $count sprawdzonych informacji.',
      one: 'Potwierdzone przez Ciebie na podstawie 1 sprawdzonej informacji.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Potwierdzone przez Ciebie na podstawie $count sprawdzonych informacji. Zmieniłeś $edited z nich.',
      many:
          'Potwierdzone przez Ciebie na podstawie $count sprawdzonych informacji. Zmieniłeś $edited z nich.',
      few:
          'Potwierdzone przez Ciebie na podstawie $count sprawdzonych informacji. Zmieniłeś $edited z nich.',
      one:
          'Potwierdzone przez Ciebie na podstawie 1 sprawdzonej informacji. Zmieniłeś $edited z nich.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Zapisane na tym urządzeniu.';

  @override
  String get detailLoadFailed =>
      'Nie udało się wczytać tego zadania. Nadal jest zapisane na tym urządzeniu.';

  @override
  String get detailNotFoundTitle => 'Tego zadania już tu nie ma';

  @override
  String get detailNotFoundMessage =>
      'Mogło zostać usunięte na tym urządzeniu.';

  @override
  String get detailGoBack => 'Wróć';

  @override
  String get detailMore => 'Więcej';

  @override
  String get detailChangeUrgency => 'Zmień pilność';

  @override
  String get detailAddRecommendedStep => 'Dodaj proponowany krok';

  @override
  String get detailEditRecommendedStep => 'Edytuj proponowany krok';

  @override
  String get detailArchiveTitle => 'Zarchiwizować to zadanie?';

  @override
  String get detailArchiveBody =>
      'Znika z Twojej listy, ale nie zostaje usunięte, a przechwycenie, z którego powstało, zostaje zachowane.';

  @override
  String get detailArchiveConfirm => 'Archiwizuj';

  @override
  String get detailArchived => 'Zarchiwizowane';

  @override
  String detailCompletedOn(String date) {
    return 'Ukończono $date';
  }

  @override
  String get detailSectionDetails => 'Szczegóły';

  @override
  String get detailSectionReminders => 'Przypomnienia';

  @override
  String get detailAllStepsDone => 'Wszystkie kroki zrobione';

  @override
  String get detailNextEyebrow => 'Dalej';

  @override
  String get detailCompleteQuestion => 'Ukończyć to zadanie?';

  @override
  String get detailMarkStepDone => 'Oznacz krok jako zrobiony';

  @override
  String get detailCompleteAction => 'Ukończ to zadanie';

  @override
  String get detailAddDeadline => 'Dodaj termin';

  @override
  String get detailAddAmount => 'Dodaj kwotę';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed z $total zrobione';
  }

  @override
  String get detailNoStepsTitle => 'Jeszcze bez kroków';

  @override
  String get detailNoStepsMessage =>
      'Rozłóż to na ruchy, które naprawdę musisz wykonać.';

  @override
  String get detailAddFirstStep => 'Dodaj pierwszy krok';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Krok ukończony: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Następny krok: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Krok: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Oznacz „$title” jako zrobiony';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Oznacz „$title” jako niezrobiony';
  }

  @override
  String get detailStepOptions => 'Opcje kroku';

  @override
  String get detailMoveUp => 'W górę';

  @override
  String get detailMoveDown => 'W dół';

  @override
  String get detailDeleteStep => 'Usuń krok';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Usunąć ten krok?';

  @override
  String get stepDeleteKeep => 'Zostaw';

  @override
  String get detailNoRemindersYet => 'Jeszcze bez przypomnień.';

  @override
  String get detailReminderLimit =>
      'Tyle przypomnień może mieć jedno zadanie. Usuń jedno, aby dodać kolejne.';

  @override
  String get detailAddReminder => 'Dodaj przypomnienie';

  @override
  String get detailChangeReminder => 'Zmień przypomnienie';

  @override
  String get detailRemoveReminder => 'Usuń przypomnienie';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Jeszcze nieustawione';

  @override
  String get reminderStateNotificationsOff =>
      'Zapisane, ale powiadomienia są wyłączone';

  @override
  String get reminderStateFailed => 'Nie udało się zaplanować';

  @override
  String get reminderStateRemoving => 'Usuwanie…';

  @override
  String get reminderSetConfirmation =>
      'Przypomnienie ustawione. Szturchniemy Cię.';

  @override
  String get reminderUpdatedConfirmation => 'Przypomnienie zaktualizowane.';

  @override
  String get reminderNeedsPermission =>
      'Powiadomienia są wyłączone, więc to przypomnienie jest zapisane, ale nie może Cię jeszcze powiadomić.';

  @override
  String get reminderScheduleFailed =>
      'To przypomnienie jest zapisane, ale Android nie chciał go zaplanować.';

  @override
  String get reminderLimitReached =>
      'To zadanie ma już maksymalną liczbę przypomnień.';

  @override
  String get reminderTimeInPast => 'Ta godzina już minęła.';

  @override
  String get reminderAddTitle => 'Dodaj przypomnienie';

  @override
  String get reminderChangeTitle => 'Zmień to przypomnienie';

  @override
  String get reminderDateLabel => 'Data';

  @override
  String get reminderTimeLabel => 'Godzina';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'EEEE d MMMM';

  @override
  String get reminderPresetFormat => 'd MMM, HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'Przypomnimy Ci $date o $time.';
  }

  @override
  String get reminderTimePastError =>
      'Ta godzina już minęła. Wybierz późniejszą.';

  @override
  String get reminderSet => 'Ustaw przypomnienie';

  @override
  String get reminderPresetInHour => 'Za 1 godzinę';

  @override
  String get reminderPresetTomorrowMorning => 'Jutro rano';

  @override
  String get reminderPresetNextWeek => 'W przyszłym tygodniu';

  @override
  String get reminderPresetOnTheDay => 'W tym samym dniu';

  @override
  String get reminderPresetDayBefore => '1 dzień wcześniej';

  @override
  String get reminderPresetWeekBefore => '1 tydzień wcześniej';

  @override
  String get reminderPresetAtDeadline => 'W terminie';

  @override
  String get reminderPresetHourBefore => '1 godzinę wcześniej';

  @override
  String get editNextStepTitle => 'Proponowany następny krok';

  @override
  String get editNextStepSubtitle =>
      'Jedno krótkie zdanie o następnym sensownym ruchu.';

  @override
  String get editNextStepHint => 'Jaki jest następny sensowny ruch?';

  @override
  String get editRemoveSuggestion => 'Usuń propozycję';

  @override
  String get editUrgencyTitle => 'Jak bardzo to pilne?';

  @override
  String get editStepHint => 'Jedna konkretna rzecz do zrobienia';

  @override
  String get editAddStep => 'Dodaj krok';

  @override
  String get editDateHint => 'RRRR-MM-DD';

  @override
  String get editRemoveDeadline => 'Usuń termin';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Zapisz kwotę';

  @override
  String get editRemoveAmount => 'Usuń kwotę';

  @override
  String get securityTitle => 'Bezpieczeństwo i prywatność';

  @override
  String get securitySectionProtection => 'Ochrona';

  @override
  String get securityAppLockUnavailable =>
      'Blokada aplikacji wymaga blokady ekranu na tym urządzeniu. Najpierw ustaw PIN, wzór, hasło lub odcisk palca w ustawieniach urządzenia.';

  @override
  String get securityAppLockOn =>
      'Action prosi Twoje urządzenie o potwierdzenie, że to Ty.';

  @override
  String get securityAppLockOff =>
      'Wymagaj odcisku palca, twarzy lub PIN-u urządzenia, aby otworzyć Action.';

  @override
  String get securityAskAgain => 'Pytaj ponownie';

  @override
  String get securityAskAgainDescription =>
      'Jak długo Action może być w tle, zanim się zablokuje.';

  @override
  String get securityScreenPrivacy => 'Prywatność ekranu';

  @override
  String get securityScreenPrivacyDescription =>
      'Poproś Androida, aby blokował zrzuty i nagrywanie ekranu oraz ukrywał Action w przełączniku aplikacji.';

  @override
  String get securityPrivateReminders => 'Prywatne przypomnienia';

  @override
  String get securityPrivateRemindersOn =>
      'Przypomnienia mówią tylko, że coś na Ciebie czeka.';

  @override
  String get securityPrivateRemindersOff =>
      'Przypomnienia pokazują tytuł zadania. Włącz to, aby nie trafiał na ekran blokady.';

  @override
  String get securityLockNow => 'Zablokuj teraz';

  @override
  String get securityLockNowDescription => 'Zamknąć drzwi bez czekania.';

  @override
  String get securitySectionStorage => 'Jak przechowywane są Twoje dane';

  @override
  String get securityStorageDataLabel =>
      'Twoje zadania, przechwycenia i ustawienia';

  @override
  String get securityStorageDataDetail =>
      'Leżą we własnej prywatnej pamięci tej aplikacji, której inne aplikacje nie mogą odczytać i którą Android szyfruje w ramach szyfrowania urządzenia. Action nie dokłada na wierzch własnej drugiej warstwy.';

  @override
  String get securityStorageKeyLabel => 'Twój klucz dostawcy AI';

  @override
  String get securityStorageKeyDetail =>
      'Trzymany w Android Keystore, a nie razem z resztą, i nigdy więcej niepokazywany po zapisaniu.';

  @override
  String get securityStorageGapLabel => 'Czego to nie obejmuje';

  @override
  String get securityStorageGapDetail =>
      'Nic z tego nie chroni przed kimś, kto korzysta z Twojego odblokowanego urządzenia, a zmodyfikowany lub zrootowany system może odczytać więcej niż zwykły. Blokada aplikacji to ustawienie, które pomaga w tym pierwszym przypadku.';

  @override
  String get securitySectionInformation => 'Twoje informacje';

  @override
  String get securityWhereInfoDescription =>
      'Każda droga, jaką mogą pójść Twoje dane, i te dwie, które opuszczają to urządzenie.';

  @override
  String get securityAppLockRefused =>
      'Nie potwierdzono, więc nic się nie zmieniło.';

  @override
  String get securityAppLockUnavailableToast =>
      'To urządzenie nie ma ustawionej blokady ekranu. Dodaj PIN, wzór, hasło lub odcisk palca w ustawieniach urządzenia i spróbuj ponownie.';

  @override
  String get securityScreenPrivacyRefused =>
      'To urządzenie nie zastosowało prywatności ekranu, więc pozostała wyłączona, zamiast być pokazana jako włączona.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zaplanowanych przypomnień mówi teraz mniej.',
      many: '$count zaplanowanych przypomnień mówi teraz mniej.',
      few: '$count zaplanowane przypomnienia mówią teraz mniej.',
      one: '1 zaplanowane przypomnienie mówi teraz mniej.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zaktualizowano $count zaplanowanych przypomnień.',
      many: 'Zaktualizowano $count zaplanowanych przypomnień.',
      few: 'Zaktualizowano $count zaplanowane przypomnienia.',
      one: 'Zaktualizowano 1 zaplanowane przypomnienie.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Natychmiast';

  @override
  String get appLockDelayOneMinute => 'Po 1 minucie';

  @override
  String get appLockDelayFiveMinutes => 'Po 5 minutach';

  @override
  String get securityDelayImmediatelyDescription =>
      'Za każdym razem, gdy Action znika z ekranu';

  @override
  String get securityDelayOneMinuteDescription =>
      'Wystarczy, by odpisać na wiadomość';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Wystarczy, by odebrać telefon';

  @override
  String get securityHeroProtected => 'Chronione';

  @override
  String get securityHeroNothingOn => 'Nic nie włączone';

  @override
  String get securityHeroFootnote =>
      'Wszystko tutaj działa na tym urządzeniu. Żadne z tych ustawień nie jest nigdzie wysyłane i żadnego nie da się zmienić zdalnie.';

  @override
  String get securityHeadlineNone => 'Dostępne są trzy zabezpieczenia';

  @override
  String securityHeadlineOne(String first) {
    return '$first jest włączona';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first i $second są włączone';
  }

  @override
  String get securityHeadlineAll => 'Wszystkie trzy zabezpieczenia są włączone';

  @override
  String get securityTransfersTitle => 'Co opuściło to urządzenie';

  @override
  String get securityTransfersNoProvider =>
      'Nie jest podłączony żaden dostawca AI, więc nic nie jest w ogóle wysyłane do analizy.';

  @override
  String get securityTransfersDescription =>
      'Zapisywane tutaj w chwili, gdy coś jest wysyłane, niezależnie od tego, czy wróciła odpowiedź. Tylko narzędzie, dostawca i rozmiar — nigdy zawartość. Przechowywane 90 dni na tym urządzeniu i nigdzie niewysyłane.';

  @override
  String get securityClear => 'Wyczyść';

  @override
  String get securityNothingSent => 'Nic nie zostało wysłane';

  @override
  String get securityNothingSentDescription =>
      'Gdy uruchomisz narzędzie korzystające z Twojego dostawcy AI, pojawi się tutaj.';

  @override
  String get securityClearHistoryTitle => 'Wyczyścić tę historię?';

  @override
  String get securityClearHistoryBody =>
      'Zapis tego, co zostało wysłane, zostanie usunięty z tego urządzenia. Nie cofa niczego, co już wysłano.';

  @override
  String get securityUnnamedTool => 'Narzędzie Intelligence';

  @override
  String get securityYourProvider => 'Twojego dostawcy AI';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '1 strona',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pliku',
      many: '$count plików',
      few: '$count pliki',
      one: '1 plik',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'krótki tekst';

  @override
  String securityTransferCharacters(int count) {
    return '$count tys. znaków';
  }

  @override
  String securitySentTo(String provider) {
    return 'Wysłano do $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Wysłano do $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return '$count tyg. temu';
  }

  @override
  String get helpTitle => 'Pomoc';

  @override
  String get helpAddQuestion => 'Co mogę dodać?';

  @override
  String get helpAddAnswer =>
      'Zrzut ekranu, zdjęcie pisma lub rachunku albo tekst, który wkleisz. Najlepiej sprawdza się wszystko, co zawiera datę, kwotę lub prośbę.';

  @override
  String get helpReviewQuestion => 'Dlaczego Action prosi mnie o sprawdzenie?';

  @override
  String get helpReviewAnswer =>
      'Ponieważ maszyna czytająca dokument może go źle odczytać, a termin po cichu błędny jest gorszy niż brak terminu. Action pokazuje, co znalazła i z jakich słów to wzięła, i nic nie zostaje zapisane, dopóki tego nie potwierdzisz.';

  @override
  String get helpVaryQuestion =>
      'Dlaczego wyniki się zmieniają, gdy spróbuję ponownie?';

  @override
  String get helpVaryAnswer =>
      'Usługa, która czyta Twój dokument, nie jest deterministyczna, więc to samo przechwycenie może wrócić nieco inne. Także dlatego istnieje krok sprawdzania — to Ty jesteś częścią, która się nie zmienia.';

  @override
  String get helpLateQuestion => 'Dlaczego moje przypomnienie się spóźniło?';

  @override
  String get helpLateAnswer =>
      'Przypomnienia są planowane przez Androida i to Android decyduje, kiedy dokładnie je dostarczy. Oszczędzanie baterii, Doze i ustawienia energii producenta mogą je opóźnić. Action nigdy nie obiecuje przypomnienia co do minuty.';

  @override
  String get helpDataQuestion => 'Gdzie są moje dane?';

  @override
  String get helpDataAnswer =>
      'Prawie wszystkie są na tym urządzeniu: Twoje przechwycenia, zadania, kroki, przypomnienia i wyszukiwania. Dwa wyjątki — treść, którą prosisz Action o przeczytanie, trafia do usługi AI, która ją czyta, a krótki zapis potwierdzonego zadania może zostać zapisany w chmurze pod anonimowym identyfikatorem. Prywatność i dane w Ustawieniach wymieniają dokładnie, co ten zapis zawiera.';

  @override
  String get helpBackupQuestion => 'Czy to kopia zapasowa?';

  @override
  String get helpBackupAnswer =>
      'Nie. Zapisu w chmurze nie da się przywrócić na nowe urządzenie i nie ma konta, na które można się zalogować. Jeśli odinstalujesz Action albo zgubisz to urządzenie, dane z niego przepadają.';

  @override
  String get helpCorrectQuestion => 'Jak poprawić zadanie?';

  @override
  String get helpCorrectAnswer =>
      'Otwórz je i zmień dowolne pole — tytuł, termin, kwotę albo proponowany następny krok. Kroki możesz w każdej chwili dodawać, zmieniać ich kolejność, kończyć i usuwać. Edytowanie zadania nigdy o nic nie pyta usługi AI.';

  @override
  String get privacyTitle => 'Prywatność i dane';

  @override
  String get privacyIntro =>
      'Action trzyma na tym urządzeniu tyle, ile się da. Dwie rzeczy są wyjątkami i obie wymieniono poniżej.';

  @override
  String get privacyGroupOnDevice => 'Na tym urządzeniu';

  @override
  String get privacyOnDeviceCaptures =>
      'Przechwycenia — zrzuty ekranu, zdjęcia i teksty, które dodajesz, oraz odczytany z nich tekst.';

  @override
  String get privacyOnDeviceActions =>
      'Zadania wraz z krokami, danymi i przypomnieniami.';

  @override
  String get privacyOnDeviceSearch =>
      'Wyszukiwanie. Twoje wyszukiwania działają tutaj, nigdy nie są nigdzie wysyłane i nie są przechowywane po zamknięciu ekranu.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Zdjęcia są zapisywane bez ich lokalizacji. Współrzędne, godzina i dane aparatu, które telefon wpisuje w obraz, są usuwane przed zapisaniem przechwycenia, więc nie zostają tutaj i nie trafiają do Twojego dostawcy AI razem z przechwyceniem.';

  @override
  String get privacyGroupSentToRead => 'Wysłane do odczytania';

  @override
  String get privacySentToReadWhat =>
      'Gdy prosisz Action o zinterpretowanie przechwycenia, ta treść jest wysyłana do usługi AI, która ją czyta. To nie jest AI na urządzeniu.';

  @override
  String get privacySentToReadWhen =>
      'Wysyłane jest tylko to przechwycenie, które wybrałeś, i tylko wtedy, gdy o to poprosisz.';

  @override
  String get privacyGroupYourProvider =>
      'Wysyłane do Twojego własnego dostawcy AI';

  @override
  String get privacyProviderWhat =>
      'Jeśli podłączysz dostawcę AI w Ustawieniach, narzędzia Intelligence wysyłają wybraną przez Ciebie treść do tego dostawcy — OpenAI, Anthropic, Google albo wskazanego przez Ciebie endpointu — przy użyciu Twojego własnego klucza API.';

  @override
  String get privacyProviderDirect =>
      'Trafia to prosto do nich. Nie przechodzi przez żaden serwer należący do Action.';

  @override
  String get privacyProviderScope =>
      'Wysyłane jest tylko to, co wybierzesz dla narzędzia, i tylko wtedy, gdy je uruchomisz. Twoje pozostałe zadania, przechwycenia i źródła nigdy nie są dołączane, a w tle nigdy nic nie jest wysyłane.';

  @override
  String get privacyProviderKey =>
      'Twój klucz API jest trzymany w bezpiecznej pamięci tego urządzenia i wysyłany wyłącznie do dostawcy, do którego należy. Bezpieczna pamięć to realna przeszkoda dla kogoś, kto ma Twoje odblokowane urządzenie, ale nie jest absolutna, a Action nie będzie twierdzić inaczej.';

  @override
  String get privacyProviderLocalTools =>
      'Dwa narzędzia nigdy niczego nie wysyłają: ukrywanie wrażliwych danych i sprawdzanie, skąd pochodzi plik. Oba działają w całości na tym urządzeniu.';

  @override
  String get privacyProviderAgreement =>
      'To, co Twój dostawca robi z tym, co wysyłasz, reguluje Twoja umowa z nim, a nie Action.';

  @override
  String get privacyGroupCloud => 'Przechowywane w chmurze';

  @override
  String get privacyCloudWhat =>
      'Gdy potwierdzasz zadanie, jego krótki zapis może zostać zachowany pod anonimowym identyfikatorem tej instalacji: tytuł, status, pilność, kategoria, termin, kwota, proponowany następny krok i znaczniki czasu.';

  @override
  String get privacyCloudNotSent =>
      'Twoje przechwycenia, odczytany z nich tekst, kroki i dane zadania oraz Twoje przypomnienia nie są wysyłane.';

  @override
  String get privacyCloudNotBackup =>
      'To nie jest kopia zapasowa. Nie da się tego przywrócić na nowe urządzenie, a utrata tej instalacji zabiera ze sobą anonimowy identyfikator.';

  @override
  String get privacyGroupDiagnostics => 'Diagnostyka';

  @override
  String get privacyDiagnosticsWhat =>
      'Action zapisuje anonimowe liczniki tego, co dzieje się w aplikacji — że rozpoczęto przechwycenie, że wydobycie zadziałało albo nie, że wyszukiwanie nic nie znalazło, że zadanie zostało ukończone.';

  @override
  String get privacyDiagnosticsCounts =>
      'To liczniki, nie treści. Nigdy nie trafia tam żaden tytuł, kwota, termin, sygnatura, przechwycony tekst ani szukana fraza, a także ani anonimowy identyfikator, ani żaden identyfikator zadania czy przechwycenia.';

  @override
  String get privacyDiagnosticsCrash =>
      'Jeśli aplikacja się zawiesi, błąd i miejsce jego wystąpienia są zgłaszane, żeby dało się to naprawić. Action nie dołącza do tych zgłoszeń Twoich danych.';

  @override
  String get privacySectionYourData => 'Twoje dane';

  @override
  String get privacyYourDataFootnote =>
      'Wyczyszczenie przechwyceń zostawia Twoje zadania na miejscu. Zadanie, którego przechwycenie zniknęło, nadal działa; po prostu nie pokazuje już, z czego powstało.';

  @override
  String get privacyClearCaptures => 'Wyczyść przechwycenia';

  @override
  String get privacyClearCapturesDescription =>
      'Usuwa każde przechwycenie i jego plik obrazu.';

  @override
  String get privacyDeleteAll => 'Usuń wszystkie moje dane';

  @override
  String get privacyDeleteAllDescription =>
      'Zadania, kroki, przypomnienia, przechwycenia i powyższe zapisy w chmurze.';

  @override
  String get privacyClearCapturesTitle => 'Wyczyścić przechwycenia?';

  @override
  String get privacyClearCapturesBody =>
      'Każde przechwycenie i jego obraz zostaną usunięte z tego urządzenia. Twoje zadania zostają dokładnie takie, jakie są.';

  @override
  String get privacyCapturesDeleted => 'Przechwycenia usunięte.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Niektórych przechwyceń nie udało się usunąć. Nic innego nie zostało zmienione.';

  @override
  String get privacyDeleteAllTitle => 'Usunąć wszystkie Twoje dane?';

  @override
  String get privacyDeleteAllBody =>
      'To usuwa każde zadanie, krok, przypomnienie i przechwycenie na tym urządzeniu oraz wymienione powyżej zapisy w chmurze. Nie da się tego cofnąć i nie ma kopii zapasowej do przywrócenia.';

  @override
  String get privacyDeleteEverything => 'Usuń wszystko';

  @override
  String get privacyDeletedAll => 'Wszystko zostało usunięte.';

  @override
  String get privacyDeleteFailed => 'Nie udało się usunąć Twoich danych.';

  @override
  String get privacyDeletedUnverified =>
      'Wszystko na tym urządzeniu zostało usunięte. Action nie mogła połączyć się z chmurą, aby potwierdzić, że nic tam nie zostało, i sprawdzi ponownie.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Usunięto, poza $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action spróbuje ponownie.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action nie zdołała dokończyć sprawdzania chmury i spróbuje ponownie.';

  @override
  String get privacyLeftoverCaptures => 'kilkoma przechwyceniami';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zapisami w chmurze',
      many: '$count zapisami w chmurze',
      few: '$count zapisami w chmurze',
      one: '1 zapisem w chmurze',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first i $second';
  }

  @override
  String get privacyCloudDeleted => 'Zapisy w chmurze zostały usunięte.';

  @override
  String get privacyCloudUnreachable =>
      'Nadal nie udało się do nich dotrzeć. Action spróbuje ponownie.';

  @override
  String get privacyPendingTitle => 'Wciąż do usunięcia';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ostatnim razem nie udało się dotrzeć do $count zapisów w chmurze. Action spróbuje sama albo możesz spróbować teraz.',
      many:
          'Ostatnim razem nie udało się dotrzeć do $count zapisów w chmurze. Action spróbuje sama albo możesz spróbować teraz.',
      few:
          'Ostatnim razem nie udało się dotrzeć do $count zapisów w chmurze. Action spróbuje sama albo możesz spróbować teraz.',
      one: 'Ostatnim razem nie udało się dotrzeć do 1 zapisu w chmurze. Action spróbuje sama albo możesz spróbować teraz.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Spróbuj ponownie';

  @override
  String get evidenceTitle => 'Skąd to pochodzi';

  @override
  String get evidenceUnverified =>
      'Action nie znalazła tych słów w odczytanym tekście, więc ta wartość nie została sprawdzona. Porównaj ją z oryginałem, zanim na niej polegniesz.';

  @override
  String get evidenceHighlighted =>
      'Te słowa były w tekście, który Action odczytała z tego przechwycenia, a podświetlenie pokazuje gdzie.';

  @override
  String get evidenceNoRegion =>
      'Te słowa były w tekście, który Action odczytała z tego przechwycenia. Nie udało się ustalić, gdzie dokładnie znajdują się na obrazie, i nie ma tu zgadywania.';

  @override
  String get evidenceInText =>
      'Te słowa były w tekście, który zawiera to przechwycenie.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Krytyczne';

  @override
  String get urgencyImportant => 'Ważne';

  @override
  String get urgencyNormal => 'Zwykłe';

  @override
  String get urgencyLow => 'Niskie';

  @override
  String get urgencyUnsure => 'Nie wiadomo';
}
