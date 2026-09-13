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
///
/// **Language.** Exactly one of the two possible bodies is ours to translate.
/// The private line is the app speaking, so it is looked up like any other
/// string. The other body *is the Action's title* — the user's own words, in
/// whatever language they wrote them — and passing that through a translation
/// layer would be both wrong and impossible. So [reminderBodyIn] takes a
/// bundle and still returns the title verbatim when there is a title to
/// return.
library;

import '../../../l10n/gen/app_l10n.dart';

/// Deliberately says something rather than nothing. A notification with no
/// body reads as a bug, and the user still needs to know Action wants them.
///
/// This is the canonical English, kept for the same reason the enums keep
/// theirs: the security tests assert against it, and it is the last-resort
/// body on a path with no bundle. What a user actually reads comes from
/// [reminderBodyIn].
const String privateReminderBody = 'You have something to review.';

/// The body text for a reminder about [actionTitle], in English.
///
/// An empty title falls back to the private line for the same reason: a blank
/// notification is worse than a vague one.
String reminderBody(String actionTitle, {required bool private}) => _body(
      actionTitle,
      private: private,
      privateLine: privateReminderBody,
    );

/// The body text for a reminder about [actionTitle], in the reader's language.
///
/// Identical rules to [reminderBody] — private mode and an empty title both
/// end at the private line — and the same deliberate asymmetry: the private
/// line is translated, the title never is.
///
/// The bundle is passed rather than resolved here because this is application
/// code with no `BuildContext` and no business reading a preference. The
/// caller arms the reminder and knows which language the app is currently in.
String reminderBodyIn(
  AppL10n l10n,
  String actionTitle, {
  required bool private,
}) =>
    _body(
      actionTitle,
      private: private,
      privateLine: l10n.reminderNotificationPrivateBody,
    );

/// The one rule, in one place, so the English and the localized paths can
/// never disagree about when a title is allowed out.
String _body(
  String actionTitle, {
  required bool private,
  required String privateLine,
}) {
  final trimmed = actionTitle.trim();
  if (private || trimmed.isEmpty) return privateLine;
  return trimmed;
}
