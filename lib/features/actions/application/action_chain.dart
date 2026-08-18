import '../domain/action_item.dart';

/// What the person should do next, decided by rules rather than by a score.
///
/// Nothing here calls a model, weighs a hidden signal, or learns. The whole
/// point of the detail screen is that "what now?" has an answer you can
/// predict and argue with, so this resolution is total, deterministic, and
/// derived only from what the user themselves confirmed or typed.
sealed class NextBestAction {
  const NextBestAction();
}

/// Work through the chain: this step is the first one still outstanding.
final class NextStep extends NextBestAction {
  const NextStep(this.step);

  final ActionStepItem step;
}

/// No chain, but the review kept a suggested next move. Shown as guidance,
/// never as a checkbox — it is a sentence, not a tracked commitment.
final class NextSuggestion extends NextBestAction {
  const NextSuggestion(this.text);

  final String text;
}

/// Every step is done, and the Action is still open. The screen offers to
/// finish it; it never decides that on the user's behalf.
final class ChainFinished extends NextBestAction {
  const ChainFinished();
}

/// Nothing to propose: no steps, no suggestion. Better to say nothing than to
/// invent a next move.
final class NothingProposed extends NextBestAction {
  const NothingProposed();
}

/// Steps in the order they should be worked, total even if positions collide.
List<ActionStepItem> orderedSteps(ActionItem action) {
  final steps = [...action.steps]..sort((a, b) {
      final byOrder = a.order.compareTo(b.order);
      return byOrder != 0 ? byOrder : a.id.compareTo(b.id);
    });
  return steps;
}

/// Resolves the single next thing to do.
///
/// A checklist supersedes the extraction's suggested step: once a person has
/// broken the work into steps, the first outstanding one *is* the next move,
/// and showing both would make the screen ask them to decide twice. The
/// suggestion returns as the answer only when there is no chain to follow.
NextBestAction nextBestAction(ActionItem action) {
  if (action.status != ActionStatus.active) return const NothingProposed();

  final steps = orderedSteps(action);
  if (steps.isNotEmpty) {
    for (final step in steps) {
      if (!step.isCompleted) return NextStep(step);
    }
    return const ChainFinished();
  }

  final suggestion = action.recommendedNextStep?.trim();
  if (suggestion != null && suggestion.isNotEmpty) {
    return NextSuggestion(suggestion);
  }
  return const NothingProposed();
}

/// Chain progress, or null when there is no chain — "0 of 0" is noise, not
/// information.
final class ChainProgress {
  const ChainProgress({required this.completed, required this.total});

  final int completed;
  final int total;

  bool get isComplete => total > 0 && completed == total;
  double get fraction => total == 0 ? 0 : completed / total;

  @override
  String toString() => '$completed of $total steps completed';
}

ChainProgress? chainProgress(ActionItem action) {
  if (action.steps.isEmpty) return null;
  return ChainProgress(
    completed: action.steps.where((s) => s.isCompleted).length,
    total: action.steps.length,
  );
}
