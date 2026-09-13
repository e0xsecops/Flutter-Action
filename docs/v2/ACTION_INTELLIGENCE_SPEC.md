# Action Intelligence — Product & Architecture Spec (V2)

## 0. The one-sentence rule

Action turns messy information into something you understand, improve, plan,
verify, act on, and complete. Every capability here must serve that arc, or it
does not ship.

**Not** fifteen mini-apps. **Not** fifteen tabs. **Not** a sparkle button on every
screen. One capability layer sharing the same source system, privacy model,
provider abstraction, trust model, persistence model, visual system and result
components — so that the user feels they have many powerful utilities without
feeling they installed fifteen products glued together.

---

## 1. AI is optional

Action must remain fully usable with no provider configured. Without a key the
user keeps: local Actions, Capture, OCR, manual Action creation, Action Chain,
reminders, triage, Library, local Search, privacy controls, and local
document/source storage. The existing Firebase AI Logic extraction path is
untouched and needs no key.

Intelligence Studio is the only surface that changes when no provider is
configured, and it shows an invitation, never an error. Home never degrades.

---

## 2. Layers

```
Tool UI  ──────────  one renderer set, driven by IntelligenceResult
    │
IntelligenceToolDefinition (registry)  ── id, category, inputs, required caps,
    │                                      prompt strategy, output contract
IntelligenceRunner  ─────────────────────  builds request, enforces gates,
    │                                      validates response, cancels
AiProvider (contract)  ───────────────────  provider-independent
    │
  OpenAI · Anthropic · Gemini · OpenAI-compatible
```

Nothing above `AiProvider` knows a provider's name. Nothing below it knows what a
tool is.

### 2.1 The provider contract

`AiProvider` — `describe()`, `listModels()`, `testConnection()`, `send()`,
`stream()`.

Supporting types: `AiProviderConfig` (provider kind, model id, optional base
URL — never the secret), `AiModelDescriptor`, `AiCapabilities`, `AiRequest`,
`AiResponse`, `AiStreamEvent`, `AiProviderFailure`, `AiUsageObservation`.

The secret is resolved at send time from `SecretStore` and never stored on a
config object, so a config can be logged, compared, and persisted safely.

### 2.2 Normalised failures

`invalidKey · quotaExceeded · rateLimited · networkUnavailable · unsupportedModel ·
unsupportedCapability · contextTooLarge · providerUnavailable · malformedResponse ·
cancelled · inputTooLarge · insecureEndpoint · notConfigured`

Raw provider JSON is never displayed. Each failure carries a calm sentence and,
where one exists, a single next step.

### 2.3 Two request modes — forced by the citations/structured-output conflict

Anthropic cannot combine citations with structured output, and grounding matters
more than uniformity. So:

- **Grounded mode** — factual tools (Ask This Document, Deadline Finder,
  Document Intelligence, Missing Information). Citations on where the provider
  supports them; the output contract is a delimited prose format parsed by
  Action, with evidence attached.
- **Structured mode** — extraction and generation tools (Structured Data,
  Checklist, Plan, Rewrite, Redaction scan). Provider structured output where
  available, validated against the tool's schema.

This is a documented architectural consequence, not an inconsistency.

---

## 3. The tool registry

One `IntelligenceToolDefinition` per capability:

```
id · title · shortDescription · category · acceptedInputKinds ·
requiredCapabilities · promptStrategy · outputContract · resultRenderer ·
privacyLevel · allowsStreaming · allowsSaveToAction · allowsCopy · allowsShare
```

Fifteen tools therefore share one runner, one gate set, one result model and one
renderer set. A new tool is a definition plus a prompt plus (sometimes) a schema —
not a new screen.

### 3.1 Categories and tools

**UNDERSTAND** — 1 Document Intelligence · 2 Ask This Document ·
3 Smart Summary · 4 Compare Documents

**PLAN** — 5 Goal Optimizer · 6 Action Plan Generator · 7 Smart Checklist ·
8 Missing Information

**CREATE** — 9 Rewrite / Improve · 10 Draft a Reply · 11 Translate with Context

