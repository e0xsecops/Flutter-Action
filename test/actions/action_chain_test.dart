import 'package:action_app/features/actions/application/action_chain.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/actions_test_support.dart';

/// The next-best-action rule.
///
/// The product claim is that "what do I do now?" has a predictable answer, so
/// these tests pin the rule itself rather than a rendering of it. Nothing
/// here is a score, a weight, or a model call.
void main() {
  group('next best action', () {
    test('with no chain and no suggestion, nothing is proposed', () {
      expect(nextBestAction(sampleAction('a1')), isA<NothingProposed>());
    });

    test('with no chain, the reviewed suggestion is the next move', () {
      final action = sampleAction('a1')
          .withEdits(updatedAt: testNow, recommendedNextStep: 'Call the bank');
      expect(
        (nextBestAction(action) as NextSuggestion).text,
        'Call the bank',
      );
    });

    test('a whitespace-only suggestion is not a suggestion', () {
      final action =
          sampleAction('a1').withEdits(updatedAt: testNow, recommendedNextStep: '   ');
      expect(nextBestAction(action), isA<NothingProposed>());
    });

    test('the first outstanding step is the next move', () {
      final action = sampleAction('a1', steps: [
        sampleStep('s1', order: 0, isCompleted: true),
        sampleStep('s2', order: 1),
        sampleStep('s3', order: 2),
      ]);
      expect((nextBestAction(action) as NextStep).step.id, 's2');
    });

    test('a chain supersedes the suggestion rather than competing with it',
        () {
      // Once the work is broken into steps, showing both would ask the person
      // to decide what to do twice.
      final action = sampleAction('a1', steps: [sampleStep('s1')])
          .withEdits(updatedAt: testNow, recommendedNextStep: 'Call the bank');
      expect(nextBestAction(action), isA<NextStep>());
    });

    test('a fully checked chain proposes finishing the Action, not a step',
        () {
      final action = sampleAction('a1', steps: [
        sampleStep('s1', order: 0, isCompleted: true),
        sampleStep('s2', order: 1, isCompleted: true),
      ]);
      expect(nextBestAction(action), isA<ChainFinished>());
    });

    test('a completed Action proposes nothing at all', () {
      final action = sampleAction(
        'a1',
        status: ActionStatus.completed,
        steps: [sampleStep('s1')],
      );
      expect(nextBestAction(action), isA<NothingProposed>());
    });

    test('order, not insertion, decides which step is next', () {
      final action = sampleAction('a1', steps: [
        sampleStep('z', order: 5),
        sampleStep('a', order: 1),
      ]);
      expect((nextBestAction(action) as NextStep).step.id, 'a');
    });

    test('steps sharing a position still resolve to one deterministic next',
        () {
      // Gaps and duplicates are tolerated on read; ties break on id so the
      // answer can never depend on row order.
      final action = sampleAction('a1', steps: [
        sampleStep('b', order: 0),
        sampleStep('a', order: 0),
      ]);
      expect((nextBestAction(action) as NextStep).step.id, 'a');
      expect(orderedSteps(action).map((s) => s.id), ['a', 'b']);
    });
  });

  group('progress', () {
    test('no chain means no progress indicator', () {
      // "0 of 0 done" is noise, not information.
      expect(chainProgress(sampleAction('a1')), isNull);
    });

    test('counts completed against total', () {
      final action = sampleAction('a1', steps: [
        sampleStep('s1', isCompleted: true),
        sampleStep('s2', order: 1),
        sampleStep('s3', order: 2),
      ]);
      final progress = chainProgress(action)!;
      expect(progress.completed, 1);
      expect(progress.total, 3);
      expect(progress.isComplete, isFalse);
      expect('$progress', '1 of 3 steps completed');
    });

    test('is complete only when every step is', () {
      final action = sampleAction('a1', steps: [
        sampleStep('s1', isCompleted: true),
        sampleStep('s2', order: 1, isCompleted: true),
      ]);
      expect(chainProgress(action)!.isComplete, isTrue);
      expect(chainProgress(action)!.fraction, 1.0);
    });
  });
}
