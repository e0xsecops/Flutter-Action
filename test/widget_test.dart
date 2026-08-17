import 'dart:async';

import 'package:action_app/app/app.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/ocr_result.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_stores.dart';

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
    await body(tester);
    await tester.pumpWidget(const SizedBox.shrink());
    // Elapsing is what runs that timer: a bare `pump()` only flushes
    // microtasks and would leave it pending.
    await tester.pump(Duration.zero);
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
  setUp(() => _db = ActionsDatabase(NativeDatabase.memory()));
  tearDown(() => _db.close());

  appTest('empty inbox explains what to do instead of showing a blank list',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    expect(find.text('Nothing needs your attention'), findsOneWidget);
    expect(find.text('Add something'), findsOneWidget);
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

    expect(find.text('Upcoming'.toUpperCase()), findsOneWidget);
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

  appTest('captures appear under Captures with their provenance',
      (tester) async {
    await tester.pumpWidget(
      _app(FakeSourceStore([_ready('Car insurance renewal due 30 September')])),
    );
    await tester.pumpAndSettle();

    // Confirmed Actions own "Needs attention" now; raw captures have their
    // own section.
    expect(find.text('Captures'.toUpperCase()), findsOneWidget);
    expect(find.text(SourceType.pastedText.provenanceLabel), findsOneWidget);
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

    await tester.tap(find.text('Add something'));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsOneWidget);
    expect(find.text('Choose an image'), findsOneWidget);
    expect(find.text('Paste text'), findsOneWidget);
  });

  appTest('dismissing the chooser returns to the inbox unchanged',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add something'));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(200, 60));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsNothing);
    expect(find.text('Nothing needs your attention'), findsOneWidget);
  });

  appTest('paste screen gates Continue until there is enough text',
      (tester) async {
    await tester.pumpWidget(_app(FakeSourceStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add something'));
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

    await tester.tap(find.text(SourceType.pastedText.provenanceLabel));
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

    await tester.tap(find.text(SourceType.photo.provenanceLabel));
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
