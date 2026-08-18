import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/preferences/shared_preferences_store.dart';
import 'firebase_options.dart';

/// Lets a debug build report to Crashlytics when we need to prove the pipeline
/// works end to end: `flutter run --dart-define=CRASHLYTICS_IN_DEBUG=true`.
/// Off by default so day-to-day development does not fill the dashboard.
const _crashlyticsInDebug = bool.fromEnvironment('CRASHLYTICS_IN_DEBUG');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _activateAppCheck();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
    !kDebugMode || _crashlyticsInDebug,
  );

  // Framework errors (build/layout/paint) and uncaught async errors reach
  // Crashlytics through two different channels; both need wiring or half the
  // crashes never arrive.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Loaded before the first frame so the router can decide synchronously
  // whether this is a first run. It is a single small file read; making the
  // app wait for it costs less than showing the wrong screen and correcting
  // it a frame later.
  final preferences = await SharedPreferencesStore.open();

  runApp(
    ProviderScope(
      overrides: [preferenceStoreProvider.overrideWithValue(preferences)],
      child: const ActionApp(),
    ),
  );
}

/// Attests that requests come from a genuine build of this app.
///
/// Debug builds use the debug provider, which prints a token to logcat on
/// first run. **That token is a secret and is never written into source.** It
/// is registered by hand in the Firebase console against this app, and a
/// registered token grants a real attestation to whoever holds it — which is
/// exactly why it does not belong in a repository. Release builds use Play
/// Integrity and need no such step; the emulator can never satisfy Play
/// Integrity, which is the whole reason the two paths differ.
///
/// Failure here is swallowed on purpose. App Check protects the *backend*, and
/// a device that cannot attest should lose access to the AI service, not lose
/// the ability to open its own inbox and read captures it already has. The
/// provider call fails later with a typed transport error, which the UI is
/// built to show.
Future<void> _activateAppCheck() async {
  try {
    await FirebaseAppCheck.instance.activate(
      providerAndroid: kDebugMode
          ? const AndroidDebugProvider()
          : const AndroidPlayIntegrityProvider(),
    );
  } on Object catch (error, stack) {
    // Recorded rather than raised: nothing above this needs to know, and a
    // crash on launch would be a far worse outcome than an unattested session.
    await FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      reason: 'App Check activation failed',
      fatal: false,
    );
  }
}
