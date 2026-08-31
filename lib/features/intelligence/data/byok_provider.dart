/// What every BYOK adapter shares.
///
/// The gates that must run before any request is built live here, so a new
/// adapter cannot forget one: resolve the secret, check the model can actually
/// do what the request needs, and check the payload against Action's own caps.
library;

import 'dart:convert';
import 'dart:typed_data';

import '../../../core/security/secret_store.dart';
import '../domain/ai_capabilities.dart';
import '../domain/ai_failure.dart';
import '../domain/ai_limits.dart';
import '../domain/ai_provider.dart';
import '../domain/ai_provider_config.dart';
import '../domain/ai_request.dart';
import '../domain/ai_response.dart';
import 'ai_http.dart';
import 'prompt_safety.dart';

abstract class ByokProvider implements AiProvider {
  const ByokProvider({required this.secrets, required this.exchange});

  final SecretStore secrets;
  final AiHttpExchange exchange;

  /// Reads the user's key, or fails with something they can act on.
  ///
  /// Held only for the duration of one call. It is never stored on the adapter,
  /// never attached to a config, and never logged — which is what lets a config
  /// be printed in a bug report safely.
  Future<String> requireSecret(AiProviderConfig config) async {
    final String? key;
    try {
      key = await secrets.read(SecretKeys.providerKey(config.secretKey));
    } on Object catch (error) {
      throw AiProviderFailure(
        AiFailureKind.notConfigured,
        message: "Action couldn't open this device's secure storage.",
        technicalDetail: error.toString(),
      );
    }
    if (key == null || key.isEmpty) {
      throw AiProviderFailure(
        AiFailureKind.notConfigured,
        message: 'Connect an AI provider to use this.',
      );
    }
    return key;
  }

  /// Refuses a request the chosen model cannot honestly serve.
  ///
  /// The failure names the missing capability, because "this model can't read
  /// documents" tells the user what to change and "unsupported" does not.
  void assertCapable(AiProviderConfig config, AiRequest request) {
    final capabilities =
        config.declaredCapabilities ?? capabilitiesFor(config.modelId);
    final missing = capabilities.missingFrom(request.requiredCapabilities);
    if (missing.isEmpty) return;

    final names = missing.map(describeCapability).toList()..sort();
    throw AiProviderFailure(
      AiFailureKind.unsupportedCapability,
      message: 'The model you chose cannot read ${_list(names)}. '
          'Pick another model in Settings.',
      missingCapabilities: names,
    );
  }

  /// Checks Action's own ceilings, before anything is encoded or sent.
  ///
  /// Locally and early on purpose: a provider-side rejection has already cost
  /// an upload on a metered connection, and base64-encoding a 40 MB document to
  /// find out it was too big can take the app down first.
  void assertWithinLimits(AiRequest request) {
    final attachments = request.parts
        .where((p) => p is AiImagePart || p is AiDocumentPart)
        .length;
    if (attachments > AiLimits.maxAttachments) {
      throw AiProviderFailure(
        AiFailureKind.inputTooLarge,
        message: 'That is more than ${AiLimits.maxAttachments} files at once. '
            'Select fewer.',
      );
    }

    var textChars = 0;
    for (final part in request.parts) {
      switch (part) {
        case AiTextPart(:final text):
          textChars += text.length;
        case AiSourceTextPart(:final text):
          textChars += text.length;
        case AiImagePart(:final bytes):
          if (bytes.length > AiLimits.maxImageBytes) {
            throw AiProviderFailure(
              AiFailureKind.inputTooLarge,
              message: 'One of those images is too large to analyse.',
            );
          }
        case AiDocumentPart(:final bytes, :final pageCount, :final filename):
          if (bytes.length > AiLimits.maxDocumentBytes) {
            throw AiProviderFailure(
              AiFailureKind.inputTooLarge,
              message: '"$filename" is too large to analyse. '
                  'The limit is ${AiLimits.maxDocumentBytes ~/ (1024 * 1024)} MB.',
            );
          }
          if (pageCount != null && pageCount > AiLimits.maxDocumentPages) {
            // Never silently truncate. The user chooses which pages.
            throw AiProviderFailure(
              AiFailureKind.inputTooLarge,
              message: '"$filename" has $pageCount pages. Action reads up to '
                  '${AiLimits.maxDocumentPages} at a time — choose a range.',
            );
          }
      }
    }

    if (textChars > AiLimits.maxTextCharacters) {
      throw AiProviderFailure(
        AiFailureKind.inputTooLarge,
        message: 'That is more text than can be analysed at once.',
      );
    }
    if (request.payloadBytes > AiLimits.maxRequestBytes) {
      throw AiProviderFailure(
        AiFailureKind.inputTooLarge,
        message: 'That selection is too large to send in one request.',
      );
    }
  }

  /// Runs every gate. Adapters call this first, always.
  Future<String> prepare(AiProviderConfig config, AiRequest request) async {
    assertCapable(config, request);
    assertWithinLimits(request);
    return requireSecret(config);
  }

  /// The full system instruction: injection rules first, then the tool's own.
  String systemTextFor(AiRequest request) =>
      '$promptInjectionPreamble\n\n${request.systemInstruction}';

  /// Free text the user typed, plus every fenced source part.
  ///
  /// Sources come last so the model reads the question before the material, and
  /// so a document's final line is not the last thing in the prompt.
  String userTextFor(AiRequest request) {
    final typed = request.parts
        .whereType<AiTextPart>()
        .map((p) => p.text)
        .where((t) => t.trim().isNotEmpty)
        .join('\n\n');
    final sources = renderSourceParts(request.parts);
    if (sources.isEmpty) return typed;
    if (typed.isEmpty) return sources;
    return '$typed\n\n$sources';
  }

  /// By default a provider does not stream; adapters that do override this.
  ///
  /// A default that throws would make streaming a trap for the caller. Falling
  /// back to a single completed event keeps every tool working against every
  /// provider, just without incremental text.
  @override
  Stream<AiStreamEvent> stream(
    AiProviderConfig config,
    AiRequest request, {
    AiCancellationToken? cancel,
  }) async* {
    yield AiStreamCompleted(await send(config, request, cancel: cancel));
  }

  static String base64Of(Uint8List bytes) => base64Encode(bytes);

  static String _list(List<String> items) {
    if (items.length == 1) return items.single;
    return '${items.sublist(0, items.length - 1).join(', ')} or ${items.last}';
  }
}
