/// Shared transport for the provider adapters.
///
/// Everything here is provider-agnostic plumbing: making the call, actually
/// cancelling it, turning a status code into a typed failure, and making sure
/// nothing raw escapes. The vendor-specific parts — URL, headers, body shape —
/// belong to the adapters.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../core/security/secret_redactor.dart';
import '../domain/ai_failure.dart';
import '../domain/ai_provider.dart';

/// Creates the client for one exchange.
///
/// **Why a factory instead of a shared client.** Cancellation has to reach the
/// socket. Abandoning a `Future` leaves the request running and, on a BYOK key,
/// still billed — so leaving a screen must actually close the connection. A
/// client per exchange makes `close()` an unambiguous cancel that cannot affect
/// another in-flight request; sharing one would make cancelling a summary
/// abort an unrelated translation. Tests inject a factory returning a fake.
typedef AiHttpClientFactory = http.Client Function();

http.Client _defaultClientFactory() => http.Client();

/// Timeouts.
///
/// Generous: a hundred-page document genuinely takes a while, and a spurious
/// timeout on a request the user already paid for is worse than waiting. Not
/// unbounded, because a hung socket must not pin the screen forever.
const Duration _connectTimeout = Duration(seconds: 30);
const Duration _responseTimeout = Duration(minutes: 4);

class AiHttpExchange {
  const AiHttpExchange({AiHttpClientFactory? clientFactory})
      : _clientFactory = clientFactory ?? _defaultClientFactory;

  final AiHttpClientFactory _clientFactory;

  /// POSTs [body] as JSON and returns the decoded object.
  ///
  /// Throws [AiProviderFailure] and nothing else. An adapter that lets a raw
  /// `SocketException` or a `FormatException` escape has leaked a message no
  /// user can read and, potentially, a request header.
  Future<Map<String, dynamic>> postJson({
    required Uri url,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
    AiCancellationToken? cancel,
    String? secret,
  }) async {
    final raw = await _send(
      url: url,
      headers: headers,
      body: jsonEncode(body),
      cancel: cancel,
      secret: secret,
    );
    return _decodeObject(raw, secret: secret);
  }

  /// GETs and returns the decoded object. Used for model discovery.
  Future<Map<String, dynamic>> getJson({
    required Uri url,
    required Map<String, String> headers,
    AiCancellationToken? cancel,
    String? secret,
  }) async {
    final raw = await _send(
      url: url,
      headers: headers,
      body: null,
      cancel: cancel,
      secret: secret,
    );
    return _decodeObject(raw, secret: secret);
  }

  /// POSTs and yields Server-Sent Event `data:` payloads as they arrive.
  ///
  /// All three providers stream as SSE, so the framing is shared even though
  /// what the events mean is not.
  Stream<String> postSse({
    required Uri url,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
    AiCancellationToken? cancel,
    String? secret,
  }) async* {
    final client = _clientFactory();
    var closed = false;
    void closeOnce() {
      if (closed) return;
      closed = true;
      client.close();
    }

    cancel?.onCancel(closeOnce);

    try {
      if (cancel?.isCancelled ?? false) throw const _Cancelled();

      final request = http.Request('POST', url)
        ..headers.addAll({
          ...headers,
          'content-type': 'application/json',
          'accept': 'text/event-stream',
        })
        ..body = jsonEncode(body);

      final response = await client.send(request).timeout(_connectTimeout);

      if (response.statusCode >= 400) {
        final text = await response.stream.bytesToString();
        throw _failureForStatus(response.statusCode, text, secret: secret);
      }

      // SSE frames are separated by a blank line; a single frame may carry
      // several `data:` lines, which the spec says to join with newlines.
      final buffer = StringBuffer();
      await for (final line in response.stream
          .transform(utf8.decoder)
          .transform(const LineSplitter())) {
        if (cancel?.isCancelled ?? false) throw const _Cancelled();

        if (line.isEmpty) {
          final payload = buffer.toString();
          buffer.clear();
          if (payload.isNotEmpty) yield payload;
          continue;
        }
        if (line.startsWith('data:')) {
          if (buffer.isNotEmpty) buffer.write('\n');
          buffer.write(line.substring(5).trimLeft());
        }
        // `event:` and `id:` lines are deliberately ignored: the adapters
        // discriminate on the JSON payload's own type field, which every
        // provider supplies, rather than on SSE metadata that only some do.
      }
      final tail = buffer.toString();
      if (tail.isNotEmpty) yield tail;
    } on _Cancelled {
      throw AiProviderFailure(
        AiFailureKind.cancelled,
        message: 'Stopped.',
      );
    } on AiProviderFailure {
      rethrow;
    } on Object catch (error) {
      throw _failureForTransportError(error, secret: secret);
    } finally {
      closeOnce();
    }
  }

