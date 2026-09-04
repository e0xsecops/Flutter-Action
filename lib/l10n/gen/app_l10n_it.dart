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
}
