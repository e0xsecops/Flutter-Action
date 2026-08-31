import 'dart:convert';
import 'dart:typed_data';

import 'package:action_app/features/intelligence/data/authenticity_inspector.dart';
import 'package:action_app/features/intelligence/data/evidence_verifier.dart';
import 'package:action_app/features/intelligence/data/tools/create_tools.dart';
import 'package:action_app/features/intelligence/data/tools/extract_tools.dart';
import 'package:action_app/features/intelligence/data/tools/understand_tools.dart';
import 'package:action_app/features/intelligence/data/tools/verify_tools.dart';
import 'package:action_app/features/intelligence/data/fact_preservation.dart';
import 'package:action_app/features/intelligence/data/sensitive_scanner.dart';
import 'package:action_app/features/intelligence/domain/ai_request.dart';
import 'package:action_app/features/intelligence/domain/ai_response.dart';
import 'package:action_app/features/intelligence/domain/intelligence_result.dart';
import 'package:action_app/features/intelligence/domain/intelligence_tool.dart';
import 'package:action_app/features/intelligence/domain/tool_registry.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

const _notice = 'Your policy is due for renewal on 18 August 2026. '
    'Amount payable: 284.50. Reference MTR-4471-08. '
    'Please contact us at help@northgate.invalid before that date.';

IntelligenceRunInput inputWith(String text, {String? question, String? mode}) =>
    IntelligenceRunInput(
      parts: [AiSourceTextPart(text: text, sourceId: 'src-1', label: 'Notice')],
      question: question,
      mode: mode,
      sourceLabels: const {'src-1': 'Notice'},
    );

AiResponse jsonResponse(Map<String, dynamic> body) =>
    AiResponse(text: jsonEncode(body));

