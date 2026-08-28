# Firebase setup

The console steps this repository cannot perform for itself. A fresh clone
builds and every test passes without any of this — the tests use fakes — but
the AI extraction path and the cloud mirror need a configured Firebase
project.

**No secret in this document, and none in the repository.** The values that
are checked in (`google-services.json`, `lib/firebase_options.dart`) are
client configuration, designed to be embedded in an app and protected by
Firestore rules plus App Check rather than by being hidden.

---

## Android (configured)

The Android app is set up in the existing Firebase project. What it uses:

| Service | Purpose |
| --- | --- |
| Authentication | **Anonymous** sign-in only. No other provider is enabled or wanted |
| Cloud Firestore | The minimal one-way Action mirror |
| Firebase AI Logic | Reading a capture, on request |
| App Check | Attesting the client before the AI call |
| Analytics | Content-free product events |
| Crashlytics | Crash reports |

### Firestore rules

Deploy `firestore.rules` from the repository root — the console's default
rules are wrong for this app and will either block it or open it too far.

```bash
firebase deploy --only firestore:rules
```

Or paste the file in Console → Firestore → Rules. The posture: the only
reachable path is `users/{uid}/actions/{actionId}`, every operation requires
`request.auth.uid == uid`, creates and updates validate the exact payload
shape, and a catch-all denies the rest.

### App Check — debug builds

A debug build prints a debug token to logcat on first run:

```
D/com.google.firebase.appcheck: Enter this debug secret into the allow list…
```

**That token is a secret.** Whoever holds a registered token gets a real
attestation, which is exactly why it is never written into source, a
document, a commit message or a log this project keeps.

1. Run a debug build and read the token from logcat
2. Console → App Check → Apps → the Android app → Manage debug tokens
3. Add it with a name identifying the machine or emulator
4. Never commit it, never paste it into an issue

Each emulator and each developer machine needs its own.

### App Check — release builds

Release uses **Play Integrity**, which needs no manual token but does need
the Play Integrity API enabled for this app in the Google Cloud console.
Without it App Check fails for real users and the AI path stops working —
this is the single most likely production surprise, because the emulator can
never satisfy Play Integrity and so the release path is unexercised until a
Play build reaches a real device.

### If App Check is unregistered

The app degrades rather than breaking: activation failure is recorded and
swallowed, and the AI call fails with a typed transport error the review
screen already knows how to show. Everything local keeps working. A device
that cannot attest loses the AI service, not its own inbox.

---

## iOS (not configured)

There is **no iOS app in the Firebase project.** See
`docs/RELEASE_IOS_CHECKLIST.md` §4–5 for the full sequence. In short:

1. Add an iOS app with bundle id `com.solvex.actionapp`
2. Download `GoogleService-Info.plist` into `ios/Runner/` and add it to the
   Runner target in Xcode
3. Re-run `flutterfire configure` — `lib/firebase_options.dart` currently has
   Android values only
4. Enable Anonymous sign-in for the iOS app
5. Wire an Apple App Check provider (App Attest or DeviceCheck).
   `_activateAppCheck()` in `lib/main.dart` passes `providerAndroid` only

Firestore rules are shared and need no change.

---

## What is deliberately not used

Naming these because their absence is a decision, not an oversight:

- **Firebase Cloud Messaging.** Reminders are local alarms. There is no push
  in this app and adding it would introduce a server that can reach into the
  user's device
- **Cloud Functions.** The AI call goes direct from the client, attested by
  App Check
- **Remote Config for anything but prompts**
- **BigQuery export, audiences, advertising.** The `AD_ID` permission is
  explicitly removed from the manifest and ad-id collection is disabled
- **Firebase Storage.** Captures never leave the device
