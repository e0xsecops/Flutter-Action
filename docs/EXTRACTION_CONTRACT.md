# Extraction contract v1

Written on day 5. This is the seam between what the device read and what a
future AI provider will be asked to make of it. **No remote call exists yet.**

The rule everything here serves: *nothing extracted may silently become an
Action, and nothing may be invented.* Deadlines, amounts, people,
organisations, consequences, reference numbers and actions come from the
document or they do not exist. Unknown stays unknown.

---

## 1. Layout

```
lib/features/extraction/
  domain/     provider-independent types — no Firebase, HTTP or model names
    extraction_schema.dart      version + every enum, each with a safe fallback
    money_value.dart            exact minor-unit money, strict parsing
    extraction_evidence.dart    a quote plus a client-resolved range
    extracted_field.dart        one value, its provenance and its uncertainty
    action_draft.dart           the proposal — never a stored Action
    extraction_result.dart      outcome + typed issues
    extraction_input.dart       the narrow view extraction is allowed to see
    escalation.dart             signals and their plain-language reasons
  data/
    evidence_resolver.dart      grounding, and value-vs-evidence support
    extraction_validator.dart   untrusted provider output → domain
    escalation_evaluator.dart   deterministic signals with stated thresholds
    extraction_service.dart     the interface day 6 implements
    fixture_extraction_service.dart  deterministic corpus replay
    provider_contract.dart      the JSON we will ask for, and the rules
```

`extraction` depends on `capture` (for `SourceItem` and OCR types). Nothing
depends on `extraction` except the debug screen.

## 2. Provider JSON contract

`schema_version` is **1**. A payload with any other version is rejected whole.

```json
{
  "schema_version": 1,
  "no_action_required": false,
  "title": "Renew your motor policy",
  "summary": "One or two sentences.",
  "category": "renewal",
  "urgency": "important",
  "urgency_reason": "Required whenever urgency is not 'unknown'.",
  "why_this_matters": "…",
  "recommended_next_step": "…",
  "consequence": { "text": "…", "evidence": "verbatim quote" },
  "fields": [
    {
      "key": "due_date",
      "label": "Renewal date",
      "value": "2026-09-30",
      "value_type": "date",
      "currency": "GBP",
      "evidence": "Renewal date: 30 September 2026"
    }
  ],
  "steps": [
    { "title": "…", "description": "…", "due_at": "2026-09-30", "evidence": "…" }
  ]
}
```

* `value_type`: `text · date · datetime · money · number · person ·
  organization · reference · location · boolean · unknown`
* `category`: `payment · renewal · appointment · booking · travel · deadline ·
  response · delivery · document · noActionRequired · unknown`
* `urgency`: `critical · important · normal · low · unknown`
* Dates are ISO-8601 only. Money is a plain decimal string plus a separate
  ISO-4217 code — no symbols, no negatives.
* **The model returns quotes, never offsets.** There is no position field in
  the contract.
* **The model cannot mark anything `confirmed`.** Any attempt is recorded and
  ignored.

Limits: title 120, summary 400, prose 300, value 200, evidence 400, 24 fields,
8 steps. Enforced by the validator, not merely requested in the prompt.

## 3. Evidence strategy

A provider supplies `evidence`: text it says supports the value. The client
then searches its own copy of the normalised source text.

1. **exact** — the quote appears verbatim.
2. **normalized** — it appears after levelling case and collapsing whitespace,
   and nothing else.
3. **unresolved** — anything else. Whatever depended on it is downgraded.

Deliberately absent: fuzzy or edit-distance matching. `780.00` and `78O.OO` are
one OCR slip apart, and a matcher loose enough to join them can ground a value
against text that does not support it.

Quotes shorter than 3 characters cannot ground anything — `30` matches a dozen
places in a bill and proves nothing.

Ranges are half-open indexes into the normalised text, plus OCR line indexes
where geometry exists, so day 6 can highlight either the text or the capture.

