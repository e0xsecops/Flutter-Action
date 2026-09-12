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
        message: AiAdapterMessage.secureStorageUnavailable.text(),
        technicalDetail: error.toString(),
      );
    }
    if (key == null || key.isEmpty) {
      throw AiProviderFailure(
        AiFailureKind.notConfigured,
        // The kind's own sentence, which says "to use this tool" where this
        // throw used to say "to use this". One word, and it is the word that
        // makes the sentence stand on its own in a snack bar.
        message: AiFailureKind.notConfigured.message(),
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

    throw AiProviderFailure(
      AiFailureKind.unsupportedCapability,
      // Both the sentence and the list inside it come from the domain now.
      // This used to hand-roll the ', ' / ' or ' join and sort the nouns
      // alphabetically — an English sort, which ordered the sentence one way
      // here and another way in `AiCapabilityListL10n.describeIn`, where the
      // order is the enum's. Same source, same order, in every language.
      message: AiFailureKind.unsupportedCapability.message(missing: missing),
      missingCapabilities: missing.map(describeCapability).toList(),
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
        message: AiAdapterMessage.tooManyAttachments
            .text(limit: AiLimits.maxAttachments),
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
              message: AiAdapterMessage.imageTooLarge.text(),
            );
          }
        case AiDocumentPart(:final bytes, :final pageCount, :final filename):
          if (bytes.length > AiLimits.maxDocumentBytes) {
            throw AiProviderFailure(
              AiFailureKind.inputTooLarge,
              message: AiAdapterMessage.documentTooLarge.text(
                filename: filename,
                limit: AiLimits.maxDocumentBytes ~/ (1024 * 1024),
              ),
            );
          }
          if (pageCount != null && pageCount > AiLimits.maxDocumentPages) {
            // Never silently truncate. The user chooses which pages.
            throw AiProviderFailure(
              AiFailureKind.inputTooLarge,
              message: AiAdapterMessage.documentTooManyPages.text(
                filename: filename,
                count: pageCount,
                limit: AiLimits.maxDocumentPages,
              ),
            );
          }
      }
    }

    if (textChars > AiLimits.maxTextCharacters) {
      throw AiProviderFailure(
        AiFailureKind.inputTooLarge,
        message: AiFailureKind.inputTooLarge.message(),
      );
    }
    if (request.payloadBytes > AiLimits.maxRequestBytes) {
      throw AiProviderFailure(
        AiFailureKind.inputTooLarge,
        message: AiAdapterMessage.selectionTooLarge.text(),
      );
    }
  }

  /// Runs every gate. Adapters call this first, always.
  Future<String> prepare(AiProviderConfig config, AiRequest request) async {
    assertCapable(config, request);
    assertWithinLimits(request);
    return requireSecret(config);
  }

  /// The result every adapter returns when model discovery succeeded.
  ///
  /// **Why it moved here.** All four adapters built these two sentences
  /// themselves, from four identical ternaries — the kind of duplication that
  /// stays identical right up until someone edits three of the copies.
  ///
  /// The claim is deliberately the narrow one: the provider answered a request
  /// with this key, and reported this many models. Not that the key is valid
  /// for anything else, not that the chosen model works, not that anything is
  /// secure.
  ///
  /// **What the user actually reads is not this string.** Both screens that
  /// run a test — `connect_provider_sheet.dart` and
  /// `intelligence_settings_screen.dart` — recompose the sentence from
  /// [AiConnectionCheck.models] against their own bundle
  /// (`connectTestSucceeded` / `connectTestSucceededWithModels`,
  /// `aiSettingsTestConnectedModels`), because a count belongs in an ICU plural
  /// and `data/` has no locale to build one from. This English is what remains
  /// for logs, fixtures and any caller that has no `BuildContext`.
  AiConnectionCheck connectedCheck(List<AiModelDescriptor> models) =>
      AiConnectionCheck(
        ok: true,
        message: models.isEmpty
            ? 'Connected.'
            : 'Connected. ${models.length} models available.',
        models: models,
      );

  /// The result every adapter returns when the test call failed.
  ///
  /// [AiConnectionCheck] carries a finished sentence and nothing else, so the
  /// [AiFailureKind] that produced it — the one thing a screen could have
  /// translated — is dropped here. Both test screens say so in a comment and
  /// show this English. See the note on [connectedCheck]; the fix is a `kind`
  /// field on [AiConnectionCheck], which is not this file's to add.
  AiConnectionCheck failedCheck(AiProviderFailure failure) =>
      AiConnectionCheck(ok: false, message: failure.message);

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
}
