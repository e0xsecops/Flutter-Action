/// Security & privacy: the controls, and the record of what they did.
///
/// **Why this screen exists rather than four settings rows.** Privacy in this
/// product is not a promise, it is a set of mechanisms — a lock, a window flag,
/// a notification body, a list of what was sent. Scattering them through
/// Settings would make each one look like a preference. Collected here, with
/// the receipts underneath them, they read as what they are.
///
/// **What it refuses to say.** No shields, no percentages, no "military-grade",
/// no score out of a hundred. The status at the top names what is on, in
/// words, and the storage section states plainly what Action does *not*
/// encrypt. A security screen that overstates is worse than none, because the
/// user then stops taking their own precautions.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/security/activity_journal.dart';
import '../../../core/security/activity_providers.dart';
import '../../../core/security/device_lock.dart';
import '../../../core/security/protection_providers.dart';
import '../../../design/ambient/ambient_background.dart';
import '../../../design/components/app_sheet.dart';
import '../../../design/components/glass_surface.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../actions/application/action_providers.dart';
import '../../intelligence/application/intelligence_providers.dart';
import '../../intelligence/domain/ai_provider_config.dart';
import '../../intelligence/domain/tool_registry.dart';
import 'settings_shell.dart';

class SecurityScreen extends ConsumerWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final protection = ref.watch(protectionSettingsProvider);
    final available = ref.watch(appLockAvailableProvider);
    final aiConfig = ref.watch(aiProviderConfigProvider);
    final transfers = ref.watch(dataTransfersProvider);

    return SettingsPage(
      title: 'Security & privacy',
      slivers: [
        SliverToBoxAdapter(child: _StatusHero(protection: protection)),
        SettingsSection(
          title: 'Protection',
          children: [
            SettingsRow(
              label: 'App Lock',
              icon: Icons.lock_outline_rounded,
              tint: colors.confidenceConfirmed,
              // The unavailable explanation belongs to this row, not to the
              // section. As a footnote under all three it read as though a
              // missing screen lock disabled every protection on the page.
              description: switch (available.value) {
                false => 'App Lock needs a screen lock on this device. Set a '
                    'PIN, pattern, password or fingerprint in your device '
                    'settings first.',
                _ => protection.appLockEnabled
                    ? 'Action asks your device to confirm it is you.'
                    : 'Require your fingerprint, face or device PIN to open '
                        'Action.',
              },
              trailing: Switch(
                value: protection.appLockEnabled,
                // Off when the device has no credential: enabling it there
                // would lock the user out of their own data with no way in.
                onChanged: available.value == false
                    ? null
                    : (want) => _toggleAppLock(context, ref, want),
              ),
            ),
            if (protection.appLockEnabled)
              SettingsRow(
                label: 'Ask again',
                icon: Icons.timer_outlined,
                tint: colors.confidenceConfirmed,
                value: describeAppLockDelay(protection.appLockDelay),
                description: 'How long Action may be in the background before '
                    'it locks.',
                onTap: () => _chooseDelay(context, ref, protection.appLockDelay),
              ),
            SettingsRow(
              label: 'Screen privacy',
              icon: Icons.visibility_off_outlined,
              tint: colors.confidenceReview,
              description: 'Ask Android to block screenshots and screen '
                  'recording, and to hide Action in the app switcher.',
              trailing: Switch(
                value: protection.screenPrivacyEnabled,
                onChanged: (want) => _toggleScreenPrivacy(context, ref, want),
              ),
            ),
            SettingsRow(
              label: 'Private reminders',
              icon: Icons.notifications_off_outlined,
              tint: colors.urgencyImportant,
              description: protection.privateNotifications
                  ? 'Reminders say only that something needs you.'
                  : 'Reminders show the Action title. Turn this on to keep it '
                      'off your lock screen.',
              trailing: Switch(
                value: protection.privateNotifications,
                onChanged: (want) =>
                    _togglePrivateNotifications(context, ref, want),
              ),
            ),
            if (protection.appLockEnabled)
              SettingsRow(
                label: 'Lock now',
                icon: Icons.lock_clock_outlined,
                tint: colors.confidenceConfirmed,
                description: 'Close the door without waiting.',
                onTap: () {
                  ref.read(appLockedProvider.notifier).lockNow();
                },
              ),
          ],
        ),
        _TransferSection(
          transfers: transfers,
          aiConfig: aiConfig,
          now: ref.watch(appClockProvider)(),
        ),
        SettingsSection(
          title: 'How your data is stored',
          children: const [
            _StorageFact(
              label: 'Your Actions, captures and settings',
              detail: 'They sit in this app\'s own private storage, which '
                  'other apps cannot read and which Android encrypts as part '
                  'of the device\'s encryption. Action does not add a second '
                  'layer of its own on top.',
            ),
            _StorageFact(
              label: 'Your AI provider key',
              detail: 'Held in the Android Keystore rather than with '
                  'everything else, and never shown again after you save it.',
            ),
            _StorageFact(
              label: 'What that does not cover',
              detail: 'None of it is a defence against someone using your '
                  'unlocked device, and a modified or rooted system can read '
                  'more than a normal one. App Lock is the control that helps '
                  'with the first of those.',
            ),
          ],
        ),
        SettingsSection(
          title: 'Your information',
          children: [
            SettingsRow(
              label: 'Where your information lives',
              icon: Icons.travel_explore_outlined,
              tint: colors.confidenceReview,
              description: 'Every route your data can take, and the two that '
                  'leave this device.',
              onTap: () => context.push(Routes.settingsPrivacy),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _toggleAppLock(
    BuildContext context,
    WidgetRef ref,
    bool want,
  ) async {
    final result =
        await ref.read(protectionSettingsProvider.notifier).setAppLock(want);
    if (!context.mounted) return;

    // Each outcome gets its own sentence; "that didn't work" would leave
    // someone with no screen lock guessing forever.
    final message = switch (result) {
      AppLockChangeResult.changed || AppLockChangeResult.unchanged => null,
      AppLockChangeResult.refused =>
        'Not confirmed, so nothing changed.',
      AppLockChangeResult.unavailable =>
        'This device has no screen lock set up. Add a PIN, pattern, password '
            'or fingerprint in your device settings, then try again.',
    };
    if (message != null) _say(context, message);
  }

  Future<void> _toggleScreenPrivacy(
    BuildContext context,
    WidgetRef ref,
    bool want,
  ) async {
    final applied = await ref
        .read(protectionSettingsProvider.notifier)
        .setScreenPrivacy(want);
    if (!context.mounted || applied) return;
    _say(
      context,
      'This device would not apply screen privacy, so it has been left off '
      'rather than shown as on.',
    );
  }

  Future<void> _togglePrivateNotifications(
    BuildContext context,
    WidgetRef ref,
    bool want,
  ) async {
    await ref
        .read(protectionSettingsProvider.notifier)
        .setPrivateNotifications(want);

    // Reminders already armed carry their old wording inside Android's alarm
    // queue. Without this pass the setting would only apply to reminders
    // created from now on, which is not what the switch says it does.
    final report =
        await ref.read(reminderReconcilerProvider).reconcile(rearmAll: true);
    if (!context.mounted) return;
    if (report.restored > 0) {
      _say(
        context,
        want
            ? '${report.restored} scheduled ${report.restored == 1 ? 'reminder' : 'reminders'} updated to say less.'
            : '${report.restored} scheduled ${report.restored == 1 ? 'reminder' : 'reminders'} updated.',
      );
    }
  }

  Future<void> _chooseDelay(
    BuildContext context,
    WidgetRef ref,
    AppLockDelay current,
  ) async {
    final chosen = await showModalBottomSheet<AppLockDelay>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => AppSheet(
        title: 'Ask again',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final delay in AppLockDelay.values)
                _DelayOption(
                  label: describeAppLockDelay(delay),
                  description: switch (delay) {
                    AppLockDelay.immediately =>
                      'Every time Action leaves the screen',
                    AppLockDelay.afterOneMinute =>
                      'Long enough to answer a message',
                    AppLockDelay.afterFiveMinutes =>
                      'Long enough to take a call',
                  },
                  selected: delay == current,
                  onTap: () => Navigator.of(sheetContext).pop(delay),
                ),
            ],
          ),
        ),
      ),
    );
    if (chosen == null) return;
    await ref.read(protectionSettingsProvider.notifier).setAppLockDelay(chosen);
  }

  static void _say(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

/// What is protecting the user right now, in words.
///
/// Not a score, not a percentage, and not a shield that turns green. Those
/// invite the user to optimise a number rather than read what it means, and
/// "82% secure" would be a claim nothing here can support.
class _StatusHero extends StatelessWidget {
  const _StatusHero({required this.protection});

  final ProtectionSettings protection;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final active = protection.activeCount;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, 0, Space.page, Space.xs),
      child: AmbientGlow(
        colour: colors.confidenceConfirmed,
        child: GlassSurface(
          intensity: GlassIntensity.hero,
          padding: const EdgeInsets.all(Space.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    active > 0
                        ? Icons.shield_outlined
                        : Icons.shield_moon_outlined,
                    size: 16,
                    color: colors.confidenceConfirmed,
                  ),
                  const SizedBox(width: Space.sm),
                  // Flexible: at 1.8x text "NOTHING TURNED ON" is wider than
                  // the hero, and an eyebrow is not worth an overflow.
                  Flexible(
                    child: Text(
                      active > 0 ? 'PROTECTED' : 'NOTHING TURNED ON',
                      overflow: TextOverflow.ellipsis,
                      style: text.labelSmall?.copyWith(
                        color: colors.confidenceConfirmed,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Space.md),
              Text(_headline(protection), style: text.titleLarge),
              const SizedBox(height: Space.sm),
              Text(
                'Everything here works on this device. None of these settings '
                'is sent anywhere, and none of them can be changed remotely.',
                style: text.bodyMedium?.copyWith(color: colors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _headline(ProtectionSettings protection) {
    final on = <String>[
      if (protection.appLockEnabled) 'App Lock',
      if (protection.screenPrivacyEnabled) 'Screen privacy',
      if (protection.privateNotifications) 'Private reminders',
    ];
    return switch (on.length) {
      0 => 'Three protections are available',
      1 => '${on.single} is on',
      2 => '${on.first} and ${on.last} are on',
      _ => 'All three protections are on',
    };
  }
}

/// The receipts.
class _TransferSection extends ConsumerWidget {
  const _TransferSection({
    required this.transfers,
    required this.aiConfig,
    required this.now,
  });

  final AsyncValue<List<ActivityEntry>> transfers;
  final AiProviderConfig? aiConfig;

  /// From the app clock rather than `DateTime.now()`, so "30m ago" is a
  /// property a test can assert rather than a race with the wall clock.
  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final entries = transfers.value ?? const <ActivityEntry>[];
    final shown = entries.take(6).toList();

    return SettingsSection(
      title: 'What left this device',
      footnote: aiConfig == null
          ? 'No AI provider is connected, so nothing is being sent for '
              'analysis at all.'
          : 'Recorded here the moment something is sent, whether or not it '
              'came back. Only the tool, the provider and the size — never '
              'what was in it. Kept for 90 days on this device and sent '
              'nowhere.',
      trailing: entries.isEmpty
          ? null
          : TextButton(
              onPressed: () => _confirmClear(context, ref),
              child: const Text('Clear'),
            ),
      children: [
        if (shown.isEmpty)
          SettingsRow(
            label: 'Nothing has been sent',
            icon: Icons.cloud_off_outlined,
            tint: colors.textTertiary,
            description: 'When you run a tool that uses your AI provider, it '
                'will be listed here.',
          )
        else
          for (final entry in shown) _TransferRow(entry: entry, now: now),
      ],
    );
  }

  Future<void> _confirmClear(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Clear this history?'),
        content: const Text(
          'The record of what was sent will be deleted from this device. It '
          'does not undo anything that was already sent.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(activityRecorderProvider).clear();
  }
}

class _TransferRow extends StatelessWidget {
  const _TransferRow({required this.entry, required this.now});

  final ActivityEntry entry;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // Ids are resolved to names here rather than stored as names. The journal
    // holds only identifiers, which is what keeps content out of it.
    final tool = entry.toolId == null
        ? null
        : ToolRegistry.byId(entry.toolId!)?.title;
    final provider = entry.providerId == null
        ? null
        : AiProviderKind.fromId(entry.providerId!)?.label;

    return SettingsRow(
      label: tool ?? 'An Intelligence tool',
      icon: Icons.north_east_rounded,
      tint: colors.confidenceReview,
      description: _describe(entry, provider),
      value: _relative(entry.at, now),
    );
  }

  static String _describe(ActivityEntry entry, String? provider) {
    final size = <String>[
      if (entry.pages > 0) '${entry.pages} ${entry.pages == 1 ? 'page' : 'pages'}',
      if (entry.attachments > 0 && entry.pages == 0)
        '${entry.attachments} ${entry.attachments == 1 ? 'file' : 'files'}',
      if (entry.textCharacters > 0) _characters(entry.textCharacters),
    ];
    final to = provider ?? 'your AI provider';
    if (size.isEmpty) return 'Sent to $to.';
    return 'Sent to $to · ${size.join(' · ')}.';
  }

  /// Rounded, because the exact character count of a document is closer to
  /// being a fingerprint of it than the reader needs.
  static String _characters(int count) {
    if (count < 1000) return 'a short piece of text';
    return '${(count / 1000).round()}k characters';
  }

  static String _relative(DateTime at, DateTime now) {
    final difference = now.difference(at);
    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inHours < 1) return '${difference.inMinutes}m ago';
    if (difference.inDays < 1) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';
    return '${(difference.inDays / 7).floor()}w ago';
  }
}

/// A statement of fact about storage, with no control attached.
class _StorageFact extends StatelessWidget {
  const _StorageFact({required this.label, required this.detail});

  final String label;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.sm, Space.md, Space.sm, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: text.titleSmall),
          const SizedBox(height: Space.xxs),
          Text(
            detail,
            style: text.bodySmall?.copyWith(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _DelayOption extends StatelessWidget {
  const _DelayOption({
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
              if (selected)
                Icon(Icons.check_rounded, size: 20, color: colors.brand),
            ],
          ),
        ),
      ),
    );
  }
}
