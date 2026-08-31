/// Anthropic Messages API.
///
/// Wire details that differ from the others and are easy to get wrong:
/// `x-api-key` rather than a bearer token, a mandatory `anthropic-version`
/// header, and `max_tokens` required on every request.
///
/// This is the only adapter that can return real evidence. Enabling citations
/// on a document block makes the response arrive as several text blocks, the
/// cited ones carrying the quoted text and a 1-indexed page location — which is
/// what turns a plausible answer into a checkable one. The cost is that
/// citations cannot be combined with structured output, so the two contracts
/// take genuinely different request shapes.
///
/// See `docs/v2/AI_PROVIDER_RESEARCH.md` §3.2.
library;

import '../domain/ai_capabilities.dart';
import '../domain/ai_failure.dart';
import '../domain/ai_provider.dart';
import '../domain/ai_provider_config.dart';
import '../domain/ai_request.dart';
import '../domain/ai_response.dart';
import 'byok_provider.dart';

const String _defaultBase = 'https://api.anthropic.com/v1';

/// The version header Anthropic requires. Not optional: a request without it
/// is rejected outright.
const String _apiVersion = '2023-06-01';

class AnthropicProvider extends ByokProvider {
  const AnthropicProvider({
    required super.secrets,
    required super.exchange,
    String? baseUrl,
  }) : _base = baseUrl ?? _defaultBase;

  final String _base;

  @override
  AiProviderKind get kind => AiProviderKind.anthropic;

  /// Presets, not a whitelist — a manual model id is always accepted, because a
  /// build that only knows the ids current on its release day stops working
  /// when one is retired.
  @override
  List<AiModelDescriptor> get presetModels => const [
        AiModelDescriptor(
          id: 'claude-opus-5',
          label: 'Claude Opus 5',
          capabilities: _full,
          note: 'Most capable. Best for long documents and careful extraction.',
        ),
        AiModelDescriptor(
          id: 'claude-sonnet-5',
          label: 'Claude Sonnet 5',
          capabilities: _full,
          note: 'Balanced. A good default.',
        ),
        AiModelDescriptor(
          id: 'claude-haiku-4-5',
          label: 'Claude Haiku 4.5',
          capabilities: _full,
          note: 'Fastest and cheapest. Shorter context.',
        ),
      ];

  static const AiCapabilities _full = AiCapabilities({
    AiCapability.text,
    AiCapability.vision,
    AiCapability.documents,
    AiCapability.structuredOutput,
    AiCapability.streaming,
    AiCapability.systemInstruction,
    AiCapability.citations,
    AiCapability.longContext,
  });

  @override
  AiCapabilities capabilitiesFor(String modelId) {
    // Every current Claude model is multimodal and supports both structured
    // output and citations, so an unrecognised id — most likely a model newer
    // than this build — gets the full set rather than an artificial refusal.
    return _full;
  }

  Map<String, String> _headers(String key) => {
        'x-api-key': key,
        'anthropic-version': _apiVersion,
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
          .map((m) => AiModelDescriptor(
                id: m['id'] as String? ?? '',
                label: m['display_name'] as String? ?? m['id'] as String? ?? '',
                capabilities: _full,
              ))
          .where((m) => m.id.isNotEmpty)
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
      url: Uri.parse('$_base/messages'),
      headers: _headers(key),
      body: buildBody(config, request),
      cancel: cancel,
      secret: key,
    );
    return parseResponse(json, request);
  }

  /// Visible for testing: the request body, without sending it.
  Map<String, dynamic> buildBody(
    AiProviderConfig config,
    AiRequest request, {
    bool stream = false,
  }) {
    final contract = request.contract;
    // Citations and structured output are mutually exclusive, so wanting
    // evidence is what decides the shape of the whole request.
    final wantsCitations =
        contract is AiGroundedContract && contract.requestCitations;

    final content = <Map<String, dynamic>>[];
    for (final part in request.parts) {
      switch (part) {
        case AiImagePart(:final bytes, :final mimeType):
          content.add({
            'type': 'image',
            'source': {
              'type': 'base64',
              'media_type': mimeType,
              'data': ByokProvider.base64Of(bytes),
            },
          });
        case AiDocumentPart(:final bytes, :final mimeType):
          content.add({
            'type': 'document',
            'source': {
              'type': 'base64',
              'media_type': mimeType,
              'data': ByokProvider.base64Of(bytes),
            },
            if (wantsCitations) 'citations': {'enabled': true},
          });
        case AiTextPart():
        case AiSourceTextPart():
          // Text is assembled once, after the attachments, so fenced source
          // material stays contiguous instead of being interleaved with them.
          break;
      }
    }

    final text = userTextFor(request);
    if (text.isNotEmpty) content.add({'type': 'text', 'text': text});

    return {
      'model': config.modelId,
      // Required by this API. There is no "let the provider decide" default.
      'max_tokens': request.maxOutputTokens,
      'system': systemTextFor(request),
      'messages': [
        {'role': 'user', 'content': content},
      ],
      if (request.temperature != null) 'temperature': request.temperature,
      if (contract is AiStructuredContract)
        'output_config': {
          'format': {'type': 'json_schema', 'schema': contract.schema},
        },
      if (stream) 'stream': true,
    };
  }

  /// Visible for testing: turns a decoded response into the shared shape.
  AiResponse parseResponse(Map<String, dynamic> json, AiRequest request) {
    final blocks = json['content'];
    if (blocks is! List) {
      throw AiProviderFailure(
        AiFailureKind.malformedResponse,
        message: 'That reply was incomplete. Try again.',
        technicalDetail: 'no content array',
      );
    }

    final labels = _labelsBySourceId(request);
    final buffer = StringBuffer();
    final citations = <AiCitation>[];

    for (final block in blocks.whereType<Map<String, dynamic>>()) {
      if (block['type'] != 'text') continue;
      buffer.write(block['text'] as String? ?? '');

      for (final raw
          in (block['citations'] as List? ?? const []).whereType<Map>()) {
        final cited = raw['cited_text'] as String?;
        if (cited == null || cited.isEmpty) continue;

        // `document_index` points back at the order attachments were added, so
        // an evidence chip can name the document rather than a number.
        final index = (raw['document_index'] as num?)?.toInt();
        final sourceId =
            index != null && index >= 0 && index < labels.length
                ? labels[index].sourceId
                : null;

        citations.add(AiCitation(
          quotedText: cited,
          sourceId: sourceId,
          documentLabel: index != null && index >= 0 && index < labels.length
              ? labels[index].label
              : null,
          startPage: (raw['start_page_number'] as num?)?.toInt(),
          endPage: (raw['end_page_number'] as num?)?.toInt(),
        ));
      }
    }

    final usage = json['usage'];
    return AiResponse(
      text: buffer.toString(),
      citations: citations,
      modelId: json['model'] as String?,
      // A truncated extraction that looks complete is worse than an obvious
      // failure, because the user acts on it.
      truncated: json['stop_reason'] == 'max_tokens',
      usage: usage is Map
          ? AiUsageObservation(
              inputTokens: (usage['input_tokens'] as num?)?.toInt(),
              outputTokens: (usage['output_tokens'] as num?)?.toInt(),
            )
          : null,
    );
  }

  /// Attachment order, so a `document_index` can be resolved to a real source.
  List<({String sourceId, String? label})> _labelsBySourceId(
    AiRequest request,
  ) =>
      request.parts
          .whereType<AiDocumentPart>()
          .map((p) => (sourceId: p.sourceId, label: p.label ?? p.filename))
          .toList();
}
