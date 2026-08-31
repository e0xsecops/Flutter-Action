import 'package:action_app/core/security/secret_redactor.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fake keys, shaped like the real thing but issued by nobody. Never a real
/// credential in a fixture — see docs/v2/AI_SECURITY_THREAT_MODEL.md.
const _openAiKey = 'sk-proj-abcdefghijklmnop1234567890QRSTUV';
const _anthropicKey = 'sk-ant-api03-abcdefghijklmnop1234567890';
const _googleKey = 'AIzaSyA1b2C3d4E5f6G7h8I9j0KlMnOpQrStUv';

void main() {
  group('SecretRedactor.redact', () {
    test('removes an Authorization header value but keeps the header name', () {
      final out = SecretRedactor.redact('Authorization: Bearer $_openAiKey');

      expect(out, contains('Authorization'),
          reason: 'the header name is diagnostically useful and not secret');
      expect(out, isNot(contains(_openAiKey)));
      // One placeholder, not two: the header rule must consume the scheme and
      // the token together rather than leaving the token to a second pass.
      expect(out, equals('Authorization: $redactedPlaceholder'));
    });

    test('removes x-api-key and x-goog-api-key values', () {
      expect(
        SecretRedactor.redact('x-api-key: $_anthropicKey'),
        isNot(contains(_anthropicKey)),
      );
      expect(
        SecretRedactor.redact('x-goog-api-key: $_googleKey'),
        isNot(contains(_googleKey)),
      );
    });

    test('is case-insensitive about header names', () {
      expect(
        SecretRedactor.redact('AUTHORIZATION: Bearer $_openAiKey'),
        isNot(contains(_openAiKey)),
      );
      expect(
        SecretRedactor.redact('X-Api-Key: $_anthropicKey'),
        isNot(contains(_anthropicKey)),
      );
    });

    test('removes a bare Bearer token with no header in front of it', () {
      final out = SecretRedactor.redact('failed with Bearer $_openAiKey oops');
      expect(out, isNot(contains(_openAiKey)));
      expect(out, contains('oops'), reason: 'surrounding text must survive');
    });

    test('removes vendor-shaped keys loose in prose', () {
      // Providers echo request fragments back inside their own error text, so
      // a key can arrive with no header around it at all.
      for (final key in [_openAiKey, _anthropicKey, _googleKey]) {
        final out = SecretRedactor.redact('provider said: invalid key $key.');
        expect(out, isNot(contains(key)), reason: key);
      }
    });

    test('does not leave the tail of a longer prefix behind', () {
      // sk-ant- must be tried before sk-, or the shorter pattern matches first
      // and 'ant-...' survives.
      final out = SecretRedactor.redact(_anthropicKey);
      expect(out, isNot(contains('ant-')));
      expect(out, equals(redactedPlaceholder));
    });

    test('removes an explicitly supplied secret of an unknown shape', () {
      // The whole point of supporting a custom endpoint: Action cannot know
      // what shape someone else's server issues.
      const odd = 'zzz-custom-endpoint-credential-9911';
      final out = SecretRedactor.redact('boom: $odd', also: const [odd]);
      expect(out, isNot(contains(odd)));
    });

    test('ignores a supplied value too short to be a credential', () {
      // Substituting every occurrence of a 3-character string would mangle
      // unrelated text for no security gain.
      final out = SecretRedactor.redact('the cat sat', also: const ['cat']);
      expect(out, equals('the cat sat'));
    });

    test('leaves ordinary text alone', () {
      const text = 'Your policy is due on 18 August 2026. Reference MTR-4471-08.';
      expect(SecretRedactor.redact(text), equals(text));
    });

    test('handles empty input', () {
      expect(SecretRedactor.redact(''), isEmpty);
    });

    test('redacts every key when several appear at once', () {
      final out = SecretRedactor.redact(
        'a=$_openAiKey b=$_anthropicKey c=$_googleKey',
      );
      expect(SecretRedactor.containsSecret(out), isFalse);
    });
  });

  group('SecretRedactor.containsSecret', () {
    test('detects each supported credential shape', () {
      expect(SecretRedactor.containsSecret('Authorization: Bearer x1234567890'),
          isTrue);
      expect(SecretRedactor.containsSecret(_googleKey), isTrue);
      expect(SecretRedactor.containsSecret(_anthropicKey), isTrue);
    });

    test('does not fire on ordinary text', () {
      expect(
        SecretRedactor.containsSecret('Reference MTR-4471-08, due 18 August'),
        isFalse,
      );
    });
  });

  group('SecretRedactor.mask', () {
    test('shows only the tail', () {
      final masked = SecretRedactor.mask('sk-abcdefghijkl4T7K');
      expect(masked, endsWith('4T7K'));
      expect(masked, isNot(contains('abcdefghijkl')));
    });

    test('collapses a short secret entirely rather than exposing most of it', () {
      expect(SecretRedactor.mask('abcd'), isNot(contains('abcd')));
      expect(SecretRedactor.mask('abcd'), equals('••••••••'));
    });

    test('two different keys mask differently so a user can tell them apart', () {
      expect(
        SecretRedactor.mask('sk-aaaaaaaaaaaa1111'),
        isNot(equals(SecretRedactor.mask('sk-aaaaaaaaaaaa2222'))),
      );
    });
  });
}
