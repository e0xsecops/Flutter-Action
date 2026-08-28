import 'dart:async';
import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';

import '../../../core/firebase/firebase_gate.dart';

import 'extraction_model_config.dart';
import 'extraction_transport.dart';
import 'firebase_ai_schema.dart';
import 'provider_contract.dart';

/// The only class in the app that talks to Firebase AI Logic.
///
/// Everything provider-specific lives here: the model handle, the schema
/// translation, the SDK's exception types. It hands back primitives, which is
/// what lets [FirebaseAiExtractionService] — and every test of the trust
/// boundary — be written without the SDK present at all.
class FirebaseAiTransport implements ExtractionTransport {
  const FirebaseAiTransport({
    this.modelSource = const LocalExtractionModelSource(),
    this.firebaseAi,
    this.gate,
  });

  final ExtractionModelSource modelSource;

  /// Injectable so a caller can supply a pre-built instance. Left null in
  /// production and resolved lazily, because [FirebaseAI.googleAI] requires
  /// Firebase to have finished initialising — which has not happened at the
  /// point where providers are constructed.
  final FirebaseAI? firebaseAi;

  /// Since Day 16 Firebase comes up after the first frame, and App Check is
  /// activated inside that same bring-up. Waiting here is what keeps the
  /// Day-6 guarantee intact: a generate call never runs against an
  /// unattested client just because the user was quick.
  final FirebaseGate? gate;

  /// The Gemini Developer API backend. App Check and Auth tokens are attached
  /// by the SDK itself — as of firebase_ai 3.x passing them explicitly is
  /// deprecated because the wiring is automatic.
  FirebaseAI get _ai => firebaseAi ?? FirebaseAI.googleAI();

  @override
  Future<ProviderResponse> generate(ExtractionRequest request) async {
    final open = await gate?.ready ?? true;
    if (!open) {
      // Firebase never came up, so there is nothing to attest to and nothing
      // to call. Reported in the same shape as any other outage, which the
      // review screen already knows how to show.
      throw const ProviderTransportException(
        ProviderFailureKind.serviceUnavailable,
        detail: 'firebase_unavailable',
      );
    }

    final config = modelSource.current;

    final model = _ai.generativeModel(
      model: config.modelName,

      // The app's rules go in the model's own system-instruction channel. They
      // are never concatenated with the document; that separation is the first
      // line of defence against a document that tries to issue instructions.
      systemInstruction: Content.system(request.systemInstructions),

      generationConfig: GenerationConfig(
        // Structured output is enforced by the provider rather than asked for
        // in prose: no markdown fences to strip, no commentary to parse around
        // the JSON.
        responseMimeType: 'application/json',
        responseSchema: schemaFromContract(request.responseSchema),

        // A response that hits this ceiling is truncated mid-JSON and fails
        // validation as malformed — a visible failure rather than a
        // half-parsed draft.
        maxOutputTokens: config.maxOutputTokens,

        // Factual extraction, so the model is asked to think as little as the
        // task needs and to keep its reasoning to itself. Sampling knobs are
        // left at their defaults: what makes this reproducible is the schema,
        // the instructions and the validator, not a tuned temperature.
        thinkingConfig: ThinkingConfig.withThinkingLevel(
          ThinkingLevel.low,
          includeThoughts: false,
        ),
      ),

      // No tools, no function calling, no search grounding, no URL context and
      // no code execution. This task reads one document and returns JSON; each
      // of those capabilities would be a route by which text inside an
      // untrusted document could reach something outside it.
    );

    try {
      final response = await model.generateContent([
        // The document travels as a separate user content part, wrapped in its
        // data-only delimiters and passed verbatim. It is never edited to strip
        // instruction-like text — that would mean reporting on a document that
        // does not exist.
        Content.text(request.delimitedDocument),
      ]);

      final candidate =
          response.candidates.isEmpty ? null : response.candidates.first;

      return ProviderResponse(
        // Throws when the prompt or the candidate was blocked; caught below and
        // reported as a refusal rather than an outage.
        text: response.text,
        finishReason: candidate?.finishReason?.name,
        promptTokens: response.usageMetadata?.promptTokenCount,
        candidateTokens: response.usageMetadata?.candidatesTokenCount,
        thoughtTokens: response.usageMetadata?.thoughtsTokenCount,
        totalTokens: response.usageMetadata?.totalTokenCount,
      );
    } on FirebaseAIException catch (error) {
      throw ProviderTransportException(
        _kindFor(error),
        // The SDK's own message describes the failure, not the document.
        // Nothing document-derived may travel with an error.
        detail: error.message,
      );
    } on SocketException catch (error) {
      throw ProviderTransportException(
        ProviderFailureKind.network,
        detail: error.osError?.message,
      );
    } on TimeoutException {
      throw const ProviderTransportException(ProviderFailureKind.timedOut);
    }
  }

  ProviderFailureKind _kindFor(FirebaseAIException error) => switch (error) {
        QuotaExceeded() => ProviderFailureKind.quotaExceeded,
        InvalidApiKey() || ServiceApiNotEnabled() =>
          ProviderFailureKind.unauthorized,
        ServerException() => ProviderFailureKind.serviceUnavailable,
        // The base type is what the SDK throws when a prompt or candidate was
        // blocked, which is a refusal rather than an outage.
        _ => ProviderFailureKind.blocked,
      };
}
