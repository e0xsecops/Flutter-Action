/// Pseudo-localization: English, but longer, accented, and bracketed.
///
/// **What it is for.** Twenty real translations catch the layouts that break
/// under German or Russian, but only where those languages happen to be long.
/// Pseudo-localization is the deliberate version of the same test: *every*
/// string is expanded, so a `Row` that fits its content by luck fails here
/// rather than in the one locale nobody thought to mount.
///
/// It also catches the two bugs a real translation cannot. A string that never
/// changes is a string that was never looked up — hard-coded English in the
/// widget tree renders unbracketed, and stands out immediately against a screen
/// of `⟦…⟧`. And a string that is cut off mid-word shows a missing `⟧`, so
/// clipping is visible in a screenshot rather than only in an exception.
///
/// **Why it is built by intercepting rather than by generating.** The obvious
/// implementation is a twenty-first ARB file. That would put a fake language
/// into `AppL10n.supportedLocales`, ship it to users, and make an Android
/// language picker offer it. This one exists only in the test binary: it reads
/// the English template off disk and answers all 388 messages through
/// `noSuchMethod`, which Dart fills in as forwarders for every abstract member
/// of [AppL10n]. Nothing about the app changes to support it.
library;

import 'dart:convert';
import 'dart:io';

import 'package:action_app/l10n/gen/app_l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// How much longer than English the pseudo string is, before brackets.
///
/// 1.4 is the figure Microsoft and Google both use for European expansion of
/// short UI strings, and it is close to what German actually does to this
/// app's button labels. Higher would find more overflows, but they would be
/// overflows no shipped language can cause, and a test that fails on an
/// impossible input gets deleted rather than fixed.
const double kPseudoExpansion = 1.4;

/// ASCII letters to accented look-alikes.
///
/// Same width class, still readable at a glance — the point is to prove the
/// string went through the localization layer, not to make it unreadable.
const _accents = {
  'a': 'ä', 'b': 'ƀ', 'c': 'ç', 'd': 'đ', 'e': 'é', 'f': 'ƒ', 'g': 'ğ',
  'h': 'ĥ', 'i': 'î', 'j': 'ĵ', 'k': 'ķ', 'l': 'ł', 'm': 'ɱ', 'n': 'ñ',
  'o': 'ö', 'p': 'þ', 'q': 'ɋ', 'r': 'ř', 's': 'š', 't': 'ŧ', 'u': 'ü',
  'v': 'ṽ', 'w': 'ŵ', 'x': 'ẋ', 'y': 'ÿ', 'z': 'ž',
  'A': 'Å', 'B': 'Ɓ', 'C': 'Ç', 'D': 'Đ', 'E': 'É', 'F': 'Ƒ', 'G': 'Ğ',
  'H': 'Ĥ', 'I': 'Î', 'J': 'Ĵ', 'K': 'Ķ', 'L': 'Ł', 'M': 'Ṁ', 'N': 'Ñ',
  'O': 'Ö', 'P': 'Þ', 'Q': 'Ǫ', 'R': 'Ř', 'S': 'Š', 'T': 'Ŧ', 'U': 'Ü',
  'V': 'Ṽ', 'W': 'Ŵ', 'X': 'Ẋ', 'Y': 'Ÿ', 'Z': 'Ž',
};

/// The filler appended to reach [kPseudoExpansion].
///
/// Vowel-heavy and hyphen-free so it wraps the way prose wraps. A run of
/// `xxxx` would be treated as one unbreakable word and would overflow every
/// narrow column, which would be a finding about the filler rather than about
/// the layout.
const _filler = 'ѕẋŧéñšîöñ ŧéẋŧ ẅîđŧĥ þäđđîñğ ɱöřé ŧĥäñ éñöüğĥ';

/// The bracket a reader looks for. Missing `⟧` means the string was clipped.
const _open = '⟦';
const _close = '⟧';

/// Expands and accents one already-rendered string.
///
/// Digits, punctuation and anything outside ASCII letters pass through: a
/// deadline still has to look like a date, and a string that is only a date
/// format would otherwise stop being one.
String pseudoize(String source) {
  if (source.trim().isEmpty) return source;

  final accented = StringBuffer();
  for (final ch in source.split('')) {
    accented.write(_accents[ch] ?? ch);
  }

  final body = accented.toString();
  final target = (source.length * kPseudoExpansion).ceil();
  final padding = target - source.length;
  final tail = padding <= 0
      ? ''
      : ' ${_filler.substring(0, padding.clamp(0, _filler.length))}';

  return '$_open$body$tail$_close';
}

/// An [AppL10n] that answers every message from the English template.
///
/// Every getter and method of the generated class is abstract, and this class
/// implements none of them. Dart's `noSuchMethod` forwarding fills in the rest:
/// because a concrete `noSuchMethod` is declared here, the compiler generates a
/// forwarder for each unimplemented member instead of refusing to compile the
/// class. That is what makes 367 messages cost one method.
class PseudoL10n extends AppL10n {
  PseudoL10n._(this._messages, this._placeholders) : super('en');

