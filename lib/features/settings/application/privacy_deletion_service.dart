import 'dart:convert';

import '../../../core/preferences/preference_store.dart';
import '../../actions/data/action_cloud_privacy_service.dart';
import '../../actions/data/actions_database.dart';
import '../../actions/data/auth_identity_service.dart';
import '../../actions/data/notification_scheduler.dart';
import '../../actions/domain/action_repository.dart';
import '../../capture/data/source_file_store.dart';
import '../../capture/data/source_store.dart';

/// Mirror documents a deletion has not managed to remove yet.
///
/// Written to preferences *before* anything is destroyed, so that a crash
/// halfway through cannot strand cloud documents whose ids only existed in
/// the local database that was about to be dropped. Carries an anonymous uid
/// and Action ids — never a title, amount or date.
final class PendingCloudDeletion {
  const PendingCloudDeletion({required this.uid, required this.actionIds});

  /// Null when identity could not be resolved at deletion time; a later
  /// attempt resolves it. The anonymous uid is stable for an install, so a
  /// retry deletes the same documents the original attempt meant to.
  final String? uid;
  final Set<String> actionIds;

  bool get isEmpty => actionIds.isEmpty;

  String encode() => jsonEncode({'uid': uid, 'ids': actionIds.toList()});

  static PendingCloudDeletion? decode(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      final map = jsonDecode(raw);
      if (map is! Map) return null;
      final ids = map['ids'];
      if (ids is! List) return null;
      return PendingCloudDeletion(
        uid: map['uid'] as String?,
        actionIds: {for (final id in ids) if (id is String) id},
      );
    } on Object {
      // Unreadable record: treat as nothing owed rather than crashing the
      // settings screen forever on one bad string.
      return null;
    }
  }
}

/// What actually happened, in terms the screen can state without lying.
sealed class DeletionOutcome {
  const DeletionOutcome();
}

/// Local data gone, and every mirrored copy confirmed deleted.
final class DeletionComplete extends DeletionOutcome {
  const DeletionComplete();
}

/// Something is still there. **Never reported as full deletion.**
///
/// Two independent things can be left behind, so both are carried rather
/// than collapsed into one vague "partly done": cloud copies that could not
/// be reached, and captures whose files would not delete. The screen builds
/// its sentence from whichever actually applies.
final class DeletionPartial extends DeletionOutcome {
  const DeletionPartial({
    required this.cloudCopiesRemaining,
    required this.capturesRemain,
  });

  final int cloudCopiesRemaining;
  final bool capturesRemain;
}

/// The local wipe itself failed, so the Actions are still there.
final class DeletionFailed extends DeletionOutcome {
  const DeletionFailed(this.failureClass);

  final String failureClass;
}

/// The one destructive operation in the product.
///
/// The ordering below is the design, and it is chosen so that every point at
/// which the process can die leaves a state that is either correct or
/// recoverable:
///
///  1. **Record the intent first.** The cloud document ids live in the local
///     database. Deleting that database before recording them would leave
///     documents that nothing on the device can name any more.
///  2. **Cancel alarms before dropping their rows**, so no reminder can fire
///     for an Action that no longer exists.
///  3. **Drop the outbox in the same transaction as the Actions**, so a
///     pending mirror upsert can never re-create a document that step 4 is
///     about to delete.
///  4. **Delete remotely last**, and only then clear the intent.
class PrivacyDeletionService {
  const PrivacyDeletionService({
    required ActionRepository actions,
    required ActionsDatabase database,
    required Future<SourceStore> Function() sources,
    required Future<SourceFileStore> Function() sourceFiles,
    required NotificationScheduler scheduler,
    required AuthIdentityService identity,
    required ActionCloudPrivacyService cloud,
    required PreferenceStore preferences,
  }) : this._(actions, database, sources, sourceFiles, scheduler, identity,
            cloud, preferences);

  const PrivacyDeletionService._(
    this._actions,
    this._database,
    this._sources,
    this._sourceFiles,
    this._scheduler,
    this._identity,
    this._cloud,
    this._preferences,
  );

  final ActionRepository _actions;
  final ActionsDatabase _database;
  final Future<SourceStore> Function() _sources;
  final Future<SourceFileStore> Function() _sourceFiles;
  final NotificationScheduler _scheduler;
  final AuthIdentityService _identity;
  final ActionCloudPrivacyService _cloud;
  final PreferenceStore _preferences;

  PendingCloudDeletion? get pending => PendingCloudDeletion.decode(
        _preferences.getString(PreferenceKeys.pendingCloudDeletion),
      );

