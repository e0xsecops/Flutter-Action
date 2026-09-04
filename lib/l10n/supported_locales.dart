import 'package:flutter/widgets.dart';

/// How much human attention a locale's strings have actually had.
///
/// This exists so the product can be honest in its own code about something it
/// would otherwise be tempted to imply: that twenty languages arrived equally
/// finished. They did not. English is the source every semantic test asserts
/// against; the rest were drafted against a fixed glossary and a set of
/// meaning constraints, then validated mechanically for placeholder, plural
/// and safety-marker integrity.
///
/// The value is never rendered to a normal user. It drives
/// `docs/v2/LOCALIZATION_REVIEW_STATUS.md` and the review-gate test.
enum TranslationStatus {
  /// The language the copy was written in, and the one the copy tests hold.
  canonical,

  /// Drafted under the glossary and the meaning constraints, then validated
  /// mechanically. Not read by a native speaker.
  machineDraft,

  /// Read end to end by someone who reads the language, against the
  /// constraints in `docs/v2/LOCALIZATION_GLOSSARY.md`.
  reviewed,
}

/// One shipped language.
@immutable
class SupportedLanguage {
  const SupportedLanguage({
    required this.locale,
    required this.englishName,
    required this.nativeName,
    required this.status,
  });

  final Locale locale;

  /// For the review docs and the status table — never shown in the picker.
  final String englishName;

  /// What the picker shows. A language list that names languages in a language
  /// the reader does not have is a list they cannot use.
  final String nativeName;

  final TranslationStatus status;

  /// The value persisted in preferences and matched against a [Locale].
  ///
  /// Chinese carries a script rather than a country, because the distinction
  /// that matters to a reader is the script, and a country code would leave
  /// Singapore and Macau ambiguous.
  String get tag {
    final script = locale.scriptCode;
    return script == null
        ? locale.languageCode
        : '${locale.languageCode}_$script';
  }

  @override
  bool operator ==(Object other) =>
      other is SupportedLanguage && other.tag == tag;

  @override
  int get hashCode => tag.hashCode;
}

/// The twenty languages Action ships.
///
/// English first because it is the source; the rest by native name, so a
/// reader scanning for their own language scans a stable list rather than one
/// ordered by a market size they did not choose.
abstract final class AppLocales {
  static const english = SupportedLanguage(
    locale: Locale('en'),
    englishName: 'English',
    nativeName: 'English',
    status: TranslationStatus.canonical,
  );

  static const simplifiedChinese = Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hans',
  );

  static const traditionalChinese = Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hant',
  );

  static const all = <SupportedLanguage>[
    english,
    SupportedLanguage(
      locale: Locale('ar'),
      englishName: 'Arabic',
      nativeName: 'العربية',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('bn'),
      englishName: 'Bengali',
      nativeName: 'বাংলা',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('de'),
      englishName: 'German',
      nativeName: 'Deutsch',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('es'),
      englishName: 'Spanish',
      nativeName: 'Español',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('fr'),
      englishName: 'French',
      nativeName: 'Français',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('hi'),
      englishName: 'Hindi',
      nativeName: 'हिन्दी',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('id'),
      englishName: 'Indonesian',
      nativeName: 'Bahasa Indonesia',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('it'),
      englishName: 'Italian',
      nativeName: 'Italiano',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('ja'),
      englishName: 'Japanese',
      nativeName: '日本語',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('ko'),
      englishName: 'Korean',
      nativeName: '한국어',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('pl'),
      englishName: 'Polish',
      nativeName: 'Polski',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('pt'),
      englishName: 'Portuguese',
      nativeName: 'Português',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('ru'),
      englishName: 'Russian',
      nativeName: 'Русский',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('th'),
      englishName: 'Thai',
      nativeName: 'ไทย',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('tr'),
      englishName: 'Turkish',
      nativeName: 'Türkçe',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('ur'),
      englishName: 'Urdu',
      nativeName: 'اردو',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: Locale('vi'),
      englishName: 'Vietnamese',
      nativeName: 'Tiếng Việt',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: simplifiedChinese,
      englishName: 'Simplified Chinese',
      nativeName: '简体中文',
      status: TranslationStatus.machineDraft,
    ),
    SupportedLanguage(
      locale: traditionalChinese,
      englishName: 'Traditional Chinese',
      nativeName: '繁體中文',
      status: TranslationStatus.machineDraft,
    ),
  ];

  /// The locales handed to `MaterialApp`, English first.
  ///
  /// Order is the tie-breaker Flutter uses when the device asks for a language
  /// none of these match, and English is the right answer to that question.
  static List<Locale> get locales => [for (final l in all) l.locale];

  /// The language for a persisted tag, or null for "follow the system".
  static SupportedLanguage? byTag(String? tag) {
    if (tag == null || tag.isEmpty) return null;
    for (final language in all) {
      if (language.tag == tag) return language;
    }
    return null;
  }

  /// The language a resolved [Locale] came from, for display.
  static SupportedLanguage forLocale(Locale locale) {
    for (final language in all) {
      if (language.locale == locale) return language;
    }
    for (final language in all) {
      if (language.locale.languageCode == locale.languageCode) return language;
    }
    return english;
  }

  /// Locale resolution, covering the case Flutter's default gets wrong.
  ///
  /// Flutter already handles `es-MX → es` and `bn-BD → bn`: it retries on the
  /// language code alone, which is why those need nothing here. What it does
  /// not handle is Chinese, where the axis that matters is the script and the
  /// device usually sends a *country* instead — `zh-CN`, `zh-TW`, `zh-HK`
  /// arrive with no script code, so a plain language match lands on whichever
  /// of Hans/Hant is listed first and hands half the Chinese-reading world the
  /// script they cannot read.
  ///
  /// Returning null defers to Flutter, which ends at English.
  static Locale? resolve(List<Locale>? deviceLocales, Iterable<Locale> supported) {
    for (final device in deviceLocales ?? const <Locale>[]) {
      if (device.languageCode == 'zh') {
        final traditional = device.scriptCode == 'Hant' ||
            const {'TW', 'HK', 'MO'}.contains(device.countryCode);
        return traditional ? traditionalChinese : simplifiedChinese;
      }
      for (final candidate in supported) {
        if (candidate.scriptCode == null &&
            candidate.languageCode == device.languageCode) {
          return candidate;
        }
      }
    }
    return null;
  }
}
