import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../actions/application/action_providers.dart';
import '../../actions/application/confirmed_draft_mapper.dart';

import '../../../design/components/app_sheet.dart';
import '../../../design/components/section_header.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../../design/tokens/typography.dart';
import '../../../shared/widgets/error_view.dart';
import '../../capture/application/capture_controller.dart';
import '../../capture/domain/source_item.dart';
import '../data/extraction_validator.dart' show parseStrictIso8601;
import '../domain/action_draft.dart';
import '../application/action_review_state.dart';
import '../application/canonical_fields.dart';
import '../application/evidence_regions.dart';
import '../application/extraction_providers.dart';
import '../domain/confirmed_action_draft.dart';
import '../domain/extracted_field.dart';
import '../domain/extraction_input.dart';
import '../domain/extraction_result.dart';
import '../domain/extraction_evidence.dart';
import '../domain/extraction_schema.dart';
import '../domain/escalation.dart';
import '../domain/money_value.dart';
import 'evidence_lens.dart';
import 'review_widgets.dart';
import '../../../core/analytics/app_analytics.dart';
import '../../../core/analytics/firebase_app_analytics.dart';

/// The trust screen: what Action understood, what is uncertain, and exactly
/// what will exist if the user confirms.
///
/// Everything on it serves one contract — *nothing the model produced becomes
/// an Action without a person seeing it and saying yes.* The screen therefore
/// never hides uncertainty: ungrounded values wear their needs-review state,
/// ambiguous dates are presented as a question rather than a guess, unusable
/// extractions land in a manual path that keeps the capture intact, and the
/// primary button refuses to confirm around an open question.
///
/// The provider's [ExtractionResult] is read-only here; every user decision
/// lives in [ActionReviewState] and leaves through [ConfirmedActionDraft].
class ExtractionReviewScreen extends ConsumerStatefulWidget {
  const ExtractionReviewScreen({
    required this.sourceId,
    this.initialResult,
    super.key,
  });

  final String sourceId;

  /// Debug/test injection: a pre-computed result to review, bypassing the
  /// live service. The router only wires this in debug builds, which is what
  /// lets the fixture harness drive this exact screen deterministically.
  final ExtractionResult? initialResult;

  @override
  ConsumerState<ExtractionReviewScreen> createState() =>
      _ExtractionReviewScreenState();
}

