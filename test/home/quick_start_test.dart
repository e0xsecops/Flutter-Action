/// The quick-start strip on Today.
///
/// Today renders only the sections that have something in them, so a user with
/// one upcoming Action gets a hero and then two-thirds of a blank screen —
/// which is also the most common state this app will ever be in, because most
/// days most people are not behind on anything.
///
/// These tests are about *when* it appears. A strip that showed up alongside a
/// full list would be competing with content; one that showed up on first run
/// would repeat the capability preview at less length.
library;

import 'package:action_app/app/app.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';
import '../support/preferences.dart';

class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async => null;
}

late ActionsDatabase _db;
late FakeNotificationScheduler _scheduler;
late FakeSourceStore _sources;

final _now = DateTime(2026, 8, 18, 12);

Future<void> pumpHome(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sourceStoreProvider.overrideWith((ref) async => _sources),
        sourceFileStoreProvider
            .overrideWith((ref) async => FakeSourceFileStore()),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        actionsDatabaseProvider.overrideWithValue(_db),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider
            .overrideWithValue(const NoopActionCloudMirror()),
        appClockProvider.overrideWithValue(() => _now),
        notificationSchedulerProvider.overrideWithValue(_scheduler),
        preferenceStoreProvider.overrideWithValue(onboardedPreferences()),
      ],
      child: const ActionApp(),
    ),
  );
  await tester.pumpAndSettle();
}

void homeTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 1800);
    tester.view.devicePixelRatio = 1.0;
    try {
      await body(tester);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(Duration.zero);
      tester.view.reset();
    }
  });
}

/// An Action far enough ahead to land in "Coming up" rather than needing
/// attention today.
/// `sourceId: null` matters. The shared `sampleAction` helper defaults it to
/// `'src-1'`, which is also the obvious id for a test capture — so an Action
/// built with the default silently claims that capture as already actioned and
/// removes it from the waiting list.
ActionItem _upcoming(String id, {String? title}) => sampleAction(
      id,
      title: title ?? 'Action $id',
      sourceId: null,
      createdAt: _now.subtract(const Duration(days: 1)),
      dueAt: ActionDue(_now.add(const Duration(days: 20))),
    );

void main() {
  setUp(() {
    _db = ActionsDatabase(NativeDatabase.memory());
    _scheduler = FakeNotificationScheduler();
    _sources = FakeSourceStore();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  group('when it appears', () {
    homeTest('a quiet day with one Action gets shortcuts, not blank space',
        (tester) async {
      await DriftActionRepository(_db).create(_upcoming('a1'));
      await pumpHome(tester);

      expect(find.text('START WITH'), findsOneWidget);
      expect(find.text('Photo'), findsOneWidget);
      expect(find.text('Screenshot'), findsOneWidget);
      expect(find.text('Text'), findsOneWidget);
    });

    homeTest('and it names tools that need nothing connected', (tester) async {
      // A promise the app can keep for someone who has connected no provider.
      await DriftActionRepository(_db).create(_upcoming('a1'));
      await pumpHome(tester);

      expect(
        find.text('Check a link, or find keys in some text'),
        findsOneWidget,
      );
    });
  });

  group('when it stays away', () {
    homeTest('on first run, where the capability preview already explains',
        (tester) async {
      await pumpHome(tester);

      expect(find.text('WHAT ACTION HANDLES'), findsOneWidget);
      expect(find.text('START WITH'), findsNothing);
    });

    homeTest('once there is enough on the page to be a list', (tester) async {
      final repo = DriftActionRepository(_db);
      await repo.create(_upcoming('a1'));
      await repo.create(_upcoming('a2'));
      await repo.create(_upcoming('a3'));

      await pumpHome(tester);

      expect(find.text('START WITH'), findsNothing);
    });

    homeTest('captures waiting for review count as content', (tester) async {
      // The single Action is *in* the hero, so it is not one of the rows
      // below it — two captures are what take the page past sparse.
      await DriftActionRepository(_db).create(_upcoming('a1'));
      for (final id in ['src-1', 'src-2']) {
        await _sources.add(SourceItem(
          id: id,
          type: SourceType.pastedText,
          capturedAt: _now,
          pastedText: 'Something to look at later.',
          state: SourceProcessingState.ready,
        ));
      }

      await pumpHome(tester);

      expect(find.text('START WITH'), findsNothing);
    });

    homeTest('but one capture alongside the hero is still a quiet day',
        (tester) async {
      await DriftActionRepository(_db).create(_upcoming('a1'));
      await _sources.add(SourceItem(
        id: 'src-1',
        type: SourceType.pastedText,
        capturedAt: _now,
        pastedText: 'Something to look at later.',
        state: SourceProcessingState.ready,
      ));

      await pumpHome(tester);

      expect(find.text('START WITH'), findsOneWidget);
    });
  });

  group('the shortcuts do something', () {
    homeTest('Text goes straight to the paste screen', (tester) async {
      // Straight there. Opening the capture chooser would be asking the user
      // to choose something they just chose.
      await DriftActionRepository(_db).create(_upcoming('a1'));
      await pumpHome(tester);

      await tester.tap(find.text('Text'));
      await tester.pumpAndSettle();

      expect(find.text('Paste text'), findsWidgets);
    });

    homeTest('each tile is reachable by a screen reader', (tester) async {
      // Disposed in the body, not in addTearDown: the framework verifies that
      // no SemanticsHandle is live at the end of the test, and a tearDown runs
      // after that check.
      final semantics = tester.ensureSemantics();
      await DriftActionRepository(_db).create(_upcoming('a1'));
      await pumpHome(tester);

      for (final label in ['Photo', 'Screenshot', 'Text']) {
        expect(
          find.bySemanticsLabel(label),
          findsWidgets,
          reason: label,
        );
      }
      semantics.dispose();
    });
  });
}
