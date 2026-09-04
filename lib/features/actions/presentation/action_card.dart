/// The Action card, shared by Today and Library.
///
/// **Why it moved out of Home.** The card was a private widget inside
/// `home_screen.dart`, so Library could not show an Action without either
/// duplicating it or importing a screen. Anything two destinations both render
/// belongs to neither of them.
///
/// **The hierarchy.** A row that reads "title, then a grey metadata line" tells
/// the user what the thing is called and nothing about why it is in front of
/// them. This card answers three questions in a fixed order:
///
///   WHY NOW      the triage badge — OVERDUE, DUE TODAY, CRITICAL
///   WHAT         the title
///   WHAT NEXT    the next incomplete step, or the reviewed recommendation
///
/// The eyebrow comes first deliberately. In a list you scan the left column top
/// to bottom, and "OVERDUE" is the word that decides whether you stop.
///
/// **Not glass.** These appear in scrolling lists, and a `BackdropFilter` per
/// row is exactly how the Day-16 performance work gets given back. Cards are a
/// solid elevated surface with a hairline; glass is for chrome only.
library;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../design/tokens/typography.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_l10n.dart';
import '../application/action_providers.dart';
import '../application/action_triage.dart';
import '../application/triage_labels.dart';
import '../domain/action_item.dart';
import '../../extraction/domain/extraction_schema.dart';

class ActionCard extends ConsumerWidget {
  const ActionCard({
    super.key,
    required this.item,
    required this.now,
    this.decision,
    this.showNextStep = true,
  });

  final ActionItem item;
  final DateTime now;

  /// The triage decision, where one exists. Library shows cards outside the
  /// triage groups, so this is optional rather than required.
  final ActionTriageDecision? decision;

  /// Suppressed in dense contexts where the next step would be noise.
  final bool showNextStep;

  /// Whether the triage badge already says where the deadline stands.
  ///
  /// "Critical" and "All steps done" say nothing about a date, so those cards
  /// still want "Due 23 Aug" on the meta line.
  bool get _badgeStatesDue => switch (decision?.primaryReason) {
        TriageReason.overdue ||
        TriageReason.dueToday ||
        TriageReason.dueTomorrow =>
          true,
        _ => false,
      };

  /// The next thing to actually do.
  ///
  /// The first incomplete step if the Action has a chain, otherwise the
  /// reviewed recommendation. Never invented: both come from data the user
  /// confirmed.
  String? get _nextStep {
    for (final step in item.steps) {
      if (!step.isCompleted) return step.title;
    }
    if (item.steps.isNotEmpty) return null;
    final recommended = item.recommendedNextStep?.trim();
    return (recommended == null || recommended.isEmpty) ? null : recommended;
  }

