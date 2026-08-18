import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/domain/action_repository.dart';
import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/search/application/action_search_service.dart';
import 'package:action_app/features/search/domain/search_query.dart';
import 'package:action_app/features/search/domain/search_result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';

/// Local search, against a real database and a real source store.
///
/// The two properties that matter most: an identifier the user types is found
/// *exactly* as typed, and nothing here ever leaves the device.
final searchNow = DateTime(2026, 8, 18, 12); // Tue 18 Aug 2026, midday

class _MemSourceStore implements SourceStore {
  _MemSourceStore([List<SourceItem> items = const []]) {
    for (final i in items) {
      _items[i.id] = i;
    }
  }

  final _items = <String, SourceItem>{};
  bool failOnRead = false;

  @override
  Future<List<SourceItem>> all() async {
    if (failOnRead) throw StateError('source store unavailable');
    return _items.values.toList();
  }

  @override
  Future<SourceItem?> byId(String id) async => _items[id];
  @override
  Future<void> add(SourceItem item) async => _items[item.id] = item;
  @override
  Future<void> update(SourceItem item) async => _items[item.id] = item;
  @override
  Future<void> delete(String id) async => _items.remove(id);
  @override
  Future<void> clear() async => _items.clear();
}

SourceItem pasted(String id, String text, {DateTime? at}) => SourceItem(
      id: id,
      type: SourceType.pastedText,
      capturedAt: at ?? DateTime(2026, 8, 10),
      pastedText: text,
      state: SourceProcessingState.ready,
    );

SourceItem scanned(String id, String raw, String normalized) => SourceItem(
      id: id,
      type: SourceType.photo,
      capturedAt: DateTime(2026, 8, 11),
      imagePath: '/fake/$id.jpg',
      state: SourceProcessingState.ready,
      ocr: OcrOutcome(
        rawText: raw,
        normalizedText: normalized,
        lines: const [],
        engine: 'test',
        processedAt: DateTime(2026, 8, 11),
        durationMs: 5,
      ),
    );

