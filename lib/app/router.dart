import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/capture/presentation/paste_text_screen.dart';
import '../features/capture/presentation/preview_screen.dart';
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
    ],
    errorBuilder: (context, state) => const HomeScreen(),
  );
});
