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
      'Deux outils n\'envoient jamais rien : masquer des informations sensibles, et vérifier d\'où vient un fichier. Les deux fonctionnent entièrement sur cet appareil.';

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
}
