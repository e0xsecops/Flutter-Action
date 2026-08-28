import 'package:action_app/core/firebase/firebase_gate.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/application/action_sync_service.dart';
import 'package:action_app/features/actions/application/action_triage.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/search/application/action_search_service.dart';
import 'package:action_app/features/search/domain/search_query.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../support/scale_fixtures.dart';

/// Day-16 scale behaviour, pinned.
///
/// These are **catastrophe detectors, not benchmarks.** Every threshold is set
/// far above what the work actually costs — measured on a development machine
/// at roughly 1 ms for triaging 500 Actions and 20 ms for searching them — so
/// a slow or contended CI machine still passes while an accidental quadratic
/// or a per-item database query does not. Asserting real timings here would
/// buy a flaky suite and no extra safety.
///
/// The shape checks matter more than the clocks. "triage does not grow
/// quadratically" and the capture-read counts fail on the wrong *algorithm*
/// regardless of how fast the machine running them is.
class _CountingSourceStore implements SourceStore {
  _CountingSourceStore(this._items);
  final List<SourceItem> _items;
  var allCalls = 0;

  @override
  Future<List<SourceItem>> all() async {
    allCalls++;
    return _items;
  }

  @override
  Future<SourceItem?> byId(String id) async =>
      _items.where((i) => i.id == id).firstOrNull;
  @override
  Future<void> add(SourceItem item) async {}
  @override
  Future<void> update(SourceItem item) async {}
  @override
  Future<void> delete(String id) async {}
  @override
  Future<void> clear() async {}
}

class _StubIdentity implements AuthIdentityService {
  _StubIdentity(this.uid);
  final String? uid;
  var calls = 0;

  @override
  String? get lastFailureClass => null;

  @override
  Future<String?> currentOrSignInUid() async {
    calls++;
    return uid;
  }
}

class _CountingMirror implements ActionCloudMirror {
  var upserts = 0;

  @override
  Future<void> upsert(String uid, ActionItem item) async => upserts++;
}

/// Best of [runs], to take the machine's worst scheduling noise out.
int _fastestMicros(int runs, void Function() body) {
  var best = -1;
  for (var i = 0; i < runs; i++) {
    final sw = Stopwatch()..start();
    body();
    sw.stop();
    if (best < 0 || sw.elapsedMicroseconds < best) best = sw.elapsedMicroseconds;
  }
  return best;
}

Future<int> _fastestMicrosAsync(int runs, Future<void> Function() body) async {
  var best = -1;
  for (var i = 0; i < runs; i++) {
    final sw = Stopwatch()..start();
    await body();
    sw.stop();
    if (best < 0 || sw.elapsedMicroseconds < best) best = sw.elapsedMicroseconds;
  }
  return best;
}

