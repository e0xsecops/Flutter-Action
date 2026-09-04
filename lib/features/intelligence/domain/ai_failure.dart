/// Every way a provider call can fail, normalised.
///
/// **Why normalise at all.** Three providers return three different error
/// envelopes, with different names for the same condition and different HTTP
/// codes for conditions that are not the same. A tool cannot branch on that, and
/// a user must never see it — raw provider JSON on screen is both unreadable and
/// a leak risk, since providers routinely echo request fragments back.
///
/// So the adapter is the last place that knows what a provider called something.
/// Above it there is only [AiFailureKind].
library;

import '../../../core/security/secret_redactor.dart';

enum AiFailureKind {
  /// No provider connected yet. Not an error — an invitation.
  notConfigured,

  /// The key was rejected. 401 everywhere.
  invalidKey,

  /// Credit or quota exhausted on the user's own account.
  quotaExceeded,

  /// Too many requests, too quickly. Usually retryable.
  rateLimited,

  /// The device could not reach the provider.
  networkUnavailable,

  /// The configured model id does not exist for this key.
  ///
  /// Common and important: model ids are retired regularly, so this is the
  /// failure a working configuration drifts into over time.
  unsupportedModel,

  /// The model cannot accept an input this tool requires.
  unsupportedCapability,

  /// The request exceeded the model's context window.
  contextTooLarge,

  /// The input broke Action's own caps, before anything was sent.
  ///
  /// Distinct from [contextTooLarge]: this one costs nothing and is caught
  /// locally, which is exactly why it exists.
  inputTooLarge,

  /// The provider is down or returned a 5xx.
  providerUnavailable,

  /// A response arrived but did not match the contract.
  malformedResponse,

  /// The user cancelled, or navigated away.
  cancelled,

  /// A custom endpoint that is not HTTPS. Refused rather than downgraded.
  insecureEndpoint,

  /// Nothing above fits.
  unknown,
}

/// A failure, safe to show and safe to log.
///
/// [message] is written for a person. [technicalDetail] is for a bug report and
/// is redacted on the way in — not on the way out — so there is no path where an
/// un-redacted copy exists on the object waiting to be read by something that
/// forgot.
class AiProviderFailure implements Exception {
  AiProviderFailure(
    this.kind, {
    required this.message,
    String? technicalDetail,
    this.missingCapabilities = const [],
    this.retryAfter,
  }) : technicalDetail = technicalDetail == null
            ? null
            : SecretRedactor.redact(technicalDetail);

  final AiFailureKind kind;

  /// One calm sentence. No provider jargon, no HTTP codes, no JSON.
  final String message;

  /// Redacted at construction. May still be null.
  final String? technicalDetail;

  /// Populated for [AiFailureKind.unsupportedCapability] so the UI can name
  /// what the chosen model is missing instead of saying "unsupported".
  final List<String> missingCapabilities;

  /// Present when the provider told us how long to wait.
  final Duration? retryAfter;

  /// Whether trying the same request again could plausibly work.
  ///
  /// Drives whether the UI offers "Try again" — offering a retry that cannot
  /// succeed wastes the user's time and, on a metered key, their money.
  bool get isRetryable => switch (kind) {
        AiFailureKind.rateLimited ||
        AiFailureKind.networkUnavailable ||
        AiFailureKind.providerUnavailable ||
        AiFailureKind.malformedResponse =>
          true,
        _ => false,
      };

  /// Whether fixing this means going to Settings.
  bool get needsConfiguration => switch (kind) {
        AiFailureKind.notConfigured ||
        AiFailureKind.invalidKey ||
        AiFailureKind.unsupportedModel ||
        AiFailureKind.unsupportedCapability ||
        AiFailureKind.insecureEndpoint =>
          true,
        _ => false,
      };

  /// Redacted, because this is what ends up in a log line.
  @override
  String toString() => SecretRedactor.redact(
        'AiProviderFailure(${kind.name}): $message',
      );
}
