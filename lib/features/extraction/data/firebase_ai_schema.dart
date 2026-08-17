import 'package:firebase_ai/firebase_ai.dart';

/// Translates the day-5 response contract into the SDK's [Schema] type.
///
/// Derived from `extractionResponseSchema` at runtime rather than hand-written
/// alongside it. A second, hand-maintained copy of the same schema is a
/// guaranteed source of drift — someone adds a field to the contract, forgets
/// the mirror, and the model is quietly constrained to an older shape while the
/// validator expects the newer one. There is one source of truth, and this
/// function is a projection of it.
///
/// The projection is exact in both directions. The contract states `required`;
/// the SDK states `optionalProperties` and derives `required` as
/// `properties - optional`. Computing one from the other round-trips, which
/// `firebase_ai_schema_test` asserts against the real contract.
Schema schemaFromContract(Map<String, Object?> node) {
  final type = node['type'] as String?;
  final description = node['description'] as String?;
  final nullable = node['nullable'] as bool?;

  switch (type) {
    case 'object':
      final rawProperties = _asMap(node['properties']);
      if (rawProperties == null || rawProperties.isEmpty) {
        throw ArgumentError('Object schema has no properties: $node');
      }

      final properties = <String, Schema>{
        for (final entry in rawProperties.entries)
          entry.key: schemaFromContract(_asMap(entry.value)!),
      };

      // Everything the contract does not list as required is optional. Passing
      // an explicit list matters: when `optionalProperties` is null the SDK
      // marks *every* property required, which would make the model fail rather
      // than omit a field the document genuinely does not contain.
      final required = (node['required'] as List? ?? const [])
          .whereType<String>()
          .toSet();
      final optional =
          properties.keys.where((key) => !required.contains(key)).toList();

      return Schema.object(
        properties: properties,
        optionalProperties: optional,
        description: description,
        nullable: nullable,
      );

    case 'array':
      final items = _asMap(node['items']);
      if (items == null) {
        throw ArgumentError('Array schema has no items: $node');
      }
      return Schema.array(
        items: schemaFromContract(items),
        description: description,
        nullable: nullable,
      );

    case 'string':
      final enumValues =
          (node['enum'] as List?)?.whereType<String>().toList(growable: false);
      if (enumValues != null && enumValues.isNotEmpty) {
        return Schema.enumString(
          enumValues: enumValues,
          description: description,
          nullable: nullable,
        );
      }
      return Schema.string(description: description, nullable: nullable);

    case 'integer':
      return Schema.integer(description: description, nullable: nullable);

    case 'number':
      return Schema.number(description: description, nullable: nullable);

    case 'boolean':
      return Schema.boolean(description: description, nullable: nullable);

    default:
      throw ArgumentError('Unsupported schema type "$type" in $node');
  }
}

/// Map literals nested inside a `Map<String, Object?>` arrive with whatever
/// value type Dart inferred for them, so they are re-viewed rather than cast.
Map<String, Object?>? _asMap(Object? value) =>
    value is Map ? value.cast<String, Object?>() : null;
