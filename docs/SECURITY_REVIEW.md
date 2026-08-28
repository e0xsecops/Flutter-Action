# Security review — release candidate

Checked at Day 19 against the built release APK and the tracked source, not
against intent. Each item names how it was verified so it can be re-run.

---

## Permissions

Dumped from the signed release APK with `aapt dump permissions`:

| Permission | Why it is there |
| --- | --- |
| `INTERNET` | Firebase, and the AI call the user asks for |
| `RECEIVE_BOOT_COMPLETED` | Android drops alarms across a reboot; without this every pending reminder is silently lost |
| `POST_NOTIFICATIONS` | Reminders. Requested when the first reminder is created, never at launch |
| `ACCESS_NETWORK_STATE` | Firebase SDK |
| `WAKE_LOCK`, `VIBRATE` | Notification delivery |
| `READ_GSERVICES` | Play services |
| `BIND_GET_INSTALL_REFERRER_SERVICE` | Firebase Analytics |
| `…DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` | The app's own signature permission, guarding dynamically registered receivers |

**Absent, and deliberately:** `SCHEDULE_EXACT_ALARM`, `USE_EXACT_ALARM`,
`CAMERA`, storage/media, location, contacts, SMS, microphone. Photo capture
goes through system intents, which need no `CAMERA` permission.

**Removed at Day 19:** `com.google.android.gms.permission.AD_ID`,
`ACCESS_ADSERVICES_ATTRIBUTION`, `ACCESS_ADSERVICES_AD_ID`. Firebase Analytics
adds these by default for attribution and ad audiences; Action does neither,
and leaving them would have obliged a Data Safety declaration that the app
collects an advertising identifier — which is not true.
`google_analytics_adid_collection_enabled` is `false` so the binary and the
declaration agree. Verified after the change that analytics still functions.

## Exported components

From the release APK's merged manifest:

| Component | Assessment |
| --- | --- |
| `com.solvex.actionapp.MainActivity` | Required — it is the launcher activity |
| `com.google.firebase.auth.internal.GenericIdpActivity` | From `firebase_auth`. Handles federated redirects; guarded by an intent filter scoped to this app's own scheme |
| `com.google.firebase.auth.internal.RecaptchaActivity` | From `firebase_auth`. Firebase can use reCAPTCHA for anti-abuse, including on anonymous sign-in |
| `com.google.android.gms.auth.api.signin.RevocationBoundService` | From `play-services-auth`, transitively |
| `androidx.profileinstaller.ProfileInstallReceiver` | Permission-protected (`DUMP`), reachable only from shell |

The three auth components are unused by this app, which only ever signs in
anonymously. They were **left in place deliberately**: they are intrinsic to
`firebase_auth`, Firebase may route anonymous sign-in through reCAPTCHA under
anti-abuse enforcement, and stripping them during a release freeze would risk
breaking authentication for a hardening gain that is theoretical. Recorded
here so the decision is visible rather than accidental.

The app declares no exported components of its own beyond `MainActivity`.
Both notification receivers are `android:exported="false"`.

## Network

- No `usesCleartextTraffic`, no `networkSecurityConfig` override. On
  `targetSdk >= 28` cleartext is off by default.
- No custom `TrustManager`, no `badCertificateCallback`, no certificate
  pinning bypass anywhere in `lib/`, `android/` or `ios/`.

## Secrets

`git grep` over tracked files for private keys, service accounts, keystore
passwords and API keys:

- No private keys, no `.jks`/`.keystore`/`.p12`/`.pem`, no service account.
- `android/key.properties` is **not tracked**; the Gradle config reads it if
  present and falls back to an unsigned build rather than to the debug key,
  so an unsigned artifact is obvious instead of looking releasable.
- The Firebase API key in `google-services.json` and `firebase_options.dart`
  is a **client** key. It is designed to be embedded in the app and is not a
  server secret; access is controlled by Firestore rules and App Check, both
  of which are in force.
- The App Check debug token is not, and has never been, in the repository. It
  is registered by hand in the Firebase console.

## Firestore

`firestore.rules`, unchanged since Day 14:

- The only reachable path is `users/{uid}/actions/{actionId}`.
- Read, create, update and delete all require `request.auth.uid == uid`.
- Create and update additionally validate the exact Day-8 payload — unknown
  keys rejected, `schemaVersion == 1`, closed enums, embedded id must match
  the document id.
- A catch-all `match /{document=**}` denies everything else.

Day 17's privacy inventory needed **no rules change**: `allow read` already
covers listing, and `isOwner(uid)` depends only on the path and the caller's
auth rather than on document contents, which is what makes an owner-scoped
collection query decidable by the rules engine.

## App Check

Debug builds use `AndroidDebugProvider`; release uses
`AndroidPlayIntegrityProvider`. Activation happens inside the Firebase
bring-up and **before** the gate opens, so the AI transport — which waits on
that gate — can never run against an unattested client. Failure is recorded
and swallowed: a device that cannot attest loses the AI service, not its own
inbox.

## Data boundaries

Enforced in code and covered by tests:

- Search queries never leave the process and are never persisted or logged.
- An Action's steps, facts and reminders are local-only; the mirror payload
  cannot carry them and the rules would reject a document that did.
- Captures and OCR text are never uploaded.
- Analytics carries no content — closed event catalogue, parameters
  allowlisted by key and pinned by value
  (`test/analytics/analytics_privacy_test.dart`).
- Crashlytics has no user identifier, no custom keys and no breadcrumbs.

## Known and accepted

- Anonymous identity is device-install-local. A reinstall produces a new uid,
  so mirror documents from a previous install are owned by an identity this
  device can no longer present — unreachable even by the privacy inventory.
- Crash *stack traces* are whatever propagated. The app's own errors carry
  machine words by construction; a third-party library's message is not
  under this codebase's control.
- Firebase Analytics' automatic events (`first_open`, `session_start`,
  `screen_view`) come from the SDK, not this app's catalogue.
- iOS App Check is **not** configured — see `docs/RELEASE_IOS_CHECKLIST.md`.
