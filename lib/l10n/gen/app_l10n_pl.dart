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
      'Niektóre narzędzia nigdy niczego nie wysyłają: ukrywanie wrażliwych danych, sprawdzanie, skąd pochodzi plik, wyszukiwanie danych logowania i sprawdzanie linku działają w całości na tym urządzeniu.';

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

  @override
  String get detailSaveFailed =>
      'Nie udało się tego zapisać. Nic nie przepadło — spróbuj ponownie.';

  @override
  String get detailSectionCreatedFrom => 'Powstało z';

  @override
  String get detailSourceChecking => 'Szukanie oryginalnego przechwycenia…';

  @override
  String get detailSourceUnavailable =>
      'Oryginalne przechwycenie nie jest już dostępne.';

  @override
  String get detailReopenAction => 'Otwórz zadanie ponownie';

  @override
  String get detailMarkActionComplete => 'Oznacz zadanie jako ukończone';

  @override
  String get detailGetHelp => 'Uzyskaj pomoc przy tym zadaniu';

  @override
  String get detailSectionHistory => 'Historia';

  @override
  String get detailHistoryShowLess => 'Pokaż mniej';

  @override
  String detailHistoryShowAll(int count) {
    return 'Pokaż wszystkie wpisy ($count)';
  }

  @override
  String get detailHistoryCreated => 'Utworzono';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Utworzono z $count krokami',
      many: 'Utworzono z $count krokami',
      few: 'Utworzono z $count krokami',
      one: 'Utworzono z 1 krokiem',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'Potwierdziłeś dane';

  @override
  String detailHistoryStepFinished(String title) {
    return 'Ukończono „$title”';
  }

  @override
  String get detailHistoryAStep => 'krok';

  @override
  String get detailHistoryReminderSet => 'Ustawiłeś przypomnienie';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'Ustawiłeś przypomnienie na $when';
  }

  @override
  String get detailHistoryCompleted => 'Oznaczono jako zrobione';

  @override
  String get detailHistoryChanged => 'Ostatnia zmiana';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Własny (zgodny z OpenAI)';

  @override
  String get aiCapabilityText => 'tekstu';

  @override
  String get aiCapabilityImages => 'obrazów';

  @override
  String get aiCapabilityDocuments => 'dokumentów';

  @override
  String get aiCapabilityStructuredResults => 'wyników o ustalonej strukturze';

  @override
  String get aiCapabilityStreaming => 'przesyłania strumieniowego';

  @override
  String get aiCapabilitySystemInstructions => 'instrukcji systemowych';

  @override
  String get aiCapabilityEvidenceCitations => 'cytowania dowodów';

  @override
  String get aiCapabilityLongDocuments => 'długich dokumentów';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a ani $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head ani $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'Podłącz dostawcę AI, aby korzystać z tego narzędzia.';

  @override
  String get aiFailureInvalidKey => 'Dostawca nie przyjął tego klucza API.';

  @override
  String get aiFailureQuotaExceeded =>
      'Twoje konto u dostawcy nie ma już środków albo osiągnęło swój limit.';

  @override
  String get aiFailureRateLimited =>
      'Twój dostawca ogranicza liczbę żądań. Spróbuj ponownie za chwilę.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action nie mogła dotrzeć do Twojego dostawcy AI. Sprawdź połączenie.';

  @override
  String get aiFailureUnsupportedModel =>
      'Ten model nie jest dostępny dla Twojego klucza. Wybierz inny w Ustawieniach.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'Model, który wybrałeś, nie odczyta $capabilities. Wybierz inny model w Ustawieniach.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'To za dużo treści, aby ten model odczytał ją naraz.';

  @override
  String get aiFailureInputTooLargeText =>
      'To więcej tekstu, niż da się przeanalizować naraz.';

  @override
  String get aiFailureProviderUnavailable =>
      'Twój dostawca AI ma kłopoty. Spróbuj ponownie za chwilę.';

  @override
  String get aiFailureMalformedResponse =>
      'Ten dostawca odesłał coś, czego Action nie zdołała odczytać.';

  @override
  String get aiFailureCancelled => 'Zatrzymano.';

  @override
  String get aiFailureInsecureEndpoint =>
      'Ten endpoint musi być adresem https://.';

  @override
  String get aiFailureUnknown =>
      'Coś poszło nie tak w kontakcie z Twoim dostawcą AI.';

  @override
  String get appLockTitle => 'Action jest zablokowana';

  @override
  String get appLockPrompt =>
      'Potwierdź, że to Ty, aby przejść dalej. Action pyta Twoje urządzenie — nigdy nie widzi Twojego odcisku palca, twarzy ani PIN-u.';

  @override
  String get appLockUnlocking => 'Odblokowywanie…';

  @override
  String get appLockNotConfirmed =>
      'Nie potwierdzono. Spróbuj ponownie, gdy będziesz gotowy.';

  @override
  String get appLockCannotConfirm =>
      'Twoje urządzenie nie może teraz potwierdzić, że to Ty. Sprawdź, czy w ustawieniach urządzenia nadal jest ustawiona blokada ekranu.';

  @override
  String get appLockWaiting => 'Oczekiwanie…';

  @override
  String get appLockUnlock => 'Odblokuj';

  @override
  String get appLockReasonUnlock => 'Odblokuj Action';

  @override
  String get appLockReasonEnable =>
      'Potwierdź, że to Ty, zanim włączysz Blokadę aplikacji';

  @override
  String get appLockReasonDisable =>
      'Potwierdź, że to Ty, zanim wyłączysz Blokadę aplikacji';

  @override
  String get todayCapabilityHeading => 'Czym zajmuje się Action';

  @override
  String get todayCapabilityDocumentTitle => 'List albo rachunek';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action odczyta go i znajdzie termin, kwotę i numer referencyjny.';

  @override
  String get todayCapabilityScreenshotTitle => 'Zrzut ekranu';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Zamień wiadomość, o której inaczej byś zapomniał, w coś, co możesz zrobić.';

  @override
  String get todayCapabilityTextTitle => 'Jakiś tekst';

  @override
  String get todayCapabilityTextBlurb =>
      'Wklej cokolwiek. Action rozpozna, co to jest i o co Cię prosi.';

  @override
  String get todayCapabilityConfirmTitle => 'Wszystko potwierdzasz Ty';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Nic nie staje się zadaniem, dopóki nie zobaczysz dowodów i nie powiesz „tak”.';

  @override
  String get todayCapabilityExploreIntelligence => 'Poznaj Inteligencję';

  @override
  String get documentRejectedEmpty => 'Ten plik jest pusty.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'Ten dokument ma $size, czyli więcej, niż Action jest w stanie obsłużyć.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'To nie jest PDF, niezależnie od tego, jak się nazywa. Action odczytuje pliki PDF i obrazy.';

  @override
  String get documentRejectedUnreadable =>
      'Nie udało się odczytać tego dokumentu.';

  @override
  String get pdfRejectedNotAPdf =>
      'Ten plik nie jest plikiem PDF, niezależnie od tego, jak się nazywa.';

  @override
  String get pdfRejectedEncrypted =>
      'Ten plik PDF jest zabezpieczony hasłem, więc Action nie może go odczytać.';

  @override
  String get pdfRejectedDamaged =>
      'Tego pliku PDF nie udało się odczytać. Może być niekompletny.';

  @override
  String get shareRejectedEmpty =>
      'W tym udostępnieniu nie było nic do odczytania.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action przyjmuje tekst, obrazy i pliki PDF. To było coś innego.';

  @override
  String get shareRejectedContentMismatch =>
      'Ten plik nie jest tym rodzajem pliku, za jaki się podaje, więc Action go nie otworzyła.';

  @override
  String get shareRejectedTooLarge =>
      'Ten plik jest za duży, aby Action mogła go obsłużyć.';

  @override
  String get shareRejectedUnreadable => 'Nie udało się odczytać tego pliku.';

  @override
  String get captureFailureRecognition =>
      'Rozpoznawanie tekstu nie mogło zostać uruchomione.';

  @override
  String get captureFailureImageFormat =>
      'Tego formatu obrazu nie udało się odczytać na tym urządzeniu.';

  @override
  String get connectSheetTitle => 'Podłącz swoje AI';

  @override
  String get connectSheetSubtitle =>
      'Korzystasz z własnego konta u dostawcy i własnego klucza API. Action przechowuje klucz w bezpiecznej pamięci tego urządzenia.';

  @override
  String get connectErrorKeyMissing =>
      'Wklej swój klucz API, aby przejść dalej.';

  @override
  String get connectErrorModelMissing =>
      'Wybierz model albo wpisz identyfikator modelu.';

  @override
  String get connectErrorEndpointMissing => 'Podaj adres swojego endpointu.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'Nie udało się otworzyć bezpiecznej pamięci tego urządzenia, więc klucz nie został zapisany.';

  @override
  String get connectTestSucceeded => 'Podłączono.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Podłączono. Dostępne modele: $count.';
  }

  @override
  String get connectProviderLabel => 'Dostawca';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'Musi to być adres https://. Action nie wyśle Twoich dokumentów przez nieszyfrowane połączenie.';

  @override
  String get connectApiKeyLabel => 'Klucz API';

  @override
  String get connectApiKeyHint => 'Wklej swój klucz';

  @override
  String get connectKeyPrivacyNote =>
      'Twój klucz zostaje na tym urządzeniu. Action nigdy nie wysyła go nigdzie indziej niż do wybranego przez Ciebie dostawcy i po zapisaniu nie może Ci go już pokazać.';

  @override
  String get connectModelLabel => 'Model';

  @override
  String get connectModelIdHint => 'Identyfikator modelu';

  @override
  String get connectModelFreeTextNote =>
      'Dostawcy wycofują identyfikatory modeli i dodają nowe. Jeśli tego, którego szukasz, nie ma na liście, wpisz go tutaj.';

  @override
  String get connectAndTest => 'Podłącz i przetestuj';

  @override
  String get connectSaveWithoutTesting => 'Zapisz bez testowania';

  @override
  String get toolWarningFactsNotChecked =>
      'Action nie mogła porównać tego z oryginalnym tekstem, więc kwoty i daty w tym wyniku nie zostały sprawdzone.';

  @override
  String get toolTitleRewrite => 'Popraw ten tekst';

  @override
  String get toolDescriptionRewrite =>
      'Jaśniejszy, krótszy albo bardziej oficjalny — fakty zachowane bez zmian.';

  @override
  String get toolModeRewriteClearer => 'Jaśniejszy';

  @override
  String get toolModeRewriteProfessional => 'Bardziej profesjonalny';

  @override
  String get toolModeRewriteShorter => 'Krótszy';

  @override
  String get toolModeRewritePersuasive => 'Bardziej przekonujący';

  @override
  String get toolModeRewriteSimpler => 'Prostszy';

  @override
  String get toolModeRewriteStructured => 'Bardziej uporządkowany';

  @override
  String get toolModeRewriteGrammarOnly => 'Tylko gramatyka';

  @override
  String get toolSectionWhatChanged => 'Co się zmieniło';

  @override
  String get toolSectionNote => 'Uwaga';

  @override
  String get toolSectionAlreadyClearBody =>
      'To było już jasne. Zmiany poniżej są niewielkie.';

  @override
  String get toolSectionImprovedText => 'Poprawiony tekst';

  @override
  String get toolTitleDraftReply => 'Napisz szkic odpowiedzi';

  @override
  String get toolDescriptionDraftReply =>
      'Odpowiedź, którą możesz zredagować i wysłać samodzielnie.';

  @override
  String get toolModeReplyProfessional => 'Profesjonalna';

  @override
  String get toolModeReplyConcise => 'Zwięzła';

  @override
  String get toolModeReplyFriendly => 'Przyjazna';

  @override
  String get toolModeReplyFormal => 'Oficjalna';

  @override
  String get toolModeReplyClarification => 'Poproś o wyjaśnienie';

  @override
  String get toolModeReplyConfirmation => 'Potwierdź odbiór';

  @override
  String get toolModeReplyDispute => 'Zakwestionuj to';

  @override
  String get toolSectionSubject => 'Temat';

  @override
  String get toolSectionDraftReply => 'Szkic odpowiedzi';

  @override
  String get toolSectionPlaceholders => 'Te miejsca musisz uzupełnić';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Szkic — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'To jest szkic. Action niczego nie wysyła — przeczytaj go, popraw i wyślij samodzielnie.';

  @override
  String get toolTitleTranslate => 'Przetłumacz';

  @override
  String get toolDescriptionTranslate =>
      'Inny język, a liczby i nazwy zostają bez zmian.';

  @override
  String get toolSectionTranslation => 'Tłumaczenie';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'Tłumaczenie: $from → $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'Zostawione w oryginale';

  @override
  String get toolWarningTranslationNotCertified =>
      'Tłumaczenie dla zrozumienia treści, a nie tłumaczenie przysięgłe.';

  @override
  String get toolTitleStructuredData => 'Wyciągnij tabelę';

  @override
  String get toolDescriptionStructuredData =>
      'Wiersze, pola i liczby, które możesz stąd skopiować.';

  @override
  String get toolSectionTable => 'Tabela';

  @override
  String get toolSectionFields => 'Pola';

  @override
  String get toolSectionTableCsv => 'Tabela (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'Nie udało się wiarygodnie odczytać układu kolumn tej tabeli. Sprawdź, czy wiersze się zgadzają, zanim ich użyjesz.';

  @override
  String get toolTitleDeadlineFinder => 'Znajdź terminy';

  @override
  String get toolDescriptionDeadlineFinder =>
      'Co jest do zrobienia, do kiedy i co się stanie, jeśli nie zostanie zrobione.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count terminu',
      many: '$count terminów',
      few: '$count terminy',
      one: '1 termin',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Nic do zrobienia w terminie';

  @override
  String get toolSectionNothingDueBody =>
      'Action nie znalazła w tym materiale żadnych terminów ani zobowiązań.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'Nic nie zostaje zaplanowane, dopóki tego nie wybierzesz. Przypomnienia nigdy nie są ustawiane automatycznie.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'Jeśli nie: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'Potrzebujesz: $items';
  }

  @override
  String get moneyErrorEmpty => 'nie podano kwoty';

  @override
  String get moneyErrorMalformed => 'kwota nie jest zwykłą liczbą';

  @override
  String get moneyErrorNegative => 'kwota ujemna nie jest sumą do zapłaty';

  @override
  String get moneyErrorTooManyDecimals =>
      'więcej miejsc po przecinku, niż ma ta waluta';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'nie rozpoznajemy tego kodu waluty';

  @override
  String get moneyErrorOutOfRange => 'kwota jest nieprawdopodobnie duża';

  @override
  String get escalationOcrFailed =>
      'Na tym przechwyceniu rozpoznawanie w ogóle nie zostało uruchomione.';

  @override
  String get escalationNoTextRecognised =>
      'To wygląda na dokument, ale nie rozpoznano żadnego tekstu.';

  @override
  String get escalationThinText =>
      'Jak na dokument tej wielkości rozpoznano stanowczo za mało tekstu.';

  @override
  String get escalationLowLineConfidence =>
      'Mechanizm rozpoznawania zgłosił niską pewność przy kilku wierszach.';

  @override
  String get escalationTableLikeLayout =>
      'Układ wygląda na tabelę, a odczytywanie go wiersz po wierszu gubi to, która wartość należy do którego wiersza.';

  @override
  String get escalationFragmentedLayout =>
      'Tekst wrócił w postaci wielu drobnych fragmentów, więc struktura jest niejasna.';

  @override
  String get escalationMalformedText =>
      'Duża część rozpoznanego tekstu to nie są czytelne słowa ani liczby.';

  @override
  String get escalationConflictingDates =>
      'Więcej niż jedna data jest przedstawiona jako termin.';

  @override
  String get escalationConflictingAmounts =>
      'Więcej niż jedna kwota jest przedstawiona jako suma do zapłaty.';

  @override
  String get escalationUnresolvedGrounding =>
      'Niektórych wartości nie udało się powiązać z tekstem dokumentu.';

  @override
  String get escalationInstructionLikeContent =>
      'Dokument zawiera tekst napisany tak, jakby był poleceniami dla aplikacji. Jest traktowany jako treść dokumentu, nigdy jako polecenia.';

  @override
  String get providerFailureNetwork =>
      'Action nie mogła dotrzeć do usługi. Sprawdź połączenie.';

  @override
  String get providerFailureTimedOut => 'Usługa odpowiadała zbyt długo.';

  @override
  String get providerFailureServiceUnavailable =>
      'Usługa jest chwilowo niedostępna. Spróbuj ponownie później.';

  @override
  String get providerFailureUnauthorized =>
      'Ta aplikacja nie ma teraz uprawnień do korzystania z tej usługi.';

  @override
  String get providerFailureBlocked =>
      'Usługa odmówiła przetworzenia tego dokumentu.';

  @override
  String get providerFailureUnknown =>
      'Action nie zdołała odczytać tego dokumentu. Ponowna próba może się udać.';

  @override
  String get reviewBlockerTitle => 'Nadaj temu zadaniu tytuł.';

  @override
  String get reviewBlockerDate =>
      'Wybierz, która data jest właściwym terminem, albo zostaw go nieustawiony.';

  @override
  String get reviewBlockerAmount =>
      'Wybierz, która kwota jest właściwa, albo zostaw ją nieustawioną.';

  @override
  String get reviewBlockerStepTitle =>
      'Kroki, które zachowujesz, muszą mieć tytuł.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'strona $page',
      many: 'strona $page',
      few: 'strona $page',
      one: 'strona 1',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'strony $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Nowy tekst nie zawiera już $values. Sprawdź go, zanim z niego skorzystasz.',
      many:
          'Nowy tekst nie zawiera już $values. Sprawdź go, zanim z niego skorzystasz.',
      few:
          'Nowy tekst nie zawiera już $values. Sprawdź go, zanim z niego skorzystasz.',
      one:
          'Nowy tekst nie zawiera już $values. Sprawdź go, zanim z niego skorzystasz.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Nowy tekst nie zawiera już $values i jeszcze $count innych wartości. Sprawdź go, zanim z niego skorzystasz.',
      many:
          'Nowy tekst nie zawiera już $values i jeszcze $count innych wartości. Sprawdź go, zanim z niego skorzystasz.',
      few:
          'Nowy tekst nie zawiera już $values i jeszcze $count innych wartości. Sprawdź go, zanim z niego skorzystasz.',
      one:
          'Nowy tekst nie zawiera już $values i jeszcze 1 innej wartości. Sprawdź go, zanim z niego skorzystasz.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Osiągnięty';

  @override
  String get goalNewSheetTitle => 'Co chcesz doprowadzić do skutku?';

  @override
  String get goalNewSheetSubtitle =>
      'Wystarczy jedno zdanie. Szczegóły możesz dodać później.';

  @override
  String get goalTitleHint =>
      'Odnowić ubezpieczenie samochodu bez przepłacania.';

  @override
  String get goalCreateAction => 'Utwórz cel';

  @override
  String get goalTitleSheetTitle => 'Czego chcesz';

  @override
  String get goalOutcomeSheetTitle => 'Jak wygląda gotowe';

  @override
  String get goalContextSheetTitle => 'Na jakim etapie';

  @override
  String get goalOutcomeHint =>
      'Samochód jest ubezpieczony, a dokumenty złożone.';

  @override
  String get goalContextHint =>
      'Mam dwie oferty, a odnowienie wypada osiemnastego.';

  @override
  String get goalWorkspaceTitle => 'Cel';

  @override
  String get goalUnmarkReached => 'Jednak nieosiągnięty';

  @override
  String get goalMarkReached => 'Oznacz jako osiągnięty';

  @override
  String get goalNotFound => 'Tego celu już tu nie ma.';

  @override
  String get goalDeleteTitle => 'Usunąć ten cel?';

  @override
  String get goalDeleteBody =>
      'Cel zostaje usunięty z tego urządzenia. Zadania, które z niego powstały, zostają dokładnie takie, jakie są.';

  @override
  String get goalOutcomeLabel => 'Jak wygląda zrobione';

  @override
  String get goalOutcomeEmpty =>
      'Jeszcze nie napisane. Cel łatwiej zaplanować, gdy powiesz, co znaczy jego ukończenie.';

  @override
  String get goalContextLabel => 'Na czym stoi';

  @override
  String get goalContextEmpty =>
      'Jeszcze nic nie napisane. Co się dotąd wydarzyło i co stoi na przeszkodzie.';

  @override
  String get goalTitleLabel => 'Czego chcesz';

  @override
  String get goalEditTooltip => 'Edytuj cel';

  @override
  String get goalToolsLabel => 'Co potrafi Action';

  @override
  String get goalToolsNotReady =>
      'Napisz trochę więcej o tym, czego chcesz, a te narzędzia będą miały z czym pracować.';

  @override
  String get toolGoalOptimizerTitle => 'Dopracuj cel';

  @override
  String get toolActionPlanTitle => 'Ułóż plan';

  @override
  String get resultFactUnconfirmed => 'Niepotwierdzone';

  @override
  String get resultSuggestedSteps => 'Proponowane kroki';

  @override
  String get resultSuggestedAction => 'Proponowane zadanie';

  @override
  String get resultWorthAsking => 'Warto zapytać';

  @override
  String get resultSuggestedDeadlines => 'Proponowane terminy';

  @override
  String get resultSuggestions => 'Propozycje';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cytatu na poparcie',
      many: '$count cytatów na poparcie',
      few: '$count cytaty na poparcie',
      one: '1 cytat na poparcie',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'Z wybranego źródła';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Przygotowywanie Twojego dokumentu';

  @override
  String get toolRunStageReading => 'Odczytywanie wybranych stron';

  @override
  String get toolRunStageAnalysing => 'Analizowanie';

  @override
  String get toolRunStageBuilding => 'Składanie tego, co sprawdzisz';

  @override
  String get toolRunStageDone => 'Zakończone';

  @override
  String get toolRunStageFailed => 'Nie dokończono';

  @override
  String get toolRunStageCancelled => 'Zatrzymane przez Ciebie';

  @override
  String get toolRunFailureLocalCheckFailed => 'Nie udało się tego sprawdzić.';

  @override
  String get toolRunFailureProviderRetired =>
      'Tego dostawcy AI nie ma już w tej wersji.';

  @override
  String get toolRunFailureUnusableReply =>
      'Ta odpowiedź nie wróciła w formie nadającej się do użycia. Spróbuj ponownie.';

  @override
  String get toolRunFailureQuestionRequired => 'Najpierw wpisz pytanie.';

  @override
  String get toolRunFailureInputRequired =>
      'Wybierz coś, na czym to narzędzie ma popracować.';

  @override
  String get toolWarningReplyTruncated =>
      'Ta odpowiedź urwała się przed końcem, więc może być niekompletna.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Twój model nie zwrócił żadnych cytatów na poparcie, więc nic tutaj nie ma poparcia w źródle. Porównaj to z dokumentem, zanim zaczniesz na tym działać.';

  @override
  String get aiSettingsRemoveTitle => 'Usunąć to połączenie?';

  @override
  String get aiSettingsRemoveBody =>
      'Action usunie Twój klucz API z tego urządzenia i przestanie korzystać z funkcji AI. Twoje konto u dostawcy pozostaje nienaruszone.';

  @override
  String get aiSettingsProviderLabel => 'Dostawca';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'Za to, z czego korzystasz, rozlicza Cię Twój dostawca. Action nigdy nie wysyła zapytania z własnej inicjatywy.';

  @override
  String get aiSettingsConnectLabel => 'Podłącz dostawcę AI';

  @override
  String get aiSettingsConnectDescription =>
      'Używaj własnego konta i klucza API w OpenAI, Anthropic, Google Gemini albo w zgodnym endpoincie.';

  @override
  String get aiSettingsModelLabel => 'Model';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'Klucz API';

  @override
  String get aiSettingsKeyStored =>
      'Trzymany w bezpiecznej pamięci tego urządzenia.';

  @override
  String get aiSettingsKeyMissing =>
      'Nie znaleziono klucza na tym urządzeniu. Podłącz ponownie, aby go dodać.';

  @override
  String get aiSettingsTestLabel => 'Przetestuj połączenie';

  @override
  String get aiSettingsProviderUnavailable =>
      'Ten dostawca nie jest dostępny w tej wersji.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Połączono. Dostępnych modeli: $count.';
  }

  @override
  String get aiSettingsTestButton => 'Testuj';

  @override
  String get aiSettingsChangeProvider => 'Zmień dostawcę lub model';

  @override
  String get aiSettingsRemoveKey => 'Usuń klucz';

  @override
  String get aiSettingsSectionPrivacy => 'Prywatność';

  @override
  String get aiSettingsWhatGetsSentLabel => 'Co jest wysyłane';

  @override
  String get aiSettingsWhereItGoesLabel => 'Dokąd trafia';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'Nic nie jest wysyłane, dopóki nie podłączysz dostawcy.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Prosto do $provider, przy użyciu Twojego klucza. Nie przechodzi przez serwery Action.';
  }

  @override
  String get aiSettingsSectionData => 'Dane';

  @override
  String get aiSettingsDataFootnote =>
      'Action pamięta, z których narzędzi korzystasz, nigdy tego, na czym ich użyłeś.';

  @override
  String get aiSettingsRecentToolsLabel => 'Ostatnio używane narzędzia';

  @override
  String get aiSettingsRecentToolsNone => 'Brak';

  @override
  String get reminderNotificationTitle => 'Przypomnienie Action';

  @override
  String get reminderNotificationPrivateBody => 'Masz coś do sprawdzenia.';

  @override
  String get reminderChannelName => 'Przypomnienia Action';

  @override
  String get reminderChannelDescription =>
      'Przypomnienia, które ustawiasz samodzielnie dla swoich zadań.';

  @override
  String get onboardingStart => 'Zacznij korzystać z Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'Krok $current z $total';
  }

  @override
  String get onboardingCaptureTitle => 'Zamień informacje w zadania';

  @override
  String get onboardingCaptureBody =>
      'Dodaj zrzut ekranu, zdjęcie albo tekst, który do Ciebie przyszedł. Action to odczytuje i ustala, czego się od Ciebie oczekuje.';

  @override
  String get onboardingReviewTitle =>
      'Nic nie zostaje zapisane, dopóki tego nie potwierdzisz';

  @override
  String get onboardingReviewBody =>
      'Action pokazuje Ci, co znalazła, i słowa, z których to wzięła. Poprawiasz wszystko, co jest nie tak. Dopóki nie potwierdzisz, to jest propozycja — nie fakt i nie zadanie.';

  @override
  String get onboardingTrackingTitle => 'Panuj nad tym, co ważne';

  @override
  String get onboardingTrackingBody =>
      '„Wymaga uwagi” wysuwa na wierzch to, co jest po terminie albo blisko niego. Każde zadanie zachowuje swój następny krok, swoje postępy i każde przypomnienie, które dla niego ustawisz.';

  @override
  String get onboardingPrivacyBody => 'Warto wiedzieć, zanim zaczniesz:';

  @override
  String get onboardingPrivacyOnDevice =>
      'Twoje zadania, przechwycenia, przypomnienia i wyszukiwania są przechowywane na tym urządzeniu. Wyszukiwanie i przypomnienia działają bez połączenia.';

  @override
  String get onboardingPrivacySentToRead =>
      'Gdy prosisz Action o odczytanie czegoś, ta treść jest wysyłana do usługi AI, która ją interpretuje.';

  @override
  String get onboardingPrivacyCloud =>
      'Krótki zapis potwierdzonego zadania — jego tytuł, daty, kwota i proponowany krok — może zostać zachowany w chmurze pod anonimowym identyfikatorem tego urządzenia. Twoje przechwycenia, kroki i przypomnienia nie są zapisywane.';

  @override
  String get onboardingPrivacyNotBackup =>
      'Ten zapis nie jest kopią zapasową. Nie przywróci niczego na nowe urządzenie.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przeszkody',
      many: '$count przeszkód',
      few: '$count przeszkody',
      one: '1 przeszkoda',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Mogłoby być prościej';

  @override
  String get toolDescriptionGoalOptimizer =>
      'Czego brakuje, co to blokuje i od czego zacząć.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'Po: $step';
  }

  @override
  String get toolSectionThePlan => 'Plan';

  @override
  String get toolDescriptionActionPlan =>
      'Uporządkowany zestaw kroków, które możesz zamienić w zadania.';

  @override
  String get toolTitleSmartChecklist => 'Zrób listę kontrolną';

  @override
  String get toolDescriptionSmartChecklist =>
      'Wszystko, czego to od Ciebie wymaga, po kolei.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count brakującego szczegółu',
      many: '$count brakujących szczegółów',
      few: '$count brakujące szczegóły',
      one: '1 brakujący szczegół',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'Te informacje są ze sobą sprzeczne';

  @override
  String get toolTitleMissingInformation => 'Czego brakuje';

  @override
  String get toolDescriptionMissingInformation =>
      'Luki i o co w ich sprawie zapytać.';

  @override
  String get aiAdapterTimedOut => 'To trwało zbyt długo i zostało zatrzymane.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'Bezpieczne połączenie z Twoim dostawcą AI nie powiodło się.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action nie znalazła tego modelu ani endpointu.';

  @override
  String get aiAdapterRequestRejected =>
      'Twój dostawca AI odrzucił to zapytanie.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action nie mogła otworzyć bezpiecznej pamięci tego urządzenia.';

  @override
  String get aiAdapterEndpointMissing =>
      'Dodaj adres swojego endpointu AI w Ustawieniach.';

  @override
  String get aiAdapterReplyIncomplete =>
      'Ta odpowiedź była niekompletna. Spróbuj ponownie.';

  @override
  String get aiAdapterContentDeclined =>
      'Twój dostawca odmówił przetworzenia tej treści.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'To jest więcej plików naraz niż $limit. Wybierz mniej.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'Jeden z tych obrazów jest za duży do analizy.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '„$filename” jest za duży do analizy. Limit to $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '„$filename” ma tyle stron: $count. Action odczytuje naraz maksymalnie $limit — wybierz zakres.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'Ten wybór jest za duży, aby wysłać go w jednym zapytaniu.';

  @override
  String get toolRunNotAvailableTitle => 'To narzędzie jest niedostępne';

  @override
  String get toolRunNotAvailableMessage =>
      'Mogło zostać usunięte w nowszej wersji Action.';

  @override
  String get toolRunNoSourcesYet =>
      'Jeszcze nie ma nad czym pracować. Przechwyć coś albo wklej poniżej jakiś tekst.';

  @override
  String get toolRunChooseSourcesToCompare => 'Wybierz, co porównać';

  @override
  String get toolRunChooseSource => 'Wybierz źródło';

  @override
  String get toolRunQuestionLabel => 'Twoje pytanie';

  @override
  String get toolRunQuestionHint => 'Jaki jest termin?';

  @override
  String get toolRunFreeTextLabel => 'Albo wklej jakiś tekst';

  @override
  String get toolRunFreeTextHint => 'Wklej lub wpisz tutaj';

  @override
  String get toolRunModeLabel => 'Styl';

  @override
  String get toolRunRunLocally => 'Sprawdź na tym urządzeniu';

  @override
  String get toolRunRun => 'Uruchom';

  @override
  String get toolRunStop => 'Zatrzymaj';

  @override
  String get toolRunRunAgain => 'Uruchom ponownie';

  @override
  String get toolRunWorkingOn => 'Dotyczy:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'Wysłać to do $provider?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'Wybrana przez Ciebie treść zostanie wysłana do $provider w celu przetworzenia, przy użyciu Twojego klucza API.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'Twój klucz zostaje na tym urządzeniu. Action nie wysyła niczego w tle i nie wysyła Twoich pozostałych zadań ani źródeł.';

  @override
  String get toolRunScopeTitle => 'Zanim to ruszy';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count strony zostanie przeanalizowanych przy użyciu Twojego połączenia z $provider.',
      many:
          '$count stron zostanie przeanalizowanych przy użyciu Twojego połączenia z $provider.',
      few:
          '$count strony zostaną przeanalizowane przy użyciu Twojego połączenia z $provider.',
      one:
          '1 strona zostanie przeanalizowana przy użyciu Twojego połączenia z $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count pliku zostanie przeanalizowanych przy użyciu Twojego połączenia z $provider.',
      many:
          '$count plików zostanie przeanalizowanych przy użyciu Twojego połączenia z $provider.',
      few:
          '$count pliki zostaną przeanalizowane przy użyciu Twojego połączenia z $provider.',
      one:
          '1 plik zostanie przeanalizowany przy użyciu Twojego połączenia z $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'Wybrany przez Ciebie tekst zostanie wysłany przez Twoje połączenie z $provider.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Podłącz dostawcę AI, aby korzystać z tego narzędzia';

  @override
  String get toolRunNeedsProviderBody =>
      'Korzystasz z własnego konta u dostawcy i własnego klucza API.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kroku',
      many: '$count kroków',
      few: '$count kroków',
      one: '1 kroku',
    );
    return 'Zadanie utworzone z $_temp0.';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dodano $count kroku.',
      many: 'Dodano $count kroków.',
      few: 'Dodano $count kroki.',
      one: 'Dodano 1 krok.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kroku',
      many: '$count kroków',
      few: '$count kroki',
      one: '1 krok',
    );
    return 'Utwórz zadanie · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kroku',
      many: '$count kroków',
      few: '$count kroki',
      one: '1 krok',
    );
    return 'Dodaj do tego zadania · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Zdjęcie';

  @override
  String get sourceTypeLabelScreenshot => 'Zrzut ekranu';

  @override
  String get sourceTypeLabelPastedText => 'Wklejona notatka';

  @override
  String get sourceTypeLabelDocument => 'Dokument';

  @override
  String get toolModeClearer => 'Jaśniej';

  @override
  String get toolModeMoreProfessional => 'Bardziej profesjonalnie';

  @override
  String get toolModeShorter => 'Krócej';

  @override
  String get toolModeSimpler => 'Prościej';

  @override
  String get toolModeMoreStructured => 'Z wyraźniejszą strukturą';

  @override
  String get toolModeMorePersuasive => 'Bardziej przekonująco';

  @override
  String get toolModeGrammarOnly => 'Tylko gramatyka';

  @override
  String get toolModeProfessional => 'Profesjonalnie';

  @override
  String get toolModeConcise => 'Zwięźle';

  @override
  String get toolModeFriendly => 'Przyjaźnie';

  @override
  String get toolModeFormal => 'Formalnie';

  @override
  String get toolModeAskForClarification => 'Poproś o wyjaśnienie';

  @override
  String get toolModeConfirm => 'Potwierdzenie';

  @override
  String get toolModeDispute => 'Zakwestionuj to';

  @override
  String get toolModeQuick => 'Skrótowo';

  @override
  String get toolModeDetailed => 'Szczegółowo';

  @override
  String get toolModeExecutive => 'Dla decydenta';

  @override
  String get toolModeKeyPoints => 'Kluczowe punkty';

  @override
  String get toolModeActionFocused => 'Pod kątem zadań';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count cytowanego szczegółu nie udało się znaleźć w wybranym przez Ciebie materiale, więc jest oznaczony jako niepewny.',
      many:
          '$count cytowanych szczegółów nie udało się znaleźć w wybranym przez Ciebie materiale, więc są oznaczone jako niepewne.',
      few:
          '$count cytowanych szczegółów nie udało się znaleźć w wybranym przez Ciebie materiale, więc są oznaczone jako niepewne.',
      one: 'Jednego cytowanego szczegółu nie udało się znaleźć w wybranym przez Ciebie materiale, więc jest oznaczony jako niepewny.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action nie mogła porównać tych cytatów z samym plikiem, więc nie zostały one sprawdzone.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Po terminie · $count dnia',
      many: 'Po terminie · $count dni',
      few: 'Po terminie · $count dni',
      one: 'Po terminie · 1 dzień',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Termin jutro';

  @override
  String get triageBadgeReminderSoon => 'Wkrótce przypomnienie';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Po terminie o $count dnia',
      many: 'Po terminie o $count dni',
      few: 'Po terminie o $count dni',
      one: 'Po terminie o 1 dzień',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'To jest zrobione.';

  @override
  String get triageExplanationNothingPressing =>
      'To jest tutaj, bo nic w tym jeszcze nie nagli.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'To wymaga uwagi, bo $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'To jest niżej, bo $reason.';
  }

  @override
  String get triageReasonOverdue => 'jest po terminie';

  @override
  String get triageReasonDeadlinePassed => 'jego termin minął';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'jest po terminie o $count dnia',
      many: 'jest po terminie o $count dni',
      few: 'jest po terminie o $count dni',
      one: 'jest po terminie o jeden dzień',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'termin mija dzisiaj';

  @override
  String get triageReasonCriticalDueSoon =>
      'masz to oznaczone jako krytyczne, a termin jest blisko';

  @override
  String get triageReasonAllStepsDone =>
      'każdy krok jest zrobiony — zostaje tylko zakończyć';

  @override
  String get triageReasonDueTomorrow => 'termin mija jutro';

  @override
  String get triageReasonReminderSoon =>
      'masz ustawione przypomnienie w ciągu najbliższej doby';

  @override
  String get triageReasonDueWithinThreeDays => 'termin mija w ciągu trzech dni';

  @override
  String get triageReasonCriticalNoDeadline =>
      'masz to oznaczone jako krytyczne, a nie ma terminu';

  @override
  String get triageReasonDueWithinSevenDays => 'termin mija w ciągu tygodnia';

  @override
  String get triageReasonImportant => 'masz to oznaczone jako ważne';

  @override
  String get triageReasonDueLater => 'jego termin jest dalej';

  @override
  String get triageReasonNoDeadline => 'nie ma terminu i nic nie nagli';

  @override
  String cardCompletedTooltip(String title) {
    return 'Ukończone: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Zrozum ten dokument';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'Co to jest, co jest ważne i co z tym zrobić.';

  @override
  String get toolSectionWhatThisIs => 'Czym to jest';

  @override
  String get toolSectionWhatMatters => 'Co jest ważne';

  @override
  String get toolSectionKeyDetails => 'Kluczowe szczegóły';

  @override
  String get toolTitleAskDocument => 'Zapytaj o źródło';

  @override
  String get toolDescriptionAskDocument =>
      'Odpowiedzi oparte na tym, co wybrałeś — albo nic.';

  @override
  String get toolSectionNoAnswer => 'Brak odpowiedzi w tym materiale';

  @override
  String get toolSectionNoAnswerBody =>
      'Action nie znalazła tego w wybranym dokumencie.';

  @override
  String get toolSectionAnswer => 'Odpowiedź';

  @override
  String get toolSectionFromTheDocument => 'Z dokumentu';

  @override
  String get toolWarningQuoteNotFound =>
      'Cytatu stojącego za tą odpowiedzią nie ma w wybranym materiale. Traktuj tę odpowiedź jako niewiarygodną.';

  @override
  String get toolTitleSmartSummary => 'Streść';

  @override
  String get toolDescriptionSmartSummary =>
      'Krótka wersja — albo ta, która zmienia to, co masz do zrobienia.';

  @override
  String get toolSectionKeyPoints => 'Kluczowe punkty';

  @override
  String get toolTitleCompareDocuments => 'Porównaj dokumenty';

  @override
  String get toolDescriptionCompareDocuments =>
      'Co się zmieniło, co jest sprzeczne, czego brakuje.';

  @override
  String get toolSectionWhatDiffers => 'Czym się różnią';

  @override
  String get toolSectionConflicts => 'Sprzeczności';

  @override
  String get toolSectionOnlyInOne => 'Tylko w jednym z nich';

  @override
  String get toolSectionInCommon => 'Wspólne';

  @override
  String get sensitiveKindEmail => 'Adres e-mail';

  @override
  String get sensitiveKindPhone => 'Numer telefonu';

  @override
  String get sensitiveKindPaymentCard => 'Numer karty płatniczej';

  @override
  String get sensitiveKindIban => 'Rachunek bankowy (IBAN)';

  @override
  String get sensitiveKindNationalId => 'Krajowy numer identyfikacyjny';

  @override
  String get sensitiveKindPostcode => 'Kod pocztowy';

  @override
  String get sensitiveKindAccountNumber => 'Numer konta';

  @override
  String get sensitiveKindReference => 'Numer referencyjny';

  @override
  String get sensitiveKindDateOfBirth => 'Data urodzenia';

  @override
  String get sensitiveKindUrl => 'Adres internetowy';

  @override
  String get verdictVerifiedProvenance => 'Dostępne zweryfikowane pochodzenie';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'Ten plik zawiera podpis, który został sprawdzony i okazał się prawidłowy.';

  @override
  String get verdictSignalsSynthetic =>
      'Sygnały zgodne z treścią wygenerowaną przez AI';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'Ten plik podaje, że powstał przy użyciu narzędzia generatywnego. Metadane można zmienić lub usunąć, więc to jest to, co twierdzi plik, a nie dowód.';

  @override
  String get verdictSignalsEdited => 'Sygnały zgodne z treścią poddaną edycji';

  @override
  String get verdictSignalsEditedExplainer =>
      'Ten plik podaje, że przeszedł przez program do edycji. To zwyczajne w przypadku zdjęć i samo w sobie nie oznacza, że cokolwiek sfałszowano.';

  @override
  String get verdictNoReliableProvenance =>
      'Nie znaleziono wiarygodnego pochodzenia';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'W tym pliku nie ma żadnych informacji o pochodzeniu. To normalne — większość serwisów je usuwa — i nie jest oznaką niczego.';

  @override
  String get verdictInconclusive => 'Niejednoznaczne';

  @override
  String get verdictInconclusiveExplainer =>
      'Nie ma tu wystarczających informacji, żeby powiedzieć, skąd to pochodzi.';

  @override
  String get authenticitySignalCamera => 'Aparat';

  @override
  String get authenticitySignalSoftware => 'Oprogramowanie';

  @override
  String get authenticitySignalDescription => 'Opis';

  @override
  String get authenticitySignalCopyright => 'Prawa autorskie';

  @override
  String get authenticitySignalLocation => 'Lokalizacja';

  @override
  String get authenticitySignalLocationValue =>
      'W tym pliku znajdują się dane o lokalizacji.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Nie sprawdzono — ta wersja aplikacji nie ma weryfikatora podpisów.';

  @override
  String get authenticitySignalFile => 'Plik';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'Nie udało się odczytać tego jako obrazu.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'To nie jest rozpoznawany format obrazu.';

  @override
  String get authenticitySignalText => 'Tekst';

  @override
  String get authenticitySignalTextValue =>
      'Sam tekst nie pokazuje wiarygodnie, czy użyto AI. Action nie zgaduje.';

  @override
  String get fileTypePng => 'obraz PNG';

  @override
  String get fileTypeJpeg => 'obraz JPEG';

  @override
  String get fileTypeGif => 'obraz GIF';

  @override
  String get fileTypeWebp => 'obraz WebP';

  @override
  String get fileTypeWav => 'nagranie WAV';

  @override
  String get fileTypePdf => 'dokument PDF';

  @override
  String get fileTypeHeic => 'obraz HEIC';

  @override
  String get fileTypeVideo => 'plik wideo';

  @override
  String get fileTypeTiff => 'obraz TIFF';

  @override
  String get fileTypeBitmap => 'obraz bitmapowy';

  @override
  String get fileTypeRtf => 'dokument RTF';

  @override
  String get fileTypeZip => 'archiwum Zip';

  @override
  String get fileTypeGzip => 'archiwum gzip';

  @override
  String get fileTypeSevenZip => 'archiwum 7-Zip';

  @override
  String get fileTypeRar => 'archiwum RAR';

  @override
  String get fileTypeWindowsProgram => 'program dla systemu Windows';

  @override
  String get fileTypeLinuxProgram => 'program dla systemu Linux';

  @override
  String get fileTypePostScript => 'dokument PostScript';

  @override
  String get fileTypeOgg => 'nagranie Ogg';

  @override
  String get fileTypeMp3 => 'nagranie MP3';

  @override
  String get fileTypePlainText => 'zwykły tekst';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'Ten plik ma w nazwie „.$extension”, ale jego zawartość to $contents. To może być zwykła pomyłka, a jednocześnie tak właśnie plik zostaje otwarty przez coś innego, niż się spodziewasz.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bajta',
      many: '$count bajtów',
      few: '$count bajty',
      one: '1 bajt',
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
  String get credentialKindPrivateKey => 'Klucz prywatny';

  @override
  String get credentialKindApiKey => 'Klucz API';

  @override
  String get credentialKindConnectionString => 'Parametry połączenia';

  @override
  String get credentialKindAccessToken => 'Token dostępu';

  @override
  String get credentialKindAuthorizationHeader => 'Nagłówek Authorization';

  @override
  String get credentialKindPasswordOrKey => 'Hasło lub klucz';

  @override
  String get credentialKindPossibleSecret => 'Możliwy sekret';

  @override
  String get credentialAdvicePrivateKey =>
      'Usuń to przed udostępnieniem i wymień parę kluczy. Klucza prywatnego nie da się już zabezpieczyć, gdy raz został zobaczony.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Unieważnij ten klucz u dostawcy i wygeneruj nowy. Usunięcie go z dokumentu nie wyłącza go.';

  @override
  String get credentialAdviceConnectionString =>
      'Zawiera hasło oraz adres, do którego to hasło otwiera dostęp. Zmień hasło, jeśli to już zostało udostępnione.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Takie tokeny często wygasają, ale nie zawsze. Traktuj go jako aktywny, chyba że wiesz, kiedy wygasa.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Usuń wartość nagłówka. Wklejone logi żądań to jeden z najczęstszych sposobów, w jakie działający token zostaje przypadkiem udostępniony.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Przenieś to do zmiennej środowiskowej albo do magazynu sekretów i zmień wartość, jeśli plik został udostępniony.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action nie potrafi stwierdzić, co to jest. Sprawdź to przed udostępnieniem — równie dobrze może to być identyfikator albo suma kontrolna.';

  @override
  String get credentialLabelAnthropicApiKey => 'Klucz API Anthropic';

  @override
  String get credentialLabelOpenAiProjectKey => 'Klucz projektu OpenAI';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'Klucz API w stylu OpenAI';

  @override
  String get credentialLabelGoogleApiKey => 'Klucz API Google';

  @override
  String get credentialLabelGoogleOAuthToken => 'Token OAuth Google';

  @override
  String get credentialLabelGitHubToken => 'Token GitHub';

  @override
  String get credentialLabelSlackToken => 'Token Slack';

  @override
  String get credentialLabelAwsAccessKeyId =>
      'Identyfikator klucza dostępu AWS';

  @override
  String get credentialLabelGitLabToken => 'Token GitLab';

  @override
  String get credentialLabelNpmToken => 'Token npm';

  @override
  String get credentialLabelPassphrase => 'Fraza hasła';

  @override
  String get credentialLabelPassword => 'Hasło';

  @override
  String get credentialLabelRefreshToken => 'Token odświeżania';

  @override
  String get credentialLabelToken => 'Token';

  @override
  String get credentialLabelClientSecret => 'Sekret klienta';

  @override
  String get credentialLabelCredential => 'Poświadczenie';

  @override
  String get credentialLabelSecret => 'Sekret';

  @override
  String get linkVerdictNoObviousSignals => 'Brak oczywistych sygnałów';

  @override
  String get linkVerdictWorthChecking => 'Warto sprawdzić';

  @override
  String get linkVerdictTreatWithCaution => 'Zachowaj ostrożność';

  @override
  String get linkSummaryNoObviousSignals =>
      'Nic nietypowego w tym, jak zapisany jest ten link. To nie to samo co wiedza, że strona jest godna zaufania — tylko Ty możesz ocenić, czy się go spodziewałeś.';

  @override
  String get linkSummaryWorthChecking =>
      'W tym linku jest jedna rzecz warta obejrzenia, zanim go otworzysz.';

  @override
  String get linkSummaryTreatWithCaution =>
      'Kilka rzeczy w tym, jak zapisany jest ten link, warto sprawdzić, zanim go otworzysz.';

  @override
  String get linkSignalNotHttps => 'Bez szyfrowania';

  @override
  String get linkSignalNonWebScheme => 'To nie jest link do strony';

  @override
  String get linkSignalEmbeddedCredentials => 'Hasło w linku';

  @override
  String get linkSignalMisleadingAuthority => 'Ukryty prawdziwy adres';

  @override
  String get linkSignalIpLiteralHost => 'Adres liczbowy';

  @override
  String get linkSignalPunycodeHost => 'Zakodowane znaki w nazwie';

  @override
  String get linkSignalMixedScriptHost => 'Wymieszane alfabety w nazwie';

  @override
  String get linkSignalEncodedHost => 'Sekwencje ucieczki w nazwie';

  @override
  String get linkSignalUnusualPort => 'Nietypowy port';

  @override
  String get linkSignalDeepSubdomain => 'Wiele części w nazwie';

  @override
  String get linkSignalPublicSuffixInSubdomain =>
      'Znajoma nazwa w złym miejscu';

  @override
  String get linkSignalShortener => 'Skrócony link';

  @override
  String get linkSignalExecutableTarget => 'Pobiera program';

  @override
  String get linkSignalRedirectParameter => 'Wysyła Cię gdzie indziej';

  @override
  String get linkSignalVeryLongUrl => 'Bardzo długi';

  @override
  String get linkSignalUnparseable => 'Nie do odczytania jako link';

  @override
  String get linkDetailNotHttps =>
      'Ten link używa http, więc wszystko, co wpiszesz na stronie, może zostać odczytane po drodze.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'To otwiera się przez „$scheme:”, a nie jako strona internetowa. Może poprosić inną aplikację, żeby coś zrobiła.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'W tym linku zapisane są nazwa użytkownika i hasło. Gdziekolwiek zostanie udostępniony, idą razem z nim.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'Wszystko przed „@” przeglądarka ignoruje. Prawdziwym celem jest „$host”.';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'To prowadzi do „$host” — surowego adresu zamiast nazwy. Prawdziwe strony prawie zawsze używają nazwy.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'Nazwa strony zawiera znaki spoza alfabetu łacińskiego, przechowywane w postaci zakodowanej. To normalne w wielu językach, a zarazem tak właśnie można sprawić, by nazwa wyglądała jak znajoma.';

  @override
  String get linkDetailMixedScriptHost =>
      'Nazwa strony miesza litery łacińskie z literami z innego alfabetu, które wyglądają tak samo. Przeczytaj ją znak po znaku.';

  @override
  String get linkDetailEncodedHost =>
      'Nazwa strony zawiera sekwencje ucieczki, a to nie jest miejsce, w którym powinny się znajdować. Mogą ukrywać to, co nazwa naprawdę mówi.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'To łączy się na porcie $port, a nie na zwykłym. To częste na serwerach testowych i nietypowe dla publicznych stron.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Nazwa ma $count części. Tylko dwie ostatnie decydują o tym, kto prowadzi stronę; resztę można ustawić dowolnie.',
      many:
          'Nazwa ma $count części. Tylko dwie ostatnie decydują o tym, kto prowadzi stronę; resztę można ustawić dowolnie.',
      few:
          'Nazwa ma $count części. Tylko dwie ostatnie decydują o tym, kto prowadzi stronę; resztę można ustawić dowolnie.',
      one:
          'Nazwa ma $count część. Tylko dwie ostatnie decydują o tym, kto prowadzi stronę; resztę można ustawić dowolnie.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'Ta nazwa zawiera w środku „.$suffix.”, przez co jej początek wygląda na właściwą stronę. W rzeczywistości stroną jest „$host”.';
  }

  @override
  String get linkDetailShortener =>
      'Usługa skracania linków ukrywa prawdziwy cel. Nie da się stwierdzić, dokąd to prowadzi, bez otwarcia.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'Ten link kończy się na „$fileExtension”, więc pobiera coś, co może uruchomić się na Twoim urządzeniu, a nie stronę do przeczytania.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'Ten link niesie drugi adres w ustawieniu „$parameter”, więc jego otwarcie może zaprowadzić Cię gdzie indziej niż do „$host”.';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'Długie linki trudniej się czyta, a część, która decyduje o celu, może zostać wypchnięta poza pole widzenia.';

  @override
  String get linkDetailUnparseable =>
      'Action nie zdołała odczytać tego jako adresu internetowego. Uważaj na linki, które nie wyglądają jak linki.';

  @override
  String get toolTitleRedaction => 'Ukryj wrażliwe dane';

  @override
  String get toolDescriptionRedaction =>
      'Znajdź to, czego nie należy udostępniać, i zrób oczyszczoną kopię.';

  @override
  String get toolSectionRedactionNothingToScan => 'Nie ma czego przeskanować';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'To narzędzie czyta tekst. Wybierz notatkę, wklejoną wiadomość albo przechwycenie, którego tekst został odczytany.';

  @override
  String get toolSectionRedactionNothingFound =>
      'Nie znaleziono nic oczywistego';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action nie znalazła w tym tekście adresów e-mail, numerów telefonów, numerów kart ani numerów referencyjnych.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rzeczy wartych ukrycia',
      many: '$count rzeczy wartych ukrycia',
      few: '$count rzeczy warte ukrycia',
      one: '1 rzecz warta ukrycia',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Kopia z wymazanymi danymi';

  @override
  String get toolWarningRedactionCoverage =>
      'To wyszukuje wzorce takie jak adresy e-mail, numery telefonów i numery kont. Nie wychwyci wszystkiego, co wrażliwe — przeczytaj kopię, zanim ją udostępnisz.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action nie umie wymazywać danych z obrazów ani z plików PDF. Zasłonięcie czegoś na obrazie zostawiłoby oryginał pod spodem, więc nie jest to oferowane.';

  @override
  String get toolTitleAuthenticity => 'Sprawdź, skąd to pochodzi';

  @override
  String get toolDescriptionAuthenticity =>
      'To, co plik sam deklaruje o swoim pochodzeniu.';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'Nie ma czego zbadać';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Wybierz obraz albo jakiś tekst.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'Co ten plik mówi o sobie samym';

  @override
  String get toolSectionAuthenticityFileItself => 'Sam plik';

  @override
  String get toolSectionFileContents => 'Zawartość';

  @override
  String get toolSectionFileUnknownFormat =>
      'Nie jest to format, który Action zna';

  @override
  String get toolSectionFileSize => 'Rozmiar';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'To pokazuje, co plik deklaruje o sobie samym. Metadane można zmienić lub usunąć, więc nic z tego nie jest dowodem. Nie używaj tego do oskarżania kogokolwiek.';

  @override
  String get toolTitleCredentialScanner => 'Sprawdź, czy są klucze i hasła';

  @override
  String get toolDescriptionCredentialScanner =>
      'Znajdź poświadczenia, zanim coś udostępnisz.';

  @override
  String get toolSectionCredentialNothingToCheck => 'Nie ma czego sprawdzić';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Wklej jakiś tekst albo wybierz przechwycenie, którego tekst został odczytany. To narzędzie czyta tylko tekst.';

  @override
  String get toolSectionCredentialNoneFound => 'Nie znaleziono poświadczeń';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action nie znalazła w tym tekście niczego o kształcie klucza API, klucza prywatnego, tokena ani hasła.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Znaleziono $count poświadczenia',
      many: 'Znaleziono $count poświadczeń',
      few: 'Znaleziono $count poświadczenia',
      one: 'Znaleziono 1 poświadczenie',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rzeczy, które mogą być sekretami',
      many: '$count rzeczy, które mogą być sekretami',
      few: '$count rzeczy, które mogą być sekretami',
      one: '1 rzecz, która może być sekretem',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Kopia z usuniętymi poświadczeniami';

  @override
  String get toolWarningCredentialRevoke =>
      'Usunięcie klucza z dokumentu nie wyłącza go. Jeśli któryś z nich został już udostępniony, unieważnij go u dostawcy i wygeneruj nowy.';

  @override
  String get toolWarningCredentialCoverage =>
      'To znajduje poświadczenia o rozpoznawalnym kształcie. Hasło zapisane słowami w zdaniu nie zostanie znalezione, więc przeczytaj też sam tekst.';

  @override
  String get toolTitleLinkInspector => 'Sprawdź link';

  @override
  String get toolDescriptionLinkInspector =>
      'Co adres zdradza, zanim go otworzysz.';

  @override
  String get toolSectionLinkNoneFound => 'Nie znaleziono linków';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Wklej link albo wybierz przechwycenie, które go zawiera.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count linku w tym tekście',
      many: '$count linków w tym tekście',
      few: '$count linki w tym tekście',
      one: 'Link w tym tekście',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'Nie do odczytania';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'Nic nietypowego w tym, jak są zapisane';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'To nie to samo co wiedza, że te strony są godne zaufania. Tylko Ty możesz ocenić, czy się ich spodziewałeś.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action czyta wyłącznie adres. Nie otwiera linku, nie wyszukuje strony, nie odpytuje żadnej usługi reputacyjnej — zrobienie czegokolwiek z tego wysłałoby Twoje przeglądanie do kogoś innego.';

  @override
  String get toolWarningLinkNoSignals =>
      'Link bez żadnych sygnałów nadal może wyrządzić szkodę. To znajduje problemy w tym, jak zapisany jest adres, a to nie wszystko, co trzeba wiedzieć o tym, dokąd prowadzi.';

  @override
  String get toolSectionObjective => 'Twój cel';

  @override
  String get toolSectionCurrentState => 'Stan realizacji';

  @override
  String get toolSectionRecommendedNextStep => 'Zalecany następny krok';

  @override
  String get toolSectionCredentialAdvice => 'Co zrobić';

  @override
  String get toolSectionSummary => 'Podsumowanie';

  @override
  String get toolDetailSeparator => ' · ';
}
