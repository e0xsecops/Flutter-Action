import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/settings_providers.dart';
import '../data/system_settings_launcher.dart';
import 'settings_shell.dart';

/// Settings.
///
/// Four small groups, not forty toggles. Everything here is either a
/// preference the user actually has, a truthful statement of a state they
/// cannot change from inside the app, or a way to read what the product does
/// with their information. Nothing internal is exposed.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeControllerProvider);
    final allowed = ref.watch(notificationsAllowedProvider);
    final version = ref.watch(appVersionProvider);

    return SettingsPage(
      title: 'Settings',
      slivers: [
        SettingsSection(
          title: 'Preferences',
          children: [
            SettingsRow(
              label: 'Appearance',
              value: _appearanceLabel(themeMode),
              onTap: () => _chooseAppearance(context, ref, themeMode),
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
              trailing: allowed.value == false
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
          title: 'Privacy & data',
          children: [
            SettingsRow(
              label: 'Where your information lives',
              description: 'What stays on this device, and what does not.',
              onTap: () => context.push(Routes.settingsPrivacy),
            ),
          ],
        ),
        SettingsSection(
          title: 'Help',
          footnote: 'Action turns messy information into clear next steps. '
              'You confirm everything before it is saved.',
          children: [
            SettingsRow(
              label: 'Help',
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
