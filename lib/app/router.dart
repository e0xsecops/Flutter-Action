import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/actions/presentation/action_detail_screen.dart';
import '../features/diagnostics/presentation/extraction_diagnostics_screen.dart';
import '../features/diagnostics/presentation/ocr_diagnostics_screen.dart';
import '../features/capture/presentation/paste_text_screen.dart';
import '../features/capture/presentation/preview_screen.dart';
import '../features/capture/presentation/source_detail_screen.dart';
import '../features/extraction/domain/extraction_result.dart';
import '../features/extraction/presentation/extraction_review_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/onboarding/application/onboarding_controller.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/search/presentation/search_screen.dart';
import '../features/settings/presentation/help_screen.dart';
import '../features/settings/presentation/privacy_screen.dart';
import '../features/settings/presentation/settings_screen.dart';

/// Route paths in one place so navigation is never stringly-typed.
///
/// Only routes with a real screen behind them live here. The rest of the map
/// (action detail, review, settings, search) arrives with the features that
/// need it rather than as dead entries.
abstract final class Routes {
  static const home = '/';
  static const onboarding = '/onboarding';
  static const capturePreview = '/capture/preview';
  static const captureText = '/capture/text';
  static const sourcePattern = '/source/:id';
  static const sourceReviewPattern = '/source/:id/review';
  static const actionPattern = '/action/:id';
  static const search = '/search';
  static const settings = '/settings';
  static const settingsPrivacy = '/settings/privacy';
  static const settingsHelp = '/settings/help';

  /// Debug builds only — see the route table.
  static const diagnostics = '/diagnostics';
  static const extractionDiagnostics = '/diagnostics/extraction';

  static String source(String id) => '/source/$id';
  static String sourceReview(String id) => '/source/$id/review';
  static String action(String id) => '/action/$id';
}

final routerProvider = Provider<GoRouter>((ref) {
  // Read, not watch: rebuilding the router would rebuild the whole navigator
  // and throw away the stack. Onboarding completion is instead consulted on
  // every navigation by the redirect below, which is enough — the flag only
  // ever moves once, and the screen that moves it navigates explicitly.
  return GoRouter(
    initialLocation: ref.read(onboardingControllerProvider)
        ? Routes.home
        : Routes.onboarding,
    // A guard rather than a one-time decision, so onboarding cannot be
    // skipped by a deep link into `/action/:id` on a fresh install, and
    // cannot be re-entered by one afterwards.
    redirect: (context, state) {
      final completed = ref.read(onboardingControllerProvider);
      final atOnboarding = state.matchedLocation == Routes.onboarding;
      if (!completed && !atOnboarding) return Routes.onboarding;
      if (completed && atOnboarding) return Routes.home;
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.capturePreview,
        builder: (context, state) {
          final args = state.extra;
          // Reachable with no arguments via a restored stack or a deep link.
          // There is nothing to preview in that case, so fall back rather than
          // crash on a cast.
          if (args is! PreviewArgs) return const HomeScreen();
          return PreviewScreen(args: args);
        },
      ),
      GoRoute(
        path: Routes.captureText,
        builder: (context, state) => const PasteTextScreen(),
      ),
      GoRoute(
        path: Routes.sourcePattern,
        builder: (context, state) =>
            SourceDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: Routes.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          // Nested, so the back stack reads Settings -> Privacy rather than
          // dropping the user onto Home from a sub-page.
          GoRoute(
            path: 'privacy',
            builder: (context, state) => const PrivacyScreen(),
          ),
          GoRoute(
            path: 'help',
            builder: (context, state) => const HelpScreen(),
          ),
        ],
      ),
      GoRoute(
        // Deep-linkable by design: the id in the path is the durable local
        // Action id, so a link to one still resolves after a restart. An id
        // that no longer exists gets a real not-found state from the screen
        // rather than a silent bounce to Home.
        path: Routes.actionPattern,
        builder: (context, state) =>
            ActionDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: Routes.sourceReviewPattern,
        builder: (context, state) {
          // A pre-computed result may arrive as `extra`, but only debug
          // builds honour it — it exists so the fixture harness can drive
          // the production review screen deterministically. In release the
          // screen always runs the real extraction itself.
          final extra = state.extra;
          return ExtractionReviewScreen(
            sourceId: state.pathParameters['id']!,
            initialResult:
                kDebugMode && extra is ExtractionResult ? extra : null,
          );
        },
      ),
      // Registered only in debug builds so the harness cannot be reached in a
      // release APK even by a crafted link.
      if (kDebugMode) ...[
        GoRoute(
          path: Routes.diagnostics,
          builder: (context, state) => const OcrDiagnosticsScreen(),
        ),
        GoRoute(
          path: Routes.extractionDiagnostics,
          builder: (context, state) => const ExtractionDiagnosticsScreen(),
        ),
      ],
    ],
    errorBuilder: (context, state) => const HomeScreen(),
  );
});
