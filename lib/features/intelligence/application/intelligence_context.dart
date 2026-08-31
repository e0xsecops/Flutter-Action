/// Turning what the user selected into what a tool can read.
///
/// **The rule this file enforces.** A tool sees exactly the sources the user
/// chose for this run, and nothing else. There is no ambient context, no
/// automatic inclusion of related Actions, and no path that hands a tool the
/// local database. See `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T4).
library;

import '../../actions/domain/action_item.dart';
import '../../capture/domain/source_item.dart';
import '../domain/ai_request.dart';
import 'dart:io';
import 'dart:typed_data';

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
      // Still not the file name. A document's name is the most identifying
      // string a capture carries — it routinely holds a real name, an employer
      // or a case number — and this label reaches prompts and citation chips.
      SourceType.document => 'Document',
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

/// Adds the bytes of any document sources to a run.
///
/// **Separate from [buildRunInput], and async, because reading a file is.**
/// Keeping the synchronous builder synchronous means the picker, the
/// recommendations and the scope preview all stay free — a document is only
/// loaded at the point the user has actually asked to send it.
///
/// The filename sent is Action's own, never the user's. A document's name is
/// the most identifying string a capture carries — it routinely holds a real
/// name, an employer or a case number — and a provider has no use for it.
Future<IntelligenceRunInput> attachDocuments(
  IntelligenceRunInput input,
  List<SourceItem> sources, {
  Future<Uint8List> Function(String path)? readBytes,
}) async {
  final documents = sources.where((s) => s.hasDocument).toList();
  if (documents.isEmpty) return input;

  final read = readBytes ?? (path) => File(path).readAsBytes();
  final parts = <AiPart>[...input.parts];
  final labels = <String, String>{...input.sourceLabels};

  for (final source in documents) {
    final Uint8List bytes;
    try {
      bytes = await read(source.documentPath!);
    } on FileSystemException {
      // A capture whose file has gone is skipped rather than sent as an empty
      // attachment, which a provider would charge for and reject.
      continue;
    }
    final label = labelForSource(source);
    labels[source.id] = label;
    parts.add(AiDocumentPart(
      bytes: bytes,
      mimeType: source.mimeType ?? 'application/pdf',
      sourceId: source.id,
      filename: 'document.pdf',
      pageCount: source.pageCount,
      label: label,
    ));
  }

  return IntelligenceRunInput(
    parts: parts,
    question: input.question,
    freeText: input.freeText,
    mode: input.mode,
    targetLanguage: input.targetLanguage,
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
      : SourceSignals(
          characterCount: 0,
          isImage: source.hasImage,
          isDocument: source.hasDocument,
        );
  return ToolRecommendations.forSource(signals);
}

/// Renders an Action as text a tool can reason about.
///
/// **Only the Action's own fields, never the whole record set.** A tool pointed
/// at one Action sees that Action: its title, what it is for, what is due, what
/// it costs, its confirmed facts and its steps. It does not see the user's
/// other Actions, their sources, or anything the user did not point it at.
///
/// Facts are included because they are the part the user already confirmed —
/// they are the most trustworthy thing Action holds, and a plan built without
/// them would ignore the reference number the whole task turns on.
String describeAction(ActionItem action) {
  final buffer = StringBuffer()..writeln('Title: ${action.title}');

  if (action.summary case final summary? when summary.isNotEmpty) {
    buffer.writeln('Summary: $summary');
  }
  buffer.writeln('Status: ${action.status.name}');
  buffer.writeln('Urgency: ${action.urgency.name}');

  if (action.dueAt case final due?) {
    // Date-only stays date-only: inventing a time the user never set would put
    // a fabricated deadline in front of a model asked to plan around it.
    final at = due.wallClock;
    buffer.writeln(
      'Due: ${at.year}-${at.month.toString().padLeft(2, '0')}-'
      '${at.day.toString().padLeft(2, '0')}'
      '${due.isDateOnly ? '' : ' ${at.hour.toString().padLeft(2, '0')}:'
          '${at.minute.toString().padLeft(2, '0')}'}',
    );
  }
  if (action.amount case final amount?) {
    buffer.writeln('Amount: $amount');
  }
  if (action.recommendedNextStep case final next? when next.isNotEmpty) {
    buffer.writeln('Recommended next step: $next');
  }
  if (action.whyThisMatters case final why? when why.isNotEmpty) {
    buffer.writeln('Why it matters: $why');
  }

  if (action.facts.isNotEmpty) {
    buffer.writeln('Confirmed details:');
    for (final fact in action.facts) {
      buffer.writeln('- ${fact.label}: ${fact.value}');
    }
  }

  if (action.steps.isNotEmpty) {
    buffer.writeln('Steps so far:');
    for (final step in action.steps) {
      buffer.writeln(
        '- [${step.isCompleted ? 'x' : ' '}] ${step.title}'
        '${step.description == null ? '' : ' — ${step.description}'}',
      );
    }
  }

  return buffer.toString().trimRight();
}

/// Builds the input for a run over one Action.
IntelligenceRunInput buildActionRunInput({
  required ActionItem action,
  String? question,
  String? mode,
}) {
  return IntelligenceRunInput(
    // Fenced as source material like any other input: an Action's fields came
    // from a document originally, so text inside them is no more trustworthy
    // than the document was.
    parts: [
      AiSourceTextPart(
        text: describeAction(action),
        sourceId: action.id,
        label: 'Action',
      ),
    ],
    question: question,
    mode: mode,
    sourceLabels: {action.id: action.title},
  );
}

/// Tools worth offering on an Action, from what the Action already contains.
///
/// Deterministic, like the source recommendations: a plan with no steps wants
/// steps; one that came from correspondence wants a reply.
List<IntelligenceToolDefinition> recommendedForAction(ActionItem action) {
  final picks = <IntelligenceToolDefinition>[];

  void add(IntelligenceToolDefinition tool) {
    if (!picks.contains(tool)) picks.add(tool);
  }

  for (final tool in ToolRegistry.all) {
    if (!tool.acceptedInputs.contains(IntelligenceInputKind.action)) continue;

    final wanted = switch (tool.id) {
      // Nothing to break down yet.
      'action-plan' || 'smart-checklist' => action.steps.isEmpty,
      // A half-finished plan is where gaps actually bite.
      'missing-information' => action.steps.isNotEmpty,
      'deadline-finder' => action.dueAt == null,
      'draft-reply' => true,
      _ => false,
    };
    if (wanted) add(tool);
  }

  return picks.take(3).toList();
}
