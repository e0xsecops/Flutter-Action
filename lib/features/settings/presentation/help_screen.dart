import 'package:flutter/material.dart';
import '../../../l10n/gen/app_l10n.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import 'settings_shell.dart';

/// Seven questions someone actually asks, answered once each.
///
/// Not an FAQ encyclopedia and not a support channel: this app has no support
/// address yet, so it does not invent one. Every answer here is something the
/// product genuinely does — several of them exist precisely because the honest
/// answer ("results vary", "a reminder can be late") is one a marketing page
/// would leave out.
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    return SettingsPage(
      title: l10n.helpTitle,
      slivers: [
        Builder(
          builder: (context) {
            final entries = helpEntriesIn(AppL10n.of(context));
            return SliverList.builder(
              itemCount: entries.length,
              itemBuilder: (context, i) => _Entry(entry: entries[i]),
            );
          },
        ),
      ],
    );
  }
}

class _Entry extends StatelessWidget {
  const _Entry({required this.entry});

  final ({String question, String answer}) entry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.xl, Space.page, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(entry.question, style: text.titleMedium),
          ),
          const SizedBox(height: Space.sm),
          Text(
            entry.answer,
            style: text.bodyMedium?.copyWith(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}

/// Public so the copy can be tested as a whole.
///
/// A lazily-built list only renders what fits on screen, so a widget test can
/// only ever assert about the top of it. Copy this product must not contain —
/// an invented support address, a promise of guaranteed delivery — has to be
/// checked across every word, not just the visible ones.
///
/// A function of the bundle rather than a `const`, because the answers are
/// now translated. The list is still one object a test can read end to end,
/// in whichever language it asks for.
List<({String question, String answer})> helpEntriesIn(AppL10n l10n) => [
      (question: l10n.helpAddQuestion, answer: l10n.helpAddAnswer),
      (question: l10n.helpReviewQuestion, answer: l10n.helpReviewAnswer),
      (question: l10n.helpVaryQuestion, answer: l10n.helpVaryAnswer),
      (question: l10n.helpLateQuestion, answer: l10n.helpLateAnswer),
      (question: l10n.helpDataQuestion, answer: l10n.helpDataAnswer),
      (question: l10n.helpBackupQuestion, answer: l10n.helpBackupAnswer),
      (question: l10n.helpCorrectQuestion, answer: l10n.helpCorrectAnswer),
    ];
