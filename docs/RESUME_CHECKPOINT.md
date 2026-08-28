# Resume checkpoint

Updated at the end of Day 20. Read this first when picking the project back up.

## Where things stand

- **Day 20 complete.** Release package finished and **not published**:
  validated signed AAB (81.9 MB) and APK (98.7 MB), a README replacing the
  Flutter stub, Play and store-asset specifications, a Firebase setup note,
  and repository/dependency hygiene. A privacy policy URL and a support
  contact do not exist and were not invented; both block publication.
- **Day 19 complete.** Release candidate. Three real blockers fixed (iOS
  bundle id was still `com.example.*`, iOS carried Flutter's template icon,
  and Firebase Analytics had pulled in three advertising permissions), plus a
  security review, a code-derived data safety inventory, an honest iOS
  checklist and draft release notes. Signed AAB 81.9 MB, APK 98.7 MB.
- **Day 18 complete.** Privacy-safe product analytics: a closed event
  catalogue, parameters allowlisted by key and pinned by value, and a device
  check proving a typed search query never reaches Firebase.
- **Day 17 complete.** Hardening. The Day-14 orphaned-mirror privacy gap is
  closed by a deletion-only remote inventory; Firebase's auto-init
  ContentProvider was measured and removed (~540 ms off cold start); the app
  has a liquid/mirror-glass surface of its own; and wide layouts cap and
  centre instead of stretching.
- **Day 16 complete.** Performance and resilience. Firebase initialisation left
  the pre-first-frame path behind a `FirebaseGate`; search lost its redundant
  re-folding (29 ms to 20 ms at 500 Actions); the Day-11 midnight staleness is
  closed; and `flutter build apk --release`, which could not complete at all,
  now produces a signed 98.7 MB universal APK.
- **Day 15 complete.** Product-wide refinement: accessibility naming, reduced
  motion, readable width, button hierarchy, and two real defects found and
  fixed (a section-header overflow at large text, a vague failure message).
- **Day 14 complete.** Settings, an honest privacy data map, and a privacy
  deletion that can prove what it did and retries what it could not finish.
  Firestore rules now allow owner-only delete, with a 17-case emulator matrix.
- **Day 13 complete.** First-run onboarding: four screens, a durable local
  completion flag, and a router guard that a deep link cannot slip past.
- **Day 12 complete.** Private local search over Actions and captures, with
  filters. No FTS5, no index, no query ever persisted or uploaded.
- **Day 11 complete.** Explainable triage: Home ranks by pressure, and every
  card can say why it sits where it does. Deterministic, local, no score.
- **Day 10 complete.** Local reminders: durable intent, a replaceable
  notification seam, crash-safe scheduling and a reconciler. Real delivery,
  permission denial/recovery and reboot resilience verified on `emulator-5554`.
- **Day 9 complete.** Action Detail (`/action/:id`) and the durable, editable,
  reorderable Action Chain. Verified live on `emulator-5554`.
- **Day 8 complete.** Confirmed Actions are durable on-device in a Drift/SQLite
  store, with a minimised, owner-only Firestore mirror behind a retrying
  outbox. Verified live on `emulator-5554`.
- **Day 7 complete.** Trust-first review and confirmation UX: canonical field
  resolver, evidence affordances, ambiguity and manual-entry states, and a
  deterministic `canConfirm`.
- **Day 6 complete.** Firebase AI Logic adapter behind `ExtractionService`,
  with App Check and structured JSON responses.
- **Day 5 complete.** Extraction domain, grounding, validation, escalation and
  a deterministic fixture service.
- **Day 4 complete: PASS WITH LIMITATIONS.** Foundation, design system, capture
  pipeline, image normalisation and on-device OCR are done and verified on
  hardware and on the emulator.
- **Do not repeat Days 1–11.**

## Read before starting the next day

**`docs/EXTRACTION_CONTRACT.md`** — the locked v1 provider JSON, the evidence
strategy, every validation and escalation rule, and the prompt-injection
contract. Still current; none of it should need re-deriving.

**`firestore.rules`** — the deployed security posture, and the server-side
definition of what may leave the device. Change the mirror payload and you must
change these together, or the write will be rejected.

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
- **Extraction stops at `ActionDraft`.** Nothing durable is written until a
  person confirms, so no later feature can quietly skip confirmation. Day 8
  added the store that a confirmation writes into — it did not move that line.
- **The local database is the canonical store; the cloud is a mirror.** Local
  success never depends on Firebase, and a cloud failure never rolls back,
  deletes or edits a local Action.

## What Day 20 established

The release package, finished. **Nothing has been published.** No store
account was touched, no build uploaded, no declaration accepted, no release
created.

### Artifacts

| Artifact | Size |
| --- | --- |
| `build/app/outputs/bundle/release/app-release.aab` | **81.9 MB** (Play upload) |
| `build/app/outputs/flutter-apk/app-release.apk` | **98.7 MB** (universal, QA) |
| Per-ABI APKs | 31–39 MB — what a device installs |

Validated from the built APK rather than from configuration:

```
package: com.solvex.actionapp  versionCode=1  versionName=1.0.0
minSdk 24   targetSdk 36   label 'Action'
native-code: arm64-v8a  armeabi-v7a  x86_64
signed: v2 scheme, 1 signer
```

64-bit present, target above Play's current floor, signed with the existing
keystore read from an untracked `key.properties`. No credential was displayed
or altered.

⚠️ `versionCode 1` assumes nothing has ever been uploaded. That cannot be
checked from this machine, so it is flagged in the Play checklist rather than
assumed.

### Documentation

Six documents, plus a README that replaced the Flutter template stub:

| Document | What it carries |
| --- | --- |
| `README.md` | What Action is, the two rules (trust first, local first), architecture, how to run it, and the limitations stated plainly |
| `docs/PLAY_RELEASE_CHECKLIST.md` | Every Play submission step as an unticked box, with the load-bearing Data Safety answers pre-derived |
| `docs/STORE_ASSETS.md` | Screenshot shot-list with captions, feature graphic brief, and rules for whoever produces them |
| `docs/FIREBASE_SETUP.md` | The console steps this repo cannot perform, including that the App Check debug token is a secret that never gets written down |
| `docs/DATA_SAFETY.md` | (Day 19) Code-derived data inventory |
| `docs/SECURITY_REVIEW.md` | (Day 19) Permissions, exports, secrets, boundaries |
| `docs/RELEASE_IOS_CHECKLIST.md` | (Day 19) Honest that iOS has never been compiled |
| `docs/RELEASE_NOTES.md` | (Day 19) Draft listing copy and the claims that must not be made |

Two things these deliberately do **not** contain: a privacy policy URL, and a
support contact. Neither exists in this repository, both are required for
publication, and inventing either would be exactly the kind of fabrication
the product is built to avoid. Both are flagged as blocking, human-supplied
inputs.

### Repository hygiene

No scratch files, temporary databases, QA screenshots, performance dumps or
probe tests are tracked — the Day-16/17 probes and seeders were deleted when
they had served their purpose, and only the permanent guards remain
(`test/perf/`, `test/analytics/`). `.vscode/` is untracked and stays that
way.

**Dependency audit:** every declared package is imported somewhere except
`cupertino_icons`, which arrives with the Flutter template and which nothing
in this app uses — Action uses Material icons on both platforms because the
icon set is part of its own visual language rather than the host's. Removed.
No other package was touched: a release week is the wrong time for version
bumps.

### Final verification

