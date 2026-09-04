# Localization and right-to-left

The brief asks for twenty languages and RTL. This document records what was
built, what was deliberately not, and why — because the "not" is a product
decision rather than an omission, and the next person deserves the reasoning
rather than an empty `l10n/` folder.

---

## What was built

**RTL layout correctness, verified.** Every directional layout property in the
app is now logical rather than physical:

| Was | Is |
|---|---|
| `EdgeInsets.only(left:/right:)` | `EdgeInsetsDirectional.only(start:/end:)` |
| asymmetric `EdgeInsets.fromLTRB` | `EdgeInsetsDirectional.fromSTEB` |
| `Alignment.centerLeft` | `AlignmentDirectional.centerStart` |
| `Border(left:)` accents and spines | `BorderDirectional(start:)` |
| `LinearGradient` corner alignments | `AlignmentDirectional` |

`test/polish/rtl_test.dart` mounts the real screens under an RTL locale and
asserts both that nothing throws — a `RenderFlex` overflow surfaces as an
exception, so that catches the whole class — and that the geometry genuinely
mirrors: an Action card's urgency spine crosses to the other side of the card,
the header greeting starts from the other edge.

**The localization delegates.** `flutter_localizations` is wired in, so
Material's own strings (text selection, date pickers) localize and the
framework can resolve a locale's text direction at all. Without the delegates
an app is LTR *by construction*: there is no mechanism by which `Directionality`
could ever become RTL, which makes every RTL bug invisible rather than absent.

---

## What was said here before, and why it changed

An earlier version of this document argued that twenty machine-translated
locales should *not* be built. The reasoning was sound and is worth keeping,
because the risk it named is real:

> The test suite asserts specific sentences and forbids specific others — the
> link inspector may never say a link is "safe"; the credential scanner must
> say that removing a key does not disable it; the Security centre may not
> contain "military", "bank-grade", "unhackable" or "100%". Machine translation
> would produce nineteen languages in which not one of those guarantees holds,
> and no one on this project could read them to find out. The failure mode is
> not a clumsy sentence; it is a translated privacy screen promising something
> the code does not do, in a language nobody here can audit.

That objection was answered rather than overruled, and the answer is what the
`test/l10n/` suite is. The guarantees are not left to a reader who does not
exist: they are asserted mechanically, in every locale, on every build.

- **Placeholders, plurals, keys and emptiness** — `arb_integrity_test.dart`.
- **Reassurance words** — `critical_copy_test.dart` fails any safety string in
  any locale that contains *safe*, *secure*, *verified*, *guaranteed*,
  *certified*, *encrypted*, *military*, *bank-grade* or *100%* when its English
  original does not. That is precisely the failure the objection named, and it
  is now a build failure rather than a hope.
- **Dropped clauses** — a safety sentence that comes back at under 45% of its
  English length (22% for the dense scripts) fails, because a two-claim
  sentence that lost a claim is the quiet version of the same problem.
- **Collapsed states** — "Not sure" may not render identically to "Low" in any
  language.
- **The brand** — `Action` survives untranslated where it is the product and is
  translated everywhere it is the common noun.

What is still not claimed is that the remaining prose is *good*, and the app
says so where it matters: `languageDraftNote`, on the language picker itself,
tells the user the translations were drafted against a fixed glossary, checked
automatically, not reviewed by a native speaker, and that English remains the
reference wherever the exact wording matters. Per-locale status lives in
`LOCALIZATION_REVIEW_STATUS.md`.

---

## What is built today

**Twenty languages**, every one complete: 388 keys, no fallbacks to English,
`lib/l10n/untranslated.json` empty. English is `canonical`; the other nineteen
are `machineDraft` and none claims otherwise.

**Live switching.** Choosing a language rebuilds `MaterialApp` with a new
locale. The heading, the footnote and the rest of the app change before the tap
finishes, and on Arabic or Urdu the whole layout mirrors. No restart.

**Chinese resolved by script, not country.** `AppLocales.resolve` maps `zh-CN`,
`zh-TW`, `zh-HK` and `zh-MO` to Hans or Hant. Flutter's own resolution matches
on language alone and would hand half the Chinese-reading world the script they
cannot read.

**Pseudo-localization**, in `test/support/pseudo_l10n.dart`. Every string
expanded 40%, accented and bracketed, supplied through a delegate that exists
only in the test binary. It catches the two things twenty real translations
cannot: a layout that fits by luck, and a hard-coded English string that never
went through the localization layer at all.

**Text recognition follows the language.** See `ocr_script.dart` — the app now
picks an OCR model from the language on screen, and says plainly which five of
its twenty languages have no on-device recogniser for their script instead of
returning an empty result with no explanation.

---

## Known gaps

| Gap | Note |
|---|---|
| No native-speaker review | Tracked per locale in `LOCALIZATION_REVIEW_STATUS.md`, disclosed to the user on the language picker, and enforced: a locale cannot call itself `reviewed` without a reviewer recorded. |
| No recogniser for five scripts | Arabic, Bengali, Russian, Thai and Urdu. ML Kit ships no on-device model for these scripts; the Text recognition screen names the limitation and the way through. Not fixable from inside this app. |
| Device RTL cannot be verified by forcing it | Android's "Force RTL" developer option sets a native flag; Flutter resolves direction from its own locale, so it has no effect here. The widget tests are the verification, which is why they assert geometry rather than only absence of exceptions. |
| Number and date formatting | `intl` is already used for dates, and each locale carries its own `sourceCapturedAtFormat` pattern. Currency is rendered from `MoneyValue`, which carries an explicit currency code rather than assuming one. |
