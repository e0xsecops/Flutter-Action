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
}
