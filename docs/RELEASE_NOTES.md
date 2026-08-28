# Release notes

## 1.0.0 (1) — draft

**Draft. Not published anywhere.** Wording is for review before it goes near a
store listing.

Every claim below is one the app can actually support. See
`docs/DATA_SAFETY.md` for what must never be claimed.

---

### Store listing — short version (under 500 characters)

> Action turns letters, bills and screenshots into clear next steps.
>
> Add a photo, a screenshot or some text. Action reads it and drafts what it
> thinks you need to do — a deadline, an amount, the steps to take. You check
> it before anything is saved; nothing becomes an Action until you say so.
>
> Your inbox, your steps, your reminders and your search all work on the
> device, with or without a connection. You can delete everything, and Action
> will tell you exactly what it managed to delete.

### Store listing — full version

> **Turn information into action.**
>
> Bills, letters, renewal notices, forms. Action takes a photo, a screenshot
> or some pasted text and works out what is being asked of you: what it is,
> when it is due, how much, and the steps to get it done.
>
> **You review before it becomes an Action.** Action drafts; you confirm.
> Nothing is saved until you have seen it, and you can correct anything or
> enter it yourself. Where a detail came from a document, Action can show you
> the exact words it read it from.
>
> **See what needs attention.** Your inbox is ordered by what is actually
> pressing — overdue first, then today, then what is coming. Every card can
> tell you why it is where it is. There is no score and no black box.
>
> **Work the next clear step.** An Action can hold the steps it takes to
> finish. Tick them off, reorder them, add your own.
>
> **Set reminders that stay on your device.** No account, no server, no push
> notifications from us.
>
> **Find things privately.** Search covers your Actions and everything Action
> has read from your captures. It runs entirely on the device, and what you
> type is never stored, indexed or sent anywhere.
>
> **Delete everything, and know it happened.** One control removes your
> Actions, steps, reminders, captures and the short cloud record of each
> confirmed Action. If anything cannot be reached, Action says so instead of
> claiming it is done, and finishes the job later.
>
> Reading a capture uses an AI service, so that capture's content is sent when
> you ask for it — Action says so on the privacy screen rather than burying
> it.

### What's in this release

- Capture from camera, gallery or pasted text, with on-device text
  recognition
- AI-drafted Actions with evidence you can inspect, and a confirmation step
  that cannot be skipped
- An inbox ranked by real pressure, with a plain-language reason on every card
- Action steps: ordered, checkable, editable, reorderable
- Local reminders that survive a reboot
- On-device search across Actions and captures, with filters
- Light and dark, large text, screen reader support, reduced motion
- Settings, an honest privacy data map, and a deletion that proves what it did

### Known limitations, stated rather than hidden

- **Android only.** iOS is not built or tested — see
  `docs/RELEASE_IOS_CHECKLIST.md`.
- **No account.** Your data belongs to this installation. There is no backup
  and no way to move it to another device; uninstalling loses it.
- **Reminders are approximate.** Action does not request exact-alarm
  permission, so Android may deliver a reminder a few minutes late depending
  on battery state.
- **Reading a capture needs a connection.** Everything already saved keeps
  working offline; interpreting something new does not.
- **Text recognition is tuned for Latin script.** Other scripts may not read
  well, and manual entry is always available.
- **Phone-first.** Tablets are supported — content stays at a readable width
  rather than stretching — but there is no dedicated tablet layout.

---

## Internal changelog

Not for the store.

| Day | Commit | What |
| --- | --- | --- |
| 16 | `338503e` | Startup and local performance: Firebase off the pre-frame path, search hotspot removed, midnight staleness closed, release build fixed |
| 17 | `e7f0218` | Orphaned cloud mirror privacy gap closed; Firebase ContentProvider removed (~540 ms); liquid/mirror glass; wide layouts |
| 18 | `53acb2a` | Privacy-safe analytics: closed catalogue, allowlisted parameters, verified on device that a search query never leaves |
| 19 | this | Release candidate: iOS bundle id and display name corrected, iOS icons generated, advertising permissions removed, security review, data safety inventory |
