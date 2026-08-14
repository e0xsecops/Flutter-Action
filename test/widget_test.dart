import 'package:action_app/app/app.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/source_store.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// In-memory stand-in so widget tests never touch path_provider's platform
/// channel, and so list contents are fixtures rather than whatever happens to
/// be on disk.
class _FakeStore implements SourceStore {
  _FakeStore([this._items = const []]);

  List<SourceItem> _items;

  @override
  Future<List<SourceItem>> all() async => _items;

  @override
  Future<void> add(SourceItem item) async => _items = [item, ..._items];

  @override
  Future<void> delete(String id) async =>
      _items = _items.where((i) => i.id != id).toList();

  @override
  Future<void> clear() async => _items = const [];
}

Widget _app(SourceStore store) {
  return ProviderScope(
    overrides: [sourceStoreProvider.overrideWith((ref) async => store)],
    child: const ActionApp(),
  );
}

void main() {
  testWidgets('empty inbox explains what to do instead of showing a blank list',
      (tester) async {
    await tester.pumpWidget(_app(_FakeStore()));
    await tester.pumpAndSettle();

    expect(find.text('Nothing needs your attention'), findsOneWidget);
    expect(find.text('Add something'), findsOneWidget);
  });

  testWidgets('captures appear under Needs attention with their provenance',
      (tester) async {
    final store = _FakeStore([
      SourceItem(
        id: '1',
        type: SourceType.pastedText,
        capturedAt: DateTime.now(),
        rawText: 'Car insurance renewal due 30 September, \$780',
      ),
    ]);

    await tester.pumpWidget(_app(store));
    await tester.pumpAndSettle();

    expect(find.text('Needs attention'.toUpperCase()), findsOneWidget);
    expect(find.text(SourceType.pastedText.provenanceLabel), findsOneWidget);
    expect(find.textContaining('30 September'), findsOneWidget);
    expect(find.text('Nothing needs your attention'), findsNothing);
  });

  testWidgets('the add button opens the capture chooser with all three inputs',
      (tester) async {
    await tester.pumpWidget(_app(_FakeStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add something'));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsOneWidget);
    expect(find.text('Choose an image'), findsOneWidget);
    expect(find.text('Paste text'), findsOneWidget);
  });

  testWidgets('dismissing the chooser returns to the inbox unchanged',
      (tester) async {
    await tester.pumpWidget(_app(_FakeStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add something'));
    await tester.pumpAndSettle();
    expect(find.text('Take a photo'), findsOneWidget);

    // Tapping the scrim is how most users back out of a sheet.
    await tester.tapAt(const Offset(200, 60));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsNothing);
    expect(find.text('Nothing needs your attention'), findsOneWidget);
  });

  testWidgets('paste screen gates Continue until there is enough text',
      (tester) async {
    await tester.pumpWidget(_app(_FakeStore()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add something'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Paste text'));
    await tester.pumpAndSettle();

    final continueButton = find.widgetWithText(FilledButton, 'Continue');
    expect(continueButton, findsOneWidget);
    expect(tester.widget<FilledButton>(continueButton).onPressed, isNull);

    await tester.enterText(
      find.byType(TextField),
      'Car insurance renewal is due on 30 September and costs 780 dollars.',
    );
    await tester.pumpAndSettle();

    expect(tester.widget<FilledButton>(continueButton).onPressed, isNotNull);
  });
}
