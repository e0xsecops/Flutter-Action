import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
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

  runApp(const ProviderScope(child: ActionApp()));
}
