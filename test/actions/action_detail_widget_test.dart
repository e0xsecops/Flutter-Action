import 'package:action_app/design/app_theme.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/data/drift_reminder_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/domain/action_reminder.dart';
import 'package:action_app/features/actions/presentation/action_detail_screen.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/l10n/gen/app_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'support/actions_test_support.dart';
import 'support/fake_notification_scheduler.dart';

/// The Action Detail screen, driven against a real database.
///
/// Every test seeds SQLite and reads what the screen actually renders from
/// it — no hand-built view models — so what these pin is the behaviour a
/// person gets on the device.
class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async => null;
}

class _MemSourceStore implements SourceStore {
  _MemSourceStore([List<SourceItem> items = const []]) {
    for (final i in items) {
      _items[i.id] = i;
    }
  }

  final _items = <String, SourceItem>{};

  @override
  Future<List<SourceItem>> all() async => _items.values.toList();
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

late ActionsDatabase _db;
late DriftActionRepository _repo;
late FakeNotificationScheduler _scheduler;

/// See `test/widget_test.dart`: the detail screen subscribes to a drift query
/// stream, and drift schedules a zero-duration timer when that subscription
/// is cancelled. The framework unmounts *after* the body and then asserts no
/// timer is pending, so the tree is detached here, one elapse early.
void detailTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    // A phone-shaped viewport, not the 800x600 default: the detail page is a
    // tall scroll view, and slivers below the fold are never built — so on a
    // short surface the chain and provenance would be untestable.
    tester.view.physicalSize = const Size(420, 1600);
    tester.view.devicePixelRatio = 1.0;

    await body(tester);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(Duration.zero);
    tester.view.reset();
  });
}

