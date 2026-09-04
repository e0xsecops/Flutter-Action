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
import '../../../l10n/gen/app_l10n.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/casing.dart';
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
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final protection = ref.watch(protectionSettingsProvider);
    final available = ref.watch(appLockAvailableProvider);
    final aiConfig = ref.watch(aiProviderConfigProvider);
    final transfers = ref.watch(dataTransfersProvider);

    return SettingsPage(
      title: l10n.securityTitle,
      slivers: [
        SliverToBoxAdapter(child: _StatusHero(protection: protection)),
        SettingsSection(
          title: l10n.securitySectionProtection,
          children: [
            SettingsRow(
              label: l10n.protectionAppLock,
              icon: Icons.lock_outline_rounded,
              tint: colors.confidenceConfirmed,
              // The unavailable explanation belongs to this row, not to the
              // section. As a footnote under all three it read as though a
              // missing screen lock disabled every protection on the page.
              description: switch (available.value) {
                false => l10n.securityAppLockUnavailable,
                _ => protection.appLockEnabled
                    ? l10n.securityAppLockOn
                    : l10n.securityAppLockOff,
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
                label: l10n.securityAskAgain,
                icon: Icons.timer_outlined,
                tint: colors.confidenceConfirmed,
                value: protection.appLockDelay.labelIn(l10n),
                description: l10n.securityAskAgainDescription,
                onTap: () => _chooseDelay(context, ref, protection.appLockDelay),
              ),
            SettingsRow(
              label: l10n.securityScreenPrivacy,
              icon: Icons.visibility_off_outlined,
              tint: colors.confidenceReview,
              description: l10n.securityScreenPrivacyDescription,
              trailing: Switch(
                value: protection.screenPrivacyEnabled,
                onChanged: (want) => _toggleScreenPrivacy(context, ref, want),
              ),
            ),
            SettingsRow(
              label: l10n.securityPrivateReminders,
              icon: Icons.notifications_off_outlined,
              tint: colors.urgencyImportant,
              description: protection.privateNotifications
                  ? l10n.securityPrivateRemindersOn
                  : l10n.securityPrivateRemindersOff,
              trailing: Switch(
                value: protection.privateNotifications,
                onChanged: (want) =>
                    _togglePrivateNotifications(context, ref, want),
              ),
            ),
            if (protection.appLockEnabled)
              SettingsRow(
                label: l10n.securityLockNow,
                icon: Icons.lock_clock_outlined,
                tint: colors.confidenceConfirmed,
                description: l10n.securityLockNowDescription,
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
          title: l10n.securitySectionStorage,
          children: [
            _StorageFact(
              label: l10n.securityStorageDataLabel,
              detail: l10n.securityStorageDataDetail,
            ),
            _StorageFact(
              label: l10n.securityStorageKeyLabel,
              detail: l10n.securityStorageKeyDetail,
            ),
            _StorageFact(
              label: l10n.securityStorageGapLabel,
              detail: l10n.securityStorageGapDetail,
            ),
          ],
        ),
        SettingsSection(
          title: l10n.securitySectionInformation,
          children: [
            SettingsRow(
              label: l10n.settingsWhereInfoLives,
              icon: Icons.travel_explore_outlined,
              tint: colors.confidenceReview,
              description: l10n.securityWhereInfoDescription,
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
    final l10n = AppL10n.of(context);
    final message = switch (result) {
      AppLockChangeResult.changed || AppLockChangeResult.unchanged => null,
      AppLockChangeResult.refused => l10n.securityAppLockRefused,
      AppLockChangeResult.unavailable => l10n.securityAppLockUnavailableToast,
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
      AppL10n.of(context).securityScreenPrivacyRefused,
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
            ? AppL10n.of(context)
                .securityRemindersUpdatedQuiet(report.restored)
            : AppL10n.of(context).securityRemindersUpdated(report.restored),
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
        title: AppL10n.of(sheetContext).securityAskAgain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final delay in AppLockDelay.values)
                _DelayOption(
                  label: delay.labelIn(AppL10n.of(sheetContext)),
                  description: switch (delay) {
                    AppLockDelay.immediately => AppL10n.of(sheetContext)
                        .securityDelayImmediatelyDescription,
                    AppLockDelay.afterOneMinute => AppL10n.of(sheetContext)
                        .securityDelayOneMinuteDescription,
                    AppLockDelay.afterFiveMinutes => AppL10n.of(sheetContext)
                        .securityDelayFiveMinutesDescription,
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
    final l10n = AppL10n.of(context);
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
                      eyebrowCase(
                        active > 0
                            ? l10n.securityHeroProtected
                            : l10n.securityHeroNothingOn,
                        l10n.localeName,
                      ),
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
              Text(_headline(protection, l10n), style: text.titleLarge),
              const SizedBox(height: Space.sm),
              Text(
                l10n.securityHeroFootnote,
                style: text.bodyMedium?.copyWith(color: colors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _headline(ProtectionSettings protection, AppL10n l10n) {
    final on = <String>[
      if (protection.appLockEnabled) l10n.protectionAppLock,
      if (protection.screenPrivacyEnabled) l10n.securityScreenPrivacy,
      if (protection.privateNotifications) l10n.securityPrivateReminders,
    ];
    return switch (on.length) {
      0 => l10n.securityHeadlineNone,
      1 => l10n.securityHeadlineOne(on.single),
      2 => l10n.securityHeadlineTwo(on.first, on.last),
      _ => l10n.securityHeadlineAll,
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
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final entries = transfers.value ?? const <ActivityEntry>[];
    final shown = entries.take(6).toList();

    return SettingsSection(
      title: l10n.securityTransfersTitle,
      footnote: aiConfig == null
          ? l10n.securityTransfersNoProvider
          : l10n.securityTransfersDescription,
      trailing: entries.isEmpty
          ? null
          : TextButton(
              onPressed: () => _confirmClear(context, ref),
              child: Text(l10n.securityClear),
            ),
      children: [
        if (shown.isEmpty)
          SettingsRow(
            label: l10n.securityNothingSent,
            icon: Icons.cloud_off_outlined,
            tint: colors.textTertiary,
            description: l10n.securityNothingSentDescription,
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
        title: Text(AppL10n.of(dialogContext).securityClearHistoryTitle),
        content: Text(
          AppL10n.of(dialogContext).securityClearHistoryBody,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(AppL10n.of(dialogContext).commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(AppL10n.of(dialogContext).securityClear),
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
    final l10n = AppL10n.of(context);
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
      label: tool ?? l10n.securityUnnamedTool,
      icon: Icons.north_east_rounded,
      tint: colors.confidenceReview,
      description: _describe(entry, provider, l10n),
      value: _relative(entry.at, now, l10n),
    );
  }

  static String _describe(
    ActivityEntry entry,
    String? provider,
    AppL10n l10n,
  ) {
    final size = <String>[
      if (entry.pages > 0) l10n.securityTransferPages(entry.pages),
      if (entry.attachments > 0 && entry.pages == 0)
        l10n.securityTransferFiles(entry.attachments),
      if (entry.textCharacters > 0)
        _characters(entry.textCharacters, l10n),
    ];
    final to = provider ?? l10n.securityYourProvider;
    if (size.isEmpty) return l10n.securitySentTo(to);
    return l10n.securitySentToWithSize(to, size.join(' · '));
  }

  /// Rounded, because the exact character count of a document is closer to
  /// being a fingerprint of it than the reader needs.
  static String _characters(int count, AppL10n l10n) {
    if (count < 1000) return l10n.securityTransferShortText;
    return l10n.securityTransferCharacters((count / 1000).round());
  }

  static String _relative(DateTime at, DateTime now, AppL10n l10n) {
    final difference = now.difference(at);
    if (difference.inMinutes < 1) return l10n.relativeJustNow;
    if (difference.inHours < 1) return l10n.relativeMinutes(difference.inMinutes);
    if (difference.inDays < 1) return l10n.relativeHours(difference.inHours);
    if (difference.inDays < 7) return l10n.relativeDays(difference.inDays);
    return l10n.relativeWeeks((difference.inDays / 7).floor());
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
