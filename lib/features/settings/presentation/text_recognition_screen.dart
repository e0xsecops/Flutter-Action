import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_l10n.dart';
import '../../../l10n/supported_locales.dart';
import '../../capture/application/ocr_script_controller.dart';
import '../../capture/domain/ocr_script.dart';
import 'settings_shell.dart';

/// Which writing system the on-device recogniser is loaded for.
///
/// **Why this setting exists at all.** For most of this app's life the
/// recogniser was hard-coded to Latin, and while the app was English-only that
/// was defensible. It stopped being defensible the moment the app offered
/// itself in Hindi, Japanese, Korean and Chinese: an app that speaks a language
/// but cannot read a letter written in it is offering half a product, and the
/// half it withholds is the one the user came for.
///
/// **Why the user has to choose.** ML Kit ships a separate model per script and
/// there is no way to know which script an image holds without reading it.
/// Running all five over every capture would multiply the cost of the one
/// operation the whole pipeline waits on. So Action picks a default from the
/// language on screen and lets the user override it — and because every
/// non-Latin model also reads Latin, choosing one *adds* a writing system
/// rather than trading one away. The footnote says exactly that, because a
/// user who believes they are giving something up will not choose.
///
/// **Why the unsupported case gets a panel rather than silence.** Five of the
/// twenty languages Action ships — Bengali, Urdu, Arabic, Thai and Russian —
/// have no on-device recogniser for their script. The honest thing is to say
/// so on the screen where the question arises, and to name the way through:
/// Latin is still read, and text can always be typed or pasted. The dishonest
/// thing, which is what the app did before, is to let someone photograph a
/// Bengali letter and hand back an empty result with no explanation.
class TextRecognitionScreen extends ConsumerWidget {
  const TextRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context);
    final chosen = ref.watch(ocrScriptControllerProvider);
    final effective = ref.watch(ocrScriptProvider);
    final locale = ref.watch(effectiveLocaleProvider);
    final covered = OcrScript.coversScriptOf(locale);

    return SettingsPage(
      title: l10n.ocrScriptTitle,
      subtitle: l10n.ocrScriptSubtitle,
      slivers: [
        if (!covered)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Space.md,
                Space.md,
                Space.md,
                0,
              ),
              child: _UnsupportedScriptNotice(
                language: AppLocales.forLocale(locale).nativeName,
              ),
            ),
          ),
        SettingsSection(
          title: l10n.ocrScriptSectionChoose,
          footnote: l10n.ocrScriptFootnote,
          children: [
            _ScriptOption(
              label: l10n.ocrScriptFollowLanguage,
              // Naming the script this currently resolves to, so "follow the
              // language" is a visible state rather than a promise the user
              // has to take on trust.
              description: l10n.ocrScriptFollowLanguageValue(
                effective.labelIn(l10n),
              ),
              selected: chosen == null,
              onTap: () =>
                  ref.read(ocrScriptControllerProvider.notifier).set(null),
            ),
            for (final script in OcrScript.values)
              _ScriptOption(
                label: script.labelIn(l10n),
                description: script.descriptionIn(l10n),
                selected: chosen == script,
                onTap: () =>
                    ref.read(ocrScriptControllerProvider.notifier).set(script),
              ),
          ],
        ),
      ],
    );
  }
}

/// The panel shown when the app's own language has no recogniser.
class _UnsupportedScriptNotice extends StatelessWidget {
  const _UnsupportedScriptNotice({required this.language});

  final String language;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(Space.md),
      decoration: BoxDecoration(
        color: colors.surfaceSunken,
        borderRadius: Radii.rMd,
        border: Border.all(color: colors.border, width: Strokes.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 18,
                // The review tint, not the danger tint. Nothing has gone
                // wrong; a capability is absent and the user should know.
                color: colors.confidenceReview,
              ),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Text(
                  l10n.ocrScriptUnreadableTitle(language),
                  style: text.titleSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: Space.sm),
          Text(
            l10n.ocrScriptUnreadableBody,
            style: text.bodySmall?.copyWith(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _ScriptOption extends StatelessWidget {
  const _ScriptOption({
    required this.label,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String description;
  final bool selected;
  final VoidCallback onTap;

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
                      Text(label, style: text.titleSmall),
                      const SizedBox(height: Space.xxs),
                      Text(
                        description,
                        style: text.bodySmall
                            ?.copyWith(color: colors.textSecondary),
                      ),
                    ],
                  ),
                ),
                // A check and a colour, never colour alone — the same rule
                // the language and appearance choosers follow.
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
