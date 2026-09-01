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
}
