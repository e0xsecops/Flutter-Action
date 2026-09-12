/// The mechanical half of the tool-copy contract.
///
/// `ToolCopy.resolveIn` in `lib/l10n/enum_labels.dart` switches on every id
/// with no default arm, so the compiler already proves that each id resolves to
/// *a* bundle getter. What it cannot prove is that each one resolves to the
/// *right* getter: `ToolPhraseId.sectionAnswer => l10n.toolSectionNote` is a
/// typo that compiles, ships, and puts the wrong heading on the screen.
///
/// So the naming rule is the test. Member name = ARB key with the leading
/// `tool` removed, lowerCamel — stated in `tool_copy.dart`, enforced here, in
/// both directions:
///
/// 1. every id resolves to the key its own name names, and
/// 2. every tool key in the ARB has an id, so a merged key cannot sit in the
///    template for months with nothing rendering it.
///
/// Read as source text rather than through the generated class, because that is
/// the only way to see *which* getter an arm actually names.
library;

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const _arb = 'lib/l10n/app_en.arb';
const _copy = 'lib/features/intelligence/domain/tool_copy.dart';
const _labels = 'lib/l10n/enum_labels.dart';

/// `sectionAnswer` -> `toolSectionAnswer`.
String _keyFor(String member) =>
    'tool${member[0].toUpperCase()}${member.substring(1)}';

/// The members of one enum, in declaration order, comments stripped.
List<String> _membersOf(String source, String enumName) {
  final start = source.indexOf('enum $enumName {');
  expect(start, isNot(-1), reason: 'enum $enumName not found in $_copy');
  final body = source.substring(
    start + 'enum $enumName {'.length,
    source.indexOf('\n}', start),
  );
  return [
    for (final line in body.split('\n'))
      if (!line.trimLeft().startsWith('//'))
        for (final member in line.split(','))
          if (member.trim().isNotEmpty) member.trim(),
  ];
}

/// Every `SomeId.member => ...l10n.someKey...` arm, as member -> key.
///
/// Deliberately tolerant about what sits between the two: an arm may wrap, and
/// a counted arm ends in `(count)`. What it may not do is name a different key.
Map<String, String> _armsFor(String source, String enumName) {
  final arms = RegExp(
    '$enumName\\.([A-Za-z0-9_]+)\\s*=>\\s*(?:[^,;]*?)l10n\\.([A-Za-z0-9_]+)',
    dotAll: true,
  );
  return {
    for (final match in arms.allMatches(source))
      match.group(1)!: match.group(2)!,
  };
}

void main() {
  late Map<String, Object?> arb;
  late String copy;
  late String labels;

  setUpAll(() {
    arb = jsonDecode(File(_arb).readAsStringSync()) as Map<String, Object?>;
    copy = File(_copy).readAsStringSync();
    labels = File(_labels).readAsStringSync();
  });

  /// The ids whose key is not simply their own name.
  ///
  /// One entry, and it earns it: `factLoss` chooses between two keys at runtime
  /// depending on whether any dropped fact was hidden, so it cannot be named
  /// after either of them.
  const exempt = {'factLoss'};

  group('every id names the key it says it names', () {
    for (final enumName in const [
      'ToolPhraseId',
      'ToolCountedId',
      'ToolNamedId',
      'ToolNamedPairId',
      'ToolNamedListId',
    ]) {
      test(enumName, () {
        final members = _membersOf(copy, enumName);
        expect(members, isNotEmpty);

        final arms = _armsFor(labels, enumName);

        for (final member in members) {
          if (exempt.contains(member)) continue;

          expect(
            arms,
            contains(member),
            reason: '$enumName.$member has no arm in $_labels that reaches a '
                'bundle getter. Every id must resolve to one.',
          );
          expect(
            arms[member],
            _keyFor(member),
            reason: '$enumName.$member resolves to `${arms[member]}` but the '
                'naming rule makes it `${_keyFor(member)}`. Either the arm '
                'points at the wrong key — which compiles and renders the '
                'wrong sentence — or the id was named after the wrong key.',
          );
          expect(
            arb,
            contains(_keyFor(member)),
            reason: '${_keyFor(member)} is not in $_arb.',
          );
        }
      });
    }
  });

  test('every tool key in the ARB has an id rendering it', () {
    final ids = {
      for (final enumName in const [
        'ToolPhraseId',
        'ToolCountedId',
        'ToolNamedId',
        'ToolNamedPairId',
        'ToolNamedListId',
      ])
        ..._membersOf(copy, enumName),
    }.map(_keyFor).toSet();

    // Reached through a `ToolCopy` variant of its own rather than an id:
    // `ToolLinkObservationCopy` builds this line from a summary and a detail
    // that are each localized first, so the frame has a call site but no id.
    const reachedWithoutAnId = {'toolSectionLinkObservationLine'};

    final orphans = [
      for (final key in arb.keys)
        if (!key.startsWith('@') &&
            key.startsWith(RegExp('tool(Section|Warning|Label)')) &&
            !ids.contains(key) &&
            !reachedWithoutAnId.contains(key))
          key,
    ];

    expect(
      orphans,
      isEmpty,
      reason: 'These tool keys are translated into twenty languages and '
          'rendered by nothing:\n  ${orphans.join('\n  ')}\n'
          'Either give each one an id and a call site, or delete it — a key '
          'with no call site is twenty translations of nothing.',
    );
  });
}
