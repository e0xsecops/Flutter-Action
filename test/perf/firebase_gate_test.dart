import 'dart:async';

import 'package:action_app/core/firebase/firebase_gate.dart';
import 'package:action_app/features/actions/application/action_sync_service.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../support/scale_fixtures.dart';

/// [FirebaseGate] under the conditions Day 16 created by moving Firebase off
/// the startup path.
///
/// The gate is the seam every cloud call now passes through, so the failure
/// modes that matter are the boring ones: a caller arriving before
/// initialisation finishes, several arriving at once, and initialisation
/// never succeeding at all. None of them may block, deadlock, or take the
/// local app down with them.
void main() {
  group('the gate itself', () {
    test('an open gate answers true without waiting', () async {
      expect(await FirebaseGate.open().ready, isTrue);
    });

    test('a caller that arrives before initialisation finishes waits, then '
        'proceeds', () async {
      final completer = Completer<bool>();
      final gate = FirebaseGate(completer.future);

      var answered = false;
      final waiting = gate.ready.then((ok) {
        answered = true;
        return ok;
      });

      await Future<void>.delayed(Duration.zero);
      expect(answered, isFalse, reason: 'nothing to answer with yet');

      completer.complete(true);
      expect(await waiting, isTrue);
    });

    test('many concurrent callers all get the same answer, once', () async {
      var initialisations = 0;
      final gate = FirebaseGate(
        Future<bool>.delayed(const Duration(milliseconds: 20), () {
          initialisations++;
          return true;
        }),
      );

      final answers = await Future.wait([
        for (var i = 0; i < 25; i++) gate.ready,
      ]);

      expect(answers, everyElement(isTrue));
      // One future, awaited many times - never one initialisation per caller.
      expect(initialisations, 1);
    });

    test('a gate that never opens does not deadlock its callers forever when '
        'the future completes late', () async {
      final completer = Completer<bool>();
      final gate = FirebaseGate(completer.future);
      final pending = gate.ready;

      // Something else entirely finishes first: the app is not blocked.
      expect(await Future<String>.value('local work'), 'local work');

      completer.complete(false);
      expect(await pending, isFalse);
    });

    test('reading it repeatedly after it opens is free and consistent',
        () async {
      final gate = FirebaseGate(Future<bool>.value(true));
      expect(await gate.ready, isTrue);
      expect(await gate.ready, isTrue);
      expect(await gate.ready, isTrue);
    });
  });

  group('a closed gate degrades instead of throwing', () {
    test('auth reports an outage rather than raising', () async {
      final identity =
          FirebaseAuthIdentityService(gate: FirebaseGate(Future.value(false)));
      expect(await identity.currentOrSignInUid(), isNull);
      expect(identity.lastFailureClass, 'firebase_unavailable');
    });

    test('the mirror raises a retryable transport failure, not a crash',
        () async {
      final mirror =
          FirestoreActionCloudMirror(gate: FirebaseGate(Future.value(false)));
      await expectLater(
        mirror.upsert('uid', ScaleFixtures.syntheticActions(1).single),
        throwsA(isA<CloudMirrorException>()
            .having((e) => e.failureClass, 'failureClass', 'unavailable')),
      );
    });

    test('a sync pass over a closed gate backs off instead of losing rows',
        () async {
      final db = memoryDatabase();
      addTearDown(db.close);
      final repo = DriftActionRepository(db);
      for (final a in ScaleFixtures.syntheticActions(3)) {
        await repo.create(a);
      }
      expect(await repo.pendingCount(), 3);

      final service = ActionSyncService(
        outbox: repo,
        repository: repo,
        identity: FirebaseAuthIdentityService(
          gate: FirebaseGate(Future.value(false)),
        ),
        mirror: const NoopActionCloudMirror(),
        clock: () => ScaleFixtures.now,
      );

      // Must not throw: this runs unawaited from a post-frame callback, and an
      // escaping error would surface as a fatal uncaught async error.
      await service.flush();

      // Every row survives, to be retried when Firebase is available.
      expect(await repo.pendingCount(), 3);
    });

    test('a gate that opens late lets a later pass succeed', () async {
      final db = memoryDatabase();
      addTearDown(db.close);
      final repo = DriftActionRepository(db);
      for (final a in ScaleFixtures.syntheticActions(2)) {
        await repo.create(a);
      }

      final completer = Completer<bool>();
      final gate = FirebaseGate(completer.future);
      final mirror = _RecordingMirror();
      final service = ActionSyncService(
        outbox: repo,
        repository: repo,
        identity: _GatedIdentity(gate, 'uid-1'),
        mirror: mirror,
        clock: () => ScaleFixtures.now,
      );

      final inFlight = service.flush();
      completer.complete(true); // Firebase finishes coming up mid-pass
      await inFlight;

      expect(mirror.upserts, 2);
      expect(await repo.pendingCount(), 0);
    });
  });
}

class _RecordingMirror implements ActionCloudMirror {
  var upserts = 0;

  @override
  Future<void> upsert(String uid, item) async => upserts++;
}

/// Waits on the gate exactly as the real identity service does, without
/// needing a Firebase app to exist.
class _GatedIdentity implements AuthIdentityService {
  _GatedIdentity(this._gate, this._uid);
  final FirebaseGate _gate;
  final String _uid;

  @override
  String? lastFailureClass;

  @override
  Future<String?> currentOrSignInUid() async {
    if (!await _gate.ready) {
      lastFailureClass = 'firebase_unavailable';
      return null;
    }
    return _uid;
  }
}
