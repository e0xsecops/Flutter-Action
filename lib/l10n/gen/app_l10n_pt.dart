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

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Agora mesmo';

  @override
  String relativeMinutes(int count) {
    return 'há $count min';
  }

  @override
  String relativeHours(int count) {
    return 'há $count h';
  }

  @override
  String get relativeYesterday => 'Ontem';

  @override
  String relativeDays(int count) {
    return 'há $count d';
  }

  @override
  String get libraryTitle => 'Biblioteca';

  @override
  String get librarySubtitle =>
      'Tudo o que a Action guarda para si. E tudo isso fica neste dispositivo.';

  @override
  String get librarySegmentActions => 'Tarefas';

  @override
  String get librarySegmentCaptures => 'Capturas';

  @override
  String get librarySegmentGoals => 'Objetivos';

  @override
  String get librarySegmentDone => 'Feitas';

  @override
  String get libraryNewGoal => 'Novo objetivo';

  @override
  String get libraryNoGoalsTitle => 'Ainda sem objetivos';

  @override
  String get libraryNoGoalsMessage =>
      'Um objetivo é algo que quer que aconteça. A Action consegue encontrar o que falta, o que o bloqueia e por onde começar.';

  @override
  String get libraryNoDoneTitle => 'Ainda nada concluído';

  @override
  String get libraryNoDoneMessage =>
      'As tarefas que terminar ficam guardadas aqui.';

  @override
  String get libraryNoOpenTitle => 'Sem tarefas em aberto';

  @override
  String get libraryNoOpenMessage =>
      'Capture algo e a Action perceberá o que é preciso fazer.';

  @override
  String get libraryNoCapturesTitle => 'Ainda nada capturado';

  @override
  String get libraryNoCapturesMessage =>
      'As fotos, capturas de ecrã e textos que adicionar chegam primeiro aqui. Nada é analisado até que o peça.';

  @override
  String get libraryGoalNoActions => 'Ainda não saiu nada daqui';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tarefas deste objetivo',
      one: '1 tarefa deste objetivo',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Procurar em tarefas e capturas';

  @override
  String get searchClear => 'Limpar';

  @override
  String get searchPrivacyNote =>
      'A procura é feita neste dispositivo. Nada do que escrever aqui sai dele.';

  @override
  String get searchYouCanSearch => 'PODE PROCURAR';

  @override
  String get searchFieldTitles => 'Títulos';

  @override
  String get searchFieldTitlesExample => 'Renovar o seguro do carro';

  @override
  String get searchFieldReferences => 'Números de referência';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Entidades';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Passos dentro de uma tarefa';

  @override
  String get searchFieldStepsExample => 'Carregar o formulário';

  @override
  String get searchFieldCaptureText => 'O texto lido de uma captura';

  @override
  String get searchFieldCaptureTextExample => 'aviso de renovação';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Sem resultados para «$query»';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Tente menos palavras, ou um número de referência exatamente como aparece.';

  @override
  String get searchNoMatchesClearFilters =>
      'Tente menos palavras, ou limpe os filtros.';

  @override
  String get searchFilterActive => 'Em aberto';

  @override
  String get searchFilterCompleted => 'Concluídas';

  @override
  String get searchFilterOverdue => 'Atrasadas';

  @override
  String get searchFilterThisWeek => 'Esta semana';

  @override
  String get searchFilterCritical => 'Críticas';

  @override
  String get searchFilterCreatedByYou => 'Criadas por si';

  @override
  String get searchFilterArchived => 'Arquivadas';

  @override
  String get searchFilterClear => 'Limpar filtros';

  @override
  String get searchIncompleteActions =>
      'Não foi possível procurar nas suas tarefas, por isso estes resultados podem estar incompletos.';

  @override
  String get searchIncompleteCaptures =>
      'Não foi possível procurar nas suas capturas, por isso estes resultados podem estar incompletos.';

  @override
  String get searchIncompleteBoth =>
      'Não foi possível procurar nas suas tarefas nem nas suas capturas, por isso estes resultados podem estar incompletos.';

  @override
  String get searchMatchTitle => 'Título';

  @override
  String get searchMatchNextStep => 'Próximo passo';

  @override
  String get searchMatchStep => 'Passo';

  @override
  String get searchMatchSummary => 'Resumo';

  @override
  String get searchMatchFromCapture => 'De uma captura';

  @override
  String get studioSuggested => 'Sugerido para a sua última captura';

  @override
  String get studioRecentlyUsed => 'Usado recentemente';

  @override
  String get studioReady => 'PRONTO';

  @override
  String get studioNotConnected => 'SEM LIGAÇÃO';

  @override
  String get studioHeroTitle => 'Inteligência da Action';

  @override
  String get studioConnectedBlurb =>
      'Perceber um documento, afinar um objetivo, montar um plano, redigir uma resposta ou verificar o que tem à frente.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count ferramentas para perceber documentos, planear e escrever. Ligue a sua própria conta de IA para as usar — quem cobra é o seu fornecedor, nunca a Action.';
  }

  @override
  String get studioConnectAi => 'Ligar IA';

  @override
  String get studioHowItWorks => 'Como funciona';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count delas já funcionam sem nada disso, inteiramente neste dispositivo.',
      one:
          '1 delas já funciona sem nada disso, inteiramente neste dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Corre neste dispositivo';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Corre neste dispositivo.';
  }

  @override
  String get categoryUnderstand => 'Perceber';

  @override
  String get categoryUnderstandBlurb => 'Dar sentido ao que tem.';

  @override
  String get categoryPlan => 'Planear';

  @override
  String get categoryPlanBlurb => 'Transformá-lo em algo que consegue fazer.';

  @override
  String get categoryCreate => 'Escrever';

  @override
  String get categoryCreateBlurb => 'Escrever, melhorar, traduzir.';

  @override
  String get categoryExtract => 'Extrair';

  @override
  String get categoryExtractBlurb => 'Retirar os detalhes que interessam.';

  @override
  String get categoryVerify => 'Verificar';

  @override
  String get categoryVerifyBlurb => 'Verificar o que tem à frente.';

  @override
  String get captureSheetTitle => 'Capturar algo';

  @override
  String get captureSheetSubtitle =>
      'Entregue à Action tudo o que preferia não ler de fio a pavio.';

  @override
  String get captureTakePhoto => 'Tirar uma foto';

  @override
  String get captureTakePhotoSubtitle =>
      'Uma carta, fatura ou aviso à sua frente';

  @override
  String get captureChooseImage => 'Escolher uma imagem';

  @override
  String get captureChooseImageSubtitle =>
      'Uma captura de ecrã ou foto que já está neste dispositivo';

  @override
  String get capturePasteText => 'Colar texto';

  @override
  String get capturePasteTextSubtitle => 'Um e-mail, mensagem ou aviso';

  @override
  String get captureChoosePdf => 'Escolher um PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'Um extrato, carta ou formulário que já tem';

  @override
  String get captureFootnote =>
      'As capturas ficam neste dispositivo. Nada é analisado online até que o peça.';

  @override
  String get captureCouldNotOpen =>
      'Não foi possível abrir isso. Tente de outra forma.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'A ler';

  @override
  String get stageNeedsReview => 'Precisa de revisão';

  @override
  String get stageActionCreated => 'Tarefa criada';

  @override
  String get stageNoText => 'Nenhum texto encontrado';

  @override
  String get stageCouldNotBeRead => 'Não foi possível ler';

  @override
  String get stageReadingPreview => 'A ler o texto…';

  @override
  String get stageFailedPreview =>
      'Não foi possível ler isto neste dispositivo.';

  @override
  String get provenancePhoto => 'Capturado de uma foto';

  @override
  String get provenanceImage => 'Capturado de uma imagem';

  @override
  String get provenancePastedText => 'Capturado de texto colado';

  @override
  String get provenanceDocument => 'Adicionado como documento';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Feita $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Atrasada · vencia a $date';
  }

  @override
  String get metaDueToday => 'Vence hoje';

  @override
  String metaDueOn(String date) {
    return 'Vence a $date';
  }

  @override
  String get metaCreatedByYou => 'Criada por si';

  @override
  String get categoryPayment => 'Pagamento';

  @override
  String get categoryRenewal => 'Renovação';

  @override
  String get categoryAppointment => 'Marcação';

  @override
  String get categoryBooking => 'Reserva';

  @override
  String get categoryTravel => 'Viagem';

  @override
  String get categoryDeadline => 'Prazo';

  @override
  String get categoryResponse => 'Precisa de resposta';

  @override
  String get categoryDelivery => 'Entrega';

  @override
  String get categoryDocument => 'Documento';

  @override
  String get categoryNoActionRequired => 'Nada a fazer';

  @override
  String get categoryUnsure => 'Não é claro';

  @override
  String get errorEnterManually => 'Introduzir à mão';
}
