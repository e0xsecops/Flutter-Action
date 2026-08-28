import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase/firebase_gate.dart';
import 'app_analytics.dart';

/// The only file in the app that names `FirebaseAnalytics`.
///
/// Everything about *what* may be measured lives in [AppAnalytics] and its
/// catalogue; this is only the wire. That separation is what lets the privacy
/// contract be tested without Firebase present at all.
class FirebaseAppAnalytics implements AppAnalytics {
  const FirebaseAppAnalytics({this._gate, this._analytics});

  final FirebaseGate? _gate;
  final FirebaseAnalytics? _analytics;

  FirebaseAnalytics get _instance => _analytics ?? FirebaseAnalytics.instance;

  @override
  Future<void> log(String name, {Map<String, String>? parameters}) async {
    // Validated first, so a contract violation is caught before anything is
    // sent and independently of whether Firebase is even up.
    final safe = validateAnalytics(name, parameters);
    if (name.isEmpty) return;

    try {
      // Since Day 16 Firebase comes up after the first frame. An event raised
      // in that window waits rather than throwing; if Firebase never arrives
      // the event is simply lost, which is the correct priority.
      final gate = _gate;
      if (gate != null && !await gate.ready) return;

      await _instance.logEvent(
        name: name,
        parameters: safe.isEmpty ? null : {...safe},
      );
    } on Object {
      // Best-effort by design, and the one place where that phrase is not a
      // shrug: a metric must never be able to break the product.
    }
  }
}

/// Product analytics. Overridden with a recorder in tests, and with
/// [NoopAppAnalytics] anywhere the cloud is not configured.
final appAnalyticsProvider = Provider<AppAnalytics>(
  (ref) => FirebaseAppAnalytics(gate: ref.watch(firebaseGateProvider)),
);
