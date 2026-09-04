import 'package:flutter/widgets.dart';

/// The writing systems Action can read on the device.
///
/// **Why this exists.** Until the app shipped twenty languages, the recogniser
/// was hard-coded to Latin and that was defensible: the copy was English, so
/// the documents a user brought to it were overwhelmingly Latin-script. It
/// stopped being defensible the moment the app offered itself in Hindi,
/// Japanese, Korean and Chinese — an app that speaks a language but cannot read
/// a letter written in it is offering half a product, and the half it withholds
/// is the one the user came for.
///
/// **Why it is a choice rather than automatic.** ML Kit's recognisers are
/// separate models; there is no single model that reads every script and no
/// on-device way to detect the script before reading it. Running all five over
/// every capture would multiply the cost of the one operation the whole
/// pipeline waits on. So Action picks a sensible default from the language the
/// app is in, and lets the user change it — which is also the honest shape,
/// because a user who reads Hindi and receives letters in English is the normal
/// case rather than the exception.
///
/// **What each model actually covers.** Google documents every non-Latin
/// recogniser as also recognising Latin characters. So this is an additive
/// choice, not an exclusive one: selecting Devanagari does not stop Action
/// reading an English letter, it adds Devanagari to what it can read. That is
/// why there is no "auto" option and no fallback pass — a second recognition
/// run would double the latency to find text the first run had already found.
enum OcrScript {
  /// English and the rest of the Latin-script languages. The default, and the
  /// only script Action could read before this existed.
  latin(
    label: 'Latin',
    engineSuffix: 'latin',
    sampleLanguages: ['en', 'es', 'fr', 'de', 'pt', 'it', 'pl', 'tr', 'id',
        'vi'],
  ),

  /// Simplified and Traditional Chinese. Also reads Latin.
  chinese(
    label: 'Chinese',
    engineSuffix: 'chinese',
    sampleLanguages: ['zh'],
  ),

  /// Hindi, Marathi, Nepali and the other Devanagari languages. Also reads
  /// Latin. Note that this is the *script*, not the language: Bengali, Tamil
  /// and Telugu are written in their own scripts and are not covered by it.
  devanagari(
    label: 'Devanagari',
    engineSuffix: 'devanagari',
    sampleLanguages: ['hi'],
  ),

  /// Japanese. Also reads Latin.
  japanese(
    label: 'Japanese',
    engineSuffix: 'japanese',
    sampleLanguages: ['ja'],
  ),

  /// Korean. Also reads Latin.
  korean(
    label: 'Korean',
    engineSuffix: 'korean',
    sampleLanguages: ['ko'],
  );

  const OcrScript({
    required this.label,
    required this.engineSuffix,
    required this.sampleLanguages,
  });

  /// Canonical English, for diagnostics and stored engine names. What a person
  /// reads comes from `OcrScriptL10n.labelIn` in `lib/l10n/enum_labels.dart`.
  final String label;

  /// Recorded in every [OcrOutcome] as part of the engine name, so a capture
  /// read with one model is distinguishable later from one read with another.
  final String engineSuffix;

  /// App languages this script is the obvious default for.
  final List<String> sampleLanguages;

  /// The value persisted in preferences.
  String get tag => name;

  /// The script for a persisted tag, or null for "follow the app language".
  static OcrScript? byTag(String? tag) {
    if (tag == null || tag.isEmpty) return null;
    for (final script in values) {
      if (script.tag == tag) return script;
    }
    return null;
  }

  /// The script Action reads by default in [locale].
  ///
  /// Everything not listed lands on [latin], which is the right answer twice
  /// over: it is the script most documents in most of these countries are
  /// printed in, and it is the model that is guaranteed to be present.
  ///
  /// **Bengali, Urdu, Thai, Arabic and Russian are deliberately absent.** ML
  /// Kit has no recogniser for the Bengali, Arabic, Thai or Cyrillic scripts,
  /// so there is nothing to map them to. A user reading Action in Bengali gets
  /// the Latin recogniser, which will read the English parts of their document
  /// and not the Bengali — and the capture screen says so rather than failing
  /// silently. See `docs/v2/ACTION_V2_DECISIONS.md`.
  static OcrScript defaultFor(Locale locale) {
    for (final script in values) {
      if (script.sampleLanguages.contains(locale.languageCode)) return script;
    }
    return latin;
  }

  /// Whether Action can read the script this locale is normally written in.
  ///
  /// False for Bengali, Urdu, Arabic, Thai and Russian. Used by the capture
  /// surfaces to say what will and will not be read, instead of letting the
  /// user photograph a Bengali letter and receive an empty result with no
  /// explanation.
  static bool coversScriptOf(Locale locale) =>
      values.any((s) => s.sampleLanguages.contains(locale.languageCode));
}
