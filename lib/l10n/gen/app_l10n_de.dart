// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppL10nDe extends AppL10n {
  AppL10nDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonDone => 'Fertig';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonClose => 'Schließen';

  @override
  String get commonBack => 'Zurück';

  @override
  String get commonRetry => 'Erneut versuchen';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonRemove => 'Entfernen';

  @override
  String get commonContinue => 'Weiter';

  @override
  String get commonOpen => 'Öffnen';

  @override
  String get commonCopy => 'Kopieren';

  @override
  String get commonCopied => 'Kopiert';

  @override
  String get commonEdit => 'Bearbeiten';

  @override
  String get commonAdd => 'Hinzufügen';

  @override
  String get commonOn => 'Ein';

  @override
  String get commonOff => 'Aus';

  @override
  String get commonUnknown => 'Unbekannt';

  @override
  String get commonChecking => 'Wird geprüft…';

  @override
  String get commonSettings => 'Einstellungen';

  @override
  String get commonDismiss => 'Ausblenden';

  @override
  String get commonUndo => 'Rückgängig';

  @override
  String get commonSkip => 'Überspringen';

  @override
  String get commonNotNow => 'Jetzt nicht';

  @override
  String get commonSomethingWentWrong => 'Etwas ist schiefgelaufen.';

  @override
  String get navToday => 'Heute';

  @override
  String get navLibrary => 'Bibliothek';

  @override
  String get navIntelligence => 'Intelligenz';

  @override
  String get navSearch => 'Suche';

  @override
  String get navCapture => 'Etwas erfassen';

  @override
  String get todayGreetingMorning => 'Guten Morgen';

  @override
  String get todayGreetingAfternoon => 'Guten Tag';

  @override
  String get todayGreetingEvening => 'Guten Abend';

  @override
  String get todayDateFormat => 'EEEE · d. MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Deine Aufgaben konnten nicht geladen werden. Sie sind weiterhin auf diesem Gerät gespeichert.';

  @override
  String get todaySectionNeedsAttention => 'Braucht Aufmerksamkeit';

  @override
  String get todaySectionAlsoNeedsAttention =>
      'Braucht ebenfalls Aufmerksamkeit';

  @override
  String get todaySectionWaitingForReview => 'Wartet auf Prüfung';

  @override
  String get todaySectionComingUp => 'Steht an';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Alle $count Erfassungen ansehen';
  }

  @override
  String get todaySeeAllInLibrary => 'Alle in der Bibliothek ansehen';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count erledigt',
      one: '1 erledigt',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Aufgaben erledigt. Bibliothek öffnen.',
      one: '1 Aufgabe erledigt. Bibliothek öffnen.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'BEGINNE MIT';

  @override
  String get todayQuickPhoto => 'Foto';

  @override
  String get todayQuickScreenshot => 'Screenshot';

  @override
  String get todayQuickText => 'Text';

  @override
  String get todayQuickTools =>
      'Einen Link prüfen oder Schlüssel in einem Text finden';

  @override
  String get briefBadgeNeedsYou => 'BRAUCHT DICH';

  @override
  String get briefBadgeToReview => 'ZU PRÜFEN';

  @override
  String get briefBadgeAhead => 'VORAUS';

  @override
  String get briefBadgeStartHere => 'HIER STARTEN';

  @override
  String get briefBadgeClear => 'FREI';

  @override
  String get briefNext => 'NÄCHSTES';

  @override
  String briefOpenAction(String title) {
    return '$title öffnen';
  }

  @override
  String briefMarkDone(String title) {
    return '„$title“ als erledigt markieren';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Aufgaben brauchen deine Aufmerksamkeit',
      one: '1 Aufgabe braucht deine Aufmerksamkeit',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Erfassungen warten außerdem auf Prüfung.',
      one: '1 Erfassung wartet außerdem auf Prüfung.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Erfassungen warten auf dich',
      one: '1 Erfassung wartet auf dich',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Nichts ist überfällig.';

  @override
  String get briefHeadlineNothingToday => 'Heute braucht dich nichts';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Aufgaben stehen an.',
      one: '1 Aufgabe steht an.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Du bist durch';

  @override
  String get briefDetailClear => 'Nichts ist fällig und nichts wartet.';

  @override
  String get briefHeadlineFirstRun => 'Fang mit irgendetwas an';

  @override
  String get briefDetailFirstRun =>
      'Ein Brief, ein Screenshot, eine Notiz — Action findet heraus, was es ist.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsSectionPersonalise => 'Personalisieren';

  @override
  String get settingsAppearance => 'Erscheinungsbild';

  @override
  String get settingsAppearanceDescription =>
      'Hell, dunkel oder was das Gerät gerade macht.';

  @override
  String get settingsLanguageDescription =>
      'Die Sprache, in der Action mit dir spricht.';

  @override
  String get appearanceSystem => 'System';

  @override
  String get appearanceLight => 'Hell';

  @override
  String get appearanceDark => 'Dunkel';

  @override
  String get appearanceSystemDescription => 'Der Geräteeinstellung folgen';

  @override
  String get appearanceLightDescription => 'Immer hell';

  @override
  String get appearanceDarkDescription => 'Immer dunkel';

  @override
  String get languageTitle => 'Sprache';

  @override
  String get languageSubtitle =>
      'Änderungen wirken sofort. Es wird nichts irgendwohin gesendet; die Auswahl bleibt auf diesem Gerät.';

  @override
  String get languageSectionChoose => 'Sprache wählen';

  @override
  String get languageSystem => 'System';

  @override
  String get languageSystemDescription => 'Der Gerätesprache folgen';

  @override
  String get languageDraftNote =>
      'Englisch ist die Sprache, in der Actions Texte geschrieben wurden. Die übrigen Übersetzungen entstanden anhand eines festen Glossars und wurden automatisch geprüft; ein Muttersprachler hat sie noch nicht gelesen. Wo die genaue Formulierung zählt — Datenschutz, Sicherheit, was Action behauptet und was nicht — bleibt Englisch die Referenz.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action funktioniert ohne KI. Wenn du deinen eigenen Anbieter verbindest, kommen Werkzeuge für Dokumentenanalyse, Planung und Entwürfe hinzu.';

  @override
  String get settingsAiProvider => 'KI-Anbieter';

  @override
  String get settingsAiNotConnected =>
      'Nicht verbunden. Nutze dein eigenes Konto und deinen API-Schlüssel.';

  @override
  String settingsAiConnected(String provider) {
    return 'Mit $provider verbunden.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Datenschutz & Sicherheit';

  @override
  String get settingsSecurity => 'Sicherheit';

  @override
  String get settingsWhereInfoLives => 'Wo deine Informationen liegen';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Was auf diesem Gerät bleibt und was nicht.';

  @override
  String get protectionAppLock => 'App-Sperre';

  @override
  String get protectionScreenPrivacy => 'Bildschirmschutz';

  @override
  String get protectionPrivateReminders => 'private Erinnerungen';

  @override
  String get protectionSummaryNone =>
      'App-Sperre, Bildschirmschutz und was dieses Gerät verlässt.';

  @override
  String protectionSummaryOne(String first) {
    return '$first ist an.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first und $second sind an.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second und $third sind an.';
  }

  @override
  String get settingsSectionReminders => 'Erinnerungen';

  @override
  String get settingsRemindersFootnote =>
      'Android kann eine Erinnerung etwas später als zur eingestellten Zeit zustellen — je nach Akkueinstellungen und Nutzung des Geräts.';

  @override
  String get settingsNotifications => 'Mitteilungen';

  @override
  String get settingsNotificationsOnDescription =>
      'Erinnerungen, die du setzt, können angezeigt werden.';

  @override
  String get settingsNotificationsOffDescription =>
      'Für Action abgeschaltet, Erinnerungen erscheinen also nicht.';

  @override
  String get settingsNotificationsUnknown => 'Konnte nicht geprüft werden.';

  @override
  String get settingsNotificationsAllowed => 'Erlaubt';

  @override
  String get settingsOpenSystemSettings => 'Einstellungen öffnen';

  @override
  String get settingsActionFootnote =>
      'Action macht aus unübersichtlichen Informationen klare nächste Schritte. Du bestätigst alles, bevor es gespeichert wird.';

  @override
  String get settingsHelp => 'Hilfe';

  @override
  String get settingsHelpDescription =>
      'Wie Action arbeitet und was es nicht tun wird.';

  @override
  String get settingsVersion => 'Version';

  @override
  String get dateShortFormat => 'd. MMM';

  @override
  String get dateLongFormat => 'd. MMM yyyy';

  @override
  String get relativeJustNow => 'Gerade eben';

  @override
  String relativeMinutes(int count) {
    return 'vor $count Min.';
  }

  @override
  String relativeHours(int count) {
    return 'vor $count Std.';
  }

  @override
  String get relativeYesterday => 'Gestern';

  @override
  String relativeDays(int count) {
    return 'vor $count T.';
  }

  @override
  String get libraryTitle => 'Bibliothek';

  @override
  String get librarySubtitle =>
      'Alles, was Action für dich aufbewahrt. Und alles davon bleibt auf diesem Gerät.';

  @override
  String get librarySegmentActions => 'Aufgaben';

  @override
  String get librarySegmentCaptures => 'Erfassungen';

  @override
  String get librarySegmentGoals => 'Ziele';

  @override
  String get librarySegmentDone => 'Erledigt';

  @override
  String get libraryNewGoal => 'Neues Ziel';

  @override
  String get libraryNoGoalsTitle => 'Noch keine Ziele';

  @override
  String get libraryNoGoalsMessage =>
      'Ein Ziel ist etwas, das du erreichen willst. Action kann finden, was fehlt, was im Weg steht und was zuerst zu tun ist.';

  @override
  String get libraryNoDoneTitle => 'Noch nichts abgeschlossen';

  @override
  String get libraryNoDoneMessage =>
      'Aufgaben, die du beendest, werden hier aufbewahrt.';

  @override
  String get libraryNoOpenTitle => 'Keine offenen Aufgaben';

  @override
  String get libraryNoOpenMessage =>
      'Erfasse etwas, und Action findet heraus, was zu tun ist.';

  @override
  String get libraryNoCapturesTitle => 'Noch nichts erfasst';

  @override
  String get libraryNoCapturesMessage =>
      'Fotos, Screenshots und Texte, die du hinzufügst, landen zuerst hier. Nichts wird analysiert, bevor du darum bittest.';

  @override
  String get libraryGoalNoActions => 'Daraus ist noch nichts entstanden';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Aufgaben aus diesem Ziel',
      one: '1 Aufgabe aus diesem Ziel',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Aufgaben und Erfassungen durchsuchen';

  @override
  String get searchClear => 'Löschen';

  @override
  String get searchPrivacyNote =>
      'Wird auf diesem Gerät durchsucht. Nichts, was du hier eingibst, verlässt es.';

  @override
  String get searchYouCanSearch => 'DURCHSUCHBAR IST';

  @override
  String get searchFieldTitles => 'Titel';

  @override
  String get searchFieldTitlesExample => 'Autoversicherung verlängern';

  @override
  String get searchFieldReferences => 'Referenznummern';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Organisationen';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Schritte in einer Aufgabe';

  @override
  String get searchFieldStepsExample => 'Formular hochladen';

  @override
  String get searchFieldCaptureText => 'Der aus einer Erfassung gelesene Text';

  @override
  String get searchFieldCaptureTextExample => 'Verlängerungsmitteilung';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Keine Treffer für „$query“';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Versuche weniger Wörter oder eine Referenznummer genau so, wie sie dasteht.';

  @override
  String get searchNoMatchesClearFilters =>
      'Versuche weniger Wörter oder lösche die Filter.';

  @override
  String get searchFilterActive => 'Offen';

  @override
  String get searchFilterCompleted => 'Erledigt';

  @override
  String get searchFilterOverdue => 'Überfällig';

  @override
  String get searchFilterThisWeek => 'Diese Woche';

  @override
  String get searchFilterCritical => 'Kritisch';

  @override
  String get searchFilterCreatedByYou => 'Von dir erstellt';

  @override
  String get searchFilterArchived => 'Archiviert';

  @override
  String get searchFilterClear => 'Filter löschen';

  @override
  String get searchIncompleteActions =>
      'Deine Aufgaben konnten nicht durchsucht werden, diese Ergebnisse sind also möglicherweise unvollständig.';

  @override
  String get searchIncompleteCaptures =>
      'Deine Erfassungen konnten nicht durchsucht werden, diese Ergebnisse sind also möglicherweise unvollständig.';

  @override
  String get searchIncompleteBoth =>
      'Weder deine Aufgaben noch deine Erfassungen konnten durchsucht werden, diese Ergebnisse sind also möglicherweise unvollständig.';

  @override
  String get searchMatchTitle => 'Titel';

  @override
  String get searchMatchNextStep => 'Nächster Schritt';

  @override
  String get searchMatchStep => 'Schritt';

  @override
  String get searchMatchSummary => 'Zusammenfassung';

  @override
  String get searchMatchFromCapture => 'Aus Erfassung';

  @override
  String get studioSuggested => 'Vorschlag zu deiner letzten Erfassung';

  @override
  String get studioRecentlyUsed => 'Zuletzt verwendet';

  @override
  String get studioReady => 'BEREIT';

  @override
  String get studioNotConnected => 'NICHT VERBUNDEN';

  @override
  String get studioHeroTitle => 'Action Intelligenz';

  @override
  String get studioConnectedBlurb =>
      'Ein Dokument verstehen, ein Ziel schärfen, einen Plan bauen, eine Antwort entwerfen oder prüfen, was du vor dir hast.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count Werkzeuge, um Dokumente zu verstehen, zu planen und zu schreiben. Verbinde dein eigenes KI-Konto, um sie zu nutzen — abgerechnet wird von deinem Anbieter, nie von Action.';
  }

  @override
  String get studioConnectAi => 'KI verbinden';

  @override
  String get studioHowItWorks => 'So funktioniert es';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count davon funktionieren schon ohne all das, vollständig auf diesem Gerät.',
      one: '1 davon funktioniert schon ohne all das, vollständig auf diesem Gerät.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Läuft auf diesem Gerät';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Läuft auf diesem Gerät.';
  }

  @override
  String get categoryUnderstand => 'Verstehen';

  @override
  String get categoryUnderstandBlurb => 'Verstehen, was du hast.';

  @override
  String get categoryPlan => 'Planen';

  @override
  String get categoryPlanBlurb => 'Daraus etwas machen, das du tun kannst.';

  @override
  String get categoryCreate => 'Erstellen';

  @override
  String get categoryCreateBlurb => 'Schreiben, verbessern, übersetzen.';

  @override
  String get categoryExtract => 'Herausziehen';

  @override
  String get categoryExtractBlurb =>
      'Die Angaben herausholen, auf die es ankommt.';

  @override
  String get categoryVerify => 'Prüfen';

  @override
  String get categoryVerifyBlurb => 'Prüfen, was du vor dir hast.';

  @override
  String get captureSheetTitle => 'Etwas erfassen';

  @override
  String get captureSheetSubtitle =>
      'Gib Action alles, was du lieber nicht durchlesen möchtest.';

  @override
  String get captureTakePhoto => 'Foto aufnehmen';

  @override
  String get captureTakePhotoSubtitle =>
      'Ein Brief, eine Rechnung oder ein Bescheid vor dir';

  @override
  String get captureChooseImage => 'Bild auswählen';

  @override
  String get captureChooseImageSubtitle =>
      'Ein Screenshot oder Foto, das schon auf diesem Gerät ist';

  @override
  String get capturePasteText => 'Text einfügen';

  @override
  String get capturePasteTextSubtitle =>
      'Eine E-Mail, Nachricht oder Mitteilung';

  @override
  String get captureChoosePdf => 'PDF auswählen';

  @override
  String get captureChoosePdfSubtitle =>
      'Ein Kontoauszug, Brief oder Formular, das du schon hast';

  @override
  String get captureFootnote =>
      'Erfassungen bleiben auf diesem Gerät. Nichts wird online analysiert, bevor du darum bittest.';

  @override
  String get captureCouldNotOpen =>
      'Das ließ sich nicht öffnen. Versuche es anders.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Wird gelesen';

  @override
  String get stageNeedsReview => 'Prüfen';

  @override
  String get stageActionCreated => 'Aufgabe erstellt';

  @override
  String get stageNoText => 'Kein Text gefunden';

  @override
  String get stageCouldNotBeRead => 'Konnte nicht gelesen werden';

  @override
  String get stageReadingPreview => 'Der Text wird gelesen…';

  @override
  String get stageFailedPreview =>
      'Das konnte auf diesem Gerät nicht gelesen werden.';

  @override
  String get provenancePhoto => 'Aus einem Foto erfasst';

  @override
  String get provenanceImage => 'Aus einem Bild erfasst';

  @override
  String get provenancePastedText => 'Aus eingefügtem Text erfasst';

  @override
  String get provenanceDocument => 'Als Dokument hinzugefügt';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Erledigt $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Überfällig · war fällig am $date';
  }

  @override
  String get metaDueToday => 'Heute fällig';

  @override
  String metaDueOn(String date) {
    return 'Fällig am $date';
  }

  @override
  String get metaCreatedByYou => 'Von dir erstellt';

  @override
  String get categoryPayment => 'Zahlung';

  @override
  String get categoryRenewal => 'Verlängerung';

  @override
  String get categoryAppointment => 'Termin';

  @override
  String get categoryBooking => 'Buchung';

  @override
  String get categoryTravel => 'Reise';

  @override
  String get categoryDeadline => 'Frist';

  @override
  String get categoryResponse => 'Antwort nötig';

  @override
  String get categoryDelivery => 'Lieferung';

  @override
  String get categoryDocument => 'Dokument';

  @override
  String get categoryNoActionRequired => 'Nichts zu tun';

  @override
  String get categoryUnsure => 'Nicht sicher';

  @override
  String get errorEnterManually => 'Selbst eingeben';
}
