# Action V2 Ultra — completion matrix

Every requirement of the V2 Ultra master brief, classified as exactly one of:

- **IMPLEMENTED** — in the code, on the branch, held by tests, seen on the
  device.
- **DEFERRED WITH EVIDENCE** — not built, with the reason it was not built
  now and what building it would require.
- **REJECTED WITH EVIDENCE** — will not be built, with the reason.
- **BLOCKED BY EXTERNAL/USER REQUIREMENT** — cannot be finished by
  engineering alone.

Nothing is "maybe", "ungated" or "later perhaps". Where a row cites a test,
the test is on the branch; where it cites a screenshot, the screenshot was
taken on `Action_Pixel_API36` (`emulator-5554`) during the pass recorded in
§9. Dated 2026-09-14, branch `feat/action-experience-v2`.

Companion documents: `ACTION_V2_DECISIONS.md` (the reasoning behind each
deviation and rejection), `OCR_LANGUAGE_SUPPORT.md` (the Bengali decision),
`LOCALIZATION_REVIEW_STATUS.md` (human-review state), `STORAGE_SECURITY_AUDIT.md`,
`AI_SECURITY_THREAT_MODEL.md`.

---

## 1. Product

| Requirement | Status | Evidence |
|---|---|---|
| Today / Action Brief | **IMPLEMENTED** | `home_screen.dart`, `action_brief.dart`: hero answers "what needs me now" from triage (needs attention › awaiting review › upcoming › clear); first run and cleared list are distinct states; sections capped with see-all. Tests `test/home/`. Seen at 0, 1, 5, 50 and 500 Actions — §9. |
| Library | **IMPLEMENTED** | Four segments (Actions, Captures, Goals, Done), capture stage derived not stored. `library_screen.dart`, `source_card.dart`. |
| Capture Inbox | **IMPLEMENTED** | `SourcesNotifier`, resume of unfinished captures, stage vocabulary. `test/capture_pipeline_test.dart`. |
| Universal Capture (photo, gallery, paste, PDF, share-in) | **IMPLEMENTED** | `capture_sheet.dart` four doors plus the share sheet. |
| PDF | **IMPLEMENTED** | Signature and probe validation with no PDF library (`document_intake.dart`, `pdf_probe.dart`); app-private copy; page count when trustworthy, "unknown" never zero; sent to a provider only as an attachment on an explicit run with a page ceiling that refuses rather than truncates. Local PDF text extraction: **DEFERRED WITH EVIDENCE** — no maintained pure-Dart extractor; recorded in `AI_PROVIDER_RESEARCH.md`. Page-range picker for over-limit documents: **DEFERRED WITH EVIDENCE** — the refusal message invites choosing a range and no picker exists; building one needs a page-aware attachment model the adapters do not have. |
| Android Share-In | **IMPLEMENTED** | text, image, PDF filters; Kotlin copies the stream into app cache while the grant is valid; cold and warm start; duplicate-intent suppression; nothing created without confirmation except a validated PDF, which opens on its Source. Kotlin side has no instrumented tests — recorded. |
| Goals | **IMPLEMENTED** | Local JSON domain, workspace, two planning tools, plan-to-Action path that creates an Action in the Goal's own words. `test/goals/`. |
| Collections | **DEFERRED WITH EVIDENCE** | The organising need ("tax", "moving house", "trip") is met today by a Goal: a named intent with linked Actions, its own workspace, and planning tools — which a Collection would not have. A Collection that also held Sources would need a Source↔group link the JSON source store does not model, a fifth Library segment, and ten-plus strings in twenty languages. Against the brief's own gate (core fit, frequency, differentiation) it duplicates Goals for a rarer case. Revisit when Goals are observed being used as folders. |
| Pinning | **DEFERRED WITH EVIDENCE** | Today's hero is a computed triage the product promises not to override; a pin would be a manual override of exactly that promise, and the brief itself requires pins never to outrank Needs Attention — which leaves a pin nothing to do on Today except appear below what already matters. In Library, sort is by deadline. Needs a DB migration (v4) for one boolean whose visible effect is a second-level sort. Not worth the schema change now. |
| Voice Capture | **DEFERRED WITH EVIDENCE** | See §4. |
| Action Lens | **REJECTED WITH EVIDENCE** | See §4. |
| Source Detail | **IMPLEMENTED** | See §2. |
| Evidence Lens | **IMPLEMENTED** | See §2. |
| Review | **IMPLEMENTED** | See §2. |
| Action Cockpit | **IMPLEMENTED** | See §3. |
| Timeline | **IMPLEMENTED** | See §3. |
| Intelligence Studio | **IMPLEMENTED** | Hero, Suggested (from the last capture, deterministic), Recently used, five category sections. Seventeen tools, four local. No tool search and no favourites: **REJECTED WITH EVIDENCE** — seventeen items in five named groups with a recommended rail is under the threshold where search pays for its own field; favourites would be a second "recent". |
| Search | **IMPLEMENTED** | Local only, content-free analytics, zero state leads with the privacy promise, filters, keyboard submit, no back control. ~50 service tests, widget tests, 500-Action scale test. |
| Settings | **IMPLEMENTED** | Custom `SettingsRow`/`SettingsSection`, no `ListTile`; grouped Personalise · Intelligence · Privacy & security · Reminders · Action (Help, Version). |
| Privacy Center | **IMPLEMENTED** | `privacy_screen.dart`: five data-map groups whose every sentence is public data (`privacyDataMapIn`) and held by tests; two destructive controls with distinct outcomes. |
| Security Center | **IMPLEMENTED** | See §5. |
| Onboarding | **IMPLEMENTED** | Four pages — capture, nothing saved until you confirm, stay on top, what leaves the device — no permission wall, no tour. Narrative matches the brief's four beats. `test/onboarding/`. |
| Interactive demo | **DEFERRED WITH EVIDENCE** | The deterministic, offline review path exists only in debug builds (`FixtureExtractionService`, gated by `kDebugMode` in the router). A production demo needs the review screen to accept an in-memory Source that is not in the Library, a synthetic result bundled in the release APK, and a "keep this" step — three things that do not exist, plus copy in twenty languages. First-run Today already shows what Action handles and offers the three quickest starts. |
| App Icon | **IMPLEMENTED** | Focus ring opening into a forward arrow; adaptive with a monochrome layer; rendered by `tool/icon/render_icon.py`; legible at 48 px. §9 shows it on the launcher. |
| Reminder enhancements | **IMPLEMENTED** | Presets, reschedule with the same platform id, inexact scheduling with no exact-alarm permission, boot receiver, one bounded reconcile pass, private body mode. `test/actions/reminder_*`. |
| Platform shortcuts | **DEFERRED WITH EVIDENCE** | No `quick_actions` dependency, no static shortcuts. A "Capture" launcher shortcut needs a Kotlin intent path into the share channel and a Dart consumer; small, but it is a new entry point with its own cold-start ordering and it has never been asked for by a user. |
| Exports | **DEFERRED WITH EVIDENCE** | There is no outbound share or export anywhere: no `share_plus`, no file writer, no calendar write. Tool artefacts can be copied. The spec's TXT/Markdown/PDF export and share sheet are unbuilt; metadata stripping was moved to intake precisely because there is no export to hang it on. |

