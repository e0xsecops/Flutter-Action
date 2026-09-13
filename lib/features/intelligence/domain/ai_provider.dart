/// The contract every provider adapter implements.
///
/// This is the seam. Above it, nothing knows a provider's name; below it,
/// nothing knows what an intelligence tool is. A provider changing its endpoint,
/// its auth header or its structured-output shape is a change to one adapter.
library;

import 'ai_capabilities.dart';
import 'ai_provider_config.dart';
import 'ai_request.dart';
import 'ai_response.dart';

/// A cancellation signal that reaches the transport.
///
/// **Why not just ignore a late result.** On a BYOK key the user is paying for
/// tokens. Abandoning a `Future` still lets the request run to completion and
/// still bills for it, so leaving a screen has to actually close the connection.
/// See `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T9).
class AiCancellationToken {
  bool _cancelled = false;
  final List<void Function()> _listeners = [];

  bool get isCancelled => _cancelled;

  void cancel() {
    if (_cancelled) return;
    _cancelled = true;
    // Copied before iterating: a listener that removes itself while we are
    // walking the list would otherwise throw.
    for (final listener in List.of(_listeners)) {
      listener();
    }
    _listeners.clear();
  }

  /// Runs [listener] on cancellation, or immediately if already cancelled.
  void onCancel(void Function() listener) {
    if (_cancelled) {
      listener();
      return;
    }
    _listeners.add(listener);
  }
}

/// The outcome of a connection test.
class AiConnectionCheck {
  const AiConnectionCheck({
    required this.ok,
    required this.message,
    this.models = const [],
  });

  final bool ok;

  /// Shown verbatim in Settings, so it is written for a person.
  final String message;

  /// Models the provider reported, when discovery succeeded.
  final List<AiModelDescriptor> models;
}

abstract interface class AiProvider {
  AiProviderKind get kind;

  /// Models Action ships as presets for this provider.
  ///
  /// Hints, never a whitelist. Model ids are retired regularly, so a build that
  /// only accepts the ids current on its release day breaks over time — which is
  /// why a manual model id is always allowed alongside these.
  List<AiModelDescriptor> get presetModels;

  /// What [modelId] can do.
  ///
  /// Falls back to a conservative guess for an unrecognised id: assuming less
  /// produces a refusal the user can correct, assuming more produces a broken
  /// request they cannot.
  AiCapabilities capabilitiesFor(String modelId);

  /// Asks the provider what models the key can reach.
  ///
  /// Preferred over presets where it works, because it is current by definition.
  Future<AiConnectionCheck> testConnection(
    AiProviderConfig config, {
    AiCancellationToken? cancel,
  });

  /// Sends [request] and waits for the whole response.
  ///
  /// Throws [AiProviderFailure] and nothing else — an adapter that lets a raw
  /// transport exception escape has leaked both an unreadable message and,
  /// potentially, a request header.
  Future<AiResponse> send(
    AiProviderConfig config,
    AiRequest request, {
    AiCancellationToken? cancel,
  });

  /// Streams a generative response.
  ///
  /// Only meaningful when the model has [AiCapability.streaming] and the
  /// contract is [AiGroundedContract]; structured extraction does not stream.
  Stream<AiStreamEvent> stream(
    AiProviderConfig config,
    AiRequest request, {
    AiCancellationToken? cancel,
  });
}
