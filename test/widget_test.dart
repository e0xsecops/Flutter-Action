import 'dart:async';

import 'package:action_app/app/app.dart';
import 'package:action_app/core/preferences/shared_preferences_store.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/data/drift_reminder_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/domain/action_reminder.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'actions/support/actions_test_support.dart';
import 'actions/support/fake_notification_scheduler.dart';
import 'support/fake_stores.dart';
import 'support/preferences.dart';

class _NoIdentity implements AuthIdentityService {
  const _NoIdentity();

  @override
  String? get lastFailureClass => 'auth_unavailable';

  @override
  Future<String?> currentOrSignInUid() async => null;
}

/// Recognition that never returns, so the processing state can be observed.
///
/// Interrupted captures are resumed when the list loads, which means a record
/// left in `processing` does not stay there — the only way to hold the UI in
/// that state is to hold the recogniser.
class _NeverCompletesOcrService implements OcrService {
  @override
  Future<OcrOutcome> recognize(String imagePath) => Completer<OcrOutcome>().future;

  @override
  Future<void> dispose() async {}
}

/// Home reads durable Actions now, so every test needs a database: one
/// in-memory database per test, opened and closed at file scope. See
/// [appTest] for why the tree has to come down before this is closed.
late ActionsDatabase _db;
late FakeNotificationScheduler _scheduler;

/// Home's fixed "now": Tue 18 Aug 2026, midday, local — deadlines are
/// wall-clock values, so the clock has to be one too.
final homeNow = DateTime(2026, 8, 18, 12);

Widget _app(SourceStore store, {OcrService? ocr}) {
  return ProviderScope(
    overrides: [
      sourceStoreProvider.overrideWith((ref) async => store),
      // Without this the widget tests reach for the real ML Kit recogniser,
      // which needs a platform channel and a device.
      ocrServiceProvider.overrideWithValue(ocr ?? const FakeOcrService()),
      // The cloud stays entirely out of widget tests.
      actionsDatabaseProvider.overrideWithValue(_db),
      authIdentityServiceProvider.overrideWithValue(const _NoIdentity()),
      actionCloudMirrorProvider
          .overrideWithValue(const NoopActionCloudMirror()),
      // A fixed clock, so triage never depends on when the suite runs.
      appClockProvider.overrideWithValue(() => homeNow),
      notificationSchedulerProvider.overrideWithValue(_scheduler),
      // These tests are about the app *after* first run. Without this the
      // Day-13 router guard correctly sends every one of them to onboarding.
      preferenceStoreProvider.overrideWithValue(onboardedPreferences()),
    ],
    child: const ActionApp(),
  );
}

/// A widget test for the app shell, with the teardown drift needs.
///
/// Home subscribes to a drift query stream. When that subscription is
/// cancelled, drift schedules a zero-duration timer to retire the stream —
/// and the framework unmounts the tree *after* the test body has finished,
/// then immediately asserts that no timer is pending. So the tree is detached
/// here instead, one pump early, while the fake clock can still run that timer
/// out. Leaving it to the framework fails the test; leaving it to `tearDown`
/// is worse, because a database whose stream is still subscribed never
/// finishes closing.
void appTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    try {
      await body(tester);
    } finally {
      // In a finally, so a failing test still tears its tree down. Without it
      // one failure left pending timers behind and every later test in the
      // file hung — turning a two-second failure into an eight-minute one.
      await tester.pumpWidget(const SizedBox.shrink());
      // Elapsing is what runs that timer: a bare `pump()` only flushes
      // microtasks and would leave it pending.
      await tester.pump(Duration.zero);
    }
  });
}

SourceItem _ready(String text) => SourceItem(
      id: '1',
      type: SourceType.pastedText,
      capturedAt: DateTime.now(),
      pastedText: text,
      state: SourceProcessingState.ready,
    );

