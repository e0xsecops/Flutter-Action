/// Why a capture might need more than on-device OCR plus a text model.
///
/// Every member is a boolean observation with a threshold written down in
/// [EscalationEvaluator]. There is deliberately **no score**: a single number
/// would be easier to sort by and impossible to argue with, and day 4 already
/// produced one misleading number (100% anchor recall on a corpus that was too
/// easy). If the app is going to spend a user's data allowance and send their
/// document to a larger model, it should be able to say in a sentence why.
///
/// Nothing here triggers a request. Day 5 only classifies.
enum ExtractionEscalationSignal {
  ocrFailed(
    'Recognition could not run on this capture at all.',
    needsMultimodal: true,
  ),
  noTextRecognised(
    'This looks like a document, but no text was recognised.',
    needsMultimodal: true,
  ),
  thinText(
    'Far too little text was recognised for a document this size.',
    needsMultimodal: true,
  ),
  lowLineConfidence(
    'The recogniser reported low confidence on several lines.',
    needsMultimodal: true,
  ),
  tableLikeLayout(
    'The layout looks like a table, and reading it line by line loses which '
    'value belongs to which row.',
    needsMultimodal: true,
  ),
  fragmentedLayout(
    'The text came back as many tiny fragments, so the structure is unclear.',
    needsMultimodal: true,
  ),
  malformedText(
    'Much of the recognised text is not readable words or numbers.',
    needsMultimodal: true,
  ),
  conflictingDates(
    'More than one date is presented as a deadline.',
    needsMultimodal: true,
  ),
  conflictingAmounts(
    'More than one amount is presented as the sum due.',
    needsMultimodal: true,
  ),
  unresolvedGrounding(
    'Some values could not be traced back to the document text.',
    needsMultimodal: true,
  ),

  /// Present so the pipeline can *notice* an injection attempt and record it.
  ///
  /// Explicitly not a reason to escalate: sending text that tries to issue
  /// instructions to a second, more capable model is the opposite of a fix.
  instructionLikeContent(
    'The document contains text written as if it were instructions to the app. '
    'It is treated as document content, never as instructions.',
    needsMultimodal: false,
  );

  const ExtractionEscalationSignal(this.reason, {required this.needsMultimodal});

  /// Plain-language explanation, safe to show a user.
  final String reason;

  /// Whether this signal is one a multimodal read could plausibly fix.
  final bool needsMultimodal;

  static ExtractionEscalationSignal? fromName(String? name) {
    for (final signal in ExtractionEscalationSignal.values) {
      if (signal.name == name) return signal;
    }
    return null;
  }
}

/// The verdict for one capture, with its reasoning attached.
class EscalationAssessment {
  const EscalationAssessment(this.signals);

  const EscalationAssessment.none() : signals = const [];

  final List<ExtractionEscalationSignal> signals;

  /// Whether a future multimodal request *may* be worth making. Day 5 never
  /// acts on this; day 6 decides what to do with it.
  bool get mayNeedMultimodal => signals.any((s) => s.needsMultimodal);

  bool has(ExtractionEscalationSignal signal) => signals.contains(signal);

  /// Every reason, in one readable string. This is what makes the decision
  /// auditable — if the app cannot fill this in, it has no business escalating.
  String get explanation =>
      signals.isEmpty ? 'On-device reading looks sufficient.' : signals.map((s) => s.reason).join(' ');

  EscalationAssessment merge(EscalationAssessment other) {
    final combined = <ExtractionEscalationSignal>[
      ...signals,
      ...other.signals.where((s) => !signals.contains(s)),
    ];
    return EscalationAssessment(combined);
  }

  List<String> toJson() => signals.map((s) => s.name).toList();

  static EscalationAssessment fromJson(List<dynamic>? json) =>
      EscalationAssessment(
        (json ?? const [])
            .whereType<String>()
            .map(ExtractionEscalationSignal.fromName)
            .whereType<ExtractionEscalationSignal>()
            .toList(),
      );
}
