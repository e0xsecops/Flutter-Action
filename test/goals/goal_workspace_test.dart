/// The Goal workspace, and the two claims it must not make.
///
/// No score anywhere, and no inference of completion from linked Actions. Both
/// were in the original brief and both were declined — see
/// `docs/v2/ACTION_V2_DECISIONS.md` — so both are asserted rather than left to
/// good intentions.
library;

import 'package:action_app/design/app_theme.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/goals/application/goal_providers.dart';
import 'package:action_app/features/goals/data/json_goal_store.dart';
import 'package:action_app/features/goals/domain/goal.dart';
import 'package:action_app/features/goals/presentation/goal_workspace_screen.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../actions/support/actions_test_support.dart';

class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async => null;
}

late ActionsDatabase _db;
late InMemoryGoalStore _goals;

final _now = DateTime.utc(2026, 9, 1, 10);

Goal _goal({
  String? outcome,
  String? context,
  GoalStatus status = GoalStatus.active,
  List<String> linked = const [],
  String title = 'Renew the car insurance without overpaying',
}) =>
    Goal(
      id: 'g1',
      title: title,
      outcome: outcome,
      context: context,
      status: status,
      linkedActionIds: linked,
      createdAt: _now,
      updatedAt: _now,
    );

Future<void> pumpWorkspace(WidgetTester tester) async {
  final router = GoRouter(
    initialLocation: '/goal/g1',
    routes: [
      GoRoute(
        path: '/goal/:id',
        builder: (_, state) =>
            GoalWorkspaceScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/action/:id',
        builder: (_, _) => const Scaffold(body: Text('the action screen')),
      ),
      GoRoute(
        path: '/tool/:id',
        builder: (_, _) => const Scaffold(body: Text('the tool screen')),
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        actionsDatabaseProvider.overrideWithValue(_db),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider
            .overrideWithValue(const NoopActionCloudMirror()),
        appClockProvider.overrideWithValue(() => _now),
        goalStoreProvider.overrideWith((ref) async => _goals),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light(),
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void goalTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 1600);
    tester.view.devicePixelRatio = 1.0;
    try {
      await body(tester);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 5));
      tester.view.reset();
    }
  });
}

void main() {
  setUp(() {
    _db = ActionsDatabase(NativeDatabase.memory());
    _goals = InMemoryGoalStore();
  });
  tearDown(() => _db.close());

  group('what it shows', () {
    goalTest('the goal itself, under what you want', (tester) async {
      await _goals.add(_goal());
      await pumpWorkspace(tester);

      expect(find.text('WHAT YOU WANT'), findsOneWidget);
      expect(
        find.text('Renew the car insurance without overpaying'),
        findsOneWidget,
      );
    });

    goalTest('a prompt for each unwritten field, not an empty space',
        (tester) async {
      await _goals.add(_goal());
      await pumpWorkspace(tester);

      expect(find.text('WHAT DONE LOOKS LIKE'), findsOneWidget);
      expect(find.text('WHERE IT STANDS'), findsOneWidget);
      expect(find.textContaining('Not written yet'), findsOneWidget);
      expect(find.textContaining('Nothing written yet'), findsOneWidget);
    });

    goalTest('what has been written, when it has', (tester) async {
      await _goals.add(_goal(
        outcome: 'The car is insured and the paperwork is filed',
        context: 'Two quotes so far',
      ));
      await pumpWorkspace(tester);

      expect(
        find.text('The car is insured and the paperwork is filed'),
        findsOneWidget,
      );
      expect(find.text('Two quotes so far'), findsOneWidget);
    });

    goalTest('a reached goal says so', (tester) async {
      await _goals.add(_goal(status: GoalStatus.achieved));
      await pumpWorkspace(tester);

      expect(find.text('REACHED'), findsOneWidget);
    });
  });

  group('the planning tools', () {
    goalTest('are offered once there is enough to work with', (tester) async {
      await _goals.add(_goal());
      await pumpWorkspace(tester);

      expect(find.text('Improve a goal'), findsOneWidget);
      expect(find.text('Build a plan'), findsWidgets);
    });

    goalTest('are withheld, with a reason, when there is not', (tester) async {
      // Running them on three letters costs a request on the user's own key to
      // find out they were not worth running.
      await _goals.add(_goal(title: 'tax'));
      await pumpWorkspace(tester);

      expect(find.text('Improve a goal'), findsNothing);
      expect(
        find.textContaining('Write a little more about what you want'),
        findsOneWidget,
      );
    });

    goalTest('reach the tool screen carrying the goal', (tester) async {
      await _goals.add(_goal());
      await pumpWorkspace(tester);

      await tester.tap(find.text('Improve a goal'));
      await tester.pumpAndSettle();

      expect(find.text('the tool screen'), findsOneWidget);
    });
  });

  group('actions made from it', () {
    goalTest('are listed and reach the Action', (tester) async {
      await DriftActionRepository(_db)
          .create(sampleAction('a1', title: 'Compare the renewal quotes'));
      await _goals.add(_goal(linked: ['a1']));
      await pumpWorkspace(tester);
      await tester.scrollUntilVisible(
        find.text('Compare the renewal quotes'),
        200,
      );

      expect(find.text('1 ACTION FROM THIS GOAL'), findsOneWidget);

      await tester.tap(find.text('Compare the renewal quotes'));
      await tester.pumpAndSettle();
      expect(find.text('the action screen'), findsOneWidget);
    });

    goalTest('a link to an Action that no longer exists is simply absent',
        (tester) async {
      // Deleting an Action must not leave a row that goes nowhere.
      await _goals.add(_goal(linked: ['gone']));
      await pumpWorkspace(tester);

      expect(find.textContaining('ACTION FROM THIS GOAL'), findsNothing);
    });
  });

  group('what it will not claim', () {
    goalTest('no score, no percentage, no progress', (tester) async {
      await DriftActionRepository(_db).create(sampleAction('a1'));
      await _goals.add(_goal(
        outcome: 'Insured',
        context: 'Two quotes',
        linked: ['a1'],
      ));
      await pumpWorkspace(tester);

      for (final banned in ['%', 'score', 'progress', 'out of', 'complete']) {
        expect(
          find.textContaining(banned, skipOffstage: false),
          findsNothing,
          reason: banned,
        );
      }
    });

    goalTest('a goal with every Action done is still not marked reached',
        (tester) async {
      // Finishing every task a goal produced does not mean the goal was met,
      // and Action does not decide that on the user's behalf.
      await DriftActionRepository(_db).create(
        sampleAction('a1', status: ActionStatus.completed, completedAt: _now),
      );
      await _goals.add(_goal(linked: ['a1']));
      await pumpWorkspace(tester);

      expect(find.text('REACHED'), findsNothing);
      expect(find.text('WHAT YOU WANT'), findsOneWidget);
    });
  });

  group('presentation', () {
    goalTest('renders at large text without exception', (tester) async {
      await _goals.add(_goal(outcome: 'Insured', context: 'Two quotes'));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            actionsDatabaseProvider.overrideWithValue(_db),
            authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
            actionCloudMirrorProvider
                .overrideWithValue(const NoopActionCloudMirror()),
            appClockProvider.overrideWithValue(() => _now),
            goalStoreProvider.overrideWith((ref) async => _goals),
          ],
          child: MaterialApp(
            theme: AppTheme.light(),
            home: Builder(
              builder: (context) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.8)),
                child: const GoalWorkspaceScreen(id: 'g1'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    goalTest('a missing goal says so rather than showing a blank', (tester) async {
      await pumpWorkspace(tester);

      expect(find.textContaining('no longer here'), findsOneWidget);
    });
  });
}