void main() {
  late ActionsDatabase db;
  late DriftActionRepository actions;
  late _MemSourceStore sources;
  late ActionSearchService service;

  setUp(() {
    db = memoryDatabase();
    actions = DriftActionRepository(db);
    sources = _MemSourceStore();
    service = ActionSearchService(
      actions: actions,
      sources: () async => sources,
    );
  });

  tearDown(() async => db.close());

  Future<SearchResultSet> find(String text, {SearchFilters? filters}) =>
      service.search(
        SearchQuery(text: text, filters: filters ?? const SearchFilters()),
        now: searchNow,
      );

  List<String> idsOf(SearchResultSet set) =>
      [for (final r in set.actions) r.action.id];

  group('finding an Action by name', () {
    setUp(() async {
      await actions.create(sampleAction('a1',
          title: 'Northgate Water invoice'));
      await actions.create(sampleAction('a2', title: 'Water the plants'));
      await actions.create(sampleAction('a3', title: 'Renew the passport'));
    });

    test('an exact title wins over a partial one', () async {
      await actions.create(sampleAction('exact', title: 'Water'));
      final results = await find('Water');

      expect(results.actions.first.action.id, 'exact');
      expect(results.actions.first.match.field, MatchField.titleExact);
    });

    test('a prefix outranks a mention in the middle', () async {
      final results = await find('Water');
      // "Water the plants" starts with it; "Northgate Water invoice" merely
      // contains it.
      expect(idsOf(results).take(2), ['a2', 'a1']);
    });

    test('matching ignores case', () async {
      expect(idsOf(await find('nORTHGATE')), contains('a1'));
    });

    test('a single character still finds Actions', () async {
      // Short is not useless for a list of names.
      expect(idsOf(await find('R')), contains('a3'));
    });

    test('a query that matches nothing says so', () async {
      final results = await find('helicopter');
      expect(results.isEmpty, isTrue);
      expect(results.hasFailure, isFalse,
          reason: 'no matches is not a failure');
    });

    test('an empty query returns nothing at all', () async {
      final results = await find('   ');
      expect(results.total, 0);
    });
  });

  group('finding a reference', () {
    Future<void> seedRef(String id, String value) => actions.create(
          sampleAction(id, title: 'Some bill', facts: [
            ActionFactItem(
              key: 'reference',
              label: 'Reference number',
              value: value,
              editedByUser: false,
            ),
          ]),
        );

    test('a hyphenated reference is found exactly as typed', () async {
      // The reason this search is not built on FTS5: its tokeniser splits on
      // the hyphen and this query becomes a syntax error.
      await seedRef('a1', 'INV-2048');
      final results = await find('INV-2048');

      expect(idsOf(results), ['a1']);
      expect(results.actions.single.match.field, MatchField.factExact);
      expect(results.actions.single.match.label, 'Reference number');
    });

    test('a reference with slashes survives', () async {
      await seedRef('a1', '88/2043/11');
      expect(idsOf(await find('88/2043/11')), ['a1']);
    });

    test('leading zeroes are not numerically eaten', () async {
      await seedRef('a1', '00042');
      await seedRef('a2', '42');

      expect(idsOf(await find('00042')), ['a1'],
          reason: '00042 is not the number 42');
    });

    test('a partial reference still finds it, ranked below an exact hit',
        () async {
      await seedRef('exact', 'INV-2048');
      await seedRef('partial', 'INV-2048-B');
      final results = await find('INV-2048');

      expect(results.actions.first.action.id, 'exact');
      expect(results.actions.first.match.field, MatchField.factExact);
      expect(idsOf(results), containsAll(['exact', 'partial']));
    });

    test('a reference is never fuzzily corrected', () async {
      await seedRef('a1', 'INV-2048');
      // One character out is a different reference, not a typo to fix.
      expect(await find('INV-2049'), isA<SearchResultSet>()
          .having((r) => r.actions, 'actions', isEmpty));
    });
  });

  group('finding money and dates as written', () {
    test('an exact amount is found', () async {
      await actions.create(sampleAction('a1',
          title: 'Water bill', amount: gbp('58.20')));
      await actions.create(sampleAction('a2', title: 'Amount 58.20 in title'));

      // The amount lives in the title text here; the point is that the digits
      // are matched exactly as written.
      expect(idsOf(await find('58.20')), contains('a2'));
    });

    test('58.2 and 5820 are not the same as 58.20', () async {
      await actions.create(sampleAction('a1', title: 'Pay 58.20 now'));
      expect(idsOf(await find('5820')), isEmpty);
      expect(idsOf(await find('58.2')), contains('a1'),
          reason: '58.2 is a genuine substring; that is honest, not fuzzy');
    });

    test('an ambiguous numeric date is matched literally, never interpreted',
        () async {
      await actions.create(sampleAction('a1', title: 'Renewal 03/09/2026'));
      // No attempt to decide whether that is March or September.
      expect(idsOf(await find('03/09/2026')), ['a1']);
    });
  });

  group('finding by what is inside an Action', () {
    test('a chain step is searchable', () async {
      await actions.create(sampleAction('a1', title: 'Renew the passport',
          steps: [sampleStep('s1', title: 'Upload the signed form')]));

      final results = await find('signed form');
      expect(idsOf(results), ['a1']);
      expect(results.actions.single.match.field, MatchField.stepTitle);
      expect(results.actions.single.match.label, 'Step');
    });

    test('the reviewed next step is searchable', () async {
      await actions.create(sampleAction('a1', title: 'Pay the bill')
          .withEdits(updatedAt: searchNow,
              recommendedNextStep: 'Call the billing team'));

      final results = await find('billing team');
      expect(results.actions.single.match.field,
          MatchField.recommendedNextStep);
    });

    test('an Action matching in three places is still one result', () async {
      await actions.create(sampleAction('a1',
        title: 'Water bill',
        steps: [sampleStep('s1', title: 'Pay the water bill')],
        facts: const [
          ActionFactItem(
            key: 'organisation',
            label: 'Biller',
            value: 'Northgate Water',
            editedByUser: false,
          ),
        ],
      ));

      final results = await find('water');
      expect(results.actions, hasLength(1),
          reason: 'three matching fields is not three results');
      // The best match explains it; the rest are counted, not listed.
      expect(results.actions.single.match.field, MatchField.titlePrefix);
      expect(results.actions.single.otherMatchCount, greaterThan(0));
    });
  });

  group('finding a capture', () {
    test('pasted text is searchable', () async {
      await sources.add(pasted('s1', 'Riverford Energy renewal notice'));
      final results = await find('renewal');

      expect(results.sources, hasLength(1));
      expect(results.sources.single.source.id, 's1');
      expect(results.sources.single.match.label, 'From capture');
    });

    test('recognised text is searched through its normalised form', () async {
      await sources.add(scanned('s1', 'RAW  text HERE', 'normalised text here'));
      final results = await find('normalised text');

      expect(results.sources, hasLength(1));
      // The raw capture is left exactly as it was.
      expect(results.sources.single.source.ocr!.rawText, 'RAW  text HERE');
    });

    test('a one-character query does not open every capture', () async {
      await sources.add(pasted('s1', 'a long private letter about money'));
      final results = await find('a');

      expect(results.sources, isEmpty,
          reason: 'one character would put every capture on screen');
    });

    test('two characters is enough', () async {
      await sources.add(pasted('s1', 'renewal notice'));
      expect((await find('re')).sources, hasLength(1));
    });

    test('a snippet is a window, never the whole body', () async {
      final long = '${'padding ' * 60}needle${' padding' * 60}';
      await sources.add(pasted('s1', long));

      final snippet = (await find('needle')).sources.single.match.snippet;
      expect(snippet.length, lessThan(long.length));
      expect(snippet, contains('needle'));
      expect(snippet, startsWith('…'));
    });

    test('an Action and the capture behind it are separate results', () async {
      await actions.create(sampleAction('a1', title: 'Renewal'));
      await sources.add(pasted('s1', 'Renewal notice text'));

      final results = await find('renewal');
      expect(results.actions, hasLength(1));
      expect(results.sources, hasLength(1),
          reason: 'they are different objects and must stay distinguishable');
    });
  });

  group('unicode', () {
    test('accented text is preserved and matched', () async {
      await actions.create(sampleAction('a1', title: 'Renouveler le passeport'));
      expect(idsOf(await find('renouveler')), ['a1']);
    });

    test('German case folding works', () async {
      await actions.create(sampleAction('a1', title: 'Stromrechnung ÜBERFÄLLIG'));
      expect(idsOf(await find('überfällig')), ['a1']);
    });

    test('Spanish accents are not stripped', () async {
      await actions.create(sampleAction('a1', title: 'Pagar la factura eléctrica'));
      expect(idsOf(await find('eléctrica')), ['a1']);
      expect(idsOf(await find('electrica')), isEmpty,
          reason: 'accents are not silently equated');
    });

    test('Bengali text typed by hand is searchable', () async {
      await actions.create(sampleAction('a1', title: 'পানির বিল পরিশোধ করুন'));
      expect(idsOf(await find('পানির')), ['a1']);
      expect(idsOf(await find('বিল')), ['a1']);
    });

    test('Bengali pasted into a capture is searchable', () async {
      await sources.add(pasted('s1', 'বিদ্যুৎ বিলের নবায়ন নোটিশ'));
      expect((await find('নবায়ন')).sources, hasLength(1));
    });

    test('a multi-byte query still clears the source threshold sensibly',
        () async {
      await sources.add(pasted('s1', 'বিল'));
      // Two Bengali characters, not two bytes.
      expect((await find('বিল')).sources, hasLength(1));
    });
  });

  group('filters', () {
    setUp(() async {
      await actions.create(sampleAction('active',
          title: 'Bill one', dueAt: ActionDue(DateTime(2026, 8, 18))));
      await actions.create(sampleAction('done',
          title: 'Bill two',
          status: ActionStatus.completed,
          completedAt: searchNow));
      await actions.create(sampleAction('archived',
          title: 'Bill three', status: ActionStatus.archived));
      await actions.create(sampleAction('critical',
          title: 'Bill four', urgency: ActionUrgency.critical));
      await actions.create(sampleAction('overdue',
          title: 'Bill five', dueAt: ActionDue(DateTime(2026, 8, 10))));
      await actions.create(sampleAction('undated', title: 'Bill six'));
    });

    test('archived Actions stay out unless asked for', () async {
      expect(idsOf(await find('Bill')), isNot(contains('archived')));

      final withArchived = await find('Bill',
          filters: const SearchFilters(statuses: {StatusFilter.archived}));
      expect(idsOf(withArchived), contains('archived'));
    });

    test('completed Actions remain findable', () async {
      expect(idsOf(await find('Bill')), contains('done'));
    });

    test('status narrows to just that lifecycle', () async {
      final results = await find('Bill',
          filters: const SearchFilters(statuses: {StatusFilter.completed}));
      expect(idsOf(results), ['done']);
    });

    test('urgency narrows', () async {
      final results = await find('Bill',
          filters: const SearchFilters(urgencies: {ActionUrgency.critical}));
      expect(idsOf(results), ['critical']);
    });

    test('overdue, today, this week and no-deadline each select correctly',
        () async {
      Future<List<String>> withDue(DueFilter f) async =>
          idsOf(await find('Bill', filters: SearchFilters(dues: {f})));

      expect(await withDue(DueFilter.overdue), ['overdue']);
      expect(await withDue(DueFilter.today), ['active']);
      expect(await withDue(DueFilter.thisWeek), contains('active'));
      expect(await withDue(DueFilter.noDeadline),
          containsAll(['critical', 'done', 'undated']));
    });

    test('two values in one dimension mean either', () async {
      final results = await find('Bill',
          filters: const SearchFilters(
              dues: {DueFilter.overdue, DueFilter.today}));
      expect(idsOf(results), containsAll(['overdue', 'active']));
      expect(idsOf(results), isNot(contains('undated')));
    });

    test('two dimensions mean both', () async {
      final results = await find('Bill',
          filters: const SearchFilters(
            statuses: {StatusFilter.active},
            dues: {DueFilter.overdue},
          ));
      expect(idsOf(results), ['overdue']);
    });

    test('a query and a filter compose', () async {
      final results = await find('five',
          filters: const SearchFilters(dues: {DueFilter.overdue}));
      expect(idsOf(results), ['overdue']);

      final contradictory = await find('five',
          filters: const SearchFilters(dues: {DueFilter.today}));
      expect(idsOf(contradictory), isEmpty);
    });

    test('filters with no text still return matching Actions', () async {
      final results = await service.search(
        const SearchQuery(
            filters: SearchFilters(urgencies: {ActionUrgency.critical})),
        now: searchNow,
      );
      expect(idsOf(results), ['critical']);
    });

    test('an Action-only filter excludes captures rather than ignoring it',
        () async {
      await sources.add(pasted('s1', 'Bill from the water company'));
      final results = await find('Bill',
          filters: const SearchFilters(statuses: {StatusFilter.active}));

      expect(results.sources, isEmpty,
          reason: 'a status filter cannot be satisfied by a capture');
    });

    test('source type narrows captures', () async {
      await sources.add(pasted('s1', 'renewal by text'));
      await sources.add(scanned('s2', 'renewal by photo', 'renewal by photo'));

      final results = await find('renewal',
          filters: const SearchFilters(sourceTypes: {SourceType.photo}));
      expect(results.sources.map((r) => r.source.id), ['s2']);
    });
  });

  group('ranking', () {
    test('follows the documented precedence', () async {
      await actions.create(sampleAction('inSource', title: 'Nothing relevant'));
      await sources.add(pasted('s1', 'renewal in a capture'));
      await actions.create(sampleAction('inStep', title: 'Other',
          steps: [sampleStep('s1', title: 'renewal step')]));
      await actions.create(sampleAction('inTitleMiddle',
          title: 'The renewal notice'));
      await actions.create(sampleAction('inPrefix', title: 'renewal notice'));
      await actions.create(sampleAction('exact', title: 'renewal'));

      final results = await find('renewal');
      expect(idsOf(results), ['exact', 'inPrefix', 'inTitleMiddle', 'inStep']);
    });

    test('an open Action outranks a finished one at equal relevance',
        () async {
      final at = DateTime(2026, 8, 1);
      await actions.create(sampleAction('done',
          title: 'renewal', status: ActionStatus.completed, createdAt: at));
      await actions.create(sampleAction('open', title: 'renewal',
          createdAt: at));

      expect(idsOf(await find('renewal')).first, 'open');
    });

    test('a big amount never outranks a small one', () async {
      final at = DateTime(2026, 8, 1);
      await actions.create(sampleAction('cheap',
          title: 'renewal', amount: gbp('20.00'), createdAt: at));
      await actions.create(sampleAction('costly',
          title: 'renewal', amount: gbp('10000.00'), createdAt: at));

      // Falls through to the id tie-break, not to the money.
      expect(idsOf(await find('renewal')), ['cheap', 'costly']);
    });

    test('identical Actions have one stable order', () async {
      final at = DateTime(2026, 8, 1);
      for (final id in ['m', 'a', 'z']) {
        await actions.create(sampleAction(id, title: 'renewal', createdAt: at));
      }
      final first = idsOf(await find('renewal'));
      final second = idsOf(await find('renewal'));
      expect(first, second);
      expect(first, ['a', 'm', 'z']);
    });
  });

  group('when something breaks', () {
    test('a failing capture store does not hide the Actions that matched',
        () async {
      await actions.create(sampleAction('a1', title: 'renewal'));
      sources.failOnRead = true;

      final results = await find('renewal');
      expect(idsOf(results), ['a1']);
      expect(results.sourcesFailed, isTrue);
      expect(results.actionsFailed, isFalse);
      expect(results.isEmpty, isFalse,
          reason: 'never report "no matches" when the search was incomplete');
    });

    test('a failing Action store is reported, not swallowed', () async {
      // Injected rather than provoked by closing the database: what is under
      // test is this service's contract, not drift's behaviour on a closed
      // handle.
      final broken = ActionSearchService(
        actions: _BrokenActionRepository(),
        sources: () async => sources,
      );
      await sources.add(pasted('s1', 'renewal notice'));

      final results = await broken.search(
        const SearchQuery(text: 'renewal'),
        now: searchNow,
      );

      expect(results.actionsFailed, isTrue);
      expect(results.hasFailure, isTrue);
      // The captures that *did* match still come back.
      expect(results.sources, hasLength(1));
      expect(results.isEmpty, isFalse);
    });
  });

  group('scale', () {
    test('five hundred Actions search comfortably', () async {
      for (var i = 0; i < 500; i++) {
        await actions.create(sampleAction('a$i',
            title: 'Action number $i', steps: [
          sampleStep('s$i', title: 'step for $i'),
        ]));
      }

      final watch = Stopwatch()..start();
      final results = await find('number 4');
      watch.stop();

      expect(results.actions, isNotEmpty);
      // A guard against an accidental quadratic, not a benchmark.
      expect(watch.elapsedMilliseconds, lessThan(1000));
    });
  });
}

/// An Action store that always fails, so the service's honesty about a broken
/// subsystem can be tested without breaking a real database.
class _BrokenActionRepository implements ActionRepository {
  @override
  Stream<List<ActionItem>> watchAll() =>
      Stream.error(StateError('action store unavailable'));

  @override
  Never noSuchMethod(Invocation invocation) =>
      throw StateError('action store unavailable');
}
