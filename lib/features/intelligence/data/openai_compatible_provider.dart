/// A user-supplied endpoint that speaks the OpenAI Chat Completions shape.
///
/// **Why Chat Completions and not Responses.** This adapter exists for servers
/// Action has never seen — a self-hosted runtime, a gateway, a proxy. Nearly all
/// of them implement `/chat/completions`; very few implement `/responses`.
/// Targeting the universal shape is what makes "compatible" mean something.
///
/// **Why the capability floor is text-only.** Action cannot discover what
/// someone else's server supports. Claiming less than it can do produces a
/// refusal the user can lift by widening capabilities themselves; claiming more
/// produces a broken request they cannot fix at all. So the floor is
/// conservative and the user opts up.
///
/// See `docs/v2/AI_PROVIDER_RESEARCH.md` §3.4 and
/// `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T6).
library;

import '../domain/ai_capabilities.dart';
import '../domain/ai_failure.dart';
import '../domain/ai_provider.dart';
import '../domain/ai_provider_config.dart';
import '../domain/ai_request.dart';
import '../domain/ai_response.dart';
import 'ai_http.dart';
import 'byok_provider.dart';

class OpenAiCompatibleProvider extends ByokProvider {
  const OpenAiCompatibleProvider({
    required super.secrets,
    required super.exchange,
    this.allowCleartext = false,
  });

  /// Only ever true under `kDebugMode`, decided by the caller. There is no
  /// runtime toggle, and no certificate-validation bypass anywhere in the app.
  final bool allowCleartext;

  @override
  AiProviderKind get kind => AiProviderKind.openAiCompatible;

  /// None. Action has no idea what a stranger's server hosts, and inventing a
  /// preset would be a guess presented as a fact.
  @override
  List<AiModelDescriptor> get presetModels => const [];

  @override
  AiCapabilities capabilitiesFor(String modelId) => AiCapabilities.textOnly;

  /// Resolves and validates the configured endpoint.
  ///
  /// A hard refusal on cleartext, not a warning: the whole content of a
  /// document would otherwise cross the network in the clear.
  Uri _endpoint(AiProviderConfig config, String path) {
    final raw = config.baseUrl?.trim() ?? '';
    if (raw.isEmpty) {
      throw AiProviderFailure(
        AiFailureKind.notConfigured,
        message: 'Add the address of your AI endpoint in Settings.',
      );
    }
    final base = validateEndpoint(raw, allowCleartext: allowCleartext);
    if (base == null) {
      throw AiProviderFailure(
        AiFailureKind.insecureEndpoint,
        message: 'That endpoint must be an https:// address.',
      );
    }
    final normalized =
        base.toString().endsWith('/')
            ? base.toString().substring(0, base.toString().length - 1)
            : base.toString();
    return Uri.parse('$normalized$path');
  }

  Map<String, String> _headers(String key) => {
        'authorization': 'Bearer $key',
      };

  @override
  Future<AiConnectionCheck> testConnection(
    AiProviderConfig config, {
    AiCancellationToken? cancel,
  }) async {
    final key = await requireSecret(config);
    try {
      final json = await exchange.getJson(
        url: _endpoint(config, '/models'),
        headers: _headers(key),
        cancel: cancel,
        secret: key,
      );
      final models = (json['data'] as List? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map((m) => m['id'] as String? ?? '')
          .where((id) => id.isNotEmpty)
          .map((id) => AiModelDescriptor(
                id: id,
                label: id,
                capabilities: AiCapabilities.textOnly,
              ))
          .toList();
      return AiConnectionCheck(
        ok: true,
        message: models.isEmpty
            ? 'Connected.'
            : 'Connected. ${models.length} models available.',
        models: models,
      );
    } on AiProviderFailure catch (failure) {
      return AiConnectionCheck(ok: false, message: failure.message);
    }
  }

  @override
  Future<AiResponse> send(
    AiProviderConfig config,
    AiRequest request, {
    AiCancellationToken? cancel,
  }) async {
    // Endpoint validity is checked before the secret is read, so a misconfigured
    // address never causes a key to be pulled out of secure storage.
    final url = _endpoint(config, '/chat/completions');
    final key = await prepare(config, request);
    final json = await exchange.postJson(
      url: url,
      headers: _headers(key),
      body: buildBody(config, request),
      cancel: cancel,
      secret: key,
    );
    return parseResponse(json);
  }

  /// Visible for testing.
  Map<String, dynamic> buildBody(
    AiProviderConfig config,
    AiRequest request, {
    bool stream = false,
  }) {
    final contract = request.contract;
    return {
      'model': config.modelId,
      'messages': [
        {'role': 'system', 'content': systemTextFor(request)},
        {'role': 'user', 'content': userTextFor(request)},
      ],
      'max_tokens': request.maxOutputTokens,
      if (request.temperature != null) 'temperature': request.temperature,
      if (contract is AiStructuredContract)
        'response_format': {
          'type': 'json_schema',
          'json_schema': {
            'name': contract.name,
            'schema': contract.schema,
            'strict': true,
          },
        },
      if (stream) 'stream': true,
    };
  }

  /// Visible for testing.
  AiResponse parseResponse(Map<String, dynamic> json) {
    final choices = json['choices'];
    if (choices is! List || choices.isEmpty) {
      throw AiProviderFailure(
        AiFailureKind.malformedResponse,
        message: 'That endpoint sent back something Action could not read.',
        technicalDetail: 'no choices array',
      );
    }
    final first = choices.first;
    final message = first is Map ? first['message'] : null;

    final usage = json['usage'];
    return AiResponse(
      text: message is Map ? (message['content'] as String? ?? '') : '',
      modelId: json['model'] as String?,
      truncated: first is Map && first['finish_reason'] == 'length',
      usage: usage is Map
          ? AiUsageObservation(
              inputTokens: (usage['prompt_tokens'] as num?)?.toInt(),
              outputTokens: (usage['completion_tokens'] as num?)?.toInt(),
            )
          : null,
    );
  }
}
