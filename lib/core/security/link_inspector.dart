/// Reads a URL and reports what is observable about it.
///
/// **The rule this file exists to enforce: never say "safe".** Every signal
/// below is a structural fact about the string — it has no scheme, the host is
/// an IP address, there is a password in the authority. None of them is
/// evidence of intent, and none of their absences is evidence of safety. A
/// phishing page served over HTTPS from a short, plain, correctly-spelled
/// hostname produces zero signals here, and that is not a defect: it is the
/// honest limit of what can be known without fetching the page, and a product
/// that printed "Safe ✓" over it would be actively dangerous.
///
/// So [LinkVerdict] has no `safe` member, the copy says "no obvious signals",
/// and the tests assert that the word "safe" appears nowhere in any string this
/// file can produce.
///
/// **Local and offline.** Nothing here resolves DNS, follows a redirect, or
/// contacts a reputation service. Inspecting a link by sending it somewhere
/// would leak the very browsing the user is being careful about. If a network
/// check is ever added it must be an explicit, per-link action with its own
/// disclosure — see `docs/v2/AI_SECURITY_THREAT_MODEL.md`.
library;

/// One observable property of a URL.
///
/// Named for what was *seen*, not for what it might mean. `ipLiteralHost` is a
/// fact; "suspicious" would be an opinion.
enum LinkSignal {
  /// No transport security. Anything typed into the page is readable in
  /// transit.
  notHttps,

  /// A scheme that does not fetch a document at all.
  nonWebScheme,

  /// `https://user:password@host` — the credential is in the link.
  embeddedCredentials,

  /// The authority contains an `@`, so the part a reader scans first is not the
  /// host. The classic deceptive-URL construction.
  misleadingAuthority,

  /// The host is a raw address rather than a name.
  ipLiteralHost,

  /// An internationalised domain, encoded. It may be entirely legitimate; it is
  /// also how a homograph is transported.
  punycodeHost,

  /// The host mixes scripts — Latin letters alongside Cyrillic or Greek ones
  /// that look identical to them.
  mixedScriptHost,

  /// A port that is not the default for the scheme.
  unusualPort,

  /// Many labels deep. Depth is how `login.bank.com.attacker.net` hides.
  deepSubdomain,

  /// Something that looks like a public suffix appears as a *subdomain*, so the
  /// familiar part of the name is not the part that controls the site.
  publicSuffixInSubdomain,

  /// An unusually long host or URL — length is what makes the real destination
  /// scroll off the end of an address bar.
  veryLongUrl,

  /// A query parameter whose value is itself a URL.
  redirectParameter,

  /// The path ends in something a browser will offer to install or run.
  executableTarget,

  /// A known link-shortening domain: the destination cannot be read from the
  /// link at all.
  shortener,

  /// Percent-escapes inside the host, which is not where they belong.
  encodedHost,

  /// The string did not parse as a URL.
  unparseable,
}

/// How much attention the signals collectively deserve.
///
/// Note the absence of a positive verdict. See the library comment.
enum LinkVerdict {
  /// Nothing structural stood out. Not a clean bill of health.
  noObviousSignals,

  /// Worth a second look before opening.
  worthChecking,

  /// Several signals, or one strong one.
  treatWithCaution,
}

String describeLinkVerdict(LinkVerdict verdict) => switch (verdict) {
      LinkVerdict.noObviousSignals => 'No obvious signals',
      LinkVerdict.worthChecking => 'Worth checking',
      LinkVerdict.treatWithCaution => 'Treat with caution',
    };

/// Whether a signal alone justifies caution.
enum LinkSignalWeight { note, caution }

/// One finding about a link.
class LinkObservation {
  const LinkObservation({
    required this.signal,
    required this.weight,
    required this.summary,
    required this.detail,
  });

  final LinkSignal signal;
  final LinkSignalWeight weight;

  /// A few words, for a chip or a row title.
  final String summary;

  /// A sentence saying what was seen and why it is worth knowing. Never says
  /// the link is dangerous, because that is not knowable from here.
  final String detail;
}

/// The result of reading one link.
class LinkInspection {
  const LinkInspection({
    required this.input,
    required this.observations,
    this.host,
    this.scheme,
    this.displayUrl,
  });

  final String input;
  final List<LinkObservation> observations;

  /// The host as written, when it parsed. Shown prominently, because the host
  /// is the only part of a URL that decides where the request goes.
  final String? host;
  final String? scheme;

  /// The link with any embedded credential masked, for display. Rendering the
  /// raw string would put a password on screen.
  final String? displayUrl;

