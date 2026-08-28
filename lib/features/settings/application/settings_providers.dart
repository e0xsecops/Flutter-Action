import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/firebase/firebase_gate.dart';
import '../../../core/preferences/preference_store.dart';
import '../../../core/preferences/shared_preferences_store.dart';
import '../../actions/application/action_providers.dart';
import '../../actions/data/action_cloud_privacy_service.dart';
import '../../actions/data/cloud_privacy_inventory.dart';
import '../../capture/application/capture_controller.dart';
import 'privacy_deletion_service.dart';
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';

/// The user's appearance choice.
///
/// Read synchronously from the preference store for the same reason
/// onboarding is: the very first frame should already be the right colour
/// rather than flashing the system theme and correcting itself.
class ThemeModeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => _decode(
        ref.watch(preferenceStoreProvider).getString(PreferenceKeys.themeMode),
      );

  Future<void> set(ThemeMode mode) async {
    state = mode;
    // Which of the three was chosen. `ThemeMode.name` is one of exactly
    // system/light/dark, which is why it is safe to send verbatim.
    unawaited(ref.read(appAnalyticsProvider).log(
      AnalyticsEvents.appearanceChanged,
      parameters: {AnalyticsParams.themeMode: mode.name},
    ));
    await ref
        .read(preferenceStoreProvider)
        .setString(PreferenceKeys.themeMode, mode.name);
  }

  /// Anything unrecognised — including nothing at all — means "follow the
  /// system", which is the only default that is right for both a phone in a
  /// dark room and one in sunlight.
  static ThemeMode _decode(String? raw) => switch (raw) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };
}

final themeModeControllerProvider =
    NotifierProvider<ThemeModeController, ThemeMode>(ThemeModeController.new);

final actionCloudPrivacyServiceProvider = Provider<ActionCloudPrivacyService>(
  (ref) => FirestoreActionCloudPrivacyService(
    gate: ref.watch(firebaseGateProvider),
  ),
);

/// Remote enumeration, reachable only from the privacy deletion flow.
final cloudPrivacyInventoryProvider = Provider<CloudPrivacyInventory>(
  (ref) => FirestoreCloudPrivacyInventory(
    gate: ref.watch(firebaseGateProvider),
  ),
);

final privacyDeletionServiceProvider = Provider<PrivacyDeletionService>((ref) {
  return PrivacyDeletionService(
    actions: ref.watch(actionRepositoryProvider),
    database: ref.watch(actionsDatabaseProvider),
    sources: () => ref.read(sourceStoreProvider.future),
    sourceFiles: () => ref.read(sourceFileStoreProvider.future),
    scheduler: ref.watch(notificationSchedulerProvider),
    identity: ref.watch(authIdentityServiceProvider),
    cloud: ref.watch(actionCloudPrivacyServiceProvider),
    preferences: ref.watch(preferenceStoreProvider),
    inventory: ref.watch(cloudPrivacyInventoryProvider),
  );
});

/// Whether Android would currently show a notification from this app.
///
/// A plain query, never a request: opening a settings screen must not make a
/// permission dialog appear. Asking is a button.
final notificationsAllowedProvider = FutureProvider<bool>((ref) async {
  try {
    return await ref.watch(notificationSchedulerProvider).notificationsAllowed();
  } on Object {
    // Unknown reads as "off", which is the honest direction: it sends the
    // user to check rather than assuring them reminders will arrive.
    return false;
  }
});

/// How many mirrored Actions a previous deletion still owes. Zero, and the
/// privacy screen says nothing about it.
final pendingCloudDeletionCountProvider = Provider<int>((ref) {
  // Watched so the count refreshes when the preference store is replaced.
  ref.watch(preferenceStoreProvider);
  return ref.read(privacyDeletionServiceProvider).pending?.actionIds.length ??
      0;
});