- **798 tests**, `flutter analyze` clean
- Release APK and AAB both build
- Firestore rules unchanged, `schemaVersion == 1` still pinned, DB still v3
- Secret scan clean: no private keys, keystores or service accounts tracked
- **Long-run session on `emulator-5554`:** 18 cycles of search → settings →
  privacy → back. PSS 94.3 MB → 106.1 (6 cycles) → 107.5 (12) → 109.3 (18).
  The rise is front-loaded and then flattens to ~1.5 MB per six cycles, which
  is the shape of caches warming rather than an unbounded leak. Eighteen
  cycles in one session is not proof of no leak, and is not claimed as one
- Logcat across the session: zero `FATAL EXCEPTION`, `AndroidRuntime`,
  `E/flutter`, `OutOfMemory`, `RenderFlex`, `SQLite`, `no-app`

### Day-20 known limitations

- **Not published, by design.** Publishing, submitting, accepting store
  agreements and answering Data Safety in the console all require explicit
  approval and none was given.
- **A privacy policy URL and a support contact do not exist.** Both block
  publication. Neither was invented.
- **`versionCode 1` is unverified** against store history, which cannot be
  read from here.
- **iOS remains unbuilt.** Configuration is corrected and the checklist is
  written; nothing further may be claimed.
- **The Play Integrity path is unexercised.** App Check uses the debug
  provider on the emulator and Play Integrity in release, and no Play-signed
  build has run on a real device. This is the most likely production
  surprise and is called out in the Play checklist.
- Store screenshots and the feature graphic are **specified, not produced**.

## What Day 19 established

Release candidate. Feature freeze: only real defects, security and privacy
issues, and release blockers.

### Blockers found and fixed

Three, all of which would have stopped or damaged a store submission.

**iOS bundle identifier was still `com.example.actionApp`.** The Flutter
template default, which App Store Connect rejects outright. Now
`com.solvex.actionapp`, matching Android, along with the test target.

**iOS carried Flutter's template app icon**, which is also rejected.
Generated from the same source as Android with alpha removed as the store
requires.

**Firebase Analytics had pulled in three advertising permissions** —
`com.google.android.gms.permission.AD_ID`,
`ACCESS_ADSERVICES_ATTRIBUTION`, `ACCESS_ADSERVICES_AD_ID` — found by dumping
the built APK rather than by reading the source, since none of them appear in
this project's manifest. Action does no advertising, attribution or
audiences, so leaving them would have obliged a Play Data Safety declaration
that the app collects an advertising identifier, which is not true. Removed
via `tools:node="remove"` with
`google_analytics_adid_collection_enabled=false` so the binary and the
declaration agree, then verified on device that analytics still works
(`app_opened` fired on all three cold starts).

Also fixed: iOS display name was "Action App" against Android's "Action".

### Audit results

| Area | Result |
| --- | --- |
| Version | `1.0.0+1` — genuine first release, not invented history |
| Application id | `com.solvex.actionapp` in the Gradle namespace, applicationId, and now iOS |
| Display name | "Action" on both platforms |
| Icon | Adaptive Android icon and generated iOS set, both from `assets/icon` |
| Splash | Native, light and dark, no artificial delay |
| Permissions | Nine, each justified in `docs/SECURITY_REVIEW.md`. No exact alarm, camera, storage, location, contacts, SMS or microphone |
| Exported components | Five, four of them library-standard. Documented, with the reasoning for leaving Firebase Auth's alone during a freeze |
| Cleartext traffic | Not declared; off by default at this targetSdk. No custom trust manager or certificate bypass anywhere |
| Secrets | No private keys, keystores or service accounts tracked. `key.properties` untracked. The Firebase client API key is embedded by design and protected by rules plus App Check |
| Firestore | Owner-scoped, payload-validated, catch-all deny — unchanged |
| Trust regression | 224 extraction and fixture tests pass: prompt injection, fabricated claims, ambiguous and multiple dates, malformed JSON, no-action, missing deadline |

Photo capture needs no `CAMERA` permission because `image_picker` goes
through system intents — worth stating because "the app takes photos" makes
the permission look missing rather than deliberately unnecessary.

### Artifacts

| Artifact | Size |
| --- | --- |
| `build/app/outputs/bundle/release/app-release.aab` | **81.9 MB** |
| `build/app/outputs/flutter-apk/app-release.apk` | **98.7 MB** |
| Per-ABI APKs (what a device actually installs) | 31–39 MB |

Both signed with the existing release keystore, read from an untracked
`key.properties`. No credentials were displayed or changed.

### Documents produced

- **`docs/DATA_SAFETY.md`** — what the app does with data, derived from the
  code, each row naming the file that implements it. The evidence a Play Data
  Safety or App Store privacy form should be filled in *from*. It is not a
  submission and nothing has been submitted.
- **`docs/SECURITY_REVIEW.md`** — permissions, exported components, network,
  secrets, Firestore, App Check, data boundaries, and what is knowingly
  accepted.
- **`docs/RELEASE_IOS_CHECKLIST.md`** — honest about iOS never having been
  compiled. Records what was fixed from Windows and what genuinely requires a
  Mac, including that **there is no iOS Firebase app and no iOS App Check
  provider wired**.
- **`docs/RELEASE_NOTES.md`** — draft listing copy and a limitations section
  that says Android-only, no account, approximate reminders, Latin-script OCR.

### Device QA

Release build on `emulator-5554`. Cold start 1228/1293/1327 ms fresh-install,
1446 ms after force-stop. Landscape and portrait both free of `RenderFlex`
overflow. Process death and relaunch clean. Logcat across the session: zero
`FATAL EXCEPTION`, `AndroidRuntime`, `E/flutter`, `OutOfMemory`, `no-app`.

**798 tests**, `flutter analyze` clean.

### Day-19 known limitations

- **iOS is not built, not run, not tested.** The configuration is corrected
  and the checklist is written; nothing more may be claimed.
- **The empty-state message is clipped by the floating Add bar in landscape
  on a phone.** The bar reserves its height and portrait clears comfortably;
  landscape has roughly 800 px for a greeting plus centred content and the
  last line still falls under the bar. Doubling the reservation was tried and
  changed nothing, so the cause is available height, not padding. Left alone
  deliberately: it is the empty state, seen once before anything is added,
  and the thing covering the text is the only action available. A
  landscape-specific layout is not a freeze-week change.
- **Firebase Auth's `GenericIdpActivity`, `RecaptchaActivity` and
  `RevocationBoundService` remain exported.** Unused by this app, which only
  signs in anonymously, but intrinsic to the SDK, and Firebase may route
  anonymous sign-in through reCAPTCHA under anti-abuse. Stripping them during
  a freeze risks breaking auth for a theoretical gain.
- **No user-facing analytics toggle** (carried from Day 18).
- **Play Data Safety, content rating and store listing are drafts.** Nothing
  has been submitted and no store account has been touched.

## What Day 18 established

Product analytics that can measure the funnel without ever learning what an
Action is about.

### The problem this had to solve

Action's subject matter *is* the sensitive material: bills, letters,
deadlines, amounts, reference numbers, and whatever someone types into search.
Ordinary analytics practice — log an event, attach some useful context — is
exactly how that ends up in a dashboard. So the contract is not a policy
document; it is two mechanisms, and both are tested.

**Names come from a closed catalogue.** `AnalyticsEvents` holds every event
the app can emit and an `all` set that `validateAnalytics` checks against. A
name can therefore never be *built* from data: `'action_created_$title'` is
rejected, not sent.

