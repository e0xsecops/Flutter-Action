import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../l10n/gen/app_l10n.dart';
import '../../../l10n/supported_locales.dart';
import '../application/locale_controller.dart';
import 'settings_shell.dart';

/// The language picker.
///
/// **Why it is a page rather than a sheet.** Twenty options is a list, and a
/// list of twenty in a bottom sheet is a list you scroll inside a thing that
/// also scrolls. The appearance chooser is a sheet because it has three
/// options; this has twenty-one including System.
///
/// **Why each language names itself.** A list that says "German" is useless to
/// the person who needs it, because that person is reading the app in a
/// language they do not have and is looking for `Deutsch`. The English name
/// appears nowhere on this screen.
///
/// **Why the change is instant.** Choosing a language rebuilds `MaterialApp`
/// with a new locale, and this screen is below it — so the heading, the
/// footnote and the System row's description are all in the new language
/// before the tap finishes, and on Arabic or Urdu the whole page mirrors. That
/// is the demonstration: a language setting that needed a restart to take
/// effect would be a setting nobody trusts.
class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context);
    final chosen = ref.watch(localeControllerProvider);

    return SettingsPage(
      title: l10n.languageTitle,
      subtitle: l10n.languageSubtitle,
      slivers: [
        SettingsSection(
          title: l10n.languageSectionChoose,
          // The honest note. Action does not claim these are certified
          // translations, and the place to say so is the screen where someone
          // picks one — not a support page they will never open.
          footnote: l10n.languageDraftNote,
          children: [
            _LanguageOption(
              label: l10n.languageSystem,
              description: l10n.languageSystemDescription,
              selected: chosen == null,
              onTap: () =>
                  ref.read(localeControllerProvider.notifier).set(null),
            ),
            for (final language in AppLocales.all)
              _LanguageOption(
                label: language.nativeName,
                // The text direction of the *name*, not of the page. Without
                // this an Arabic name in a left-to-right list renders with its
                // punctuation on the wrong side.
                direction: _directionOf(language.locale),
                selected: chosen == language.locale,
                onTap: () => ref
                    .read(localeControllerProvider.notifier)
                    .set(language.locale),
              ),
          ],
        ),
      ],
    );
  }

  /// Right-to-left for the two RTL languages Action ships, so their names read
  /// correctly inside a list that may itself be laid out either way.
  static TextDirection _directionOf(Locale locale) =>
      const {'ar', 'ur', 'fa', 'he'}.contains(locale.languageCode)
          ? TextDirection.rtl
          : TextDirection.ltr;
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.selected,
    required this.onTap,
    this.description,
    this.direction,
  });

  final String label;
  final String? description;
  final bool selected;
  final VoidCallback onTap;
  final TextDirection? direction;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: Radii.rMd,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Space.sm,
              vertical: Space.md,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        textDirection: direction,
                        style: text.titleSmall,
                      ),
                      if (description != null) ...[
                        const SizedBox(height: Space.xxs),
                        Text(
                          description!,
                          style: text.bodySmall
                              ?.copyWith(color: colors.textSecondary),
                        ),
                      ],
                    ],
                  ),
                ),
                // A check and a colour, never colour alone — the same rule the
                // appearance chooser follows.
                if (selected)
                  Icon(Icons.check_rounded, size: 20, color: colors.brand),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