**EXTRACT** — 12 Structured Data Extractor · 13 Deadline / Obligation Finder

**VERIFY** — 14 Sensitive Information / Redaction Assistant ·
15 Content Authenticity Inspector

### 3.2 Notes that change behaviour

- **2 Ask This Document** — grounded. If the selected material does not answer,
  the answer is "I couldn't find that in the selected document." Never a guess.
  Evidence (quote, page, source) shown where available.
- **4 Compare Documents** — explains differences; never renders an unqualified
  legal conclusion.
- **5 Goal Optimizer / 6 Plan** — output is advice. Nothing persists until the
  user picks steps. No invented deadlines when the user gave no time constraint.
- **9 Rewrite** — protected facts (amounts, dates, references, names) must
  survive. A fact-preservation check runs before the result is shown, and a diff
  view is offered. The original is never overwritten.
- **10 Draft a Reply** — always labelled Draft. Never sent. No mail integration.
- **11 Translate** — Bengali in, Bengali out unless the user asks otherwise; same
  for other languages. Never claims certified translation.
- **12 Structured Data** — shows uncertainty rather than inventing row
  associations; current OCR table limits are acknowledged in the UI.
- **13 Deadlines** — feeds the existing trust-first review. Never creates a
  reminder on its own.
- **14 Redaction** — a redacted *copy*; the original is never modified. For
  images and PDFs, redaction must actually remove the data in the exported copy.
  Where irreversible redaction cannot be guaranteed for a format, Action does not
  call the result redacted.
- **15 Authenticity** — see §7.

---

## 4. Result model

`IntelligenceResult` — `IntelligenceSection[]`, `IntelligenceCitation[]`,
`IntelligenceSuggestion[]`, `IntelligenceWarning[]`, `IntelligenceArtifact[]`.

One shared shape means one shared renderer, one shared action bar, and no tool
inventing its own JSON. Tool-specific schemas extend it rather than replacing it.

**Action bar** (per tool): Copy · Share · Save as note · Create Action · Add
selected steps · Try again · Change style · Ask follow-up. Never Auto-send,
Auto-submit or Auto-complete.

---

## 5. Context, persistence and deletion

- Context is chosen by the user: a Source, an Action, a document, an image,
  pasted text, a typed prompt, or several Sources for comparison. Never ambient.
- Results are **ephemeral by default**. There is no automatic chat-history
  database. Saving is an explicit tap and stores only the selected result.
- Recents remember **tool ids only** — "Smart Summary", never
  "summarized passport.pdf".
- If a saved artifact's Source is deleted, the artifact is deleted with it or
  clearly marked as having lost its source. Misleading provenance is not an
  option.

---

## 6. Cost, consent and cancellation

- **No background AI.** Never on app open, screen open, scroll, resume or
  network return.
- **First-use disclosure per provider**, before the first send: what goes where,
  and that the key stays on the device. Not repeated after acceptance unless the
  provider changes.
- **Scope before spend** for large operations: "12 pages will be analysed using
  your Gemini connection." Never a currency figure.
- **Cancellable.** Leaving the screen cancels the transport.
- **Real stages, not fake percentages**: Preparing document → Reading selected
  pages → Analysing → Building your review.

---

## 7. Authenticity — the scientific limit, honoured

Action does **not** claim "93% chance this was AI-generated". Text AI-detection is
not reliable enough to support such a claim, and false positives harm real people.

Result categories: `verifiedProvenanceAvailable · signalsConsistentWithSynthetic ·
signalsConsistentWithEdited · noReliableProvenanceFound · inconclusive`.

Signals: C2PA/Content Credentials where a cryptographic verifier is installed,
signed provenance metadata, EXIF and file metadata, declared generator/editor
software, and — marked experimental — text-style signals. A detector score is
labelled "Detector signal score", never "83% chance this is AI", and is always
accompanied by: experimental, not proof, false positives possible. Explicitly not
for academic misconduct, employment, legal or disciplinary decisions.

Returning **Inconclusive** frequently is correct behaviour and is asserted by
tests.

---

## 8. Studio UX

