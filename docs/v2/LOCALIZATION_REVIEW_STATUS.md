# Localization review status

Action ships twenty languages. It has had one of them read by a human.

This file is where that gap is written down, per language, so that the claim
the code makes about a locale is a claim someone can check. It is not a
formality: `TranslationStatus` is read by `lib/l10n/supported_locales.dart`,
surfaced to the user through `languageDraftNote` on the language picker, and
asserted by `test/l10n/critical_copy_test.dart`, which fails the build if a
locale calls itself reviewed and no reviewer appears here.

---

## What the three statuses mean

| Status | What it asserts | What it does not |
|---|---|---|
| `canonical` | The language the copy was **written** in. Every semantic test asserts against it. | — |
| `machineDraft` | Drafted against `LOCALIZATION_GLOSSARY.md` and the meaning constraints, then validated mechanically for placeholder, plural, distinctness, token and safety-clause integrity. | Nobody who reads the language has read it. |
| `reviewed` | Read end to end by a person who reads the language, against the glossary. | Not a certification, and not a guarantee of register or idiom. |

Only English is `canonical`, and the review-gate test asserts that it is the
only one. Nineteen languages are `machineDraft`. Nothing is `reviewed`.

---

## The table

Every language Action ships. `Reviewer` is empty for every row, and that is the
honest state — not an oversight to be tidied up by writing a name in.

| Tag | Language | Native name | Status | Reviewer | Date |
|---|---|---|---|---|---|
| `en` | English | English | `canonical` | — | — |
| `ar` | Arabic | العربية | `machineDraft` | — | — |
| `bn` | Bengali | বাংলা | `machineDraft` | — | — |
| `de` | German | Deutsch | `machineDraft` | — | — |
| `es` | Spanish | Español | `machineDraft` | — | — |
| `fr` | French | Français | `machineDraft` | — | — |
| `hi` | Hindi | हिन्दी | `machineDraft` | — | — |
| `id` | Indonesian | Bahasa Indonesia | `machineDraft` | — | — |
| `it` | Italian | Italiano | `machineDraft` | — | — |
| `ja` | Japanese | 日本語 | `machineDraft` | — | — |
| `ko` | Korean | 한국어 | `machineDraft` | — | — |
| `pl` | Polish | Polski | `machineDraft` | — | — |
| `pt` | Portuguese | Português | `machineDraft` | — | — |
| `ru` | Russian | Русский | `machineDraft` | — | — |
| `th` | Thai | ไทย | `machineDraft` | — | — |
| `tr` | Turkish | Türkçe | `machineDraft` | — | — |
| `ur` | Urdu | اردو | `machineDraft` | — | — |
| `vi` | Vietnamese | Tiếng Việt | `machineDraft` | — | — |
| `zh_Hans` | Simplified Chinese | 简体中文 | `machineDraft` | — | — |
| `zh_Hant` | Traditional Chinese | 繁體中文 | `machineDraft` | — | — |

---

## What has actually been verified, without a reader

The tests in `test/l10n/` do not read the languages. They hold the properties
that survive not reading them, and those properties were chosen because they
are the ones whose failure is a product bug rather than an awkward sentence.

**`arb_integrity_test.dart` — structural.**
Every locale has exactly the template's keys and no others. Every placeholder
is present, named identically, and used the same number of times. Every plural
message parses and covers the categories its language requires. No message is
empty. Nothing throws when the bundle is loaded.

**`critical_copy_test.dart` — semantic, to the extent it can be.**

1. **Distinctness.** Within each of four groups of mutually exclusive states —
   urgency, field state, evidence outcome, value absence — no two labels are
   the same string. "Not sure" collapsing into "Low" is a bug in every
   language, and finding it needs equality, not fluency.
2. **Token survival.** `PDF`, `OCR`, `API`, `SHA-256`, `EXIF`, `HTTPS`, `C2PA`,
   `URL`, `OpenAI`, `Anthropic` and `Gemini` survive into every translation
   that had them in English.
3. **Brand versus noun.** `Action` the product name survives untranslated in
   all 24 strings where it is the product speaking; `action` the domain noun
   survives in none of the three where it is the thing the user made. Every
   English string containing the word is classified as one or the other, and a
   new one fails the build until someone decides which it is.
