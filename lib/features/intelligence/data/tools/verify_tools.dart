/// VERIFY — check what you are looking at.
///
/// Both tools here run entirely on this device. That is a design decision, not
/// an optimisation: asking a third party to tell you which parts of your
/// document are sensitive means sending it the sensitive document, and a file's
/// own metadata needs no model to read. The useful consequence is that these
/// two work with no provider connected at all.
library;

import 'dart:typed_data';

import '../../domain/ai_request.dart';
import '../../domain/intelligence_result.dart';
import '../../domain/intelligence_tool.dart';
import '../authenticity_inspector.dart';
import '../sensitive_scanner.dart';

// ---------------------------------------------------------------------------
// 14. Sensitive Information / Redaction Assistant
// ---------------------------------------------------------------------------

/// Finds likely-sensitive strings and offers a redacted copy.
///
/// **On what "redacted" is allowed to mean.** For text, a redacted copy is a
/// new string with the selected spans replaced — the data is genuinely gone
/// from the copy. For an image or a PDF, drawing a black box over a region
/// leaves the pixels or the text object underneath it, and that is a redaction
/// in appearance only. Action will not call that redacted. Until it can burn
/// the data out of those formats it says plainly that it cannot, which is the
/// difference between a privacy feature and a privacy hazard.
class RedactionStrategy implements LocalIntelligenceStrategy {
  const RedactionStrategy();

  @override
  Future<IntelligenceResult> run(IntelligenceRunInput input) async {
    final text = _readableTextOf(input);
    final hasUnreadable = input.parts
        .any((p) => p is AiDocumentPart || p is AiImagePart);

    if (text.trim().isEmpty) {
      return IntelligenceResult(
        toolId: redactionTool.id,
        sections: const [
          IntelligenceSection(
            title: 'Nothing to scan',
            body: 'This tool reads text. Select a note, a pasted message, or a '
                'capture whose text has been read.',
          ),
        ],
        warnings: [
          if (hasUnreadable) _formatLimitWarning,
        ],
      );
    }

    final matches = SensitiveScanner.scan(text);

    if (matches.isEmpty) {
      return IntelligenceResult(
        toolId: redactionTool.id,
        sections: const [
          IntelligenceSection(
            title: 'Nothing obvious found',
            body: 'Action found no email addresses, phone numbers, card '
                'numbers or reference numbers in this text.',
          ),
        ],
        warnings: [_coverageWarning, if (hasUnreadable) _formatLimitWarning],
      );
    }

    // Everything is selected by default here, unlike suggestions that create
    // data: the safe default for a redaction is to remove more, and the user
    // unticks what they want kept.
    final suggestions = [
      for (var i = 0; i < matches.length; i++)
        IntelligenceSuggestion(
          id: 'redact-$i',
          kind: IntelligenceSuggestionKind.step,
          title: describeSensitiveKind(matches[i].kind),
          detail: matches[i].value,
          selectedByDefault: true,
        ),
    ];

    return IntelligenceResult(
      toolId: redactionTool.id,
      sections: [
        IntelligenceSection(
          title: matches.length == 1
              ? '1 thing worth hiding'
              : '${matches.length} things worth hiding',
          kind: IntelligenceSectionKind.facts,
          facts: [
            for (final match in matches)
              IntelligenceFact(
                label: describeSensitiveKind(match.kind),
                value: match.value,
              ),
          ],
        ),
      ],
      suggestions: suggestions,
      artifacts: [
        IntelligenceArtifact(
          title: 'Redacted copy',
          text: SensitiveScanner.redact(text, matches),
          isDraft: false,
        ),
      ],
      warnings: [_coverageWarning, if (hasUnreadable) _formatLimitWarning],
    );
  }

  static const _coverageWarning = IntelligenceWarning.note(
    'This finds patterns like emails, phone numbers and account numbers. It '
    'will not catch everything sensitive — read the copy before you share it.',
  );

  /// The honest statement of a real limitation.
  static const _formatLimitWarning = IntelligenceWarning.caution(
    'Action cannot redact images or PDF files. Covering something in a picture '
    'would leave the original underneath it, so it is not offered.',
  );

  static String _readableTextOf(IntelligenceRunInput input) => [
        for (final part in input.parts)
          if (part is AiSourceTextPart)
            part.text
          else if (part is AiTextPart)
            part.text,
        ?input.freeText,
      ].join('\n\n');
}

const redactionTool = IntelligenceToolDefinition(
  id: 'redaction-assistant',
  glyph: ToolGlyph.shield,
  title: 'Hide sensitive details',
  shortDescription: 'Find what should not be shared, and make a clean copy.',
  category: IntelligenceCategory.verify,
  acceptedInputs: {
    IntelligenceInputKind.source,
    IntelligenceInputKind.freeText,
  },
  localStrategy: RedactionStrategy(),
  privacyLevel: IntelligencePrivacyLevel.local,
);

// ---------------------------------------------------------------------------
// 15. Content Authenticity Inspector
// ---------------------------------------------------------------------------

/// Reports what a file can prove about its own origin — and no more.
///
/// See [AuthenticityInspector] for why this never returns a percentage.
class AuthenticityStrategy implements LocalIntelligenceStrategy {
  const AuthenticityStrategy();

  @override
  Future<IntelligenceResult> run(IntelligenceRunInput input) async {
    final image = input.parts.whereType<AiImagePart>().firstOrNull;

    final AuthenticityReport report;
    if (image != null) {
      report = await AuthenticityInspector.inspectImage(
        Uint8List.fromList(image.bytes),
      );
    } else {
      final text = [
        for (final part in input.parts)
          if (part is AiSourceTextPart) part.text,
        ?input.freeText,
      ].join('\n');
      if (text.trim().isEmpty) {
        return IntelligenceResult(
          toolId: authenticityTool.id,
          sections: const [
            IntelligenceSection(
              title: 'Nothing to inspect',
              body: 'Select an image or some text.',
            ),
          ],
        );
      }
      report = AuthenticityInspector.inspectText(text);
    }

    return IntelligenceResult(
      toolId: authenticityTool.id,
      sections: [
        IntelligenceSection(
          title: describeVerdict(report.verdict),
          body: explainVerdict(report.verdict),
        ),
        if (report.signals.isNotEmpty)
          IntelligenceSection(
            title: 'What this file says about itself',
            kind: IntelligenceSectionKind.facts,
            facts: [
              for (final signal in report.signals)
                IntelligenceFact(
                  label: signal.label,
                  value: signal.value,
                  uncertain: signal.experimental,
                ),
            ],
          ),
      ],
      warnings: const [
        // Repeated on every run, deliberately. This is the tool most likely to
        // be used to accuse someone, and the limit has to travel with the
        // answer rather than sitting in a help page.
        IntelligenceWarning.caution(
          'This reports what a file declares about itself. Metadata can be '
          'edited or stripped, so none of it is proof. Do not use this to '
          'accuse anyone.',
        ),
      ],
    );
  }
}

const authenticityTool = IntelligenceToolDefinition(
  id: 'authenticity-inspector',
  glyph: ToolGlyph.provenance,
  title: 'Check where this came from',
  shortDescription: 'What a file declares about its own origin.',
  category: IntelligenceCategory.verify,
  acceptedInputs: {
    IntelligenceInputKind.source,
    IntelligenceInputKind.freeText,
  },
  localStrategy: AuthenticityStrategy(),
  privacyLevel: IntelligencePrivacyLevel.local,
  allowsShare: false,
);
