# Action V2 — Information Architecture

## What was wrong

Every screen was a route pushed from Home. There was no persistent navigation
anywhere in the app, and the only way to reach Search, Settings or Intelligence
was a cluster of three small grey icons in the greeting row — one of which was
the debug-only diagnostics flask, visible in the build.

The consequence, measured by looking at the device: a new user could not see
that Action had a library, an intelligence workspace, or private search. The
capability was real and completely invisible.

---

## The architecture

```
StatefulShellRoute.indexedStack
├── TODAY          /            what needs you now
├── LIBRARY        /library     everything Action holds
│      ┌──────────────────────┐
│      │  [ CAPTURE ]  orb    │  an act, not a place
│      └──────────────────────┘
├── INTELLIGENCE   /studio      the fifteen tools
└── SEARCH         /search      private local search

pushed ABOVE the shell (root navigator, full screen, back button):
   /action/:id        the Action Cockpit
   /source/:id        a capture
   /source/:id/review trust-first review
   /tool/:id          one tool run
   /capture/preview   /capture/text
   /settings          + privacy, help, intelligence
   /onboarding        (outside the shell entirely)
   /diagnostics       (debug builds only)
```

### Why four destinations and not five

Settings was the obvious fifth and is deliberately not one. It is somewhere you
go rarely, to change something, and then leave — which is a *task*, not a place
you switch between. It lives as the single control in the Today header, which is
also what let the header drop from three icons to one.

### Why Capture is not a destination

Capture is the act the whole product exists around, and it produces a *sheet*,
not a page. Making it a tab would mean a tab you can never actually be "on".
It sits in the middle of the bar as a raised, brand-filled orb — deliberately
the highest-contrast object on screen, because a new user who presses exactly one
control should press this one.

Its position between Library and Intelligence is also the middle of the loop:
you have looked at what is there, and now you add to it.

### Why detail screens push above the shell

An Action, a source, a tool run and Settings are focused tasks. They want the
full screen, a back button, and no competing navigation. Keeping the nav bar
visible on them would invite the user to abandon a half-finished review by
tapping a tab — and would cost the vertical space the Cockpit needs.

### Why `StatefulShellRoute.indexedStack`

Each branch keeps its own `Navigator`, so leaving Library and coming back returns
you to where you were rather than to the top. `StatefulNavigationShell` also
carries `RestorationMixin`, so branch state survives process death — which the
previous single-navigator arrangement did not.

Tapping the destination you are already on returns that branch to its root: the
platform convention, and the fastest way back to the top of a long Library.

---

## What each destination answers

| Destination | The question it answers |
|---|---|
| **Today** | What requires me? What do I do next? What is waiting? What is coming? |
| **Library** | Where is my stuff? |
| **Intelligence** | What can Action help me understand? |
| **Search** | Where is that thing I remember? |

### Today

One deterministic brief, one hero, then only the sections that have something in
them. Never five empty headings.

```
TUESDAY · 1 SEPTEMBER
Good morning                                      [settings]

┌─ hero (glass, in its own pool of light) ────────┐
│ ● NEEDS YOU                                      │
│ 2 actions need your attention                    │
│ 1 capture is also waiting for review.            │
│ ──────────────────────────────────────────────── │
│ OVERDUE · 2 DAYS                          ( ○ )  │
│ Renew the car insurance                          │
│ Due 18 Aug · £284.50                             │
│ NEXT  Compare the renewal quote                  │
└──────────────────────────────────────────────────┘

ALSO NEEDS ATTENTION      · cards
WAITING FOR REVIEW    3   · capture cards (max 3, then "see all")
COMING UP                 · cards (max 4)
✓ 2 done                  → Library
```

Completed work gets **one line**, not a section. Every comparable product keeps
finished work off the daily surface — Things has a Logbook, Todoist has Activity
— because a growing list of things you already did costs scroll every day and
buys nothing. Action's Logbook is Library → Done.

**The empty state is split.** A first-run user and a user who just cleared their
list need opposite things said to them, and the old build said the same sentence
to both. First run gets "Start with anything" plus a capability preview — the
only place the app says what it does. A cleared list gets "You're clear" and no
call to action, because the reward for finishing is not being asked to start.

### Library

Segments: **Actions · Captures · Done**, with counts, because "is there anything
in there?" is the question the user is actually asking and a segment that turns
out to be empty after a tap is a wasted tap.

Captures is a real **inbox**. A capture is allowed to exist without becoming an
Action, and its state is shown honestly — `Reading`, `Needs review`,
`Action created`, `No text found`, `Couldn't be read` — rather than implied by
which list it fell into. The stage is *derived* from data already on the
`SourceItem` plus the Action list, so there is no new state to keep in sync and
no migration.

### Intelligence

Hero → Recommended → the five intents. Never fifteen equal cards.

### Search

Field, scope chips, and a zero state that names what is searchable with a worked
example for each, rather than a magnifying glass over a dead area. The privacy
promise leads, because it is the reason this search differs from every other
search the user does that day.

Search has **no back control**: it is a destination, so there is nothing to pop.

---

## Guards preserved

- **Onboarding redirect** sits above the shell, so it still covers every branch
  and cannot be bypassed by a deep link into `/action/:id` on a fresh install.
- **`/action/:id` deep links from notifications** still resolve, still `push`
  rather than `go` (so there is a way back), and still get a real not-found
  state rather than a silent bounce.
- **Debug routes** remain registered only under `kDebugMode`, so they cannot be
  reached in a release build even by a crafted link. The diagnostics *icon* left
  the header entirely.
- **`errorBuilder`** still lands on Home.

---

## Breakpoints

Two separate jobs, deliberately not merged:

| Constant | Job | Value |
|---|---|---|
| `readableContent` | prose line length | 560 |
| `readableList` | card lists | 720 |

These are typographic measures and are correct as such. Material's window size
classes (600 / 840) govern *layout structure* and are a different question;
conflating the two would make prose lines too long on a tablet.
