import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/security/protection_providers.dart';
import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../intelligence/application/intelligence_providers.dart';
import '../../../l10n/gen/app_l10n.dart';
import '../../../l10n/supported_locales.dart';
import '../application/locale_controller.dart';
import '../application/settings_providers.dart';
import '../data/system_settings_launcher.dart';
import 'settings_shell.dart';

/// Settings.
///
/// Five small groups, not fifty toggles. Everything here is either a
/// preference the user actually has, a truthful statement of a state they
/// cannot change from inside the app, or a way to reach somewhere that
/// explains what the product does with their information. Nothing internal is
/// exposed.
///
/// **Why the order is what it is.** Appearance first because it is the thing
/// people come here to change most often and least consequentially.
/// Intelligence and Security next because they are the two decisions with real
/// stakes. Reminders after, and Help last, where a reference belongs.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final themeMode = ref.watch(themeModeControllerProvider);
    final allowed = ref.watch(notificationsAllowedProvider);
    final version = ref.watch(appVersionProvider);
    final aiConfig = ref.watch(aiProviderConfigProvider);
    final protection = ref.watch(protectionSettingsProvider);
    final l10n = AppL10n.of(context);
    final chosenLocale = ref.watch(localeControllerProvider);

    return SettingsPage(
      title: l10n.settingsTitle,
      slivers: [
        SettingsSection(
          title: l10n.settingsSectionPersonalise,
          children: [
            SettingsRow(
              label: l10n.settingsAppearance,
              description: l10n.settingsAppearanceDescription,
              icon: Icons.contrast_rounded,
              value: _appearanceLabel(l10n, themeMode),
              onTap: () => _chooseAppearance(context, ref, themeMode),
            ),
            SettingsRow(
              label: l10n.languageTitle,
              description: l10n.settingsLanguageDescription,
              icon: Icons.translate_rounded,
              // The chosen language names itself, in itself. Showing
              // "Bengali" here to someone whose app is in Bengali would be
              // the one row on the screen they could not read.
              value: chosenLocale == null
                  ? l10n.languageSystem
                  : AppLocales.forLocale(chosenLocale).nativeName,
              onTap: () => context.push(Routes.settingsLanguage),
            ),
          ],
        ),
        SettingsSection(
          title: l10n.navIntelligence,
          footnote: l10n.settingsIntelligenceFootnote,
          children: [
            SettingsRow(
              label: l10n.settingsAiProvider,
              description: aiConfig == null
                  ? l10n.settingsAiNotConnected
                  : l10n.settingsAiConnected(aiConfig.kind.label),
              icon: Icons.lightbulb_outline_rounded,
              onTap: () => context.push(Routes.settingsIntelligence),
            ),
          ],
        ),
        SettingsSection(
          title: l10n.settingsSectionPrivacySecurity,
          children: [
            SettingsRow(
              label: l10n.settingsSecurity,
              description: protectionSummary(l10n, protection),
              icon: Icons.shield_outlined,
              tint: colors.confidenceConfirmed,
              onTap: () => context.push(Routes.settingsSecurity),
            ),
            SettingsRow(
              label: l10n.settingsWhereInfoLives,
              description: l10n.settingsWhereInfoLivesDescription,
              icon: Icons.travel_explore_outlined,
              tint: colors.confidenceReview,
              onTap: () => context.push(Routes.settingsPrivacy),
            ),
          ],
        ),
        SettingsSection(
          title: l10n.settingsSectionReminders,
          footnote: l10n.settingsRemindersFootnote,
          children: [
            SettingsRow(
              label: l10n.settingsNotifications,
              icon: Icons.notifications_none_rounded,
              tint: colors.urgencyImportant,
              description: allowed.when(
                data: (on) => on
                    ? l10n.settingsNotificationsOnDescription
                    : l10n.settingsNotificationsOffDescription,
                loading: () => l10n.commonChecking,
                error: (_, _) => l10n.settingsNotificationsUnknown,
              ),
              value: allowed.when(
                data: (on) => on ? l10n.settingsNotificationsAllowed : l10n.commonOff,
                loading: () => '',
                error: (_, _) => l10n.commonUnknown,
              ),
              action: allowed.value == false
                  ? TextButton(
                      // Deliberate, never on page open.
                      onPressed: () async {
                        await ref
                            .read(systemSettingsLauncherProvider)
                            .openNotificationSettings();
                        ref.invalidate(notificationsAllowedProvider);
                      },
                      child: Text(l10n.settingsOpenSystemSettings),
                    )
                  : null,
            ),
          ],
        ),
        SettingsSection(
          title: l10n.appName,
          footnote: l10n.settingsActionFootnote,
          children: [
            SettingsRow(
              label: l10n.settingsHelp,
              description: l10n.settingsHelpDescription,
              icon: Icons.help_outline_rounded,
              tint: colors.textTertiary,
              onTap: () => context.push(Routes.settingsHelp),
            ),
            SettingsRow(
              label: l10n.settingsVersion,
              value: version.value ?? '—',
            ),
          ],
        ),
      ],
    );
  }

  /// Says what is actually on, by name.
  ///
  /// "3 of 3 on" would be a score. Naming them means someone who turned one on
  /// last month can see which, without opening the screen.
  ///
  /// **Why four keys rather than a joined list.** The English version built
  /// the sentence by joining with ", " and " and ". That is a grammar rule
  /// disguised as string concatenation, and it is English's grammar rule: the
  /// separator, the conjunction, the position of the verb and whether the verb
  /// agrees with a plural subject all differ by language, and several of the
  /// twenty put the verb at the end. One key per arity lets each translation
  /// write its own sentence.
  static String protectionSummary(
    AppL10n l10n,
    ProtectionSettings protection,
  ) {
    final on = <String>[
      if (protection.appLockEnabled) l10n.protectionAppLock,
      if (protection.screenPrivacyEnabled) l10n.protectionScreenPrivacy,
      if (protection.privateNotifications) l10n.protectionPrivateReminders,
    ];
    return switch (on.length) {
      0 => l10n.protectionSummaryNone,
      1 => l10n.protectionSummaryOne(on[0]),
      2 => l10n.protectionSummaryTwo(on[0], on[1]),
      _ => l10n.protectionSummaryThree(on[0], on[1], on[2]),
    };
  }

  static String _appearanceLabel(AppL10n l10n, ThemeMode mode) =>
      switch (mode) {
        ThemeMode.system => l10n.appearanceSystem,
        ThemeMode.light => l10n.appearanceLight,
        ThemeMode.dark => l10n.appearanceDark,
      };

  Future<void> _chooseAppearance(
    BuildContext context,
    WidgetRef ref,
    ThemeMode current,
  ) async {
    final l10n = AppL10n.of(context);
    final chosen = await showModalBottomSheet<ThemeMode>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => AppSheet(
        title: l10n.settingsAppearance,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final mode in ThemeMode.values)
                _AppearanceOption(
                  label: _appearanceLabel(l10n, mode),
                  description: switch (mode) {
                    ThemeMode.system => l10n.appearanceSystemDescription,
                    ThemeMode.light => l10n.appearanceLightDescription,
                    ThemeMode.dark => l10n.appearanceDarkDescription,
                  },
                  selected: mode == current,
                  onTap: () => Navigator.of(sheetContext).pop(mode),
                ),
            ],
          ),
        ),
      ),
    );
    if (chosen != null) {
      await ref.read(themeModeControllerProvider.notifier).set(chosen);
    }
  }
}

class _AppearanceOption extends StatelessWidget {
  const _AppearanceOption({
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
              // Selection is a check *and* a colour, never colour alone.
              if (selected)
                Icon(Icons.check_rounded, size: 20, color: colors.brand),
            ],
          ),
        ),
      ),
    );
  }
}
