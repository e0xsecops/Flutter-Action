import 'package:action_app/features/actions/application/action_triage.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/capture/domain/source_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/home/application/action_brief.dart';
import 'package:flutter_test/flutter_test.dart';

import '../actions/support/actions_test_support.dart';

/// The Action Brief is the first sentence a user reads every day, so it is
/// tested as pure logic rather than through a widget tree. Every one of these
/// is a claim the app makes on Today.

final _now = DateTime(2026, 8, 18, 12);

TriagedHome home({
  List<ActionItem> needsAttention = const [],
  List<ActionItem> upcoming = const [],
  List<ActionItem> completed = const [],
  Map<String, ActionTriageDecision> decisions = const {},
}) =>
    TriagedHome(
      needsAttention: needsAttention,
      upcoming: upcoming,
      completed: completed,
      decisions: decisions,
    );

SourceItem source(String id, {SourceProcessingState? state, String? text}) =>
    SourceItem(
      id: id,
      type: SourceType.pastedText,
      capturedAt: _now,
      pastedText: text ?? 'Some captured text',
      state: state ?? SourceProcessingState.ready,
    );

ActionBrief brief({
  TriagedHome? triaged,
  List<SourceItem> sources = const [],
  Set<String> actioned = const {},
  bool hasAnyAction = true,
}) =>
    ActionBrief.from(
      home: triaged ?? home(),
      sources: sources,
      actionedSourceIds: actioned,
      hasAnyAction: hasAnyAction,
    );

void main() {
  group('nothing to do', () {
    test('a brand-new user is invited, not congratulated', () {
      final b = brief(hasAnyAction: false);

      expect(b.tone, BriefTone.clear);
      expect(b.isFirstRun, isTrue);
      // Day 15 banned "Nothing here yet": it describes the app's state instead
      // of telling the person what to do.
      expect(b.headline, isNot(contains('Nothing here yet')));
      expect(b.headline, 'Start with anything');
    });

    test('someone who cleared their list is congratulated, not onboarded', () {
      final b = brief(hasAnyAction: true);

      expect(b.tone, BriefTone.clear);
      // The distinction the whole empty state turns on. Showing a "what Action
      // does" primer here would erase the win.
      expect(b.isFirstRun, isFalse);
      expect(b.headline, "You're clear");
    });

    test('an archived Action still counts as having used the app', () {
      // Nothing is pending, but this is not a first run.
      expect(brief(hasAnyAction: true).isFirstRun, isFalse);
    });
  });

  group('attention outranks everything', () {
    test('one Action needing attention is stated singularly', () {
      final b = brief(
        triaged: home(needsAttention: [sampleAction('a1', title: 'Renew')]),
      );

      expect(b.tone, BriefTone.attention);
      expect(b.headline, '1 action needs your attention');
      expect(b.needsAttentionCount, 1);
    });

    test('several are counted', () {
      final b = brief(
        triaged: home(needsAttention: [
          sampleAction('a1', title: 'A'),
          sampleAction('a2', title: 'B'),
          sampleAction('a3', title: 'C'),
        ]),
      );
      expect(b.headline, '3 actions need your attention');
    });

    test('attention wins even when captures are also waiting', () {
      final b = brief(
        triaged: home(needsAttention: [sampleAction('a1', title: 'A')]),
        sources: [source('s1'), source('s2')],
      );

      expect(b.tone, BriefTone.attention);
      // The captures are not lost — they move to the second line.
      expect(b.detail, contains('2 captures'));
    });

    test('the top action is the first one triage put in the band', () {
      final first = sampleAction('a1', title: 'First');
      final b = brief(
        triaged: home(needsAttention: [first, sampleAction('a2', title: 'B')]),
      );
      expect(b.topAction?.id, 'a1');
    });
  });

  group('captures waiting', () {
    test('a capture with no Action yet is waiting, whatever its state', () {
      // The narrow "ready and has text" rule made Today go blank straight after
      // a capture, while OCR was still running — the thing you just added
      // appeared to have been swallowed.
      for (final state in SourceProcessingState.values) {
        final b = brief(sources: [source('s1', state: state)]);
        expect(b.awaitingReviewCount, 1, reason: state.name);
        expect(b.tone, BriefTone.review, reason: state.name);
      }
    });

    test('a capture that became an Action is no longer waiting', () {
      final b = brief(sources: [source('s1')], actioned: {'s1'});
      expect(b.awaitingReviewCount, 0);
      expect(b.tone, BriefTone.clear);
    });

    test('says nothing is overdue, because nothing is', () {
      final b = brief(sources: [source('s1')]);
      expect(b.headline, '1 capture is waiting for you');
      expect(b.detail, 'Nothing is overdue.');
    });
  });

  group('upcoming only', () {
    test('reports the day as clear and the count as ahead', () {
      final b = brief(
        triaged: home(upcoming: [sampleAction('a1', title: 'Later')]),
      );

      expect(b.tone, BriefTone.upcoming);
      expect(b.headline, 'Nothing needs you today');
      expect(b.detail, '1 action is coming up.');
      // The hero still points at something, so the screen is not empty.
      expect(b.topAction?.id, 'a1');
    });
  });

  group('the brief never invents', () {
    test('no headline claims a deadline that was not given', () {
      final b = brief(
        triaged: home(upcoming: [sampleAction('a1', title: 'No date')]),
      );
      expect(b.headline.toLowerCase(), isNot(contains('due')));
      expect(b.headline.toLowerCase(), isNot(contains('tomorrow')));
    });

    test('no score, percentage or probability anywhere in the copy', () {
      // A rank the user cannot argue with is a rank they cannot trust — the
      // rule the triage engine already holds, extended to the brief.
      final samples = [
        brief(hasAnyAction: false),
        brief(hasAnyAction: true),
        brief(sources: [source('s1')]),
        brief(triaged: home(needsAttention: [sampleAction('a1', title: 'A')])),
        brief(triaged: home(upcoming: [sampleAction('a1', title: 'A')])),
      ];

      for (final b in samples) {
        final copy = '${b.headline} ${b.detail ?? ''}';
        expect(copy, isNot(matches(RegExp(r'\d+\s?%'))), reason: copy);
        expect(copy.toLowerCase(), isNot(contains('score')), reason: copy);
        expect(copy.toLowerCase(), isNot(contains('priority')), reason: copy);
        expect(copy.toLowerCase(), isNot(contains('urgent')), reason: copy);
      }
    });

    test('never shouts', () {
      final b = brief(
        triaged: home(needsAttention: [
          sampleAction('a1', title: 'A', urgency: ActionUrgency.critical),
        ]),
      );
      expect(b.headline, isNot(contains('!')));
    });
  });
}
