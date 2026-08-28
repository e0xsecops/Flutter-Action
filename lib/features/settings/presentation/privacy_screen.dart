import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/privacy_deletion_service.dart';
import '../application/settings_providers.dart';
import 'settings_shell.dart';

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
    final owed = ref.watch(pendingCloudDeletionCountProvider);

    return SettingsPage(
      title: 'Privacy & data',
      slivers: [
        const SettingsProse(
          'Action keeps as much as it can on this device. Two things are '
          'exceptions, and they are both listed below.',
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
        for (final group in privacyDataMap) _Group(group: group),
        SettingsSection(
          title: 'Your data',
          footnote: 'Clearing captures leaves your Actions in place. An '
              'Action whose capture is gone still works; it simply no longer '
              'shows what it came from.',
          children: [
            SettingsRow(
              label: 'Clear captures',
              description: 'Deletes every capture and its image file.',
              onTap: _busy ? null : _confirmClearCaptures,
            ),
            SettingsRow(
              label: 'Delete all my data',
              description: 'Actions, steps, reminders, captures and the '
                  'cloud records above.',
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
    _say(left == null || left.isEmpty
        ? 'The cloud records have been deleted.'
        : 'Still could not reach them. Action will try again.');
  }

  Future<void> _confirmClearCaptures() async {
    final confirmed = await _confirm(
      title: 'Clear captures?',
      body: 'Every capture and its image will be deleted from this device. '
          'Your Actions stay exactly as they are.',
      confirmLabel: 'Clear captures',
    );
    if (confirmed != true || !mounted) return;

    setState(() => _busy = true);
    try {
      await ref.read(privacyDeletionServiceProvider).clearCaptures();
      if (!mounted) return;
      _say('Captures deleted.');
    } on Object {
      if (!mounted) return;
      _say('Some captures could not be deleted. Nothing else was changed.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _confirmDeleteEverything() async {
    final confirmed = await _confirm(
      title: 'Delete all your data?',
      body: 'This deletes every Action, step, reminder and capture on this '
          'device, and the cloud records listed above. It cannot be undone, '
          'and there is no backup to restore from.',
      confirmLabel: 'Delete everything',
      destructive: true,
    );
    if (confirmed != true || !mounted) return;

    setState(() => _busy = true);
    final outcome =
        await ref.read(privacyDeletionServiceProvider).deleteEverything();
    if (!mounted) return;
    setState(() => _busy = false);
    ref.invalidate(pendingCloudDeletionCountProvider);

    // Each outcome gets its own sentence. "Deleted" is only ever said when
    // it is actually true of both places.
    _say(switch (outcome) {
      DeletionComplete() => 'Everything has been deleted.',
      DeletionPartial(
        :final cloudCopiesRemaining,
        :final capturesRemain,
        :final cloudNotVerified,
      ) =>
        _partialMessage(
          cloudCopiesRemaining,
          capturesRemain,
          cloudNotVerified,
        ),
      DeletionFailed() => 'Your data could not be deleted.',
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
  ) {
    final leftovers = <String>[
      if (capturesRemain) 'some captures',
      if (cloudRemaining > 0)
        '$cloudRemaining cloud ${cloudRemaining == 1 ? 'record' : 'records'}',
    ];
    if (leftovers.isEmpty) {
      // Nothing known to be left, but the cloud went unchecked.
      return 'Everything on this device has been deleted. Action could not '
          'reach the cloud to confirm nothing is left there, and will check '
          'again.';
    }
    final tail = cloudNotVerified
        ? ' Action could not finish checking the cloud, and will try again.'
        : ' Action will try again.';
    return 'Deleted, apart from ${leftovers.join(' and ')}.$tail';
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
            child: const Text('Cancel'),
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
/// This is the copy that has to stay true to the code. It is a const in one
/// place so that a change to what the app actually does can be matched by a
/// change here, and so a test can read all of it at once.
const privacyDataMap = <({String title, List<String> lines})>[
  (
    title: 'On this device',
    lines: [
      'Captures — the screenshots, photos and text you add, and the text read '
          'out of them.',
      'Actions, their steps, facts and reminders.',
      'Search. Your searches run here, are never sent anywhere, and are not '
          'kept after you close the screen.',
    ],
  ),
  (
    title: 'Sent to be read',
    lines: [
      'When you ask Action to interpret a capture, that content is sent to '
          'the AI service that reads it. This is not on-device AI.',
      'It is sent only for the capture you chose, and only when you ask for '
          'it.',
    ],
  ),
  (
    title: 'Stored in the cloud',
    lines: [
      'When you confirm an Action, a short record of it may be saved under an '
          'anonymous ID belonging to this installation: its title, status, '
          'urgency, category, deadline, amount, suggested next step and '
          'timestamps.',
      'Your captures, the text read from them, an Action’s steps and facts, '
          'and your reminders are not sent.',
      'This is not a backup. There is no way to restore it to a new device, '
          'and losing this installation loses the anonymous ID with it.',
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
                  child: Text('Still to delete', style: text.titleSmall),
                ),
              ],
            ),
            const SizedBox(height: Space.sm),
            Text(
              '$count cloud ${count == 1 ? 'record' : 'records'} could not be '
              'reached last time. Action will try again on its own, or you '
              'can retry now.',
              style: text.bodySmall?.copyWith(color: colors.textSecondary),
            ),
            const SizedBox(height: Space.sm),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: busy ? null : () => onRetry(),
                child: const Text('Try again'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
