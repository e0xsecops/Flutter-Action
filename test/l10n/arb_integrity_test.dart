/// The mechanical half of translation quality.
///
/// Twenty ARB files cannot be proofread by anyone on this project, and
/// pretending otherwise would be the actual failure mode. What *can* be
/// checked without reading a language is structure — and structure is where
/// the bugs that break the app live: a dropped placeholder crashes the format
/// call, a renamed one silently prints the wrong value, a missing plural
/// category throws at the moment a count reaches it, an empty string leaves a
/// blank button.
///
/// So this file holds every locale to the template's shape. It is the gate
/// that lets the product ship twenty languages without claiming they were
/// professionally reviewed: the claim it *does* make is that they are
/// structurally sound, and that claim is tested.
library;

import 'dart:convert';
import 'dart:io';

import 'package:action_app/l10n/supported_locales.dart';
import 'package:flutter_test/flutter_test.dart';

const _l10nDir = 'lib/l10n';

/// Every locale file, including the `zh` base that gen_l10n requires.
final _tags = [
  for (final language in AppLocales.all) language.tag,
  'zh',
];

Map<String, Object?> _read(String tag) {
  final file = File('$_l10nDir/app_$tag.arb');
  expect(file.existsSync(), isTrue, reason: 'app_$tag.arb is missing');
  return jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
}

/// Message keys, without the `@key` metadata entries.
Iterable<String> _messages(Map<String, Object?> arb) =>
    arb.keys.where((k) => !k.startsWith('@'));

/// The placeholder names in an ICU string: `{count}`, `{title}`.
///
/// Skips the plural and select selectors themselves — `{count, plural, ...}`
/// declares `count` and is caught by the same expression, which is what we
/// want, but the category names inside (`one`, `other`) are not placeholders.
Set<String> _placeholders(String value) {
  final names = <String>{};
  for (final match in RegExp(r'\{\s*([A-Za-z_][A-Za-z0-9_]*)\s*[,}]')
      .allMatches(value)) {
    names.add(match.group(1)!);
  }
  return names;
}

/// The plural categories declared by an ICU plural block, if any.
Set<String>? _pluralCategories(String value) {
  final start = RegExp(r'\{\s*\w+\s*,\s*plural\s*,').firstMatch(value);
  if (start == null) return null;
  final categories = <String>{};
  for (final match
      in RegExp(r'(?:^|\s)(=\d+|zero|one|two|few|many|other)\s*\{')
          .allMatches(value.substring(start.end))) {
    categories.add(match.group(1)!);
  }
  return categories;
}

/// Braces balance, and none of them are the stray `}` a bad edit leaves.
bool _bracesBalance(String value) {
  var depth = 0;
  for (final rune in value.runes) {
    if (rune == 0x7B) depth++;
    if (rune == 0x7D) depth--;
    if (depth < 0) return false;
  }
  return depth == 0;
}

