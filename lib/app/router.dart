import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/diagnostics/presentation/extraction_diagnostics_screen.dart';
import '../features/diagnostics/presentation/ocr_diagnostics_screen.dart';
import '../features/capture/presentation/paste_text_screen.dart';
import '../features/capture/presentation/preview_screen.dart';
import '../features/capture/presentation/source_detail_screen.dart';
import '../features/extraction/domain/extraction_result.dart';
import '../features/extraction/presentation/extraction_review_screen.dart';
import '../features/home/presentation/home_screen.dart';

/// Route paths in one place so navigation is never stringly-typed.
///
/// Only routes with a real screen behind them live here. The rest of the map
/// (action detail, review, settings, search) arrives with the features that
/// need it rather than as dead entries.
abstract final class Routes {
  static const home = '/';
  static const capturePreview = '/capture/preview';
  static const captureText = '/capture/text';
  static const sourcePattern = '/source/:id';
  static const sourceReviewPattern = '/source/:id/review';

  /// Debug builds only — see the route table.
  static const diagnostics = '/diagnostics';
  static const extractionDiagnostics = '/diagnostics/extraction';

  static String source(String id) => '/source/$id';
  static String sourceReview(String id) => '/source/$id/review';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.home,
    routes: [
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