void main() {
  setUp(() {
    _db = ActionsDatabase(NativeDatabase.memory());
    _scheduler = FakeNotificationScheduler();
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  appTest('empty inbox explains what to do instead of showing a blank list',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    // V2 splits the empty state. A brand-new user is told what Action can do
    // and given a way in, rather than being told only what is absent.
    expect(find.text('Start with anything'), findsOneWidget);
    expect(find.text('WHAT ACTION HANDLES'), findsOneWidget);
    expect(find.text('Capture something'), findsWidgets);
  });

  appTest('a confirmed Action that was saved earlier is on Home after a '
      'restart, under a section that reflects its deadline', (tester) async {
    // Persisted before the app is built at all: this is what a relaunch sees.
    final repo = DriftActionRepository(_db);
    await repo.create(ActionItem(
      id: 'a1',
      title: 'Pay the Riverford Energy bill',
      status: ActionStatus.active,
      origin: ActionOrigin.extraction,
      dueAt: ActionDue(DateTime.now().add(const Duration(days: 12))),
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    ));

    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('AHEAD'), findsOneWidget);
    expect(find.text('Pay the Riverford Energy bill'), findsOneWidget);
    expect(find.text('Nothing needs your attention'), findsNothing);
  });

  appTest('an Action the user typed themselves is never labelled "Not sure"',
      (tester) async {
    // Manual actions carry no category, and the category label for that is
    // "Not sure" — honest about an extraction, a false doubt about this.
    final repo = DriftActionRepository(_db);
    await repo.create(ActionItem(
      id: 'a1',
      title: 'Call the bank',
      status: ActionStatus.active,
      origin: ActionOrigin.manual,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    ));

    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('Call the bank'), findsOneWidget);
    expect(find.text('Created by you'), findsOneWidget);
    expect(find.text('Not sure'), findsNothing);
  });

  // ------------------------------------------------------------- triage --

  Future<void> seedAction(
    String id, {
    required String title,
    DateTime? due,
    ActionUrgency urgency = ActionUrgency.normal,
    ActionStatus status = ActionStatus.active,
    List<ActionStepItem> steps = const [],
    DateTime? completedAt,
  }) =>
      DriftActionRepository(_db).create(sampleAction(
        id,
        title: title,
        status: status,
        urgency: urgency,
        dueAt: due == null ? null : ActionDue(due),
        steps: steps,
        completedAt: completedAt,
        createdAt: DateTime(2026, 8, 1),
      ));

  /// The order titles appear in, top to bottom.
  List<String> renderedOrder(WidgetTester tester, List<String> titles) {
    final positions = <String, double>{};
    for (final title in titles) {
      final finder = find.text(title);
      if (finder.evaluate().isNotEmpty) {
        positions[title] = tester.getTopLeft(finder.first).dy;
      }
    }
    final sorted = positions.keys.toList()
      ..sort((a, b) => positions[a]!.compareTo(positions[b]!));
    return sorted;
  }

  appTest('Home ranks by pressure, not by when things were added',
      (tester) async {
    await seedAction('later', title: 'Renew the passport',
        due: DateTime(2026, 9, 30));
    await seedAction('today', title: 'Pay the water bill',
        due: DateTime(2026, 8, 18));
    await seedAction('overdue', title: 'Return the router',
        due: DateTime(2026, 8, 14));

    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(
      renderedOrder(tester,
          ['Return the router', 'Pay the water bill', 'Renew the passport']),
      ['Return the router', 'Pay the water bill', 'Renew the passport'],
    );
  });

  appTest('a card says why it is where it is, once', (tester) async {
    await seedAction('a1', title: 'Return the router',
        due: DateTime(2026, 8, 14));
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('OVERDUE · 4 DAYS'), findsOneWidget);
    // The device found this: the badge and the meta line both wanted to
    // announce the deadline, and saying it twice is reason spam.
    expect(find.textContaining('was due'), findsNothing);
  });

  appTest('a badge that says nothing about dates leaves the deadline visible',
      (tester) async {
    await seedAction('a1', title: 'Call the solicitor',
        due: DateTime(2026, 9, 30), urgency: ActionUrgency.critical);
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    // "Critical" says nothing about when, so the date still earns its place.
    expect(find.text('Due 30 Sep'), findsOneWidget);
  });

  appTest('due today says due today, and is not called overdue',
      (tester) async {
    await seedAction('a1', title: 'Pay the water bill',
        due: DateTime(2026, 8, 18));
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('DUE TODAY'), findsOneWidget);
    expect(find.textContaining('OVERDUE'), findsNothing);
  });

  appTest('tapping the reason explains it in a sentence', (tester) async {
    await seedAction('a1', title: 'Pay the water bill',
        due: DateTime(2026, 8, 18));
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('DUE TODAY'));
    await tester.pumpAndSettle();

    expect(find.text('This needs attention because it is due today.'),
        findsOneWidget);
  });

  appTest('a critical Action with no deadline is surfaced and explained',
      (tester) async {
    await seedAction('a1', title: 'Call the solicitor',
        urgency: ActionUrgency.critical);
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    // A single needs-attention Action is the hero, so there is no section
    // header above it — but it still says why it is there.
    expect(find.text('NEEDS YOU'), findsOneWidget);
    expect(find.text('CRITICAL'), findsOneWidget);
  });

  appTest('an ordinary Action with no deadline stays quiet', (tester) async {
    await seedAction('a1', title: 'Tidy the loft');
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    // A quiet Action is the hero, but the brief says the day is clear rather
    // than manufacturing urgency for it.
    expect(find.text('AHEAD'), findsOneWidget);
    expect(find.text('NEEDS YOU'), findsNothing);
    // No badge: a label on every card is a label on none of them.
    expect(find.text('CRITICAL'), findsNothing);
  });

  appTest('an Action whose steps are all done asks to be finished',
      (tester) async {
    await seedAction('a1', title: 'Renew the passport', steps: [
      sampleStep('s1', isCompleted: true),
      sampleStep('s2', order: 1, isCompleted: true),
    ]);
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('ALL STEPS DONE'), findsOneWidget);
    expect(find.text('NEEDS YOU'), findsOneWidget);
  });

  appTest('a reminder the user set for soon lifts an Action', (tester) async {
    await seedAction('a1', title: 'Call the bank');
    final reminders = DriftReminderRepository(_db);
    final made = await reminders.createIntent(
      actionId: 'a1',
      scheduledAt: homeNow.add(const Duration(hours: 3)),
      timeZoneId: 'Asia/Dhaka',
      now: homeNow,
    );
    await reminders.markState(made!.id,
        state: ReminderState.scheduled, now: homeNow);

    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('REMINDER SOON'), findsOneWidget);
    expect(find.text('NEEDS YOU'), findsOneWidget);
  });

  appTest('a reminder blocked on permission lifts nothing', (tester) async {
    await seedAction('a1', title: 'Call the bank');
    final reminders = DriftReminderRepository(_db);
    final made = await reminders.createIntent(
      actionId: 'a1',
      scheduledAt: homeNow.add(const Duration(hours: 3)),
      timeZoneId: 'Asia/Dhaka',
      now: homeNow,
    );
    await reminders.markState(made!.id,
        state: ReminderState.needsPermission, now: homeNow);

    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('REMINDER SOON'), findsNothing);
    expect(find.text('Needs attention'.toUpperCase()), findsNothing);
  });

  appTest('completing an Action moves it out of the active sections',
      (tester) async {
    await seedAction('a1', title: 'Pay the water bill',
        due: DateTime(2026, 8, 18));
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();
    expect(find.text('DUE TODAY'), findsOneWidget);

    // The control names the Action it acts on, so a screen reader moving
    // down a list of them says something different each time.
    await tester.tap(find.byTooltip('Mark "Pay the water bill" as done'));
    await tester.pumpAndSettle();

    // Finished work leaves the daily surface entirely: Today acknowledges it
    // in one line and the Logbook is Library -> Done. No researched product
    // keeps completions on the daily screen.
    expect(find.text('1 done'), findsOneWidget);
    expect(find.text('NEEDS YOU'), findsNothing);
    // A finished obligation is never described as late.
    expect(find.text('DUE TODAY'), findsNothing);
  });

  appTest('an archived Action stays off Home even when overdue',
      (tester) async {
    await seedAction('a1', title: 'Return the router',
        due: DateTime(2026, 8, 1), status: ActionStatus.archived);
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('Return the router'), findsNothing);
    // An archived Action still counts as having used the app, so this is the
    // cleared state rather than the first-run one.
    expect(find.text("You're clear"), findsOneWidget);
  });

  appTest('a big amount does not jump the queue', (tester) async {
    // Money must never rank obligations; the deadline decides.
    await DriftActionRepository(_db).create(sampleAction('costly',
        title: 'Pay the big invoice',
        amount: gbp('10000.00'),
        dueAt: ActionDue(DateTime(2026, 9, 30)),
        createdAt: DateTime(2026, 8, 1)));
    await seedAction('soon', title: 'Pay the small one',
        due: DateTime(2026, 8, 18));

    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(
      renderedOrder(tester, ['Pay the small one', 'Pay the big invoice']),
      ['Pay the small one', 'Pay the big invoice'],
    );
  });

  appTest('triage renders in dark theme', (tester) async {
    await seedAction('a1', title: 'Return the router',
        due: DateTime(2026, 8, 14));
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('OVERDUE · 4 DAYS'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  appTest('captures appear under Captures with their provenance',
      (tester) async {
    await tester.pumpWidget(
      _app(FakeSourceStore([_ready('Car insurance renewal due 30 September')])),
    );
    await tester.pumpAndSettle();

    // Confirmed Actions own "Needs attention" now; raw captures have their
    // own section.
    // Today shows captures that are actually waiting on the user; the full
    // inbox lives in Library -> Captures.
    expect(find.text('WAITING FOR REVIEW'), findsOneWidget);
    expect(
      find.textContaining(SourceType.pastedText.provenanceLabel),
      findsWidgets,
    );
    expect(find.textContaining('30 September'), findsOneWidget);
  });

  appTest('a capture still being read says so rather than looking empty',
      (tester) async {
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.processing,
          ),
        ]),
        ocr: _NeverCompletesOcrService(),
      ),
    );
    await tester.pump();

    expect(find.text('Reading the text…'), findsOneWidget);
  });

  appTest('a capture interrupted mid-read does not stay stuck on the inbox',
      (tester) async {
    // The device found this: records left in `pending` showed "Reading the
    // text…" forever, with no retry and no manual entry reachable from there.
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.pending,
          ),
        ]),
        ocr: const FakeOcrService(fallback: 'Renewal due 30 September'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Reading the text…'), findsNothing);
    expect(find.textContaining('30 September'), findsOneWidget);
  });

  appTest('a failed capture surfaces the reason on the inbox row',
      (tester) async {
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.failed,
            failureReason: "That image format couldn't be read on this device.",
          ),
        ]),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text("That image format couldn't be read on this device."),
      findsOneWidget,
    );
  });

  appTest('a capture that read successfully but found nothing says so',
      (tester) async {
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.ready,
            ocr: OcrOutcome(
              rawText: '',
              normalizedText: '',
              lines: const [],
              engine: 'test',
              processedAt: DateTime.now(),
              durationMs: 5,
            ),
          ),
        ]),
      ),
    );
    await tester.pumpAndSettle();

    // Distinct from failure: recognition ran fine, the picture just has no text.
    expect(find.text('No text found'), findsOneWidget);
  });

  appTest('the add button opens the capture chooser with all three inputs',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Capture something'));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsOneWidget);
    expect(find.text('Choose an image'), findsOneWidget);
    expect(find.text('Paste text'), findsOneWidget);
  });

  appTest('dismissing the chooser returns to the inbox unchanged',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Capture something'));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(200, 60));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsNothing);
    expect(find.text('Start with anything'), findsOneWidget);
  });

  appTest('paste screen gates Continue until there is enough text',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Capture something'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Paste text'));
    await tester.pumpAndSettle();

    final continueButton = find.widgetWithText(FilledButton, 'Continue');
    expect(tester.widget<FilledButton>(continueButton).onPressed, isNull);

    await tester.enterText(
      find.byType(TextField),
      'Car insurance renewal is due on 30 September and costs 780.',
    );
    await tester.pumpAndSettle();

    expect(tester.widget<FilledButton>(continueButton).onPressed, isNotNull);
  });

  appTest('tapping a capture opens what we read from it', (tester) async {
    await tester.pumpWidget(
      _app(FakeSourceStore([_ready('Renewal due 30 September, 780.00')])),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('Renewal due 30 September'));
    await tester.pumpAndSettle();

    expect(find.text('What we read'), findsOneWidget);
    expect(find.text('Text found'), findsOneWidget);
    expect(
      find.textContaining('Nothing has been interpreted yet'),
      findsOneWidget,
      reason: 'the screen must not imply the app has drawn conclusions',
    );
  });

  appTest('a failed capture offers retry and manual entry', (tester) async {
    await tester.pumpWidget(
      _app(
        FakeSourceStore([
          SourceItem(
            id: '1',
            type: SourceType.photo,
            capturedAt: DateTime.now(),
            imagePath: '/fake/a.jpg',
            state: SourceProcessingState.failed,
            failureReason: 'Text recognition could not run.',
          ),
        ]),
      ),
    );
    await tester.pumpAndSettle();

    // The card now leads with the reason it failed, which is both the useful
    // thing to show and a stable handle for opening it.
    await tester.tap(find.text('Text recognition could not run.'));
    await tester.pumpAndSettle();

    expect(find.text("Couldn't read this"), findsOneWidget);
    expect(find.text('Try reading again'), findsOneWidget);
    expect(
      find.text('Type the details instead'),
      findsOneWidget,
      reason: 'manual creation must stay available when extraction fails',
    );
  });
}