void main() {
  late Map<String, Object?> template;

  setUpAll(() => template = _read('en'));

  test('the twenty declared languages each have a file', () {
    expect(AppLocales.all, hasLength(20));
    for (final language in AppLocales.all) {
      expect(
        File('$_l10nDir/app_${language.tag}.arb').existsSync(),
        isTrue,
        reason: '${language.englishName} is declared but has no ARB',
      );
    }
  });

  test('English is the only canonical locale', () {
    final canonical = AppLocales.all
        .where((l) => l.status == TranslationStatus.canonical)
        .toList();
    expect(canonical, hasLength(1));
    expect(canonical.single.locale.languageCode, 'en');
  });

  group('every locale matches the template', () {
    for (final tag in _tags) {
      if (tag == 'en') continue;

      test('$tag has every key, and no key of its own', () {
        final arb = _read(tag);
        final expected = _messages(template).toSet();
        final actual = _messages(arb).toSet();

        expect(
          expected.difference(actual),
          isEmpty,
          reason: '$tag is missing keys. An untranslated key falls back to '
              'English at runtime, so this is a gap rather than a crash — but '
              'it is still a gap, and it is invisible without this test.',
        );
        expect(
          actual.difference(expected),
          isEmpty,
          reason: '$tag has keys the template does not. These are dead: '
              'gen_l10n generates getters from the template alone.',
        );
      });

      test('$tag keeps every placeholder, by name', () {
        final arb = _read(tag);
        for (final key in _messages(template)) {
          final source = template[key] as String;
          final translated = arb[key] as String?;
          if (translated == null) continue;
          expect(
            _placeholders(translated),
            _placeholders(source),
            reason: 'Placeholder mismatch in $tag/$key.\n'
                '  en: $source\n'
                '  $tag: $translated\n'
                'A renamed placeholder prints nothing; a dropped one loses '
                'the number the sentence is about.',
          );
        }
      });

      test('$tag declares a usable set of plural categories', () {
        final arb = _read(tag);
        for (final key in _messages(template)) {
          final source = template[key] as String;
          if (_pluralCategories(source) == null) continue;

          final translated = arb[key] as String?;
          if (translated == null) continue;
          final categories = _pluralCategories(translated);

          expect(
            categories,
            isNotNull,
            reason: '$tag/$key drops the plural block the template declares. '
                'The generated getter still takes a count, so the number '
                'would simply never appear.',
          );
          expect(
            categories, contains('other'),
            reason: '$tag/$key has no `other` category. ICU falls back to it '
                'for every count the listed categories do not cover, and '
                'without it the lookup throws at runtime rather than at build.',
          );
        }
      });

      test('$tag has no empty or whitespace-only values', () {
        final arb = _read(tag);
        for (final key in _messages(arb)) {
          expect(
            (arb[key] as String).trim(),
            isNotEmpty,
            reason: '$tag/$key is empty. An empty label is a control with no '
                'name — invisible to sight and to a screen reader both.',
          );
        }
      });

      test('$tag has balanced braces in every value', () {
        final arb = _read(tag);
        for (final key in _messages(arb)) {
          expect(
            _bracesBalance(arb[key] as String),
            isTrue,
            reason: '$tag/$key has unbalanced braces: ${arb[key]}',
          );
        }
      });

      test('$tag carries no metadata blocks', () {
        final arb = _read(tag);
        expect(
          arb.keys.where((k) => k.startsWith('@') && k != '@@locale'),
          isEmpty,
          reason: 'Placeholder and plural metadata belong to the template '
              'only. Duplicating it in nineteen files is nineteen places for '
              'it to disagree with the one that is actually read.',
        );
      });

      test('$tag declares its own locale', () {
        expect(_read(tag)['@@locale'], tag);
      });
    }
  });

  group('the template itself', () {
    test('declares placeholders for every one it uses', () {
      for (final key in _messages(template)) {
        final used = _placeholders(template[key] as String);
        if (used.isEmpty) continue;
        final meta = template['@$key'] as Map<String, Object?>?;
        final declared =
            (meta?['placeholders'] as Map<String, Object?>?)?.keys.toSet() ??
                const <String>{};
        expect(
          declared,
          containsAll(used),
          reason: '$key uses $used but declares $declared. gen_l10n types the '
              'generated parameter from the declaration; an undeclared '
              'placeholder comes out as Object and formats as its toString.',
        );
      }
    });

    test('has no unused metadata blocks', () {
      final messages = _messages(template).toSet();
      for (final key in template.keys) {
        if (!key.startsWith('@') || key == '@@locale') continue;
        expect(
          messages,
          contains(key.substring(1)),
          reason: '$key documents a message that no longer exists.',
        );
      }
    });

    test('every message is a string', () {
      for (final key in _messages(template)) {
        expect(template[key], isA<String>(), reason: '$key is not a string');
      }
    });
  });

  test('nothing was left untranslated', () {
    // gen_l10n writes this file on every generation: one entry per locale
    // listing the keys it had to fall back to English for. An empty object is
    // the only acceptable state, because a fallback is invisible at runtime —
    // the app renders an English sentence inside a Bengali screen and nothing
    // reports it.
    final report = File('$_l10nDir/untranslated.json');
    expect(
      report.existsSync(),
      isTrue,
      reason: 'Run `flutter gen-l10n` — the untranslated report is missing.',
    );
    final entries = jsonDecode(report.readAsStringSync()) as Map;
    expect(
      entries,
      isEmpty,
      reason: 'These locales are missing keys and will render English for '
          'them: ${entries.keys.join(', ')}',
    );
  });
}
