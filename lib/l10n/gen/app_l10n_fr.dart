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
}
