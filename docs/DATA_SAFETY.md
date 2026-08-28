# Data safety inventory

What Action actually does with data, derived from the code rather than from
intent. This is the evidence a Play Data Safety form or an App Store privacy
declaration should be filled in from — **it is not the form itself, and
nothing here has been submitted anywhere.**

Each row names where the behaviour lives so a reviewer can check it rather
than take this document's word.

Written at the Day-19 release candidate. Re-derive it if any of the linked
code changes.

---

## 1. Collected and sent off the device

### 1.1 Capture content, sent to the AI service — only on request

| | |
| --- | --- |
| **What** | The text of one capture, or the image itself when text is escalated to multimodal reading |
| **When** | Only when the user asks for a specific capture to be interpreted |
| **Where to** | Firebase AI Logic (Gemini Developer API) |
| **Purpose** | Producing a draft Action for the user to review |
| **Persisted by us?** | No. The response is turned into a draft and discarded |
| **Code** | `lib/features/extraction/data/firebase_ai_transport.dart` |

This is the one place a user's document content leaves the device, and it is
user-initiated every time. The privacy screen states it plainly: *"This is not
on-device AI."* Data handling by the provider is Google's, not ours to
characterise here.

### 1.2 Confirmed Action metadata, mirrored to Firestore

| | |
| --- | --- |
| **What** | Exactly: `schemaVersion, id, title, status, urgency, category, due, dueIsDateOnly, amountMinorUnits, currency, recommendedNextStep, origin, createdAt, updatedAt, completedAt, archivedAt` |
| **When** | After the user confirms an Action |
| **Where to** | `users/{uid}/actions/{actionId}` under an anonymous Firebase Auth uid |
| **Purpose** | A minimal record tied to the installation. **Not a backup** — there is no restore path |
| **Code** | `cloudPayloadFor` in `lib/features/actions/data/action_cloud_mirror.dart`; enforced server-side in `firestore.rules` |

The field list is enforced in two places: the client builds it and the
deployed rules reject a document with any other key. **Not sent:** captures,
OCR text, evidence quotes, an Action's steps, its facts, or any reminder.

### 1.3 Anonymous authentication

| | |
| --- | --- |
| **What** | A Firebase anonymous uid |
| **When** | First time the mirror or a privacy deletion needs to prove ownership |
| **Purpose** | Scoping the user's own documents so nobody else can read or delete them |
| **Identity** | Device-install-local. No email, no phone, no name, no social sign-in. Losing the install loses the uid |
| **Code** | `lib/features/actions/data/auth_identity_service.dart` |

### 1.4 Product analytics

| | |
| --- | --- |
| **What** | Event names from a closed catalogue, plus parameters allowlisted by key and pinned to closed value sets |
| **Purpose** | Whether the app works: does capture start, does extraction succeed, does search find anything, do Actions get completed |
| **Never includes** | Title, summary, amount, currency, deadline, organisation, reference, OCR text, evidence, model output, **search queries**, Action ids, Source ids, the uid, or file paths |
| **Advertising id** | **Not collected.** The `AD_ID` and AdServices permissions are removed in the manifest and `google_analytics_adid_collection_enabled` is `false` |
| **Code** | `lib/core/analytics/app_analytics.dart`; contract tested in `test/analytics/analytics_privacy_test.dart` |

Firebase Analytics also collects its own automatic events (`first_open`,
`session_start`, `screen_view`) and `ga_*` parameters. Those are the SDK's,
not this app's catalogue. `ga_screen_class` is always `MainActivity` in a
Flutter app, so no route or content is revealed by them.

### 1.5 Crash diagnostics

| | |
| --- | --- |
| **What** | Exception type, message and stack trace; device and OS metadata the SDK gathers |
| **Purpose** | Fixing crashes |
| **Identifiers** | No `setUserIdentifier`, no `setCustomKey`, no breadcrumb logging anywhere in the app |
| **Code** | `lib/main.dart` |

Every error this app raises itself carries a machine word — `permission_denied`,
`auth_unavailable`, a typed failure kind — never the document, title or query
that produced it. Third-party exception messages are not under this
codebase's control, which is stated rather than glossed.

---

## 2. Stored on the device only

None of the following is uploaded anywhere.

| Data | Where |
| --- | --- |
| Captured images | App-private storage, `DirectorySourceFileStore` |
| Pasted text and OCR output | `sources.json`, app-private |
| Actions, steps, facts | SQLite via Drift (`actions.sqlite`), app-private |
| Reminders and their platform alarm ids | Same database |
| The sync outbox | Same database |
| Search queries | **Nowhere.** Held in memory for the duration of a keystroke and never persisted, indexed or logged |
| Preferences (onboarding flag, theme) | `SharedPreferences` |

---

## 3. Deletion

"Delete all my data" removes: every Action, step, fact and reminder; the sync
outbox; every capture and its image file; the preferences a user would call
theirs; and every mirror document under the current anonymous uid —
**including documents this device no longer knows about**, found by an
enumeration that runs only inside this flow (`CloudPrivacyInventory`).

If the cloud cannot be reached the flow says so rather than claiming success,
keeps a retry record, and finishes on a later launch. Verified on device
across all three paths at Day 17.

`lib/features/settings/application/privacy_deletion_service.dart`

---

## 4. Statements that must NOT be made

Accurate to the code, and each one is a claim this product cannot support:

- ❌ "100% private" / "everything stays on your device" — capture content is
  sent to an AI service when the user asks for it, and confirmed Action
  metadata is mirrored.
- ❌ "AI never stores your data" — provider retention is Google's to describe.
- ❌ "Guaranteed reminders" — reminders are inexact by design
  (`inexactAllowWhileIdle`), so Android may shift delivery.
- ❌ "Cross-device backup" / "sync" — the mirror is one-way with no restore
  path, and the anonymous id dies with the install.

What can be said: the inbox, search, steps and reminders work without a
network; search never leaves the device; and deletion can prove what it did.

---

## 5. Third-party SDKs in the shipped app

| SDK | Why | Data implication |
| --- | --- | --- |
| Firebase Core / Auth | Anonymous identity for the mirror | uid only |
| Cloud Firestore | The Action mirror | §1.2 |
| Firebase AI Logic | Reading a capture on request | §1.1 |
| Firebase App Check | Attesting the client to the backend | Play Integrity token (release) |
| Firebase Analytics | §1.4 | Content-free events; advertising id disabled |
| Firebase Crashlytics | §1.5 | Crash reports |
| ML Kit text recognition | On-device OCR | **Nothing leaves the device** |
| `flutter_local_notifications` | Reminders | Local only |
| `image_picker` | Camera and gallery | Uses system intents; no `CAMERA` permission needed or declared |
| Drift / SQLite | Local store | Local only |
