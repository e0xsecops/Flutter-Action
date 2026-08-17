import 'provider_contract.dart';

/// What a provider call came back with, stripped of every SDK type.
///
/// The adapter above this boundary handles only Dart primitives, which is what
/// lets the whole of [FirebaseAiExtractionService] be unit-tested without
/// Firebase, a network, or a device.
class ProviderResponse {
  const ProviderResponse({
    this.text,
    this.finishReason,
    this.promptTokens,
    this.candidateTokens,
    this.thoughtTokens,
    this.totalTokens,
  });

  /// The raw model output — expected to be a JSON document, and treated as
  /// untrusted whatever it turns out to be. Null when the model returned no
  /// text part at all.
  final String? text;

  /// e.g. `stop`, `maxTokens`. Recorded because a truncated response is a
  /// *specific* kind of unusable, worth telling apart from a malformed one.
  final String? finishReason;

  final int? promptTokens;
  final int? candidateTokens;

  /// Tokens the model spent thinking. Counted for cost, never requested as
  /// content and never stored.
  final int? thoughtTokens;

  final int? totalTokens;

  bool get hasText => (text ?? '').trim().isNotEmpty;

  /// A compact, non-sensitive summary for diagnostics.
  ///
  /// Deliberately excludes [text]: it is derived from the user's document and
  /// must not reach a log, Analytics or Crashlytics.
  String get usageSummary =>
      'prompt=${promptTokens ?? "?"} out=${candidateTokens ?? "?"} '
      'thoughts=${thoughtTokens ?? "?"} total=${totalTokens ?? "?"}'
      '${finishReason == null ? "" : " finish=$finishReason"}';
}

/// Why a request never produced a response.
///
/// Transport failures are *not* the same as an unusable answer. This one means
/// nothing came back and retrying may work; an answer that came back and failed
/// validation is an [ExtractionResult] with `manualEntryRequired`, and retrying
/// that is pointless. The UI has to offer different remedies for the two, so
/// they are different types.
enum ProviderFailureKind {
  network('Action could not reach the service. Check your connection.'),
  timedOut('The service took too long to answer.'),
  quotaExceeded('The service is temporarily unavailable. Try again later.'),
  unauthorized('This app is not authorised to use the service right now.'),
  serviceUnavailable('The service is temporarily unavailable. Try again later.'),
  blocked('The service declined to process this document.'),
  unknown('Something went wrong reaching the service.');

  const ProviderFailureKind(this.userMessage);

  /// Plain language. Shown to a person, so no status codes and no stack traces.
  final String userMessage;
}

/// Thrown by an [ExtractionTransport] when no response could be obtained.
class ProviderTransportException implements Exception {
  const ProviderTransportException(this.kind, {this.detail});

  final ProviderFailureKind kind;

  /// Developer-facing context. Never contains document text — these strings end
  /// up in diagnostics and could end up in a crash report.
  final String? detail;

  @override
  String toString() =>
      'ProviderTransportException(${kind.name}${detail == null ? '' : ': $detail'})';
}

/// One round trip to a generative provider.
///
/// Narrow on purpose: it takes the already-built [ExtractionRequest] — which
/// already holds the instructions and the document *separately* — and returns
/// primitives. It has no opinion about what the text means, and no ability to
/// build a domain object.
abstract interface class ExtractionTransport {
  /// Throws [ProviderTransportException] when no answer could be obtained.
  /// Returning a [ProviderResponse] with unusable text is not a failure here —
  /// that is the validator's problem, one layer up.
  Future<ProviderResponse> generate(ExtractionRequest request);
}
