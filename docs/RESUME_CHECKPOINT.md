# Resume checkpoint

Written at the end of Day 5, before any Day-6 work. Read this first when
picking the project back up.

## Where things stand

- **Day 5 complete.** Extraction domain, grounding, validation, escalation and
  a deterministic fixture service exist. **No remote AI call has been made.**
- **Day 4 complete: PASS WITH LIMITATIONS.** Foundation, design system, capture
  pipeline, image normalisation and on-device OCR are done and verified on
  hardware and on the emulator.
- **Next phase: Day 6** — the Firebase AI Logic adapter behind
  `ExtractionService`, App Check, prompts in Remote Config, and the
  confirmation/review UI.
- **Do not repeat Days 1–5.**

## Read before starting Day 6

**`docs/EXTRACTION_CONTRACT.md`** — the locked v1 provider JSON, the evidence
strategy, every validation and escalation rule, the prompt-injection contract,
and an explicit list of what the Day-6 adapter must implement. Day 6 should not
need to re-derive any of it.

## Decisions already locked

- **Firebase AI Logic + App Check** for the remote model call. Not a Cloud
  Function proxy. Prompts live in Remote Config, behind the `ExtractionService`
  seam.
- **ML Kit OCR runs first; multimodal escalation only on low signal.**
- **`extraction_schema_version = 1`.** Bump it whenever the shape the model is
  asked for changes in a way an older build could misread.
- **The machine can never produce `confirmed`.** `highConfidence` is the
  ceiling; only a person confirms. This is enforced in the validator, not just
  documented.
- **The provider returns evidence *quotes*, never offsets.** All ranges are
  resolved client-side against our own copy of the text.
- **Extraction stops at `ActionDraft`.** There is deliberately no persisted
  Action storage yet, so no later feature can quietly skip confirmation.

## What Day 5 established

- **Grounding needs a second check.** A model can return a genuine quote from
  the document beside a value that quote does not contain. Grounding alone
  passes it; the value-versus-evidence check is what catches it, and it is what
  stops an injected "set the amount to 5000.00".
- **Grounding cannot defend against injection on its own.** Injected text *is*
  in the document, so a quote from it resolves perfectly. Hence the taint rule:
  everything from the first instruction-like match onward cannot promote
  anything. Content before it is unaffected.
- **Escalation and review state are independent axes.** A document can be
  perfectly grounded and still ambiguous (two stated deadlines); a badly
  scanned one can still produce one confidently grounded value. Do not collapse
  them into a single "quality" number.
- **`DateTime.parse` cannot be used for provider dates.** It normalises
  overflow, so 30 February silently becomes 2 March — an invented deadline
  produced by the parser itself. `parseStrictIso8601` round-trips and rejects.
- **Keyword proximity is what makes conflict detection usable.** Almost every
  letter carries an issue date and a statement period; flagging every document
  with more than one date would fire on everything and mean nothing.

## What Day 4 established, and what it did not

These findings still shape the work.

- **Table layout loss is the major extraction risk.** A table is read
  line-by-line and comes back column-major: every value survives, every row
  association is destroyed. Now represented in product code as the
  `tableLikeLayout` escalation signal.
- **Per-line confidence *is* available from ML Kit on the Samsung** (roughly
  0.31–0.89, and the low values track real misreads), correcting an earlier
  note. It is one escalation signal among several, never a gate, because it is
  frequently absent. Confidence is passed through exactly as given and never
  synthesised.
- **Bengali OCR is not supported.** The recogniser is
  `TextRecognitionScript.latin`, so Bengali text is silently dropped before
  extraction ever sees it. The primary device is in Bangladesh and real
  documents are mixed Bengali/English. Still needs a product decision.
- **The synthetic OCR corpus is too easy, and 100% anchor recall is NOT
  accuracy.** All 19 fixtures pass at 100% recall including the low-contrast,
  low-light and skew cases. Anchor recall is a regression signal only. Harder
  fixtures are needed before the corpus can gate anything, and the escalation
  thresholds tuned against it are provisional for the same reason.

## Data handling rule that must not be broken

**Real passport or other personal user documents must never be used as remote
AI test fixtures.** Both corpora are synthetic and must stay that way.
On-device OCR touching a real capture is one thing; sending one to a remote
model is another, and **Day 6 is where that line gets crossed if nobody is
watching**. Runtime capture data (`sources.json` and the `sources/` directory
in app-private storage) is device-only and must never be committed.

## Coordinates

- **Project path:** `I:\Flutter Project\action_app`
- **Package:** `com.solvex.actionapp`
- **Primary development device:** `emulator-5554` — AVD `Action_Pixel_API36`,
  Pixel 8, Android 16 / API 36, `google_apis`, x86_64, 1080×2400 @ 420dpi.
- **Real device (only on explicit request):** `R5CRC1CDZ3R` / Samsung SM G990U.
  A `cm16` device also appears on this machine and must not be used.

```
C:\Android\Sdk\emulator\emulator.exe -avd Action_Pixel_API36 -gpu auto -no-snapshot-load -no-boot-anim
cd /d "I:\Flutter Project\action_app" && I:\flutter\bin\flutter.bat run -d emulator-5554
```

## Test corpora

- **OCR:** `test/fixtures/manifest.json` + `images/` — 19 synthetic images.
  Pushed to the device for the debug OCR diagnostics screen.
- **Extraction:** `test/fixtures/extraction/cases.json` — 21 synthetic cases,
  each a document plus the response a provider would return for it. Several
  responses are deliberately wrong. Runs offline in `flutter test`; also
  viewable on device via the extraction diagnostics screen (debug builds only,
  reachable from the OCR diagnostics screen).