**Parameters are allowlisted by key and pinned by value.** A key allowlist
alone would happily carry `capture_type: "Northgate Water invoice.pdf"`, so
each key also declares the closed set of values it may take —
`camera|gallery|paste`, `success|needs_review|manual|failed`,
`system|light|dark`, `yes|no`. Every one of those words is chosen in the
source file, so no parameter can contain anything a user typed, a document
said, or a model returned. The single exception is `failure_class`, which
carries machine words the app itself mints, guarded by a length cap and a
no-spaces rule so prose cannot hide there.

Violations `assert`, which fires in debug and in `flutter test` and is
stripped from release. A mistake fails a test rather than shipping; in
release the bad *parameter* is dropped and the event still counts, because
losing the event would hide the mistake and sending the parameter would be
the mistake.

### The seam

`AppAnalytics` is the interface; `FirebaseAppAnalytics` is the only file in
the app that names `FirebaseAnalytics`. `NoopAppAnalytics` and
`RecordingAppAnalytics` are the test and cloud-free implementations — and
both still run the validator, so a test that stubs analytics away does not
also stub away the rule.

Day 16's gate applies: an event raised before Firebase finishes coming up
waits rather than throwing, and if Firebase never arrives the event is simply
lost. Every call is fire-and-forget and every failure is swallowed. Analytics
that can break the product is worse than no analytics.

The previous `ReviewAnalytics` seam and the two scattered event lists
(`ReviewEvents`, `ActionEvents`) were folded into the one catalogue, so there
is now a single place to answer "what can this app measure?".

### The funnel, with no content in it

    capture_started → extraction_succeeded / extraction_manual_fallback
      → review_confirmed → action_created → action_completed

New events wired this day: `app_opened`, `onboarding_completed`,
`capture_started/succeeded/failed` (with `capture_type`),
`extraction_started/succeeded/needs_review/failed` (with
`extraction_outcome`), `search_opened`, `search_no_results`,
`privacy_delete_started/completed/partial` (with `deletion_verified`), and
`appearance_changed` (with `theme_mode`).

Search is the sharpest case and worth stating plainly: **the query is never
logged**, and neither is the result count or anything about what matched.
What is recorded is that search was opened and that a search found nothing —
enough to know whether the feature works, and nothing about what anyone was
looking for.

Cosmetic interaction is not measured. There is no `glass_opened`, no
animation telemetry. Analytics here is product behaviour, not design
surveillance.

### Crash reporting

No `setUserIdentifier`, no `setCustomKey`, no breadcrumb logging anywhere in
the app — verified by search, not by memory. A stack trace is whatever
propagated, so the defence has to be upstream: every error this app raises
itself carries a machine word rather than the thing that caused it.
`CloudMirrorException('permission_denied')`,
`NotificationScheduleException`, `ProviderTransportException` with a typed
kind. Tests pin that, so a future `throw` that interpolates a title fails
here rather than in a crash report.

### Verified on device

Release build on `emulator-5554`, with Firebase Analytics debug logging
enabled so the events Firebase actually receives could be read directly.
Walking onboarding → Home → search → settings produced exactly:

    app_opened, onboarding_completed, search_opened, search_no_results

plus Firebase's own `first_open`, `session_start`, `screen_view`. The search
that produced `search_no_results` was for the string `zzqq`, and **`zzqq`
appears zero times in the analytics logs**. The only parameters attached to
our events are Firebase's automatic ones (`ga_event_origin`,
`ga_screen_class=MainActivity`, `ga_screen_id`) — and `MainActivity` is
constant for a Flutter app, so not even the route leaks.

Logcat clean: zero `FATAL EXCEPTION`, `AndroidRuntime`, `E/flutter`,
`OutOfMemory`, `core/no-app`, `AnalyticsContractViolation`.

### The privacy page now says so

A "Diagnostics" section was added, written to be checkable against the code
rather than reassuring: anonymous counts of what happened, explicitly not
contents, explicitly not the anonymous ID or any Action/capture identifier,
and an honest line about crash reports. Every claim in it corresponds to
something the contract enforces.

**798 tests** (780 + 18), `flutter analyze` clean.

### Day-18 known limitations

- There is no user-facing analytics toggle. One was not added because a
  toggle that does not genuinely control collection would be worse than
  none, and wiring a real one is a product decision with consent
  implications that no code in this repo settles. The privacy page describes
  what happens; it does not offer a switch it cannot honour.
- Firebase's automatic events (`first_open`, `session_start`, `screen_view`,
  and the `ga_*` parameters) are collected by the SDK, not by this app's
  seam. They are content-free here — `screen_class` is always
  `MainActivity` — but they are outside the catalogue's control.
- The contract is enforced by `assert`, so a release build cannot fail on a
  violation. That is deliberate: the check runs everywhere a developer or CI
  will see it, and in release the parameter is dropped rather than sent.
- Crash *stack traces* are still whatever propagated. The app's own errors
  are content-free by construction, but a third-party library's exception
  message is not something this codebase controls.

## What Day 17 established

Hardening. The privacy debt Day 14 wrote down is paid, the last large startup
cost is gone, and the product has a visual language of its own. No new
features.

### The orphaned cloud mirror, closed

Day 14's limitation, stated plainly at the time: an Action lost locally
*before* Day 14 — a reinstall, a wiped database, a crash between the mirror
write and the local commit — leaves a document whose id nothing on the device
knows. "Delete all my data" could not reach it, because the architecture has
no remote reads at all.

`CloudPrivacyInventory` (`lib/features/actions/data/`) opens exactly one door
and no more. It returns **ids and nothing else** — no titles, no payloads, no
documents — so nothing it hands back can hydrate a screen, restore an Action,
or reach Home, Search or triage. It runs during an explicit privacy deletion
or a retry finishing one, never on a timer and never at startup. The deletion
now works from the *union* of what the device knows and what is actually up
there.

**No Firestore rules change was needed, and none was made.** The deployed rule
already grants `allow read` on `users/{uid}/actions/{actionId}`, and `read`
covers listing; `isOwner(uid)` depends only on the path and the caller's auth,
never on document contents, which is what makes a whole-collection query
decidable by the rules engine. The collection sits under the uid, so there is
no query here that could reach another user's subtree. Catch-all deny is
untouched.

The honest part is the third outcome. Deleting every record we can name is not
the same as knowing none is left, so the flow now distinguishes them:

| what happened | what it says |
| --- | --- |
| listing worked, nothing left | "Everything has been deleted." |
| listing worked, something failed | names exactly what is left, retries |
| **listing failed** | "Everything on this device has been deleted. Action could not reach the cloud to confirm nothing is left there, and will check again." |

`PendingCloudDeletion` gained a `cloudListed` flag so a retry can tell "one
delete failed" from "we never got to look" — the second still owes a listing,
and the retry performs it. Records written before today decode as
`cloudListed: false`, which is both compatible and truthful.

Verified end to end on `emulator-5554` with a 120-Action corpus:

1. **Online delete** → listing succeeds → local rows `0|0|0`, no pending record
2. **Offline delete** → listing fails → `pending_cloud_deletion_v1` kept with
   `listed:false`, and completeness is *not* claimed
3. **Network returns** → relaunch → retry performs the listing → record cleared

### Firebase's ContentProvider: measured, then removed

Day 16 named this the largest remaining pre-frame cost Dart could not reorder,
and left it alone for want of evidence. Six cold starts each way, profile
build, API-36 emulator:

| | runs (ms) | median |
| --- | --- | --- |
| with `FirebaseInitProvider` | 1809 1916 1924 1948 2006 2067 | **~1936** |
| without it | 1283 1319 1391 1398 1483 1497 | **~1395** |