**Model-supplied offsets are never trusted** — the contract does not even ask
for them. Verifying one would mean doing the search anyway.

### Value-versus-evidence support

Grounding alone passes a real quote paired with a wrong number. So for typed
values the value must also appear *in its own quote*:

| Type | Check |
|---|---|
| money | digit runs — `1,780.00`, `1780.00`, `1780` all support the same sum |
| date / datetime | the day and the year appear as digits (documents write "30 September 2026", not the ISO form) |
| number, reference, person, organization, location | alphanumeric containment |
| text, boolean, unknown | not checked — prose is written *about* the quote |

This is what catches `value: "5000.00"` beside `evidence: "Amount due: 55.00"`.

## 4. Validation rules

Provider output is untrusted input. The result **always exists** — a total
failure returns `manualEntryRequired` with no draft, never an exception, so the
manual path stays reachable from every outcome.

**Rejected (whole draft discarded):** malformed JSON, a payload that is not an
object, missing or unsupported `schema_version`, empty title.

**Downgraded (kept, marked `needsReview`):** missing evidence, unresolved
evidence, value not supported by its evidence, invalid date, invalid number,
invalid money, unsupported currency, negative amount, unknown enum member,
urgency with no reason, a claim of `confirmed`, over-long strings.

**Dropped (element removed, rest stands):** field with no key, duplicate field
key (first wins), duplicate step (case- and space-insensitive), step with no
title, consequence without grounded evidence, a step `due_at` its evidence does
not support, output beyond the limits.

Two rules worth calling out:

* **Dates are parsed strictly.** `DateTime.parse` normalises overflow — month
  13 rolls into next year, 30 February becomes 2 March. For a product that
  promises never to invent a deadline, a parser that turns an impossible date
  into a plausible one is the worst available failure. `parseStrictIso8601`
  round-trips the components and rejects the difference.
* **Consequences are the most strictly gated claim.** "Your policy will be
  cancelled" is the highest-harm thing the app could fabricate, so it survives
  only with evidence that resolves and is not drawn from tainted text.

## 5. Escalation rules

Deterministic, boolean, and each with a threshold written down. **No score.**
A single number would be easier to sort by and impossible to argue with, and
day 4 already produced one misleading number. Nothing here sends anything; it
only classifies.

| Signal | Threshold | Multimodal? |
|---|---|---|
| `ocrFailed` | recognition did not complete (short-circuits) | yes |
| `noTextRecognised` | image source, no text at all | yes |
| `thinText` | < 40 chars on an image > 500k pixels | yes |
| `lowLineConfidence` | ≥ 2 lines < 0.5, or mean < 0.6 over ≥ 3 scored lines | yes |
| `tableLikeLayout` | ≥ 12 lines, mean < 24 chars/line | yes |
| `fragmentedLayout` | ≥ 20 lines, ≥ 60% of them ≤ 8 chars | yes |
| `malformedText` | > 25% of characters are neither alphanumeric, space nor ordinary punctuation | yes |
| `conflictingDates` | ≥ 2 distinct dates within 40 chars of a deadline word | yes |
| `conflictingAmounts` | ≥ 2 distinct non-zero amounts within 40 chars of a payable word | yes |
| `unresolvedGrounding` | any evidence failed to resolve | yes |
| `instructionLikeContent` | the document addresses the software | **no** |

`tableLikeLayout` is day 4's central finding promoted from the diagnostics
harness into product code: a table read line by line keeps every value and
destroys every row association.

`instructionLikeContent` deliberately does **not** escalate. Handing text that
tries to issue instructions to a second, more capable model is the opposite of
a fix.

Proximity to a keyword is what makes the conflict signals useful rather than
noisy — almost every letter carries an issue date and a period, and flagging
those would fire on everything. Zero amounts are excluded so a printed
"Previous balance: 0.00" is not treated as a competing claim.

