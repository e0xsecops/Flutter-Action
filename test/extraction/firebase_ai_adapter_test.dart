import 'dart:io';

import 'package:action_app/core/result.dart';
import 'package:action_app/features/extraction/data/extraction_model_config.dart';
import 'package:action_app/features/extraction/data/extraction_transport.dart';
import 'package:action_app/features/extraction/data/firebase_ai_extraction_service.dart';
import 'package:action_app/features/extraction/data/provider_contract.dart';
import 'package:action_app/features/extraction/domain/extraction_result.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/extraction_test_support.dart';

/// The adapter, exercised entirely offline.
///
/// No Firebase, no network, no device. That is possible because the adapter
/// depends on [ExtractionTransport] rather than on the SDK — which is also the
/// point being tested: the trust boundary is the day-5 validator, and nothing
/// about which provider produced a string changes what happens to it.
class _FakeTransport implements ExtractionTransport {
  _FakeTransport({this.response, this.error, this.delay});

  final ProviderResponse? response;
  final Object? error;
  final Duration? delay;

  ExtractionRequest? lastRequest;
  int calls = 0;

  @override
  Future<ProviderResponse> generate(ExtractionRequest request) async {
    calls++;
    lastRequest = request;
    if (delay != null) await Future<void>.delayed(delay!);
    if (error != null) throw error!;
    return response ?? const ProviderResponse(text: null);
  }
}

