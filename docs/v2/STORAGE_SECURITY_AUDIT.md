# Storage security audit

What Action actually writes to disk, where, and what protects it. Written by
reading the code rather than the marketing, so the Security Centre can be held
to it.

The rule this document exists to enforce: **the app may not claim protection it
does not have.** Everything below was checked against the class that performs
the write.

---

## What is stored, and where

| What | Written by | Location | Encrypted by Action? |
|---|---|---|---|
| Actions, steps, facts, reminders | `ActionsDatabase` (Drift/SQLite) | app-private database | **No** |
| Capture metadata | `JsonFileSourceStore` | app-private documents dir | **No** |
| Capture image bytes | `DirectorySourceFileStore` | app-private documents dir | **No** |
| Preferences (theme, onboarding, protections, AI provider *kind*) | `SharedPreferencesStore` | app-private shared prefs | **No** |
| Activity journal (receipts) | `JsonFileActivityJournal` | app-private support dir | **No** |
| **AI provider API key** | `PlatformSecretStore` → `flutter_secure_storage` | Android Keystore–backed | **Yes** |
| Cloud mirror of confirmed Actions | `ActionCloudMirror` → Firestore | Google's servers | In transit and at rest by Firestore |

## What actually protects the unencrypted items

Android app-private storage. Two real properties:

1. **Other apps cannot read it.** Enforced by the per-app UID sandbox, not by
   anything Action does.
2. **Android's own file-based encryption applies.** On any device shipping with
   Android 10 or later this is mandatory and on by default. Credential-encrypted
   storage — where app data lives — is inaccessible until the user has unlocked
   the device once after boot.

## What that does *not* cover, stated plainly

- **A device that is unlocked and in someone else's hands.** File-based
  encryption is already unlocked at that point. This is the gap **App Lock**
  exists to narrow, and the only one of these that Action can do anything about.
- **A rooted or modified system.** Root reads app-private storage directly.
- **A device with no screen lock.** Android still encrypts, but with a default
  key. There is nothing to derive a secret from.
- **A device the user has deliberately unlocked for someone.** No storage
  measure addresses trust given away.

Android's own backup is *not* in this list: it was a real route out of the
device and is now switched off. See "Closed by this audit".

## Why Action does not add its own encryption layer

Considered and rejected for this release, deliberately.

**SQLCipher via Drift.** Works, and is the obvious candidate. Rejected for now
on three grounds, in order of weight:

1. **The key has to live somewhere.** A passphrase held in the Keystore and read
   at launch is unlocked exactly when app-private storage is already unlocked —
   the same threat model, one more moving part. It only becomes meaningfully
   stronger when the key is derived from a user credential, which means Action
   would hold data it cannot open without the user present. That is a real
   feature and a much larger one than a library swap.
2. **Migration is destructive if it goes wrong.** Encrypting an existing
   database means rewriting every row of every user's data. A failure halfway
   is data loss, and there is no cloud backup to restore from — the privacy
   screen says so, correctly.
3. **It would invite the claim.** "Encrypted database" on a settings screen
   reads to a user as "safe if someone takes my phone", which would remain
   untrue for the unlocked-device case that actually happens.

**The honest summary**, and what the Security Centre says: your data sits in
this app's private storage, which other apps cannot read and which Android
encrypts as part of the device's encryption; Action does not add a second layer
of its own; none of it defends against someone using your unlocked device.

## The one thing that *is* separately protected

The AI provider key. It is the only stored value where a single compromise is
directly and immediately costly to the user — it spends their money and reads
whatever they have sent — so it lives in the Keystore rather than with
everything else, is never shown again after saving, and is deleted whenever the
provider is disconnected.

The Security Centre states this limit too: secure storage is a real obstacle to
someone with an unlocked device, but it is not absolute, and the app does not
claim otherwise.

## Known gaps, not yet closed

| Gap | Why it is open |
|---|---|
| Activity journal is not encrypted | It is content-free by construction, which is the stronger mitigation, but it is still a timeline. |
| No key rotation for the provider secret | Rotation is the provider's job and the user's; Action stores whatever it is given. |

### Closed by this audit

**Auto Backup was on.** Android defaults `android:allowBackup` to `true`, so the
database, the capture files and the preferences were eligible to be copied to
the user's Google account — while the privacy screen told them, in as many
words, that there is no way to restore Action to a new device and that losing
this installation loses the anonymous ID with it.

That is not a documentation problem. It is a statement the app makes to the
user that the manifest made false, and the failure mode is someone being
surprised by their old data reappearing on a new phone.

Now off: `allowBackup="false"` and `fullBackupContent="false"` cover cloud
backup on every version, and `data_extraction_rules.xml` covers the Android 12+
device-to-device transfer path that those flags do not. If a real backup
feature is ever built, it belongs there as an explicit, disclosed choice.

## How to re-run this audit

Grep for the write, not for the intent:

```
rg "writeAsString|writeAsBytes|setString|setBool|FlutterSecureStorage|\.set\(" lib/
```

Every hit should appear in the table at the top of this document. If one does
not, either the table is stale or something is storing data nobody decided to
store.