Escalation and review state are **independent axes**. A document can be
perfectly grounded and still be ambiguous (two stated deadlines), or badly
scanned and still produce one confidently grounded value.

## 6. Prompt-injection contract

Captured document text is DATA. Three independent layers:

1. **Structural.** `ExtractionRequest` holds `systemInstructions` and
   `documentContent` in separate fields and provides no method that
   concatenates them. The day-6 adapter must map them to the provider's
   system-instruction channel and a user content part respectively. The
   document is additionally delimited — but delimiters are the second line of
   defence, never the first, because text inside them can always claim the
   delimiter closed early.
2. **Grounding.** An instruction to invent a charge produces a value with no
   support in the document.
3. **Taint.** Injected text *is* in the document, so a quote from it grounds
   perfectly — this is the gap grounding cannot close on its own. Everything
   from the first instruction-like match onward is treated as payload: evidence
   resolving at or after that index cannot promote a field or step, and a
   consequence sourced from it is dropped outright. Content *before* the
   injection is unaffected and still usable.

The document is **never edited, stripped or escaped**. Silently deleting part
of a user's document to protect a model would mean the app then reports on a
document that does not exist. Detection patterns are narrow: "Please disregard
this reminder if you have already paid" and "You are now a member of our
loyalty scheme" are ordinary letter prose and must not trip them.

## 7. What day 6's Firebase AI Logic adapter must implement

One class, `implements ExtractionService`, living in `data/`:

```dart
Future<Result<ExtractionResult>> extract(ExtractionInput input);
```

Required of it:

1. Build the request with `ExtractionRequest.forInput(input)`.
2. Map `systemInstructions` to the model's **system instruction** parameter and
   `delimitedDocument` to a **separate user content part**. Never concatenate.
3. Pass `extractionResponseSchema` as the structured-output `responseSchema`
   and request `application/json`. Constrained decoding removes a whole class
   of malformed output before validation.
4. Feed the raw response string to `ExtractionValidator.validate(...)` with the
   same `input`, and return `Ok(result)`. **Do not construct domain objects
   directly** — every guarantee in this document lives in the validator.
5. Return `Err` only for transport failures (offline, refused, timeout,
   quota). An unusable response is `Ok` with `manualEntryRequired`; the UI
   offers retry for the first and manual entry for the second.
6. Set `engine` to something identifying the provider and model, so a fixture
   run is never mistaken for a provider run in stored data.
7. Wire App Check, and keep prompts in Remote Config behind this seam as the
   day-4 checkpoint decided.
8. Never attach the capture image on a text extraction.
   `ExtractionInput.multimodalSourceAvailable` says only whether escalation
   *could* be possible and deliberately carries no path to act on.

## 8. Known limitations

* **Taint marking is blunt.** Legitimate text sitting after an injected block
  is also demoted. That costs a needless "needs review", which is the cheap
  direction to be wrong in.
* **Injection detection is pattern-based** and will miss novel phrasings.
  Grounding, the value-support check and mandatory confirmation are what the
  product actually relies on; the detector is a tripwire, not a filter.
* **Escalation thresholds are provisional.** They come from the day-4 corpus,
  which scored 100% anchor recall on every fixture including the degraded ones
  — meaning it was too easy and these numbers have not met a hard document yet.
* **Numeric date forms are not disambiguated.** `03/09/2026` is day-month in
  one country and month-day in another, and this layer does not choose. Two
  spellings of one date may therefore count as two, erring toward flagging
  ambiguity.
* **Bengali is still unsupported upstream.** The recogniser is Latin-only, so
  mixed Bengali/English documents lose their Bengali content before extraction
  ever sees it. Unchanged from day 4 and still needs a product decision.
* **No conflict detection across fields.** Two different keys holding
  contradictory dates are not compared; only the document-level escalation
  signals notice contradictions.
* **The corpus tests the app, not a model.** Fixture responses are hand-written
  to exercise the seam. They say nothing about how a real model behaves.
