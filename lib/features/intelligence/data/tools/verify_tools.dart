/// VERIFY — check what you are looking at.
///
/// Every tool here runs entirely on this device. That is a design decision, not
/// an optimisation: asking a third party to tell you which parts of your
/// document are sensitive means sending it the sensitive document, and a file's
/// own metadata needs no model to read. The useful consequence is that these
/// two work with no provider connected at all.
library;

import 'dart:typed_data';

import '../../domain/ai_request.dart';
import '../../domain/intelligence_result.dart';
import '../../domain/intelligence_tool.dart';
import '../../../../core/security/credential_scanner.dart';
import '../../../../core/security/file_identity.dart';
import '../../../../core/security/link_inspector.dart';
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
    FileIdentity? identity;
    if (image != null) {
      final bytes = Uint8List.fromList(image.bytes);
      report = await AuthenticityInspector.inspectImage(bytes);
      // Folded in here rather than given its own tool. "What is this file, and
      // is it what it says it is" is the same question this tool already asks
      // of the metadata, one level lower down, and a sixteenth card answering
      // half of it would be exactly the tool-directory sprawl V2 is avoiding.
      identity = FileIdentifier.identifyBytes(bytes, name: 'capture');
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
        if (identity != null)
          IntelligenceSection(
            title: 'The file itself',
            kind: IntelligenceSectionKind.facts,
            facts: [
              IntelligenceFact(
                label: 'Contents',
                value: identity.detected?.label ?? 'Not a format Action knows',
              ),
              IntelligenceFact(label: 'Size', value: identity.readableSize),
              // Grouped in fours, which is how a person compares two hashes by
              // eye against a download page.
              IntelligenceFact(
                label: 'SHA-256',
                value: identity.readableDigest,
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


// ---------------------------------------------------------------------------
// 16. Credential Scanner
// ---------------------------------------------------------------------------

/// Finds things that grant access, in text the user is about to hand over.
///
/// **Why this is a separate tool from "Hide sensitive details" rather than a
/// section inside it.** They answer different questions and deserve different
/// urgency. Leaking your postcode is embarrassing; leaking a live deployment
/// key is an incident that costs money and keeps costing it until the key is
/// revoked. Folding credentials into a list of emails and phone numbers would
/// bury the one finding that needs acting on today.
///
/// Entirely on this device, like everything else in VERIFY. Sending a config
/// file to a third party in order to be told it contains a secret would be a
/// remarkable way to leak a secret.
class CredentialScanStrategy implements LocalIntelligenceStrategy {
  const CredentialScanStrategy();

  @override
  Future<IntelligenceResult> run(IntelligenceRunInput input) async {
    final text = _plainTextOf(input);

    if (text.trim().isEmpty) {
      return IntelligenceResult(
        toolId: credentialScannerTool.id,
        sections: const [
          IntelligenceSection(
            title: 'Nothing to check',
            body: 'Paste some text, or choose a capture whose text has been '
                'read. This tool reads text only.',
          ),
        ],
      );
    }

    final findings = CredentialScanner.scan(text);

    if (findings.isEmpty) {
      return IntelligenceResult(
        toolId: credentialScannerTool.id,
        sections: const [
          IntelligenceSection(
            title: 'No credentials found',
            body: 'Action did not find anything shaped like an API key, a '
                'private key, a token or a password in this text.',
          ),
        ],
        warnings: [_coverage],
      );
    }

    final named = findings
        .where((f) => f.confidence != CredentialConfidence.statistical)
        .toList();
    final guessed = findings
        .where((f) => f.confidence == CredentialConfidence.statistical)
        .toList();

    return IntelligenceResult(
      toolId: credentialScannerTool.id,
      sections: [
        if (named.isNotEmpty)
          IntelligenceSection(
            title: named.length == 1
                ? '1 credential found'
                : '${named.length} credentials found',
            kind: IntelligenceSectionKind.facts,
            facts: [
              for (final finding in named)
                // The masked form, always. Rendering the whole key would put
                // it on a screen the user may be about to share — which is the
                // situation that brought them to this tool.
                IntelligenceFact(
                  label: finding.label,
                  value: finding.masked,
                ),
            ],
          ),
        if (guessed.isNotEmpty)
          IntelligenceSection(
            title: guessed.length == 1
                ? '1 thing that might be a secret'
                : '${guessed.length} things that might be secrets',
            kind: IntelligenceSectionKind.facts,
            facts: [
              for (final finding in guessed)
                IntelligenceFact(
                  label: finding.label,
                  value: finding.masked,
                  // Marked uncertain because it is: this pass found a
                  // random-looking string with no keyword to explain it, and
                  // a build id looks much the same.
                  uncertain: true,
                ),
            ],
          ),
        IntelligenceSection(
          title: 'What to do',
          kind: IntelligenceSectionKind.bullets,
          bullets: {for (final finding in findings) finding.advice}.toList(),
        ),
      ],
      artifacts: [
        IntelligenceArtifact(
          title: 'Copy with the credentials removed',
          text: CredentialScanner.redact(text, findings),
          isDraft: false,
        ),
      ],
      warnings: const [
        _coverage,
        IntelligenceWarning.caution(
          'Removing a key from a document does not disable it. If one of these '
          'has already been shared, revoke it with the provider and issue a '
          'new one.',
        ),
      ],
    );
  }

  static const _coverage = IntelligenceWarning.note(
    'This finds credentials with a recognisable shape. A password written out '
    'in a sentence will not be found, so read the text as well.',
  );
}

const credentialScannerTool = IntelligenceToolDefinition(
  id: 'credential-scanner',
  glyph: ToolGlyph.credential,
  title: 'Check for keys and passwords',
  shortDescription: 'Find credentials before you share something.',
  category: IntelligenceCategory.verify,
  acceptedInputs: {
    IntelligenceInputKind.source,
    IntelligenceInputKind.freeText,
  },
  localStrategy: CredentialScanStrategy(),
  privacyLevel: IntelligencePrivacyLevel.local,
);

// ---------------------------------------------------------------------------
// 17. Link Inspector
// ---------------------------------------------------------------------------

/// Reads the links in some text and reports what is observable about them.
///
/// **It never says a link is safe.** A phishing page served over HTTPS from a
/// short, correctly-spelled hostname produces no signals at all, and that is
/// the honest limit of what can be known without fetching the page. See
/// [LinkInspector] for the full argument; the tests assert that no string this
/// tool can produce contains "safe", "trusted" or "malicious".
///
/// Nothing is resolved, fetched or followed. Inspecting a link by sending it
/// somewhere would leak exactly the browsing the user is being careful about.
class LinkInspectionStrategy implements LocalIntelligenceStrategy {
  const LinkInspectionStrategy();

  /// Bounded so a long document cannot turn one tap into hundreds of rows.
  static const _maxLinks = 12;

  static final _urlPattern = RegExp(
    r'\b(?:[a-z][a-z0-9+.-]*://|www\.)[^\s<>"\]),]+',
    caseSensitive: false,
  );

  @override
  Future<IntelligenceResult> run(IntelligenceRunInput input) async {
    final text = _plainTextOf(input);
    final found = _urlPattern
        .allMatches(text)
        .map((m) => m.group(0)!)
        .map((u) => u.replaceAll(RegExp(r'[.,;:]+$'), ''))
        .toSet()
        .take(_maxLinks)
        .toList();

    if (found.isEmpty) {
      return IntelligenceResult(
        toolId: linkInspectorTool.id,
        sections: const [
          IntelligenceSection(
            title: 'No links found',
            body: 'Paste a link, or choose a capture that contains one.',
          ),
        ],
      );
    }

    final inspections = found.map(LinkInspector.inspect).toList();
    final flagged =
        inspections.where((i) => i.observations.isNotEmpty).toList();

    return IntelligenceResult(
      toolId: linkInspectorTool.id,
      sections: [
        IntelligenceSection(
          title: found.length == 1
              ? 'The link in this text'
              : '${found.length} links in this text',
          kind: IntelligenceSectionKind.facts,
          facts: [
            for (final inspection in inspections)
              IntelligenceFact(
                label: inspection.host ?? 'Unreadable',
                value: describeLinkVerdict(inspection.verdict),
                uncertain: inspection.observations.isNotEmpty,
              ),
          ],
        ),
        for (final inspection in flagged)
          IntelligenceSection(
            title: inspection.host ?? inspection.input,
            kind: IntelligenceSectionKind.bullets,
            bullets: [
              for (final observation in inspection.observations)
                '${observation.summary}. ${observation.detail}',
            ],
          ),
        if (flagged.isEmpty)
          const IntelligenceSection(
            title: 'Nothing unusual in how these are written',
            body: 'That is not the same as knowing the pages are trustworthy. '
                'Only you can judge whether you expected them.',
          ),
      ],
      warnings: const [
        IntelligenceWarning.note(
          'Action reads the address only. It does not open the link, look up '
          'the site, or check any reputation service — doing that would send '
          'your browsing somewhere.',
        ),
        IntelligenceWarning.caution(
          'A link with no signals can still be harmful. This finds problems in '
          'how an address is written, which is not everything there is to '
          'know about where it goes.',
        ),
      ],
    );
  }
}

const linkInspectorTool = IntelligenceToolDefinition(
  id: 'link-inspector',
  glyph: ToolGlyph.link,
  title: 'Check a link',
  shortDescription: 'What an address gives away before you open it.',
  category: IntelligenceCategory.verify,
  acceptedInputs: {
    IntelligenceInputKind.source,
    IntelligenceInputKind.freeText,
  },
  localStrategy: LinkInspectionStrategy(),
  privacyLevel: IntelligencePrivacyLevel.local,
  allowsShare: false,
);

/// The readable text of a run, from whichever parts carry any.
///
/// Shared by the two tools above; the redaction tool keeps its own copy
/// because it also needs to know whether an unreadable part was present.
String _plainTextOf(IntelligenceRunInput input) => [
      for (final part in input.parts)
        if (part is AiSourceTextPart)
          part.text
        else if (part is AiTextPart)
          part.text,
      ?input.freeText,
    ].join('\n\n');