~540 ms, and **not one run in the second set was slower than any run in the
first**. The provider only ever did what `main()` already does explicitly, so
removing it changes when Firebase comes up, not whether.

Go/no-go was decided on correctness, not the number. Verified on device after
removal: the default `FirebaseApp` initialises, Crashlytics starts and fetches
its settings, App Check's debug provider activates, anonymous auth succeeds,
and a seeded outbox of pending Action mirrors **drained to zero** — which it
can only do if auth, App Check and Firestore all work.

The trade, stated in the manifest itself: Crashlytics now starts when Dart
asks rather than at process creation, so a *native* crash in the first few
hundred milliseconds would go unreported. Dart errors are unaffected — `main()`
installs its handlers before anything can fail. Deleting the `tools:node`
block restores the default if a future Firebase library ever needs it.

### Liquid / mirror glass

`GlassSurface` (`lib/design/components/`) is the whole vocabulary: one widget,
three intensities. It layers a tinted body, a top-edge specular gradient that
fades by the middle, a hairline that is brighter than the fill, and a soft
depth shadow. Light glass is mostly white and reads through its highlight;
dark glass is charcoal with the highlight dropped to 0.055, because a bright
edge on a dark panel is the difference between glass and sci-fi.

**Where it went, and why only there.** Glass is only honest where something
passes behind it, and a `BackdropFilter` over a static background is pure cost
for no picture. So: bottom sheets (every one, via `AppSheet` — the theme's own
sheet background is transparent now so the widget owns the appearance), the
Home Add bar (with `extendBody: true`, so cards genuinely scroll under it), and
the Search field plus filter tray (results run beneath them). Dense Action
lists stay solid and readable, exactly as Day 15 left them.

The Day-16 performance budget is defended by tests, not intent: blur is
clipped to each surface's own rounded rect so the read-back is the surface and
not the screen, sigmas top out at 22, one blur layer per surface, and a test
asserts a list never sits inside a `BackdropFilter`. Under
`MediaQuery.highContrast` the blur is dropped **entirely** — not reduced — and
the border, radius, padding and depth stay, so the layout does not move. That
is also why nothing in this app uses translucency to communicate: it is depth,
never meaning.

### Wide layouts

`ReadableWidth` caps and centres rather than stretching: 560 for prose, 720
for card lists. Applied to Home, Search and Action Detail (onboarding and
Settings already had it). No second pane, no tablet variant, nothing
rearranges — below the cap the phone layout is untouched. The glass surfaces
are capped too, so a tablet does not get a metre-wide control bar.

One bug worth recording, because the test that now guards it is the point: an
`Align` given bounded-but-loose constraints **fills** them. Wrapping the bottom
bar in the default therefore grew it to the full screen height and left an
invisible glass surface swallowing taps meant for the page behind it. Hence
`shrinkVertically`, and a test that pins both behaviours under exactly the
constraints a `Scaffold` bottom bar is laid out in.

### Other hardening

- **`FirebaseGate`** — 9 tests covering arrival before/during/after
  initialisation, 25 concurrent callers sharing one initialisation, late
  completion, and a closed gate. A sync pass over a closed gate backs off and
  keeps every row rather than throwing out of an unawaited post-frame call.
- **Double-tap.** A modal's route stays mounted through its dismissal
  animation, so a second tap on Save ran the handler again — and the second
  `pop` closed *the screen underneath*, throwing the user back to the inbox
  mid-save. `popSheetOnce` checks `ModalRoute.isCurrent`, which flips false the
  moment the first pop starts. Onboarding's finish got a guard too.
- **Timezone semantics**, pinned: a date-only deadline is a local calendar day
  read identically at 00:01 and 23:59; a timestamp is an instant; storage
  carries no zone so it cannot be re-interpreted into a different day; day
  counting survives a DST jump in both directions.
- **RTL sanity** — glass and readable width lay out without overflow under
  `TextDirection.rtl`.

### Day-17 QA

Release build on `emulator-5554`. Cold start 819/727/840 ms. Home at 120
Actions with cards blurring correctly through the floating bar; dark mode
charcoal and intentional; a 1600×2560 tablet viewport capping content and the
glass bar at a readable width. Logcat across the whole session: **zero**
`FATAL EXCEPTION`, `AndroidRuntime`, `E/flutter`, `OutOfMemory`,
`SQLiteException`, `core/no-app`, `RenderFlex`.

**780 tests** (736 + 44), `flutter analyze` clean.

### Day-17 known limitations

- Anonymous identity remains device-install-local. Losing the install loses
  the id, and with it any mirror document under it — which is also why a
  reinstall's orphans belong to a *different* uid and are not reachable even
  by the new inventory. Account recovery is not a Day-17 problem and no
  sign-in was added.
- The inventory bills one Firestore document read per mirrored Action during a
  deletion. Bounded by the corpus and only on an explicit destructive action.
- Glass is on four surface families. Onboarding's hero and the Settings header
  were left alone pending the Day-19 polish pass; they are not worse than they
  were.
- Wide layouts cap and centre. There is deliberately no split view.
- Frame timing remains qualitative: `dumpsys gfxinfo` does not track Flutter's
  surface, so jank was judged from logcat and observation.

## What Day 16 established

Performance and resilience. No new product features, and no visible change to
triage order, search ranking, reminder semantics or deletion behaviour.

Everything below was **measured first**. Where a number is quoted the method is
named, because a benchmark without one is an opinion.

### Startup: Firebase left the critical path

Measured on `emulator-5554` (API 36) in **profile** mode, with temporary marks
in `main()` and `am start -W`, three or more cold runs each.

Before — every phase serialized ahead of the first frame:

| phase | run 1 | run 2 | run 3 |
| --- | --- | --- | --- |
| binding | 3 ms | 3 ms | 2 ms |
| `Firebase.initializeApp` | **388 ms** | **413 ms** | **567 ms** |
| App Check activate | 28 ms | 12 ms | 15 ms |
| Crashlytics flag | 12 ms | 13 ms | 18 ms |
| preferences | 10 ms | 5 ms | 4 ms |
| **first frame** | **451 ms** | **451 ms** | **611 ms** |

So 85–93% of the pre-frame window was Firebase, and the inbox needs none of
it. After the change, first frame across seven cold runs: 26, 344, 350, 388,
401, 436, 454 ms (**median ≈ 388 ms**), with Firebase completing at 616–811 ms
— comfortably *after* the UI is up, which is the point. Android's own
`TotalTime` moved from a median of ~1586 ms to ~1503 ms; warm launch is
101/153/112 ms.

Be honest about the size of that win. The remaining ~350 ms is native engine
start, Flutter plugin registration and Firebase's own auto-init
`ContentProvider` — all before Dart gets a turn, and none of it reorderable
from `main()`. What Day 16 removed is the *serialized Dart wait*: half a
second of platform-channel work that used to sit between process start and a
usable inbox, and that would grow on a slower device or a cold cache.

One measurement worth recording because it contradicts the obvious fix:
starting the preference read *concurrently* with Firebase made things worse,
not better. Both are platform-channel calls, and native Firebase init
monopolised the platform thread — a 5 ms preference read became 325 ms and
took the first frame with it. They are now sequenced, preferences first.

### `FirebaseGate`

Moving initialisation off the startup path means "Firebase is still coming up"
became a reachable state, so it was given a name rather than left as a race.
`lib/core/firebase/firebase_gate.dart` holds one `Future<bool>`, and the four
seams that actually touch Firebase await it before their first call:

- `FirebaseAuthIdentityService` — reports `firebase_unavailable`, the same
  shape as any other auth outage, so the outbox backs off instead of throwing
