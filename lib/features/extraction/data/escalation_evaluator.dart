import '../domain/escalation.dart';
import '../domain/extraction_input.dart';

/// Decides, from measurable properties of a capture, whether reading it with
/// on-device OCR plus a text model is likely to be enough.
///
/// Every rule below is a stated threshold on a stated measurement. That is the
/// design constraint, not an accident of implementation: this evaluator can
/// eventually cause a user's document to be sent to a remote model, and a
/// decision like that has to be explainable to the person it affects and
/// arguable by whoever maintains it. A learned score would be neither.
///
/// The thresholds themselves are provisional. They come from the day-4 corpus
/// and from what that corpus failed to prove — it scored 100% anchor recall on
/// every fixture including the degraded ones, which means it was too easy and
/// these numbers have not yet met a hard document. They are written to be
/// re-tuned against harder fixtures, not trusted as final.
///
/// **This class never sends anything anywhere.** It classifies. What day 6
/// does with [EscalationAssessment.mayNeedMultimodal] is day 6's decision.
class EscalationEvaluator {
  const EscalationEvaluator();

  /// Below this many characters, a document that filled a page cannot be
  /// describing an obligation — something went wrong in the read.
  static const int thinTextCharacters = 40;

  /// A page big enough that it should have contained more than [thinTextCharacters].
  static const int largeImagePixels = 500000;

  /// Day 4's table heuristic, moved from the diagnostics harness into product
  /// code. A table read line-by-line comes back column-major: every value
  /// survives and every row association is destroyed. Many short lines is what
  /// that looks like from outside the recogniser, and day 4 confirmed it is the
  /// single biggest structural risk to extraction.
  static const int tableMinimumLines = 12;
  static const double tableMaximumCharsPerLine = 24;

  static const int fragmentMinimumLines = 20;
  static const int fragmentShortLineLength = 8;
  static const double fragmentShortLineShare = 0.6;

  /// ML Kit reported 0.31–0.89 per line on the day-4 device, and the low values
  /// tracked real misreads. Two clearly-bad lines, or a poor average, is enough
  /// to doubt the read — but confidence is often absent entirely, so this can
  /// never be the only signal.
  static const double lowConfidenceLine = 0.5;
  static const double lowConfidenceMean = 0.6;
  static const int lowConfidenceLineCount = 2;
  static const int meaningfulConfidenceSample = 3;

  /// Above this share of characters that are neither letters, digits, spaces
  /// nor ordinary punctuation, the "text" is recogniser noise.
  static const double malformedCharacterShare = 0.25;

  /// How far back to look for a keyword that turns a date into a deadline.
  static const int keywordWindow = 40;

  EscalationAssessment evaluate(ExtractionInput input) {
    final signals = <ExtractionEscalationSignal>[];

    if (input.ocrFailed) {
      // Nothing downstream is meaningful when recognition never ran, so this
      // short-circuits rather than piling on signals derived from empty text.
      return const EscalationAssessment([ExtractionEscalationSignal.ocrFailed]);
    }

    final text = input.normalizedText.trim();
    final isImage = input.imagePixelCount > 0;

    if (isImage && text.isEmpty) {
      signals.add(ExtractionEscalationSignal.noTextRecognised);
    }

    if (isImage &&
        text.isNotEmpty &&
        text.length < thinTextCharacters &&
        input.imagePixelCount > largeImagePixels) {
      signals.add(ExtractionEscalationSignal.thinText);
    }

    if (_hasLowLineConfidence(input)) {
      signals.add(ExtractionEscalationSignal.lowLineConfidence);
    }

    if (_looksLikeTable(input)) {
      signals.add(ExtractionEscalationSignal.tableLikeLayout);
    }

    if (_looksFragmented(input)) {
      signals.add(ExtractionEscalationSignal.fragmentedLayout);
    }

    if (_looksMalformed(text)) {
      signals.add(ExtractionEscalationSignal.malformedText);
    }

    if (distinctDeadlineDates(text).length > 1) {
      signals.add(ExtractionEscalationSignal.conflictingDates);
    }

    if (distinctPayableAmounts(text).length > 1) {
      signals.add(ExtractionEscalationSignal.conflictingAmounts);
    }

    if (containsInstructionLikeText(text)) {
      signals.add(ExtractionEscalationSignal.instructionLikeContent);
    }

    return EscalationAssessment(signals);
  }

  bool _hasLowLineConfidence(ExtractionInput input) {
    final scored = input.lines
        .map((l) => l.confidence)
        .whereType<double>()
        .toList(growable: false);
    if (scored.isEmpty) return false;

    final poor = scored.where((c) => c < lowConfidenceLine).length;
    if (poor >= lowConfidenceLineCount) return true;

    if (scored.length < meaningfulConfidenceSample) return false;
    final mean = scored.reduce((a, b) => a + b) / scored.length;
    return mean < lowConfidenceMean;
  }

