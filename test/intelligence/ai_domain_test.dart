import 'dart:typed_data';

import 'package:action_app/core/security/secret_store.dart';
import 'package:action_app/features/intelligence/domain/ai_capabilities.dart';
import 'package:action_app/features/intelligence/domain/ai_failure.dart';
import 'package:action_app/features/intelligence/domain/ai_provider.dart';
import 'package:action_app/features/intelligence/domain/ai_provider_config.dart';
import 'package:action_app/features/intelligence/domain/ai_request.dart';
import 'package:action_app/features/intelligence/domain/ai_response.dart';
import 'package:flutter_test/flutter_test.dart';

const _fakeKey = 'sk-ant-api03-abcdefghijklmnop1234567890';

void main() {
  group('AiCapabilities', () {
    const caps = AiCapabilities({
      AiCapability.text,
      AiCapability.vision,
      AiCapability.structuredOutput,
    });

    test('reports what it has', () {
      expect(caps.has(AiCapability.vision), isTrue);
      expect(caps.has(AiCapability.documents), isFalse);
    });

    test('names what is missing rather than just failing', () {
      // "unsupported" is not actionable; "cannot read documents" is.
      final missing = caps.missingFrom([
        AiCapability.text,
        AiCapability.documents,
        AiCapability.citations,
      ]);
      expect(missing, {AiCapability.documents, AiCapability.citations});
    });

    test('hasAll is true only when nothing is missing', () {
      expect(caps.hasAll([AiCapability.text, AiCapability.vision]), isTrue);
      expect(caps.hasAll([AiCapability.text, AiCapability.documents]), isFalse);
    });

    test('every capability has user-facing wording', () {
      // A new capability must not be addable without deciding what the user is
      // told when it is absent.
      for (final c in AiCapability.values) {
        expect(describeCapability(c), isNotEmpty, reason: c.name);
      }
    });
  });

  group('AiProviderKind', () {
    test('ids are stable and distinct from display labels', () {
      // A rename of the label must never orphan a stored key.
      final ids = AiProviderKind.values.map((k) => k.id).toSet();
      expect(ids.length, AiProviderKind.values.length);
      expect(AiProviderKind.openAi.id, 'openai');
    });

    test('round-trips through fromId', () {
      for (final kind in AiProviderKind.values) {
        expect(AiProviderKind.fromId(kind.id), kind);
      }
    });

    test('returns null for an unknown id instead of throwing', () {
      expect(AiProviderKind.fromId('nope'), isNull);
    });
  });

  group('AiProviderConfig', () {
    test('carries no secret, by construction', () {
      // The whole safety argument for persisting and logging a config.
      const config =
          AiProviderConfig(kind: AiProviderKind.anthropic, modelId: 'm-1');
      expect(config.toString(), isNot(contains(_fakeKey)));
      expect(config.toJson().toString(), isNot(contains('key')));
    });

    test('round-trips through JSON', () {
      const config = AiProviderConfig(
        kind: AiProviderKind.openAiCompatible,
        modelId: 'local-model',
        baseUrl: 'https://example.invalid/v1',
        declaredCapabilities: AiCapabilities({AiCapability.text}),
      );
      final restored = AiProviderConfig.fromJson(config.toJson());
      expect(restored, isNotNull);
      expect(restored!.kind, AiProviderKind.openAiCompatible);
      expect(restored.modelId, 'local-model');
      expect(restored.baseUrl, 'https://example.invalid/v1');
      expect(restored.declaredCapabilities!.has(AiCapability.text), isTrue);
    });

    test('a corrupt stored config reads as absent, not as a crash', () {
      // This is read on the way into Settings — the screen the user opened to
      // fix it. It must not throw there.
      expect(AiProviderConfig.fromJson(const {}), isNull);
      expect(AiProviderConfig.fromJson(const {'kind': 'martian'}), isNull);
      expect(
        AiProviderConfig.fromJson(const {'kind': 'openai', 'modelId': ''}),
        isNull,
      );
    });
  });

  group('AiRequest', () {
    Uint8List bytes(int n) => Uint8List(n);

    test('derives required capabilities from its parts', () {
      final request = AiRequest(
        systemInstruction: 'rules',
        parts: [
          const AiTextPart('what is the deadline?'),
          AiDocumentPart(
            bytes: bytes(10),
            mimeType: 'application/pdf',
            sourceId: 's1',
            filename: 'notice.pdf',
          ),
        ],
        contract: const AiGroundedContract(),
      );
      expect(request.requiredCapabilities, contains(AiCapability.documents));
      expect(request.requiredCapabilities, contains(AiCapability.text));
      expect(
        request.requiredCapabilities,
        isNot(contains(AiCapability.vision)),
      );
    });

    test('a structured contract requires structured output', () {
      final request = AiRequest(
        systemInstruction: 'rules',
        parts: const [AiTextPart('x')],
        contract: const AiStructuredContract(name: 's', schema: {}),
      );
      expect(
        request.requiredCapabilities,
        contains(AiCapability.structuredOutput),
      );
    });

    test('an image part requires vision', () {
      final request = AiRequest(
        systemInstruction: 'rules',
        parts: [
          AiImagePart(
            bytes: bytes(4),
            mimeType: 'image/png',
            sourceId: 's1',
          ),
        ],
        contract: const AiGroundedContract(),
      );
      expect(request.requiredCapabilities, contains(AiCapability.vision));
    });

    test('sums document pages for the scope disclosure', () {
      final request = AiRequest(
        systemInstruction: 'rules',
        parts: [
          AiDocumentPart(
            bytes: bytes(1),
            mimeType: 'application/pdf',
            sourceId: 'a',
            filename: 'a.pdf',
            pageCount: 7,
          ),
          AiDocumentPart(
            bytes: bytes(1),
            mimeType: 'application/pdf',
            sourceId: 'b',
            filename: 'b.pdf',
            pageCount: 5,
          ),
        ],
        contract: const AiGroundedContract(),
      );
      expect(request.documentPageCount, 12);
    });

    test('measures payload size across every part kind', () {
      final request = AiRequest(
        systemInstruction: 'rules',
        parts: [
          const AiTextPart('abcde'),
          const AiSourceTextPart(text: 'fgh', sourceId: 's'),
          AiImagePart(bytes: bytes(100), mimeType: 'image/png', sourceId: 's'),
          AiDocumentPart(
            bytes: bytes(200),
            mimeType: 'application/pdf',
            sourceId: 's',
            filename: 'd.pdf',
          ),
        ],
        contract: const AiGroundedContract(),
      );
      expect(request.payloadBytes, 5 + 3 + 100 + 200);
    });
  });

  group('AiProviderFailure', () {
    test('redacts a secret out of its technical detail at construction', () {
      // Redaction happens on the way in, so no un-redacted copy is left on the
      // object for something that forgot to redact on the way out.
      final failure = AiProviderFailure(
        AiFailureKind.invalidKey,
        message: 'That key was not accepted.',
        technicalDetail: 'POST /v1/messages x-api-key: $_fakeKey -> 401',
      );

      expect(failure.technicalDetail, isNot(contains(_fakeKey)));
      expect(failure.toString(), isNot(contains(_fakeKey)));
    });

    test('only offers retry where retrying could work', () {
      // Offering a retry that cannot succeed wastes the user's time and, on a
      // metered key, their money.
      expect(
        AiProviderFailure(AiFailureKind.rateLimited, message: 'x').isRetryable,
        isTrue,
      );
      expect(
        AiProviderFailure(AiFailureKind.invalidKey, message: 'x').isRetryable,
        isFalse,
      );
      expect(
        AiProviderFailure(AiFailureKind.cancelled, message: 'x').isRetryable,
        isFalse,
      );
    });

    test('routes configuration problems to Settings', () {
      for (final kind in [
        AiFailureKind.notConfigured,
        AiFailureKind.invalidKey,
        AiFailureKind.unsupportedModel,
        AiFailureKind.unsupportedCapability,
        AiFailureKind.insecureEndpoint,
      ]) {
        expect(
          AiProviderFailure(kind, message: 'x').needsConfiguration,
          isTrue,
          reason: kind.name,
        );
      }
      expect(
        AiProviderFailure(AiFailureKind.rateLimited, message: 'x')
            .needsConfiguration,
        isFalse,
      );
    });
  });

  group('AiCitation', () {
    test('labels a single page and a range differently', () {
      expect(
        const AiCitation(quotedText: 'q', startPage: 4).pageLabel,
        'page 4',
      );
      expect(
        const AiCitation(quotedText: 'q', startPage: 4, endPage: 6).pageLabel,
        'pages 4–6',
      );
      expect(
        const AiCitation(quotedText: 'q', startPage: 4, endPage: 4).pageLabel,
        'page 4',
      );
    });

    test('has no page label when the provider gave no location', () {
      expect(const AiCitation(quotedText: 'q').pageLabel, isNull);
    });
  });

  group('AiCancellationToken', () {
    test('fires listeners once on cancel', () {
      final token = AiCancellationToken();
      var fired = 0;
      token.onCancel(() => fired++);

      token.cancel();
      token.cancel();

      expect(fired, 1);
      expect(token.isCancelled, isTrue);
    });

    test('runs a listener immediately when already cancelled', () {
      // A listener registered during teardown must not be silently dropped.
      final token = AiCancellationToken()..cancel();
      var fired = false;
      token.onCancel(() => fired = true);
      expect(fired, isTrue);
    });

    test('tolerates a listener that unregisters during cancellation', () {
      final token = AiCancellationToken();
      token.onCancel(() => token.onCancel(() {}));
      expect(token.cancel, returnsNormally);
    });
  });

  group('InMemorySecretStore', () {
    test('stores, reads, and deletes', () async {
      final store = InMemorySecretStore();
      final key = SecretKeys.providerKey('anthropic');

      expect(await store.contains(key), isFalse);
      expect(await store.read(key), isNull);

      await store.write(key, _fakeKey);
      expect(await store.contains(key), isTrue);
      expect(await store.read(key), _fakeKey);

      await store.delete(key);
      expect(await store.contains(key), isFalse);
    });

    test('deleting a key that was never stored is not an error', () async {
      final store = InMemorySecretStore();
      await expectLater(store.delete('missing'), completes);
    });

    test('namespaces providers so one key cannot clobber another', () async {
      final store = InMemorySecretStore();
      await store.write(SecretKeys.providerKey('openai'), 'a-key-value-1');
      await store.write(SecretKeys.providerKey('anthropic'), 'a-key-value-2');

      expect(await store.read(SecretKeys.providerKey('openai')), 'a-key-value-1');
      expect(
        await store.read(SecretKeys.providerKey('anthropic')),
        'a-key-value-2',
      );
    });
  });
}
