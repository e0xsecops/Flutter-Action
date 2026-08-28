import 'dart:convert';

import '../../../core/preferences/preference_store.dart';
import '../../actions/data/action_cloud_privacy_service.dart';
import '../../actions/data/cloud_privacy_inventory.dart';
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
  const PendingCloudDeletion({
    required this.uid,
    required this.actionIds,
    this.cloudListed = false,
  });

  /// Null when identity could not be resolved at deletion time; a later
  /// attempt resolves it. The anonymous uid is stable for an install, so a
  /// retry deletes the same documents the original attempt meant to.
  final String? uid;
  final Set<String> actionIds;

  /// Whether the cloud was successfully *enumerated* during the attempt that
  /// wrote this record.
  ///
  /// Day 17. Without it a retry cannot tell "these are the only documents,
  /// and one delete failed" from "this is merely what the device happened to
  /// know". The second case still owes a listing, and the retry performs it.
  final bool cloudListed;

  /// Nothing owed *and* nothing left to find out. A record with no ids but an
  /// unverified cloud is not empty — it is an unfinished question.
  bool get isEmpty => actionIds.isEmpty && cloudListed;

  String encode() => jsonEncode({
        'uid': uid,
        'ids': actionIds.toList(),
        'listed': cloudListed,
      });

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
        // Absent in records written before Day 17: those were made without a
        // listing, so false is both the compatible and the truthful default.
        cloudListed: map['listed'] == true,
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
    this.cloudNotVerified = false,
  });

  final int cloudCopiesRemaining;
  final bool capturesRemain;

  /// The cloud could not be *listed*, so whether anything remains up there is
  /// unknown rather than known-zero.
  ///
  /// Day 17 added this because the honest answer has three states, not two.
  /// Deleting every document we could name is not the same as knowing none is
  /// left: an orphan mirror from a lost install has an id this device never
  /// had. When the listing fails, the flow has deleted what it could and
  /// genuinely does not know if that was all — and saying so is the point of
  /// the whole screen.
  final bool cloudNotVerified;
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
    CloudPrivacyInventory inventory = const NoopCloudPrivacyInventory(),
  }) : this._(actions, database, sources, sourceFiles, scheduler, identity,
            cloud, preferences, inventory);

  const PrivacyDeletionService._(
    this._actions,
    this._database,
    this._sources,
    this._sourceFiles,
    this._scheduler,
    this._identity,
    this._cloud,
    this._preferences,
    this._inventory,
  );

  final ActionRepository _actions;
  final ActionsDatabase _database;
  final Future<SourceStore> Function() _sources;
  final Future<SourceFileStore> Function() _sourceFiles;
  final NotificationScheduler _scheduler;
  final AuthIdentityService _identity;
  final ActionCloudPrivacyService _cloud;
  final PreferenceStore _preferences;

  /// Consulted **only** from the two deletion paths below. Nothing else in
  /// the app holds a reference to it.
  final CloudPrivacyInventory _inventory;

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

    // Ask the cloud what it actually holds, before anything is destroyed.
    // This is the Day-17 orphan fix: the union of "what this device knows
    // about" and "what is actually up there" is the only set that can honour
    // the promise the button makes. A null answer means the listing failed,
    // which is remembered rather than glossed over.
    final remoteIds = uid == null
        ? null
        : await _inventory.listMirroredActionIds(uid);
    final owedIds = {...actionIds, ...?remoteIds};

    // (1) Intent first, while the ids still exist somewhere.
    await _writePending(PendingCloudDeletion(
      uid: uid,
      actionIds: owedIds,
      cloudListed: remoteIds != null,
    ));

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
    final cloudRemaining = await _settleCloud(
      uid: uid,
      actionIds: owedIds,
      cloudListed: remoteIds != null,
    );
    // Completeness needs both: nothing left that we know of, *and* a
    // successful listing proving there was nothing else. Without the listing
    // this can only report that it did what it could see to do.
    final verified = remoteIds != null;
    if (cloudRemaining == 0 && !capturesRemain && verified) {
      return const DeletionComplete();
    }
    return DeletionPartial(
      cloudCopiesRemaining: cloudRemaining,
      capturesRemain: capturesRemain,
      cloudNotVerified: !verified,
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

    // A retry is the same explicit deletion flow, finishing. If the original
    // attempt could not list — it was offline — this is the moment that debt
    // gets paid, so orphans are picked up now rather than never.
    Set<String>? remoteIds;
    if (!owed.cloudListed) {
      remoteIds = await _inventory.listMirroredActionIds(uid);
    }
    await _settleCloud(
      uid: uid,
      actionIds: {...owed.actionIds, ...?remoteIds},
      cloudListed: owed.cloudListed || remoteIds != null,
    );
  }

  /// Deletes what it can remotely and returns how many documents are still
  /// owed. Clears the pending record only when that number is zero.
  Future<int> _settleCloud({
    required String? uid,
    required Set<String> actionIds,
    required bool cloudListed,
  }) async {
    if (actionIds.isEmpty) {
      // Nothing owed. The record only clears if the emptiness was *verified*;
      // an unlisted cloud with no locally known ids is exactly the orphan
      // case, so the intent is kept and a later launch looks again.
      if (cloudListed) {
        await _preferences.remove(PreferenceKeys.pendingCloudDeletion);
        return 0;
      }
      await _writePending(PendingCloudDeletion(
        uid: uid,
        actionIds: const {},
        cloudListed: false,
      ));
      return 0;
    }
    if (uid == null) {
      // No identity means no way to prove ownership of the documents, so
      // nothing can be deleted and nothing may be claimed.
      return actionIds.length;
    }

    final remaining = await _cloud.deleteMirrored(uid, actionIds);
    if (remaining.isEmpty && cloudListed) {
      await _preferences.remove(PreferenceKeys.pendingCloudDeletion);
      return 0;
    }
    await _writePending(PendingCloudDeletion(
      uid: uid,
      actionIds: remaining,
      cloudListed: cloudListed,
    ));
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
