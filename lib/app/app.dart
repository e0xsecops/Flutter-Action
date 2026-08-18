import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_theme.dart';
import '../features/actions/application/action_providers.dart';
import '../features/extraction/application/review_analytics.dart';
import 'router.dart';

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
  }

  void _openAction(String actionId) {
    if (!mounted) return;
    ref.read(reviewAnalyticsProvider).log(
      ActionEvents.reminderNotificationOpened,
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
      // Both themes are first-class, so the system decides. A manual override
      // lands with the settings screen on day 14.
      themeMode: ThemeMode.system,
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}
