/// The two local VERIFY tools added at V2, driven through the tool interface.
///
/// The scanners themselves are covered exhaustively in test/security/. What is
/// tested here is the layer above: that a tool produces a usable result, keeps
/// the secret masked on the way to the screen, and never says a link is safe.
///
/// Every credential below is synthetic.
library;

import 'package:action_app/features/intelligence/data/tools/verify_tools.dart';
import 'package:action_app/features/intelligence/domain/ai_request.dart';
import 'package:action_app/features/intelligence/domain/intelligence_result.dart';
import 'package:action_app/features/intelligence/domain/intelligence_tool.dart';
import 'package:flutter_test/flutter_test.dart';

const _openAiKey = 'sk-EXAMPLE0000EXAMPLE0000EXAMPLE';

IntelligenceRunInput _text(String text) =>
    IntelligenceRunInput(parts: const [], freeText: text);

IntelligenceRunInput _source(String text) => IntelligenceRunInput(
      parts: [AiSourceTextPart(text: text, sourceId: 's1')],
    );

/// Every string a result puts on screen, flattened.
List<String> _allText(IntelligenceResult result) => [
      for (final section in result.sections) ...[
        section.title,
        ?section.body,
        ...section.bullets,
        for (final fact in section.facts) ...[fact.label, fact.value],
      ],
      for (final warning in result.warnings) warning.message,
      for (final artifact in result.artifacts) artifact.text,
    ];

void main() {
  group('the credential scanner tool', () {
    const strategy = CredentialScanStrategy();

    test('is registered as local and needs no provider', () {
      expect(credentialScannerTool.isLocal, isTrue);
      expect(credentialScannerTool.localStrategy, isNotNull);
      expect(
        credentialScannerTool.privacyLevel,
        IntelligencePrivacyLevel.local,
      );
    });

    test('says so when there is nothing to read', () async {
      final result = await strategy.run(_text('   '));

      expect(result.sections.single.title, 'Nothing to check');
    });

    test('finds a key and names the vendor', () async {
      final result = await strategy.run(_text('OPENAI_KEY=$_openAiKey'));

      expect(_allText(result), contains('1 credential found'));
    });

    test('never puts the whole secret on screen', () async {
      // The situation that brought the user here is that they are about to
      // share this text. Rendering the key in full would be remarkable.
      final result = await strategy.run(_text('key: $_openAiKey'));

      for (final section in result.sections) {
        for (final fact in section.facts) {
          expect(fact.value, isNot(contains(_openAiKey)));
        }
        expect(section.body ?? '', isNot(contains(_openAiKey)));
        for (final bullet in section.bullets) {
          expect(bullet, isNot(contains(_openAiKey)));
        }
      }
      for (final warning in result.warnings) {
        expect(warning.message, isNot(contains(_openAiKey)));
      }
    });

    test('the cleaned artifact really has the credential removed', () async {
      final result = await strategy.run(_text('key: $_openAiKey rest'));
      final artifact = result.artifacts.single;

      expect(artifact.text, isNot(contains(_openAiKey)));
      expect(artifact.text, contains('rest'));
    });

    test('separates what it knows from what it guessed', () async {
      final result = await strategy.run(
        _text('key $_openAiKey and blob x7Kq2mP9vB4nR8tL6wZ3yH5jC1dF0gS'),
      );
      final titles = result.sections.map((s) => s.title).toList();

      expect(titles, contains('1 credential found'));
      expect(titles, contains('1 thing that might be a secret'));
    });

    test('a guessed finding is marked uncertain', () async {
      final result =
          await strategy.run(_text('x7Kq2mP9vB4nR8tL6wZ3yH5jC1dF0gS'));
      final section = result.sections
          .firstWhere((s) => s.title.contains('might be'));

      expect(section.facts.single.uncertain, isTrue);
    });

    test('a clean document is reported as clean, with the limit attached',
        () async {
      final result = await strategy.run(
        _text('The renewal notice arrived on Tuesday and is due on the 12th.'),
      );

      expect(result.sections.single.title, 'No credentials found');
      // The coverage limit travels with the answer rather than sitting in a
      // help page — a clean result is where it is most likely to be over-read.
      expect(
        result.warnings.map((w) => w.message).join(' '),
        contains('will not be found'),
      );
    });

    test('says that removing a key is not the same as revoking it', () async {
      final result = await strategy.run(_text('key: $_openAiKey'));

      expect(
        result.warnings.map((w) => w.message).join(' '),
        contains('does not disable it'),
      );
    });

    test('reads a source as well as typed text', () async {
      final result = await strategy.run(_source('config: $_openAiKey'));

      expect(_allText(result), contains('1 credential found'));
    });
  });

  group('the link inspector tool', () {
    const strategy = LinkInspectionStrategy();

    test('is registered as local, and cannot be shared onward', () {
      expect(linkInspectorTool.isLocal, isTrue);
      // Sharing a report about someone's link is not a thing this tool offers.
      expect(linkInspectorTool.allowsShare, isFalse);
    });

    test('says so when there is no link', () async {
      final result = await strategy.run(_text('no addresses in this sentence'));

      expect(result.sections.single.title, 'No links found');
    });

    test('finds a link in ordinary prose and reports the host', () async {
      final result = await strategy.run(
        _text('Pay at https://billing.example.com/invoice before Friday.'),
      );

      expect(_allText(result), contains('billing.example.com'));
    });

    test('trailing punctuation is not treated as part of the address',
        () async {
      final result =
          await strategy.run(_text('See https://example.com/page.'));

      expect(_allText(result), contains('example.com'));
    });

    test('reports the signals on a deceptive address', () async {
      final result = await strategy.run(
        _text('https://secure.yourbank.com.login-verify.example.net/account'),
      );
      final text = _allText(result).join(' ');

      expect(text, contains('example.net'));
      expect(text, contains('Treat with caution'));
    });

    test('duplicate links are inspected once', () async {
      final result = await strategy.run(
        _text('https://example.com and again https://example.com'),
      );
      final section = result.sections.first;

      expect(section.title, 'The link in this text');
      expect(section.facts, hasLength(1));
    });

    test('a long document cannot produce unbounded rows', () async {
      final many = List.generate(50, (i) => 'https://site$i.example.com')
          .join(' ');
      final result = await strategy.run(_text(many));

      expect(result.sections.first.facts.length, lessThanOrEqualTo(12));
    });

    test('a clean set of links withholds reassurance in as many words',
        () async {
      final result = await strategy.run(_text('https://example.com'));
      final text = _allText(result).join(' ');

      expect(text, contains('not the same as knowing'));
    });

    test('nothing it produces says a link is safe', () async {
      // The rule the whole area enforces, asserted at the tool layer too —
      // a result is assembled from several sources and any of them could have
      // introduced the word.
      final samples = [
        'https://example.com',
        'http://192.168.0.1/setup',
        'https://admin:hunter2@example.com',
        'https://bit.ly/abc and https://example.com/x.apk',
        'https://a.b.c.d.e.example.com:9999/x?url=https://y.example.net',
      ];

      for (final sample in samples) {
        final result = await strategy.run(_text(sample));
        for (final text in _allText(result)) {
          final lower = text.toLowerCase();
          expect(lower, isNot(contains('is safe')), reason: sample);
          expect(lower, isNot(contains('malicious')), reason: sample);
          expect(lower, isNot(contains('trusted')), reason: sample);
        }
      }
    });

    test('states that it does not open or look up anything', () async {
      final result = await strategy.run(_text('https://example.com'));

      expect(
        result.warnings.map((w) => w.message).join(' '),
        contains('does not open the link'),
      );
    });
  });
}
