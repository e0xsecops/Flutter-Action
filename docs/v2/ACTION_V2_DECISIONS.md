# Action V2 — decisions, deviations, and what was turned down

The brief asked for two things this document holds: a record of every place the
implementation departed from what was specified, and a scored list of the
proposed opportunities with an accept or reject against each.

It is deliberately blunt about the rejections. A feature list where everything
was accepted is not a list that was assessed.

---

## Part 1 — Deviations from the brief

Format, as requested: what was proposed, why it was weak, what was built
instead, why that is better.

### 1. Material 3 Expressive

**Proposed.** Adopt Material 3 Expressive — its motion scheme, its shape
morphing, its component set.

**Why it was weak.** It does not exist in the Flutter version this app is built
on. Flutter 3.47 has no `MotionScheme`, no expressive shape system, and the
framework's own source notes that the expressive springs are not supported.
Every component name in circulation for M3E is a Jetpack Compose name.

**Built instead.** A design system of the app's own — the ambient field, the
four glass roles, the tinted-glyph language — implemented against APIs that
exist.

**Why better.** Building against an API that is not there produces either
nothing or a hand-rolled imitation carrying the name of a spec it does not
follow. The second is worse than the first, because it makes the next person
believe the app is on a standard when it is not.

### 2. "Everything should be Liquid Glass"

**Proposed.** A pervasive glass treatment as the visual identity.

**Why it was weak.** Two reasons, one aesthetic and one arithmetic. Glass over
a list of rows makes the rows harder to read while making the screen look
busier — it costs legibility and buys decoration. And a blur is only glass when
there is something behind it to bend: the app's flat `#FAFAFB` background meant
every glass surface was rendering as `surface × opacity`, a grey card, no
matter how carefully the material was tuned.

**Built instead.** Glass is a *chrome* material — navigation, sheets, the one
hero per screen — over an ambient field built for it to sample. Content
surfaces are opaque.

**Why better.** It establishes one believable floating interaction layer instead
of a screen of translucent rectangles, and it is the arrangement that makes the
material read as glass at all.

### 3. "Security Center" as a status dashboard

**Proposed.** A screen showing App Lock / Notifications / Screen privacy / AI
provider / Local storage as a status board.

**Why it was weak.** Status without control is a poster. A row reading "App
Lock — Off" that cannot turn App Lock on is worse than no row, and a board of
five such rows reads as security theatre.

**Built instead.** Every line on the Security centre is a working control or a
statement of fact that the code can be held to. The three protections are real
mechanisms — BiometricPrompt, FLAG_SECURE, a substituted notification body.
The storage section says plainly what Action does *not* encrypt.

**Why better.** It is checkable. The tests assert the absence of "military",
"bank-grade", "unhackable", "100%" and "completely secure" from the screen.

### 4. Three bespoke screens for the local safety tools

**Proposed (by me, initially).** Secret scanner, link inspector and file
identity as three screens reached from Settings.

**Why it was weak.** It would have produced three one-off screens with three
sets of empty states, error states and action bars, sitting outside the tool
framework that already provides all of those — and it would have hidden them in
Settings, where nobody looking for a capability looks.

**Built instead.** The credential scanner and the link inspector are registered
`IntelligenceToolDefinition`s in the VERIFY group, running on the same runner
and rendering through the same result view as the other fifteen.

**Why better.** One runner, one result shape, one place to look. VERIFY now
offers four tools that work with no provider connected, which is the strongest
possible answer to "what does this do before I give it a key?"

### 5. File identity as its own tool

**Proposed.** A sixteenth capability: hash a file, detect its real type, flag a
name/content mismatch.

**Why it was weak.** It is half of a question the authenticity inspector
already asks. Two cards both headed "check this file" is precisely the
"hundred mini tools" outcome the brief warns against, and the second one would
have had no file to point at until PDF input exists.

**Built instead.** The contents, the size and the SHA-256 became a section of
the authenticity report.

**Why better.** One tool answers "what is this file and what can it prove about
itself" completely, instead of two answering half each.

### 6. "Data Flow Receipt" recorded on completion

