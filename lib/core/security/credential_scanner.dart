/// Finds credentials in text the user is about to hand to someone else.
///
/// **How this differs from the two scanners already here, because three
/// overlapping scanners would be a design smell if they were not each answering
/// a different question.**
///
/// - [SecretRedactor] is a *sink*. It runs on the way out — into a log, a crash
///   report, an error message — and its job is to destroy credentials silently
///   and idempotently. It reports nothing, because nobody is reading.
/// - `SensitiveScanner` finds *personal* data: an email address, a card number,
///   a postcode. Things that identify a person.
/// - This finds *credentials*: things that grant access. It reports rather than
///   scrubs, with positions and a masked preview, because a human is going to
///   look at the list and decide.
///
/// The distinction matters at the product level too. Leaking your own postcode
/// is embarrassing; leaking a live deployment key is an incident. They deserve
/// different words and a different urgency, so they are different tools.
///
/// **Why this is defensive.** The user is about to paste a config file into a
/// chat, or share a screenshot of a terminal, or send a document to an AI
/// provider. Every one of those is a routine action that quietly exfiltrates a
/// key several times a year in real organisations. Catching it needs no model,
/// no network and no provider — which is the whole reason it can be trusted to
/// run on content the user has not decided to send anywhere yet.
///
/// **What it is not.** Not exhaustive, and it says so. Pattern matching finds
/// structured credentials well and unstructured ones badly. A password written
/// as prose in a sentence will not be found. The UI must never present a clean
/// result as proof that there is nothing here.
library;

import 'dart:math' as math;

/// What kind of credential was found.
///
/// Ordered roughly by how bad it is to leak, which is also the order the
/// patterns are tried in so the most specific description claims a span.
enum CredentialKind {
  /// A private key block. The worst thing on this list: it is the key itself,
  /// not a token derived from it, and it usually cannot be rotated quietly.
  privateKeyBlock,

  /// A key issued by a provider Action itself talks to, or another well-known
  /// vendor. Recognisable by prefix, so this has very few false positives.
  providerApiKey,

  /// `postgres://user:password@host` and relatives. Carries a credential *and*
  /// the address it opens.
  connectionString,

  /// A JSON Web Token. Often short-lived, occasionally not.
  jsonWebToken,

  /// An `Authorization:` or `X-API-Key:` header line, usually pasted from a
  /// terminal or a network inspector.
  authorizationHeader,

  /// `password = "..."`, `api_key: ...`, `SECRET_TOKEN=...`. The keyword is
  /// what makes this a finding; the value alone would be unremarkable.
  keyedAssignment,

  /// A long, random-looking string with no keyword to explain it. The weakest
  /// signal here, and deliberately last.
  highEntropyString,
}

/// The kind's name, in canonical English.
///
/// This is the string the domain tests, the diagnostics harness and the
/// redaction marker read. What a person on screen reads is
/// `CredentialKindL10n.labelIn(l10n)` in `lib/l10n/enum_labels.dart`, for the
/// reason every enum in this app keeps its English and its translation apart:
/// a `const` value cannot depend on a locale.
String describeCredentialKind(CredentialKind kind) => switch (kind) {
      CredentialKind.privateKeyBlock => 'Private key',
      CredentialKind.providerApiKey => 'API key',
      CredentialKind.connectionString => 'Connection string',
      CredentialKind.jsonWebToken => 'Access token',
      CredentialKind.authorizationHeader => 'Authorization header',
      CredentialKind.keyedAssignment => 'Password or key',
      CredentialKind.highEntropyString => 'Possible secret',
    };

/// What to do about a credential of this kind, in canonical English.
///
/// **Why the advice belongs to the kind rather than to the match site.** It
/// was written at each `claim` call, one sentence per pattern, and each
/// sentence already corresponded exactly to one [CredentialKind] — the
/// duplication was invisible only because the two lists happened to agree. It
/// also could not be translated there: a literal built inside a static scan
/// has no locale to build itself from. The kind travels out of the scan; the
/// advice should travel with it.
///
/// The sentence a person reads is `CredentialKindL10n.adviceIn(l10n)`. This
/// English original stays because the honesty tests assert against it directly
/// — that a provider-key finding says "revoke", and that nothing here promises
/// the content is safe.
String describeCredentialAdvice(CredentialKind kind) => switch (kind) {
      CredentialKind.privateKeyBlock =>
        'Remove this before sharing, and replace the key pair. A '
            'private key cannot be made safe again once it has been seen.',
      CredentialKind.providerApiKey =>
        'Revoke this key with the provider and issue a new one. '
            'Removing it from the document does not disable it.',
      CredentialKind.connectionString =>
        'This carries a password and the address it opens. Change the '
            'password if this has already been shared.',
      CredentialKind.jsonWebToken =>
        'Tokens like this often expire, but not always. Treat it as '
            'live unless you know when it expires.',
      CredentialKind.authorizationHeader =>
        'Remove the header value. Pasted request logs are one of the '
            'most common ways a working token gets shared by accident.',
      CredentialKind.keyedAssignment =>
        'Move this into an environment variable or a secret store, '
            'and change the value if the file has been shared.',
      CredentialKind.highEntropyString =>
        'Action cannot tell what this is. Check it before sharing — it '
            'may equally be an identifier or a checksum.',
    };

