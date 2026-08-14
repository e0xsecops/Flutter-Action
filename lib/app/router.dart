import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/capture/presentation/capture_screen.dart';
import '../features/home/presentation/home_screen.dart';

/// Route paths in one place so navigation calls are not stringly-typed.
abstract final class Routes {
  static const home = '/';
  static const capture = '/capture';
}

/// Exposed through Riverpod so later steps can add a redirect that depends on
/// other providers (for example, sending first-run users to onboarding) without
/// restructuring the app.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.capture,
        builder: (context, state) => const CaptureScreen(),
      ),
    ],
  );
});