**Proposed.** Record an entry for each AI operation.

**Why it was weak.** The obvious implementation records on success, and a
receipt that lists only completed runs understates what left the device. A
request rejected by the provider still arrived there, and one interrupted by
the app being killed would leave no record at all.

**Built instead.** The receipt is written at the moment of sending, and the
entry type has no field for an outcome.

**Why better.** It answers the question it claims to answer: what left this
device, not what came back.

### 7. Backup left at Android's default

**Not proposed at all** — found while writing the storage audit, and recorded
here because it is the clearest case of the code contradicting the product.

`android:allowBackup` defaults to `true`, so the database, the capture files
and the preferences were eligible for copying to the user's Google account —
while the privacy screen told them, in as many words, that there is no way to
restore Action to a new device and that losing this installation loses the
anonymous ID with it. Now off, including the Android 12+ device-to-device path
the flags alone do not cover.

### 8. On-device encryption of the database

**Proposed.** An encrypted local vault, SQLCipher via Drift.

**Why it was weak.** A passphrase held in the Keystore and read at launch is
unlocked at exactly the moment app-private storage is already unlocked. It is
the same threat model with one more moving part, a destructive migration, and
no backup to restore from if it fails halfway. It would also invite the claim —
"encrypted database" reads to a user as "safe if someone takes my phone", which
would remain untrue for the unlocked-device case that actually happens.

**Built instead.** App Lock, which addresses the unlocked-device case directly,
plus a Security centre that states the limit rather than papering over it.
`docs/v2/STORAGE_SECURITY_AUDIT.md` records the full reasoning.

**Why better.** It closes the gap that exists rather than the one that sounds
more impressive.

### 9. Metadata stripping deferred until there was a share flow

**Recorded blocker.** Item 24 said the EXIF cleaner was "straightforward with
the `image` package already present; needs a share flow to hang off."

**Why it was weak.** It framed metadata as an *export* problem, and there is no
export in this app. The consequence was that the item sat deferred behind a
feature that does not exist, while the actual exposure went unexamined: the
normalizer had two paths that returned the original bytes verbatim, and the
encoder on the third carried `image.exif` across. So every stored photo kept
its GPS fix, its capture time and its device make and model — and because a
capture is handed to the user's AI provider whenever a tool needs to read it,
those coordinates left the device attached to the picture. The privacy screen's
account of what leaves this device did not mention them.

**Built instead.** Stripping at *intake*, in `image_metadata.dart`, applied on
every path through the normalizer. It is a container edit — JPEG `APP1`,
`APP13` and `COM` segments, PNG `tEXt`/`zTXt`/`iTXt`/`eXIf`/`tIME` chunks — so
the compressed pixels come out bit-identical and the small text OCR depends on
is never re-quantized. `APP0` (JFIF density) and `APP2` (ICC profile) are kept,
because those change how the image is displayed rather than describing it.
Where the container cannot be walked safely the strip refuses and the caller
re-encodes instead, so a claim is never made that did not happen.

**Why better.** It closes the exposure at the only point where Action controls
it, needs no feature that does not exist, and makes the privacy screen's
account of what leaves the device true.

---

## Part 2 — Opportunities, scored

Against the brief's own gate: core fit, frequency, differentiation, trust,
privacy, complexity, performance. Ordered by what was decided, not by the
order proposed.

### Accepted and built

