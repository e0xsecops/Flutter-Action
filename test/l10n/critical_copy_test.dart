/// The semantic half of translation quality — as far as it can be tested.
///
/// `arb_integrity_test.dart` proves the twenty locales are structurally sound:
/// nothing crashes, no placeholder is lost, no button is blank. It cannot prove
/// that the Arabic for "could not verify this" does not say "verified". Nobody
/// on this project reads Arabic, and a test that claimed otherwise would be the
/// dishonesty it was written to prevent.
///
/// So this file tests the meaning-preserving properties that *are* checkable
/// without reading a language, and they turn out to be the ones that matter:
///
/// 1. **Distinctness.** A state is only a state if it is not the neighbouring
///    state. "Not sure" collapsing into "Low", or "Confirmed" into "Needs
///    review", is a product bug in any language, and comparing two strings for
///    equality needs no linguist.
/// 2. **Token survival.** The standards names the copy deliberately leaves
///    untranslated either appear in the translation or they were dropped. And
///    `Action` the brand is held apart from `action` the domain noun — the
///    product is named after its own central object, so the first must survive
///    every locale and the second must survive none.
/// 3. **No English reassurance leaked in.** A translator reaching for an
///    English word — *safe*, *secure*, *verified* — in a sentence whose English
///    original refuses to use it is the exact failure this product cannot
///    afford.
/// 4. **No clause silently lost.** A safety sentence that carries two claims in
///    English and comes back at a third of the length has lost one of them.
///    A blunt instrument, and deliberately generous, but it catches the
///    failure that a structural test cannot see at all.
/// 5. **The status the product claims is the status it has.** No locale may
///    describe itself as human-reviewed without a reviewer recorded.
///
/// What is left over — whether the *remaining* Arabic actually says what the
/// English says — is not testable here and is not claimed. It is tracked, per
/// locale, in `docs/v2/LOCALIZATION_REVIEW_STATUS.md`.
library;

import 'dart:convert';
import 'dart:io';

import 'package:action_app/l10n/supported_locales.dart';
import 'package:flutter_test/flutter_test.dart';

const _l10nDir = 'lib/l10n';
const _reviewStatusDoc = 'docs/v2/LOCALIZATION_REVIEW_STATUS.md';

/// Every shipped locale, plus the `zh` base file gen_l10n requires.
final _tags = [
  for (final language in AppLocales.all) language.tag,
  'zh',
];

Map<String, String> _read(String tag) {
  final raw = File('$_l10nDir/app_$tag.arb').readAsStringSync();
  final arb = jsonDecode(raw) as Map<String, Object?>;
  return {
    for (final entry in arb.entries)
      if (!entry.key.startsWith('@')) entry.key: entry.value! as String,
  };
}

/// The keys whose description begins `SAFETY:`.
///
/// Derived from the template rather than listed here, so a new safety string
/// is covered by these tests the moment it is written — the failure mode of a
/// hard-coded list is that it silently stops being the whole list.
List<String> _safetyKeys(Map<String, Object?> template) {
  final keys = <String>[];
  for (final entry in template.entries) {
    if (!entry.key.startsWith('@')) continue;
    final meta = entry.value;
    if (meta is! Map<String, Object?>) continue;
    final description = meta['description'] as String?;
    if (description != null && description.trimLeft().startsWith('SAFETY')) {
      keys.add(entry.key.substring(1));
    }
  }
  return keys;
}

/// Sets of labels that name mutually exclusive states.
///
/// Two states sharing a word is not a translation preference — it makes the
/// two indistinguishable on screen, which is the same as not showing either.
const _exclusiveGroups = <String, List<String>>{
  'urgency': [
    'urgencyCritical',
    'urgencyImportant',
    'urgencyNormal',
    'urgencyLow',
    'urgencyUnsure',
  ],
  'field state': [
    'reviewConfirmed',
    'reviewNeedsReview',
    'reviewMissing',
    'reviewNotVerified',
  ],
  'evidence outcome': [
    'evidenceHighlighted',
    'evidenceNoRegion',
    'evidenceInText',
    'evidenceUnverified',
  ],
  'value absence': [
    'reviewNotFound',
    'reviewUnclear',
    'reviewNotSet',
  ],
};

