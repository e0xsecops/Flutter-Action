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
import 'ai_capabilities.dart';

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
  unknown;

  /// The sentence a person is shown for this failure, in canonical English.
  ///
  /// **Why the copy belongs to the kind and not to the `throw`.** Three
  /// adapters raise the same conditions from three different envelopes. A
  /// wording written at each throw site drifts between them — and, worse, it
  /// cannot be translated at all, because a literal built inside `data/` has
  /// no locale to build itself from. The kind travels; the sentence should
  /// travel with it.
  ///
  /// This is the English original, kept here for logs, bug reports and the
  /// domain tests that assert wording without pumping a widget tree. What a
  /// person actually reads is `AiFailureKindL10n.messageIn(l10n)` in
  /// `lib/l10n/enum_labels.dart`, for the reason every other enum in this app
  /// keeps its English and its translation apart: a `const` value cannot
  /// depend on a locale.
  ///
  /// [missing] is read only by [unsupportedCapability], the one kind whose
  /// sentence has to name something the failure carries.
  ///
  /// [inputTooLarge] returns the sentence for text over the cap. The other
  /// local limits — a document, its page count, a batch of attachments —
  /// name the file and the number, so they are worded at the check that knows
  /// them rather than here.
  String message({Iterable<AiCapability> missing = const []}) {
    assert(
      this != AiFailureKind.unsupportedCapability || missing.isNotEmpty,
      'unsupportedCapability exists to name what the chosen model cannot do. '
      'With nothing missing the sentence has a hole in it: pass the '
      'capabilities the model was missing.',
    );
    return switch (this) {
      AiFailureKind.notConfigured =>
        'Connect an AI provider to use this tool.',
      AiFailureKind.invalidKey =>
        'That API key was not accepted by the provider.',
      AiFailureKind.quotaExceeded =>
        'Your provider account is out of credit or has hit its quota.',
      AiFailureKind.rateLimited =>
        'Your provider is rate-limiting requests. Try again shortly.',
      AiFailureKind.networkUnavailable =>
        "Action couldn't reach your AI provider. Check your connection.",
      AiFailureKind.unsupportedModel =>
        'That model is not available to your key. Choose another in Settings.',
      AiFailureKind.unsupportedCapability =>
        'The model you chose cannot read ${describeCapabilities(missing)}. '
            'Pick another model in Settings.',
      AiFailureKind.contextTooLarge =>
        'That was too much content for this model to read at once.',
      AiFailureKind.inputTooLarge =>
        'That is more text than can be analysed at once.',
      AiFailureKind.providerUnavailable =>
        'Your AI provider is having trouble. Try again shortly.',
      AiFailureKind.malformedResponse =>
        'That provider sent back something Action could not read.',
      AiFailureKind.cancelled => 'Stopped.',
      AiFailureKind.insecureEndpoint =>
        'That endpoint must be an https:// address.',
      AiFailureKind.unknown =>
        'Something went wrong talking to your AI provider.',
    };
  }
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
  ///
  /// Strings, and English ones: the adapter names the capabilities before it
  /// throws, which is the wrong side of the boundary for a translated build.
  /// Typed as `List<AiCapability>` these would reach the screen as values the
  /// reader's own language can name, through `AiCapabilityListL10n`. Nothing
  /// in `lib/` reads this field today, so that change is still free — it
  /// stops being free the moment something does.
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
