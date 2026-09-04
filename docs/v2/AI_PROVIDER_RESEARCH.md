# AI Provider Research — Action Experience V2 (BYOK)

Researched against current official documentation, August 2026. Every wire shape
below was read from the provider's own docs during this work, not recalled.

**The standing warning.** Provider APIs are the most version-sensitive thing
Action depends on. Model ids change monthly; endpoints change yearly; request
shapes change without notice. Nothing in the app may assume a model id exists.
Everything here is a *starting point that must degrade gracefully*, and the
adapter layer exists precisely so that a provider changing its mind is a
contained edit rather than a rewrite.

---

## 1. Why an adapter layer, and not "any API key"

The original framing was "let the user paste any API key". That is not
achievable, and pretending otherwise would ship a broken product. Providers
differ irreconcilably:

| Axis | OpenAI | Anthropic | Gemini |
|---|---|---|---|
| Base URL | `https://api.openai.com/v1` | `https://api.anthropic.com/v1` | `https://generativelanguage.googleapis.com/v1beta` |
| Endpoint | `POST /responses` | `POST /messages` | `POST /models/{model}:generateContent` |
| Auth | `Authorization: Bearer <key>` | `x-api-key: <key>` | `x-goog-api-key: <key>` |
| Extra required header | — | `anthropic-version: 2023-06-01` | — |
| Prompt container | `input: [...]` | `messages: [...]` + top-level `system` | `contents: [...]` + `systemInstruction` |
| Text part | `{type:"input_text", text}` | `{type:"text", text}` | `{text}` |
| Max output field | `max_output_tokens` | `max_tokens` (**required**) | `generationConfig.maxOutputTokens` |
| Structured output | `text.format` = `{type:"json_schema", name, schema, strict:true}` | `output_config.format` = `{type:"json_schema", schema}` | `generationConfig.responseMimeType` + `responseSchema` |
| Streaming | `stream:true`, SSE, typed `response.*` events | `stream:true`, SSE, `content_block_delta` | `:streamGenerateContent?alt=sse` |
| Errors | `{error:{message,type,code}}` | `{type:"error", error:{type,message}}` | `{error:{code,message,status}}` |

So: **one provider-independent contract, several thin adapters.** The contract is
what the tools speak. The adapters own every quirk above and are the only code in
the app that knows a provider's name.

---

## 2. Capability discovery is mandatory, not decorative

A tool that needs PDF input must not be dispatched to a model that cannot accept
one. The contract therefore carries an explicit `AiCapabilities` set rather than
inferring capability from the provider name — a text-only model on a
vision-capable provider is a real and common configuration.

Declared capabilities: `text`, `vision`, `documents`, `structuredOutput`,
`streaming`, `systemInstruction`, `longContext`.

When a tool requires a capability the selected model lacks, the app has two
honest options and never a third:

1. **Adapt** — for PDFs, fall back to locally extracted text plus page markers,
   and say so in the UI.
2. **Refuse clearly** — `AiFailureKind.unsupportedCapability`, naming what is
   missing and what would fix it.

It must never silently send a degraded request and present the result as if the
document had been read.

---

## 3. Per-provider findings

### 3.1 OpenAI

- **Endpoint** `POST https://api.openai.com/v1/responses`. The Responses API is
  the current surface; Chat Completions still exists but Responses is where file
  input and the current structured-output shape live.
- **Auth** `Authorization: Bearer <key>`.
- **Documents.** `{"type":"input_file","filename":"x.pdf","file_data":"data:application/pdf;base64,<b64>"}`.
  Note the `data:` URI prefix — a bare base64 string is rejected, and this is the
  single most common integration error reported against this endpoint. Each file
  under 50 MB; 50 MB combined per request. Text *and* page images are extracted
  and sent, so PDFs need a vision-capable model.
- **Images.** `{"type":"input_image","image_url":"data:image/png;base64,<b64>"}`,
  with an optional `detail` of `auto|low|high`.