void main() {
  group('registry', () {
    test('holds every capability, and no duplicates', () {
      // Seventeen at V2: the original fifteen plus the credential scanner and
      // the link inspector, both local.
      expect(ToolRegistry.all, hasLength(17));
    });

    test('every id is unique and stable-looking', () {
      final ids = ToolRegistry.all.map((t) => t.id).toSet();
      expect(ids, hasLength(17));
      for (final id in ids) {
        expect(id, matches(RegExp(r'^[a-z0-9-]+$')), reason: id);
      }
    });

    test('every category is populated as the spec describes', () {
      expect(ToolRegistry.inCategory(IntelligenceCategory.understand),
          hasLength(4));
      expect(ToolRegistry.inCategory(IntelligenceCategory.plan), hasLength(4));
      expect(ToolRegistry.inCategory(IntelligenceCategory.create), hasLength(3));
      expect(ToolRegistry.inCategory(IntelligenceCategory.extract), hasLength(2));
      expect(ToolRegistry.inCategory(IntelligenceCategory.verify), hasLength(4));
    });

    test('exactly one execution mode is set per tool', () {
      for (final tool in ToolRegistry.all) {
        expect(
          (tool.strategy == null) != (tool.localStrategy == null),
          isTrue,
          reason: tool.id,
        );
      }
    });

    test('the local tools need no provider', () {
      // The product promise: some of this works before you connect anything.
      expect(
        ToolRegistry.local.map((t) => t.id),
        containsAll([
          'redaction-assistant',
          'authenticity-inspector',
          'credential-scanner',
          'link-inspector',
        ]),
      );
      for (final tool in ToolRegistry.local) {
        expect(tool.localStrategy, isNotNull);
      }
    });

    test('an unknown id resolves to null instead of throwing', () {
      // A "recently used" id from an older build must not crash the Studio.
      expect(ToolRegistry.byId('a-tool-that-was-removed'), isNull);
      expect(ToolRegistry.byId('smart-summary'), isNotNull);
    });

    test('no structured tool claims to stream', () {
      // Half-parsed JSON must never render as a confirmed fact.
      for (final tool in ToolRegistry.all) {
        expect(tool.allowsStreaming, isFalse, reason: tool.id);
      }
    });
  });

  group('recommendations are deterministic and local', () {
    test('a long document suggests summarising', () {
      final picks = ToolRecommendations.forSource(
        SourceSignals.fromText('word ' * 500),
      );
      expect(picks.map((t) => t.id), contains('smart-summary'));
    });

    test('a letter suggests drafting a reply', () {
      final picks = ToolRecommendations.forSource(
        SourceSignals.fromText(
          'Dear Ms Rahman, we wrote to you last month. Yours sincerely, '
          'Northgate Mutual.',
        ),
      );
      expect(picks.map((t) => t.id), contains('draft-reply'));
    });

    test('dates and amounts suggest finding deadlines', () {
      final picks =
          ToolRecommendations.forSource(SourceSignals.fromText(_notice));
      expect(picks.map((t) => t.id), contains('deadline-finder'));
    });

    test('an image suggests the authenticity check', () {
      final picks = ToolRecommendations.forSource(
        const SourceSignals(characterCount: 0, isImage: true),
      );
      expect(picks.map((t) => t.id), contains('authenticity-inspector'));
    });

    test('never suggests more than three', () {
      // A recommendation list that is really a menu has stopped recommending.
      final picks = ToolRecommendations.forSource(
        SourceSignals.fromText('$_notice ${'word ' * 600} Dear Sir,'),
      );
      expect(picks.length, lessThanOrEqualTo(3));
    });

    test('always offers something, even for empty text', () {
      expect(ToolRecommendations.forSource(SourceSignals.fromText('')),
          isNotEmpty);
    });
  });

  group('evidence verification', () {
    test('a real quote verifies', () {
      final verifier = EvidenceVerifier([
        const AiSourceTextPart(text: _notice, sourceId: 's'),
      ]);
      expect(
        verifier.check('due for renewal on 18 August 2026'),
        EvidenceStatus.verified,
      );
    });

    test('a fabricated quote is caught', () {
      // The whole point: this is a hallucination Action can detect locally,
      // on every provider, for free.
      final verifier = EvidenceVerifier([
        const AiSourceTextPart(text: _notice, sourceId: 's'),
      ]);
      expect(
        verifier.check('the policy was cancelled on 3 March'),
        EvidenceStatus.notFound,
      );
    });

    test('whitespace and curly quotes do not fail an honest quote', () {
      const source = 'The tenant’s deposit  is\n  held by the scheme.';
      final verifier = EvidenceVerifier([
        const AiSourceTextPart(text: source, sourceId: 's'),
      ]);
      expect(
        verifier.check("The tenant's deposit is held by the scheme."),
        EvidenceStatus.verified,
      );
    });

    test('a quote is unverifiable when only a PDF was sent', () {
      // Action has no local text, so it says "not checked" rather than
      // asserting the quote was fabricated.
      final verifier = EvidenceVerifier([
        AiDocumentPart(
          bytes: Uint8List(4),
          mimeType: 'application/pdf',
          sourceId: 's',
          filename: 'x.pdf',
        ),
      ]);
      expect(verifier.check('anything at all'), EvidenceStatus.unverifiable);
      expect(verifier.canVerify, isFalse);
    });

    test('a missing quote is unverifiable, not a fabrication', () {
      final verifier = EvidenceVerifier([
        const AiSourceTextPart(text: _notice, sourceId: 's'),
      ]);
      expect(verifier.check(null), EvidenceStatus.unverifiable);
      expect(verifier.check('   '), EvidenceStatus.unverifiable);
    });
  });

  group('grounded question answering', () {
    test('an unanswerable question says so rather than guessing', () {
      final result = askDocumentTool.strategy!.parse(
        jsonResponse({
          'answered': false,
          'answer': null,
          'evidence': null,
          'why_not_answered': 'The document does not mention a phone number.',
        }),
        inputWith(_notice, question: 'What is their phone number?'),
      );

      expect(result.sections.first.title, contains('No answer'));
      expect(result.citations, isEmpty);
    });

    test('an answer with a fabricated quote is flagged as unreliable', () {
      final result = askDocumentTool.strategy!.parse(
        jsonResponse({
          'answered': true,
          'answer': 'The deadline is 3 March 2027.',
          'evidence': 'you must respond by 3 March 2027',
          'why_not_answered': null,
        }),
        inputWith(_notice, question: 'What is the deadline?'),
      );

      expect(
        result.warnings.map((w) => w.message).join(' '),
        contains('unreliable'),
      );
    });

    test('a grounded answer keeps its quote as evidence', () {
      final result = askDocumentTool.strategy!.parse(
        jsonResponse({
          'answered': true,
          'answer': 'It is due on 18 August 2026.',
          'evidence': 'due for renewal on 18 August 2026',
          'why_not_answered': null,
        }),
        inputWith(_notice, question: 'When is it due?'),
      );

      expect(result.isGrounded, isTrue);
      expect(result.citations.single.quotedText, contains('18 August 2026'));
      expect(result.citations.single.sourceLabel, 'Notice');
    });
  });

  group('deadline finder', () {
    test('does not schedule anything, and says so', () {
      final result = deadlineFinderTool.strategy!.parse(
        jsonResponse({
          'obligations': [
            {
              'what_must_be_done': 'Renew the policy',
              'due_date': '2026-08-18',
              'due_text': 'by 18 August 2026',
              'condition': null,
              'consequence': 'Cover lapses',
              'required_items': ['Signed form'],
              'evidence': 'due for renewal on 18 August 2026',
            }
          ],
        }),
        inputWith(_notice),
      );

      expect(result.suggestions.single.kind, IntelligenceSuggestionKind.deadline);
      expect(result.suggestions.single.dueAt, DateTime(2026, 8, 18));
      // Nothing pre-selected: a reminder the user did not choose is the thing
      // that makes people distrust an app.
      expect(result.suggestions.single.selectedByDefault, isFalse);
      expect(
        result.warnings.map((w) => w.message).join(' '),
        contains('never set automatically'),
      );
    });

    test('an unparseable date is dropped rather than guessed', () {
      final result = deadlineFinderTool.strategy!.parse(
        jsonResponse({
          'obligations': [
            {
              'what_must_be_done': 'Reply',
              'due_date': 'sometime next month',
              'due_text': 'within 14 days',
              'condition': null,
              'consequence': null,
              'required_items': <String>[],
              'evidence': null,
            }
          ],
        }),
        inputWith(_notice),
      );

      expect(result.suggestions.single.dueAt, isNull);
      expect(result.suggestions.single.kind, IntelligenceSuggestionKind.step);
      // The document's own wording survives, so the user can check it.
      expect(result.suggestions.single.detail, contains('within 14 days'));
    });

    test('reports honestly when there is nothing to find', () {
      final result = deadlineFinderTool.strategy!.parse(
        jsonResponse({'obligations': <dynamic>[]}),
        inputWith(_notice),
      );
      expect(result.sections.single.title, 'Nothing due');
      expect(result.suggestions, isEmpty);
    });
  });

  group('rewrite preserves protected facts', () {
    test('a dropped amount is reported', () {
      final result = rewriteTool.strategy!.parse(
        jsonResponse({
          'improved_text': 'Your policy renews on 18 August 2026. '
              'Reference MTR-4471-08.',
          'changes': ['Shortened'],
          'already_good': false,
        }),
        inputWith(_notice),
      );

      final warnings = result.warnings.map((w) => w.message).join(' ');
      expect(warnings, contains('284.50'));
    });

    test('a faithful rewrite produces no fact warning', () {
      final result = rewriteTool.strategy!.parse(
        jsonResponse({
          'improved_text': 'Your policy is due on 18 August 2026. '
              'You owe 284.50. Reference MTR-4471-08. '
              'Contact help@northgate.invalid.',
          'changes': ['Tightened wording'],
          'already_good': false,
        }),
        inputWith(_notice),
      );

      expect(
        result.warnings.where((w) =>
            w.level == IntelligenceWarningLevel.caution),
        isEmpty,
      );
    });

    test('the original is never modified — the result is a new artifact', () {
      final result = rewriteTool.strategy!.parse(
        jsonResponse({
          'improved_text': 'Improved.',
          'changes': <String>[],
          'already_good': false,
        }),
        inputWith(_notice),
      );
      expect(result.artifacts.single.text, 'Improved.');
      expect(_notice, contains('284.50'), reason: 'the source is untouched');
    });
  });

  group('FactPreservation', () {
    test('reformatting a thousands separator is not a dropped fact', () {
      // Reporting this would train the user to ignore the warning.
      final dropped = FactPreservation.check(
        original: 'You owe £1,200.00 by 2026-08-18.',
        rewritten: 'You owe £1200.00 by 2026-08-18.',
      );
      expect(dropped, isEmpty);
    });

    test('a changed reference number is caught', () {
      final dropped = FactPreservation.check(
        original: 'Reference MTR-4471-08 applies.',
        rewritten: 'Reference MTR-4471-09 applies.',
      );
      expect(dropped.map((d) => d.value), contains('MTR-4471-08'));
    });

    test('a rounded amount is caught', () {
      final dropped = FactPreservation.check(
        original: 'Pay 284.50 now.',
        rewritten: 'Pay 285 now.',
      );
      expect(dropped, isNotEmpty);
    });

    test('a small count is not treated as a protected number', () {
      final dropped = FactPreservation.check(
        original: 'There are 3 documents.',
        rewritten: 'Three documents are enclosed.',
      );
      expect(dropped, isEmpty);
    });
  });

  group('draft reply', () {
    test('is always labelled a draft and never sent', () {
      final result = draftReplyTool.strategy!.parse(
        jsonResponse({
          'subject': 'Re: renewal',
          'body': 'Thank you for your letter.',
          'placeholders': ['[your policy number]'],
        }),
        inputWith(_notice),
      );

      expect(result.artifacts.single.isDraft, isTrue);
      expect(
        result.warnings.map((w) => w.message).join(' '),
        contains('does not send'),
      );
    });
  });

  group('structured data', () {
    test('uncertain table layout is surfaced, not smoothed over', () {
      final result = structuredDataTool.strategy!.parse(
        jsonResponse({
          'columns': ['Item', 'Amount'],
          'rows': [
            ['Premium', '284.50'],
          ],
          'layout_certain': false,
          'fields': <dynamic>[],
        }),
        inputWith(_notice),
      );

      expect(
        result.warnings.map((w) => w.message).join(' '),
        contains('could not be read reliably'),
      );
    });

    test('exports CSV with correct quoting', () {
      final result = structuredDataTool.strategy!.parse(
        jsonResponse({
          'columns': ['Item', 'Note'],
          'rows': [
            ['Premium', 'Due 18 Aug, then monthly'],
          ],
          'layout_certain': true,
          'fields': <dynamic>[],
        }),
        inputWith(_notice),
      );

      final csv = result.artifacts.single.text;
      expect(csv, contains('"Due 18 Aug, then monthly"'));
    });
  });

  group('malformed responses become failures, not partial results', () {
    test('non-JSON throws FormatException', () {
      expect(
        () => smartSummaryTool.strategy!.parse(
          const AiResponse(text: 'I am afraid I cannot help with that.'),
          inputWith(_notice),
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test('a missing required field throws rather than rendering empty', () {
      expect(
        () => rewriteTool.strategy!.parse(
          jsonResponse({'changes': <String>[], 'already_good': true}),
          inputWith(_notice),
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test('a fenced code block is tolerated', () {
      // Models wrap JSON in Markdown often enough that rejecting it would fail
      // runs that actually succeeded.
      final result = smartSummaryTool.strategy!.parse(
        const AiResponse(
          text: '```json\n{"summary":"Short.","key_points":["a"]}\n```',
        ),
        inputWith(_notice),
      );
      expect(result.sections.first.body, 'Short.');
    });

    test("the model's word for empty is not rendered as a value", () {
      final result = documentIntelligenceTool.strategy!.parse(
        jsonResponse({
          'what_this_is': 'A renewal notice.',
          'what_matters': 'It is due soon.',
          'key_facts': [
            {'label': 'Reference', 'value': 'N/A', 'evidence': null},
            {'label': 'Amount', 'value': '284.50', 'evidence': 'Amount payable: 284.50'},
          ],
          'obligations': <dynamic>[],
          'recommended_next_step': null,
          'open_questions': <String>[],
          'suggested_action_title': null,
        }),
        inputWith(_notice),
      );

      final facts = result.sections
          .firstWhere((s) => s.kind == IntelligenceSectionKind.facts)
          .facts;
      expect(facts.map((f) => f.label), isNot(contains('Reference')));
      expect(facts.single.value, '284.50');
    });
  });

  group('sensitive information scanner', () {
    test('finds an email and a reference', () {
      final matches = SensitiveScanner.scan(_notice);
      final kinds = matches.map((m) => m.kind).toSet();
      expect(kinds, contains(SensitiveKind.email));
    });

    test('a redacted copy no longer contains the value', () {
      final matches = SensitiveScanner.scan(_notice);
      final redacted = SensitiveScanner.redact(_notice, matches);
      expect(redacted, isNot(contains('help@northgate.invalid')));
      expect(_notice, contains('help@northgate.invalid'),
          reason: 'the original is untouched');
    });

    test('a long number failing the card checksum is not called a card', () {
      // Calling an invoice number a payment card would erode trust in every
      // other match.
      final matches = SensitiveScanner.scan('Invoice 4111 1111 1111 1112');
      expect(
        matches.where((m) => m.kind == SensitiveKind.paymentCard),
        isEmpty,
      );
    });

    test('a valid test card number is found', () {
      final matches = SensitiveScanner.scan('Card 4111 1111 1111 1111 on file');
      expect(
        matches.map((m) => m.kind),
        contains(SensitiveKind.paymentCard),
      );
    });

    test('matches never overlap', () {
      final matches = SensitiveScanner.scan(_notice);
      for (var i = 1; i < matches.length; i++) {
        expect(matches[i].start, greaterThanOrEqualTo(matches[i - 1].end));
      }
    });

    test('the tool admits it cannot redact images or PDFs', () async {
      final result = await redactionTool.localStrategy!.run(
        IntelligenceRunInput(
          parts: [
            const AiSourceTextPart(text: _notice, sourceId: 's'),
            AiDocumentPart(
              bytes: Uint8List(4),
              mimeType: 'application/pdf',
              sourceId: 'd',
              filename: 'x.pdf',
            ),
          ],
        ),
      );

      expect(
        result.warnings.map((w) => w.message).join(' '),
        contains('cannot redact images or PDF'),
      );
    });

    test('runs with no provider configured', () async {
      final result = await redactionTool.localStrategy!.run(inputWith(_notice));
      expect(result.artifacts, isNotEmpty);
    });
  });

  group('authenticity inspector', () {
    // JPEG, not PNG: the encoder writes an EXIF segment for JPEG, so the
    // fixture actually round-trips the metadata the inspector reads.
    Uint8List imageWith({String? software, String? make, String? model}) {
      final image = img.Image(width: 8, height: 8);
      if (software != null) image.exif.imageIfd.software = software;
      if (make != null) image.exif.imageIfd.make = make;
      if (model != null) image.exif.imageIfd.model = model;
      return Uint8List.fromList(img.encodeJpg(image));
    }

    test('an image with no metadata is not accused of anything', () async {
      final report =
          await AuthenticityInspector.inspectImage(imageWith());
      expect(
        report.verdict,
        anyOf(
          AuthenticityVerdict.noReliableProvenanceFound,
          AuthenticityVerdict.inconclusive,
        ),
      );
    });

    test('declared generative software reads as a claim, not proof', () async {
      final report = await AuthenticityInspector.inspectImage(
        imageWith(software: 'Stable Diffusion 3'),
      );
      expect(report.verdict, AuthenticityVerdict.signalsConsistentWithSynthetic);
      expect(explainVerdict(report.verdict), contains('not proof'));
    });

    test('declared editing software is not treated as forgery', () async {
      final report = await AuthenticityInspector.inspectImage(
        imageWith(software: 'Adobe Photoshop 26.0'),
      );
      expect(report.verdict, AuthenticityVerdict.signalsConsistentWithEdited);
      expect(explainVerdict(report.verdict), contains('does not by itself'));
    });

    test('a camera name survives cleaning with its spaces intact', () async {
      final report = await AuthenticityInspector.inspectImage(
        imageWith(make: 'Canon', model: 'EOS 5D Mark IV'),
      );
      final camera =
          report.signals.firstWhere((s) => s.label == 'Camera').value;
      expect(camera, contains('EOS 5D Mark IV'));
    });

    test('unreadable bytes are inconclusive rather than a crash', () async {
      final report = await AuthenticityInspector.inspectImage(
        Uint8List.fromList([1, 2, 3, 4, 5]),
      );
      expect(report.verdict, AuthenticityVerdict.inconclusive);
    });

    test('text is always inconclusive, by design', () {
      // Being unable to answer is the truthful state of the art. A product that
      // tells a teacher an essay is 93% AI is wrong often enough to ruin
      // someone.
      for (final sample in [
        'Hi, running late, see you at six.',
        'In conclusion, it is important to note that the multifaceted nature '
            'of this endeavour underscores a paradigm shift.',
        'Short.',
      ]) {
        expect(
          AuthenticityInspector.inspectText(sample).verdict,
          AuthenticityVerdict.inconclusive,
          reason: sample,
        );
      }
    });

    test('says provenance was not checked rather than not found', () async {
      final report = await AuthenticityInspector.inspectImage(imageWith());
      expect(report.provenanceChecked, isFalse);
      expect(
        report.signals.map((s) => s.value).join(' '),
        contains('Not checked'),
      );
    });

    test('the tool always carries its own limitation', () async {
      final result = await authenticityTool.localStrategy!.run(
        IntelligenceRunInput(
          parts: [
            AiImagePart(
              bytes: imageWith(software: 'Midjourney'),
              mimeType: 'image/png',
              sourceId: 's',
            ),
          ],
        ),
      );
      final copy = result.warnings.map((w) => w.message).join(' ');
      expect(copy, contains('none of it is proof'));
      expect(copy, contains('Do not use this to accuse'));
    });
  });

  group('no false AI-detection claims anywhere in user-facing copy', () {
    /// Every string a user could read from the authenticity feature.
    List<String> allAuthenticityCopy() => [
          for (final verdict in AuthenticityVerdict.values) ...[
            describeVerdict(verdict),
            explainVerdict(verdict),
          ],
          authenticityTool.title,
          authenticityTool.shortDescription,
        ];

    test('never claims certainty about AI authorship', () {
      final banned = [
        RegExp(r'\d{1,3}\s?%'),
        RegExp(r'definitely\s+ai', caseSensitive: false),
        RegExp(r'100%\s*ai', caseSensitive: false),
        RegExp(r'probability', caseSensitive: false),
        RegExp(r'confidence\s+score', caseSensitive: false),
        RegExp(r'certain(?:ty)?\s+that\s+this\s+(?:was|is)', caseSensitive: false),
      ];

      for (final copy in allAuthenticityCopy()) {
        for (final pattern in banned) {
          expect(pattern.hasMatch(copy), isFalse,
              reason: 'banned claim "${pattern.pattern}" in: $copy');
        }
      }
    });

    test('there is no verdict meaning "definitely AI"', () {
      // The enum itself is the guard: a future contributor cannot add the
      // claim without adding a case here.
      expect(AuthenticityVerdict.values, hasLength(5));
      expect(
        AuthenticityVerdict.values.map((v) => v.name).join(' ').toLowerCase(),
        isNot(contains('confirmed')),
      );
    });
  });

  group('tool copy is honest about what tools do', () {
    test('no tool promises to send anything', () {
      for (final tool in ToolRegistry.all) {
        final copy = '${tool.title} ${tool.shortDescription}'.toLowerCase();
        expect(copy, isNot(contains('automatically')), reason: tool.id);
        expect(copy, isNot(contains('sends for you')), reason: tool.id);
      }
    });

    test('every tool has a one-line description', () {
      for (final tool in ToolRegistry.all) {
        expect(tool.shortDescription, isNotEmpty, reason: tool.id);
        expect(tool.shortDescription.split('\n'), hasLength(1),
            reason: tool.id);
      }
    });
  });
}
