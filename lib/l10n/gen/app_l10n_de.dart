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
}
