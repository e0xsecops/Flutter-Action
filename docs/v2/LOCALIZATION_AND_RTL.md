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

## What was not built, and why

**Twenty machine-translated locales.**

Action's differentiator is not that it has copy — it is that the copy is exact.
The test suite asserts specific sentences and forbids specific others:

- the link inspector may never say a link is "safe", "trusted" or "verified",
  and its clear-state copy has to withhold reassurance *in as many words*
- the credential scanner must say that removing a key "does not disable it"
- the authenticity inspector may never print a probability
- the Security centre may not contain "military", "bank-grade", "unhackable",
  "100%" or "completely secure"
- "Nothing here yet" is banned outright
- the manual review path must not claim a search that never ran

Machine translation would produce nineteen languages in which not one of those
guarantees holds, and no one on this project could read them to find out. The
failure mode is not a clumsy sentence; it is a translated privacy screen
promising something the code does not do, in a language nobody here can audit.

So the app declares `supportedLocales: [Locale('en')]` — the one language its
strings exist in. Declaring more would tell Android this app speaks languages it
does not, and an Arabic-locale user would get an RTL layout full of English.
Falling back to English in LTR is the honest behaviour and it is what happens
today.

**This is the cheap half to defer.** RTL layout is expensive to retrofit across
a hundred screens and was done now. Adding a translated locale afterwards is a
file and a delegate, not a re-layout.

---

## What adding a language actually takes

1. `flutter gen-l10n` infrastructure: an `l10n.yaml`, `lib/l10n/app_en.arb` as
   the template.
2. Extract strings. This is the large mechanical piece: roughly 150 files, and
   the copy tests currently assert on literal Dart strings, so each assertion
   becomes a lookup against the same key the UI uses. That is a *better* test —
   it checks the key resolves and the English value is right — but it is a wide
   change and should be its own phase.
3. Translation by someone who reads the language, with the constraints above
   handed to them as constraints rather than as suggestions. The banned-phrase
   tests should be extended per locale.
4. Add the locale to `supportedLocales`. RTL locales need no further layout
   work; that is the point of having done it first.

## Known gaps

| Gap | Note |
|---|---|
| No string extraction | See above. The largest remaining piece, and deliberately not started half-way. |
| Device RTL cannot be verified by forcing it | Android's "Force RTL" developer option sets a native flag; Flutter resolves direction from its own locale, so it has no effect here. The widget tests are the verification, which is why they assert geometry rather than only absence of exceptions. |
| Number and date formatting | `intl` is already used for dates. Currency is rendered from `MoneyValue`, which carries an explicit currency code rather than assuming one. |
