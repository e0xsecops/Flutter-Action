import 'dart:async';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/firebase/firebase_gate.dart';
import 'core/preferences/shared_preferences_store.dart';
import 'firebase_options.dart';

/// Lets a debug build report to Crashlytics when we need to prove the pipeline
/// works end to end: `flutter run --dart-define=CRASHLYTICS_IN_DEBUG=true`.
/// Off by default so day-to-day development does not fill the dashboard.
const _crashlyticsInDebug = bool.fromEnvironment('CRASHLYTICS_IN_DEBUG');

/// Startup, in the order the first frame actually needs.
///
/// Day 16 measured what used to happen here. `Firebase.initializeApp` took
/// 388–567 ms of a 451–611 ms pre-frame window on the API-36 emulator, and
/// App Check and the Crashlytics collection flag sat behind it — roughly half
/// a second of platform-channel work before a single pixel, none of which the
/// inbox depends on. Actions, their chains, reminders and search are local.
///
/// So the order is now: wire error reporting, start Firebase *without waiting
/// for it*, read the one small preference file routing genuinely needs, and
/// draw. Everything cloud-shaped waits on [FirebaseGate] instead of the user
/// waiting on it.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // The one thing the first frame genuinely needs. Loaded before it so the
  // router can decide synchronously whether this is a first run; it is a
  // single small file read, measured at 4–15 ms, and making the app wait for
  // it costs less than showing the wrong screen and correcting it a frame
  // later.
  final preferences = await SharedPreferencesStore.open();

  // Started here rather than beside the preference read, and never awaited.
  // Both are platform-channel calls: starting them together let the native
  // Firebase initialisation monopolise the platform thread and pushed that
  // 5 ms preference read out to 325 ms, taking the first frame with it.
  // Sequenced this way, each is fast and only one of them is on the path to
  // a frame.
  final firebase = FirebaseGate(_bringUpFirebase());

  _installErrorHandlers(firebase);

  runApp(
    ProviderScope(
      overrides: [
        preferenceStoreProvider.overrideWithValue(preferences),
        firebaseGateProvider.overrideWithValue(firebase),
      ],
      child: const ActionApp(),
    ),
  );
}

/// Brings Firebase up in the background and reports whether it worked.
///
/// Never throws, and never rethrows: this future is what every cloud seam
/// waits on, and an exception escaping here would surface as an unhandled
/// async error on a device whose only real problem is that it is offline.
///
/// The order inside matters. App Check is activated *before* the gate opens,
/// so any caller that waited for Firebase — the AI extraction path above all
/// — is guaranteed an attested client rather than a race against one.
Future<bool> _bringUpFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on Object {
    // No Firebase means no Crashlytics to report the failure to. The app
    // still runs: everything the inbox shows is on this device.
    return false;
  }

  try {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      !kDebugMode || _crashlyticsInDebug,
    );
  } on Object {
    // A collection flag that would not set is not a reason to lose the cloud.
  }

  await _activateAppCheck();
  return true;
}

/// Sends framework errors and uncaught async errors to Crashlytics.
///
/// Both channels need wiring or half the crashes never arrive. Because
/// reporting now depends on a Firebase that may still be coming up, each
/// handler defers rather than drops: an error raised in the first few hundred
/// milliseconds is held until the gate answers, then recorded. If Firebase
/// never arrives, the error is at least presented, which is more than the
/// previous ordering did for anything thrown during initialisation.
void _installErrorHandlers(FirebaseGate firebase) {
  FlutterError.onError = (details) {
    unawaited(_report(firebase, () async {
      // recordFlutterFatalError presents the error itself, so this branch
      // must not present it as well or every failure would print twice.
      await FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    }, orElse: () => FlutterError.presentError(details)));
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    unawaited(_report(firebase, () async {
      await FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }, orElse: () => FlutterError.presentError(
          FlutterErrorDetails(exception: error, stack: stack),
        )));
    return true;
  };
}

/// Runs [record] once Firebase is up, or [orElse] if it never comes up.
/// Reporting a crash must never cause one, so everything here is swallowed.
Future<void> _report(
  FirebaseGate firebase,
  Future<void> Function() record, {
  required void Function() orElse,
}) async {
  try {
    if (await firebase.ready) {
      await record();
    } else {
      orElse();
    }
  } on Object {
    // Nothing sensible is left to do, and rethrowing would re-enter here.
  }
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