| # | Opportunity | Why it earned its place |
|---|---|---|
| 1 | **App Lock** | The only protection that addresses the threat that actually happens — an unlocked phone in someone else's hands. Uses the OS; Action stores nothing about a biometric. |
| 2 | **Screen privacy (FLAG_SECURE)** | One line of platform, real effect, honestly describable. |
| 3 | **Private notifications** | A reminder is the one part of Action that appears without being opened. Highest exposure per line of code in the app. |
| 4 | **Data-flow receipts** | Turns the privacy claims from prose into something checkable. Genuinely differentiating: no comparable product shows you what it sent. |
| 5 | **Credential scanner** | Distinct from the existing redaction tool in urgency and in remedy. Local, deterministic, works with nothing connected. |
| 6 | **Link inspector** | "Should I open this?" is a real, frequent question about captured content, and the honest answer needs no network. |
| 7 | **File identity** | Folded into the authenticity report — see deviation 5. |
| 8 | **Evidence Lens** | The strongest trust feature in the product. The data had been resolved and unused since day 5. |
| 9 | **Evidence in the conflict chooser** | The exact moment where seeing the page decides the answer. |
| 10 | **Settings 3.0 / Security centre** | The brief's criticism was correct; the screens looked like another app's. |
| 18 | **PDF / document input** | Built. Three doors — picker, share sheet, capture sheet — with signature and MIME validation and an app-private copy, and no PDF library. |
| 19 | **Android Share-In** | Built, including cold and warm start, untrusted-URI handling and duplicate-intent suppression. |
| 21 | **Goals** | Built: the local domain, the workspace, and the plan-to-Action path that had been declared and never wired. |
| 24 | **Metadata cleaner (EXIF strip)** | Built — see deviation 9. The recorded blocker was wrong. |
| 26 | **Twenty languages and RTL** | Built. Twenty locales complete, with the safety meanings held by tests rather than by hope. See `LOCALIZATION_REVIEW_STATUS.md`. |
| 27 | **Text recognition per writing system** | Built. The recogniser follows the app language, and the five scripts ML Kit cannot read are named rather than failing silently. |

### Rejected

| # | Opportunity | Why not |
|---|---|---|
| 11 | **"AI-generated: 93%"** and any AI-detection percentage | Text AI-detection is not reliable enough to support the claim, image detection barely more so, and a false positive is an accusation against a real person. The authenticity inspector reports evidence and returns "inconclusive" — which is the correct answer for most files. |
| 12 | **Security score / "82% secure"** | A number invites optimising the number. Nothing here is measured, so the score would be a claim dressed as a measurement. The hero names what is on, in words. |
| 13 | **Goal quality score, execution score** | Same objection. |
| 14 | **Link reputation lookup** | Sending a URL somewhere to ask whether it is safe leaks exactly the browsing the user came here to be careful about. If ever added it must be BYOK and explicitly disclosed per link. |
| 15 | **Calling any of this "antivirus" or "malware scanning"** | There is no engine. The name would cause someone to trust a file because Action did not object to it. |
| 16 | **Clipboard shield / auto-clear** | Requires either polling the clipboard or holding a background handle on it. On modern Android the monitoring is restricted, the guarantee cannot be kept, and the mechanism is indistinguishable from the thing it is protecting against. |
| 17 | **Redacting images and PDFs** | Drawing a black box leaves the pixels and the text objects underneath. Action will not call that redacted. Already stated in the tool; unchanged. |

### Deferred, with a named blocker

| # | Opportunity | Blocked on |
|---|---|---|
| 20 | **Voice capture** | Needs an explicit-record UI and an honest answer about where transcription happens. Not started rather than half-started. |
| 22 | **Collections and pinning** | Cheap individually, but Library 3.0 should be designed once with them in it. |
| 23 | **C2PA / Content Credentials** | No Flutter binding exists — only a Kotlin AAR over the Rust SDK. `ProvenanceVerifier` is the seam. Until then Action reports that provenance was *not checked*, never that it was absent. |
| 25 | **Encrypted local vault** | See deviation 8. |

---

## Part 3 — Standing rules this work must not break

Collected from across the codebase because they are easier to violate than to
rediscover:

1. **Never print a certainty that was not measured.** No AI-detection
   percentage, no security score, no confidence number.
2. **Never say a link is safe, or a file is clean.** Absence of signals is not
   evidence of safety, and the copy must say so where the user will read it.
3. **Never claim protection the code does not provide.** If the platform
   refuses a window flag, the switch stays off.
4. **Never store content in a log.** The activity journal has no field that can
   hold a sentence, enforced on the way in.
5. **Never show a whole secret.** Masked everywhere, including in `toString`.
6. **Never highlight a region the mapping cannot support.** Fail closed.
7. **Local tools must keep working with no provider connected.** Four of them
   now do.
