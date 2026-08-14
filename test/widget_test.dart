import 'package:action_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home shows the three triage tabs', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ActionApp()));
    await tester.pumpAndSettle();

    expect(find.text('Needs attention'), findsOneWidget);
    expect(find.text('Upcoming'), findsOneWidget);
    expect(find.text('Completed'), findsOneWidget);
  });

  testWidgets('each tab renders its own empty state', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ActionApp()));
    await tester.pumpAndSettle();

    expect(find.text('Nothing needs attention'), findsOneWidget);

    await tester.tap(find.text('Upcoming'));
    await tester.pumpAndSettle();
    expect(find.text('Nothing upcoming'), findsOneWidget);

    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Nothing completed yet'), findsOneWidget);
  });

  testWidgets('add opens the capture screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ActionApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(FloatingActionButton, 'Add'));
    await tester.pumpAndSettle();

    expect(find.text('Take a photo'), findsOneWidget);
    expect(find.text('Paste text'), findsOneWidget);
  });
}
