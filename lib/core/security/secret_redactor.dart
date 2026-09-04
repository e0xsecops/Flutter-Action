/// Scrubs credentials out of text on its way to somewhere it could be read.
///
/// **Why this exists at the sink rather than the call site.** The highest
/// probability leak in a BYOK app is not the secure store failing — it is an
/// exception message, a breadcrumb or a debug print quietly carrying
/// `Authorization: Bearer sk-...` into Crashlytics. Guarding every call site
/// means every *future* call site has to remember. So the rule is that anything
/// heading for a log, a crash report or a user-visible message goes through
/// here first, and forgetting is not an available failure mode.
///
/// **What it does not do.** This is not a general secret scanner and does not
/// try to be. It removes credential-shaped strings and the header lines that
/// carry them. The structural defence — never letting a raw response body or a
/// request header escape the provider adapter in the first place — is what
/// actually keeps secrets out of these strings; this is the layer underneath
/// that, for when the structural one is wrong.
library;

/// The placeholder left behind. Deliberately obvious in a bug report: someone
/// reading a redacted log should be able to tell that redaction happened rather
/// than wonder why a field is empty.
const String redactedPlaceholder = '[redacted]';

abstract final class SecretRedactor {
  /// Header lines, in any casing, whose value is always a credential.
  ///
  /// The optional `Bearer` is part of the pattern rather than left to the
  /// separate bearer rule below. Without it the value match stops at the space
  /// after the scheme, the header rule claims only `Authorization: Bearer`, and
  /// the token behind it has to be caught by a second pass — which happens to
  /// work for the vendors whose shapes are known here and silently fails for
  /// the custom endpoint, where the shape is not.
  static final RegExp _headerLine = RegExp(
    r'(authorization|x-api-key|x-goog-api-key|api[-_]?key)'
    r'''\s*[:=]\s*(?!\[redacted\])["']?(?:Bearer\s+)?[^\s"',}\]]+''',
    caseSensitive: false,
  );

  /// A bare `Bearer <token>` with no header name in front of it.
  static final RegExp _bearer = RegExp(
    r'''\bBearer\s+(?!\[redacted\])[A-Za-z0-9\-._~+/]+=*''',
    caseSensitive: false,
  );

  /// Vendor key shapes. These are the prefixes the three supported providers
  /// actually issue, so a key pasted into the wrong field — or echoed back
  /// inside a provider's own error text — is caught even when it arrives with
  /// no header around it.
  ///
  /// Ordered longest-prefix-first: `sk-ant-` has to be tried before `sk-`, or
  /// the shorter pattern claims the match and leaves `ant-...` behind.
  static final RegExp _vendorKey = RegExp(
    r'\b(sk-ant-[A-Za-z0-9\-_]{8,}'
    r'|sk-proj-[A-Za-z0-9\-_]{8,}'
    r'|sk-[A-Za-z0-9\-_]{8,}'
    r'|AIza[A-Za-z0-9\-_]{8,}'
    r'|ya29\.[A-Za-z0-9\-_.]{8,})',
  );

  /// Redacts credential-shaped content from [text].
  ///
  /// Pass [also] when a specific secret is known — the configured key for the
  /// request that failed, say. An exact-value pass catches keys from providers
  /// whose format is not known here, which is the whole point of supporting a
  /// custom endpoint.
  static String redact(String text, {Iterable<String> also = const []}) {
    if (text.isEmpty) return text;
    var out = text;

    // Exact known values first. If the caller handed us the actual secret,
    // that is the strongest signal available and it should not have to survive
    // a pattern guess.
    for (final secret in also) {
      // A short "secret" is either not one or is so generic that removing every
      // occurrence would mangle unrelated text. Eight characters is comfortably
      // below every real provider key and above anything worth substituting.
      if (secret.length < 8) continue;
      out = out.replaceAll(secret, redactedPlaceholder);
    }

    out = out.replaceAllMapped(_headerLine, (m) {
      // Keep the header's name so a reader can still tell which header was
      // present — that is diagnostically useful and reveals nothing.
      return '${m.group(1)}: $redactedPlaceholder';
    });
    out = out.replaceAll(_bearer, 'Bearer $redactedPlaceholder');
    out = out.replaceAll(_vendorKey, redactedPlaceholder);
    return out;
  }

  /// True when [text] still contains something credential-shaped.
  ///
  /// Used by tests as an independent check rather than by production code:
  /// asserting "the output is clean" is stronger than asserting "we called
  /// redact", because only the first one fails when the patterns are wrong.
  ///
  /// The placeholder is excluded by the patterns themselves, which is what
  /// makes [redact] idempotent — without that, redacted text reads as still
  /// carrying a secret and a second pass mangles it further.
  static bool containsSecret(String text) =>
      _headerLine.hasMatch(text) ||
      _bearer.hasMatch(text) ||
      _vendorKey.hasMatch(text);

  /// A display form of a stored secret: enough to tell two keys apart, not
  /// enough to use.
  ///
  /// The full secret is never readable again through the UI, so this is the
  /// only thing Settings can show. Short inputs collapse to a fixed mask rather
  /// than exposing most of themselves.
  static String mask(String secret, {int visibleTail = 4}) {
    const dots = '••••••••';
    if (secret.length <= visibleTail * 2) return dots;
    return '$dots${secret.substring(secret.length - visibleTail)}';
  }
}