- **Structured output.** `text.format` = `{type:"json_schema", name, schema, strict:true}`.
  Requires `additionalProperties:false` and an explicit `required` array on every
  object. The first request with a new schema carries extra latency while the
  schema is compiled; later ones do not.
- **Model discovery.** `GET /v1/models` works with a normal key and is the
  preferred source of ids.
- **Version-sensitive.** Model ids (`gpt-5.6` was current at research time). Never
  hard-code as a requirement — treat as a preset hint only.

### 3.2 Anthropic

- **Endpoint** `POST https://api.anthropic.com/v1/messages`.
- **Auth** `x-api-key: <key>` **plus** `anthropic-version: 2023-06-01`. Omitting
  the version header fails the request; it is not optional.
- **`max_tokens` is required** on every request. This is the most common cause of
  a 400 for someone porting from another provider.
- **Documents.** `{"type":"document","source":{"type":"base64","media_type":"application/pdf","data":"<b64>"}}`.
  The base64 must contain no newlines. Limits: 32 MB request, 600 pages (100 when
  the context window is under 1M). Dense PDFs can exhaust context well before the
  page limit — each page is processed as an image.
- **Citations — the single most valuable feature for Action.** Setting
  `citations:{enabled:true}` on a document block makes the response split into
  multiple text blocks, where cited blocks carry a `citations` array with
  `cited_text` and a `page_location` (`start_page_number`/`end_page_number`,
  1-indexed). This is *provider-supplied grounding evidence*, which is exactly
  what trust-first Review and Ask-This-Document need. It is enabled all-or-none
  across document blocks in a request.
- **Critical incompatibility.** Citations and structured outputs cannot be used
  in the same request. This forces a real architectural decision, recorded in the
  spec: **factual/grounded tools use citations and a parsed prose contract;
  extraction tools use structured output.** They are different request modes, not
  a toggle.
- **Structured output.** `output_config.format` = `{type:"json_schema", schema}`.
  No beta header. Notable schema gaps: no recursion, no `minimum`/`maximum`, no
  `minLength`/`maxLength`, `additionalProperties` may only be `false`.
- **Thinking.** Current models take `thinking:{type:"adaptive"}`; `budget_tokens`
  is rejected outright on the newest ones. Action does not need thinking for its
  tools and omits the parameter, which is the safe default across the range.
- **Model discovery.** `GET /v1/models`.

### 3.3 Google Gemini

- **Endpoint** `POST https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent`.
- **Auth** `x-goog-api-key: <key>` header. The `?key=` query-parameter form also
  works and appears throughout Google's own samples — **Action must use the
  header**, because a key in a URL leaks into logs, crash reports and proxy
  traces. A deliberate divergence from the vendor sample.
- **Documents.** `{"inline_data":{"mime_type":"application/pdf","data":"<b64>"}}`.
  Up to 50 MB, 1000 pages, each page approximately 258 tokens.
- **Structured output.** `generationConfig.responseMimeType:"application/json"`
  plus `generationConfig.responseSchema`.
- **Model discovery.** `GET /v1beta/models`.
- **Version-sensitive — and the messiest.** Google is mid-migration from
  `generateContent` to a newer `interactions` surface; the document-processing
  page for `generateContent` is already labelled *Legacy*. `generateContent`
  remains functional and is by far the better-documented and more widely deployed
  of the two, so V2 targets it and isolates the choice inside the adapter.
  Revisit before the API is retired.

### 3.4 OpenAI-compatible custom endpoint

Reuses the OpenAI wire style against a user-supplied base URL. Many local and
third-party servers implement Chat Completions but *not* Responses, so this
adapter targets `POST {base}/chat/completions` — the genuinely universal shape —
and advertises a conservative capability set (`text`, `structuredOutput`) that
the user may widen manually if they know their server supports more.