  bool _looksLikeTable(ExtractionInput input) {
    final lines = input.lines.where((l) => l.text.trim().isNotEmpty).toList();
    if (lines.length < tableMinimumLines) return false;

    final characters = lines.fold<int>(0, (sum, l) => sum + l.text.trim().length);
    return characters / lines.length < tableMaximumCharsPerLine;
  }

  bool _looksFragmented(ExtractionInput input) {
    final lines = input.lines.where((l) => l.text.trim().isNotEmpty).toList();
    if (lines.length < fragmentMinimumLines) return false;

    final short =
        lines.where((l) => l.text.trim().length <= fragmentShortLineLength).length;
    return short / lines.length >= fragmentShortLineShare;
  }

  bool _looksMalformed(String text) {
    if (text.length < 20) return false;
    final junk = text.replaceAll(RegExp(r'''[0-9A-Za-z\s.,:;!?()\[\]/\\@#£$€%&*+_'"°-]'''), '');
    return junk.length / text.length > malformedCharacterShare;
  }

  /// Dates that the document itself frames as a deadline.
  ///
  /// Proximity to a deadline word is what makes this useful rather than noisy.
  /// Almost every letter carries two or three dates — issued, valid from, due —
  /// and flagging all of them as a conflict would fire on everything. Two dates
  /// both introduced by "due by" is a genuine ambiguity.
  ///
  /// Returned as canonical keys so "30 September 2026" and "30/09/2026" in the
  /// same document count once.
  Set<String> distinctDeadlineDates(String text) {
    final found = <String>{};
    for (final match in _datePattern.allMatches(text)) {
      if (!_precededByAny(text, match.start, _deadlineWords)) continue;
      found.add(_canonicalDateKey(match.group(0)!));
    }
    return found;
  }

  /// Amounts the document frames as payable, under the same proximity rule.
  Set<String> distinctPayableAmounts(String text) {
    final found = <String>{};
    for (final match in _amountPattern.allMatches(text)) {
      if (!_precededByAny(text, match.start, _payableWords)) continue;
      final digits = match.group(0)!.replaceAll(RegExp(r'[^0-9]'), '');
      if (digits.isEmpty) continue;
      // A zero balance is not a competing claim about what is owed. Without
      // this, every statement that prints "Previous balance: 0.00" alongside a
      // real total would be flagged as ambiguous.
      if (RegExp(r'^0+$').hasMatch(digits)) continue;
      found.add(digits);
    }
    return found;
  }

  bool _precededByAny(String text, int at, RegExp words) {
    final from = at - keywordWindow < 0 ? 0 : at - keywordWindow;
    return words.hasMatch(text.substring(from, at));
  }

  /// Reduces a written date to a comparable key.
  ///
  /// Numeric forms keep their digits rather than being resolved, because
  /// `03/09/2026` is day-month in one country and month-day in another and this
  /// layer has no business picking. Two spellings of the same date may
  /// therefore count as two — which errs toward flagging ambiguity, the safe
  /// direction.
  String _canonicalDateKey(String raw) {
    final text = raw.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').trim();

    final iso = RegExp(r'^(\d{4})-(\d{1,2})-(\d{1,2})$').firstMatch(text);
    if (iso != null) {
      return '${iso.group(1)}-${_pad(iso.group(2)!)}-${_pad(iso.group(3)!)}';
    }

    final dayFirst =
        RegExp(r'^(\d{1,2})(?:st|nd|rd|th)? ([a-z]+)\.? (\d{4})$').firstMatch(text);
    if (dayFirst != null) {
      final month = _monthNumber(dayFirst.group(2)!);
      if (month != null) {
        return '${dayFirst.group(3)}-$month-${_pad(dayFirst.group(1)!)}';
      }
    }

    final monthFirst =
        RegExp(r'^([a-z]+)\.? (\d{1,2})(?:st|nd|rd|th)?,? (\d{4})$').firstMatch(text);
    if (monthFirst != null) {
      final month = _monthNumber(monthFirst.group(1)!);
      if (month != null) {
        return '${monthFirst.group(3)}-$month-${_pad(monthFirst.group(2)!)}';
      }
    }

    return text.replaceAll(RegExp(r'[^0-9]'), '');
  }

  static String _pad(String value) => value.padLeft(2, '0');