void main() {
  final input = inputFor(
    'Northgate Mutual\n'
    'Policy number: NM-4471-882\n'
    'Renewal date: 30 September 2026\n'
    'Premium due: 780.00',
  );

  const goodJson = '''
{
  "schema_version": 1,
  "no_action_required": false,
  "title": "Renew your motor policy",
  "summary": "The policy renews at the end of September.",
  "category": "renewal",
  "urgency": "important",
  "urgency_reason": "A renewal date is stated.",
  "fields": [
    {
      "key": "due_date",
      "label": "Renewal date",
      "value": "2026-09-30",
      "value_type": "date",
      "evidence": "Renewal date: 30 September 2026"
    }
  ]
}''';

  FirebaseAiExtractionService serviceWith(_FakeTransport transport) =>
      FirebaseAiExtractionService(
        transport: transport,
        clock: () => testProducedAt,
      );

  Future<ExtractionResult> okResultFrom(_FakeTransport transport) async {
    final outcome = await serviceWith(transport).extract(input);
    expect(outcome, isA<Ok<ExtractionResult>>());
    return (outcome as Ok<ExtractionResult>).value;
  }

  Future<Err<ExtractionResult>> errFrom(_FakeTransport transport) async {
    final outcome = await serviceWith(transport).extract(input);
    expect(outcome, isA<Err<ExtractionResult>>());
    return outcome as Err<ExtractionResult>;
  }

  group('a usable response', () {
    test('is validated, not trusted', () async {
      final result = await okResultFrom(
        _FakeTransport(response: const ProviderResponse(text: goodJson)),
      );

      expect(result.hasDraft, isTrue);
      expect(result.draft!.title, 'Renew your motor policy');
      expect(result.draft!.groundedDueAt, DateTime(2026, 9, 30));
      expect(result.reviewState, ExtractionReviewState.readyForConfirmation);
    });

    test('records which provider and model produced it', () async {
      final result = await okResultFrom(
        _FakeTransport(response: const ProviderResponse(text: goodJson)),
      );

      expect(result.engine, 'firebase_ai/googleai/gemini-3.6-flash');
      expect(result.engine, isNot(contains('fixture')));
    });

    test('carries the request latency', () async {
      final result = await okResultFrom(
        _FakeTransport(response: const ProviderResponse(text: goodJson)),
      );

      // The injected clock does not advance, so this is 0 — what matters is
      // that the field is wired at all.
      expect(result.durationMs, isNotNull);
    });
  });

  group('the validator remains the trust boundary', () {
    test('a live response cannot invent a deadline', () async {
      // Well-formed, schema-valid, and a lie: the quote does not contain the
      // date. The adapter has no say in this — the validator catches it.
      final result = await okResultFrom(
        _FakeTransport(
          response: const ProviderResponse(text: '''
{
  "schema_version": 1,
  "no_action_required": false,
  "title": "Renew now",
  "summary": "A renewal is due.",
  "category": "renewal",
  "fields": [
    {
      "key": "due_date",
      "label": "Renewal date",
      "value": "2026-11-15",
      "value_type": "date",
      "evidence": "Policy number: NM-4471-882"
    }
  ]
}'''),
        ),
      );

      expect(result.draft!.groundedDueAt, isNull);
      expect(
        result.hasIssue(ExtractionIssueCode.valueNotSupportedByEvidence),
        isTrue,
      );
      expect(result.reviewState, ExtractionReviewState.needsReview);
    });

    test('a live response cannot mark anything confirmed', () async {
      final result = await okResultFrom(
        _FakeTransport(
          response: const ProviderResponse(text: '''
{
  "schema_version": 1,
  "no_action_required": false,
  "title": "Renew now",
  "summary": "A renewal is due.",
  "category": "renewal",
  "fields": [
    {
      "key": "due_date",
      "label": "Renewal date",
      "value": "2026-09-30",
      "value_type": "date",
      "evidence": "Renewal date: 30 September 2026",
      "review_state": "confirmed"
    }
  ]
}'''),
        ),
      );

      expect(
        result.draft!.fields.single.reviewState,
        FieldReviewState.highConfidence,
      );
      expect(
        result.hasIssue(ExtractionIssueCode.unconfirmableConfidence),
        isTrue,
      );
    });

    test('a live response cannot claim an ungrounded consequence', () async {
      final result = await okResultFrom(
        _FakeTransport(
          response: const ProviderResponse(text: '''
{
  "schema_version": 1,
  "no_action_required": false,
  "title": "Renew now",
  "summary": "A renewal is due.",
  "category": "renewal",
  "consequence": {
    "text": "Your cover will be cancelled without notice.",
    "evidence": "Your cover will be cancelled without notice"
  }
}'''),
        ),
      );

      expect(result.draft!.consequence, isNull);
      expect(result.hasIssue(ExtractionIssueCode.ungroundedConsequence), isTrue);
    });
  });

  group('unusable output is not a transport failure', () {
    test('malformed JSON lands on manual entry', () async {
      final result = await okResultFrom(
        _FakeTransport(
          response: const ProviderResponse(text: '{"schema_version": 1, "titl'),
        ),
      );

      expect(result.requiresManualEntry, isTrue);
      expect(result.hasIssue(ExtractionIssueCode.malformedJson), isTrue);
    });

    test('an empty body lands on manual entry', () async {
      final result = await okResultFrom(
        _FakeTransport(response: const ProviderResponse(text: '')),
      );

      expect(result.requiresManualEntry, isTrue);
    });

    test('a null body lands on manual entry', () async {
      final result = await okResultFrom(
        _FakeTransport(response: const ProviderResponse()),
      );

      expect(result.requiresManualEntry, isTrue);
      expect(result.hasIssue(ExtractionIssueCode.malformedJson), isTrue);
    });

    test('a truncated response is unusable rather than half-believed', () async {
      // What hitting maxOutputTokens looks like: valid JSON up to the cut.
      final result = await okResultFrom(
        _FakeTransport(
          response: const ProviderResponse(
            text: '{"schema_version": 1, "no_action_required": false, "title": "Ren',
            finishReason: 'maxTokens',
          ),
        ),
      );

      expect(result.requiresManualEntry, isTrue);
      expect(result.hasDraft, isFalse);
    });
  });

  group('transport failures stay retryable and typed', () {
    test('network failure', () async {
      final err = await errFrom(
        _FakeTransport(
          error: const ProviderTransportException(
            ProviderFailureKind.network,
            detail: 'no route to host',
          ),
        ),
      );

      expect(err.message, ProviderFailureKind.network.userMessage);
      expect(err.cause, isA<ProviderTransportException>());
    });

    test('quota exceeded', () async {
      final err = await errFrom(
        _FakeTransport(
          error: const ProviderTransportException(
            ProviderFailureKind.quotaExceeded,
          ),
        ),
      );

      expect(err.message, ProviderFailureKind.quotaExceeded.userMessage);
    });

    test('a blocked prompt is a refusal, not a bad document', () async {
      final err = await errFrom(
        _FakeTransport(
          error: const ProviderTransportException(ProviderFailureKind.blocked),
        ),
      );

      expect(err.message, ProviderFailureKind.blocked.userMessage);
    });

    test('a raw socket error is still reported in plain language', () async {
      final err = await errFrom(
        _FakeTransport(error: const SocketException('failed')),
      );

      expect(err.message, ProviderFailureKind.unknown.userMessage);
      expect(err.message, isNot(contains('SocketException')));
    });

    test('a slow provider times out instead of hanging', () async {
      final transport = _FakeTransport(
        response: const ProviderResponse(text: goodJson),
        delay: const Duration(milliseconds: 400),
      );

      final service = FirebaseAiExtractionService(
        transport: transport,
        modelSource: const LocalExtractionModelSource(
          ExtractionModelConfig(requestTimeout: Duration(milliseconds: 30)),
        ),
        clock: () => testProducedAt,
      );

      final outcome = await service.extract(input);
      expect(outcome, isA<Err<ExtractionResult>>());
      expect(
        (outcome as Err<ExtractionResult>).message,
        ProviderFailureKind.timedOut.userMessage,
      );
    });

    test('a failure never produces a draft', () async {
      final outcome = await serviceWith(
        _FakeTransport(
          error: const ProviderTransportException(ProviderFailureKind.network),
        ),
      ).extract(input);

      // No silent fallback to a guessed extraction. Nothing at all comes back.
      expect(outcome, isA<Err<ExtractionResult>>());
      expect(outcome.isOk, isFalse);
    });

    test('one extraction makes exactly one live call', () async {
      // No automatic retry loop: live calls cost money and quota, and the
      // decision to spend more belongs to whoever is watching.
      final transport = _FakeTransport(
        response: const ProviderResponse(text: goodJson),
      );
      await serviceWith(transport).extract(input);

      expect(transport.calls, 1);
    });
  });

  group('what is sent', () {
    test('instructions and document stay in separate fields', () async {
      final transport = _FakeTransport(
        response: const ProviderResponse(text: goodJson),
      );
      await serviceWith(transport).extract(input);

      final request = transport.lastRequest!;
      expect(request.systemInstructions, extractionSystemInstructions);
      expect(request.documentContent, input.normalizedText);
      expect(request.systemInstructions.contains(input.normalizedText), isFalse);
      expect(request.schemaVersion, extractionSchemaVersion);
    });

    test('no image or file path is ever attached', () async {
      final transport = _FakeTransport(
        response: const ProviderResponse(text: goodJson),
      );
      await serviceWith(transport).extract(input);

      // Day 6 is text-first. There is deliberately no field on the request
      // through which a capture could travel.
      expect(transport.lastRequest!.documentContent, isNot(contains('/')));
    });
  });

  group('usage reporting', () {
    test('summarises tokens without ever quoting the document', () {
      const response = ProviderResponse(
        text: 'irrelevant',
        promptTokens: 512,
        candidateTokens: 128,
        thoughtTokens: 64,
        totalTokens: 704,
        finishReason: 'stop',
      );

      expect(response.usageSummary, contains('prompt=512'));
      expect(response.usageSummary, contains('total=704'));
      expect(response.usageSummary, isNot(contains('irrelevant')));
    });
  });
}
