/// Runs one tool against one explicitly chosen context.
///
/// Everything that must be true of *every* tool run lives here, so a tool
/// cannot forget it: the provider is configured, the user has seen the
/// disclosure for it, the scope is known before anything costly is sent, the
/// response is validated before it is rendered, and cancelling actually stops
/// the transport.
library;

import 'dart:async';

import '../domain/ai_capabilities.dart';
import '../domain/ai_failure.dart';
import '../domain/ai_provider.dart';
import '../domain/ai_provider_config.dart';
import '../domain/ai_request.dart';
import '../domain/ai_response.dart';
import '../domain/ai_limits.dart';
import '../domain/intelligence_result.dart';
import '../domain/intelligence_tool.dart';

/// What the user is told while waiting.
///
/// Named stages rather than a percentage. A progress bar that is not measuring
/// anything is a small lie, and these are things that genuinely happen in order.
enum IntelligenceStage {
  idle,
  preparing,
  reading,
  analysing,
  building,
  done,
  failed,
  cancelled,
}

String describeStage(IntelligenceStage stage) => switch (stage) {
      IntelligenceStage.idle => '',
      IntelligenceStage.preparing => 'Preparing your document',
      IntelligenceStage.reading => 'Reading the selected pages',
      IntelligenceStage.analysing => 'Analysing',
      IntelligenceStage.building => 'Building your review',
      IntelligenceStage.done => 'Done',
      IntelligenceStage.failed => "That didn't finish",
      IntelligenceStage.cancelled => 'Stopped',
    };

/// What a run will cost in scope terms, shown before an expensive send.
///
/// Pages and files, never money. Provider pricing changes and a stale table
/// lies to the user — see `docs/v2/AI_PROVIDER_RESEARCH.md` §4.
class IntelligenceScope {
  const IntelligenceScope({
    required this.pageCount,
    required this.attachmentCount,
    required this.providerLabel,
  });

  final int pageCount;
  final int attachmentCount;
  final String providerLabel;

  /// Whether the user should be asked before this is sent.
  ///
  /// Below the threshold a disclosure is noise; above it, a silent send spends
  /// real money on someone else's key.
  bool get needsConfirmation =>
      pageCount >= AiLimits.scopeDisclosurePageThreshold;

  String get sentence {
    if (pageCount > 0) {
      return '$pageCount ${pageCount == 1 ? 'page' : 'pages'} will be analysed '
          'using your $providerLabel connection.';
    }
    if (attachmentCount > 0) {
      return '$attachmentCount ${attachmentCount == 1 ? 'file' : 'files'} will '
          'be analysed using your $providerLabel connection.';
    }
    return 'The text you selected will be sent to your $providerLabel '
        'connection.';
  }
}

/// A run in progress or finished.
class IntelligenceRunState {
  const IntelligenceRunState({
    this.stage = IntelligenceStage.idle,
    this.result,
    this.failure,
    this.streamedText,
  });

  final IntelligenceStage stage;
  final IntelligenceResult? result;
  final AiProviderFailure? failure;

  /// Partial text, for generative tools that stream.
  final String? streamedText;

  bool get isRunning => switch (stage) {
        IntelligenceStage.preparing ||
        IntelligenceStage.reading ||
        IntelligenceStage.analysing ||
        IntelligenceStage.building =>
          true,
        _ => false,
      };
}

/// Resolves the provider for the configured kind.
typedef AiProviderResolver = AiProvider? Function(AiProviderKind kind);

class IntelligenceRunner {
  const IntelligenceRunner({
    required this.resolveProvider,
  });

  final AiProviderResolver resolveProvider;

  /// What this run would send, for the pre-send disclosure.
  IntelligenceScope scopeFor(
    IntelligenceToolDefinition tool,
    IntelligenceRunInput input,
    AiProviderConfig config,
  ) {
    var pages = 0;
    var attachments = 0;
    for (final part in input.parts) {
      switch (part) {
        case AiDocumentPart(:final pageCount):
          attachments++;
          pages += pageCount ?? 0;
        case AiImagePart():
          attachments++;
        case AiTextPart():
        case AiSourceTextPart():
          break;
      }
    }
    return IntelligenceScope(
      pageCount: pages,
      attachmentCount: attachments,
      providerLabel: config.kind.label,
    );
  }