Progressive discovery, not a grid of fifteen equal cards.

```
Intelligence Studio
  RECOMMENDED     (deterministic, from local type signals only)
  UNDERSTAND  4   PLAN  4   CREATE  3   EXTRACT  2   VERIFY  2
```

Recommendations are chosen from local signals (long document → Summarize; letter
→ Draft reply; several dates → Find obligations). **Action never calls the AI to
decide which AI button to show.**

Contextual entry points: Source Detail (Understand · Ask · Summarize), Action
Cockpit (Improve plan · Suggest steps · Draft reply), Goal (Optimize · Build
plan), Library (select → Intelligence). No floating "Ask AI anything" button
anywhere.

**Visual language.** Calm Intelligence and Liquid/Mirror Glass 2.0 — focused
illumination, structured information, subtle glass depth, source → understanding →
action. Not purple, not neon, no sparkle icon, no robot, no galaxy gradient, no
chat bubbles by default. AI screens look like the rest of Action because they are
the rest of Action.

---

## 9. Settings → Intelligence

```
PROVIDER   Provider · Model · Connection status
PRIVACY    First-use disclosure status
DATA       Clear saved intelligence results
ADVANCED   Custom OpenAI-compatible endpoint
```

Controls: Change · Test connection · Remove key. The saved secret is shown only as
a masked tail. There is no Reveal. No developer jargon on the default screen.

When no provider is configured, a tool shows an invitation — "Connect an AI
provider to use this tool. You use your own provider account and API key." —
with Connect AI and Learn how it works. Never an error, never an aggressive
upsell, and Home never mentions provider status.

---

## 10. Documents and generated output

- The original Source is immutable. "Write" means generate a new draft or a
  derived document, never modify the original file.
- Export: TXT and Markdown first; PDF where output quality justifies it. No DOCX
  unless a reliable maintainable implementation exists — a poor DOCX writer to
  tick a box is worse than not having one.
- Generated PDFs preserve Unicode, page breaks and selectable text, and carry no
  provider branding.
- Export reaches the system share sheet only on an explicit tap. Nothing uploads
  automatically.
- Generated drafts get a light editor — enough to fix a line before sending it on,
  not a word processor.

---

## 11. Goals

A `Goal` (`id · title · desiredOutcome · notes · status · createdAt · updatedAt ·
linkedActionIds`) is local-only. No cloud mirror. The Goal workspace answers: what
you want · current state · what Action suggests · next steps · blockers · linked
Actions. Suggested steps convert to Actions or an Action Chain only on
confirmation.

**No Goal score.** No "82/100", no success probability, no execution-intelligence
score. Explainable findings only: "3 blockers", "2 missing details", "5 suggested
steps".

---

## 12. Large documents

Provider-independent preparation: page-aware chunking with bounded overlap, local
page ids preserved so citations stay meaningful, and a retrieval strategy chosen
per tool. Caps on file size, page count, extracted text size and image count are
checked before any request. Over the cap the user chooses pages or gets a
condensed local representation — pages are never silently ignored.

---

## 13. Test matrix

Provider absent · invalid key · valid fake connection · unsupported model · rate
limit · quota · network failure · cancel · malformed JSON · prompt injection ·
oversized input · Unicode · Bengali · RTL · vision tool on a text-only model ·
PDF tool on an unsupported provider · grounded Q&A with no supported answer ·
rewrite preserves protected facts · Action creation requires confirmation · goal
suggestion does not mutate the goal · secret absent from logs, analytics and
Crashlytics.

Authenticity: image with no metadata · basic EXIF · declared editing software ·
non-cryptographic fake C2PA-like text · plain human text · AI-style synthetic
text · short text · translated text · heavily edited human text — with
Inconclusive expected often.

Copy tests forbid "definitely AI-generated", "100% AI" and probability claims
about AI authorship anywhere in user-facing strings.

All provider tests use fakes. No real network call in `flutter test`. No API key
in any fixture. Fixtures are synthetic letters, notices, invoices, briefs, goals,
contract-like samples, messages, PDFs and images — never a real user document.