  void _explain(BuildContext context, ActionTriageDecision decision) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(TriageLabels.explanation(decision, item, now))),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final completed = item.status == ActionStatus.completed;

    final spine = switch (item.urgency) {
      ActionUrgency.critical => colors.urgencyCritical,
      ActionUrgency.important => colors.urgencyImportant,
      ActionUrgency.normal => colors.urgencyNormal,
      ActionUrgency.low || ActionUrgency.unknown => colors.urgencyLow,
    };

    final badge = decision == null
        ? null
        : TriageLabels.badge(decision!, item, now);
    final tone = switch (decision?.primaryReason) {
      TriageReason.overdue => colors.urgencyCritical,
      TriageReason.dueToday ||
      TriageReason.criticalDueSoon ||
      TriageReason.criticalNoDeadline =>
        colors.urgencyImportant,
      _ => colors.textSecondary,
    };

    final next = showNextStep && !completed ? _nextStep : null;

    return Material(
      color: colors.surfaceElevated,
      borderRadius: Radii.rLg,
      child: InkWell(
        // The card opens the Action; the completion toggle keeps its own hit
        // target inside it, so finishing something never costs a navigation.
        onTap: () => context.push(Routes.action(item.id)),
        borderRadius: Radii.rLg,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Radii.rLg,
            border: Border.all(color: colors.border, width: Strokes.hairline),
          ),
          padding: const EdgeInsetsDirectional.fromSTEB(0, Space.md, Space.xs, Space.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Strokes.spine,
                height: 44,
                margin: const EdgeInsetsDirectional.only(start: Space.md),
                decoration: BoxDecoration(
                  color: completed ? colors.border : spine,
                  borderRadius: BorderRadius.circular(Radii.pill),
                ),
              ),
              const SizedBox(width: Space.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // WHY NOW — first, because it is the word that decides
                    // whether the reader stops here. Tapping explains in a
                    // full sentence: a colour is not an explanation.
                    if (badge != null)
                      Semantics(
                        label:
                            TriageLabels.semanticLabel(decision!, item, now),
                        button: true,
                        child: InkWell(
                          onTap: () => _explain(context, decision!),
                          borderRadius: Radii.rSm,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: Space.xxs),
                            child: Text(
                              badge,
                              style: text.labelSmall?.copyWith(
                                color: tone,
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),

                    // WHAT
                    Text(
                      item.title,
                      style: text.titleMedium?.copyWith(
                        color: completed
                            ? colors.textTertiary
                            : colors.textPrimary,
                        decoration:
                            completed ? TextDecoration.lineThrough : null,
                        decorationColor: colors.textTertiary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // WHAT NEXT
                    if (next != null)
                      Padding(
                        padding: const EdgeInsets.only(top: Space.xxs),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Icon(
                                Icons.subdirectory_arrow_right_rounded,
                                size: 14,
                                color: colors.textTertiary,
                              ),
                            ),
                            const SizedBox(width: Space.xs),
                            Expanded(
                              child: Text(
                                next,
                                style: text.bodySmall
                                    ?.copyWith(color: colors.textSecondary),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: Space.xxs),
                    ActionMetaLine(
                      item: item,
                      // The badge owns the deadline story when it has one, so
                      // the meta line does not repeat it. "Overdue · was due
                      // 14 Aug" above "OVERDUE · 4 DAYS" is the same fact twice.
                      suppressDue: _badgeStatesDue,
                    ),
                  ],
                ),
              ),
              IconButton(
                // Named, because a screen reader announcing "Mark as done"
                // three times in a list says nothing about which of the three
                // is about to be marked.
                tooltip: completed
                    ? 'Completed: ${item.title}'
                    : 'Mark "${item.title}" as done',
                onPressed: completed
                    ? null
                    : () async {
                        await ref
                            .read(actionRepositoryProvider)
                            .complete(item.id, at: DateTime.now());
                        ref
                            .read(appAnalyticsProvider)
                            .log(AnalyticsEvents.actionCompleted);
                        unawaited(ref.read(actionSyncServiceProvider).flush());
                      },
                icon: Icon(
                  completed
                      ? Icons.check_circle_outline_rounded
                      : Icons.radio_button_unchecked_rounded,
                  color: completed
                      ? colors.confidenceConfirmed
                      : colors.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The one-line summary under an Action title: deadline, amount, or category.
///
/// Public because Today, Library and any future surface that lists Actions all
/// need exactly this line, and three copies of it would drift.
class ActionMetaLine extends StatelessWidget {
  const ActionMetaLine({super.key, required this.item, this.suppressDue = false});

  final ActionItem item;

  /// True when the triage badge already states the deadline relation, so
  /// repeating it here would be the same fact twice.
  final bool suppressDue;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final l10n = AppL10n.of(context);
    final now = DateTime.now();

    final parts = <InlineSpan>[];
    final due = item.dueAt;
    if (item.status == ActionStatus.completed) {
      parts.add(TextSpan(
        text: l10n.metaDone(
          relativeTime(l10n, item.completedAt ?? item.updatedAt),
        ),
      ));
    } else if (due != null && !suppressDue) {
      final startOfToday = DateTime(now.year, now.month, now.day);
      final overdue = due.wallClock.isBefore(startOfToday);
      final dueToday = !overdue &&
          due.wallClock.isBefore(startOfToday.add(const Duration(days: 1)));
      final label = overdue
          ? l10n.metaOverdue(
              DateFormat(l10n.dateShortFormat, l10n.localeName)
                  .format(due.wallClock),
            )
          : dueToday
              ? l10n.metaDueToday
              : l10n.metaDueOn(
                  DateFormat(
                    due.wallClock.year == now.year
                        ? l10n.dateShortFormat
                        : l10n.dateLongFormat,
                    l10n.localeName,
                  ).format(due.wallClock),
                );
      parts.add(TextSpan(
        text: label,
        style: overdue || dueToday
            ? text.bodySmall?.copyWith(color: colors.urgencyCritical)
            : null,
      ));
    }
    if (item.amount != null) {
      if (parts.isNotEmpty) parts.add(const TextSpan(text: '  ·  '));
      parts.add(TextSpan(text: '${item.amount}'));
    }
    if (parts.isEmpty) {
      // Nothing to summarise. A manually created Action has no category
      // either, and its label would read "Not sure" — a doubt the app has no
      // business claiming about something the user typed themselves.
      parts.add(TextSpan(
        text: item.origin == ActionOrigin.manual
            ? l10n.metaCreatedByYou
            : item.category.labelIn(l10n),
      ));
    }

    return Text.rich(
      TextSpan(children: parts),
      style: text.bodySmall?.copyWith(fontFeatures: AppText.numeric),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// "Just now", "3h ago", "Yesterday", "14 Aug".
///
/// Takes the bundle rather than a `BuildContext` so it stays callable from
/// anywhere that already has one, and so the date at the end is formatted for
/// the same locale the words before it are written in.
String relativeTime(AppL10n l10n, DateTime when) {
  final diff = DateTime.now().difference(when);
  if (diff.inMinutes < 1) return l10n.relativeJustNow;
  if (diff.inMinutes < 60) return l10n.relativeMinutes(diff.inMinutes);
  if (diff.inHours < 24) return l10n.relativeHours(diff.inHours);
  if (diff.inDays == 1) return l10n.relativeYesterday;
  if (diff.inDays < 7) return l10n.relativeDays(diff.inDays);
  return DateFormat(l10n.dateShortFormat, l10n.localeName).format(when);
}