  /// Runs [tool]. Emits each stage as it is reached.
  ///
  /// A stream rather than a future so the UI can show real progress without the
  /// runner knowing anything about widgets, and so cancellation has somewhere
  /// natural to land.
  Stream<IntelligenceRunState> run({
    required IntelligenceToolDefinition tool,
    required IntelligenceRunInput input,
    required AiProviderConfig? config,
    AiCancellationToken? cancel,
  }) async* {
    // A local tool runs before any provider is consulted, so it works with no
    // key connected. Putting this first is what makes that true rather than
    // aspirational — a `config == null` check above it would lock out the two
    // tools that never needed a provider.
    if (tool.isLocal) {
      yield const IntelligenceRunState(stage: IntelligenceStage.analysing);
      try {
        final result = await tool.localStrategy!.run(input);
        yield IntelligenceRunState(
          stage: IntelligenceStage.done,
          result: result,
        );
      } on Object catch (error) {
        yield IntelligenceRunState(
          stage: IntelligenceStage.failed,
          failure: AiProviderFailure(
            AiFailureKind.unknown,
            message: "That couldn't be checked.",
            technicalDetail: error.toString(),
          ),
        );
      }
      return;
    }

    if (config == null) {
      yield IntelligenceRunState(
        stage: IntelligenceStage.failed,
        failure: AiProviderFailure(
          AiFailureKind.notConfigured,
          message: 'Connect an AI provider to use this tool.',
        ),
      );
      return;
    }

    final provider = resolveProvider(config.kind);
    if (provider == null) {
      yield IntelligenceRunState(
        stage: IntelligenceStage.failed,
        failure: AiProviderFailure(
          AiFailureKind.notConfigured,
          message: 'That AI provider is no longer available in this version.',
        ),
      );
      return;
    }

    yield const IntelligenceRunState(stage: IntelligenceStage.preparing);

    final AiRequest request;
    try {
      request = _buildRequest(tool, input);
    } on AiProviderFailure catch (failure) {
      yield IntelligenceRunState(
        stage: IntelligenceStage.failed,
        failure: failure,
      );
      return;
    }

    yield IntelligenceRunState(
      stage: request.parts.any((p) => p is AiDocumentPart)
          ? IntelligenceStage.reading
          : IntelligenceStage.analysing,
    );

    final AiResponse response;
    try {
      response = await provider.send(config, request, cancel: cancel);
    } on AiProviderFailure catch (failure) {
      yield IntelligenceRunState(
        stage: failure.kind == AiFailureKind.cancelled
            ? IntelligenceStage.cancelled
            : IntelligenceStage.failed,
        failure: failure,
      );
      return;
    }

    if (cancel?.isCancelled ?? false) {
      yield const IntelligenceRunState(stage: IntelligenceStage.cancelled);
      return;
    }

    yield const IntelligenceRunState(stage: IntelligenceStage.building);

    final IntelligenceResult parsed;
    try {
      parsed = tool.strategy!.parse(response, input);
    } on FormatException catch (error) {
      // A response that does not match the contract is a failure, never a
      // partially rendered result. Half-valid extracted facts shown as
      // confirmed data is the specific outcome this guards against.
      yield IntelligenceRunState(
        stage: IntelligenceStage.failed,
        failure: AiProviderFailure(
          AiFailureKind.malformedResponse,
          message: 'That reply did not come back in a usable form. Try again.',
          technicalDetail: error.message,
        ),
      );
      return;
    }

    yield IntelligenceRunState(
      stage: IntelligenceStage.done,
      result: _annotate(parsed, response, tool),
    );
  }

  AiRequest _buildRequest(
    IntelligenceToolDefinition tool,
    IntelligenceRunInput input,
  ) {
    if (!tool.accepts(input)) {
      throw AiProviderFailure(
        AiFailureKind.inputTooLarge,
        message: tool.requiresQuestion
            ? 'Type a question first.'
            : 'Choose something for this tool to work on.',
      );
    }

    final parts = <AiPart>[
      ...input.parts,
      if (input.freeText != null && input.freeText!.trim().isNotEmpty)
        AiTextPart(input.freeText!.trim()),
      if (input.question != null && input.question!.trim().isNotEmpty)
        AiTextPart('Question: ${input.question!.trim()}'),
    ];

    return AiRequest(
      systemInstruction: tool.strategy!.systemInstruction(input),
      parts: parts,
      contract: tool.strategy!.contract(input),
      maxOutputTokens: tool.maxOutputTokens,
    );
  }

  /// Adds the warnings only the runner can know about.
  ///
  /// These are honesty guards rather than polish. A truncated answer that looks
  /// whole, or an unevidenced factual claim presented like a quoted one, is
  /// something the user will act on.
  IntelligenceResult _annotate(
    IntelligenceResult result,
    AiResponse response,
    IntelligenceToolDefinition tool,
  ) {
    final warnings = <IntelligenceWarning>[...result.warnings];

    if (response.truncated) {
      warnings.add(const IntelligenceWarning.caution(
        'This reply was cut short, so it may be incomplete.',
      ));
    }

    final wantsEvidence =
        tool.extraCapabilities.contains(AiCapability.citations);
    if (wantsEvidence && !result.isGrounded && !result.isEmpty) {
      warnings.add(const IntelligenceWarning.caution(
        'Your model returned no supporting quotes, so nothing here is '
        'evidenced. Check it against the document before acting on it.',
      ));
    }

    return result.copyWith(
      warnings: warnings,
      usage: response.usage,
      modelId: response.modelId,
    );
  }
}
