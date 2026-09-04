/// Every credential in this file is synthetic. Nothing here is, or has ever
/// been, a working key — the shapes are real because the patterns match on
/// shape, and the contents are deliberately the word EXAMPLE repeated.
library;

import 'package:action_app/core/security/credential_scanner.dart';
import 'package:flutter_test/flutter_test.dart';

/// Shapes that are real, values that are not.
const _anthropic = 'sk-ant-api03-EXAMPLEEXAMPLEEXAMPLEEXAMPLE';
const _openAi = 'sk-EXAMPLE0000EXAMPLE0000EXAMPLE';
const _openAiProject = 'sk-proj-EXAMPLEEXAMPLEEXAMPLE';
const _google = 'AIzaEXAMPLE0000EXAMPLE0000EXAMPLE0000ex';
const _github = 'ghp_EXAMPLE0000EXAMPLE0000EXAMPLE0000ex';
const _aws = 'AKIAEXAMPLE000000000';

List<CredentialKind> _kinds(String text) =>
    CredentialScanner.scan(text).map((f) => f.kind).toList();

void main() {
  group('what it finds', () {
    test('a private key block, including its body', () {
      const text = '''
Here is the deploy key.

-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAEXAMPLEEXAMPLEEXAMPLEEXAMPLEEXAMPLEEXAMPLEEXAMPLE
-----END RSA PRIVATE KEY-----

Use it on the build box.''';

      final findings = CredentialScanner.scan(text);
      final key = findings.singleWhere(
        (f) => f.kind == CredentialKind.privateKeyBlock,
      );

      // The whole block, not just the header line — redacting the marker and
      // leaving the base64 behind would be worse than doing nothing.
      expect(key.value, contains('MIIEpAIBAAKCAQEA'));
      expect(key.value, contains('-----END RSA PRIVATE KEY-----'));
      expect(key.confidence, CredentialConfidence.named);
    });

    test('an unterminated private key block, which is how a paste truncates',
        () {
      const text = '-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQ';

      expect(_kinds(text), contains(CredentialKind.privateKeyBlock));
    });

    test('each vendor key shape, named by vendor', () {
      final labels = {
        _anthropic: 'Anthropic API key',
        _openAi: 'OpenAI-style API key',
        _openAiProject: 'OpenAI project key',
        _google: 'Google API key',
        _github: 'GitHub token',
        _aws: 'AWS access key ID',
      };

      for (final entry in labels.entries) {
        final findings = CredentialScanner.scan('key is ${entry.key} ok');
        expect(
          findings.map((f) => f.label),
          contains(entry.value),
          reason: 'did not recognise ${entry.value}',
        );
      }
    });

    test('a connection string with a password in the authority', () {
      const text = 'DATABASE_URL=postgres://appuser:hunter2@db.internal:5432/x';

      final findings = CredentialScanner.scan(text);
      expect(
        findings.map((f) => f.kind),
        contains(CredentialKind.connectionString),
      );
    });

    test('a JSON Web Token, but not any dotted identifier', () {
      const jwt = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0NTY3ODkwIn0.'
          'EXAMPLEsignatureEXAMPLE';

      expect(_kinds('token: $jwt'), contains(CredentialKind.jsonWebToken));
      // Three dotted segments that are not base64 of `{"` are ordinary text.
      expect(
        _kinds('see com.example.service for details'),
        isNot(contains(CredentialKind.jsonWebToken)),
      );
    });

    test('an authorization header pasted from a terminal', () {
      const text = 'curl -H "Authorization: Bearer $_openAi" https://api.x/v1';

      final findings = CredentialScanner.scan(text);
      expect(
        findings.map((f) => f.kind),
        contains(CredentialKind.authorizationHeader),
      );
    });

    test('a keyed assignment, named for the keyword that gave it away', () {
      final cases = {
        'password = "correct horse battery"': 'Password',
        'API_KEY=abcd1234efgh': 'API key',
        'client_secret: someLongSecretValue': 'Client secret',
        'refresh_token = "0000EXAMPLE0000"': 'Refresh token',
      };

      for (final entry in cases.entries) {
        final findings = CredentialScanner.scan(entry.key);
        expect(
          findings.map((f) => f.label),
          contains(entry.value),
          reason: 'from ${entry.key}',
        );
      }
    });

    test('the assignment finding covers the name as well as the value', () {
      const text = 'api_secret = "abcd1234efgh5678"';
      final finding = CredentialScanner.scan(text).first;

      // Redacting only the value leaves `api_secret = [...]`, which still tells
      // a reader precisely what they have found.
      final cleaned = CredentialScanner.redact(text, [finding]);
      expect(cleaned, isNot(contains('api_secret')));
      expect(cleaned, isNot(contains('abcd1234efgh5678')));
    });
  });

  group('the entropy pass, which is the one that can cry wolf', () {
    test('finds a random-looking token with no keyword to explain it', () {
      const token = 'x7Kq2mP9vB4nR8tL6wZ3yH5jC1dF0gS';

      expect(
        _kinds('the value is $token here'),
        contains(CredentialKind.highEntropyString),
      );
    });

    test('does not flag ordinary prose', () {
      const prose = 'The renewal notice arrived on Tuesday and the deadline is '
          'the twelfth of September, which gives us about two weeks to sort '
          'out the paperwork and send everything back.';

      expect(CredentialScanner.scan(prose), isEmpty);
    });

    test('does not flag a git commit hash', () {
      const sha = 'e8ca23d1f4b9c2a7d3e5f6081920304050607080';

      expect(
        _kinds('at commit $sha we shipped'),
        isNot(contains(CredentialKind.highEntropyString)),
      );
    });

    test('does not flag a long lowercase identifier', () {
      expect(
        _kinds('supercalifragilisticexpialidocious'),
        isNot(contains(CredentialKind.highEntropyString)),
      );
    });

    test('does not flag a long run of digits', () {
      expect(
        _kinds('reference 12345678901234567890123456'),
        isNot(contains(CredentialKind.highEntropyString)),
      );
    });

    test('does not flag a UUID', () {
      expect(
        _kinds('id 550e8400-e29b-41d4-a716-446655440000'),
        isNot(contains(CredentialKind.highEntropyString)),
      );
    });

    test('entropy is measured, not asserted', () {
      // The threshold is only defensible if the numbers behind it are real.
      expect(CredentialScanner.entropyBitsPerChar('aaaaaaaaaa'), 0);
      expect(
        CredentialScanner.entropyBitsPerChar('x7Kq2mP9vB4nR8tL6wZ3yH5jC1dF0gS'),
        greaterThan(3.9),
      );
      expect(
        CredentialScanner.entropyBitsPerChar('the deadline is september'),
        lessThan(3.9),
      );
    });
  });

  group('masking', () {
    test('a masked key is not a usable key', () {
      final finding = CredentialScanner.scan('key $_anthropic').first;

      expect(finding.masked, isNot(contains('EXAMPLEEXAMPLE')));
      expect(finding.masked.length, lessThan(_anthropic.length));
    });

    test('keeps the vendor prefix, because that is the useful part', () {
      final finding = CredentialScanner.scan('key $_anthropic').first;

      expect(finding.masked, startsWith('sk-ant-'));
      expect(finding.masked, endsWith(_anthropic.substring(
        _anthropic.length - 3,
      )));
    });

    test('two keys from one vendor stay distinguishable', () {
      final a = maskCredential('sk-ant-api03-EXAMPLEEXAMPLEaaa');
      final b = maskCredential('sk-ant-api03-EXAMPLEEXAMPLEbbb');

      expect(a, isNot(b));
    });

    test('a short value collapses rather than revealing most of itself', () {
      expect(maskCredential('abc123'), '••••••');
      expect(maskCredential('abc123'), isNot(contains('abc')));
    });

    test('toString never carries the secret', () {
      // The accident this guards against: a finding reaching a log line or an
      // exception message through ordinary string interpolation.
      final finding = CredentialScanner.scan('key $_anthropic').first;

      expect('$finding', isNot(contains('EXAMPLEEXAMPLE')));
      expect('${[finding]}', isNot(contains('EXAMPLEEXAMPLE')));
    });
  });

  group('overlap and ordering', () {
    test('a vendor key inside a header is reported once', () {
      const text = 'Authorization: Bearer $_openAi';

      final findings = CredentialScanner.scan(text);
      expect(findings, hasLength(1));
      expect(findings.single.kind, CredentialKind.authorizationHeader);
    });

    test('a key inside a private key block is not reported separately', () {
      const text = '-----BEGIN PRIVATE KEY-----\n'
          'sk-EXAMPLE0000EXAMPLE0000EXAMPLE\n'
          '-----END PRIVATE KEY-----';

      expect(CredentialScanner.scan(text), hasLength(1));
    });

    test('findings come back in document order', () {
      final text = 'first $_openAi then password = "abcdef123456" '
          'and finally $_google';

      final starts = CredentialScanner.scan(text).map((f) => f.start).toList();
      expect(starts, equals([...starts]..sort()));
    });

    test('several distinct credentials are all found', () {
      final text = '''
OPENAI_KEY=$_openAi
GOOGLE_KEY=$_google
db: postgres://u:p@host/db
''';

      final findings = CredentialScanner.scan(text);
      expect(findings.length, greaterThanOrEqualTo(3));
    });
  });

  group('redaction', () {
    test('removes the selected values and leaves the rest', () {
      final text = 'Contact: help@example.com and key $_openAi thanks';
      final findings = CredentialScanner.scan(text);

      final cleaned = CredentialScanner.redact(text, findings);

      expect(cleaned, isNot(contains(_openAi)));
      expect(cleaned, contains('help@example.com'));
      expect(cleaned, contains('thanks'));
    });

    test('never modifies the original', () {
      final text = 'key $_openAi';
      CredentialScanner.redact(text, CredentialScanner.scan(text));

      expect(text, contains(_openAi));
    });

    test('multiple findings redact without corrupting each other', () {
      final text = 'a $_openAi b $_google c $_github d';
      final findings = CredentialScanner.scan(text);
      expect(findings, hasLength(3));

      final cleaned = CredentialScanner.redact(text, findings);

      for (final secret in [_openAi, _google, _github]) {
        expect(cleaned, isNot(contains(secret)));
      }
      // The surrounding text has to survive intact, or offsets drifted.
      expect(cleaned, startsWith('a '));
      expect(cleaned, endsWith(' d'));
    });

    test('redacting only some leaves the others in place', () {
      final text = 'a $_openAi b $_google c';
      final findings = CredentialScanner.scan(text);

      final cleaned = CredentialScanner.redact(text, [findings.first]);

      expect(cleaned, isNot(contains(_openAi)));
      expect(cleaned, contains(_google));
    });
  });

  group('honesty', () {
    test('no advice claims the content is safe or clean', () {
      final text = '''
$_anthropic
$_google
password = "abcdef123456"
postgres://u:p@h/d
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCEXAMPLE
-----END PRIVATE KEY-----
''';

      for (final finding in CredentialScanner.scan(text)) {
        final advice = finding.advice.toLowerCase();
        for (final banned in ['guaranteed', 'completely safe', 'unhackable']) {
          expect(advice, isNot(contains(banned)));
        }
        expect(finding.advice, isNotEmpty);
      }
    });

    test('a key finding says removing it is not the same as revoking it', () {
      final finding = CredentialScanner.scan('k $_anthropic').first;

      // The single most common mistake after a leak.
      expect(finding.advice.toLowerCase(), contains('revoke'));
    });

    test('empty and whitespace input find nothing rather than throwing', () {
      expect(CredentialScanner.scan(''), isEmpty);
      expect(CredentialScanner.scan('   \n\t '), isEmpty);
    });
  });
}
