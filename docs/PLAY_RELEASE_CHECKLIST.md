# Google Play release checklist

Everything here is **prepared, not submitted**. No Play Console account has
been touched, no listing created, no declaration accepted, no build uploaded.
Each item below needs a human to review and act on.

Fill privacy answers from `docs/DATA_SAFETY.md`, which is derived from the
code. Do not answer them from memory or from what the app "feels like".

---

## Artifacts

| | |
| --- | --- |
| Upload artifact | `build/app/outputs/bundle/release/app-release.aab` (**81.9 MB**) |
| Sideload/QA artifact | `build/app/outputs/flutter-apk/app-release.apk` (98.7 MB universal) |
| Per-ABI APKs | 31–39 MB — what a device actually installs |
| Package | `com.solvex.actionapp` |
| Version | `1.0.0` (versionCode `1`) |
| Signing | Existing release keystore via untracked `android/key.properties` |

⚠️ **versionCode 1 assumes nothing has ever been uploaded.** If the Play
Console shows an existing release, bump `version:` in `pubspec.yaml` before
uploading — Play rejects a duplicate versionCode and there is no way to check
that from this machine.

## Listing (drafts in `docs/RELEASE_NOTES.md`)

- [ ] App name: **Action**
- [ ] Short description — draft written, needs review
- [ ] Full description — draft written, needs review
- [ ] Category: **Productivity** (recommendation, not a decision)
- [ ] Tags: productivity, organisation, documents, reminders
- [ ] Contact email — **not known to this repository.** Must be supplied
- [ ] Website — optional, must be real if given

## Privacy policy

- [ ] **Required for publication and no URL exists.** A policy must be
      written and hosted before submission. `docs/DATA_SAFETY.md` is the
      factual basis for its content — it is not itself a privacy policy and
      is not hosted anywhere
- [ ] The policy must cover: capture content sent to an AI service on
      request, the minimal Firestore mirror under an anonymous id, anonymous
      auth, content-free analytics, crash reporting, and the deletion path

## Data safety form

Answer from `docs/DATA_SAFETY.md`. The load-bearing answers:

- [ ] **Advertising ID: NO.** The permission is removed and collection is
      disabled — verified in the built APK
- [ ] Files & docs / Photos: collected (capture content sent to the AI
      service when the user asks) — **and it is not stored by us**
- [ ] App activity / diagnostics: collected, content-free
- [ ] Crash logs: collected
- [ ] Personal info (name, email, address, phone): **none**
- [ ] Location, contacts, calendar, SMS, health, financial account: **none**
- [ ] Data encrypted in transit: yes (HTTPS only, no cleartext)
- [ ] Users can request deletion: **yes** — Settings → Privacy & data →
      Delete all my data
- [ ] Account deletion URL: **not applicable**, there is no account. In-app
      deletion is the mechanism

## Content rating

- [ ] Questionnaire: no violence, no sexual content, no profanity, no
      gambling, no drugs, no user-generated content sharing, no social
      features. Expected outcome: **Everyone / PEGI 3**
- [ ] Does the app share user-generated content? **No** — there is no sharing
      surface

## Declarations

- [ ] Contains ads: **No**
- [ ] In-app purchases: **No**
- [ ] Target audience: adults / general. **Not** designed for children, so
      Families policy does not apply
- [ ] App access: no login required — every feature is reachable on a fresh
      install, so no reviewer credentials are needed. Say this explicitly
- [ ] Government app: No
- [ ] Financial features: No. The app *reads* bills; it does not process
      payments, hold funds, or provide financial advice
- [ ] Health: No
- [ ] Data deletion: in-app, described above

## Technical

- [ ] targetSdk meets Play's current requirement (inherited from the Flutter
      SDK — verify at upload time, Play's floor moves)
- [ ] minSdk 24
- [ ] 64-bit: yes, arm64-v8a and x86_64 both present
- [ ] App Bundle: yes
- [ ] Permissions: nine, none sensitive. No exact-alarm, camera, storage,
      location, contacts or SMS declaration to justify
- [ ] Play Integrity: App Check uses it in release. Confirm the Play
      Integrity API is enabled for this app in the Google Cloud console, or
      App Check will fail for real users

## Pre-launch

- [ ] Internal testing track first, never straight to production
- [ ] Read the pre-launch report — Play tests on physical devices this
      project has not
- [ ] Verify the AI extraction path works from a Play-installed build. This
      is the highest-risk item: App Check switches from the debug provider to
      Play Integrity, and that path has never been exercised
- [ ] Verify reminders on a real device with battery optimisation active

## Store graphics

See `docs/STORE_ASSETS.md`. **None have been produced** — that document is a
specification and a shot list, not artwork.

---

## Do not do without explicit approval

- Publish or submit to any track
- Accept Play's developer agreements or content policies
- Change pricing or distribution
- Answer Data Safety or content rating in the console
- Upload the AAB to a production track
