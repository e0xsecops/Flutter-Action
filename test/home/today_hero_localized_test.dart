/// The Today hero speaks the app's language, badge included.
///
/// Seen on the device in Bengali, Arabic and German at once: every card in
/// the list said "সময় পেরিয়েছে · 22 দিন", and the one Action in the hero —
/// the most prominent text on the screen — said "OVERDUE · 22 DAYS". The
/// hero was calling the English-only badge helper the cards had stopped
/// using. This drives the real app in Bengali with an overdue Action and
/// reads the hero.
library;

import 'package:action_app/app/app.dart';
import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/l10n/gen/app_l10n_bn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';
import '../actions/support/fake_notification_scheduler.dart';
import '../support/fake_stores.dart';

class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();
  @override
  String? get lastFailureClass => 'auth_unavailable';
  @override
  Future<String?> currentOrSignInUid() async => null;
}

late ActionsDatabase _db;
late FakeNotificationScheduler _scheduler;
final _now = DateTime(2026, 9, 14, 12);

Future<void> pumpTodayIn(WidgetTester tester, String languageTag) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sourceStoreProvider.overrideWith((ref) async => FakeSourceStore()),
        sourceFileStoreProvider
            .overrideWith((ref) async => FakeSourceFileStore()),
        ocrServiceProvider.overrideWithValue(const FakeOcrService()),
        actionsDatabaseProvider.overrideWithValue(_db),
        authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
        actionCloudMirrorProvider
            .overrideWithValue(const NoopActionCloudMirror()),
        appClockProvider.overrideWithValue(() => _now),
        notificationSchedulerProvider.overrideWithValue(_scheduler),
        preferenceStoreProvider.overrideWithValue(
          InMemoryPreferenceStore({
            PreferenceKeys.onboardingCompleted: true,
            PreferenceKeys.languageTag: languageTag,
          }),
        ),
      ],
      child: const ActionApp(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _scheduler = FakeNotificationScheduler();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  testWidgets('the hero badge is in the app language, like the cards',
      (tester) async {
    tester.view.physicalSize = const Size(420, 1800);
    tester.view.devicePixelRatio = 1.0;
    try {
      // Three weeks overdue: the hero's badge carries a day count, which is
      // the form that was leaking as English.
      await DriftActionRepository(_db).create(
        sampleAction(
          'late',
          title: 'Renew the permit',
          dueAt: ActionDue(DateTime(2026, 8, 24)),
          createdAt: _now.subtract(const Duration(days: 40)),
        ),
      );
      await pumpTodayIn(tester, 'bn');

      expect(find.textContaining('OVERDUE'), findsNothing);
      expect(find.textContaining('DAYS'), findsNothing);
      // The Bengali brief headline is on screen, so this is the Bengali app
      // and not a fallback to English.
      expect(
        find.text(AppL10nBn().briefHeadlineNeedsAttention(1)),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 5));
      tester.view.reset();
    }
  });
}
