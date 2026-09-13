import 'dart:convert';

import 'package:action_app/features/intelligence/data/ai_http.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

/// Records what an adapter actually put on the wire, and replies with whatever
/// the test says.
///
/// Recording the request is the point: most of what matters about an adapter is
/// the shape it sends, and asserting on a decoded body is far stronger than
/// asserting the call returned something.
class RecordingHttp {
  RecordingHttp({
    this.status = 200,
    this.response,
    this.rawResponse,
    this.onRequest,
  });

  final int status;

  /// Encoded to JSON when [rawResponse] is not given.
  final Map<String, dynamic>? response;

  /// Sent verbatim, for testing bodies that are not valid JSON at all.
  final String? rawResponse;

  /// Lets a test vary the reply per call, e.g. to fail the first attempt.
  final http.Response Function(http.Request request)? onRequest;

  final List<http.Request> requests = [];

  http.Request get lastRequest => requests.last;

  /// The last request body, decoded.
  Map<String, dynamic> get lastBody =>
      jsonDecode(lastRequest.body) as Map<String, dynamic>;

  int get callCount => requests.length;

  /// The factory an [AiHttpExchange] is built from.
  ///
  /// A fresh client per call, matching production: the adapter closes the
  /// client it was handed, and a shared one would be closed out from under the
  /// next call.
  AiHttpClientFactory get factory => () => MockClient((request) async {
        requests.add(request);
        final custom = onRequest;
        if (custom != null) return custom(request);
        return http.Response(
          rawResponse ?? jsonEncode(response ?? const <String, dynamic>{}),
          status,
          headers: const {'content-type': 'application/json; charset=utf-8'},
        );
      });

  AiHttpExchange get exchange => AiHttpExchange(clientFactory: factory);
}

/// An exchange whose every call fails, to prove a screen never reaches one.
///
/// Used by the no-background-AI assertions: a fake that returns a plausible
/// response would let an accidental call pass unnoticed.
class ForbiddenHttp {
  int calls = 0;

  AiHttpExchange get exchange => AiHttpExchange(
        clientFactory: () => MockClient((request) async {
          calls++;
          throw StateError(
            'No network call was expected here, but one was made to '
            '${request.url}',
          );
        }),
      );
}
