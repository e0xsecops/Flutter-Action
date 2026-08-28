# Action

Turns messy real-world information — a bill, a letter, a screenshot — into a
clear next step you have checked yourself.

Add a photo, a screenshot or some pasted text. Action reads it, drafts what it
thinks you need to do, and shows you where each detail came from. **Nothing
becomes an Action until you confirm it.**

Android, Flutter. Version `1.0.0+1`, release-candidate state — **not
published to any store.**

---

## The two rules everything else follows from

**Trust first.** The model drafts; a person decides. `highConfidence` is the
ceiling a machine can reach — only a human produces `confirmed`, and that is
enforced in the validator rather than merely documented. Nothing is invented:
no deadline, amount, reference or consequence that is not in the source, and
every extracted fact can point at the words it came from.

**Local first.** The database on the device is the truth. The inbox, Action
steps, reminders and search all work with no network, no account and no
Firebase. The cloud holds a minimal one-way mirror of confirmed Actions and
is never read back into the app — losing it costs nothing, and a cloud
failure can never make local data unreachable.

## What it does

- **Capture** from camera, gallery or pasted text, with on-device OCR (ML Kit)
- **Extract** via Firebase AI Logic into a structured, schema-validated draft
- **Review** every field, with evidence, ambiguity states and manual entry
- **Triage** the inbox by real pressure — overdue, today, then upcoming — with
  a plain reason on every card and deliberately no score
- **Act** through the Action Chain: ordered, checkable, editable steps
- **Remind** with local notifications that survive a reboot
- **Find** with on-device search across Actions and captures. The query never
  leaves the process and is never stored
- **Delete** everything, including cloud records this device no longer knows
  about — and say honestly what it managed to remove

## Architecture

```
lib/
  core/          analytics contract, Firebase gate, preferences, Result
  design/        tokens, theme, glass surface, shared components
  features/
    capture/     picking, image normalisation (isolate), OCR, SourceStore
    extraction/  provider contract, schema, validation, escalation, review
    actions/     domain, Drift store, chain, reminders, triage, cloud mirror
    search/      local search service, normaliser, controller
    settings/    preferences, privacy data map, deletion
    onboarding/  first run
```

Key seams, each with a fake for tests: `ExtractionService`,
`NotificationScheduler`, `ActionCloudMirror`, `CloudPrivacyInventory`,
`AppAnalytics`, `SourceStore`.

- **Database:** Drift/SQLite, schema version **3**
- **Cloud payload:** `actionSchemaVersion` **1**, pinned by `firestore.rules`
- **Startup:** Firebase initialises *after* the first frame behind
  `FirebaseGate`; nothing local waits on it

## Running it

```bash
flutter pub get
flutter run -d <device>          # see docs/FIREBASE_SETUP.md first
flutter test                     # 798 tests
flutter analyze
```

Release builds need `android/key.properties` (untracked). Without it the
build produces an **unsigned** APK rather than falling back to the debug key,
so an unreleasable artifact is obvious instead of looking finished.

```bash
flutter build appbundle --release   # Play upload artifact
flutter build apk --release         # sideload / QA
```

## Documentation

| Document | What it is for |
| --- | --- |
| `docs/RESUME_CHECKPOINT.md` | **Read first.** Where the project stands, what each day established, every known limitation |
| `docs/EXTRACTION_CONTRACT.md` | The locked provider JSON, evidence strategy, validation and prompt-injection contract |
| `docs/DATA_SAFETY.md` | What happens to data, derived from code. Fill any privacy form from this |
| `docs/SECURITY_REVIEW.md` | Permissions, exported components, secrets, Firestore, App Check |
| `docs/PLAY_RELEASE_CHECKLIST.md` | Play submission steps — prepared, not done |
| `docs/RELEASE_IOS_CHECKLIST.md` | iOS. Honest that it has never been compiled |
| `docs/RELEASE_NOTES.md` | Draft listing copy, and the claims that must never be made |
| `docs/STORE_ASSETS.md` | Screenshot and graphic specification |
| `docs/FIREBASE_SETUP.md` | The manual console steps this repo cannot perform |

## Testing

798 tests, all offline. No test reaches Firebase, a real camera, a real
notification API or a network. The ones worth knowing about:

- `test/extraction/` — the trust boundary: prompt injection, fabricated
  claims, ambiguous dates, malformed JSON
- `test/analytics/analytics_privacy_test.dart` — proves content *cannot* be
  logged, rather than asserting that it is not
- `test/perf/` — scale guards set as catastrophe detectors, not benchmarks
- `test/settings/privacy_deletion_test.dart` — deletion honesty, including
  the orphaned-mirror case

## Status and limitations

Stated plainly, because the product's whole argument is that it does not
overclaim:

- **Android only.** iOS is configured but has never been built or run
- **No account.** Data belongs to this installation; there is no backup and
  no way to move it. Uninstalling loses it
- **Reminders are approximate** — no exact-alarm permission, so Android may
  shift delivery
- **Reading a new capture needs a connection.** Everything saved keeps working
  offline
- **OCR is tuned for Latin script**
- **Phone-first.** Tablets get a readable centred width, not a bespoke layout
- Full list in `docs/RESUME_CHECKPOINT.md`

## Privacy in one paragraph

Captures, OCR text, Action steps, facts, reminders and search queries never
leave the device. Confirmed Actions are mirrored as a minimal record under an
anonymous per-install id, one-way, and the Firestore rules reject any
document carrying more. Reading a capture sends that capture's content to an
AI service, which the app says on its privacy screen rather than burying.
Analytics is a closed catalogue of content-free counts — no title, amount,
deadline, query, or identifier of any kind.
