// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppL10nEs extends AppL10n {
  AppL10nEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Action';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDone => 'Listo';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonBack => 'Atrás';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonRemove => 'Quitar';

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
  String get commonAdd => 'Añadir';

  @override
  String get commonOn => 'Activado';

  @override
  String get commonOff => 'Desactivado';

  @override
  String get commonUnknown => 'Desconocido';

  @override
  String get commonChecking => 'Comprobando…';

  @override
  String get commonSettings => 'Ajustes';

  @override
  String get commonDismiss => 'Descartar';

  @override
  String get commonUndo => 'Deshacer';

  @override
  String get commonSkip => 'Omitir';

  @override
  String get commonNotNow => 'Ahora no';

  @override
  String get commonSomethingWentWrong => 'Algo salió mal.';

  @override
  String get navToday => 'Hoy';

  @override
  String get navLibrary => 'Biblioteca';

  @override
  String get navIntelligence => 'Inteligencia';

  @override
  String get navSearch => 'Buscar';

  @override
  String get navCapture => 'Capturar algo';

  @override
  String get todayGreetingMorning => 'Buenos días';

  @override
  String get todayGreetingAfternoon => 'Buenas tardes';

  @override
  String get todayGreetingEvening => 'Buenas noches';

  @override
  String get todayDateFormat => 'EEEE · d \'de\' MMMM';

  @override
  String get todayActionsLoadFailed =>
      'No se pudieron cargar tus tareas. Siguen guardadas en este dispositivo.';

  @override
  String get todaySectionNeedsAttention => 'Requiere atención';

  @override
  String get todaySectionAlsoNeedsAttention => 'También requiere atención';

  @override
  String get todaySectionWaitingForReview => 'Esperando revisión';

  @override
  String get todaySectionComingUp => 'Próximamente';

  @override
  String todaySeeAllCaptures(int count) {
    return 'Ver las $count capturas';
  }

  @override
  String get todaySeeAllInLibrary => 'Ver todo en la Biblioteca';

  @override
  String todayCompletedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hechas',
      one: '1 hecha',
    );
    return '$_temp0';
  }

  @override
  String todayCompletedSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tareas completadas. Abrir la biblioteca.',
      one: '1 tarea completada. Abrir la biblioteca.',
    );
    return '$_temp0';
  }

  @override
  String get todayStartWith => 'EMPIEZA CON';

  @override
  String get todayQuickPhoto => 'Foto';

  @override
  String get todayQuickScreenshot => 'Captura';

  @override
  String get todayQuickText => 'Texto';

  @override
  String get todayQuickTools => 'Revisa un enlace o busca claves en un texto';

  @override
  String get briefBadgeNeedsYou => 'TE NECESITA';

  @override
  String get briefBadgeToReview => 'POR REVISAR';

  @override
  String get briefBadgeAhead => 'POR DELANTE';

  @override
  String get briefBadgeStartHere => 'EMPIEZA AQUÍ';

  @override
  String get briefBadgeClear => 'DESPEJADO';

  @override
  String get briefNext => 'SIGUIENTE';

  @override
  String briefOpenAction(String title) {
    return 'Abrir $title';
  }

  @override
  String briefMarkDone(String title) {
    return 'Marcar «$title» como hecha';
  }

  @override
  String briefHeadlineNeedsAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tareas requieren tu atención',
      one: '1 tarea requiere tu atención',
    );
    return '$_temp0';
  }

  @override
  String briefDetailAlsoWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capturas también esperan revisión.',
      one: '1 captura también espera revisión.',
    );
    return '$_temp0';
  }

  @override
  String briefHeadlineCapturesWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capturas te están esperando',
      one: '1 captura te está esperando',
    );
    return '$_temp0';
  }

  @override
  String get briefDetailNothingOverdue => 'No hay nada vencido.';

  @override
  String get briefHeadlineNothingToday => 'Hoy nada te necesita';

  @override
  String briefDetailComingUp(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tareas están por llegar.',
      one: '1 tarea está por llegar.',
    );
    return '$_temp0';
  }

  @override
  String get briefHeadlineClear => 'Lo tienes todo al día';

  @override
  String get briefDetailClear => 'No hay nada pendiente ni nada esperando.';

  @override
  String get briefHeadlineFirstRun => 'Empieza con lo que sea';

  @override
  String get briefDetailFirstRun =>
      'Una carta, una captura, una nota: Action averigua qué es.';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsSectionPersonalise => 'Personalizar';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsAppearanceDescription =>
      'Claro, oscuro o lo que haga el dispositivo.';

  @override
  String get settingsLanguageDescription =>
      'El idioma en el que Action te habla.';

  @override
  String get appearanceSystem => 'Sistema';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceDark => 'Oscuro';

  @override
  String get appearanceSystemDescription => 'Seguir el ajuste del dispositivo';

  @override
  String get appearanceLightDescription => 'Siempre claro';

  @override
  String get appearanceDarkDescription => 'Siempre oscuro';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSubtitle =>
      'Los cambios se aplican al momento. No se envía nada a ningún sitio; la elección se guarda en este dispositivo.';

  @override
  String get languageSectionChoose => 'Elige un idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageSystemDescription => 'Seguir el idioma del dispositivo';

  @override
  String get languageDraftNote =>
      'El inglés es el idioma en el que se redactaron los textos de Action. Las demás traducciones se prepararon siguiendo un glosario fijo y se comprobaron automáticamente, pero todavía no las ha revisado un hablante nativo. Donde la formulación exacta importa — privacidad, seguridad, lo que Action afirma y lo que no — el inglés sigue siendo la referencia.';

  @override
  String get ocrScriptTitle => 'Reconocimiento de texto';

  @override
  String get ocrScriptSubtitle =>
      'El sistema de escritura que Action lee cuando mira una foto. El reconocimiento ocurre en este dispositivo; ninguna captura se envía a ningún sitio para leerla.';

  @override
  String get ocrScriptSectionChoose => 'Sistema de escritura';

  @override
  String get ocrScriptFollowLanguage => 'Seguir el idioma de la app';

  @override
  String ocrScriptFollowLanguageValue(String script) {
    return 'Ahora mismo $script';
  }

  @override
  String get ocrScriptLatin => 'Latino';

  @override
  String get ocrScriptChinese => 'Chino';

  @override
  String get ocrScriptDevanagari => 'Devanagari';

  @override
  String get ocrScriptJapanese => 'Japonés';

  @override
  String get ocrScriptKorean => 'Coreano';

  @override
  String get ocrScriptLatinDescription =>
      'Inglés, español, francés, alemán y las demás lenguas escritas con letras latinas.';

  @override
  String get ocrScriptChineseDescription => 'Chino simplificado y tradicional.';

  @override
  String get ocrScriptDevanagariDescription =>
      'Hindi, maratí y nepalí. No bengalí, tamil ni telugu — cada uno de ellos es un sistema de escritura distinto.';

  @override
  String get ocrScriptJapaneseDescription => 'Japonés.';

  @override
  String get ocrScriptKoreanDescription => 'Coreano.';

  @override
  String get ocrScriptFootnote =>
      'Todas las opciones salvo la latina leen también letras latinas, así que elegir una añade un sistema de escritura en lugar de cambiarlo. Esto afecta a las fotos que hagas a partir de ahora, no a las ya leídas.';

  @override
  String ocrScriptUnreadableTitle(String language) {
    return 'Action no puede leer la escritura $language';
  }

  @override
  String get ocrScriptUnreadableBody =>
      'No existe un reconocedor en el dispositivo para ella. Las fotos se seguirán leyendo en todo lo escrito con letras latinas, y el resto volverá vacío. Puedes escribir o pegar ese texto en su lugar.';

  @override
  String ocrScriptNoTextHint(String script) {
    return 'Action está configurada para leer $script. Si esta foto usa otro sistema de escritura, cámbialo en Ajustes y vuelve a leerla.';
  }

  @override
  String get settingsTextRecognition => 'Reconocimiento de texto';

  @override
  String get settingsTextRecognitionDescription =>
      'El sistema de escritura que Action lee en las fotos.';

  @override
  String get settingsIntelligenceFootnote =>
      'Action funciona sin IA. Conectar tu propio proveedor añade herramientas de análisis de documentos, planificación y redacción.';

  @override
  String get settingsAiProvider => 'Proveedor de IA';

  @override
  String get settingsAiNotConnected =>
      'Sin conectar. Usa tu propia cuenta y clave de API.';

  @override
  String settingsAiConnected(String provider) {
    return 'Conectado a $provider.';
  }

  @override
  String get settingsSectionPrivacySecurity => 'Privacidad y seguridad';

  @override
  String get settingsSecurity => 'Seguridad';

  @override
  String get settingsWhereInfoLives => 'Dónde vive tu información';

  @override
  String get settingsWhereInfoLivesDescription =>
      'Qué se queda en este dispositivo y qué no.';

  @override
  String get protectionAppLock => 'Bloqueo de la app';

  @override
  String get protectionScreenPrivacy => 'privacidad de pantalla';

  @override
  String get protectionPrivateReminders => 'recordatorios privados';

  @override
  String get protectionSummaryNone =>
      'Bloqueo de la app, privacidad de pantalla y qué sale de este dispositivo.';

  @override
  String protectionSummaryOne(String first) {
    return '$first está activado.';
  }

  @override
  String protectionSummaryTwo(String first, String second) {
    return '$first y $second están activados.';
  }

  @override
  String protectionSummaryThree(String first, String second, String third) {
    return '$first, $second y $third están activados.';
  }

  @override
  String get settingsSectionReminders => 'Recordatorios';

  @override
  String get settingsRemindersFootnote =>
      'Android puede entregar un recordatorio algo más tarde de la hora que fijaste, según los ajustes de batería y cómo se esté usando el dispositivo.';

  @override
  String get settingsNotifications => 'Notificaciones';

  @override
  String get settingsNotificationsOnDescription =>
      'Los recordatorios que fijes se pueden mostrar.';

  @override
  String get settingsNotificationsOffDescription =>
      'Desactivadas para Action, así que los recordatorios no aparecerán.';

  @override
  String get settingsNotificationsUnknown => 'No se pudo comprobar.';

  @override
  String get settingsNotificationsAllowed => 'Permitidas';

  @override
  String get settingsOpenSystemSettings => 'Abrir ajustes';

  @override
  String get settingsActionFootnote =>
      'Action convierte información desordenada en próximos pasos claros. Tú confirmas todo antes de que se guarde.';

  @override
  String get settingsHelp => 'Ayuda';

  @override
  String get settingsHelpDescription => 'Cómo funciona Action y qué no hará.';

  @override
  String get settingsVersion => 'Versión';

  @override
  String get dateShortFormat => 'd MMM';

  @override
  String get dateLongFormat => 'd MMM yyyy';

  @override
  String get relativeJustNow => 'Ahora mismo';

  @override
  String relativeMinutes(int count) {
    return 'hace $count min';
  }

  @override
  String relativeHours(int count) {
    return 'hace $count h';
  }

  @override
  String get relativeYesterday => 'Ayer';

  @override
  String relativeDays(int count) {
    return 'hace $count d';
  }

  @override
  String get libraryTitle => 'Biblioteca';

  @override
  String get librarySubtitle =>
      'Todo lo que Action guarda para ti. Y todo ello se queda en este dispositivo.';

  @override
  String get librarySegmentActions => 'Tareas';

  @override
  String get librarySegmentCaptures => 'Capturas';

  @override
  String get librarySegmentGoals => 'Objetivos';

  @override
  String get librarySegmentDone => 'Hechas';

  @override
  String get libraryNewGoal => 'Nuevo objetivo';

  @override
  String get libraryNoGoalsTitle => 'Aún no hay objetivos';

  @override
  String get libraryNoGoalsMessage =>
      'Un objetivo es algo que quieres que ocurra. Action puede encontrar qué falta, qué lo bloquea y qué hacer primero.';

  @override
  String get libraryNoDoneTitle => 'Aún no has completado nada';

  @override
  String get libraryNoDoneMessage =>
      'Las tareas que termines se guardarán aquí.';

  @override
  String get libraryNoOpenTitle => 'No hay tareas abiertas';

  @override
  String get libraryNoOpenMessage =>
      'Captura algo y Action averiguará qué hay que hacer.';

  @override
  String get libraryNoCapturesTitle => 'Aún no has capturado nada';

  @override
  String get libraryNoCapturesMessage =>
      'Las fotos, capturas y textos que añadas llegan aquí primero. No se analiza nada hasta que lo pides.';

  @override
  String get libraryGoalNoActions => 'Todavía no ha salido nada de él';

  @override
  String libraryGoalActionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tareas de este objetivo',
      one: '1 tarea de este objetivo',
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Buscar en tareas y capturas';

  @override
  String get searchClear => 'Borrar';

  @override
  String get searchPrivacyNote =>
      'Se busca en este dispositivo. Nada de lo que escribas aquí sale de él.';

  @override
  String get searchYouCanSearch => 'PUEDES BUSCAR';

  @override
  String get searchFieldTitles => 'Títulos';

  @override
  String get searchFieldTitlesExample => 'Renovar el seguro del coche';

  @override
  String get searchFieldReferences => 'Números de referencia';

  @override
  String get searchFieldReferencesExample => 'MTR-4471-08';

  @override
  String get searchFieldOrganisations => 'Organizaciones';

  @override
  String get searchFieldOrganisationsExample => 'Northgate';

  @override
  String get searchFieldSteps => 'Pasos dentro de una tarea';

  @override
  String get searchFieldStepsExample => 'Subir el formulario';

  @override
  String get searchFieldCaptureText => 'El texto leído de una captura';

  @override
  String get searchFieldCaptureTextExample => 'aviso de renovación';

  @override
  String searchNoMatchesTitle(String query) {
    return 'Sin resultados para «$query»';
  }

  @override
  String get searchNoMatchesTryFewer =>
      'Prueba con menos palabras, o con un número de referencia tal como aparece.';

  @override
  String get searchNoMatchesClearFilters =>
      'Prueba con menos palabras, o borra los filtros.';

  @override
  String get searchFilterActive => 'Activas';

  @override
  String get searchFilterCompleted => 'Completadas';

  @override
  String get searchFilterOverdue => 'Vencidas';

  @override
  String get searchFilterThisWeek => 'Esta semana';

  @override
  String get searchFilterCritical => 'Críticas';

  @override
  String get searchFilterCreatedByYou => 'Creadas por ti';

  @override
  String get searchFilterArchived => 'Archivadas';

  @override
  String get searchFilterClear => 'Borrar filtros';

  @override
  String get searchIncompleteActions =>
      'No se pudieron buscar tus tareas, así que estos resultados pueden estar incompletos.';

  @override
  String get searchIncompleteCaptures =>
      'No se pudieron buscar tus capturas, así que estos resultados pueden estar incompletos.';

  @override
  String get searchIncompleteBoth =>
      'No se pudieron buscar tus tareas ni tus capturas, así que estos resultados pueden estar incompletos.';

  @override
  String get searchMatchTitle => 'Título';

  @override
  String get searchMatchNextStep => 'Siguiente paso';

  @override
  String get searchMatchStep => 'Paso';

  @override
  String get searchMatchSummary => 'Resumen';

  @override
  String get searchMatchFromCapture => 'De una captura';

  @override
  String get studioSuggested => 'Sugerido para tu última captura';

  @override
  String get studioRecentlyUsed => 'Usado recientemente';

  @override
  String get studioReady => 'LISTO';

  @override
  String get studioNotConnected => 'SIN CONECTAR';

  @override
  String get studioHeroTitle => 'Inteligencia de Action';

  @override
  String get studioConnectedBlurb =>
      'Entiende un documento, mejora un objetivo, arma un plan, redacta una respuesta o revisa lo que tienes delante.';

  @override
  String studioDisconnectedBlurb(int count) {
    return '$count herramientas para entender documentos, planificar y escribir. Conecta tu propia cuenta de IA para usarlas: te cobra tu proveedor, nunca Action.';
  }

  @override
  String get studioConnectAi => 'Conectar IA';

  @override
  String get studioHowItWorks => 'Cómo funciona';

  @override
  String studioLocalCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count de ellas ya funcionan sin nada de eso, enteramente en este dispositivo.',
      one: '1 de ellas ya funciona sin nada de eso, enteramente en este dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get studioRunsOnThisDevice => 'Se ejecuta en este dispositivo';

  @override
  String studioToolSemantics(String title, String description) {
    return '$title. $description';
  }

  @override
  String studioToolSemanticsLocal(String title, String description) {
    return '$title. $description Se ejecuta en este dispositivo.';
  }

  @override
  String get categoryUnderstand => 'Entender';

  @override
  String get categoryUnderstandBlurb => 'Dale sentido a lo que tienes.';

  @override
  String get categoryPlan => 'Planificar';

  @override
  String get categoryPlanBlurb => 'Conviértelo en algo que puedas hacer.';

  @override
  String get categoryCreate => 'Crear';

  @override
  String get categoryCreateBlurb => 'Escríbelo, mejóralo, tradúcelo.';

  @override
  String get categoryExtract => 'Extraer';

  @override
  String get categoryExtractBlurb => 'Saca los datos que importan.';

  @override
  String get categoryVerify => 'Revisar';

  @override
  String get categoryVerifyBlurb => 'Revisa lo que tienes delante.';

  @override
  String get captureSheetTitle => 'Capturar algo';

  @override
  String get captureSheetSubtitle =>
      'Dale a Action cualquier cosa que prefieras no leer entera.';

  @override
  String get captureTakePhoto => 'Hacer una foto';

  @override
  String get captureTakePhotoSubtitle =>
      'Una carta, factura o aviso que tengas delante';

  @override
  String get captureChooseImage => 'Elegir una imagen';

  @override
  String get captureChooseImageSubtitle =>
      'Una captura o foto que ya esté en este dispositivo';

  @override
  String get capturePasteText => 'Pegar texto';

  @override
  String get capturePasteTextSubtitle => 'Un correo, mensaje o aviso';

  @override
  String get captureChoosePdf => 'Elegir un PDF';

  @override
  String get captureChoosePdfSubtitle =>
      'Un extracto, carta o formulario que ya tengas';

  @override
  String get captureFootnote =>
      'Las capturas se quedan en este dispositivo. No se analiza nada en línea hasta que lo pides.';

  @override
  String get captureCouldNotOpen => 'No se pudo abrir. Prueba de otra manera.';

  @override
  String captureOptionSemantics(String title, String subtitle) {
    return '$title. $subtitle';
  }

  @override
  String get stageReading => 'Leyendo';

  @override
  String get stageNeedsReview => 'Requiere revisión';

  @override
  String get stageActionCreated => 'Tarea creada';

  @override
  String get stageNoText => 'No se encontró texto';

  @override
  String get stageCouldNotBeRead => 'No se pudo leer';

  @override
  String get stageReadingPreview => 'Leyendo el texto…';

  @override
  String get stageFailedPreview => 'Esto no se pudo leer en este dispositivo.';

  @override
  String get provenancePhoto => 'Capturado de una foto';

  @override
  String get provenanceImage => 'Capturado de una imagen';

  @override
  String get provenancePastedText => 'Capturado de texto pegado';

  @override
  String get provenanceDocument => 'Añadido como documento';

  @override
  String sourceCardMeta(String provenance, String when) {
    return '$provenance · $when';
  }

  @override
  String metaDone(String when) {
    return 'Hecha $when';
  }

  @override
  String metaOverdue(String date) {
    return 'Vencida · vencía el $date';
  }

  @override
  String get metaDueToday => 'Vence hoy';

  @override
  String metaDueOn(String date) {
    return 'Vence el $date';
  }

  @override
  String get metaCreatedByYou => 'Creada por ti';

  @override
  String get categoryPayment => 'Pago';

  @override
  String get categoryRenewal => 'Renovación';

  @override
  String get categoryAppointment => 'Cita';

  @override
  String get categoryBooking => 'Reserva';

  @override
  String get categoryTravel => 'Viaje';

  @override
  String get categoryDeadline => 'Fecha límite';

  @override
  String get categoryResponse => 'Requiere respuesta';

  @override
  String get categoryDelivery => 'Entrega';

  @override
  String get categoryDocument => 'Documento';

  @override
  String get categoryNoActionRequired => 'No hay nada que hacer';

  @override
  String get categoryUnsure => 'No está claro';

  @override
  String get errorEnterManually => 'Introducirlo a mano';

  @override
  String get sourceWhatWeRead => 'Lo que hemos leído';

  @override
  String get sourceDelete => 'Eliminar captura';

  @override
  String get sourceGone => 'Esa captura ya no está disponible.';

  @override
  String get sourceDeleteTitle => '¿Eliminar esta captura?';

  @override
  String get sourceDeleteBody =>
      'La imagen y el texto leído de ella se quitan de este dispositivo.';

  @override
  String get sourceDeleteKeep => 'Conservar';

  @override
  String get sourceOpenAction => 'Abrir la tarea';

  @override
  String sourceOpenActions(int count) {
    return 'Abrir $count tareas';
  }

  @override
  String get sourceCreateAnother => 'Crear otra a partir de esto';

  @override
  String get sourceCreateAction => 'Crear una tarea a partir de esto';

  @override
  String get sourceDoMore => 'Hacer más con esto';

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
    return 'desde $format $size KB';
  }

  @override
  String get sourceTextFound => 'Texto encontrado';

  @override
  String sourceOcrStats(int lines, int ms) {
    return '$lines líneas · $ms ms';
  }

  @override
  String get sourceReadExplainer =>
      'Este es el texto que Action leyó. Lo que se hizo con él está debajo.';

  @override
  String get sourceNotInterpreted =>
      'Todavía no se ha interpretado nada. Action propondrá qué hacer con esto, y tú confirmas antes de que se cree nada.';

  @override
  String get sourceNoTextExplainer =>
      'Esto puede pasar con letra manuscrita, con muy poca luz o con una escritura que este dispositivo aún no sabe leer.';

  @override
  String get sourceReadFailed => 'No se pudo leer esto';

  @override
  String get sourceReadFailedReason =>
      'El reconocimiento de texto no llegó a completarse.';

  @override
  String get sourceTryReadingAgain => 'Intentar leerlo otra vez';

  @override
  String get sourceTypeInstead => 'Escribir los datos a mano';

  @override
  String get sourceTypeWhatItSays => 'Escribe lo que dice';

  @override
  String get sourceTypeHint => 'Fechas, importes y qué se pide.';

  @override
  String get sourceMadeFromThis => 'Hecho a partir de esta captura';

  @override
  String sourceMadeFromThisCount(int count) {
    return '$count hechos a partir de esta captura';
  }

  @override
  String get sourceTheDocument => 'El documento';

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
  String get sourcePageCountUnknown => 'Número de páginas desconocido';

  @override
  String get sourceDocumentNotRead =>
      'Action no ha leído lo que hay dentro de este documento. Cuando uses una herramienta que lo necesite, el archivo irá al proveedor de IA que hayas conectado y se te avisará antes de que ocurra.';

  @override
  String get previewSaveFailed => 'No se pudo guardar. Inténtalo otra vez.';

  @override
  String get previewTitle => 'Revisa la captura';

  @override
  String get previewImageFailed => 'Esa imagen no se pudo abrir.';

  @override
  String get previewHint =>
      'Asegúrate de que el texto se lee bien y de que no falta nada importante.';

  @override
  String get previewRetake => 'Repetir la foto';

  @override
  String get pasteTitle => 'Pegar texto';

  @override
  String get pasteHint =>
      'Pega el correo, el mensaje o el aviso que prefieres no leer entero.';

  @override
  String get pasteFootnote =>
      'Cualquier cosa con una fecha, un importe o una petición funciona bien.';

  @override
  String get pasteEnough => 'Parece suficiente para trabajar.';

  @override
  String get pasteMore => 'Un poco más de texto dará un resultado mejor.';

  @override
  String get reviewLoadFailed => 'No se pudo cargar esta captura.';

  @override
  String get reviewConfirmed => 'Confirmado';

  @override
  String get reviewNeedsReview => 'Necesita revisión';

  @override
  String get reviewReview => 'Revisar';

  @override
  String get reviewHighConfidence => 'Confianza alta';

  @override
  String get reviewConfirmedByYou => 'Confirmado por ti';

  @override
  String get reviewMissing => 'Falta';

  @override
  String get reviewNotUnderstood =>
      'Action no ha podido entender con fiabilidad lo suficiente de esta fuente.';

  @override
  String get reviewNotUnderstoodBody =>
      'La captura está intacta y no se ha perdido nada. Puedes introducir los datos tú mismo, y la fuente sigue adjunta como referencia.';

  @override
  String get reviewEnterDetails => 'Introducir los datos';

  @override
  String get reviewKeepSource => 'Conservar la fuente para después';

  @override
  String reviewEngine(String engine) {
    return 'Motor: $engine';
  }

  @override
  String get reviewManualNotice =>
      'Estás creando esta tarea tú mismo. Solo se usará lo que escribas aquí.';

  @override
  String get reviewUntitled => 'Tarea sin título';

  @override
  String get reviewEditTitle => 'Editar el título';

  @override
  String reviewNeedsReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valores necesitan tu revisión.',
      one: '1 valor necesita tu revisión antes de poder confirmar esto.',
    );
    return '$_temp0';
  }

  @override
  String get reviewKeyFacts => 'Datos clave';

  @override
  String get reviewNotFound => 'No encontrado';

  @override
  String get reviewSuggestedNextStep => 'Siguiente paso sugerido';

  @override
  String get reviewWhyThisMatters => 'Por qué importa';

  @override
  String get reviewSteps => 'Pasos';

  @override
  String get reviewAddStep => 'Añadir un paso';

  @override
  String get reviewInjectionNotice =>
      'Parte del texto de esta fuente parecía instrucciones en lugar de datos del documento, así que Action lo ignoró.';

  @override
  String get reviewLayoutNotice =>
      'La disposición de este documento puede contener relaciones que la extracción de texto no ha podido conservar del todo. Compara los valores de abajo con la fuente antes de confirmar.';

  @override
  String reviewSignalNotice(String reason) {
    return '$reason Compara los valores de abajo con la fuente.';
  }

  @override
  String get reviewDeadline => 'Fecha límite';

  @override
  String get reviewAmount => 'Importe';

  @override
  String get reviewLeftUnset => 'Ninguno — has elegido dejarlo sin definir';

  @override
  String get reviewUnclear => 'Poco claro';

  @override
  String get reviewNotSet => 'Sin definir';

  @override
  String get reviewNoDeadlineFound =>
      'No se encontró ninguna en este documento';

  @override
  String get reviewNoAmountFound => 'No se encontró ninguno en este documento';

  @override
  String get reviewMultipleDates =>
      'Action ha encontrado varias fechas posibles.';

  @override
  String reviewMultipleDatesBody(int count) {
    return '$count fechas podrían ser la fecha límite. Elige la correcta, escribe otra o déjalo sin definir.';
  }

  @override
  String get reviewChooseDate => 'Elegir una fecha';

  @override
  String get reviewMultipleAmounts =>
      'Action ha encontrado más de un importe posible.';

  @override
  String reviewMultipleAmountsBody(int count) {
    return '$count importes podrían ser el de esta tarea. Elige uno, escribe otro o déjalo sin definir.';
  }

  @override
  String get reviewChooseAmount => 'Elegir un importe';

  @override
  String get reviewSkipStep => 'Saltar este paso';

  @override
  String get reviewKeepStep => 'Conservar este paso';

  @override
  String get reviewEditStep => 'Editar el paso';

  @override
  String get reviewCreateManually => 'Crear a mano';

  @override
  String get reviewConfirmAndCreate => 'Confirmar y crear la tarea';

  @override
  String get reviewFixHighlighted => 'Revisar los campos marcados';

  @override
  String get reviewSaving => 'Guardando…';

  @override
  String get reviewSaveFailed =>
      'No se pudo guardar esta tarea. No se ha perdido nada — inténtalo otra vez.';

  @override
  String get reviewFieldTitle => 'Título';

  @override
  String get reviewTitleHint => '¿Qué tiene que pasar?';

  @override
  String get reviewNewStep => 'Paso nuevo';

  @override
  String get reviewStepHint => 'Qué hacer';

  @override
  String get reviewDatesConflict => 'El documento menciona más de una fecha.';

  @override
  String get reviewAmountsConflict =>
      'El documento menciona más de un importe.';

  @override
  String get reviewAnotherDate => 'Otra fecha — 2026-08-30';

  @override
  String get reviewBadDate =>
      'No es una fecha real. Usa el formato 2026-08-30.';

  @override
  String get reviewTypeDate => 'Escribe una fecha, o déjala sin definir abajo.';

  @override
  String get reviewUseThisDate => 'Usar esta fecha';

  @override
  String get reviewLeaveNoDeadline => 'Seguir sin fecha límite';

  @override
  String get reviewAnotherAmount => 'Otro importe — 780.00';

  @override
  String reviewAmountError(String reason) {
    return 'No se puede usar este importe: $reason.';
  }

  @override
  String get reviewUseThisAmount => 'Usar este importe';

  @override
  String get reviewLeaveNoAmount => 'Seguir sin importe';

  @override
  String get reviewThisValue => 'Este valor';

  @override
  String reviewQuote(String quote) {
    return '«$quote»';
  }

  @override
  String get reviewSeeOnCapture => 'Verlo en la captura';

  @override
  String get reviewViewSource => 'Ver la fuente';

  @override
  String get reviewFromSource => 'De la fuente';

  @override
  String get reviewNotVerified => 'Sin comprobar';

  @override
  String get reviewCouldNotVerify =>
      'No se pudo comprobar esto contra la fuente.';

  @override
  String get reviewLooksRight => 'Parece correcto';

  @override
  String get reviewStageReading => 'Leyendo la fuente';

  @override
  String get reviewStageUnderstanding => 'Entendiendo los datos importantes';

  @override
  String get reviewStageChecking => 'Comprobando qué necesita revisión';

  @override
  String get reviewNothingToDo => 'Ahora mismo no tienes que hacer nada.';

  @override
  String get reviewInformationOnly =>
      'Esto parece solo información — no se encontró ninguna fecha límite, pago ni respuesta.';

  @override
  String get reviewInformationOnlyWithSource =>
      'Esto parece solo información — en esta captura no se encontró ninguna fecha límite, pago ni respuesta.';

  @override
  String get reviewSourceKept => 'La fuente se conserva de todos modos.';

  @override
  String get reviewAddAnyway => 'Añadir una tarea de todas formas';

  @override
  String get reviewActionConfirmed => 'Tarea confirmada';

  @override
  String get reviewCreatedByYou => 'Creada por ti.';

  @override
  String reviewConfirmedFrom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Confirmada por ti a partir de $count datos revisados.',
      one: 'Confirmada por ti a partir de 1 dato revisado.',
    );
    return '$_temp0';
  }

  @override
  String reviewConfirmedFromEdited(int count, int edited) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Confirmada por ti a partir de $count datos revisados. Cambiaste $edited de ellos.',
      one:
          'Confirmada por ti a partir de 1 dato revisado. Cambiaste $edited de ellos.',
    );
    return '$_temp0';
  }

  @override
  String get reviewSavedOnDevice => 'Guardada en este dispositivo.';

  @override
  String get detailLoadFailed =>
      'No se pudo cargar esta tarea. Sigue guardada en este dispositivo.';

  @override
  String get detailNotFoundTitle => 'Esa tarea ya no está aquí';

  @override
  String get detailNotFoundMessage =>
      'Puede que se haya eliminado en este dispositivo.';

  @override
  String get detailGoBack => 'Volver';

  @override
  String get detailMore => 'Más';

  @override
  String get detailChangeUrgency => 'Cambiar la urgencia';

  @override
  String get detailAddRecommendedStep => 'Añadir un paso recomendado';

  @override
  String get detailEditRecommendedStep => 'Editar el paso recomendado';

  @override
  String get detailArchiveTitle => '¿Archivar esta tarea?';

  @override
  String get detailArchiveBody =>
      'Sale de tu lista pero no se elimina, y la captura de la que salió se conserva.';

  @override
  String get detailArchiveConfirm => 'Archivar';

  @override
  String get detailArchived => 'Archivada';

  @override
  String detailCompletedOn(String date) {
    return 'Completada el $date';
  }

  @override
  String get detailSectionDetails => 'Detalles';

  @override
  String get detailSectionReminders => 'Recordatorios';

  @override
  String get detailAllStepsDone => 'Todos los pasos hechos';

  @override
  String get detailNextEyebrow => 'Siguiente';

  @override
  String get detailCompleteQuestion => '¿Completar esta tarea?';

  @override
  String get detailMarkStepDone => 'Marcar el paso como hecho';

  @override
  String get detailCompleteAction => 'Completar esta tarea';

  @override
  String get detailAddDeadline => 'Añadir una fecha límite';

  @override
  String get detailAddAmount => 'Añadir un importe';

  @override
  String detailStepsProgress(int completed, int total) {
    return '$completed de $total hechos';
  }

  @override
  String get detailNoStepsTitle => 'Todavía no hay pasos';

  @override
  String get detailNoStepsMessage =>
      'Divide esto en los movimientos que de verdad tienes que hacer.';

  @override
  String get detailAddFirstStep => 'Añadir el primer paso';

  @override
  String detailStepCompletedSemantics(String title) {
    return 'Paso completado: $title';
  }

  @override
  String detailStepNextSemantics(String title) {
    return 'Paso siguiente: $title';
  }

  @override
  String detailStepSemantics(String title) {
    return 'Paso: $title';
  }

  @override
  String detailMarkDone(String title) {
    return 'Marcar «$title» como hecho';
  }

  @override
  String detailMarkNotDone(String title) {
    return 'Marcar «$title» como no hecho';
  }

  @override
  String get detailStepOptions => 'Opciones del paso';

  @override
  String get detailMoveUp => 'Subir';

  @override
  String get detailMoveDown => 'Bajar';

  @override
  String get detailDeleteStep => 'Eliminar el paso';

  @override
  String get detailDateFormat => 'd MMM';

  @override
  String get detailDateFormatWithYear => 'd MMM yyyy';

  @override
  String get stepDeleteTitle => '¿Eliminar este paso?';

  @override
  String get stepDeleteKeep => 'Conservarlo';

  @override
  String get detailNoRemindersYet => 'Todavía no hay recordatorios.';

  @override
  String get detailReminderLimit =>
      'Ese es el máximo de recordatorios que puede tener una tarea. Quita uno para añadir otro.';

  @override
  String get detailAddReminder => 'Añadir recordatorio';

  @override
  String get detailChangeReminder => 'Cambiar el recordatorio';

  @override
  String get detailRemoveReminder => 'Quitar el recordatorio';

  @override
  String get detailReminderFormat => 'EEE d MMM, HH:mm';

  @override
  String get reminderStatePending => 'Todavía sin configurar';

  @override
  String get reminderStateNotificationsOff =>
      'Guardado, pero las notificaciones están desactivadas';

  @override
  String get reminderStateFailed => 'No se pudo programar';

  @override
  String get reminderStateRemoving => 'Quitando…';

  @override
  String get reminderSetConfirmation =>
      'Recordatorio puesto. Te daremos un toque.';

  @override
  String get reminderUpdatedConfirmation => 'Recordatorio actualizado.';

  @override
  String get reminderNeedsPermission =>
      'Las notificaciones están desactivadas, así que este recordatorio queda guardado pero todavía no puede avisarte.';

  @override
  String get reminderScheduleFailed =>
      'Este recordatorio está guardado, pero Android no quiso programarlo.';

  @override
  String get reminderLimitReached =>
      'Esa tarea ya tiene el número máximo de recordatorios.';

  @override
  String get reminderTimeInPast => 'Esa hora ya ha pasado.';

  @override
  String get reminderAddTitle => 'Añadir un recordatorio';

  @override
  String get reminderChangeTitle => 'Cambiar este recordatorio';

  @override
  String get reminderDateLabel => 'Fecha';

  @override
  String get reminderTimeLabel => 'Hora';

  @override
  String get reminderFieldDateFormat => 'EEE d MMM yyyy';

  @override
  String get reminderFieldTimeFormat => 'HH:mm';

  @override
  String get reminderSummaryDateFormat => 'EEEE d \'de\' MMMM';

  @override
  String get reminderPresetFormat => 'd MMM, HH:mm';

  @override
  String reminderSummary(String date, String time) {
    return 'Te avisaremos el $date a las $time.';
  }

  @override
  String get reminderTimePastError =>
      'Esa hora ya ha pasado. Elige una posterior.';

  @override
  String get reminderSet => 'Poner recordatorio';

  @override
  String get reminderPresetInHour => 'En 1 hora';

  @override
  String get reminderPresetTomorrowMorning => 'Mañana por la mañana';

  @override
  String get reminderPresetNextWeek => 'La semana que viene';

  @override
  String get reminderPresetOnTheDay => 'El mismo día';

  @override
  String get reminderPresetDayBefore => '1 día antes';

  @override
  String get reminderPresetWeekBefore => '1 semana antes';

  @override
  String get reminderPresetAtDeadline => 'En la fecha límite';

  @override
  String get reminderPresetHourBefore => '1 hora antes';

  @override
  String get editNextStepTitle => 'Paso siguiente recomendado';

  @override
  String get editNextStepSubtitle =>
      'Una frase corta sobre el siguiente movimiento útil.';

  @override
  String get editNextStepHint => '¿Cuál es el siguiente movimiento útil?';

  @override
  String get editRemoveSuggestion => 'Quitar la sugerencia';

  @override
  String get editUrgencyTitle => '¿Cuánta urgencia tiene esto?';

  @override
  String get editStepHint => 'Una cosa concreta que hacer';

  @override
  String get editAddStep => 'Añadir paso';

  @override
  String get editDateHint => 'AAAA-MM-DD';

  @override
  String get editRemoveDeadline => 'Quitar la fecha límite';

  @override
  String get editAmountHint => '96,40';

  @override
  String get editSaveAmount => 'Guardar el importe';

  @override
  String get editRemoveAmount => 'Quitar el importe';

  @override
  String get securityTitle => 'Seguridad y privacidad';

  @override
  String get securitySectionProtection => 'Protección';

  @override
  String get securityAppLockUnavailable =>
      'El bloqueo de la app necesita un bloqueo de pantalla en este dispositivo. Configura primero un PIN, un patrón, una contraseña o una huella en los ajustes del dispositivo.';

  @override
  String get securityAppLockOn =>
      'Action le pide a tu dispositivo que confirme que eres tú.';

  @override
  String get securityAppLockOff =>
      'Exigir tu huella, tu cara o el PIN del dispositivo para abrir Action.';

  @override
  String get securityAskAgain => 'Volver a preguntar';

  @override
  String get securityAskAgainDescription =>
      'Cuánto tiempo puede estar Action en segundo plano antes de bloquearse.';

  @override
  String get securityScreenPrivacy => 'Privacidad de pantalla';

  @override
  String get securityScreenPrivacyDescription =>
      'Pedir a Android que bloquee las capturas y la grabación de pantalla, y que oculte Action en el selector de apps.';

  @override
  String get securityPrivateReminders => 'Recordatorios privados';

  @override
  String get securityPrivateRemindersOn =>
      'Los recordatorios solo dicen que algo te necesita.';

  @override
  String get securityPrivateRemindersOff =>
      'Los recordatorios muestran el título de la tarea. Activa esto para mantenerlo fuera de la pantalla de bloqueo.';

  @override
  String get securityLockNow => 'Bloquear ahora';

  @override
  String get securityLockNowDescription => 'Cerrar la puerta sin esperar.';

  @override
  String get securitySectionStorage => 'Cómo se guardan tus datos';

  @override
  String get securityStorageDataLabel => 'Tus tareas, capturas y ajustes';

  @override
  String get securityStorageDataDetail =>
      'Están en el almacenamiento privado de esta app, que otras apps no pueden leer y que Android cifra como parte del cifrado del dispositivo. Action no añade una segunda capa propia encima.';

  @override
  String get securityStorageKeyLabel => 'Tu clave del proveedor de IA';

  @override
  String get securityStorageKeyDetail =>
      'Guardada en el Keystore de Android y no junto a lo demás, y nunca se vuelve a mostrar después de guardarla.';

  @override
  String get securityStorageGapLabel => 'Lo que eso no cubre';

  @override
  String get securityStorageGapDetail =>
      'Nada de esto protege frente a alguien que use tu dispositivo desbloqueado, y un sistema modificado o rooteado puede leer más que uno normal. El bloqueo de la app es el control que ayuda con lo primero.';

  @override
  String get securitySectionInformation => 'Tu información';

  @override
  String get securityWhereInfoDescription =>
      'Todas las rutas que pueden tomar tus datos, y las dos que salen de este dispositivo.';

  @override
  String get securityAppLockRefused =>
      'No se confirmó, así que no cambió nada.';

  @override
  String get securityAppLockUnavailableToast =>
      'Este dispositivo no tiene bloqueo de pantalla. Añade un PIN, un patrón, una contraseña o una huella en los ajustes del dispositivo y vuelve a intentarlo.';

  @override
  String get securityScreenPrivacyRefused =>
      'Este dispositivo no quiso aplicar la privacidad de pantalla, así que se ha dejado desactivada en lugar de mostrarla como activa.';

  @override
  String securityRemindersUpdatedQuiet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count recordatorios programados dicen menos ahora.',
      one: '1 recordatorio programado dice menos ahora.',
    );
    return '$_temp0';
  }

  @override
  String securityRemindersUpdated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count recordatorios programados actualizados.',
      one: '1 recordatorio programado actualizado.',
    );
    return '$_temp0';
  }

  @override
  String get appLockDelayImmediately => 'Inmediatamente';

  @override
  String get appLockDelayOneMinute => 'Después de 1 minuto';

  @override
  String get appLockDelayFiveMinutes => 'Después de 5 minutos';

  @override
  String get securityDelayImmediatelyDescription =>
      'Cada vez que Action sale de la pantalla';

  @override
  String get securityDelayOneMinuteDescription =>
      'Lo bastante para contestar un mensaje';

  @override
  String get securityDelayFiveMinutesDescription =>
      'Lo bastante para atender una llamada';

  @override
  String get securityHeroProtected => 'Protegido';

  @override
  String get securityHeroNothingOn => 'Nada activado';

  @override
  String get securityHeroFootnote =>
      'Todo lo de aquí funciona en este dispositivo. Ninguno de estos ajustes se envía a ningún sitio, y ninguno puede cambiarse a distancia.';

  @override
  String get securityHeadlineNone => 'Hay tres protecciones disponibles';

  @override
  String securityHeadlineOne(String first) {
    return '$first está activada';
  }

  @override
  String securityHeadlineTwo(String first, String second) {
    return '$first y $second están activadas';
  }

  @override
  String get securityHeadlineAll => 'Las tres protecciones están activadas';

  @override
  String get securityTransfersTitle => 'Lo que ha salido de este dispositivo';

  @override
  String get securityTransfersNoProvider =>
      'No hay ningún proveedor de IA conectado, así que no se está enviando nada para analizar.';

  @override
  String get securityTransfersDescription =>
      'Se anota aquí en el momento en que algo se envía, haya vuelto o no. Solo la herramienta, el proveedor y el tamaño — nunca lo que había dentro. Se conserva 90 días en este dispositivo y no se envía a ningún sitio.';

  @override
  String get securityClear => 'Borrar';

  @override
  String get securityNothingSent => 'No se ha enviado nada';

  @override
  String get securityNothingSentDescription =>
      'Cuando uses una herramienta que emplee tu proveedor de IA, aparecerá aquí.';

  @override
  String get securityClearHistoryTitle => '¿Borrar este historial?';

  @override
  String get securityClearHistoryBody =>
      'El registro de lo que se envió se eliminará de este dispositivo. No deshace nada de lo que ya se envió.';

  @override
  String get securityUnnamedTool => 'Una herramienta de Intelligence';

  @override
  String get securityYourProvider => 'tu proveedor de IA';

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
      other: '$count archivos',
      one: '1 archivo',
    );
    return '$_temp0';
  }

  @override
  String get securityTransferShortText => 'un texto corto';

  @override
  String securityTransferCharacters(int count) {
    return '$count mil caracteres';
  }

  @override
  String securitySentTo(String provider) {
    return 'Enviado a $provider.';
  }

  @override
  String securitySentToWithSize(String provider, String size) {
    return 'Enviado a $provider · $size.';
  }

  @override
  String relativeWeeks(int count) {
    return 'hace $count sem.';
  }

  @override
  String get helpTitle => 'Ayuda';

  @override
  String get helpAddQuestion => '¿Qué puedo añadir?';

  @override
  String get helpAddAnswer =>
      'Una captura de pantalla, una foto de una carta o una factura, o texto que pegues. Va mejor cualquier cosa con una fecha, un importe o una petición.';

  @override
  String get helpReviewQuestion => '¿Por qué Action me pide revisar?';

  @override
  String get helpReviewAnswer =>
      'Porque una máquina que lee un documento puede leerlo mal, y una fecha límite equivocada en silencio es peor que no tener ninguna. Action muestra lo que encontró y las palabras de las que salió, y no se guarda nada hasta que tú lo confirmas.';

  @override
  String get helpVaryQuestion =>
      '¿Por qué cambian los resultados si lo intento otra vez?';

  @override
  String get helpVaryAnswer =>
      'El servicio que lee tu documento no es determinista, así que la misma captura puede volver algo distinta. Por eso también existe el paso de revisión — tú eres la parte que no cambia.';

  @override
  String get helpLateQuestion => '¿Por qué llegó tarde mi recordatorio?';

  @override
  String get helpLateAnswer =>
      'Los recordatorios se programan con Android, y Android decide exactamente cuándo entregarlos. El ahorro de batería, Doze y los ajustes de energía del fabricante pueden retrasar cualquiera. Action nunca promete un recordatorio al minuto.';

  @override
  String get helpDataQuestion => '¿Dónde están mis datos?';

  @override
  String get helpDataAnswer =>
      'Casi todo está en este dispositivo: tus capturas, tareas, pasos, recordatorios y búsquedas. Dos excepciones — el contenido que pides que Action lea se envía al servicio de IA que lo lee, y un registro breve de una tarea confirmada puede guardarse en la nube bajo un identificador anónimo. Privacidad y datos, en Ajustes, detalla exactamente qué contiene ese registro.';

  @override
  String get helpBackupQuestion => '¿Esto es una copia de seguridad?';

  @override
  String get helpBackupAnswer =>
      'No. El registro en la nube no se puede restaurar en un dispositivo nuevo, y no hay ninguna cuenta con la que iniciar sesión. Si desinstalas Action o pierdes este dispositivo, los datos que había se pierden.';

  @override
  String get helpCorrectQuestion => '¿Cómo corrijo una tarea?';

  @override
  String get helpCorrectAnswer =>
      'Ábrela y edita cualquier campo — el título, la fecha límite, el importe o el siguiente paso sugerido. Puedes añadir, reordenar, completar y eliminar pasos cuando quieras. Editar una tarea nunca pregunta nada al servicio de IA.';

  @override
  String get privacyTitle => 'Privacidad y datos';

  @override
  String get privacyIntro =>
      'Action mantiene en este dispositivo todo lo que puede. Dos cosas son excepciones, y las dos están listadas abajo.';

  @override
  String get privacyGroupOnDevice => 'En este dispositivo';

  @override
  String get privacyOnDeviceCaptures =>
      'Capturas — las capturas de pantalla, fotos y textos que añades, y el texto leído de ellos.';

  @override
  String get privacyOnDeviceActions =>
      'Tareas, con sus pasos, datos y recordatorios.';

  @override
  String get privacyOnDeviceSearch =>
      'Búsqueda. Tus búsquedas se ejecutan aquí, nunca se envían a ningún sitio, y no se conservan después de cerrar la pantalla.';

  @override
  String get privacyOnDevicePhotoMetadata =>
      'Las fotos se guardan sin su ubicación. Las coordenadas, la hora y los datos de la cámara que un teléfono escribe dentro de una imagen se eliminan antes de guardar la captura, así que no se conservan aquí ni van incluidos cuando envías una captura a tu proveedor de IA.';

  @override
  String get privacyGroupSentToRead => 'Enviado para ser leído';

  @override
  String get privacySentToReadWhat =>
      'Cuando pides a Action que interprete una captura, ese contenido se envía al servicio de IA que lo lee. Esto no es IA en el dispositivo.';

  @override
  String get privacySentToReadWhen =>
      'Se envía solo la captura que elegiste, y solo cuando lo pides.';

  @override
  String get privacyGroupYourProvider => 'Enviado a tu propio proveedor de IA';

  @override
  String get privacyProviderWhat =>
      'Si conectas un proveedor de IA en Ajustes, las herramientas de Intelligence envían el contenido que selecciones a ese proveedor — OpenAI, Anthropic, Google o un endpoint que hayas elegido — usando tu propia clave API.';

  @override
  String get privacyProviderDirect =>
      'Va directamente a ellos. No pasa por ningún servidor que pertenezca a Action.';

  @override
  String get privacyProviderScope =>
      'Solo se envía lo que eliges para una herramienta, y solo cuando la ejecutas. Tus otras tareas, capturas y fuentes nunca se incluyen, y nunca se envía nada en segundo plano.';

  @override
  String get privacyProviderKey =>
      'Tu clave API se guarda en el almacenamiento seguro de este dispositivo y solo se envía al proveedor al que pertenece. El almacenamiento seguro es un obstáculo real para quien tenga tu dispositivo desbloqueado, pero no es absoluto, y Action no dirá lo contrario.';

  @override
  String get privacyProviderLocalTools =>
      'Algunas herramientas no envían nunca nada: ocultar datos sensibles, comprobar de dónde viene un archivo, encontrar credenciales y revisar un enlace funcionan enteramente en este dispositivo.';

  @override
  String get privacyProviderAgreement =>
      'Lo que tu proveedor haga con lo que envías se rige por tu acuerdo con él, no por Action.';

  @override
  String get privacyGroupCloud => 'Guardado en la nube';

  @override
  String get privacyCloudWhat =>
      'Cuando confirmas una tarea, puede guardarse un registro breve de ella bajo un identificador anónimo de esta instalación: su título, estado, urgencia, categoría, fecha límite, importe, siguiente paso sugerido y marcas de tiempo.';

  @override
  String get privacyCloudNotSent =>
      'Tus capturas, el texto leído de ellas, los pasos y datos de una tarea, y tus recordatorios no se envían.';

  @override
  String get privacyCloudNotBackup =>
      'Esto no es una copia de seguridad. No hay forma de restaurarlo en un dispositivo nuevo, y perder esta instalación se lleva consigo el identificador anónimo.';

  @override
  String get privacyGroupDiagnostics => 'Diagnóstico';

  @override
  String get privacyDiagnosticsWhat =>
      'Action registra recuentos anónimos de lo que ocurre en la app — que se empezó una captura, que una extracción funcionó o no, que una búsqueda no encontró nada, que se completó una tarea.';

  @override
  String get privacyDiagnosticsCounts =>
      'Son recuentos, no contenidos. Nunca se incluye ningún título, importe, fecha límite, referencia, texto capturado ni término de búsqueda, y tampoco el identificador anónimo ni ningún identificador de una tarea o una captura.';

  @override
  String get privacyDiagnosticsCrash =>
      'Si la app se cierra de forma inesperada, se informa del error y de dónde ocurrió para poder arreglarlo. Action no adjunta tus datos a esos informes.';

  @override
  String get privacySectionYourData => 'Tus datos';

  @override
  String get privacyYourDataFootnote =>
      'Borrar las capturas deja tus tareas donde están. Una tarea cuya captura ya no está sigue funcionando; simplemente ya no muestra de dónde salió.';

  @override
  String get privacyClearCaptures => 'Borrar capturas';

  @override
  String get privacyClearCapturesDescription =>
      'Elimina todas las capturas y sus archivos de imagen.';

  @override
  String get privacyDeleteAll => 'Eliminar todos mis datos';

  @override
  String get privacyDeleteAllDescription =>
      'Tareas, pasos, recordatorios, capturas y los registros en la nube de arriba.';

  @override
  String get privacyClearCapturesTitle => '¿Borrar las capturas?';

  @override
  String get privacyClearCapturesBody =>
      'Todas las capturas y sus imágenes se eliminarán de este dispositivo. Tus tareas se quedan exactamente como están.';

  @override
  String get privacyCapturesDeleted => 'Capturas eliminadas.';

  @override
  String get privacyCapturesPartlyDeleted =>
      'Algunas capturas no se pudieron eliminar. No se cambió nada más.';

  @override
  String get privacyDeleteAllTitle => '¿Eliminar todos tus datos?';

  @override
  String get privacyDeleteAllBody =>
      'Esto elimina todas las tareas, pasos, recordatorios y capturas de este dispositivo, y los registros en la nube listados arriba. No se puede deshacer, y no hay copia de seguridad desde la que restaurar.';

  @override
  String get privacyDeleteEverything => 'Eliminar todo';

  @override
  String get privacyDeletedAll => 'Se ha eliminado todo.';

  @override
  String get privacyDeleteFailed => 'No se pudieron eliminar tus datos.';

  @override
  String get privacyDeletedUnverified =>
      'Todo lo de este dispositivo se ha eliminado. Action no pudo llegar a la nube para confirmar que allí no queda nada, y volverá a comprobarlo.';

  @override
  String privacyDeletedApartFrom(String leftovers) {
    return 'Eliminado, salvo $leftovers.';
  }

  @override
  String get privacyWillTryAgain => 'Action lo intentará de nuevo.';

  @override
  String get privacyCloudCheckIncomplete =>
      'Action no pudo terminar de comprobar la nube, y lo intentará de nuevo.';

  @override
  String get privacyLeftoverCaptures => 'algunas capturas';

  @override
  String privacyLeftoverCloudRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros en la nube',
      one: '1 registro en la nube',
    );
    return '$_temp0';
  }

  @override
  String privacyLeftoverJoin(String first, String second) {
    return '$first y $second';
  }

  @override
  String get privacyCloudDeleted =>
      'Los registros en la nube se han eliminado.';

  @override
  String get privacyCloudUnreachable =>
      'Sigue sin poder alcanzarlos. Action lo intentará de nuevo.';

  @override
  String get privacyPendingTitle => 'Pendiente de eliminar';

  @override
  String privacyPendingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'No se pudieron alcanzar $count registros en la nube la última vez. Action lo intentará por su cuenta, o puedes reintentarlo ahora.',
      one: 'No se pudo alcanzar 1 registro en la nube la última vez. Action lo intentará por su cuenta, o puedes reintentarlo ahora.',
    );
    return '$_temp0';
  }

  @override
  String get privacyTryAgain => 'Reintentar';

  @override
  String get evidenceTitle => 'De dónde salió esto';

  @override
  String get evidenceUnverified =>
      'Action no ha encontrado estas palabras en el texto que leyó, así que este valor no se ha comprobado. Compáralo con el original antes de fiarte de él.';

  @override
  String get evidenceHighlighted =>
      'Estas palabras aparecían en el texto que Action leyó de esta captura, y el resaltado muestra dónde.';

  @override
  String get evidenceNoRegion =>
      'Estas palabras aparecían en el texto que Action leyó de esta captura. No ha podido determinar en qué punto exacto de la imagen están, y no lo adivina.';

  @override
  String get evidenceInText =>
      'Estas palabras aparecían en el texto que contiene esta captura.';

  @override
  String get sourceCapturedAtFormat => 'd MMM, HH:mm';

  @override
  String get urgencyCritical => 'Crítica';

  @override
  String get urgencyImportant => 'Importante';

  @override
  String get urgencyNormal => 'Normal';

  @override
  String get urgencyLow => 'Baja';

  @override
  String get urgencyUnsure => 'No está claro';

  @override
  String get detailSaveFailed =>
      'No se pudo guardar. No se ha perdido nada — inténtalo otra vez.';

  @override
  String get detailSectionCreatedFrom => 'Creada a partir de';

  @override
  String get detailSourceChecking => 'Buscando la captura original…';

  @override
  String get detailSourceUnavailable =>
      'La captura original ya no está disponible.';

  @override
  String get detailReopenAction => 'Reabrir la tarea';

  @override
  String get detailMarkActionComplete => 'Marcar la tarea como completada';

  @override
  String get detailGetHelp => 'Consigue ayuda con esto';

  @override
  String get detailSectionHistory => 'Historial';

  @override
  String get detailHistoryShowLess => 'Ver menos';

  @override
  String detailHistoryShowAll(int count) {
    return 'Ver las $count entradas';
  }

  @override
  String get detailHistoryCreated => 'Creada';

  @override
  String detailHistoryCreatedWithSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Creada con $count pasos',
      one: 'Creada con 1 paso',
    );
    return '$_temp0';
  }

  @override
  String get detailHistoryReviewed => 'Confirmaste los datos';

  @override
  String detailHistoryStepFinished(String title) {
    return 'Terminaste «$title»';
  }

  @override
  String get detailHistoryAStep => 'un paso';

  @override
  String get detailHistoryReminderSet => 'Fijaste un recordatorio';

  @override
  String detailHistoryReminderSetFor(String when) {
    return 'Fijaste un recordatorio para el $when';
  }

  @override
  String get detailHistoryCompleted => 'Marcada como hecha';

  @override
  String get detailHistoryChanged => 'Último cambio';

  @override
  String get detailHistoryTimestampFormat => 'd MMM yyyy, HH:mm';

  @override
  String get aiProviderCustom => 'Personalizado (compatible con OpenAI)';

  @override
  String get aiCapabilityText => 'texto';

  @override
  String get aiCapabilityImages => 'imágenes';

  @override
  String get aiCapabilityDocuments => 'documentos';

  @override
  String get aiCapabilityStructuredResults => 'resultados estructurados';

  @override
  String get aiCapabilityStreaming => 'respuestas progresivas';

  @override
  String get aiCapabilitySystemInstructions => 'instrucciones del sistema';

  @override
  String get aiCapabilityEvidenceCitations => 'citas de evidencia';

  @override
  String get aiCapabilityLongDocuments => 'documentos largos';

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
      'Conecta un proveedor de IA para usar esta herramienta.';

  @override
  String get aiFailureInvalidKey => 'El proveedor no aceptó esa clave API.';

  @override
  String get aiFailureQuotaExceeded =>
      'Tu cuenta del proveedor se ha quedado sin crédito o ha alcanzado su cuota.';

  @override
  String get aiFailureRateLimited =>
      'Tu proveedor está limitando la frecuencia de las peticiones. Inténtalo de nuevo dentro de un momento.';

  @override
  String get aiFailureNetworkUnavailable =>
      'Action no pudo llegar a tu proveedor de IA. Comprueba tu conexión.';

  @override
  String get aiFailureUnsupportedModel =>
      'Ese modelo no está disponible para tu clave. Elige otro en Ajustes.';

  @override
  String aiFailureUnsupportedCapability(String capabilities) {
    return 'El modelo que elegiste no puede leer $capabilities. Elige otro modelo en Ajustes.';
  }

  @override
  String get aiFailureContextTooLarge =>
      'Eso era demasiado contenido para que este modelo lo leyera de una vez.';

  @override
  String get aiFailureInputTooLargeText =>
      'Eso es más texto del que se puede analizar de una vez.';

  @override
  String get aiFailureProviderUnavailable =>
      'Tu proveedor de IA está teniendo problemas. Inténtalo de nuevo dentro de un momento.';

  @override
  String get aiFailureMalformedResponse =>
      'Ese proveedor devolvió algo que Action no pudo leer.';

  @override
  String get aiFailureCancelled => 'Detenido.';

  @override
  String get aiFailureInsecureEndpoint =>
      'Ese endpoint tiene que ser una dirección https://.';

  @override
  String get aiFailureUnknown =>
      'Algo salió mal al hablar con tu proveedor de IA.';

  @override
  String get appLockTitle => 'Action está bloqueada';

  @override
  String get appLockPrompt =>
      'Confirma que eres tú para continuar. Action se lo pide a tu dispositivo — nunca ve tu huella, tu cara ni tu PIN.';

  @override
  String get appLockUnlocking => 'Desbloqueando…';

  @override
  String get appLockNotConfirmed =>
      'No se confirmó. Vuelve a intentarlo cuando quieras.';

  @override
  String get appLockCannotConfirm =>
      'Tu dispositivo no puede confirmar que eres tú ahora mismo. Comprueba que sigue habiendo un bloqueo de pantalla configurado en los ajustes del dispositivo.';

  @override
  String get appLockWaiting => 'Esperando…';

  @override
  String get appLockUnlock => 'Desbloquear';

  @override
  String get appLockReasonUnlock => 'Desbloquear Action';

  @override
  String get appLockReasonEnable =>
      'Confirma que eres tú antes de activar el bloqueo de la app';

  @override
  String get appLockReasonDisable =>
      'Confirma que eres tú antes de desactivar el bloqueo de la app';

  @override
  String get todayCapabilityHeading => 'De qué se ocupa Action';

  @override
  String get todayCapabilityDocumentTitle => 'Una carta o una factura';

  @override
  String get todayCapabilityDocumentBlurb =>
      'Action la lee y encuentra la fecha límite, el importe y la referencia.';

  @override
  String get todayCapabilityScreenshotTitle => 'Una captura de pantalla';

  @override
  String get todayCapabilityScreenshotBlurb =>
      'Convierte un mensaje que de otro modo olvidarías en algo sobre lo que puedes actuar.';

  @override
  String get todayCapabilityTextTitle => 'Un texto';

  @override
  String get todayCapabilityTextBlurb =>
      'Pega lo que sea. Action averigua qué es y qué te pide.';

  @override
  String get todayCapabilityConfirmTitle => 'Tú confirmas todo';

  @override
  String get todayCapabilityConfirmBlurb =>
      'Nada se convierte en una tarea hasta que has visto la evidencia y has dicho que sí.';

  @override
  String get todayCapabilityExploreIntelligence => 'Explorar Inteligencia';

  @override
  String get documentRejectedEmpty => 'Ese archivo está vacío.';

  @override
  String documentRejectedTooLarge(String size) {
    return 'Ese documento ocupa $size, que es más de lo que Action puede manejar.';
  }

  @override
  String get documentRejectedNotAPdf =>
      'Eso no es un PDF, se llame como se llame. Action lee PDF e imágenes.';

  @override
  String get documentRejectedUnreadable => 'No se pudo leer ese documento.';

  @override
  String get pdfRejectedNotAPdf =>
      'Ese archivo no es un PDF, se llame como se llame.';

  @override
  String get pdfRejectedEncrypted =>
      'Ese PDF está protegido con contraseña, así que Action no puede leerlo.';

  @override
  String get pdfRejectedDamaged =>
      'No se pudo leer ese PDF. Puede que esté incompleto.';

  @override
  String get shareRejectedEmpty =>
      'En lo que se compartió no había nada que leer.';

  @override
  String get shareRejectedUnsupportedType =>
      'Action acepta texto, imágenes y PDF. Eso era otra cosa.';

  @override
  String get shareRejectedContentMismatch =>
      'Ese archivo no es del tipo que dice ser, así que Action no lo ha abierto.';

  @override
  String get shareRejectedTooLarge =>
      'Ese archivo es demasiado grande para que Action pueda manejarlo.';

  @override
  String get shareRejectedUnreadable => 'No se pudo leer ese archivo.';

  @override
  String get captureFailureRecognition =>
      'El reconocimiento de texto no se pudo ejecutar.';

  @override
  String get captureFailureImageFormat =>
      'Ese formato de imagen no se pudo leer en este dispositivo.';

  @override
  String get connectSheetTitle => 'Conecta tu IA';

  @override
  String get connectSheetSubtitle =>
      'Usas tu propia cuenta de proveedor y tu propia clave API. Action guarda la clave en el almacenamiento seguro de este dispositivo.';

  @override
  String get connectErrorKeyMissing => 'Pega tu clave API para continuar.';

  @override
  String get connectErrorModelMissing =>
      'Elige un modelo o escribe un id de modelo.';

  @override
  String get connectErrorEndpointMissing =>
      'Añade la dirección de tu endpoint.';

  @override
  String get connectErrorSecureStorageUnavailable =>
      'No se pudo abrir el almacenamiento seguro de este dispositivo, así que la clave no se guardó.';

  @override
  String get connectTestSucceeded => 'Conectado.';

  @override
  String connectTestSucceededWithModels(int count) {
    return 'Conectado. $count modelos disponibles.';
  }

  @override
  String get connectProviderLabel => 'Proveedor';

  @override
  String get connectEndpointLabel => 'Endpoint';

  @override
  String get connectEndpointHttpsNote =>
      'Tiene que ser una dirección https://. Action no enviará tus documentos por una conexión sin cifrar.';

  @override
  String get connectApiKeyLabel => 'Clave API';

  @override
  String get connectApiKeyHint => 'Pega tu clave';

  @override
  String get connectKeyPrivacyNote =>
      'Tu clave se queda en este dispositivo. Action nunca la envía a ningún sitio salvo al proveedor que elegiste, y no puede volver a mostrártela después de guardarla.';

  @override
  String get connectModelLabel => 'Modelo';

  @override
  String get connectModelIdHint => 'Id del modelo';

  @override
  String get connectModelFreeTextNote =>
      'Los proveedores retiran ids de modelo y añaden otros nuevos. Si el que quieres no está en la lista, escríbelo aquí.';

  @override
  String get connectAndTest => 'Conectar y probar';

  @override
  String get connectSaveWithoutTesting => 'Guardar sin probar';

  @override
  String get toolWarningFactsNotChecked =>
      'Action no pudo comparar esto con el texto original, así que los importes y las fechas que contiene no se han comprobado.';

  @override
  String get toolTitleRewrite => 'Mejorar este texto';

  @override
  String get toolDescriptionRewrite =>
      'Más claro, más corto o más formal — los datos se mantienen intactos.';

  @override
  String get toolModeRewriteClearer => 'Más claro';

  @override
  String get toolModeRewriteProfessional => 'Más profesional';

  @override
  String get toolModeRewriteShorter => 'Más corto';

  @override
  String get toolModeRewritePersuasive => 'Más persuasivo';

  @override
  String get toolModeRewriteSimpler => 'Más sencillo';

  @override
  String get toolModeRewriteStructured => 'Más estructurado';

  @override
  String get toolModeRewriteGrammarOnly => 'Solo la gramática';

  @override
  String get toolSectionWhatChanged => 'Qué ha cambiado';

  @override
  String get toolSectionNote => 'Nota';

  @override
  String get toolSectionAlreadyClearBody =>
      'Esto ya estaba claro. Los cambios de abajo son menores.';

  @override
  String get toolSectionImprovedText => 'Texto mejorado';

  @override
  String get toolTitleDraftReply => 'Redactar una respuesta';

  @override
  String get toolDescriptionDraftReply =>
      'Una respuesta que puedes editar y enviar tú.';

  @override
  String get toolModeReplyProfessional => 'Profesional';

  @override
  String get toolModeReplyConcise => 'Concisa';

  @override
  String get toolModeReplyFriendly => 'Amable';

  @override
  String get toolModeReplyFormal => 'Formal';

  @override
  String get toolModeReplyClarification => 'Pedir una aclaración';

  @override
  String get toolModeReplyConfirmation => 'Acusar recibo';

  @override
  String get toolModeReplyDispute => 'Rebatir esto';

  @override
  String get toolSectionSubject => 'Asunto';

  @override
  String get toolSectionDraftReply => 'Borrador de respuesta';

  @override
  String get toolSectionPlaceholders => 'Tienes que rellenar estos huecos';

  @override
  String toolSectionDraftWithSubject(String subject) {
    return 'Borrador — $subject';
  }

  @override
  String get toolWarningDraftNotSent =>
      'Esto es un borrador. Action no envía nada — léelo, edítalo y envíalo tú.';

  @override
  String get toolTitleTranslate => 'Traducir';

  @override
  String get toolDescriptionTranslate =>
      'Otro idioma, con los números y los nombres intactos.';

  @override
  String get toolSectionTranslation => 'Traducción';

  @override
  String toolSectionTranslationFromTo(String from, String to) {
    return 'De $from a $to';
  }

  @override
  String get toolSectionKeptInOriginal => 'Sin traducir, como en el original';

  @override
  String get toolWarningTranslationNotCertified =>
      'Una traducción para entender el contenido, no una traducción jurada.';

  @override
  String get toolTitleStructuredData => 'Extraer una tabla';

  @override
  String get toolDescriptionStructuredData =>
      'Filas, campos y cifras que puedes copiar.';

  @override
  String get toolSectionTable => 'Tabla';

  @override
  String get toolSectionFields => 'Campos';

  @override
  String get toolSectionTableCsv => 'Tabla (CSV)';

  @override
  String get toolWarningTableLayoutUncertain =>
      'La disposición de las columnas de esta tabla no se pudo leer con fiabilidad. Comprueba que las filas cuadran antes de usarlas.';

  @override
  String get toolTitleDeadlineFinder => 'Encontrar fechas límite';

  @override
  String get toolDescriptionDeadlineFinder =>
      'Qué vence, cuándo, y qué pasa si no se cumple.';

  @override
  String toolSectionDeadlineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fechas límite',
      one: '1 fecha límite',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionNothingDue => 'Nada que venza';

  @override
  String get toolSectionNothingDueBody =>
      'Action no ha encontrado fechas límite ni obligaciones en este material.';

  @override
  String get toolWarningNothingScheduledAutomatically =>
      'No se programa nada hasta que tú lo eliges. Los recordatorios nunca se ponen automáticamente.';

  @override
  String toolLabelDeadlineConsequence(String consequence) {
    return 'Si no: $consequence';
  }

  @override
  String toolLabelDeadlineRequiredItems(String items) {
    return 'Necesitas: $items';
  }

  @override
  String get moneyErrorEmpty => 'no se ha indicado ningún importe';

  @override
  String get moneyErrorMalformed => 'el importe no es un número simple';

  @override
  String get moneyErrorNegative =>
      'un importe negativo no es una cantidad que se pueda pagar';

  @override
  String get moneyErrorTooManyDecimals =>
      'más decimales de los que tiene esa moneda';

  @override
  String get moneyErrorUnsupportedCurrency =>
      'el código de moneda no es uno de los que reconocemos';

  @override
  String get moneyErrorOutOfRange =>
      'el importe es tan grande que no parece verosímil';

  @override
  String get escalationOcrFailed =>
      'El reconocimiento no llegó a ejecutarse en esta captura.';

  @override
  String get escalationNoTextRecognised =>
      'Esto parece un documento, pero no se reconoció ningún texto.';

  @override
  String get escalationThinText =>
      'Se reconoció muchísimo menos texto del que cabría esperar en un documento de este tamaño.';

  @override
  String get escalationLowLineConfidence =>
      'El reconocedor informó de confianza baja en varias líneas.';

  @override
  String get escalationTableLikeLayout =>
      'La disposición parece una tabla, y leerla línea a línea pierde qué valor pertenece a cada fila.';

  @override
  String get escalationFragmentedLayout =>
      'El texto volvió en muchos fragmentos diminutos, así que la estructura no queda clara.';

  @override
  String get escalationMalformedText =>
      'Buena parte del texto reconocido no son palabras ni números legibles.';

  @override
  String get escalationConflictingDates =>
      'Hay más de una fecha presentada como fecha límite.';

  @override
  String get escalationConflictingAmounts =>
      'Hay más de un importe presentado como la cantidad que se debe.';

  @override
  String get escalationUnresolvedGrounding =>
      'Algunos valores no se han podido rastrear hasta el texto del documento.';

  @override
  String get escalationInstructionLikeContent =>
      'El documento contiene texto escrito como si fueran instrucciones para la app. Se trata como contenido del documento, nunca como instrucciones.';

  @override
  String get providerFailureNetwork =>
      'Action no pudo llegar al servicio. Comprueba tu conexión.';

  @override
  String get providerFailureTimedOut =>
      'El servicio tardó demasiado en responder.';

  @override
  String get providerFailureServiceUnavailable =>
      'El servicio no está disponible temporalmente. Inténtalo más tarde.';

  @override
  String get providerFailureUnauthorized =>
      'Esta app no está autorizada a usar el servicio ahora mismo.';

  @override
  String get providerFailureBlocked =>
      'El servicio se negó a procesar este documento.';

  @override
  String get providerFailureUnknown =>
      'Action no pudo leer este documento. Puede que intentarlo de nuevo funcione.';

  @override
  String get reviewBlockerTitle => 'Ponle un título a esta tarea.';

  @override
  String get reviewBlockerDate =>
      'Elige qué fecha es la fecha límite de verdad, o déjala sin definir.';

  @override
  String get reviewBlockerAmount =>
      'Elige qué importe es el correcto, o déjalo sin definir.';

  @override
  String get reviewBlockerStepTitle =>
      'Los pasos que conserves necesitan un título.';

  @override
  String citationPage(int page) {
    String _temp0 = intl.Intl.pluralLogic(
      page,
      locale: localeName,
      other: 'página $page',
      one: 'página 1',
    );
    return '$_temp0';
  }

  @override
  String citationPageRange(int start, int end) {
    return 'páginas $start–$end';
  }

  @override
  String rewriteDroppedFacts(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'El texto reescrito ya no contiene $values. Compruébalo antes de usarlo.',
      one:
          'El texto reescrito ya no contiene $values. Compruébalo antes de usarlo.',
    );
    return '$_temp0';
  }

  @override
  String rewriteDroppedFactsMore(int count, String values) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'El texto reescrito ya no contiene $values ni $count valores más. Compruébalo antes de usarlo.',
      one:
          'El texto reescrito ya no contiene $values ni 1 valor más. Compruébalo antes de usarlo.',
    );
    return '$_temp0';
  }

  @override
  String get listSeparator => ', ';

  @override
  String get goalStatusReached => 'Alcanzado';

  @override
  String get goalNewSheetTitle => '¿Qué quieres que ocurra?';

  @override
  String get goalNewSheetSubtitle =>
      'Con una frase basta. Los detalles puedes añadirlos después.';

  @override
  String get goalTitleHint => 'Renovar el seguro del coche sin pagar de más.';

  @override
  String get goalCreateAction => 'Crear objetivo';

  @override
  String get goalTitleSheetTitle => 'Lo que quieres';

  @override
  String get goalOutcomeSheetTitle => 'Qué cuenta como hecho';

  @override
  String get goalContextSheetTitle => 'En qué punto está';

  @override
  String get goalOutcomeHint =>
      'El coche está asegurado y el papeleo está presentado.';

  @override
  String get goalContextHint =>
      'Tengo dos presupuestos y la renovación es el día 18.';

  @override
  String get goalWorkspaceTitle => 'Objetivo';

  @override
  String get goalUnmarkReached => 'No alcanzado, después de todo';

  @override
  String get goalMarkReached => 'Marcar como alcanzado';

  @override
  String get goalNotFound => 'Ese objetivo ya no está aquí.';

  @override
  String get goalDeleteTitle => '¿Eliminar este objetivo?';

  @override
  String get goalDeleteBody =>
      'El objetivo se quita de este dispositivo. Las tareas hechas a partir de él se quedan exactamente como están.';

  @override
  String get goalOutcomeLabel => 'Cómo se verá terminado';

  @override
  String get goalOutcomeEmpty =>
      'Todavía sin escribir. Un objetivo es más fácil de planificar cuando has dicho qué significa terminarlo.';

  @override
  String get goalContextLabel => 'En qué punto está';

  @override
  String get goalContextEmpty =>
      'Todavía no hay nada escrito. Qué ha pasado hasta ahora y qué se interpone.';

  @override
  String get goalTitleLabel => 'Qué quieres';

  @override
  String get goalEditTooltip => 'Editar el objetivo';

  @override
  String get goalToolsLabel => 'Lo que Action puede hacer';

  @override
  String get goalToolsNotReady =>
      'Escribe un poco más sobre lo que quieres y estas herramientas tendrán algo con lo que trabajar.';

  @override
  String get toolGoalOptimizerTitle => 'Mejorar un objetivo';

  @override
  String get toolActionPlanTitle => 'Armar un plan';

  @override
  String get resultFactUnconfirmed => 'Sin confirmar';

  @override
  String get resultSuggestedSteps => 'Pasos sugeridos';

  @override
  String get resultSuggestedAction => 'Tarea sugerida';

  @override
  String get resultWorthAsking => 'Vale la pena preguntar';

  @override
  String get resultSuggestedDeadlines => 'Fechas límite sugeridas';

  @override
  String get resultSuggestions => 'Sugerencias';

  @override
  String resultSupportingQuotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count citas de apoyo',
      one: '1 cita de apoyo',
    );
    return '$_temp0';
  }

  @override
  String get resultEvidenceFromSelectedSource => 'De la fuente seleccionada';

  @override
  String resultEvidenceLocation(String source, String page) {
    return '$source, $page';
  }

  @override
  String get toolRunStagePreparing => 'Preparando tu documento';

  @override
  String get toolRunStageReading => 'Leyendo las páginas seleccionadas';

  @override
  String get toolRunStageAnalysing => 'Analizando';

  @override
  String get toolRunStageBuilding => 'Armando tu revisión';

  @override
  String get toolRunStageDone => 'Terminado';

  @override
  String get toolRunStageFailed => 'Esto no llegó a terminar';

  @override
  String get toolRunStageCancelled => 'Detenido';

  @override
  String get toolRunFailureLocalCheckFailed => 'Esto no se pudo comprobar.';

  @override
  String get toolRunFailureProviderRetired =>
      'Ese proveedor de IA ya no está disponible en esta versión.';

  @override
  String get toolRunFailureUnusableReply =>
      'Esa respuesta no llegó en una forma utilizable. Inténtalo otra vez.';

  @override
  String get toolRunFailureQuestionRequired => 'Escribe primero una pregunta.';

  @override
  String get toolRunFailureInputRequired =>
      'Elige algo sobre lo que trabaje esta herramienta.';

  @override
  String get toolWarningReplyTruncated =>
      'Esta respuesta se cortó antes de terminar, así que puede estar incompleta.';

  @override
  String get toolWarningNoSupportingQuotes =>
      'Tu modelo no devolvió ninguna cita de apoyo, así que nada de lo que hay aquí tiene respaldo. Compáralo con el documento antes de actuar en consecuencia.';

  @override
  String get aiSettingsRemoveTitle => '¿Quitar esta conexión?';

  @override
  String get aiSettingsRemoveBody =>
      'Action eliminará tu clave API de este dispositivo y dejará de usar las funciones de IA. Tu cuenta en el proveedor no se ve afectada.';

  @override
  String get aiSettingsProviderLabel => 'Proveedor';

  @override
  String get aiSettingsProviderFootnoteConnected =>
      'Tu proveedor te cobra por lo que uses. Action nunca hace una petición por su cuenta.';

  @override
  String get aiSettingsConnectLabel => 'Conectar un proveedor de IA';

  @override
  String get aiSettingsConnectDescription =>
      'Usa tu propia cuenta y tu propia clave API con OpenAI, Anthropic, Google Gemini o un endpoint compatible.';

  @override
  String get aiSettingsModelLabel => 'Modelo';

  @override
  String get aiSettingsEndpointLabel => 'Endpoint';

  @override
  String get aiSettingsApiKeyLabel => 'Clave API';

  @override
  String get aiSettingsKeyStored =>
      'Guardada en el almacenamiento seguro de este dispositivo.';

  @override
  String get aiSettingsKeyMissing =>
      'No se ha encontrado ninguna clave en este dispositivo. Vuelve a conectar para añadir una.';

  @override
  String get aiSettingsTestLabel => 'Probar la conexión';

  @override
  String get aiSettingsProviderUnavailable =>
      'Ese proveedor no está disponible en esta versión.';

  @override
  String aiSettingsTestConnectedModels(int count) {
    return 'Conectado. Modelos disponibles: $count.';
  }

  @override
  String get aiSettingsTestButton => 'Probar';

  @override
  String get aiSettingsChangeProvider => 'Cambiar de proveedor o de modelo';

  @override
  String get aiSettingsRemoveKey => 'Quitar la clave';

  @override
  String get aiSettingsSectionPrivacy => 'Privacidad';

  @override
  String get aiSettingsWhatGetsSentLabel => 'Qué se envía';

  @override
  String get aiSettingsWhereItGoesLabel => 'Adónde va';

  @override
  String get aiSettingsWhereItGoesNoProvider =>
      'No se envía nada hasta que conectes un proveedor.';

  @override
  String aiSettingsWhereItGoesProvider(String provider) {
    return 'Directamente a $provider, usando tu clave. No pasa por los servidores de Action.';
  }

  @override
  String get aiSettingsSectionData => 'Datos';

  @override
  String get aiSettingsDataFootnote =>
      'Action recuerda qué herramientas usaste, nunca sobre qué las usaste.';

  @override
  String get aiSettingsRecentToolsLabel => 'Herramientas usadas recientemente';

  @override
  String get aiSettingsRecentToolsNone => 'Ninguna';

  @override
  String get reminderNotificationTitle => 'Recordatorio de Action';

  @override
  String get reminderNotificationPrivateBody => 'Tienes algo que revisar.';

  @override
  String get reminderChannelName => 'Recordatorios de Action';

  @override
  String get reminderChannelDescription =>
      'Recordatorios que tú mismo fijas para tus tareas.';

  @override
  String get onboardingStart => 'Empezar a usar Action';

  @override
  String onboardingProgressSemantics(int current, int total) {
    return 'Paso $current de $total';
  }

  @override
  String get onboardingCaptureTitle => 'Convierte la información en tareas';

  @override
  String get onboardingCaptureBody =>
      'Añade una captura de pantalla, una foto o un texto que te hayan enviado. Action lo lee y deduce qué te está pidiendo que hagas.';

  @override
  String get onboardingReviewTitle =>
      'No se guarda nada hasta que tú lo confirmas';

  @override
  String get onboardingReviewBody =>
      'Action te muestra lo que encontró y las palabras de las que salió. Tú corriges lo que esté mal. Hasta que lo confirmes, es una sugerencia — no es un dato, y no es una tarea.';

  @override
  String get onboardingTrackingTitle => 'No pierdas de vista lo que importa';

  @override
  String get onboardingTrackingBody =>
      'Requiere atención adelanta lo que está vencido o cerca. Cada tarea conserva su siguiente paso, su progreso y cualquier recordatorio que le hayas puesto.';

  @override
  String get onboardingPrivacyBody => 'Conviene saberlo antes de empezar:';

  @override
  String get onboardingPrivacyOnDevice =>
      'Tus tareas, capturas, recordatorios y búsquedas se guardan en este dispositivo. La búsqueda y los recordatorios funcionan sin conexión.';

  @override
  String get onboardingPrivacySentToRead =>
      'Cuando pides a Action que lea algo, ese contenido se envía al servicio de IA que lo interpreta.';

  @override
  String get onboardingPrivacyCloud =>
      'Un registro breve de una tarea confirmada — su título, sus fechas, su importe y el paso sugerido — puede guardarse en la nube bajo un identificador anónimo de este dispositivo. Tus capturas, tus pasos y tus recordatorios no.';

  @override
  String get onboardingPrivacyNotBackup =>
      'Ese registro no es una copia de seguridad. No puede restaurar nada en un dispositivo nuevo.';

  @override
  String toolSectionBlockerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obstáculos',
      one: '1 obstáculo',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCouldBeSimpler => 'Podría ser más simple';

  @override
  String get toolDescriptionGoalOptimizer =>
      'Qué falta, qué lo bloquea, qué hacer primero.';

  @override
  String toolSectionStepDependsOn(String step) {
    return 'Después de: $step';
  }

  @override
  String get toolSectionThePlan => 'El plan';

  @override
  String get toolDescriptionActionPlan =>
      'Un conjunto ordenado de pasos que puedes convertir en tareas.';

  @override
  String get toolTitleSmartChecklist => 'Hacer una lista de comprobación';

  @override
  String get toolDescriptionSmartChecklist =>
      'Todo lo que esto te pide, en orden.';

  @override
  String toolSectionMissingDetailCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count detalles que faltan',
      one: '1 detalle que falta',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionContradictions => 'Estos se contradicen entre sí';

  @override
  String get toolTitleMissingInformation => 'Qué falta';

  @override
  String get toolDescriptionMissingInformation =>
      'Los huecos, y qué preguntar sobre ellos.';

  @override
  String get aiAdapterTimedOut => 'Eso tardó demasiado y se detuvo.';

  @override
  String get aiAdapterSecureConnectionFailed =>
      'Falló la conexión segura con tu proveedor de IA.';

  @override
  String get aiAdapterModelOrEndpointNotFound =>
      'Action no ha podido encontrar ese modelo o ese endpoint.';

  @override
  String get aiAdapterRequestRejected =>
      'Tu proveedor de IA rechazó esa petición.';

  @override
  String get aiAdapterSecureStorageUnavailable =>
      'Action no ha podido abrir el almacenamiento seguro de este dispositivo.';

  @override
  String get aiAdapterEndpointMissing =>
      'Añade la dirección de tu endpoint de IA en Ajustes.';

  @override
  String get aiAdapterReplyIncomplete =>
      'Esa respuesta llegó incompleta. Inténtalo otra vez.';

  @override
  String get aiAdapterContentDeclined =>
      'Tu proveedor se negó a procesar ese contenido.';

  @override
  String aiAdapterTooManyAttachments(int limit) {
    return 'Eso es más de $limit archivos a la vez. Selecciona menos.';
  }

  @override
  String get aiAdapterImageTooLarge =>
      'Una de esas imágenes es demasiado grande para analizarla.';

  @override
  String aiAdapterDocumentTooLarge(String filename, int limit) {
    return '«$filename» es demasiado grande para analizarlo. El límite es de $limit MB.';
  }

  @override
  String aiAdapterDocumentTooManyPages(String filename, int count, int limit) {
    return '«$filename» tiene $count páginas. Action lee hasta $limit de una vez — elige un intervalo.';
  }

  @override
  String get aiAdapterSelectionTooLarge =>
      'Esa selección es demasiado grande para enviarla en una sola petición.';

  @override
  String get toolRunNotAvailableTitle => 'Esa herramienta no está disponible';

  @override
  String get toolRunNotAvailableMessage =>
      'Puede que se haya quitado en una versión más reciente de Action.';

  @override
  String get toolRunNoSourcesYet =>
      'Todavía no hay nada sobre lo que trabajar. Captura algo o pega un texto aquí abajo.';

  @override
  String get toolRunChooseSourcesToCompare => 'Elige qué comparar';

  @override
  String get toolRunChooseSource => 'Elige una fuente';

  @override
  String get toolRunQuestionLabel => 'Tu pregunta';

  @override
  String get toolRunQuestionHint => '¿Cuál es la fecha límite?';

  @override
  String get toolRunFreeTextLabel => 'O pega un texto';

  @override
  String get toolRunFreeTextHint => 'Pega o escribe aquí';

  @override
  String get toolRunModeLabel => 'Estilo';

  @override
  String get toolRunRunLocally => 'Comprobar en este dispositivo';

  @override
  String get toolRunRun => 'Ejecutar';

  @override
  String get toolRunStop => 'Detener';

  @override
  String get toolRunRunAgain => 'Ejecutar otra vez';

  @override
  String get toolRunWorkingOn => 'Trabajando en:';

  @override
  String toolRunFirstUseTitle(String provider) {
    return '¿Enviar esto a $provider?';
  }

  @override
  String toolRunFirstUseBody(String provider) {
    return 'El contenido que has seleccionado se enviará a $provider para procesarlo, usando tu clave API.';
  }

  @override
  String get toolRunFirstUseKeyStays =>
      'Tu clave se queda en este dispositivo. Action no envía nada en segundo plano, y no envía tus otras tareas ni tus fuentes.';

  @override
  String get toolRunScopeTitle => 'Antes de ejecutar esto';

  @override
  String toolRunScopePages(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se analizarán $count páginas con tu conexión de $provider.',
      one: 'Se analizará 1 página con tu conexión de $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeFiles(int count, String provider) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se analizarán $count archivos con tu conexión de $provider.',
      one: 'Se analizará 1 archivo con tu conexión de $provider.',
    );
    return '$_temp0';
  }

  @override
  String toolRunScopeText(String provider) {
    return 'El texto que has seleccionado se enviará a tu conexión de $provider.';
  }

  @override
  String get toolRunNeedsProviderTitle =>
      'Conecta un proveedor de IA para usar esta herramienta';

  @override
  String get toolRunNeedsProviderBody =>
      'Usas tu propia cuenta de proveedor y tu propia clave API.';

  @override
  String toolRunActionCreatedFromSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasos',
      one: '1 paso',
    );
    return 'Tarea creada a partir de $_temp0.';
  }

  @override
  String toolRunStepsAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasos añadidos.',
      one: '1 paso añadido.',
    );
    return '$_temp0';
  }

  @override
  String toolRunSaveCreateActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasos',
      one: '1 paso',
    );
    return 'Crear una tarea · $_temp0';
  }

  @override
  String toolRunSaveAddToActionWithCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasos',
      one: '1 paso',
    );
    return 'Añadir a esta tarea · $_temp0';
  }

  @override
  String get sourceTypeLabelPhoto => 'Foto';

  @override
  String get sourceTypeLabelScreenshot => 'Captura de pantalla';

  @override
  String get sourceTypeLabelPastedText => 'Nota pegada';

  @override
  String get sourceTypeLabelDocument => 'Documento';

  @override
  String get toolModeClearer => 'Más claro';

  @override
  String get toolModeMoreProfessional => 'Más profesional';

  @override
  String get toolModeShorter => 'Más corto';

  @override
  String get toolModeSimpler => 'Más simple';

  @override
  String get toolModeMoreStructured => 'Más estructurado';

  @override
  String get toolModeMorePersuasive => 'Más persuasivo';

  @override
  String get toolModeGrammarOnly => 'Solo la gramática';

  @override
  String get toolModeProfessional => 'Profesional';

  @override
  String get toolModeConcise => 'Conciso';

  @override
  String get toolModeFriendly => 'Cercano';

  @override
  String get toolModeFormal => 'Formal';

  @override
  String get toolModeAskForClarification => 'Pedir una aclaración';

  @override
  String get toolModeConfirm => 'Confirmar';

  @override
  String get toolModeDispute => 'Rebatir esto';

  @override
  String get toolModeQuick => 'Rápido';

  @override
  String get toolModeDetailed => 'Detallado';

  @override
  String get toolModeExecutive => 'Ejecutivo';

  @override
  String get toolModeKeyPoints => 'Puntos clave';

  @override
  String get toolModeActionFocused => 'Centrado en tareas';

  @override
  String toolWarningEvidenceNotFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'No se han encontrado $count detalles citados en lo que seleccionaste, así que quedan marcados como inciertos.',
      one: 'No se ha encontrado 1 detalle citado en lo que seleccionaste, así que queda marcado como incierto.',
    );
    return '$_temp0';
  }

  @override
  String get toolWarningEvidenceUnverifiable =>
      'Action no ha podido comprobar estas citas contra el archivo en sí, así que no se han comprobado.';

  @override
  String triageBadgeOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vencida · $count días',
      one: 'Vencida · 1 día',
    );
    return '$_temp0';
  }

  @override
  String get triageBadgeDueTomorrow => 'Vence mañana';

  @override
  String get triageBadgeReminderSoon => 'Recordatorio pronto';

  @override
  String triageSpokenOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vencida hace $count días',
      one: 'Vencida hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String triageSemanticLabel(String status, String title) {
    return '$status. $title';
  }

  @override
  String get triageExplanationDone => 'Esta tarea está hecha.';

  @override
  String get triageExplanationNothingPressing =>
      'Esta tarea está aquí porque todavía no hay nada que apremie en ella.';

  @override
  String triageExplanationNeedsAttention(String reason) {
    return 'Esta tarea requiere atención porque $reason.';
  }

  @override
  String triageExplanationUpcoming(String reason) {
    return 'Esta tarea está más abajo porque $reason.';
  }

  @override
  String get triageReasonOverdue => 'está vencida';

  @override
  String get triageReasonDeadlinePassed => 'su fecha límite ya ha pasado';

  @override
  String triageReasonOverdueDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'lleva $count días vencida',
      one: 'lleva 1 día vencida',
    );
    return '$_temp0';
  }

  @override
  String get triageReasonDueToday => 'vence hoy';

  @override
  String get triageReasonCriticalDueSoon =>
      'la marcaste como crítica y su fecha límite está cerca';

  @override
  String get triageReasonAllStepsDone =>
      'todos los pasos están hechos — solo falta terminarla';

  @override
  String get triageReasonDueTomorrow => 'vence mañana';

  @override
  String get triageReasonReminderSoon =>
      'le pusiste un recordatorio para las próximas veinticuatro horas';

  @override
  String get triageReasonDueWithinThreeDays =>
      'vence en los próximos tres días';

  @override
  String get triageReasonCriticalNoDeadline =>
      'la marcaste como crítica y no tiene fecha límite';

  @override
  String get triageReasonDueWithinSevenDays => 'vence en la próxima semana';

  @override
  String get triageReasonImportant => 'la marcaste como importante';

  @override
  String get triageReasonDueLater => 'su fecha límite está más lejos';

  @override
  String get triageReasonNoDeadline => 'no tiene fecha límite y nada apremia';

  @override
  String cardCompletedTooltip(String title) {
    return 'Completada: $title';
  }

  @override
  String get toolTitleDocumentIntelligence => 'Entender este documento';

  @override
  String get toolDescriptionDocumentIntelligence =>
      'Qué es, qué importa y qué hacer al respecto.';

  @override
  String get toolSectionWhatThisIs => 'Qué es esto';

  @override
  String get toolSectionWhatMatters => 'Qué importa';

  @override
  String get toolSectionKeyDetails => 'Datos clave';

  @override
  String get toolTitleAskDocument => 'Preguntar sobre una fuente';

  @override
  String get toolDescriptionAskDocument =>
      'Respuestas basadas en lo que seleccionaste — o ninguna.';

  @override
  String get toolSectionNoAnswer => 'Sin respuesta en este material';

  @override
  String get toolSectionNoAnswerBody =>
      'Action no ha podido encontrar eso en el documento seleccionado.';

  @override
  String get toolSectionAnswer => 'Respuesta';

  @override
  String get toolSectionFromTheDocument => 'Del documento';

  @override
  String get toolWarningQuoteNotFound =>
      'La cita en la que se apoya esta respuesta no está en el material seleccionado. Trata la respuesta como poco fiable.';

  @override
  String get toolTitleSmartSummary => 'Resumir';

  @override
  String get toolDescriptionSmartSummary =>
      'La versión corta — o la que cambia lo que tienes que hacer.';

  @override
  String get toolSectionKeyPoints => 'Puntos clave';

  @override
  String get toolTitleCompareDocuments => 'Comparar documentos';

  @override
  String get toolDescriptionCompareDocuments =>
      'Qué cambió, qué se contradice, qué falta.';

  @override
  String get toolSectionWhatDiffers => 'En qué se diferencian';

  @override
  String get toolSectionConflicts => 'Contradicciones';

  @override
  String get toolSectionOnlyInOne => 'Solo en uno de ellos';

  @override
  String get toolSectionInCommon => 'En común';

  @override
  String get sensitiveKindEmail => 'Dirección de correo';

  @override
  String get sensitiveKindPhone => 'Número de teléfono';

  @override
  String get sensitiveKindPaymentCard => 'Número de tarjeta de pago';

  @override
  String get sensitiveKindIban => 'Cuenta bancaria (IBAN)';

  @override
  String get sensitiveKindNationalId => 'Número de identidad nacional';

  @override
  String get sensitiveKindPostcode => 'Código postal';

  @override
  String get sensitiveKindAccountNumber => 'Número de cuenta';

  @override
  String get sensitiveKindReference => 'Número de referencia';

  @override
  String get sensitiveKindDateOfBirth => 'Fecha de nacimiento';

  @override
  String get sensitiveKindUrl => 'Dirección web';

  @override
  String get verdictVerifiedProvenance => 'Procedencia verificada disponible';

  @override
  String get verdictVerifiedProvenanceExplainer =>
      'Este archivo lleva una firma que se comprobó y superó la comprobación.';

  @override
  String get verdictSignalsSynthetic =>
      'Señales compatibles con contenido generado por IA';

  @override
  String get verdictSignalsSyntheticExplainer =>
      'Este archivo dice que se creó con una herramienta generativa. Los metadatos se pueden editar o eliminar, así que esto es lo que afirma el archivo, no una prueba.';

  @override
  String get verdictSignalsEdited =>
      'Señales compatibles con contenido editado';

  @override
  String get verdictSignalsEditedExplainer =>
      'Este archivo dice que pasó por un programa de edición. Eso es normal en las fotografías y no significa por sí solo que se haya falseado nada.';

  @override
  String get verdictNoReliableProvenance => 'No se encontró procedencia fiable';

  @override
  String get verdictNoReliableProvenanceExplainer =>
      'No hay información de procedencia en este archivo. Eso es normal — la mayoría de los servicios la eliminan — y no es señal de nada.';

  @override
  String get verdictInconclusive => 'No concluyente';

  @override
  String get verdictInconclusiveExplainer =>
      'Aquí no hay información suficiente para decir de dónde viene esto.';

  @override
  String get authenticitySignalCamera => 'Cámara';

  @override
  String get authenticitySignalSoftware => 'Software';

  @override
  String get authenticitySignalDescription => 'Descripción';

  @override
  String get authenticitySignalCopyright => 'Derechos de autor';

  @override
  String get authenticitySignalLocation => 'Ubicación';

  @override
  String get authenticitySignalLocationValue =>
      'Este archivo contiene datos de ubicación.';

  @override
  String get authenticitySignalContentCredentials => 'Content Credentials';

  @override
  String get authenticitySignalContentCredentialsValue =>
      'Sin comprobar — esta versión no incluye un verificador de firmas.';

  @override
  String get authenticitySignalFile => 'Archivo';

  @override
  String get authenticitySignalFileUnreadableValue =>
      'No se pudo leer como imagen.';

  @override
  String get authenticitySignalFileUnrecognisedValue =>
      'No es un formato de imagen reconocido.';

  @override
  String get authenticitySignalText => 'Texto';

  @override
  String get authenticitySignalTextValue =>
      'El texto por sí solo no puede mostrar con fiabilidad si se usó IA. Action no lo adivina.';

  @override
  String get fileTypePng => 'una imagen PNG';

  @override
  String get fileTypeJpeg => 'una imagen JPEG';

  @override
  String get fileTypeGif => 'una imagen GIF';

  @override
  String get fileTypeWebp => 'una imagen WebP';

  @override
  String get fileTypeWav => 'una grabación WAV';

  @override
  String get fileTypePdf => 'un documento PDF';

  @override
  String get fileTypeHeic => 'una imagen HEIC';

  @override
  String get fileTypeVideo => 'un archivo de vídeo';

  @override
  String get fileTypeTiff => 'una imagen TIFF';

  @override
  String get fileTypeBitmap => 'una imagen de mapa de bits';

  @override
  String get fileTypeRtf => 'un documento RTF';

  @override
  String get fileTypeZip => 'un archivo Zip';

  @override
  String get fileTypeGzip => 'un archivo gzip';

  @override
  String get fileTypeSevenZip => 'un archivo 7-Zip';

  @override
  String get fileTypeRar => 'un archivo RAR';

  @override
  String get fileTypeWindowsProgram => 'un programa de Windows';

  @override
  String get fileTypeLinuxProgram => 'un programa de Linux';

  @override
  String get fileTypePostScript => 'un documento PostScript';

  @override
  String get fileTypeOgg => 'una grabación Ogg';

  @override
  String get fileTypeMp3 => 'una grabación MP3';

  @override
  String get fileTypePlainText => 'texto sin formato';

  @override
  String fileMismatchNote(String extension, String contents) {
    return 'Este archivo se llama \".$extension\" pero su contenido es $contents. Eso puede ser un error inocente, y también es la forma en que un archivo acaba abriéndose con algo distinto de lo que esperabas.';
  }

  @override
  String fileSizeBytes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bytes',
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
  String get credentialKindPrivateKey => 'Clave privada';

  @override
  String get credentialKindApiKey => 'Clave de API';

  @override
  String get credentialKindConnectionString => 'Cadena de conexión';

  @override
  String get credentialKindAccessToken => 'Token de acceso';

  @override
  String get credentialKindAuthorizationHeader => 'Cabecera Authorization';

  @override
  String get credentialKindPasswordOrKey => 'Contraseña o clave';

  @override
  String get credentialKindPossibleSecret => 'Posible secreto';

  @override
  String get credentialAdvicePrivateKey =>
      'Elimina esto antes de compartirlo y sustituye el par de claves. Una clave privada no vuelve a ser segura una vez que se ha visto.';

  @override
  String get credentialAdviceProviderApiKey =>
      'Revoca esta clave en el proveedor y emite una nueva. Quitarla del documento no la desactiva.';

  @override
  String get credentialAdviceConnectionString =>
      'Esto lleva dentro una contraseña y la dirección que abre. Cambia la contraseña si ya se ha compartido.';

  @override
  String get credentialAdviceJsonWebToken =>
      'Los tokens como este suelen caducar, pero no siempre. Trátalo como activo mientras no sepas cuándo caduca.';

  @override
  String get credentialAdviceAuthorizationHeader =>
      'Elimina el valor de la cabecera. Los registros de peticiones pegados son una de las formas más habituales de compartir por accidente un token que funciona.';

  @override
  String get credentialAdviceKeyedAssignment =>
      'Mueve esto a una variable de entorno o a un gestor de secretos, y cambia el valor si el archivo se ha compartido.';

  @override
  String get credentialAdviceHighEntropyString =>
      'Action no puede saber qué es esto. Compruébalo antes de compartirlo — podría ser igualmente un identificador o una suma de verificación.';

  @override
  String get credentialLabelAnthropicApiKey => 'Clave de API de Anthropic';

  @override
  String get credentialLabelOpenAiProjectKey => 'Clave de proyecto de OpenAI';

  @override
  String get credentialLabelOpenAiStyleApiKey => 'Clave de API de tipo OpenAI';

  @override
  String get credentialLabelGoogleApiKey => 'Clave de API de Google';

  @override
  String get credentialLabelGoogleOAuthToken => 'Token de OAuth de Google';

  @override
  String get credentialLabelGitHubToken => 'Token de GitHub';

  @override
  String get credentialLabelSlackToken => 'Token de Slack';

  @override
  String get credentialLabelAwsAccessKeyId => 'ID de clave de acceso de AWS';

  @override
  String get credentialLabelGitLabToken => 'Token de GitLab';

  @override
  String get credentialLabelNpmToken => 'Token de npm';

  @override
  String get credentialLabelPassphrase => 'Frase de contraseña';

  @override
  String get credentialLabelPassword => 'Contraseña';

  @override
  String get credentialLabelRefreshToken => 'Token de actualización';

  @override
  String get credentialLabelToken => 'Token';

  @override
  String get credentialLabelClientSecret => 'Secreto de cliente';

  @override
  String get credentialLabelCredential => 'Credencial';

  @override
  String get credentialLabelSecret => 'Secreto';

  @override
  String get linkVerdictNoObviousSignals => 'Sin señales evidentes';

  @override
  String get linkVerdictWorthChecking => 'Conviene revisarlo';

  @override
  String get linkVerdictTreatWithCaution => 'Trátalo con cautela';

  @override
  String get linkSummaryNoObviousSignals =>
      'Nada inusual en cómo está escrito este enlace. Eso no es lo mismo que saber que la página es de fiar — solo tú puedes juzgar si lo esperabas.';

  @override
  String get linkSummaryWorthChecking =>
      'Hay una cosa en este enlace que conviene mirar antes de abrirlo.';

  @override
  String get linkSummaryTreatWithCaution =>
      'Hay varias cosas en cómo está escrito este enlace que conviene revisar antes de abrirlo.';

  @override
  String get linkSignalNotHttps => 'Sin cifrar';

  @override
  String get linkSignalNonWebScheme => 'No es un enlace web';

  @override
  String get linkSignalEmbeddedCredentials => 'Contraseña dentro del enlace';

  @override
  String get linkSignalMisleadingAuthority => 'Dirección real oculta';

  @override
  String get linkSignalIpLiteralHost => 'Dirección numérica';

  @override
  String get linkSignalPunycodeHost => 'Caracteres codificados en el nombre';

  @override
  String get linkSignalMixedScriptHost => 'Alfabetos mezclados en el nombre';

  @override
  String get linkSignalEncodedHost => 'Caracteres escapados en el nombre';

  @override
  String get linkSignalUnusualPort => 'Puerto poco habitual';

  @override
  String get linkSignalDeepSubdomain => 'Muchas partes en el nombre';

  @override
  String get linkSignalPublicSuffixInSubdomain =>
      'Nombre conocido en el lugar equivocado';

  @override
  String get linkSignalShortener => 'Enlace acortado';

  @override
  String get linkSignalExecutableTarget => 'Descarga un programa';

  @override
  String get linkSignalRedirectParameter => 'Te lleva a otra parte';

  @override
  String get linkSignalVeryLongUrl => 'Muy largo';

  @override
  String get linkSignalUnparseable => 'No se puede leer como enlace';

  @override
  String get linkDetailNotHttps =>
      'Este enlace usa http, así que cualquier cosa que escribas en la página se puede leer por el camino.';

  @override
  String linkDetailNonWebScheme(String scheme) {
    return 'Esto se abre con \"$scheme:\" en lugar de una página web. Puede que le pida a otra app que haga algo.';
  }

  @override
  String get linkDetailEmbeddedCredentials =>
      'Dentro de este enlace hay escritos un nombre de usuario y una contraseña. Allá donde se comparta, van con él.';

  @override
  String linkDetailMisleadingAuthority(String host) {
    return 'El navegador ignora todo lo que hay antes de la \"@\". El destino real es \"$host\".';
  }

  @override
  String linkDetailIpLiteralHost(String host) {
    return 'Esto va a \"$host\" — una dirección en bruto en lugar de un nombre. Los sitios legítimos casi siempre usan un nombre.';
  }

  @override
  String get linkDetailPunycodeHost =>
      'El nombre del sitio contiene caracteres no latinos, guardados de forma codificada. Esto es normal en muchos idiomas, y también es la forma de hacer que un nombre se parezca a uno conocido.';

  @override
  String get linkDetailMixedScriptHost =>
      'El nombre del sitio mezcla letras latinas con letras de otro alfabeto que se ven igual. Léelo carácter a carácter.';

  @override
  String get linkDetailEncodedHost =>
      'El nombre del sitio contiene códigos de escape, que no es donde corresponde que estén. Pueden ocultar lo que el nombre dice en realidad.';

  @override
  String linkDetailUnusualPort(String port) {
    return 'Esto conecta por el puerto $port en lugar del habitual. Eso es normal en servidores de pruebas y poco habitual en sitios públicos.';
  }

  @override
  String linkDetailDeepSubdomain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'El nombre tiene $count partes. Solo las dos últimas deciden quién controla el sitio; el resto puede ser cualquier cosa.',
      one:
          'El nombre tiene $count parte. Solo las dos últimas deciden quién controla el sitio; el resto puede ser cualquier cosa.',
    );
    return '$_temp0';
  }

  @override
  String linkDetailPublicSuffixInSubdomain(String suffix, String host) {
    return 'Este nombre contiene \".$suffix.\" en medio, lo que hace que el principio parezca el sitio. El sitio es en realidad \"$host\".';
  }

  @override
  String get linkDetailShortener =>
      'Un servicio de acortamiento oculta el destino real. No puedes saber adónde lleva esto sin abrirlo.';

  @override
  String linkDetailExecutableTarget(String fileExtension) {
    return 'Este enlace termina en \"$fileExtension\", así que descarga algo que puede ejecutarse en tu dispositivo en lugar de una página para leer.';
  }

  @override
  String linkDetailRedirectParameter(String parameter, String host) {
    return 'Este enlace lleva una segunda dirección en su ajuste \"$parameter\", así que abrirlo puede llevarte a un sitio distinto de \"$host\".';
  }

  @override
  String get linkDetailVeryLongUrl =>
      'Los enlaces largos son más difíciles de leer, y la parte que decide el destino puede quedar fuera de la vista.';

  @override
  String get linkDetailUnparseable =>
      'Action no ha podido leer esto como una dirección web. Ten cuidado con los enlaces que no parecen enlaces.';

  @override
  String get toolTitleRedaction => 'Ocultar datos sensibles';

  @override
  String get toolDescriptionRedaction =>
      'Encuentra lo que no debería compartirse y haz una copia sin esos datos.';

  @override
  String get toolSectionRedactionNothingToScan => 'Nada que analizar';

  @override
  String get toolSectionRedactionNothingToScanBody =>
      'Esta herramienta lee texto. Selecciona una nota, un mensaje pegado o una captura cuyo texto ya se haya leído.';

  @override
  String get toolSectionRedactionNothingFound => 'No se encontró nada evidente';

  @override
  String get toolSectionRedactionNothingFoundBody =>
      'Action no ha encontrado direcciones de correo, números de teléfono, números de tarjeta ni números de referencia en este texto.';

  @override
  String toolSectionRedactionFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cosas que conviene ocultar',
      one: '1 cosa que conviene ocultar',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionRedactedCopy => 'Copia censurada';

  @override
  String get toolWarningRedactionCoverage =>
      'Esto encuentra patrones como correos electrónicos, números de teléfono y números de cuenta. No detectará todo lo sensible — lee la copia antes de compartirla.';

  @override
  String get toolWarningRedactionFormatLimit =>
      'Action no puede censurar imágenes ni archivos PDF. Tapar algo en una imagen dejaría el original debajo, así que no se ofrece.';

  @override
  String get toolTitleAuthenticity => 'Comprobar de dónde viene esto';

  @override
  String get toolDescriptionAuthenticity =>
      'Lo que un archivo declara sobre su propio origen.';

  @override
  String get toolSectionAuthenticityNothingToInspect => 'Nada que inspeccionar';

  @override
  String get toolSectionAuthenticityNothingToInspectBody =>
      'Selecciona una imagen o un texto.';

  @override
  String get toolSectionAuthenticityFileSignals =>
      'Lo que este archivo dice de sí mismo';

  @override
  String get toolSectionAuthenticityFileItself => 'El archivo en sí';

  @override
  String get toolSectionFileContents => 'Contenido';

  @override
  String get toolSectionFileUnknownFormat =>
      'No es un formato que Action conozca';

  @override
  String get toolSectionFileSize => 'Tamaño';

  @override
  String get toolSectionFileDigest => 'SHA-256';

  @override
  String get toolWarningAuthenticityNotProof =>
      'Esto informa de lo que un archivo declara sobre sí mismo. Los metadatos se pueden editar o eliminar, así que nada de esto es una prueba. No uses esto para acusar a nadie.';

  @override
  String get toolTitleCredentialScanner => 'Buscar claves y contraseñas';

  @override
  String get toolDescriptionCredentialScanner =>
      'Encuentra credenciales antes de compartir algo.';

  @override
  String get toolSectionCredentialNothingToCheck => 'Nada que comprobar';

  @override
  String get toolSectionCredentialNothingToCheckBody =>
      'Pega un texto o elige una captura cuyo texto ya se haya leído. Esta herramienta solo lee texto.';

  @override
  String get toolSectionCredentialNoneFound => 'No se encontraron credenciales';

  @override
  String get toolSectionCredentialNoneFoundBody =>
      'Action no ha encontrado en este texto nada con forma de clave de API, clave privada, token o contraseña.';

  @override
  String toolSectionCredentialFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count credenciales encontradas',
      one: '1 credencial encontrada',
    );
    return '$_temp0';
  }

  @override
  String toolSectionCredentialPossibleFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cosas que podrían ser secretos',
      one: '1 cosa que podría ser un secreto',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionCredentialRedactedCopy =>
      'Copia con las credenciales eliminadas';

  @override
  String get toolWarningCredentialRevoke =>
      'Quitar una clave de un documento no la desactiva. Si alguna de estas ya se ha compartido, revócala en el proveedor y emite una nueva.';

  @override
  String get toolWarningCredentialCoverage =>
      'Esto encuentra credenciales con una forma reconocible. Una contraseña escrita dentro de una frase no se encontrará, así que lee también el texto.';

  @override
  String get toolTitleLinkInspector => 'Revisar un enlace';

  @override
  String get toolDescriptionLinkInspector =>
      'Lo que una dirección revela antes de abrirla.';

  @override
  String get toolSectionLinkNoneFound => 'No se encontraron enlaces';

  @override
  String get toolSectionLinkNoneFoundBody =>
      'Pega un enlace o elige una captura que contenga uno.';

  @override
  String toolSectionLinkFindings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count enlaces en este texto',
      one: 'El enlace en este texto',
    );
    return '$_temp0';
  }

  @override
  String get toolSectionLinkUnreadableHost => 'No se pudo leer';

  @override
  String toolSectionLinkObservationLine(String summary, String detail) {
    return '$summary. $detail';
  }

  @override
  String get toolSectionLinkNothingUnusual =>
      'Nada inusual en cómo están escritos';

  @override
  String get toolSectionLinkNothingUnusualBody =>
      'Eso no es lo mismo que saber que las páginas son de fiar. Solo tú puedes juzgar si las esperabas.';

  @override
  String get toolWarningLinkAddressOnly =>
      'Action solo lee la dirección. No abre el enlace, no consulta el sitio ni comprueba ningún servicio de reputación — hacerlo enviaría tu navegación a alguna parte.';

  @override
  String get toolWarningLinkNoSignals =>
      'Un enlace sin señales puede ser dañino igualmente. Esto encuentra problemas en cómo está escrita una dirección, que no es todo lo que hay que saber sobre adónde lleva.';

  @override
  String get toolSectionObjective => 'Tu objetivo';

  @override
  String get toolSectionCurrentState => 'Cómo va el objetivo';

  @override
  String get toolSectionRecommendedNextStep => 'Paso siguiente recomendado';

  @override
  String get toolSectionCredentialAdvice => 'Qué hacer';

  @override
  String get toolSectionSummary => 'Resumen';

  @override
  String get toolDetailSeparator => ' · ';
}
