/// Checks that a quoted piece of evidence actually appears in the source.
///
/// **Why this is worth more than a provider citation.** A provider citation is
/// the model telling us where it looked, and Action has to take that on trust.
/// This is Action checking. Every factual tool is required to return the exact
/// words it based a claim on, and those words are then searched for in the text
/// the user actually selected. A quote that is not there means the claim behind
/// it was invented — and that is catchable, locally, for free, on every
/// provider rather than only the one with a citations feature.
///
/// It also makes the trust model enforceable rather than aspirational: a fact
/// whose evidence failed verification is marked uncertain, so it cannot quietly
/// become an Action.
///
/// **What it cannot do.** When a document was sent as bytes for the provider to
/// read natively, Action has no local text to search. That returns
/// [EvidenceStatus.unverifiable], which is reported honestly as "not checked" —
/// never as verified.
library;

import '../domain/ai_request.dart';

enum EvidenceStatus {
  /// Found in the selected text, character for character after normalisation.
  verified,

  /// Not found. The strong signal that a claim was fabricated.
  notFound,

  /// No local text to check against — a PDF the provider read itself.
  unverifiable,
}

class EvidenceVerifier {
  EvidenceVerifier(Iterable<AiPart> parts)
      : _haystacks = parts
            .whereType<AiSourceTextPart>()
            .map((p) => _normalise(p.text))
            .toList(),
        _hasOpaqueSources = parts.any(
          (p) => p is AiDocumentPart || p is AiImagePart,
        );

  final List<String> _haystacks;

  /// True when something was sent that Action cannot read locally.
  final bool _hasOpaqueSources;

  /// Whether any claim can be checked at all.
  bool get canVerify => _haystacks.isNotEmpty;

  EvidenceStatus check(String? quote) {
    final needle = quote?.trim();
    if (needle == null || needle.isEmpty) {
      // No quote offered. Treated as unverifiable rather than notFound: the
      // tool asked for one and did not get it, which is a weaker signal than a
      // quote that turned out to be false.
      return EvidenceStatus.unverifiable;
    }
    if (_haystacks.isEmpty) {
      return _hasOpaqueSources
          ? EvidenceStatus.unverifiable
          : EvidenceStatus.notFound;
    }

    final normalised = _normalise(needle);
    if (normalised.isEmpty) return EvidenceStatus.unverifiable;

    for (final haystack in _haystacks) {
      if (haystack.contains(normalised)) return EvidenceStatus.verified;
    }

    // A document was also sent that Action cannot read, so the quote may
    // genuinely come from there. Not found is only asserted when everything the
    // model saw was something Action can also see.
    return _hasOpaqueSources
        ? EvidenceStatus.unverifiable
        : EvidenceStatus.notFound;
  }

  /// Collapses the differences that make an honest quote fail a naive match.
  ///
  /// OCR and PDF extraction routinely differ from the original in whitespace,
  /// line breaks and quotation marks, and a model re-typing a quote will
  /// normalise punctuation without meaning to change it. Case is folded for the
  /// same reason. Nothing here changes which *words* are being matched, so a
  /// fabricated quote still fails.
  static String _normalise(String text) {
    final buffer = StringBuffer();
    var lastWasSpace = false;
    for (final rune in text.toLowerCase().runes) {
      final char = String.fromCharCode(rune);
      final mapped = switch (char) {
        // Curly quotes, prime marks and the various dashes all round-trip badly
        // through OCR and through a model retyping them.
        '‘' || '’' || 'ʼ' || '´' || '`' => "'",
        '“' || '”' => '"',
        '–' || '—' || '−' => '-',
        ' ' || '\t' || '\n' || '\r' => ' ',
        _ => char,
      };
      if (mapped == ' ') {
        if (!lastWasSpace) buffer.write(' ');
        lastWasSpace = true;
      } else {
        buffer.write(mapped);
        lastWasSpace = false;
      }
    }
    return buffer.toString().trim();
  }
}
