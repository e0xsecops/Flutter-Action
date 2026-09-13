import '../domain/action_item.dart';

/// Which offer a preset is, independent of the words for it.
///
/// The words live in `lib/l10n/enum_labels.dart` for the same reason every
/// other enum's do: a `const` field cannot depend on the locale, and this
/// layer has no `BuildContext` to ask. Keeping the canonical English on the
/// preset as well means a domain test can assert an offer without pumping a
/// widget tree.
enum ReminderPresetKind {
  inOneHour,
  tomorrowMorning,
  nextWeek,
  onTheDay,
  oneDayBefore,
  oneWeekBefore,
  atTheDeadline,
  oneHourBefore,
}

/// A reminder time the app offers, with the words it offers it in.
final class ReminderPreset {
  const ReminderPreset({
    required this.kind,
    required this.label,
    required this.at,
  });

  /// Which offer this is. What a person reads comes from
  /// `ReminderPresetKindL10n.labelIn`.
  final ReminderPresetKind kind;

  /// Canonical English, e.g. "1 day before". Never the only thing shown —
  /// the resolved date and time are always displayed next to it, because a
  /// relative phrase alone hides which clock time was chosen.
  final String label;

  /// Local wall-clock moment being proposed.
  final DateTime at;
}

/// The clock time used when a deadline is a plain date.
///
/// A date-only deadline says nothing about time of day, so a time has to come
/// from somewhere. It is a fixed, boring, visible 9am rather than anything
/// inferred — and the UI must show it before the user agrees.
const int suggestedMorningHour = 9;

/// Times worth offering for this Action, soonest first, never in the past.
///
/// Suggestions only: nothing here creates a reminder. Every one of these has
/// to be chosen and confirmed, because a notification the user did not ask
/// for is spam no matter how well-timed.
List<ReminderPreset> reminderPresetsFor(ActionItem action, DateTime now) {
  final due = action.dueAt;
  final presets = <ReminderPreset>[];

  if (due == null) {
    presets.addAll([
      ReminderPreset(kind: ReminderPresetKind.inOneHour, label: 'In 1 hour', at: now.add(const Duration(hours: 1))),
      ReminderPreset(
        kind: ReminderPresetKind.tomorrowMorning,
        label: 'Tomorrow morning',
        at: _morning(now.add(const Duration(days: 1))),
      ),
      ReminderPreset(
        kind: ReminderPresetKind.nextWeek,
        label: 'Next week',
        at: _morning(now.add(const Duration(days: 7))),
      ),
    ]);
  } else if (due.isDateOnly) {
    // The deadline names a day, not a moment, so every offer here is that day
    // at the suggested hour.
    final day = due.wallClock;
    presets.addAll([
      ReminderPreset(kind: ReminderPresetKind.onTheDay, label: 'On the day', at: _morning(day)),
      ReminderPreset(
        kind: ReminderPresetKind.oneDayBefore,
        label: '1 day before',
        at: _morning(day.subtract(const Duration(days: 1))),
      ),
      ReminderPreset(
        kind: ReminderPresetKind.oneWeekBefore,
        label: '1 week before',
        at: _morning(day.subtract(const Duration(days: 7))),
      ),
    ]);
  } else {
    final at = due.wallClock;
    presets.addAll([
      ReminderPreset(kind: ReminderPresetKind.atTheDeadline, label: 'At the deadline', at: at),
      ReminderPreset(
        kind: ReminderPresetKind.oneHourBefore,
        label: '1 hour before',
        at: at.subtract(const Duration(hours: 1)),
      ),
      ReminderPreset(
        kind: ReminderPresetKind.oneDayBefore,
        label: '1 day before',
        at: at.subtract(const Duration(days: 1)),
      ),
    ]);
  }

  // A "1 week before" that already went by is not an option, and offering it
  // only to reject it later would be worse than not offering it.
  final future = presets.where((p) => p.at.isAfter(now)).toList()
    ..sort((a, b) => a.at.compareTo(b.at));
  return future;
}

DateTime _morning(DateTime day) =>
    DateTime(day.year, day.month, day.day, suggestedMorningHour);
