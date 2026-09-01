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

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Proprio ora';

  @override
  String relativeMinutes(int count) {
    return '$count min fa';
  }

  @override
  String relativeHours(int count) {
    return '$count h fa';
  }

  @override
  String get relativeYesterday => 'Ieri';

  @override
  String relativeDays(int count) {
    return '$count g fa';
  }

  @override
  String get libraryTitle => 'Raccolta';

  @override
  String get librarySubtitle =>
      'Tutto ciò che Action conserva per te. E tutto resta su questo dispositivo.';

  @override
  String get librarySegmentActions => 'Attività';

  @override
  String get librarySegmentCaptures => 'Acquisizioni';

  @override
  String get librarySegmentGoals => 'Obiettivi';

  @override
  String get librarySegmentDone => 'Fatte';

  @override
  String get libraryNewGoal => 'Nuovo obiettivo';

  @override
  String get libraryNoGoalsTitle => 'Ancora nessun obiettivo';

  @override
  String get libraryNoGoalsMessage =>
      'Un obiettivo è qualcosa che vuoi far accadere. Action può trovare cosa manca, cosa lo blocca e da cosa cominciare.';

  @override
  String get libraryNoDoneTitle => 'Ancora niente di completato';

  @override
  String get libraryNoDoneMessage =>
      'Le attività che concludi verranno conservate qui.';

  @override
  String get libraryNoOpenTitle => 'Nessuna attività aperta';

  @override
  String get libraryNoOpenMessage =>
      'Acquisisci qualcosa e Action capirà cosa c\'è da fare.';

  @override
  String get libraryNoCapturesTitle => 'Ancora niente di acquisito';

  @override
  String get libraryNoCapturesMessage =>
      'Foto, screenshot e testi che aggiungi arrivano prima qui. Niente viene analizzato finché non lo chiedi.';

  @override
  String get libraryGoalNoActions => 'Non ne è ancora nato nulla';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count attività da questo obiettivo',
      one: '1 attività da questo obiettivo',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Cerca tra attività e acquisizioni';

  @override
  String get searchClear => 'Cancella';

  @override
  String get searchPrivacyNote =>
      'La ricerca avviene su questo dispositivo. Niente di ciò che scrivi qui lo lascia.';

  @override
  String get searchYouCanSearch => 'PUOI CERCARE';

  @override
  String get searchFieldTitles => 'Titoli';

  @override
  String get searchFieldTitlesExample => 'Rinnovare l\'assicurazione auto';

  @override
  String get searchFieldReferences => 'Numeri di riferimento';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Organizzazioni';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Passi dentro un\'attività';

  @override
  String get searchFieldStepsExample => 'Caricare il modulo';

  @override
  String get searchFieldCaptureText => 'Il testo letto da un\'acquisizione';

  @override
  String get searchFieldCaptureTextExample => 'avviso di rinnovo';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Nessun risultato per «$query»';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Prova con meno parole, o con un numero di riferimento esattamente come compare.';

  @override
  String get searchNoMatchesClearFilters =>
      'Prova con meno parole, o cancella i filtri.';

  @override
  String get searchFilterActive => 'Aperte';

  @override
  String get searchFilterCompleted => 'Completate';

  @override
  String get searchFilterOverdue => 'In ritardo';

  @override
  String get searchFilterThisWeek => 'Questa settimana';

  @override
  String get searchFilterCritical => 'Critiche';

  @override
  String get searchFilterCreatedByYou => 'Create da te';

  @override
  String get searchFilterArchived => 'Archiviate';

  @override
  String get searchFilterClear => 'Cancella filtri';

  @override
  String get searchIncompleteActions =>
      'Non è stato possibile cercare tra le tue attività, quindi questi risultati potrebbero essere incompleti.';

  @override
  String get searchIncompleteCaptures =>
      'Non è stato possibile cercare tra le tue acquisizioni, quindi questi risultati potrebbero essere incompleti.';

  @override
  String get searchIncompleteBoth =>
      'Non è stato possibile cercare né tra le tue attività né tra le tue acquisizioni, quindi questi risultati potrebbero essere incompleti.';

  @override
  String get searchMatchTitle => 'Titolo';

  @override
  String get searchMatchNextStep => 'Passo successivo';

  @override
  String get searchMatchStep => 'Passo';

  @override
  String get searchMatchSummary => 'Sintesi';

  @override
  String get searchMatchFromCapture => 'Da un\'acquisizione';

  @override
  String get studioSuggested => 'Suggerito per la tua ultima acquisizione';

  @override
  String get studioRecentlyUsed => 'Usati di recente';

  @override
  String get studioReady => 'PRONTO';

  @override
  String get studioNotConnected => 'NON COLLEGATO';

  @override
  String get studioHeroTitle => 'Intelligenza di Action';

  @override
  String get studioConnectedBlurb =>
      'Capire un documento, affinare un obiettivo, costruire un piano, abbozzare una risposta o verificare ciò che hai davanti.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count strumenti per capire documenti, pianificare e scrivere. Collega il tuo account IA per usarli: a fatturare è il tuo fornitore, mai Action.';
  }

  @override
  String get studioConnectAi => 'Collega l\'IA';

  @override
  String get studioHowItWorks => 'Come funziona';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count di questi funzionano già senza niente di tutto ciò, interamente su questo dispositivo.',
      one: '1 di questi funziona già senza niente di tutto ciò, interamente su questo dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Funziona su questo dispositivo';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Funziona su questo dispositivo.';
  }

  @override
  String get categoryUnderstand => 'Capire';

  @override
  String get categoryUnderstandBlurb => 'Dare senso a ciò che hai.';

  @override
  String get categoryPlan => 'Pianificare';

  @override
  String get categoryPlanBlurb => 'Trasformarlo in qualcosa che puoi fare.';

  @override
  String get categoryCreate => 'Creare';

  @override
  String get categoryCreateBlurb => 'Scriverlo, migliorarlo, tradurlo.';

  @override
  String get categoryExtract => 'Estrarre';

  @override
  String get categoryExtractBlurb => 'Tirare fuori i dettagli che contano.';

  @override
  String get categoryVerify => 'Verificare';

  @override
  String get categoryVerifyBlurb => 'Verificare ciò che hai davanti.';

  @override
  String get captureSheetTitle => 'Acquisisci qualcosa';

  @override
  String get captureSheetSubtitle =>
      'Passa ad Action qualsiasi cosa preferiresti non leggere per intero.';

  @override
  String get captureTakePhoto => 'Scatta una foto';

  @override
  String get captureTakePhotoSubtitle =>
      'Una lettera, una bolletta o un avviso che hai davanti';

  @override
  String get captureChooseImage => 'Scegli un\'immagine';

  @override
  String get captureChooseImageSubtitle =>
      'Uno screenshot o una foto già su questo dispositivo';

  @override
  String get capturePasteText => 'Incolla del testo';

  @override
  String get capturePasteTextSubtitle => 'Un\'email, un messaggio o un avviso';

  @override
  String get captureChoosePdf => 'Scegli un PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'Un estratto conto, una lettera o un modulo che hai già';

  @override
  String get captureFootnote =>
      'Le acquisizioni restano su questo dispositivo. Niente viene analizzato online finché non lo chiedi.';

  @override
  String get captureCouldNotOpen =>
      'Non è stato possibile aprirlo. Prova in un altro modo.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'In lettura';

  @override
  String get stageNeedsReview => 'Da verificare';

  @override
  String get stageActionCreated => 'Attività creata';

  @override
  String get stageNoText => 'Nessun testo trovato';

  @override
  String get stageCouldNotBeRead => 'Non è stato possibile leggerlo';

  @override
  String get stageReadingPreview => 'Lettura del testo…';

  @override
  String get stageFailedPreview =>
      'Non è stato possibile leggerlo su questo dispositivo.';

  @override
  String get provenancePhoto => 'Acquisito da una foto';

  @override
  String get provenanceImage => 'Acquisito da un\'immagine';

  @override
  String get provenancePastedText => 'Acquisito da testo incollato';

  @override
  String get provenanceDocument => 'Aggiunto come documento';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Fatta $when';
  }

  @override
  String metaOverdue(String date) {
    return 'In ritardo · scadeva il $date';
  }

  @override
  String get metaDueToday => 'Scade oggi';

  @override
  String metaDueOn(String date) {
    return 'Scade il $date';
  }

  @override
  String get metaCreatedByYou => 'Creata da te';

  @override
  String get categoryPayment => 'Pagamento';

  @override
  String get categoryRenewal => 'Rinnovo';

  @override
  String get categoryAppointment => 'Appuntamento';

  @override
  String get categoryBooking => 'Prenotazione';

  @override
  String get categoryTravel => 'Viaggio';

  @override
  String get categoryDeadline => 'Scadenza';

  @override
  String get categoryResponse => 'Serve una risposta';

  @override
  String get categoryDelivery => 'Consegna';

  @override
  String get categoryDocument => 'Documento';

  @override
  String get categoryNoActionRequired => 'Niente da fare';

  @override
  String get categoryUnsure => 'Non è chiaro';

  @override
  String get errorEnterManually => 'Inserirlo a mano';
}
