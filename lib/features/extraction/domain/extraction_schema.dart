/// The locked vocabulary of the extraction layer.
///
/// Everything here is provider-neutral on purpose. No Firebase, Gemini or
/// HTTP type may appear in this directory: the whole point of day 5 is that the
/// provider behind [ExtractionService] can be replaced without the domain
/// noticing.
///
/// Every enum parses unknown wire values to its *safest* member rather than
/// throwing. A newer model, a newer app build or a corrupted record must
/// degrade to "we are not sure" instead of taking the screen down or, worse,
/// silently landing on a confident-looking default.
library;

/// Version of the provider JSON contract this build understands.
///
/// Bumped whenever the shape the model is asked to return changes in a way an
/// older build could misread. The validator refuses payloads it does not
/// recognise instead of guessing at their meaning.
const int extractionSchemaVersion = 1;

/// What a value *is*, which decides how it is parsed, validated and displayed.
///
/// [unknown] is a real, usable member and the parse fallback: a value we cannot
/// type is still worth showing to the user as text, it just never earns a typed
/// claim like "this is a deadline".
enum ExtractedValueType {
  text,
  date,
  datetime,
  money,
  number,
  person,
  organization,
  reference,
  location,
  boolean,
  unknown;

  static ExtractedValueType fromName(String? name) =>
      ExtractedValueType.values.firstWhere(
        (v) => v.name == name,
        orElse: () => ExtractedValueType.unknown,
      );

  /// Types whose value must survive a strict parse before it can be trusted.
  bool get isStrictlyTyped =>
      this == date || this == datetime || this == money || this == number;
}

/// How much a single extracted value can be relied on.
///
/// These are review states, not a score. The user is shown the state, so it has
/// to mean something they could act on rather than a number they would have to
/// interpret.
///
/// Deliberate rule, enforced in the validator: **the machine can never produce
/// [confirmed].** A model saying it is confident is not the same thing as a
/// human agreeing, and the product contract is that nothing becomes an Action
/// without confirmation. [highConfidence] is therefore the machine ceiling —
/// it means "grounded in the document", not "probably right".
enum FieldReviewState {
  /// A person confirmed or typed this. Only [ExtractedField.confirmedByUser]
  /// sets it.
  confirmed,

  /// Evidence for this value was found verbatim in the source text and the
  /// value is consistent with that evidence. Still needs confirmation.
  highConfidence,

  /// Present but not grounded, not parseable, or contradicted. Must be shown
  /// as uncertain.
  needsReview,

  /// The document does not state this. The value is null and stays null —
  /// unknown remains unknown.
  missing;

  static FieldReviewState fromName(String? name) =>
      FieldReviewState.values.firstWhere(
        (v) => v.name == name,
        // Anything unrecognised is treated as not yet trustworthy.
        orElse: () => FieldReviewState.needsReview,
      );

  /// Whether this state permits the value to be presented as a fact rather
  /// than a suggestion.
  bool get isTrusted => this == confirmed || this == highConfidence;
}

/// What kind of obligation the document represents.
///
/// Kept small and concrete. A category the user cannot picture is worse than
/// none, and every extra member is another thing the model can pick wrongly.
enum ActionCategory {
  payment('Payment'),
  renewal('Renewal'),
  appointment('Appointment'),
  booking('Booking'),
  travel('Travel'),
  deadline('Deadline'),
  response('Reply needed'),
  delivery('Delivery'),
  document('Document'),

  /// The document was understood and genuinely asks nothing of the user.
  /// Distinct from [unknown], which means we could not tell.
  noActionRequired('No action needed'),

  unknown('Not sure');

  const ActionCategory(this.label);

  final String label;

  static ActionCategory fromName(String? name) =>
      ActionCategory.values.firstWhere(
        (v) => v.name == name,
        orElse: () => ActionCategory.unknown,
      );
}

/// How much attention this deserves.
///
/// Names mirror the design system's urgency colour tokens so the UI never has
/// to translate between two vocabularies.
enum ActionUrgency {
  critical('Critical'),
  important('Important'),
  normal('Normal'),
  low('Low'),

  /// We could not establish urgency from the document. Never rendered as a
  /// calm "low" — not knowing and knowing it is minor are different claims.
  unknown('Not sure');

  const ActionUrgency(this.label);

  final String label;

  static ActionUrgency fromName(String? name) =>
      ActionUrgency.values.firstWhere(
        (v) => v.name == name,
        orElse: () => ActionUrgency.unknown,
      );
}

/// Overall verdict on one extraction run.
enum ExtractionReviewState {
  /// Everything the draft asserts is grounded. The user still confirms.
  readyForConfirmation,

  /// Usable, but at least one asserted value could not be grounded.
  needsReview,

  /// Nothing usable came back. The user types it in themselves; this path must
  /// always stay open.
  manualEntryRequired;

  static ExtractionReviewState fromName(String? name) =>
      ExtractionReviewState.values.firstWhere(
        (v) => v.name == name,
        orElse: () => ExtractionReviewState.needsReview,
      );
}

/// Which text the evidence was resolved against.
enum EvidenceSourceKind {
  /// Normalised OCR output for an image capture.
  ocrText,

  /// Text the user pasted or typed by hand.
  pastedText,

  unknown;

  static EvidenceSourceKind fromName(String? name) =>
      EvidenceSourceKind.values.firstWhere(
        (v) => v.name == name,
        orElse: () => EvidenceSourceKind.unknown,
      );
}

/// How well a quoted piece of evidence could be located in the source text.
///
/// Resolved on the client, always. A model-supplied offset is a claim about a
/// string it only saw a copy of, and day 4 established that OCR text is exactly
/// the kind of input where such a claim silently drifts.
enum EvidenceGrounding {
  /// Found verbatim in the source text.
  exact,

  /// Found after levelling case and collapsing whitespace, and nothing else.
  /// Still a real occurrence — no characters were changed to make it match.
  normalized,

  /// Not found. Nothing depending on this evidence may be presented as a fact.
  unresolved;

  static EvidenceGrounding fromName(String? name) =>
      EvidenceGrounding.values.firstWhere(
        (v) => v.name == name,
        orElse: () => EvidenceGrounding.unresolved,
      );

  bool get isResolved => this != unresolved;
}