  Future<String> _send({
    required Uri url,
    required Map<String, String> headers,
    required String? body,
    AiCancellationToken? cancel,
    String? secret,
  }) async {
    final client = _clientFactory();
    var closed = false;
    void closeOnce() {
      if (closed) return;
      closed = true;
      client.close();
    }

    cancel?.onCancel(closeOnce);

    try {
      if (cancel?.isCancelled ?? false) throw const _Cancelled();

      final response = body == null
          ? await client.get(url, headers: headers).timeout(_responseTimeout)
          : await client
              .post(
                url,
                headers: {...headers, 'content-type': 'application/json'},
                body: body,
              )
              .timeout(_responseTimeout);

      if (cancel?.isCancelled ?? false) throw const _Cancelled();

      if (response.statusCode >= 400) {
        // `bodyBytes` decoded explicitly as UTF-8: `response.body` follows the
        // charset in the content-type header, and providers routinely omit it,
        // which mangles any non-ASCII text in an error message.
        throw _failureForStatus(
          response.statusCode,
          utf8.decode(response.bodyBytes, allowMalformed: true),
          secret: secret,
        );
      }
      return utf8.decode(response.bodyBytes, allowMalformed: true);
    } on _Cancelled {
      throw AiProviderFailure(AiFailureKind.cancelled, message: 'Stopped.');
    } on AiProviderFailure {
      rethrow;
    } on Object catch (error) {
      throw _failureForTransportError(error, secret: secret);
    } finally {
      closeOnce();
    }
  }

  Map<String, dynamic> _decodeObject(String raw, {String? secret}) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        throw AiProviderFailure(
          AiFailureKind.malformedResponse,
          message: 'That provider sent back something Action could not read.',
          technicalDetail: 'expected a JSON object, got ${decoded.runtimeType}',
        );
      }
      return decoded;
    } on FormatException catch (error) {
      throw AiProviderFailure(
        AiFailureKind.malformedResponse,
        message: 'That provider sent back something Action could not read.',
        technicalDetail: error.message,
      );
    }
  }
}

/// Internal marker so cancellation is not mistaken for a transport error.
class _Cancelled implements Exception {
  const _Cancelled();
}

/// Maps a transport-level exception to a typed failure.
///
/// The raw error is redacted before it is attached: a `ClientException` for a
/// POST can carry the request URL, and for Gemini that is a shape where a key
/// could appear if the query-parameter auth form were ever used.
AiProviderFailure _failureForTransportError(Object error, {String? secret}) {
  final detail = SecretRedactor.redact(
    error.toString(),
    also: [?secret],
  );

  if (error is TimeoutException) {
    return AiProviderFailure(
      AiFailureKind.networkUnavailable,
      message: 'That took too long and was stopped.',
      technicalDetail: detail,
    );
  }
  if (error is SocketException || error is http.ClientException) {
    return AiProviderFailure(
      AiFailureKind.networkUnavailable,
      message: "Action couldn't reach your AI provider. Check your connection.",
      technicalDetail: detail,
    );
  }
  if (error is HandshakeException || error is TlsException) {
    return AiProviderFailure(
      AiFailureKind.providerUnavailable,
      message: 'The secure connection to your AI provider failed.',
      technicalDetail: detail,
    );
  }
  return AiProviderFailure(
    AiFailureKind.unknown,
    message: 'Something went wrong talking to your AI provider.',
    technicalDetail: detail,
  );
}