  /// Reads `lib/l10n/app_en.arb` — the same file `flutter gen-l10n` reads.
  ///
  /// Deliberately the template rather than the generated `AppL10nEn`: the
  /// generated class cannot be called by name without mirrors, and the
  /// template carries the placeholder *order*, which is the order gen_l10n
  /// gives the generated parameters and therefore the order the arguments
  /// arrive in here.
  factory PseudoL10n.fromTemplate([String path = 'lib/l10n/app_en.arb']) {
    final arb = jsonDecode(File(path).readAsStringSync()) as Map<String, Object?>;

    final messages = <String, String>{};
    final placeholders = <String, List<String>>{};

    for (final entry in arb.entries) {
      if (entry.key.startsWith('@')) continue;
      messages[entry.key] = entry.value! as String;

      final meta = arb['@${entry.key}'] as Map<String, Object?>?;
      final declared = meta?['placeholders'] as Map<String, Object?>?;
      placeholders[entry.key] = declared?.keys.toList() ?? const [];
    }

    return PseudoL10n._(messages, placeholders);
  }

  final Map<String, String> _messages;
  final Map<String, List<String>> _placeholders;

  /// Message keys that were asked for during this test.
  ///
  /// A screen that reads twelve strings and renders fourteen has two that did
  /// not come from here.
  final Set<String> requested = <String>{};

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final key = _keyOf(invocation.memberName);
    final source = _messages[key];
    if (source == null) return super.noSuchMethod(invocation);

    requested.add(key);
    return pseudoize(_render(key, source, invocation.positionalArguments));
  }

  /// `Symbol("sourceTitle")` → `sourceTitle`.
  ///
  /// Safe here and nowhere else: symbols keep their names in the Dart VM the
  /// tests run on. In a `--obfuscate` release build this would return garbage,
  /// which is one more reason this class never leaves `test/`.
  static String _keyOf(Symbol member) {
    final text = member.toString();
    final open = text.indexOf('"');
    final close = text.lastIndexOf('"');
    return open < 0 || close <= open ? text : text.substring(open + 1, close);
  }

  /// Renders the ICU source with the arguments the caller passed.
  ///
  /// The template's whole ICU surface is twelve plurals using `=1` and `other`
  /// and no selects, so this handles exactly that and would rather throw than
  /// silently mis-render something it does not understand. `other` is taken
  /// unconditionally: pseudo-localization is a layout test, and the `other`
  /// branch is the longer of the two.
  String _render(String key, String source, List<Object?> args) {
    final names = _placeholders[key] ?? const <String>[];
    final values = <String, Object?>{
      for (var i = 0; i < names.length && i < args.length; i++)
        names[i]: args[i],
    };

    var text = _collapsePlurals(source);
    for (final name in names) {
      text = text.replaceAll('{$name}', '${values[name] ?? '{$name}'}');
    }
    return text;
  }

  /// Replaces `{count, plural, =1{…} other{…}}` with its `other` body.
  static String _collapsePlurals(String source) {
    final start = RegExp(r'\{\s*\w+\s*,\s*plural\s*,');
    var text = source;

    while (true) {
      final match = start.firstMatch(text);
      if (match == null) return text;

      final end = _matchingBrace(text, match.start);
      if (end < 0) return text;

      final body = text.substring(match.end, end);
      final other = _branch(body, 'other');
      text = text.replaceRange(match.start, end + 1, other ?? '');
    }
  }

  /// The body of one plural branch, brace-matched rather than regex-matched —
  /// `other{{count} pages}` has a nested brace and a regex stops at the first
  /// `}`.
  static String? _branch(String body, String category) {
    final at = RegExp('(?:^|\\s)$category\\s*\\{').firstMatch(body);
    if (at == null) return null;
    final open = body.indexOf('{', at.start);
    final close = _matchingBrace(body, open);
    return close < 0 ? null : body.substring(open + 1, close);
  }

  /// Index of the `}` that closes the `{` at [open], or -1.
  static int _matchingBrace(String text, int open) {
    var depth = 0;
    for (var i = open; i < text.length; i++) {
      if (text[i] == '{') depth++;
      if (text[i] == '}') {
        depth--;
        if (depth == 0) return i;
      }
    }
    return -1;
  }
}

/// Supplies [PseudoL10n] wherever `AppL10n.of(context)` is called.
///
/// Reports `isSupported` only for the locale it is given, so a test that
/// forgets to declare it gets English rather than a silent pass.
class PseudoL10nDelegate extends LocalizationsDelegate<AppL10n> {
  const PseudoL10nDelegate(this.bundle);

  final PseudoL10n bundle;

  /// The locale a pseudo test declares. `en` because the pseudo strings are
  /// English underneath and the direction should stay left-to-right — RTL is
  /// `test/polish/rtl_test.dart`'s job, with real Arabic.
  static const locale = Locale('en');

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<AppL10n> load(Locale locale) async => bundle;

  @override
  bool shouldReload(PseudoL10nDelegate old) => old.bundle != bundle;

  /// The delegate list a pseudo-localized `MaterialApp` needs: this one in
  /// place of `AppL10n.delegate`, and Material's own unchanged.
  static List<LocalizationsDelegate<dynamic>> delegatesFor(PseudoL10n bundle) =>
      [
        PseudoL10nDelegate(bundle),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];
}
