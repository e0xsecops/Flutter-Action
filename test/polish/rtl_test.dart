/// Right-to-left layout.
///
/// **Why this exists before any translation does.** Action's copy is English,
/// and these tests do not pretend otherwise — they force the *direction* and
/// check that the layout survives it. That ordering is deliberate: RTL bugs are
/// layout bugs, they are expensive to retrofit across a hundred screens, and
/// they are invisible until someone forces the direction. Doing it now means
/// adding a translated locale later is a file rather than a re-layout.
///
/// **Why the screens are mounted rather than the whole app.** Wrapping
/// `ActionApp` in a `Directionality` does nothing: `MaterialApp` builds a
/// `Localizations`, and `Localizations` imposes its own `Directionality` from
/// the resolved locale, which overrides anything above it. The first version of
/// this file did exactly that and ten of its twelve tests passed while
/// rendering left-to-right — proving nothing at all. The only two that failed
/// were the two that checked the geometry, which is the argument for checking
/// geometry.
///
/// So the direction is set the way the framework actually sets it: a
/// `MaterialApp` this file owns, declaring an RTL locale — and now with the
/// real delegate list and the real twenty supported locales, so the strings
/// under test are the translated Arabic and Urdu the app actually ships
/// rather than English rendered right to left.
library;

import 'package:action_app/design/app_theme.dart';
import 'package:action_app/design/tokens/dimens.dart';
import 'package:action_app/features/actions/application/action_providers.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/data/auth_identity_service.dart';
import 'package:action_app/features/actions/data/drift_action_repository.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/actions/presentation/action_card.dart';
import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:action_app/features/capture/data/ocr_service.dart';
import 'package:action_app/features/home/presentation/home_screen.dart';
import 'package:action_app/l10n/gen/app_l10n.dart';
import 'package:action_app/l10n/gen/app_l10n_ar.dart';
import 'package:action_app/l10n/gen/app_l10n_en.dart';
import 'package:action_app/features/library/presentation/library_screen.dart';
import 'package:action_app/features/intelligence/presentation/studio_screen.dart';
import 'package:action_app/features/search/presentation/search_screen.dart';
import 'package:drift/native.dart';
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
late FakeSourceStore _sources;

final _now = DateTime(2026, 8, 18, 12);

/// Mounts [screen] with the direction set the way the framework sets it.
///
/// `Locale('ar')` declared as the only supported locale is what makes
/// `GlobalWidgetsLocalizations` resolve `TextDirection.rtl`. Imposing a
/// `Directionality` above `MaterialApp` would be silently discarded.
Future<void> pumpScreen(
  WidgetTester tester,
  Widget screen, {
  TextDirection direction = TextDirection.rtl,
  double textScale = 1.0,
  Locale? locale,
}) async {
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
      ],
      child: MaterialApp(
        theme: AppTheme.light(),
        // The real delegate list and the real twenty locales, so these tests
        // mirror the app rather than a reduced stand-in of it. The direction
        // still comes from the locale, which is the only way Flutter sets it.
        localizationsDelegates: AppL10n.localizationsDelegates,
        locale: locale ??
            (direction == TextDirection.rtl
                ? const Locale('ar')
                : const Locale('en')),
        supportedLocales: AppL10n.supportedLocales,
        home: Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(textScale)),
            child: Scaffold(body: screen),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Proof the harness works at all.
///
/// Without this, every "renders without exception" test below could be passing
/// left-to-right and nobody would know — which is exactly what happened to the
/// first version of this file.
TextDirection directionInTree(WidgetTester tester, Finder anchor) {
  return Directionality.of(tester.element(anchor.first));
}

