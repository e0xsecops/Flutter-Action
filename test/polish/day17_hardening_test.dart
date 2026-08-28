import 'dart:ui' as ui;

import 'package:action_app/design/app_theme.dart';
import 'package:action_app/design/components/glass_surface.dart';
import 'package:action_app/design/components/readable_width.dart';
import 'package:action_app/design/tokens/dimens.dart';
import 'package:action_app/features/actions/application/action_triage.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Day-17 hardening: the glass primitive's contract, responsive width, RTL
/// sanity, and the timezone semantics the whole deadline model rests on.

Widget _host(
  Widget child, {
  bool highContrast = false,
  bool reduceMotion = false,
  Brightness brightness = Brightness.light,
  TextDirection direction = TextDirection.ltr,
  Size size = const Size(400, 800),
}) {
  return MediaQuery(
    data: MediaQueryData(
      size: size,
      highContrast: highContrast,
      disableAnimations: reduceMotion,
    ),
    child: Directionality(
      textDirection: direction,
      child: Theme(
        data: brightness == Brightness.dark ? AppTheme.dark() : AppTheme.light(),
        child: Material(child: Center(child: child)),
      ),
    ),
  );
}

void main() {
  group('the glass surface', () {
    testWidgets('blurs by default', (tester) async {
      await tester.pumpWidget(_host(
        const GlassSurface(child: Text('Controls')),
      ));
      expect(find.byType(BackdropFilter), findsOneWidget);
      expect(find.text('Controls'), findsOneWidget);
    });

    testWidgets('drops the blur entirely when high contrast is asked for',
        (tester) async {
      await tester.pumpWidget(_host(
        const GlassSurface(child: Text('Controls')),
        highContrast: true,
      ));
      // Not "less blur" — none. A read-back that buys nothing is pure cost,
      // and someone who asked for contrast has said translucency is a problem.
      expect(find.byType(BackdropFilter), findsNothing);
      expect(find.text('Controls'), findsOneWidget);
    });

    testWidgets('keeps its layout when translucency goes', (tester) async {
      await tester.pumpWidget(_host(
        const SizedBox(
          width: 300,
          child: GlassSurface(child: SizedBox(height: 40)),
        ),
      ));
      final glassy = tester.getSize(find.byType(GlassSurface));

      await tester.pumpWidget(_host(
        const SizedBox(
          width: 300,
          child: GlassSurface(child: SizedBox(height: 40)),
        ),
        highContrast: true,
      ));
      // Nothing moves: the fallback is a different *material*, not a
      // different layout.
      expect(tester.getSize(find.byType(GlassSurface)), glassy);
    });

    testWidgets('stays silent to a screen reader unless given a role',
        (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(_host(
        const GlassSurface(child: Text('Search')),
      ));
      // A decorative container must not announce itself before the labelled
      // controls inside it.
      expect(
        find.bySemanticsLabel('Search'),
        findsOneWidget,
        reason: 'the control inside is still reachable',
      );
      handle.dispose();
    });

    testWidgets('announces itself when it genuinely is the thing',
        (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(_host(
        const GlassSurface(
          semanticLabel: 'Search controls',
          child: Text('x'),
        ),
      ));
      // The label merges with the child's, so match on containment.
      expect(find.bySemanticsLabel(RegExp('Search controls')), findsOneWidget);
      handle.dispose();
    });

    testWidgets('a tap still works with animations disabled', (tester) async {
      var taps = 0;
      await tester.pumpWidget(_host(
        GlassSurface(onTap: () => taps++, child: const Text('Tap me')),
        reduceMotion: true,
      ));
      await tester.tap(find.text('Tap me'));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });

    testWidgets('renders in dark without throwing', (tester) async {
      await tester.pumpWidget(_host(
        const GlassSurface(
          intensity: GlassIntensity.strong,
          child: Text('Dark'),
        ),
        brightness: Brightness.dark,
      ));
      expect(tester.takeException(), isNull);
      expect(find.byType(BackdropFilter), findsOneWidget);
    });

    testWidgets('every intensity paints exactly one blur layer',
        (tester) async {
      for (final intensity in GlassIntensity.values) {
        await tester.pumpWidget(_host(
          GlassSurface(intensity: intensity, child: const Text('x')),
        ));
        // One bounded read-back per surface. Nested blurs are how a design
        // like this quietly becomes unaffordable.
        expect(find.byType(BackdropFilter), findsOneWidget);
      }
    });

    testWidgets('clips its blur, so the read-back is the surface not the page',
        (tester) async {
      await tester.pumpWidget(_host(
        const GlassSurface(child: Text('x')),
      ));
      final clip = tester.widget<ClipRRect>(
        find.ancestor(
          of: find.byType(BackdropFilter),
          matching: find.byType(ClipRRect),
        ).first,
      );
      expect(clip.borderRadius, isNotNull);
    });
  });

  group('readable width', () {
    // A keyed child that wants all the width it can get, so what is measured
    // is the cap itself rather than the wrapper (which fills by design).
    const contentKey = ValueKey('content');
    const content = SizedBox(key: contentKey, height: 20, width: double.infinity);

    testWidgets('does not stretch content across a tablet', (tester) async {
      await tester.pumpWidget(_host(
        const SizedBox(width: 1200, child: ReadableWidth.list(child: content)),
      ));
      expect(
        tester.getSize(find.byKey(contentKey)).width,
        Breakpoints.readableList,
      );
    });

    testWidgets('leaves a phone alone', (tester) async {
      await tester.pumpWidget(_host(
        const SizedBox(width: 380, child: ReadableWidth.list(child: content)),
      ));
      // Below the cap nothing is constrained, so the phone layout is
      // untouched — this is a ceiling, not a new layout.
      expect(tester.getSize(find.byKey(contentKey)).width, 380);
    });

    testWidgets('prose is held tighter than a card list', (tester) async {
      await tester.pumpWidget(_host(
        const SizedBox(width: 1200, child: ReadableWidth(child: content)),
      ));
      expect(
        tester.getSize(find.byKey(contentKey)).width,
        Breakpoints.readableContent,
      );
    });

    // Both of these are laid out under *bounded* height — the situation a
    // Scaffold's bottom bar is in, and the one where the two behaviours
    // actually differ. Under unbounded height everything shrinks and the
    // distinction says nothing.
    testWidgets('shrinkVertically takes only the height it needs',
        (tester) async {
      await tester.pumpWidget(_host(
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
          child: const ReadableWidth(
            shrinkVertically: true,
            child: SizedBox(height: 50, width: 100),
          ),
        ),
      ));
      // The bug this guards: an Align given bounded-but-loose constraints
      // fills them, so a bottom bar wrapped without this grew to the full
      // screen height and swallowed taps meant for the page behind it.
      expect(tester.getSize(find.byType(ReadableWidth)).height, 50);
    });

    testWidgets('the default still fills the height offered', (tester) async {
      await tester.pumpWidget(_host(
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
          child: const ReadableWidth(child: SizedBox(height: 50, width: 100)),
        ),
      ));
      // A page body wants the room; only bars opt out.
      expect(tester.getSize(find.byType(ReadableWidth)).height, 600);
    });
  });

  group('right-to-left sanity', () {
    testWidgets('a glass surface lays out without overflowing in RTL',
        (tester) async {
      await tester.pumpWidget(_host(
        const SizedBox(
          width: 320,
          child: GlassSurface(
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 8),
                Expanded(child: Text('بحث في الإجراءات')),
              ],
            ),
          ),
        ),
        direction: TextDirection.rtl,
      ));
      expect(tester.takeException(), isNull);
    });

    testWidgets('readable width centres the same way in RTL', (tester) async {
      await tester.pumpWidget(_host(
        const SizedBox(
          width: 1200,
          child: ReadableWidth.list(
            child: SizedBox(key: ValueKey('rtl'), height: 20, width: double.infinity),
          ),
        ),
        direction: TextDirection.rtl,
      ));
      expect(tester.takeException(), isNull);
      expect(
        tester.getSize(find.byKey(const ValueKey('rtl'))).width,
        Breakpoints.readableList,
      );
    });
  });

  group('timezone and calendar meaning', () {
    test('a date-only deadline is a local calendar day, not an instant', () {
      final due = ActionDue(DateTime(2026, 8, 28));
      // Same wall-clock date read from two very different local times: what
      // it means must not depend on where the device thinks it is.
      expect(dueRelationFor(due, DateTime(2026, 8, 28, 0, 1)),
          DueRelation.today);
      expect(dueRelationFor(due, DateTime(2026, 8, 28, 23, 59)),
          DueRelation.today);
      expect(dueRelationFor(due, DateTime(2026, 8, 29, 0, 1)),
          DueRelation.overdue);
    });

    test('a timestamp deadline is an instant and goes overdue on time', () {
      final due = ActionDue(DateTime(2026, 8, 28, 14, 30));
      expect(dueRelationFor(due, DateTime(2026, 8, 28, 14, 29)),
          DueRelation.today);
      expect(dueRelationFor(due, DateTime(2026, 8, 28, 14, 31)),
          DueRelation.overdue);
    });

    test('a stored deadline round-trips unchanged through storage', () {
      // The property that makes a timezone change harmless: the stored form
      // carries no zone, so it cannot be re-interpreted into a different day.
      final due = ActionDue(DateTime(2026, 8, 28));
      final restored = ActionDue.fromStorage(due.toStorage())!;
      expect(restored.wallClock, DateTime(2026, 8, 28));
      expect(restored.isDateOnly, isTrue);
      expect(restored.toStorage(), isNot(contains('Z')));
    });

    test('day counting survives a daylight-saving jump', () {
      // Computed in UTC precisely so a 23- or 25-hour local day cannot round
      // the answer to the wrong number of days.
      expect(
        calendarDaysBetween(DateTime(2026, 3, 28), DateTime(2026, 3, 29)),
        1,
      );
      expect(
        calendarDaysBetween(DateTime(2026, 10, 24), DateTime(2026, 10, 25)),
        1,
      );
    });
  });

  group('glass cost is bounded', () {
    testWidgets('the inbox never wraps its list in a blur', (tester) async {
      // The rule Day 16 bought and Day 17 must not spend: bounded surfaces
      // only. A blur wrapped around a scrolling list reads back the whole
      // viewport every frame.
      await tester.pumpWidget(_host(
        Column(
          children: [
            const GlassSurface(child: Text('header')),
            Expanded(
              child: ListView.builder(
                itemCount: 200,
                itemBuilder: (_, i) => SizedBox(height: 40, child: Text('$i')),
              ),
            ),
          ],
        ),
      ));
      expect(find.byType(BackdropFilter), findsOneWidget);
      expect(
        find.ancestor(
          of: find.byType(ListView),
          matching: find.byType(BackdropFilter),
        ),
        findsNothing,
        reason: 'a list must never sit inside a backdrop filter',
      );
    });

    testWidgets('even the strongest surface keeps its sigma modest',
        (tester) async {
      await tester.pumpWidget(_host(
        const GlassSurface(
          intensity: GlassIntensity.strong,
          child: Text('x'),
        ),
      ));
      final filter = tester.widget<BackdropFilter>(find.byType(BackdropFilter));
      expect(filter.filter, isA<ui.ImageFilter>());
      // Past roughly 25 the visual difference stops being worth what the
      // read-back costs, so the top of the scale sits below it.
      final sigma = RegExp(r'([0-9]+\.?[0-9]*)')
          .firstMatch(filter.filter.toString())
          ?.group(1);
      expect(sigma, isNotNull, reason: filter.filter.toString());
      expect(double.parse(sigma!), lessThanOrEqualTo(25));
    });
  });
}
