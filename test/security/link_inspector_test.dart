import 'package:action_app/core/security/link_inspector.dart';
import 'package:flutter_test/flutter_test.dart';

List<LinkSignal> _signals(String url) =>
    LinkInspector.inspect(url).observations.map((o) => o.signal).toList();

void main() {
  group('the signals it reads', () {
    test('http is reported as not encrypted', () {
      expect(
        _signals('http://example.com/login'),
        contains(LinkSignal.notHttps),
      );
    });

    test('https on its own produces nothing', () {
      expect(LinkInspector.inspect('https://example.com/page').observations,
          isEmpty);
    });

    test('a credential in the authority', () {
      final inspection =
          LinkInspector.inspect('https://admin:hunter2@intranet.example.com');

      expect(
        inspection.observations.map((o) => o.signal),
        contains(LinkSignal.embeddedCredentials),
      );
    });

    test('a username with no password is the deceptive-authority shape', () {
      final signals = _signals('https://www.yourbank.com@attacker.example.net');

      expect(signals, contains(LinkSignal.misleadingAuthority));
      // And the observation has to name where it actually goes, because that
      // is the entire point of surfacing it.
      final observation = LinkInspector.inspect(
        'https://www.yourbank.com@attacker.example.net',
      ).observations.firstWhere(
            (o) => o.signal == LinkSignal.misleadingAuthority,
          );
      expect(observation.detail, contains('attacker.example.net'));
    });

    test('a numeric host', () {
      expect(
        _signals('http://192.168.10.44/setup'),
        contains(LinkSignal.ipLiteralHost),
      );
    });

    test('a punycode label', () {
      expect(
        _signals('https://xn--80ak6aa92e.com'),
        contains(LinkSignal.punycodeHost),
      );
    });

    test('a host mixing Latin and Cyrillic letters', () {
      // The `а` here is U+0430, not the ASCII letter.
      expect(
        _signals('https://exаmple.com'),
        contains(LinkSignal.mixedScriptHost),
      );
    });

    test('a non-default port', () {
      expect(
        _signals('https://example.com:8443/app'),
        contains(LinkSignal.unusualPort),
      );
      expect(
        _signals('https://example.com:443/app'),
        isNot(contains(LinkSignal.unusualPort)),
      );
    });

    test('a public suffix planted in a subdomain', () {
      final inspection = LinkInspector.inspect(
        'https://secure.yourbank.com.login-verify.example.net/account',
      );
      final observation = inspection.observations.firstWhere(
        (o) => o.signal == LinkSignal.publicSuffixInSubdomain,
      );

      // It must say what the site *actually* is, not merely that something is
      // odd — the correction is the useful half.
      expect(observation.detail, contains('example.net'));
    });

    test('an ordinary deep subdomain is a note, not a caution', () {
      final inspection =
          LinkInspector.inspect('https://a.b.c.d.example.com/thing');
      final observation = inspection.observations.firstWhere(
        (o) => o.signal == LinkSignal.deepSubdomain,
      );

      expect(observation.weight, LinkSignalWeight.note);
    });

    test('a known shortener', () {
      expect(_signals('https://bit.ly/3xYzAbc'), contains(LinkSignal.shortener));
    });

    test('a link that downloads a program', () {
      final signals = _signals('https://files.example.com/update.apk');

      expect(signals, contains(LinkSignal.executableTarget));
    });

    test('a redirect parameter carrying another address', () {
      expect(
        _signals('https://example.com/go?url=https://elsewhere.example.net'),
        contains(LinkSignal.redirectParameter),
      );
    });

    test('a query parameter that is not a URL is not a redirect', () {
      expect(
        _signals('https://example.com/search?u=cheese'),
        isNot(contains(LinkSignal.redirectParameter)),
      );
    });

    test('a non-web scheme', () {
      expect(
        _signals('javascript:alert(1)'),
        contains(LinkSignal.nonWebScheme),
      );
      expect(_signals('tel:+441234567890'), contains(LinkSignal.nonWebScheme));
    });

    test('a very long URL', () {
      final long = 'https://example.com/${'a' * 250}';

      expect(_signals(long), contains(LinkSignal.veryLongUrl));
    });
  });

  group('parsing', () {
    test('a bare hostname is treated as a link, not as a path', () {
      // The failure this guards against is silent: parsed without a scheme,
      // `example.com` lands entirely in `path`, `host` is empty, and every
      // host check passes vacuously.
      final inspection = LinkInspector.inspect('example.com/page');

      expect(inspection.host, 'example.com');
      expect(inspection.observations, isEmpty);
    });

    test('a bare host that is a shortener is still caught', () {
      expect(_signals('bit.ly/3xYzAbc'), contains(LinkSignal.shortener));
    });

    test('the display form drops a scheme it added itself', () {
      expect(LinkInspector.inspect('example.com').displayUrl, 'example.com');
    });

    test('something unreadable is a finding, not an exception', () {
      final inspection = LinkInspector.inspect('::::');

      expect(
        inspection.observations.map((o) => o.signal),
        contains(LinkSignal.unparseable),
      );
    });

    test('empty input returns nothing and does not throw', () {
      expect(LinkInspector.inspect('').observations, isEmpty);
      expect(LinkInspector.inspect('   ').observations, isEmpty);
    });

    test('surrounding whitespace is ignored', () {
      expect(LinkInspector.inspect('  https://example.com  ').host,
          'example.com');
    });
  });

  group('display never leaks the credential it just warned about', () {
    test('a password in the link is masked in the display form', () {
      final inspection =
          LinkInspector.inspect('https://admin:hunter2@example.com/x');

      expect(inspection.displayUrl, isNot(contains('hunter2')));
      expect(inspection.displayUrl, contains('example.com'));
    });
  });

  group('the verdict, and what it refuses to say', () {
    test('no signals is "no obvious signals", never "safe"', () {
      final inspection = LinkInspector.inspect('https://example.com');

      expect(inspection.verdict, LinkVerdict.noObviousSignals);
      expect(describeLinkVerdict(inspection.verdict).toLowerCase(),
          isNot(contains('safe')));
    });

    test('the clear-case summary explicitly withholds reassurance', () {
      final summary = LinkInspector.inspect('https://example.com').summary;

      // This sentence is the one a user is most likely to over-read.
      expect(summary, contains('not the same as'));
    });

    test('one caution is enough to raise the verdict', () {
      final inspection = LinkInspector.inspect('http://example.com');

      expect(inspection.hasCaution, isTrue);
      expect(inspection.verdict, LinkVerdict.treatWithCaution);
    });

    test('one note alone is only worth checking', () {
      final inspection = LinkInspector.inspect('https://bit.ly/3xYzAbc');

      expect(inspection.verdict, LinkVerdict.worthChecking);
    });

    test('two notes together escalate', () {
      final inspection =
          LinkInspector.inspect('https://a.b.c.d.example.com:8443/x');

      expect(inspection.observations.length, greaterThanOrEqualTo(2));
      expect(inspection.verdict, LinkVerdict.treatWithCaution);
    });

    test('no verdict, summary or observation ever says a link is safe', () {
      // The rule the whole file exists to enforce, asserted over every string
      // it can produce rather than over the ones that happen to be on screen.
      const urls = [
        'https://example.com',
        'http://example.com',
        'https://admin:pw@example.com',
        'https://192.168.0.1',
        'https://xn--80ak6aa92e.com',
        'https://bit.ly/abc',
        'https://example.com/x.apk',
        'https://a.b.c.d.e.example.com:9999/x?url=https://y.example.net',
        'javascript:alert(1)',
        '::::',
      ];

      for (final url in urls) {
        final inspection = LinkInspector.inspect(url);
        final strings = <String>[
          inspection.summary,
          describeLinkVerdict(inspection.verdict),
          for (final o in inspection.observations) ...[o.summary, o.detail],
        ];

        for (final text in strings) {
          final lower = text.toLowerCase();
          expect(lower, isNot(contains('is safe')), reason: url);
          expect(lower, isNot(contains('safe to open')), reason: url);
          expect(lower, isNot(contains('malicious')), reason: url);
          expect(lower, isNot(contains('phishing')), reason: url);
          expect(lower, isNot(contains('verified')), reason: url);
          expect(lower, isNot(contains('trusted')), reason: url);
        }
      }
    });

    test('it does not resolve, fetch or follow anything', () {
      // There is no network in a unit test, so a hostname that cannot exist is
      // the check: if inspection ever started resolving, this would hang or
      // throw rather than return.
      final inspection = LinkInspector.inspect(
        'https://this-host-does-not-exist.invalid/page',
      );

      expect(inspection.host, 'this-host-does-not-exist.invalid');
      expect(inspection.observations, isEmpty);
    });
  });
}
