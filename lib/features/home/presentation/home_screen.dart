/// Today — what requires you, what to do next, what is coming.
///
/// **What changed in V2 and why.** The previous Home was a greeting, a date,
/// three small icons and a triaged list. On device it was more than half empty
/// canvas, the largest element on screen was the word "Good evening", and a new
/// user was told only what was *absent*: "Nothing needs your attention". None
/// of the app's actual capability — reading documents, finding deadlines,
/// keeping evidence, the Intelligence tools — was visible anywhere.
///
/// Today now answers four questions in order, and only shows a section when it
/// has something in it:
///
///   WHAT REQUIRES ME?       the brief, and the one Action it points at
///   WHAT SHOULD I DO NEXT?  that Action's next step, on the hero
///   WHAT IS WAITING?        captures read but not yet acted on
///   WHAT IS COMING?         upcoming deadlines
///
/// **The brief is deterministic.** Every number and sentence comes from
/// [ActionBrief], which counts triaged Actions and unreviewed captures. No
/// model, no score, no network. The first screen of the app must be true and
/// instant.
library;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../app/action_shell.dart';
import '../../../app/router.dart';
import '../../../design/components/glass_surface.dart';
import '../../../design/components/readable_width.dart';
import '../../../design/components/section_header.dart';
import '../../../design/ambient/ambient_background.dart';
import '../../../design/tokens/colors.dart';
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';
import '../../../design/tokens/dimens.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_view.dart';
import '../../actions/application/action_providers.dart';
import '../../actions/application/action_triage.dart';
import '../../actions/application/triage_labels.dart';
import '../../actions/domain/action_item.dart';
import '../../actions/presentation/action_card.dart';
import '../../capture/application/capture_controller.dart';
import '../../capture/domain/source_item.dart';
import '../../capture/presentation/capture_sheet.dart';
import '../../capture/presentation/preview_screen.dart';
import '../../library/presentation/source_card.dart';
import '../application/action_brief.dart';
import 'capability_preview.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _recoverLostCapture();
      // Captures the previous run stored but never finished reading. Without
      // this they sit on the inbox saying "Reading the text…" forever.
      ref.read(sourcesProvider.notifier).resumeUnfinished();
      // One bounded pass over any Actions still owing the cloud mirror an
      // upsert. Strictly after first frame, never blocking anything.
      unawaited(ref.read(actionSyncServiceProvider).flush());
    });
  }

  /// Android can kill this app while the camera activity is in the foreground,
  /// in which case the picker's result is never delivered to the call that is
  /// waiting for it — that call died with the process. image_picker holds the
  /// result until `retrieveLostData` is asked for it.
  Future<void> _recoverLostCapture() async {
    final XFile? file;
    try {
      file = await ref.read(capturePickerProvider).recoverLostCapture();
    } on Object {
      return;
    }
    if (file == null || !mounted) return;

    context.push(
      Routes.capturePreview,
      extra: PreviewArgs(path: file.path, type: SourceType.photo),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sourcesAsync = ref.watch(sourcesProvider);
    final actionsAsync = ref.watch(actionsStreamProvider);
    final triaged = ref.watch(triagedHomeProvider);

    if (actionsAsync is AsyncError) {
      // The local database could not be read. This is loud but calm, and it
      // deliberately does not overlap with "no Actions yet" — data that
      // cannot be loaded has not vanished.
      return SafeArea(
        child: ReadableWidth.list(
          child: ErrorView(
            message:
                "Your actions couldn't be loaded. They are still stored "
                'on this device.',
            onRetry: () => ref.invalidate(actionsStreamProvider),
          ),
        ),
      );
    }

    if (actionsAsync is AsyncLoading && sourcesAsync is AsyncLoading) {
      return const SafeArea(child: LoadingView());
    }

    final home = switch (triaged) {
      AsyncData(:final value) => value,
      _ => const TriagedHome(
        needsAttention: [],
        upcoming: [],
        completed: [],
        decisions: {},
      ),
    };
    final sources = sourcesAsync.value ?? const <SourceItem>[];
    final actions = actionsAsync.value ?? const <ActionItem>[];
    final now = ref.watch(appClockProvider)();

    final actionedSourceIds = {
      for (final action in actions)
        if (action.sourceId != null) action.sourceId!,
    };

    final brief = ActionBrief.from(
      home: home,
      sources: sources,
      actionedSourceIds: actionedSourceIds,
      hasAnyAction: actions.isNotEmpty,
    );

    // Same rule as the brief: anything not yet turned into an Action. A
    // capture still being read belongs here too, so what you just added is
    // visible immediately rather than after OCR finishes.
    final awaitingReview =
        sources.where((s) => !actionedSourceIds.contains(s.id)).toList()
          ..sort((a, b) => b.capturedAt.compareTo(a.capturedAt));

    return SafeArea(
      bottom: false,
      child: ReadableWidth.list(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: _TodayHeader()),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Space.page,
                  Space.sm,
                  Space.page,
                  Space.lg,
                ),
                child: _BriefHero(brief: brief, now: now),
              ),
            ),

            // A brand-new user gets the capability preview instead of a list of
            // empty headings. This is the single most important thing on the
            // screen for them: it is the only place the app says what it does.
            if (brief.isFirstRun)
              const SliverToBoxAdapter(child: CapabilityPreview()),

            // A returning user whose day is quiet gets shortcuts instead of
            // two-thirds of a blank screen. Not shown alongside the first-run
            // preview, which already covers the same ground at more length.
            if (!brief.isFirstRun &&
                _isSparse(home, brief, awaitingReview.length))
              const SliverToBoxAdapter(child: QuickStart()),

            // Whatever the hero is showing is excluded from the lists below.
            // The hero draws from needsAttention when it can and falls back to
            // upcoming, so the exclusion has to follow it rather than always
            // skipping the head of one particular list.
            if (_without(home.needsAttention, brief.topAction)
                case final rest when rest.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: SectionHeader(
                  title: brief.topAction != null &&
                          home.needsAttention.contains(brief.topAction)
                      ? 'Also needs attention'
                      : 'Needs attention',
                ),
              ),
              _actionList(rest, home, now),
            ],

            if (awaitingReview.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Waiting for review',
                  count: awaitingReview.length,
                ),
              ),
              SliverList.separated(
                itemCount: awaitingReview.length.clamp(0, 3),
                separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Space.page),
                  child: SourceCard(
                    source: awaitingReview[i],
                    hasAction: false,
                    onTap: () =>
                        context.push(Routes.source(awaitingReview[i].id)),
                  ),
                ),
              ),
              if (awaitingReview.length > 3)
                SliverToBoxAdapter(
                  child: _SeeAll(
                    label: 'See all ${awaitingReview.length} captures',
                    onTap: () => context.go(Routes.library),
                  ),
                ),
            ],

            if (_without(home.upcoming, brief.topAction)
                case final upcoming when upcoming.isNotEmpty) ...[
              const SliverToBoxAdapter(
                child: SectionHeader(title: 'Coming up'),
              ),
              _actionList(upcoming.take(4).toList(), home, now),
              if (upcoming.length > 4)
                SliverToBoxAdapter(
                  child: _SeeAll(
                    label: 'See all in Library',
                    onTap: () => context.go(Routes.library),
                  ),
                ),
            ],

            // Finished work gets one line, not a section.
            //
            // Every comparable product keeps completions off the daily surface
            // — Things has a Logbook, Todoist has Activity — because a growing
            // list of things you already did costs scroll every day and buys
            // nothing. Action's Logbook is Library → Done, so Today only needs
            // to acknowledge the win and point at it.
            if (home.completed.isNotEmpty)
              SliverToBoxAdapter(
                child: _CompletedSummary(count: home.completed.length),
              ),

            const SliverToBoxAdapter(
              child: SizedBox(height: actionNavBarClearance + Space.lg),
            ),
          ],
        ),
      ),
    );
  }

  /// Whether Today has run out of things to show below the hero.
  ///
  /// One item is still sparse: a hero and a single row leaves most of the
  /// screen empty. Two is where the page starts looking like a list, which is
  /// the point at which shortcuts would be competing with content rather than
  /// standing in for it.
  static bool _isSparse(TriagedHome home, ActionBrief brief, int awaiting) {
    final below = _without(home.needsAttention, brief.topAction).length +
        _without(home.upcoming, brief.topAction).length +
        awaiting;
    return below <= 1;
  }

  /// [items] minus the Action the hero is already showing.
  ///
  /// The hero draws from needsAttention when it can and falls back to upcoming,
  /// so the exclusion has to follow it rather than always skipping the head of
  /// one particular list — which is how the same Action ended up rendered twice.
  static List<ActionItem> _without(List<ActionItem> items, ActionItem? hero) {
    if (hero == null) return items;
    return items.where((a) => a.id != hero.id).toList();
  }

  Widget _actionList(List<ActionItem> items, TriagedHome home, DateTime now) {
    return SliverList.separated(
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: Space.sm),
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Space.page),
        child: ActionCard(
          item: items[i],
          decision: home.decisionFor(items[i].id),
          now: now,
        ),
      ),
    );
  }
}

