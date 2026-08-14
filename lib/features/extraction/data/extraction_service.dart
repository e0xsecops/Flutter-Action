import '../../../core/result.dart';
import '../domain/extraction_input.dart';
import '../domain/extraction_result.dart';

/// Turns a read document into a draft the user can confirm.
///
/// The seam day 5 exists to build. Everything above this interface deals in
/// [ExtractionResult]; everything below it deals with whatever the provider of
/// the week actually is. No implementation detail — no Firebase handle, no
/// model name, no prompt, no HTTP status — may leak through it.
///
/// ## Why the return type has two failure shapes
///
/// [Err] means *no answer arrived*: no network, the provider refused, a
/// timeout. Retrying might work, and the UI should offer that.
///
/// [Ok] means an answer arrived and was validated. It may still be an
/// [ExtractionResult] with no draft and
/// [ExtractionReviewState.manualEntryRequired] — the provider replied with
/// something unusable. Retrying that is pointless; the user needs the manual
/// path instead. Collapsing the two into one failure would make the UI offer
/// the wrong remedy half the time.
abstract interface class ExtractionService {
  /// Never throws for ordinary failure. Bad documents, unusable responses and
  /// dead networks are expected outcomes of this product, not exceptions.
  Future<Result<ExtractionResult>> extract(ExtractionInput input);
}