## 2. Trust

| Requirement | Status | Evidence |
|---|---|---|
| Source Detail answers *what is this* | **IMPLEMENTED** | Provenance strip (type, when), image or document panel with real dimensions, size, format conversion, page count or "unknown". |
| Source Detail answers *what did Action find* | **IMPLEMENTED — by design, on the Review screen** | Interpretation runs only when the user asks (Create action), and its findings are shown on the Review screen with evidence, confidence and conflicts. Source Detail deliberately shows no interpretation before the user asks for one, because a silently-run extraction is an AI call without intent. What Source Detail does show: the text read on-device, the Actions already made from this capture, and the tools suggested for it. |
| Source Detail answers *where did it find it* | **IMPLEMENTED** | Evidence Lens from the Review screen. |
| Source Detail answers *what can I do next* | **IMPLEMENTED** | "Made from this" → open Action; "Do more with this" → three suggested tools; primary control Create / Open action. |
| Evidence Lens — value, quote, region | **IMPLEMENTED** | `evidence_regions.dart` fails closed on seven conditions (ungrounded, no lines, no dimensions, index out of range, missing or zero-area box, box outside the frame); the offer and the answer share one function so "See it on the capture" is never offered when nothing would draw. Textual quote always shown. 17 region tests, widget tests. |
| Evidence Lens — page for PDFs | **IMPLEMENTED for provider citations; not applicable locally** | A PDF is never read locally, so local evidence has no page. Provider citations carry `startPage`/`endPage`/`pageLabel` and the verifier marks a quote over opaque document bytes *unverifiable* rather than guessing. |
| Review — trust-first | **IMPLEMENTED** | Nothing is saved until confirmed; every blocker listed above the CTA; `confirm()` throws while blocked. |
| Conflict UX — two deadlines, user chooses | **IMPLEMENTED** | `CanonicalFieldResolver`: two qualified candidates resolve to *nothing*; the fact row shows a question card, not a value; the chooser shows each candidate with its label, quote, trust tag and "See it on the capture"; typed dates are strictly parsed; "leave no deadline" is a reviewed absence. Fixture `ambiguous_two_deadlines`, `test/extraction/review_screen_widget_test.dart` "multiple dates are a question, not a silent choice". |

