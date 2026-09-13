// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppL10nFr extends AppL10n {
  AppL10nFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonDone => 'Terminé';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonBack => 'Retour';

  @override
  String get commonRetry => 'Réessayer';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonRemove => 'Retirer';

  @override
  String get commonContinue => 'Continuer';

  @override
  String get commonOpen => 'Ouvrir';

  @override
  String get commonCopy => 'Copier';

  @override
  String get commonCopied => 'Copié';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonAdd => 'Ajouter';

  @override
  String get commonOn => 'Activé';

  @override
  String get commonOff => 'Désactivé';

  @override
  String get commonUnknown => 'Inconnu';

  @override
  String get commonChecking => 'Vérification…';

  @override
  String get commonSettings => 'Réglages';

  @override
  String get commonDismiss => 'Ignorer';

  @override
  String get commonUndo => 'Annuler l\'action';

  @override
  String get commonSkip => 'Passer';

  @override
  String get commonNotNow => 'Pas maintenant';

  @override
  String get commonSomethingWentWrong => 'Un problème est survenu.';

  @override
  String get navToday => 'Aujourd\'hui';

  @override
  String get navLibrary => 'Bibliothèque';

  @override
  String get navIntelligence => 'Intelligence';

  @override
  String get navSearch => 'Recherche';

  @override
  String get navCapture => 'Capturer quelque chose';

  @override
  String get todayGreetingMorning => 'Bonjour';

  @override
  String get todayGreetingAfternoon => 'Bon après-midi';

  @override
  String get todayGreetingEvening => 'Bonsoir';

  @override
  String get todayDateFormat => 'EEEE · d MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Vos tâches n\'ont pas pu être chargées. Elles restent enregistrées sur cet appareil.';

  @override
  String get todaySectionNeedsAttention => 'Demande votre attention';

  @override
  String get todaySectionAlsoNeedsAttention => 'Demande aussi votre attention';

  @override
  String get todaySectionWaitingForReview => 'En attente de vérification';

  @override
  String get todaySectionComingUp => 'À venir';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Voir les $count captures';
  }

  @override
  String get todaySeeAllInLibrary => 'Tout voir dans la Bibliothèque';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count terminées',
      one: '1 terminée',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tâches terminées. Ouvrir la bibliothèque.',
      one: '1 tâche terminée. Ouvrir la bibliothèque.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'COMMENCEZ PAR';

  @override
  String get todayQuickPhoto => 'Photo';

  @override
  String get todayQuickScreenshot => 'Capture d\'écran';

  @override
  String get todayQuickText => 'Texte';

  @override
  String get todayQuickTools =>
      'Vérifier un lien, ou repérer des clés dans un texte';

  @override
  String get briefBadgeNeedsYou => 'VOUS ÊTES ATTENDU';

  @override
  String get briefBadgeToReview => 'À VÉRIFIER';

  @override
  String get briefBadgeAhead => 'À VENIR';

  @override
  String get briefBadgeStartHere => 'COMMENCEZ ICI';

  @override
  String get briefBadgeClear => 'RIEN EN COURS';

  @override
  String get briefNext => 'SUIVANT';

  @override
  String briefOpenAction(String title) {
    return 'Ouvrir $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Marquer « $title » comme terminée';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tâches demandent votre attention',
      one: '1 tâche demande votre attention',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count captures attendent aussi une vérification.',
      one: '1 capture attend aussi une vérification.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count captures vous attendent',
      one: '1 capture vous attend',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Rien n\'est en retard.';

  @override
  String get briefHeadlineNothingToday => 'Rien ne vous attend aujourd\'hui';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tâches arrivent bientôt.',
      one: '1 tâche arrive bientôt.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Vous êtes à jour';

  @override
  String get briefDetailClear => 'Rien n\'est dû et rien n\'attend.';

  @override
  String get briefHeadlineFirstRun => 'Commencez par n\'importe quoi';

  @override
  String get briefDetailFirstRun =>
      'Une lettre, une capture d\'écran, une note — Action détermine ce que c\'est.';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get settingsSectionPersonalise => 'Personnaliser';

  @override
  String get settingsAppearance => 'Apparence';

  @override
  String get settingsAppearanceDescription =>
      'Clair, sombre, ou ce que fait l\'appareil.';

  @override
  String get settingsLanguageDescription =>
      'La langue dans laquelle Action vous parle.';

  @override
  String get appearanceSystem => 'Système';

  @override
  String get appearanceLight => 'Clair';

  @override
  String get appearanceDark => 'Sombre';

  @override
  String get appearanceSystemDescription => 'Suivre le réglage de l\'appareil';

  @override
  String get appearanceLightDescription => 'Toujours clair';

  @override
  String get appearanceDarkDescription => 'Toujours sombre';

  @override
  String get languageTitle => 'Langue';

  @override
  String get languageSubtitle =>
      'Les changements s\'appliquent immédiatement. Rien n\'est envoyé nulle part ; le choix reste sur cet appareil.';

  @override
  String get languageSectionChoose => 'Choisir une langue';

  @override
  String get languageSystem => 'Système';

  @override
  String get languageSystemDescription => 'Suivre la langue de l\'appareil';

  @override
  String get languageDraftNote =>
      'L\'anglais est la langue dans laquelle les textes d\'Action ont été écrits. Les autres traductions ont été préparées à partir d\'un glossaire fixe et vérifiées automatiquement ; aucun locuteur natif ne les a encore relues. Là où la formulation exacte compte — confidentialité, sécurité, ce qu\'Action affirme et ce qu\'il refuse d\'affirmer — l\'anglais reste la référence.';

  @override
  String get ocrScriptTitle => 'Reconnaissance de texte';

  @override
  String get ocrScriptSubtitle =>
      'Le système d\'écriture qu\'Action lit quand elle regarde une photo. La reconnaissance a lieu sur cet appareil ; aucune capture n\'est envoyée où que ce soit pour être lue.';

  @override
  String get ocrScriptSectionChoose => 'Système d\'écriture';

  @override
  String get ocrScriptFollowLanguage => 'Suivre la langue de l\'app';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Actuellement $script';
  }

  @override
  String get ocrScriptLatin => 'Latin';

  @override
  String get ocrScriptChinese => 'Chinois';

  @override
  String get ocrScriptDevanagari => 'Devanagari';

  @override
  String get ocrScriptJapanese => 'Japonais';

  @override
  String get ocrScriptKorean => 'Coréen';

  @override
  String get ocrScriptLatinDescription =>
      'L\'anglais, l\'espagnol, le français, l\'allemand et les autres langues écrites en lettres latines.';

  @override
  String get ocrScriptChineseDescription =>
      'Chinois simplifié et traditionnel.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Le hindi, le marathi et le népalais. Pas le bengali, le tamoul ni le télougou — chacun de ces trois est un système d\'écriture différent.';

  @override
  String get ocrScriptJapaneseDescription => 'Japonais.';

  @override
  String get ocrScriptKoreanDescription => 'Coréen.';

  @override
  String get ocrScriptFootnote =>
      'Tous les choix sauf le latin lisent aussi les lettres latines : en choisir un ajoute donc un système d\'écriture au lieu de l\'échanger. Le changement vaut pour les photos prises à partir de maintenant, pas pour celles déjà lues.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action ne sait pas lire l\'écriture $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Il n\'existe pas de moteur de reconnaissance sur l\'appareil pour elle. Les photos resteront lues pour tout ce qui est écrit en lettres latines, et le reste reviendra vide. Vous pouvez saisir ou coller ce texte à la place.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action est réglée pour lire $script. Si cette photo est dans un autre système d\'écriture, changez-le dans les Réglages et relisez-la.';
  }

  @override
  String get settingsTextRecognition => 'Reconnaissance de texte';

  @override
  String get settingsTextRecognitionDescription =>
      'Le système d\'écriture qu\'Action lit sur les photos.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action fonctionne sans IA. Connecter votre propre fournisseur ajoute des outils d\'analyse de documents, de planification et de rédaction.';

  @override
  String get settingsAiProvider => 'Fournisseur d\'IA';

  @override
  String get settingsAiNotConnected =>
      'Non connecté. Utilisez votre propre compte et votre clé API.';

  @override
  String settingsAiConnected(String provider) {
    return 'Connecté à $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Confidentialité et sécurité';

  @override
  String get settingsSecurity => 'Sécurité';

  @override
  String get settingsWhereInfoLives => 'Où vivent vos informations';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Ce qui reste sur cet appareil, et ce qui n\'y reste pas.';

  @override
  String get protectionAppLock => 'Verrouillage de l\'app';

  @override
  String get protectionScreenPrivacy => 'confidentialité de l\'écran';

  @override
  String get protectionPrivateReminders => 'rappels privés';

  @override
  String get protectionSummaryNone =>
      'Verrouillage de l\'app, confidentialité de l\'écran, et ce qui quitte cet appareil.';

  @override
  String protectionSummaryOne(String first) {
    return '$first est activé.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first et $second sont activés.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second et $third sont activés.';
  }

  @override
  String get settingsSectionReminders => 'Rappels';

  @override
  String get settingsRemindersFootnote =>
      'Android peut délivrer un rappel un peu après l\'heure que vous avez fixée, selon les réglages de batterie et l\'usage de l\'appareil.';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsNotificationsOnDescription =>
      'Les rappels que vous créez peuvent être affichés.';

  @override
  String get settingsNotificationsOffDescription =>
      'Désactivées pour Action : les rappels n\'apparaîtront pas.';

  @override
  String get settingsNotificationsUnknown => 'Vérification impossible.';

  @override
  String get settingsNotificationsAllowed => 'Autorisées';

  @override
  String get settingsOpenSystemSettings => 'Ouvrir les réglages';

  @override
  String get settingsActionFootnote =>
      'Action transforme des informations en désordre en prochaines étapes claires. Vous confirmez tout avant l\'enregistrement.';

  @override
  String get settingsHelp => 'Aide';

  @override
  String get settingsHelpDescription =>
      'Comment Action fonctionne, et ce qu\'il ne fera pas.';

  @override
  String get settingsVersion => 'Version';

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'À l\'instant';

  @override
  String relativeMinutes(int count) {
    return 'il y a $count min';
  }

  @override
  String relativeHours(int count) {
    return 'il y a $count h';
  }

  @override
  String get relativeYesterday => 'Hier';

  @override
  String relativeDays(int count) {
    return 'il y a $count j';
  }

  @override
  String get libraryTitle => 'Bibliothèque';

  @override
  String get librarySubtitle =>
      'Tout ce qu\'Action garde pour vous. Et tout cela reste sur cet appareil.';

  @override
  String get librarySegmentActions => 'Tâches';

  @override
  String get librarySegmentCaptures => 'Captures';

  @override
  String get librarySegmentGoals => 'Objectifs';

  @override
  String get librarySegmentDone => 'Terminées';

  @override
  String get libraryNewGoal => 'Nouvel objectif';

  @override
  String get libraryNoGoalsTitle => 'Aucun objectif pour l\'instant';

  @override
  String get libraryNoGoalsMessage =>
      'Un objectif est quelque chose que vous voulez voir arriver. Action peut trouver ce qui manque, ce qui bloque et par quoi commencer.';

  @override
  String get libraryNoDoneTitle => 'Rien de terminé pour l\'instant';

  @override
  String get libraryNoDoneMessage =>
      'Les tâches que vous terminez seront conservées ici.';

  @override
  String get libraryNoOpenTitle => 'Aucune tâche en cours';

  @override
  String get libraryNoOpenMessage =>
      'Capturez quelque chose et Action déterminera ce qu\'il y a à faire.';

  @override
  String get libraryNoCapturesTitle => 'Rien de capturé pour l\'instant';

  @override
  String get libraryNoCapturesMessage =>
      'Les photos, captures d\'écran et textes que vous ajoutez arrivent ici d\'abord. Rien n\'est analysé tant que vous ne le demandez pas.';

  @override
  String get libraryGoalNoActions => 'Rien n\'en est encore sorti';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tâches issues de cet objectif',
      one: '1 tâche issue de cet objectif',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Rechercher dans les tâches et les captures';

  @override
  String get searchClear => 'Effacer';

  @override
  String get searchPrivacyNote =>
      'Recherche effectuée sur cet appareil. Rien de ce que vous tapez ici n\'en sort.';

  @override
  String get searchYouCanSearch => 'VOUS POUVEZ CHERCHER';

  @override
  String get searchFieldTitles => 'Titres';

  @override
  String get searchFieldTitlesExample => 'Renouveler l\'assurance auto';

  @override
  String get searchFieldReferences => 'Numéros de référence';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Organismes';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Étapes d\'une tâche';

  @override
  String get searchFieldStepsExample => 'Téléverser le formulaire';

  @override
  String get searchFieldCaptureText => 'Le texte lu dans une capture';

  @override
  String get searchFieldCaptureTextExample => 'avis de renouvellement';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Aucun résultat pour « $query »';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Essayez moins de mots, ou un numéro de référence exactement tel qu\'il apparaît.';

  @override
  String get searchNoMatchesClearFilters =>
      'Essayez moins de mots, ou effacez les filtres.';

  @override
  String get searchFilterActive => 'En cours';

  @override
  String get searchFilterCompleted => 'Terminées';

  @override
  String get searchFilterOverdue => 'En retard';

  @override
  String get searchFilterThisWeek => 'Cette semaine';

  @override
  String get searchFilterCritical => 'Critiques';

  @override
  String get searchFilterCreatedByYou => 'Créées par vous';

  @override
  String get searchFilterArchived => 'Archivées';

  @override
  String get searchFilterClear => 'Effacer les filtres';

  @override
  String get searchIncompleteActions =>
      'Impossible de chercher dans vos tâches, ces résultats peuvent donc être incomplets.';

  @override
  String get searchIncompleteCaptures =>
      'Impossible de chercher dans vos captures, ces résultats peuvent donc être incomplets.';

  @override
  String get searchIncompleteBoth =>
      'Impossible de chercher dans vos tâches ni dans vos captures, ces résultats peuvent donc être incomplets.';

  @override
  String get searchMatchTitle => 'Titre';

  @override
  String get searchMatchNextStep => 'Étape suivante';

  @override
  String get searchMatchStep => 'Étape';

  @override
  String get searchMatchSummary => 'Résumé';

  @override
  String get searchMatchFromCapture => 'D\'une capture';

  @override
  String get studioSuggested => 'Suggéré pour votre dernière capture';

  @override
  String get studioRecentlyUsed => 'Utilisé récemment';

  @override
  String get studioReady => 'PRÊT';

  @override
  String get studioNotConnected => 'NON CONNECTÉ';

  @override
  String get studioHeroTitle => 'Intelligence d\'Action';

  @override
  String get studioConnectedBlurb =>
      'Comprendre un document, affiner un objectif, construire un plan, rédiger une réponse ou vérifier ce que vous avez sous les yeux.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count outils pour comprendre des documents, planifier et écrire. Connectez votre propre compte d\'IA pour les utiliser — c\'est votre fournisseur qui vous facture, jamais Action.';
  }

  @override
  String get studioConnectAi => 'Connecter l\'IA';

  @override
  String get studioHowItWorks => 'Comment ça marche';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count d\'entre eux fonctionnent déjà sans rien de tout cela, entièrement sur cet appareil.',
      one: '1 d\'entre eux fonctionne déjà sans rien de tout cela, entièrement sur cet appareil.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'S\'exécute sur cet appareil';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description S\'exécute sur cet appareil.';
  }

  @override
  String get categoryUnderstand => 'Comprendre';

  @override
  String get categoryUnderstandBlurb => 'Donner du sens à ce que vous avez.';

  @override
  String get categoryPlan => 'Planifier';

  @override
  String get categoryPlanBlurb =>
      'En faire quelque chose que vous pouvez faire.';

  @override
  String get categoryCreate => 'Créer';

  @override
  String get categoryCreateBlurb => 'L\'écrire, l\'améliorer, le traduire.';

  @override
  String get categoryExtract => 'Extraire';

  @override
  String get categoryExtractBlurb => 'Sortir les détails qui comptent.';

  @override
  String get categoryVerify => 'Vérifier';

  @override
  String get categoryVerifyBlurb => 'Vérifier ce que vous avez sous les yeux.';

  @override
  String get captureSheetTitle => 'Capturer quelque chose';

  @override
  String get captureSheetSubtitle =>
      'Confiez à Action tout ce que vous préféreriez ne pas lire en entier.';

  @override
  String get captureTakePhoto => 'Prendre une photo';

  @override
  String get captureTakePhotoSubtitle =>
      'Une lettre, une facture ou un avis devant vous';

  @override
  String get captureChooseImage => 'Choisir une image';

  @override
  String get captureChooseImageSubtitle =>
      'Une capture d\'écran ou une photo déjà sur cet appareil';

  @override
  String get capturePasteText => 'Coller du texte';

  @override
  String get capturePasteTextSubtitle => 'Un e-mail, un message ou un avis';

  @override
  String get captureChoosePdf => 'Choisir un PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'Un relevé, une lettre ou un formulaire que vous avez déjà';

  @override
  String get captureFootnote =>
      'Les captures restent sur cet appareil. Rien n\'est analysé en ligne tant que vous ne le demandez pas.';

  @override
  String get captureCouldNotOpen =>
      'Impossible d\'ouvrir cela. Essayez autrement.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Lecture';

  @override
  String get stageNeedsReview => 'À vérifier';

  @override
  String get stageActionCreated => 'Tâche créée';

  @override
  String get stageNoText => 'Aucun texte trouvé';

  @override
  String get stageCouldNotBeRead => 'N\'a pas pu être lu';

  @override
  String get stageReadingPreview => 'Lecture du texte…';

  @override
  String get stageFailedPreview => 'Ceci n\'a pas pu être lu sur cet appareil.';

  @override
  String get provenancePhoto => 'Capturé depuis une photo';

  @override
  String get provenanceImage => 'Capturé depuis une image';

  @override
  String get provenancePastedText => 'Capturé depuis du texte collé';

  @override
  String get provenanceDocument => 'Ajouté comme document';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Terminée $when';
  }

  @override
  String metaOverdue(String date) {
    return 'En retard · était due le $date';
  }

  @override
  String get metaDueToday => 'Due aujourd\'hui';

  @override
  String metaDueOn(String date) {
    return 'Due le $date';
  }

  @override
  String get metaCreatedByYou => 'Créée par vous';

  @override
  String get categoryPayment => 'Paiement';

  @override
  String get categoryRenewal => 'Renouvellement';

  @override
  String get categoryAppointment => 'Rendez-vous';

  @override
  String get categoryBooking => 'Réservation';

  @override
  String get categoryTravel => 'Voyage';

  @override
  String get categoryDeadline => 'Échéance';

  @override
  String get categoryResponse => 'Réponse attendue';

  @override
  String get categoryDelivery => 'Livraison';

  @override
  String get categoryDocument => 'Document';

  @override
  String get categoryNoActionRequired => 'Rien à faire';

  @override
  String get categoryUnsure => 'Pas certain';

  @override
  String get errorEnterManually => 'Le saisir à la main';

  @override
  String get sourceWhatWeRead => 'Ce que nous avons lu';

  @override
  String get sourceDelete => 'Supprimer la capture';

  @override
  String get sourceGone => 'Cette capture n\'est plus disponible.';

  @override
  String get sourceDeleteTitle => 'Supprimer cette capture ?';

  @override
  String get sourceDeleteBody =>
      'L\'image et le texte qui en a été lu sont retirés de cet appareil.';

  @override
  String get sourceDeleteKeep => 'Conserver';

  @override
  String get sourceOpenAction => 'Ouvrir la tâche';

  @override
  String sourceOpenActions(int count) {
    return 'Ouvrir $count tâches';
  }

  @override
  String get sourceCreateAnother => 'En créer une autre à partir de ceci';

  @override
  String get sourceCreateAction => 'Créer une tâche à partir de ceci';

  @override
  String get sourceDoMore => 'Aller plus loin avec ceci';

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
    return '$size Ko';
  }

  @override
  String sourceConvertedFrom(String format, String size) {
    return 'depuis $format $size Ko';
  }

  @override
  String get sourceTextFound => 'Texte trouvé';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines lignes · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Voici le texte qu\'Action a lu. Ce qui en a été fait se trouve en dessous.';

  @override
  String get sourceNotInterpreted =>
      'Rien n\'a encore été interprété. Action proposera quoi faire de ceci, et vous confirmez avant que quoi que ce soit soit créé.';

  @override
  String get sourceNoTextExplainer =>
      'Cela arrive avec l\'écriture manuscrite, une lumière très faible, ou une écriture que cet appareil ne sait pas encore lire.';

  @override
  String get sourceReadFailed => 'Impossible de lire ceci';

  @override
  String get sourceReadFailedReason =>
      'La reconnaissance de texte n\'est pas allée à son terme.';

  @override
  String get sourceTryReadingAgain => 'Réessayer de lire';

  @override
  String get sourceTypeInstead => 'Saisir les informations à la place';

  @override
  String get sourceTypeWhatItSays => 'Saisissez ce qui est écrit';

  @override
  String get sourceTypeHint =>
      'Les dates, les montants, et ce qui est demandé.';

  @override
  String get sourceMadeFromThis => 'Créé à partir de cette capture';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count créés à partir de cette capture';
  }

  @override
  String get sourceTheDocument => 'Le document';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Nombre de pages inconnu';

  @override
  String get sourceDocumentNotRead =>
      'Action n\'a pas lu ce que contient ce document. Quand vous lancerez un outil qui en a besoin, le fichier partira vers le fournisseur d\'IA que vous avez connecté, et vous en serez averti avant.';

  @override
  String get previewSaveFailed => 'Impossible d\'enregistrer. Réessayez.';

  @override
  String get previewTitle => 'Vérifiez la capture';

  @override
  String get previewImageFailed => 'Cette image n\'a pas pu être ouverte.';

  @override
  String get previewHint =>
      'Vérifiez que le texte est lisible et que rien d\'important n\'est coupé.';

  @override
  String get previewRetake => 'Reprendre';

  @override
  String get pasteTitle => 'Coller du texte';

  @override
  String get pasteHint =>
      'Collez l\'e-mail, le message ou l\'avis que vous préféreriez ne pas lire en entier.';

  @override
  String get pasteFootnote =>
      'Tout ce qui comporte une date, un montant ou une demande fonctionne bien.';

  @override
  String get pasteEnough => 'Cela semble suffisant pour travailler.';

  @override
  String get pasteMore => 'Un peu plus de texte donnera un meilleur résultat.';

  @override
  String get reviewLoadFailed => 'Impossible de charger cette capture.';

  @override
  String get reviewConfirmed => 'Confirmé';

  @override
  String get reviewNeedsReview => 'À vérifier';

  @override
  String get reviewReview => 'Vérifier';

  @override
  String get reviewHighConfidence => 'Confiance élevée';

  @override
  String get reviewConfirmedByYou => 'Confirmé par vous';

  @override
  String get reviewMissing => 'Manquant';

  @override
  String get reviewNotUnderstood =>
      'Action n\'a pas pu comprendre de façon fiable assez de cette source.';

  @override
  String get reviewNotUnderstoodBody =>
      'La capture est intacte et rien n\'a été perdu. Vous pouvez saisir les informations vous-même, et la source reste jointe pour référence.';

  @override
  String get reviewEnterDetails => 'Saisir les informations';

  @override
  String get reviewKeepSource => 'Conserver la source pour plus tard';

  @override
  String reviewEngine(String engine) {
    return 'Moteur : $engine';
  }

  @override
  String get reviewManualNotice =>
      'Vous créez cette tâche vous-même. Seul ce que vous saisissez ici sera utilisé.';

  @override
  String get reviewUntitled => 'Tâche sans titre';

  @override
  String get reviewEditTitle => 'Modifier le titre';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valeurs demandent votre vérification.',
      one: '1 valeur demande votre vérification avant que ceci puisse être confirmé.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Informations clés';

  @override
  String get reviewNotFound => 'Introuvable';

  @override
  String get reviewSuggestedNextStep => 'Prochaine étape suggérée';

  @override
  String get reviewWhyThisMatters => 'Pourquoi c\'est important';

  @override
  String get reviewSteps => 'Étapes';

  @override
  String get reviewAddStep => 'Ajouter une étape';

  @override
  String get reviewInjectionNotice =>
      'Une partie du texte de cette source ressemblait à des instructions plutôt qu\'à des informations du document, alors Action l\'a ignorée.';

  @override
  String get reviewLayoutNotice =>
      'La mise en page de ce document peut contenir des liens que l\'extraction de texte n\'a pas pu préserver entièrement. Comparez les valeurs ci-dessous à la source avant de confirmer.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Comparez les valeurs ci-dessous à la source.';
  }

  @override
  String get reviewDeadline => 'Échéance';

  @override
  String get reviewAmount => 'Montant';

  @override
  String get reviewLeftUnset =>
      'Aucune — vous avez choisi de ne pas la définir';

  @override
  String get reviewUnclear => 'Peu clair';

  @override
  String get reviewNotSet => 'Non défini';

  @override
  String get reviewNoDeadlineFound => 'Aucune trouvée dans ce document';

  @override
  String get reviewNoAmountFound => 'Aucun trouvé dans ce document';

  @override
  String get reviewMultipleDates =>
      'Action a trouvé plusieurs dates possibles.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count dates pourraient être l\'échéance. Choisissez la bonne, saisissez-en une autre, ou laissez-la non définie.';
  }

  @override
  String get reviewChooseDate => 'Choisir une date';

  @override
  String get reviewMultipleAmounts =>
      'Action a trouvé plus d\'un montant possible.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count montants pourraient être celui dont il s\'agit ici. Choisissez-en un, saisissez-en un autre, ou laissez-le non défini.';
  }

  @override
  String get reviewChooseAmount => 'Choisir un montant';

  @override
  String get reviewSkipStep => 'Passer cette étape';

  @override
  String get reviewKeepStep => 'Conserver cette étape';

  @override
  String get reviewEditStep => 'Modifier l\'étape';

  @override
  String get reviewCreateManually => 'Créer à la main';

  @override
  String get reviewConfirmAndCreate => 'Confirmer et créer la tâche';

  @override
  String get reviewFixHighlighted => 'Vérifier les champs signalés';

  @override
  String get reviewSaving => 'Enregistrement…';

  @override
  String get reviewSaveFailed =>
      'Impossible d\'enregistrer cette tâche. Rien n\'a été perdu — réessayez.';

  @override
  String get reviewFieldTitle => 'Titre';

  @override
  String get reviewTitleHint => 'Que faut-il faire ?';

  @override
  String get reviewNewStep => 'Nouvelle étape';

  @override
  String get reviewStepHint => 'Ce qu\'il y a à faire';

  @override
  String get reviewDatesConflict => 'Le document mentionne plus d\'une date.';

  @override
  String get reviewAmountsConflict =>
      'Le document mentionne plus d\'un montant.';

  @override
  String get reviewAnotherDate => 'Une autre date — 2026-08-30';

  @override
  String get reviewBadDate =>
      'Ce n\'est pas une date réelle. Utilisez le format 2026-08-30.';

  @override
  String get reviewTypeDate =>
      'Saisissez une date, ou laissez-la non définie ci-dessous.';

  @override
  String get reviewUseThisDate => 'Utiliser cette date';

  @override
  String get reviewLeaveNoDeadline => 'Continuer sans échéance';

  @override
  String get reviewAnotherAmount => 'Un autre montant — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Ce montant est inutilisable : $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Utiliser ce montant';

  @override
  String get reviewLeaveNoAmount => 'Continuer sans montant';

  @override
  String get reviewThisValue => 'Cette valeur';

  @override
  String reviewQuote(String quote) {
    return '« $quote »';
  }

  @override
  String get reviewSeeOnCapture => 'Le voir sur la capture';

  @override
  String get reviewViewSource => 'Voir la source';

  @override
  String get reviewFromSource => 'De la source';

  @override
  String get reviewNotVerified => 'Non contrôlé';

  @override
  String get reviewCouldNotVerify =>
      'Impossible de contrôler ceci par rapport à la source.';

  @override
  String get reviewLooksRight => 'Cela semble juste';

  @override
  String get reviewStageReading => 'Lecture de la source';

  @override
  String get reviewStageUnderstanding =>
      'Compréhension des informations importantes';

  @override
  String get reviewStageChecking =>
      'Contrôle de ce qui demande une vérification';

  @override
  String get reviewNothingToDo => 'Vous n\'avez rien à faire pour l\'instant.';

  @override
  String get reviewInformationOnly =>
      'Ceci ressemble à de l\'information seule — aucune échéance, aucun paiement ni aucune réponse n\'a été trouvé.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Ceci ressemble à de l\'information seule — aucune échéance, aucun paiement ni aucune réponse n\'a été trouvé dans cette capture.';

  @override
  String get reviewSourceKept => 'La source est conservée dans les deux cas.';

  @override
  String get reviewAddAnyway => 'Ajouter une tâche quand même';

  @override
  String get reviewActionConfirmed => 'Tâche confirmée';

  @override
  String get reviewCreatedByYou => 'Créée par vous.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Confirmée par vous à partir de $count informations vérifiées.',
      one: 'Confirmée par vous à partir de 1 information vérifiée.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Confirmée par vous à partir de $count informations vérifiées. Vous en avez modifié $edited.',
      one:
          'Confirmée par vous à partir de 1 information vérifiée. Vous en avez modifié $edited.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Enregistrée sur cet appareil.';

  @override
  String get detailLoadFailed =>
      'Cette tâche n\'a pas pu être chargée. Elle reste enregistrée sur cet appareil.';

  @override
  String get detailNotFoundTitle => 'Cette tâche n\'est plus là';

  @override
  String get detailNotFoundMessage =>
      'Elle a peut-être été supprimée sur cet appareil.';

  @override
  String get detailGoBack => 'Retour';

  @override
  String get detailMore => 'Plus';

  @override
  String get detailChangeUrgency => 'Changer l\'urgence';

  @override
  String get detailAddRecommendedStep => 'Ajouter une étape recommandée';

  @override
  String get detailEditRecommendedStep => 'Modifier l\'étape recommandée';

  @override
  String get detailArchiveTitle => 'Archiver cette tâche ?';

  @override
  String get detailArchiveBody =>
      'Elle quitte votre liste mais n\'est pas supprimée, et la capture dont elle vient est conservée.';

  @override
  String get detailArchiveConfirm => 'Archiver';

  @override
  String get detailArchived => 'Archivée';

  @override
  String detailCompletedOn(String date) {
    return 'Terminée le $date';
  }

  @override
  String get detailSectionDetails => 'Détails';

  @override
  String get detailSectionReminders => 'Rappels';

  @override
  String get detailAllStepsDone => 'Toutes les étapes faites';

  @override
  String get detailNextEyebrow => 'Suivant';

  @override
  String get detailCompleteQuestion => 'Terminer cette tâche ?';

  @override
  String get detailMarkStepDone => 'Marquer l\'étape comme faite';

  @override
  String get detailCompleteAction => 'Terminer cette tâche';

  @override
  String get detailAddDeadline => 'Ajouter une échéance';

  @override
  String get detailAddAmount => 'Ajouter un montant';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed sur $total faites';
  }

  @override
  String get detailNoStepsTitle => 'Pas encore d\'étapes';

  @override
  String get detailNoStepsMessage =>
      'Découpez ceci en gestes que vous avez réellement à faire.';

  @override
  String get detailAddFirstStep => 'Ajouter la première étape';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Étape terminée : $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Étape suivante : $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Étape : $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Marquer « $title » comme faite';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Marquer « $title » comme non faite';
  }

  @override
  String get detailStepOptions => 'Options de l\'étape';

  @override
  String get detailMoveUp => 'Monter';

  @override
  String get detailMoveDown => 'Descendre';

  @override
  String get detailDeleteStep => 'Supprimer l\'étape';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Supprimer cette étape ?';

  @override
  String get stepDeleteKeep => 'La garder';

  @override
  String get detailNoRemindersYet => 'Pas encore de rappels.';

  @override
  String get detailReminderLimit =>
      'C\'est le maximum de rappels pour une tâche. Retirez-en un pour en ajouter un autre.';

  @override
  String get detailAddReminder => 'Ajouter un rappel';

  @override
  String get detailChangeReminder => 'Modifier le rappel';

  @override
  String get detailRemoveReminder => 'Retirer le rappel';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Pas encore configuré';

  @override
  String get reminderStateNotificationsOff =>
      'Enregistré, mais les notifications sont coupées';

  @override
  String get reminderStateFailed => 'N\'a pas pu être programmé';

  @override
  String get reminderStateRemoving => 'Retrait…';

  @override
  String get reminderSetConfirmation => 'Rappel créé. On vous fera signe.';

  @override
  String get reminderUpdatedConfirmation => 'Rappel mis à jour.';

  @override
  String get reminderNeedsPermission =>
      'Les notifications sont coupées : ce rappel est enregistré mais ne peut pas encore vous alerter.';

  @override
  String get reminderScheduleFailed =>
      'Ce rappel est enregistré, mais Android n\'a pas voulu le programmer.';

  @override
  String get reminderLimitReached =>
      'Cette tâche a déjà le nombre maximal de rappels.';

  @override
  String get reminderTimeInPast => 'Cette heure est déjà passée.';

  @override
  String get reminderAddTitle => 'Ajouter un rappel';

  @override
  String get reminderChangeTitle => 'Modifier ce rappel';

  @override
  String get reminderDateLabel => 'Date';

  @override
  String get reminderTimeLabel => 'Heure';

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
    return 'Vous serez rappelé le $date à $time.';
  }

  @override
  String get reminderTimePastError =>
      'Cette heure est déjà passée. Choisissez-en une plus tardive.';

  @override
  String get reminderSet => 'Créer le rappel';

  @override
  String get reminderPresetInHour => 'Dans 1 heure';

  @override
  String get reminderPresetTomorrowMorning => 'Demain matin';

  @override
  String get reminderPresetNextWeek => 'La semaine prochaine';

  @override
  String get reminderPresetOnTheDay => 'Le jour même';

  @override
  String get reminderPresetDayBefore => '1 jour avant';

  @override
  String get reminderPresetWeekBefore => '1 semaine avant';

  @override
  String get reminderPresetAtDeadline => 'À l\'échéance';

  @override
  String get reminderPresetHourBefore => '1 heure avant';

  @override
  String get editNextStepTitle => 'Prochaine étape recommandée';

  @override
  String get editNextStepSubtitle =>
      'Une phrase courte sur le prochain geste utile.';

  @override
  String get editNextStepHint => 'Quel est le prochain geste utile ?';

  @override
  String get editRemoveSuggestion => 'Retirer la suggestion';

  @override
  String get editUrgencyTitle => 'C\'est urgent à quel point ?';

  @override
  String get editStepHint => 'Une chose concrète à faire';

  @override
  String get editAddStep => 'Ajouter l\'étape';

  @override
  String get editDateHint => 'AAAA-MM-JJ';

  @override
  String get editRemoveDeadline => 'Retirer l\'échéance';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Enregistrer le montant';

  @override
  String get editRemoveAmount => 'Retirer le montant';

  @override
  String get securityTitle => 'Sécurité et confidentialité';

  @override
  String get securitySectionProtection => 'Protection';

  @override
  String get securityAppLockUnavailable =>
      'Le verrouillage de l\'app a besoin d\'un verrouillage d\'écran sur cet appareil. Configurez d\'abord un code, un schéma, un mot de passe ou une empreinte dans les réglages de l\'appareil.';

  @override
  String get securityAppLockOn =>
      'Action demande à votre appareil de confirmer que c\'est bien vous.';

  @override
  String get securityAppLockOff =>
      'Exiger votre empreinte, votre visage ou le code de l\'appareil pour ouvrir Action.';

  @override
  String get securityAskAgain => 'Redemander';

  @override
  String get securityAskAgainDescription =>
      'Combien de temps Action peut rester en arrière-plan avant de se verrouiller.';

  @override
  String get securityScreenPrivacy => 'Confidentialité de l\'écran';

  @override
  String get securityScreenPrivacyDescription =>
      'Demander à Android de bloquer les captures et l\'enregistrement d\'écran, et de masquer Action dans le sélecteur d\'apps.';

  @override
  String get securityPrivateReminders => 'Rappels privés';

  @override
  String get securityPrivateRemindersOn =>
      'Les rappels disent seulement que quelque chose vous attend.';

  @override
  String get securityPrivateRemindersOff =>
      'Les rappels affichent le titre de la tâche. Activez ceci pour le garder hors de l\'écran verrouillé.';

  @override
  String get securityLockNow => 'Verrouiller maintenant';

  @override
  String get securityLockNowDescription => 'Fermer la porte sans attendre.';

  @override
  String get securitySectionStorage => 'Comment vos données sont stockées';

  @override
  String get securityStorageDataLabel => 'Vos tâches, captures et réglages';

  @override
  String get securityStorageDataDetail =>
      'Elles se trouvent dans le stockage privé de cette app, que les autres apps ne peuvent pas lire et qu\'Android chiffre dans le cadre du chiffrement de l\'appareil. Action n\'ajoute pas une deuxième couche à lui par-dessus.';

  @override
  String get securityStorageKeyLabel => 'Votre clé de fournisseur d\'IA';

  @override
  String get securityStorageKeyDetail =>
      'Conservée dans le Keystore Android plutôt qu\'avec le reste, et jamais réaffichée une fois enregistrée.';

  @override
  String get securityStorageGapLabel => 'Ce que cela ne couvre pas';

  @override
  String get securityStorageGapDetail =>
      'Rien de tout cela ne protège contre quelqu\'un qui utilise votre appareil déverrouillé, et un système modifié ou rooté peut lire plus qu\'un système normal. Le verrouillage de l\'app est le réglage qui aide pour le premier cas.';

  @override
  String get securitySectionInformation => 'Vos informations';

  @override
  String get securityWhereInfoDescription =>
      'Tous les chemins que vos données peuvent prendre, et les deux qui quittent cet appareil.';

  @override
  String get securityAppLockRefused => 'Non confirmé, donc rien n\'a changé.';

  @override
  String get securityAppLockUnavailableToast =>
      'Cet appareil n\'a aucun verrouillage d\'écran. Ajoutez un code, un schéma, un mot de passe ou une empreinte dans les réglages de l\'appareil, puis réessayez.';

  @override
  String get securityScreenPrivacyRefused =>
      'Cet appareil n\'a pas voulu appliquer la confidentialité de l\'écran, elle a donc été laissée désactivée plutôt qu\'affichée comme active.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rappels programmés en disent moins désormais.',
      one: '1 rappel programmé en dit moins désormais.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rappels programmés mis à jour.',
      one: '1 rappel programmé mis à jour.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Immédiatement';

  @override
  String get appLockDelayOneMinute => 'Après 1 minute';

  @override
  String get appLockDelayFiveMinutes => 'Après 5 minutes';

  @override
  String get securityDelayImmediatelyDescription =>
      'Chaque fois qu\'Action quitte l\'écran';

  @override
  String get securityDelayOneMinuteDescription =>
      'Assez pour répondre à un message';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Assez pour prendre un appel';

  @override
  String get securityHeroProtected => 'Protégé';

  @override
  String get securityHeroNothingOn => 'Rien d\'activé';

  @override
  String get securityHeroFootnote =>
      'Tout ici fonctionne sur cet appareil. Aucun de ces réglages n\'est envoyé où que ce soit, et aucun ne peut être modifié à distance.';

  @override
  String get securityHeadlineNone => 'Trois protections sont disponibles';

  @override
  String securityHeadlineOne(String first) {
    return '$first est activée';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first et $second sont activées';
  }

  @override
  String get securityHeadlineAll => 'Les trois protections sont activées';

  @override
  String get securityTransfersTitle => 'Ce qui a quitté cet appareil';

  @override
  String get securityTransfersNoProvider =>
      'Aucun fournisseur d\'IA n\'est connecté, donc rien n\'est envoyé pour analyse.';

  @override
  String get securityTransfersDescription =>
      'Consigné ici au moment où quelque chose part, que la réponse soit revenue ou non. Seulement l\'outil, le fournisseur et la taille — jamais ce qu\'il y avait dedans. Conservé 90 jours sur cet appareil et envoyé nulle part.';

  @override
  String get securityClear => 'Effacer';

  @override
  String get securityNothingSent => 'Rien n\'a été envoyé';

  @override
  String get securityNothingSentDescription =>
      'Quand vous lancerez un outil qui utilise votre fournisseur d\'IA, il apparaîtra ici.';

  @override
  String get securityClearHistoryTitle => 'Effacer cet historique ?';

  @override
  String get securityClearHistoryBody =>
      'Le relevé de ce qui a été envoyé sera supprimé de cet appareil. Cela n\'annule rien de ce qui a déjà été envoyé.';

  @override
  String get securityUnnamedTool => 'Un outil Intelligence';

  @override
  String get securityYourProvider => 'votre fournisseur d\'IA';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'un court texte';

  @override
  String securityTransferCharacters(int count) {
    return '$count k caractères';
  }

  @override
  String securitySentTo(String provider) {
    return 'Envoyé à $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Envoyé à $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return 'il y a $count sem.';
  }

  @override
  String get helpTitle => 'Aide';

  @override
  String get helpAddQuestion => 'Que puis-je ajouter ?';

  @override
  String get helpAddAnswer =>
      'Une capture d\'écran, une photo d\'une lettre ou d\'une facture, ou du texte que vous collez. Tout ce qui comporte une date, un montant ou une demande fonctionne le mieux.';

  @override
  String get helpReviewQuestion =>
      'Pourquoi Action me demande-t-il de vérifier ?';

  @override
  String get helpReviewAnswer =>
      'Parce qu\'une machine qui lit un document peut mal le lire, et qu\'une échéance discrètement fausse est pire que pas d\'échéance du tout. Action montre ce qu\'il a trouvé et les mots dont cela vient, et rien n\'est enregistré tant que vous ne l\'avez pas confirmé.';

  @override
  String get helpVaryQuestion =>
      'Pourquoi les résultats changent-ils si je réessaie ?';

  @override
  String get helpVaryAnswer =>
      'Le service qui lit votre document n\'est pas déterministe, la même capture peut donc revenir légèrement différente. C\'est aussi pour cela que l\'étape de vérification existe — vous êtes la partie qui ne change pas.';

  @override
  String get helpLateQuestion =>
      'Pourquoi mon rappel est-il arrivé en retard ?';

  @override
  String get helpLateAnswer =>
      'Les rappels sont programmés via Android, et c\'est Android qui décide du moment exact de la remise. L\'économie de batterie, Doze et les réglages d\'énergie du constructeur peuvent tous en retarder un. Action ne promet jamais un rappel à la minute près.';

  @override
  String get helpDataQuestion => 'Où sont mes données ?';

  @override
  String get helpDataAnswer =>
      'Presque tout est sur cet appareil : vos captures, tâches, étapes, rappels et recherches. Deux exceptions — le contenu que vous demandez à Action de lire part vers le service d\'IA qui le lit, et un court relevé d\'une tâche confirmée peut être stocké dans le cloud sous un identifiant anonyme. Confidentialité et données, dans les Réglages, indique exactement ce que ce relevé contient.';

  @override
  String get helpBackupQuestion => 'Est-ce une sauvegarde ?';

  @override
  String get helpBackupAnswer =>
      'Non. Le relevé dans le cloud ne peut pas être restauré sur un nouvel appareil, et il n\'y a aucun compte auquel se connecter. Si vous désinstallez Action ou perdez cet appareil, les données qui s\'y trouvaient sont perdues.';

  @override
  String get helpCorrectQuestion => 'Comment corriger une tâche ?';

  @override
  String get helpCorrectAnswer =>
      'Ouvrez-la et modifiez n\'importe quel champ — le titre, l\'échéance, le montant ou la prochaine étape suggérée. Vous pouvez ajouter, réordonner, terminer et supprimer des étapes à tout moment. Modifier une tâche ne demande jamais rien au service d\'IA.';

  @override
  String get privacyTitle => 'Confidentialité et données';

  @override
  String get privacyIntro =>
      'Action garde sur cet appareil tout ce qu\'il peut. Deux choses font exception, et elles sont toutes les deux listées ci-dessous.';

  @override
  String get privacyGroupOnDevice => 'Sur cet appareil';

  @override
  String get privacyOnDeviceCaptures =>
      'Captures — les captures d\'écran, photos et textes que vous ajoutez, et le texte qui en a été lu.';

  @override
  String get privacyOnDeviceActions =>
      'Tâches, avec leurs étapes, informations et rappels.';

  @override
  String get privacyOnDeviceSearch =>
      'Recherche. Vos recherches s\'exécutent ici, ne sont jamais envoyées où que ce soit, et ne sont pas conservées après la fermeture de l\'écran.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Les photos sont enregistrées sans leur localisation. Les coordonnées, l\'heure et les informations d\'appareil photo qu\'un téléphone inscrit dans une image sont retirées avant l\'enregistrement de la capture : elles ne sont donc pas conservées ici, ni incluses quand vous envoyez une capture à votre fournisseur d\'IA.';

  @override
  String get privacyGroupSentToRead => 'Envoyé pour être lu';

  @override
  String get privacySentToReadWhat =>
      'Quand vous demandez à Action d\'interpréter une capture, ce contenu est envoyé au service d\'IA qui le lit. Ce n\'est pas de l\'IA sur l\'appareil.';

  @override
  String get privacySentToReadWhen =>
      'Seule la capture que vous avez choisie est envoyée, et seulement quand vous le demandez.';

  @override
  String get privacyGroupYourProvider =>
      'Envoyé à votre propre fournisseur d\'IA';

  @override
  String get privacyProviderWhat =>
      'Si vous connectez un fournisseur d\'IA dans les Réglages, les outils Intelligence envoient le contenu que vous sélectionnez à ce fournisseur — OpenAI, Anthropic, Google ou un endpoint que vous avez choisi — avec votre propre clé API.';

  @override
  String get privacyProviderDirect =>
      'Cela part directement chez eux. Rien ne transite par un serveur appartenant à Action.';

  @override
  String get privacyProviderScope =>
      'Seul ce que vous choisissez pour un outil est envoyé, et seulement quand vous le lancez. Vos autres tâches, captures et sources ne sont jamais incluses, et rien n\'est jamais envoyé en arrière-plan.';

  @override
  String get privacyProviderKey =>
      'Votre clé API est conservée dans le stockage sécurisé de cet appareil et n\'est envoyée qu\'au fournisseur auquel elle appartient. Le stockage sécurisé est un obstacle réel pour quelqu\'un qui a votre appareil déverrouillé, mais il n\'est pas absolu, et Action ne prétendra pas le contraire.';

  @override
  String get privacyProviderLocalTools =>
      'Certains outils n\'envoient jamais rien : masquer des informations sensibles, vérifier d\'où vient un fichier, repérer des identifiants et vérifier un lien fonctionnent entièrement sur cet appareil.';

  @override
  String get privacyProviderAgreement =>
      'Ce que votre fournisseur fait de ce que vous envoyez relève de votre accord avec lui, pas d\'Action.';

  @override
  String get privacyGroupCloud => 'Stocké dans le cloud';

  @override
  String get privacyCloudWhat =>
      'Quand vous confirmez une tâche, un court relevé peut être enregistré sous un identifiant anonyme propre à cette installation : son titre, son état, son urgence, sa catégorie, son échéance, son montant, la prochaine étape suggérée et les horodatages.';

  @override
  String get privacyCloudNotSent =>
      'Vos captures, le texte qui en a été lu, les étapes et informations d\'une tâche, et vos rappels ne sont pas envoyés.';

  @override
  String get privacyCloudNotBackup =>
      'Ce n\'est pas une sauvegarde. Il n\'existe aucun moyen de le restaurer sur un nouvel appareil, et perdre cette installation emporte l\'identifiant anonyme avec elle.';

  @override
  String get privacyGroupDiagnostics => 'Diagnostics';

  @override
  String get privacyDiagnosticsWhat =>
      'Action enregistre des comptages anonymes de ce qui se passe dans l\'app — qu\'une capture a été commencée, qu\'une extraction a fonctionné ou non, qu\'une recherche n\'a rien trouvé, qu\'une tâche a été terminée.';

  @override
  String get privacyDiagnosticsCounts =>
      'Ce sont des comptages, pas des contenus. Aucun titre, montant, échéance, référence, texte capturé ni terme de recherche n\'y figure jamais, et l\'identifiant anonyme ou tout identifiant de tâche ou de capture non plus.';

  @override
  String get privacyDiagnosticsCrash =>
      'Si l\'app plante, l\'erreur et l\'endroit où elle s\'est produite sont signalés pour pouvoir être corrigés. Action n\'attache pas vos données à ces rapports.';

  @override
  String get privacySectionYourData => 'Vos données';

  @override
  String get privacyYourDataFootnote =>
      'Effacer les captures laisse vos tâches en place. Une tâche dont la capture a disparu fonctionne toujours ; elle ne montre simplement plus d\'où elle vient.';

  @override
  String get privacyClearCaptures => 'Effacer les captures';

  @override
  String get privacyClearCapturesDescription =>
      'Supprime chaque capture et son fichier image.';

  @override
  String get privacyDeleteAll => 'Supprimer toutes mes données';

  @override
  String get privacyDeleteAllDescription =>
      'Tâches, étapes, rappels, captures et les relevés cloud ci-dessus.';

  @override
  String get privacyClearCapturesTitle => 'Effacer les captures ?';

  @override
  String get privacyClearCapturesBody =>
      'Chaque capture et son image seront supprimées de cet appareil. Vos tâches restent exactement telles quelles.';

  @override
  String get privacyCapturesDeleted => 'Captures supprimées.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Certaines captures n\'ont pas pu être supprimées. Rien d\'autre n\'a été modifié.';

  @override
  String get privacyDeleteAllTitle => 'Supprimer toutes vos données ?';

  @override
  String get privacyDeleteAllBody =>
      'Cela supprime chaque tâche, étape, rappel et capture de cet appareil, ainsi que les relevés cloud listés ci-dessus. C\'est irréversible, et il n\'y a aucune sauvegarde à restaurer.';

  @override
  String get privacyDeleteEverything => 'Tout supprimer';

  @override
  String get privacyDeletedAll => 'Tout a été supprimé.';

  @override
  String get privacyDeleteFailed =>
      'Vos données n\'ont pas pu être supprimées.';

  @override
  String get privacyDeletedUnverified =>
      'Tout ce qui se trouvait sur cet appareil a été supprimé. Action n\'a pas pu joindre le cloud pour confirmer qu\'il n\'y reste rien, et vérifiera de nouveau.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Supprimé, sauf $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action réessaiera.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action n\'a pas pu terminer la vérification du cloud, et réessaiera.';

  @override
  String get privacyLeftoverCaptures => 'quelques captures';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count relevés cloud',
      one: '1 relevé cloud',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first et $second';
  }

  @override
  String get privacyCloudDeleted => 'Les relevés cloud ont été supprimés.';

  @override
  String get privacyCloudUnreachable =>
      'Toujours impossible de les joindre. Action réessaiera.';

  @override
  String get privacyPendingTitle => 'Reste à supprimer';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count relevés cloud n\'ont pas pu être joints la dernière fois. Action réessaiera de lui-même, ou vous pouvez réessayer maintenant.',
      one: '1 relevé cloud n\'a pas pu être joint la dernière fois. Action réessaiera de lui-même, ou vous pouvez réessayer maintenant.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Réessayer';

  @override
  String get evidenceTitle => 'D\'où cela vient';

  @override
  String get evidenceUnverified =>
      'Action n\'a pas trouvé ces mots dans le texte qu\'elle a lu, donc cette valeur n\'a pas été contrôlée. Comparez-la à l\'original avant de vous y fier.';

  @override
  String get evidenceHighlighted =>
      'Ces mots figuraient dans le texte qu\'Action a lu de cette capture, et le surlignage montre où.';

  @override
  String get evidenceNoRegion =>
      'Ces mots figuraient dans le texte qu\'Action a lu de cette capture. Elle n\'a pas pu déterminer où exactement ils se trouvent sur l\'image, et elle ne devine pas.';

  @override
  String get evidenceInText =>
      'Ces mots figuraient dans le texte que contient cette capture.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Critique';

  @override
  String get urgencyImportant => 'Important';

  @override
  String get urgencyNormal => 'Normal';

  @override
  String get urgencyLow => 'Faible';

  @override
  String get urgencyUnsure => 'Pas certain';

  @override
  String get detailSaveFailed =>
      'Cela n\'a pas été enregistré. Rien n\'a été perdu — réessayez.';

  @override
  String get detailSectionCreatedFrom => 'Créé à partir de';

  @override
  String get detailSourceChecking => 'Recherche de la capture d\'origine…';

  @override
  String get detailSourceUnavailable =>
      'La capture d\'origine n\'est plus disponible.';

  @override
  String get detailReopenAction => 'Rouvrir la tâche';

  @override
  String get detailMarkActionComplete => 'Marquer la tâche comme terminée';

  @override
  String get detailGetHelp => 'Obtenir de l\'aide sur ceci';

  @override
  String get detailSectionHistory => 'Historique';

  @override
  String get detailHistoryShowLess => 'Afficher moins';

  @override
  String detailHistoryShowAll(int count) {
    return 'Afficher les $count entrées';
  }

  @override
  String get detailHistoryCreated => 'Créée';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Créée avec $count étapes',
      one: 'Créée avec $count étape',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'Vous avez confirmé les informations';

  @override
  String detailHistoryStepFinished(String title) {
    return 'Vous avez terminé « $title »';
  }

  @override
  String get detailHistoryAStep => 'une étape';

  @override
  String get detailHistoryReminderSet => 'Vous avez créé un rappel';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'Vous avez créé un rappel pour $when';
  }

  @override
  String get detailHistoryCompleted => 'Marquée comme terminée';

  @override
  String get detailHistoryChanged => 'Dernière modification';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Personnalisé (compatible OpenAI)';

  @override
  String get aiCapabilityText => 'le texte';

  @override
  String get aiCapabilityImages => 'les images';

  @override
  String get aiCapabilityDocuments => 'les documents';

  @override
  String get aiCapabilityStructuredResults => 'les résultats structurés';

  @override
  String get aiCapabilityStreaming => 'la diffusion en continu';

  @override
  String get aiCapabilitySystemInstructions => 'les instructions système';

  @override
  String get aiCapabilityEvidenceCitations => 'les citations de preuves';

  @override
  String get aiCapabilityLongDocuments => 'les documents longs';

  @override
  String aiCapabilityListJoin(String a, String b) {
    return '$a, $b';
  }

  @override
  String aiCapabilityListTwo(String a, String b) {
    return '$a ou $b';
  }

  @override
  String aiCapabilityListMore(String head, String last) {
    return '$head ou $last';
  }

  @override
  String get aiFailureNotConfigured =>
      'Connectez un fournisseur d\'IA pour utiliser cet outil.';

  @override
  String get aiFailureInvalidKey =>
      'Cette clé API n\'a pas été acceptée par le fournisseur.';

  @override
  String get aiFailureQuotaExceeded =>
      'Votre compte chez le fournisseur n\'a plus de crédit ou a atteint son quota.';

  @override
  String get aiFailureRateLimited =>
      'Votre fournisseur limite le débit des requêtes. Réessayez dans un instant.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action n\'a pas pu joindre votre fournisseur d\'IA. Vérifiez votre connexion.';

  @override
  String get aiFailureUnsupportedModel =>
      'Ce modèle n\'est pas accessible avec votre clé. Choisissez-en un autre dans les Réglages.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'Le modèle que vous avez choisi ne peut pas lire $capabilities. Choisissez un autre modèle dans les Réglages.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'C\'était trop de contenu pour que ce modèle le lise en une seule fois.';

  @override
  String get aiFailureInputTooLargeText =>
      'C\'est plus de texte qu\'il n\'est possible d\'analyser en une seule fois.';

  @override
  String get aiFailureProviderUnavailable =>
      'Votre fournisseur d\'IA rencontre un problème. Réessayez dans un instant.';

  @override
  String get aiFailureMalformedResponse =>
      'Ce fournisseur a renvoyé quelque chose qu\'Action n\'a pas pu lire.';

  @override
  String get aiFailureCancelled => 'Arrêté.';

  @override
  String get aiFailureInsecureEndpoint =>
      'Cet endpoint doit être une adresse https://.';

  @override
  String get aiFailureUnknown =>
      'Un problème est survenu lors de l\'échange avec votre fournisseur d\'IA.';

  @override
  String get appLockTitle => 'Action est verrouillée';

  @override
  String get appLockPrompt =>
      'Confirmez que c\'est bien vous pour continuer. Action le demande à votre appareil — elle ne voit jamais votre empreinte, votre visage ni votre code.';

  @override
  String get appLockUnlocking => 'Déverrouillage…';

  @override
  String get appLockNotConfirmed =>
      'Cela n\'a pas été confirmé. Réessayez quand vous êtes prêt.';

  @override
  String get appLockCannotConfirm =>
      'Votre appareil ne peut pas confirmer que c\'est bien vous pour le moment. Vérifiez qu\'un verrouillage d\'écran est toujours configuré dans les réglages de l\'appareil.';

  @override
  String get appLockWaiting => 'En attente…';

  @override
  String get appLockUnlock => 'Déverrouiller';

  @override
  String get appLockReasonUnlock => 'Déverrouiller Action';

  @override
  String get appLockReasonEnable =>
      'Confirmez que c\'est bien vous avant d\'activer le Verrouillage de l\'app';

  @override
  String get appLockReasonDisable =>
      'Confirmez que c\'est bien vous avant de désactiver le Verrouillage de l\'app';

  @override
  String get todayCapabilityHeading => 'Ce qu\'Action prend en charge';

  @override
  String get todayCapabilityDocumentTitle => 'Une lettre ou une facture';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action la lit et y trouve l\'échéance, le montant et la référence.';

  @override
  String get todayCapabilityScreenshotTitle => 'Une capture d\'écran';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Transformez un message que vous oublieriez sinon en quelque chose sur quoi vous pouvez agir.';

  @override
  String get todayCapabilityTextTitle => 'Du texte';

  @override
  String get todayCapabilityTextBlurb =>
      'Collez n\'importe quoi. Action détermine ce que c\'est et ce que cela exige de vous.';

  @override
  String get todayCapabilityConfirmTitle => 'Vous confirmez tout';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Rien ne devient une tâche tant que vous n\'avez pas vu la preuve et dit oui.';

  @override
  String get todayCapabilityExploreIntelligence => 'Explorer l\'Intelligence';

  @override
  String get documentRejectedEmpty => 'Ce fichier est vide.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'Ce document fait $size, ce qui dépasse ce qu\'Action peut traiter.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'Ce n\'est pas un PDF, quel que soit son nom. Action lit les PDF et les images.';

  @override
  String get documentRejectedUnreadable => 'Ce document n\'a pas pu être lu.';

  @override
  String get pdfRejectedNotAPdf =>
      'Ce fichier n\'est pas un PDF, quel que soit son nom.';

  @override
  String get pdfRejectedEncrypted =>
      'Ce PDF est protégé par mot de passe, Action ne peut donc pas le lire.';

  @override
  String get pdfRejectedDamaged =>
      'Ce PDF n\'a pas pu être lu. Il est peut-être incomplet.';

  @override
  String get shareRejectedEmpty => 'Ce partage ne contenait rien à lire.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action accepte le texte, les images et les PDF. Ceci était autre chose.';

  @override
  String get shareRejectedContentMismatch =>
      'Ce fichier n\'est pas du type qu\'il annonce, Action ne l\'a donc pas ouvert.';

  @override
  String get shareRejectedTooLarge =>
      'Ce fichier est trop volumineux pour qu\'Action puisse le traiter.';

  @override
  String get shareRejectedUnreadable => 'Ce fichier n\'a pas pu être lu.';

  @override
  String get captureFailureRecognition =>
      'La reconnaissance de texte n\'a pas pu s\'exécuter.';

  @override
  String get captureFailureImageFormat =>
      'Ce format d\'image n\'a pas pu être lu sur cet appareil.';

  @override
  String get connectSheetTitle => 'Connecter votre IA';

  @override
  String get connectSheetSubtitle =>
      'Vous utilisez votre propre compte de fournisseur et votre propre clé API. Action conserve la clé dans le stockage sécurisé de cet appareil.';

  @override
  String get connectErrorKeyMissing => 'Collez votre clé API pour continuer.';

  @override
  String get connectErrorModelMissing =>
      'Choisissez un modèle, ou saisissez un identifiant de modèle.';

  @override
  String get connectErrorEndpointMissing =>
      'Ajoutez l\'adresse de votre endpoint.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'Le stockage sécurisé de cet appareil n\'a pas pu être ouvert, la clé n\'a donc pas été enregistrée.';

  @override
  String get connectTestSucceeded => 'Connecté.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Connecté. $count modèles disponibles.';
  }

  @override
  String get connectProviderLabel => 'Fournisseur';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'Doit être une adresse https://. Action n\'enverra pas vos documents sur une connexion non chiffrée.';

  @override
  String get connectApiKeyLabel => 'Clé API';

  @override
  String get connectApiKeyHint => 'Collez votre clé';

  @override
  String get connectKeyPrivacyNote =>
      'Votre clé reste sur cet appareil. Action ne l\'envoie jamais ailleurs qu\'au fournisseur que vous avez choisi, et ne peut plus vous la montrer une fois enregistrée.';

  @override
  String get connectModelLabel => 'Modèle';

  @override
  String get connectModelIdHint => 'Identifiant du modèle';

  @override
  String get connectModelFreeTextNote =>
      'Les fournisseurs retirent des identifiants de modèle et en ajoutent de nouveaux. Si celui que vous voulez n\'est pas dans la liste, saisissez-le ici.';

  @override
  String get connectAndTest => 'Connecter et tester';

  @override
  String get connectSaveWithoutTesting => 'Enregistrer sans tester';

  @override
  String get toolWarningFactsNotChecked =>
      'Action n\'a pas pu comparer ceci au texte d\'origine, les montants et les dates qui s\'y trouvent n\'ont donc pas été contrôlés.';

  @override
  String get toolTitleRewrite => 'Améliorer ce texte';

  @override
  String get toolDescriptionRewrite =>
      'Plus clair, plus court ou plus formel — les faits restent intacts.';

  @override
  String get toolModeRewriteClearer => 'Plus clair';

  @override
  String get toolModeRewriteProfessional => 'Plus professionnel';

  @override
  String get toolModeRewriteShorter => 'Plus court';

  @override
  String get toolModeRewritePersuasive => 'Plus persuasif';

  @override
  String get toolModeRewriteSimpler => 'Plus simple';

  @override
  String get toolModeRewriteStructured => 'Plus structuré';

  @override
  String get toolModeRewriteGrammarOnly => 'Grammaire seulement';

  @override
  String get toolSectionWhatChanged => 'Ce qui a changé';

  @override
  String get toolSectionNote => 'Remarque';

  @override
  String get toolSectionAlreadyClearBody =>
      'C\'était déjà clair. Les modifications ci-dessous sont mineures.';

  @override
  String get toolSectionImprovedText => 'Texte amélioré';

  @override
  String get toolTitleDraftReply => 'Rédiger une réponse';

  @override
  String get toolDescriptionDraftReply =>
      'Une réponse que vous pouvez modifier et envoyer vous-même.';

  @override
  String get toolModeReplyProfessional => 'Professionnel';

  @override
  String get toolModeReplyConcise => 'Concis';

  @override
  String get toolModeReplyFriendly => 'Cordial';

  @override
  String get toolModeReplyFormal => 'Formel';

  @override
  String get toolModeReplyClarification => 'Demander des précisions';

  @override
  String get toolModeReplyConfirmation => 'Accuser réception';

  @override
  String get toolModeReplyDispute => 'Contester ceci';

  @override
  String get toolSectionSubject => 'Objet';

  @override
  String get toolSectionDraftReply => 'Brouillon de réponse';

  @override
  String get toolSectionPlaceholders => 'Vous devez compléter ces éléments';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Brouillon — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'Ceci est un brouillon. Action n\'envoie rien — lisez-le, modifiez-le, et envoyez-le vous-même.';

  @override
  String get toolTitleTranslate => 'Traduire';

  @override
  String get toolDescriptionTranslate =>
      'Une autre langue, avec les nombres et les noms conservés intacts.';

  @override
  String get toolSectionTranslation => 'Traduction';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'De $from vers $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'Conservé dans la langue d\'origine';

  @override
  String get toolWarningTranslationNotCertified =>
      'Une traduction pour comprendre, pas une traduction assermentée.';

  @override
  String get toolTitleStructuredData => 'Extraire un tableau';

  @override
  String get toolDescriptionStructuredData =>
      'Des lignes, des champs et des chiffres que vous pouvez copier.';

  @override
  String get toolSectionTable => 'Tableau';

  @override
  String get toolSectionFields => 'Champs';

  @override
  String get toolSectionTableCsv => 'Tableau (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'La disposition des colonnes de ce tableau n\'a pas pu être lue de façon fiable. Vérifiez que les lignes correspondent bien avant de les utiliser.';

  @override
  String get toolTitleDeadlineFinder => 'Trouver les échéances';

  @override
  String get toolDescriptionDeadlineFinder =>
      'Ce qui est dû, quand, et ce qui arrive si ce n\'est pas fait.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count échéances',
      one: '$count échéance',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Rien d\'exigible';

  @override
  String get toolSectionNothingDueBody =>
      'Action n\'a trouvé aucune échéance ni obligation dans ce contenu.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'Rien n\'est programmé tant que vous ne l\'avez pas choisi. Les rappels ne sont jamais créés automatiquement.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'Sinon : $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'Il vous faut : $items';
  }

  @override
  String get moneyErrorEmpty => 'aucun montant indiqué';

  @override
  String get moneyErrorMalformed => 'le montant n\'est pas un nombre simple';

  @override
  String get moneyErrorNegative =>
      'un montant négatif n\'est pas une somme à payer';

  @override
  String get moneyErrorTooManyDecimals =>
      'plus de décimales que la devise n\'en compte';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'le code de devise n\'est pas un de ceux que nous reconnaissons';

  @override
  String get moneyErrorOutOfRange => 'le montant est invraisemblablement élevé';

  @override
  String get escalationOcrFailed =>
      'La reconnaissance n\'a pas pu s\'exécuter du tout sur cette capture.';

  @override
  String get escalationNoTextRecognised =>
      'Cela ressemble à un document, mais aucun texte n\'a été reconnu.';

  @override
  String get escalationThinText =>
      'Bien trop peu de texte a été reconnu pour un document de cette taille.';

  @override
  String get escalationLowLineConfidence =>
      'Le moteur de reconnaissance a signalé une confiance faible sur plusieurs lignes.';

  @override
  String get escalationTableLikeLayout =>
      'La mise en page ressemble à un tableau, et une lecture ligne par ligne perd le lien entre chaque valeur et la ligne du tableau à laquelle elle appartient.';

  @override
  String get escalationFragmentedLayout =>
      'Le texte est revenu en une multitude de petits fragments, la structure est donc peu claire.';

  @override
  String get escalationMalformedText =>
      'Une grande partie du texte reconnu n\'est pas constituée de mots ou de nombres lisibles.';

  @override
  String get escalationConflictingDates =>
      'Plus d\'une date est présentée comme une échéance.';

  @override
  String get escalationConflictingAmounts =>
      'Plus d\'un montant est présenté comme la somme due.';

  @override
  String get escalationUnresolvedGrounding =>
      'Certaines valeurs n\'ont pas pu être rattachées au texte du document.';

  @override
  String get escalationInstructionLikeContent =>
      'Ce document contient du texte écrit comme s\'il s\'agissait d\'instructions destinées à l\'app. Il est traité comme du contenu de document, jamais comme des instructions.';

  @override
  String get providerFailureNetwork =>
      'Action n\'a pas pu joindre le service. Vérifiez votre connexion.';

  @override
  String get providerFailureTimedOut =>
      'Le service a mis trop de temps à répondre.';

  @override
  String get providerFailureServiceUnavailable =>
      'Le service est temporairement indisponible. Réessayez plus tard.';

  @override
  String get providerFailureUnauthorized =>
      'Cette app n\'est pas autorisée à utiliser le service pour le moment.';

  @override
  String get providerFailureBlocked =>
      'Le service a refusé de traiter ce document.';

  @override
  String get providerFailureUnknown =>
      'Action n\'a pas pu lire ce document. Réessayer peut fonctionner.';

  @override
  String get reviewBlockerTitle => 'Donnez un titre à cette tâche.';

  @override
  String get reviewBlockerDate =>
      'Choisissez quelle date est la véritable échéance, ou laissez-la non définie.';

  @override
  String get reviewBlockerAmount =>
      'Choisissez quel montant est le bon, ou laissez-le non défini.';

  @override
  String get reviewBlockerStepTitle =>
      'Les étapes que vous conservez ont besoin d\'un titre.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'page $page',
      one: 'page $page',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'pages $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'La réécriture ne contient plus $values. Vérifiez-la avant de l\'utiliser.',
      one:
          'La réécriture ne contient plus $values. Vérifiez-la avant de l\'utiliser.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'La réécriture ne contient plus $values ni $count autres valeurs. Vérifiez-la avant de l\'utiliser.',
      one:
          'La réécriture ne contient plus $values ni $count autre valeur. Vérifiez-la avant de l\'utiliser.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Atteint';

  @override
  String get goalNewSheetTitle => 'Que voulez-vous voir arriver ?';

  @override
  String get goalNewSheetSubtitle =>
      'Une phrase suffit. Vous pourrez ajouter les détails ensuite.';

  @override
  String get goalTitleHint =>
      'Renouveler l\'assurance auto sans payer trop cher.';

  @override
  String get goalCreateAction => 'Créer l\'objectif';

  @override
  String get goalTitleSheetTitle => 'Ce que vous voulez';

  @override
  String get goalOutcomeSheetTitle => 'À quoi ressemble le résultat';

  @override
  String get goalContextSheetTitle => 'Où ça en est';

  @override
  String get goalOutcomeHint =>
      'La voiture est assurée et les papiers sont classés.';

  @override
  String get goalContextHint =>
      'J\'ai deux devis et le renouvellement est le 18.';

  @override
  String get goalWorkspaceTitle => 'Objectif';

  @override
  String get goalUnmarkReached => 'Finalement pas atteint';

  @override
  String get goalMarkReached => 'Marquer comme atteint';

  @override
  String get goalNotFound => 'Cet objectif n\'est plus là.';

  @override
  String get goalDeleteTitle => 'Supprimer cet objectif ?';

  @override
  String get goalDeleteBody =>
      'L\'objectif est retiré de cet appareil. Les tâches qui en sont issues restent exactement telles quelles.';

  @override
  String get goalOutcomeLabel => 'À quoi ressemble l\'objectif atteint';

  @override
  String get goalOutcomeEmpty =>
      'Pas encore écrit. Un objectif est plus facile à planifier quand vous avez dit ce que veut dire l\'avoir atteint.';

  @override
  String get goalContextLabel => 'Où cela en est';

  @override
  String get goalContextEmpty =>
      'Rien d\'écrit pour l\'instant. Ce qui s\'est passé jusqu\'ici, et ce qui bloque.';

  @override
  String get goalTitleLabel => 'Ce que vous voulez';

  @override
  String get goalEditTooltip => 'Modifier l\'objectif';

  @override
  String get goalToolsLabel => 'Ce qu\'Action peut faire';

  @override
  String get goalToolsNotReady =>
      'Écrivez un peu plus sur ce que vous voulez, et ces outils auront de quoi travailler.';

  @override
  String get toolGoalOptimizerTitle => 'Affiner un objectif';

  @override
  String get toolActionPlanTitle => 'Construire un plan';

  @override
  String get resultFactUnconfirmed => 'Sans confirmation';

  @override
  String get resultSuggestedSteps => 'Étapes suggérées';

  @override
  String get resultSuggestedAction => 'Tâche suggérée';

  @override
  String get resultWorthAsking => 'Questions à poser';

  @override
  String get resultSuggestedDeadlines => 'Échéances suggérées';

  @override
  String get resultSuggestions => 'Suggestions';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count citations à l\'appui',
      one: '1 citation à l\'appui',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'De la source sélectionnée';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Préparation de votre document';

  @override
  String get toolRunStageReading => 'Lecture des pages sélectionnées';

  @override
  String get toolRunStageAnalysing => 'Analyse';

  @override
  String get toolRunStageBuilding => 'Construction de votre vérification';

  @override
  String get toolRunStageDone => 'Terminé';

  @override
  String get toolRunStageFailed => 'Cela n\'est pas allé à son terme';

  @override
  String get toolRunStageCancelled => 'Arrêté';

  @override
  String get toolRunFailureLocalCheckFailed => 'Cela n\'a pas pu être vérifié.';

  @override
  String get toolRunFailureProviderRetired =>
      'Ce fournisseur d\'IA n\'est plus disponible dans cette version.';

  @override
  String get toolRunFailureUnusableReply =>
      'Cette réponse n\'est pas revenue sous une forme utilisable. Réessayez.';

  @override
  String get toolRunFailureQuestionRequired =>
      'Saisissez d\'abord une question.';

  @override
  String get toolRunFailureInputRequired =>
      'Choisissez quelque chose sur quoi cet outil pourra travailler.';

  @override
  String get toolWarningReplyTruncated =>
      'Cette réponse a été coupée avant la fin, elle est donc peut-être incomplète.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Votre modèle n\'a renvoyé aucune citation à l\'appui, donc rien de ce qui figure ici n\'est étayé. Comparez-le au document avant d\'agir en conséquence.';

  @override
  String get aiSettingsRemoveTitle => 'Retirer cette connexion ?';

  @override
  String get aiSettingsRemoveBody =>
      'Action supprimera votre clé API de cet appareil et cessera d\'utiliser les fonctions d\'IA. Votre compte chez le fournisseur n\'est pas affecté.';

  @override
  String get aiSettingsProviderLabel => 'Fournisseur';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'C\'est votre fournisseur qui vous facture ce que vous utilisez. Action ne lance jamais de requête de lui-même.';

  @override
  String get aiSettingsConnectLabel => 'Connecter un fournisseur d\'IA';

  @override
  String get aiSettingsConnectDescription =>
      'Utilisez votre propre compte et votre propre clé API avec OpenAI, Anthropic, Google Gemini ou un endpoint compatible.';

  @override
  String get aiSettingsModelLabel => 'Modèle';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'Clé API';

  @override
  String get aiSettingsKeyStored =>
      'Conservée dans le stockage sécurisé de cet appareil.';

  @override
  String get aiSettingsKeyMissing =>
      'Aucune clé trouvée sur cet appareil. Reconnectez le fournisseur pour en ajouter une.';

  @override
  String get aiSettingsTestLabel => 'Tester la connexion';

  @override
  String get aiSettingsProviderUnavailable =>
      'Ce fournisseur n\'est pas disponible dans cette version.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Connecté. Modèles disponibles : $count.';
  }

  @override
  String get aiSettingsTestButton => 'Tester';

  @override
  String get aiSettingsChangeProvider => 'Changer de fournisseur ou de modèle';

  @override
  String get aiSettingsRemoveKey => 'Retirer la clé';

  @override
  String get aiSettingsSectionPrivacy => 'Confidentialité';

  @override
  String get aiSettingsWhatGetsSentLabel => 'Ce qui est envoyé';

  @override
  String get aiSettingsWhereItGoesLabel => 'Où cela va';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'Rien n\'est envoyé tant que vous n\'avez pas connecté de fournisseur.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Directement chez $provider, avec votre clé. Cela ne transite pas par les serveurs d\'Action.';
  }

  @override
  String get aiSettingsSectionData => 'Données';

  @override
  String get aiSettingsDataFootnote =>
      'Action retient quels outils vous avez utilisés, jamais ce sur quoi vous les avez utilisés.';

  @override
  String get aiSettingsRecentToolsLabel => 'Outils utilisés récemment';

  @override
  String get aiSettingsRecentToolsNone => 'Aucun';

  @override
  String get reminderNotificationTitle => 'Rappel Action';

  @override
  String get reminderNotificationPrivateBody =>
      'Vous avez quelque chose à vérifier.';

  @override
  String get reminderChannelName => 'Rappels Action';

  @override
  String get reminderChannelDescription =>
      'Les rappels que vous créez vous-même pour vos tâches.';

  @override
  String get onboardingStart => 'Commencer à utiliser Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'Étape $current sur $total';
  }

  @override
  String get onboardingCaptureTitle => 'Transformez l\'information en tâches';

  @override
  String get onboardingCaptureBody =>
      'Ajoutez une capture d\'écran, une photo ou un texte qu\'on vous a envoyé. Action le lit et détermine ce qu\'il vous demande de faire.';

  @override
  String get onboardingReviewTitle =>
      'Rien n\'est enregistré tant que vous ne l\'avez pas confirmé';

  @override
  String get onboardingReviewBody =>
      'Action vous montre ce qu\'il a trouvé et les mots dont cela vient. Vous corrigez ce qui est faux. Tant que vous n\'avez pas confirmé, c\'est une suggestion — pas un fait, et pas une tâche.';

  @override
  String get onboardingTrackingTitle => 'Gardez le fil de ce qui compte';

  @override
  String get onboardingTrackingBody =>
      '« Demande votre attention » met en avant ce qui est en retard ou proche. Chaque tâche conserve sa prochaine étape, sa progression et tout rappel que vous avez créé pour elle.';

  @override
  String get onboardingPrivacyBody => 'À savoir avant de commencer :';

  @override
  String get onboardingPrivacyOnDevice =>
      'Vos tâches, captures, rappels et recherches sont stockés sur cet appareil. La recherche et les rappels fonctionnent sans connexion.';

  @override
  String get onboardingPrivacySentToRead =>
      'Quand vous demandez à Action de lire quelque chose, ce contenu est envoyé au service d\'IA qui l\'interprète.';

  @override
  String get onboardingPrivacyCloud =>
      'Un court relevé d\'une tâche confirmée — son titre, ses dates, son montant et l\'étape suggérée — peut être enregistré dans le cloud sous un identifiant anonyme propre à cet appareil. Vos captures, étapes et rappels ne le sont pas.';

  @override
  String get onboardingPrivacyNotBackup =>
      'Ce relevé n\'est pas une sauvegarde. Il ne peut rien restaurer sur un nouvel appareil.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obstacles',
      one: '1 obstacle',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Pourrait être plus simple';

  @override
  String get toolDescriptionGoalOptimizer =>
      'Ce qui manque, ce qui bloque, par quoi commencer.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'Après : $step';
  }

  @override
  String get toolSectionThePlan => 'Le plan';

  @override
  String get toolDescriptionActionPlan =>
      'Une série ordonnée d\'étapes que vous pouvez transformer en tâches.';

  @override
  String get toolTitleSmartChecklist => 'Faire une liste de contrôle';

  @override
  String get toolDescriptionSmartChecklist =>
      'Tout ce que ceci vous demande, dans l\'ordre.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count informations manquantes',
      one: '1 information manquante',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'Ces éléments se contredisent';

  @override
  String get toolTitleMissingInformation => 'Ce qui manque';

  @override
  String get toolDescriptionMissingInformation =>
      'Les lacunes, et les questions à poser à leur sujet.';

  @override
  String get aiAdapterTimedOut => 'Cela a pris trop de temps et a été arrêté.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'La connexion sécurisée à votre fournisseur d\'IA a échoué.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action n\'a pas pu trouver ce modèle ou cet endpoint.';

  @override
  String get aiAdapterRequestRejected =>
      'Votre fournisseur d\'IA a rejeté cette requête.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action n\'a pas pu ouvrir le stockage sécurisé de cet appareil.';

  @override
  String get aiAdapterEndpointMissing =>
      'Ajoutez l\'adresse de votre endpoint d\'IA dans les Réglages.';

  @override
  String get aiAdapterReplyIncomplete =>
      'Cette réponse était incomplète. Réessayez.';

  @override
  String get aiAdapterContentDeclined =>
      'Votre fournisseur a refusé de traiter ce contenu.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'Cela dépasse $limit fichiers à la fois. Sélectionnez-en moins.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'L\'une de ces images est trop volumineuse pour être analysée.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '« $filename » est trop volumineux pour être analysé. La limite est de $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '« $filename » compte $count pages. Action en lit $limit au maximum à la fois — choisissez une plage.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'Cette sélection est trop volumineuse pour être envoyée en une seule requête.';

  @override
  String get toolRunNotAvailableTitle => 'Cet outil n\'est pas disponible';

  @override
  String get toolRunNotAvailableMessage =>
      'Il a peut-être été retiré dans une version plus récente d\'Action.';

  @override
  String get toolRunNoSourcesYet =>
      'Rien à traiter pour l\'instant. Capturez quelque chose, ou collez du texte ci-dessous.';

  @override
  String get toolRunChooseSourcesToCompare => 'Choisissez quoi comparer';

  @override
  String get toolRunChooseSource => 'Choisissez une source';

  @override
  String get toolRunQuestionLabel => 'Votre question';

  @override
  String get toolRunQuestionHint => 'Quelle est l\'échéance ?';

  @override
  String get toolRunFreeTextLabel => 'Ou collez du texte';

  @override
  String get toolRunFreeTextHint => 'Collez ou saisissez ici';

  @override
  String get toolRunModeLabel => 'Style';

  @override
  String get toolRunRunLocally => 'Contrôler sur cet appareil';

  @override
  String get toolRunRun => 'Lancer';

  @override
  String get toolRunStop => 'Arrêter';

  @override
  String get toolRunRunAgain => 'Relancer';

  @override
  String get toolRunWorkingOn => 'Sujet';

  @override
  String toolRunFirstUseTitle(String provider) {
    return 'Envoyer ceci à $provider ?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'Le contenu que vous avez sélectionné sera envoyé à $provider pour traitement, avec votre clé API.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'Votre clé reste sur cet appareil. Action n\'envoie rien en arrière-plan, et n\'envoie pas vos autres tâches ni vos autres sources.';

  @override
  String get toolRunScopeTitle => 'Avant de lancer ceci';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages seront analysées avec votre connexion $provider.',
      one: '1 page sera analysée avec votre connexion $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers seront analysés avec votre connexion $provider.',
      one: '1 fichier sera analysé avec votre connexion $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'Le texte que vous avez sélectionné sera envoyé à votre connexion $provider.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Connectez un fournisseur d\'IA pour utiliser cet outil';

  @override
  String get toolRunNeedsProviderBody =>
      'Vous utilisez votre propre compte de fournisseur et votre propre clé API.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étapes',
      one: '1 étape',
    );
    return 'Tâche créée à partir de $_temp0.';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étapes ajoutées.',
      one: '1 étape ajoutée.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étapes',
      one: '1 étape',
    );
    return 'Créer une tâche · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étapes',
      one: '1 étape',
    );
    return 'Ajouter à cette tâche · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Photo';

  @override
  String get sourceTypeLabelScreenshot => 'Capture d\'écran';

  @override
  String get sourceTypeLabelPastedText => 'Note collée';

  @override
  String get sourceTypeLabelDocument => 'Document';

  @override
  String get toolModeClearer => 'Plus clair';

  @override
  String get toolModeMoreProfessional => 'Plus professionnel';

  @override
  String get toolModeShorter => 'Plus court';

  @override
  String get toolModeSimpler => 'Plus simple';

  @override
  String get toolModeMoreStructured => 'Plus structuré';

  @override
  String get toolModeMorePersuasive => 'Plus convaincant';

  @override
  String get toolModeGrammarOnly => 'Grammaire seulement';

  @override
  String get toolModeProfessional => 'Professionnel';

  @override
  String get toolModeConcise => 'Concis';

  @override
  String get toolModeFriendly => 'Amical';

  @override
  String get toolModeFormal => 'Formel';

  @override
  String get toolModeAskForClarification => 'Demander des précisions';

  @override
  String get toolModeConfirm => 'Confirmer';

  @override
  String get toolModeDispute => 'Contester ceci';

  @override
  String get toolModeQuick => 'Rapide';

  @override
  String get toolModeDetailed => 'Détaillé';

  @override
  String get toolModeExecutive => 'Pour décideurs';

  @override
  String get toolModeKeyPoints => 'Points clés';

  @override
  String get toolModeActionFocused => 'Axé sur les tâches';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count informations citées n\'ont pas pu être trouvées dans ce que vous avez sélectionné, elles sont donc marquées comme incertaines.',
      one: 'Une information citée n\'a pas pu être trouvée dans ce que vous avez sélectionné, elle est donc marquée comme incertaine.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action n\'a pas pu contrôler ces citations par rapport au fichier lui-même, elles n\'ont donc pas été contrôlées.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'En retard · $count jours',
      one: 'En retard · 1 jour',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Due demain';

  @override
  String get triageBadgeReminderSoon => 'Rappel bientôt';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'En retard de $count jours',
      one: 'En retard d\'un jour',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'Cette tâche est terminée.';

  @override
  String get triageExplanationNothingPressing =>
      'Cette tâche est ici car rien la concernant ne presse encore.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'Cette tâche demande votre attention car $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'Cette tâche se trouve plus bas car $reason.';
  }

  @override
  String get triageReasonOverdue => 'elle est en retard';

  @override
  String get triageReasonDeadlinePassed => 'son échéance est passée';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'elle a $count jours de retard',
      one: 'elle a un jour de retard',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'elle est due aujourd\'hui';

  @override
  String get triageReasonCriticalDueSoon =>
      'vous l\'avez marquée comme critique et son échéance est proche';

  @override
  String get triageReasonAllStepsDone =>
      'toutes les étapes sont faites — il ne reste plus qu\'à la terminer';

  @override
  String get triageReasonDueTomorrow => 'elle est due demain';

  @override
  String get triageReasonReminderSoon =>
      'vous avez créé pour elle un rappel prévu dans les vingt-quatre prochaines heures';

  @override
  String get triageReasonDueWithinThreeDays =>
      'elle est due dans les trois jours';

  @override
  String get triageReasonCriticalNoDeadline =>
      'vous l\'avez marquée comme critique, et elle n\'a pas d\'échéance';

  @override
  String get triageReasonDueWithinSevenDays => 'elle est due dans la semaine';

  @override
  String get triageReasonImportant => 'vous l\'avez marquée comme importante';

  @override
  String get triageReasonDueLater => 'son échéance est plus lointaine';

  @override
  String get triageReasonNoDeadline =>
      'elle n\'a pas d\'échéance et rien ne presse';

  @override
  String cardCompletedTooltip(String title) {
    return 'Terminée : $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Comprendre ce document';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'Ce que c\'est, ce qui compte, et quoi faire à ce sujet.';

  @override
  String get toolSectionWhatThisIs => 'Ce que c\'est';

  @override
  String get toolSectionWhatMatters => 'Ce qui compte';

  @override
  String get toolSectionKeyDetails => 'Informations clés';

  @override
  String get toolTitleAskDocument => 'Interroger une source';

  @override
  String get toolDescriptionAskDocument =>
      'Des réponses fondées sur ce que vous avez sélectionné — ou rien.';

  @override
  String get toolSectionNoAnswer => 'Aucune réponse dans ce contenu';

  @override
  String get toolSectionNoAnswerBody =>
      'Action n\'a pas trouvé cela dans le document sélectionné.';

  @override
  String get toolSectionAnswer => 'Réponse';

  @override
  String get toolSectionFromTheDocument => 'Extrait du document';

  @override
  String get toolWarningQuoteNotFound =>
      'La citation sur laquelle repose cette réponse ne figure pas dans le contenu sélectionné. Considérez la réponse comme non fiable.';

  @override
  String get toolTitleSmartSummary => 'Résumer';

  @override
  String get toolDescriptionSmartSummary =>
      'La version courte — ou celle qui change ce que vous avez à faire.';

  @override
  String get toolSectionKeyPoints => 'Points clés';

  @override
  String get toolTitleCompareDocuments => 'Comparer des documents';

  @override
  String get toolDescriptionCompareDocuments =>
      'Ce qui a changé, ce qui se contredit, ce qui manque.';

  @override
  String get toolSectionWhatDiffers => 'Ce qui diffère';

  @override
  String get toolSectionConflicts => 'Contradictions';

  @override
  String get toolSectionOnlyInOne => 'Uniquement dans l\'un d\'eux';

  @override
  String get toolSectionInCommon => 'En commun';

  @override
  String get sensitiveKindEmail => 'Adresse e-mail';

  @override
  String get sensitiveKindPhone => 'Numéro de téléphone';

  @override
  String get sensitiveKindPaymentCard => 'Numéro de carte bancaire';

  @override
  String get sensitiveKindIban => 'Compte bancaire (IBAN)';

  @override
  String get sensitiveKindNationalId => 'Numéro national d\'identité';

  @override
  String get sensitiveKindPostcode => 'Code postal';

  @override
  String get sensitiveKindAccountNumber => 'Numéro de compte';

  @override
  String get sensitiveKindReference => 'Numéro de référence';

  @override
  String get sensitiveKindDateOfBirth => 'Date de naissance';

  @override
  String get sensitiveKindUrl => 'Adresse web';

  @override
  String get verdictVerifiedProvenance => 'Provenance vérifiée disponible';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'Ce fichier porte une signature qui a été vérifiée et qui s\'est révélée valide.';

  @override
  String get verdictSignalsSynthetic =>
      'Signaux compatibles avec un contenu généré par IA';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'Ce fichier déclare avoir été créé avec un outil génératif. Les métadonnées peuvent être modifiées ou supprimées : c\'est donc ce que le fichier affirme, pas une preuve.';

  @override
  String get verdictSignalsEdited =>
      'Signaux compatibles avec un contenu modifié';

  @override
  String get verdictSignalsEditedExplainer =>
      'Ce fichier déclare être passé par un logiciel de retouche. C\'est courant pour les photographies, et cela ne signifie pas en soi que quoi que ce soit a été truqué.';

  @override
  String get verdictNoReliableProvenance => 'Aucune provenance fiable trouvée';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'Ce fichier ne contient aucune information de provenance. C\'est normal — la plupart des services la suppriment — et ce n\'est le signe de rien.';

  @override
  String get verdictInconclusive => 'Non concluant';

  @override
  String get verdictInconclusiveExplainer =>
      'Il n\'y a pas assez d\'informations ici pour dire d\'où cela vient.';

  @override
  String get authenticitySignalCamera => 'Appareil photo';

  @override
  String get authenticitySignalSoftware => 'Logiciel';

  @override
  String get authenticitySignalDescription => 'Description';

  @override
  String get authenticitySignalCopyright => 'Copyright';

  @override
  String get authenticitySignalLocation => 'Localisation';

  @override
  String get authenticitySignalLocationValue =>
      'Des données de localisation sont présentes dans ce fichier.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Non vérifié — cette version de l\'app n\'a pas de vérificateur de signature.';

  @override
  String get authenticitySignalFile => 'Fichier';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'N\'a pas pu être lu comme une image.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'Format d\'image non reconnu.';

  @override
  String get authenticitySignalText => 'Texte';

  @override
  String get authenticitySignalTextValue =>
      'Le texte seul ne permet pas de déterminer de façon fiable si une IA a été utilisée. Action ne devine pas.';

  @override
  String get fileTypePng => 'une image PNG';

  @override
  String get fileTypeJpeg => 'une image JPEG';

  @override
  String get fileTypeGif => 'une image GIF';

  @override
  String get fileTypeWebp => 'une image WebP';

  @override
  String get fileTypeWav => 'un enregistrement WAV';

  @override
  String get fileTypePdf => 'un document PDF';

  @override
  String get fileTypeHeic => 'une image HEIC';

  @override
  String get fileTypeVideo => 'un fichier vidéo';

  @override
  String get fileTypeTiff => 'une image TIFF';

  @override
  String get fileTypeBitmap => 'une image bitmap';

  @override
  String get fileTypeRtf => 'un document RTF';

  @override
  String get fileTypeZip => 'une archive Zip';

  @override
  String get fileTypeGzip => 'une archive gzip';

  @override
  String get fileTypeSevenZip => 'une archive 7-Zip';

  @override
  String get fileTypeRar => 'une archive RAR';

  @override
  String get fileTypeWindowsProgram => 'un programme Windows';

  @override
  String get fileTypeLinuxProgram => 'un programme Linux';

  @override
  String get fileTypePostScript => 'un document PostScript';

  @override
  String get fileTypeOgg => 'un enregistrement Ogg';

  @override
  String get fileTypeMp3 => 'un enregistrement MP3';

  @override
  String get fileTypePlainText => 'du texte brut';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'Ce fichier est nommé \".$extension\" mais son contenu est $contents. Cela peut être une simple erreur, et c\'est aussi ainsi qu\'un fichier se retrouve ouvert par autre chose que ce que vous attendiez.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count octets',
      one: '$count octet',
    );
    return '$_temp0';
  }

  @override
  String fileSizeKilobytes(String size) {
    return '$size Ko';
  }

  @override
  String fileSizeMegabytes(String size) {
    return '$size Mo';
  }

  @override
  String fileSizeGigabytes(String size) {
    return '$size Go';
  }

  @override
  String get credentialKindPrivateKey => 'Clé privée';

  @override
  String get credentialKindApiKey => 'Clé API';

  @override
  String get credentialKindConnectionString => 'Chaîne de connexion';

  @override
  String get credentialKindAccessToken => 'Jeton d\'accès';

  @override
  String get credentialKindAuthorizationHeader => 'En-tête Authorization';

  @override
  String get credentialKindPasswordOrKey => 'Mot de passe ou clé';

  @override
  String get credentialKindPossibleSecret => 'Secret possible';

  @override
  String get credentialAdvicePrivateKey =>
      'Retirez ceci avant de partager, et remplacez la paire de clés. Une clé privée ne peut plus être rendue sûre une fois qu\'elle a été vue.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Révoquez cette clé auprès du fournisseur et générez-en une nouvelle. La retirer du document ne la désactive pas.';

  @override
  String get credentialAdviceConnectionString =>
      'Ceci contient un mot de passe et l\'adresse qu\'il ouvre. Changez le mot de passe si ceci a déjà été partagé.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Ce genre de jeton expire souvent, mais pas toujours. Considérez-le comme actif tant que vous ne savez pas quand il expire.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Retirez la valeur de l\'en-tête. Les journaux de requêtes collés sont l\'un des moyens les plus courants par lesquels un jeton encore actif est partagé par accident.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Déplacez ceci dans une variable d\'environnement ou un coffre à secrets, et changez la valeur si le fichier a été partagé.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action ne peut pas dire ce que c\'est. Vérifiez-le avant de partager — ce peut tout aussi bien être un identifiant qu\'une somme de contrôle.';

  @override
  String get credentialLabelAnthropicApiKey => 'Clé API Anthropic';

  @override
  String get credentialLabelOpenAiProjectKey => 'Clé de projet OpenAI';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'Clé API de type OpenAI';

  @override
  String get credentialLabelGoogleApiKey => 'Clé API Google';

  @override
  String get credentialLabelGoogleOAuthToken => 'Jeton OAuth Google';

  @override
  String get credentialLabelGitHubToken => 'Jeton GitHub';

  @override
  String get credentialLabelSlackToken => 'Jeton Slack';

  @override
  String get credentialLabelAwsAccessKeyId => 'ID de clé d\'accès AWS';

  @override
  String get credentialLabelGitLabToken => 'Jeton GitLab';

  @override
  String get credentialLabelNpmToken => 'Jeton npm';

  @override
  String get credentialLabelPassphrase => 'Phrase secrète';

  @override
  String get credentialLabelPassword => 'Mot de passe';

  @override
  String get credentialLabelRefreshToken => 'Jeton d\'actualisation';

  @override
  String get credentialLabelToken => 'Jeton';

  @override
  String get credentialLabelClientSecret => 'Secret client';

  @override
  String get credentialLabelCredential => 'Identifiant d\'accès';

  @override
  String get credentialLabelSecret => 'Secret';

  @override
  String get linkVerdictNoObviousSignals => 'Aucun signal évident';

  @override
  String get linkVerdictWorthChecking => 'À regarder de plus près';

  @override
  String get linkVerdictTreatWithCaution => 'À traiter avec prudence';

  @override
  String get linkSummaryNoObviousSignals =>
      'Rien d\'inhabituel dans la façon dont ce lien est écrit. Ce n\'est pas la même chose que savoir que la page est digne de confiance — vous seul pouvez juger si vous vous y attendiez.';

  @override
  String get linkSummaryWorthChecking =>
      'Un élément de ce lien mérite un coup d\'œil avant de l\'ouvrir.';

  @override
  String get linkSummaryTreatWithCaution =>
      'Plusieurs éléments de la façon dont ce lien est écrit méritent d\'être vérifiés avant de l\'ouvrir.';

  @override
  String get linkSignalNotHttps => 'Non chiffré';

  @override
  String get linkSignalNonWebScheme => 'Pas un lien web';

  @override
  String get linkSignalEmbeddedCredentials => 'Mot de passe dans le lien';

  @override
  String get linkSignalMisleadingAuthority => 'Vraie adresse masquée';

  @override
  String get linkSignalIpLiteralHost => 'Adresse numérique';

  @override
  String get linkSignalPunycodeHost => 'Caractères encodés dans le nom';

  @override
  String get linkSignalMixedScriptHost => 'Alphabets mélangés dans le nom';

  @override
  String get linkSignalEncodedHost => 'Caractères échappés dans le nom';

  @override
  String get linkSignalUnusualPort => 'Port inhabituel';

  @override
  String get linkSignalDeepSubdomain => 'Beaucoup de parties dans le nom';

  @override
  String get linkSignalPublicSuffixInSubdomain =>
      'Nom familier au mauvais endroit';

  @override
  String get linkSignalShortener => 'Lien raccourci';

  @override
  String get linkSignalExecutableTarget => 'Télécharge un programme';

  @override
  String get linkSignalRedirectParameter => 'Vous renvoie ailleurs';

  @override
  String get linkSignalVeryLongUrl => 'Très long';

  @override
  String get linkSignalUnparseable => 'Impossible à lire comme un lien';

  @override
  String get linkDetailNotHttps =>
      'Ce lien utilise http : tout ce que vous saisissez dans la page peut être lu en chemin.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'Ceci s\'ouvre avec \"$scheme:\" plutôt qu\'avec une page web. Cela peut demander à une autre app de faire quelque chose.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'Un nom d\'utilisateur et un mot de passe sont inscrits dans ce lien. Partout où il est partagé, ils partent avec lui.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'Tout ce qui précède le \"@\" est ignoré par le navigateur. La vraie destination est \"$host\".';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'Ceci mène à \"$host\" — une adresse brute plutôt qu\'un nom. Les sites légitimes utilisent presque toujours un nom.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'Le nom du site contient des caractères non latins, stockés sous forme encodée. C\'est normal pour de nombreuses langues, et c\'est aussi ainsi qu\'un nom peut être fait pour ressembler à un nom familier.';

  @override
  String get linkDetailMixedScriptHost =>
      'Le nom du site mêle des lettres latines à des lettres d\'un autre alphabet qui leur ressemblent à s\'y méprendre. Lisez-le caractère par caractère.';

  @override
  String get linkDetailEncodedHost =>
      'Le nom du site contient des codes d\'échappement, qui n\'ont rien à y faire. Ils peuvent masquer ce que le nom dit réellement.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'Ceci se connecte sur le port $port plutôt que sur le port habituel. C\'est courant pour les serveurs de test et inhabituel pour les sites publics.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Le nom a $count parties. Seules les deux dernières déterminent qui gère le site ; le reste peut contenir n\'importe quoi.',
      one:
          'Le nom a $count partie. Seules les deux dernières déterminent qui gère le site ; le reste peut contenir n\'importe quoi.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'Ce nom contient \".$suffix.\" en son milieu, ce qui fait passer le début pour le site. Le site est en réalité \"$host\".';
  }

  @override
  String get linkDetailShortener =>
      'Un service de raccourcissement masque la vraie destination. Vous ne pouvez pas savoir où mène ce lien sans l\'ouvrir.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'Ce lien se termine par \"$fileExtension\" : il télécharge donc quelque chose qui peut s\'exécuter sur votre appareil, et non une page à lire.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'Ce lien transporte une seconde adresse dans son paramètre \"$parameter\" : l\'ouvrir peut donc vous emmener ailleurs que vers \"$host\".';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'Les liens longs sont plus difficiles à lire, et la partie qui détermine la destination peut être repoussée hors de vue.';

  @override
  String get linkDetailUnparseable =>
      'Action n\'a pas pu lire ceci comme une adresse web. Méfiez-vous des liens qui ne ressemblent pas à des liens.';

  @override
  String get toolTitleRedaction => 'Masquer les informations sensibles';

  @override
  String get toolDescriptionRedaction =>
      'Repérez ce qui ne doit pas être partagé, et produisez une copie nettoyée.';

  @override
  String get toolSectionRedactionNothingToScan => 'Rien à analyser';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'Cet outil lit du texte. Sélectionnez une note, un message collé, ou une capture dont le texte a été lu.';

  @override
  String get toolSectionRedactionNothingFound => 'Rien d\'évident trouvé';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action n\'a trouvé dans ce texte aucune adresse e-mail, aucun numéro de téléphone, aucun numéro de carte ni aucun numéro de référence.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments qui méritent d\'être masqués',
      one: '$count élément qui mérite d\'être masqué',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Copie caviardée';

  @override
  String get toolWarningRedactionCoverage =>
      'Ceci repère des motifs comme les e-mails, les numéros de téléphone et les numéros de compte. Cela ne détectera pas tout ce qui est sensible — lisez la copie avant de la partager.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action ne peut pas caviarder les images ni les fichiers PDF. Recouvrir quelque chose sur une image laisserait l\'original en dessous, cette option n\'est donc pas proposée.';

  @override
  String get toolTitleAuthenticity => 'Vérifier d\'où vient ceci';

  @override
  String get toolDescriptionAuthenticity =>
      'Ce qu\'un fichier déclare sur sa propre origine.';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'Rien à inspecter';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Sélectionnez une image ou du texte.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'Ce que ce fichier dit de lui-même';

  @override
  String get toolSectionAuthenticityFileItself => 'Le fichier lui-même';

  @override
  String get toolSectionFileContents => 'Contenu';

  @override
  String get toolSectionFileUnknownFormat => 'Pas un format qu\'Action connaît';

  @override
  String get toolSectionFileSize => 'Taille';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'Ceci rapporte ce qu\'un fichier déclare sur lui-même. Les métadonnées peuvent être modifiées ou supprimées : rien de tout cela n\'est une preuve. Ne vous servez pas de ceci pour accuser qui que ce soit.';

  @override
  String get toolTitleCredentialScanner =>
      'Repérer des clés et des mots de passe';

  @override
  String get toolDescriptionCredentialScanner =>
      'Repérez les identifiants d\'accès avant de partager quelque chose.';

  @override
  String get toolSectionCredentialNothingToCheck => 'Rien à contrôler';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Collez du texte, ou choisissez une capture dont le texte a été lu. Cet outil ne lit que du texte.';

  @override
  String get toolSectionCredentialNoneFound =>
      'Aucun identifiant d\'accès trouvé';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action n\'a rien trouvé dans ce texte qui ait la forme d\'une clé API, d\'une clé privée, d\'un jeton ou d\'un mot de passe.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count identifiants d\'accès trouvés',
      one: '$count identifiant d\'accès trouvé',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments qui pourraient être des secrets',
      one: '$count élément qui pourrait être un secret',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Copie dont les identifiants d\'accès ont été retirés';

  @override
  String get toolWarningCredentialRevoke =>
      'Retirer une clé d\'un document ne la désactive pas. Si l\'une d\'elles a déjà été partagée, révoquez-la auprès du fournisseur et générez-en une nouvelle.';

  @override
  String get toolWarningCredentialCoverage =>
      'Ceci repère les identifiants d\'accès qui ont une forme reconnaissable. Un mot de passe écrit en toutes lettres dans une phrase ne sera pas trouvé : lisez donc aussi le texte.';

  @override
  String get toolTitleLinkInspector => 'Vérifier un lien';

  @override
  String get toolDescriptionLinkInspector =>
      'Ce qu\'une adresse révèle avant que vous l\'ouvriez.';

  @override
  String get toolSectionLinkNoneFound => 'Aucun lien trouvé';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Collez un lien, ou choisissez une capture qui en contient un.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count liens dans ce texte',
      one: 'Le lien dans ce texte',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'Impossible à lire';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'Rien d\'inhabituel dans la façon dont ils sont écrits';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'Ce n\'est pas la même chose que savoir que ces pages sont dignes de confiance. Vous seul pouvez juger si vous vous y attendiez.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action lit uniquement l\'adresse. Action n\'ouvre pas le lien, ne consulte pas le site et n\'interroge aucun service de réputation — le faire enverrait votre navigation chez quelqu\'un d\'autre.';

  @override
  String get toolWarningLinkNoSignals =>
      'Un lien sans aucun signal peut tout de même être nuisible. Ceci repère des problèmes dans la façon dont une adresse est écrite, ce qui n\'est pas tout ce qu\'il y a à savoir sur l\'endroit où elle mène.';

  @override
  String get toolSectionObjective => 'Votre objectif';

  @override
  String get toolSectionCurrentState => 'Où en est l\'objectif';

  @override
  String get toolSectionRecommendedNextStep => 'Prochaine étape recommandée';

  @override
  String get toolSectionCredentialAdvice => 'Que faire';

  @override
  String get toolSectionSummary => 'Résumé';

  @override
  String get toolDetailSeparator => ' · ';
}
