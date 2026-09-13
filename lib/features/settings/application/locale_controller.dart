import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/preferences/preference_store.dart';
import '../../../core/preferences/shared_preferences_store.dart';
import '../../../l10n/supported_locales.dart';

/// The user's language choice, or null for "follow the system".
///
/// Read synchronously at build for the same reason the theme is: the first
/// frame should already be in the right language rather than rendering English
/// and correcting itself a frame later — which on an RTL locale would also
/// mean the whole layout visibly flipping.
///
/// Setting it rebuilds `MaterialApp` with a new `locale`, which is all live
/// language switching is in Flutter: `Localizations` re-resolves, every
/// `AppL10n.of(context)` below it returns the new bundle, and `Directionality`
/// changes with it. No restart, no reload, nothing to reconcile.
class LocaleController extends Notifier<Locale?> {
  @override
  Locale? build() {
    final tag =
        ref.watch(preferenceStoreProvider).getString(PreferenceKeys.languageTag);
    // An unrecognised tag — a language removed between versions, or a
    // hand-edited preference file — reads as "follow the system" rather than
    // throwing on a locale that has no strings.
    return AppLocales.byTag(tag)?.locale;
  }

  /// Pass null to go back to following the device.
  Future<void> set(Locale? locale) async {
    state = locale;
    final store = ref.read(preferenceStoreProvider);
    if (locale == null) {
      await store.remove(PreferenceKeys.languageTag);
      return;
    }
    await store.setString(
      PreferenceKeys.languageTag,
      AppLocales.forLocale(locale).tag,
    );
  }
}

final localeControllerProvider =
    NotifierProvider<LocaleController, Locale?>(LocaleController.new);
