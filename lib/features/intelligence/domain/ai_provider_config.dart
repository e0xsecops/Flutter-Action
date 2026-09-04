/// Which provider is connected, and how — but never the secret itself.
///
/// **The deliberate omission.** [AiProviderConfig] carries no API key. The key
/// is resolved from `SecretStore` at send time, inside the adapter, and is
/// never held on a long-lived object. That is what makes a config safe to
/// persist in preferences, compare in a test, and print in a bug report — and
/// it removes the most common way a secret ends up somewhere it should not be.
library;

import 'ai_capabilities.dart';

/// The provider families Action can talk to.
///
/// A closed set on purpose: each one is a real adapter with real wire quirks,
/// documented in `docs/v2/AI_PROVIDER_RESEARCH.md` §3. "Any provider" is not
/// achievable — [openAiCompatible] is the escape hatch for servers that
/// deliberately imitate one of these shapes.
enum AiProviderKind {
  openAi(id: 'openai', label: 'OpenAI'),
  anthropic(id: 'anthropic', label: 'Anthropic'),
  gemini(id: 'gemini', label: 'Google Gemini'),
  openAiCompatible(id: 'compatible', label: 'Custom (OpenAI-compatible)');

  const AiProviderKind({required this.id, required this.label});

  /// Stable storage id. Never derived from [label] or from `name`, because a
  /// display change or a rename must not orphan a stored key.
  final String id;

  /// What the user sees.
  final String label;

  static AiProviderKind? fromId(String id) {
    for (final kind in values) {
      if (kind.id == id) return kind;
    }
    return null;
  }
}

/// A model the user can select, with what it can do.
class AiModelDescriptor {
  const AiModelDescriptor({
    required this.id,
    required this.label,
    required this.capabilities,
    this.note,
  });

  /// The wire id sent to the provider.
  final String id;

  final String label;

  final AiCapabilities capabilities;

  /// Anything the user should know before picking it.
  final String? note;

  @override
  bool operator ==(Object other) =>
      other is AiModelDescriptor && other.id == id && other.label == label;

  @override
  int get hashCode => Object.hash(id, label);

  @override
  String toString() => 'AiModelDescriptor($id)';
}

/// A connected provider, as stored.
class AiProviderConfig {
  const AiProviderConfig({
    required this.kind,
    required this.modelId,
    this.baseUrl,
    this.declaredCapabilities,
  });

  final AiProviderKind kind;

  /// The model id as the provider expects it.
  ///
  /// Free text, not an enum. Provider model ids change constantly, and a build
  /// that only knows the ids current on its release day stops working the
  /// moment one is retired. Presets are hints; this field is the truth.
  final String modelId;

  /// Only meaningful for [AiProviderKind.openAiCompatible].
  final String? baseUrl;

  /// Capabilities the user asserted for a custom endpoint.
  ///
  /// Action cannot discover what someone's own server supports, so for a custom
  /// endpoint it assumes the conservative floor and lets the user widen it. Null
  /// everywhere else, where the model descriptor is authoritative.
  final AiCapabilities? declaredCapabilities;

  /// The storage key for this provider's secret.
  String get secretKey => kind.id;

  AiProviderConfig copyWith({
    AiProviderKind? kind,
    String? modelId,
    String? baseUrl,
    AiCapabilities? declaredCapabilities,
  }) =>
      AiProviderConfig(
        kind: kind ?? this.kind,
        modelId: modelId ?? this.modelId,
        baseUrl: baseUrl ?? this.baseUrl,
        declaredCapabilities:
            declaredCapabilities ?? this.declaredCapabilities,
      );

  Map<String, dynamic> toJson() => {
        'kind': kind.id,
        'modelId': modelId,
        if (baseUrl != null) 'baseUrl': baseUrl,
        if (declaredCapabilities != null)
          'capabilities':
              declaredCapabilities!.values.map((c) => c.name).toList(),
      };

  /// Returns null rather than throwing on anything it cannot read.
  ///
  /// A stored config is read on the way to Settings; a corrupt one should
  /// present as "no provider connected", which the user can fix, rather than as
  /// a crash on a screen they opened to fix it.
  static AiProviderConfig? fromJson(Map<String, dynamic> json) {
    final kind = AiProviderKind.fromId(json['kind'] as String? ?? '');
    final modelId = json['modelId'] as String?;
    if (kind == null || modelId == null || modelId.isEmpty) return null;

    final rawCaps = json['capabilities'];
    AiCapabilities? caps;
    if (rawCaps is List) {
      final parsed = <AiCapability>{};
      for (final entry in rawCaps.whereType<String>()) {
        for (final c in AiCapability.values) {
          if (c.name == entry) parsed.add(c);
        }
      }
      caps = AiCapabilities(parsed);
    }

    return AiProviderConfig(
      kind: kind,
      modelId: modelId,
      baseUrl: json['baseUrl'] as String?,
      declaredCapabilities: caps,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is AiProviderConfig &&
      other.kind == kind &&
      other.modelId == modelId &&
      other.baseUrl == baseUrl;

  @override
  int get hashCode => Object.hash(kind, modelId, baseUrl);

  /// Safe to log: there is no secret on this object by construction.
  @override
  String toString() => 'AiProviderConfig(${kind.id}, $modelId)';
}
