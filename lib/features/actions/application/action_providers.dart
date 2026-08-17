import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/action_cloud_mirror.dart';
import '../data/actions_database.dart';
import '../data/auth_identity_service.dart';
import '../data/drift_action_repository.dart';
import '../domain/action_item.dart';
import '../domain/action_repository.dart';
import 'action_sync_service.dart';

/// Semantic Action lifecycle events. Names only — a title, an amount or a
/// deadline must never ride along.
abstract final class ActionEvents {
  static const created = 'action_created';
  static const completed = 'action_completed';
  static const archived = 'action_archived';
  static const localPersistenceFailed = 'action_local_persistence_failed';
  static const cloudMirrorSucceeded = 'action_cloud_mirror_succeeded';
  static const cloudMirrorFailed = 'action_cloud_mirror_failed';
}

/// One database for the whole app. Opening is lazy (first query), so app
/// startup never waits on SQLite; open failures surface through the watch
/// stream as an error state — never as a silent recreate, because wiping a
/// table of user commitments to fix a schema hiccup is the one repair this
/// store is not allowed to make.
final actionsDatabaseProvider = Provider<ActionsDatabase>((ref) {
  final db = ActionsDatabase(driftDatabase(name: 'actions'));
  ref.onDispose(db.close);
  return db;
});

final _driftRepositoryProvider = Provider<DriftActionRepository>(
  (ref) => DriftActionRepository(ref.watch(actionsDatabaseProvider)),
);

final actionRepositoryProvider = Provider<ActionRepository>(
  (ref) => ref.watch(_driftRepositoryProvider),
);

final actionSyncOutboxProvider = Provider<ActionSyncOutbox>(
  (ref) => ref.watch(_driftRepositoryProvider),
);

final authIdentityServiceProvider = Provider<AuthIdentityService>(
  (ref) => FirebaseAuthIdentityService(),
);

final actionCloudMirrorProvider = Provider<ActionCloudMirror>(
  (ref) => FirestoreActionCloudMirror(),
);

final actionSyncServiceProvider = Provider<ActionSyncService>(
  (ref) => ActionSyncService(
    outbox: ref.watch(actionSyncOutboxProvider),
    repository: ref.watch(actionRepositoryProvider),
    identity: ref.watch(authIdentityServiceProvider),
    mirror: ref.watch(actionCloudMirrorProvider),
  ),
);

/// What Home watches. Database errors arrive as AsyncError — shown as a safe
/// error state, distinct from "no Actions yet".
final actionsStreamProvider = StreamProvider<List<ActionItem>>(
  (ref) => ref.watch(actionRepositoryProvider).watchAll(),
);