- `FirestoreActionCloudMirror` — raises `CloudMirrorException('unavailable')`,
  so the row is retried and not lost
- `FirestoreActionCloudPrivacyService` — returns everything as still-owed, so a
  pending deletion is kept for next launch
- `FirebaseAiTransport` — App Check is activated *inside* the bring-up and
  before the gate opens, so the Day-6 guarantee holds: an extraction never runs
  against an unattested client just because the user was quick

The gate never throws and never times out. It defaults to **open**, so every
test and every cloud-free build behaves exactly as before.

Error reporting improved as a side effect. `FlutterError.onError` and
`PlatformDispatcher.onError` are now installed *before* anything can fail —
previously they were wired after Firebase, so an error during initialisation
had nowhere to go at all. Each handler defers until the gate answers, then
records; if Firebase never arrives the error is at least presented.

### What was measured and deliberately left alone

| area | measurement | verdict |
| --- | --- | --- |
| triage | 0.02 ms @10, 0.90 ms @500, 1.20 ms @1000 | linear/N-log-N; no change needed |
| `watchAll` hydration | 1.9 ms @50, 5.0 ms @200, 10.9 ms @500 | three queries total, not per card |
| `getById` | 0.14 ms, flat from 50 to 500 Actions | no index justified |
| `action_steps` FK scan | 0.31 ms @400 rows, 0.20 ms @1000 rows | does not grow; no index justified |
| Action Detail, 100-step chain | 0.37 ms `getById`, 0.63 ms `watchById` | fine |
| `JsonFileSourceStore.all()` | 0.55 ms @10, 1.38 ms @100 | no Drift migration justified |
| outbox | one bounded pass, `limit: 10`, re-entrancy guarded | already correct |
| image normalisation | `compute()`, background isolate | untouched |

**The database stays at version 3.** Section 19 of the brief asked whether
indexes were warranted; the evidence says no. The one lookup without an index —
`action_steps.action_id` — does not get slower as the table grows, because
SQLite scans a table that is small in absolute terms. Adding an index would
have cost a migration and a write penalty to fix a problem that was not
measured to exist. `actionSchemaVersion` remains 1 and `firestore.rules` is
untouched.

### Search: the one real hotspot

Search was measured at 500 Actions plus 100 captures and found to be doing
genuinely redundant work — not the wrong algorithm, the same work repeatedly.
The needle was re-folded (trim, a whitespace regex, lower-case) once per
haystack rather than once per query; an Action title was folded up to three
times to answer three questions about it; and a capture's OCR body was passed
through the same regular expression twice, once to test for a match and again
to build the snippet.

`SearchNormalizer.fold` was split into `collapse` (the expensive regex, case
preserved) and a lower-casing step, so the collapsed body can be reused for
the snippet. The needle is folded once per query.

| query | before | after |
| --- | --- | --- |
| "north", 50 Actions + 100 captures | 14.3 ms | **8.1 ms** |
| "north", 500 Actions + 100 captures | 29.2 ms | **19.8 ms** |
| "north", 1000 Actions + 100 captures | 47.2 ms | **35.7 ms** |
| captures only, 100 | 13.4 ms | **6.9 ms** |
| captures only, 200 | 26.0 ms | **13.9 ms** |
| rapid typing, 5 queries @500 | 145.0 ms | **97.9 ms** |

Ranking, filters, snippet bounds and the privacy boundary are unchanged: no
query is persisted, no index is built, nothing is uploaded. **FTS5 was not
introduced**, and the Day-12 decision stands — the measurements show linear
search is comfortably responsive at ten times the corpus the app has.

What remains is the `watchAll().first` re-read per query (~11 ms of the 20 ms
at 500 Actions). It was left alone deliberately: it is what keeps results
fresh, and 20 ms behind a 180 ms debounce is not a problem worth trading
correctness for.

### Midnight, closed

Day 11 documented that Home held open across midnight kept describing
yesterday. `LocalDay` (in `action_providers.dart`) closes it with **one**
non-periodic timer armed for the next local midnight, re-armed when it fires
and cancelled on dispose. No tick, no poll, nothing per-second, and a timer
that fires late — because the device slept — reads the clock at that moment
rather than assuming. Pinned by a `fake_async` test that asserts the timer
count is exactly one, that it re-arms, and that it does not outlive the
provider.

### Other narrow fixes

- **`ReminderReconciler` no longer re-reads the same Action once per
  reminder.** An Action can hold several; the pass now remembers what it has
  already loaded. Bounded, still one pass, still no permission prompt.
- **`_rankOf` is a map rather than a linear scan** of the precedence list. The
  list stays the readable statement of the rules; the map is the same
  information indexed, so a sort no longer nests a search inside itself.

### The release build was broken, and is fixed

`flutter build apk --release` **could not produce an APK at all** before Day 16
— R8 failed on missing classes. ML Kit's text-recognition entry point names
all five script bundles it can construct and this app ships only Latin, so the
four absent ones are references R8 refuses to shrink past.
`android/app/proguard-rules.pro` states that the absence is expected
(`-dontwarn`, not `-keep` — keeping would be a lie about what is in the APK).

| artifact | size |
| --- | --- |
| universal release APK | **98.7 MB** |
| arm64-v8a | 37.3 MB |
| armeabi-v7a | 31.1 MB |
| x86_64 | 39.2 MB |

No accidental bloat: per ABI it is Flutter (8–12 MB), the app (9–10 MB), ML
Kit's OCR pipeline (6.5–11 MB) and SQLite (1.6 MB). Nothing absurd arrived
with Days 10–15. The universal APK is large only because it carries three
ABIs; a real install takes one.

### Device QA

Release build on `emulator-5554`, seeded via `adb root` with a synthetic
database — **501 Actions, 1120 steps, 40 reminder intents, 501 pending outbox
rows** — generated by `ScaleFixtures`, never shipped.

- Home renders 133 in Needs Attention with correct triage reasons; scrolling
  ~27 flings through the whole list is smooth
- Search: "invoice" returns 75 of 500, "permit" returns 84, typed one character
  at a time, with highlighting and correct ranking
- Action Detail with a 120-step chain opens immediately, reports "30 of 120
  done", scrolls to step 119, and completes a step correctly
- Reminders: all 40 intents reconciled to `needsPermission` — the correct
  answer for a fresh install with no notification permission, reached without
  raising a prompt
- Offline (airplane mode): cold start 701/774/745 ms — **faster than online**,
  which is what the gate is supposed to produce — and Home, Search and Detail
  all fully usable
- Force-stop and relaunch: 614 ms, database opens normally, order deterministic
- Memory across 12 full navigate/search/detail/scroll cycles: 106.8 MB, then
  65.5 MB, then 65.2 MB PSS. Flat between cycle 6 and 12, so no monotonic
  growth. One session is not proof of no leak, but nothing suggests one.
- Dark and light both correct at 500 Actions
- Logcat: **zero** `FATAL EXCEPTION`, `AndroidRuntime`, `E/flutter`,
  `OutOfMemory`, `SQLiteException`, `Skipped N frames`, `core/no-app`

### Regression guards

`test/perf/day16_performance_test.dart` — 14 tests. Deliberately **catastrophe
detectors, not benchmarks**: thresholds sit 30–40x above measured cost so a
contended CI machine passes, while the shape checks (triage growth from 250 to
1000, capture reads per query, one timer) fail on the wrong *algorithm*
regardless of machine speed. `test/support/scale_fixtures.dart` generates the
corpora programmatically — no fixture files, no personal content.

### Day-16 known limitations