  Future<DeletionOutcome> deleteEverything() async {
    final Set<String> actionIds;
    try {
      actionIds = {for (final a in await _actions.watchAll().first) a.id};
    } on Object {
      return const DeletionFailed('local_read_failed');
    }

    // Identity is resolved before anything is destroyed, but its failure is
    // not fatal: the ids are recorded either way and a later attempt can
    // resolve the uid then.
    String? uid;
    try {
      uid = await _identity.currentOrSignInUid();
    } on Object {
      uid = null;
    }

    // (1) Intent first, while the ids still exist somewhere.
    await _writePending(PendingCloudDeletion(uid: uid, actionIds: actionIds));

    // (2) No alarm may outlive the Action it belongs to.
    await _cancelEveryScheduledNotification();

    try {
      // (3) Actions, steps, facts, reminders and the outbox, atomically.
      await _database.deleteAllLocalData();
    } on Object {
      return const DeletionFailed('local_delete_failed');
    }

    // Captures are a separate store on a separate medium, so their failure is
    // reported rather than allowed to mask a database wipe that did work.
    // Returning "it failed" here once the Actions are already gone would be
    // the one kind of lie this flow exists to avoid.
    var capturesRemain = false;
    try {
      await _clearCapturesInternal();
    } on Object {
      capturesRemain = true;
    }

    // Preferences the user would consider theirs. The pending-deletion record
    // is deliberately not among them.
    for (final key in PreferenceKeys.clearedOnDelete) {
      await _preferences.remove(key);
    }

    // (4) Remote last.
    final cloudRemaining =
        await _settleCloud(uid: uid, actionIds: actionIds);
    if (cloudRemaining == 0 && !capturesRemain) return const DeletionComplete();
    return DeletionPartial(
      cloudCopiesRemaining: cloudRemaining,
      capturesRemain: capturesRemain,
    );
  }

  /// Retries whatever the last deletion could not finish. Safe to call on
  /// every launch: it does nothing when nothing is owed.
  Future<void> retryPendingCloudDeletion() async {
    final owed = pending;
    if (owed == null || owed.isEmpty) return;

    var uid = owed.uid;
    if (uid == null) {
      try {
        uid = await _identity.currentOrSignInUid();
      } on Object {
        uid = null;
      }
    }
    if (uid == null) return; // still offline; the record stays for next time
    await _settleCloud(uid: uid, actionIds: owed.actionIds);
  }

  /// Deletes what it can remotely and returns how many documents are still
  /// owed. Clears the pending record only when that number is zero.
  Future<int> _settleCloud({
    required String? uid,
    required Set<String> actionIds,
  }) async {
    if (actionIds.isEmpty) {
      await _preferences.remove(PreferenceKeys.pendingCloudDeletion);
      return 0;
    }
    if (uid == null) {
      // No identity means no way to prove ownership of the documents, so
      // nothing can be deleted and nothing may be claimed.
      return actionIds.length;
    }

    final remaining = await _cloud.deleteMirrored(uid, actionIds);
    if (remaining.isEmpty) {
      await _preferences.remove(PreferenceKeys.pendingCloudDeletion);
      return 0;
    }
    await _writePending(PendingCloudDeletion(uid: uid, actionIds: remaining));
    return remaining.length;
  }

  /// Removes captures and their files, leaving Actions alone.
  ///
  /// An Action whose source is gone keeps working — Day 9's detail screen
  /// already renders a missing source as a plain absence rather than an
  /// error, and that property is what makes this a safe thing to offer
  /// separately.
  Future<void> clearCaptures() => _clearCapturesInternal();

  Future<void> _clearCapturesInternal() async {
    final store = await _sources();
    await store.clear();
    final files = await _sourceFiles();
    await files.deleteAll();
  }

  Future<void> _writePending(PendingCloudDeletion pending) => _preferences
      .setString(PreferenceKeys.pendingCloudDeletion, pending.encode());

  /// Best effort by design: a scheduler that cannot list or cancel must not
  /// stop the user's data from being deleted. The rows go regardless, and a
  /// stale alarm that fires opens an Action id that no longer resolves —
  /// which Day 9 already handles as a not-found state.
  Future<void> _cancelEveryScheduledNotification() async {
    try {
      for (final id in await _scheduler.pendingNotificationIds()) {
        try {
          await _scheduler.cancel(id);
        } on Object {
          continue;
        }
      }
    } on Object {
      return;
    }
  }
}