void rtlTest(String description, Future<void> Function(WidgetTester) body) {
  testWidgets(description, (tester) async {
    tester.view.physicalSize = const Size(420, 1800);
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

ActionItem _action(String id, {String? title}) => sampleAction(
      id,
      title: title ?? 'Renew the insurance policy',
      sourceId: null,
      createdAt: _now.subtract(const Duration(days: 1)),
      dueAt: ActionDue(_now.add(const Duration(days: 3))),
    );

void main() {
  setUp(() async {
    _db = ActionsDatabase(NativeDatabase.memory());
    _scheduler = FakeNotificationScheduler();
    _sources = FakeSourceStore();
    await DriftActionRepository(_db).create(_action('a1'));
  });
  tearDown(() {
    _scheduler.dispose();
    return _db.close();
  });

  group('the harness really is right-to-left', () {
    rtlTest('the tree resolves to rtl', (tester) async {
      await pumpScreen(tester, const HomeScreen());

      expect(
        directionInTree(tester, find.byType(HomeScreen)),
        TextDirection.rtl,
      );
    });

    rtlTest('and to ltr when asked for ltr', (tester) async {
      await pumpScreen(
        tester,
        const HomeScreen(),
        direction: TextDirection.ltr,
      );

      expect(
        directionInTree(tester, find.byType(HomeScreen)),
        TextDirection.ltr,
      );
    });
  });

  group('the screens render mirrored without breaking', () {
    rtlTest('Today', (tester) async {
      await pumpScreen(tester, const HomeScreen());

      expect(tester.takeException(), isNull);
      expect(find.text('Renew the insurance policy'), findsWidgets);
    });

    rtlTest('Library', (tester) async {
      await pumpScreen(tester, const LibraryScreen());

      expect(tester.takeException(), isNull);
    });

    rtlTest('Intelligence', (tester) async {
      await pumpScreen(tester, const StudioScreen());

      expect(tester.takeException(), isNull);
      // The Arabic hero title, because the harness declares an Arabic locale
      // — asserting the English one would pass only if the translation were
      // missing.
      expect(find.text(AppL10nAr().studioHeroTitle), findsWidgets);
    });

    rtlTest('Search', (tester) async {
      await pumpScreen(tester, const SearchScreen());

      expect(tester.takeException(), isNull);
    });
  });

  group('the layout actually mirrors', () {
    rtlTest("an Action card's urgency spine sits on the leading edge",
        (tester) async {
      // The spine is the first child of the card's Row and marks where the
      // card starts. In a right-to-left script that is the right-hand side —
      // it used to be pinned left by a hardcoded margin.
      //
      // Library rather than Today: with a single Action, Today puts it in the
      // hero, which has no card and therefore no spine.
      Finder spine() => find.byWidgetPredicate(
            (w) => w is Container && w.constraints?.maxWidth == Strokes.spine,
          );

      await pumpScreen(
        tester,
        const LibraryScreen(),
        direction: TextDirection.ltr,
      );
      final cardLtr = tester.getCenter(find.byType(ActionCard).first).dx;
      final spineLtr = tester.getCenter(spine().first).dx;
      expect(spineLtr, lessThan(cardLtr));

      await pumpScreen(tester, const LibraryScreen());
      final cardRtl = tester.getCenter(find.byType(ActionCard).first).dx;
      final spineRtl = tester.getCenter(spine().first).dx;

      expect(spineRtl, greaterThan(cardRtl));
    });

    rtlTest('the header greeting starts on the trailing side', (tester) async {
      await pumpScreen(
        tester,
        const HomeScreen(),
        direction: TextDirection.ltr,
      );
      // Asked of the same function the header uses, in the bundle the
      // header is actually rendering. Hard-coding "Good morning" made this
      // test pass before noon and fail after it; hard-coding the English
      // bundle would now make it pass in a tree that is rendering Arabic.
      final hour = DateTime.now().hour;
      final ltr = tester
          .getTopLeft(find.text(greetingForHour(AppL10nEn(), hour)))
          .dx;

      await pumpScreen(tester, const HomeScreen());
      final rtl = tester
          .getTopLeft(find.text(greetingForHour(AppL10nAr(), hour)))
          .dx;

      // Left-aligned prose in LTR starts near the left edge; mirrored, the
      // same text starts much further across.
      expect(ltr, lessThan(60));
      expect(rtl, greaterThan(ltr));
    });
  });

  group('nothing overflows when mirrored', () {
    for (final scale in [1.0, 1.6]) {
      rtlTest('Today at ${scale}x text', (tester) async {
        await pumpScreen(tester, const HomeScreen(), textScale: scale);

        // A RenderFlex overflow is reported as an exception, so this catches
        // the whole class rather than one instance of it.
        expect(tester.takeException(), isNull);
      });

      rtlTest('Intelligence at ${scale}x text', (tester) async {
        await pumpScreen(tester, const StudioScreen(), textScale: scale);

        expect(tester.takeException(), isNull);
      });

      rtlTest('Search at ${scale}x text', (tester) async {
        await pumpScreen(tester, const SearchScreen(), textScale: scale);

        expect(tester.takeException(), isNull);
      });
    }
  });
}
