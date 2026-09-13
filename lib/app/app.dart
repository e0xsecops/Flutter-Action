import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_theme.dart';
import '../features/actions/application/action_providers.dart';
import '../features/capture/application/capture_controller.dart';
import '../features/capture/domain/document_intake.dart';
import '../features/capture/domain/shared_payload.dart';
import '../features/capture/domain/source_item.dart';
import '../features/capture/presentation/preview_screen.dart';
import '../features/settings/application/locale_controller.dart';
import '../features/settings/application/settings_providers.dart';
import '../l10n/gen/app_l10n.dart';
import '../l10n/supported_locales.dart';
import 'app_lock_gate.dart';
import 'router.dart';
import '../core/analytics/app_analytics.dart';
import '../core/analytics/firebase_app_analytics.dart';

class ActionApp extends ConsumerStatefulWidget {
  const ActionApp({super.key});

  @override
  ConsumerState<ActionApp> createState() => _ActionAppState();
}

class _ActionAppState extends ConsumerState<ActionApp> {
  StreamSubscription<String>? _taps;
  StreamSubscription<void>? _shares;

  @override
  void initState() {
    super.initState();
    // After the first frame, always. Reminders are a background concern at
    // startup: nothing here may delay the inbox appearing, and none of it
    // touches Firebase, the network or a model.
    WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(_startUp()));
  }

  Future<void> _startUp() async {
    if (!mounted) return;

    // After the first frame, like everything else here. A launch that is
    // counted before the inbox appears would be measuring the wrong moment.
    unawaited(ref.read(appAnalyticsProvider).log(AnalyticsEvents.appOpened));

    final scheduler = ref.read(notificationSchedulerProvider);

    try {
      await ref.read(deviceTimeZoneProvider).refresh();
      await scheduler.initialize();
    } on Object {
      // A device that cannot set reminders up must still be able to open its
      // own inbox, exactly like the App Check decision in main().
      return;
    }
    if (!mounted) return;

    // A tap that cold-started the process happened before anything was
    // listening, so it is asked for explicitly — and routed identically to a
    // tap on a running app.
    final launchedBy = await scheduler.launchActionId();
    if (!mounted) return;
    if (launchedBy != null) _openAction(launchedBy);

    _taps = scheduler.tappedActionIds.listen(_openAction);

    // Make what the user asked for and what Android holds agree again. Once,
    // bounded, and never on a timer.
    unawaited(ref.read(reminderReconcilerProvider).reconcile());

    // If a previous privacy deletion could not reach the cloud, finish it.
    // Does nothing when nothing is owed, and never blocks the inbox.
    unawaited(
      ref.read(privacyDeletionServiceProvider).retryPendingCloudDeletion(),
    );

    // A share that launched the app has been waiting since before the engine
    // existed, and one that arrives later is pushed. Both end up here.
    _shares = ref.read(shareIntakeProvider).arrivals.listen((_) {
      unawaited(_takeShare());
    });
    await _takeShare();
  }

  /// Acts on a share, once.
  ///
  /// **Nothing is created here.** A shared image goes to the same preview the
  /// gallery picker goes to, and shared text goes into the paste field. Both
  /// are confirm-or-abandon screens: a share is another app's decision until
  /// the person holding the phone agrees with it, and an app that silently
  /// accumulated everything ever sent to it would be a worse place to send
  /// anything.
  Future<void> _takeShare() async {
    final payload = await ref.read(shareIntakeProvider).consumePending();
    if (payload == null || !mounted) return;

    final router = ref.read(routerProvider);
    switch (payload) {
      case SharedText(:final text):
        unawaited(ref.read(appAnalyticsProvider).log(
          AnalyticsEvents.captureStarted,
          parameters: {AnalyticsParams.captureType: 'share_text'},
        ));
        router.push(Routes.captureText, extra: text);

      case SharedImage(:final path):
        unawaited(ref.read(appAnalyticsProvider).log(
          AnalyticsEvents.captureStarted,
          parameters: {AnalyticsParams.captureType: 'share_image'},
        ));
        router.push(
          Routes.capturePreview,
          extra: PreviewArgs(path: path, type: SourceType.gallery),
        );

      case SharedDocument(:final path, :final sizeBytes, :final suggestedName):
        unawaited(ref.read(appAnalyticsProvider).log(
          AnalyticsEvents.captureStarted,
          parameters: {AnalyticsParams.captureType: 'share_document'},
        ));
        await _takeSharedDocument(path, sizeBytes, suggestedName);

      case SharedRejected(:final message):
        // Said out loud rather than dropped. A share that vanishes leaves the
        // user thinking Action took it.
        final context = router.routerDelegate.navigatorKey.currentContext;
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(SnackBar(content: Text(message)));
        }
    }
  }

  /// Runs a shared PDF through the same checks a picked one gets.
  ///
  /// Share and picker converge here deliberately: an encrypted or truncated
  /// PDF has to be refused the same way whichever door it came through, and a
  /// second implementation of that judgement is a second place for it to drift.
  Future<void> _takeSharedDocument(
    String path,
    int sizeBytes,
    String? suggestedName,
  ) async {
    final outcome = await ref
        .read(sourcesProvider.notifier)
        .addSharedDocument(
          path: path,
          sizeBytes: sizeBytes,
          declaredName: suggestedName,
        );
    if (!mounted) return;

    final context = ref.read(routerProvider).routerDelegate.navigatorKey
        .currentContext;
    switch (outcome) {
      case SourceItem(:final id):
        ref.read(routerProvider).push(Routes.source(id));
      case RejectedDocument(:final message):
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(SnackBar(content: Text(message)));
        }
      default:
        break;
    }
  }

  void _openAction(String actionId) {
    if (!mounted) return;
    ref.read(appAnalyticsProvider).log(
      AnalyticsEvents.reminderOpened,
    );
    // `push`, not `go`: arriving from a notification should still leave a way
    // back to the inbox. A deleted Action lands on the Day-9 not-found state.
    ref.read(routerProvider).push(Routes.action(actionId));
  }

  @override
  void dispose() {
    unawaited(_taps?.cancel());
    unawaited(_shares?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Action',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      // Both themes are first-class. The system decides unless the user has
      // said otherwise in Settings; the preference is read synchronously, so
      // the first frame is already the right colour.
      themeMode: ref.watch(themeModeControllerProvider),
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      // Action's own strings, then Material's — the text-selection menu, the
      // date picker, the "no results" of a dropdown — plus the delegate that
      // lets the framework resolve a locale's text direction at all.
      //
      // **On the twenty languages declared here.** English is the canonical
      // source and the one the copy tests assert against; the other nineteen
      // were drafted against a fixed glossary and a set of meaning constraints
      // that the safety-critical sentences of this product cannot be allowed
      // to lose — see `docs/v2/LOCALIZATION_GLOSSARY.md` for the terms and
      // `test/l10n/` for the assertions that hold every locale to them. Their
      // human-review state is tracked, per locale, in
      // `docs/v2/LOCALIZATION_REVIEW_STATUS.md`, and the product does not
      // claim they are certified.
      localizationsDelegates: const [
        AppL10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocales.locales,
      // Null means "follow the device", which is the default. Setting it in
      // Settings rebuilds exactly this widget, and that is the whole of live
      // language switching: `Localizations` re-resolves below it, every
      // `AppL10n.of(context)` returns the new bundle, and `Directionality`
      // changes with it. No restart, nothing to reconcile.
      locale: ref.watch(localeControllerProvider),
      // Only for the case Flutter's own resolution cannot get right: Chinese,
      // where the axis that matters is the script and the device sends a
      // country. Everything else — es-MX, bn-BD, pt-BR — falls back on the
      // language code, which the framework already does correctly.
      localeListResolutionCallback: AppLocales.resolve,
      // Inside the router, so App Lock covers every route and every dialog on
      // the root navigator rather than only the screen that happened to be
      // showing. See app_lock_gate.dart for why it is here and not higher.
      builder: (context, child) =>
          AppLockGate(child: child ?? const SizedBox.shrink()),
    );
  }
}
