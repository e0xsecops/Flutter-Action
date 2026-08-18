# Resume checkpoint

Updated at the end of Day 10. Read this first when picking the project back up.

## Where things stand

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
- **Do not repeat Days 1–10.**

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
