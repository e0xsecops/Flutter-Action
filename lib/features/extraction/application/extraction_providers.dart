import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/result.dart';
import '../data/extraction_model_config.dart';
import '../data/extraction_service.dart';
import '../data/extraction_transport.dart';
import '../data/firebase_ai_extraction_service.dart';
import '../data/firebase_ai_transport.dart';
import '../domain/extraction_input.dart';
import '../domain/extraction_result.dart';

/// Where the live provider is wired together.
///
/// The only place in the app that names a concrete transport. Swapping Firebase
/// AI Logic for something else, or a fixture service for a test, is a change to
/// this file and nothing else.
final extractionModelSourceProvider = Provider<ExtractionModelSource>(
  (ref) => const LocalExtractionModelSource(),
);

final extractionTransportProvider = Provider<ExtractionTransport>(
  (ref) => FirebaseAiTransport(
    modelSource: ref.watch(extractionModelSourceProvider),
  ),
);

final extractionServiceProvider = Provider<ExtractionService>(
  (ref) => FirebaseAiExtractionService(
    transport: ref.watch(extractionTransportProvider),
    modelSource: ref.watch(extractionModelSourceProvider),
  ),
);

/// Every state one extraction attempt can be in.
///
/// Exhaustive and closed, so a screen cannot forget a case and leave a spinner
/// running forever: [runExtraction] always resolves to [ExtractionFailed] or
/// [ExtractionCompleted], and there is no representable state that means
/// "started and never finished".
///
/// Note what is *not* modelled as a failure. A response that came back and
/// proved unusable is [ExtractionCompleted] carrying a result whose review
/// state is `manualEntryRequired` — because the remedy is different. A failed
/// request is worth retrying; an unusable answer is not, and the user needs the
/// manual path instead. Collapsing them would make the UI offer the wrong
/// remedy half the time.
sealed class ExtractionAttempt {
  const ExtractionAttempt();
}

final class ExtractionIdle extends ExtractionAttempt {
  const ExtractionIdle();
}

final class ExtractionRunning extends ExtractionAttempt {
  const ExtractionRunning();
}

/// No answer arrived. Retrying may work.
final class ExtractionFailed extends ExtractionAttempt {
  const ExtractionFailed(this.message, {this.cause});

  /// Plain language, already safe to show. Never a status code or stack trace.
  final String message;
  final Object? cause;

  bool get isRetryable => true;
}

/// An answer arrived and was validated. Inspect [ExtractionResult.reviewState]
/// for whether it is ready, needs review, or is unusable.
final class ExtractionCompleted extends ExtractionAttempt {
  const ExtractionCompleted(this.result);

  final ExtractionResult result;
}

/// Runs one extraction and folds the outcome into a closed state.
///
/// Never throws, so no caller can be left mid-flight. A provider failure leaves
/// the underlying capture and its OCR completely untouched — nothing here
/// writes to the source store, which is what makes retrying later safe.
Future<ExtractionAttempt> runExtraction(
  ExtractionService service,
  ExtractionInput input,
) async {
  try {
    return switch (await service.extract(input)) {
      Ok(:final value) => ExtractionCompleted(value),
      Err(:final message, :final cause) =>
        ExtractionFailed(message, cause: cause),
    };
  } on Object catch (error) {
    // The service contract says it does not throw. This is the backstop that
    // makes "no infinite spinner" a property of the code rather than a promise.
    return ExtractionFailed(
      ProviderFailureKind.unknown.userMessage,
      cause: error,
    );
  }
}
