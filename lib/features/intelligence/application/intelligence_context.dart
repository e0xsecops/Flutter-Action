/// Turning what the user selected into what a tool can read.
///
/// **The rule this file enforces.** A tool sees exactly the sources the user
/// chose for this run, and nothing else. There is no ambient context, no
/// automatic inclusion of related Actions, and no path that hands a tool the
/// local database. See `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T4).
library;

import '../../capture/domain/source_item.dart';
import '../domain/ai_request.dart';
import '../domain/intelligence_tool.dart';
import '../domain/tool_registry.dart';

/// A label for a source, for the user and for citations.
///
/// Never a file path. A path can carry a real name, a folder structure or a
/// device username, none of which belong in a prompt or on a citation chip.
String labelForSource(SourceItem source) => switch (source.type) {
      SourceType.pastedText => 'Pasted note',
      SourceType.photo => 'Photo',
      SourceType.gallery => 'Screenshot',
    };

/// Builds the input for a run over [sources].
///
/// Only text is sent today: OCR output for a capture, the note itself for
/// pasted text. Image bytes are deliberately not attached even when a source
/// has an image — Action already has the recognised text, sending the picture
/// as well would multiply the cost of every run on the user's own key for no
/// gain on a document that OCR read cleanly.
IntelligenceRunInput buildRunInput({
  required List<SourceItem> sources,
  String? question,
  String? freeText,
  String? mode,
  String? targetLanguage,
}) {
  final parts = <AiPart>[];
  final labels = <String, String>{};

  for (final source in sources) {
    if (!source.hasText) continue;
    final label = labelForSource(source);
    labels[source.id] = label;
    parts.add(AiSourceTextPart(
      text: source.analysisText,
      sourceId: source.id,
      label: label,
    ));
  }

  return IntelligenceRunInput(
    parts: parts,
    question: question,
    freeText: freeText,
    mode: mode,
    targetLanguage: targetLanguage,
    sourceLabels: labels,
  );
}

/// Tools worth offering for one source, from local signals only.
///
/// Action never asks the AI which AI button to render — that would spend the
/// user's money to draw a menu, and would need the document sent before the
/// user chose to send anything.
List<IntelligenceToolDefinition> recommendedFor(SourceItem source) {
  final signals = source.hasText
      ? SourceSignals.fromText(
          source.analysisText,
          isImage: source.hasImage,
        )
      : SourceSignals(characterCount: 0, isImage: source.hasImage);
  return ToolRecommendations.forSource(signals);
}