/// The header.
///
/// The date is the eyebrow and the greeting is the title — the reverse of the
/// old arrangement, where a 32px "Good evening" was the largest thing on screen
/// and told the user nothing. Settings is the only control here now; Search and
/// Intelligence became destinations in the shell, which is where a place
/// belongs.
class _TodayHeader extends StatelessWidget {
  const _TodayHeader();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = context.colors;
    final now = DateTime.now();

    final greeting = switch (now.hour) {
      < 12 => 'Good morning',
      < 17 => 'Good afternoon',
      _ => 'Good evening',
    };

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        Space.page,
        Space.xl,
        Space.sm,
        Space.xs,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE · d MMMM').format(now).toUpperCase(),
                  style: text.labelSmall?.copyWith(
                    color: colors.textTertiary,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: Space.xxs),
                Text(greeting, style: text.headlineMedium),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Settings',
            icon: const Icon(Icons.tune_rounded),
            onPressed: () => context.push(Routes.settings),
          ),
        ],
      ),
    );
  }
}

/// The signature surface of the app.
///
/// One hero, elevated glass, sitting in its own pool of light. It carries the
/// brief's headline and — when there is one — the single Action that matters
/// most, with its next step. This is the only place on Today that uses glass:
/// everything below is a solid card in a scrolling list, where a blur per row
/// would be exactly the cost Day 16 removed.
class _BriefHero extends StatelessWidget {
  const _BriefHero({required this.brief, required this.now});

