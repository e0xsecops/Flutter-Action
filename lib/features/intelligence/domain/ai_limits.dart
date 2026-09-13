/// Action's own ceilings on what may be sent, checked before a request is built.
///
/// **Why local caps at all, when providers have their own.** Three reasons, in
/// order of how much they matter. A provider-side rejection has already cost the
/// user an upload on a metered connection and, on some providers, tokens. A
/// 40 MB document decoded to base64 in memory can take the app down before any
/// limit is consulted. And a local refusal can say something useful — which
/// document, how big, what to do — where a provider's 400 cannot.
///
/// The numbers are deliberately below every provider's published limit
/// (Anthropic 32 MB / 600 pages, OpenAI 50 MB, Gemini 50 MB / 1000 pages) because
/// base64 inflates payloads by roughly a third and the limits are on the whole
/// request, not the file.
///
/// See `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T8).
library;

abstract final class AiLimits {
  /// Largest single document, before base64 expansion.
  static const int maxDocumentBytes = 16 * 1024 * 1024;

  /// Largest single image.
  static const int maxImageBytes = 8 * 1024 * 1024;

  /// Largest whole request payload, before base64 expansion.
  static const int maxRequestBytes = 20 * 1024 * 1024;

  /// Pages Action will send without asking the user to narrow the range.
  ///
  /// Well under every provider's page cap: dense pages exhaust a context window
  /// long before the page limit is reached, and a request that dies at page 300
  /// has already been paid for.
  static const int maxDocumentPages = 100;

  /// Characters of extracted or pasted text in one request.
  static const int maxTextCharacters = 400000;

  /// Documents and images in one request. Compare Documents is the only tool
  /// that legitimately needs more than one, and it does not need many.
  static const int maxAttachments = 8;

  /// Page count past which the user is shown the scope before anything is sent.
  ///
  /// Below this the disclosure would be noise; above it, a silent send can cost
  /// real money on someone else's key.
  static const int scopeDisclosurePageThreshold = 5;
}
