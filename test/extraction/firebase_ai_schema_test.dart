import 'package:action_app/features/extraction/data/firebase_ai_schema.dart';
import 'package:action_app/features/extraction/data/provider_contract.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:flutter_test/flutter_test.dart';

/// The SDK schema is a projection of the day-5 contract, so these tests compare
/// the projection back against its source. A hand-maintained mirror would drift
/// the first time someone added a field to one and not the other; this is what
/// makes that impossible rather than merely discouraged.
void main() {
  final translated = schemaFromContract(extractionResponseSchema).toJson();

  /// The SDK serialises types in the OpenAPI style Gemini expects — `OBJECT`,
  /// not `object` — so comparisons here normalise rather than assume.
  String typeOf(Map<String, Object?> node) =>
      (node['type']! as String).toLowerCase();

  Map<String, Object?> objectAt(List<String> path) {
    Map<String, Object?> node = translated;
    for (final segment in path) {
      final properties = node['properties']! as Map<String, Object?>;
      node = properties[segment]! as Map<String, Object?>;
      if (typeOf(node) == 'array') {
        node = node['items']! as Map<String, Object?>;
      }
    }
    return node;
  }

  group('the translated schema mirrors the contract', () {
    test('the top level keeps every property and the same required set', () {
      final source = extractionResponseSchema;
      final sourceProps = (source['properties']! as Map).keys.toSet();
      final outProps = (translated['properties']! as Map).keys.toSet();

      expect(outProps, sourceProps);

      // The contract states `required`; the SDK states `optionalProperties` and
      // derives required as (properties − optional). Round-tripping must land
      // back on exactly the contract's list.
      expect(
        (translated['required']! as List).toSet(),
        (source['required']! as List).toSet(),
      );
      expect(typeOf(translated), 'object');
    });

    test('only schema_version and no_action_required are required', () {
      // Everything else must be omittable, or a document that genuinely has no
      // amount would force the model to invent one to satisfy the schema.
      expect(
        (translated['required']! as List).toSet(),
        {'schema_version', 'no_action_required'},
      );
    });

    test('nested objects and arrays survive the projection', () {
      final field = objectAt(['fields']);
      expect(
        (field['properties']! as Map).keys.toSet(),
        {'key', 'label', 'value', 'value_type', 'currency', 'evidence'},
      );
      expect(
        (field['required']! as List).toSet(),
        {'key', 'label', 'value_type'},
      );

      final step = objectAt(['steps']);
      expect(
        (step['properties']! as Map).keys.toSet(),
        {'title', 'description', 'due_at', 'evidence'},
      );
      expect((step['required']! as List).toSet(), {'title'});

      final consequence = objectAt(['consequence']);
      expect(
        (consequence['required']! as List).toSet(),
        {'text', 'evidence'},
        reason: 'a consequence without evidence is not a consequence',
      );
    });

    test('nullable values stay nullable', () {
      final field = objectAt(['fields']);
      final value = (field['properties']! as Map)['value'] as Map;
      expect(value['nullable'], isTrue);
    });
  });

  group('the model is constrained to vocabulary this build understands', () {
    test('category enum matches the domain exactly', () {
      final category =
          (translated['properties']! as Map)['category'] as Map<String, Object?>;

      expect(
        (category['enum']! as List).cast<String>(),
        ActionCategory.values.map((c) => c.name).toList(),
      );
      expect(category['format'], 'enum');
    });

    test('urgency enum matches the domain exactly', () {
      final urgency =
          (translated['properties']! as Map)['urgency'] as Map<String, Object?>;

      expect(
        (urgency['enum']! as List).cast<String>(),
        ActionUrgency.values.map((u) => u.name).toList(),
      );
    });

    test('value_type enum matches the domain exactly', () {
      final valueType =
          (objectAt(['fields'])['properties']! as Map)['value_type'] as Map;

      expect(
        (valueType['enum']! as List).cast<String>(),
        ExtractedValueType.values.map((v) => v.name).toList(),
      );
    });

    test('schema_version stays an integer', () {
      final version = (translated['properties']! as Map)['schema_version']
          as Map<String, Object?>;
      expect(typeOf(version), 'integer');
    });
  });

  group('translation refuses what it cannot represent', () {
    test('an unknown type is an error, not a silent passthrough', () {
      expect(
        () => schemaFromContract({'type': 'quantum'}),
        throwsArgumentError,
      );
    });

    test('an object with no properties is an error', () {
      expect(
        () => schemaFromContract({'type': 'object', 'properties': {}}),
        throwsArgumentError,
      );
    });

    test('an array with no items is an error', () {
      expect(
        () => schemaFromContract({'type': 'array'}),
        throwsArgumentError,
      );
    });
  });
}
