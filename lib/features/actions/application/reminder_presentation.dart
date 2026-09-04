/// What a reminder is allowed to say out loud.
///
/// A reminder arrives on a lock screen, in a car, on a watch, on a screen
/// being shared. The Action's own title is usually exactly what the user wants
/// to see there and occasionally the last thing they want anyone else to see —
/// "Call the clinic about the results" is a useful reminder and a disclosure.
///
/// Private mode replaces the body outright rather than truncating or blurring
/// it. A shortened title still leaks: "Call the clinic abo…" is not meaningfully
/// more private than the whole sentence.
///
/// The notification already carries `NotificationVisibility.private`, which
/// asks Android to hide the body on a *secure* lock screen. This is the layer
/// above that, and it exists because that flag does nothing at all in the
/// notification shade, on a device with no lock set, or on a paired watch.
library;

/// Deliberately says something rather than nothing. A notification with no
/// body reads as a bug, and the user still needs to know Action wants them.
const String privateReminderBody = 'You have something to review.';

/// The body text for a reminder about [actionTitle].
///
/// An empty title falls back to the private line for the same reason: a blank
/// notification is worse than a vague one.
String reminderBody(String actionTitle, {required bool private}) {
  final trimmed = actionTitle.trim();
  if (private || trimmed.isEmpty) return privateReminderBody;
  return trimmed;
}