- The remaining ~350 ms to first frame is native: engine start, plugin
  registration, and Firebase's auto-init `ContentProvider`. Disabling that
  provider in the manifest to control init timing is a known technique and a
  real Day-17 candidate, but it is an Android manifest change with genuine
  risk and there is no evidence yet that it helps.
- `watchById` declares `readsFrom` on `actions`, `action_steps` and
  `action_facts`, so a write to *any* Action re-emits for an open detail
  screen. Measured at 0.14–0.63 ms per emission and only while a detail screen
  is open. Narrowing it would need a fingerprint covering every column, and
  getting that wrong would silently suppress a real step update — not a trade
  worth making for sub-millisecond work.
- Search still re-reads all Actions per query (~11 ms at 500). Kept for
  freshness.
- Frame timings are qualitative. `dumpsys gfxinfo` does not track Flutter's
  surface, so jank was assessed from logcat (`Skipped frames`, `Davey`) and
  observation, not a frame histogram.
- Emulator startup variance is high (cold `TotalTime` ranged 980–1956 ms on
  the same build), so medians are quoted over ranges and no single run is
  treated as a benchmark.
- The Day-14 privacy limitation is unchanged and still owed: a cloud mirror
  document whose local Action was already lost before Day 14 is not
  discoverable, because nothing lists remotely. Day-17 hardening.

## What Day 15 established

Day 15 changed no behaviour that was not a defect. The audit came first, and
it mostly found a codebase already holding its line: no inline `TextStyle`
anywhere in `lib/features`, no hardcoded radii, one magic `EdgeInsets`, no
emoji, no raw enum labels in production UI, no "Nothing here yet" and no fake
metrics. What it did find:

**A real overflow.** `SectionHeader` put an unconstrained title and a count
pill in one `Row`. At 200% text on a 420dp screen that overflows by 11px —
"NEEDS ATTENTION" plus the pill does not fit. The title is now `Flexible` so
it wraps to two lines and the count stays visible. Truncating a section name
would have been worse than two lines. Caught by a test, confirmed fixed on
device.

**Two equally loud primary buttons on Action Detail.** "Mark step done" and
"Mark action complete" were both filled. The filled one now belongs to the
recommended next step — the move the product is actually suggesting — and
finishing the whole Action is an `OutlinedButton`: still one tap, no longer
shouting over the step. A test asserts exactly one `FilledButton` on that
screen.

**A vague failure message.** `ProviderFailureKind.unknown` said "Something
went wrong reaching the service." A test now walks every value and rejects
"something went wrong", "oops", and bare status codes, and requires each to
be a full sentence.

**Controls now name what they act on.** Home's completion button was three
identical "Mark as done" buttons to a screen reader; it is now `Mark "Pay the
water bill" as done`. The step checkbox carries its own label and `checked`
state rather than inheriting the row's, so focusing it directly says
something.

**Reduced motion is honoured.** The one decorative animation in the product
(the onboarding progress segments) collapses to `Duration.zero` when
`MediaQuery.disableAnimationsOf` is set; paging still changes screen, it just
stops sliding.

**Paragraphs stop at `Breakpoints.readableContent` (560).** Settings, Privacy,
Help and Onboarding centre within it. Card lists are deliberately untouched:
this is not a tablet redesign.

### Day-15 known limitations

- Home, Search and Action Detail are still phone-first: they fill the width
  on a tablet rather than adopting a wider layout. That is a Day-16+ decision,
  not a polish one.
- Review (the Day-7 confirmation screen) was audited and left alone. It is the
  most complex surface in the product and the day's brief was explicit about
  not rewriting stable architecture for visual perfection.
- The visual QA was screenshot comparison by eye, not golden tests. Golden
  files would pin rendering to one Flutter version and one host font stack,
  which is a maintenance cost this project has not chosen to take on.

## Next roadmap day

**Nothing is scheduled.** Days 1–20 are complete. The app is a validated,
signed release candidate that has deliberately not been submitted anywhere.

Before anything can be published, a human must supply:

1. **A privacy policy, written and hosted.** `docs/DATA_SAFETY.md` is the
   factual basis for it; it is not itself a policy and is not hosted.
2. **A support contact.** Not present anywhere in this repository.
3. **Confirmation of store history**, so `versionCode 1` is either right or
   bumped.

Then work through `docs/PLAY_RELEASE_CHECKLIST.md`, answering Data Safety
from `docs/DATA_SAFETY.md` rather than from memory.

The largest unexercised risk is App Check: release builds use Play Integrity,
which the emulator can never satisfy, so that path has never run on a real
device. Verify it from an internal-testing build before any public release.

For iOS, `docs/RELEASE_IOS_CHECKLIST.md` — it has never been compiled.

## What Day 14 established

**The deletion ordering is the design.** `PrivacyDeletionService` records the
intent *before* destroying anything, because the cloud document ids live only
in the local database it is about to drop; cancels alarms before dropping the
rows they point at; deletes Actions and the outbox in one transaction so a
pending mirror upsert can never re-create a document that is about to be
deleted; and only then deletes remotely, clearing the intent last. Every
point it can die at leaves a state that is either correct or recoverable.

**It never claims a deletion it did not perform.** Three outcomes:
`DeletionComplete` (both places), `DeletionPartial` (device wiped, with
cloud copies and/or captures still outstanding — reported precisely, and each
leftover named), and `DeletionFailed` (the local wipe failed). The partial
case exists because a test found the earlier design saying "nothing has been
changed" after it had already dropped every Action — captures failing must
not mask a database wipe that worked.

**What is owed survives a restart.** `PreferenceKeys.pendingCloudDeletion`
holds an anonymous uid and a set of Action ids — no titles, amounts or dates,
asserted by test — and is deliberately **not** cleared by "delete all my
data": clearing it would strand exactly the documents the user asked to be
rid of. `ActionApp._startUp` retries it once per launch, after the reminder
reconciler and never blocking the inbox.

**Firestore rules changed by exactly one line**: `allow delete: if
isOwner(uid)` replaces `if false`. Nothing else moved — no listing, no
relaxed validation, catch-all still deny-all. `firestore_tests/` is a
17-case matrix run against the emulator (`firebase emulators:exec --only
firestore --project action-rules-test "npm test"` from that directory) that
proves owner-delete works and that cross-user, unauthenticated and
out-of-collection deletes all fail. Deployed to `action-app-7084b`.

**`ActionCloudPrivacyService` is a separate interface from
`ActionCloudMirror` on purpose.** The mirror's most valuable property is that
it never reads remote state back. A `delete` sitting next to `upsert` is one
refactor away from a `fetch` sitting next to both. This interface can only
destroy things.

**Appearance is read synchronously**, like the onboarding flag, so the first
frame is already the right colour. Verified on device: with the system in
light mode and Dark chosen, the app is dark, and stays dark across a restart.

**Settings asks the system for nothing on open.** Notification state is a
query; requesting is a button, and "Open settings" goes through a
15-line `MethodChannel` in `MainActivity` rather than a dependency. The same
channel reports the real `versionName`/`versionCode`, so About cannot drift
from a hand-maintained constant.

**Privacy copy is a const, not a widget tree.** `privacyDataMap` and
`helpEntries` are public so tests can assert over *all* the copy; a lazily
built list only renders what fits on screen, and a copy-regression test that
can only see the top of the page is not a copy-regression test.

**Deliberately not built:** "clear completed Actions". It needs its own
cloud-consistency, reminder-cancellation and source-ownership rules, and the
day's brief was explicit that one correct wipe beats several unreliable
partial ones. "Clear captures" *is* offered, because it is purely local and
Day 9 already renders a missing source as a plain absence.