4. **No English reassurance leaked in.** No safety string contains *safe*,
   *secure*, *verified*, *guaranteed*, *certified*, *encrypted*, *100%*,
   *military* or *bank-grade* unless its English original does. This is the
   check that matters most and costs least.
5. **No clause silently lost.** A safety string that comes back at under 45% of
   its English length (22% for Japanese, Korean, Chinese and Thai, which are
   genuinely that much denser) fails. Blunt and deliberately generous — it
   catches a two-claim sentence that came back carrying one.

**`language_switching_test.dart` — behavioural.**
The picker offers all twenty plus System, names each language in itself,
switches without a restart, reaches the rest of the app, mirrors the layout on
Arabic and Urdu, survives a restart, hands back to the system, treats an
unrecognised stored tag as System, and is not cleared by a data wipe.

---

## What is not verified, and is not claimed

Whether the Arabic for *could not verify this* actually says that.

No test here can establish it, and no one on this project reads Arabic,
Bengali, Thai, Urdu, Hindi, Japanese, Korean, Chinese, Russian, Turkish,
Vietnamese, Indonesian or Polish well enough to say so. A test that implied
otherwise would be the exact dishonesty the constraints above exist to prevent.

This is disclosed to the user rather than buried here. `languageDraftNote`, on
the language picker itself, says the translations were drafted against a fixed
glossary and checked automatically, have not been reviewed by a native speaker,
and that English remains the reference wherever the exact wording matters —
privacy, security, and what Action will and will not claim.

---

## The meanings that may never drift

These are the sentences the product would become dishonest without. They are
covered by the mechanical checks above, but the checks are a floor: if a review
ever finds a translation that contradicts one of these, the translation is
wrong even if it reads beautifully.

- AI runs only on an explicit user action, never on its own.
- Content the user selects may be sent to the AI provider **the user
  configured**, and they are told before it goes.
- Search runs on this device. Nothing is sent to run it.
- The link inspector does not prove a link is safe. It reports signals.
- Authenticity analysis does not prove or disprove that something was made by
  AI, and prints no probability.
- Redacting a credential from a file does not revoke that credential. The
  holder must rotate it.
- Secure storage materially improves key protection. It is not absolute, and it
  is not absolute on a rooted or compromised device.
- A redaction claim applies only to the sanitized derived file, never to the
  original.
- Text recognition happens on this device; no capture is sent anywhere to be
  read.

---

## Script coverage is a separate axis

Shipping a language is not the same as being able to *read* it, and the two
diverge here. ML Kit provides on-device recognisers for Latin, Chinese,
Devanagari, Japanese and Korean only.

| Reads its own script | No recogniser exists |
|---|---|
| English, Spanish, French, German, Portuguese, Italian, Polish, Turkish, Indonesian, Vietnamese (Latin) · Simplified and Traditional Chinese · Hindi (Devanagari) · Japanese · Korean | **Arabic, Bengali, Russian, Thai, Urdu** |

For the five on the right the app says so, on the Text recognition screen,
naming the language and stating that Latin text in the image is still read and
that typing or pasting remains available. It does not fail silently, which is
what it did before `lib/features/capture/domain/ocr_script.dart` existed.

---

## How to record a review

Set the locale's `status` to `TranslationStatus.reviewed` in
`lib/l10n/supported_locales.dart`, then edit its row above so it reads, on one
line, the tag followed by `reviewed by` and the reviewer:

```
| `de` | German | Deutsch | `reviewed` | reviewed by A. Schmidt | 2026-10-02 |
```

`critical_copy_test.dart` matches `<tag>.*reviewed by` on a single line and
fails the build if the status was changed and the row was not. The test exists
because the status is a factual claim about a person having done something, and
a claim like that should be expensive to make and impossible to make silently.

A review is a read of every string in `lib/l10n/app_<tag>.arb` against
`LOCALIZATION_GLOSSARY.md`, with particular attention to the safety meanings
listed above. Reviewing the screens instead of the file is not sufficient: the
strings that matter most are the ones that appear only in states that are hard
to reach on purpose.