/// The specific name a finding can carry instead of its kind's generic one.
///
/// Two families live here: the vendor a prefix identifies, and the keyword an
/// assignment was named for. Both used to be bare strings, which meant the only
/// way to know *which* label a finding had was to compare the English — and a
/// screen that has to match on display text cannot be translated at all.
///
/// The English stays on the member, because the scanner's tests assert that a
/// `sk-ant-` prefix comes back labelled 'Anthropic API key' and that
/// `client_secret:` comes back labelled 'Client secret'. What a person reads is
/// `CredentialLabelL10n.labelIn(l10n)`.
enum CredentialLabel {
  // Vendor prefixes. The company names are trademarks and are not translated.
  anthropicApiKey('Anthropic API key'),
  openAiProjectKey('OpenAI project key'),
  openAiStyleApiKey('OpenAI-style API key'),
  googleApiKey('Google API key'),
  googleOAuthToken('Google OAuth token'),
  gitHubToken('GitHub token'),
  slackToken('Slack token'),
  awsAccessKeyId('AWS access key ID'),
  gitLabToken('GitLab token'),
  npmToken('npm token'),

  // What the keyword in a `name = value` assignment said the value was.
  passphrase('Passphrase'),
  password('Password'),
  privateKey('Private key'),
  refreshToken('Refresh token'),
  accessToken('Access token'),
  token('Token'),
  clientSecret('Client secret'),
  apiKey('API key'),
  credential('Credential'),
  secret('Secret');

  const CredentialLabel(this.label);

  /// Canonical English. Read by tests and logs, never rendered directly.
  final String label;
}

/// How strongly the evidence supports calling this a credential.
///
/// Three levels rather than a percentage, for the reason the authenticity
/// inspector gives at length: a number implies a measurement, and nothing here
/// is measured. A prefix match either happened or it did not.
enum CredentialConfidence {
  /// The string announces what it is. `-----BEGIN PRIVATE KEY-----` is not a
  /// guess.
  named,

  /// A vendor-specific shape, or a keyword next to a value.
  shaped,

  /// Only statistics. Might be a hash, a build ID, or a base64 thumbnail.
  statistical,
}

/// One credential-shaped string, with enough to act on and not enough to leak.
///
/// [toString] deliberately returns the masked form. If one of these ends up in
/// a log line or an exception message — which is exactly the accident this
/// whole area of the codebase exists to prevent — the secret does not go with
/// it. The raw [value] is reachable, but only by asking for it by name.
class CredentialFinding {
  const CredentialFinding({
    required this.kind,
    required this.confidence,
    required this.value,
    required this.start,
    required this.end,
    this.detail,
  });

  final CredentialKind kind;
  final CredentialConfidence confidence;

  /// The matched text. Never log this, never render it without the user
  /// explicitly asking to reveal it.
  final String value;

  final int start;
  final int end;

  /// A specific note — the vendor's name, say. Absent when there is nothing
  /// useful to add beyond the kind.
  final CredentialLabel? detail;

  /// What the user should do about it, in plain words and in canonical
  /// English. On screen this is `kind.adviceIn(l10n)`.
  String get advice => describeCredentialAdvice(kind);

  /// Canonical English again: the specific label when there is one, otherwise
  /// the kind's. On screen this is `CredentialFindingL10n.labelIn(l10n)`.
  String get label => detail?.label ?? describeCredentialKind(kind);

  /// The only form that may be shown by default.
  ///
  /// Keeps a short head so a developer can recognise *which* key this is, and a
  /// short tail so two keys from the same vendor can be told apart. Everything
  /// in between is gone. A short value collapses entirely rather than revealing
  /// most of itself.
  String get masked => maskCredential(value);

