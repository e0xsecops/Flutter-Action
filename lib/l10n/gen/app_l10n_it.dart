// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppL10nIt extends AppL10n {
  AppL10nIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonDone => 'Fatto';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonBack => 'Indietro';

  @override
  String get commonRetry => 'Riprova';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonRemove => 'Rimuovi';

  @override
  String get commonContinue => 'Continua';

  @override
  String get commonOpen => 'Apri';

  @override
  String get commonCopy => 'Copia';

  @override
  String get commonCopied => 'Copiato';

  @override
  String get commonEdit => 'Modifica';

  @override
  String get commonAdd => 'Aggiungi';

  @override
  String get commonOn => 'Attivo';

  @override
  String get commonOff => 'Disattivo';

  @override
  String get commonUnknown => 'Sconosciuto';

  @override
  String get commonChecking => 'Verifica in corso…';

  @override
  String get commonSettings => 'Impostazioni';

  @override
  String get commonDismiss => 'Ignora';

  @override
  String get commonUndo => 'Annulla';

  @override
  String get commonSkip => 'Salta';

  @override
  String get commonNotNow => 'Non ora';

  @override
  String get commonSomethingWentWrong => 'Qualcosa è andato storto.';

  @override
  String get navToday => 'Oggi';

  @override
  String get navLibrary => 'Raccolta';

  @override
  String get navIntelligence => 'Intelligenza';

  @override
  String get navSearch => 'Cerca';

  @override
  String get navCapture => 'Acquisisci qualcosa';

  @override
  String get todayGreetingMorning => 'Buongiorno';

  @override
  String get todayGreetingAfternoon => 'Buon pomeriggio';

  @override
  String get todayGreetingEvening => 'Buonasera';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Non è stato possibile caricare le tue attività. Restano salvate su questo dispositivo.';

  @override
  String get todaySectionNeedsAttention => 'Richiede attenzione';

  @override
  String get todaySectionAlsoNeedsAttention => 'Richiede anch\'essa attenzione';

  @override
  String get todaySectionWaitingForReview => 'In attesa di verifica';

  @override
  String get todaySectionComingUp => 'In arrivo';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Vedi tutte le $count acquisizioni';
  }

  @override
  String get todaySeeAllInLibrary => 'Vedi tutto nella Raccolta';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count completate',
      one: '1 completata',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count attività completate. Apri la raccolta.',
      one: '1 attività completata. Apri la raccolta.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'INIZIA CON';

  @override
  String get todayQuickPhoto => 'Foto';

  @override
  String get todayQuickScreenshot => 'Screenshot';

  @override
  String get todayQuickText => 'Testo';

  @override
  String get todayQuickTools => 'Controlla un link, o trova chiavi in un testo';

  @override
  String get briefBadgeNeedsYou => 'SERVE TE';

  @override
  String get briefBadgeToReview => 'DA VERIFICARE';

  @override
  String get briefBadgeAhead => 'IN ARRIVO';

  @override
  String get briefBadgeStartHere => 'INIZIA QUI';

  @override
  String get briefBadgeClear => 'TUTTO A POSTO';

  @override
  String get briefNext => 'PROSSIMO';

  @override
  String briefOpenAction(String title) {
    return 'Apri $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Segna «$title» come completata';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count attività richiedono la tua attenzione',
      one: '1 attività richiede la tua attenzione',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count acquisizioni sono anche in attesa di verifica.',
      one: '1 acquisizione è anche in attesa di verifica.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count acquisizioni ti stanno aspettando',
      one: '1 acquisizione ti sta aspettando',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Nulla è in ritardo.';

  @override
  String get briefHeadlineNothingToday => 'Oggi non ti serve nulla';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count attività sono in arrivo.',
      one: '1 attività è in arrivo.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Sei in pari';

  @override
  String get briefDetailClear => 'Non c\'è nulla in scadenza né in attesa.';

  @override
  String get briefHeadlineFirstRun => 'Inizia da qualsiasi cosa';

  @override
  String get briefDetailFirstRun =>
      'Una lettera, uno screenshot, una nota — Action capisce di cosa si tratta.';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsSectionPersonalise => 'Personalizza';

  @override
  String get settingsAppearance => 'Aspetto';

  @override
  String get settingsAppearanceDescription =>
      'Chiaro, scuro o quello che fa il dispositivo.';

  @override
  String get settingsLanguageDescription => 'La lingua in cui Action ti parla.';

  @override
  String get appearanceSystem => 'Sistema';

  @override
  String get appearanceLight => 'Chiaro';

  @override
  String get appearanceDark => 'Scuro';

  @override
  String get appearanceSystemDescription =>
      'Segui l\'impostazione del dispositivo';

  @override
  String get appearanceLightDescription => 'Sempre chiaro';

  @override
  String get appearanceDarkDescription => 'Sempre scuro';

  @override
  String get languageTitle => 'Lingua';

  @override
  String get languageSubtitle =>
      'Le modifiche si applicano subito. Non viene inviato nulla da nessuna parte; la scelta resta su questo dispositivo.';

  @override
  String get languageSectionChoose => 'Scegli una lingua';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageSystemDescription => 'Segui la lingua del dispositivo';

  @override
  String get languageDraftNote =>
      'L\'inglese è la lingua in cui sono stati scritti i testi di Action. Le altre traduzioni sono state preparate seguendo un glossario fisso e verificate automaticamente, ma nessun madrelingua le ha ancora lette. Dove la formulazione esatta conta — privacy, sicurezza, ciò che Action afferma e ciò che si rifiuta di affermare — l\'inglese resta il riferimento.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action funziona senza IA. Collegare il tuo fornitore aggiunge strumenti di analisi dei documenti, pianificazione e stesura.';

  @override
  String get settingsAiProvider => 'Fornitore IA';

  @override
  String get settingsAiNotConnected =>
      'Non collegato. Usa il tuo account e la tua chiave API.';

  @override
  String settingsAiConnected(String provider) {
    return 'Collegato a $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Privacy e sicurezza';

  @override
  String get settingsSecurity => 'Sicurezza';

  @override
  String get settingsWhereInfoLives => 'Dove vivono le tue informazioni';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Cosa resta su questo dispositivo e cosa no.';

  @override
  String get protectionAppLock => 'Blocco app';

  @override
  String get protectionScreenPrivacy => 'privacy dello schermo';

  @override
  String get protectionPrivateReminders => 'promemoria privati';

  @override
  String get protectionSummaryNone =>
      'Blocco app, privacy dello schermo e cosa lascia questo dispositivo.';

  @override
  String protectionSummaryOne(String first) {
    return '$first è attivo.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first e $second sono attivi.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second e $third sono attivi.';
  }

  @override
  String get settingsSectionReminders => 'Promemoria';

  @override
  String get settingsRemindersFootnote =>
      'Android può consegnare un promemoria un po\' più tardi dell\'ora impostata, a seconda delle impostazioni della batteria e di come viene usato il dispositivo.';

  @override
  String get settingsNotifications => 'Notifiche';

  @override
  String get settingsNotificationsOnDescription =>
      'I promemoria che imposti possono essere mostrati.';

  @override
  String get settingsNotificationsOffDescription =>
      'Disattivate per Action, quindi i promemoria non compariranno.';

  @override
  String get settingsNotificationsUnknown => 'Impossibile verificare.';

  @override
  String get settingsNotificationsAllowed => 'Consentite';

  @override
  String get settingsOpenSystemSettings => 'Apri impostazioni';

  @override
  String get settingsActionFootnote =>
      'Action trasforma informazioni disordinate in prossimi passi chiari. Confermi tu tutto prima che venga salvato.';

  @override
  String get settingsHelp => 'Aiuto';

  @override
  String get settingsHelpDescription => 'Come funziona Action e cosa non farà.';

  @override
  String get settingsVersion => 'Versione';
}