  final ActionBrief brief;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    final tone = switch (brief.tone) {
      BriefTone.attention => colors.urgencyImportant,
      BriefTone.review => colors.brand,
      BriefTone.upcoming => colors.textSecondary,
      BriefTone.clear => colors.confidenceConfirmed,
    };

    final top = brief.topAction;

    return AmbientGlow(
      colour: brief.tone == BriefTone.attention
          ? colors.urgencyImportant
          : null,
      intensity: brief.tone == BriefTone.clear ? 0.6 : 1,
      child: GlassSurface(
        intensity: GlassIntensity.hero,
        padding: const EdgeInsets.all(Space.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: tone,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: Space.sm),
                Text(
                  switch (brief.tone) {
                    BriefTone.attention => 'NEEDS YOU',
                    BriefTone.review => 'TO REVIEW',
                    BriefTone.upcoming => 'AHEAD',
                    // "CLEAR" congratulates someone who has cleared a list; it
                    // is meaningless to someone who has never had one.
                    BriefTone.clear =>
                      brief.isFirstRun ? 'START HERE' : 'CLEAR',
                  },
                  style: text.labelSmall?.copyWith(
                    color: tone,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Space.md),
            Text(brief.headline, style: text.headlineSmall),
            if (brief.detail != null) ...[
              const SizedBox(height: Space.xs),
              Text(brief.detail!, style: text.bodyMedium),
            ],

            if (top != null) ...[
              const SizedBox(height: Space.lg),
              Divider(color: colors.border, height: Strokes.hairline),
              const SizedBox(height: Space.lg),
              _TopAction(item: top, now: now, decision: brief.topDecision),
            ],
          ],
        ),
      ),
    );
  }
}

