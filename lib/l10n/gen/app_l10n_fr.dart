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