  /// The replacement written into a cleaned copy, in canonical English.
  ///
  /// A screen that has a locale should pass
  /// `CredentialFindingL10n.replacementIn(l10n)` to [CredentialScanner.redact]
  /// as its `marker`, so the copy the user shares is marked up in the language
  /// they are reading. That form uppercases through `eyebrowCase` rather than
  /// `toUpperCase`, which gets Turkish dotted i wrong.
  String get replacement => '[${describeCredentialKind(kind).toUpperCase()}]';

  @override
  String toString() => 'CredentialFinding(${kind.name}, $masked)';
}

/// Masks a credential for display.
///
/// Public because the Security Centre masks values that never came from a scan
/// — the configured provider key, for one — and two different masking rules
/// would be a bug waiting to happen.
String maskCredential(String value, {int head = 3, int tail = 3}) {
  const dots = '••••••';
  final trimmed = value.trim();
  // Below this, a head and a tail would be most of the string.
  if (trimmed.length <= head + tail + 4) return dots;

  // Keep a recognisable scheme prefix whole rather than cutting it mid-word:
  // `sk-ant-` tells the user which vendor, and `sk-` alone does not.
  final prefixMatch =
      RegExp(r'^(sk-ant-|sk-proj-|sk-|AIza|ya29\.|ghp_|gho_|xox[baprs]-)')
          .firstMatch(trimmed);
  final prefix = prefixMatch?.group(0) ?? trimmed.substring(0, head);

  return '$prefix$dots${trimmed.substring(trimmed.length - tail)}';
}

abstract final class CredentialScanner {
  /// Below this length, a random-looking string is not worth reporting.
  static const _minEntropyLength = 20;

  /// Bits per character. Base64 tops out near 6, English prose sits near 4,
  /// and a hex string near 4. 3.9 keeps prose out while admitting most real
  /// tokens; it was chosen by running the fixtures, not by taste.
  static const _entropyThreshold = 3.9;

  /// Vendor prefixes. These are the shapes that can be asserted rather than
  /// guessed, so they carry [CredentialConfidence.named]-adjacent weight and a
  /// vendor name in [CredentialFinding.detail].
  static final _vendorKeys = <({RegExp pattern, CredentialLabel label})>[
    (
      pattern: RegExp(r'\bsk-ant-[A-Za-z0-9\-_]{16,}'),
      label: CredentialLabel.anthropicApiKey,
    ),
    (
      pattern: RegExp(r'\bsk-proj-[A-Za-z0-9\-_]{16,}'),
      label: CredentialLabel.openAiProjectKey,
    ),
    (
      pattern: RegExp(r'\bsk-[A-Za-z0-9]{20,}'),
      label: CredentialLabel.openAiStyleApiKey,
    ),
    (
      pattern: RegExp(r'\bAIza[A-Za-z0-9\-_]{30,}'),
      label: CredentialLabel.googleApiKey,
    ),
    (
      pattern: RegExp(r'\bya29\.[A-Za-z0-9\-_.]{20,}'),
      label: CredentialLabel.googleOAuthToken,
    ),
    (
      pattern: RegExp(r'\bgh[pousr]_[A-Za-z0-9]{30,}'),
      label: CredentialLabel.gitHubToken,
    ),
    (
      pattern: RegExp(r'\bxox[baprs]-[A-Za-z0-9-]{10,}'),
      label: CredentialLabel.slackToken,
    ),
    (
      pattern: RegExp(r'\bAKIA[0-9A-Z]{16}\b'),
      label: CredentialLabel.awsAccessKeyId,
    ),
    (
      pattern: RegExp(r'\bglpat-[A-Za-z0-9\-_]{16,}'),
      label: CredentialLabel.gitLabToken,
    ),
    (
      pattern: RegExp(r'\bnpm_[A-Za-z0-9]{30,}'),
      label: CredentialLabel.npmToken,
    ),
  ];

  /// `-----BEGIN RSA PRIVATE KEY-----` and every variant of it.
  static final _privateKey = RegExp(
    r'-----BEGIN (?:[A-Z ]+ )?PRIVATE KEY-----[\s\S]{0,8000}?'
    r'(?:-----END (?:[A-Z ]+ )?PRIVATE KEY-----|$)',
  );

  /// A URI with a password in the authority. The `\S` classes stop this eating
  /// a whole paragraph when the URL is malformed.
  static final _connectionString = RegExp(
    r'\b[a-z][a-z0-9+.-]{2,15}://[^\s:/@]+:[^\s:/@]+@[^\s/?#]+',
    caseSensitive: false,
  );