void main() {
  group('triage at scale', () {
    test('500 Actions triage well inside a generous budget', () {
      final actions = ScaleFixtures.syntheticActions(500);
      final reminders = ScaleFixtures.syntheticNextReminders(100);
      triageHome(actions, now: ScaleFixtures.now, nextReminders: reminders);

      final micros = _fastestMicros(
        5,
        () => triageHome(
          actions,
          now: ScaleFixtures.now,
          nextReminders: reminders,
        ),
      );

      // ~1 ms measured; a 40x ceiling still catches a real regression.
      expect(micros, lessThan(40000), reason: '${micros}us to triage 500');
    });

    test('triage does not grow quadratically', () {
      int cost(int n) {
        final actions = ScaleFixtures.syntheticActions(n);
        final reminders = ScaleFixtures.syntheticNextReminders(n ~/ 5);
        triageHome(actions, now: ScaleFixtures.now, nextReminders: reminders);
        return _fastestMicros(
          5,
          () => triageHome(
            actions,
            now: ScaleFixtures.now,
            nextReminders: reminders,
          ),
        );
      }

      final small = cost(250);
      final large = cost(1000);
      // Four times the data. Linear/N-log-N lands near 4-5x; quadratic would
      // be 16x or worse. Ten is a wide, deliberately un-flaky line between
      // the two.
      expect(
        large,
        lessThan(small * 10 + 20000),
        reason: '250 -> ${small}us, 1000 -> ${large}us',
      );
    });

    test('every Action is decided exactly once, archived ones excluded', () {
      final actions = ScaleFixtures.syntheticActions(500);
      final home = triageHome(actions, now: ScaleFixtures.now);

      final archived =
          actions.where((a) => a.status == ActionStatus.archived).length;
      expect(archived, greaterThan(0), reason: 'fixture must exercise archive');
      expect(home.decisions.length, actions.length - archived);
      expect(
        home.needsAttention.length + home.upcoming.length + home.completed.length,
        actions.length - archived,
      );
    });
  });

  group('Home data pipeline', () {
    test('hydrating 500 Actions takes a bounded number of queries', () async {
      final db = memoryDatabase();
      addTearDown(db.close);
      final repo = DriftActionRepository(db);
      for (final a in ScaleFixtures.syntheticActions(500)) {
        await repo.create(a);
      }

      final loaded = await repo.watchAll().first;
      expect(loaded.length, 500);
      // Steps and facts arrived with them: proof the hydration is three
      // queries rather than one per card.
      expect(loaded.where((a) => a.steps.isNotEmpty).length, greaterThan(100));
      expect(loaded.every((a) => a.facts.isNotEmpty), isTrue);

      final micros = await _fastestMicrosAsync(3, () => repo.watchAll().first);
      // ~11 ms measured.
      expect(micros, lessThan(400000), reason: '${micros}us for 500');
    });

    test('opening one Action stays flat as the corpus grows', () async {
      final db = memoryDatabase();
      addTearDown(db.close);
      final repo = DriftActionRepository(db);
      for (final a in ScaleFixtures.syntheticActions(500)) {
        await repo.create(a);
      }
      await repo.create(
        sampleAction('long', steps: ScaleFixtures.longChain(100)),
      );

      final item = await repo.getById('long');
      expect(item!.steps.length, 100);
      expect(item.steps.first.order, 0);
      expect(item.steps.last.order, 99);

      final micros = await _fastestMicrosAsync(5, () => repo.getById('long'));
      // ~0.4 ms measured against 500 Actions and 1100 steps. A per-step query
      // would be far outside this.
      expect(micros, lessThan(60000), reason: '${micros}us to open a 100-step chain');
    });
  });

  group('search at scale', () {
    late DriftActionRepository repo;
    late _CountingSourceStore store;
    late ActionSearchService service;

    setUp(() async {
      final db = memoryDatabase();
      addTearDown(db.close);
      repo = DriftActionRepository(db);
      for (final a in ScaleFixtures.syntheticActions(500)) {
        await repo.create(a);
      }
      store = _CountingSourceStore(ScaleFixtures.syntheticSources(100));
      service = ActionSearchService(actions: repo, sources: () async => store);
    });

    test('500 Actions and 100 captures answer inside a generous budget',
        () async {
      await service.search(
        const SearchQuery(text: 'north'),
        now: ScaleFixtures.now,
      );

      final micros = await _fastestMicrosAsync(
        3,
        () => service.search(
          const SearchQuery(text: 'north'),
          now: ScaleFixtures.now,
        ),
      );
      // ~20 ms measured.
      expect(micros, lessThan(600000), reason: '${micros}us for 500+100');
    });

    test('a capture is read once per query, never once per result', () async {
      store.allCalls = 0;
      await service.search(
        const SearchQuery(text: 'northgate'),
        now: ScaleFixtures.now,
      );
      expect(store.allCalls, 1);
    });

    test('typing a word does not re-read captures per letter', () async {
      store.allCalls = 0;
      for (final q in ['n', 'no', 'nor', 'north', 'northgate']) {
        await service.search(SearchQuery(text: q), now: ScaleFixtures.now);
      }
      // Four, not five: a single character is below the threshold at which
      // capture text is searched at all.
      expect(store.allCalls, 4);
    });

    test('a long OCR body is returned as a bounded snippet', () async {
      final results = await service.search(
        const SearchQuery(text: 'northgate'),
        now: ScaleFixtures.now,
      );
      expect(results.sources, isNotEmpty);
      for (final r in results.sources) {
        // The body is ~220 words; what reaches the screen must not be.
        expect(r.match.snippet.length, lessThanOrEqualTo(120));
      }
    });
  });

  group('cloud work cannot freeze a launch', () {
    test('a large backlog still drains one bounded pass at a time', () async {
      final db = memoryDatabase();
      addTearDown(db.close);
      final repo = DriftActionRepository(db);
      // 50 Actions, each owing the mirror an upsert.
      for (final a in ScaleFixtures.syntheticActions(50)) {
        await repo.create(a);
      }
      expect(await repo.pendingCount(), 50);

      final identity = _StubIdentity('uid-1');
      final mirror = _CountingMirror();
      final service = ActionSyncService(
        outbox: repo,
        repository: repo,
        identity: identity,
        mirror: mirror,
        clock: () => ScaleFixtures.now,
      );

      await service.flush();
      // One pass is capped, so a backlog cannot turn startup into 50 round
      // trips before the inbox responds.
      expect(mirror.upserts, 10);
      expect(await repo.pendingCount(), 40);
      // And it signed in once, not once per row.
      expect(identity.calls, 1);
    });

    test('a second flush while one is running is ignored, not queued',
        () async {
      final db = memoryDatabase();
      addTearDown(db.close);
      final repo = DriftActionRepository(db);
      for (final a in ScaleFixtures.syntheticActions(20)) {
        await repo.create(a);
      }
      final mirror = _CountingMirror();
      final service = ActionSyncService(
        outbox: repo,
        repository: repo,
        identity: _StubIdentity('uid-1'),
        mirror: mirror,
        clock: () => ScaleFixtures.now,
      );

      await Future.wait([service.flush(), service.flush(), service.flush()]);
      expect(mirror.upserts, 10);
    });

    test('a closed gate reports an outage rather than throwing', () async {
      // Firebase never came up. Day 16 made that reachable by design, so it
      // has to be an answer the outbox understands.
      final never = FirebaseGate(Future<bool>.value(false));
      final identity = FirebaseAuthIdentityService(gate: never);
      expect(await identity.currentOrSignInUid(), isNull);
      expect(identity.lastFailureClass, 'firebase_unavailable');
    });
  });

  group('the local day turns over on its own', () {
    test('a date-only deadline becomes overdue after midnight', () {
      // The Day-11 limitation, closed: nothing about the data changes here,
      // only the calendar.
      final due = ActionDue(DateTime(2026, 8, 28));
      expect(
        dueRelationFor(due, DateTime(2026, 8, 28, 23, 59)),
        DueRelation.today,
      );
      expect(
        dueRelationFor(due, DateTime(2026, 8, 29, 0, 1)),
        DueRelation.overdue,
      );
    });

    test('one timer re-arms across the boundary and is cancelled on dispose',
        () {
      fakeAsync((async) {
        var now = DateTime(2026, 8, 28, 23, 59);
        final container = ProviderContainer(
          overrides: [appClockProvider.overrideWithValue(() => now)],
        );

        expect(container.read(localDayProvider), DateTime(2026, 8, 28));
        // Exactly one pending timer: not a tick, not a poll.
        expect(async.periodicTimerCount, 0);
        expect(async.nonPeriodicTimerCount, 1);

        now = DateTime(2026, 8, 29, 0, 1);
        async.elapse(const Duration(minutes: 3));
        expect(container.read(localDayProvider), DateTime(2026, 8, 29));

        // Re-armed for the next boundary rather than fired once and forgotten.
        expect(async.nonPeriodicTimerCount, 1);

        now = DateTime(2026, 8, 30, 0, 1);
        async.elapse(const Duration(days: 1));
        expect(container.read(localDayProvider), DateTime(2026, 8, 30));

        container.dispose();
        // Nothing outlives the provider.
        expect(async.nonPeriodicTimerCount, 0);
      });
    });
  });
}