### Day-14 known limitations

- **Full deletion resets onboarding.** That is the documented choice: the
  flag is one of only two things `PreferenceKeys` persists, and leaving it
  behind while saying "all your data is deleted" would be a small lie. The
  device genuinely returns to a first-run state.
- Cloud deletion needs an anonymous uid. If identity cannot be resolved at
  all, the ids are kept and nothing is claimed — the retry resolves the uid
  later.
- There is no cloud *listing*: deletion works from the ids the device knows
  about. A mirror document whose Action was already deleted locally before
  Day 14 is unreachable by this flow.
- **Reading a binary file with `adb shell run-as ... cat > local` corrupts
  it on Windows** (CRLF translation; a 49152-byte database came back 49176).
  Use `adb exec-out`, or re-seed with SQL. This cost the Day-14 QA corpus.

## What Day 13 established

**First-run routing is a guard, not a one-time decision.** `routerProvider`
sets `initialLocation` from the onboarding flag *and* installs a `redirect`
that bounces any location to `/onboarding` while the flag is unset, and
bounces `/onboarding` to Home once it is set. A one-time decision would have
let a reminder deep link (`/action/:id`) open a cold-started fresh install
straight into Action Detail, skipping the privacy screen entirely. Both
directions are tested.

**The flag is read synchronously.** `PreferenceStore` deliberately has
synchronous getters and asynchronous setters, mirroring `SharedPreferences`
once loaded. `main()` awaits `SharedPreferencesStore.open()` before
`runApp` and injects it, so the router can decide the very first route
without a splash flicker or a frame of the wrong screen. If the platform
channel fails, `open()` falls back to an in-memory store: the app still
starts, and onboarding simply reappears next launch — the safe direction to
fail in.

**Every key the app persists is listed in `PreferenceKeys`**, so "what does
this app remember about me?" is answerable by reading one list. That list is
what Day 14's data-deletion has to clear.

**Skipping and finishing are the same commitment.** Skip appears from screen
two (offering it on screen one is offering to leave before anything has been
said) and disappears again on screen four, where the primary button already
ends the flow. Either path writes the same flag; a skipper is never nagged.

**Permissions are not onboarding pages.** Onboarding requests nothing —
tested by asserting `permissionRequests == 0` after walking the whole flow.
Camera is asked for when the user picks Camera; notifications when they
create their first reminder.

**Onboarding is inert.** Tests assert it does not modify Actions, does not
modify Sources, never calls `ExtractionService`, and never writes to the
cloud mirror. It is a thing you read, not a thing that does anything.

**The privacy screen's copy was written against the code, not from
memory.** Every claim was checked against `cloudPayloadFor`, `SourceStore`,
the reminder scheduler and the search service first. It says content is sent
to the AI service when you ask Action to read something; it names exactly
what the mirror carries (title, dates, amount, suggested step) and what it
does not (captures, steps, reminders); and it says plainly that the mirror is
not a backup and cannot restore to a new device. Three tests pin this down by
asserting the *absence* of "everything stays on", "never leaves", "Cloud
backup" and "syncs across".

**Accessibility.** The four illustrations are wordless geometry built from
the app's own tokens, so they can be dropped whole — which they are, both on
a short viewport and at a large text scale, where the picture would otherwise
cost about four lines of the copy it only decorates. Progress is announced as
"Step 2 of 4", not just drawn. Short pages centre in the viewport; the long
privacy page scrolls.

### Day-13 known limitations

- **Resetting onboarding for QA is an adb operation**, not a UI control:
  stop the app, delete `shared_prefs/FlutterSharedPreferences.xml`, relaunch.
  `OnboardingController.reset()` exists and is tested, but is deliberately not
  wired to any production affordance. **Wait for the process to actually
  exit before deleting the file** — a still-exiting process flushes its
  cached preference map back to disk and silently restores the flag. This
  cost a QA cycle; it is a harness race, not a product bug.
- Onboarding always restarts from screen one; an interrupted run does not
  resume where it left off. That is intended — four screens is short enough
  that resuming mid-thought would be stranger than starting over.
- There is no way to see the onboarding screens again from inside the app.
  The privacy content is re-stated on Day 14's privacy page, which is where
  someone would look for it.

## What Day 11 established

**Home ranks by pressure, and says why.** Triage is a lexicographic
precedence list, not a weighted score — every position is justifiable in a
sentence, and moving an Action up always has a nameable cause. There is no
number anywhere, because a rank the user cannot argue with is a rank they
cannot trust.

**The precedence, in order** (`_precedence` in `action_triage.dart`):
overdue → due today → critical and due within three days → every step done →
due tomorrow → a self-set reminder within a day → due within three days →
critical with no deadline → due within seven days → marked important → has a
deadline further out → nothing pressing.

**Needs Attention is deliberately narrow**: overdue, due today, critical *and*
close, all steps done, a scheduled reminder within 24h, critical with no
deadline. Notably **not** "due tomorrow" on its own and **not** "important" on
its own — if fifteen things all look urgent the section has stopped meaning
anything.

**Money never ranks anything.** A £10,000 bill and a £20 one with the same
deadline get the same rank, by test. Ranking obligations by size is a product
decision this app does not make.

**Date semantics.** Date-only deadlines are compared as *local calendar
dates* — "due 18 August" is due all of the 18th and becomes overdue only once
that day is over. Timestamp deadlines are compared as instants and are overdue
the moment they pass. Day counting is done over UTC dates so a daylight-saving
jump cannot round it wrong.

**Signals that are allowed, and their limits.** A reminder counts only if it
is genuinely `scheduled`, in the future, and within 24 hours — one blocked on
permission or refused by the platform will not alert anyone and must not
pretend to. A chain counts only when *every* step is done (one tap from
finished); percentage progress is not a signal, and nine-of-ten ranks exactly
like one-of-ten.

**Never claims a consequence.** Triage may say a thing is late. It may not say
that being late is expensive, illegal or dangerous — there is a test asserting
no explanation contains such words.

**Tie-breaking is total**: rank → soonest deadline (dated before undated) →
urgency → oldest created (waiting longest) → id. Two equivalent Actions can
never swap places between frames.

**Completed and archived.** A completed Action is never described as overdue;
its date stopped mattering when it was dealt with. Archived Actions leave Home
entirely, including when overdue — archiving is the user saying "stop showing
me this".

**Efficiency.** Home composes two local streams (actions, plus one query for
the soonest armed reminder per Action) and triages in memory. No card asks the
database a question of its own, and nothing here touches the network.

**Superseded:** `action_grouping.dart` and its five tests were removed. Triage
covers the same three bands and adds the explanation; keeping both would have
left two competing ranking rules in the codebase.

## What Day 10 established

**Reminders are local, and only ever what the user asked for.** Nothing is
scheduled automatically. Deadline-derived times are *offers*, and because a
date-only deadline names no hour, the suggested 9am is shown on the chip and
spelled out ("You will be reminded on Tuesday 18 August at 3:00 PM") before
the button is pressed. Maximum five per Action.

**Scheduling is deliberately non-exact.** `AndroidScheduleMode
.inexactAllowWhileIdle`, and neither `SCHEDULE_EXACT_ALARM` nor
`USE_EXACT_ALARM` is declared. A bill reminder does not need second-perfect
delivery, and those permissions are store-audited (and, for
SCHEDULE_EXACT_ALARM, user-revocable). **Delivery can therefore be shifted by
Android's battery and idle policy** — the alarm Android registered for a
near-term reminder carried `window=+5m`, and a week-out one `window=+1h`.

