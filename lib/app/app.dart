import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_theme.dart';
import 'router.dart';

class ActionApp extends ConsumerWidget {
  const ActionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Action',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      // Both themes are first-class, so the system decides. A manual override
      // lands with the settings screen on day 14.
      themeMode: ThemeMode.system,
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}
