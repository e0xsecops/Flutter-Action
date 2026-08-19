import 'package:flutter/material.dart';

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
    return SettingsPage(
      title: 'Help',
      slivers: [
        SliverList.builder(
          itemCount: helpEntries.length,
          itemBuilder: (context, i) => _Entry(entry: helpEntries[i]),
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
const helpEntries = <({String question, String answer})>[
  (
    question: 'What can I add?',
    answer: 'A screenshot, a photo of a letter or bill, or text you paste in. '
        'Anything with a date, an amount or a request works best.',
  ),
  (
    question: 'Why does Action ask me to review?',
    answer: 'Because a machine reading a document can misread it, and a '
        'deadline that is quietly wrong is worse than no deadline at all. '
        'Action shows what it found and the words it came from, and nothing '
        'is saved until you confirm it.',
  ),
  (
    question: 'Why do the results change if I try again?',
    answer: 'The service that reads your document is not deterministic, so '
        'the same capture can come back slightly differently. That is also '
        'why the review step exists — you are the part that does not change.',
  ),
  (
    question: 'Why was my reminder late?',
    answer: 'Reminders are scheduled with Android, and Android decides '
        'exactly when to deliver them. Battery saving, Doze and '
        'manufacturer power settings can all delay one. Action never '
        'promises a reminder to the minute.',
  ),
  (
    question: 'Where is my data?',
    answer: 'Almost all of it is on this device: your captures, Actions, '
        'steps, reminders and searches. Two exceptions — the content you ask '
        'Action to read is sent to the AI service that reads it, and a short '
        'record of a confirmed Action may be stored in the cloud under an '
        'anonymous ID. Privacy & data in Settings lists exactly what that '
        'record contains.',
  ),
  (
    question: 'Is this a backup?',
    answer: 'No. The cloud record cannot be restored to a new device, and '
        'there is no account to sign in to. If you uninstall Action or lose '
        'this device, the data on it is gone.',
  ),
  (
    question: 'How do I correct an Action?',
    answer: 'Open it and edit any field — the title, the deadline, the '
        'amount or the suggested next step. You can add, reorder, complete '
        'and delete steps at any time. Editing an Action never asks the AI '
        'service anything.',
  ),
];