## 3. Action

| Requirement | Status | Evidence |
|---|---|---|
| Cockpit hierarchy | **IMPLEMENTED** | Header (title, urgency spine, category) → NEXT (the one primary block) → Details (deadline, amount, facts) → Steps (reorderable chain) → Reminders → Why this matters → Get help (three tools) → History → Created from → Complete/Reopen (outlined, so it does not compete with NEXT). Text header, no wasted hero. |
| Next Best Action | **IMPLEMENTED** | `action_chain.dart`: rules, not a score; first incomplete step supersedes the extraction's suggestion; nothing proposed → nothing invented. |
| Chain | **IMPLEMENTED** | Add, rename, reorder by drag, delete, complete/reopen; steps are local-only and never mirrored. |
| Reminders | **IMPLEMENTED** | Armed-vs-blocked stated per row; permission asked only at the moment of asking. |
| Factual timeline | **IMPLEMENTED** | `action_timeline.dart` shows only events with a stored timestamp written at the moment they happened: created, reviewed, step completed, reminder set, completed, archived, last changed. A reopen clears `completedAt` and leaves no record, so **no reopen event is shown** rather than a reconstructed one; "changed" is never elaborated into what changed. "AI plan accepted" is not an event because the store holds no such moment. Test group "what it refuses to invent". |

## 4. Final product decisions

### Voice Capture — DEFERRED WITH EVIDENCE

Question asked: does Voice materially improve *messy information → understandable content → Action* beyond Paste Text?

- **Core fit.** Action's input is documents and screens — things with dates, amounts and references in them. Dictated speech has none of the evidence a fact can be checked against: there is no line box, no quote on a page, nothing for the Evidence Lens. A voice note would enter the pipeline as pasted text does, with less structure.
- **Privacy and disclosure.** Android's `SpeechRecognizer` sends audio to Google unless on-device recognition is available and requested (API 31+, `EXTRA_PREFER_OFFLINE`), and availability is per-device and per-language. An honest flow therefore needs a per-device check and a disclosure that differs by outcome — "this will be transcribed on your phone" versus "this will be sent to Google" — before the first word is recorded. That is a new privacy boundary, in twenty languages, on a product whose Privacy screen currently lists every transfer.
- **Permission burden.** `RECORD_AUDIO` is a new dangerous permission on an app that today holds none for capture (camera goes through the system app). The Data Safety declaration changes.
- **Offline quality and package maturity.** `speech_to_text` is the mature option and is a thin wrapper over the platform recogniser above; quality is the platform's, and offline quality for the five languages Action ships that the OCR cannot read either (Arabic, Bengali, Russian, Thai, Urdu) is not something the app can promise.
- **APK size and latency.** Zero and near-zero for the platform recogniser — this is not the blocker.
- **Engineering.** Explicit-record UI, transcript review, the two disclosure paths, a receipt, tests with a fake recogniser: bounded, roughly a day.

Decision: **deferred.** The value over Paste Text is convenience, not understanding; the cost is a new permission and a disclosure that cannot yet be made truthfully per device. The flow the brief specifies (Capture → Voice → explicit Start → transcript → review → Understand → confirm; never background, never always-listening, never silent upload) is the right one and is recorded here for when it is built.

### Action Lens — REJECTED WITH EVIDENCE