/// Tokens the glossary says are never translated, and that carry meaning.
///
/// Standards, formats and provider names a reader will search for by their
/// untranslated spelling. None of them is also an English common word, so
/// matching them literally is exact in both directions.
///
/// The brand `Action` is deliberately **not** in this list. See
/// [_brandKeys] — it is the one token this app cannot match by spelling.
const _preservedTokens = [
  'PDF',
  'OCR',
  'API',
  'SHA-256',
  'EXIF',
  'HTTPS',
  'C2PA',
  'URL',
  'OpenAI',
  'Anthropic',
  'Gemini',
];

/// The product is called Action and its central object is called an action.
///
/// That collision is not a naming mistake to be worked around here — it is the
/// glossary's rules 1 and 2, and it is deliberate. Rule 1: `Action` the product
/// name stays in Latin script in every locale, like `Gmail`. Rule 2: `action`
/// the domain noun is translated, because "3 actions need your attention"
/// counts things the user made and reads as an ordinary noun.
///
/// **Why these are lists and not a regex.** Every other token in this file is
/// matched by spelling. This one cannot be: `Action found multiple possible
/// dates` is the brand and `Action confirmed` is the noun at the start of a
/// sentence, and no amount of casing or word-boundary logic separates them.
/// English genuinely does not carry the distinction; only meaning does. So the
/// classification is written down by a person, once.
///
/// **Why that is not the hard-coded list this file warns about.** The list of
/// *safety* keys is derived because a forgotten entry there silently drops
/// coverage. Here a forgotten entry cannot: the first test in the group asserts
/// that every key whose English contains `Action` appears in exactly one of
/// these two sets, so a new string fails loudly until someone classifies it.
const _brandKeys = {
  'appName',
  'briefDetailFirstRun',
  'captureSheetSubtitle',
  'evidenceHighlighted',
  'evidenceNoRegion',
  'evidenceUnverified',
  'languageDraftNote',
  'libraryNoGoalsMessage',
  'libraryNoOpenMessage',
  'librarySubtitle',
  'ocrScriptNoTextHint',
  'ocrScriptSubtitle',
  'ocrScriptUnreadableTitle',
  'reviewInjectionNotice',
  'reviewMultipleAmounts',
  'reviewMultipleDates',
  'reviewNotUnderstood',
  'settingsActionFootnote',
  'settingsHelpDescription',
  'settingsIntelligenceFootnote',
  'settingsLanguageDescription',
  'settingsNotificationsOffDescription',
  'settingsTextRecognitionDescription',
  'sourceDocumentNotRead',
  'sourceNotInterpreted',
  'sourceReadExplainer',
  'studioDisconnectedBlurb',
  'studioHeroTitle',
};

/// Keys whose English `Action` is the domain noun at the start of a phrase,
/// and which every locale therefore translates.
///
/// Small on purpose. `Steps inside an Action`, `Action created` and `Action
/// confirmed` are the only places the app capitalises the common noun, and all
/// three do it because a label or a sentence began.
const _domainNounKeys = {
  'reviewActionConfirmed',
  'searchFieldSteps',
  'stageActionCreated',
};

/// `Action` as a whole word, in either case.
final _anyAction = RegExp(r'(?<![A-Za-z])[Aa]ction(?![A-Za-z])');

/// `Action` as a whole word, capitalised.
final _brandSpelling = RegExp(r'(?<![A-Za-z])Action(?![A-Za-z])');

/// English words that must not appear in a translation unless the English
/// original uses them.
///
/// These are reassurances the product refuses to give. They are ASCII English
/// words, so a Spanish *seguro* or a French *sécurisé* does not trip them —
/// only an actual English word left in the translation does.
const _reassurance = [
  'safe',
  'secure',
  'secured',
  'verified',
  'guaranteed',
  'certified',
  'unhackable',
  'bank-grade',
  'military',
  'encrypted',
  '100%',
];

bool _containsWord(String haystack, String word) {
  final escaped = RegExp.escape(word);
  return RegExp('(?<![A-Za-z])$escaped(?![A-Za-z])', caseSensitive: false)
      .hasMatch(haystack);
}

/// Scripts that say the same thing in far fewer characters.
///
/// The length floor below would fire constantly on these otherwise: a Japanese
/// rendering of a two-clause English sentence is routinely a third of its
/// length and has lost nothing.
const _denseScripts = {'ja', 'ko', 'zh', 'zh_Hans', 'zh_Hant', 'th'};

