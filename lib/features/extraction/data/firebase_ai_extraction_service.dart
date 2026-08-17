import '../../../core/result.dart';
import '../domain/extraction_input.dart';
import '../domain/extraction_result.dart';
import 'extraction_model_config.dart';
import 'extraction_service.dart';
import 'extraction_transport.dart';
import 'extraction_validator.dart';
import 'provider_contract.dart';

/// The live extraction provider.
///
/// Deliberately thin. Its entire job is:
///
///   ExtractionInput → ExtractionRequest → provider → raw JSON string
///                   → ExtractionValidator → ExtractionResult
///
/// **It never constructs an [ActionDraft] or an [ExtractedField].** Every
/// guarantee the product makes about not inventing deadlines, not claiming
/// ungrounded consequences and not letting a model mark anything confirmed
/// lives in the day-5 validator. If this class could build domain objects
/// directly, there would be a second path into the app's trusted data with none
/// of those checks on it — so it has no such path, and the only thing it hands
/// the validator is a string.
///
/// There is no fallback extraction. When the provider cannot be reached the
/// answer is a typed failure, not a guess: quietly substituting a worse
/// extraction for a failed one is how a product starts inventing things.
class FirebaseAiExtractionService implements ExtractionService {
  const FirebaseAiExtractionService({
    required this.transport,
    this.modelSource = const LocalExtractionModelSource(),
    this.validator = const ExtractionValidator(),
    this.clock,
  });

  final ExtractionTransport transport;
  final ExtractionModelSource modelSource;
  final ExtractionValidator validator;

  /// Injectable so tests are not at the mercy of the wall clock.
  final DateTime Function()? clock;

  @override
  Future<Result<ExtractionResult>> extract(ExtractionInput input) async {
    final config = modelSource.current;
    final startedAt = _now();

    // Built here, not in the transport, so the instruction/document separation
    // is established before anything provider-shaped is involved.
    final request = ExtractionRequest.forInput(input);

    final ProviderResponse response;
    try {
      response = await transport.generate(request).timeout(
            config.requestTimeout,
            onTimeout: () => throw const ProviderTransportException(
              ProviderFailureKind.timedOut,
            ),
          );
    } on ProviderTransportException catch (error) {
      return Err(error.kind.userMessage, cause: error);
    } on Object catch (error) {
      // A transport that throws something unexpected is still a failure to get
      // an answer, not a bad document.
      return Err(ProviderFailureKind.unknown.userMessage, cause: error);
    }

    final elapsed = _now().difference(startedAt).inMilliseconds;

    // An empty or absent body is unusable *output*, not a transport failure:
    // something did come back. It goes through the validator like anything
    // else, which turns it into a manual-entry result with a stated reason
    // rather than a silent nothing.
    return Ok(
      validator.validate(
        payload: response.text,
        input: input,
        engine: config.engineId,
        producedAt: startedAt,
        durationMs: elapsed,
      ),
    );
  }

  DateTime _now() => (clock ?? DateTime.now)();
}