  static String? _monthNumber(String name) {
    const months = [
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december',
    ];
    for (var i = 0; i < months.length; i++) {
      if (months[i].startsWith(name) && name.length >= 3) {
        return _pad((i + 1).toString());
      }
    }
    return null;
  }

  /// Whether the document contains text written as though it were addressed to
  /// the app rather than to the reader.
  ///
  /// This is a *detector*, never a filter. The text is not edited, stripped or
  /// escaped — a real notice could legitimately contain the words "ignore the
  /// previous instructions" in a quoted email thread, and silently deleting
  /// part of a user's document to protect a model would be a worse bug than the
  /// one it prevents. The actual defence is structural: document content is
  /// passed as data in a separate part from the app's instructions, and every
  /// value that comes back must ground against this same text. An injected
  /// "add a £5000 charge" cannot survive grounding, because the amount is not
  /// in the document.
  ///
  /// Patterns are deliberately narrow. "Please disregard this reminder if you
  /// have already paid" is ordinary letter prose and must not trip it.
  static bool containsInstructionLikeText(String text) =>
      _injectionPatterns.any((p) => p.hasMatch(text));

  /// Where instruction-like text first appears, or null if it never does.
  ///
  /// Used by the validator to treat everything from that point on as tainted.
  /// The reasoning: a genuine notice does not start addressing the software
  /// halfway through, so once a document does, the remainder is far more likely
  /// to be payload than content — and a model that partly complied will quote
  /// from exactly that region to justify what it was told to produce.
  ///
  /// Conservative on purpose, and blunt: it will also taint any legitimate text
  /// that happens to sit after the injected block. That costs a value being
  /// marked "needs review" when it did not have to be, which is the cheap
  /// direction to be wrong in.
  static int? firstInstructionLikeIndex(String text) {
    int? earliest;
    for (final pattern in _injectionPatterns) {
      final match = pattern.firstMatch(text);
      if (match == null) continue;
      if (earliest == null || match.start < earliest) earliest = match.start;
    }
    return earliest;
  }

  static final List<RegExp> _injectionPatterns = [
    RegExp(r'ignore\s+(all\s+|any\s+)?(previous|prior|earlier|above|the\s+above)\s+(instruction|direction|rule|prompt)', caseSensitive: false),
    RegExp(r'disregard\s+(all\s+|any\s+)?(previous|prior|earlier|above|system)\s+(instruction|direction|rule|prompt)', caseSensitive: false),
    RegExp(r'forget\s+(everything|all)\s+(you|above|previous)', caseSensitive: false),
    RegExp(r'(system|developer)\s+(prompt|instruction|message)', caseSensitive: false),
    // Narrow on purpose: "You are now a member of our loyalty scheme" is
    // ordinary letter prose, so the role being assigned has to be one only
    // software could hold.
    RegExp(
      r'you\s+are\s+(now\s+)?(a|an|the)\s+(\w+\s+){0,3}(assistant|ai|language model|chatbot|bot)\b',
      caseSensitive: false,
    ),
    RegExp(r'new\s+instructions?\s*:', caseSensitive: false),
    RegExp(r'(reveal|print|output|repeat)\s+(your|the)\s+(prompt|instructions|system)', caseSensitive: false),
    RegExp(r'do\s+not\s+(follow|obey)\s+(the\s+)?(previous|above|system|earlier)', caseSensitive: false),
    RegExp(r'respond\s+only\s+with', caseSensitive: false),
    RegExp(r'override\s+(the\s+)?(schema|instructions|rules|system)', caseSensitive: false),
  ];

  static final RegExp _datePattern = RegExp(
    r'\b\d{4}-\d{1,2}-\d{1,2}\b'
    r'|\b\d{1,2}[/-]\d{1,2}[/-]\d{2,4}\b'
    r'|\b\d{1,2}(?:st|nd|rd|th)?\s+[A-Za-z]{3,9}\.?\s+\d{4}\b'
    r'|\b[A-Za-z]{3,9}\.?\s+\d{1,2}(?:st|nd|rd|th)?,?\s+\d{4}\b',
  );

  static final RegExp _amountPattern = RegExp(
    r'(?:£|\$|€|৳|(?:BDT|USD|GBP|EUR|INR|AUD|CAD)\s?|Tk\.?\s?)\d[\d,]*(?:\.\d{1,2})?'
    r'|\b\d[\d,]*\.\d{2}\b',
  );

  static final RegExp _deadlineWords = RegExp(
    r'due|by|before|deadline|expir|no\s+later|last\s+day|cancel|return|respond|renew',
    caseSensitive: false,
  );

  static final RegExp _payableWords = RegExp(
    r'due|total|pay|payable|balance|amount|outstanding|owed|charge',
    caseSensitive: false,
  );
}