class _ExtractionReviewScreenState
    extends ConsumerState<ExtractionReviewScreen> {
  ExtractionAttempt _attempt = const ExtractionIdle();
  ActionReviewState? _review;
  ConfirmedActionDraft? _confirmed;

  /// Produced once per review; retries of a failed save reuse it so the
  /// Action id stays stable and persistence stays idempotent.
  ConfirmedActionDraft? _pendingDraft;
  bool _saving = false;
  int _stage = 0;

  static final _dateFormat = DateFormat('d MMM yyyy');

  @override
  void initState() {
    super.initState();
    final injected = widget.initialResult;
    if (injected != null) {
      _attempt = ExtractionCompleted(injected);
      _review = reviewStateFor(injected);
      _log(AnalyticsEvents.reviewOpened);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => _start());
    }
  }

  void _log(String event) => ref.read(appAnalyticsProvider).log(event);

  /// Records the outcome of one extraction attempt, and the outcome only.
  void _logOutcome(String outcome) {
    ref.read(appAnalyticsProvider).log(
      switch (outcome) {
        'failed' => AnalyticsEvents.extractionFailed,
        'needs_review' => AnalyticsEvents.extractionNeedsReview,
        _ => AnalyticsEvents.extractionSucceeded,
      },
      parameters: {AnalyticsParams.extractionOutcome: outcome},
    );
  }

  Future<void> _start() async {
    setState(() {
      _attempt = const ExtractionRunning();
      _review = null;
      _confirmed = null;
      _stage = 0;
    });

    List<SourceItem> items;
    try {
      items = await ref.read(sourcesProvider.future);
    } on Object {
      if (!mounted) return;
      setState(() {
        _attempt = const ExtractionFailed('Could not load this capture.');
      });
      return;
    }
    if (!mounted) return;

    final item = items.where((s) => s.id == widget.sourceId).firstOrNull;
    if (item == null) {
      setState(() {
        _attempt =
            const ExtractionFailed('That capture is no longer available.');
      });
      return;
    }

    // A capture with no usable text has nothing to send. Going straight to
    // the manual path is not a failure — and it spends no quota finding that
    // out.
    if (!sourceReadyForExtraction(item)) {
      setState(() {
        _attempt = ExtractionCompleted(
          ExtractionResult.manualEntryRequired(
            sourceId: item.id,
            engine: 'none',
            producedAt: DateTime.now(),
            issues: const [],
          ),
        );
      });
      return;
    }

    setState(() => _stage = 1);
    _log(AnalyticsEvents.extractionStarted);
    final attempt = await runExtraction(
      ref.read(extractionServiceProvider),
      ExtractionInput.fromSourceItem(item),
    );

    // How the attempt ended, as one of four fixed words. Never the document,
    // never the draft, never the model's answer.
    _logOutcome(switch (attempt) {
      ExtractionFailed() => 'failed',
      ExtractionCompleted(:final result) =>
        result.hasDraft ? 'success' : 'needs_review',
      // runExtraction never returns idle; the case exists so the switch is
      // total rather than relying on that promise.
      _ => 'failed',
    });

    if (!mounted) return;

    // Validation already ran inside the attempt; giving the final stage a
    // beat to render keeps the checklist honest without inventing progress.
    setState(() => _stage = 2);
    await Future<void>.delayed(Motion.slow);
    if (!mounted) return;

    setState(() {
      _attempt = attempt;
      if (attempt is ExtractionCompleted) {
        _review = reviewStateFor(attempt.result);
      }
    });
    if (attempt is ExtractionCompleted && attempt.result.hasDraft) {
      _log(AnalyticsEvents.reviewOpened);
    }
  }

  void _update(ActionReviewState next) => setState(() => _review = next);

  SourceItem? get _sourceItem =>
      ref.watch(sourcesProvider).value?.where((s) => s.id == widget.sourceId).firstOrNull;

  @override
  Widget build(BuildContext context) {
    final review = _review;
    final attempt = _attempt;

    final Widget body;
    if (_confirmed != null) {
      body = _SuccessView(draft: _confirmed!, dateFormat: _dateFormat);
    } else if (review != null) {
      body = _buildReview(review);
    } else if (attempt is ExtractionFailed) {
      body = ErrorView(
        message: attempt.message,
        onRetry: _start,
        onManualEntry: () {
          _log(AnalyticsEvents.extractionManualFallback);
          _update(ActionReviewState.manual(sourceId: widget.sourceId));
        },
      );
    } else if (attempt is ExtractionCompleted) {
      final result = attempt.result;
      if (result.noActionRequired) {
        body = _NoActionView(
          item: _sourceItem,
          onAddAnyway: () {
            _log(AnalyticsEvents.extractionManualFallback);
            _update(ActionReviewState.manual(
              sourceId: widget.sourceId,
              original: result,
            ));
          },
          onDone: () => context.pop(),
        );
      } else {
        // manualEntryRequired with no draft: open the manual path directly,
        // wearing a calm explanation rather than an error screen.
        body = _buildManualIntro(result);
      }
    } else {
      body = _ProcessingView(stage: _stage);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_confirmed != null ? 'Confirmed' : 'Review'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_confirmed == null) _log(AnalyticsEvents.reviewCancelled);
            context.pop();
          },
        ),
      ),
      body: SafeArea(bottom: false, child: body),
      bottomNavigationBar:
          (review != null && _confirmed == null) ? _confirmBar(review) : null,
    );
  }

  // ------------------------------------------------------------- sections --

  Widget _buildManualIntro(ExtractionResult result) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Space.page,
        vertical: Space.xl,
      ),
      children: [
        ReviewNotice(
          icon: Icons.edit_note_rounded,
          title: 'Action couldn’t reliably understand enough of this source.',
          message:
              'The capture is safe and nothing was lost. You can enter the '
              'details yourself, and the source stays attached for reference.',
        ),
        const SizedBox(height: Space.xl),
        FilledButton(
          onPressed: () {
            _log(AnalyticsEvents.extractionManualFallback);
            _update(ActionReviewState.manual(
              sourceId: widget.sourceId,
              original: result,
            ));
          },
          child: const Text('Enter the details'),
        ),
        const SizedBox(height: Space.sm),
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Keep the source for later'),
        ),
      ],
    );
  }

  Widget _buildReview(ActionReviewState review) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final result = review.original;
    final draft = review.draft;
    final item = _sourceItem;
    final manual = review.mode == ReviewMode.manual;

    final needsReviewCount =
        review.effectiveFields.where((f) => f.reviewState == FieldReviewState.needsReview).length;

    return ListView(
      padding: const EdgeInsets.only(bottom: Space.xxxl),
      children: [
        // A — where this came from.
        if (item != null)
          _SourceStrip(item: item, onViewSource: () => context.pop())
        else if (result != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
                Space.page, Space.md, Space.page, 0),
            child: Text(
              'Engine: ${result.engine}',
              style: text.labelSmall?.copyWith(color: colors.textTertiary),
            ),
          ),

        // B — what Action understood.
        Padding(
          padding:
              const EdgeInsets.fromLTRB(Space.page, Space.lg, Space.page, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (manual) ...[
                ReviewNotice(
                  icon: Icons.edit_note_rounded,
                  message:
                      'You are creating this action yourself. Only what you '
                      'enter here will be used.',
                ),
                const SizedBox(height: Space.lg),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      review.title.isEmpty ? 'Untitled action' : review.title,
                      style: text.headlineMedium?.copyWith(
                        color: review.title.isEmpty
                            ? colors.textTertiary
                            : colors.textPrimary,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Edit title',
                    onPressed: () => _editTitle(review),
                    icon: const Icon(Icons.edit_outlined),
                  ),
                ],
              ),
              if (draft != null) ...[
                const SizedBox(height: Space.xs),
                Text(draft.summary, style: text.bodyMedium),
                const SizedBox(height: Space.md),
                _UnderstandingMeta(draft: draft),
              ],
              if (needsReviewCount > 0) ...[
                const SizedBox(height: Space.md),
                Text(
                  needsReviewCount == 1
                      ? '1 value needs your review before this can be confirmed.'
                      : '$needsReviewCount values need your review.',
                  style:
                      text.bodySmall?.copyWith(color: colors.confidenceReview),
                ),
              ],
            ],
          ),
        ),

        // G (part) — honest notices about this document, before the facts.
        ..._notices(result),

        // C — the key facts.
        const SectionHeader(title: 'Key facts'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.page),
          child: Column(
            children: [
              _dueRow(review),
              const SizedBox(height: Space.md),
              _amountRow(review),
              for (final field in _otherFacts(review)) ...[
                const SizedBox(height: Space.md),
                FactRow(
                  label: field.label,
                  value: field.hasValue ? field.value! : 'Not found',
                  display: ConfidenceDisplay.of(field),
                  numeric: field.valueType.isStrictlyTyped,
                  onConfirm: (!field.editedByUser &&
                          field.reviewState == FieldReviewState.needsReview &&
                          field.hasValue)
                      ? () => _update(review.confirmField(field.key))
                      : null,
                  onEdit: () => _editField(review, field),
                  evidence: field.evidence,
                  onEvidenceViewed: () => _log(AnalyticsEvents.reviewEvidenceViewed),
                  source: _sourceItem,
                ),
              ],
            ],
          ),
        ),

        // D — what Action suggests doing about it.
        if (review.recommendedNextStep != null) ...[
          const SectionHeader(title: 'Suggested next step'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.page),
            child: Text(review.recommendedNextStep!, style: text.bodyLarge),
          ),
        ],

        // E — why this matters, only when the validator let it through.
        if (draft?.whyThisMatters != null || draft?.consequence != null) ...[
          const SectionHeader(title: 'Why this matters'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.page),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (draft?.whyThisMatters != null)
                  Text(draft!.whyThisMatters!, style: text.bodyMedium),
                if (draft?.consequence != null) ...[
                  const SizedBox(height: Space.sm),
                  Text(
                    draft!.consequence!,
                    style: text.bodyMedium,
                  ),
                  if (draft.consequenceEvidence != null)
                    EvidenceTile(
                      evidence: draft.consequenceEvidence!,
                      onFirstExpand: () => _log(AnalyticsEvents.reviewEvidenceViewed),
                      source: _sourceItem,
                      label: 'Why this matters',
                    ),
                ],
              ],
            ),
          ),
        ],

        // F — the steps that make up the action.
        if (review.steps.isNotEmpty || manual) ...[
          SectionHeader(
            title: 'Steps',
            count: review.steps.where((s) => s.included).length,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.page),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final step in review.steps) _stepRow(review, step),
                TextButton.icon(
                  onPressed: () => _addStep(review),
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('Add a step'),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  List<Widget> _notices(ExtractionResult? result) {
    if (result == null) return const [];
    final notices = <Widget>[];

    if (result.hasIssue(ExtractionIssueCode.injectionAttemptInDocument) ||
        result.escalation.has(ExtractionEscalationSignal.instructionLikeContent)) {
      notices.add(const ReviewNotice(
        icon: Icons.info_outline_rounded,
        message:
            'Some text in this source looked like instructions rather than '
            'document facts, so Action ignored it.',
      ));
    }
    if (result.escalation.has(ExtractionEscalationSignal.tableLikeLayout)) {
      notices.add(const ReviewNotice(
        icon: Icons.table_chart_outlined,
        message:
            'This document’s layout may contain relationships that text '
            'extraction couldn’t fully preserve. Check the values below '
            'against the source before confirming.',
      ));
    }
    // Every remaining signal already carries a user-safe sentence written
    // for exactly this purpose — the domain says why, the screen just shows
    // it and asks for a check against the source.
    const handledSeparately = {
      ExtractionEscalationSignal.tableLikeLayout,
      ExtractionEscalationSignal.instructionLikeContent,
    };
    for (final signal in result.escalation.signals
        .where((s) => !handledSeparately.contains(s))) {
      notices.add(ReviewNotice(
        icon: Icons.visibility_outlined,
        message: '${signal.reason} Check the values below against the source.',
      ));
    }

    return [
      for (final notice in notices)
        Padding(
          padding:
              const EdgeInsets.fromLTRB(Space.page, Space.lg, Space.page, 0),
          child: notice,
        ),
    ];
  }

  Iterable<ExtractedField> _otherFacts(ActionReviewState review) {
    const family = {...CanonicalFieldKeys.dueDate, ...CanonicalFieldKeys.amount};
    return review.effectiveFields.where((f) => !family.contains(f.key));
  }

  // -------------------------------------------------------- canonical rows --

  Widget _dueRow(ActionReviewState review) {
    final slot = review.due;
    final colors = context.colors;

    if (slot.userDecided) {
      final value = slot.effectiveValue;
      return FactRow(
        label: 'Deadline',
        value: value == null
            ? 'None — you chose to leave this unset'
            : _dateFormat.format(value),
        display: ConfidenceDisplay.confirmed,
        numeric: value != null,
        onEdit: () => _resolveDue(review),
      );
    }

    switch (slot.canonical.status) {
      case CanonicalStatus.resolved:
        final field = slot.canonical.resolvedField!;
        return FactRow(
          label: 'Deadline',
          value: _dateFormat.format(field.dateValue!),
          display: ConfidenceDisplay.of(field),
          numeric: true,
          onEdit: () => _resolveDue(review),
          evidence: field.evidence,
          onEvidenceViewed: () => _log(AnalyticsEvents.reviewEvidenceViewed),
          source: _sourceItem,
        );
      case CanonicalStatus.ambiguous:
        return _AmbiguityCard(
          message: 'Action found multiple possible dates.',
          detail:
              '${slot.canonical.candidates.length} dates could be the deadline. '
              'Choose the right one, enter another, or leave it unset.',
          buttonLabel: 'Choose a date',
          color: colors.confidenceReview,
          onResolve: () => _resolveDue(review),
        );
      case CanonicalStatus.unverified:
        final candidate = slot.canonical.candidates.first;
        return FactRow(
          label: 'Deadline',
          value: candidate.hasValue ? candidate.value! : 'Unclear',
          display: ConfidenceDisplay.review,
          numeric: true,
          onEdit: () => _resolveDue(review),
          evidence: candidate.evidence,
          onEvidenceViewed: () => _log(AnalyticsEvents.reviewEvidenceViewed),
          source: _sourceItem,
        );
      case CanonicalStatus.absent:
        return FactRow(
          label: 'Deadline',
          // In manual mode nothing was searched, so "none found" would be
          // claiming a search that never happened — over a field the user
          // simply has not filled in yet.
          value: review.mode == ReviewMode.manual
              ? 'Not set'
              : 'None found in this document',
          display: ConfidenceDisplay.missing,
          onEdit: () => _resolveDue(review),
        );
    }
  }

  Widget _amountRow(ActionReviewState review) {
    final slot = review.amount;
    final colors = context.colors;

    if (slot.userDecided) {
      final value = slot.effectiveValue;
      return FactRow(
        label: 'Amount',
        value: value == null
            ? 'None — you chose to leave this unset'
            : '$value',
        display: ConfidenceDisplay.confirmed,
        numeric: value != null,
        onEdit: () => _resolveAmount(review),
      );
    }

    switch (slot.canonical.status) {
      case CanonicalStatus.resolved:
        final field = slot.canonical.resolvedField!;
        return FactRow(
          label: 'Amount',
          value: '${field.moneyValue!}',
          display: ConfidenceDisplay.of(field),
          numeric: true,
          onEdit: () => _resolveAmount(review),
          evidence: field.evidence,
          onEvidenceViewed: () => _log(AnalyticsEvents.reviewEvidenceViewed),
          source: _sourceItem,
        );
      case CanonicalStatus.ambiguous:
        return _AmbiguityCard(
          message: 'Action found more than one possible amount.',
          detail:
              '${slot.canonical.candidates.length} amounts could be the one '
              'this action is about. Choose, enter another, or leave it unset.',
          buttonLabel: 'Choose an amount',
          color: colors.confidenceReview,
          onResolve: () => _resolveAmount(review),
        );
      case CanonicalStatus.unverified:
        final candidate = slot.canonical.candidates.first;
        return FactRow(
          label: 'Amount',
          value: candidate.hasValue ? candidate.value! : 'Unclear',
          display: ConfidenceDisplay.review,
          numeric: true,
          onEdit: () => _resolveAmount(review),
          evidence: candidate.evidence,
          onEvidenceViewed: () => _log(AnalyticsEvents.reviewEvidenceViewed),
          source: _sourceItem,
        );
      case CanonicalStatus.absent:
        return FactRow(
          label: 'Amount',
          // In manual mode nothing was searched, so "none found" would be
          // claiming a search that never happened — over a field the user
          // simply has not filled in yet.
          value: review.mode == ReviewMode.manual
              ? 'Not set'
              : 'None found in this document',
          display: ConfidenceDisplay.missing,
          onEdit: () => _resolveAmount(review),
        );
    }
  }

  Widget _stepRow(ActionReviewState review, ReviewStep step) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.xs),
      child: Row(
        children: [
          IconButton(
            tooltip: step.included ? 'Skip this step' : 'Keep this step',
            onPressed: () =>
                _update(review.setStepIncluded(step.id, !step.included)),
            icon: Icon(
              step.included
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_rounded,
              color: step.included ? colors.textSecondary : colors.textTertiary,
            ),
          ),
          Expanded(
            child: Text(
              step.title,
              style: text.bodyLarge?.copyWith(
                color: step.included ? colors.textPrimary : colors.textTertiary,
                decoration: step.included ? null : TextDecoration.lineThrough,
              ),
            ),
          ),
          if (step.editedByUser)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: Space.xs),
              child: Icon(
                Icons.check_circle_outline_rounded,
                size: 16,
                color: colors.confidenceConfirmed,
              ),
            ),
          IconButton(
            tooltip: 'Edit step',
            onPressed: () async {
              final value = await _promptText(
                title: 'Edit step',
                initial: step.title,
              );
              if (value == null || !mounted) return;
              _log(AnalyticsEvents.reviewFieldEdited);
              _update(review.editStepTitle(step.id, value));
            },
            icon: const Icon(Icons.edit_outlined, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _confirmBar(ActionReviewState review) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final blockers = review.blockers;
    final manual = review.mode == ReviewMode.manual;

    // Manual mode always names its outcome; extracted mode only offers
    // confirmation language once nothing critical is open.
    final label = manual
        ? 'Create manually'
        : review.canConfirm
            ? 'Confirm & create action'
            : 'Review highlighted fields';

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(
          top: BorderSide(color: colors.border, width: Strokes.hairline),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              Space.page, Space.md, Space.page, Space.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (blockers.isNotEmpty) ...[
                for (final blocker in blockers)
                  Padding(
                    padding: const EdgeInsets.only(bottom: Space.xs),
                    child: Text(
                      blocker.message,
                      style: text.labelSmall
                          ?.copyWith(color: colors.confidenceReview),
                    ),
                  ),
                const SizedBox(height: Space.xs),
              ],
              FilledButton(
                onPressed: _saving ? null : () => _onConfirmPressed(review),
                child: Text(_saving ? 'Saving…' : label),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onConfirmPressed(ActionReviewState review) async {
    if (_saving) return;
    if (!review.canConfirm) {
      // The button never confirms around an open question — it restates the
      // first one instead.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(review.blockers.first.message)),
      );
      return;
    }

    final confirmed = _pendingDraft ??= review.confirm();
    setState(() => _saving = true);

    // The Action exists when — and only when — this local transaction
    // succeeds. No cloud call participates; the mirror runs strictly after,
    // and its failure can never reach back here.
    try {
      await ref
          .read(actionRepositoryProvider)
          .create(actionItemFromDraft(confirmed));
    } on Object {
      if (!mounted) return;
      setState(() => _saving = false);
      _log(AnalyticsEvents.actionLocalPersistenceFailed);
      // Review state and edits are untouched; the same draft (same id) is
      // retried on the next tap. No AI re-run, no lost source.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Could not save this action. Nothing was lost — try again.'),
        ),
      );
      return;
    }

    if (!mounted) return;
    _log(AnalyticsEvents.reviewConfirmed);
    _log(AnalyticsEvents.actionCreated);
    setState(() {
      _confirmed = confirmed;
      _saving = false;
    });
    unawaited(ref.read(actionSyncServiceProvider).flush());
  }

  // ------------------------------------------------------------ edit flows --

  Future<void> _editTitle(ActionReviewState review) async {
    final value = await _promptText(
      title: 'Title',
      initial: review.title,
      hint: 'What needs to happen?',
    );
    if (value == null || !mounted) return;
    _log(AnalyticsEvents.reviewFieldEdited);
    _update(review.withTitle(value));
  }

  Future<void> _editField(ActionReviewState review, ExtractedField field) async {
    final value = await _promptText(
      title: field.label,
      initial: field.value ?? '',
    );
    if (value == null || value.trim().isEmpty || !mounted) return;
    _log(AnalyticsEvents.reviewFieldEdited);
    _update(review.editFieldValue(field.key, value));
  }

  Future<void> _addStep(ActionReviewState review) async {
    final value = await _promptText(title: 'New step', hint: 'What to do');
    if (value == null || value.trim().isEmpty || !mounted) return;
    _log(AnalyticsEvents.reviewFieldEdited);
    _update(review.addManualStep(value));
  }

  Future<void> _resolveDue(ActionReviewState review) async {
    final outcome = await _showDueSheet(review);
    if (outcome == null || !mounted) return;
    _log(AnalyticsEvents.reviewFieldEdited);
    switch (outcome) {
      case _SlotAccepted(:final field):
        _update(review.acceptDueCandidate(field));
      case _SlotEdited(:final date):
        _update(review.editDue(date!));
      case _SlotUnset():
        _update(review.unsetDue());
    }
  }

  Future<void> _resolveAmount(ActionReviewState review) async {
    final outcome = await _showAmountSheet(review);
    if (outcome == null || !mounted) return;
    _log(AnalyticsEvents.reviewFieldEdited);
    switch (outcome) {
      case _SlotAccepted(:final field):
        _update(review.acceptAmountCandidate(field));
      case _SlotEdited(:final money):
        _update(review.editAmount(money!));
      case _SlotUnset():
        _update(review.unsetAmount());
    }
  }

  Future<String?> _promptText({
    required String title,
    String initial = '',
    String? hint,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
        ),
        child: AppSheet(
          title: title,
          child: _TextPrompt(initial: initial, hint: hint),
        ),
      ),
    );
  }

  Future<_SlotOutcome?> _showDueSheet(ActionReviewState review) {
    return showModalBottomSheet<_SlotOutcome>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
        ),
        child: AppSheet(
          title: 'Deadline',
          subtitle: review.due.canonical.status == CanonicalStatus.ambiguous
              ? 'The document mentions more than one date.'
              : null,
          child: _DateSlotSheet(
            candidates: review.due.canonical.candidates,
            dateFormat: _dateFormat,
            source: _sourceItem,
          ),
        ),
      ),
    );
  }

  Future<_SlotOutcome?> _showAmountSheet(ActionReviewState review) {
    return showModalBottomSheet<_SlotOutcome>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
        ),
        child: AppSheet(
          title: 'Amount',
          subtitle: review.amount.canonical.status == CanonicalStatus.ambiguous
              ? 'The document mentions more than one amount.'
              : null,
          child: _AmountSlotSheet(
            candidates: review.amount.canonical.candidates,
            source: _sourceItem,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sheet outcome types
// ---------------------------------------------------------------------------

sealed class _SlotOutcome {
  const _SlotOutcome();
}

final class _SlotAccepted extends _SlotOutcome {
  const _SlotAccepted(this.field);
  final ExtractedField field;
}

final class _SlotEdited extends _SlotOutcome {
  const _SlotEdited({this.date, this.money});
  final DateTime? date;
  final MoneyValue? money;
}

final class _SlotUnset extends _SlotOutcome {
  const _SlotUnset();
}

// ---------------------------------------------------------------------------
// Sheets
// ---------------------------------------------------------------------------

class _TextPrompt extends StatefulWidget {
  const _TextPrompt({required this.initial, this.hint});

  final String initial;
  final String? hint;

  @override
  State<_TextPrompt> createState() => _TextPromptState();
}

class _TextPromptState extends State<_TextPrompt> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Space.page, Space.sm, Space.page, Space.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            maxLines: null,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(hintText: widget.hint),
            onSubmitted: (value) => Navigator.of(context).pop(value),
          ),
          const SizedBox(height: Space.lg),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(_controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

/// Choose between date candidates, enter another, or leave the slot unset.
class _DateSlotSheet extends StatefulWidget {
  const _DateSlotSheet({
    required this.candidates,
    required this.dateFormat,
    this.source,
  });

  final List<ExtractedField> candidates;
  final DateFormat dateFormat;
  final SourceItem? source;

  @override
  State<_DateSlotSheet> createState() => _DateSlotSheetState();
}

class _DateSlotSheetState extends State<_DateSlotSheet> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Space.page, Space.sm, Space.page, Space.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final candidate in widget.candidates)
            _CandidateRow(
              title: candidate.dateValue != null
                  ? widget.dateFormat.format(candidate.dateValue!)
                  : (candidate.value ?? '—'),
              subtitle: candidate.label,
              quote: candidate.evidence?.quote,
              evidence: candidate.evidence,
              source: widget.source,
              label: 'Deadline',
              trusted: candidate.isTrustworthy,
              // A candidate with no parseable date cannot be accepted as
              // one — it can only be typed in deliberately below.
              onTap: candidate.dateValue == null
                  ? null
                  : () => Navigator.of(context).pop(_SlotAccepted(candidate)),
            ),
          if (widget.candidates.isNotEmpty) const SizedBox(height: Space.md),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              hintText: 'Another date — 2026-08-30',
              errorText: _error,
            ),
          ),
          const SizedBox(height: Space.md),
          FilledButton(
            onPressed: () {
              final typed = _controller.text.trim();
              // The same strict parser the validator uses: an impossible
              // date is refused, never rolled into a plausible one.
              final parsed = typed.isEmpty ? null : parseStrictIso8601(typed);
              if (typed.isNotEmpty && parsed == null) {
                setState(() {
                  _error = 'Not a real date. Use the format 2026-08-30.';
                });
                return;
              }
              if (parsed != null) {
                Navigator.of(context).pop(_SlotEdited(date: parsed));
              } else {
                setState(() => _error = 'Type a date, or leave it unset below.');
              }
            },
            child: const Text('Use this date'),
          ),
          const SizedBox(height: Space.xs),
          TextButton(
            onPressed: () => Navigator.of(context).pop(const _SlotUnset()),
            child: Text(
              'Leave without a deadline',
              style: text.labelLarge?.copyWith(color: colors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

/// Choose between amount candidates, enter another, or leave the slot unset.
class _AmountSlotSheet extends StatefulWidget {
  const _AmountSlotSheet({required this.candidates, this.source});

  final List<ExtractedField> candidates;
  final SourceItem? source;

  @override
  State<_AmountSlotSheet> createState() => _AmountSlotSheetState();
}

class _AmountSlotSheetState extends State<_AmountSlotSheet> {
  final _controller = TextEditingController();
  late String _currency = widget.candidates
          .map((c) => c.moneyValue?.currencyCode)
          .whereType<String>()
          .firstOrNull ??
      'BDT';
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final currencies = supportedCurrencies.toList()..sort();
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Space.page, Space.sm, Space.page, Space.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final candidate in widget.candidates)
            _CandidateRow(
              title: candidate.moneyValue?.toString() ?? (candidate.value ?? '—'),
              subtitle: candidate.label,
              quote: candidate.evidence?.quote,
              evidence: candidate.evidence,
              source: widget.source,
              label: 'Amount',
              trusted: candidate.isTrustworthy,
              onTap: candidate.moneyValue == null
                  ? null
                  : () => Navigator.of(context).pop(_SlotAccepted(candidate)),
            ),
          if (widget.candidates.isNotEmpty) const SizedBox(height: Space.md),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Another amount — 780.00',
                    errorText: _error,
                  ),
                ),
              ),
              const SizedBox(width: Space.sm),
              DropdownMenu<String>(
                initialSelection: _currency,
                requestFocusOnTap: false,
                dropdownMenuEntries: [
                  for (final code in currencies)
                    DropdownMenuEntry(value: code, label: code),
                ],
                onSelected: (code) {
                  if (code != null) setState(() => _currency = code);
                },
              ),
            ],
          ),
          const SizedBox(height: Space.md),
          FilledButton(
            onPressed: () {
              switch (MoneyValue.parse(_controller.text.trim(), _currency)) {
                case MoneyParsed(:final value):
                  Navigator.of(context).pop(_SlotEdited(money: value));
                case MoneyRejected(:final error):
                  setState(() =>
                      _error = 'Cannot use this amount: ${error.reason}.');
              }
            },
            child: const Text('Use this amount'),
          ),
          const SizedBox(height: Space.xs),
          TextButton(
            onPressed: () => Navigator.of(context).pop(const _SlotUnset()),
            child: Text(
              'Leave without an amount',
              style: text.labelLarge?.copyWith(color: colors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

class _CandidateRow extends StatelessWidget {
  const _CandidateRow({
    required this.title,
    required this.subtitle,
    required this.trusted,
    required this.onTap,
    this.quote,
    this.evidence,
    this.source,
    this.label = 'This value',
  });

  final String title;
  final String subtitle;
  final String? quote;
  final bool trusted;
  final VoidCallback? onTap;

  /// The evidence behind this candidate, so the row can offer the lens.
  ///
  /// Choosing between two deadlines is the moment where seeing *where on the
  /// page* each one sits decides it — one is in a sentence about payment and
  /// the other is the date at the top of the letter, and the quote alone
  /// often does not make that obvious.
  final ExtractionEvidence? evidence;
  final SourceItem? source;
  final String label;

  bool get _canShowOnCapture {
    final evidence = this.evidence;
    final source = this.source;
    if (evidence == null || source?.imagePath == null) return false;
    return EvidenceRegions.forEvidence(
      evidence: evidence,
      lines: source!.ocr?.lines ?? const [],
      imageWidth: source.imageWidth,
      imageHeight: source.imageHeight,
    ).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.sm),
      child: InkWell(
        borderRadius: Radii.rMd,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Space.md),
          decoration: BoxDecoration(
            border: Border.all(color: colors.border, width: Strokes.hairline),
            borderRadius: Radii.rMd,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: text.titleSmall
                          ?.copyWith(fontFeatures: AppText.numeric),
                    ),
                  ),
                  if (!trusted)
                    Text(
                      'Needs review',
                      style: text.labelSmall
                          ?.copyWith(color: colors.confidenceReview),
                    ),
                ],
              ),
              Text(
                subtitle,
                style: text.labelSmall?.copyWith(color: colors.textTertiary),
              ),
              if (quote != null && quote!.isNotEmpty) ...[
                const SizedBox(height: Space.xs),
                Text(
                  '“$quote”',
                  style: text.bodySmall?.copyWith(
                    color: colors.textSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (_canShowOnCapture)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton.icon(
                    // Deliberately does not select the candidate. Looking at
                    // the evidence and choosing are different decisions, and
                    // conflating them would make the safer action — checking
                    // first — commit the user to an answer.
                    onPressed: () => showEvidenceLens(
                      context,
                      evidence: evidence!,
                      label: label,
                      source: source,
                    ),
                    icon: const Icon(Icons.center_focus_strong_outlined,
                        size: 18),
                    label: const Text('See it on the capture'),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(0, 40),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Space.sm,
                      ),
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

// ---------------------------------------------------------------------------
// Subviews
// ---------------------------------------------------------------------------

class _SourceStrip extends StatelessWidget {
  const _SourceStrip({required this.item, required this.onViewSource});

  final SourceItem item;
  final VoidCallback onViewSource;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final icon = switch (item.type) {
      SourceType.photo => Icons.photo_camera_outlined,
      SourceType.gallery => Icons.image_outlined,
      SourceType.pastedText => Icons.notes_rounded,
      SourceType.document => Icons.picture_as_pdf_outlined,
    };
    return Container(
      margin: const EdgeInsets.fromLTRB(Space.page, Space.md, Space.page, 0),
      padding: const EdgeInsets.symmetric(
          horizontal: Space.md, vertical: Space.sm),
      decoration: BoxDecoration(
        color: colors.surfaceSunken,
        borderRadius: Radii.rMd,
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colors.textSecondary),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Text(
              '${item.type.provenanceLabel} · '
              '${DateFormat('d MMM, HH:mm').format(item.capturedAt)}',
              style: text.labelSmall?.copyWith(color: colors.textSecondary),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            onPressed: onViewSource,
            child: const Text('View source'),
          ),
        ],
      ),
    );
  }
}

class _UnderstandingMeta extends StatelessWidget {
  const _UnderstandingMeta({required this.draft});

  final ActionDraft draft;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final urgency = draft.urgency;
    final category = draft.category;

    final urgencyColor = switch (urgency) {
      ActionUrgency.critical => colors.urgencyCritical,
      ActionUrgency.important => colors.urgencyImportant,
      ActionUrgency.normal => colors.urgencyNormal,
      ActionUrgency.low || ActionUrgency.unknown => colors.urgencyLow,
    };

    return Row(
      children: [
        // Urgency is the warm family and renders as a solid fill.
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Space.sm, vertical: Space.xxs),
          decoration: BoxDecoration(
            color: urgencyColor,
            borderRadius: Radii.rSm,
          ),
          child: Text(
            urgency.label,
            style: text.labelSmall?.copyWith(
              color: colors.surface,
              letterSpacing: 0,
            ),
          ),
        ),
        const SizedBox(width: Space.sm),
        Text(
          category.label,
          style: text.labelMedium?.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }
}

class _AmbiguityCard extends StatelessWidget {
  const _AmbiguityCard({
    required this.message,
    required this.detail,
    required this.buttonLabel,
    required this.color,
    required this.onResolve,
  });

  final String message;
  final String detail;
  final String buttonLabel;
  final Color color;
  final VoidCallback onResolve;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Space.lg),
      decoration: BoxDecoration(
        color: colors.surfaceElevated,
        borderRadius: Radii.rMd,
        border: Border.all(color: color, width: Strokes.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.call_split_rounded, size: 18, color: color),
              const SizedBox(width: Space.sm),
              Expanded(child: Text(message, style: text.titleSmall)),
            ],
          ),
          const SizedBox(height: Space.xs),
          Text(detail, style: text.bodySmall),
          const SizedBox(height: Space.md),
          OutlinedButton(onPressed: onResolve, child: Text(buttonLabel)),
        ],
      ),
    );
  }
}

