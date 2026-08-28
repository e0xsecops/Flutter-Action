# iOS release checklist

**Status: not built, not run, not tested.** Everything below is a checklist to
work through on a Mac, not a record of anything that has happened. iOS has
never been compiled in this project — development has been on Windows
throughout, so there is no Xcode archive, no simulator run, and no device
test to report.

What *has* been done from Windows is the configuration audit in §1. Treat the
rest as unverified.

---

## 1. Already fixed from Windows (Day 19)

| Item | Was | Now |
| --- | --- | --- |
| Bundle identifier | `com.example.actionApp` (Flutter template default — App Store Connect rejects it) | `com.solvex.actionapp`, matching Android |
| Test target id | `com.example.actionApp.RunnerTests` | `com.solvex.actionapp.RunnerTests` |
| Display name | `Action App` | `Action`, matching Android's `android:label` |
| App icon | Flutter's template icon | Generated from `assets/icon/icon.png`, alpha removed as the App Store requires |

## 2. Environment

- [ ] macOS with Xcode installed and its licence accepted
- [ ] Flutter version matching this project's `pubspec.lock` (verify with
      `flutter --version`; a mismatched version will churn the lockfile)
- [ ] CocoaPods installed (`sudo gem install cocoapods`)
- [ ] `flutter pub get`, then `cd ios && pod install`
- [ ] Open **`ios/Runner.xcworkspace`** — never `Runner.xcodeproj`, or the
      pods will not be linked

## 3. Signing

- [ ] Apple Developer Program membership active
- [ ] In Xcode → Runner → Signing & Capabilities, select the team
- [ ] Confirm the bundle id reads `com.solvex.actionapp`
- [ ] Register the App ID in the developer portal
- [ ] Automatic signing, or provisioning profiles if the team requires manual
- [ ] Never commit `.mobileprovision`, `.p12` or certificates to this repo

## 4. Firebase for iOS

The project has an Android Firebase app configured; **there is no iOS app
registered**, so this is real setup work, not verification.

- [ ] Add an iOS app to the same Firebase project, bundle id
      `com.solvex.actionapp`
- [ ] Download `GoogleService-Info.plist` into `ios/Runner/` and add it to the
      Runner target **in Xcode** (dragging it into Finder is not enough)
- [ ] Re-run `flutterfire configure` so `lib/firebase_options.dart` gains its
      iOS block — the current file has Android values only
- [ ] Enable Anonymous sign-in for the iOS app (already on for Android)
- [ ] Firestore rules are shared and already correct — no change

## 5. App Check on iOS

Android uses the debug provider in debug and Play Integrity in release. iOS
needs its own equivalent and it is **not wired**:

- [ ] Choose the Apple provider — App Attest (iOS 14+) or DeviceCheck
- [ ] Add the corresponding activation to `_activateAppCheck()` in
      `lib/main.dart`, which currently passes `providerAndroid` only
- [ ] Register a debug token for the simulator, exactly as Android does, and
      **never commit it**
- [ ] Verify the AI extraction path still works with attestation enforced

## 6. Capabilities and Info.plist

- [ ] **Push Notifications capability is not needed.** Reminders are local
      (`flutter_local_notifications`); there is no FCM in this app and none
      should be added
- [ ] Background Modes: not required
- [ ] `NSCameraUsageDescription` — required, the app takes photos of documents
- [ ] `NSPhotoLibraryUsageDescription` — required, the app reads screenshots
- [ ] Confirm both strings say what Action actually does with the image
      (reads it to draft an Action), not boilerplate
- [ ] No location, microphone, contacts or calendar usage strings — the app
      uses none of those, and an unused string invites a rejection

## 7. Behaviour to verify on a real device

Everything below is verified on Android and entirely unverified on iOS.

- [ ] Cold start reaches the inbox without waiting on Firebase (the Day-16/17
      startup architecture is platform-neutral Dart, but unproven here)
- [ ] Local notification permission prompt appears only when the first
      reminder is created, never at launch
- [ ] A reminder fires while backgrounded, and tapping it opens that Action
- [ ] Reminders survive a device restart
- [ ] Camera and gallery capture, and OCR via ML Kit
- [ ] AI extraction end to end, with App Check active
- [ ] Full offline use: inbox, search, Action detail, reminders
- [ ] Privacy deletion, including the cloud inventory
- [ ] Glass surfaces render correctly — iOS composites `BackdropFilter`
      differently from Android and this is the most likely visual surprise
- [ ] Dark mode, Dynamic Type at large sizes, VoiceOver
- [ ] Safe areas on a notched device: the floating Add bar and Search controls
      are the two to check

## 8. Archive and TestFlight

- [ ] `flutter build ipa --release`
- [ ] Open `build/ios/archive/Runner.xcarchive` in Xcode Organizer
- [ ] Validate, then distribute to App Store Connect
- [ ] Complete **App Privacy** from `docs/DATA_SAFETY.md` — do not answer it
      from memory
- [ ] Export compliance: the app uses HTTPS only and no custom cryptography
- [ ] TestFlight internal testing before any public release

## 9. Do not claim

Until §7 has actually been done on hardware, this app is **not** iOS-ready,
and no store listing, release note or README may say that it is.