Evaluated against the existing camera (system app via `image_picker`), on-device OCR and document intake:

- **Live document boundary / capture-quality feedback** need the `camera` package, the `CAMERA` permission Action deliberately does not hold, and a preview pipeline — for a result the normaliser already produces from a still (orientation baked, metadata stripped, down-scaled).
- **Detected date / amount / reference live in the viewfinder** would be a second, weaker extraction shown *before* the trust-first review, contradicting the product's rule that nothing is shown as found until it can be shown with evidence.
- **QR / barcode** is real but marginal for the document domain: a QR on a bill is a payment link, and the Link Inspector already exists for links once captured. It would add `google_mlkit_barcode_scanning` (another ML model in the APK) for one field.

It is a prettier duplicate of camera + OCR with a new permission. Rejected; the capture sheet stays as it is.

### Collections / Pinning — DEFERRED WITH EVIDENCE

See the rows in §1.

### Bengali OCR — DEFERRED WITH EVIDENCE

`OCR_LANGUAGE_SUPPORT.md`. The AI-assisted, user-initiated path is specified and not started; nothing claims Bengali OCR works offline; no photo is sent anywhere silently.

## 5. Security

| Requirement | Status | Evidence |
|---|---|---|
| App Lock | **IMPLEMENTED** | `AppLockGate` inside the router builder covers every route and root dialog. Cold launch locks (`leftAt == null` ⇒ lock). Background/resume: `inactive` veils only; `paused/hidden` records departure; grace 0 / 1 min / 5 min; backwards clock ⇒ lock. Notification and share deep links push *under* the lock and are revealed after unlock. Cancel/failed: "That was not confirmed" and re-prompt; no lockout counter. Biometric unavailable: switch disabled with the reason; `isDeviceSupported()` so a PIN-only phone qualifies. Device-credential fallback: `biometricOnly: false`. Turning off requires auth too. Nothing biometric stored. On/off confirmation sentences now reach the OS dialog in the user's language. Device behaviour: §9. |
| Private notifications | **IMPLEMENTED** | Two modes. Private replaces the body with "You have something to review."; title is always "Action reminder"; `NotificationVisibility.private` beneath; toggling re-arms already-scheduled alarms; read at arming time so the durability path is unchanged. `test/security/private_notifications_test.dart`. |
| Privacy Shield | **IMPLEMENTED (Off / Always)** — "Sensitive screens" mode **REJECTED WITH EVIDENCE** | `FLAG_SECURE` on the window, stored only if the platform accepted it, re-applied at start. A per-screen mode toggles a *window* flag across route transitions over an async channel; during the transition the recents snapshot and a screenshot race the flag, so the mode would sometimes protect nothing while saying it did — a guarantee Android cannot provide. Two honest modes instead of three, one of which lies occasionally. Default off, as before. |
| AI Data Flow Receipts | **IMPLEMENTED** | Written at send time, never on success; fields are tool, provider, time, page count, attachment count, character count — `ActivityEntry` has no field that can hold a sentence, ids are sanitised in the constructor, endpoint URLs are dropped. Shown in the Security centre with Clear. 30 journal tests. |
| Secret Scanner | **IMPLEMENTED** | Local; private-key blocks, ten vendor prefixes, connection strings, JWTs, auth headers, keyed assignments, high-entropy strings with three confidence levels (never a percentage); masked by default including `toString`; the copy says removing a key does not disable it and names rotation. |
| Metadata Cleaner | **IMPLEMENTED — one mechanism, one name** | Automatic intake normalisation strips JPEG APP1/APP13/COM and PNG text/time/eXIf chunks losslessly on every path, preserving orientation (baked first) and ICC/JFIF. There is no user-facing "Safe Share" because there is no share; nothing is duplicated under two names. Verified: `test/capture/image_metadata_test.dart`, `image_orientation_test.dart`. |
| Safe Redaction | **IMPLEMENTED for text; images and PDF REJECTED** | Text redaction genuinely replaces the match; the original is untouched. Images and PDFs are refused with the reason stated to the user ("covering something in a picture would leave the original underneath it"). Action never claims a redacted image or PDF. |
| Link Safety Inspector | **IMPLEMENTED** | Sixteen signals (HTTPS, punycode, IP literal, embedded credentials, unusual port, mixed-script host, deep subdomains, public-suffix-in-subdomain, shortener, executable target, redirect parameter…). Verdicts: *no obvious signals / worth checking / treat with caution*; no "safe", no "malicious"; the clear case says absence of signals is not trust; nothing fetched. Held by `link_inspector_test.dart`. |
| File Hash / Integrity | **IMPLEMENTED (inside the Authenticity inspector)** | Streamed SHA-256, size, declared MIME, detected type from magic bytes (21 kinds), name/content mismatch, constant-time hash comparison. Never called antivirus; the copy says it has no opinion on whether a file is malicious. |
| C2PA / provenance | **DEFERRED WITH EVIDENCE** | No Flutter binding exists (only a Kotlin AAR over the Rust SDK). `ProvenanceVerifier` is the seam; the default reports "Not checked" — never "absent". |
| Authenticity Inspector | **IMPLEMENTED** | Separates cryptographic provenance (not checked, stated), metadata (what the file claims), and heuristic markers (13 generative, 8 editing). Text authorship always **inconclusive**. No percentage anywhere; "do not use this to accuse anyone" on every run. |
| Security audit / history | **IMPLEMENTED (transfer lane) — protection-lane UI DEFERRED WITH EVIDENCE** | Protection changes (lock on/off, shield on/off, private reminders on/off, redacted copy created, captures cleared, deletion) are recorded in the journal and have no screen. A list of the user's own switch flips has little decision value and would need twelve strings in twenty languages; the entries stay recorded for a future export. |
| Encrypted local vault | **REJECTED WITH EVIDENCE** | `STORAGE_SECURITY_AUDIT.md`: same threat model as app-private storage with one more moving part and a destructive migration; App Lock addresses the case that happens. Backup is off, including device-to-device. |

