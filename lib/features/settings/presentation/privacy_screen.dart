import 'dart:async';

import 'package:flutter/material.dart';
import '../../../l10n/gen/app_l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/privacy_deletion_service.dart';
import '../application/settings_providers.dart';
import 'settings_shell.dart';
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';
import '../../../core/security/activity_journal.dart';
import '../../../core/security/activity_providers.dart';

/// Where your information lives — and the controls that act on it.
///
/// Every statement here was checked against the code that implements it:
/// `cloudPayloadFor` for what the mirror carries, `firestore.rules` for what
/// the server will even accept, `JsonFileSourceStore` and the source file
/// store for captures, the drift database for Actions and reminders, and
/// `ActionSearchService` for search. Where the wording and the code have ever
/// disagreed, the wording was wrong and was changed.
class PrivacyScreen extends ConsumerStatefulWidget {
  const PrivacyScreen({super.key});

  @override
  ConsumerState<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends ConsumerState<PrivacyScreen> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final owed = ref.watch(pendingCloudDeletionCountProvider);

    return SettingsPage(
      title: l10n.privacyTitle,
      slivers: [
        SettingsProse(
          l10n.privacyIntro,
          top: Space.lg,
        ),
        // Above the explanation, not after it. An outstanding deletion is
        // something the user is owed, and burying it under three sections of
        // prose would be a quiet way of not mentioning it.
        if (owed > 0)
          SliverToBoxAdapter(
            child: _PendingNotice(
              count: owed,
              busy: _busy,
              onRetry: _retryPending,
            ),
          ),
        for (final group in privacyDataMapIn(l10n)) _Group(group: group),
        SettingsSection(
          title: l10n.privacySectionYourData,
          footnote: l10n.privacyYourDataFootnote,
          children: [
            SettingsRow(
              label: l10n.privacyClearCaptures,
              description: l10n.privacyClearCapturesDescription,
              onTap: _busy ? null : _confirmClearCaptures,
            ),
            SettingsRow(
              label: l10n.privacyDeleteAll,
              description: l10n.privacyDeleteAllDescription,
              destructive: true,
              onTap: _busy ? null : _confirmDeleteEverything,
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _retryPending() async {
    setState(() => _busy = true);
    await ref.read(privacyDeletionServiceProvider).retryPendingCloudDeletion();
    if (!mounted) return;
    setState(() => _busy = false);
    ref.invalidate(pendingCloudDeletionCountProvider);
    final left = ref.read(privacyDeletionServiceProvider).pending;
    final l10n = AppL10n.of(context);
    _say(left == null || left.isEmpty
        ? l10n.privacyCloudDeleted
        : l10n.privacyCloudUnreachable);
  }

  Future<void> _confirmClearCaptures() async {
    final l10n = AppL10n.of(context);
    final confirmed = await _confirm(
      title: l10n.privacyClearCapturesTitle,
      body: l10n.privacyClearCapturesBody,
      confirmLabel: l10n.privacyClearCaptures,
    );
    if (confirmed != true || !mounted) return;

    setState(() => _busy = true);
    try {
      await ref.read(privacyDeletionServiceProvider).clearCaptures();
      await ref
          .read(activityRecorderProvider)
          .record(ActivityEvent.capturesCleared);
      if (!mounted) return;
      _say(l10n.privacyCapturesDeleted);
    } on Object {
      if (!mounted) return;
      _say(l10n.privacyCapturesPartlyDeleted);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _confirmDeleteEverything() async {
    final l10n = AppL10n.of(context);
    final confirmed = await _confirm(
      title: l10n.privacyDeleteAllTitle,
      body: l10n.privacyDeleteAllBody,
      confirmLabel: l10n.privacyDeleteEverything,
      destructive: true,
    );
    if (confirmed != true || !mounted) return;

    setState(() => _busy = true);
    final analytics = ref.read(appAnalyticsProvider);
    final activity = ref.read(activityRecorderProvider);
    unawaited(analytics.log(AnalyticsEvents.privacyDeleteStarted));
    // Recorded before the work starts. If deletion is interrupted, "you asked
    // for this on Tuesday" is exactly the record the user needs, and one
    // written only on success would not exist.
    unawaited(activity.record(ActivityEvent.dataDeletionRequested));
    final outcome =
        await ref.read(privacyDeletionServiceProvider).deleteEverything();
    // Counts only: whether it finished, and whether the cloud could be
    // accounted for. Never how many records, never which.
    unawaited(switch (outcome) {
      DeletionComplete() => analytics.log(
          AnalyticsEvents.privacyDeleteCompleted,
          parameters: {AnalyticsParams.deletionVerified: 'yes'},
        ),
      DeletionPartial(:final cloudNotVerified) => analytics.log(
          AnalyticsEvents.privacyDeletePartial,
          parameters: {
            AnalyticsParams.deletionVerified: cloudNotVerified ? 'no' : 'yes',
          },
        ),
      DeletionFailed(:final failureClass) => analytics.log(
          AnalyticsEvents.privacyDeletePartial,
          parameters: {AnalyticsParams.failureClass: failureClass},
        ),
    });

    if (outcome is DeletionComplete) {
      unawaited(activity.record(ActivityEvent.dataDeletionCompleted));
    }

    if (!mounted) return;
    setState(() => _busy = false);
    ref.invalidate(pendingCloudDeletionCountProvider);

    // Each outcome gets its own sentence. "Deleted" is only ever said when
    // it is actually true of both places.
    _say(switch (outcome) {
      DeletionComplete() => l10n.privacyDeletedAll,
      DeletionPartial(
        :final cloudCopiesRemaining,
        :final capturesRemain,
        :final cloudNotVerified,
      ) =>
        _partialMessage(
          cloudCopiesRemaining,
          capturesRemain,
          cloudNotVerified,
          l10n,
        ),
      DeletionFailed() => l10n.privacyDeleteFailed,
    });
  }

  /// Says which of the leftovers actually applies, rather than a single vague
  /// "partly deleted" that would leave the user guessing.
  ///
  /// Day 17 added a third case, and it is the subtle one. Everything on this
  /// device can be gone, every cloud record we could name can be gone, and
  /// the job can still be unfinished — because we could not reach the cloud
  /// to *check* whether a copy from an older install is still sitting there.
  /// Reporting that as "everything has been deleted" would be the exact lie
  /// this screen exists to avoid.
  static String _partialMessage(
    int cloudRemaining,
    bool capturesRemain,
    bool cloudNotVerified,
    AppL10n l10n,
  ) {
    final leftovers = <String>[
      if (capturesRemain) l10n.privacyLeftoverCaptures,
      if (cloudRemaining > 0)
        l10n.privacyLeftoverCloudRecords(cloudRemaining),
    ];
    if (leftovers.isEmpty) {
      // Nothing known to be left, but the cloud went unchecked.
      return l10n.privacyDeletedUnverified;
    }
    // Joined through a key rather than with a literal " and ": the
    // conjunction is a word, and two locales already put it elsewhere in the
    // sentence.
    final list = leftovers.length == 1
        ? leftovers.single
        : l10n.privacyLeftoverJoin(leftovers.first, leftovers.last);
    final tail = cloudNotVerified
        ? l10n.privacyCloudCheckIncomplete
        : l10n.privacyWillTryAgain;
    return '${l10n.privacyDeletedApartFrom(list)} $tail';
  }

  Future<bool?> _confirm({
    required String title,
    required String body,
    required String confirmLabel,
    bool destructive = false,
  }) {
    final colors = context.colors;
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(AppL10n.of(dialogContext).commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: destructive
                ? TextButton.styleFrom(foregroundColor: colors.danger)
                : null,
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  void _say(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

/// The data map, public so every line of it can be tested rather than only
/// the lines that happen to be on screen.
///
/// This is the copy that has to stay true to the code. It is assembled in one
/// place so that a change to what the app actually does can be matched by a
/// change here, and so a test can read all of it at once.
///
/// A function of the bundle rather than a `const`, because these lines are now
/// translated — and they are the lines where a translation that loses a clause
/// stops being a disclosure. `critical_copy_test.dart` holds every one of them
/// to its English length and to the reassurance words it may not use.
List<({String title, List<String> lines})> privacyDataMapIn(AppL10n l10n) => [
      (
        title: l10n.privacyGroupOnDevice,
        lines: [
          l10n.privacyOnDeviceCaptures,
          l10n.privacyOnDeviceActions,
          l10n.privacyOnDeviceSearch,
          // Added when the normalizer was found to be storing EXIF verbatim:
          // a phone photo carries the coordinates of wherever it was taken,
          // and Action was keeping them and forwarding them with the image.
          // Both halves are asserted in test/capture/image_metadata_test.dart.
          l10n.privacyOnDevicePhotoMetadata,
        ],
      ),
      (
        title: l10n.privacyGroupSentToRead,
        lines: [
          l10n.privacySentToReadWhat,
          l10n.privacySentToReadWhen,
        ],
      ),
      // V2. The BYOK layer sends content to a third party the user chose, using
      // their own credential. That is a genuinely different data route from the
      // built-in reader above, and collapsing the two into one reassuring
      // paragraph would be the exact dishonesty this screen exists to avoid.
      (
        title: l10n.privacyGroupYourProvider,
        lines: [
          l10n.privacyProviderWhat,
          l10n.privacyProviderDirect,
          l10n.privacyProviderScope,
          l10n.privacyProviderKey,
          l10n.privacyProviderLocalTools,
          l10n.privacyProviderAgreement,
        ],
      ),
      (
        title: l10n.privacyGroupCloud,
        lines: [
          l10n.privacyCloudWhat,
          l10n.privacyCloudNotSent,
          l10n.privacyCloudNotBackup,
        ],
      ),
      // Day 18. Written to be checkable against the code rather than
      // reassuring: every claim here corresponds to something the analytics
      // contract enforces, and the tests fail if it stops being true.
      (
        title: l10n.privacyGroupDiagnostics,
        lines: [
          l10n.privacyDiagnosticsWhat,
          l10n.privacyDiagnosticsCounts,
          l10n.privacyDiagnosticsCrash,
        ],
      ),
    ];

class _Group extends StatelessWidget {
  const _Group({required this.group});

  final ({String title, List<String> lines}) group;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.page, Space.xl, Space.page, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              header: true,
              child: Text(group.title, style: text.titleMedium),
            ),
            const SizedBox(height: Space.md),
            for (final line in group.lines)
              Padding(
                padding: const EdgeInsets.only(bottom: Space.md),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: Space.md),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: colors.textTertiary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        line,
                        style: text.bodyMedium
                            ?.copyWith(color: colors.textSecondary),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Shown only when a previous deletion left cloud records behind. Saying
/// nothing here would let "everything has been deleted" quietly become true
/// in the user's memory and false in fact.
class _PendingNotice extends StatelessWidget {
  const _PendingNotice({
    required this.count,
    required this.busy,
    required this.onRetry,
  });

  final int count;
  final bool busy;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.xl, Space.page, 0),
      child: Container(
        padding: const EdgeInsets.all(Space.lg),
        decoration: BoxDecoration(
          color: colors.surfaceElevated,
          borderRadius: Radii.rMd,
          border:
              Border.all(color: colors.urgencyImportant, width: Strokes.hairline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cloud_off_outlined,
                    size: 18, color: colors.urgencyImportant),
                const SizedBox(width: Space.sm),
                Expanded(
                  child: Text(l10n.privacyPendingTitle,
                      style: text.titleSmall),
                ),
              ],
            ),
            const SizedBox(height: Space.sm),
            Text(
              l10n.privacyPendingBody(count),
              style: text.bodySmall?.copyWith(color: colors.textSecondary),
            ),
            const SizedBox(height: Space.sm),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: busy ? null : () => onRetry(),
                child: Text(l10n.privacyTryAgain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