/// Maps an HTTP status, plus whatever the provider said, to a typed failure.
///
/// Status alone is not enough. A 429 is a rate limit for one provider and an
/// exhausted balance for another, and those need different words — one is
/// "try again shortly", the other is "top up your account", and telling a user
/// to wait for a problem that will never clear on its own is worse than saying
/// nothing.
AiProviderFailure _failureForStatus(
  int status,
  String body, {
  String? secret,
}) {
  final detail = SecretRedactor.redact(
    'HTTP $status: ${body.length > 600 ? '${body.substring(0, 600)}…' : body}',
    also: [?secret],
  );
  final lower = body.toLowerCase();

  bool mentions(List<String> needles) => needles.any(lower.contains);

  if (status == 401 || status == 403) {
    return AiProviderFailure(
      AiFailureKind.invalidKey,
      message: 'That API key was not accepted by the provider.',
      technicalDetail: detail,
    );
  }

  if (status == 429) {
    // OpenAI reports an exhausted balance as 429 `insufficient_quota`;
    // Anthropic and Gemini use their own wording for the same thing.
    if (mentions(const [
      'insufficient_quota',
      'quota',
      'billing',
      'credit balance',
      'exceeded your current',
    ])) {
      return AiProviderFailure(
        AiFailureKind.quotaExceeded,
        message: "Your provider account is out of credit or has hit its quota.",
        technicalDetail: detail,
      );
    }
    return AiProviderFailure(
      AiFailureKind.rateLimited,
      message: 'Your provider is rate-limiting requests. Try again shortly.',
      technicalDetail: detail,
    );
  }

  if (status == 404 ||
      (status == 400 && mentions(const ['model', 'not found', 'does not exist']))) {
    // Model ids are retired regularly, so this is the failure a configuration
    // that used to work drifts into over time.
    if (mentions(const ['model'])) {
      return AiProviderFailure(
        AiFailureKind.unsupportedModel,
        message: 'That model is not available to your key. Choose another in '
            'Settings.',
        technicalDetail: detail,
      );
    }
  }

  if (status == 413 ||
      mentions(const [
        'context_length_exceeded',
        'maximum context',
        'too long',
        'too many tokens',
        'request too large',
      ])) {
    return AiProviderFailure(
      AiFailureKind.contextTooLarge,
      message: 'That was too much content for this model to read at once.',
      technicalDetail: detail,
    );
  }

  if (status >= 500) {
    return AiProviderFailure(
      AiFailureKind.providerUnavailable,
      message: 'Your AI provider is having trouble. Try again shortly.',
      technicalDetail: detail,
    );
  }

  if (status == 404) {
    return AiProviderFailure(
      AiFailureKind.unsupportedModel,
      message: 'Action could not find that model or endpoint.',
      technicalDetail: detail,
    );
  }

  return AiProviderFailure(
    AiFailureKind.unknown,
    message: 'Your AI provider rejected that request.',
    technicalDetail: detail,
  );
}

/// Rejects an endpoint that would send the user's content in the clear.
///
/// A custom endpoint is the one place the destination is not known in advance,
/// so it is the one place this check is needed — and it is a hard refusal, not
/// a warning. Cleartext is permitted only under `kDebugMode`, which the caller
/// decides; there is no runtime toggle and no certificate-validation bypass
/// anywhere in the app. See docs/v2/AI_SECURITY_THREAT_MODEL.md (T6, T7).
Uri? validateEndpoint(String raw, {required bool allowCleartext}) {
  final uri = Uri.tryParse(raw.trim());
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) return null;
  if (uri.scheme == 'https') return uri;
  if (uri.scheme == 'http' && allowCleartext) return uri;
  return null;
}
