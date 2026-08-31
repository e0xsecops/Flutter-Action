/// Wiring for the intelligence layer.
///
/// One rule shapes all of it: **nothing here issues a provider request as a
/// side effect of being read.** Watching whether AI is configured, listing
/// tools, or building the Studio must all be free. A request happens only when
/// the user acts on a tool. See `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T9).
library;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/preferences/preference_store.dart';
import '../../../core/preferences/shared_preferences_store.dart';
import '../../../core/security/secret_store.dart';
import '../data/ai_http.dart';
import '../data/anthropic_provider.dart';
import '../data/gemini_provider.dart';
import '../data/openai_compatible_provider.dart';
import '../data/openai_provider.dart';
import '../data/platform_secret_store.dart';
import '../domain/ai_provider.dart';
import '../domain/ai_provider_config.dart';
import 'intelligence_runner.dart';

/// Preference keys owned by this feature.
///
/// Kept beside the feature but named the same way as [PreferenceKeys], so the
/// privacy screen's question — "what does this app remember about me?" — still
/// has a single honest answer.
abstract final class IntelligencePreferenceKeys {
  /// The connected provider and model. Never the key itself.
  static const providerConfig = 'ai_provider_config_v1';

  /// Providers whose first-use disclosure the user has accepted.
  static const acknowledgedProviders = 'ai_disclosure_accepted_v1';

  /// Tool ids recently used. Ids only — never what they were pointed at.
  static const recentTools = 'ai_recent_tools_v1';
}

/// Where the user's API key lives.
final secretStoreProvider = Provider<SecretStore>((ref) {
  return PlatformSecretStore();
});

final aiHttpExchangeProvider = Provider<AiHttpExchange>((ref) {
  return const AiHttpExchange();
});

/// Every adapter, by kind.
///
/// Constructing these is free — no network, no key read — so building the map
/// eagerly costs nothing and keeps resolution synchronous.
final aiProvidersProvider = Provider<Map<AiProviderKind, AiProvider>>((ref) {
  final secrets = ref.watch(secretStoreProvider);
  final exchange = ref.watch(aiHttpExchangeProvider);

  return {
    AiProviderKind.openAi:
        OpenAiProvider(secrets: secrets, exchange: exchange),
    AiProviderKind.anthropic:
        AnthropicProvider(secrets: secrets, exchange: exchange),
    AiProviderKind.gemini:
        GeminiProvider(secrets: secrets, exchange: exchange),
    AiProviderKind.openAiCompatible: OpenAiCompatibleProvider(
      secrets: secrets,
      exchange: exchange,
      // Cleartext is a debug-build affordance for a local model server and
      // nothing more. There is no runtime toggle for it.
      allowCleartext: kDebugMode,
    ),
  };
});

final intelligenceRunnerProvider = Provider<IntelligenceRunner>((ref) {
  final providers = ref.watch(aiProvidersProvider);
  return IntelligenceRunner(resolveProvider: (kind) => providers[kind]);
});

/// The connected provider, or null.
final aiProviderConfigProvider =
    NotifierProvider<AiProviderConfigController, AiProviderConfig?>(
  AiProviderConfigController.new,
);

class AiProviderConfigController extends Notifier<AiProviderConfig?> {
  @override
  AiProviderConfig? build() {
    final raw = ref
        .read(preferenceStoreProvider)
        .getString(IntelligencePreferenceKeys.providerConfig);
    if (raw == null) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return AiProviderConfig.fromJson(decoded);
    } on FormatException {
      // A corrupt stored config reads as "nothing connected", which the user
      // can fix from the screen they were already heading to.
      return null;
    }
  }

  Future<void> connect(AiProviderConfig config) async {
    state = config;
    await ref
        .read(preferenceStoreProvider)
        .setString(
          IntelligencePreferenceKeys.providerConfig,
          jsonEncode(config.toJson()),
        );
  }

  /// Forgets the provider *and* removes its key from secure storage.
  ///
  /// Both, always. Clearing the config while leaving the credential behind
  /// would leave a secret on the device the user believes they removed.
  Future<void> disconnect() async {
    final previous = state;
    state = null;
    await ref
        .read(preferenceStoreProvider)
        .remove(IntelligencePreferenceKeys.providerConfig);
    if (previous != null) {
      await ref
          .read(secretStoreProvider)
          .delete(SecretKeys.providerKey(previous.secretKey));
    }
  }
}

/// Whether a key is actually present for the configured provider.
///
/// A config without a key is a real state — the preference survives a restore
/// that secure storage does not — and it must read as "not connected" rather
/// than failing on first use.
final aiConnectionReadyProvider = FutureProvider<bool>((ref) async {
  final config = ref.watch(aiProviderConfigProvider);
  if (config == null) return false;
  return ref
      .read(secretStoreProvider)
      .contains(SecretKeys.providerKey(config.secretKey));
});

/// A masked tail of the stored key, for Settings.
///
/// The only thing the UI may ever show of a saved secret. There is no reveal.
final aiKeyFingerprintProvider = FutureProvider<String?>((ref) async {
  final config = ref.watch(aiProviderConfigProvider);
  if (config == null) return null;
  final key = await ref
      .read(secretStoreProvider)
      .read(SecretKeys.providerKey(config.secretKey));
  if (key == null) return null;
  return _mask(key);
});

String _mask(String secret) {
  const dots = '••••••••';
  if (secret.length <= 8) return dots;
  return '$dots${secret.substring(secret.length - 4)}';
}

/// Providers whose first-use disclosure has been accepted.
final aiDisclosureProvider =
    NotifierProvider<AiDisclosureController, Set<String>>(
  AiDisclosureController.new,
);

class AiDisclosureController extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    final raw = ref
        .read(preferenceStoreProvider)
        .getString(IntelligencePreferenceKeys.acknowledgedProviders);
    if (raw == null || raw.isEmpty) return const {};
    return raw.split(',').where((e) => e.isNotEmpty).toSet();
  }

  bool hasAccepted(AiProviderKind kind) => state.contains(kind.id);

  /// Recorded per provider, so switching to a different one asks again — the
  /// disclosure names where the content goes, and that has changed.
  Future<void> accept(AiProviderKind kind) async {
    if (state.contains(kind.id)) return;
    state = {...state, kind.id};
    await ref.read(preferenceStoreProvider).setString(
          IntelligencePreferenceKeys.acknowledgedProviders,
          state.join(','),
        );
  }
}

/// Recently used tools, most recent first.
///
/// **Tool ids only.** Remembering "Smart Summary" is a convenience;
/// remembering "summarised passport.pdf" would be a log of what the user reads,
/// stored on their device for no benefit to them.
final recentToolsProvider =
    NotifierProvider<RecentToolsController, List<String>>(
  RecentToolsController.new,
);

class RecentToolsController extends Notifier<List<String>> {
  static const _max = 4;

  @override
  List<String> build() {
    final raw = ref
        .read(preferenceStoreProvider)
        .getString(IntelligencePreferenceKeys.recentTools);
    if (raw == null || raw.isEmpty) return const [];
    return raw.split(',').where((e) => e.isNotEmpty).toList();
  }

  Future<void> record(String toolId) async {
    final next = [toolId, ...state.where((id) => id != toolId)].take(_max).toList();
    if (listEquals(next, state)) return;
    state = next;
    await ref
        .read(preferenceStoreProvider)
        .setString(IntelligencePreferenceKeys.recentTools, next.join(','));
  }

  Future<void> clear() async {
    state = const [];
    await ref
        .read(preferenceStoreProvider)
        .remove(IntelligencePreferenceKeys.recentTools);
  }
}