/// The one Action the brief is pointing at, inside the hero.
///
/// Carries the same three things an Action card does — the triage badge that
/// says why it is here, the title, and the next step — plus its own completion
/// control. The hero is the *most* important Action on the screen, so it would
/// be perverse for it to be the one card you cannot finish without opening it,
/// or the one that never says why it is at the top.
class _TopAction extends ConsumerWidget {
  const _TopAction({required this.item, required this.now, this.decision});

  final ActionItem item;
  final DateTime now;
  final ActionTriageDecision? decision;

  /// The next thing to do — the first unticked step, else the reviewed
  /// recommendation. Never invented.
  String? get _next {
    for (final step in item.steps) {
      if (!step.isCompleted) return step.title;
    }
    if (item.steps.isNotEmpty) return null;
    final recommended = item.recommendedNextStep?.trim();
    return (recommended == null || recommended.isEmpty) ? null : recommended;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final next = _next;

    final badge = decision == null
        ? null
        : TriageLabels.badge(decision!, item, now);
    final tone = switch (decision?.primaryReason) {
      TriageReason.overdue => colors.urgencyCritical,
      TriageReason.dueToday ||
      TriageReason.criticalDueSoon ||
      TriageReason.criticalNoDeadline => colors.urgencyImportant,
      _ => colors.textSecondary,
    };
    // The badge owns the deadline story when it states one, so the meta line
    // does not say it a second time.
    final badgeStatesDue = switch (decision?.primaryReason) {
      TriageReason.overdue ||
      TriageReason.dueToday ||
      TriageReason.dueTomorrow => true,
      _ => false,
    };

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Semantics(
            button: true,
            label: 'Open ${item.title}',
            child: InkWell(
              onTap: () => context.push(Routes.action(item.id)),
              borderRadius: Radii.rMd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (badge != null)
                    Semantics(
                      label: TriageLabels.semanticLabel(decision!, item, now),
                      button: true,
                      child: InkWell(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              TriageLabels.explanation(decision!, item, now),
                            ),
                          ),
                        ),
                        borderRadius: Radii.rSm,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: Space.xxs),
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
                  Text(
                    item.title,
                    style: text.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Space.xxs),
                  ActionMetaLine(item: item, suppressDue: badgeStatesDue),
                  if (next != null) ...[
                    const SizedBox(height: Space.md),
                    Row(
                      children: [
                        Text(
                          'NEXT',
                          style: text.labelSmall?.copyWith(
                            color: colors.textTertiary,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: Space.sm),
                        Expanded(
                          child: Text(
                            next,
                            style: text.bodyLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        IconButton(
          // Named, so a screen reader hears which Action is about to be marked
          // rather than "Mark as done" repeated down the screen.
          tooltip: 'Mark "${item.title}" as done',
          onPressed: () async {
            await ref
                .read(actionRepositoryProvider)
                .complete(item.id, at: DateTime.now());
            ref.read(appAnalyticsProvider).log(AnalyticsEvents.actionCompleted);
            unawaited(ref.read(actionSyncServiceProvider).flush());
          },
          icon: Icon(
            Icons.radio_button_unchecked_rounded,
            color: colors.textTertiary,
          ),
        ),
      ],
    );
  }
}

class _SeeAll extends StatelessWidget {
  const _SeeAll({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.sm, Space.page, 0),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: TextButton(onPressed: onTap, child: Text(label)),
      ),
    );
  }
}

/// One line acknowledging finished work, linking to the log.
///
/// Deliberately not a section with cards. See the call site for why.
class _CompletedSummary extends StatelessWidget {
  const _CompletedSummary({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, Space.lg, Space.page, 0),
      child: Semantics(
        button: true,
        label: count == 1
            ? '1 action completed. Open the library.'
            : '$count actions completed. Open the library.',
        child: InkWell(
          onTap: () => context.go(Routes.library),
          borderRadius: Radii.rMd,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.sm),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  size: 18,
                  color: colors.confidenceConfirmed,
                ),
                const SizedBox(width: Space.sm),
                Expanded(
                  child: Text(
                    count == 1 ? '1 done' : '$count done',
                    style: text.bodyMedium?.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: colors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/// Three ways in, for a Today that has run out of things to say.
///
/// **Why this exists.** Today is deliberately quiet: it renders only the
/// sections that have something in them, so a user with one upcoming Action
/// gets a hero and then two-thirds of a blank screen. That emptiness is
/// honest and it is also the most common state this app will ever be in —
/// most days, most people are not behind on anything.
///
/// **Why shortcuts rather than an explanation.** The first-run
/// [CapabilityPreview] already explains what Action does, and repeating it
/// every quiet day would be a product nagging its user about its own features.
/// These are not descriptions of capture, they *are* capture: each tile is one
/// tap from a camera, a picker, or a text field. A blank space filled with
/// something you would actually press is a different thing from a blank space
/// filled with copy.
class QuickStart extends ConsumerWidget {
  const QuickStart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.xxl,
        Space.page,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(
              'START WITH',
              style: text.labelSmall?.copyWith(
                color: colors.textTertiary,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: Space.md),
          Row(
            children: [
              Expanded(
                child: _QuickTile(
                  icon: Icons.photo_camera_rounded,
                  label: 'Photo',
                  onTap: () => runCaptureIntent(
                    context,
                    ref,
                    CaptureIntent.camera,
                  ),
                ),
              ),
              const SizedBox(width: Space.sm),
              Expanded(
                child: _QuickTile(
                  icon: Icons.image_rounded,
                  label: 'Screenshot',
                  onTap: () => runCaptureIntent(
                    context,
                    ref,
                    CaptureIntent.gallery,
                  ),
                ),
              ),
              const SizedBox(width: Space.sm),
              Expanded(
                child: _QuickTile(
                  icon: Icons.notes_rounded,
                  label: 'Text',
                  onTap: () => runCaptureIntent(
                    context,
                    ref,
                    CaptureIntent.pasteText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Space.lg),
          // Named tools rather than "explore": the two below need no provider
          // and no key, so this is a promise the app can keep for someone who
          // has connected nothing.
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton.icon(
              onPressed: () => context.go(Routes.studio),
              icon: const Icon(Icons.lightbulb_outline_rounded, size: 18),
              label: const Text('Check a link, or find keys in some text'),
              style: TextButton.styleFrom(
                minimumSize: const Size(0, 40),
                padding: const EdgeInsets.symmetric(horizontal: Space.sm),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickTile extends StatelessWidget {
  const _QuickTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    // No explicit Semantics wrapper: InkWell already announces the button
    // role and the label below supplies the name, so adding one produced a
    // second node with the same words rather than a clearer one.
    return MergeSemantics(
      child: Material(
        color: colors.surfaceElevated,
        borderRadius: Radii.rMd,
        child: InkWell(
          borderRadius: Radii.rMd,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Space.lg,
              horizontal: Space.sm,
            ),
            decoration: BoxDecoration(
              borderRadius: Radii.rMd,
              border: Border.all(
                color: colors.border,
                width: Strokes.hairline,
              ),
            ),
            child: Column(
              children: [
                Icon(icon, size: 22, color: colors.brand),
                const SizedBox(height: Space.sm),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.labelMedium?.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
