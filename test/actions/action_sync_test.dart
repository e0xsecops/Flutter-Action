import 'package:action_app/features/actions/application/action_sync_service.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

/// Cloud behaviour with the cloud faked out: no test here touches Firebase.
/// What is real: the SQLite outbox, the repository, and the sync pass.
class _FakeIdentity implements AuthIdentityService {
  _FakeIdentity(this.uid, {this.failureClass});

  String? uid;
  final String? failureClass;
  int calls = 0;

  @override
  String? get lastFailureClass => failureClass;

  @override
  Future<String?> currentOrSignInUid() async {
    calls++;
    return uid;
  }
}

class _RecordingMirror implements ActionCloudMirror {
  final upserts = <(String, ActionItem, Map<String, Object?>)>[];
  String? failWith;

  @override
  Future<void> upsert(String uid, ActionItem item) async {
    if (failWith != null) throw CloudMirrorException(failWith!);
    upserts.add((uid, item, cloudPayloadFor(item)));
  }
}

void main() {
  late ActionsDatabase db;
  late DriftActionRepository repo;
  late _RecordingMirror mirror;

  ActionSyncService serviceWith(AuthIdentityService identity) =>
      ActionSyncService(
        outbox: repo,
        repository: repo,
        identity: identity,
        mirror: mirror,
        clock: () => testNow,
      );

  setUp(() {
    db = memoryDatabase();
    repo = DriftActionRepository(db);
    mirror = _RecordingMirror();
  });

  tearDown(() async => db.close());

  test('local success + cloud success: outbox drains to the right path',
      () async {
    await repo.create(sampleAction('a1', amount: gbp('96.40')));
    await serviceWith(_FakeIdentity('uid-1')).flush();

    expect(mirror.upserts, hasLength(1));
    final (uid, item, _) = mirror.upserts.single;
    expect(uid, 'uid-1');
    expect(item.id, 'a1');
    expect(await repo.pendingCount(), 0);
  });

  test('auth unavailable: everything stays pending with a safe class and a '
      'backoff — and the local Action is untouched', () async {
    await repo.create(sampleAction('a1'));
    await serviceWith(
            _FakeIdentity(null, failureClass: 'operation-not-allowed'))
        .flush();

    expect(mirror.upserts, isEmpty);
    expect(await repo.pendingCount(), 1);
    final entry = (await repo
            .duePending(testNow.add(const Duration(hours: 2))))
        .single;
    expect(entry.attempts, 1);
    expect(entry.lastFailureClass, 'operation-not-allowed');
    expect(await repo.getById('a1'), isNotNull);
  });

  test('mirror failure (permission denied) retains the entry and never '
      'deletes the local Action', () async {
    await repo.create(sampleAction('a1'));
    mirror.failWith = 'permission_denied';
    await serviceWith(_FakeIdentity('uid-1')).flush();

    expect(await repo.pendingCount(), 1);
    final entry = (await repo
            .duePending(testNow.add(const Duration(hours: 2))))
        .single;
    expect(entry.lastFailureClass, 'permission_denied');
    expect((await repo.getById('a1'))!.title, 'Action a1');
  });

  test('network-style failure backs off exponentially but stays bounded',
      () async {
    expect(ActionSyncService.backoffFor(0), const Duration(minutes: 1));
    expect(ActionSyncService.backoffFor(3), const Duration(minutes: 8));
    expect(ActionSyncService.backoffFor(50), const Duration(minutes: 60),
        reason: 'capped, never unbounded');
  });

  test('retrying the same Action id is idempotent: same document, updated '
      'content', () async {
    await repo.create(sampleAction('a1'));
    final service = serviceWith(_FakeIdentity('uid-1'));
    await service.flush();

    // Completed "at" the service's fixed clock so the re-enqueued entry is
    // immediately due on the second pass.
    await repo.complete('a1', at: testNow);
    await service.flush();

    expect(mirror.upserts, hasLength(2));
    final ids = {for (final (_, item, _) in mirror.upserts) item.id};
    expect(ids, {'a1'}, reason: 'both writes target users/uid/actions/a1');
    expect(mirror.upserts.last.$2.status, ActionStatus.completed);
  });

  test('an Action deleted locally before sync simply discharges its entry',
      () async {
    await repo.create(sampleAction('a1'));
    await db.customStatement("DELETE FROM actions WHERE id = 'a1'");
    await serviceWith(_FakeIdentity('uid-1')).flush();

    expect(mirror.upserts, isEmpty);
    expect(await repo.pendingCount(), 0);
  });

  test('the retry queue survives a restart: a new repository over the same '
      'database still owes the upsert', () async {
    await repo.create(sampleAction('a1'));
    mirror.failWith = 'unavailable';
    await serviceWith(_FakeIdentity('uid-1')).flush();

    // Same underlying database, brand-new object graph.
    final repo2 = DriftActionRepository(db);
    expect(await repo2.pendingCount(), 1);
  });

  group('cloud payload minimisation', () {
    test('carries exactly the documented fields and nothing else', () {
      final payload = cloudPayloadFor(sampleAction(
        'a1',
        dueAt: ActionDue(DateTime(2026, 8, 30)),
        amount: gbp('96.40'),
      ));

      expect(payload.keys.toSet(), {
        'schemaVersion', 'id', 'title', 'status', 'urgency', 'category',
        'due', 'dueIsDateOnly', 'amountMinorUnits', 'currency',
        'recommendedNextStep', 'origin',
        'createdAt', 'updatedAt', 'completedAt', 'archivedAt',
      });
      expect(payload['due'], '2026-08-30T00:00:00.000');
      expect(payload['amountMinorUnits'], 9640);
      expect(payload['currency'], 'GBP');
    });

    test('never contains source, summary, prose, steps, facts or evidence',
        () {
      final payload = cloudPayloadFor(sampleAction(
        'a1',
        steps: const [ActionStepItem(title: 'Secret step', order: 0)],
        facts: const [
          ActionFactItem(
            key: 'reference',
            label: 'Account',
            value: 'PRIVATE-1',
            editedByUser: false,
          ),
        ],
      ));

      for (final forbidden in [
        'sourceId', 'summary', 'whyThisMatters', 'steps', 'facts',
        'evidence', 'ocr', 'sourceText', 'reviewedAt',
      ]) {
        expect(payload.containsKey(forbidden), isFalse,
            reason: '$forbidden must stay local');
      }
      expect('$payload'.contains('Secret step'), isFalse);
      expect('$payload'.contains('PRIVATE-1'), isFalse);
      expect('$payload'.contains('src-1'), isFalse);
    });
  });
}
