/// The Library's segments hold what their names say.
///
/// Found on the device with a seeded corpus: the Actions segment counted
/// archived Actions among the open ones and printed "Overdue · was due …"
/// under each, because an archived deadline is still in the past. Archiving
/// is the user saying "stop showing me this"; the Library was showing it
/// twice over. These tests hold the fix at the screen, through the real app.
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
import 'package:action_app/l10n/gen/app_l10n_en.dart';
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
late DriftActionRepository _repo;
late FakeNotificationScheduler _scheduler;

final _now = DateTime(2026, 9, 14, 12);
final _l10n = AppL10nEn();

Future<void> pumpLibrary(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sourceStoreProvider.overrideWith((ref) async => FakeSourceStore()),
        sourceFileStoreProvider.overrideWith(
          (ref) async => FakeSourceFileStore(),
        ),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        actionsDatabaseProvider.overrideWithValue(_db),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider.overrideWithValue(
          const NoopActionCloudMirror(),
        ),
        appClockProvider.overrideWithValue(() => _now),
        notificationSchedulerProvider.overrideWithValue(_scheduler),
        preferenceStoreProvider.overrideWithValue(onboardedPreferences()),
      ],
      child: const ActionApp(),
    ),
  );
  await tester.pumpAndSettle();
  await tester.tap(find.byTooltip(_l10n.navLibrary));
  await tester.pumpAndSettle();
}

void libraryTest(String description, Future<void> Function(WidgetTester) body) {
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

/// An Action whose deadline passed three weeks ago, in the given state.
ActionItem _overdue(String id, ActionStatus status, {required String title}) {
  final born = _now.subtract(const Duration(days: 30));
  return sampleAction(
    id,
    title: title,
    status: status,
    createdAt: born,
    dueAt: ActionDue(DateTime(2026, 8, 23)),
    completedAt: status == ActionStatus.completed
        ? born.add(const Duration(days: 2))
        : null,
  ).copyWith(
    archivedAt: status == ActionStatus.archived
        ? born.add(const Duration(days: 3))
        : null,
  );
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

  group('the Actions segment', () {
    libraryTest('holds only open Actions, and counts only them', (
      tester,
    ) async {
      await _repo.create(
        _overdue('open', ActionStatus.active, title: 'Renew the permit'),
      );
      await _repo.create(
        _overdue('gone', ActionStatus.archived, title: 'Old subscription'),
      );
      await _repo.create(
        _overdue('done', ActionStatus.completed, title: 'Paid the bill'),
      );
      await pumpLibrary(tester);

      expect(find.text('Renew the permit'), findsOneWidget);
      expect(find.text('Old subscription'), findsNothing);
      expect(find.text('Paid the bill'), findsNothing);
      // The segment count is the open count, not "everything but done".
      expect(find.text('1'), findsWidgets);
      expect(find.text('2'), findsWidgets);
    });
  });

  group('the Done segment', () {
    libraryTest('holds the archived alongside the completed', (tester) async {
      await _repo.create(
        _overdue('gone', ActionStatus.archived, title: 'Old subscription'),
      );
      await _repo.create(
        _overdue('done', ActionStatus.completed, title: 'Paid the bill'),
      );
      await pumpLibrary(tester);

      await tester.tap(find.text(_l10n.librarySegmentDone));
      await tester.pumpAndSettle();

      expect(find.text('Old subscription'), findsOneWidget);
      expect(find.text('Paid the bill'), findsOneWidget);
    });

    libraryTest('an archived Action is not described as overdue', (
      tester,
    ) async {
      await _repo.create(
        _overdue('gone', ActionStatus.archived, title: 'Old subscription'),
      );
      await pumpLibrary(tester);
      await tester.tap(find.text(_l10n.librarySegmentDone));
      await tester.pumpAndSettle();

      expect(find.text(_l10n.detailArchived), findsOneWidget);
      expect(find.textContaining('Overdue'), findsNothing);
      expect(find.textContaining('was due'), findsNothing);
    });
  });
}