Security rules, non-negotiable and detailed in the threat model: HTTPS required,
no certificate-validation bypass, no trust-all client, cleartext HTTP only behind
an explicit debug-build affordance.

### 3.5 Firebase AI Logic (existing, Day 6)

Stays exactly as it is. It is the extraction path Days 5–20 were built and tested
around, it needs no user key, and it keeps Action working out of the box. V2 does
not refactor it into the BYOK abstraction — the two answer different questions
("extract facts from a capture, with no setup" versus "run the tool I chose on
the content I chose, with my key"), and collapsing them would put 798 passing
tests at risk for no user-visible gain. They coexist.

---

## 4. What Action deliberately does not do

- **No embeddings / vector store / RAG.** Selected-source page chunking covers
  V2's document sizes. A vector database would be architecture for its own sake
  and a second privacy surface.
- **No provider-side file upload.** Every provider offers a Files API that
  persists content on their servers for hours or days. Inline base64 keeps the
  data-retention story simple and truthful: content is sent for one request and is
  not parked anywhere by Action. Revisit only if request-size limits force it, and
  disclose it if so.
- **No price estimation in currency.** Pricing changes and stale tables lie to
  users. Action reports *scope* ("12 pages will be analysed") before a large
  operation, and reports provider-returned token usage afterwards where supplied.
  It never converts that into a money figure.
- **No background AI.** Enforced by tests.

---

## 5. Local PDF text extraction — deferred, with reason

Every provider targeted accepts PDF bytes directly, so the primary document path
needs no local PDF parser at all. Local extraction is only required for three
secondary cases: a model without document capability, chunking a document past a
context limit, and indexing for local search.

The mature Dart option (`syncfusion_flutter_pdf`) is commercially licensed. That
is a licensing decision belonging to the project owner, not a technical one, so V2
defines `DocumentTextExtractor` as a port with an explicit `unavailable` state and
ships the provider-native path. When no extractor is present and a model lacks
document capability, the tool says so plainly rather than silently sending
nothing.

---

## 6. Content authenticity (Tool 15) — what is actually possible

Findings that constrain the design:

- **No Flutter/Dart C2PA binding exists.** `contentauth/c2pa-android` is a Kotlin
  AAR over the Rust `c2pa-rs`; using it means a platform channel and a native
  dependency per platform.
- **Text AI-detection is not reliable**, and false positives harm real people.

Therefore Tool 15 ships as a **local metadata and provenance inspector** with a
pluggable `ProvenanceVerifier` port that reports `unavailable` when no
cryptographic verifier is installed. It reads EXIF and file structure locally,
reports what it finds, and returns `noReliableProvenanceFound` or `inconclusive`
whenever evidence is insufficient — which, for most content, it will be. It never
produces a percentage. A future native C2PA channel slots in behind the port
without touching the tool.

---

## 7. Secret storage

`flutter_secure_storage` is the mature option. Current findings: Android is
Keystore-backed by default (RSA-OAEP key wrapping an AES-GCM data key);
`EncryptedSharedPreferences` is deprecated and ignored because Google deprecated
the Jetpack Security library beneath it, with DataStore the current backing store
and automatic migration from older ciphers. iOS is Keychain-backed.

Action wraps it behind its own `SecretStore` port so that tests never touch a
platform channel and so the package can be replaced without touching call sites.

---

Sources: [Anthropic PDF support](https://platform.claude.com/docs/en/build-with-claude/pdf-support),
[Anthropic structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs),
[OpenAI file inputs](https://developers.openai.com/api/docs/guides/file-inputs),
[OpenAI structured outputs](https://developers.openai.com/api/docs/guides/structured-outputs),
[Gemini document understanding](https://ai.google.dev/gemini-api/docs/document-processing),
[Gemini models](https://ai.google.dev/gemini-api/docs/models),
[c2pa-android](https://github.com/contentauth/c2pa-android),
[flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage).