Future<void> pumpDetail(
  WidgetTester tester, {
  required String id,
  List<SourceItem> sources = const [],
  ThemeMode themeMode = ThemeMode.light,
}) async {
  final router = GoRouter(
    initialLocation: '/action/$id',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, _) => const Scaffold(body: Text('home')),
      ),
      GoRoute(
        path: '/action/:id',
        builder: (_, state) =>
            ActionDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/source/:id',
        builder: (_, _) => const Scaffold(body: Text('source screen')),
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        actionsDatabaseProvider.overrideWithValue(_db),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider.overrideWithValue(
          const NoopActionCloudMirror(),
        ),
        sourceStoreProvider.overrideWith(
          (ref) async => _MemSourceStore(sources),
        ),
        appClockProvider.overrideWithValue(() => testNow),
        // No widget test ever reaches an Android notification API.
        notificationSchedulerProvider.overrideWithValue(_scheduler),
      ],
      child: MaterialApp.router(
        localizationsDelegates: AppL10n.localizationsDelegates,
        supportedLocales: AppL10n.supportedLocales,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: themeMode,
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Opens a step's overflow menu and taps one of its entries.
Future<void> tapStepMenu(WidgetTester tester, int index, String entry) async {
  await tester.tap(find.byTooltip('Step options').at(index));
  await tester.pumpAndSettle();
  await tester.tap(find.text(entry).last);
  await tester.pumpAndSettle();
}

Future<void> tapDetailMenu(WidgetTester tester, String entry) async {
  await tester.tap(find.byTooltip('More'));
  await tester.pumpAndSettle();
  await tester.tap(find.text(entry).last);
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _repo = DriftActionRepository(_db);
    _scheduler = FakeNotificationScheduler();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  Future<void> seed(ActionItem action) => _repo.create(action);

  // ------------------------------------------------------------- the page --

  detailTest('shows what to do, when it matters, and where it came from', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        title: 'Pay the Riverford Energy bill',
        dueAt: ActionDue(DateTime(2026, 8, 30)),
        amount: gbp('96.40'),
        steps: [sampleStep('s1', title: 'Read the bill')],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    expect(find.text('Pay the Riverford Energy bill'), findsOneWidget);
    expect(find.text('NEXT'), findsOneWidget);
    expect(find.text('Read the bill'), findsWidgets);
    expect(find.text('30 Aug'), findsOneWidget);
    expect(find.text('96.40 GBP'), findsOneWidget);
  });

  detailTest('an unknown id gets a real not-found state, not a bounce home', (
    tester,
  ) async {
    await pumpDetail(tester, id: 'does-not-exist');

    expect(find.text('That action is no longer here'), findsOneWidget);
    expect(find.text('home'), findsNothing);
  });

  detailTest('a deep link to a stored Action resolves after a cold start', (
    tester,
  ) async {
    // Nothing navigated here: the route was entered directly by id.
    await seed(sampleAction('deep-1', title: 'Renew the passport'));
    await pumpDetail(tester, id: 'deep-1');

    expect(find.text('Renew the passport'), findsOneWidget);
  });

  // ------------------------------------------------- next best action --

  detailTest('with no steps, the reviewed suggestion is the next move', (
    tester,
  ) async {
    await seed(
      sampleAction('a1').withEdits(
        updatedAt: testNow,
        recommendedNextStep: 'Call the billing team',
      ),
    );
    await pumpDetail(tester, id: 'a1');

    expect(find.text('NEXT'), findsOneWidget);
    expect(find.text('Call the billing team'), findsOneWidget);
    // A sentence, not a tracked commitment: no checkbox for it.
    expect(find.text('Mark step done'), findsNothing);
  });

  detailTest('the first outstanding step is the one offered', (tester) async {
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('s1', title: 'Already done', order: 0, isCompleted: true),
          sampleStep('s2', title: 'Do this next', order: 1),
          sampleStep('s3', title: 'Then this', order: 2),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    // Once in the NEXT block, once in the chain.
    expect(find.text('Do this next'), findsNWidgets(2));
    expect(find.text('Mark step done'), findsOneWidget);
  });

  detailTest('marking the offered step done advances to the following one', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('s1', title: 'First', order: 0),
          sampleStep('s2', title: 'Second', order: 1),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Mark step done'));
    await tester.pumpAndSettle();

    expect(find.text('Second'), findsNWidgets(2));
    expect((await _repo.getById('a1'))!.steps.first.isCompleted, isTrue);
  });

  // -------------------------------------------------------------- chain --

  detailTest('an Action with no steps invites the first one', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    expect(find.text('No steps yet'), findsOneWidget);
    expect(find.text('Add first step'), findsOneWidget);
    // "0 of 0 done" would be noise.
    expect(find.textContaining('of 0 done'), findsNothing);
  });

  detailTest('progress counts what is done against the whole chain', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('s1', order: 0, isCompleted: true),
          sampleStep('s2', order: 1),
          sampleStep('s3', order: 2),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    expect(find.text('1 of 3 done'), findsOneWidget);
  });

  detailTest('a step can be added, and it lands at the end', (tester) async {
    await seed(sampleAction('a1', steps: [sampleStep('s1', title: 'First')]));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Add a step'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Second');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add step').last);
    await tester.pumpAndSettle();

    final steps = (await _repo.getById('a1'))!.steps;
    expect(steps.map((s) => s.title), ['First', 'Second']);
    expect(find.text('Second'), findsWidgets);
  });

  detailTest('a whitespace-only step cannot be added', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Add first step'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '    ');
    await tester.pumpAndSettle();

    final button = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Add step'),
    );
    expect(button.onPressed, isNull, reason: 'an invisible step is not a step');
  });

  detailTest('a step can be renamed without losing its identity', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('s1', title: 'Old name', order: 0, isCompleted: true),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    await tapStepMenu(tester, 0, 'Edit step');
    await tester.enterText(find.byType(TextField), 'New name');
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Save'));
    await tester.pumpAndSettle();

    final step = (await _repo.getById('a1'))!.steps.single;
    expect(step.title, 'New name');
    expect(step.id, 's1');
    expect(step.isCompleted, isTrue, reason: 'a rename is not a reset');
  });

  detailTest('tapping a step checks it, and tapping again reopens it', (
    tester,
  ) async {
    await seed(sampleAction('a1', steps: [sampleStep('s1', title: 'Do it')]));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.byIcon(Icons.circle_outlined));
    await tester.pumpAndSettle();
    expect((await _repo.getById('a1'))!.steps.single.isCompleted, isTrue);

    await tester.tap(find.byIcon(Icons.check_circle).first);
    await tester.pumpAndSettle();
    final step = (await _repo.getById('a1'))!.steps.single;
    expect(step.isCompleted, isFalse);
    expect(step.completedAt, isNull);
  });

  detailTest('deleting a step asks first, and keeps it if declined', (
    tester,
  ) async {
    await seed(sampleAction('a1', steps: [sampleStep('s1', title: 'Keep me')]));
    await pumpDetail(tester, id: 'a1');

    await tapStepMenu(tester, 0, 'Delete step');
    expect(find.text('Delete this step?'), findsOneWidget);
    await tester.tap(find.text('Keep it'));
    await tester.pumpAndSettle();

    expect((await _repo.getById('a1'))!.steps, hasLength(1));
  });

  detailTest('a confirmed delete removes the step', (tester) async {
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('s1', title: 'Goes', order: 0),
          sampleStep('s2', title: 'Stays', order: 1),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    await tapStepMenu(tester, 0, 'Delete step');
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    expect((await _repo.getById('a1'))!.steps.map((s) => s.title), ['Stays']);
  });

  detailTest('a step can be moved up, and the new order is what persists', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('A', title: 'A', order: 0),
          sampleStep('B', title: 'B', order: 1),
          sampleStep('C', title: 'C', order: 2),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    await tapStepMenu(tester, 2, 'Move up');

    expect((await _repo.getById('a1'))!.steps.map((s) => s.id), [
      'A',
      'C',
      'B',
    ]);
  });

  detailTest('a step can be dragged to a new position by its handle', (
    tester,
  ) async {
    // Dragging lifts the row into an Overlay, which is OUTSIDE the Scaffold's
    // Material. A row containing ink (the checkbox) therefore needs the list
    // to decorate its drag proxy, or the gesture throws instead of moving
    // anything. Only a real drag exercises that path.
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('A', title: 'Step A', order: 0),
          sampleStep('B', title: 'Step B', order: 1),
          sampleStep('C', title: 'Step C', order: 2),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    final handles = find.byIcon(Icons.drag_handle);
    final from = tester.getCenter(handles.at(2));
    final to = tester.getCenter(handles.at(0));

    final gesture = await tester.startGesture(from);
    await tester.pump(const Duration(milliseconds: 300));
    // Several small moves, the way a finger actually travels.
    for (var i = 0; i < 8; i++) {
      await gesture.moveBy(Offset(0, (to.dy - from.dy) / 8));
      await tester.pump(const Duration(milliseconds: 16));
    }
    await gesture.up();
    await tester.pumpAndSettle();

    expect(
      tester.takeException(),
      isNull,
      reason: 'the drag must not throw while the row is in the overlay',
    );
    expect((await _repo.getById('a1'))!.steps.map((s) => s.id), [
      'C',
      'A',
      'B',
    ]);
  });

  detailTest('a completion travels with its step across a drag', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('A', title: 'Step A', order: 0),
          sampleStep('B', title: 'Step B', order: 1, isCompleted: true),
          sampleStep('C', title: 'Step C', order: 2),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    final handles = find.byIcon(Icons.drag_handle);
    final from = tester.getCenter(handles.at(2));
    final to = tester.getCenter(handles.at(0));
    final gesture = await tester.startGesture(from);
    await tester.pump(const Duration(milliseconds: 300));
    for (var i = 0; i < 8; i++) {
      await gesture.moveBy(Offset(0, (to.dy - from.dy) / 8));
      await tester.pump(const Duration(milliseconds: 16));
    }
    await gesture.up();
    await tester.pumpAndSettle();

    final steps = (await _repo.getById('a1'))!.steps;
    expect(steps.map((s) => s.id), ['C', 'A', 'B']);
    expect(
      steps.singleWhere((s) => s.isCompleted).id,
      'B',
      reason: 'completion belongs to the step, not to the position',
    );
  });

  detailTest('the first step offers no Move up, the last no Move down', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        steps: [
          sampleStep('A', title: 'A', order: 0),
          sampleStep('B', title: 'B', order: 1),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.byTooltip('Step options').first);
    await tester.pumpAndSettle();
    expect(find.text('Move up'), findsNothing);
    expect(find.text('Move down'), findsOneWidget);
  });

  // -------------------------------------------------------- completion --

  detailTest('checking every step does NOT quietly complete the Action', (
    tester,
  ) async {
    await seed(sampleAction('a1', steps: [sampleStep('s1', title: 'Only')]));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Mark step done'));
    await tester.pumpAndSettle();

    expect(
      (await _repo.getById('a1'))!.status,
      ActionStatus.active,
      reason: 'finishing is the user\'s decision',
    );
    // It offers, rather than decides.
    expect(find.text('ALL STEPS DONE'), findsOneWidget);
    expect(find.text('Complete this action'), findsOneWidget);
  });

  detailTest('the offer to finish completes it only when accepted', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        steps: [sampleStep('s1', title: 'Only', isCompleted: true)],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Complete this action'));
    await tester.pumpAndSettle();

    expect((await _repo.getById('a1'))!.status, ActionStatus.completed);
  });

  detailTest('a completed Action reads calmly and can be reopened', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        status: ActionStatus.completed,
        completedAt: testNow,
        steps: [sampleStep('s1', title: 'Was done', isCompleted: true)],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    expect(find.textContaining('Completed'), findsWidgets);
    expect(find.text('Mark action complete'), findsNothing);
    expect(find.text('Reopen action'), findsOneWidget);

    await tester.tap(find.text('Reopen action'));
    await tester.pumpAndSettle();

    final action = (await _repo.getById('a1'))!;
    expect(action.status, ActionStatus.active);
    expect(action.completedAt, isNull);
    expect(
      action.steps.single.isCompleted,
      isTrue,
      reason: 'reopening does not un-do work already done',
    );
  });

  detailTest('the whole Action can be completed from the bottom bar', (
    tester,
  ) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Mark action complete'));
    await tester.pumpAndSettle();

    expect((await _repo.getById('a1'))!.status, ActionStatus.completed);
  });

  // ------------------------------------------------------------- edits --

  detailTest('the title can be edited', (tester) async {
    await seed(sampleAction('a1', title: 'Old title'));
    await pumpDetail(tester, id: 'a1');

    await tapDetailMenu(tester, 'Edit title');
    await tester.enterText(find.byType(TextField), 'Better title');
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Save'));
    await tester.pumpAndSettle();

    expect((await _repo.getById('a1'))!.title, 'Better title');
    expect(find.text('Better title'), findsOneWidget);
  });

  detailTest('a deadline can be added and stays a plain date', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Add a deadline'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '2026-09-15');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Use this date'));
    await tester.pumpAndSettle();

    final due = (await _repo.getById('a1'))!.dueAt!;
    expect(due.wallClock, DateTime(2026, 9, 15));
    expect(due.isDateOnly, isTrue);
  });

  detailTest('an impossible date is refused rather than rolled forward', (
    tester,
  ) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Add a deadline'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '2026-02-30');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Use this date'));
    await tester.pumpAndSettle();

    // The deadline editor and the extraction review screen now share one
    // sentence for a date that is not a date (reviewBadDate), rather than
    // wording the same refusal twice. Matched case-insensitively so the
    // assertion is about the refusal rather than about where the sentence
    // happens to start.
    expect(
      find.textContaining(RegExp('not a real date', caseSensitive: false)),
      findsOneWidget,
    );
    expect(
      (await _repo.getById('a1'))!.dueAt,
      isNull,
      reason: 'February 30th must not become March 2nd',
    );
  });

  detailTest('an amount round-trips through exact minor units', (tester) async {
    await seed(sampleAction('a1', category: ActionCategory.payment));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Add an amount'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, '96.40');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save amount'));
    await tester.pumpAndSettle();

    final amount = (await _repo.getById('a1'))!.amount!;
    expect(amount.amountMinor, 9640);
    expect(amount.currencyCode, 'GBP');
  });

  detailTest('a malformed amount is refused with a reason', (tester) async {
    await seed(sampleAction('a1', amount: gbp('10.00')));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('10.00 GBP'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, '12.3.4');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save amount'));
    await tester.pumpAndSettle();

    expect(
      find.widgetWithText(FilledButton, 'Save amount'),
      findsOneWidget,
      reason: 'the sheet stays open on a rejected value',
    );
    expect(
      (await _repo.getById('a1'))!.amount!.amountMinor,
      1000,
      reason: 'the stored amount is untouched',
    );
  });

  detailTest('a fact is not repeated as a worse copy of the canonical row', (
    tester,
  ) async {
    // The device found this: "Deadline 21 Sep" followed by "Payment Due Date
    // 2026-09-21" is the same commitment twice, in a worse format.
    await seed(
      sampleAction(
        'a1',
        dueAt: ActionDue(DateTime(2026, 9, 21)),
        amount: gbp('58.20'),
        facts: const [
          ActionFactItem(
            key: 'payment_due_date',
            label: 'Payment Due Date',
            value: '2026-09-21',
            editedByUser: false,
          ),
          ActionFactItem(
            key: 'amount_due',
            label: 'Amount Due',
            value: '58.20',
            editedByUser: false,
          ),
          ActionFactItem(
            key: 'reference',
            label: 'Customer Reference',
            value: '55-9012-7',
            editedByUser: false,
          ),
        ],
      ),
    );
    await pumpDetail(tester, id: 'a1');

    expect(find.text('21 Sep'), findsOneWidget);
    expect(find.text('58.20 GBP'), findsOneWidget);
    expect(find.text('2026-09-21'), findsNothing);
    expect(find.text('Payment Due Date'), findsNothing);
    expect(find.text('Amount Due'), findsNothing);
    // A fact that is genuinely its own thing still shows.
    expect(find.text('55-9012-7'), findsOneWidget);
  });

  detailTest('internal machinery is never offered for editing', (tester) async {
    await seed(sampleAction('a1', sourceId: 'src-1'));
    await pumpDetail(tester, id: 'a1');
    await tester.tap(find.byTooltip('More'));
    await tester.pumpAndSettle();

    for (final forbidden in ['schemaVersion', 'sourceId', 'uid', 'outbox']) {
      expect(find.textContaining(forbidden), findsNothing);
    }
  });

  // -------------------------------------------------------- provenance --

  detailTest('an Action from a capture links to the capture', (tester) async {
    await seed(sampleAction('a1', sourceId: 'src-1'));
    await pumpDetail(
      tester,
      id: 'a1',
      sources: [
        SourceItem(
          id: 'src-1',
          type: SourceType.pastedText,
          capturedAt: DateTime(2026, 8, 18),
          pastedText: 'Riverford Energy statement',
          state: SourceProcessingState.ready,
        ),
      ],
    );

    expect(find.text('CREATED FROM'), findsOneWidget);
    expect(find.text(SourceType.pastedText.provenanceLabel), findsOneWidget);

    await tester.tap(find.text('View source'));
    await tester.pumpAndSettle();
    expect(find.text('source screen'), findsOneWidget);
  });

  detailTest('a deleted capture does not break the Action', (tester) async {
    await seed(sampleAction('a1', sourceId: 'gone'));
    await pumpDetail(tester, id: 'a1');

    expect(
      find.text('The original capture is no longer available.'),
      findsOneWidget,
    );
    // Still entirely usable.
    expect(find.text('Mark action complete'), findsOneWidget);
    expect(find.text('Add a step'), findsNothing);
    expect(find.text('Add first step'), findsOneWidget);
  });

  detailTest('an Action you typed yourself says so, and claims no doubt', (
    tester,
  ) async {
    await seed(
      sampleAction(
        'a1',
        sourceId: null,
        origin: ActionOrigin.manual,
        urgency: ActionUrgency.unknown,
      ),
    );
    await pumpDetail(tester, id: 'a1');

    expect(find.text('Created by you'), findsOneWidget);
    expect(find.textContaining('Not sure'), findsNothing);
  });

  detailTest(
    'typing the details yourself does not hide the capture behind it',
    (tester) async {
      // The device found this: an Action entered by hand FROM a letter still
      // came from that letter, and both facts are true at once.
      await seed(
        sampleAction('a1', sourceId: 'src-1', origin: ActionOrigin.manual),
      );
      await pumpDetail(
        tester,
        id: 'a1',
        sources: [
          SourceItem(
            id: 'src-1',
            type: SourceType.pastedText,
            capturedAt: DateTime(2026, 8, 18),
            pastedText: 'Riverford Energy statement',
            state: SourceProcessingState.ready,
          ),
        ],
      );

      expect(find.text('Created by you'), findsOneWidget);
      expect(find.text('View source'), findsOneWidget);
    },
  );

  detailTest('a hand-typed Action whose capture was deleted says so plainly', (
    tester,
  ) async {
    await seed(
      sampleAction('a1', sourceId: 'deleted', origin: ActionOrigin.manual),
    );
    await pumpDetail(tester, id: 'a1');

    expect(find.text('Created by you'), findsOneWidget);
    expect(
      find.text('The original capture is no longer available.'),
      findsOneWidget,
    );
    expect(find.text('View source'), findsNothing);
  });

  // -------------------------------------------------------- reminders --

  /// Opens the sheet, accepts what it offers, then waits out the confirmation
  /// SnackBar — which otherwise sits over the bottom bar and swallows the
  /// next tap.
  Future<void> addReminder(WidgetTester tester, {String? preset}) async {
    await tester.tap(find.text('Add reminder'));
    await tester.pumpAndSettle();
    if (preset != null) {
      await tester.tap(find.text(preset));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.widgetWithText(FilledButton, 'Set reminder'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  }

  detailTest('an Action with no reminders says so plainly', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    expect(find.text('REMINDERS'), findsOneWidget);
    expect(find.text('No reminders yet.'), findsOneWidget);
    expect(find.text('Add reminder'), findsOneWidget);
  });

  detailTest('a deadline turns into offers that show their real clock time', (
    tester,
  ) async {
    await seed(sampleAction('a1', dueAt: ActionDue(DateTime(2026, 8, 30))));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Add reminder'));
    await tester.pumpAndSettle();

    expect(find.text('1 week before'), findsOneWidget);
    expect(find.text('1 day before'), findsOneWidget);
    expect(find.text('On the day'), findsOneWidget);
    // A date-only deadline has no time of day, so the suggested 9am must be
    // visible before anything is created.
    expect(find.textContaining('9:00 AM'), findsWidgets);
    expect(find.textContaining('You will be reminded on'), findsOneWidget);
  });

  detailTest('setting a reminder schedules it and says so honestly', (
    tester,
  ) async {
    await seed(sampleAction('a1', title: 'Pay the bill'));
    await pumpDetail(tester, id: 'a1');

    // Inline rather than via the helper, so the confirmation is still on
    // screen to assert.
    await tester.tap(find.text('Add reminder'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Set reminder'));
    await tester.pumpAndSettle();

    expect(_scheduler.scheduled, hasLength(1));
    expect(_scheduler.scheduleLog.single.title, 'Pay the bill');
    expect(_scheduler.scheduleLog.single.actionId, 'a1');
    expect(find.textContaining('Reminder set'), findsOneWidget);
  });

  detailTest('a scheduled reminder is listed with its time', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');
    await addReminder(tester);

    expect(find.text('No reminders yet.'), findsNothing);
    expect(find.byIcon(Icons.notifications_active_outlined), findsOneWidget);
  });

  detailTest('several reminders can coexist on one Action', (tester) async {
    await seed(sampleAction('a1', dueAt: ActionDue(DateTime(2026, 8, 30))));
    await pumpDetail(tester, id: 'a1');

    await addReminder(tester, preset: '1 week before');
    await addReminder(tester, preset: '1 day before');

    expect(_scheduler.scheduled, hasLength(2));
    expect(find.byIcon(Icons.notifications_active_outlined), findsNWidgets(2));
  });

  detailTest('refusing notification permission never claims a reminder is on', (
    tester,
  ) async {
    _scheduler
      ..allowed = false
      ..grantOnRequest = false;
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    await addReminder(tester);

    expect(
      _scheduler.scheduleLog,
      isEmpty,
      reason: 'nothing may be armed without permission',
    );
    // Kept, and labelled for exactly what it is — never as active.
    expect(find.text('Saved, but notifications are off'), findsOneWidget);
    expect(find.byIcon(Icons.notifications_off_outlined), findsOneWidget);
    expect(find.byIcon(Icons.notifications_active_outlined), findsNothing);
  });

  detailTest('permission is never requested just for opening the screen', (
    tester,
  ) async {
    _scheduler.allowed = false;
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    expect(
      _scheduler.permissionRequests,
      0,
      reason:
          'asking before the user wants anything is how apps get '
          'notifications turned off forever',
    );
  });

  detailTest('a platform refusal is shown, not hidden', (tester) async {
    _scheduler.failScheduleWith = 'platform_error';
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    await addReminder(tester);

    expect(find.text("Couldn't be scheduled"), findsOneWidget);
  });

  detailTest('a reminder can be moved to a different time', (tester) async {
    await seed(sampleAction('a1', dueAt: ActionDue(DateTime(2026, 8, 30))));
    await pumpDetail(tester, id: 'a1');
    await addReminder(tester, preset: '1 day before');
    final firstId = _scheduler.scheduled.keys.single;

    await tester.tap(find.byTooltip('Change reminder'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('On the day'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Set reminder'));
    await tester.pumpAndSettle();

    expect(
      _scheduler.scheduled,
      hasLength(1),
      reason: 'rescheduling replaces the alarm rather than adding one',
    );
    expect(
      _scheduler.scheduled.keys.single,
      firstId,
      reason: 'and it keeps the same platform id',
    );
  });

  detailTest('removing a reminder cancels the alarm too', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');
    await addReminder(tester);
    final id = _scheduler.scheduled.keys.single;

    await tester.tap(find.byTooltip('Remove reminder'));
    await tester.pumpAndSettle();

    expect(_scheduler.cancelLog, contains(id));
    expect(_scheduler.scheduled, isEmpty);
    expect(find.text('No reminders yet.'), findsOneWidget);
  });

  detailTest('the limit is explained rather than silently enforced', (
    tester,
  ) async {
    await seed(sampleAction('a1'));
    // Seeded straight into the store: this test is about what a full Action
    // looks like, not about driving the sheet five times.
    final store = DriftReminderRepository(_db);
    for (var i = 1; i <= maxRemindersPerAction; i++) {
      await store.createIntent(
        actionId: 'a1',
        scheduledAt: testNow.add(Duration(days: i)),
        timeZoneId: 'Asia/Dhaka',
        now: testNow,
      );
    }
    await pumpDetail(tester, id: 'a1');

    expect(
      find.textContaining('the most reminders one action can have'),
      findsOneWidget,
    );
    expect(
      find.text('Add reminder'),
      findsNothing,
      reason: 'offering a sixth only to refuse it would be worse',
    );
  });

  detailTest('completing an Action withdraws its future reminders', (
    tester,
  ) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');
    await addReminder(tester);
    expect(_scheduler.scheduled, hasLength(1));

    await tester.tap(find.text('Mark action complete'));
    await tester.pumpAndSettle();

    expect(
      _scheduler.scheduled,
      isEmpty,
      reason: 'a finished obligation should stop nudging',
    );
    expect(find.text('No reminders yet.'), findsOneWidget);
  });

  detailTest('reopening does not bring cancelled reminders back', (
    tester,
  ) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');
    await addReminder(tester);
    await tester.tap(find.text('Mark action complete'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reopen action'));
    await tester.pumpAndSettle();

    expect(find.text('No reminders yet.'), findsOneWidget);
    expect(_scheduler.scheduled, isEmpty);
  });

  detailTest('a completed Action does not invite new reminders', (
    tester,
  ) async {
    await seed(
      sampleAction('a1', status: ActionStatus.completed, completedAt: testNow),
    );
    await pumpDetail(tester, id: 'a1');

    expect(find.text('REMINDERS'), findsOneWidget);
    expect(find.text('Add reminder'), findsNothing);
  });

  detailTest('changing the deadline leaves existing reminders where they are', (
    tester,
  ) async {
    await seed(sampleAction('a1', dueAt: ActionDue(DateTime(2026, 8, 30))));
    await pumpDetail(tester, id: 'a1');
    await addReminder(tester, preset: '1 day before');
    final agreed = _scheduler.scheduled.values.single.scheduledAt;

    await tester.tap(find.text('30 Aug'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '2026-12-01');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Use this date'));
    await tester.pumpAndSettle();

    expect(
      _scheduler.scheduled.values.single.scheduledAt,
      agreed,
      reason:
          'a reminder is a time the user agreed to; moving the deadline '
          'must not silently move it',
    );
  });

  detailTest('reminders render in dark theme', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1', themeMode: ThemeMode.dark);
    await addReminder(tester);

    expect(tester.takeException(), isNull);
    expect(find.byIcon(Icons.notifications_active_outlined), findsOneWidget);
  });

  // ------------------------------------------------------------ shell --

  detailTest('archiving asks first and then leaves the screen', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    await tapDetailMenu(tester, 'Archive');
    expect(find.text('Archive this action?'), findsOneWidget);
    await tester.tap(find.text('Archive').last);
    await tester.pumpAndSettle();

    expect((await _repo.getById('a1'))!.status, ActionStatus.archived);
    expect(find.text('home'), findsOneWidget);
  });

  detailTest('back returns to where you came from', (tester) async {
    await seed(sampleAction('a1'));
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('home'), findsOneWidget);
  });

  detailTest('renders in dark theme', (tester) async {
    await seed(
      sampleAction(
        'a1',
        title: 'Pay the bill',
        steps: [sampleStep('s1', title: 'Read it')],
      ),
    );
    await pumpDetail(tester, id: 'a1', themeMode: ThemeMode.dark);

    expect(find.text('Pay the bill'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  detailTest('the keyboard never covers the step editor', (tester) async {
    await seed(sampleAction('a1'));
    tester.view.viewInsets = const FakeViewPadding(bottom: 600);
    await pumpDetail(tester, id: 'a1');

    await tester.tap(find.text('Add first step'));
    await tester.pumpAndSettle();

    final dpr = tester.view.devicePixelRatio;
    final keyboardTop =
        tester.view.physicalSize.height / dpr -
        tester.view.viewInsets.bottom / dpr;
    // Both the field being typed into and the button that commits it have to
    // stay above the keyboard, or the sheet is unusable on a real phone.
    expect(
      tester.getRect(find.byType(TextField)).bottom,
      lessThanOrEqualTo(keyboardTop),
    );
    expect(
      tester.getRect(find.widgetWithText(FilledButton, 'Add step')).bottom,
      lessThanOrEqualTo(keyboardTop),
    );
  });
}
