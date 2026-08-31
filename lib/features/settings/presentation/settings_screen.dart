import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/security/protection_providers.dart';
import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../intelligence/application/intelligence_providers.dart';
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

    return SettingsPage(
      title: 'Settings',
      slivers: [
        SettingsSection(
          title: 'Personalise',
          children: [
            SettingsRow(
              label: 'Appearance',
              description: 'Light, dark, or whatever the device is doing.',
              icon: Icons.contrast_rounded,
              value: _appearanceLabel(themeMode),
              onTap: () => _chooseAppearance(context, ref, themeMode),
            ),
          ],
        ),
        SettingsSection(
          title: 'Intelligence',
          footnote: 'Action works without AI. Connecting your own provider '
              'adds document analysis, planning and drafting tools.',
          children: [
            SettingsRow(
              label: 'AI provider',
              description: aiConfig == null
                  ? 'Not connected. Use your own account and API key.'
                  : 'Connected to ${aiConfig.kind.label}.',
              icon: Icons.lightbulb_outline_rounded,
              onTap: () => context.push(Routes.settingsIntelligence),
            ),
          ],
        ),
        SettingsSection(
          title: 'Privacy & security',
          children: [
            SettingsRow(
              label: 'Security',
              description: _protectionSummary(protection),
              icon: Icons.shield_outlined,
              tint: colors.confidenceConfirmed,
              onTap: () => context.push(Routes.settingsSecurity),
            ),
            SettingsRow(
              label: 'Where your information lives',
              description: 'What stays on this device, and what does not.',
              icon: Icons.travel_explore_outlined,
              tint: colors.confidenceReview,
              onTap: () => context.push(Routes.settingsPrivacy),
            ),
          ],
        ),
        SettingsSection(
          title: 'Reminders',
          footnote: 'Android may deliver a reminder a little later than the '
              'time you set, depending on battery settings and how the device '
              'is being used.',
          children: [
            SettingsRow(
              label: 'Notifications',
              icon: Icons.notifications_none_rounded,
              tint: colors.urgencyImportant,
              description: allowed.when(
                data: (on) => on
                    ? 'Reminders you set can be shown.'
                    : 'Turned off for Action, so reminders will not appear.',
                loading: () => 'Checking…',
                error: (_, _) => 'Could not be checked.',
              ),
              value: allowed.when(
                data: (on) => on ? 'Allowed' : 'Off',
                loading: () => '',
                error: (_, _) => 'Unknown',
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
                      child: const Text('Open settings'),
                    )
                  : null,
            ),
          ],
        ),
        SettingsSection(
          title: 'Action',
          footnote: 'Action turns messy information into clear next steps. '
              'You confirm everything before it is saved.',
          children: [
            SettingsRow(
              label: 'Help',
              description: 'How Action works, and what it will not do.',
              icon: Icons.help_outline_rounded,
              tint: colors.textTertiary,
              onTap: () => context.push(Routes.settingsHelp),
            ),
            SettingsRow(
              label: 'Version',
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
  static String _protectionSummary(ProtectionSettings protection) {
    final on = <String>[
      if (protection.appLockEnabled) 'App Lock',
      if (protection.screenPrivacyEnabled) 'screen privacy',
      if (protection.privateNotifications) 'private reminders',
    ];
    if (on.isEmpty) {
      return 'App Lock, screen privacy and what leaves this device.';
    }
    if (on.length == 1) return '${on.single} is on.';
    return '${on.take(on.length - 1).join(', ')} and ${on.last} are on.';
  }

  static String _appearanceLabel(ThemeMode mode) => switch (mode) {
        ThemeMode.system => 'System',
        ThemeMode.light => 'Light',
        ThemeMode.dark => 'Dark',
      };

  Future<void> _chooseAppearance(
    BuildContext context,
    WidgetRef ref,
    ThemeMode current,
  ) async {
    final chosen = await showModalBottomSheet<ThemeMode>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => AppSheet(
        title: 'Appearance',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final mode in ThemeMode.values)
                _AppearanceOption(
                  label: _appearanceLabel(mode),
                  description: switch (mode) {
                    ThemeMode.system => 'Match the device setting',
                    ThemeMode.light => 'Always light',
                    ThemeMode.dark => 'Always dark',
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
