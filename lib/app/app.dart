import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_theme.dart';
import '../features/actions/application/action_providers.dart';
import '../features/settings/application/settings_providers.dart';
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
      // Material's own strings — the text-selection menu, the date picker, the
      // "no results" of a dropdown — plus the delegate that lets the framework
      // resolve a locale's text direction at all.
      //
      // **On the languages declared here.** Action's own copy exists in
      // English, and that copy is not decoration: the test suite asserts exact
      // sentences, bans specific phrases, and holds several screens to saying
      // precisely what the code does and no more. Declaring locales whose
      // strings do not exist would tell Android this app speaks languages it
      // does not, and machine-translating the rest would quietly void every
      // one of those guarantees in nineteen languages nobody could check.
      //
      // So: English is declared because it is what exists. The *layout* is
      // right-to-left correct regardless — see test/polish/rtl_test.dart —
      // which is the half that is expensive to retrofit and cheap to keep.
      // Adding a translated locale is then a file, not a re-layout.
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en')],
      // Inside the router, so App Lock covers every route and every dialog on
      // the root navigator rather than only the screen that happened to be
      // showing. See app_lock_gate.dart for why it is here and not higher.
      builder: (context, child) =>
          AppLockGate(child: child ?? const SizedBox.shrink()),
    );
  }
}
