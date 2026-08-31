// TEMPORARY — Action Experience V2 visual baseline.
//
// Not part of the suite's contract and NOT to be committed. It renders the
// current (Day-20) production screens with synthetic data and writes PNGs to
// the session scratchpad so the V2 redesign can be compared against real
// pixels rather than against a memory of them.
//
// Run: flutter test test/v2_baseline_capture_test.dart
@Tags(['baseline'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:action_app/app/app.dart';
import 'package:action_app/core/preferences/preference_store.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/action_cloud_privacy_service.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/settings/application/settings_providers.dart';
import 'package:action_app/features/settings/data/system_settings_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'actions/support/actions_test_support.dart';
import 'actions/support/fake_notification_scheduler.dart';
import 'support/fake_stores.dart';
import 'support/preferences.dart';

const _outDir =
    r'C:\Users\IMRANH~1\AppData\Local\Temp\claude\i--Flutter-Project-action-app\2fb18cbc-08bc-4cdb-9364-ea1f02503a69\scratchpad\baseline';

final baselineNow = DateTime(2026, 8, 18, 12);

const _renewalText = 'Your policy is due for renewal on 18 August 2026. '
    'Amount payable: 284.50. Reference MTR-4471-08.';

class _Identity implements AuthIdentityService {
  const _Identity();
  @override
  String? get lastFailureClass => null;
  @override
  Future<String?> currentOrSignInUid() async => 'uid-baseline';
}

class _Launcher implements SystemSettingsLauncher {
  @override
  Future<bool> openNotificationSettings() async => true;
}

late ActionsDatabase _db;
late DriftActionRepository _repo;
late FakeSourceStore _sources;
late FakeSourceFileStore _files;
late FakeNotificationScheduler _scheduler;

Future<void> _pump(
  WidgetTester tester, {
  PreferenceStore? prefs,
  ThemeMode? themeMode,
  Size size = const Size(412, 915),
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;

  await tester.pumpWidget(
    RepaintBoundary(
      child: ProviderScope(
        overrides: [
          preferenceStoreProvider
              .overrideWithValue(prefs ?? onboardedPreferences()),
          actionsDatabaseProvider.overrideWithValue(_db),
          sourceStoreProvider.overrideWith((ref) async => _sources),
          sourceFileStoreProvider.overrideWith((ref) async => _files),
          ocrServiceProvider.overrideWithValue(const FakeOcrService()),
          authIdentityServiceProvider.overrideWithValue(const _Identity()),
          actionCloudMirrorProvider
              .overrideWithValue(const NoopActionCloudMirror()),
          actionCloudPrivacyServiceProvider
              .overrideWithValue(const NoopActionCloudPrivacyService()),
          notificationSchedulerProvider.overrideWithValue(_scheduler),
          systemSettingsLauncherProvider.overrideWithValue(_Launcher()),
          appVersionProvider.overrideWith((ref) async => '1.0.0 (1)'),
          appClockProvider.overrideWithValue(() => baselineNow),
        ],
        child: Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              platformBrightness:
                  themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
            ),
            child: const ActionApp(),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _shoot(WidgetTester tester, String name) async {
  final boundary = tester.renderObject<RenderRepaintBoundary>(
    find.byType(RepaintBoundary).first,
  );
  await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 2.0);
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    if (data == null) return;
    final dir = Directory(_outDir);
    if (!dir.existsSync()) dir.createSync(recursive: true);
    File('$_outDir\\$name.png').writeAsBytesSync(data.buffer.asUint8List());
  });
}

Future<void> _seed() async {
  await _repo.create(sampleAction(
    'a1',
    title: 'Renew the car insurance',
    urgency: ActionUrgency.critical,
    dueAt: ActionDue(DateTime(2026, 8, 18)),
    amount: gbp('284.50'),
    steps: [
      sampleStep('s1', title: 'Compare the renewal quote', order: 0),
      sampleStep('s2', title: 'Upload the signed form', order: 1),
      sampleStep('s3', title: 'Confirm the direct debit', order: 2),
    ],
    facts: const [
      ActionFactItem(
        key: 'reference',
        label: 'Reference',
        value: 'MTR-4471-08',
        editedByUser: false,
      ),
      ActionFactItem(
        key: 'organisation',
        label: 'Organisation',
        value: 'Northgate Mutual',
        editedByUser: false,
      ),
    ],
  ));
  await _repo.create(sampleAction(
    'a2',
    title: 'Return the signed tenancy addendum',
    urgency: ActionUrgency.important,
    dueAt: ActionDue(DateTime(2026, 8, 21)),
  ));
  await _repo.create(sampleAction(
    'a3',
    title: 'Book the boiler service',
    urgency: ActionUrgency.normal,
    dueAt: ActionDue(DateTime(2026, 9, 12)),
  ));
  await _repo.create(sampleAction(
    'a4',
    title: 'Paid the water bill',
    status: ActionStatus.completed,
    completedAt: baselineNow.subtract(const Duration(days: 1)),
  ));

  await _sources.add(SourceItem(
    id: 'src-1',
    type: SourceType.gallery,
    capturedAt: baselineNow.subtract(const Duration(hours: 3)),
    imagePath: '/tmp/none.jpg',
    state: SourceProcessingState.ready,
    ocr: OcrOutcome(
      rawText: _renewalText,
      normalizedText: _renewalText,
      lines: const [OcrLine(text: _renewalText)],
      engine: 'baseline_fixture',
      processedAt: baselineNow,
      durationMs: 120,
    ),
  ));
  await _sources.add(SourceItem(
    id: 'src-2',
    type: SourceType.pastedText,
    capturedAt: baselineNow.subtract(const Duration(days: 2)),
    pastedText: 'Can we move the site visit to Thursday at 10:30?',
    state: SourceProcessingState.ready,
  ));
}

void main() {
  setUp(() {
    _db = memoryDatabase();
    _repo = DriftActionRepository(_db);
    _sources = FakeSourceStore();
    _files = FakeSourceFileStore();
    _scheduler = FakeNotificationScheduler();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  Future<void> shot(
    WidgetTester tester,
    String name,
    Future<void> Function(WidgetTester) body,
  ) async {
    await body(tester);
    await _shoot(tester, name);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 5));
    tester.view.reset();
  }

  testWidgets('01 onboarding', (tester) async {
    await shot(tester, '01-onboarding', (t) async {
      await _pump(t, prefs: freshPreferences());
    });
  });

  testWidgets('02 home empty', (tester) async {
    await shot(tester, '02-home-empty', (t) async => _pump(t));
  });

  testWidgets('03 home populated', (tester) async {
    await shot(tester, '03-home-populated', (t) async {
      await _seed();
      await _pump(t);
    });
  });

  testWidgets('04 home populated dark', (tester) async {
    await shot(tester, '04-home-populated-dark', (t) async {
      await _seed();
      await _pump(t, themeMode: ThemeMode.dark);
    });
  });

  testWidgets('05 capture sheet', (tester) async {
    await shot(tester, '05-capture-sheet', (t) async {
      await _seed();
      await _pump(t);
      final add = find.byTooltip('Add something').evaluate().isNotEmpty
          ? find.byTooltip('Add something')
          : find.byIcon(Icons.add).first;
      await t.tap(add);
      await t.pumpAndSettle();
    });
  });

  testWidgets('06 action detail', (tester) async {
    await shot(tester, '06-action-detail', (t) async {
      await _seed();
      await _pump(t);
      await t.tap(find.text('Renew the car insurance').first);
      await t.pumpAndSettle();
    });
  });

  testWidgets('07 source detail', (tester) async {
    await shot(tester, '07-source-detail', (t) async {
      await _seed();
      await _pump(t);
      final capture = find.textContaining('Captured from');
      if (capture.evaluate().isNotEmpty) {
        await t.tap(capture.first);
        await t.pumpAndSettle();
      }
    });
  });

  testWidgets('08 search', (tester) async {
    await shot(tester, '08-search', (t) async {
      await _seed();
      await _pump(t);
      await t.tap(find.byIcon(Icons.search).first);
      await t.pumpAndSettle();
    });
  });

  testWidgets('09 search results', (tester) async {
    await shot(tester, '09-search-results', (t) async {
      await _seed();
      await _pump(t);
      await t.tap(find.byIcon(Icons.search).first);
      await t.pumpAndSettle();
      await t.enterText(find.byType(TextField).first, 'renew');
      await t.pumpAndSettle(const Duration(seconds: 1));
    });
  });

  testWidgets('10 settings', (tester) async {
    await shot(tester, '10-settings', (t) async {
      await _pump(t);
      await t.tap(find.byIcon(Icons.settings_outlined).first);
      await t.pumpAndSettle();
    });
  });

  testWidgets('11 privacy', (tester) async {
    await shot(tester, '11-privacy', (t) async {
      await _pump(t);
      await t.tap(find.byIcon(Icons.settings_outlined).first);
      await t.pumpAndSettle();
      await t.tap(find.text('Where your information lives'));
      await t.pumpAndSettle();
    });
  });

  testWidgets('12 settings dark', (tester) async {
    await shot(tester, '12-settings-dark', (t) async {
      await _pump(t, themeMode: ThemeMode.dark);
      await t.tap(find.byIcon(Icons.settings_outlined).first);
      await t.pumpAndSettle();
    });
  });
}
