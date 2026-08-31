import 'package:action_app/design/app_theme.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/presentation/action_detail_screen.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/search/application/search_controller.dart';
import 'package:action_app/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';

/// The search screen, driven against a real database and source store.
final screenNow = DateTime(2026, 8, 18, 12);

class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async => null;
}

late ActionsDatabase _db;
late DriftActionRepository _repo;
late FakeSourceStore _sources;
late FakeNotificationScheduler _scheduler;

/// The search screen holds no drift stream of its own, but Action Detail —
/// which results navigate to — does. Detaching the tree before the body ends
/// keeps drift's retire timer from tripping the pending-timer assertion.
void searchTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 1400);
    tester.view.devicePixelRatio = 1.0;

    await body(tester);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(Duration.zero);
    tester.view.reset();
  });
}

Future<void> pumpSearch(
  WidgetTester tester, {
  ThemeMode themeMode = ThemeMode.light,
  double textScale = 1.0,
}) async {
  final router = GoRouter(
    initialLocation: '/search',
    routes: [
      GoRoute(path: '/', builder: (_, _) => const Scaffold(body: Text('home'))),
      GoRoute(
        path: '/search',
        // Search no longer carries its own Scaffold - the app shell owns it,
        // along with the ambient background and the navigation bar. The
        // harness supplies the same thing so the screen is mounted the way
        // production mounts it.
        builder: (_, _) => const Scaffold(body: SearchScreen()),
      ),
      GoRoute(
        path: '/action/:id',
        builder: (_, state) =>
            ActionDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/source/:id',
        builder: (_, _) => const Scaffold(body: Text('source detail')),
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        actionsDatabaseProvider.overrideWithValue(_db),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider.overrideWithValue(const NoopActionCloudMirror()),
        sourceStoreProvider.overrideWith((ref) async => _sources),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        appClockProvider.overrideWithValue(() => screenNow),
        notificationSchedulerProvider.overrideWithValue(_scheduler),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: themeMode,
        routerConfig: router,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Types into the field and waits out the debounce.
Future<void> type(WidgetTester tester, String text) async {
  await tester.enterText(find.byType(TextField), text);
  await tester.pump(searchDebounce + const Duration(milliseconds: 40));
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _repo = DriftActionRepository(_db);
    _sources = FakeSourceStore();
    _scheduler = FakeNotificationScheduler();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  SourceItem pasted(String id, String text) => SourceItem(
        id: id,
        type: SourceType.pastedText,
        capturedAt: DateTime(2026, 8, 10),
        pastedText: text,
        state: SourceProcessingState.ready,
      );

  searchTest('opens ready to type, and says where the search happens',
      (tester) async {
    await pumpSearch(tester);

    expect(find.text('YOU CAN SEARCH'), findsOneWidget);
    expect(find.textContaining('Nothing you type here leaves it'),
        findsOneWidget);
    // Autofocus: arriving here is already the intent.
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.autofocus, isTrue);
  });

  searchTest('finds an Action, and shows its title exactly once',
      (tester) async {
    await _repo.create(sampleAction('a1', title: 'Northgate Water invoice'));
    await pumpSearch(tester);

    await type(tester, 'Northgate');

    expect(find.text('Actions'.toUpperCase()), findsOneWidget);
    // The title carries the emphasis itself; a "Title · Northgate Water
    // invoice" line underneath would print the same words twice.
    expect(find.text('Northgate Water invoice'), findsOneWidget);
    expect(find.textContaining('Title ·'), findsNothing);
  });

  searchTest('a match somewhere other than the title explains itself',
      (tester) async {
    await _repo.create(sampleAction('a1', title: 'Renew the passport',
        steps: [sampleStep('s1', title: 'Upload the signed form')]));
    await pumpSearch(tester);

    await type(tester, 'signed form');

    expect(find.text('Renew the passport'), findsOneWidget);
    // Here the title is not the evidence, so the row says where it matched.
    expect(find.textContaining('Step'), findsWidgets);
    expect(find.textContaining('Upload the signed form'), findsOneWidget);
  });

  searchTest('finds a reference number exactly as typed', (tester) async {
    await _repo.create(sampleAction('a1', title: 'Some bill', facts: const [
      ActionFactItem(
        key: 'reference',
        label: 'Reference number',
        value: 'INV-2048',
        editedByUser: false,
      ),
    ]));
    await pumpSearch(tester);

    await type(tester, 'INV-2048');

    expect(find.text('Some bill'), findsOneWidget);
    expect(find.textContaining('Reference number'), findsOneWidget);
  });

  searchTest('finds a capture and shows a snippet, not the whole body',
      (tester) async {
    await _sources.add(pasted('s1',
        '${'filler ' * 40}renewal deadline${' filler' * 40}'));
    await pumpSearch(tester);

    await type(tester, 'renewal');

    expect(find.text('Captures'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('From capture'), findsOneWidget);
    expect(find.textContaining('renewal deadline'), findsOneWidget);
    // Bounded window, with elision marks rather than the whole letter.
    expect(find.textContaining('…'), findsWidgets);
  });

  searchTest('an Action and the capture behind it stay distinguishable',
      (tester) async {
    await _repo.create(sampleAction('a1', title: 'Renewal notice'));
    await _sources.add(pasted('s1', 'Renewal notice arrived today'));
    await pumpSearch(tester);

    await type(tester, 'renewal');

    expect(find.text('Actions'.toUpperCase()), findsOneWidget);
    expect(find.text('Captures'.toUpperCase()), findsOneWidget);
  });

  searchTest('a result opens the Action', (tester) async {
    await _repo.create(sampleAction('a1', title: 'Northgate Water invoice'));
    await pumpSearch(tester);
    await type(tester, 'Northgate');

    await tester.tap(find.text('Northgate Water invoice'));
    await tester.pumpAndSettle();

    // Day-9 detail, reached without any network or extraction.
    expect(find.text('STEPS'), findsOneWidget);
  });

  searchTest('a capture result opens the capture', (tester) async {
    await _sources.add(pasted('s1', 'renewal notice'));
    await pumpSearch(tester);
    await type(tester, 'renewal');

    await tester.tap(find.text(SourceType.pastedText.provenanceLabel));
    await tester.pumpAndSettle();

    expect(find.text('source detail'), findsOneWidget);
  });

  searchTest('clearing the query returns to the resting state',
      (tester) async {
    await _repo.create(sampleAction('a1', title: 'Northgate Water invoice'));
    await pumpSearch(tester);
    await type(tester, 'Northgate');
    expect(find.text('Northgate Water invoice'), findsOneWidget);

    await tester.tap(find.byTooltip('Clear'));
    await tester.pumpAndSettle();

    expect(find.text('YOU CAN SEARCH'), findsOneWidget);
    expect(find.text('Northgate Water invoice'), findsNothing);
  });

  searchTest('a query with no matches says so without offering an oracle',
      (tester) async {
    await _repo.create(sampleAction('a1', title: 'Northgate Water invoice'));
    await pumpSearch(tester);

    await type(tester, 'helicopter');

    expect(find.textContaining('No matches for'), findsOneWidget);
    // Nothing here suggests asking a model.
    expect(find.textContaining('AI'), findsNothing);
    expect(find.textContaining('Ask'), findsNothing);
  });

  searchTest('a filter narrows the results', (tester) async {
    await _repo.create(sampleAction('open', title: 'Bill one'));
    await _repo.create(sampleAction('done',
        title: 'Bill two',
        status: ActionStatus.completed,
        completedAt: screenNow));
    await pumpSearch(tester);
    await type(tester, 'Bill');
    expect(find.text('Bill one'), findsOneWidget);
    expect(find.text('Bill two'), findsOneWidget);

    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();

    expect(find.text('Bill two'), findsOneWidget);
    expect(find.text('Bill one'), findsNothing);
  });

  searchTest('a filter can be removed again', (tester) async {
    await _repo.create(sampleAction('open', title: 'Bill one'));
    await pumpSearch(tester);
    await type(tester, 'Bill');

    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Bill one'), findsNothing);

    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Bill one'), findsOneWidget);
  });

  searchTest('archived Actions appear only when asked for', (tester) async {
    await _repo.create(sampleAction('a1',
        title: 'Old paperwork', status: ActionStatus.archived));
    await pumpSearch(tester);
    // A query that does not collide with any filter label, so the tap below
    // is unambiguous.
    await type(tester, 'paperwork');

    expect(find.textContaining('No matches for'), findsOneWidget);

    // The Archived chip is deliberately last, being the least expected
    // result, so it has to be scrolled to. Day 17 capped the control row at a
    // readable width rather than letting it stretch, so a wider window no
    // longer brings the chip into view — reaching it is a scroll, exactly as
    // it is for a person.
    await tester.dragUntilVisible(
      find.text('Archived'),
      find.byType(ListView).first,
      const Offset(-120, 0),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Archived'));
    await tester.pumpAndSettle();

    expect(find.text('Old paperwork'), findsOneWidget);
  });

  searchTest('a completed result is visibly finished but still findable',
      (tester) async {
    await _repo.create(sampleAction('a1',
        title: 'Paid bill',
        status: ActionStatus.completed,
        completedAt: screenNow));
    await pumpSearch(tester);

    await type(tester, 'Paid');

    expect(find.text('Paid bill'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle_outline_rounded), findsOneWidget);
  });

  searchTest('a broken capture store is reported, not shown as "no matches"',
      (tester) async {
    await _repo.create(sampleAction('a1', title: 'Renewal notice'));
    _sources.failOnAll = true;
    await pumpSearch(tester);

    await type(tester, 'renewal');

    expect(find.text('Renewal notice'), findsOneWidget);
    expect(find.textContaining('may be incomplete'), findsOneWidget);
    expect(find.textContaining('No matches'), findsNothing);
  });

  searchTest('typing fast never shows the earlier query results',
      (tester) async {
    await _repo.create(sampleAction('ren', title: 'Renewal notice'));
    await _repo.create(sampleAction('nor', title: 'Northgate invoice'));
    await pumpSearch(tester);

    // Two keystrokes inside one debounce window: only the later one counts.
    await tester.enterText(find.byType(TextField), 'Ren');
    await tester.pump(const Duration(milliseconds: 20));
    await tester.enterText(find.byType(TextField), 'Northgate');
    await tester.pump(searchDebounce + const Duration(milliseconds: 40));
    await tester.pumpAndSettle();

    expect(find.text('Northgate invoice'), findsOneWidget);
    expect(find.text('Renewal notice'), findsNothing);
  });

  searchTest('Bengali text typed by hand is searchable', (tester) async {
    await _repo.create(sampleAction('a1', title: 'পানির বিল পরিশোধ করুন'));
    await pumpSearch(tester);

    await type(tester, 'পানির');

    expect(find.text('পানির বিল পরিশোধ করুন'), findsOneWidget);
  });

  searchTest('renders in dark theme', (tester) async {
    await _repo.create(sampleAction('a1', title: 'Northgate Water invoice'));
    await pumpSearch(tester, themeMode: ThemeMode.dark);

    await type(tester, 'Northgate');

    expect(find.text('Northgate Water invoice'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  searchTest('survives large text without overflowing', (tester) async {
    await _repo.create(sampleAction('a1',
        title: 'Northgate Water invoice for the summer quarter'));
    await pumpSearch(tester, textScale: 1.8);

    await type(tester, 'Northgate');

    expect(tester.takeException(), isNull);
  });

  searchTest('offers no back control, because it is a destination',
      (tester) async {
    await pumpSearch(tester);

    // V2 made Search one of the shell's four destinations rather than a screen
    // pushed from Home. There is nothing to pop, so a back arrow would either
    // do nothing or eject the user from a tab they deliberately chose; leaving
    // is the navigation bar's job. Asserted so nobody re-adds a dead arrow.
    expect(find.byTooltip('Back'), findsNothing);
    expect(find.byIcon(Icons.arrow_back), findsNothing);
  });
}
