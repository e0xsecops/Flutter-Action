/// Which model answers extraction requests, and the limits it answers under.
///
/// The model name is **configuration, not a product rule**. It sits behind this
/// one type so that changing it — or later sourcing it from Remote Config —
/// touches nothing else. Nothing in the domain, the validator or the UI knows
/// what model produced a result; they only see [ExtractionResult.engine].
///
/// Remote Config is deliberately *not* wired today. Day 6 already introduces
/// two live dependencies that have to be proven on device (App Check and AI
/// Logic), and adding a third service whose failure mode is "the app silently
/// uses a different model" would make a bad live call harder to diagnose, not
/// easier. [ExtractionModelSource] is the seam that makes adding it later a
/// one-class change, and the standing rule stays: **app startup must never
/// depend on Remote Config succeeding**, so any future implementation resolves
/// lazily with [LocalExtractionModelSource.fallback] as the answer until it
/// does not.
class ExtractionModelConfig {
  const ExtractionModelConfig({
    this.modelName = defaultModelName,
    this.maxOutputTokens = defaultMaxOutputTokens,
    this.requestTimeout = defaultTimeout,
  });

  /// The first live extraction model. Not a preview model.
  static const String defaultModelName = 'gemini-3.6-flash';

  /// Bounded so a runaway generation cannot cost an unbounded amount.
  ///
  /// A response that hits the ceiling is truncated mid-JSON, which fails
  /// [ExtractionValidator] as malformed and lands the user on manual entry —
  /// a safe, visible failure rather than a half-parsed draft. Sized for the
  /// contract's own limits: 24 fields and 8 steps, each with an evidence quote.
  static const int defaultMaxOutputTokens = 4096;

  /// Long enough for a cold model on a slow connection, short enough that the
  /// UI is never stuck. A timeout is a transport failure and stays retryable.
  static const Duration defaultTimeout = Duration(seconds: 45);

  final String modelName;
  final int maxOutputTokens;
  final Duration requestTimeout;

  /// Used as [ExtractionResult.engine] so a fixture run is never mistaken for a
  /// provider run in stored data or a bug report.
  String get engineId => 'firebase_ai/googleai/$modelName';

  ExtractionModelConfig copyWith({String? modelName}) => ExtractionModelConfig(
        modelName: modelName ?? this.modelName,
        maxOutputTokens: maxOutputTokens,
        requestTimeout: requestTimeout,
      );
}

/// Where the model configuration comes from.
///
/// One implementation today. The interface exists so a Remote Config-backed
/// source can be dropped in without the adapter changing.
abstract interface class ExtractionModelSource {
  ExtractionModelConfig get current;
}

/// The compiled-in default. Always available, never fails, never blocks.
class LocalExtractionModelSource implements ExtractionModelSource {
  const LocalExtractionModelSource([this.config = const ExtractionModelConfig()]);

  final ExtractionModelConfig config;

  /// The value any future remote source must fall back to.
  static const ExtractionModelConfig fallback = ExtractionModelConfig();

  @override
  ExtractionModelConfig get current => config;
}
