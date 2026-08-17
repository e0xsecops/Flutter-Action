import 'dart:math' as math;

import '../data/action_cloud_mirror.dart';
import '../data/auth_identity_service.dart';
import '../domain/action_repository.dart';

/// Drains the mirror outbox — bounded, quiet, and strictly after local truth.
///
/// [flush] runs one pass: take the due entries, attempt each against the
/// cloud, discharge or reschedule. No timers, no loops, no background
/// service — it is invoked at app start and after local writes, which is
/// exactly as often as new work can appear. A pass that can't get an
/// identity stops immediately (every entry shares that fate) and backs off.
///
/// Failure never travels backwards: a failed mirror reschedules its outbox
/// row and nothing else. The local Action is untouchable from here.
class ActionSyncService {
  ActionSyncService({
    required this._outbox,
    required this._repository,
    required this._identity,
    required this._mirror,
    DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now;

  final ActionSyncOutbox _outbox;
  final ActionRepository _repository;
  final AuthIdentityService _identity;
  final ActionCloudMirror _mirror;
  final DateTime Function() _clock;

  bool _flushing = false;

  /// Backoff: 1, 2, 4, ... minutes, capped at one hour. Attempts only ever
  /// happen during a pass, so this bounds frequency, not battery.
  static Duration backoffFor(int attempts) =>
      Duration(minutes: math.min(1 << math.min(attempts, 6), 60));

  Future<void> flush() async {
    if (_flushing) return; // one pass at a time; a second call is a no-op
    _flushing = true;
    try {
      final now = _clock();
      final due = await _outbox.duePending(now);
      if (due.isEmpty) return;

      final uid = await _identity.currentOrSignInUid();
      if (uid == null) {
        final failureClass = _identity.lastFailureClass ?? 'auth_unavailable';
        for (final entry in due) {
          await _outbox.markFailure(
            entry.actionId,
            failureClass: failureClass,
            nextAttemptAt: now.add(backoffFor(entry.attempts)),
          );
        }
        return;
      }

      for (final entry in due) {
        final item = await _repository.getById(entry.actionId);
        if (item == null) {
          // The Action is gone locally; there is nothing left to mirror.
          await _outbox.markSynced(entry.actionId);
          continue;
        }
        try {
          await _mirror.upsert(uid, item);
          await _outbox.markSynced(entry.actionId);
        } on CloudMirrorException catch (error) {
          await _outbox.markFailure(
            entry.actionId,
            failureClass: error.failureClass,
            nextAttemptAt: now.add(backoffFor(entry.attempts)),
          );
        }
      }
    } finally {
      _flushing = false;
    }
  }
}