  bool get hasCaution =>
      observations.any((o) => o.weight == LinkSignalWeight.caution);

  LinkVerdict get verdict {
    if (hasCaution) return LinkVerdict.treatWithCaution;
    if (observations.length >= 2) return LinkVerdict.treatWithCaution;
    if (observations.isNotEmpty) return LinkVerdict.worthChecking;
    return LinkVerdict.noObviousSignals;
  }

  /// The sentence shown under the verdict.
  ///
  /// The clear case is the one that has to be worded most carefully: it is
  /// where a user is most likely to read reassurance that was never offered.
  String get summary => switch (verdict) {
        LinkVerdict.noObviousSignals =>
          'Nothing unusual in how this link is written. That is not the same '
              'as knowing the page is trustworthy — only you can judge whether '
              'you expected it.',
        LinkVerdict.worthChecking =>
          'One thing about this link is worth a look before you open it.',
        LinkVerdict.treatWithCaution =>
          'Several things about how this link is written are worth checking '
              'before you open it.',
      };
}

abstract final class LinkInspector {
  /// Beyond this, the destination scrolls out of any address bar.
  static const _longUrl = 200;
  static const _longHost = 60;
  static const _deepSubdomain = 4;

  static const _defaultPorts = <String, int>{
    'http': 80,
    'https': 443,
    'ftp': 21,
    'ws': 80,
    'wss': 443,
  };

  /// Public suffixes common enough that seeing one *inside* a hostname is a
  /// deliberate construction rather than a coincidence.
  ///
  /// Not a full public-suffix list, and not trying to be: this is looking for
  /// `paypal.com.secure-login.example`, where the giveaway is `.com.` sitting
  /// in the middle. A complete PSL would make this no more accurate at that
  /// job and would need shipping and updating.
  static const _publicSuffixes = <String>[
    'com', 'org', 'net', 'gov', 'edu', 'co', 'io', 'app', 'dev', //
  ];

  static const _shorteners = <String>[
    'bit.ly', 'tinyurl.com', 't.co', 'goo.gl', 'ow.ly', 'is.gd', 'buff.ly',
    'rebrand.ly', 'cutt.ly', 'shorturl.at', 'tiny.cc', 'lnkd.in', 'rb.gy',
  ];

  static const _executableExtensions = <String>[
    '.apk', '.exe', '.msi', '.scr', '.bat', '.cmd', '.jar', '.dmg', '.pkg',
    '.deb', '.appimage', '.vbs', '.ps1', '.sh',
  ];

  static const _redirectParameters = <String>[
    'url', 'redirect', 'redirect_uri', 'redirect_url', 'next', 'target',
    'dest', 'destination', 'continue', 'return', 'returnurl', 'r', 'u',
  ];

  /// Scripts whose letters include shapes indistinguishable from Latin ones.
  static final _cyrillicOrGreek = RegExp(r'[Ͱ-ϿЀ-ӿ]');
  static final _latinLetter = RegExp('[a-zA-Z]');
  static final _ipv4 = RegExp(r'^\d{1,3}(?:\.\d{1,3}){3}$');

