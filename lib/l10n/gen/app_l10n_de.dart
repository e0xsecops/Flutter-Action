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
  String get ocrScriptTitle => 'Texterkennung';

  @override
  String get ocrScriptSubtitle =>
      'Das Schriftsystem, das Action auf einem Foto liest. Die Erkennung läuft auf diesem Gerät; keine Erfassung wird zum Lesen irgendwohin geschickt.';

  @override
  String get ocrScriptSectionChoose => 'Schriftsystem';

  @override
  String get ocrScriptFollowLanguage => 'Der App-Sprache folgen';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Zurzeit $script';
  }

  @override
  String get ocrScriptLatin => 'Lateinisch';

  @override
  String get ocrScriptChinese => 'Chinesisch';

  @override
  String get ocrScriptDevanagari => 'Devanagari';

  @override
  String get ocrScriptJapanese => 'Japanisch';

  @override
  String get ocrScriptKorean => 'Koreanisch';

  @override
  String get ocrScriptLatinDescription =>
      'Englisch, Spanisch, Französisch, Deutsch und die übrigen Sprachen in lateinischer Schrift.';

  @override
  String get ocrScriptChineseDescription =>
      'Vereinfachtes und traditionelles Chinesisch.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Hindi, Marathi und Nepali. Nicht Bengalisch, Tamil oder Telugu — jedes davon ist ein eigenes Schriftsystem.';

  @override
  String get ocrScriptJapaneseDescription => 'Japanisch.';

  @override
  String get ocrScriptKoreanDescription => 'Koreanisch.';

  @override
  String get ocrScriptFootnote =>
      'Jede Wahl außer Lateinisch liest auch lateinische Buchstaben. Eine Auswahl fügt also ein Schriftsystem hinzu, statt eines zu ersetzen. Die Änderung gilt für Fotos ab jetzt, nicht für bereits gelesene.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action kann die Schrift $language nicht lesen';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Es gibt dafür keine Erkennung auf dem Gerät. Fotos werden weiterhin für alles in lateinischer Schrift gelesen, der Rest kommt leer zurück. Du kannst diesen Text stattdessen tippen oder einfügen.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action ist auf $script eingestellt. Wenn dieses Foto ein anderes Schriftsystem zeigt, ändere es in den Einstellungen und lies es erneut.';
  }

  @override
  String get settingsTextRecognition => 'Texterkennung';

  @override
  String get settingsTextRecognitionDescription =>
      'Das Schriftsystem, das Action auf Fotos liest.';

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

  @override
  String get sourceWhatWeRead => 'Was wir gelesen haben';

  @override
  String get sourceDelete => 'Erfassung löschen';

  @override
  String get sourceGone => 'Diese Erfassung ist nicht mehr verfügbar.';

  @override
  String get sourceDeleteTitle => 'Diese Erfassung löschen?';

  @override
  String get sourceDeleteBody =>
      'Das Bild und der daraus gelesene Text werden von diesem Gerät entfernt.';

  @override
  String get sourceDeleteKeep => 'Behalten';

  @override
  String get sourceOpenAction => 'Aufgabe öffnen';

  @override
  String sourceOpenActions(int count) {
    return '$count Aufgaben öffnen';
  }

  @override
  String get sourceCreateAnother => 'Noch eine daraus erstellen';

  @override
  String get sourceCreateAction => 'Aufgabe daraus erstellen';

  @override
  String get sourceDoMore => 'Mehr damit machen';

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
    return 'aus $format $size KB';
  }

  @override
  String get sourceTextFound => 'Text gefunden';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines Zeilen · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Das ist der Text, den Action gelesen hat. Was daraus entstanden ist, steht darunter.';

  @override
  String get sourceNotInterpreted =>
      'Bisher wurde nichts gedeutet. Action wird vorschlagen, was damit zu tun ist, und du bestätigst, bevor etwas erstellt wird.';

  @override
  String get sourceNoTextExplainer =>
      'Das kommt bei Handschrift vor, bei sehr wenig Licht oder bei einer Schrift, die dieses Gerät noch nicht lesen kann.';

  @override
  String get sourceReadFailed => 'Konnte das nicht lesen';

  @override
  String get sourceReadFailedReason =>
      'Die Texterkennung wurde nicht abgeschlossen.';

  @override
  String get sourceTryReadingAgain => 'Erneut lesen';

  @override
  String get sourceTypeInstead => 'Angaben stattdessen tippen';

  @override
  String get sourceTypeWhatItSays => 'Tippe, was dort steht';

  @override
  String get sourceTypeHint => 'Daten, Beträge und worum gebeten wird.';

  @override
  String get sourceMadeFromThis => 'Aus dieser Erfassung entstanden';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count aus dieser Erfassung entstanden';
  }

  @override
  String get sourceTheDocument => 'Das Dokument';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '1 Seite',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Seitenzahl unbekannt';

  @override
  String get sourceDocumentNotRead =>
      'Action hat nicht gelesen, was in diesem Dokument steht. Wenn du ein Werkzeug ausführst, das es braucht, geht die Datei an den von dir verbundenen KI-Anbieter, und du wirst vorher darauf hingewiesen.';

  @override
  String get previewSaveFailed =>
      'Konnte das nicht sichern. Versuch es erneut.';

  @override
  String get previewTitle => 'Erfassung prüfen';

  @override
  String get previewImageFailed => 'Dieses Bild konnte nicht geöffnet werden.';

  @override
  String get previewHint =>
      'Achte darauf, dass der Text lesbar ist und nichts Wichtiges abgeschnitten wurde.';

  @override
  String get previewRetake => 'Neu aufnehmen';

  @override
  String get pasteTitle => 'Text einfügen';

  @override
  String get pasteHint =>
      'Füge die E-Mail, Nachricht oder Mitteilung ein, die du lieber nicht durchlesen möchtest.';

  @override
  String get pasteFootnote =>
      'Alles mit einem Datum, einem Betrag oder einer Aufforderung eignet sich gut.';

  @override
  String get pasteEnough => 'Sieht nach genug zum Arbeiten aus.';

  @override
  String get pasteMore => 'Etwas mehr Text bringt ein besseres Ergebnis.';

  @override
  String get reviewLoadFailed => 'Diese Erfassung konnte nicht geladen werden.';

  @override
  String get reviewConfirmed => 'Bestätigt';

  @override
  String get reviewNeedsReview => 'Prüfung nötig';

  @override
  String get reviewReview => 'Prüfen';

  @override
  String get reviewHighConfidence => 'Hohe Sicherheit';

  @override
  String get reviewConfirmedByYou => 'Von dir bestätigt';

  @override
  String get reviewMissing => 'Fehlt';

  @override
  String get reviewNotUnderstood =>
      'Action konnte von dieser Quelle nicht genug zuverlässig verstehen.';

  @override
  String get reviewNotUnderstoodBody =>
      'Der Erfassung ist nichts passiert und nichts ging verloren. Du kannst die Angaben selbst eintragen, und die Quelle bleibt zum Nachschlagen angehängt.';

  @override
  String get reviewEnterDetails => 'Angaben eintragen';

  @override
  String get reviewKeepSource => 'Quelle für später behalten';

  @override
  String reviewEngine(String engine) {
    return 'Modul: $engine';
  }

  @override
  String get reviewManualNotice =>
      'Du erstellst diese Aufgabe selbst. Nur was du hier einträgst, wird verwendet.';

  @override
  String get reviewUntitled => 'Aufgabe ohne Titel';

  @override
  String get reviewEditTitle => 'Titel bearbeiten';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Werte müssen von dir geprüft werden.',
      one: '1 Wert muss von dir geprüft werden, bevor das bestätigt werden kann.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Wichtige Angaben';

  @override
  String get reviewNotFound => 'Nicht gefunden';

  @override
  String get reviewSuggestedNextStep => 'Vorgeschlagener nächster Schritt';

  @override
  String get reviewWhyThisMatters => 'Warum das wichtig ist';

  @override
  String get reviewSteps => 'Schritte';

  @override
  String get reviewAddStep => 'Schritt hinzufügen';

  @override
  String get reviewInjectionNotice =>
      'Ein Teil des Textes in dieser Quelle sah nach Anweisungen statt nach Angaben aus dem Dokument aus, deshalb hat Action ihn ignoriert.';

  @override
  String get reviewLayoutNotice =>
      'Das Layout dieses Dokuments kann Zusammenhänge enthalten, die die Textauswertung nicht vollständig bewahren konnte. Prüfe die Werte unten gegen die Quelle, bevor du bestätigst.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Prüfe die Werte unten gegen die Quelle.';
  }

  @override
  String get reviewDeadline => 'Frist';

  @override
  String get reviewAmount => 'Betrag';

  @override
  String get reviewLeftUnset => 'Keine — du hast das offen gelassen';

  @override
  String get reviewUnclear => 'Unklar';

  @override
  String get reviewNotSet => 'Nicht gesetzt';

  @override
  String get reviewNoDeadlineFound => 'In diesem Dokument keine gefunden';

  @override
  String get reviewNoAmountFound => 'In diesem Dokument keinen gefunden';

  @override
  String get reviewMultipleDates =>
      'Action hat mehrere mögliche Daten gefunden.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count Daten kommen als Frist infrage. Wähle das richtige, gib ein anderes ein oder lass es offen.';
  }

  @override
  String get reviewChooseDate => 'Datum wählen';

  @override
  String get reviewMultipleAmounts =>
      'Action hat mehr als einen möglichen Betrag gefunden.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count Beträge kommen für diese Aufgabe infrage. Wähle einen, gib einen anderen ein oder lass es offen.';
  }

  @override
  String get reviewChooseAmount => 'Betrag wählen';

  @override
  String get reviewSkipStep => 'Diesen Schritt überspringen';

  @override
  String get reviewKeepStep => 'Diesen Schritt behalten';

  @override
  String get reviewEditStep => 'Schritt bearbeiten';

  @override
  String get reviewCreateManually => 'Selbst erstellen';

  @override
  String get reviewConfirmAndCreate => 'Bestätigen & Aufgabe erstellen';

  @override
  String get reviewFixHighlighted => 'Markierte Felder prüfen';

  @override
  String get reviewSaving => 'Wird gesichert…';

  @override
  String get reviewSaveFailed =>
      'Diese Aufgabe konnte nicht gesichert werden. Nichts ging verloren — versuch es erneut.';

  @override
  String get reviewFieldTitle => 'Titel';

  @override
  String get reviewTitleHint => 'Was muss passieren?';

  @override
  String get reviewNewStep => 'Neuer Schritt';

  @override
  String get reviewStepHint => 'Was zu tun ist';

  @override
  String get reviewDatesConflict => 'Das Dokument nennt mehr als ein Datum.';

  @override
  String get reviewAmountsConflict =>
      'Das Dokument nennt mehr als einen Betrag.';

  @override
  String get reviewAnotherDate => 'Anderes Datum — 2026-08-30';

  @override
  String get reviewBadDate =>
      'Kein gültiges Datum. Verwende das Format 2026-08-30.';

  @override
  String get reviewTypeDate => 'Tippe ein Datum, oder lass es unten offen.';

  @override
  String get reviewUseThisDate => 'Dieses Datum verwenden';

  @override
  String get reviewLeaveNoDeadline => 'Ohne Frist fortfahren';

  @override
  String get reviewAnotherAmount => 'Anderer Betrag — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Dieser Betrag ist nicht verwendbar: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Diesen Betrag verwenden';

  @override
  String get reviewLeaveNoAmount => 'Ohne Betrag fortfahren';

  @override
  String get reviewThisValue => 'Dieser Wert';

  @override
  String reviewQuote(String quote) {
    return '„$quote“';
  }

  @override
  String get reviewSeeOnCapture => 'Auf der Erfassung zeigen';

  @override
  String get reviewViewSource => 'Quelle ansehen';

  @override
  String get reviewFromSource => 'Aus der Quelle';

  @override
  String get reviewNotVerified => 'Nicht überprüft';

  @override
  String get reviewCouldNotVerify =>
      'Konnte das nicht gegen die Quelle prüfen.';

  @override
  String get reviewLooksRight => 'Sieht richtig aus';

  @override
  String get reviewStageReading => 'Quelle wird gelesen';

  @override
  String get reviewStageUnderstanding => 'Wichtige Angaben werden verstanden';

  @override
  String get reviewStageChecking =>
      'Es wird geprüft, was nachgesehen werden muss';

  @override
  String get reviewNothingToDo => 'Gerade musst du nichts tun.';

  @override
  String get reviewInformationOnly =>
      'Das sieht nach reiner Information aus — es wurde keine Frist, Zahlung oder Antwort gefunden.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Das sieht nach reiner Information aus — in dieser Erfassung wurde keine Frist, Zahlung oder Antwort gefunden.';

  @override
  String get reviewSourceKept => 'Die Quelle bleibt so oder so erhalten.';

  @override
  String get reviewAddAnyway => 'Trotzdem eine Aufgabe anlegen';

  @override
  String get reviewActionConfirmed => 'Aufgabe bestätigt';

  @override
  String get reviewCreatedByYou => 'Von dir erstellt.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Von dir bestätigt anhand von $count geprüften Angaben.',
      one: 'Von dir bestätigt anhand von 1 geprüften Angabe.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Von dir bestätigt anhand von $count geprüften Angaben. Du hast $edited davon geändert.',
      one:
          'Von dir bestätigt anhand von 1 geprüften Angabe. Du hast $edited davon geändert.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Auf diesem Gerät gesichert.';

  @override
  String get detailLoadFailed =>
      'Diese Aufgabe konnte nicht geladen werden. Sie ist weiterhin auf diesem Gerät gespeichert.';

  @override
  String get detailNotFoundTitle => 'Diese Aufgabe gibt es nicht mehr';

  @override
  String get detailNotFoundMessage =>
      'Sie wurde vielleicht auf diesem Gerät gelöscht.';

  @override
  String get detailGoBack => 'Zurück';

  @override
  String get detailMore => 'Mehr';

  @override
  String get detailChangeUrgency => 'Dringlichkeit ändern';

  @override
  String get detailAddRecommendedStep => 'Empfohlenen Schritt hinzufügen';

  @override
  String get detailEditRecommendedStep => 'Empfohlenen Schritt bearbeiten';

  @override
  String get detailArchiveTitle => 'Diese Aufgabe archivieren?';

  @override
  String get detailArchiveBody =>
      'Sie verschwindet aus deiner Liste, wird aber nicht gelöscht, und die Erfassung, aus der sie stammt, bleibt erhalten.';

  @override
  String get detailArchiveConfirm => 'Archivieren';

  @override
  String get detailArchived => 'Archiviert';

  @override
  String detailCompletedOn(String date) {
    return 'Erledigt am $date';
  }

  @override
  String get detailSectionDetails => 'Details';

  @override
  String get detailSectionReminders => 'Erinnerungen';

  @override
  String get detailAllStepsDone => 'Alle Schritte erledigt';

  @override
  String get detailNextEyebrow => 'Als Nächstes';

  @override
  String get detailCompleteQuestion => 'Diese Aufgabe abschließen?';

  @override
  String get detailMarkStepDone => 'Schritt erledigt';

  @override
  String get detailCompleteAction => 'Aufgabe abschließen';

  @override
  String get detailAddDeadline => 'Frist hinzufügen';

  @override
  String get detailAddAmount => 'Betrag hinzufügen';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed von $total erledigt';
  }

  @override
  String get detailNoStepsTitle => 'Noch keine Schritte';

  @override
  String get detailNoStepsMessage =>
      'Zerlege das in die Handgriffe, die du wirklich machen musst.';

  @override
  String get detailAddFirstStep => 'Ersten Schritt hinzufügen';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Erledigter Schritt: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Nächster Schritt: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Schritt: $title';
  }

  @override
  String detailMarkDone(String title) {
    return '„$title“ als erledigt markieren';
  }

  @override
  String detailMarkNotDone(String title) {
    return '„$title“ als nicht erledigt markieren';
  }

  @override
  String get detailStepOptions => 'Schrittoptionen';

  @override
  String get detailMoveUp => 'Nach oben';

  @override
  String get detailMoveDown => 'Nach unten';

  @override
  String get detailDeleteStep => 'Schritt löschen';

  @override
  String get detailDateFormat => 'd. MMM';

  @override
  String get detailDateFormatWithYear => 'd. MMM yyyy';

  @override
  String get stepDeleteTitle => 'Diesen Schritt löschen?';

  @override
  String get stepDeleteKeep => 'Behalten';

  @override
  String get detailNoRemindersYet => 'Noch keine Erinnerungen.';

  @override
  String get detailReminderLimit =>
      'Mehr Erinnerungen kann eine Aufgabe nicht haben. Entferne eine, um eine andere hinzuzufügen.';

  @override
  String get detailAddReminder => 'Erinnerung hinzufügen';

  @override
  String get detailChangeReminder => 'Erinnerung ändern';

  @override
  String get detailRemoveReminder => 'Erinnerung entfernen';

  @override
  String get detailReminderFormat => 'EEE d. MMM, HH:mm';

  @override
  String get reminderStatePending => 'Noch nicht eingerichtet';

  @override
  String get reminderStateNotificationsOff =>
      'Gesichert, aber Mitteilungen sind aus';

  @override
  String get reminderStateFailed => 'Konnte nicht geplant werden';

  @override
  String get reminderStateRemoving => 'Wird entfernt…';

  @override
  String get reminderSetConfirmation =>
      'Erinnerung gesetzt. Wir stupsen dich an.';

  @override
  String get reminderUpdatedConfirmation => 'Erinnerung aktualisiert.';

  @override
  String get reminderNeedsPermission =>
      'Mitteilungen sind aus, diese Erinnerung ist also gesichert, kann dich aber noch nicht benachrichtigen.';

  @override
  String get reminderScheduleFailed =>
      'Diese Erinnerung ist gesichert, aber Android wollte sie nicht einplanen.';

  @override
  String get reminderLimitReached =>
      'Diese Aufgabe hat bereits die maximale Anzahl an Erinnerungen.';

  @override
  String get reminderTimeInPast => 'Dieser Zeitpunkt ist schon vorbei.';

  @override
  String get reminderAddTitle => 'Erinnerung hinzufügen';

  @override
  String get reminderChangeTitle => 'Diese Erinnerung ändern';

  @override
  String get reminderDateLabel => 'Datum';

  @override
  String get reminderTimeLabel => 'Uhrzeit';

  @override
  String get reminderFieldDateFormat => 'EEE d. MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'EEEE, d. MMMM';

  @override
  String get reminderPresetFormat => 'd. MMM, HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'Du wirst am $date um $time erinnert.';
  }

  @override
  String get reminderTimePastError =>
      'Dieser Zeitpunkt ist schon vorbei. Wähle einen späteren.';

  @override
  String get reminderSet => 'Erinnerung setzen';

  @override
  String get reminderPresetInHour => 'In 1 Stunde';

  @override
  String get reminderPresetTomorrowMorning => 'Morgen früh';

  @override
  String get reminderPresetNextWeek => 'Nächste Woche';

  @override
  String get reminderPresetOnTheDay => 'Am Tag selbst';

  @override
  String get reminderPresetDayBefore => '1 Tag vorher';

  @override
  String get reminderPresetWeekBefore => '1 Woche vorher';

  @override
  String get reminderPresetAtDeadline => 'Zur Frist';

  @override
  String get reminderPresetHourBefore => '1 Stunde vorher';

  @override
  String get editNextStepTitle => 'Empfohlener nächster Schritt';

  @override
  String get editNextStepSubtitle =>
      'Ein kurzer Satz zum nächsten sinnvollen Schritt.';

  @override
  String get editNextStepHint => 'Was ist der nächste sinnvolle Schritt?';

  @override
  String get editRemoveSuggestion => 'Vorschlag entfernen';

  @override
  String get editUrgencyTitle => 'Wie dringend ist das?';

  @override
  String get editStepHint => 'Eine konkrete Sache, die zu tun ist';

  @override
  String get editAddStep => 'Schritt hinzufügen';

  @override
  String get editDateHint => 'JJJJ-MM-TT';

  @override
  String get editRemoveDeadline => 'Frist entfernen';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Betrag speichern';

  @override
  String get editRemoveAmount => 'Betrag entfernen';

  @override
  String get securityTitle => 'Sicherheit & Privatsphäre';

  @override
  String get securitySectionProtection => 'Schutz';

  @override
  String get securityAppLockUnavailable =>
      'App-Sperre braucht eine Bildschirmsperre auf diesem Gerät. Richte zuerst in den Geräteeinstellungen eine PIN, ein Muster, ein Passwort oder einen Fingerabdruck ein.';

  @override
  String get securityAppLockOn =>
      'Action bittet dein Gerät zu bestätigen, dass du es bist.';

  @override
  String get securityAppLockOff =>
      'Fingerabdruck, Gesicht oder Geräte-PIN verlangen, um Action zu öffnen.';

  @override
  String get securityAskAgain => 'Erneut fragen';

  @override
  String get securityAskAgainDescription =>
      'Wie lange Action im Hintergrund sein darf, bevor es sperrt.';

  @override
  String get securityScreenPrivacy => 'Bildschirmschutz';

  @override
  String get securityScreenPrivacyDescription =>
      'Android bitten, Screenshots und Bildschirmaufnahmen zu blockieren und Action in der App-Übersicht zu verbergen.';

  @override
  String get securityPrivateReminders => 'Private Erinnerungen';

  @override
  String get securityPrivateRemindersOn =>
      'Erinnerungen sagen nur, dass etwas ansteht.';

  @override
  String get securityPrivateRemindersOff =>
      'Erinnerungen zeigen den Titel der Aufgabe. Schalte das ein, um ihn vom Sperrbildschirm fernzuhalten.';

  @override
  String get securityLockNow => 'Jetzt sperren';

  @override
  String get securityLockNowDescription => 'Die Tür schließen, ohne zu warten.';

  @override
  String get securitySectionStorage => 'Wie deine Daten gespeichert werden';

  @override
  String get securityStorageDataLabel =>
      'Deine Aufgaben, Erfassungen und Einstellungen';

  @override
  String get securityStorageDataDetail =>
      'Sie liegen im app-eigenen privaten Speicher, den andere Apps nicht lesen können und den Android im Rahmen der Geräteverschlüsselung verschlüsselt. Action legt keine zweite eigene Schicht darüber.';

  @override
  String get securityStorageKeyLabel => 'Dein Schlüssel für den KI-Anbieter';

  @override
  String get securityStorageKeyDetail =>
      'Im Android-Keystore abgelegt statt bei allem anderen, und nach dem Speichern nie wieder angezeigt.';

  @override
  String get securityStorageGapLabel => 'Was das nicht abdeckt';

  @override
  String get securityStorageGapDetail =>
      'Nichts davon schützt davor, dass jemand dein entsperrtes Gerät benutzt, und ein verändertes oder gerootetes System kann mehr lesen als ein normales. Die App-Sperre ist die Einstellung, die beim Ersten hilft.';

  @override
  String get securitySectionInformation => 'Deine Informationen';

  @override
  String get securityWhereInfoDescription =>
      'Jeder Weg, den deine Daten nehmen können, und die zwei, die dieses Gerät verlassen.';

  @override
  String get securityAppLockRefused =>
      'Nicht bestätigt, also hat sich nichts geändert.';

  @override
  String get securityAppLockUnavailableToast =>
      'Auf diesem Gerät ist keine Bildschirmsperre eingerichtet. Füge in den Geräteeinstellungen eine PIN, ein Muster, ein Passwort oder einen Fingerabdruck hinzu und versuch es dann erneut.';

  @override
  String get securityScreenPrivacyRefused =>
      'Dieses Gerät wollte den Bildschirmschutz nicht anwenden, deshalb wurde er ausgelassen statt als aktiv angezeigt.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count geplante Erinnerungen sagen jetzt weniger.',
      one: '1 geplante Erinnerung sagt jetzt weniger.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count geplante Erinnerungen aktualisiert.',
      one: '1 geplante Erinnerung aktualisiert.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Sofort';

  @override
  String get appLockDelayOneMinute => 'Nach 1 Minute';

  @override
  String get appLockDelayFiveMinutes => 'Nach 5 Minuten';

  @override
  String get securityDelayImmediatelyDescription =>
      'Jedes Mal, wenn Action den Bildschirm verlässt';

  @override
  String get securityDelayOneMinuteDescription =>
      'Lang genug, um eine Nachricht zu beantworten';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Lang genug für ein Telefonat';

  @override
  String get securityHeroProtected => 'Geschützt';

  @override
  String get securityHeroNothingOn => 'Nichts eingeschaltet';

  @override
  String get securityHeroFootnote =>
      'Alles hier arbeitet auf diesem Gerät. Keine dieser Einstellungen wird irgendwohin gesendet, und keine lässt sich aus der Ferne ändern.';

  @override
  String get securityHeadlineNone => 'Drei Schutzfunktionen stehen bereit';

  @override
  String securityHeadlineOne(String first) {
    return '$first ist an';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first und $second sind an';
  }

  @override
  String get securityHeadlineAll => 'Alle drei Schutzfunktionen sind an';

  @override
  String get securityTransfersTitle => 'Was dieses Gerät verlassen hat';

  @override
  String get securityTransfersNoProvider =>
      'Es ist kein KI-Anbieter verbunden, also wird überhaupt nichts zur Analyse gesendet.';

  @override
  String get securityTransfersDescription =>
      'Hier wird in dem Moment festgehalten, in dem etwas gesendet wird, ob eine Antwort kam oder nicht. Nur das Werkzeug, der Anbieter und die Größe — nie der Inhalt. 90 Tage lang auf diesem Gerät aufbewahrt und nirgendwohin gesendet.';

  @override
  String get securityClear => 'Löschen';

  @override
  String get securityNothingSent => 'Es wurde nichts gesendet';

  @override
  String get securityNothingSentDescription =>
      'Wenn du ein Werkzeug ausführst, das deinen KI-Anbieter nutzt, steht es hier.';

  @override
  String get securityClearHistoryTitle => 'Diesen Verlauf löschen?';

  @override
  String get securityClearHistoryBody =>
      'Die Aufzeichnung darüber, was gesendet wurde, wird von diesem Gerät gelöscht. Sie macht nichts rückgängig, was bereits gesendet wurde.';

  @override
  String get securityUnnamedTool => 'Ein Intelligence-Werkzeug';

  @override
  String get securityYourProvider => 'deinem KI-Anbieter';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '1 Seite',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'ein kurzer Text';

  @override
  String securityTransferCharacters(int count) {
    return '${count}k Zeichen';
  }

  @override
  String securitySentTo(String provider) {
    return 'An $provider gesendet.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'An $provider gesendet · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return 'vor $count W.';
  }

  @override
  String get helpTitle => 'Hilfe';

  @override
  String get helpAddQuestion => 'Was kann ich hinzufügen?';

  @override
  String get helpAddAnswer =>
      'Einen Screenshot, ein Foto von einem Brief oder einer Rechnung, oder Text, den du einfügst. Alles mit einem Datum, einem Betrag oder einer Aufforderung eignet sich am besten.';

  @override
  String get helpReviewQuestion => 'Warum bittet Action mich zu prüfen?';

  @override
  String get helpReviewAnswer =>
      'Weil eine Maschine, die ein Dokument liest, es falsch lesen kann, und eine Frist, die stillschweigend falsch ist, schlimmer ist als gar keine Frist. Action zeigt, was es gefunden hat und aus welchen Wörtern, und nichts wird gespeichert, bevor du es bestätigst.';

  @override
  String get helpVaryQuestion =>
      'Warum ändern sich die Ergebnisse, wenn ich es noch einmal versuche?';

  @override
  String get helpVaryAnswer =>
      'Der Dienst, der dein Dokument liest, ist nicht deterministisch, deshalb kann dieselbe Erfassung leicht anders zurückkommen. Auch deshalb gibt es den Prüfschritt — du bist der Teil, der sich nicht ändert.';

  @override
  String get helpLateQuestion => 'Warum kam meine Erinnerung zu spät?';

  @override
  String get helpLateAnswer =>
      'Erinnerungen werden über Android geplant, und Android entscheidet, wann genau es sie zustellt. Energiesparen, Doze und Herstellereinstellungen können jede davon verzögern. Action verspricht nie eine Erinnerung auf die Minute genau.';

  @override
  String get helpDataQuestion => 'Wo sind meine Daten?';

  @override
  String get helpDataAnswer =>
      'Fast alles davon liegt auf diesem Gerät: deine Erfassungen, Aufgaben, Schritte, Erinnerungen und Suchen. Zwei Ausnahmen — der Inhalt, den Action lesen soll, geht an den KI-Dienst, der ihn liest, und ein kurzer Datensatz einer bestätigten Aufgabe kann unter einer anonymen ID in der Cloud gespeichert werden. Privatsphäre & Daten in den Einstellungen listet genau auf, was dieser Datensatz enthält.';

  @override
  String get helpBackupQuestion => 'Ist das eine Sicherung?';

  @override
  String get helpBackupAnswer =>
      'Nein. Der Cloud-Datensatz lässt sich nicht auf ein neues Gerät zurückspielen, und es gibt kein Konto zum Anmelden. Wenn du Action deinstallierst oder dieses Gerät verlierst, sind die Daten darauf weg.';

  @override
  String get helpCorrectQuestion => 'Wie korrigiere ich eine Aufgabe?';

  @override
  String get helpCorrectAnswer =>
      'Öffne sie und bearbeite jedes Feld — den Titel, die Frist, den Betrag oder den vorgeschlagenen nächsten Schritt. Du kannst Schritte jederzeit hinzufügen, umsortieren, abschließen und löschen. Eine Aufgabe zu bearbeiten fragt den KI-Dienst nie etwas.';

  @override
  String get privacyTitle => 'Privatsphäre & Daten';

  @override
  String get privacyIntro =>
      'Action behält so viel wie möglich auf diesem Gerät. Zwei Dinge sind Ausnahmen, und beide stehen unten.';

  @override
  String get privacyGroupOnDevice => 'Auf diesem Gerät';

  @override
  String get privacyOnDeviceCaptures =>
      'Erfassungen — die Screenshots, Fotos und Texte, die du hinzufügst, und der daraus gelesene Text.';

  @override
  String get privacyOnDeviceActions =>
      'Aufgaben, ihre Schritte, Angaben und Erinnerungen.';

  @override
  String get privacyOnDeviceSearch =>
      'Suche. Deine Suchen laufen hier, werden nirgendwohin gesendet und werden nach dem Schließen des Bildschirms nicht aufbewahrt.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Fotos werden ohne ihren Ort gespeichert. Die Koordinaten, die Uhrzeit und die Kameradaten, die ein Telefon in ein Bild schreibt, werden entfernt, bevor die Erfassung gesichert wird — sie bleiben also nicht hier und sind auch nicht dabei, wenn du eine Erfassung an deinen KI-Anbieter schickst.';

  @override
  String get privacyGroupSentToRead => 'Zum Lesen gesendet';

  @override
  String get privacySentToReadWhat =>
      'Wenn du Action bittest, eine Erfassung zu deuten, wird dieser Inhalt an den KI-Dienst gesendet, der ihn liest. Das ist keine KI auf dem Gerät.';

  @override
  String get privacySentToReadWhen =>
      'Gesendet wird nur die Erfassung, die du gewählt hast, und nur wenn du darum bittest.';

  @override
  String get privacyGroupYourProvider =>
      'An deinen eigenen KI-Anbieter gesendet';

  @override
  String get privacyProviderWhat =>
      'Wenn du in den Einstellungen einen KI-Anbieter verbindest, senden die Intelligence-Werkzeuge den von dir gewählten Inhalt an diesen Anbieter — OpenAI, Anthropic, Google oder einen Endpunkt, den du gewählt hast — mit deinem eigenen API-Schlüssel.';

  @override
  String get privacyProviderDirect =>
      'Es geht direkt an sie. Es läuft über keinen Server, der zu Action gehört.';

  @override
  String get privacyProviderScope =>
      'Gesendet wird nur, was du für ein Werkzeug auswählst, und nur wenn du es ausführst. Deine anderen Aufgaben, Erfassungen und Quellen sind nie dabei, und im Hintergrund wird nie etwas gesendet.';

  @override
  String get privacyProviderKey =>
      'Dein API-Schlüssel liegt im sicheren Speicher dieses Geräts und wird nur an den Anbieter gesendet, zu dem er gehört. Sicherer Speicher ist ein echtes Hindernis für jemanden mit deinem entsperrten Gerät, aber er ist nicht absolut, und Action behauptet nichts anderes.';

  @override
  String get privacyProviderLocalTools =>
      'Zwei Werkzeuge senden nie etwas: sensible Angaben verbergen und prüfen, woher eine Datei stammt. Beide laufen vollständig auf diesem Gerät.';

  @override
  String get privacyProviderAgreement =>
      'Was dein Anbieter mit dem macht, was du sendest, richtet sich nach deiner Vereinbarung mit ihm, nicht nach Action.';

  @override
  String get privacyGroupCloud => 'In der Cloud gespeichert';

  @override
  String get privacyCloudWhat =>
      'Wenn du eine Aufgabe bestätigst, kann ein kurzer Datensatz davon unter einer anonymen ID dieser Installation gespeichert werden: Titel, Status, Dringlichkeit, Kategorie, Frist, Betrag, vorgeschlagener nächster Schritt und Zeitstempel.';

  @override
  String get privacyCloudNotSent =>
      'Deine Erfassungen, der daraus gelesene Text, die Schritte und Angaben einer Aufgabe sowie deine Erinnerungen werden nicht gesendet.';

  @override
  String get privacyCloudNotBackup =>
      'Das ist keine Sicherung. Es gibt keinen Weg, es auf ein neues Gerät zurückzuspielen, und mit dieser Installation geht auch die anonyme ID verloren.';

  @override
  String get privacyGroupDiagnostics => 'Diagnose';

  @override
  String get privacyDiagnosticsWhat =>
      'Action zählt anonym, was in der App passiert — dass eine Erfassung begonnen wurde, dass eine Auswertung geklappt hat oder nicht, dass eine Suche nichts fand, dass eine Aufgabe abgeschlossen wurde.';

  @override
  String get privacyDiagnosticsCounts =>
      'Das sind Zählungen, keine Inhalte. Kein Titel, kein Betrag, keine Frist, kein Aktenzeichen, kein erfasster Text und kein Suchbegriff ist je dabei, und auch nicht die anonyme ID oder irgendeine Kennung einer Aufgabe oder Erfassung.';

  @override
  String get privacyDiagnosticsCrash =>
      'Wenn die App abstürzt, werden der Fehler und die Stelle gemeldet, damit er behoben werden kann. Action hängt deine Daten diesen Berichten nicht an.';

  @override
  String get privacySectionYourData => 'Deine Daten';

  @override
  String get privacyYourDataFootnote =>
      'Erfassungen zu löschen lässt deine Aufgaben unberührt. Eine Aufgabe, deren Erfassung weg ist, funktioniert weiterhin; sie zeigt nur nicht mehr, woraus sie entstanden ist.';

  @override
  String get privacyClearCaptures => 'Erfassungen löschen';

  @override
  String get privacyClearCapturesDescription =>
      'Löscht jede Erfassung und ihre Bilddatei.';

  @override
  String get privacyDeleteAll => 'Alle meine Daten löschen';

  @override
  String get privacyDeleteAllDescription =>
      'Aufgaben, Schritte, Erinnerungen, Erfassungen und die Cloud-Datensätze oben.';

  @override
  String get privacyClearCapturesTitle => 'Erfassungen löschen?';

  @override
  String get privacyClearCapturesBody =>
      'Jede Erfassung und ihr Bild werden von diesem Gerät gelöscht. Deine Aufgaben bleiben genau so, wie sie sind.';

  @override
  String get privacyCapturesDeleted => 'Erfassungen gelöscht.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Einige Erfassungen konnten nicht gelöscht werden. Sonst wurde nichts geändert.';

  @override
  String get privacyDeleteAllTitle => 'Alle deine Daten löschen?';

  @override
  String get privacyDeleteAllBody =>
      'Das löscht jede Aufgabe, jeden Schritt, jede Erinnerung und jede Erfassung auf diesem Gerät sowie die oben aufgeführten Cloud-Datensätze. Es lässt sich nicht rückgängig machen, und es gibt keine Sicherung zum Wiederherstellen.';

  @override
  String get privacyDeleteEverything => 'Alles löschen';

  @override
  String get privacyDeletedAll => 'Alles wurde gelöscht.';

  @override
  String get privacyDeleteFailed =>
      'Deine Daten konnten nicht gelöscht werden.';

  @override
  String get privacyDeletedUnverified =>
      'Alles auf diesem Gerät wurde gelöscht. Action konnte die Cloud nicht erreichen, um zu bestätigen, dass dort nichts übrig ist, und wird erneut nachsehen.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Gelöscht, bis auf $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action versucht es erneut.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action konnte die Prüfung der Cloud nicht abschließen und versucht es erneut.';

  @override
  String get privacyLeftoverCaptures => 'einige Erfassungen';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Cloud-Datensätze',
      one: '1 Cloud-Datensatz',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first und $second';
  }

  @override
  String get privacyCloudDeleted => 'Die Cloud-Datensätze wurden gelöscht.';

  @override
  String get privacyCloudUnreachable =>
      'Sie waren weiterhin nicht erreichbar. Action versucht es erneut.';

  @override
  String get privacyPendingTitle => 'Noch zu löschen';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Cloud-Datensätze waren beim letzten Mal nicht erreichbar. Action versucht es von selbst erneut, oder du versuchst es jetzt.',
      one: '1 Cloud-Datensatz war beim letzten Mal nicht erreichbar. Action versucht es von selbst erneut, oder du versuchst es jetzt.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Erneut versuchen';

  @override
  String get evidenceTitle => 'Woher das stammt';

  @override
  String get evidenceUnverified =>
      'Action konnte diese Wörter im gelesenen Text nicht finden, daher wurde dieser Wert nicht überprüft. Vergleiche ihn mit dem Original, bevor du dich darauf verlässt.';

  @override
  String get evidenceHighlighted =>
      'Diese Wörter standen in dem Text, den Action aus dieser Erfassung gelesen hat, und die Markierung zeigt, wo.';

  @override
  String get evidenceNoRegion =>
      'Diese Wörter standen in dem Text, den Action aus dieser Erfassung gelesen hat. Wo genau sie auf dem Bild sitzen, ließ sich nicht ermitteln, und es wird nicht geraten.';

  @override
  String get evidenceInText =>
      'Diese Wörter standen in dem Text, den diese Erfassung enthält.';

  @override
  String get sourceCapturedAtFormat => 'd. MMM, HH:mm';

  @override
  String get urgencyCritical => 'Kritisch';

  @override
  String get urgencyImportant => 'Wichtig';

  @override
  String get urgencyNormal => 'Normal';

  @override
  String get urgencyLow => 'Niedrig';

  @override
  String get urgencyUnsure => 'Nicht sicher';

  @override
  String get detailSaveFailed =>
      'Das wurde nicht gesichert. Nichts ging verloren — versuch es erneut.';

  @override
  String get detailSectionCreatedFrom => 'Entstanden aus';

  @override
  String get detailSourceChecking =>
      'Die ursprüngliche Erfassung wird abgerufen…';

  @override
  String get detailSourceUnavailable =>
      'Die ursprüngliche Erfassung ist nicht mehr verfügbar.';

  @override
  String get detailReopenAction => 'Aufgabe wieder öffnen';

  @override
  String get detailMarkActionComplete => 'Aufgabe als erledigt markieren';

  @override
  String get detailGetHelp => 'Hilfe zu dieser Aufgabe';

  @override
  String get detailSectionHistory => 'Verlauf';

  @override
  String get detailHistoryShowLess => 'Weniger anzeigen';

  @override
  String detailHistoryShowAll(int count) {
    return 'Alle $count Einträge anzeigen';
  }

  @override
  String get detailHistoryCreated => 'Erstellt';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Erstellt mit $count Schritten',
      one: 'Erstellt mit 1 Schritt',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'Du hast die Angaben bestätigt';

  @override
  String detailHistoryStepFinished(String title) {
    return '„$title“ erledigt';
  }

  @override
  String get detailHistoryAStep => 'ein Schritt';

  @override
  String get detailHistoryReminderSet => 'Du hast eine Erinnerung gesetzt';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'Du hast eine Erinnerung für $when gesetzt';
  }

  @override
  String get detailHistoryCompleted => 'Als erledigt markiert';

  @override
  String get detailHistoryChanged => 'Zuletzt geändert';

  @override
  String get detailHistoryTimestampFormat => 'd. MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Eigener Endpunkt (OpenAI-kompatibel)';

  @override
  String get aiCapabilityText => 'Text';

  @override
  String get aiCapabilityImages => 'Bilder';

  @override
  String get aiCapabilityDocuments => 'Dokumente';

  @override
  String get aiCapabilityStructuredResults => 'strukturierte Ergebnisse';

  @override
  String get aiCapabilityStreaming => 'Streaming';

  @override
  String get aiCapabilitySystemInstructions => 'Systemanweisungen';

  @override
  String get aiCapabilityEvidenceCitations => 'Belegzitate';

  @override
  String get aiCapabilityLongDocuments => 'lange Dokumente';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a oder $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head oder $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'Verbinde einen KI-Anbieter, um dieses Werkzeug zu nutzen.';

  @override
  String get aiFailureInvalidKey =>
      'Dieser API-Schlüssel wurde vom Anbieter nicht akzeptiert.';

  @override
  String get aiFailureQuotaExceeded =>
      'Dein Konto beim Anbieter hat kein Guthaben mehr oder hat sein Kontingent erreicht.';

  @override
  String get aiFailureRateLimited =>
      'Dein Anbieter drosselt gerade die Anfragen. Versuch es gleich noch einmal.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action konnte deinen KI-Anbieter nicht erreichen. Prüfe deine Verbindung.';

  @override
  String get aiFailureUnsupportedModel =>
      'Dieses Modell ist für deinen Schlüssel nicht verfügbar. Wähle in den Einstellungen ein anderes.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'Das von dir gewählte Modell kann $capabilities nicht lesen. Wähle in den Einstellungen ein anderes Modell.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'Das war zu viel Inhalt, als dass dieses Modell ihn auf einmal lesen könnte.';

  @override
  String get aiFailureInputTooLargeText =>
      'Das ist mehr Text, als auf einmal ausgewertet werden kann.';

  @override
  String get aiFailureProviderUnavailable =>
      'Dein KI-Anbieter hat gerade Probleme. Versuch es gleich noch einmal.';

  @override
  String get aiFailureMalformedResponse =>
      'Dieser Anbieter hat etwas zurückgeschickt, das Action nicht lesen konnte.';

  @override
  String get aiFailureCancelled => 'Gestoppt.';

  @override
  String get aiFailureInsecureEndpoint =>
      'Dieser Endpunkt muss eine https://-Adresse sein.';

  @override
  String get aiFailureUnknown =>
      'Bei der Kommunikation mit deinem KI-Anbieter ist etwas schiefgelaufen.';

  @override
  String get appLockTitle => 'Action ist gesperrt';

  @override
  String get appLockPrompt =>
      'Bestätige, dass du es bist, um fortzufahren. Action bittet dein Gerät darum — deinen Fingerabdruck, dein Gesicht oder deine PIN sieht Action nie.';

  @override
  String get appLockUnlocking => 'Wird entsperrt…';

  @override
  String get appLockNotConfirmed =>
      'Das wurde nicht bestätigt. Versuch es erneut, wenn du so weit bist.';

  @override
  String get appLockCannotConfirm =>
      'Dein Gerät kann gerade nicht bestätigen, dass du es bist. Prüfe in den Geräteeinstellungen, ob noch eine Bildschirmsperre eingerichtet ist.';

  @override
  String get appLockWaiting => 'Warten…';

  @override
  String get appLockUnlock => 'Entsperren';

  @override
  String get appLockReasonUnlock => 'Action entsperren';

  @override
  String get appLockReasonEnable =>
      'Bestätige, dass du es bist, um die App-Sperre einzuschalten';

  @override
  String get appLockReasonDisable =>
      'Bestätige, dass du es bist, um die App-Sperre auszuschalten';

  @override
  String get todayCapabilityHeading => 'Was Action übernimmt';

  @override
  String get todayCapabilityDocumentTitle => 'Ein Brief oder eine Rechnung';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action liest das und findet die Frist, den Betrag und die Referenznummer.';

  @override
  String get todayCapabilityScreenshotTitle => 'Ein Screenshot';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Mach aus einer Nachricht, die du sonst vergessen würdest, etwas, das du angehen kannst.';

  @override
  String get todayCapabilityTextTitle => 'Etwas Text';

  @override
  String get todayCapabilityTextBlurb =>
      'Füge irgendetwas ein. Action findet heraus, was es ist und was es von dir verlangt.';

  @override
  String get todayCapabilityConfirmTitle => 'Du bestätigst alles';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Nichts wird zu einer Aufgabe, bevor du den Beleg gesehen und Ja gesagt hast.';

  @override
  String get todayCapabilityExploreIntelligence => 'Intelligenz erkunden';

  @override
  String get documentRejectedEmpty => 'Diese Datei ist leer.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'Dieses Dokument ist $size groß und damit größer, als Action verarbeiten kann.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'Das ist kein PDF, egal wie die Datei heißt. Action liest PDFs und Bilder.';

  @override
  String get documentRejectedUnreadable =>
      'Dieses Dokument konnte nicht gelesen werden.';

  @override
  String get pdfRejectedNotAPdf =>
      'Diese Datei ist kein PDF, egal wie sie heißt.';

  @override
  String get pdfRejectedEncrypted =>
      'Dieses PDF ist mit einem Passwort geschützt, deshalb kann Action es nicht lesen.';

  @override
  String get pdfRejectedDamaged =>
      'Dieses PDF konnte nicht gelesen werden. Es ist möglicherweise unvollständig.';

  @override
  String get shareRejectedEmpty =>
      'In diesem geteilten Inhalt war nichts zu lesen.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action nimmt Text, Bilder und PDFs. Das war etwas anderes.';

  @override
  String get shareRejectedContentMismatch =>
      'Diese Datei ist nicht das, was sie zu sein vorgibt, deshalb hat Action sie nicht geöffnet.';

  @override
  String get shareRejectedTooLarge =>
      'Diese Datei ist zu groß, als dass Action damit arbeiten könnte.';

  @override
  String get shareRejectedUnreadable =>
      'Diese Datei konnte nicht gelesen werden.';

  @override
  String get captureFailureRecognition =>
      'Die Texterkennung konnte nicht ausgeführt werden.';

  @override
  String get captureFailureImageFormat =>
      'Dieses Bildformat konnte auf diesem Gerät nicht gelesen werden.';

  @override
  String get connectSheetTitle => 'Deine KI verbinden';

  @override
  String get connectSheetSubtitle =>
      'Du nutzt dein eigenes Konto beim Anbieter und deinen eigenen API-Schlüssel. Action legt den Schlüssel im sicheren Speicher dieses Geräts ab.';

  @override
  String get connectErrorKeyMissing =>
      'Füge deinen API-Schlüssel ein, um fortzufahren.';

  @override
  String get connectErrorModelMissing =>
      'Wähle ein Modell oder tippe eine Modell-ID ein.';

  @override
  String get connectErrorEndpointMissing =>
      'Füge die Adresse deines Endpunkts hinzu.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'Der sichere Speicher dieses Geräts ließ sich nicht öffnen, deshalb wurde der Schlüssel nicht gespeichert.';

  @override
  String get connectTestSucceeded => 'Verbunden.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Verbunden. $count Modelle verfügbar.';
  }

  @override
  String get connectProviderLabel => 'Anbieter';

  @override
  String get connectEndpointLabel => 'Endpunkt';

  @override
  String get connectEndpointHttpsNote =>
      'Muss eine https://-Adresse sein. Action sendet deine Dokumente nicht über eine unverschlüsselte Verbindung.';

  @override
  String get connectApiKeyLabel => 'API-Schlüssel';

  @override
  String get connectApiKeyHint => 'Deinen Schlüssel einfügen';

  @override
  String get connectKeyPrivacyNote =>
      'Dein Schlüssel bleibt auf diesem Gerät. Action sendet ihn nie irgendwohin außer an den Anbieter, den du gewählt hast, und kann ihn dir nach dem Speichern nicht wieder anzeigen.';

  @override
  String get connectModelLabel => 'Modell';

  @override
  String get connectModelIdHint => 'Modell-ID';

  @override
  String get connectModelFreeTextNote =>
      'Anbieter nehmen Modell-IDs außer Betrieb und fügen neue hinzu. Wenn die gewünschte nicht aufgeführt ist, tippe sie hier ein.';

  @override
  String get connectAndTest => 'Verbinden und testen';

  @override
  String get connectSaveWithoutTesting => 'Ohne Test speichern';

  @override
  String get toolWarningFactsNotChecked =>
      'Action konnte das nicht mit dem ursprünglichen Text vergleichen, deshalb wurden die Beträge und Daten darin nicht geprüft.';

  @override
  String get toolTitleRewrite => 'Diesen Text verbessern';

  @override
  String get toolDescriptionRewrite =>
      'Klarer, kürzer oder förmlicher — die Fakten bleiben erhalten.';

  @override
  String get toolModeRewriteClearer => 'Klarer';

  @override
  String get toolModeRewriteProfessional => 'Professioneller';

  @override
  String get toolModeRewriteShorter => 'Kürzer';

  @override
  String get toolModeRewritePersuasive => 'Überzeugender';

  @override
  String get toolModeRewriteSimpler => 'Einfacher';

  @override
  String get toolModeRewriteStructured => 'Strukturierter';

  @override
  String get toolModeRewriteGrammarOnly => 'Nur Grammatik';

  @override
  String get toolSectionWhatChanged => 'Was geändert wurde';

  @override
  String get toolSectionNote => 'Hinweis';

  @override
  String get toolSectionAlreadyClearBody =>
      'Das war schon klar. Die Änderungen unten sind geringfügig.';

  @override
  String get toolSectionImprovedText => 'Verbesserter Text';

  @override
  String get toolTitleDraftReply => 'Eine Antwort entwerfen';

  @override
  String get toolDescriptionDraftReply =>
      'Eine Antwort, die du bearbeiten und selbst versenden kannst.';

  @override
  String get toolModeReplyProfessional => 'Professionell';

  @override
  String get toolModeReplyConcise => 'Prägnant';

  @override
  String get toolModeReplyFriendly => 'Freundlich';

  @override
  String get toolModeReplyFormal => 'Förmlich';

  @override
  String get toolModeReplyClarification => 'Um Klärung bitten';

  @override
  String get toolModeReplyConfirmation => 'Empfang bestätigen';

  @override
  String get toolModeReplyDispute => 'Widersprechen';

  @override
  String get toolSectionSubject => 'Betreff';

  @override
  String get toolSectionDraftReply => 'Antwortentwurf';

  @override
  String get toolSectionPlaceholders => 'Das musst du ausfüllen';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Entwurf — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'Das ist ein Entwurf. Action versendet nichts — lies ihn, bearbeite ihn und versende ihn selbst.';

  @override
  String get toolTitleTranslate => 'Übersetzen';

  @override
  String get toolDescriptionTranslate =>
      'Eine andere Sprache, wobei Zahlen und Namen erhalten bleiben.';

  @override
  String get toolSectionTranslation => 'Übersetzung';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'Von $from nach $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'Im Original belassen';

  @override
  String get toolWarningTranslationNotCertified =>
      'Eine Übersetzung zum Verstehen, keine beglaubigte Übersetzung.';

  @override
  String get toolTitleStructuredData => 'Eine Tabelle herausziehen';

  @override
  String get toolDescriptionStructuredData =>
      'Zeilen, Felder und Zahlen, die du herauskopieren kannst.';

  @override
  String get toolSectionTable => 'Tabelle';

  @override
  String get toolSectionFields => 'Felder';

  @override
  String get toolSectionTableCsv => 'Tabelle (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'Das Spaltenlayout dieser Tabelle konnte nicht zuverlässig gelesen werden. Prüfe, ob die Zeilen richtig zusammenpassen, bevor du sie verwendest.';

  @override
  String get toolTitleDeadlineFinder => 'Fristen finden';

  @override
  String get toolDescriptionDeadlineFinder =>
      'Was fällig ist, wann, und was passiert, wenn es nicht erledigt wird.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fristen',
      one: '1 Frist',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Nichts fällig';

  @override
  String get toolSectionNothingDueBody =>
      'Action hat in diesem Material keine Fristen oder Verpflichtungen gefunden.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'Nichts wird eingeplant, bevor du es wählst. Erinnerungen werden nie automatisch gesetzt.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'Wenn nicht: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'Du brauchst: $items';
  }

  @override
  String get moneyErrorEmpty => 'kein Betrag angegeben';

  @override
  String get moneyErrorMalformed => 'der Betrag ist keine einfache Zahl';

  @override
  String get moneyErrorNegative =>
      'ein negativer Betrag ist keine zahlbare Summe';

  @override
  String get moneyErrorTooManyDecimals =>
      'mehr Nachkommastellen, als die Währung hat';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'der Währungscode ist keiner, den wir kennen';

  @override
  String get moneyErrorOutOfRange => 'der Betrag ist unplausibel groß';

  @override
  String get escalationOcrFailed =>
      'Die Erkennung konnte bei dieser Erfassung überhaupt nicht ausgeführt werden.';

  @override
  String get escalationNoTextRecognised =>
      'Das sieht nach einem Dokument aus, aber es wurde kein Text erkannt.';

  @override
  String get escalationThinText =>
      'Für ein Dokument dieser Größe wurde viel zu wenig Text erkannt.';

  @override
  String get escalationLowLineConfidence =>
      'Die Texterkennung hat für mehrere Zeilen eine geringe Sicherheit gemeldet.';

  @override
  String get escalationTableLikeLayout =>
      'Das Layout sieht nach einer Tabelle aus, und beim zeilenweisen Lesen geht verloren, welcher Wert zu welcher Zeile gehört.';

  @override
  String get escalationFragmentedLayout =>
      'Der Text kam in vielen winzigen Fragmenten zurück, deshalb ist die Struktur unklar.';

  @override
  String get escalationMalformedText =>
      'Ein großer Teil des erkannten Textes besteht nicht aus lesbaren Wörtern oder Zahlen.';

  @override
  String get escalationConflictingDates =>
      'Mehr als ein Datum wird als Frist dargestellt.';

  @override
  String get escalationConflictingAmounts =>
      'Mehr als ein Betrag wird als fällige Summe dargestellt.';

  @override
  String get escalationUnresolvedGrounding =>
      'Einige Werte ließen sich nicht auf den Text des Dokuments zurückführen.';

  @override
  String get escalationInstructionLikeContent =>
      'Das Dokument enthält Text, der wie Anweisungen an die App geschrieben ist. Er wird als Dokumentinhalt behandelt, nie als Anweisungen.';

  @override
  String get providerFailureNetwork =>
      'Action konnte den Dienst nicht erreichen. Prüfe deine Verbindung.';

  @override
  String get providerFailureTimedOut =>
      'Der Dienst hat zu lange für eine Antwort gebraucht.';

  @override
  String get providerFailureServiceUnavailable =>
      'Der Dienst ist vorübergehend nicht verfügbar. Versuch es später erneut.';

  @override
  String get providerFailureUnauthorized =>
      'Diese App ist gerade nicht berechtigt, den Dienst zu nutzen.';

  @override
  String get providerFailureBlocked =>
      'Der Dienst hat es abgelehnt, dieses Dokument zu verarbeiten.';

  @override
  String get providerFailureUnknown =>
      'Action konnte dieses Dokument nicht lesen. Ein erneuter Versuch klappt vielleicht.';

  @override
  String get reviewBlockerTitle => 'Gib dieser Aufgabe einen Titel.';

  @override
  String get reviewBlockerDate =>
      'Wähle, welches Datum die tatsächliche Frist ist, oder lass es offen.';

  @override
  String get reviewBlockerAmount =>
      'Wähle, welcher Betrag richtig ist, oder lass es offen.';

  @override
  String get reviewBlockerStepTitle =>
      'Schritte, die du behältst, brauchen einen Titel.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'Seite $page',
      one: 'Seite 1',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'Seiten $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Die Überarbeitung enthält $values nicht mehr. Prüfe sie, bevor du sie verwendest.',
      one:
          'Die Überarbeitung enthält $values nicht mehr. Prüfe sie, bevor du sie verwendest.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Die Überarbeitung enthält $values und $count weitere Werte nicht mehr. Prüfe sie, bevor du sie verwendest.',
      one:
          'Die Überarbeitung enthält $values und 1 weiteren Wert nicht mehr. Prüfe sie, bevor du sie verwendest.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Erreicht';

  @override
  String get goalNewSheetTitle => 'Was willst du erreichen?';

  @override
  String get goalNewSheetSubtitle =>
      'Ein Satz reicht. Die Details kannst du danach ergänzen.';

  @override
  String get goalTitleHint =>
      'Die Autoversicherung verlängern, ohne zu viel zu zahlen.';

  @override
  String get goalCreateAction => 'Ziel erstellen';

  @override
  String get goalTitleSheetTitle => 'Was du willst';

  @override
  String get goalOutcomeSheetTitle => 'Was erledigt bedeutet';

  @override
  String get goalContextSheetTitle => 'Wo es gerade steht';

  @override
  String get goalOutcomeHint =>
      'Das Auto ist versichert und die Unterlagen sind abgelegt.';

  @override
  String get goalContextHint =>
      'Ich habe zwei Angebote und die Verlängerung ist am 18.';

  @override
  String get goalWorkspaceTitle => 'Ziel';

  @override
  String get goalUnmarkReached => 'Doch nicht erreicht';

  @override
  String get goalMarkReached => 'Als erreicht markieren';

  @override
  String get goalNotFound => 'Dieses Ziel gibt es nicht mehr.';

  @override
  String get goalDeleteTitle => 'Dieses Ziel löschen?';

  @override
  String get goalDeleteBody =>
      'Das Ziel wird von diesem Gerät entfernt. Alle Aufgaben, die daraus entstanden sind, bleiben genau so, wie sie sind.';

  @override
  String get goalOutcomeLabel => 'Was erledigt bedeutet';

  @override
  String get goalOutcomeEmpty =>
      'Noch nicht geschrieben. Ein Ziel lässt sich leichter planen, wenn du gesagt hast, was es bedeutet, es abzuschließen.';

  @override
  String get goalContextLabel => 'Wie es steht';

  @override
  String get goalContextEmpty =>
      'Noch nichts geschrieben. Was bisher passiert ist, und was im Weg steht.';

  @override
  String get goalTitleLabel => 'Was du willst';

  @override
  String get goalEditTooltip => 'Ziel bearbeiten';

  @override
  String get goalToolsLabel => 'Was Action kann';

  @override
  String get goalToolsNotReady =>
      'Schreib etwas mehr darüber, was du willst, dann haben diese Werkzeuge etwas, womit sie arbeiten können.';

  @override
  String get toolGoalOptimizerTitle => 'Ein Ziel schärfen';

  @override
  String get toolActionPlanTitle => 'Einen Plan bauen';

  @override
  String get resultFactUnconfirmed => 'Unbestätigt';

  @override
  String get resultSuggestedSteps => 'Vorgeschlagene Schritte';

  @override
  String get resultSuggestedAction => 'Vorgeschlagene Aufgabe';

  @override
  String get resultWorthAsking => 'Fragen, die sich lohnen';

  @override
  String get resultSuggestedDeadlines => 'Vorgeschlagene Fristen';

  @override
  String get resultSuggestions => 'Vorschläge';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count belegende Zitate',
      one: '1 belegendes Zitat',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'Aus der gewählten Quelle';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Dein Dokument wird vorbereitet';

  @override
  String get toolRunStageReading => 'Die gewählten Seiten werden gelesen';

  @override
  String get toolRunStageAnalysing => 'Wird analysiert';

  @override
  String get toolRunStageBuilding => 'Deine Prüfung wird zusammengestellt';

  @override
  String get toolRunStageDone => 'Abgeschlossen';

  @override
  String get toolRunStageFailed => 'Das ist nicht fertig geworden';

  @override
  String get toolRunStageCancelled => 'Von dir gestoppt';

  @override
  String get toolRunFailureLocalCheckFailed =>
      'Das konnte nicht geprüft werden.';

  @override
  String get toolRunFailureProviderRetired =>
      'Dieser KI-Anbieter ist in dieser Version nicht mehr verfügbar.';

  @override
  String get toolRunFailureUnusableReply =>
      'Diese Antwort kam nicht in einer verwendbaren Form zurück. Versuch es erneut.';

  @override
  String get toolRunFailureQuestionRequired => 'Tippe zuerst eine Frage ein.';

  @override
  String get toolRunFailureInputRequired =>
      'Wähle etwas aus, womit dieses Werkzeug arbeiten soll.';

  @override
  String get toolWarningReplyTruncated =>
      'Diese Antwort wurde abgeschnitten, sie ist also möglicherweise unvollständig.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Dein Modell hat keine belegenden Zitate zurückgegeben, also ist hier nichts belegt. Prüfe es gegen das Dokument, bevor du danach handelst.';

  @override
  String get aiSettingsRemoveTitle => 'Diese Verbindung entfernen?';

  @override
  String get aiSettingsRemoveBody =>
      'Action löscht deinen API-Schlüssel von diesem Gerät und nutzt keine KI-Funktionen mehr. Dein Konto beim Anbieter ist davon nicht betroffen.';

  @override
  String get aiSettingsProviderLabel => 'Anbieter';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'Abgerechnet wird von deinem Anbieter, nach dem, was du nutzt. Action stellt nie von selbst eine Anfrage.';

  @override
  String get aiSettingsConnectLabel => 'Einen KI-Anbieter verbinden';

  @override
  String get aiSettingsConnectDescription =>
      'Nutze dein eigenes Konto und deinen API-Schlüssel bei OpenAI, Anthropic, Google Gemini oder einem kompatiblen Endpunkt.';

  @override
  String get aiSettingsModelLabel => 'Modell';

  @override
  String get aiSettingsEndpointLabel => 'Endpunkt';

  @override
  String get aiSettingsApiKeyLabel => 'API-Schlüssel';

  @override
  String get aiSettingsKeyStored =>
      'Im sicheren Speicher dieses Geräts abgelegt.';

  @override
  String get aiSettingsKeyMissing =>
      'Auf diesem Gerät wurde kein Schlüssel gefunden. Verbinde erneut, um einen hinzuzufügen.';

  @override
  String get aiSettingsTestLabel => 'Verbindung testen';

  @override
  String get aiSettingsProviderUnavailable =>
      'Dieser Anbieter ist in dieser Version nicht verfügbar.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Verbunden. $count Modelle verfügbar.';
  }

  @override
  String get aiSettingsTestButton => 'Testen';

  @override
  String get aiSettingsChangeProvider => 'Anbieter oder Modell ändern';

  @override
  String get aiSettingsRemoveKey => 'Schlüssel entfernen';

  @override
  String get aiSettingsSectionPrivacy => 'Privatsphäre';

  @override
  String get aiSettingsWhatGetsSentLabel => 'Was gesendet wird';

  @override
  String get aiSettingsWhereItGoesLabel => 'Wohin es geht';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'Es wird nichts gesendet, bis du einen Anbieter verbindest.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Direkt an $provider, mit deinem Schlüssel. Es läuft über keinen Server, der zu Action gehört.';
  }

  @override
  String get aiSettingsSectionData => 'Daten';

  @override
  String get aiSettingsDataFootnote =>
      'Action merkt sich, welche Werkzeuge du genutzt hast, nie, worauf du sie angewendet hast.';

  @override
  String get aiSettingsRecentToolsLabel => 'Zuletzt verwendete Werkzeuge';

  @override
  String get aiSettingsRecentToolsNone => 'Keine';

  @override
  String get reminderNotificationTitle => 'Action-Erinnerung';

  @override
  String get reminderNotificationPrivateBody => 'Du hast etwas zu prüfen.';

  @override
  String get reminderChannelName => 'Action-Erinnerungen';

  @override
  String get reminderChannelDescription =>
      'Erinnerungen, die du dir selbst für deine Aufgaben setzt.';

  @override
  String get onboardingStart => 'Action nutzen';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'Schritt $current von $total';
  }

  @override
  String get onboardingCaptureTitle => 'Aus Informationen Aufgaben machen';

  @override
  String get onboardingCaptureBody =>
      'Füge einen Screenshot, ein Foto oder Text hinzu, den du bekommen hast. Action liest es und findet heraus, was es von dir verlangt.';

  @override
  String get onboardingReviewTitle =>
      'Nichts wird gespeichert, bevor du es bestätigst';

  @override
  String get onboardingReviewBody =>
      'Action zeigt dir, was es gefunden hat und aus welchen Wörtern. Du korrigierst, was falsch ist. Bis du bestätigst, ist es ein Vorschlag — keine Tatsache und keine Aufgabe.';

  @override
  String get onboardingTrackingTitle => 'Behalte im Blick, worauf es ankommt';

  @override
  String get onboardingTrackingBody =>
      '„Braucht Aufmerksamkeit“ holt nach vorn, was überfällig ist oder nah dran. Jede Aufgabe behält ihren nächsten Schritt, ihren Fortschritt und jede Erinnerung, die du dafür gesetzt hast.';

  @override
  String get onboardingPrivacyBody => 'Gut zu wissen, bevor du anfängst:';

  @override
  String get onboardingPrivacyOnDevice =>
      'Deine Aufgaben, Erfassungen, Erinnerungen und Suchen werden auf diesem Gerät gespeichert. Suche und Erinnerungen funktionieren ohne Verbindung.';

  @override
  String get onboardingPrivacySentToRead =>
      'Wenn du Action bittest, etwas zu lesen, wird dieser Inhalt an den KI-Dienst gesendet, der ihn deutet.';

  @override
  String get onboardingPrivacyCloud =>
      'Ein kurzer Datensatz einer bestätigten Aufgabe — Titel, Daten, Betrag und vorgeschlagener Schritt — kann unter einer anonymen ID für dieses Gerät in der Cloud gespeichert werden. Deine Erfassungen, Schritte und Erinnerungen nicht.';

  @override
  String get onboardingPrivacyNotBackup =>
      'Dieser Datensatz ist keine Sicherung. Er kann nichts auf einem neuen Gerät wiederherstellen.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Hindernisse',
      one: '1 Hindernis',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Könnte einfacher sein';

  @override
  String get toolDescriptionGoalOptimizer =>
      'Was fehlt, was im Weg steht, was zuerst zu tun ist.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'Nach: $step';
  }

  @override
  String get toolSectionThePlan => 'Der Plan';

  @override
  String get toolDescriptionActionPlan =>
      'Eine geordnete Folge von Schritten, die du in Aufgaben verwandeln kannst.';

  @override
  String get toolTitleSmartChecklist => 'Eine Checkliste erstellen';

  @override
  String get toolDescriptionSmartChecklist =>
      'Alles, was das von dir verlangt, der Reihe nach.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fehlende Angaben',
      one: '1 fehlende Angabe',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'Diese widersprechen einander';

  @override
  String get toolTitleMissingInformation => 'Was fehlt';

  @override
  String get toolDescriptionMissingInformation =>
      'Die Lücken, und was du dazu fragen kannst.';

  @override
  String get aiAdapterTimedOut =>
      'Das hat zu lange gedauert und wurde gestoppt.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'Die sichere Verbindung zu deinem KI-Anbieter ist fehlgeschlagen.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action konnte dieses Modell oder diesen Endpunkt nicht finden.';

  @override
  String get aiAdapterRequestRejected =>
      'Dein KI-Anbieter hat diese Anfrage abgelehnt.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action konnte den sicheren Speicher dieses Geräts nicht öffnen.';

  @override
  String get aiAdapterEndpointMissing =>
      'Trag in den Einstellungen die Adresse deines KI-Endpunkts ein.';

  @override
  String get aiAdapterReplyIncomplete =>
      'Diese Antwort war unvollständig. Versuch es erneut.';

  @override
  String get aiAdapterContentDeclined =>
      'Dein Anbieter hat es abgelehnt, diesen Inhalt zu verarbeiten.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'Das sind mehr als $limit Dateien auf einmal. Wähle weniger aus.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'Eines dieser Bilder ist zu groß für die Analyse.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '„$filename“ ist zu groß für die Analyse. Die Grenze liegt bei $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '„$filename“ hat $count Seiten. Action liest höchstens $limit auf einmal — wähle einen Bereich.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'Diese Auswahl ist zu groß, um sie in einer Anfrage zu senden.';

  @override
  String get toolRunNotAvailableTitle => 'Dieses Werkzeug ist nicht verfügbar';

  @override
  String get toolRunNotAvailableMessage =>
      'Es wurde vielleicht in einer neueren Version von Action entfernt.';

  @override
  String get toolRunNoSourcesYet =>
      'Noch gibt es nichts zum Arbeiten. Erfasse etwas oder füge unten Text ein.';

  @override
  String get toolRunChooseSourcesToCompare =>
      'Wähle, was verglichen werden soll';

  @override
  String get toolRunChooseSource => 'Wähle eine Quelle';

  @override
  String get toolRunQuestionLabel => 'Deine Frage';

  @override
  String get toolRunQuestionHint => 'Wann ist die Frist?';

  @override
  String get toolRunFreeTextLabel => 'Oder füge Text ein';

  @override
  String get toolRunFreeTextHint => 'Hier einfügen oder tippen';

  @override
  String get toolRunModeLabel => 'Stil';

  @override
  String get toolRunRunLocally => 'Auf diesem Gerät prüfen';

  @override
  String get toolRunRun => 'Ausführen';

  @override
  String get toolRunStop => 'Stoppen';

  @override
  String get toolRunRunAgain => 'Erneut ausführen';

  @override
  String get toolRunWorkingOn => 'Betrifft:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'Das an $provider senden?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'Der von dir gewählte Inhalt wird zur Verarbeitung an $provider gesendet, mit deinem API-Schlüssel.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'Dein Schlüssel bleibt auf diesem Gerät. Action sendet nichts im Hintergrund und sendet auch deine anderen Aufgaben oder Quellen nicht.';

  @override
  String get toolRunScopeTitle => 'Bevor das ausgeführt wird';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten werden über deine $provider-Verbindung analysiert.',
      one: '1 Seite wird über deine $provider-Verbindung analysiert.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Dateien werden über deine $provider-Verbindung analysiert.',
      one: '1 Datei wird über deine $provider-Verbindung analysiert.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'Der von dir gewählte Text wird an deine $provider-Verbindung gesendet.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Verbinde einen KI-Anbieter, um dieses Werkzeug zu nutzen';

  @override
  String get toolRunNeedsProviderBody =>
      'Du nutzt dein eigenes Konto beim Anbieter und deinen eigenen API-Schlüssel.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aufgabe aus $count Schritten erstellt.',
      one: 'Aufgabe aus 1 Schritt erstellt.',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Schritte hinzugefügt.',
      one: '1 Schritt hinzugefügt.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Schritte',
      one: '1 Schritt',
    );
    return 'Aufgabe erstellen · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Schritte',
      one: '1 Schritt',
    );
    return 'Zu dieser Aufgabe hinzufügen · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Foto';

  @override
  String get sourceTypeLabelScreenshot => 'Screenshot';

  @override
  String get sourceTypeLabelPastedText => 'Eingefügte Notiz';

  @override
  String get sourceTypeLabelDocument => 'Dokument';

  @override
  String get toolModeClearer => 'Klarer';

  @override
  String get toolModeMoreProfessional => 'Professioneller';

  @override
  String get toolModeShorter => 'Kürzer';

  @override
  String get toolModeSimpler => 'Einfacher';

  @override
  String get toolModeMoreStructured => 'Strukturierter';

  @override
  String get toolModeMorePersuasive => 'Überzeugender';

  @override
  String get toolModeGrammarOnly => 'Nur Grammatik';

  @override
  String get toolModeProfessional => 'Professionell';

  @override
  String get toolModeConcise => 'Knapp';

  @override
  String get toolModeFriendly => 'Freundlich';

  @override
  String get toolModeFormal => 'Förmlich';

  @override
  String get toolModeAskForClarification => 'Nachfragen';

  @override
  String get toolModeConfirm => 'Empfang bestätigen';

  @override
  String get toolModeDispute => 'Widersprechen';

  @override
  String get toolModeQuick => 'Kurz';

  @override
  String get toolModeDetailed => 'Ausführlich';

  @override
  String get toolModeExecutive => 'Für Entscheider';

  @override
  String get toolModeKeyPoints => 'Kernpunkte';

  @override
  String get toolModeActionFocused => 'Aufgabenorientiert';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count zitierte Angaben konnten in dem, was du ausgewählt hast, nicht gefunden werden, sie sind deshalb als unsicher markiert.',
      one: 'Eine zitierte Angabe konnte in dem, was du ausgewählt hast, nicht gefunden werden, sie ist deshalb als unsicher markiert.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action konnte diese Zitate nicht gegen die Datei selbst prüfen, daher wurden sie nicht überprüft.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Überfällig · $count Tage',
      one: 'Überfällig · 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Morgen fällig';

  @override
  String get triageBadgeReminderSoon => 'Erinnerung steht an';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Seit $count Tagen überfällig',
      one: 'Seit 1 Tag überfällig',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'Das ist erledigt.';

  @override
  String get triageExplanationNothingPressing =>
      'Das steht hier, weil daran noch nichts drängt.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'Das braucht Aufmerksamkeit, denn $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'Das steht weiter unten, denn $reason.';
  }

  @override
  String get triageReasonOverdue => 'es ist überfällig';

  @override
  String get triageReasonDeadlinePassed => 'die Frist ist verstrichen';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'es ist seit $count Tagen überfällig',
      one: 'es ist seit einem Tag überfällig',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'es ist heute fällig';

  @override
  String get triageReasonCriticalDueSoon =>
      'du hast es als kritisch markiert und die Frist ist nah';

  @override
  String get triageReasonAllStepsDone =>
      'jeder Schritt ist erledigt — es muss nur noch abgeschlossen werden';

  @override
  String get triageReasonDueTomorrow => 'es ist morgen fällig';

  @override
  String get triageReasonReminderSoon =>
      'du hast dafür eine Erinnerung innerhalb des nächsten Tages gesetzt';

  @override
  String get triageReasonDueWithinThreeDays =>
      'es ist in den nächsten drei Tagen fällig';

  @override
  String get triageReasonCriticalNoDeadline =>
      'du hast es als kritisch markiert, und es hat keine Frist';

  @override
  String get triageReasonDueWithinSevenDays =>
      'es ist innerhalb einer Woche fällig';

  @override
  String get triageReasonImportant => 'du hast es als wichtig markiert';

  @override
  String get triageReasonDueLater => 'die Frist liegt weiter entfernt';

  @override
  String get triageReasonNoDeadline => 'es hat keine Frist und nichts drängt';

  @override
  String cardCompletedTooltip(String title) {
    return 'Erledigt: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Dieses Dokument verstehen';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'Was es ist, worauf es ankommt und was damit zu tun ist.';

  @override
  String get toolSectionWhatThisIs => 'Was das ist';

  @override
  String get toolSectionWhatMatters => 'Worauf es ankommt';

  @override
  String get toolSectionKeyDetails => 'Wichtige Angaben';

  @override
  String get toolTitleAskDocument => 'Zu einer Erfassung fragen';

  @override
  String get toolDescriptionAskDocument =>
      'Antworten, die sich auf das stützen, was du ausgewählt hast — oder gar keine.';

  @override
  String get toolSectionNoAnswer => 'Keine Antwort in diesem Material';

  @override
  String get toolSectionNoAnswerBody =>
      'Action konnte das im ausgewählten Dokument nicht finden.';

  @override
  String get toolSectionAnswer => 'Antwort';

  @override
  String get toolSectionFromTheDocument => 'Aus dem Dokument';

  @override
  String get toolWarningQuoteNotFound =>
      'Das Zitat hinter dieser Antwort steht nicht im ausgewählten Material. Behandle die Antwort als unzuverlässig.';

  @override
  String get toolTitleSmartSummary => 'Zusammenfassen';

  @override
  String get toolDescriptionSmartSummary =>
      'Die kurze Fassung — oder die Fassung, die ändert, was du tun musst.';

  @override
  String get toolSectionKeyPoints => 'Kernpunkte';

  @override
  String get toolTitleCompareDocuments => 'Dokumente vergleichen';

  @override
  String get toolDescriptionCompareDocuments =>
      'Was sich geändert hat, was sich widerspricht, was fehlt.';

  @override
  String get toolSectionWhatDiffers => 'Was sich unterscheidet';

  @override
  String get toolSectionConflicts => 'Widersprüche';

  @override
  String get toolSectionOnlyInOne => 'Nur in einem davon';

  @override
  String get toolSectionInCommon => 'Gemeinsamkeiten';

  @override
  String get sensitiveKindEmail => 'E-Mail-Adresse';

  @override
  String get sensitiveKindPhone => 'Telefonnummer';

  @override
  String get sensitiveKindPaymentCard => 'Zahlungskartennummer';

  @override
  String get sensitiveKindIban => 'Bankkonto (IBAN)';

  @override
  String get sensitiveKindNationalId => 'Nationale Ausweisnummer';

  @override
  String get sensitiveKindPostcode => 'Postleitzahl';

  @override
  String get sensitiveKindAccountNumber => 'Kontonummer';

  @override
  String get sensitiveKindReference => 'Referenznummer';

  @override
  String get sensitiveKindDateOfBirth => 'Geburtsdatum';

  @override
  String get sensitiveKindUrl => 'Webadresse';

  @override
  String get verdictVerifiedProvenance => 'Geprüfte Herkunft vorhanden';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'Diese Datei trägt eine Signatur, die geprüft wurde und standgehalten hat.';

  @override
  String get verdictSignalsSynthetic =>
      'Anzeichen, die zu KI-generierten Inhalten passen';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'Diese Datei gibt an, mit einem generativen Werkzeug erstellt worden zu sein. Metadaten lassen sich bearbeiten oder entfernen, das ist also die Behauptung der Datei, kein Beweis.';

  @override
  String get verdictSignalsEdited =>
      'Anzeichen, die zu bearbeiteten Inhalten passen';

  @override
  String get verdictSignalsEditedExplainer =>
      'Diese Datei gibt an, durch eine Bearbeitungssoftware gelaufen zu sein. Das ist bei Fotos üblich und bedeutet für sich genommen nicht, dass etwas gefälscht wurde.';

  @override
  String get verdictNoReliableProvenance =>
      'Keine verlässliche Herkunft gefunden';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'In dieser Datei stehen keine Herkunftsangaben. Das ist normal — die meisten Dienste entfernen sie — und es ist kein Anzeichen für irgendetwas.';

  @override
  String get verdictInconclusive => 'Nicht eindeutig';

  @override
  String get verdictInconclusiveExplainer =>
      'Hier sind nicht genug Informationen vorhanden, um zu sagen, woher das stammt.';

  @override
  String get authenticitySignalCamera => 'Kamera';

  @override
  String get authenticitySignalSoftware => 'Software';

  @override
  String get authenticitySignalDescription => 'Beschreibung';

  @override
  String get authenticitySignalCopyright => 'Copyright';

  @override
  String get authenticitySignalLocation => 'Ort';

  @override
  String get authenticitySignalLocationValue =>
      'In dieser Datei sind Ortsdaten vorhanden.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Nicht geprüft — in diesem Build gibt es keinen Signaturprüfer.';

  @override
  String get authenticitySignalFile => 'Datei';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'Ließ sich nicht als Bild lesen.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'Kein erkanntes Bildformat.';

  @override
  String get authenticitySignalText => 'Text';

  @override
  String get authenticitySignalTextValue =>
      'Text allein kann nicht verlässlich zeigen, ob KI im Spiel war. Action rät nicht.';

  @override
  String get fileTypePng => 'ein PNG-Bild';

  @override
  String get fileTypeJpeg => 'ein JPEG-Bild';

  @override
  String get fileTypeGif => 'ein GIF-Bild';

  @override
  String get fileTypeWebp => 'ein WebP-Bild';

  @override
  String get fileTypeWav => 'eine WAV-Aufnahme';

  @override
  String get fileTypePdf => 'ein PDF-Dokument';

  @override
  String get fileTypeHeic => 'ein HEIC-Bild';

  @override
  String get fileTypeVideo => 'eine Videodatei';

  @override
  String get fileTypeTiff => 'ein TIFF-Bild';

  @override
  String get fileTypeBitmap => 'ein Bitmap-Bild';

  @override
  String get fileTypeRtf => 'ein RTF-Dokument';

  @override
  String get fileTypeZip => 'ein Zip-Archiv';

  @override
  String get fileTypeGzip => 'ein gzip-Archiv';

  @override
  String get fileTypeSevenZip => 'ein 7-Zip-Archiv';

  @override
  String get fileTypeRar => 'ein RAR-Archiv';

  @override
  String get fileTypeWindowsProgram => 'ein Windows-Programm';

  @override
  String get fileTypeLinuxProgram => 'ein Linux-Programm';

  @override
  String get fileTypePostScript => 'ein PostScript-Dokument';

  @override
  String get fileTypeOgg => 'eine Ogg-Aufnahme';

  @override
  String get fileTypeMp3 => 'eine MP3-Aufnahme';

  @override
  String get fileTypePlainText => 'einfacher Text';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'Diese Datei heißt \".$extension\", ihr Inhalt ist aber $contents. Das kann ein ehrlicher Irrtum sein, und auf diese Weise wird eine Datei auch von etwas anderem geöffnet, als du erwartet hast.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bytes',
      one: '1 Byte',
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
  String get credentialKindPrivateKey => 'Privater Schlüssel';

  @override
  String get credentialKindApiKey => 'API-Schlüssel';

  @override
  String get credentialKindConnectionString => 'Verbindungszeichenfolge';

  @override
  String get credentialKindAccessToken => 'Zugriffstoken';

  @override
  String get credentialKindAuthorizationHeader => 'Authorization-Header';

  @override
  String get credentialKindPasswordOrKey => 'Passwort oder Schlüssel';

  @override
  String get credentialKindPossibleSecret => 'Mögliches Geheimnis';

  @override
  String get credentialAdvicePrivateKey =>
      'Entferne das vor dem Teilen und ersetze das Schlüsselpaar. Ein privater Schlüssel lässt sich nicht wieder sicher machen, sobald er einmal gesehen wurde.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Widerrufe diesen Schlüssel beim Anbieter und lass einen neuen ausstellen. Ihn aus dem Dokument zu entfernen macht ihn nicht unwirksam.';

  @override
  String get credentialAdviceConnectionString =>
      'Das enthält ein Passwort und die Adresse, die es öffnet. Ändere das Passwort, falls das schon geteilt wurde.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Solche Token laufen oft ab, aber nicht immer. Behandle es als aktiv, solange du nicht weißt, wann es abläuft.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Entferne den Wert des Headers. Eingefügte Anfrageprotokolle sind einer der häufigsten Wege, auf denen ein funktionierendes Token versehentlich geteilt wird.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Verschiebe das in eine Umgebungsvariable oder einen Geheimnisspeicher, und ändere den Wert, falls die Datei geteilt wurde.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action kann nicht erkennen, was das ist. Prüfe es vor dem Teilen — es kann genauso gut eine Kennung wie eine Prüfsumme sein.';

  @override
  String get credentialLabelAnthropicApiKey => 'Anthropic-API-Schlüssel';

  @override
  String get credentialLabelOpenAiProjectKey => 'OpenAI-Projektschlüssel';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'API-Schlüssel im OpenAI-Stil';

  @override
  String get credentialLabelGoogleApiKey => 'Google-API-Schlüssel';

  @override
  String get credentialLabelGoogleOAuthToken => 'Google-OAuth-Token';

  @override
  String get credentialLabelGitHubToken => 'GitHub-Token';

  @override
  String get credentialLabelSlackToken => 'Slack-Token';

  @override
  String get credentialLabelAwsAccessKeyId => 'AWS-Zugriffsschlüssel-ID';

  @override
  String get credentialLabelGitLabToken => 'GitLab-Token';

  @override
  String get credentialLabelNpmToken => 'npm-Token';

  @override
  String get credentialLabelPassphrase => 'Passphrase';

  @override
  String get credentialLabelPassword => 'Passwort';

  @override
  String get credentialLabelRefreshToken => 'Refresh-Token';

  @override
  String get credentialLabelToken => 'Token';

  @override
  String get credentialLabelClientSecret => 'Client-Geheimnis';

  @override
  String get credentialLabelCredential => 'Zugangsdaten';

  @override
  String get credentialLabelSecret => 'Geheimnis';

  @override
  String get linkVerdictNoObviousSignals => 'Keine offensichtlichen Anzeichen';

  @override
  String get linkVerdictWorthChecking => 'Einen Blick wert';

  @override
  String get linkVerdictTreatWithCaution => 'Mit Vorsicht behandeln';

  @override
  String get linkSummaryNoObviousSignals =>
      'Nichts Ungewöhnliches daran, wie dieser Link geschrieben ist. Das ist nicht dasselbe wie zu wissen, dass die Seite vertrauenswürdig ist — nur du kannst beurteilen, ob du ihn erwartet hast.';

  @override
  String get linkSummaryWorthChecking =>
      'Eine Sache an diesem Link ist einen Blick wert, bevor du ihn öffnest.';

  @override
  String get linkSummaryTreatWithCaution =>
      'Mehrere Dinge daran, wie dieser Link geschrieben ist, sind eine Prüfung wert, bevor du ihn öffnest.';

  @override
  String get linkSignalNotHttps => 'Nicht verschlüsselt';

  @override
  String get linkSignalNonWebScheme => 'Kein Weblink';

  @override
  String get linkSignalEmbeddedCredentials => 'Passwort im Link';

  @override
  String get linkSignalMisleadingAuthority => 'Versteckte echte Adresse';

  @override
  String get linkSignalIpLiteralHost => 'Numerische Adresse';

  @override
  String get linkSignalPunycodeHost => 'Kodierte Zeichen im Namen';

  @override
  String get linkSignalMixedScriptHost => 'Gemischte Alphabete im Namen';

  @override
  String get linkSignalEncodedHost => 'Maskierte Zeichen im Namen';

  @override
  String get linkSignalUnusualPort => 'Ungewöhnlicher Port';

  @override
  String get linkSignalDeepSubdomain => 'Viele Teile im Namen';

  @override
  String get linkSignalPublicSuffixInSubdomain =>
      'Bekannter Name an der falschen Stelle';

  @override
  String get linkSignalShortener => 'Gekürzter Link';

  @override
  String get linkSignalExecutableTarget => 'Lädt ein Programm herunter';

  @override
  String get linkSignalRedirectParameter => 'Leitet dich woandershin weiter';

  @override
  String get linkSignalVeryLongUrl => 'Sehr lang';

  @override
  String get linkSignalUnparseable => 'Kein lesbarer Link';

  @override
  String get linkDetailNotHttps =>
      'Dieser Link nutzt http, alles, was du auf der Seite eintippst, kann also auf dem Weg dorthin mitgelesen werden.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'Das öffnet sich mit \"$scheme:\" statt einer Webseite. Möglicherweise wird damit eine andere App gebeten, etwas zu tun.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'In diesen Link sind ein Benutzername und ein Passwort geschrieben. Wo immer er geteilt wird, gehen sie mit.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'Alles vor dem \"@\" ignoriert der Browser. Das echte Ziel ist \"$host\".';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'Das führt zu \"$host\" — eine reine Zahlenadresse statt eines Namens. Seriöse Seiten nutzen fast immer einen Namen.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'Der Name der Seite enthält Zeichen außerhalb der lateinischen Schrift, kodiert gespeichert. Das ist für viele Sprachen normal, und so lässt sich ein Name auch so anlegen, dass er wie ein bekannter aussieht.';

  @override
  String get linkDetailMixedScriptHost =>
      'Der Name der Seite mischt lateinische Buchstaben mit Buchstaben aus einem anderen Alphabet, die genauso aussehen. Lies ihn Zeichen für Zeichen.';

  @override
  String get linkDetailEncodedHost =>
      'Der Name der Seite enthält Maskierungscodes, und dorthin gehören sie nicht. Sie können verbergen, was der Name tatsächlich sagt.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'Das verbindet sich über Port $port statt über den üblichen. Bei Testservern ist das üblich, bei öffentlichen Seiten ungewöhnlich.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Der Name hat $count Teile. Nur die letzten beiden entscheiden, wer die Seite betreibt; der Rest kann beliebig gesetzt werden.',
      one:
          'Der Name hat $count Teil. Nur die letzten beiden entscheiden, wer die Seite betreibt; der Rest kann beliebig gesetzt werden.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'Dieser Name enthält in der Mitte \".$suffix.\", wodurch der Anfang wie die Seite aussieht. Die Seite ist tatsächlich \"$host\".';
  }

  @override
  String get linkDetailShortener =>
      'Ein Kürzungsdienst verbirgt das echte Ziel. Ohne ihn zu öffnen, kannst du nicht erkennen, wohin das führt.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'Dieser Link endet auf \"$fileExtension\", er lädt also etwas herunter, das auf deinem Gerät laufen kann, statt einer Seite zum Lesen.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'Dieser Link trägt in seiner Einstellung \"$parameter\" eine zweite Adresse, beim Öffnen kann er dich also woandershin führen als zu \"$host\".';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'Lange Links sind schwerer zu lesen, und der Teil, der über das Ziel entscheidet, kann aus dem Sichtbaren hinausgeschoben werden.';

  @override
  String get linkDetailUnparseable =>
      'Action konnte das nicht als Webadresse lesen. Sei vorsichtig bei Links, die nicht wie Links aussehen.';

  @override
  String get toolTitleRedaction => 'Sensible Angaben verbergen';

  @override
  String get toolDescriptionRedaction =>
      'Finden, was nicht geteilt werden sollte, und eine bereinigte Kopie erstellen.';

  @override
  String get toolSectionRedactionNothingToScan => 'Nichts zu durchsuchen';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'Dieses Werkzeug liest Text. Wähle eine Notiz, eine eingefügte Nachricht oder eine Erfassung, deren Text gelesen wurde.';

  @override
  String get toolSectionRedactionNothingFound =>
      'Nichts Offensichtliches gefunden';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action hat in diesem Text keine E-Mail-Adressen, Telefonnummern, Kartennummern oder Referenznummern gefunden.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Angaben, die du besser verbirgst',
      one: '1 Angabe, die du besser verbirgst',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Geschwärzte Kopie';

  @override
  String get toolWarningRedactionCoverage =>
      'Das findet Muster wie E-Mail-Adressen, Telefonnummern und Kontonummern. Es erfasst nicht alles Sensible — lies die Kopie, bevor du sie teilst.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action kann Bilder und PDF-Dateien nicht schwärzen. Etwas in einem Bild zu überdecken würde das Original darunter belassen, deshalb wird es nicht angeboten.';

  @override
  String get toolTitleAuthenticity => 'Prüfen, woher das stammt';

  @override
  String get toolDescriptionAuthenticity =>
      'Was eine Datei über ihre eigene Herkunft angibt.';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'Nichts zu untersuchen';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Wähle ein Bild oder einen Text.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'Was diese Datei über sich selbst sagt';

  @override
  String get toolSectionAuthenticityFileItself => 'Die Datei selbst';

  @override
  String get toolSectionFileContents => 'Inhalt';

  @override
  String get toolSectionFileUnknownFormat => 'Kein Format, das Action kennt';

  @override
  String get toolSectionFileSize => 'Größe';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'Das gibt wieder, was eine Datei über sich selbst angibt. Metadaten lassen sich bearbeiten oder entfernen, nichts davon ist also ein Beweis. Beschuldige damit niemanden.';

  @override
  String get toolTitleCredentialScanner =>
      'Nach Schlüsseln und Passwörtern suchen';

  @override
  String get toolDescriptionCredentialScanner =>
      'Zugangsdaten finden, bevor du etwas teilst.';

  @override
  String get toolSectionCredentialNothingToCheck => 'Nichts zu prüfen';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Füge einen Text ein oder wähle eine Erfassung, deren Text gelesen wurde. Dieses Werkzeug liest nur Text.';

  @override
  String get toolSectionCredentialNoneFound => 'Keine Zugangsdaten gefunden';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action hat in diesem Text nichts gefunden, das wie ein API-Schlüssel, ein privater Schlüssel, ein Token oder ein Passwort geformt ist.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zugangsdaten gefunden: $count',
      one: 'Zugangsdaten gefunden: 1',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sachen, die Geheimnisse sein könnten',
      one: '1 Sache, die ein Geheimnis sein könnte',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Kopie mit entfernten Zugangsdaten';

  @override
  String get toolWarningCredentialRevoke =>
      'Einen Schlüssel aus einem Dokument zu entfernen macht ihn nicht unwirksam. Wenn einer davon schon geteilt wurde, widerrufe ihn beim Anbieter und lass einen neuen ausstellen.';

  @override
  String get toolWarningCredentialCoverage =>
      'Das findet Zugangsdaten mit einer erkennbaren Form. Ein Passwort, das in einem Satz ausgeschrieben steht, wird nicht gefunden, lies den Text also ebenfalls.';

  @override
  String get toolTitleLinkInspector => 'Einen Link prüfen';

  @override
  String get toolDescriptionLinkInspector =>
      'Was eine Adresse verrät, bevor du sie öffnest.';

  @override
  String get toolSectionLinkNoneFound => 'Keine Links gefunden';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Füge einen Link ein oder wähle eine Erfassung, die einen enthält.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Links in diesem Text',
      one: 'Der Link in diesem Text',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'Nicht lesbar';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'Nichts Ungewöhnliches daran, wie diese geschrieben sind';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'Das ist nicht dasselbe wie zu wissen, dass die Seiten vertrauenswürdig sind. Nur du kannst beurteilen, ob du sie erwartet hast.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action liest nur die Adresse. Der Link wird nicht geöffnet, die Seite nicht nachgeschlagen und kein Reputationsdienst abgefragt — denn dabei würde dein Seitenaufruf irgendwohin gesendet.';

  @override
  String get toolWarningLinkNoSignals =>
      'Ein Link ohne Anzeichen kann trotzdem schädlich sein. Das hier findet Probleme darin, wie eine Adresse geschrieben ist, und das ist nicht alles, was es über ihr Ziel zu wissen gibt.';

  @override
  String get toolSectionObjective => 'Dein Ziel';

  @override
  String get toolSectionCurrentState => 'Aktueller Stand';

  @override
  String get toolSectionRecommendedNextStep => 'Empfohlener nächster Schritt';

  @override
  String get toolSectionCredentialAdvice => 'Was du tun solltest';

  @override
  String get toolSectionSummary => 'Zusammenfassung';

  @override
  String get toolDetailSeparator => ' · ';
}
