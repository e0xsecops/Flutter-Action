# Store assets — specification

A brief, not artwork. **Nothing here has been produced.** Screenshots must be
captured after the copy below is approved, and every one of them must use
synthetic data.

## Visual identity

Action's design language, carried into the store:

**Calm intelligence + liquid glass.** The product is trusted with people's
bills and deadlines, so the graphics should look composed rather than
exciting. No urgency, no red badges, no exclamation marks, no stock photos of
stressed people at desks.

| Token | Value |
| --- | --- |
| Brand | `#2563EB` (light) / `#6090FA` (dark) |
| Light surface | `#FAFAFB` page, `#FFFFFF` cards |
| Dark surface | `#0B0D10` page, `#14171C` cards |
| Overdue | `#B42318` (light) / `#F97066` (dark) |
| Type | The app's own scale — no display fonts, no all-caps headlines |

Glass appears where it appears in the product — the floating Add bar, sheets,
the search controls — and nowhere else. Inventing glass panels that the app
does not have would be a lie about the product.

## Screenshots (8 required, phone)

Synthetic data only. **No real name, address, reference number, amount or
organisation.** Reuse `ScaleFixtures`-style content: "Renew permit 97",
"Confirm statement 16", amounts like `107.97 GBP`.

| # | Screen | Caption |
| --- | --- | --- |
| 1 | Home, a realistic mix, Needs Attention populated | **Turn information into action** |
| 2 | Capture sheet open over Home, glass visible | **Add a photo, a screenshot, or some text** |
| 3 | Review screen, a field with its evidence expanded | **You review before it becomes an Action** |
| 4 | Home showing triage reasons — "Overdue · 3 days", "Due today" | **See what actually needs attention** |
| 5 | Action Detail with the Next-step card and a part-done chain | **Work the next clear step** |
| 6 | Reminder sheet | **Reminders that stay on your device** |
| 7 | Search with results and highlighted matches | **Find anything, privately** |
| 8 | Privacy & data screen | **Delete everything, and know it happened** |

Captions are ≤ 6 words, sentence case, no full stops. They must match
`docs/RELEASE_NOTES.md` and must not claim anything from the "must NOT be
made" list in `docs/DATA_SAFETY.md`.

Both light and dark should appear across the set — light for 1–5, dark for
6–8 works, since search and privacy read well on dark.

Capture at 1080×2400 (the QA emulator's native size), status bar clean: full
signal, full battery, a neutral time. No debug banner.

## Feature graphic (1024×500)

- Deep brand-blue field with a soft vertical gradient, no photograph
- A single translucent glass card, slightly angled, showing one Action with a
  deadline and a next step — the product's actual card, not an invented one
- Wordmark **Action** left-aligned, generous margin
- One line of supporting copy: *Turn information into action*
- No device frames, no screenshots-inside-screenshots, no badges, no "As seen
  in", no awards, no competitor names or trademarks

## App icon

Already shipped: the adaptive Android icon and the generated iOS set, both
from `assets/icon/`, on brand blue `#2563EB`. It reads at 48 px, which is the
only test that matters. Do not add glass or gradients to the icon — the
effect disappears at launcher size and turns to mud.

## Promo video

Not planned for v1. If one is made later it must show the real app, and must
not dramatise a consequence (a missed payment, a penalty) that the product
does not actually prevent.

## Rules for whoever produces these

1. Synthetic data only, always.
2. Never show a real document, envelope, letterhead or logo.
3. Do not mock up screens the app does not have.
4. Do not imply cross-device sync, backup, or guaranteed reminder delivery.
5. Do not claim "private" without the qualification the privacy screen gives:
   captures are sent to an AI service when the user asks for one to be read.
