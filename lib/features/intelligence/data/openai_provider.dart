/// OpenAI Responses API.
///
/// The one detail that breaks integrations: `file_data` must be a full data
/// URI — `data:application/pdf;base64,<b64>` — not a bare base64 string. The
/// same is true of `input_image`.
///
/// See `docs/v2/AI_PROVIDER_RESEARCH.md` §3.1.
library;

import '../domain/ai_capabilities.dart';
import '../domain/ai_failure.dart';
import '../domain/ai_provider.dart';
import '../domain/ai_provider_config.dart';
import '../domain/ai_request.dart';
import '../domain/ai_response.dart';
import 'byok_provider.dart';

const String _defaultBase = 'https://api.openai.com/v1';

class OpenAiProvider extends ByokProvider {
  const OpenAiProvider({
    required super.secrets,
    required super.exchange,
    String? baseUrl,
  }) : _base = baseUrl ?? _defaultBase;

  final String _base;

  @override
  AiProviderKind get kind => AiProviderKind.openAi;

  @override
  List<AiModelDescriptor> get presetModels => const [
        AiModelDescriptor(
          id: 'gpt-5.6',
          label: 'GPT-5.6',
          capabilities: _full,
          note: 'Most capable. Reads documents and images.',
        ),
        AiModelDescriptor(
          id: 'gpt-5.6-mini',
          label: 'GPT-5.6 mini',
          capabilities: _full,
          note: 'Faster and cheaper.',
        ),
      ];

  static const AiCapabilities _full = AiCapabilities({
    AiCapability.text,
    AiCapability.vision,
    AiCapability.documents,
    AiCapability.structuredOutput,
    AiCapability.streaming,
    AiCapability.systemInstruction,
    AiCapability.longContext,
  });

  /// No citations anywhere in this set: this API returns no verifiable evidence,
  /// and claiming it does would be the exact dishonesty the grounding rules
  /// exist to prevent.
  static const AiCapabilities _textOnly = AiCapabilities({
    AiCapability.text,
    AiCapability.structuredOutput,
    AiCapability.streaming,
    AiCapability.systemInstruction,
  });

  @override
  AiCapabilities capabilitiesFor(String modelId) {
    final id = modelId.toLowerCase();
    // Embedding, moderation and audio models will never accept a document, and
    // dispatching one there produces a confusing provider error rather than a
    // clear refusal.
    if (id.contains('embedding') ||
        id.contains('moderation') ||
        id.contains('tts') ||
        id.contains('whisper') ||
        id.contains('transcribe')) {
      return AiCapabilities.none;
    }
    // PDF parsing sends page images, so it needs a vision-capable model. The
    // instruct-only line is the one current family that is not.
    if (id.contains('instruct')) return _textOnly;
    return _full;
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
        url: Uri.parse('$_base/models'),
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
                capabilities: capabilitiesFor(id),
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
    final key = await prepare(config, request);
    final json = await exchange.postJson(
      url: Uri.parse('$_base/responses'),
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
    final content = <Map<String, dynamic>>[];
    for (final part in request.parts) {
      switch (part) {
        case AiImagePart(:final bytes, :final mimeType):
          content.add({
            'type': 'input_image',
            // Full data URI. A bare base64 string is rejected.
            'image_url':
                'data:$mimeType;base64,${ByokProvider.base64Of(bytes)}',
          });
        case AiDocumentPart(:final bytes, :final mimeType, :final filename):
          content.add({
            'type': 'input_file',
            'filename': filename,
            'file_data':
                'data:$mimeType;base64,${ByokProvider.base64Of(bytes)}',
          });
        case AiTextPart():
        case AiSourceTextPart():
          break;
      }
    }

    final text = userTextFor(request);
    if (text.isNotEmpty) {
      content.add({'type': 'input_text', 'text': text});
    }

    final contract = request.contract;
    return {
      'model': config.modelId,
      // A dedicated field rather than a system turn, so injected text in the
      // user turn has a structurally separate channel to talk over.
      'instructions': systemTextFor(request),
      'input': [
        {'role': 'user', 'content': content},
      ],
      'max_output_tokens': request.maxOutputTokens,
      if (request.temperature != null) 'temperature': request.temperature,
      if (contract is AiStructuredContract)
        'text': {
          'format': {
            'type': 'json_schema',
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
    final output = json['output'];
    if (output is! List) {
      throw AiProviderFailure(
        AiFailureKind.malformedResponse,
        message: 'That reply was incomplete. Try again.',
        technicalDetail: 'no output array',
      );
    }

    final buffer = StringBuffer();
    for (final item in output.whereType<Map<String, dynamic>>()) {
      for (final block
          in (item['content'] as List? ?? const []).whereType<Map>()) {
        if (block['type'] == 'output_text') {
          buffer.write(block['text'] as String? ?? '');
        }
      }
    }

    final usage = json['usage'];
    final incomplete = json['incomplete_details'];
    return AiResponse(
      text: buffer.toString(),
      modelId: json['model'] as String?,
      truncated: json['status'] == 'incomplete' &&
          incomplete is Map &&
          incomplete['reason'] == 'max_output_tokens',
      usage: usage is Map
          ? AiUsageObservation(
              inputTokens: (usage['input_tokens'] as num?)?.toInt(),
              outputTokens: (usage['output_tokens'] as num?)?.toInt(),
            )
          : null,
    );
  }
}
