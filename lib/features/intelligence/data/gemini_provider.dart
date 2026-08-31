/// Google Gemini, via `generateContent`.
///
/// Two deliberate decisions recorded here because both look like mistakes
/// otherwise.
///
/// **The key goes in a header, not the URL.** Google's own samples put it in a
/// `?key=` query parameter. Action does not: a credential in a URL leaks into
/// server logs, crash reports, proxy traces and anything that records a request
/// line. `x-goog-api-key` is equally supported and does not.
///
/// **`generateContent` rather than the newer `interactions` surface.** Google's
/// document-processing page for `generateContent` is already labelled *Legacy*,
/// but it remains functional and is far better documented and more widely
/// deployed. Isolating the choice in this adapter is what makes revisiting it
/// cheap.
///
/// See `docs/v2/AI_PROVIDER_RESEARCH.md` §3.3.
library;

import '../domain/ai_capabilities.dart';
import '../domain/ai_failure.dart';
import '../domain/ai_provider.dart';
import '../domain/ai_provider_config.dart';
import '../domain/ai_request.dart';
import '../domain/ai_response.dart';
import 'byok_provider.dart';

const String _defaultBase =
    'https://generativelanguage.googleapis.com/v1beta';

class GeminiProvider extends ByokProvider {
  const GeminiProvider({
    required super.secrets,
    required super.exchange,
    String? baseUrl,
  }) : _base = baseUrl ?? _defaultBase;

  final String _base;

  @override
  AiProviderKind get kind => AiProviderKind.gemini;

  @override
  List<AiModelDescriptor> get presetModels => const [
        AiModelDescriptor(
          id: 'gemini-3.7-flash',
          label: 'Gemini 3.7 Flash',
          capabilities: _full,
          note: 'Fast and multimodal. A good default.',
        ),
        AiModelDescriptor(
          id: 'gemini-2.5-pro',
          label: 'Gemini 2.5 Pro',
          capabilities: _full,
          note: 'Deeper reasoning on complex documents.',
        ),
        AiModelDescriptor(
          id: 'gemini-3.5-flash-lite',
          label: 'Gemini 3.5 Flash Lite',
          capabilities: _full,
          note: 'Cheapest and fastest.',
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

  @override
  AiCapabilities capabilitiesFor(String modelId) {
    final id = modelId.toLowerCase();
    if (id.contains('embedding') ||
        id.contains('transcribe') ||
        id.contains('-image') ||
        id.contains('imagen') ||
        id.contains('veo')) {
      // Generation and embedding models take different inputs entirely.
      return AiCapabilities.none;
    }
    return _full;
  }

  Map<String, String> _headers(String key) => {'x-goog-api-key': key};

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
      final models = (json['models'] as List? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map((m) {
            // Ids come back as `models/gemini-...`; the request path wants the
            // bare id, and so does anything the user might type by hand.
            final raw = m['name'] as String? ?? '';
            final id = raw.startsWith('models/') ? raw.substring(7) : raw;
            return AiModelDescriptor(
              id: id,
              label: m['displayName'] as String? ?? id,
              capabilities: capabilitiesFor(id),
            );
          })
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
      url: Uri.parse('$_base/models/${config.modelId}:generateContent'),
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
    AiRequest request,
  ) {
    final parts = <Map<String, dynamic>>[];
    for (final part in request.parts) {
      switch (part) {
        case AiImagePart(:final bytes, :final mimeType):
        case AiDocumentPart(:final bytes, :final mimeType):
          parts.add({
            'inline_data': {
              'mime_type': mimeType,
              'data': ByokProvider.base64Of(bytes),
            },
          });
        case AiTextPart():
        case AiSourceTextPart():
          break;
      }
    }

    final text = userTextFor(request);
    if (text.isNotEmpty) parts.add({'text': text});

    final contract = request.contract;
    return {
      'contents': [
        {'role': 'user', 'parts': parts},
      ],
      'systemInstruction': {
        'parts': [
          {'text': systemTextFor(request)},
        ],
      },
      'generationConfig': {
        'maxOutputTokens': request.maxOutputTokens,
        if (request.temperature != null) 'temperature': request.temperature,
        if (contract is AiStructuredContract) ...{
          'responseMimeType': 'application/json',
          'responseSchema': contract.schema,
        },
      },
    };
  }

  /// Visible for testing.
  AiResponse parseResponse(Map<String, dynamic> json) {
    final candidates = json['candidates'];
    if (candidates is! List || candidates.isEmpty) {
      // A prompt blocked by Google's safety filters comes back with no
      // candidates at all, so this is a real user-facing case rather than a
      // defensive branch.
      final blocked = json['promptFeedback'];
      throw AiProviderFailure(
        AiFailureKind.malformedResponse,
        message: blocked is Map
            ? 'Your provider declined to process that content.'
            : 'That reply was incomplete. Try again.',
        technicalDetail: blocked is Map ? blocked.toString() : 'no candidates',
      );
    }

    final first = candidates.first;
    final buffer = StringBuffer();
    if (first is Map) {
      final content = first['content'];
      if (content is Map) {
        for (final part
            in (content['parts'] as List? ?? const []).whereType<Map>()) {
          buffer.write(part['text'] as String? ?? '');
        }
      }
    }

    final usage = json['usageMetadata'];
    return AiResponse(
      text: buffer.toString(),
      modelId: json['modelVersion'] as String?,
      truncated: first is Map && first['finishReason'] == 'MAX_TOKENS',
      usage: usage is Map
          ? AiUsageObservation(
              inputTokens: (usage['promptTokenCount'] as num?)?.toInt(),
              outputTokens: (usage['candidatesTokenCount'] as num?)?.toInt(),
            )
          : null,
    );
  }
}
