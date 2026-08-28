import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/features/actions/data/action_cloud_privacy_service.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/cloud_privacy_inventory.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/data/drift_reminder_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/domain/action_repository.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/settings/application/privacy_deletion_service.dart';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';

/// Deleting everything.
///
/// The properties worth defending are all about honesty and ordering: never
/// claim a deletion that did not happen, never destroy the ids needed to
/// finish one, and never leave an alarm or an outbox entry behind that can
/// resurrect what was deleted.

final deleteNow = DateTime(2026, 8, 18, 12);

class _Identity implements AuthIdentityService {
  _Identity(this.uid);
  String? uid;
  @override
  String? lastFailureClass;
  @override
  Future<String?> currentOrSignInUid() async => uid;
}

class _ThrowingIdentity implements AuthIdentityService {
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async =>
      throw StateError('no network');
}

/// Records deletions and can be told to fail, so offline behaviour is
/// exercised without a network.
class _SpyCloud implements ActionCloudPrivacyService {
  final deleted = <String>{};
  final calls = <String>[];
  bool failEverything = false;
  Set<String> failFor = {};

  @override
  Future<Set<String>> deleteMirrored(String uid, Set<String> actionIds) async {
    calls.add(uid);
    if (failEverything) return actionIds;
    final failed = actionIds.intersection(failFor);
    deleted.addAll(actionIds.difference(failed));
    return failed;
  }
}

/// Stands in for the cloud's list of what it holds.
///
/// [failListing] is the offline case, and it is deliberately distinct from an
/// empty list: one means "nothing is up there", the other means "I could not
/// find out", and the whole Day-17 honesty argument rests on the difference.
class _SpyInventory implements CloudPrivacyInventory {
  _SpyInventory([Set<String>? ids]) : remoteIds = ids ?? <String>{};

  Set<String> remoteIds;
  bool failListing = false;
  var listCalls = 0;

  @override
  Future<Set<String>?> listMirroredActionIds(String uid) async {
    listCalls++;
    if (failListing) return null;
    return {...remoteIds};
  }
}

class _BrokenActionRepository implements ActionRepository {
  @override
  Stream<List<ActionItem>> watchAll() =>
      Stream.error(StateError('local store unavailable'));
  @override
  Never noSuchMethod(Invocation invocation) =>
      throw StateError('local store unavailable');
}