  /// Three base64url segments. The leading `eyJ` is the base64 of `{"`, which
  /// every JWT header starts with — matching on it rather than on shape alone
  /// keeps ordinary dotted identifiers out.
  static final _jwt = RegExp(
    r'\beyJ[A-Za-z0-9\-_]{8,}\.[A-Za-z0-9\-_]{8,}\.[A-Za-z0-9\-_]{8,}',
  );

  static final _authHeader = RegExp(
    r'''(?:authorization|x-api-key|x-goog-api-key|proxy-authorization)'''
    r'''\s*[:=]\s*["']?(?:bearer\s+|basic\s+|token\s+)?[^\s"',;}\]]{8,}''',
    caseSensitive: false,
  );

  /// A secret-ish name, then a separator, then a value.
  ///
  /// The keyword list is what makes this safe to report. `value = "abc123"` is
  /// noise; `api_secret = "abc123"` is a finding, and the only difference is
  /// the name the author chose.
  static final _assignment = RegExp(
    r'''\b((?:[A-Za-z0-9_]*[-_.])?'''
    r'''(?:passwd|password|secret|api[-_]?key|apikey|auth[-_]?token|'''
    r'''access[-_]?token|refresh[-_]?token|private[-_]?key|client[-_]?secret|'''
    r'''credential|passphrase)[A-Za-z0-9_]*)'''
    r'''\s*[:=]\s*["']?([^\s"',;}\]]{6,})''',
    caseSensitive: false,
  );

  /// Candidate runs for the entropy pass.
  static final _token = RegExp(r'[A-Za-z0-9+/=_\-]{20,}');

  /// Values that are structurally secret-shaped but are not secrets. Excluding
  /// them by name is more honest than tuning the threshold until they fall out,
  /// because the threshold would then be wrong for everything else.
  static final _knownNonSecret = RegExp(
    // A bare hex run of a hash's exact length: git SHAs, checksums, ETags.
    r'^(?:[0-9a-f]{32}|[0-9a-f]{40}|[0-9a-f]{64})$'
    // A UUID with the dashes stripped is the 32-hex case above; with dashes it
    // is not entropy-dense enough to reach the threshold anyway.
    r'|^[0-9]+$',
    caseSensitive: false,
  );

  /// Scans [text] and returns findings in document order.
  ///
  /// Overlapping matches are resolved by precedence, not by position: the list
  /// below runs most-specific first and each match claims its span, so a
  /// vendor key inside an `Authorization:` header is reported once, as the
  /// header, rather than twice.
  static List<CredentialFinding> scan(String text) {
    if (text.isEmpty) return const [];

    final claimed = <_Span>[];
    final findings = <CredentialFinding>[];

    void claim(
      int start,
      int end, {
      required CredentialKind kind,
      required CredentialConfidence confidence,
      CredentialLabel? detail,
      String? value,
    }) {
      if (start < 0 || end > text.length || end <= start) return;
      if (claimed.any((s) => s.overlaps(start, end))) return;
      claimed.add(_Span(start, end));
      findings.add(CredentialFinding(
        kind: kind,
        confidence: confidence,
        value: value ?? text.substring(start, end),
        start: start,
        end: end,
        detail: detail,
      ));
    }

    for (final match in _privateKey.allMatches(text)) {
      claim(
        match.start,
        match.end,
        kind: CredentialKind.privateKeyBlock,
        confidence: CredentialConfidence.named,
      );
    }

    for (final match in _connectionString.allMatches(text)) {
      claim(
        match.start,
        match.end,
        kind: CredentialKind.connectionString,
        confidence: CredentialConfidence.named,
      );
    }

    for (final match in _authHeader.allMatches(text)) {
      claim(
        match.start,
        match.end,
        kind: CredentialKind.authorizationHeader,
        confidence: CredentialConfidence.named,
      );
    }

    for (final vendor in _vendorKeys) {
      for (final match in vendor.pattern.allMatches(text)) {
        claim(
          match.start,
          match.end,
          kind: CredentialKind.providerApiKey,
          confidence: CredentialConfidence.named,
          detail: vendor.label,
        );
      }
    }

    for (final match in _jwt.allMatches(text)) {
      claim(
        match.start,
        match.end,
        kind: CredentialKind.jsonWebToken,
        confidence: CredentialConfidence.shaped,
      );
    }

    for (final match in _assignment.allMatches(text)) {
      // Claim the whole `name = value` span so the name is redacted along with
      // the value; leaving `api_secret = [PASSWORD]` behind still tells a
      // reader exactly what to go looking for.
      claim(
        match.start,
        match.end,
        kind: CredentialKind.keyedAssignment,
        confidence: CredentialConfidence.shaped,
        detail: _assignmentLabel(match.group(1)),
        value: match.group(2),
      );
    }

    for (final match in _token.allMatches(text)) {
      final candidate = match.group(0)!;
      if (!_looksRandom(candidate)) continue;
      claim(
        match.start,
        match.end,
        kind: CredentialKind.highEntropyString,
        confidence: CredentialConfidence.statistical,
      );
    }

    findings.sort((a, b) => a.start.compareTo(b.start));
    return findings;
  }

