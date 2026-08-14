/// Tidies OCR output for analysis **without ever altering a source fact**.
///
/// The only edits permitted here are to whitespace and invisible characters.
/// Dates, amounts, names, account numbers, reference codes and punctuation
/// inside tokens are left exactly as recognised. If normalisation could change
/// "30/09" or "1,780.00" or "GB29 NWBK", the product's central promise — that
/// nothing is invented — would already be broken before extraction even runs.
///
/// Deliberately *not* done here:
///
///  * Joining wrapped lines. A line break between "Amount due" and "780.00"
///    looks like wrapping and often is, but the same break can separate two
///    unrelated table cells. Merging them would fabricate an association.
///  * Unicode NFC composition. Dart has no normalisation in its core library
///    and pulling a package in for it is not justified yet; the invisible and
///    lookalike-space handling below covers what OCR actually emits. Revisit if
///    the multilingual fixtures show composed/decomposed mismatches.
///  * Spelling or OCR error correction of any kind.
String normalizeOcrText(String raw) {
  if (raw.isEmpty) return '';

  var text = raw;

  // Zero-width characters carry no meaning and break naive substring matching
  // during grounding. Removed rather than replaced.
  text = text.replaceAll(RegExp(r'[​‌‍﻿]'), '');

  // Lookalike spaces (non-breaking, thin, figure, narrow no-break, ideographic)
  // become ordinary spaces so that "1 780" matches whether the recogniser used
  // U+00A0 or U+0020.
  text = text.replaceAll(
    RegExp(r'[      　]'),
    ' ',
  );

  text = text.replaceAll('\r\n', '\n').replaceAll('\r', '\n');

  // Collapse runs of spaces and tabs, but never across a newline: line
  // structure is what tells day 5 that two values sit on different rows.
  text = text.replaceAll(RegExp(r'[ \t]+'), ' ');

  text = text
      .split('\n')
      .map((line) => line.trim())
      .join('\n');

  // Three or more blank lines carry no more meaning than one blank line.
  text = text.replaceAll(RegExp(r'\n{3,}'), '\n\n');

  return text.trim();
}