## 6. Intelligence

| Requirement | Status | Evidence |
|---|---|---|
| BYOK | **IMPLEMENTED** | OpenAI, Anthropic, Gemini, OpenAI-compatible endpoint (cleartext only in debug); key in Keystore/Keychain via `SecretStore`; only a masked tail ever shown; disconnect deletes the key and the preference. |
| Tool-to-Action workflows | **IMPLEMENTED (two destinations, no third)** | Ticked suggestions become a new Action from a Goal (titled in the Goal's words, category unknown rather than invented) or steps appended to an existing Action. A run over a loose source has no owner and is refused. |
| Scope before spend; real stages | **IMPLEMENTED** | Scope disclosure sums pages; first-use disclosure per provider; refusal over the page ceiling. |
| Export / share / save-as-note / follow-up | **DEFERRED WITH EVIDENCE** | Unbuilt, as in §1 Exports; copy exists. |

## 7. Global

| Requirement | Status | Evidence |
|---|---|---|
| Twenty locales, 1170 keys each | **IMPLEMENTED** | `untranslated.json == {}`; `arb_integrity_test.dart`. |
| RTL | **IMPLEMENTED** | Arabic and Urdu mirror; verified on device; `rtl_test.dart`. |
| Nav truncation regression test | **IMPLEMENTED** | `test/l10n/nav_label_fit_test.dart` renders the production shell with the device's fonts, every language, 360/393/412 dp, light and dark, 100/115/200% text. Found and fixed the Thai label; the bar now scales labels only as far as it has room. |
| Native human review | **BLOCKED BY EXTERNAL/USER REQUIREMENT** | Needs native speakers. Recommended before public rollout, does not block visual review. `LOCALIZATION_REVIEW_STATUS.md`. |
| Bengali OCR | **DEFERRED WITH EVIDENCE** | `OCR_LANGUAGE_SUPPORT.md`. |

## 8. Experience — filled from the device pass

See §9 for the screenshots and what was judged from them.

| Requirement | Status | Evidence |
|---|---|---|
| Mirror / Liquid Glass on chrome only | **IMPLEMENTED** | One `BackdropFilter` in the codebase (`glass_surface.dart`), clipped, one per surface; nav bar, sheets, Search controls, Today and Studio heroes; list rows are opaque by test. |
| Light and dark | **IMPLEMENTED** | Both themes first-class; §9 pairs. |
| 200% text | **IMPLEMENTED** | Nav labels hold their whole word; flagship screens pass `accessibility_and_layout_test.dart` and the device pass in §9. |
| Responsive | **IMPLEMENTED** | `ReadableWidth` caps content at 560/720 dp; tablet viewport verified on Day 17. |

## 9. Device pass — 2026-09-14, `Action_Pixel_API36`, `emulator-5554`

Debug build of the branch head, fresh install (`pm clear`), driven by
`adb shell input` and `uiautomator dump` — never `adb shell monkey`. Android
16, 411×914 dp at 420 dpi. Every screenshot below was looked at, not
inferred from source. Synthetic data only: the seeded corpus from the
diagnostics screen and the synthetic fixture images; nothing personal.

### What was captured

| Screen | States | Verdict |
|---|---|---|
| Onboarding | 4 pages | Four beats — capture, nothing saved until you confirm, stay on top, where your information lives — line art in the app's own tokens, no permission wall, no marketing. |
| Today | first run · cleared · 1 · 5 · 50 · 500 Actions · light · dark | Answers "what needs me now": the hero carries the one Action that most needs the user with its overdue badge and next step; sections cap with see-all; at 500 the screen still leads with 133 that need attention and the glass bar visibly blurs the cards passing under it. First run is the capability preview, a cleared day is the quick-start strip; neither is a feature catalogue. |
| Library | empty · 5 · 50 · 500 · Goals · Done | Sunken segmented control with counts, opaque cards. Found and fixed: archived Actions were counted as open and called overdue. |
| Capture sheet | light · dark | Four doors on a near-opaque sheet with the privacy line; readable, not frosted soup. |
| Preview → Source Detail | real gallery capture of a synthetic notice | Provenance strip, the image, dimensions and size, the text read on device in 675 ms, "nothing has been interpreted yet", three suggested tools, Create action. Coherent; not a card wall. |
| Review | ambiguous-deadlines fixture through the production screen | Two deadlines are a question card, not a value; the chooser shows each candidate with its label and quote, another date, and leave-without-a-deadline; choosing marks "Confirmed by you" and the CTA returns. Live extraction itself could not run on this install (§10, App Check). |
| Action Cockpit | seeded and real Actions · light · dark · 200% | Header, NEXT as the one primary block, chain, details, reminders, why this matters, three tools, history, provenance, outlined complete. |
| Goal workspace | created on device | Glass hero with the goal, done-looks-like, where-it-stands, two planning tools. |
| Intelligence Studio | light · dark | Hero with connection state, "4 of them already work on this device", category sections; opaque tool cards. |
| Link Inspector | run on two links | *Treat with caution* / *Worth checking* / *No obvious signals*, each signal explained; the caveat that no signals is not trust is on screen. Ran with no provider connected. |
| Search | empty · results at 50 and 500 | Privacy line first, worked examples, filters, results with highlighted matches. |
| Settings | light · dark · Arabic · Bengali 200% | Grouped, tinted glyphs, values inline; not a ListTile wall. |
| Security centre | off · App Lock on · all three on · light · dark · 200% | The hero names what is on in words; Screen privacy turned the screenshot black (`FLAG_SECURE` honoured) and back; Private reminders re-armed the queue. |
| App Lock | enable · background · relaunch · cancel · unlock | See below. |
| Share-in | text shared from the shell while locked | The share waited behind the lock and landed on the paste screen after the PIN. |
| Reminder | set on a real Action | Persisted before permission, permission asked at that moment, alarm armed in AlarmManager after the grant. |
| Launcher icon | home screen | The focus-ring mark, legible at launcher size. |

### 200% text — English, German, Bengali, Arabic

No `RenderFlex` overflow anywhere in the session's logcat. Nav labels hold
their whole word in every language. Arabic mirrors correctly at 200%. Two
defects found and fixed on the spot: the Today hero's badge was English in
every language (the cards were not), and the Library segment bar squeezed
its four labels to ellipses (Bengali lost one entirely) — it now scrolls
above 130%. Remaining, recorded and not fixed: a German eyebrow breaks
"AUFMERKSAMKEIT" across lines at 200%, and the Library card's one-line meta
ellipsizes its date at 200%.

### App Lock on the device

A PIN was set on the emulator. Enabling App Lock raised the OS dialog with
the translated reason; the PIN enabled it and did not lock the app it had
just enabled. Backgrounding and relaunching showed the lock screen with the
prompt already up; cancelling the prompt showed "That was not confirmed";
the PIN unlocked. **Found and fixed on the device:** before the fix the
prompt reappeared forever after a correct PIN (matrix §5, commit
`92fa7b9`). Not exercised: biometric hardware (the emulator has none
enrolled; the device-credential path is the one that ran) and a notification
tap through the lock (the reminder was armed for an hour ahead).

### Long-run synthetic sequence

Capture image → Source → (extraction refused by App Check, see §10) →
manual Action → reminder → Security centre (all three protections) → Link
Inspector → share-in while locked → unlock → Goal → Library → Search →
language change (Bengali, Arabic, German, back to English) → 200% and back
→ Today. The logcat for the whole session: zero `FATAL EXCEPTION`, zero
`E/AndroidRuntime` from the app, zero `E/flutter`, zero `RenderFlex`, zero
SQLite or Drift errors, zero notification, share, PDF, biometric or shader
errors, no memory pressure. The only warnings are App Check debug-token
exchanges, which are the environment (§10).

### What the pass changed

Six product defects were found by looking and are fixed on the branch:
Thai nav label, Library archived Actions, App Lock re-prompt loop, Today
hero badge language, Library segment bar at 200%, and the generic icon.

## 10. Engineering — 2026-09-14

### Tests and analyzer

`flutter analyze`: no issues. `flutter test --exclude-tags baseline`:
**1826 tests pass**, none skipped. The pass added: the nav-label fit
test (device fonts), the App Lock controller test (device lifecycle order),
the Library segment tests, the Today-hero language test, the
`copyWith`-document test, the privacy-sentence-names-every-local-tool test.

### Database and cloud

Drift `schemaVersion` **3**, unchanged. `actionSchemaVersion` **1**,
unchanged. `firestore.rules` byte-identical to `main`
(`git diff main...HEAD -- firestore.rules` is empty); `lib/core/firebase`
and the mirror, deletion and inventory files unchanged. The only
cloud-adjacent change on the branch is four new closed-set values for the
`capture_type` analytics parameter (share and PDF intake). No document
sync, no query or content analytics.

### Startup — profile build, `emulator-5554`, 500 seeded Actions

| Measure | Value |
|---|---|
| `am start -W` cold, ×5 | 1177 · 1456 · 1564 · 1576 · 2243 ms (median **1564**) |
| `am start -W` warm (home → relaunch), ×3 | 244 · 252 · 262 ms |
| Flutter `--trace-startup`: framework init | 311 ms |
| Flutter: first frame | **769 ms** after engine enter |
| Flutter: first frame rasterized | 877 ms |

Against earlier evidence: Day 17's release build measured 727–840 ms cold
and Day 20's fresh-install release 1228–1327 ms, both with an empty
database. This run is a **profile** build, with 500 Actions and 76 finished
ones in the database, an App Check debug token the console does not know
(it retries at start-up), and adb/uiautomator traffic on the same emulator.
The numbers are therefore not a like-for-like comparison, and there is no
evidence of a regression beyond that noise; the one that is comparable —
Flutter's own first-frame — sits at 769 ms. Debug timings were never used
for any figure here.

### Frames — SurfaceFlinger timestats on the Flutter surface, profile build

`gfxinfo` counts only HWUI frames and reports zero for a Flutter scroll, so
frames were read from SurfaceFlinger's per-layer statistics on the BLAST
layer Flutter presents through. Present-to-present percentiles are in 1 ms
buckets; the display runs at 60 Hz (16.7 ms).

| Sequence | Frames | Dropped | Janky (SF) | Avg FPS | p50 | p90 | p99 |
|---|---|---|---|---|---|---|---|
| Today scroll, 500 Actions | 344 | 0 | 0 | 61.3 | 16 ms | 18 ms | 22 ms |
| Library scroll, 424 open | 341 | 0 | 0 | 60.9 | 16 ms | 18 ms | 27 ms |
| Studio scroll | 224 | 0 | 0 | 60.9 | 16 ms | 18 ms | 29 ms |
| Search results scroll | 227 | 0 | 0 | 61.3 | 16 ms | 19 ms | 23 ms |
| Cockpit scroll | 225 | 0 | 0 | 60.4 | 16 ms | 18 ms | 33 ms |
| Tab switching ×24 (glass bar over every branch) | 591 | 0 | 0 | 61.5 | 16 ms | 18 ms | 24 ms |
| Capture sheet open/close ×5 | 270 | 0 | 0 | — | 16 ms | 19 ms | — |
| Cockpit open/close ×5 | 291 | 0 | 0 | — | 16 ms | 19 ms | — |

The two open/close rows include the idle gap while the sheet or screen sat
open, which is why their average FPS (34–39) and p99 (350–600 ms) are not
frame times; their p50/p90 are. **Glass:** the nav bar's `BackdropFilter`
was under every one of these sequences, the hero's under the Today and
Studio ones, and the sheet's during the sheet row; nothing dropped. No
shader-compilation stalls appeared in logcat. The one `BackdropFilter` in
the codebase is clipped to its surface and never nests — held by
`day17_hardening_test.dart`.

### Memory — profile build, `dumpsys meminfo`, TOTAL PSS

| Moment | PSS |
|---|---|
| After launch, on Today with 500 Actions | 180 MB |
| After the scroll sequences above | 213 MB |
| After 10 rounds of tab switching + Cockpit open/close | 210 MB |
| End of the pass | 209 MB |

Flat across the navigation loop: no growth with repeated navigation. No
`OutOfMemory`, no low-memory kill, no GC pressure lines for the app.

### Release builds

Signed with the local keystore (`android/key.properties`, ignored by git;
nothing about it is printed here).

| Artifact | Path | Size (as `flutter build` reports it) |
|---|---|---|
| Universal APK | `build/app/outputs/flutter-apk/app-release.apk` | 112.0 MB |
| App bundle | `build/app/outputs/bundle/release/app-release.aab` | 93.9 MB |

Day 20 recorded 98.7 MB / 81.9 MB by the same measure. The growth since is
the V2 dependencies added on this branch (`local_auth`,
`flutter_secure_storage`, `crypto`, `http`), twenty locales of generated
Dart, and a newer Flutter engine; no split-per-ABI build was run in this
pass, so the per-ABI figures from Day 20 (31–39 MB) are not refreshed here.

### Logcat — the whole device pass

100k lines recorded across every flow in §9. Counts: `FATAL EXCEPTION` 0 ·
`E/AndroidRuntime` (app) 0 · `E/flutter` 0 · `RenderFlex`/`overflowed` 0 ·
`SQLiteException`/Drift 0 · Firebase/Auth/Firestore errors 0 ·
notification, share, PDF, biometric, shader, localization errors 0 · memory
pressure 0 · ANR 0. Benign noise separated out: uiautomator's own
`AndroidRuntime` lines (the QA tooling), the Google app's Discover errors
(a stray tap during QA), and **App Check debug-token exchange warnings**,
which are the environment: `pm clear` gave this install a new debug token
the Firebase console does not know. That same token is why live extraction
returned "could not read this document" during the pass — the manual path
was taken instead, and the Review screen was exercised through the fixture
harness. Registering the token is a console action, not code.

### Repository audit

`git ls-files` holds no `.vscode`, keystore, `key.properties`, service
account, audio, log, screenshot or temporary translation file
(`lib/l10n/untranslated.json` is `{}` and is the gen-l10n completeness
artefact). A secret-pattern grep over tracked files finds only the Firebase
Android client key in `google-services.json` and `firebase_options.dart` —
a public client identifier tracked since Day 6 and required to build, not a
server credential — and the regex literals in the scanner itself. No App
Check debug token anywhere. No provider request body, raw response or real
voice clip exists in the tree.

### Privacy audit (verified against code, not prose)

Search, Sources, Goals, steps, reminders: local (JSON, Drift, alarms).
Collections: not built. AI runs only from an explicit tap with a first-use
disclosure per provider and a receipt written at send time. BYOK key in
Keystore/Keychain via `SecretStore`, masked tail only. Firestore mirror:
the same 16 fields as Day 8, owner-scoped rules. No document sync, no query
analytics, no content analytics — the analytics catalogue is closed and
parameter values are pinned.

## 11. External blockers, unchanged from Day 20

- A hosted privacy policy URL.
- A support contact for the Help screen and the store listing.
- Confirmation of store history so `versionCode 1` is right.
- Native-speaker review of nineteen languages (§7).
- App Check with Play Integrity has never run on a physical device; the
  emulator cannot satisfy it.
