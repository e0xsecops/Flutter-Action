/// Every capability, in one place.
library;

import '../data/tools/create_tools.dart';
import '../data/tools/extract_tools.dart';
import '../data/tools/plan_tools.dart';
import '../data/tools/understand_tools.dart';
import '../data/tools/verify_tools.dart';
import 'intelligence_tool.dart';

abstract final class ToolRegistry {
  /// Every capability, in the order the Studio presents them.
  ///
  /// VERIFY grew by two at V2, and both additions are local: a credential
  /// scanner and a link inspector. They earned their place by answering
  /// questions no existing tool did — "is there a live key in what I am about
  /// to send" is not the same question as "is there personal data in it" — and
  /// by needing no provider, which is what lets someone who has connected
  /// nothing still get something out of this screen.
  static const List<IntelligenceToolDefinition> all = [
    // UNDERSTAND
    documentIntelligenceTool,
    askDocumentTool,
    smartSummaryTool,
    compareDocumentsTool,
    // PLAN
    goalOptimizerTool,
    actionPlanTool,
    smartChecklistTool,
    missingInformationTool,
    // CREATE
    rewriteTool,
    draftReplyTool,
    translateTool,
    // EXTRACT
    structuredDataTool,
    deadlineFinderTool,
    // VERIFY
    redactionTool,
    credentialScannerTool,
    linkInspectorTool,
    authenticityTool,
  ];

  static IntelligenceToolDefinition? byId(String id) {
    for (final tool in all) {
      if (tool.id == id) return tool;
    }
    // Null rather than throwing: a stored "recently used" id from an older
    // build should quietly disappear from the list, not crash the Studio.
    return null;
  }

  static List<IntelligenceToolDefinition> inCategory(
    IntelligenceCategory category,
  ) =>
      all.where((t) => t.category == category).toList();

  /// Tools that need no provider. Shown even when nothing is connected.
  static List<IntelligenceToolDefinition> get local =>
      all.where((t) => t.isLocal).toList();

  /// Tools that can act on what the user currently has selected.
  static List<IntelligenceToolDefinition> accepting(
    IntelligenceRunInput input,
  ) =>
      all.where((t) => t.accepts(input)).toList();
}

/// What Action knows about a source without asking anyone.
///
/// Deliberately crude and deliberately local. These are the signals a
/// deterministic rule can use to suggest a tool.
class SourceSignals {
  const SourceSignals({
    required this.characterCount,
    this.looksLikeCorrespondence = false,
    this.dateCount = 0,
    this.hasAmounts = false,
    this.hasTabularLayout = false,
    this.isImage = false,
  });

  final int characterCount;
  final bool looksLikeCorrespondence;
  final int dateCount;
  final bool hasAmounts;
  final bool hasTabularLayout;
  final bool isImage;

  /// Derives the signals from text, with plain pattern matching.
  factory SourceSignals.fromText(String text, {bool isImage = false}) {
    final dates = RegExp(
      r'\b(?:\d{1,2}[/-]\d{1,2}[/-]\d{2,4}|\d{4}-\d{2}-\d{2}'
      r'|\d{1,2}\s+(?:January|February|March|April|May|June|July|August'
      r'|September|October|November|December))',
      caseSensitive: false,
    ).allMatches(text).length;

    final correspondence = RegExp(
      r'\b(?:dear\s|yours sincerely|yours faithfully|kind regards|'
      r'best regards|to whom it may concern|please reply|we wrote to you)',
      caseSensitive: false,
    ).hasMatch(text);

    return SourceSignals(
      characterCount: text.length,
      looksLikeCorrespondence: correspondence,
      dateCount: dates,
      hasAmounts: RegExp(r'[£$€₹৳]\s?\d|\b\d+\.\d{2}\b').hasMatch(text),
      // Several runs of two-plus spaces on one line is what a column looks like
      // after OCR flattens it.
      hasTabularLayout: RegExp(r'(?:\S {2,}){2,}\S').hasMatch(text),
      isImage: isImage,
    );
  }
}

abstract final class ToolRecommendations {
  /// Suggests tools for a source, from local signals only.
  ///
  /// **Action never asks the AI which AI button to show.** Doing so would spend
  /// the user's money to render a menu, and would need the document sent before
  /// the user chose to send anything. Every rule here is a deterministic read of
  /// text Action already has.
  static List<IntelligenceToolDefinition> forSource(SourceSignals signals) {
    final picks = <IntelligenceToolDefinition>[];

    void add(IntelligenceToolDefinition tool) {
      if (!picks.contains(tool)) picks.add(tool);
    }

    if (signals.isImage) {
      add(authenticityTool);
    }
    // Two or more dates is where a document stops being informational and
    // starts being something with a deadline in it.
    if (signals.dateCount >= 2 || (signals.dateCount >= 1 && signals.hasAmounts)) {
      add(deadlineFinderTool);
    }
    if (signals.looksLikeCorrespondence) {
      add(draftReplyTool);
    }
    if (signals.hasTabularLayout) {
      add(structuredDataTool);
    }
    // Long enough that reading it is itself the chore.
    if (signals.characterCount > 2000) {
      add(smartSummaryTool);
    }

    // Always worth offering, and always last: a general "understand this" is a
    // sensible fallback but a poor headline when something more specific fits.
    add(documentIntelligenceTool);
    add(askDocumentTool);

    return picks.take(3).toList();
  }
}
