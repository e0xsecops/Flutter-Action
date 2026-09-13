# Text recognition by language — what Action can read, and the Bengali decision

Shipping a language and reading a language are two different claims, and
Action makes them separately. This file is the second claim: which writing
systems the on-device recogniser can read, which it cannot, what the user is
told in each case, and the decision taken for Bengali — the one script where
the gap between "the app speaks it" and "the app can read it" is widest and
most likely to be noticed.

Status: **final for V2.** Decided 2026-09-14.

---

## 1. What runs today

Every capture is read on this device by ML Kit's text recogniser
(`google_mlkit_text_recognition`), one recogniser per writing system. Nothing
is sent anywhere to be read; `privacyOnDeviceOcr` on the Privacy screen says
so, and `test/l10n/critical_copy_test.dart` holds that sentence in all twenty
languages.

ML Kit ships exactly five recognisers, and Action routes to them by the app's
language (`lib/features/capture/domain/ocr_script.dart`), with an override in
Settings → Text recognition:

| Script | Languages Action ships that use it |
|---|---|
| Latin | English, Spanish, French, German, Portuguese, Italian, Polish, Turkish, Indonesian, Vietnamese |
| Chinese | Simplified Chinese, Traditional Chinese |
| Devanagari | Hindi |
| Japanese | Japanese |
| Korean | Korean |

Five of the twenty languages have **no recogniser**: **Arabic, Bengali,
Russian, Thai, Urdu.** For these the app language routes to the Latin
recogniser, which reads any Latin-script text in the picture — a reference
number, an amount, an address in Roman letters — and returns nothing for the
rest. `OcrScript.coversScriptOf` returns false for exactly these five, and
`test/capture/ocr_script_test.dart` pins the list.

### What the user sees

- **Settings → Text recognition** opens with a notice naming the language:
  there is no on-device recogniser for it, Latin text in a photo is still
  read, the rest comes back empty, and typing or pasting remains available
  (`ocrScriptUnreadableTitle`, `ocrScriptUnreadableBody`).
- **A capture that came back empty** says which script Action is set to read
  and how to change it (`ocrScriptNoTextHint`), and offers the manual-text
  sheet (`SourcesNotifier.setManualText`).
- **Nothing fails silently.** Before `ocr_script.dart` existed the app read
  every picture as Latin and said nothing; that is the behaviour this
  replaced.

---

## 2. Bengali — the three states considered

The brief required one of three final states. All three were evaluated
against the current code rather than against the PRD.

### (a) Implemented and tested locally — rejected

No maintained on-device engine reads Bengali well enough to ship under
Action's standard.

- **ML Kit** has no Bengali model, and Google has not announced one. The
  routing in `ocr_script.dart` is complete for what ML Kit offers.
- **Tesseract** (`ben.traineddata`) is the only offline alternative reachable
  from Flutter. It would add a 15–25 MB model, a second recogniser with a
  different geometry contract (no line boxes in the shape `OcrLine.box`
  expects, which is what the Evidence Lens draws from), and results on
  phone photographs of printed Bengali that are materially worse than what
  the Latin recogniser produces for Latin. The Flutter bindings for it are
  thin community packages with irregular maintenance. Every one of these is
  a reason on its own; together they mean Bengali OCR would arrive as a
  visibly weaker sibling of the existing pipeline and drag the pipeline's
  contract with it.
- The existing recogniser architecture is stable, tested against nineteen
  synthetic images (`test/fixtures/images/`), and single-engine on purpose.
  Bolting a second engine on to tick a box is exactly the degradation the
  brief warned against.

### (b) Explicit, user-initiated AI fallback — deferred, designed

This is the right shape for the feature and it is **not built**. Recording
what it would have to be, so it is built once and honestly:

- **Trigger:** on a capture whose recogniser returned nothing and whose
  app language is one of the five, beside the manual-text option: "Read
  this with your AI provider". Never automatic, never on capture.
- **Requires a connected BYOK provider.** Without one the option does not
  appear; Action has no provider of its own and will not acquire one for
  this.
- **Disclosure before sending**, per run, naming the provider and stating
  that the photo itself leaves the device — the same first-use disclosure
  the Intelligence tools show (`_confirmFirstUse` in `tool_run_screen.dart`),
  and a Data-flow receipt written at send time with `attachments: 1`.
- **The result is stored as text the provider read**, distinct from text the
  device read (`OcrOutcome.engine` names the engine; a provider-read result
  would name the provider), and the Source Detail says so. It must never be
  presented as on-device recognition, and the Privacy screen's sentence
  about text recognition must gain a clause the moment this ships.
- **No line geometry.** A provider returns text, not boxes, so the Evidence
  Lens will not draw for a provider-read capture. `EvidenceRegions` already
  fails closed on missing boxes; the quote-only fallback is the correct
  presentation.

**Why it is deferred rather than built now.** Today no Intelligence tool
attaches image bytes at all — `intelligence_context.dart` sends text only,
deliberately — so this would be the first flow to send a photo to a
provider. That is a privacy boundary worth crossing on its own commit, with
its own disclosure copy in twenty languages, its own receipts test, and its
own line on the Privacy screen, not inside a completion pass. The seams it
needs (`AiImagePart`, the adapter limits, the receipt journal, the manual
text path) all exist.

### (c) Deferred with evidence — **the decision**

**Bengali OCR is deferred.** Action ships Bengali as an interface language
with the on-device recogniser honestly marked as unable to read Bengali
script, the Latin fallback working, and typing or pasting offered in its
place. The AI-assisted path above is the next step and is specified, not
started.

What this decision does **not** do:

- It does not claim Bengali OCR works offline. Nothing in the app, the store
  copy or the docs says so.
- It does not send a photo anywhere silently. No code path attaches image
  bytes to a provider request.
- It does not weaken the recogniser architecture for the fifteen languages
  it does serve.

The same decision applies, for the same reasons, to Arabic, Russian, Thai
and Urdu.

---

## 3. How this is held

| Claim | Where it is enforced |
|---|---|
| Exactly five scripts, and the five unreadable languages are those five | `test/capture/ocr_script_test.dart` |
| The notice names the language and offers typing | `test/settings/text_recognition_screen_test.dart` |
| "Text recognition happens on this device" survives every translation | `test/l10n/critical_copy_test.dart` (SAFETY-marked key) |
| No provider request carries image bytes today | `intelligence_context.dart` attaches text and documents only; `test/intelligence/intelligence_ui_test.dart` "source context is only what the user picked" |

When the AI fallback is built, the last row is the one that changes, and it
must change together with the Privacy screen and this file.