void main() {
  late ActionsDatabase db;
  late DriftActionRepository actions;
  late DriftReminderRepository reminders;
  late FakeSourceStore sources;
  late FakeSourceFileStore files;
  late FakeNotificationScheduler scheduler;
  late _Identity identity;
  late _SpyCloud cloud;
  late _SpyInventory inventory;
  late InMemoryPreferenceStore prefs;
  late PrivacyDeletionService service;

  PrivacyDeletionService build({
    ActionRepository? repository,
    AuthIdentityService? auth,
  }) =>
      PrivacyDeletionService(
        actions: repository ?? actions,
        database: db,
        sources: () async => sources,
        sourceFiles: () async => files,
        scheduler: scheduler,
        identity: auth ?? identity,
        cloud: cloud,
        preferences: prefs,
        inventory: inventory,
      );

  setUp(() {
    db = memoryDatabase();
    actions = DriftActionRepository(db);
    reminders = DriftReminderRepository(db);
    sources = FakeSourceStore();
    files = FakeSourceFileStore();
    scheduler = FakeNotificationScheduler();
    identity = _Identity('uid-1');
    cloud = _SpyCloud();
    inventory = _SpyInventory();
    prefs = InMemoryPreferenceStore({
      PreferenceKeys.onboardingCompleted: true,
      PreferenceKeys.themeMode: 'dark',
    });
    service = build();
  });

  tearDown(() async {
    scheduler.dispose();
    await db.close();
  });

  /// A device with something on it: two Actions, a step, a capture and a
  /// scheduled reminder.
  Future<void> seed() async {
    await actions.create(sampleAction('a1', title: 'Water bill',
        steps: [sampleStep('s1', title: 'Pay it')]));
    await actions.create(sampleAction('a2', title: 'Passport'));
    await sources.add(SourceItem(
      id: 'src1',
      type: SourceType.pastedText,
      capturedAt: DateTime(2026, 8, 10),
      pastedText: 'Northgate Water invoice',
      state: SourceProcessingState.ready,
    ));
    await files.save(id: 'src1', bytes: Uint8List(3), extension: 'jpg');
    final reminder = await reminders.createIntent(
      actionId: 'a1',
      scheduledAt: DateTime(2026, 8, 23, 9),
      timeZoneId: 'Asia/Dhaka',
      now: deleteNow,
    );
    await scheduler.schedule(
      platformNotificationId: reminder!.platformNotificationId,
      actionId: 'a1',
      title: 'Water bill',
      scheduledAt: reminder.scheduledAt,
      timeZoneId: reminder.timeZoneId,
    );
  }

  group('deleting everything', () {
    test('removes Actions, steps, captures, files and reminders', () async {
      await seed();
      expect(await actions.watchAll().first, hasLength(2));
      expect(scheduler.scheduled, isNotEmpty);

      final outcome = await service.deleteEverything();

      expect(outcome, isA<DeletionComplete>());
      expect(await actions.watchAll().first, isEmpty);
      expect(await reminders.needingReconciliation(), isEmpty);
      expect(sources.items, isEmpty);
      expect(files.saved, isEmpty);
    });

    test('cancels every scheduled alarm', () async {
      await seed();
      await service.deleteEverything();

      // Nothing may fire for an Action that no longer exists.
      expect(scheduler.scheduled, isEmpty);
      expect(scheduler.cancelLog, isNotEmpty);
      expect(await scheduler.pendingNotificationIds(), isEmpty);
    });

    test('empties the outbox, so nothing can re-upload afterwards', () async {
      await seed();
      final outbox = actions;
      expect(await outbox.pendingCount(), greaterThan(0));

      await service.deleteEverything();

      expect(await outbox.pendingCount(), 0);
      expect(await outbox.duePending(deleteNow), isEmpty);
    });

    test('deletes the mirrored documents for this user only', () async {
      await seed();
      await service.deleteEverything();

      expect(cloud.deleted, {'a1', 'a2'});
      expect(cloud.calls, ['uid-1']);
    });

    test('clears the preferences a user would call theirs', () async {
      await seed();
      await service.deleteEverything();

      expect(prefs.getBool(PreferenceKeys.onboardingCompleted), isNull);
      expect(prefs.getString(PreferenceKeys.themeMode), isNull);
    });

    test('leaves nothing owed when it all worked', () async {
      await seed();
      await service.deleteEverything();

      expect(service.pending, isNull);
    });

    test('an empty device deletes cleanly', () async {
      final outcome = await service.deleteEverything();

      expect(outcome, isA<DeletionComplete>());
      expect(service.pending, isNull);
      expect(cloud.calls, isEmpty, reason: 'nothing to delete remotely');
    });
  });

  group('when the cloud cannot be reached', () {
    test('it does not claim everything was deleted', () async {
      await seed();
      cloud.failEverything = true;

      final outcome = await service.deleteEverything();

      expect(outcome, isA<DeletionPartial>());
      expect((outcome as DeletionPartial).cloudCopiesRemaining, 2);
    });

    test('local data still goes, so the device is genuinely clean', () async {
      await seed();
      cloud.failEverything = true;

      await service.deleteEverything();

      expect(await actions.watchAll().first, isEmpty);
      expect(sources.items, isEmpty);
      expect(scheduler.scheduled, isEmpty);
    });

    test('what is still owed is remembered, with the ids intact', () async {
      await seed();
      cloud.failEverything = true;

      await service.deleteEverything();

      final owed = service.pending;
      expect(owed, isNotNull);
      expect(owed!.uid, 'uid-1');
      expect(owed.actionIds, {'a1', 'a2'});
    });

    test('a partial failure remembers only what is left', () async {
      await seed();
      cloud.failFor = {'a2'};

      final outcome = await service.deleteEverything();

      expect((outcome as DeletionPartial).cloudCopiesRemaining, 1);
      expect(cloud.deleted, {'a1'});
      expect(service.pending!.actionIds, {'a2'});
    });

    test('no identity means nothing is claimed and the ids are kept',
        () async {
      await seed();
      identity.uid = null;

      final outcome = await service.deleteEverything();

      expect(outcome, isA<DeletionPartial>());
      expect(cloud.calls, isEmpty, reason: 'ownership could not be proven');
      expect(service.pending!.actionIds, {'a1', 'a2'});
      expect(service.pending!.uid, isNull);
    });

    test('an identity that throws does not stop local deletion', () async {
      await seed();
      final broken = build(auth: _ThrowingIdentity());

      final outcome = await broken.deleteEverything();

      expect(outcome, isA<DeletionPartial>());
      expect(await actions.watchAll().first, isEmpty);
    });
  });

  group('finishing later', () {
    test('a retry deletes what was owed and clears the record', () async {
      await seed();
      cloud.failEverything = true;
      await service.deleteEverything();
      expect(service.pending, isNotNull);

      cloud.failEverything = false;
      await service.retryPendingCloudDeletion();

      expect(cloud.deleted, {'a1', 'a2'});
      expect(service.pending, isNull);
    });

    test('a retry that fails again keeps the record', () async {
      await seed();
      cloud.failEverything = true;
      await service.deleteEverything();

      await service.retryPendingCloudDeletion();

      expect(service.pending!.actionIds, {'a1', 'a2'});
    });

    test('a retry resolves an identity that was missing at the time',
        () async {
      await seed();
      identity.uid = null;
      await service.deleteEverything();
      expect(service.pending!.uid, isNull);

      identity.uid = 'uid-1';
      await service.retryPendingCloudDeletion();

      expect(cloud.deleted, {'a1', 'a2'});
      expect(service.pending, isNull);
    });

    test('retrying with nothing owed is a no-op', () async {
      await service.retryPendingCloudDeletion();
      expect(cloud.calls, isEmpty);
    });

    test('the record survives a process restart', () async {
      await seed();
      cloud.failEverything = true;
      await service.deleteEverything();

      // A brand-new service over the same preference store is exactly what
      // the next launch builds.
      final afterRestart = build();
      expect(afterRestart.pending!.actionIds, {'a1', 'a2'});

      cloud.failEverything = false;
      await afterRestart.retryPendingCloudDeletion();
      expect(afterRestart.pending, isNull);
    });

    test('a corrupt record is treated as nothing owed, not a crash', () async {
      await prefs.setString(
          PreferenceKeys.pendingCloudDeletion, 'not json at all');

      expect(service.pending, isNull);
      await service.retryPendingCloudDeletion();
      expect(cloud.calls, isEmpty);
    });
  });

  group('crash safety', () {
    test('the intent is written before anything is destroyed', () async {
      await seed();
      // Captures are cleared *after* the database wipe, so failing them puts
      // the process past the point of no return. The record of what is owed
      // remotely must already exist by then, because the ids it holds have
      // just been deleted from the only other place they lived.
      sources.failOnClear = true;

      final outcome = await service.deleteEverything();

      expect(service.pending, isNull,
          reason: 'the cloud deletion itself succeeded here');
      expect(await actions.watchAll().first, isEmpty);
      // And it does not pretend the captures went with them.
      expect(outcome, isA<DeletionPartial>());
      expect((outcome as DeletionPartial).capturesRemain, isTrue);
    });

    test('captures failing does not get reported as total failure', () async {
      await seed();
      sources.failOnClear = true;
      cloud.failEverything = true;

      final outcome = await service.deleteEverything();

      // Both leftovers are reported, and the Actions really are gone.
      final partial = outcome as DeletionPartial;
      expect(partial.capturesRemain, isTrue);
      expect(partial.cloudCopiesRemaining, 2);
      expect(await actions.watchAll().first, isEmpty);
    });

    test('a dead database is reported, not thrown, and clears nothing',
        () async {
      await seed();
      await db.close();

      final outcome = await service.deleteEverything();

      // It fails at the read, which is the first thing that touches the
      // database — so nothing was destroyed and nothing was promised.
      expect(outcome, isA<DeletionFailed>());
      expect((outcome as DeletionFailed).failureClass, 'local_read_failed');
      expect(service.pending, isNull);
      expect(prefs.getBool(PreferenceKeys.onboardingCompleted), isTrue);
      expect(sources.items, isNotEmpty);

      // Reopen so tearDown has something to close.
      db = memoryDatabase();
    });

    test('a failed local read changes nothing and claims nothing', () async {
      final broken = build(repository: _BrokenActionRepository());

      final outcome = await broken.deleteEverything();

      expect(outcome, isA<DeletionFailed>());
      expect((outcome as DeletionFailed).failureClass, 'local_read_failed');
      expect(broken.pending, isNull, reason: 'no intent was ever recorded');
      expect(prefs.getBool(PreferenceKeys.onboardingCompleted), isTrue);
    });

    test('a scheduler that cannot cancel does not block deletion', () async {
      await seed();
      scheduler.failCancel = true;

      final outcome = await service.deleteEverything();

      expect(outcome, isA<DeletionComplete>());
      expect(await actions.watchAll().first, isEmpty);
    });
  });

  group('clearing captures only', () {
    test('removes captures and their files but keeps Actions', () async {
      await seed();

      await service.clearCaptures();

      expect(sources.items, isEmpty);
      expect(files.saved, isEmpty);
      expect(await actions.watchAll().first, hasLength(2));
    });

    test('leaves reminders and the cloud alone', () async {
      await seed();

      await service.clearCaptures();

      expect(scheduler.scheduled, isNotEmpty);
      expect(cloud.calls, isEmpty);
      expect(service.pending, isNull);
    });
  });


  /// The Day-14 debt, paid.
  ///
  /// A mirror document whose local Action disappeared before it could be
  /// deleted — a reinstall, a wiped database, a crash between the mirror
  /// write and the local commit — has an id that nothing on this device
  /// knows. Day 14 could not reach it, and said so. Day 17 asks the cloud
  /// what it holds, but *only* here, and only ids.
  group('orphaned cloud mirrors', () {
    test('a document the device never knew about is still deleted', () async {
      await seed(); // a1, a2 locally
      inventory.remoteIds = {'a1', 'a2', 'orphan-from-old-install'};

      final outcome = await service.deleteEverything();

      expect(outcome, isA<DeletionComplete>());
      expect(cloud.deleted, {'a1', 'a2', 'orphan-from-old-install'});
    });

    test('an orphan is deleted even when nothing is left locally', () async {
      // The worst version of the case: the local database is already empty,
      // so without listing there would be nothing to ask the cloud about.
      inventory.remoteIds = {'orphan-a', 'orphan-b'};

      final outcome = await service.deleteEverything();

      expect(outcome, isA<DeletionComplete>());
      expect(cloud.deleted, {'orphan-a', 'orphan-b'});
    });

    test('listing happens once, and only inside the deletion', () async {
      await seed();
      expect(inventory.listCalls, 0, reason: 'nothing lists before the flow');

      await service.deleteEverything();

      expect(inventory.listCalls, 1);
    });

    test('the cloud is asked only about this user', () async {
      await seed();
      inventory.remoteIds = {'a1'};
      await service.deleteEverything();
      expect(cloud.calls, ['uid-1']);
    });

    test('a listing that fails is never reported as complete', () async {
      await seed();
      inventory.failListing = true;

      final outcome = await service.deleteEverything();

      // Every document the device could name went, and the flow still refuses
      // to claim the job is done — because it could not check for orphans.
      expect(cloud.deleted, {'a1', 'a2'});
      final partial = outcome as DeletionPartial;
      expect(partial.cloudNotVerified, isTrue);
      expect(partial.cloudCopiesRemaining, 0);
      expect(partial.capturesRemain, isFalse);
    });

    test('an unverified cloud keeps the record, even with nothing owed',
        () async {
      inventory.failListing = true;

      await service.deleteEverything();

      // Nothing is owed by id, but the question is still open, so the record
      // survives to make a later launch look again.
      final owed = service.pending;
      expect(owed, isNotNull);
      expect(owed!.isEmpty, isFalse);
      expect(owed.cloudListed, isFalse);
    });

    test('a verified empty cloud clears the record', () async {
      inventory.remoteIds = {};

      final outcome = await service.deleteEverything();

      expect(outcome, isA<DeletionComplete>());
      expect(service.pending, isNull);
    });

    test('a retry performs the listing the first attempt could not', () async {
      await seed();
      inventory.failListing = true;
      await service.deleteEverything();
      expect(service.pending!.cloudListed, isFalse);

      // Network is back: the orphan becomes visible and is removed.
      inventory.failListing = false;
      inventory.remoteIds = {'orphan-from-old-install'};
      await service.retryPendingCloudDeletion();

      expect(cloud.deleted, contains('orphan-from-old-install'));
      expect(service.pending, isNull);
    });

    test('a retry does not re-list when the first attempt already did',
        () async {
      await seed();
      inventory.remoteIds = {'a1', 'a2'};
      cloud.failFor = {'a2'}; // one delete fails, so a retry is owed
      await service.deleteEverything();
      expect(inventory.listCalls, 1);
      expect(service.pending!.cloudListed, isTrue);

      cloud.failFor = {};
      await service.retryPendingCloudDeletion();

      // The set was already established; asking again would be a remote read
      // with nothing to learn.
      expect(inventory.listCalls, 1);
      expect(service.pending, isNull);
    });

    test('listing is skipped entirely when there is no identity', () async {
      await seed();
      identity.uid = null;

      await service.deleteEverything();

      // No uid means no owner-scoped path to list, and nothing may be claimed.
      expect(inventory.listCalls, 0);
      expect(service.pending!.actionIds, {'a1', 'a2'});
    });

    test('the record remembers that the cloud was listed', () async {
      await seed();
      inventory.remoteIds = {'a1', 'a2'};
      cloud.failFor = {'a1'};

      await service.deleteEverything();

      final stored = PendingCloudDeletion.decode(
        prefs.getString(PreferenceKeys.pendingCloudDeletion),
      );
      expect(stored!.cloudListed, isTrue);
      expect(stored.actionIds, {'a1'});
    });

    test('a pre-Day-17 record decodes as not-yet-listed', () {
      // Records written before this existed carry no flag. Treating the
      // absence as "listed" would silently inherit the old blind spot.
      const legacy = '{"uid":"uid-1","ids":["a1"]}';
      final decoded = PendingCloudDeletion.decode(legacy)!;
      expect(decoded.cloudListed, isFalse);
      expect(decoded.actionIds, {'a1'});
    });

    test('nothing local and a verified empty cloud is a clean no-op', () async {
      final outcome = await service.deleteEverything();
      expect(outcome, isA<DeletionComplete>());
      expect(cloud.calls, isEmpty, reason: 'no ids means no delete call');
      expect(service.pending, isNull);
    });
  });

  group('the pending record itself', () {
    test('round-trips', () {
      const original =
          PendingCloudDeletion(uid: 'uid-9', actionIds: {'a', 'b'});
      final decoded = PendingCloudDeletion.decode(original.encode())!;

      expect(decoded.uid, 'uid-9');
      expect(decoded.actionIds, {'a', 'b'});
    });

    test('carries ids and a uid, and nothing else', () {
      const record =
          PendingCloudDeletion(uid: 'uid-9', actionIds: {'a1'});
      final encoded = record.encode();

      // Nothing about what the Action was.
      expect(encoded, contains('uid-9'));
      expect(encoded, contains('a1'));
      expect(encoded.toLowerCase(), isNot(contains('title')));
      expect(encoded.toLowerCase(), isNot(contains('amount')));
      expect(encoded.toLowerCase(), isNot(contains('due')));
    });

    test('a null uid round-trips', () {
      const record = PendingCloudDeletion(uid: null, actionIds: {'a1'});
      expect(PendingCloudDeletion.decode(record.encode())!.uid, isNull);
    });
  });
}
