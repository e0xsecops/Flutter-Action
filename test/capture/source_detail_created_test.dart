/// Source Detail after the capture has become something.
///
/// The defect this covers, found by walking the flow on device: after
/// confirming an Action the user landed back on the capture, which still said
/// "Nothing has been interpreted yet" and offered "Create an action from this"
/// as its loudest control. The last thing they saw after finishing the flow
/// was an invitation to start it again.
library;

import 'package:action_app/design/app_theme.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/capture/presentation/source_detail_screen.dart';
import 'package:action_app/l10n/gen/app_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../actions/support/actions_test_support.dart';
import '../support/fake_stores.dart';

final _capturedAt = DateTime(2026, 9, 1, 9);

SourceItem _textCapture() => SourceItem(
  id: 'src-1',
  type: SourceType.pastedText,
  capturedAt: _capturedAt,
  pastedText:
      'Your insurance policy INV-2048 is due for renewal. '
      'Payment of 284.50 must be received by 12 September 2026.',
  state: SourceProcessingState.ready,
);

late ActionsDatabase _db;
late DriftActionRepository _repo;
late FakeSourceStore _sources;

Future<void> pumpDetail(WidgetTester tester) async {
  final router = GoRouter(
    initialLocation: '/source/src-1',
    routes: [
      GoRoute(
        path: '/source/:id',
        builder: (_, state) =>
            SourceDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/action/:id',
        builder: (_, _) => const Scaffold(body: Text('the action screen')),
      ),
      GoRoute(
        path: '/source/:id/review',
        builder: (_, _) => const Scaffold(body: Text('the review screen')),
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        actionsDatabaseProvider.overrideWithValue(_db),
        sourceStoreProvider.overrideWith((ref) async => _sources),
        sourceFileStoreProvider.overrideWith(
          (ref) async => FakeSourceFileStore(),
        ),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider.overrideWithValue(
          const NoopActionCloudMirror(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: AppL10n.localizationsDelegates,
        supportedLocales: AppL10n.supportedLocales,
        theme: AppTheme.light(),
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async => null;
}

/// The screen has more than one Scrollable once the body is populated, so the
/// scroll target has to be named or `scrollUntilVisible` cannot pick one.
Future<void> scrollTo(WidgetTester tester, Finder target) async {
  await tester.scrollUntilVisible(
    target,
    200,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
}

void detailTest(String description, Future<void> Function(WidgetTester) body) {
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
  setUp(() async {
    _db = memoryDatabase();
    _repo = DriftActionRepository(_db);
    _sources = FakeSourceStore();
    await _sources.add(_textCapture());
  });
  tearDown(() => _db.close());

  group('before anything has been made from it', () {
    detailTest('it says nothing has been interpreted', (tester) async {
      await pumpDetail(tester);

      expect(
        find.textContaining('Nothing has been interpreted yet'),
        findsOneWidget,
      );
      expect(find.text('Create an action from this'), findsOneWidget);
    });

    detailTest('and offers no link to an Action that does not exist', (
      tester,
    ) async {
      await pumpDetail(tester);

      expect(find.text('Open the action'), findsNothing);
      expect(find.textContaining('Made from this capture'), findsNothing);
    });
  });

  group('once an Action has been made from it', () {
    setUp(() async {
      await _repo.create(
        sampleAction(
          'a1',
          title: 'Renew the insurance policy',
          sourceId: 'src-1',
        ),
      );
    });

    detailTest('it stops claiming nothing has been interpreted', (
      tester,
    ) async {
      await pumpDetail(tester);

      expect(
        find.textContaining('Nothing has been interpreted yet'),
        findsNothing,
      );
    });

    detailTest('it names what was made, and links to it', (tester) async {
      await pumpDetail(tester);
      await scrollTo(tester, find.text('Renew the insurance policy'));

      expect(find.text('Made from this capture'), findsOneWidget);
      expect(find.text('Renew the insurance policy'), findsOneWidget);
    });

    detailTest('opening the Action is the primary control now', (tester) async {
      await pumpDetail(tester);

      expect(find.text('Open the action'), findsOneWidget);
      // Making another is still possible, and no longer the loudest thing.
      expect(find.text('Create another from this'), findsOneWidget);
      expect(find.text('Create an action from this'), findsNothing);
    });

    detailTest('the primary control actually reaches the Action', (
      tester,
    ) async {
      await pumpDetail(tester);

      await tester.tap(find.text('Open the action'));
      await tester.pumpAndSettle();

      expect(find.text('the action screen'), findsOneWidget);
    });

    detailTest('the link in the list reaches it too', (tester) async {
      await pumpDetail(tester);
      await scrollTo(tester, find.text('Renew the insurance policy'));

      await tester.tap(find.text('Renew the insurance policy'));
      await tester.pumpAndSettle();

      expect(find.text('the action screen'), findsOneWidget);
    });
  });

  group('when several were made from one capture', () {
    setUp(() async {
      await _repo.create(
        sampleAction('a1', title: 'Pay it', sourceId: 'src-1'),
      );
      await _repo.create(
        sampleAction('a2', title: 'Compare quotes', sourceId: 'src-1'),
      );
    });

    detailTest('it counts them', (tester) async {
      await pumpDetail(tester);
      await scrollTo(tester, find.text('Pay it'));

      expect(find.text('2 made from this capture'), findsOneWidget);
      expect(find.text('Pay it'), findsOneWidget);
      expect(find.text('Compare quotes'), findsOneWidget);
    });

    detailTest('and says so on the control', (tester) async {
      await pumpDetail(tester);

      expect(find.text('Open 2 actions'), findsOneWidget);
    });
  });

  group('an Action from a different capture is not claimed', () {
    setUp(() async {
      await _repo.create(
        sampleAction('a1', title: 'Something else', sourceId: 'src-other'),
      );
    });

    detailTest('this capture still reads as uninterpreted', (tester) async {
      await pumpDetail(tester);

      expect(
        find.textContaining('Nothing has been interpreted yet'),
        findsOneWidget,
      );
      expect(find.text('Something else'), findsNothing);
    });
  });
}
