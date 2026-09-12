import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../l10n/gen/app_l10n.dart';
import '../application/onboarding_controller.dart';
import 'onboarding_art.dart';
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';

/// First run: what the product does, and what it does with your information.
///
/// Four screens, because the honest minimum is four — what you can give it,
/// why it asks you to check, what it does afterwards, and where the data goes.
/// It is not a feature tour: reminders, search, filters and the Action Chain
/// are all absent on purpose. Someone who has used the app for a minute will
/// find those; someone who has used it for zero seconds needs to know whether
/// to trust it.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isLast => _page == _pageCount - 1;

  void _goTo(int page, {required bool animate}) {
    if (page < 0 || page >= _pageCount) return;
    if (animate) {
      _pageController.animateToPage(
        page,
        duration: Motion.base,
        curve: Motion.standard,
      );
    } else {
      _pageController.jumpToPage(page);
    }
  }

  /// Finishing and skipping are the same commitment: the user has decided
  /// they are done here. Skipping is not a lesser state to be nagged about
  /// later.
  /// Guards against a second tap landing while the first is still writing.
  /// Completing twice is harmless, but navigating twice is not.
  bool _finishing = false;

  Future<void> _finish() async {
    if (_finishing) return;
    _finishing = true;
    await ref.read(onboardingControllerProvider.notifier).complete();
    unawaited(
      ref.read(appAnalyticsProvider).log(AnalyticsEvents.onboardingCompleted),
    );
    if (!mounted) return;
    context.go(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    // Rebuilt with the bundle rather than held as a constant, so a language
    // change while the flow is open changes the words under the reader.
    final pages = _pagesFor(l10n);
    // Respect the platform's reduced-motion setting: paging still works and
    // still changes the screen, it just stops sliding.
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Scaffold(
      body: SafeArea(
        child: PopScope(
          // On the first page there is nothing to go back to, so the system
          // gesture does what it does anywhere else at the root of an app.
          canPop: _page == 0,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            _goTo(_page - 1, animate: !reduceMotion);
          },
          child: Column(
            children: [
              _TopBar(
                page: _page,
                total: pages.length,
                // Skip appears only once the user has seen what the product
                // is — offering it on screen one is offering to leave before
                // anything has been said — and disappears again on the last,
                // where the primary button already ends the flow and two
                // controls doing the same thing is just noise.
                onSkip: _page == 0 || _isLast ? null : _finish,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (context, i) => _PageView(page: pages[i]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  Space.page,
                  Space.md,
                  Space.page,
                  Space.lg,
                ),
                child: FilledButton(
                  onPressed: _isLast
                      ? _finish
                      : () => _goTo(_page + 1, animate: !reduceMotion),
                  child: Text(
                    _isLast ? l10n.onboardingStart : l10n.commonContinue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.page,
    required this.total,
    required this.onSkip,
  });

  final int page;
  final int total;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    return Padding(
      padding:
          const EdgeInsetsDirectional.fromSTEB(Space.page, Space.md, Space.sm, 0),
      child: Row(
        children: [
          _Progress(page: page, total: total),
          const Spacer(),
          // The slot is always occupied so the progress bars do not shift
          // sideways when Skip appears on the second page.
          SizedBox(
            height: 48,
            child: onSkip == null
                ? null
                : TextButton(onPressed: onSkip, child: Text(l10n.commonSkip)),
          ),
        ],
      ),
    );
  }
}

/// Segments rather than dots: they read as "how much is left" at a glance,
/// and they carry a spoken position for anyone who cannot see them.
class _Progress extends StatelessWidget {
  const _Progress({required this.page, required this.total});

  final int page;
  final int total;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = AppL10n.of(context);
    return Semantics(
      label: l10n.onboardingProgressSemantics(page + 1, total),
      liveRegion: true,
      child: ExcludeSemantics(
        child: Row(
          children: [
            for (var i = 0; i < total; i++)
              AnimatedContainer(
                // The only decorative animation in the product, so it is also
                // the only one that has to remember to stop.
                duration: MediaQuery.disableAnimationsOf(context)
                    ? Duration.zero
                    : Motion.base,
                curve: Motion.standard,
                margin: const EdgeInsetsDirectional.only(end: Space.xs),
                height: 4,
                width: i == page ? 24 : 12,
                decoration: BoxDecoration(
                  color: i <= page ? colors.brand : colors.border,
                  borderRadius: BorderRadius.circular(Radii.pill),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({required this.page});

  final _OnboardingPage page;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        // The illustration is the first thing to go when space runs short,
        // and "short" includes a tall screen carrying very large text: at
        // 150% the picture costs about four lines of the copy it is only
        // decorating. This is why nothing in the art is text — it can be
        // dropped whole without losing meaning.
        final enlarged = MediaQuery.textScalerOf(context).scale(16) > 22;
        final showArt = constraints.maxHeight > 380 && !enlarged;
        const padding = EdgeInsets.fromLTRB(
          Space.page,
          Space.lg,
          Space.page,
          Space.xxl,
        );

        return SingleChildScrollView(
          padding: padding,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.readableContent,
              ),
              child: ConstrainedBox(
                // Short pages sit centred in the viewport instead of clinging to
                // the top with a third of the screen empty beneath them; the long
                // privacy page overflows this minimum and simply scrolls.
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - padding.vertical,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showArt) ...[
                      SizedBox(
                        height: 172,
                        child: Center(child: ExcludeSemantics(child: page.art)),
                      ),
                      const SizedBox(height: Space.xxxl),
                    ],
                    Semantics(
                      header: true,
                      child: Text(page.title, style: text.headlineMedium),
                    ),
                    const SizedBox(height: Space.md),
                    Text(
                      page.body,
                      style: text.bodyLarge?.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                    if (page.points.isNotEmpty) ...[
                      const SizedBox(height: Space.xl),
                      for (final point in page.points)
                        Padding(
                          padding: const EdgeInsets.only(bottom: Space.md),
                          child: _Point(text: point),
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Point extends StatelessWidget {
  const _Point({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Aligned to the first line's optical centre, and never a coloured
        // dot that has to be decoded — it is punctuation, not a status.
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
            text,
            style: theme.bodyMedium?.copyWith(color: colors.textSecondary),
          ),
        ),
      ],
    );
  }
}

class _OnboardingPage {
  const _OnboardingPage({
    required this.title,
    required this.body,
    required this.art,
    this.points = const [],
  });

  final String title;
  final String body;
  final Widget art;
  final List<String> points;
}

/// How many screens there are.
///
/// Held separately from the copy because the flow's shape is not a property
/// of any language: paging, bounds and the progress bars all need the count
/// before there is a bundle to build the words from.
const _pageCount = 4;

/// The words themselves, in the reader's language.
///
/// Screen four is the one that matters most and the one most easily got
/// wrong. Every claim on it was checked against `cloudPayloadFor`, the
/// `SourceStore`, the reminder scheduler and the search service before it was
/// written. It does not say "everything stays on your device", because that
/// is not true the moment a document is sent to be read; and it does not say
/// "backup", because nothing here can restore anything.
///
/// Each of those claims is a SAFETY-annotated key in the ARB, and the
/// annotation is what carries the reasoning above into the other nineteen
/// languages — a translator who shortens "not a fact, and not an Action" or
/// helpfully adds "everything stays on your device" would undo all of it.
List<_OnboardingPage> _pagesFor(AppL10n l10n) {
  final pages = <_OnboardingPage>[
    _OnboardingPage(
      title: l10n.onboardingCaptureTitle,
      body: l10n.onboardingCaptureBody,
      art: const CaptureToActionArt(),
    ),
    _OnboardingPage(
      title: l10n.onboardingReviewTitle,
      body: l10n.onboardingReviewBody,
      art: const ReviewArt(),
    ),
    _OnboardingPage(
      title: l10n.onboardingTrackingTitle,
      body: l10n.onboardingTrackingBody,
      art: const TrackingArt(),
    ),
    _OnboardingPage(
      // The same sentence as the Settings row that leads to the full privacy
      // screen, deliberately: this page is the short version of that one.
      title: l10n.settingsWhereInfoLives,
      body: l10n.onboardingPrivacyBody,
      art: const PrivacyArt(),
      points: [
        l10n.onboardingPrivacyOnDevice,
        l10n.onboardingPrivacySentToRead,
        l10n.onboardingPrivacyCloud,
        l10n.onboardingPrivacyNotBackup,
      ],
    ),
  ];
  assert(
    pages.length == _pageCount,
    'The copy and the page count have drifted apart.',
  );
  return pages;
}
