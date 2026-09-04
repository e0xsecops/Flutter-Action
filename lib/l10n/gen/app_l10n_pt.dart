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
  String get ocrScriptTitle => 'Reconhecimento de texto';

  @override
  String get ocrScriptSubtitle =>
      'O sistema de escrita que a Action lê quando olha para uma foto. O reconhecimento acontece neste dispositivo; nenhuma captura é enviada para lado nenhum para ser lida.';

  @override
  String get ocrScriptSectionChoose => 'Sistema de escrita';

  @override
  String get ocrScriptFollowLanguage => 'Seguir o idioma da app';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'De momento $script';
  }

  @override
  String get ocrScriptLatin => 'Latino';

  @override
  String get ocrScriptChinese => 'Chinês';

  @override
  String get ocrScriptDevanagari => 'Devanágari';

  @override
  String get ocrScriptJapanese => 'Japonês';

  @override
  String get ocrScriptKorean => 'Coreano';

  @override
  String get ocrScriptLatinDescription =>
      'Inglês, espanhol, francês, alemão e as restantes línguas escritas em letras latinas.';

  @override
  String get ocrScriptChineseDescription =>
      'Chinês simplificado e tradicional.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Hindi, marati e nepalês. Não bengali, tâmil nem telugu — cada um destes é um sistema de escrita diferente.';

  @override
  String get ocrScriptJapaneseDescription => 'Japonês.';

  @override
  String get ocrScriptKoreanDescription => 'Coreano.';

  @override
  String get ocrScriptFootnote =>
      'Todas as opções menos a latina leem também letras latinas, por isso escolher uma acrescenta um sistema de escrita em vez de o trocar. A alteração vale para as fotos tiradas de agora em diante, não para as já lidas.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'A Action não consegue ler a escrita $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'Não existe um reconhecedor no dispositivo para ela. As fotos continuarão a ser lidas em tudo o que esteja escrito em letras latinas, e o resto virá vazio. Pode escrever ou colar esse texto em alternativa.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'A Action está definida para ler $script. Se esta foto estiver noutro sistema de escrita, altere-o nas Definições e leia-a de novo.';
  }

  @override
  String get settingsTextRecognition => 'Reconhecimento de texto';

  @override
  String get settingsTextRecognitionDescription =>
      'O sistema de escrita que a Action lê nas fotos.';

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

  @override
  String get sourceWhatWeRead => 'O que lemos';

  @override
  String get sourceDelete => 'Eliminar captura';

  @override
  String get sourceGone => 'Essa captura já não está disponível.';

  @override
  String get sourceDeleteTitle => 'Eliminar esta captura?';

  @override
  String get sourceDeleteBody =>
      'A imagem e o texto lido dela são removidos deste dispositivo.';

  @override
  String get sourceDeleteKeep => 'Manter';

  @override
  String get sourceOpenAction => 'Abrir a tarefa';

  @override
  String sourceOpenActions(int count) {
    return 'Abrir $count tarefas';
  }

  @override
  String get sourceCreateAnother => 'Criar outra a partir disto';

  @override
  String get sourceCreateAction => 'Criar uma tarefa a partir disto';

  @override
  String get sourceDoMore => 'Fazer mais com isto';

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
    return 'de $format $size KB';
  }

  @override
  String get sourceTextFound => 'Texto encontrado';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines linhas · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Este é o texto que a Action leu. O que se fez a partir dele está abaixo.';

  @override
  String get sourceNotInterpreted =>
      'Ainda não foi interpretado nada. A Action vai sugerir o que fazer com isto, e é você que confirma antes de algo ser criado.';

  @override
  String get sourceNoTextExplainer =>
      'Isto acontece com letra manuscrita, com muito pouca luz, ou com uma escrita que este dispositivo ainda não sabe ler.';

  @override
  String get sourceReadFailed => 'Não foi possível ler isto';

  @override
  String get sourceReadFailedReason =>
      'O reconhecimento de texto não chegou ao fim.';

  @override
  String get sourceTryReadingAgain => 'Tentar ler de novo';

  @override
  String get sourceTypeInstead => 'Escrever os dados em vez disso';

  @override
  String get sourceTypeWhatItSays => 'Escreva o que diz';

  @override
  String get sourceTypeHint => 'Datas, valores e o que está a ser pedido.';

  @override
  String get sourceMadeFromThis => 'Feito a partir desta captura';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count feitos a partir desta captura';
  }

  @override
  String get sourceTheDocument => 'O documento';

  @override
  String sourcePageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String get sourcePageCountUnknown => 'Número de páginas desconhecido';

  @override
  String get sourceDocumentNotRead =>
      'A Action não leu o que está dentro deste documento. Quando usar uma ferramenta que precise disso, o ficheiro vai para o fornecedor de IA que ligou, e será avisado antes de isso acontecer.';

  @override
  String get previewSaveFailed => 'Não foi possível guardar. Tente de novo.';

  @override
  String get previewTitle => 'Verifique a captura';

  @override
  String get previewImageFailed => 'Não foi possível abrir essa imagem.';

  @override
  String get previewHint =>
      'Confirme que o texto está legível e que nada de importante ficou cortado.';

  @override
  String get previewRetake => 'Repetir a foto';

  @override
  String get pasteTitle => 'Colar texto';

  @override
  String get pasteHint =>
      'Cole o email, a mensagem ou o aviso que preferia não ler de fio a pavio.';

  @override
  String get pasteFootnote =>
      'Qualquer coisa com uma data, um valor ou um pedido funciona bem.';

  @override
  String get pasteEnough => 'Parece que chega para trabalhar.';

  @override
  String get pasteMore => 'Um pouco mais de texto dará um resultado melhor.';

  @override
  String get reviewLoadFailed => 'Não foi possível carregar esta captura.';

  @override
  String get reviewConfirmed => 'Confirmado';

  @override
  String get reviewNeedsReview => 'Precisa de revisão';

  @override
  String get reviewReview => 'Rever';

  @override
  String get reviewHighConfidence => 'Confiança alta';

  @override
  String get reviewConfirmedByYou => 'Confirmado por si';

  @override
  String get reviewMissing => 'Em falta';

  @override
  String get reviewNotUnderstood =>
      'A Action não conseguiu perceber com fiabilidade o suficiente desta fonte.';

  @override
  String get reviewNotUnderstoodBody =>
      'A captura está intacta e nada se perdeu. Pode introduzir os dados você mesmo, e a fonte fica anexada como referência.';

  @override
  String get reviewEnterDetails => 'Introduzir os dados';

  @override
  String get reviewKeepSource => 'Manter a fonte para depois';

  @override
  String reviewEngine(String engine) {
    return 'Motor: $engine';
  }

  @override
  String get reviewManualNotice =>
      'É você que está a criar esta tarefa. Só será usado o que escrever aqui.';

  @override
  String get reviewUntitled => 'Tarefa sem título';

  @override
  String get reviewEditTitle => 'Editar o título';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valores precisam da sua revisão.',
      one: '1 valor precisa da sua revisão antes de isto poder ser confirmado.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Dados principais';

  @override
  String get reviewNotFound => 'Não encontrado';

  @override
  String get reviewSuggestedNextStep => 'Passo seguinte sugerido';

  @override
  String get reviewWhyThisMatters => 'Porque é que isto importa';

  @override
  String get reviewSteps => 'Passos';

  @override
  String get reviewAddStep => 'Adicionar um passo';

  @override
  String get reviewInjectionNotice =>
      'Parte do texto nesta fonte parecia instruções em vez de dados do documento, por isso a Action ignorou-o.';

  @override
  String get reviewLayoutNotice =>
      'A disposição deste documento pode conter relações que a extração de texto não conseguiu preservar por completo. Compare os valores abaixo com a fonte antes de confirmar.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Compare os valores abaixo com a fonte.';
  }

  @override
  String get reviewDeadline => 'Prazo';

  @override
  String get reviewAmount => 'Valor';

  @override
  String get reviewLeftUnset => 'Nenhum — escolheu deixar isto por definir';

  @override
  String get reviewUnclear => 'Pouco claro';

  @override
  String get reviewNotSet => 'Por definir';

  @override
  String get reviewNoDeadlineFound => 'Nenhum encontrado neste documento';

  @override
  String get reviewNoAmountFound => 'Nenhum valor encontrado neste documento';

  @override
  String get reviewMultipleDates =>
      'A Action encontrou várias datas possíveis.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count datas podiam ser o prazo. Escolha a certa, escreva outra, ou deixe por definir.';
  }

  @override
  String get reviewChooseDate => 'Escolher uma data';

  @override
  String get reviewMultipleAmounts =>
      'A Action encontrou mais do que um valor possível.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count valores podiam ser aquele de que se trata aqui. Escolha um, escreva outro, ou deixe por definir.';
  }

  @override
  String get reviewChooseAmount => 'Escolher um valor';

  @override
  String get reviewSkipStep => 'Saltar este passo';

  @override
  String get reviewKeepStep => 'Manter este passo';

  @override
  String get reviewEditStep => 'Editar o passo';

  @override
  String get reviewCreateManually => 'Criar à mão';

  @override
  String get reviewConfirmAndCreate => 'Confirmar e criar a tarefa';

  @override
  String get reviewFixHighlighted => 'Rever os campos assinalados';

  @override
  String get reviewSaving => 'A guardar…';

  @override
  String get reviewSaveFailed =>
      'Não foi possível guardar esta tarefa. Nada se perdeu — tente de novo.';

  @override
  String get reviewFieldTitle => 'Título';

  @override
  String get reviewTitleHint => 'O que precisa de acontecer?';

  @override
  String get reviewNewStep => 'Passo novo';

  @override
  String get reviewStepHint => 'O que fazer';

  @override
  String get reviewDatesConflict =>
      'O documento menciona mais do que uma data.';

  @override
  String get reviewAmountsConflict =>
      'O documento menciona mais do que um valor.';

  @override
  String get reviewAnotherDate => 'Outra data — 2026-08-30';

  @override
  String get reviewBadDate => 'Não é uma data real. Use o formato 2026-08-30.';

  @override
  String get reviewTypeDate => 'Escreva uma data, ou deixe por definir abaixo.';

  @override
  String get reviewUseThisDate => 'Usar esta data';

  @override
  String get reviewLeaveNoDeadline => 'Continuar sem prazo';

  @override
  String get reviewAnotherAmount => 'Outro valor — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'Não é possível usar este valor: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Usar este valor';

  @override
  String get reviewLeaveNoAmount => 'Continuar sem valor';

  @override
  String get reviewThisValue => 'Este valor';

  @override
  String reviewQuote(String quote) {
    return '«$quote»';
  }

  @override
  String get reviewSeeOnCapture => 'Ver na captura';

  @override
  String get reviewViewSource => 'Ver a fonte';

  @override
  String get reviewFromSource => 'Da fonte';

  @override
  String get reviewNotVerified => 'Não conferido';

  @override
  String get reviewCouldNotVerify =>
      'Não foi possível conferir isto com a fonte.';

  @override
  String get reviewLooksRight => 'Parece certo';

  @override
  String get reviewStageReading => 'A ler a fonte';

  @override
  String get reviewStageUnderstanding => 'A perceber os dados importantes';

  @override
  String get reviewStageChecking => 'A conferir o que precisa de revisão';

  @override
  String get reviewNothingToDo => 'Neste momento não precisa de fazer nada.';

  @override
  String get reviewInformationOnly =>
      'Isto parece ser só informação — não foi encontrado prazo, pagamento nem resposta.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Isto parece ser só informação — nesta captura não foi encontrado prazo, pagamento nem resposta.';

  @override
  String get reviewSourceKept => 'A fonte fica guardada de qualquer forma.';

  @override
  String get reviewAddAnyway => 'Adicionar uma tarefa mesmo assim';

  @override
  String get reviewActionConfirmed => 'Tarefa confirmada';

  @override
  String get reviewCreatedByYou => 'Criada por si.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Confirmada por si a partir de $count dados revistos.',
      one: 'Confirmada por si a partir de 1 dado revisto.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Confirmada por si a partir de $count dados revistos. Alterou $edited deles.',
      one:
          'Confirmada por si a partir de 1 dado revisto. Alterou $edited deles.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Guardada neste dispositivo.';

  @override
  String get detailLoadFailed =>
      'Não foi possível carregar esta tarefa. Continua guardada neste dispositivo.';

  @override
  String get detailNotFoundTitle => 'Essa tarefa já não está aqui';

  @override
  String get detailNotFoundMessage =>
      'Pode ter sido eliminada neste dispositivo.';

  @override
  String get detailGoBack => 'Voltar';

  @override
  String get detailMore => 'Mais';

  @override
  String get detailChangeUrgency => 'Mudar a urgência';

  @override
  String get detailAddRecommendedStep => 'Adicionar um passo recomendado';

  @override
  String get detailEditRecommendedStep => 'Editar o passo recomendado';

  @override
  String get detailArchiveTitle => 'Arquivar esta tarefa?';

  @override
  String get detailArchiveBody =>
      'Sai da sua lista mas não é eliminada, e a captura de onde veio fica guardada.';

  @override
  String get detailArchiveConfirm => 'Arquivar';

  @override
  String get detailArchived => 'Arquivada';

  @override
  String detailCompletedOn(String date) {
    return 'Concluída a $date';
  }

  @override
  String get detailSectionDetails => 'Detalhes';

  @override
  String get detailSectionReminders => 'Lembretes';

  @override
  String get detailAllStepsDone => 'Todos os passos feitos';

  @override
  String get detailNextEyebrow => 'A seguir';

  @override
  String get detailCompleteQuestion => 'Concluir esta tarefa?';

  @override
  String get detailMarkStepDone => 'Marcar o passo como feito';

  @override
  String get detailCompleteAction => 'Concluir esta tarefa';

  @override
  String get detailAddDeadline => 'Adicionar um prazo';

  @override
  String get detailAddAmount => 'Adicionar um valor';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed de $total feitos';
  }

  @override
  String get detailNoStepsTitle => 'Ainda sem passos';

  @override
  String get detailNoStepsMessage =>
      'Divida isto nos movimentos que tem mesmo de fazer.';

  @override
  String get detailAddFirstStep => 'Adicionar o primeiro passo';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Passo concluído: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Passo seguinte: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Passo: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Marcar «$title» como feito';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Marcar «$title» como não feito';
  }

  @override
  String get detailStepOptions => 'Opções do passo';

  @override
  String get detailMoveUp => 'Subir';

  @override
  String get detailMoveDown => 'Descer';

  @override
  String get detailDeleteStep => 'Eliminar o passo';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => 'Eliminar este passo?';

  @override
  String get stepDeleteKeep => 'Manter';

  @override
  String get detailNoRemindersYet => 'Ainda sem lembretes.';

  @override
  String get detailReminderLimit =>
      'É o máximo de lembretes que uma tarefa pode ter. Retire um para adicionar outro.';

  @override
  String get detailAddReminder => 'Adicionar lembrete';

  @override
  String get detailChangeReminder => 'Mudar o lembrete';

  @override
  String get detailRemoveReminder => 'Retirar o lembrete';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Ainda não configurado';

  @override
  String get reminderStateNotificationsOff =>
      'Guardado, mas as notificações estão desligadas';

  @override
  String get reminderStateFailed => 'Não foi possível agendar';

  @override
  String get reminderStateRemoving => 'A retirar…';

  @override
  String get reminderSetConfirmation => 'Lembrete criado. Damos-lhe um toque.';

  @override
  String get reminderUpdatedConfirmation => 'Lembrete atualizado.';

  @override
  String get reminderNeedsPermission =>
      'As notificações estão desligadas, por isso este lembrete fica guardado mas ainda não o pode avisar.';

  @override
  String get reminderScheduleFailed =>
      'Este lembrete está guardado, mas o Android não quis agendá-lo.';

  @override
  String get reminderLimitReached =>
      'Essa tarefa já tem o número máximo de lembretes.';

  @override
  String get reminderTimeInPast => 'Essa hora já passou.';

  @override
  String get reminderAddTitle => 'Adicionar um lembrete';

  @override
  String get reminderChangeTitle => 'Mudar este lembrete';

  @override
  String get reminderDateLabel => 'Data';

  @override
  String get reminderTimeLabel => 'Hora';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'EEEE, d \'de\' MMMM';

  @override
  String get reminderPresetFormat => 'd MMM, HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'Será lembrado a $date às $time.';
  }

  @override
  String get reminderTimePastError =>
      'Essa hora já passou. Escolha uma mais tarde.';

  @override
  String get reminderSet => 'Criar lembrete';

  @override
  String get reminderPresetInHour => 'Daqui a 1 hora';

  @override
  String get reminderPresetTomorrowMorning => 'Amanhã de manhã';

  @override
  String get reminderPresetNextWeek => 'Para a semana';

  @override
  String get reminderPresetOnTheDay => 'No próprio dia';

  @override
  String get reminderPresetDayBefore => '1 dia antes';

  @override
  String get reminderPresetWeekBefore => '1 semana antes';

  @override
  String get reminderPresetAtDeadline => 'No prazo';

  @override
  String get reminderPresetHourBefore => '1 hora antes';

  @override
  String get editNextStepTitle => 'Passo seguinte recomendado';

  @override
  String get editNextStepSubtitle =>
      'Uma frase curta sobre o próximo movimento útil.';

  @override
  String get editNextStepHint => 'Qual é o próximo movimento útil?';

  @override
  String get editRemoveSuggestion => 'Retirar a sugestão';

  @override
  String get editUrgencyTitle => 'Que urgência tem isto?';

  @override
  String get editStepHint => 'Uma coisa concreta a fazer';

  @override
  String get editAddStep => 'Adicionar passo';

  @override
  String get editDateHint => 'AAAA-MM-DD';

  @override
  String get editRemoveDeadline => 'Retirar o prazo';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Guardar o valor';

  @override
  String get editRemoveAmount => 'Retirar o valor';

  @override
  String get securityTitle => 'Segurança e privacidade';

  @override
  String get securitySectionProtection => 'Proteção';

  @override
  String get securityAppLockUnavailable =>
      'O bloqueio da app precisa de um bloqueio de ecrã neste dispositivo. Configure primeiro um PIN, um padrão, uma palavra-passe ou uma impressão digital nas definições do dispositivo.';

  @override
  String get securityAppLockOn =>
      'A Action pede ao seu dispositivo que confirme que é você.';

  @override
  String get securityAppLockOff =>
      'Exigir a sua impressão digital, o rosto ou o PIN do dispositivo para abrir a Action.';

  @override
  String get securityAskAgain => 'Perguntar de novo';

  @override
  String get securityAskAgainDescription =>
      'Quanto tempo a Action pode estar em segundo plano antes de bloquear.';

  @override
  String get securityScreenPrivacy => 'Privacidade do ecrã';

  @override
  String get securityScreenPrivacyDescription =>
      'Pedir ao Android que bloqueie capturas e gravação de ecrã, e que esconda a Action no seletor de apps.';

  @override
  String get securityPrivateReminders => 'Lembretes privados';

  @override
  String get securityPrivateRemindersOn =>
      'Os lembretes dizem apenas que algo precisa de si.';

  @override
  String get securityPrivateRemindersOff =>
      'Os lembretes mostram o título da tarefa. Ligue isto para o manter fora do ecrã bloqueado.';

  @override
  String get securityLockNow => 'Bloquear agora';

  @override
  String get securityLockNowDescription => 'Fechar a porta sem esperar.';

  @override
  String get securitySectionStorage => 'Como os seus dados são guardados';

  @override
  String get securityStorageDataLabel =>
      'As suas tarefas, capturas e definições';

  @override
  String get securityStorageDataDetail =>
      'Ficam no armazenamento privado desta app, que outras apps não conseguem ler e que o Android cifra como parte da cifragem do dispositivo. A Action não acrescenta uma segunda camada própria por cima.';

  @override
  String get securityStorageKeyLabel => 'A sua chave do fornecedor de IA';

  @override
  String get securityStorageKeyDetail =>
      'Guardada no Keystore do Android em vez de junto com o resto, e nunca mais mostrada depois de a guardar.';

  @override
  String get securityStorageGapLabel => 'O que isso não cobre';

  @override
  String get securityStorageGapDetail =>
      'Nada disto defende contra alguém que use o seu dispositivo desbloqueado, e um sistema modificado ou com root consegue ler mais do que um normal. O bloqueio da app é o controlo que ajuda com o primeiro caso.';

  @override
  String get securitySectionInformation => 'A sua informação';

  @override
  String get securityWhereInfoDescription =>
      'Todos os caminhos que os seus dados podem tomar, e os dois que saem deste dispositivo.';

  @override
  String get securityAppLockRefused =>
      'Não foi confirmado, por isso nada mudou.';

  @override
  String get securityAppLockUnavailableToast =>
      'Este dispositivo não tem bloqueio de ecrã configurado. Adicione um PIN, um padrão, uma palavra-passe ou uma impressão digital nas definições do dispositivo e tente de novo.';

  @override
  String get securityScreenPrivacyRefused =>
      'Este dispositivo não quis aplicar a privacidade do ecrã, por isso ficou desligada em vez de ser mostrada como ligada.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lembretes agendados passam a dizer menos.',
      one: '1 lembrete agendado passa a dizer menos.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lembretes agendados atualizados.',
      one: '1 lembrete agendado atualizado.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Imediatamente';

  @override
  String get appLockDelayOneMinute => 'Ao fim de 1 minuto';

  @override
  String get appLockDelayFiveMinutes => 'Ao fim de 5 minutos';

  @override
  String get securityDelayImmediatelyDescription =>
      'Sempre que a Action sai do ecrã';

  @override
  String get securityDelayOneMinuteDescription =>
      'O suficiente para responder a uma mensagem';

  @override
  String get securityDelayFiveMinutesDescription =>
      'O suficiente para atender uma chamada';

  @override
  String get securityHeroProtected => 'Protegido';

  @override
  String get securityHeroNothingOn => 'Nada ligado';

  @override
  String get securityHeroFootnote =>
      'Tudo aqui funciona neste dispositivo. Nenhuma destas definições é enviada para lado nenhum, e nenhuma pode ser mudada à distância.';

  @override
  String get securityHeadlineNone => 'Há três proteções disponíveis';

  @override
  String securityHeadlineOne(String first) {
    return '$first está ligada';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first e $second estão ligadas';
  }

  @override
  String get securityHeadlineAll => 'As três proteções estão ligadas';

  @override
  String get securityTransfersTitle => 'O que saiu deste dispositivo';

  @override
  String get securityTransfersNoProvider =>
      'Não há nenhum fornecedor de IA ligado, por isso não está a ser enviado nada para análise.';

  @override
  String get securityTransfersDescription =>
      'Registado aqui no momento em que algo é enviado, tenha voltado resposta ou não. Só a ferramenta, o fornecedor e o tamanho — nunca o que ia lá dentro. Guardado 90 dias neste dispositivo e enviado para lado nenhum.';

  @override
  String get securityClear => 'Limpar';

  @override
  String get securityNothingSent => 'Não foi enviado nada';

  @override
  String get securityNothingSentDescription =>
      'Quando usar uma ferramenta que recorra ao seu fornecedor de IA, aparecerá aqui.';

  @override
  String get securityClearHistoryTitle => 'Limpar este histórico?';

  @override
  String get securityClearHistoryBody =>
      'O registo do que foi enviado será eliminado deste dispositivo. Não desfaz nada do que já foi enviado.';

  @override
  String get securityUnnamedTool => 'Uma ferramenta Intelligence';

  @override
  String get securityYourProvider => 'o seu fornecedor de IA';

  @override
  String securityTransferPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String securityTransferFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ficheiros',
      one: '1 ficheiro',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'um texto curto';

  @override
  String securityTransferCharacters(int count) {
    return '$count mil caracteres';
  }

  @override
  String securitySentTo(String provider) {
    return 'Enviado para $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Enviado para $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return 'há $count sem.';
  }

  @override
  String get helpTitle => 'Ajuda';

  @override
  String get helpAddQuestion => 'O que posso adicionar?';

  @override
  String get helpAddAnswer =>
      'Uma captura de ecrã, uma foto de uma carta ou de uma fatura, ou texto que cole. Resulta melhor tudo o que tenha uma data, um valor ou um pedido.';

  @override
  String get helpReviewQuestion => 'Porque é que a Action me pede para rever?';

  @override
  String get helpReviewAnswer =>
      'Porque uma máquina que lê um documento pode lê-lo mal, e um prazo calado e errado é pior do que prazo nenhum. A Action mostra o que encontrou e as palavras de onde veio, e não se guarda nada até que o confirme.';

  @override
  String get helpVaryQuestion =>
      'Porque é que os resultados mudam se tentar de novo?';

  @override
  String get helpVaryAnswer =>
      'O serviço que lê o seu documento não é determinístico, por isso a mesma captura pode voltar ligeiramente diferente. É também por isso que existe o passo de revisão — você é a parte que não muda.';

  @override
  String get helpLateQuestion => 'Porque é que o meu lembrete chegou tarde?';

  @override
  String get helpLateAnswer =>
      'Os lembretes são agendados no Android, e é o Android que decide exatamente quando os entrega. A poupança de bateria, o Doze e as definições de energia do fabricante podem atrasar qualquer um. A Action nunca promete um lembrete ao minuto.';

  @override
  String get helpDataQuestion => 'Onde estão os meus dados?';

  @override
  String get helpDataAnswer =>
      'Quase tudo está neste dispositivo: as suas capturas, tarefas, passos, lembretes e pesquisas. Duas exceções — o conteúdo que pede à Action para ler é enviado ao serviço de IA que o lê, e um registo curto de uma tarefa confirmada pode ser guardado na nuvem sob um identificador anónimo. Privacidade e dados, nas Definições, lista exatamente o que esse registo contém.';

  @override
  String get helpBackupQuestion => 'Isto é uma cópia de segurança?';

  @override
  String get helpBackupAnswer =>
      'Não. O registo na nuvem não pode ser reposto num dispositivo novo, e não há nenhuma conta para iniciar sessão. Se desinstalar a Action ou perder este dispositivo, os dados que lá estavam desaparecem.';

  @override
  String get helpCorrectQuestion => 'Como corrijo uma tarefa?';

  @override
  String get helpCorrectAnswer =>
      'Abra-a e edite qualquer campo — o título, o prazo, o valor ou o passo seguinte sugerido. Pode adicionar, reordenar, concluir e eliminar passos a qualquer momento. Editar uma tarefa nunca pergunta nada ao serviço de IA.';

  @override
  String get privacyTitle => 'Privacidade e dados';

  @override
  String get privacyIntro =>
      'A Action mantém neste dispositivo tudo o que consegue. Duas coisas são exceções, e ambas estão listadas abaixo.';

  @override
  String get privacyGroupOnDevice => 'Neste dispositivo';

  @override
  String get privacyOnDeviceCaptures =>
      'Capturas — as capturas de ecrã, fotos e textos que adiciona, e o texto lido a partir deles.';

  @override
  String get privacyOnDeviceActions =>
      'Tarefas, com os seus passos, dados e lembretes.';

  @override
  String get privacyOnDeviceSearch =>
      'Pesquisa. As suas pesquisas correm aqui, nunca são enviadas para lado nenhum, e não ficam guardadas depois de fechar o ecrã.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'As fotos são guardadas sem a sua localização. As coordenadas, a hora e os dados da câmara que um telemóvel escreve dentro de uma imagem são removidos antes de a captura ser guardada, por isso não ficam aqui nem vão incluídos quando envia uma captura ao seu fornecedor de IA.';

  @override
  String get privacyGroupSentToRead => 'Enviado para ser lido';

  @override
  String get privacySentToReadWhat =>
      'Quando pede à Action que interprete uma captura, esse conteúdo é enviado ao serviço de IA que o lê. Isto não é IA no dispositivo.';

  @override
  String get privacySentToReadWhen =>
      'É enviada apenas a captura que escolheu, e apenas quando o pede.';

  @override
  String get privacyGroupYourProvider =>
      'Enviado para o seu próprio fornecedor de IA';

  @override
  String get privacyProviderWhat =>
      'Se ligar um fornecedor de IA nas Definições, as ferramentas Intelligence enviam o conteúdo que selecionar para esse fornecedor — OpenAI, Anthropic, Google ou um endpoint que escolheu — usando a sua própria chave API.';

  @override
  String get privacyProviderDirect =>
      'Vai diretamente para eles. Não passa por nenhum servidor pertencente à Action.';

  @override
  String get privacyProviderScope =>
      'Só é enviado o que escolhe para uma ferramenta, e só quando a executa. As suas outras tarefas, capturas e fontes nunca são incluídas, e nunca é enviado nada em segundo plano.';

  @override
  String get privacyProviderKey =>
      'A sua chave API é guardada no armazenamento seguro deste dispositivo e é enviada apenas ao fornecedor a que pertence. O armazenamento seguro é um obstáculo real para quem tenha o seu dispositivo desbloqueado, mas não é absoluto, e a Action não dirá o contrário.';

  @override
  String get privacyProviderLocalTools =>
      'Duas ferramentas nunca enviam nada: esconder dados sensíveis e verificar de onde veio um ficheiro. Ambas funcionam inteiramente neste dispositivo.';

  @override
  String get privacyProviderAgreement =>
      'O que o seu fornecedor faz com o que envia rege-se pelo seu acordo com ele, não pela Action.';

  @override
  String get privacyGroupCloud => 'Guardado na nuvem';

  @override
  String get privacyCloudWhat =>
      'Quando confirma uma tarefa, pode ser guardado um registo curto sob um identificador anónimo desta instalação: o título, o estado, a urgência, a categoria, o prazo, o valor, o passo seguinte sugerido e as marcas temporais.';

  @override
  String get privacyCloudNotSent =>
      'As suas capturas, o texto lido a partir delas, os passos e dados de uma tarefa, e os seus lembretes não são enviados.';

  @override
  String get privacyCloudNotBackup =>
      'Isto não é uma cópia de segurança. Não há forma de o repor num dispositivo novo, e perder esta instalação leva com ela o identificador anónimo.';

  @override
  String get privacyGroupDiagnostics => 'Diagnóstico';

  @override
  String get privacyDiagnosticsWhat =>
      'A Action regista contagens anónimas do que acontece na app — que uma captura começou, que uma extração resultou ou não, que uma pesquisa não encontrou nada, que uma tarefa foi concluída.';

  @override
  String get privacyDiagnosticsCounts =>
      'São contagens, não conteúdos. Nunca vai incluído nenhum título, valor, prazo, referência, texto capturado ou termo de pesquisa, e também não o identificador anónimo nem qualquer identificador de uma tarefa ou captura.';

  @override
  String get privacyDiagnosticsCrash =>
      'Se a app rebentar, o erro e o sítio onde aconteceu são comunicados para poder ser corrigido. A Action não anexa os seus dados a esses relatórios.';

  @override
  String get privacySectionYourData => 'Os seus dados';

  @override
  String get privacyYourDataFootnote =>
      'Limpar as capturas deixa as suas tarefas onde estão. Uma tarefa cuja captura desapareceu continua a funcionar; simplesmente já não mostra de onde veio.';

  @override
  String get privacyClearCaptures => 'Limpar capturas';

  @override
  String get privacyClearCapturesDescription =>
      'Elimina todas as capturas e o respetivo ficheiro de imagem.';

  @override
  String get privacyDeleteAll => 'Eliminar todos os meus dados';

  @override
  String get privacyDeleteAllDescription =>
      'Tarefas, passos, lembretes, capturas e os registos na nuvem acima.';

  @override
  String get privacyClearCapturesTitle => 'Limpar as capturas?';

  @override
  String get privacyClearCapturesBody =>
      'Todas as capturas e as suas imagens serão eliminadas deste dispositivo. As suas tarefas ficam exatamente como estão.';

  @override
  String get privacyCapturesDeleted => 'Capturas eliminadas.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Algumas capturas não puderam ser eliminadas. Não foi alterado mais nada.';

  @override
  String get privacyDeleteAllTitle => 'Eliminar todos os seus dados?';

  @override
  String get privacyDeleteAllBody =>
      'Isto elimina todas as tarefas, passos, lembretes e capturas neste dispositivo, e os registos na nuvem listados acima. Não pode ser desfeito, e não há cópia de segurança a partir da qual repor.';

  @override
  String get privacyDeleteEverything => 'Eliminar tudo';

  @override
  String get privacyDeletedAll => 'Foi tudo eliminado.';

  @override
  String get privacyDeleteFailed => 'Não foi possível eliminar os seus dados.';

  @override
  String get privacyDeletedUnverified =>
      'Tudo o que estava neste dispositivo foi eliminado. A Action não conseguiu chegar à nuvem para confirmar que lá não sobra nada, e vai voltar a verificar.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Eliminado, tirando $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'A Action vai tentar de novo.';

  @override
  String get privacyCloudCheckIncomplete =>
      'A Action não conseguiu terminar a verificação da nuvem, e vai tentar de novo.';

  @override
  String get privacyLeftoverCaptures => 'algumas capturas';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registos na nuvem',
      one: '1 registo na nuvem',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first e $second';
  }

  @override
  String get privacyCloudDeleted => 'Os registos na nuvem foram eliminados.';

  @override
  String get privacyCloudUnreachable =>
      'Continuou sem os conseguir alcançar. A Action vai tentar de novo.';

  @override
  String get privacyPendingTitle => 'Ainda por eliminar';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Não foi possível alcançar $count registos na nuvem da última vez. A Action vai tentar sozinha, ou pode tentar agora.',
      one: 'Não foi possível alcançar 1 registo na nuvem da última vez. A Action vai tentar sozinha, ou pode tentar agora.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Tentar de novo';

  @override
  String get evidenceTitle => 'De onde isto veio';

  @override
  String get evidenceUnverified =>
      'A Action não encontrou estas palavras no texto que leu, por isso este valor não foi conferido. Compare-o com o original antes de confiar nele.';

  @override
  String get evidenceHighlighted =>
      'Estas palavras estavam no texto que a Action leu desta captura, e o realce mostra onde.';

  @override
  String get evidenceNoRegion =>
      'Estas palavras estavam no texto que a Action leu desta captura. Não conseguiu determinar em que ponto exacto da imagem estão, e não está a adivinhar.';

  @override
  String get evidenceInText =>
      'Estas palavras estavam no texto que esta captura contém.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Crítica';

  @override
  String get urgencyImportant => 'Importante';

  @override
  String get urgencyNormal => 'Normal';

  @override
  String get urgencyLow => 'Baixa';

  @override
  String get urgencyUnsure => 'Sem certeza';
}
