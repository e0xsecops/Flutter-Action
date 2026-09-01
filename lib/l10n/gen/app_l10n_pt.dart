// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppL10nPt extends AppL10n {
  AppL10nPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDone => 'Concluído';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonBack => 'Voltar';

  @override
  String get commonRetry => 'Tentar de novo';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonRemove => 'Retirar';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonOpen => 'Abrir';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get commonCopied => 'Copiado';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonAdd => 'Adicionar';

  @override
  String get commonOn => 'Ligado';

  @override
  String get commonOff => 'Desligado';

  @override
  String get commonUnknown => 'Desconhecido';

  @override
  String get commonChecking => 'A verificar…';

  @override
  String get commonSettings => 'Definições';

  @override
  String get commonDismiss => 'Dispensar';

  @override
  String get commonUndo => 'Anular';

  @override
  String get commonSkip => 'Ignorar';

  @override
  String get commonNotNow => 'Agora não';

  @override
  String get commonSomethingWentWrong => 'Algo correu mal.';

  @override
  String get navToday => 'Hoje';

  @override
  String get navLibrary => 'Biblioteca';

  @override
  String get navIntelligence => 'Inteligência';

  @override
  String get navSearch => 'Pesquisa';

  @override
  String get navCapture => 'Capturar algo';

  @override
  String get todayGreetingMorning => 'Bom dia';

  @override
  String get todayGreetingAfternoon => 'Boa tarde';

  @override
  String get todayGreetingEvening => 'Boa noite';

  @override
  String get todayDateFormat => 'EEEE · d \'de\' MMMM';

  @override
  String get todayActionsLoadFailed =>
      'Não foi possível carregar as suas tarefas. Continuam guardadas neste dispositivo.';

  @override
  String get todaySectionNeedsAttention => 'Precisa de atenção';

  @override
  String get todaySectionAlsoNeedsAttention => 'Também precisa de atenção';

  @override
  String get todaySectionWaitingForReview => 'À espera de revisão';

  @override
  String get todaySectionComingUp => 'A seguir';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Ver todas as $count capturas';
  }

  @override
  String get todaySeeAllInLibrary => 'Ver tudo na Biblioteca';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count feitas',
      one: '1 feita',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tarefas concluídas. Abrir a biblioteca.',
      one: '1 tarefa concluída. Abrir a biblioteca.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'COMECE COM';

  @override
  String get todayQuickPhoto => 'Foto';

  @override
  String get todayQuickScreenshot => 'Captura de ecrã';

  @override
  String get todayQuickText => 'Texto';

  @override
  String get todayQuickTools =>
      'Verifique um link, ou encontre chaves num texto';

  @override
  String get briefBadgeNeedsYou => 'PRECISA DE SI';

  @override
  String get briefBadgeToReview => 'A REVER';

  @override
  String get briefBadgeAhead => 'À FRENTE';

  @override
  String get briefBadgeStartHere => 'COMECE AQUI';

  @override
  String get briefBadgeClear => 'LIVRE';

  @override
  String get briefNext => 'SEGUINTE';

  @override
  String briefOpenAction(String title) {
    return 'Abrir $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Marcar «$title» como feita';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tarefas precisam da sua atenção',
      one: '1 tarefa precisa da sua atenção',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capturas também esperam revisão.',
      one: '1 captura também espera revisão.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capturas estão à sua espera',
      one: '1 captura está à sua espera',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'Nada está atrasado.';

  @override
  String get briefHeadlineNothingToday => 'Hoje nada precisa de si';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tarefas estão a chegar.',
      one: '1 tarefa está a chegar.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Está em dia';

  @override
  String get briefDetailClear => 'Nada está por cumprir e nada está à espera.';

  @override
  String get briefHeadlineFirstRun => 'Comece com o que quiser';

  @override
  String get briefDetailFirstRun =>
      'Uma carta, uma captura de ecrã, uma nota — a Action percebe o que é.';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get settingsSectionPersonalise => 'Personalizar';

  @override
  String get settingsAppearance => 'Aspeto';

  @override
  String get settingsAppearanceDescription =>
      'Claro, escuro, ou o que o dispositivo estiver a fazer.';

  @override
  String get settingsLanguageDescription =>
      'O idioma em que a Action fala consigo.';

  @override
  String get appearanceSystem => 'Sistema';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceDark => 'Escuro';

  @override
  String get appearanceSystemDescription => 'Seguir a definição do dispositivo';

  @override
  String get appearanceLightDescription => 'Sempre claro';

  @override
  String get appearanceDarkDescription => 'Sempre escuro';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSubtitle =>
      'As alterações aplicam-se de imediato. Nada é enviado para lado nenhum; a escolha fica neste dispositivo.';

  @override
  String get languageSectionChoose => 'Escolher um idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageSystemDescription => 'Seguir o idioma do dispositivo';

  @override
  String get languageDraftNote =>
      'O inglês é o idioma em que os textos da Action foram escritos. As restantes traduções foram preparadas a partir de um glossário fixo e verificadas automaticamente, mas ainda não foram lidas por um falante nativo. Onde a formulação exacta importa — privacidade, segurança, o que a Action afirma e o que recusa afirmar — o inglês continua a ser a referência.';

  @override
  String get settingsIntelligenceFootnote =>
      'A Action funciona sem IA. Ligar o seu próprio fornecedor acrescenta ferramentas de análise de documentos, planeamento e redacção.';

  @override
  String get settingsAiProvider => 'Fornecedor de IA';

  @override
  String get settingsAiNotConnected =>
      'Sem ligação. Use a sua própria conta e chave de API.';

  @override
  String settingsAiConnected(String provider) {
    return 'Ligado a $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Privacidade e segurança';

  @override
  String get settingsSecurity => 'Segurança';

  @override
  String get settingsWhereInfoLives => 'Onde vive a sua informação';

  @override
  String get settingsWhereInfoLivesDescription =>
      'O que fica neste dispositivo e o que não fica.';

  @override
  String get protectionAppLock => 'Bloqueio da app';

  @override
  String get protectionScreenPrivacy => 'privacidade do ecrã';

  @override
  String get protectionPrivateReminders => 'lembretes privados';

  @override
  String get protectionSummaryNone =>
      'Bloqueio da app, privacidade do ecrã e o que sai deste dispositivo.';

  @override
  String protectionSummaryOne(String first) {
    return '$first está ligado.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first e $second estão ligados.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second e $third estão ligados.';
  }

  @override
  String get settingsSectionReminders => 'Lembretes';

  @override
  String get settingsRemindersFootnote =>
      'O Android pode entregar um lembrete um pouco depois da hora que definiu, consoante as definições de bateria e a forma como o dispositivo está a ser usado.';

  @override
  String get settingsNotifications => 'Notificações';

  @override
  String get settingsNotificationsOnDescription =>
      'Os lembretes que definir podem ser mostrados.';

  @override
  String get settingsNotificationsOffDescription =>
      'Desligadas para a Action, por isso os lembretes não aparecerão.';

  @override
  String get settingsNotificationsUnknown => 'Não foi possível verificar.';

  @override
  String get settingsNotificationsAllowed => 'Permitidas';

  @override
  String get settingsOpenSystemSettings => 'Abrir definições';

  @override
  String get settingsActionFootnote =>
      'A Action transforma informação desarrumada em próximos passos claros. É você que confirma tudo antes de ser guardado.';

  @override
  String get settingsHelp => 'Ajuda';

  @override
  String get settingsHelpDescription =>
      'Como a Action funciona e o que não fará.';

  @override
  String get settingsVersion => 'Versão';
}
