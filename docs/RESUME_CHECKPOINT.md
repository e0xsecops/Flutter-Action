# Resume checkpoint

Written at the end of Day 4, before any Day-5 work. Read this first when
picking the project back up.

## Where things stand

- **Day 4 complete: PASS WITH LIMITATIONS.**
- **Latest verified fix checkpoint: `e01354f`** (`fix(day4): defects found
  verifying the pipeline on the SM G990U`), on top of `68c6567`
  (`feat(day4): image normalisation + on-device OCR pipeline`).
- **Next phase: Day 5** — extraction JSON schema, the `Action` /
  `ActionStep` / `ExtractedField` models, the `ExtractionService` interface
  plus a fixture implementation, then the AI provider integration.
- **Do not repeat Days 1–4.** The foundation, design system, capture
  pipeline, image normalisation and on-device OCR are done and verified on
  hardware.

## Decisions already locked

- **Firebase AI Logic + App Check** for the remote model call. Not a Cloud
  Function proxy. Prompts live in Remote Config, behind an
  `ExtractionService` seam.
- **ML Kit OCR runs first; multimodal escalation only on low signal.**

## What Day 4 actually established, and what it did not

These are the findings that should shape Day 5. Several correct a claim
made earlier in the project.

- **Table layout loss is the major Day-5 risk.** A table is read
  line-by-line and comes back column-major: every value survives, every row
  association is destroyed, and unrelated lines land in the middle of the
  table. This is the strongest argument for escalating table-like documents
  to a multimodal model.
- **Per-line confidence *is* available from ML Kit on the Samsung.** An
  earlier note in this project said it was not. It is: values land roughly
  in 0.31–0.89, and the low ones track the actual misreads. Confidence-based
  escalation is therefore on the table, alongside the structural signals.
  Confidence is still passed through exactly as given and never synthesised.
- **Bengali OCR is not supported.** The recogniser is
  `TextRecognitionScript.latin`, so Bengali text is silently dropped. This
  matters: the primary device is in Bangladesh and real documents are mixed
  Bengali/English. Needs a product decision before it surprises a user.
- **The synthetic corpus is too easy, and 100% anchor recall is NOT
  accuracy.** All 19 fixtures pass at 100% recall, including the
  low-contrast, low-light and skew cases, which means the degradations are
  too mild to stress the recogniser. Anchor recall is a regression signal
  only — there is no ground-truth transcription behind it. A real captured
  document in the same session produced visible garbling while the fixtures
  scored perfectly. Harder fixtures are needed before the corpus can gate
  anything. The multilingual fixtures are also pure ASCII, so diacritics
  are still untested.

## Data handling rule that must not be broken

**Real passport or other personal user documents must never be used as
remote AI test fixtures.** The corpus is synthetic and must stay that way.
On-device OCR touching a real capture is one thing; sending one to a remote
model is another, and Day 5 is where that line gets crossed if nobody is
watching. Runtime capture data (`sources.json` and the `sources/` directory
in app-private storage) is device-only and must never be committed.

## Coordinates

- **Project path:** `I:\Flutter Project\action_app`
- **Package:** `com.solvex.actionapp`
- **Primary device:** `R5CRC1CDZ3R` / Samsung SM G990U