  /// Produces a copy with [selected] findings replaced.
  ///
  /// Back to front, so earlier offsets stay valid. The original is untouched.
  ///
  /// [marker] decides what each removed span is replaced with. It defaults to
  /// [CredentialFinding.replacement], the canonical English `[API KEY]`, so
  /// callers with no locale — tests, diagnostics — get what they always got.
  /// A screen passes the localised form; this is a seam rather than an
  /// `AppL10n` parameter because a scanner that had to be handed a translation
  /// bundle in order to redact would be a scanner that could not run in the
  /// domain.
  static String redact(
    String text,
    List<CredentialFinding> selected, {
    String Function(CredentialFinding finding)? marker,
  }) {
    final ordered = [...selected]..sort((a, b) => b.start.compareTo(a.start));
    var result = text;
    for (final finding in ordered) {
      if (finding.start < 0 || finding.end > result.length) continue;
      result = result.replaceRange(
        finding.start,
        finding.end,
        marker == null ? finding.replacement : marker(finding),
      );
    }
    return result;
  }

  /// Shannon entropy in bits per character.
  ///
  /// Exposed because the test suite asserts against it directly. A threshold
  /// nobody can measure is a magic number.
  static double entropyBitsPerChar(String value) {
    if (value.isEmpty) return 0;
    final counts = <int, int>{};
    for (final unit in value.codeUnits) {
      counts[unit] = (counts[unit] ?? 0) + 1;
    }
    var bits = 0.0;
    for (final count in counts.values) {
      final p = count / value.length;
      bits -= p * (math.log(p) / math.ln2);
    }
    return bits;
  }

  /// The entropy pass's admission test.
  ///
  /// Every clause here exists to keep a specific false positive out, and the
  /// tests name them: a sentence of base64-looking prose, a git SHA, a
  /// repeated-character run, and a long lowercase word.
  static bool _looksRandom(String candidate) {
    if (candidate.length < _minEntropyLength) return false;
    if (_knownNonSecret.hasMatch(candidate)) return false;

    // A credential essentially always mixes classes. A long run of one class is
    // an identifier, a hash, or a word.
    final hasDigit = RegExp(r'\d').hasMatch(candidate);
    final hasLower = RegExp('[a-z]').hasMatch(candidate);
    final hasUpper = RegExp('[A-Z]').hasMatch(candidate);
    final classes = [hasDigit, hasLower, hasUpper].where((c) => c).length;
    if (classes < 2) return false;

    // Mixed case *and* digits, or a separator that base64url uses. Without this
    // a long CamelCase identifier from source code reaches the threshold.
    if (!hasDigit) return false;

    return entropyBitsPerChar(candidate) >= _entropyThreshold;
  }

  /// Turns the matched variable name into something readable, without echoing
  /// an arbitrarily long identifier into the UI.
  ///
  /// Returns a member rather than a string so the screen can ask for the
  /// reader's language. The keywords matched here are the ones a developer
  /// typed in a config file and are never translated; the label they map to is.
  static CredentialLabel? _assignmentLabel(String? name) {
    if (name == null || name.isEmpty) return null;
    final lower = name.toLowerCase();
    if (lower.contains('passphrase')) return CredentialLabel.passphrase;
    if (lower.contains('passwd') || lower.contains('password')) {
      return CredentialLabel.password;
    }
    if (lower.contains('private')) return CredentialLabel.privateKey;
    if (lower.contains('refresh')) return CredentialLabel.refreshToken;
    if (lower.contains('access')) return CredentialLabel.accessToken;
    if (lower.contains('token')) return CredentialLabel.token;
    if (lower.contains('client')) return CredentialLabel.clientSecret;
    if (lower.contains('key')) return CredentialLabel.apiKey;
    if (lower.contains('credential')) return CredentialLabel.credential;
    return CredentialLabel.secret;
  }
}

class _Span {
  const _Span(this.start, this.end);
  final int start;
  final int end;

  bool overlaps(int otherStart, int otherEnd) =>
      otherStart < end && otherEnd > start;
}
