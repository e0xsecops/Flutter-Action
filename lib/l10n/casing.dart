/// Uppercasing that knows which languages it is allowed to do it to.
///
/// The design uses small, wide-tracked uppercase for eyebrow labels — section
/// headings in Settings, the date above the greeting, the badge on the Today
/// hero. In English that is typography. Applied blindly it is a bug in two
/// different ways.
///
/// **Turkish and Azerbaijani.** Dart's `String.toUpperCase` implements the
/// Unicode default casing, which maps `i` to `I`. In Turkish and Azerbaijani
/// the uppercase of dotted `i` is dotted `İ`, and `I` is the uppercase of a
/// different letter entirely — dotless `ı`. So "İncele" uppercased by the
/// default rules comes back as "INCELE", which a Turkish reader reads as a
/// misspelling rather than as emphasis. `Cumartesi` becomes `CUMARTESI`.
///
/// **Scripts with no case.** Arabic, Bengali, Hindi, Thai, Japanese, Korean
/// and Chinese have no uppercase. `toUpperCase` is a no-op there, which is
/// harmless — but it is worth being explicit that the eyebrow style in those
/// languages carries entirely on size, weight, tracking and colour, and that
/// this is fine rather than a missing feature.
library;

/// [value] in the eyebrow style's case, for [localeName].
///
/// [localeName] is the `AppL10n.localeName` of the bundle the string came
/// from — `en`, `tr`, `zh_Hans` — not a device locale.
String eyebrowCase(String value, String localeName) {
  if (_dottedI.contains(_language(localeName))) {
    // Do the dotted-i mapping first, then let the default rules handle the
    // rest of the string. Doing it the other way round would uppercase the
    // `i` to `I` before this could see it.
    return value.replaceAll('i', 'İ').toUpperCase();
  }
  return value.toUpperCase();
}

String _language(String localeName) {
  final separator = localeName.indexOf(RegExp('[_-]'));
  return separator == -1 ? localeName : localeName.substring(0, separator);
}

/// Languages whose lowercase `i` uppercases to `İ` rather than `I`.
///
/// Turkish ships; Azerbaijani and Crimean Tatar do not, and are listed because
/// the rule is a property of the language rather than of this app's locale
/// list, and adding one of them later should not require rediscovering this.
const _dottedI = {'tr', 'az', 'crh'};