  /// Inspects [input] and returns everything observable about it.
  ///
  /// Never throws. An unparseable string is a finding, not an error — the user
  /// pasted something and deserves an answer either way.
  static LinkInspection inspect(String input) {
    final trimmed = input.trim();
    final observations = <LinkObservation>[];

    if (trimmed.isEmpty) {
      return LinkInspection(
        input: input,
        observations: const [],
      );
    }

    // A bare `example.com` is a URL to a human. Parsing it without a scheme
    // would put the whole string in `path` and every host check would silently
    // pass, which is the worst possible failure mode for this file.
    final declaredScheme =
        RegExp(r'^([a-z][a-z0-9+.-]*):', caseSensitive: false)
            .firstMatch(trimmed)
            ?.group(1)
            ?.toLowerCase();
    final candidate = declaredScheme == null ? 'https://$trimmed' : trimmed;

    // Answered before parsing, because `javascript:alert(1)` and `tel:+44…`
    // have no host at all — they would fall into the unparseable branch below
    // and be reported as "not a readable link", which is both wrong and less
    // useful than naming the scheme. Every host-shaped check further down is
    // meaningless for these, so this returns rather than falling through.
    if (declaredScheme != null &&
        declaredScheme != 'http' &&
        declaredScheme != 'https') {
      return LinkInspection(
        input: input,
        scheme: declaredScheme,
        displayUrl: trimmed,
        observations: [
          LinkObservation(
            signal: LinkSignal.nonWebScheme,
            weight: LinkSignalWeight.caution,
            summary: 'Not a web link',
            detail: 'This opens with "$declaredScheme:" rather than a web '
                'page. It may ask another app to do something.',
          ),
        ],
      );
    }

    Uri? uri;
    try {
      uri = Uri.parse(candidate);
    } on FormatException {
      uri = null;
    }

    if (uri == null || uri.host.isEmpty) {
      return LinkInspection(
        input: input,
        observations: [
          const LinkObservation(
            signal: LinkSignal.unparseable,
            weight: LinkSignalWeight.caution,
            summary: 'Not a readable link',
            detail: 'Action could not read this as a web address. Be careful '
                'with links that do not look like links.',
          ),
        ],
      );
    }

    final scheme = uri.scheme.toLowerCase();

    // The host *as the user typed it*, not as `Uri` normalised it.
    //
    // This distinction is the whole homograph check. `Uri.parse` percent-
    // encodes non-ASCII characters in the authority, so by the time it reaches
    // `uri.host` a Cyrillic "а" has become "%D0%B0" — the mixed-script test
    // can never fire, and the escaped-characters test fires on every
    // internationalised domain instead. Reading the raw string keeps both
    // checks answering the question they were written for.
    final host = _rawHost(candidate) ?? uri.host.toLowerCase();

    if (scheme == 'http') {
      observations.add(const LinkObservation(
        signal: LinkSignal.notHttps,
        weight: LinkSignalWeight.caution,
        summary: 'Not encrypted',
        detail: 'This link uses http, so anything you type into the page can '
            'be read on the way there.',
      ));
    }

    if (uri.userInfo.isNotEmpty) {
      final hasPassword = uri.userInfo.contains(':');
      observations.add(LinkObservation(
        signal: hasPassword
            ? LinkSignal.embeddedCredentials
            : LinkSignal.misleadingAuthority,
        weight: LinkSignalWeight.caution,
        summary: hasPassword ? 'Password in the link' : 'Hidden real address',
        detail: hasPassword
            ? 'A username and password are written into this link. Anywhere it '
                'is shared, they go with it.'
            : 'Everything before the "@" is ignored by the browser. The real '
                'destination is "$host".',
      ));
    }

    if (_ipv4.hasMatch(host) || host.startsWith('[')) {
      observations.add(LinkObservation(
        signal: LinkSignal.ipLiteralHost,
        weight: LinkSignalWeight.caution,
        summary: 'Numeric address',
        detail: 'This goes to "$host" — a raw address rather than a name. '
            'Legitimate sites almost always use a name.',
      ));
    }

    if (host.split('.').any((label) => label.startsWith('xn--'))) {
      observations.add(const LinkObservation(
        signal: LinkSignal.punycodeHost,
        weight: LinkSignalWeight.caution,
        summary: 'Encoded characters in the name',
        detail: 'The site name contains non-Latin characters, stored encoded. '
            'This is normal for many languages, and it is also how a name can '
            'be made to look like a familiar one.',
      ));
    }

    if (_cyrillicOrGreek.hasMatch(host) && _latinLetter.hasMatch(host)) {
      observations.add(const LinkObservation(
        signal: LinkSignal.mixedScriptHost,
        weight: LinkSignalWeight.caution,
        summary: 'Mixed alphabets in the name',
        detail: 'The site name mixes Latin letters with letters from another '
            'alphabet that look the same. Read it character by character.',
      ));
    }

    if (host.contains('%')) {
      observations.add(const LinkObservation(
        signal: LinkSignal.encodedHost,
        weight: LinkSignalWeight.caution,
        summary: 'Escaped characters in the name',
        detail: 'The site name contains escape codes, which is not where they '
            'belong. They can hide what the name actually says.',
      ));
    }

    final port = uri.hasPort ? uri.port : null;
    if (port != null && port != _defaultPorts[scheme]) {
      observations.add(LinkObservation(
        signal: LinkSignal.unusualPort,
        weight: LinkSignalWeight.note,
        summary: 'Unusual port',
        detail: 'This connects on port $port rather than the usual one. That '
            'is common for test servers and unusual for public sites.',
      ));
    }

    final labels = host.split('.');
    if (labels.length > _deepSubdomain) {
      observations.add(LinkObservation(
        signal: LinkSignal.deepSubdomain,
        weight: LinkSignalWeight.note,
        summary: 'Many parts in the name',
        detail: 'The name has ${labels.length} parts. Only the last two decide '
            'who runs the site; the rest can be set to anything.',
      ));
    }

    // A public suffix anywhere but the end.
    if (labels.length > 2) {
      final inner = labels.sublist(0, labels.length - 2);
      final planted = inner.where(_publicSuffixes.contains).toList();
      if (planted.isNotEmpty) {
        final real = labels.length >= 2
            ? labels.sublist(labels.length - 2).join('.')
            : host;
        observations.add(LinkObservation(
          signal: LinkSignal.publicSuffixInSubdomain,
          weight: LinkSignalWeight.caution,
          summary: 'Familiar name in the wrong place',
          detail: 'This name contains ".${planted.first}." in the middle, '
              'which makes the beginning look like the site. The site is '
              'actually "$real".',
        ));
      }
    }

    if (_shorteners.contains(host) ||
        (labels.length >= 2 &&
            _shorteners.contains(labels.sublist(labels.length - 2).join('.')))) {
      observations.add(const LinkObservation(
        signal: LinkSignal.shortener,
        weight: LinkSignalWeight.note,
        summary: 'Shortened link',
        detail: 'A shortening service hides the real destination. You cannot '
            'tell where this goes without opening it.',
      ));
    }

    final path = uri.path.toLowerCase();
    final executable =
        _executableExtensions.where((ext) => path.endsWith(ext)).firstOrNull;
    if (executable != null) {
      observations.add(LinkObservation(
        signal: LinkSignal.executableTarget,
        weight: LinkSignalWeight.caution,
        summary: 'Downloads a program',
        detail: 'This link ends in "$executable", so it downloads something '
            'that can run on your device rather than a page to read.',
      ));
    }

    final redirect = uri.queryParameters.entries
        .where((e) =>
            _redirectParameters.contains(e.key.toLowerCase()) &&
            _looksLikeUrl(e.value))
        .firstOrNull;
    if (redirect != null) {
      observations.add(LinkObservation(
        signal: LinkSignal.redirectParameter,
        weight: LinkSignalWeight.note,
        summary: 'Sends you on somewhere else',
        detail: 'This link carries a second address in its "${redirect.key}" '
            'setting, so opening it may take you somewhere other than "$host".',
      ));
    }

    if (trimmed.length > _longUrl || host.length > _longHost) {
      observations.add(const LinkObservation(
        signal: LinkSignal.veryLongUrl,
        weight: LinkSignalWeight.note,
        summary: 'Very long',
        detail: 'Long links are harder to read, and the part that decides the '
            'destination can be pushed out of sight.',
      ));
    }

    return LinkInspection(
      input: input,
      observations: observations,
      host: host,
      scheme: scheme,
      displayUrl: _forDisplay(uri, hadScheme: declaredScheme != null),
    );
  }

