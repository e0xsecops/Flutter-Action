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
}