void main() {
  late Map<String, Object?> template;
  late Map<String, String> english;
  late List<String> safetyKeys;

  setUpAll(() {
    template = jsonDecode(File('$_l10nDir/app_en.arb').readAsStringSync())
        as Map<String, Object?>;
    english = _read('en');
    safetyKeys = _safetyKeys(template);
  });

  test('the safety-critical strings are still marked as such', () {
    // If this number falls, a `SAFETY:` description was deleted and every test
    // below quietly stopped covering that string.
    expect(
      safetyKeys.length,
      greaterThanOrEqualTo(24),
      reason: 'Only ${safetyKeys.length} keys carry a SAFETY description. '
          'Removing the marker removes the string from this entire file.',
    );
    expect(safetyKeys, contains('evidenceUnverified'));
    expect(safetyKeys, contains('reviewInjectionNotice'));
    expect(safetyKeys, contains('urgencyUnsure'));
  });

  group('mutually exclusive states stay distinct', () {
    for (final tag in _tags) {
      test(tag, () {
        final arb = _read(tag);
        for (final group in _exclusiveGroups.entries) {
          final byValue = <String, List<String>>{};
          for (final key in group.value) {
            final value = arb[key];
            if (value == null) continue;
            byValue.putIfAbsent(value.trim(), () => []).add(key);
          }
          for (final collision in byValue.entries) {
            expect(
              collision.value,
              hasLength(1),
              reason: '$tag renders ${collision.value.join(' and ')} '
                  'identically as "${collision.key}". These are different '
                  '${group.key} states: a reader cannot tell them apart, and '
                  '"not sure" reading as "low" is the specific mistake this '
                  'product must not make.',
            );
          }
        }
      });
    }
  });

  group('untranslatable tokens survive', () {
    for (final tag in _tags) {
      test(tag, () {
        final arb = _read(tag);
        for (final key in english.keys) {
          final source = english[key]!;
          final translated = arb[key];
          if (translated == null) continue;
          for (final token in _preservedTokens) {
            if (!source.contains(token)) continue;
            expect(
              translated.contains(token),
              isTrue,
              reason: '$tag/$key drops "$token".\n'
                  '  en: $source\n'
                  '  $tag: $translated\n'
                  'The standards names are the words a reader searches for; '
                  'translating or transliterating them makes the sentence '
                  'about something else.',
            );
          }
        }
      });
    }
  });

  group('the brand and the noun stay apart', () {
    test('every English string containing "Action" is classified', () {
      final unclassified = <String>[];
      for (final entry in english.entries) {
        if (!_brandSpelling.hasMatch(entry.value)) continue;
        if (_brandKeys.contains(entry.key)) continue;
        if (_domainNounKeys.contains(entry.key)) continue;
        unclassified.add(entry.key);
      }
      expect(
        unclassified,
        isEmpty,
        reason: 'These English strings contain the word "Action" and are in '
            'neither _brandKeys nor _domainNounKeys: '
            '${unclassified.join(', ')}.\n'
            'Decide which it is. If it is the product speaking — "Action '
            'found two dates" — it is a brand key and stays Latin in every '
            'locale. If it is the thing the user made — "Action created" — '
            'it is a domain noun and every locale translates it. Leaving it '
            'unclassified is the only outcome this file will not accept, '
            'because an unclassified string is an untested one.',
      );
    });

    test('_brandKeys and _domainNounKeys name strings that exist', () {
      for (final key in {..._brandKeys, ..._domainNounKeys}) {
        expect(
          english.containsKey(key),
          isTrue,
          reason: '"$key" is classified here but is no longer in app_en.arb. '
              'A stale entry hides the day a real string stops being covered.',
        );
      }
    });

    for (final tag in _tags) {
      if (tag == 'en') continue;
      test('$tag keeps the brand and translates the noun', () {
        final arb = _read(tag);

        for (final key in _brandKeys) {
          final translated = arb[key];
          if (translated == null) continue;
          expect(
            _brandSpelling.hasMatch(translated),
            isTrue,
            reason: '$tag/$key drops the brand "Action".\n'
                '  en: ${english[key]}\n'
                '  $tag: $translated\n'
                'The product name is the launcher label and the name a reader '
                'searches for. It stays in Latin script in every locale, for '
                'the same reason Gmail does.',
          );
        }

        for (final key in _domainNounKeys) {
          final translated = arb[key];
          if (translated == null) continue;
          expect(
            _anyAction.hasMatch(translated),
            isFalse,
            reason: '$tag/$key leaves "action" in English.\n'
                '  en: ${english[key]}\n'
                '  $tag: $translated\n'
                'Here "action" is the ordinary noun for the thing the user '
                'made, not the product name. Left untranslated it reads as '
                'the brand, which turns "Action created" from a status into '
                'an advertisement — and it is the tell-tale of a translation '
                'that was pattern-matched rather than read.',
          );
        }
      });
    }
  });

  group('no English reassurance leaked into a safety string', () {
    for (final tag in _tags) {
      if (tag == 'en') continue;
      test(tag, () {
        final arb = _read(tag);
        for (final key in safetyKeys) {
          final source = english[key];
          final translated = arb[key];
          if (source == null || translated == null) continue;
          for (final word in _reassurance) {
            if (_containsWord(source, word)) continue;
            expect(
              _containsWord(translated, word),
              isFalse,
              reason: '$tag/$key contains the English word "$word", which its '
                  'English original deliberately does not.\n'
                  '  en: $source\n'
                  '  $tag: $translated\n'
                  'This product does not call anything safe, secure or '
                  'verified unless it has actually checked it.',
            );
          }
        }
      });
    }
  });

  group('no clause was lost from a safety string', () {
    for (final tag in _tags) {
      if (tag == 'en') continue;
      test(tag, () {
        final arb = _read(tag);
        // Generous on purpose. The point is to catch a sentence that came back
        // as a fragment, not to police style: a translation half the length of
        // its English is normal, a fifth of it is a dropped clause.
        final floor = _denseScripts.contains(tag) ? 0.22 : 0.45;

        for (final key in safetyKeys) {
          final source = english[key];
          final translated = arb[key];
          if (source == null || translated == null) continue;
          // Short labels are noise here — "Not sure" is two words in English
          // and one in several languages.
          if (source.length < 40) continue;

          expect(
            translated.length / source.length,
            greaterThan(floor),
            reason: '$tag/$key is ${translated.length} characters against '
                "English's ${source.length}. A safety sentence that short has "
                'almost certainly lost a clause, and every one of these '
                'sentences carries at least two claims that both have to '
                'survive.\n'
                '  en: $source\n'
                '  $tag: $translated',
          );
        }
      });
    }
  });

  group('the product claims only the review it has had', () {
    test('English is the only canonical locale', () {
      final canonical = AppLocales.all
          .where((l) => l.status == TranslationStatus.canonical)
          .map((l) => l.tag);
      expect(canonical, ['en']);
    });

    test('the review status document exists and covers every language', () {
      final file = File(_reviewStatusDoc);
      expect(
        file.existsSync(),
        isTrue,
        reason: '$_reviewStatusDoc is referenced by lib/app/app.dart, by '
            'lib/l10n/supported_locales.dart and by the glossary. A missing '
            'file is a claim with nothing behind it.',
      );

      final doc = file.readAsStringSync();
      for (final language in AppLocales.all) {
        expect(
          doc.contains(language.tag),
          isTrue,
          reason: '${language.englishName} (${language.tag}) ships but is not '
              'recorded in $_reviewStatusDoc.',
        );
      }
    });

    test('no locale is marked reviewed without a reviewer on record', () {
      final doc = File(_reviewStatusDoc).existsSync()
          ? File(_reviewStatusDoc).readAsStringSync()
          : '';
      for (final language in AppLocales.all) {
        if (language.status != TranslationStatus.reviewed) continue;
        expect(
          RegExp('${language.tag}.*reviewed by', caseSensitive: false)
              .hasMatch(doc),
          isTrue,
          reason: '${language.englishName} is marked '
              'TranslationStatus.reviewed, which tells the rest of the '
              'codebase a human read it. $_reviewStatusDoc records no '
              'reviewer. Either record one or set the status back to '
              'machineDraft — the status is a factual claim.',
        );
      }
    });
  });
}