  /// The host exactly as written, lowercased, with any userinfo and port
  /// removed. Null when the string has no authority.
  ///
  /// Deliberately hand-parsed rather than taken from [Uri] — see the call site
  /// for why the normalised host is the wrong input for the script checks.
  static String? _rawHost(String candidate) {
    final authority =
        RegExp(r'^[a-z][a-z0-9+.-]*://([^/?#]*)', caseSensitive: false)
            .firstMatch(candidate)
            ?.group(1);
    if (authority == null || authority.isEmpty) return null;

    var host = authority;
    final at = host.lastIndexOf('@');
    if (at >= 0) host = host.substring(at + 1);

    // An IPv6 literal keeps its brackets and its internal colons; anything
    // else loses a trailing `:port`.
    if (host.startsWith('[')) {
      final close = host.indexOf(']');
      if (close > 0) host = host.substring(0, close + 1);
    } else {
      final colon = host.lastIndexOf(':');
      if (colon >= 0) host = host.substring(0, colon);
    }

    return host.isEmpty ? null : host.toLowerCase();
  }

  static bool _looksLikeUrl(String value) {
    final decoded = Uri.decodeComponent(value);
    return RegExp(r'^(?:https?:)?//', caseSensitive: false).hasMatch(decoded) ||
        RegExp(r'^[\w-]+(?:\.[\w-]+){1,}/').hasMatch(decoded);
  }

  /// The link with any credential replaced. Never render the raw input.
  static String _forDisplay(Uri uri, {required bool hadScheme}) {
    final shown = uri.userInfo.isEmpty
        ? uri
        : uri.replace(userInfo: uri.userInfo.contains(':') ? '•••:•••' : '•••');
    final text = shown.toString();
    // Strip the scheme this file added, so the user sees what they pasted.
    if (!hadScheme && text.startsWith('https://')) {
      return text.substring('https://'.length);
    }
    return text;
  }
}
