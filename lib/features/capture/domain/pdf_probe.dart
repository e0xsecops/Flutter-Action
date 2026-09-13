/// What can be read off a PDF without a PDF library.
///
/// **Why not a PDF library.** The only thing Action needs to know before
/// sending a document to a provider is how big the job is, so it can say so
/// first — "4 pages will be analysed using your OpenAI connection". Shipping a
/// parser to answer one question would add a large dependency, a native
/// surface, and a new place for a malformed file to do something interesting.
///
/// **Why the answer is allowed to be "I don't know".** A page count is only
/// useful if it is right. Modern PDFs commonly compress the page tree into
/// object streams, and when they do, none of the structure below is visible in
/// the raw bytes — no amount of pattern matching recovers it. So this returns
/// null rather than a guess, and the scope disclosure falls back to counting
/// files instead of pages. A confident wrong number in a sentence about
/// spending the user's money is worse than an honest vaguer one.
///
/// **What it does not do.** It does not decrypt, does not render, does not
/// execute anything, and does not follow any reference inside the file. It
/// reads bytes and matches patterns.
library;

import 'dart:convert';
import 'dart:typed_data';

/// Why a PDF cannot be used.
enum PdfRejection {
  /// The bytes are not a PDF at all, whatever the file is called.
  notAPdf,

  /// Password-protected. Action has no password and will not ask for one to
  /// send somewhere else.
  encrypted,

  /// Structurally broken enough that nothing can be said about it.
  damaged,
}

String describePdfRejection(PdfRejection rejection) => switch (rejection) {
      PdfRejection.notAPdf =>
        'That file is not a PDF, whatever it is called.',
      PdfRejection.encrypted =>
        'That PDF is password-protected, so Action cannot read it.',
      PdfRejection.damaged =>
        'That PDF could not be read. It may be incomplete.',
    };

/// What was established about a PDF.
class PdfProbeResult {
  const PdfProbeResult({
    required this.version,
    this.pageCount,
    this.rejection,
  });

  const PdfProbeResult.rejected(PdfRejection reason)
      : version = null,
        pageCount = null,
        rejection = reason;

  /// `1.7`, `2.0`. Null when the header did not carry one.
  final String? version;

  /// Null means *unknown*, never zero. Callers must treat it as "do not claim
  /// a page count" rather than as "empty document".
  final int? pageCount;

  final PdfRejection? rejection;

  bool get isUsable => rejection == null;

  /// The phrase for a scope disclosure, or null when there is nothing
  /// trustworthy to say.
  String? get pageSentence {
    final count = pageCount;
    if (count == null) return null;
    return '$count ${count == 1 ? 'page' : 'pages'}';
  }
}

abstract final class PdfProbe {
  /// How much of the file to scan.
  ///
  /// The structures worth finding sit at the front (the linearization
  /// dictionary) or the back (the trailer and the page tree), so both ends are
  /// read and the middle of a large file is skipped. Bounded because this runs
  /// on the main isolate before a picker sheet closes.
  static const _windowBytes = 512 * 1024;

  /// A page count above this is not believed.
  ///
  /// Not a limit on what Action accepts — a limit on what a *pattern match* is
  /// allowed to assert. A number in the thousands from a regex almost always
  /// means the pattern hit something that was not a page tree.
  static const _implausiblePageCount = 5000;

  static final _header = RegExp(r'%PDF-(\d\.\d)');

  /// The linearization dictionary's `/N`, which is the page count and is the
  /// one place a PDF states it unambiguously. Present in most PDFs produced
  /// for the web.
  static final _linearizedPages = RegExp(r'/Linearized[^>]{0,200}?/N\s+(\d+)');

  /// The page tree root's own count.
  static final _pagesCount = RegExp(r'/Type\s*/Pages\b[^>]{0,400}?/Count\s+(\d+)');

  /// Individual page objects. `(?!s)` keeps `/Type /Pages` out of the count.
  static final _pageObjects = RegExp(r'/Type\s*/Page(?![a-zA-Z])');

  static final _encrypt = RegExp(r'/Encrypt\b');

  /// Reads what it can from [bytes].
  static PdfProbeResult probe(Uint8List bytes) {
    if (bytes.length < 8) {
      return const PdfProbeResult.rejected(PdfRejection.notAPdf);
    }

    // Latin-1 rather than UTF-8: a PDF is binary, and this is only ever used
    // to find ASCII markers. Decoding as UTF-8 would throw on the first
    // compressed stream.
    final head = latin1.decode(
      bytes.sublist(0, bytes.length < _windowBytes ? bytes.length : _windowBytes),
      allowInvalid: true,
    );

    final headerMatch = _header.firstMatch(
      head.length > 1024 ? head.substring(0, 1024) : head,
    );
    if (headerMatch == null) {
      return const PdfProbeResult.rejected(PdfRejection.notAPdf);
    }
    final version = headerMatch.group(1);

    final tail = bytes.length <= _windowBytes
        ? ''
        : latin1.decode(
            bytes.sublist(bytes.length - _windowBytes),
            allowInvalid: true,
          );
    final text = tail.isEmpty ? head : '$head\n$tail';

    // An encrypted PDF is refused rather than sent onward. Action has no
    // password, and a provider would receive something it cannot read either.
    if (_encrypt.hasMatch(text)) {
      return const PdfProbeResult.rejected(PdfRejection.encrypted);
    }

    // Every PDF ends with a trailer and a startxref. Missing both is the one
    // structural check worth making: it means the file was truncated.
    if (!text.contains('%%EOF')) {
      return const PdfProbeResult.rejected(PdfRejection.damaged);
    }

    return PdfProbeResult(version: version, pageCount: _countPages(text));
  }

  /// A page count, or null.
  ///
  /// Three sources, in descending order of how much they can be trusted. The
  /// last one is only believed when a second source agrees with it, because
  /// counting `/Type /Page` markers over-counts any file that mentions one
  /// inside a content stream — which is exactly the kind of near-miss that
  /// produces a confident wrong number.
  static int? _countPages(String text) {
    final linearized = _linearizedPages.firstMatch(text);
    if (linearized != null) {
      final n = int.tryParse(linearized.group(1)!);
      if (_plausible(n)) return n;
    }

    // The page tree root is the /Pages node with the largest /Count: nested
    // page-tree nodes carry their own subtree counts.
    final counts = _pagesCount
        .allMatches(text)
        .map((m) => int.tryParse(m.group(1)!))
        .whereType<int>()
        .where(_plausible)
        .toList();

    final markers = _pageObjects.allMatches(text).length;

    if (counts.isNotEmpty) {
      final root = counts.reduce((a, b) => a > b ? a : b);
      // When the markers are visible too they should agree, give or take the
      // page tree nodes themselves. A wild disagreement means one of the two
      // is matching something it should not, and neither is then worth
      // reporting.
      if (markers == 0 || (markers - root).abs() <= counts.length + 1) {
        return root;
      }
      return null;
    }

    // No /Count anywhere. Marker counting alone is believed only for small
    // documents, where an over-count is both less likely and less costly.
    if (markers > 0 && markers <= 50) return markers;

    return null;
  }

  static bool _plausible(int? n) =>
      n != null && n > 0 && n <= _implausiblePageCount;
}