**Permission is asked for exactly once, at the moment of intent** — when the
user taps "Set reminder" for the first time, never at launch or onboarding.
A refusal is not an error: the reminder is kept and shown as "Saved, but
notifications are off". It is never described as working. When permission is
later granted, the reconciler schedules it on the next launch.

**Two systems, no shared transaction.** Drift holds intent; Android holds the
alarm. The order is persist → permission → arm, so every crash point leaves a
recoverable row rather than a lie. `ReminderState` names exactly where a
reminder is (`pendingSchedule`, `scheduled`, `needsPermission`,
`scheduleFailed`, `cancelPending`) and there is deliberately **no `delivered`
state** — Android never tells us a notification was seen, and a scheduled time
passing is not evidence.

**Identity.** `platform_notification_id` is `INTEGER PRIMARY KEY
AUTOINCREMENT` so it is stable, unique, and never recycled from a deleted
reminder onto a new one; the domain `id` is a separate UUID. Rescheduling
keeps both, so Android *replaces* an alarm rather than gaining a second.

**The reconciler** runs once after startup — not on a timer, no WorkManager.
It arms intent that never reached Android, restores alarms that vanished,
finishes cancellations the user made but Android never heard, cleans up
reminders whose Action is gone, and never re-arms a moment that has passed.

**Timezone.** A reminder is an absolute instant plus the IANA zone it was
chosen in (`Asia/Dhaka`, not `+06:00` — an offset cannot express when the
offset changes). Changing device timezone does **not** move an agreed
reminder, and editing an Action's deadline does not move its reminders either.

**Reboot resilience is the plugin's boot receiver**, verified: after a full
reboot and without opening the app, the alarm was registered again by
`ScheduledNotificationBootReceiver` (declared in our manifest, needing
`RECEIVE_BOOT_COMPLETED`). The app's reconciler is the second line of defence,
not the first.

**Privacy.** Notification title is the constant "Action reminder"; the body is
the Action title and nothing else; `visibility` is `private` so a secure lock
screen conceals it. The payload carries **only** the Action id, for routing.
No amount, deadline, reference, source text or uid — verified against the
delivered notification.

**Nothing about reminders reaches the cloud.** No Firestore collection, no
rules change, no Firebase Messaging, no push token. Database v3 is local only;
`actionSchemaVersion` stays 1.

## What Day 9 established

**Action Detail is the place work happens.** `/action/:id` is deep-linkable —
the path id is the durable local Action id — reads only SQLite, and never
waits on auth, the network or a model. An id that no longer resolves gets a
real not-found state instead of a silent bounce to Home.

**The chain has identities, not positions.** `action_steps` was rebuilt in a
non-destructive `TableMigration` (database v1 → v2): a stable `id` primary key
plus `isCompleted`, `completedAt`, `createdAt`, `updatedAt`. Legacy rows keep
their data, take a derived id (`actionId:orderIndex`, so re-running is
idempotent), start incomplete, and are dated from the Action they were
confirmed with. **The database version is not the payload version**:
`actionSchemaVersion` stays 1 because the deployed Firestore rules pin
`schemaVersion == 1`, and steps never leave the device.

**Next-best-action is a rule, not a score.** First outstanding step by order
(ties broken on id, so it is total); a chain supersedes the reviewed
suggestion rather than competing with it; a fully-checked chain *offers* to
finish the Action; a completed or archived Action proposes nothing. No model
call, no hidden weighting.

**Completing every step does not complete the Action.** The page asks. Equally,
reopening an Action clears its completion stamp but leaves step history alone
— neither direction rewrites the other's record.

**Steps are local-only, and the type system says so.** `ActionStepRepository`
is a separate interface from `ActionRepository` precisely because nothing
reachable through it may enqueue a cloud upsert. Mirrored metadata edits
(title, deadline, amount, urgency, recommended step, complete, reopen,
archive) still do. Both halves are tested, and verified on device.

**Ordering is dense integers, rewritten as a block.** Reorder tolerates gaps,
duplicate positions, unknown ids, ids from another Action, and partial lists
(anything omitted keeps its relative place behind what was named). Positions
are per Action, and a completion always travels with its own step.

**One defect worth remembering:** a row dragged in a `SliverReorderableList`
is lifted into an **Overlay**, outside the Scaffold's `Material` — and these
rows contain ink. Without an explicit `proxyDecorator` the drag *throws*
instead of moving anything, and no amount of menu-based reorder testing
reveals it. `ReorderableListView` hides this with a default decorator;
`SliverReorderableList` does not.

## What Day 8 established

**The Drift store is canonical.** `actions.sqlite` in app-private storage,
`schemaVersion = 1`, tables `actions` / `action_steps` / `action_facts` /
`sync_outbox`, with an explicit `MigrationStrategy` — no destructive recreate,
ever. Three representation decisions are load-bearing:

- **Instants** (`createdAt`, `updatedAt`, `completedAt`, `archivedAt`) are
  epoch-microsecond UTC integers.
- **Deadlines** are zone-free wall-clock ISO text. A bill due "30 August" is
  due on the 30th in any timezone; storing it as an instant would move it.
  `ActionDue.isDateOnly` is derived from midnight, not stored separately.
- **Money** is minor units + an ISO-4217 code. Never a float.

**Creation is atomic and idempotent.** The Action id is minted when the draft
is produced, before any persistence, so a retry reuses it. `create` inserts
with `insertOrIgnore` and reports whether the row was new, and the outbox row
is written in the *same transaction* as the Action. Double-tapping confirm
yields exactly one Action, verified on device.

**Identity is anonymous, and that is a real limitation.** Sign-in is
`signInAnonymously`, obtained lazily and never blocking startup or Action
creation. The uid lives only on that device and in that install: **clearing app
data or reinstalling loses the identity, and with it the ability to reach the
previously mirrored documents.** There is no account, no recovery, and no
device-to-device continuity. Anything that promises the user their data follows
them needs real auth first.

**The mirror is one-way and minimal.** `users/{uid}/actions/{actionId}`, where
the document id *is* the local Action id, written with `set()` so a retry
updates rather than duplicates. The payload is exactly sixteen fields:
`schemaVersion, id, title, status, urgency, category, due, dueIsDateOnly,
amountMinorUnits, currency, recommendedNextStep, origin, createdAt, updatedAt,
completedAt, archivedAt`. Deliberately absent: `sourceId`, `summary`,
`whyThisMatters`, steps, facts, evidence quotes, OCR text, provider output,
image paths, App Check tokens, diagnostics. **Nothing is read back — there is
no two-way sync**, so the cloud can never overwrite local truth.

**The deployed rules enforce that contract server-side**, not just by client
convention: owner-only (`request.auth.uid == uid`), a `hasOnly` field
allowlist, closed enums, `schemaVersion == 1`, `d.id == actionId`, no client
delete, and a deny-everything catch-all. A payload carrying OCR text or an
evidence quote is *rejected by the server*. `firestore.rules` in the repo is
the source of truth; deploy with
`firebase deploy --only firestore:rules --project action-app-7084b`.

**Offline and failure behaviour.** Actions are created, listed, completed and
survive process death with no network at all. Failures are classified and
retried by a bounded single-pass outbox flush — one row per Action, backoff
`min(2^attempts, 60)` minutes, triggered post-frame on Home and after
confirm/complete. No timers, no background service, no full sync engine: a
restart with an empty outbox performs no writes at all. A new local change
resets that Action's backoff so a fresh edit is not stuck behind an old one.

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
