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
}
