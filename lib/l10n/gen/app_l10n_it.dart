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
  String get ocrScriptTitle => 'Riconoscimento del testo';

  @override
  String get ocrScriptSubtitle =>
      'Il sistema di scrittura che Action legge quando guarda una foto. Il riconoscimento avviene su questo dispositivo; nessuna acquisizione viene inviata da nessuna parte per essere letta.';

  @override
  String get ocrScriptSectionChoose => 'Sistema di scrittura';

  @override
  String get ocrScriptFollowLanguage => 'Segui la lingua dell\'app';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Al momento $script';
  }

  @override
  String get ocrScriptLatin => 'Latino';

  @override
  String get ocrScriptChinese => 'Cinese';

  @override
  String get ocrScriptDevanagari => 'Devanagari';

  @override
  String get ocrScriptJapanese => 'Giapponese';

  @override
  String get ocrScriptKorean => 'Coreano';

  @override
  String get ocrScriptLatinDescription =>
      'Inglese, spagnolo, francese, tedesco e le altre lingue scritte in lettere latine.';

  @override
  String get ocrScriptChineseDescription =>
      'Cinese semplificato e tradizionale.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Hindi, marathi e nepalese. Non bengalese, tamil o telugu — ognuno di questi è un sistema di scrittura diverso.';

  @override
  String get ocrScriptJapaneseDescription => 'Giapponese.';

  @override
  String get ocrScriptKoreanDescription => 'Coreano.';

  @override
  String get ocrScriptFootnote =>
      'Ogni scelta tranne il latino legge anche le lettere latine, quindi sceglierne una aggiunge un sistema di scrittura invece di sostituirlo. La modifica vale per le foto scattate da ora in poi, non per quelle già lette.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action non sa leggere la scrittura $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Non esiste un riconoscitore sul dispositivo per essa. Le foto continueranno a essere lette per tutto ciò che è scritto in lettere latine, e il resto tornerà vuoto. Puoi digitare o incollare quel testo al suo posto.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action è impostata per leggere $script. Se questa foto è in un altro sistema di scrittura, cambialo nelle Impostazioni e rileggila.';
  }

  @override
  String get settingsTextRecognition => 'Riconoscimento del testo';

  @override
  String get settingsTextRecognitionDescription =>
      'Il sistema di scrittura che Action legge dalle foto.';

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

  @override
  String get sourceWhatWeRead => 'Cosa abbiamo letto';

  @override
  String get sourceDelete => 'Elimina acquisizione';

  @override
  String get sourceGone => 'Quell\'acquisizione non è più disponibile.';

  @override
  String get sourceDeleteTitle => 'Eliminare questa acquisizione?';

  @override
  String get sourceDeleteBody =>
      'L\'immagine e il testo letto da essa vengono rimossi da questo dispositivo.';

  @override
  String get sourceDeleteKeep => 'Conserva';

  @override
  String get sourceOpenAction => 'Apri l\'attività';

  @override
  String sourceOpenActions(int count) {
    return 'Apri $count attività';
  }

  @override
  String get sourceCreateAnother => 'Creane un\'altra da questo';

  @override
  String get sourceCreateAction => 'Crea un\'attività da questo';

  @override
  String get sourceDoMore => 'Fai di più con questo';

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
    return 'da $format $size KB';
  }

  @override
  String get sourceTextFound => 'Testo trovato';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines righe · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Questo è il testo che Action ha letto. Ciò che ne è stato ricavato è qui sotto.';

  @override
  String get sourceNotInterpreted =>
      'Non è ancora stato interpretato nulla. Action proporrà cosa farne, e tu confermi prima che venga creato qualcosa.';

  @override
  String get sourceNoTextExplainer =>
      'Può succedere con la scrittura a mano, con pochissima luce, o con una scrittura che questo dispositivo non sa ancora leggere.';

  @override
  String get sourceReadFailed => 'Non è stato possibile leggerlo';

  @override
  String get sourceReadFailedReason =>
      'Il riconoscimento del testo non è arrivato a termine.';

  @override
  String get sourceTryReadingAgain => 'Prova a leggere di nuovo';

  @override
  String get sourceTypeInstead => 'Digita invece i dati';

  @override
  String get sourceTypeWhatItSays => 'Digita cosa c\'è scritto';

  @override
  String get sourceTypeHint => 'Date, importi e cosa viene chiesto.';

  @override
  String get sourceMadeFromThis => 'Creato da questa acquisizione';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count creati da questa acquisizione';
  }

  @override
  String get sourceTheDocument => 'Il documento';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '1 pagina',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Numero di pagine sconosciuto';

  @override
  String get sourceDocumentNotRead =>
      'Action non ha letto cosa c\'è dentro questo documento. Quando userai uno strumento che ne ha bisogno, il file andrà al fornitore di IA che hai collegato e te lo diremo prima che accada.';

  @override
  String get previewSaveFailed => 'Non è stato possibile salvare. Riprova.';

  @override
  String get previewTitle => 'Controlla l\'acquisizione';

  @override
  String get previewImageFailed => 'Quell\'immagine non si è potuta aprire.';

  @override
  String get previewHint =>
      'Assicurati che il testo sia leggibile e che non manchi nulla di importante.';

  @override
  String get previewRetake => 'Rifai la foto';

  @override
  String get pasteTitle => 'Incolla il testo';

  @override
  String get pasteHint =>
      'Incolla l\'email, il messaggio o l\'avviso che preferiresti non leggere per intero.';

  @override
  String get pasteFootnote =>
      'Va bene tutto ciò che ha una data, un importo o una richiesta.';

  @override
  String get pasteEnough => 'Sembra abbastanza per lavorarci.';

  @override
  String get pasteMore => 'Un po\' più di testo darà un risultato migliore.';

  @override
  String get reviewLoadFailed =>
      'Non è stato possibile caricare questa acquisizione.';

  @override
  String get reviewConfirmed => 'Confermato';

  @override
  String get reviewNeedsReview => 'Da controllare';

  @override
  String get reviewReview => 'Controlla';

  @override
  String get reviewHighConfidence => 'Affidabilità alta';

  @override
  String get reviewConfirmedByYou => 'Confermato da te';

  @override
  String get reviewMissing => 'Mancante';

  @override
  String get reviewNotUnderstood =>
      'Action non è riuscita a capire in modo affidabile abbastanza di questa fonte.';

  @override
  String get reviewNotUnderstoodBody =>
      'L\'acquisizione è intatta e non è andato perso nulla. Puoi inserire i dati tu stesso, e la fonte resta allegata come riferimento.';

  @override
  String get reviewEnterDetails => 'Inserisci i dati';

  @override
  String get reviewKeepSource => 'Conserva la fonte per dopo';

  @override
  String reviewEngine(String engine) {
    return 'Motore: $engine';
  }

  @override
  String get reviewManualNotice =>
      'Stai creando questa attività tu stesso. Verrà usato solo ciò che inserisci qui.';

  @override
  String get reviewUntitled => 'Attività senza titolo';

  @override
  String get reviewEditTitle => 'Modifica il titolo';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valori hanno bisogno del tuo controllo.',
      one: '1 valore ha bisogno del tuo controllo prima che questo possa essere confermato.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Dati principali';

  @override
  String get reviewNotFound => 'Non trovato';

  @override
  String get reviewSuggestedNextStep => 'Prossimo passo suggerito';

  @override
  String get reviewWhyThisMatters => 'Perché conta';

  @override
  String get reviewSteps => 'Passi';

  @override
  String get reviewAddStep => 'Aggiungi un passo';

  @override
  String get reviewInjectionNotice =>
      'Parte del testo in questa fonte sembrava istruzioni invece che dati del documento, così Action l\'ha ignorata.';

  @override
  String get reviewLayoutNotice =>
      'L\'impaginazione di questo documento può contenere relazioni che l\'estrazione del testo non è riuscita a conservare del tutto. Confronta i valori qui sotto con la fonte prima di confermare.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Confronta i valori qui sotto con la fonte.';
  }

  @override
  String get reviewDeadline => 'Scadenza';

  @override
  String get reviewAmount => 'Importo';

  @override
  String get reviewLeftUnset =>
      'Nessuna — hai scelto di lasciarla non impostata';

  @override
  String get reviewUnclear => 'Poco chiaro';

  @override
  String get reviewNotSet => 'Non impostato';

  @override
  String get reviewNoDeadlineFound => 'Nessuna trovata in questo documento';

  @override
  String get reviewNoAmountFound => 'Nessuno trovato in questo documento';

  @override
  String get reviewMultipleDates => 'Action ha trovato più date possibili.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count date potrebbero essere la scadenza. Scegli quella giusta, inseriscine un\'altra, o lasciala non impostata.';
  }

  @override
  String get reviewChooseDate => 'Scegli una data';

  @override
  String get reviewMultipleAmounts =>
      'Action ha trovato più di un importo possibile.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count importi potrebbero essere quello di cui si tratta qui. Scegline uno, inseriscine un altro, o lascialo non impostato.';
  }

  @override
  String get reviewChooseAmount => 'Scegli un importo';

  @override
  String get reviewSkipStep => 'Salta questo passo';

  @override
  String get reviewKeepStep => 'Conserva questo passo';

  @override
  String get reviewEditStep => 'Modifica il passo';

  @override
  String get reviewCreateManually => 'Crea a mano';

  @override
  String get reviewConfirmAndCreate => 'Conferma e crea l\'attività';

  @override
  String get reviewFixHighlighted => 'Controlla i campi segnalati';

  @override
  String get reviewSaving => 'Salvataggio…';

  @override
  String get reviewSaveFailed =>
      'Non è stato possibile salvare questa attività. Non è andato perso nulla — riprova.';

  @override
  String get reviewFieldTitle => 'Titolo';

  @override
  String get reviewTitleHint => 'Cosa deve succedere?';

  @override
  String get reviewNewStep => 'Nuovo passo';

  @override
  String get reviewStepHint => 'Cosa fare';

  @override
  String get reviewDatesConflict => 'Il documento cita più di una data.';

  @override
  String get reviewAmountsConflict => 'Il documento cita più di un importo.';

  @override
  String get reviewAnotherDate => 'Un\'altra data — 2026-08-30';

  @override
  String get reviewBadDate =>
      'Non è una data reale. Usa il formato 2026-08-30.';

  @override
  String get reviewTypeDate =>
      'Digita una data, oppure lasciala non impostata qui sotto.';

  @override
  String get reviewUseThisDate => 'Usa questa data';

  @override
  String get reviewLeaveNoDeadline => 'Continua senza scadenza';

  @override
  String get reviewAnotherAmount => 'Un altro importo — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Questo importo non si può usare: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Usa questo importo';

  @override
  String get reviewLeaveNoAmount => 'Continua senza importo';

  @override
  String get reviewThisValue => 'Questo valore';

  @override
  String reviewQuote(String quote) {
    return '«$quote»';
  }

  @override
  String get reviewSeeOnCapture => 'Vedilo sull\'acquisizione';

  @override
  String get reviewViewSource => 'Vedi la fonte';

  @override
  String get reviewFromSource => 'Dalla fonte';

  @override
  String get reviewNotVerified => 'Non riscontrato';

  @override
  String get reviewCouldNotVerify =>
      'Non è stato possibile riscontrarlo con la fonte.';

  @override
  String get reviewLooksRight => 'Sembra giusto';

  @override
  String get reviewStageReading => 'Lettura della fonte';

  @override
  String get reviewStageUnderstanding => 'Comprensione dei dati importanti';

  @override
  String get reviewStageChecking => 'Verifica di cosa va controllato';

  @override
  String get reviewNothingToDo => 'Al momento non devi fare nulla.';

  @override
  String get reviewInformationOnly =>
      'Questo sembra solo informazione — non è stata trovata alcuna scadenza, alcun pagamento né alcuna risposta.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Questo sembra solo informazione — in questa acquisizione non è stata trovata alcuna scadenza, alcun pagamento né alcuna risposta.';

  @override
  String get reviewSourceKept => 'La fonte viene conservata in ogni caso.';

  @override
  String get reviewAddAnyway => 'Aggiungi comunque un\'attività';

  @override
  String get reviewActionConfirmed => 'Attività confermata';

  @override
  String get reviewCreatedByYou => 'Creata da te.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Confermata da te a partire da $count dati controllati.',
      one: 'Confermata da te a partire da 1 dato controllato.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Confermata da te a partire da $count dati controllati. Ne hai cambiati $edited.',
      one:
          'Confermata da te a partire da 1 dato controllato. Ne hai cambiati $edited.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Salvata su questo dispositivo.';

  @override
  String get detailLoadFailed =>
      'Non è stato possibile caricare questa attività. Resta salvata su questo dispositivo.';

  @override
  String get detailNotFoundTitle => 'Quell\'attività non c\'è più';

  @override
  String get detailNotFoundMessage =>
      'Potrebbe essere stata eliminata su questo dispositivo.';

  @override
  String get detailGoBack => 'Indietro';

  @override
  String get detailMore => 'Altro';

  @override
  String get detailChangeUrgency => 'Cambia l\'urgenza';

  @override
  String get detailAddRecommendedStep => 'Aggiungi un passo consigliato';

  @override
  String get detailEditRecommendedStep => 'Modifica il passo consigliato';

  @override
  String get detailArchiveTitle => 'Archiviare questa attività?';

  @override
  String get detailArchiveBody =>
      'Esce dalla tua lista ma non viene eliminata, e l\'acquisizione da cui è nata viene conservata.';

  @override
  String get detailArchiveConfirm => 'Archivia';

  @override
  String get detailArchived => 'Archiviata';

  @override
  String detailCompletedOn(String date) {
    return 'Completata il $date';
  }

  @override
  String get detailSectionDetails => 'Dettagli';

  @override
  String get detailSectionReminders => 'Promemoria';

  @override
  String get detailAllStepsDone => 'Tutti i passi fatti';

  @override
  String get detailNextEyebrow => 'Prossimo';

  @override
  String get detailCompleteQuestion => 'Completare questa attività?';

  @override
  String get detailMarkStepDone => 'Segna il passo come fatto';

  @override
  String get detailCompleteAction => 'Completa questa attività';

  @override
  String get detailAddDeadline => 'Aggiungi una scadenza';

  @override
  String get detailAddAmount => 'Aggiungi un importo';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed di $total fatti';
  }

  @override
  String get detailNoStepsTitle => 'Ancora nessun passo';

  @override
  String get detailNoStepsMessage =>
      'Spezza questo nelle mosse che devi davvero fare.';

  @override
  String get detailAddFirstStep => 'Aggiungi il primo passo';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Passo completato: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Passo successivo: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Passo: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Segna «$title» come fatto';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Segna «$title» come non fatto';
  }

  @override
  String get detailStepOptions => 'Opzioni del passo';

  @override
  String get detailMoveUp => 'Sposta su';

  @override
  String get detailMoveDown => 'Sposta giù';

  @override
  String get detailDeleteStep => 'Elimina il passo';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Eliminare questo passo?';

  @override
  String get stepDeleteKeep => 'Tienilo';

  @override
  String get detailNoRemindersYet => 'Ancora nessun promemoria.';

  @override
  String get detailReminderLimit =>
      'È il massimo dei promemoria che un\'attività può avere. Rimuovine uno per aggiungerne un altro.';

  @override
  String get detailAddReminder => 'Aggiungi promemoria';

  @override
  String get detailChangeReminder => 'Cambia il promemoria';

  @override
  String get detailRemoveReminder => 'Rimuovi il promemoria';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Non ancora impostato';

  @override
  String get reminderStateNotificationsOff =>
      'Salvato, ma le notifiche sono spente';

  @override
  String get reminderStateFailed => 'Non è stato possibile programmarlo';

  @override
  String get reminderStateRemoving => 'Rimozione…';

  @override
  String get reminderSetConfirmation =>
      'Promemoria impostato. Ti daremo una spinta.';

  @override
  String get reminderUpdatedConfirmation => 'Promemoria aggiornato.';

  @override
  String get reminderNeedsPermission =>
      'Le notifiche sono spente, quindi questo promemoria è salvato ma non può ancora avvisarti.';

  @override
  String get reminderScheduleFailed =>
      'Questo promemoria è salvato, ma Android non ha voluto programmarlo.';

  @override
  String get reminderLimitReached =>
      'Quell\'attività ha già il numero massimo di promemoria.';

  @override
  String get reminderTimeInPast => 'Quell\'ora è già passata.';

  @override
  String get reminderAddTitle => 'Aggiungi un promemoria';

  @override
  String get reminderChangeTitle => 'Cambia questo promemoria';

  @override
  String get reminderDateLabel => 'Data';

  @override
  String get reminderTimeLabel => 'Ora';

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
    return 'Ti avviseremo il $date alle $time.';
  }

  @override
  String get reminderTimePastError =>
      'Quell\'ora è già passata. Scegline una più tardi.';

  @override
  String get reminderSet => 'Imposta il promemoria';

  @override
  String get reminderPresetInHour => 'Tra 1 ora';

  @override
  String get reminderPresetTomorrowMorning => 'Domani mattina';

  @override
  String get reminderPresetNextWeek => 'La settimana prossima';

  @override
  String get reminderPresetOnTheDay => 'Il giorno stesso';

  @override
  String get reminderPresetDayBefore => '1 giorno prima';

  @override
  String get reminderPresetWeekBefore => '1 settimana prima';

  @override
  String get reminderPresetAtDeadline => 'Alla scadenza';

  @override
  String get reminderPresetHourBefore => '1 ora prima';

  @override
  String get editNextStepTitle => 'Prossimo passo consigliato';

  @override
  String get editNextStepSubtitle =>
      'Una frase breve sulla prossima mossa utile.';

  @override
  String get editNextStepHint => 'Qual è la prossima mossa utile?';

  @override
  String get editRemoveSuggestion => 'Rimuovi il suggerimento';

  @override
  String get editUrgencyTitle => 'Quanto è urgente?';

  @override
  String get editStepHint => 'Una cosa concreta da fare';

  @override
  String get editAddStep => 'Aggiungi passo';

  @override
  String get editDateHint => 'AAAA-MM-GG';

  @override
  String get editRemoveDeadline => 'Rimuovi la scadenza';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Salva l\'importo';

  @override
  String get editRemoveAmount => 'Rimuovi l\'importo';

  @override
  String get securityTitle => 'Sicurezza e privacy';

  @override
  String get securitySectionProtection => 'Protezione';

  @override
  String get securityAppLockUnavailable =>
      'Il blocco dell\'app ha bisogno di un blocco schermo su questo dispositivo. Imposta prima un PIN, una sequenza, una password o un\'impronta nelle impostazioni del dispositivo.';

  @override
  String get securityAppLockOn =>
      'Action chiede al tuo dispositivo di confermare che sei tu.';

  @override
  String get securityAppLockOff =>
      'Richiedi la tua impronta, il volto o il PIN del dispositivo per aprire Action.';

  @override
  String get securityAskAgain => 'Chiedi di nuovo';

  @override
  String get securityAskAgainDescription =>
      'Per quanto Action può restare in secondo piano prima di bloccarsi.';

  @override
  String get securityScreenPrivacy => 'Privacy dello schermo';

  @override
  String get securityScreenPrivacyDescription =>
      'Chiedi ad Android di bloccare screenshot e registrazione dello schermo, e di nascondere Action nel selettore delle app.';

  @override
  String get securityPrivateReminders => 'Promemoria privati';

  @override
  String get securityPrivateRemindersOn =>
      'I promemoria dicono solo che qualcosa ti aspetta.';

  @override
  String get securityPrivateRemindersOff =>
      'I promemoria mostrano il titolo dell\'attività. Attiva questo per tenerlo fuori dalla schermata di blocco.';

  @override
  String get securityLockNow => 'Blocca ora';

  @override
  String get securityLockNowDescription => 'Chiudere la porta senza aspettare.';

  @override
  String get securitySectionStorage => 'Come sono conservati i tuoi dati';

  @override
  String get securityStorageDataLabel =>
      'Le tue attività, acquisizioni e impostazioni';

  @override
  String get securityStorageDataDetail =>
      'Stanno nell\'archivio privato di questa app, che le altre app non possono leggere e che Android cifra come parte della cifratura del dispositivo. Action non aggiunge un secondo strato tutto suo sopra.';

  @override
  String get securityStorageKeyLabel => 'La tua chiave del fornitore di IA';

  @override
  String get securityStorageKeyDetail =>
      'Tenuta nel Keystore di Android anziché insieme al resto, e mai più mostrata dopo che l\'hai salvata.';

  @override
  String get securityStorageGapLabel => 'Cosa questo non copre';

  @override
  String get securityStorageGapDetail =>
      'Niente di tutto ciò difende da chi usa il tuo dispositivo sbloccato, e un sistema modificato o con permessi di root può leggere più di uno normale. Il blocco dell\'app è il controllo che aiuta con il primo caso.';

  @override
  String get securitySectionInformation => 'Le tue informazioni';

  @override
  String get securityWhereInfoDescription =>
      'Ogni strada che i tuoi dati possono prendere, e le due che lasciano questo dispositivo.';

  @override
  String get securityAppLockRefused =>
      'Non confermato, quindi non è cambiato nulla.';

  @override
  String get securityAppLockUnavailableToast =>
      'Su questo dispositivo non c\'è alcun blocco schermo. Aggiungi un PIN, una sequenza, una password o un\'impronta nelle impostazioni del dispositivo, poi riprova.';

  @override
  String get securityScreenPrivacyRefused =>
      'Questo dispositivo non ha voluto applicare la privacy dello schermo, quindi è stata lasciata spenta invece che mostrata come attiva.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count promemoria programmati ora dicono meno.',
      one: '1 promemoria programmato ora dice meno.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count promemoria programmati aggiornati.',
      one: '1 promemoria programmato aggiornato.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Subito';

  @override
  String get appLockDelayOneMinute => 'Dopo 1 minuto';

  @override
  String get appLockDelayFiveMinutes => 'Dopo 5 minuti';

  @override
  String get securityDelayImmediatelyDescription =>
      'Ogni volta che Action lascia lo schermo';

  @override
  String get securityDelayOneMinuteDescription =>
      'Quanto basta per rispondere a un messaggio';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Quanto basta per rispondere a una chiamata';

  @override
  String get securityHeroProtected => 'Protetto';

  @override
  String get securityHeroNothingOn => 'Niente attivato';

  @override
  String get securityHeroFootnote =>
      'Tutto quello che c\'è qui funziona su questo dispositivo. Nessuna di queste impostazioni viene inviata da nessuna parte, e nessuna può essere cambiata da remoto.';

  @override
  String get securityHeadlineNone => 'Ci sono tre protezioni disponibili';

  @override
  String securityHeadlineOne(String first) {
    return '$first è attiva';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first e $second sono attive';
  }

  @override
  String get securityHeadlineAll => 'Tutte e tre le protezioni sono attive';

  @override
  String get securityTransfersTitle => 'Cosa ha lasciato questo dispositivo';

  @override
  String get securityTransfersNoProvider =>
      'Non c\'è alcun fornitore di IA collegato, quindi non viene inviato proprio nulla da analizzare.';

  @override
  String get securityTransfersDescription =>
      'Annotato qui nel momento in cui qualcosa viene inviato, che sia tornata una risposta o no. Solo lo strumento, il fornitore e la dimensione — mai cosa c\'era dentro. Conservato 90 giorni su questo dispositivo e inviato da nessuna parte.';

  @override
  String get securityClear => 'Cancella';

  @override
  String get securityNothingSent => 'Non è stato inviato nulla';

  @override
  String get securityNothingSentDescription =>
      'Quando userai uno strumento che si serve del tuo fornitore di IA, comparirà qui.';

  @override
  String get securityClearHistoryTitle => 'Cancellare questa cronologia?';

  @override
  String get securityClearHistoryBody =>
      'Il registro di cosa è stato inviato sarà eliminato da questo dispositivo. Non annulla nulla di ciò che è già stato inviato.';

  @override
  String get securityUnnamedTool => 'Uno strumento Intelligence';

  @override
  String get securityYourProvider => 'il tuo fornitore di IA';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '1 pagina',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'un testo breve';

  @override
  String securityTransferCharacters(int count) {
    return '$count mila caratteri';
  }

  @override
  String securitySentTo(String provider) {
    return 'Inviato a $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Inviato a $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return '$count sett. fa';
  }

  @override
  String get helpTitle => 'Aiuto';

  @override
  String get helpAddQuestion => 'Cosa posso aggiungere?';

  @override
  String get helpAddAnswer =>
      'Uno screenshot, una foto di una lettera o di una bolletta, o del testo che incolli. Funziona meglio tutto ciò che ha una data, un importo o una richiesta.';

  @override
  String get helpReviewQuestion => 'Perché Action mi chiede di controllare?';

  @override
  String get helpReviewAnswer =>
      'Perché una macchina che legge un documento può leggerlo male, e una scadenza sbagliata in silenzio è peggio di nessuna scadenza. Action mostra cosa ha trovato e da quali parole viene, e non viene salvato niente finché non lo confermi.';

  @override
  String get helpVaryQuestion => 'Perché i risultati cambiano se riprovo?';

  @override
  String get helpVaryAnswer =>
      'Il servizio che legge il tuo documento non è deterministico, quindi la stessa acquisizione può tornare leggermente diversa. È anche per questo che esiste il passaggio di controllo — sei tu la parte che non cambia.';

  @override
  String get helpLateQuestion => 'Perché il mio promemoria è arrivato tardi?';

  @override
  String get helpLateAnswer =>
      'I promemoria sono programmati tramite Android, ed è Android a decidere esattamente quando consegnarli. Il risparmio batteria, Doze e le impostazioni di energia del produttore possono ritardarne uno. Action non promette mai un promemoria al minuto.';

  @override
  String get helpDataQuestion => 'Dove sono i miei dati?';

  @override
  String get helpDataAnswer =>
      'Quasi tutti sono su questo dispositivo: le tue acquisizioni, attività, passi, promemoria e ricerche. Due eccezioni — il contenuto che chiedi ad Action di leggere viene inviato al servizio di IA che lo legge, e un breve registro di un\'attività confermata può essere conservato nel cloud sotto un identificativo anonimo. Privacy e dati, nelle Impostazioni, elenca esattamente cosa contiene quel registro.';

  @override
  String get helpBackupQuestion => 'È un backup?';

  @override
  String get helpBackupAnswer =>
      'No. Il registro nel cloud non può essere ripristinato su un nuovo dispositivo, e non c\'è nessun account a cui accedere. Se disinstalli Action o perdi questo dispositivo, i dati che c\'erano sopra sono persi.';

  @override
  String get helpCorrectQuestion => 'Come correggo un\'attività?';

  @override
  String get helpCorrectAnswer =>
      'Aprila e modifica qualsiasi campo — il titolo, la scadenza, l\'importo o il passo successivo suggerito. Puoi aggiungere, riordinare, completare ed eliminare passi in qualsiasi momento. Modificare un\'attività non chiede mai niente al servizio di IA.';

  @override
  String get privacyTitle => 'Privacy e dati';

  @override
  String get privacyIntro =>
      'Action tiene su questo dispositivo tutto quello che può. Due cose fanno eccezione, ed entrambe sono elencate qui sotto.';

  @override
  String get privacyGroupOnDevice => 'Su questo dispositivo';

  @override
  String get privacyOnDeviceCaptures =>
      'Acquisizioni — gli screenshot, le foto e i testi che aggiungi, e il testo letto da essi.';

  @override
  String get privacyOnDeviceActions =>
      'Attività, con i loro passi, dati e promemoria.';

  @override
  String get privacyOnDeviceSearch =>
      'Ricerca. Le tue ricerche girano qui, non vengono mai inviate da nessuna parte, e non restano dopo che chiudi la schermata.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Le foto sono conservate senza la loro posizione. Le coordinate, l\'ora e i dati della fotocamera che un telefono scrive dentro un\'immagine vengono rimossi prima che l\'acquisizione sia salvata, quindi non restano qui e non sono inclusi quando invii un\'acquisizione al tuo fornitore di IA.';

  @override
  String get privacyGroupSentToRead => 'Inviato per essere letto';

  @override
  String get privacySentToReadWhat =>
      'Quando chiedi ad Action di interpretare un\'acquisizione, quel contenuto viene inviato al servizio di IA che lo legge. Questa non è IA sul dispositivo.';

  @override
  String get privacySentToReadWhen =>
      'Viene inviata solo l\'acquisizione che hai scelto, e solo quando lo chiedi.';

  @override
  String get privacyGroupYourProvider => 'Inviato al tuo fornitore di IA';

  @override
  String get privacyProviderWhat =>
      'Se colleghi un fornitore di IA nelle Impostazioni, gli strumenti Intelligence inviano il contenuto che selezioni a quel fornitore — OpenAI, Anthropic, Google o un endpoint che hai scelto — usando la tua chiave API.';

  @override
  String get privacyProviderDirect =>
      'Va direttamente a loro. Non passa da nessun server che appartenga ad Action.';

  @override
  String get privacyProviderScope =>
      'Viene inviato solo ciò che scegli per uno strumento, e solo quando lo esegui. Le tue altre attività, acquisizioni e fonti non sono mai incluse, e non viene mai inviato niente in secondo piano.';

  @override
  String get privacyProviderKey =>
      'La tua chiave API è tenuta nell\'archivio sicuro di questo dispositivo e viene inviata solo al fornitore a cui appartiene. L\'archivio sicuro è un ostacolo reale per chi ha il tuo dispositivo sbloccato, ma non è assoluto, e Action non sosterrà il contrario.';

  @override
  String get privacyProviderLocalTools =>
      'Due strumenti non inviano mai niente: nascondere dati sensibili e controllare da dove viene un file. Entrambi funzionano interamente su questo dispositivo.';

  @override
  String get privacyProviderAgreement =>
      'Cosa fa il tuo fornitore con ciò che invii è regolato dal tuo accordo con lui, non da Action.';

  @override
  String get privacyGroupCloud => 'Conservato nel cloud';

  @override
  String get privacyCloudWhat =>
      'Quando confermi un\'attività, un breve registro può essere salvato sotto un identificativo anonimo di questa installazione: titolo, stato, urgenza, categoria, scadenza, importo, passo successivo suggerito e marche temporali.';

  @override
  String get privacyCloudNotSent =>
      'Le tue acquisizioni, il testo letto da esse, i passi e i dati di un\'attività e i tuoi promemoria non vengono inviati.';

  @override
  String get privacyCloudNotBackup =>
      'Questo non è un backup. Non c\'è modo di ripristinarlo su un nuovo dispositivo, e perdere questa installazione porta via con sé l\'identificativo anonimo.';

  @override
  String get privacyGroupDiagnostics => 'Diagnostica';

  @override
  String get privacyDiagnosticsWhat =>
      'Action registra conteggi anonimi di cosa succede nell\'app — che un\'acquisizione è iniziata, che un\'estrazione è riuscita o no, che una ricerca non ha trovato niente, che un\'attività è stata completata.';

  @override
  String get privacyDiagnosticsCounts =>
      'Sono conteggi, non contenuti. Non vi compare mai nessun titolo, importo, scadenza, riferimento, testo acquisito o termine di ricerca, e nemmeno l\'identificativo anonimo o un qualsiasi identificativo di attività o acquisizione.';

  @override
  String get privacyDiagnosticsCrash =>
      'Se l\'app va in crash, l\'errore e il punto in cui è avvenuto vengono segnalati perché possa essere corretto. Action non allega i tuoi dati a quelle segnalazioni.';

  @override
  String get privacySectionYourData => 'I tuoi dati';

  @override
  String get privacyYourDataFootnote =>
      'Cancellare le acquisizioni lascia le tue attività al loro posto. Un\'attività la cui acquisizione non c\'è più funziona ancora; semplicemente non mostra più da dove è nata.';

  @override
  String get privacyClearCaptures => 'Cancella le acquisizioni';

  @override
  String get privacyClearCapturesDescription =>
      'Elimina ogni acquisizione e il suo file immagine.';

  @override
  String get privacyDeleteAll => 'Elimina tutti i miei dati';

  @override
  String get privacyDeleteAllDescription =>
      'Attività, passi, promemoria, acquisizioni e i registri nel cloud qui sopra.';

  @override
  String get privacyClearCapturesTitle => 'Cancellare le acquisizioni?';

  @override
  String get privacyClearCapturesBody =>
      'Ogni acquisizione e la sua immagine saranno eliminate da questo dispositivo. Le tue attività restano esattamente come sono.';

  @override
  String get privacyCapturesDeleted => 'Acquisizioni eliminate.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Alcune acquisizioni non è stato possibile eliminarle. Nient\'altro è stato cambiato.';

  @override
  String get privacyDeleteAllTitle => 'Eliminare tutti i tuoi dati?';

  @override
  String get privacyDeleteAllBody =>
      'Questo elimina ogni attività, passo, promemoria e acquisizione su questo dispositivo, e i registri nel cloud elencati sopra. Non si può annullare, e non c\'è nessun backup da cui ripristinare.';

  @override
  String get privacyDeleteEverything => 'Elimina tutto';

  @override
  String get privacyDeletedAll => 'È stato eliminato tutto.';

  @override
  String get privacyDeleteFailed =>
      'Non è stato possibile eliminare i tuoi dati.';

  @override
  String get privacyDeletedUnverified =>
      'Tutto quello che era su questo dispositivo è stato eliminato. Action non è riuscita a raggiungere il cloud per confermare che lì non resti niente, e controllerà di nuovo.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Eliminato, tranne $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action riproverà.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action non è riuscita a finire il controllo del cloud, e riproverà.';

  @override
  String get privacyLeftoverCaptures => 'alcune acquisizioni';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registri nel cloud',
      one: '1 registro nel cloud',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first e $second';
  }

  @override
  String get privacyCloudDeleted =>
      'I registri nel cloud sono stati eliminati.';

  @override
  String get privacyCloudUnreachable =>
      'Ancora non è stato possibile raggiungerli. Action riproverà.';

  @override
  String get privacyPendingTitle => 'Ancora da eliminare';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count registri nel cloud non sono stati raggiunti l\'ultima volta. Action riproverà da sola, oppure puoi riprovare adesso.',
      one: '1 registro nel cloud non è stato raggiunto l\'ultima volta. Action riproverà da sola, oppure puoi riprovare adesso.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Riprova';

  @override
  String get evidenceTitle => 'Da dove viene';

  @override
  String get evidenceUnverified =>
      'Action non ha trovato queste parole nel testo che ha letto, quindi questo valore non è stato riscontrato. Confrontalo con l\'originale prima di farci affidamento.';

  @override
  String get evidenceHighlighted =>
      'Queste parole erano nel testo che Action ha letto da questa acquisizione, e l\'evidenziazione mostra dove.';

  @override
  String get evidenceNoRegion =>
      'Queste parole erano nel testo che Action ha letto da questa acquisizione. Non è riuscita a capire in che punto esatto dell\'immagine si trovino, e non tira a indovinare.';

  @override
  String get evidenceInText =>
      'Queste parole erano nel testo che questa acquisizione contiene.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Critica';

  @override
  String get urgencyImportant => 'Importante';

  @override
  String get urgencyNormal => 'Normale';

  @override
  String get urgencyLow => 'Bassa';

  @override
  String get urgencyUnsure => 'Non è chiaro';

  @override
  String get detailSaveFailed =>
      'Non è stato possibile salvare. Non è andato perso nulla — riprova.';

  @override
  String get detailSectionCreatedFrom => 'Creata da';

  @override
  String get detailSourceChecking => 'Recupero dell\'acquisizione originale…';

  @override
  String get detailSourceUnavailable =>
      'L\'acquisizione originale non è più disponibile.';

  @override
  String get detailReopenAction => 'Riapri l\'attività';

  @override
  String get detailMarkActionComplete => 'Segna l\'attività come completata';

  @override
  String get detailGetHelp => 'Fatti aiutare con questo';

  @override
  String get detailSectionHistory => 'Cronologia';

  @override
  String get detailHistoryShowLess => 'Mostra meno';

  @override
  String detailHistoryShowAll(int count) {
    return 'Mostra tutte le $count voci';
  }

  @override
  String get detailHistoryCreated => 'Creata';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Creata con $count passi',
      one: 'Creata con 1 passo',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'Hai confermato i dati';

  @override
  String detailHistoryStepFinished(String title) {
    return 'Completato «$title»';
  }

  @override
  String get detailHistoryAStep => 'un passo';

  @override
  String get detailHistoryReminderSet => 'Hai impostato un promemoria';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'Hai impostato un promemoria per $when';
  }

  @override
  String get detailHistoryCompleted => 'Segnata come fatta';

  @override
  String get detailHistoryChanged => 'Ultima modifica';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Personalizzato (compatibile con OpenAI)';

  @override
  String get aiCapabilityText => 'testo';

  @override
  String get aiCapabilityImages => 'immagini';

  @override
  String get aiCapabilityDocuments => 'documenti';

  @override
  String get aiCapabilityStructuredResults => 'risultati strutturati';

  @override
  String get aiCapabilityStreaming => 'streaming';

  @override
  String get aiCapabilitySystemInstructions => 'istruzioni di sistema';

  @override
  String get aiCapabilityEvidenceCitations => 'citazioni delle prove';

  @override
  String get aiCapabilityLongDocuments => 'documenti lunghi';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a o $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head o $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'Collega un fornitore di IA per usare questo strumento.';

  @override
  String get aiFailureInvalidKey =>
      'Quella chiave API non è stata accettata dal fornitore.';

  @override
  String get aiFailureQuotaExceeded =>
      'Il tuo account presso il fornitore ha esaurito il credito o ha raggiunto la sua quota.';

  @override
  String get aiFailureRateLimited =>
      'Il tuo fornitore sta limitando la frequenza delle richieste. Riprova tra poco.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action non è riuscita a raggiungere il tuo fornitore di IA. Controlla la connessione.';

  @override
  String get aiFailureUnsupportedModel =>
      'Quel modello non è disponibile per la tua chiave. Scegline un altro nelle Impostazioni.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'Il modello che hai scelto non può leggere $capabilities. Scegli un altro modello nelle Impostazioni.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'Era troppo contenuto perché questo modello lo leggesse in una volta sola.';

  @override
  String get aiFailureInputTooLargeText =>
      'Questo è più testo di quanto se ne possa analizzare in una volta sola.';

  @override
  String get aiFailureProviderUnavailable =>
      'Il tuo fornitore di IA sta avendo problemi. Riprova tra poco.';

  @override
  String get aiFailureMalformedResponse =>
      'Quel fornitore ha restituito qualcosa che Action non è riuscita a leggere.';

  @override
  String get aiFailureCancelled => 'Interrotto.';

  @override
  String get aiFailureInsecureEndpoint =>
      'Quell\'endpoint deve essere un indirizzo https://.';

  @override
  String get aiFailureUnknown =>
      'Qualcosa è andato storto nel dialogo con il tuo fornitore di IA.';

  @override
  String get appLockTitle => 'Action è bloccata';

  @override
  String get appLockPrompt =>
      'Conferma che sei tu per continuare. Action lo chiede al tuo dispositivo — non vede mai la tua impronta, il tuo volto o il tuo PIN.';

  @override
  String get appLockUnlocking => 'Sblocco in corso…';

  @override
  String get appLockNotConfirmed =>
      'Non è stato confermato. Riprova quando sei pronto.';

  @override
  String get appLockCannotConfirm =>
      'Il tuo dispositivo non può confermare che sei tu in questo momento. Controlla che nelle impostazioni del dispositivo ci sia ancora un blocco schermo.';

  @override
  String get appLockWaiting => 'In attesa…';

  @override
  String get appLockUnlock => 'Sblocca';

  @override
  String get appLockReasonUnlock => 'Sblocca Action';

  @override
  String get appLockReasonEnable =>
      'Conferma che sei tu prima di attivare il Blocco app';

  @override
  String get appLockReasonDisable =>
      'Conferma che sei tu prima di disattivare il Blocco app';

  @override
  String get todayCapabilityHeading => 'Di cosa si occupa Action';

  @override
  String get todayCapabilityDocumentTitle => 'Una lettera o una bolletta';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action la legge e trova la scadenza, l\'importo e il riferimento.';

  @override
  String get todayCapabilityScreenshotTitle => 'Uno screenshot';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Trasforma un messaggio che altrimenti dimenticheresti in qualcosa su cui puoi agire.';

  @override
  String get todayCapabilityTextTitle => 'Del testo';

  @override
  String get todayCapabilityTextBlurb =>
      'Incolla qualsiasi cosa. Action capisce di cosa si tratta e cosa ti chiede.';

  @override
  String get todayCapabilityConfirmTitle => 'Confermi tu tutto';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Niente diventa un\'attività finché non hai visto le prove e detto di sì.';

  @override
  String get todayCapabilityExploreIntelligence => 'Esplora l\'Intelligenza';

  @override
  String get documentRejectedEmpty => 'Quel file è vuoto.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'Quel documento è $size, più grande di quanto Action possa gestire.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'Quello non è un PDF, comunque si chiami. Action legge PDF e immagini.';

  @override
  String get documentRejectedUnreadable =>
      'Non è stato possibile leggere quel documento.';

  @override
  String get pdfRejectedNotAPdf =>
      'Quel file non è un PDF, comunque si chiami.';

  @override
  String get pdfRejectedEncrypted =>
      'Quel PDF è protetto da password, quindi Action non può leggerlo.';

  @override
  String get pdfRejectedDamaged =>
      'Non è stato possibile leggere quel PDF. Potrebbe essere incompleto.';

  @override
  String get shareRejectedEmpty =>
      'In quella condivisione non c\'era niente da leggere.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action accetta testo, immagini e PDF. Quello era qualcos\'altro.';

  @override
  String get shareRejectedContentMismatch =>
      'Quel file non è del tipo che dichiara di essere, quindi Action non l\'ha aperto.';

  @override
  String get shareRejectedTooLarge =>
      'Quel file è troppo grande perché Action possa gestirlo.';

  @override
  String get shareRejectedUnreadable =>
      'Non è stato possibile leggere quel file.';

  @override
  String get captureFailureRecognition =>
      'Non è stato possibile eseguire il riconoscimento del testo.';

  @override
  String get captureFailureImageFormat =>
      'Non è stato possibile leggere quel formato di immagine su questo dispositivo.';

  @override
  String get connectSheetTitle => 'Collega la tua IA';

  @override
  String get connectSheetSubtitle =>
      'Usi il tuo account presso il fornitore e la tua chiave API. Action conserva la chiave nell\'archivio sicuro di questo dispositivo.';

  @override
  String get connectErrorKeyMissing =>
      'Incolla la tua chiave API per continuare.';

  @override
  String get connectErrorModelMissing =>
      'Scegli un modello, oppure digita l\'id di un modello.';

  @override
  String get connectErrorEndpointMissing =>
      'Aggiungi l\'indirizzo del tuo endpoint.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'Non è stato possibile aprire l\'archivio sicuro di questo dispositivo, quindi la chiave non è stata salvata.';

  @override
  String get connectTestSucceeded => 'Collegato.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Collegato. $count modelli disponibili.';
  }

  @override
  String get connectProviderLabel => 'Fornitore';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'Deve essere un indirizzo https://. Action non invierà i tuoi documenti su una connessione non cifrata.';

  @override
  String get connectApiKeyLabel => 'Chiave API';

  @override
  String get connectApiKeyHint => 'Incolla la tua chiave';

  @override
  String get connectKeyPrivacyNote =>
      'La tua chiave resta su questo dispositivo. Action non la invia mai da nessuna parte tranne che al fornitore che hai scelto, e dopo il salvataggio non può più mostrartela.';

  @override
  String get connectModelLabel => 'Modello';

  @override
  String get connectModelIdHint => 'Id del modello';

  @override
  String get connectModelFreeTextNote =>
      'I fornitori ritirano gli id dei modelli e ne aggiungono di nuovi. Se quello che ti serve non è in elenco, digitalo qui.';

  @override
  String get connectAndTest => 'Collega e prova';

  @override
  String get connectSaveWithoutTesting => 'Salva senza provare';

  @override
  String get toolWarningFactsNotChecked =>
      'Action non è riuscita a confrontare questo con il testo originale, quindi gli importi e le date che contiene non sono stati controllati.';

  @override
  String get toolTitleRewrite => 'Migliora questo testo';

  @override
  String get toolDescriptionRewrite =>
      'Più chiaro, più breve o più formale — i dati restano intatti.';

  @override
  String get toolModeRewriteClearer => 'Più chiaro';

  @override
  String get toolModeRewriteProfessional => 'Più professionale';

  @override
  String get toolModeRewriteShorter => 'Più breve';

  @override
  String get toolModeRewritePersuasive => 'Più persuasivo';

  @override
  String get toolModeRewriteSimpler => 'Più semplice';

  @override
  String get toolModeRewriteStructured => 'Più strutturato';

  @override
  String get toolModeRewriteGrammarOnly => 'Solo grammatica';

  @override
  String get toolSectionWhatChanged => 'Cosa è cambiato';

  @override
  String get toolSectionNote => 'Nota';

  @override
  String get toolSectionAlreadyClearBody =>
      'Era già chiaro. Le modifiche qui sotto sono minime.';

  @override
  String get toolSectionImprovedText => 'Testo migliorato';

  @override
  String get toolTitleDraftReply => 'Abbozza una risposta';

  @override
  String get toolDescriptionDraftReply =>
      'Una risposta che puoi modificare e inviare tu stesso.';

  @override
  String get toolModeReplyProfessional => 'Professionale';

  @override
  String get toolModeReplyConcise => 'Conciso';

  @override
  String get toolModeReplyFriendly => 'Cordiale';

  @override
  String get toolModeReplyFormal => 'Formale';

  @override
  String get toolModeReplyClarification => 'Chiedi chiarimenti';

  @override
  String get toolModeReplyConfirmation => 'Conferma di ricezione';

  @override
  String get toolModeReplyDispute => 'Contesta questo';

  @override
  String get toolSectionSubject => 'Oggetto';

  @override
  String get toolSectionDraftReply => 'Bozza di risposta';

  @override
  String get toolSectionPlaceholders => 'Devi completare tu queste parti';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Bozza — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'Questa è una bozza. Action non invia niente — leggila, modificala e inviala tu stesso.';

  @override
  String get toolTitleTranslate => 'Traduci';

  @override
  String get toolDescriptionTranslate =>
      'Un\'altra lingua, con i numeri e i nomi che restano intatti.';

  @override
  String get toolSectionTranslation => 'Traduzione';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'Da $from a $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'Lasciati nell\'originale';

  @override
  String get toolWarningTranslationNotCertified =>
      'Una traduzione per capire, non una traduzione giurata.';

  @override
  String get toolTitleStructuredData => 'Estrai una tabella';

  @override
  String get toolDescriptionStructuredData =>
      'Righe, campi e cifre che puoi copiare altrove.';

  @override
  String get toolSectionTable => 'Tabella';

  @override
  String get toolSectionFields => 'Campi';

  @override
  String get toolSectionTableCsv => 'Tabella (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'Non è stato possibile leggere in modo affidabile la disposizione delle colonne di questa tabella. Controlla che le righe siano allineate prima di usarle.';

  @override
  String get toolTitleDeadlineFinder => 'Trova le scadenze';

  @override
  String get toolDescriptionDeadlineFinder =>
      'Cosa è da fare, entro quando, e cosa succede se non viene fatto.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count scadenze',
      one: '1 scadenza',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Niente in scadenza';

  @override
  String get toolSectionNothingDueBody =>
      'Action non ha trovato scadenze né obblighi in questo materiale.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'Niente viene programmato finché non lo scegli tu. I promemoria non vengono mai impostati automaticamente.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'In caso contrario: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'Ti serve: $items';
  }

  @override
  String get moneyErrorEmpty => 'nessun importo indicato';

  @override
  String get moneyErrorMalformed => 'l\'importo non è un numero semplice';

  @override
  String get moneyErrorNegative =>
      'un importo negativo non è una somma da pagare';

  @override
  String get moneyErrorTooManyDecimals =>
      'più decimali di quanti ne abbia la valuta';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'il codice valuta non è uno di quelli che riconosciamo';

  @override
  String get moneyErrorOutOfRange => 'l\'importo è inverosimilmente grande';

  @override
  String get escalationOcrFailed =>
      'Non è stato affatto possibile eseguire il riconoscimento su questa acquisizione.';

  @override
  String get escalationNoTextRecognised =>
      'Questo sembra un documento, ma non è stato riconosciuto alcun testo.';

  @override
  String get escalationThinText =>
      'È stato riconosciuto decisamente troppo poco testo per un documento di queste dimensioni.';

  @override
  String get escalationLowLineConfidence =>
      'Il riconoscitore ha segnalato un\'affidabilità bassa su diverse righe.';

  @override
  String get escalationTableLikeLayout =>
      'L\'impaginazione sembra una tabella, e leggerla riga per riga fa perdere quale valore appartiene a quale riga.';

  @override
  String get escalationFragmentedLayout =>
      'Il testo è tornato in tanti frammenti minuscoli, quindi la struttura non è chiara.';

  @override
  String get escalationMalformedText =>
      'Gran parte del testo riconosciuto non è fatta di parole o numeri leggibili.';

  @override
  String get escalationConflictingDates =>
      'Più di una data è presentata come scadenza.';

  @override
  String get escalationConflictingAmounts =>
      'Più di un importo è presentato come la somma dovuta.';

  @override
  String get escalationUnresolvedGrounding =>
      'Non è stato possibile riscontrare alcuni valori nel testo del documento.';

  @override
  String get escalationInstructionLikeContent =>
      'Il documento contiene testo scritto come se fosse istruzioni per l\'app. Viene trattato come contenuto del documento, mai come istruzioni.';

  @override
  String get providerFailureNetwork =>
      'Action non è riuscita a raggiungere il servizio. Controlla la connessione.';

  @override
  String get providerFailureTimedOut =>
      'Il servizio ha impiegato troppo tempo a rispondere.';

  @override
  String get providerFailureServiceUnavailable =>
      'Il servizio è temporaneamente non disponibile. Riprova più tardi.';

  @override
  String get providerFailureUnauthorized =>
      'Questa app non è autorizzata a usare il servizio in questo momento.';

  @override
  String get providerFailureBlocked =>
      'Il servizio ha rifiutato di elaborare questo documento.';

  @override
  String get providerFailureUnknown =>
      'Action non è riuscita a leggere questo documento. Riprovare potrebbe funzionare.';

  @override
  String get reviewBlockerTitle => 'Dai un titolo a questa attività.';

  @override
  String get reviewBlockerDate =>
      'Scegli quale data è la vera scadenza, oppure lasciala non impostata.';

  @override
  String get reviewBlockerAmount =>
      'Scegli quale importo è quello giusto, oppure lascialo non impostato.';

  @override
  String get reviewBlockerStepTitle =>
      'I passi che conservi hanno bisogno di un titolo.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'pagina $page',
      one: 'pagina 1',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'pagine $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'La riscrittura non contiene più $values. Controllala prima di usarla.',
      one:
          'La riscrittura non contiene più $values. Controllala prima di usarla.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'La riscrittura non contiene più $values e altri $count valori. Controllala prima di usarla.',
      one:
          'La riscrittura non contiene più $values e 1 altro valore. Controllala prima di usarla.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Raggiunto';

  @override
  String get goalNewSheetTitle => 'Cosa vuoi far accadere?';

  @override
  String get goalNewSheetSubtitle =>
      'Basta una frase. I dettagli puoi aggiungerli dopo.';

  @override
  String get goalTitleHint =>
      'Rinnovare l\'assicurazione auto senza pagare troppo.';

  @override
  String get goalCreateAction => 'Crea obiettivo';

  @override
  String get goalTitleSheetTitle => 'Cosa vuoi';

  @override
  String get goalOutcomeSheetTitle => 'Com\'è quando è fatto';

  @override
  String get goalContextSheetTitle => 'A che punto è';

  @override
  String get goalOutcomeHint =>
      'L\'auto è assicurata e i documenti sono archiviati.';

  @override
  String get goalContextHint => 'Ho due preventivi e il rinnovo è il 18.';

  @override
  String get goalWorkspaceTitle => 'Obiettivo';

  @override
  String get goalUnmarkReached => 'Dopotutto non raggiunto';

  @override
  String get goalMarkReached => 'Segna come raggiunto';

  @override
  String get goalNotFound => 'Quell\'obiettivo non c\'è più.';

  @override
  String get goalDeleteTitle => 'Eliminare questo obiettivo?';

  @override
  String get goalDeleteBody =>
      'L\'obiettivo viene rimosso da questo dispositivo. Le attività nate da esso restano esattamente come sono.';

  @override
  String get goalOutcomeLabel => 'Cosa vuol dire averlo fatto';

  @override
  String get goalOutcomeEmpty =>
      'Non l\'hai ancora scritto. Un obiettivo è più facile da pianificare quando hai già detto cosa significa portarlo a termine.';

  @override
  String get goalContextLabel => 'A che punto è';

  @override
  String get goalContextEmpty =>
      'Ancora niente di scritto. Cosa è successo finora, e cosa c\'è di mezzo.';

  @override
  String get goalTitleLabel => 'Cosa vuoi';

  @override
  String get goalEditTooltip => 'Modifica l\'obiettivo';

  @override
  String get goalToolsLabel => 'Cosa può fare Action';

  @override
  String get goalToolsNotReady =>
      'Scrivi un po\' di più su cosa vuoi, e questi strumenti avranno qualcosa su cui lavorare.';

  @override
  String get toolGoalOptimizerTitle => 'Affinare un obiettivo';

  @override
  String get toolActionPlanTitle => 'Costruire un piano';

  @override
  String get resultFactUnconfirmed => 'Senza conferma';

  @override
  String get resultSuggestedSteps => 'Passi suggeriti';

  @override
  String get resultSuggestedAction => 'Attività suggerita';

  @override
  String get resultWorthAsking => 'Vale la pena chiedere';

  @override
  String get resultSuggestedDeadlines => 'Scadenze suggerite';

  @override
  String get resultSuggestions => 'Suggerimenti';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count citazioni a sostegno',
      one: '1 citazione a sostegno',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'Dalla fonte selezionata';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Preparazione del tuo documento';

  @override
  String get toolRunStageReading => 'Lettura delle pagine selezionate';

  @override
  String get toolRunStageAnalysing => 'Analisi';

  @override
  String get toolRunStageBuilding => 'Composizione della tua verifica';

  @override
  String get toolRunStageDone => 'Completato';

  @override
  String get toolRunStageFailed => 'Non è arrivato a termine';

  @override
  String get toolRunStageCancelled => 'Interrotto';

  @override
  String get toolRunFailureLocalCheckFailed =>
      'Non è stato possibile controllarlo.';

  @override
  String get toolRunFailureProviderRetired =>
      'Quel fornitore di IA non è più disponibile in questa versione.';

  @override
  String get toolRunFailureUnusableReply =>
      'Quella risposta non è tornata in una forma utilizzabile. Riprova.';

  @override
  String get toolRunFailureQuestionRequired => 'Prima scrivi una domanda.';

  @override
  String get toolRunFailureInputRequired =>
      'Scegli qualcosa su cui far lavorare questo strumento.';

  @override
  String get toolWarningReplyTruncated =>
      'Questa risposta si è interrotta prima della fine, quindi potrebbe essere incompleta.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Il tuo modello non ha restituito nessuna citazione a sostegno, quindi niente di quanto c\'è qui ha un riscontro. Confrontalo con il documento prima di agire di conseguenza.';

  @override
  String get aiSettingsRemoveTitle => 'Rimuovere questo collegamento?';

  @override
  String get aiSettingsRemoveBody =>
      'Action eliminerà la tua chiave API da questo dispositivo e smetterà di usare le funzioni di IA. Il tuo account presso il fornitore non viene toccato.';

  @override
  String get aiSettingsProviderLabel => 'Fornitore';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'A fatturarti quello che usi è il tuo fornitore. Action non fa mai una richiesta per conto suo.';

  @override
  String get aiSettingsConnectLabel => 'Collega un fornitore di IA';

  @override
  String get aiSettingsConnectDescription =>
      'Usa il tuo account e la tua chiave API con OpenAI, Anthropic, Google Gemini o un endpoint compatibile.';

  @override
  String get aiSettingsModelLabel => 'Modello';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'Chiave API';

  @override
  String get aiSettingsKeyStored =>
      'Tenuta nell\'archivio sicuro di questo dispositivo.';

  @override
  String get aiSettingsKeyMissing =>
      'Nessuna chiave trovata su questo dispositivo. Collegati di nuovo per aggiungerne una.';

  @override
  String get aiSettingsTestLabel => 'Prova il collegamento';

  @override
  String get aiSettingsProviderUnavailable =>
      'Quel fornitore non è disponibile in questa versione.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Collegato. $count modelli disponibili.';
  }

  @override
  String get aiSettingsTestButton => 'Prova';

  @override
  String get aiSettingsChangeProvider => 'Cambia fornitore o modello';

  @override
  String get aiSettingsRemoveKey => 'Rimuovi la chiave';

  @override
  String get aiSettingsSectionPrivacy => 'Privacy';

  @override
  String get aiSettingsWhatGetsSentLabel => 'Cosa viene inviato';

  @override
  String get aiSettingsWhereItGoesLabel => 'Dove va';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'Non viene inviato niente finché non colleghi un fornitore.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Direttamente a $provider, usando la tua chiave. Non passa dai server di Action.';
  }

  @override
  String get aiSettingsSectionData => 'Dati';

  @override
  String get aiSettingsDataFootnote =>
      'Action ricorda quali strumenti hai usato, mai su cosa li hai usati.';

  @override
  String get aiSettingsRecentToolsLabel => 'Strumenti usati di recente';

  @override
  String get aiSettingsRecentToolsNone => 'Nessuno';

  @override
  String get reminderNotificationTitle => 'Promemoria di Action';

  @override
  String get reminderNotificationPrivateBody => 'Hai qualcosa da controllare.';

  @override
  String get reminderChannelName => 'Promemoria di Action';

  @override
  String get reminderChannelDescription =>
      'I promemoria che imposti tu stesso per le tue attività.';

  @override
  String get onboardingStart => 'Inizia a usare Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'Passo $current di $total';
  }

  @override
  String get onboardingCaptureTitle => 'Trasforma le informazioni in attività';

  @override
  String get onboardingCaptureBody =>
      'Aggiungi uno screenshot, una foto o un testo che ti hanno mandato. Action lo legge e ne ricava cosa ti sta chiedendo di fare.';

  @override
  String get onboardingReviewTitle =>
      'Niente viene salvato finché non lo confermi';

  @override
  String get onboardingReviewBody =>
      'Action ti mostra cosa ha trovato e da quali parole viene. Tu correggi ciò che è sbagliato. Finché non confermi, è un suggerimento — non un fatto, e non un\'attività.';

  @override
  String get onboardingTrackingTitle => 'Tieni sott\'occhio ciò che conta';

  @override
  String get onboardingTrackingBody =>
      '«Richiede attenzione» porta in primo piano ciò che è in ritardo o in scadenza. Ogni attività conserva il suo prossimo passo, i suoi progressi e qualsiasi promemoria tu abbia impostato per essa.';

  @override
  String get onboardingPrivacyBody => 'Da sapere prima di cominciare:';

  @override
  String get onboardingPrivacyOnDevice =>
      'Le tue attività, acquisizioni, promemoria e ricerche sono conservate su questo dispositivo. Ricerca e promemoria funzionano senza connessione.';

  @override
  String get onboardingPrivacySentToRead =>
      'Quando chiedi ad Action di leggere qualcosa, quel contenuto viene inviato al servizio di IA che lo interpreta.';

  @override
  String get onboardingPrivacyCloud =>
      'Un breve registro di un\'attività confermata — il suo titolo, le date, l\'importo e il passo suggerito — può essere salvato nel cloud sotto un identificativo anonimo di questo dispositivo. Le tue acquisizioni, i passi e i promemoria no.';

  @override
  String get onboardingPrivacyNotBackup =>
      'Quel registro non è un backup. Non può ripristinare niente su un nuovo dispositivo.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ostacoli',
      one: '1 ostacolo',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Si potrebbe semplificare';

  @override
  String get toolDescriptionGoalOptimizer =>
      'Cosa manca, cosa lo blocca, da cosa cominciare.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'Dopo: $step';
  }

  @override
  String get toolSectionThePlan => 'Il piano';

  @override
  String get toolDescriptionActionPlan =>
      'Una serie ordinata di passi che puoi trasformare in attività.';

  @override
  String get toolTitleSmartChecklist => 'Fare una lista di controllo';

  @override
  String get toolDescriptionSmartChecklist =>
      'Tutto ciò che questo ti chiede, in ordine.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dettagli mancanti',
      one: '1 dettaglio mancante',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'Questi si contraddicono a vicenda';

  @override
  String get toolTitleMissingInformation => 'Cosa manca';

  @override
  String get toolDescriptionMissingInformation =>
      'Le lacune, e cosa chiedere al riguardo.';

  @override
  String get aiAdapterTimedOut => 'Ci ha messo troppo ed è stato interrotto.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'La connessione sicura al tuo fornitore di IA non è riuscita.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action non è riuscita a trovare quel modello o quell\'endpoint.';

  @override
  String get aiAdapterRequestRejected =>
      'Il tuo fornitore di IA ha rifiutato quella richiesta.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action non è riuscita ad aprire l\'archivio sicuro di questo dispositivo.';

  @override
  String get aiAdapterEndpointMissing =>
      'Aggiungi nelle Impostazioni l\'indirizzo del tuo endpoint di IA.';

  @override
  String get aiAdapterReplyIncomplete =>
      'Quella risposta era incompleta. Riprova.';

  @override
  String get aiAdapterContentDeclined =>
      'Il tuo fornitore si è rifiutato di elaborare quel contenuto.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'Sono più di $limit file in una volta sola. Selezionane di meno.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'Una di quelle immagini è troppo grande per essere analizzata.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '«$filename» è troppo grande per essere analizzato. Il limite è $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '«$filename» ha $count pagine. Action ne legge al massimo $limit alla volta — scegli un intervallo.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'Quella selezione è troppo grande per essere inviata in una sola richiesta.';

  @override
  String get toolRunNotAvailableTitle => 'Quello strumento non è disponibile';

  @override
  String get toolRunNotAvailableMessage =>
      'Potrebbe essere stato rimosso in una versione più recente di Action.';

  @override
  String get toolRunNoSourcesYet =>
      'Ancora niente su cui lavorare. Acquisisci qualcosa, oppure incolla del testo qui sotto.';

  @override
  String get toolRunChooseSourcesToCompare => 'Scegli cosa confrontare';

  @override
  String get toolRunChooseSource => 'Scegli una fonte';

  @override
  String get toolRunQuestionLabel => 'La tua domanda';

  @override
  String get toolRunQuestionHint => 'Qual è la scadenza?';

  @override
  String get toolRunFreeTextLabel => 'Oppure incolla del testo';

  @override
  String get toolRunFreeTextHint => 'Incolla o scrivi qui';

  @override
  String get toolRunModeLabel => 'Tipo';

  @override
  String get toolRunRunLocally => 'Controlla su questo dispositivo';

  @override
  String get toolRunRun => 'Esegui';

  @override
  String get toolRunStop => 'Interrompi';

  @override
  String get toolRunRunAgain => 'Esegui di nuovo';

  @override
  String get toolRunWorkingOn => 'Oggetto:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'Inviare questo a $provider?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'Il contenuto che hai selezionato sarà inviato a $provider per essere elaborato, usando la tua chiave API.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'La tua chiave resta su questo dispositivo. Action non invia niente in secondo piano, e non invia le tue altre attività o fonti.';

  @override
  String get toolRunScopeTitle => 'Prima che questo venga eseguito';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Verranno analizzate $count pagine usando il tuo collegamento a $provider.',
      one: 'Verrà analizzata 1 pagina usando il tuo collegamento a $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Verranno analizzati $count file usando il tuo collegamento a $provider.',
      one: 'Verrà analizzato 1 file usando il tuo collegamento a $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'Il testo che hai selezionato sarà inviato al tuo collegamento a $provider.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Collega un fornitore di IA per usare questo strumento';

  @override
  String get toolRunNeedsProviderBody =>
      'Usi il tuo account presso il fornitore e la tua chiave API.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Attività creata a partire da $count passi.',
      one: 'Attività creata a partire da 1 passo.',
    );
    return '$_temp0';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count passi aggiunti.',
      one: '1 passo aggiunto.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count passi',
      one: '1 passo',
    );
    return 'Crea un\'attività · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count passi',
      one: '1 passo',
    );
    return 'Aggiungi a questa attività · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Foto';

  @override
  String get sourceTypeLabelScreenshot => 'Screenshot';

  @override
  String get sourceTypeLabelPastedText => 'Nota incollata';

  @override
  String get sourceTypeLabelDocument => 'Documento';

  @override
  String get toolModeClearer => 'Più chiaro';

  @override
  String get toolModeMoreProfessional => 'Più professionale';

  @override
  String get toolModeShorter => 'Più breve';

  @override
  String get toolModeSimpler => 'Più semplice';

  @override
  String get toolModeMoreStructured => 'Più strutturato';

  @override
  String get toolModeMorePersuasive => 'Più persuasivo';

  @override
  String get toolModeGrammarOnly => 'Solo la grammatica';

  @override
  String get toolModeProfessional => 'Professionale';

  @override
  String get toolModeConcise => 'Conciso';

  @override
  String get toolModeFriendly => 'Cordiale';

  @override
  String get toolModeFormal => 'Formale';

  @override
  String get toolModeAskForClarification => 'Chiedi chiarimenti';

  @override
  String get toolModeConfirm => 'Conferma';

  @override
  String get toolModeDispute => 'Contesta';

  @override
  String get toolModeQuick => 'Rapido';

  @override
  String get toolModeDetailed => 'Dettagliato';

  @override
  String get toolModeExecutive => 'Direzionale';

  @override
  String get toolModeKeyPoints => 'Punti chiave';

  @override
  String get toolModeActionFocused => 'Centrato sulle attività';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count dettagli citati non sono stati trovati in ciò che hai selezionato, quindi sono contrassegnati come incerti.',
      one: 'Un dettaglio citato non è stato trovato in ciò che hai selezionato, quindi è contrassegnato come incerto.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action non è riuscita a controllare queste citazioni con il file stesso, quindi non sono state riscontrate.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'In ritardo · $count giorni',
      one: 'In ritardo · 1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Scade domani';

  @override
  String get triageBadgeReminderSoon => 'Promemoria a breve';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'In ritardo di $count giorni',
      one: 'In ritardo di 1 giorno',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'Questa è fatta.';

  @override
  String get triageExplanationNothingPressing =>
      'È qui perché per ora non ha niente di pressante.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'Questa richiede attenzione perché $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'Questa sta più in basso perché $reason.';
  }

  @override
  String get triageReasonOverdue => 'è in ritardo';

  @override
  String get triageReasonDeadlinePassed => 'la sua scadenza è passata';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'è in ritardo di $count giorni',
      one: 'è in ritardo di un giorno',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'scade oggi';

  @override
  String get triageReasonCriticalDueSoon =>
      'l\'hai segnata come critica e la sua scadenza è vicina';

  @override
  String get triageReasonAllStepsDone =>
      'ogni passo è fatto — resta solo da completarla';

  @override
  String get triageReasonDueTomorrow => 'scade domani';

  @override
  String get triageReasonReminderSoon =>
      'le hai impostato un promemoria entro il prossimo giorno';

  @override
  String get triageReasonDueWithinThreeDays => 'scade entro tre giorni';

  @override
  String get triageReasonCriticalNoDeadline =>
      'l\'hai segnata come critica, e non ha scadenza';

  @override
  String get triageReasonDueWithinSevenDays => 'scade entro una settimana';

  @override
  String get triageReasonImportant => 'l\'hai segnata come importante';

  @override
  String get triageReasonDueLater => 'la sua scadenza è più lontana';

  @override
  String get triageReasonNoDeadline =>
      'non ha scadenza e non c\'è niente di pressante';

  @override
  String cardCompletedTooltip(String title) {
    return 'Completata: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Capire questo documento';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'Cos\'è, cosa conta, e cosa fare al riguardo.';

  @override
  String get toolSectionWhatThisIs => 'Che cos\'è';

  @override
  String get toolSectionWhatMatters => 'Cosa conta';

  @override
  String get toolSectionKeyDetails => 'Dettagli principali';

  @override
  String get toolTitleAskDocument => 'Fai domande su una fonte';

  @override
  String get toolDescriptionAskDocument =>
      'Risposte fondate su ciò che hai selezionato — oppure niente.';

  @override
  String get toolSectionNoAnswer => 'Nessuna risposta in questo materiale';

  @override
  String get toolSectionNoAnswerBody =>
      'Action non è riuscita a trovarlo nel documento selezionato.';

  @override
  String get toolSectionAnswer => 'Risposta';

  @override
  String get toolSectionFromTheDocument => 'Dal documento';

  @override
  String get toolWarningQuoteNotFound =>
      'La citazione su cui si basa questa risposta non è nel materiale selezionato. Considera la risposta inaffidabile.';

  @override
  String get toolTitleSmartSummary => 'Riassumi';

  @override
  String get toolDescriptionSmartSummary =>
      'La versione breve — o la parte che cambia cosa devi fare.';

  @override
  String get toolSectionKeyPoints => 'Punti chiave';

  @override
  String get toolTitleCompareDocuments => 'Confronta i documenti';

  @override
  String get toolDescriptionCompareDocuments =>
      'Cosa è cambiato, cosa è in contraddizione, cosa manca.';

  @override
  String get toolSectionWhatDiffers => 'Cosa differisce';

  @override
  String get toolSectionConflicts => 'Contraddizioni';

  @override
  String get toolSectionOnlyInOne => 'Solo in uno di questi';

  @override
  String get toolSectionInCommon => 'In comune';

  @override
  String get sensitiveKindEmail => 'Indirizzo email';

  @override
  String get sensitiveKindPhone => 'Numero di telefono';

  @override
  String get sensitiveKindPaymentCard => 'Numero di carta di pagamento';

  @override
  String get sensitiveKindIban => 'Conto bancario (IBAN)';

  @override
  String get sensitiveKindNationalId => 'Numero di identità nazionale';

  @override
  String get sensitiveKindPostcode => 'CAP';

  @override
  String get sensitiveKindAccountNumber => 'Numero di conto';

  @override
  String get sensitiveKindReference => 'Numero di riferimento';

  @override
  String get sensitiveKindDateOfBirth => 'Data di nascita';

  @override
  String get sensitiveKindUrl => 'Indirizzo web';

  @override
  String get verdictVerifiedProvenance => 'Provenienza verificata disponibile';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'Questo file porta una firma che è stata controllata e ha retto.';

  @override
  String get verdictSignalsSynthetic =>
      'Segnali compatibili con contenuto generato dall\'IA';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'Questo file dichiara di essere stato creato con uno strumento generativo. I metadati possono essere modificati o rimossi, quindi questo è ciò che il file afferma, non una prova.';

  @override
  String get verdictSignalsEdited =>
      'Segnali compatibili con contenuto modificato';

  @override
  String get verdictSignalsEditedExplainer =>
      'Questo file dichiara di essere passato per un software di modifica. È una cosa comune per le fotografie e di per sé non significa che qualcosa sia stato falsificato.';

  @override
  String get verdictNoReliableProvenance =>
      'Nessuna provenienza affidabile trovata';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'In questo file non ci sono informazioni sulla provenienza. È normale — quasi tutti i servizi le rimuovono — e non è indizio di niente.';

  @override
  String get verdictInconclusive => 'Non concludente';

  @override
  String get verdictInconclusiveExplainer =>
      'Qui non ci sono abbastanza informazioni per dire da dove viene.';

  @override
  String get authenticitySignalCamera => 'Fotocamera';

  @override
  String get authenticitySignalSoftware => 'Software';

  @override
  String get authenticitySignalDescription => 'Descrizione';

  @override
  String get authenticitySignalCopyright => 'Copyright';

  @override
  String get authenticitySignalLocation => 'Posizione';

  @override
  String get authenticitySignalLocationValue =>
      'In questo file sono presenti dati di posizione.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Non controllato — questa build non ha un verificatore di firme.';

  @override
  String get authenticitySignalFile => 'File';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'Non è stato possibile leggerlo come immagine.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'Non è un formato immagine riconosciuto.';

  @override
  String get authenticitySignalText => 'Testo';

  @override
  String get authenticitySignalTextValue =>
      'Il testo da solo non può dire in modo affidabile se sia stata usata l\'IA. Action non tira a indovinare.';

  @override
  String get fileTypePng => 'un\'immagine PNG';

  @override
  String get fileTypeJpeg => 'un\'immagine JPEG';

  @override
  String get fileTypeGif => 'un\'immagine GIF';

  @override
  String get fileTypeWebp => 'un\'immagine WebP';

  @override
  String get fileTypeWav => 'una registrazione WAV';

  @override
  String get fileTypePdf => 'un documento PDF';

  @override
  String get fileTypeHeic => 'un\'immagine HEIC';

  @override
  String get fileTypeVideo => 'un file video';

  @override
  String get fileTypeTiff => 'un\'immagine TIFF';

  @override
  String get fileTypeBitmap => 'un\'immagine bitmap';

  @override
  String get fileTypeRtf => 'un documento RTF';

  @override
  String get fileTypeZip => 'un archivio Zip';

  @override
  String get fileTypeGzip => 'un archivio gzip';

  @override
  String get fileTypeSevenZip => 'un archivio 7-Zip';

  @override
  String get fileTypeRar => 'un archivio RAR';

  @override
  String get fileTypeWindowsProgram => 'un programma Windows';

  @override
  String get fileTypeLinuxProgram => 'un programma Linux';

  @override
  String get fileTypePostScript => 'un documento PostScript';

  @override
  String get fileTypeOgg => 'una registrazione Ogg';

  @override
  String get fileTypeMp3 => 'una registrazione MP3';

  @override
  String get fileTypePlainText => 'testo semplice';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'Questo file si chiama \".$extension\" ma il suo contenuto è $contents. Può essere un errore in buona fede, ed è anche il modo in cui un file finisce per essere aperto da qualcosa di diverso da quello che ti aspettavi.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count byte',
      one: '1 byte',
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
  String get credentialKindPrivateKey => 'Chiave privata';

  @override
  String get credentialKindApiKey => 'Chiave API';

  @override
  String get credentialKindConnectionString => 'Stringa di connessione';

  @override
  String get credentialKindAccessToken => 'Token di accesso';

  @override
  String get credentialKindAuthorizationHeader => 'Header Authorization';

  @override
  String get credentialKindPasswordOrKey => 'Password o chiave';

  @override
  String get credentialKindPossibleSecret => 'Possibile segreto';

  @override
  String get credentialAdvicePrivateKey =>
      'Rimuovila prima di condividere, e sostituisci la coppia di chiavi. Una chiave privata non può più essere resa sicura una volta che è stata vista.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Revoca questa chiave presso il fornitore e generane una nuova. Rimuoverla dal documento non la disattiva.';

  @override
  String get credentialAdviceConnectionString =>
      'Contiene una password e l\'indirizzo che quella password apre. Cambia la password se questa stringa è già stata condivisa.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Token come questo spesso scadono, ma non sempre. Consideralo attivo, a meno che tu non sappia quando scade.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Rimuovi il valore dell\'header. I log di richieste incollati sono uno dei modi più comuni in cui un token funzionante viene condiviso per sbaglio.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Spostalo in una variabile d\'ambiente o in un archivio di segreti, e cambia il valore se il file è stato condiviso.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action non riesce a capire cosa sia. Controllalo prima di condividere — può essere tanto un identificativo quanto un checksum.';

  @override
  String get credentialLabelAnthropicApiKey => 'Chiave API Anthropic';

  @override
  String get credentialLabelOpenAiProjectKey => 'Chiave di progetto OpenAI';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'Chiave API in stile OpenAI';

  @override
  String get credentialLabelGoogleApiKey => 'Chiave API Google';

  @override
  String get credentialLabelGoogleOAuthToken => 'Token OAuth Google';

  @override
  String get credentialLabelGitHubToken => 'Token GitHub';

  @override
  String get credentialLabelSlackToken => 'Token Slack';

  @override
  String get credentialLabelAwsAccessKeyId => 'ID della chiave di accesso AWS';

  @override
  String get credentialLabelGitLabToken => 'Token GitLab';

  @override
  String get credentialLabelNpmToken => 'Token npm';

  @override
  String get credentialLabelPassphrase => 'Passphrase';

  @override
  String get credentialLabelPassword => 'Password';

  @override
  String get credentialLabelRefreshToken => 'Token di aggiornamento';

  @override
  String get credentialLabelToken => 'Token';

  @override
  String get credentialLabelClientSecret => 'Segreto client';

  @override
  String get credentialLabelCredential => 'Credenziale';

  @override
  String get credentialLabelSecret => 'Segreto';

  @override
  String get linkVerdictNoObviousSignals => 'Nessun segnale evidente';

  @override
  String get linkVerdictWorthChecking => 'Vale la pena controllare';

  @override
  String get linkVerdictTreatWithCaution => 'Da trattare con cautela';

  @override
  String get linkSummaryNoObviousSignals =>
      'Niente di insolito nel modo in cui questo link è scritto. Non è la stessa cosa che sapere se la pagina è affidabile — solo tu puoi giudicare se te lo aspettavi.';

  @override
  String get linkSummaryWorthChecking =>
      'Una cosa di questo link merita un\'occhiata prima di aprirlo.';

  @override
  String get linkSummaryTreatWithCaution =>
      'Diverse cose nel modo in cui questo link è scritto meritano un controllo prima di aprirlo.';

  @override
  String get linkSignalNotHttps => 'Non cifrato';

  @override
  String get linkSignalNonWebScheme => 'Non è un link web';

  @override
  String get linkSignalEmbeddedCredentials => 'Password nel link';

  @override
  String get linkSignalMisleadingAuthority => 'Indirizzo reale nascosto';

  @override
  String get linkSignalIpLiteralHost => 'Indirizzo numerico';

  @override
  String get linkSignalPunycodeHost => 'Caratteri codificati nel nome';

  @override
  String get linkSignalMixedScriptHost => 'Alfabeti misti nel nome';

  @override
  String get linkSignalEncodedHost => 'Caratteri di escape nel nome';

  @override
  String get linkSignalUnusualPort => 'Porta insolita';

  @override
  String get linkSignalDeepSubdomain => 'Molte parti nel nome';

  @override
  String get linkSignalPublicSuffixInSubdomain =>
      'Nome familiare nel posto sbagliato';

  @override
  String get linkSignalShortener => 'Link accorciato';

  @override
  String get linkSignalExecutableTarget => 'Scarica un programma';

  @override
  String get linkSignalRedirectParameter => 'Ti manda da un\'altra parte';

  @override
  String get linkSignalVeryLongUrl => 'Molto lungo';

  @override
  String get linkSignalUnparseable => 'Non leggibile come link';

  @override
  String get linkDetailNotHttps =>
      'Questo link usa http, quindi tutto ciò che digiti nella pagina può essere letto lungo il tragitto.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'Questo si apre con \"$scheme:\" invece che con una pagina web. Potrebbe chiedere a un\'altra app di fare qualcosa.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'In questo link sono scritti un nome utente e una password. Ovunque venga condiviso, se li porta dietro.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'Tutto ciò che precede la \"@\" viene ignorato dal browser. La destinazione reale è \"$host\".';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'Questo porta a \"$host\" — un indirizzo grezzo invece di un nome. I siti legittimi usano quasi sempre un nome.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'Il nome del sito contiene caratteri non latini, memorizzati in forma codificata. È normale per molte lingue, ed è anche il modo in cui un nome può essere fatto assomigliare a uno familiare.';

  @override
  String get linkDetailMixedScriptHost =>
      'Il nome del sito mescola lettere latine con lettere di un altro alfabeto che hanno lo stesso aspetto. Leggilo carattere per carattere.';

  @override
  String get linkDetailEncodedHost =>
      'Il nome del sito contiene codici di escape, che non è il posto in cui dovrebbero stare. Possono nascondere cosa dice davvero il nome.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'Questo si collega sulla porta $port invece che su quella solita. È comune per i server di prova e insolito per i siti pubblici.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Il nome ha $count parti. Solo le ultime due decidono chi gestisce il sito; il resto può essere impostato a piacere.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'Questo nome contiene \".$suffix.\" nel mezzo, il che fa sembrare l\'inizio il sito vero e proprio. Il sito in realtà è \"$host\".';
  }

  @override
  String get linkDetailShortener =>
      'Un servizio di accorciamento nasconde la destinazione reale. Non puoi sapere dove porta senza aprirlo.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'Questo link finisce con \"$fileExtension\", quindi scarica qualcosa che può essere eseguito sul tuo dispositivo invece di una pagina da leggere.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'Questo link porta un secondo indirizzo nell\'impostazione \"$parameter\", quindi aprirlo potrebbe portarti da qualche parte diversa da \"$host\".';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'I link lunghi sono più difficili da leggere, e la parte che decide la destinazione può finire fuori dalla vista.';

  @override
  String get linkDetailUnparseable =>
      'Action non è riuscita a leggerlo come indirizzo web. Fai attenzione ai link che non sembrano link.';

  @override
  String get toolTitleRedaction => 'Nascondi i dati sensibili';

  @override
  String get toolDescriptionRedaction =>
      'Trova ciò che non andrebbe condiviso, e fanne una copia ripulita.';

  @override
  String get toolSectionRedactionNothingToScan => 'Niente da analizzare';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'Questo strumento legge il testo. Seleziona una nota, un messaggio incollato o un\'acquisizione di cui il testo è stato letto.';

  @override
  String get toolSectionRedactionNothingFound =>
      'Non è stato trovato niente di evidente';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'In questo testo Action non ha trovato indirizzi email, numeri di telefono, numeri di carta né numeri di riferimento.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cose che vale la pena nascondere',
      one: '1 cosa che vale la pena nascondere',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Copia con omissis';

  @override
  String get toolWarningRedactionCoverage =>
      'Questo trova schemi come email, numeri di telefono e numeri di conto. Non intercetterà tutto ciò che è sensibile — leggi la copia prima di condividerla.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action non può applicare omissis a immagini o file PDF. Coprire qualcosa in un\'immagine lascerebbe l\'originale sotto, quindi non viene offerto.';

  @override
  String get toolTitleAuthenticity => 'Controlla da dove viene';

  @override
  String get toolDescriptionAuthenticity =>
      'Ciò che un file dichiara sulla propria origine.';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'Niente da ispezionare';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Seleziona un\'immagine o del testo.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'Ciò che questo file dice di sé';

  @override
  String get toolSectionAuthenticityFileItself => 'Il file in sé';

  @override
  String get toolSectionFileContents => 'Contenuto';

  @override
  String get toolSectionFileUnknownFormat =>
      'Non è un formato che Action conosce';

  @override
  String get toolSectionFileSize => 'Dimensione';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'Questo riporta ciò che un file dichiara di sé. I metadati possono essere modificati o rimossi, quindi niente di tutto ciò è una prova. Non usarlo per accusare qualcuno.';

  @override
  String get toolTitleCredentialScanner => 'Cerca chiavi e password';

  @override
  String get toolDescriptionCredentialScanner =>
      'Trova credenziali prima di condividere qualcosa.';

  @override
  String get toolSectionCredentialNothingToCheck => 'Niente da controllare';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Incolla del testo, oppure scegli un\'acquisizione di cui il testo è stato letto. Questo strumento legge solo testo.';

  @override
  String get toolSectionCredentialNoneFound => 'Nessuna credenziale trovata';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'In questo testo Action non ha trovato niente che abbia la forma di una chiave API, di una chiave privata, di un token o di una password.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count credenziali trovate',
      one: '1 credenziale trovata',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cose che potrebbero essere segreti',
      one: '1 cosa che potrebbe essere un segreto',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Copia con le credenziali rimosse';

  @override
  String get toolWarningCredentialRevoke =>
      'Rimuovere una chiave da un documento non la disattiva. Se una di queste è già stata condivisa, revocala presso il fornitore e generane una nuova.';

  @override
  String get toolWarningCredentialCoverage =>
      'Questo trova credenziali con una forma riconoscibile. Una password scritta per esteso dentro una frase non verrà trovata, quindi leggi anche il testo.';

  @override
  String get toolTitleLinkInspector => 'Controlla un link';

  @override
  String get toolDescriptionLinkInspector =>
      'Ciò che un indirizzo rivela prima che tu lo apra.';

  @override
  String get toolSectionLinkNoneFound => 'Nessun link trovato';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Incolla un link, oppure scegli un\'acquisizione che ne contenga uno.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count link in questo testo',
      one: 'Il link in questo testo',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'Non leggibile';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'Niente di insolito nel modo in cui sono scritti';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'Non è la stessa cosa che sapere se le pagine sono affidabili. Solo tu puoi giudicare se te le aspettavi.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action legge solo l\'indirizzo. Non apre il link, non cerca informazioni sul sito e non consulta alcun servizio di reputazione — farlo manderebbe la tua navigazione da qualche parte.';

  @override
  String get toolWarningLinkNoSignals =>
      'Un link senza segnali può comunque essere dannoso. Questo trova problemi nel modo in cui un indirizzo è scritto, che non è tutto ciò che c\'è da sapere su dove porta.';

  @override
  String get toolSectionObjective => 'Il tuo obiettivo';

  @override
  String get toolSectionCurrentState => 'A che punto è l\'obiettivo';

  @override
  String get toolSectionRecommendedNextStep => 'Prossimo passo consigliato';

  @override
  String get toolSectionCredentialAdvice => 'Cosa fare';

  @override
  String get toolSectionSummary => 'Sintesi';

  @override
  String get toolDetailSeparator => ' · ';
}