class _ProcessingView extends StatelessWidget {
  const _ProcessingView({required this.stage});

  final int stage;

  static const _stages = [
    'Reading source',
    'Understanding important details',
    'Checking what needs review',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Space.xxxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final (index, label) in _stages.indexed)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Space.sm),
                child: Row(
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: index < stage
                          ? Icon(
                              Icons.check_rounded,
                              size: 18,
                              color: colors.confidenceConfirmed,
                            )
                          : index == stage
                              ? const Padding(
                                  padding: EdgeInsets.all(Space.xxs),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Icon(
                                  Icons.circle_outlined,
                                  size: 10,
                                  color: colors.border,
                                ),
                    ),
                    const SizedBox(width: Space.md),
                    Text(
                      label,
                      style: index <= stage
                          ? text.bodyLarge
                          : text.bodyLarge
                              ?.copyWith(color: colors.textTertiary),
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

class _NoActionView extends StatelessWidget {
  const _NoActionView({
    required this.item,
    required this.onAddAnyway,
    required this.onDone,
  });

  final SourceItem? item;
  final VoidCallback onAddAnyway;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Space.xxxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors.confidenceConfirmed,
                  width: Strokes.hairline,
                ),
              ),
              child: Icon(
                Icons.check_rounded,
                size: 32,
                color: colors.confidenceConfirmed,
              ),
            ),
            const SizedBox(height: Space.xl),
            Text('Nothing you need to do right now.',
                style: text.headlineSmall, textAlign: TextAlign.center),
            const SizedBox(height: Space.sm),
            Text(
              'This looks like information only — no deadline, payment or '
              'reply was found${item != null ? ' in this ${item!.type == SourceType.pastedText ? 'text' : 'capture'}' : ''}. '
              'The source is kept either way.',
              style: text.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Space.xxl),
            FilledButton(onPressed: onDone, child: const Text('Done')),
            const SizedBox(height: Space.sm),
            TextButton(
              onPressed: onAddAnyway,
              child: const Text('Add an action anyway'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({required this.draft, required this.dateFormat});

  final ConfirmedActionDraft draft;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Space.xxxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors.confidenceConfirmed,
                  width: Strokes.hairline,
                ),
              ),
              child: Icon(
                Icons.check_rounded,
                size: 32,
                color: colors.confidenceConfirmed,
              ),
            ),
            const SizedBox(height: Space.xl),
            Text('Action confirmed', style: text.headlineSmall),
            const SizedBox(height: Space.sm),
            Text(draft.title, style: text.bodyLarge, textAlign: TextAlign.center),
            const SizedBox(height: Space.md),
            if (draft.dueAt != null)
              Text(
                'Due ${dateFormat.format(draft.dueAt!)}',
                style: text.bodyMedium?.copyWith(fontFeatures: AppText.numeric),
              ),
            if (draft.amount != null)
              Text(
                '${draft.amount}',
                style: text.bodyMedium?.copyWith(fontFeatures: AppText.numeric),
              ),
            const SizedBox(height: Space.md),
            Text(
              draft.manuallyCreated
                  ? 'Created by you.'
                  : 'Confirmed by you from ${draft.facts.length} reviewed '
                      'fact${draft.facts.length == 1 ? '' : 's'}'
                      '${draft.editedFactCount > 0 ? ', ${draft.editedFactCount} edited' : ''}.',
              style: text.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Space.xs),
            Text(
              'Saved on this device.',
              style: text.labelSmall?.copyWith(color: colors.textTertiary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Space.xxl),
            FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
