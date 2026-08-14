import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/data/evidence_resolver.dart';
import 'package:action_app/features/extraction/domain/extraction_evidence.dart';
import 'package:action_app/features/extraction/domain/extraction_input.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/extraction_test_support.dart';

void main() {
  const document = 'Northgate Mutual\n'
      'Renewal date: 30 September 2026\n'
      'Premium due: 780.00';

  group('EvidenceResolver', () {
    test('finds a verbatim quote and reports an exact range', () {
      final evidence =
          EvidenceResolver(inputFor(document)).resolve('Premium due: 780.00');

      expect(evidence.grounding, EvidenceGrounding.exact);
      expect(evidence.isGrounded, isTrue);
      expect(
        document.substring(evidence.start!, evidence.end!),
        'Premium due: 780.00',
        reason: 'the range must point at the characters it claims',
      );
    });

    test('matches through case and whitespace differences only', () {
      final evidence = EvidenceResolver(inputFor(document))
          .resolve('renewal   DATE:  30 september 2026');

      expect(evidence.grounding, EvidenceGrounding.normalized);
      // The offsets are into the original text, not the levelled copy, so a
      // highlight built from them lands on what the user can actually see.
      expect(
        document.substring(evidence.start!, evidence.end!),
        'Renewal date: 30 September 2026',
      );
    });

    test('does not bridge an OCR misread', () {
      // "78O.OO" is one recogniser slip away from "780.00". A matcher loose
      // enough to join them would ground values against text that does not
      // support them, so this must stay unresolved.
      final evidence =
          EvidenceResolver(inputFor(document)).resolve('Premium due: 78O.OO');

      expect(evidence.grounding, EvidenceGrounding.unresolved);
      expect(evidence.start, isNull);
      expect(evidence.quote, 'Premium due: 78O.OO');
    });

    test('refuses quotes too short to identify anything', () {
      final resolver = EvidenceResolver(inputFor(document));

      expect(resolver.resolve('30').grounding, EvidenceGrounding.unresolved);
      expect(resolver.resolve('').grounding, EvidenceGrounding.unresolved);
      expect(resolver.resolve(null).grounding, EvidenceGrounding.unresolved);
    });

    test('carries the source kind so day 6 knows what it is highlighting', () {
      final pasted = EvidenceResolver(
        inputFor(document, sourceType: SourceType.pastedText),
      ).resolve('Northgate Mutual');

      expect(pasted.sourceKind, EvidenceSourceKind.pastedText);
    });

    test('ties a quote to the recognised lines it covers', () {
      final input = inputFor(
        document,
        lines: const [
          ExtractionSourceLine(index: 0, text: 'Northgate Mutual'),
          ExtractionSourceLine(index: 1, text: 'Renewal date: 30 September 2026'),
          ExtractionSourceLine(index: 2, text: 'Premium due: 780.00'),
        ],
      );

      final evidence = EvidenceResolver(input).resolve('Renewal date: 30 September 2026');
      expect(evidence.lineIndexes, [1]);

      // A quote inside a longer line still points at that line.
      final partial = EvidenceResolver(input).resolve('Premium due');
      expect(partial.lineIndexes, [2]);
    });

    test('reports no line indexes when there is no OCR geometry', () {
      final evidence =
          EvidenceResolver(inputFor(document)).resolve('Northgate Mutual');
      expect(evidence.lineIndexes, isEmpty);
    });

    test('survives a JSON round trip and drops an unbacked range', () {
      final evidence =
          EvidenceResolver(inputFor(document)).resolve('Northgate Mutual');
      final restored = ExtractionEvidence.fromJson(evidence.toJson());

      expect(restored.grounding, EvidenceGrounding.exact);
      expect(restored.start, evidence.start);

      // A stored record that claims grounding without a range is not trusted on
      // the way back in.
      final suspect = ExtractionEvidence.fromJson({
        'quote': 'Northgate Mutual',
        'grounding': 'unresolved',
        'sourceKind': 'ocrText',
        'start': 0,
        'end': 16,
      });
      expect(suspect.start, isNull);
      expect(suspect.isGrounded, isFalse);
    });
  });

  group('EvidenceSupport', () {
    test('accepts an amount however the document punctuated it', () {
      expect(EvidenceSupport.supportsAmount('Total due: 1,780.00', '1780.00'), isTrue);
      expect(EvidenceSupport.supportsAmount('Total due: 1780', '1780.00'), isTrue);
      expect(EvidenceSupport.supportsAmount('Total due: 750.00', '780.00'), isFalse);
    });

    test('checks a date by day and year, not by its ISO spelling', () {
      expect(
        EvidenceSupport.supportsDate('Renewal date: 30 September 2026', DateTime(2026, 9, 30)),
        isTrue,
      );
      expect(
        EvidenceSupport.supportsDate('Issued 1 August 2026', DateTime(2026, 9, 30)),
        isFalse,
      );
      expect(
        EvidenceSupport.supportsDate('Works begin in the autumn', DateTime(2026, 9, 1)),
        isFalse,
        reason: 'prose with no numbers cannot support a specific date',
      );
    });

    test('ignores punctuation when checking a reference', () {
      expect(
        EvidenceSupport.supportsLiteral('Policy number: NM-4471-882', 'NM4471882'),
        isTrue,
      );
      expect(
        EvidenceSupport.supportsLiteral('Policy number: NM-4471-882', 'NM-4471-999'),
        isFalse,
      );
    });

    test('does not demand literal containment for free-form prose', () {
      expect(EvidenceSupport.appliesTo(ExtractedValueType.text), isFalse);
      expect(EvidenceSupport.appliesTo(ExtractedValueType.money), isTrue);
    });
  });
}
