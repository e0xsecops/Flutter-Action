/// Wiring for Goals, and the only sanctioned way to change one.
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../data/json_goal_store.dart';
import '../domain/goal.dart';

final _uuid = Uuid();

final goalStoreProvider = FutureProvider<GoalStore>((ref) async {
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    return JsonFileGoalStore(directory);
  } on Object {
    // A widget test has no path_provider behind the channel. Losing Goals is
    // better than an app that cannot open, which is the same call the
    // preference store and the reminder scheduler already make.
    return InMemoryGoalStore();
  }
});

final goalsProvider =
    AsyncNotifierProvider<GoalsNotifier, List<Goal>>(GoalsNotifier.new);

class GoalsNotifier extends AsyncNotifier<List<Goal>> {
  @override
  Future<List<Goal>> build() async {
    final store = await ref.watch(goalStoreProvider.future);
    return store.all();
  }

  Future<Goal> create({
    required String title,
    String? outcome,
    String? context,
    DateTime? now,
  }) async {
    final at = now ?? DateTime.now();
    final goal = Goal(
      id: _uuid.v4(),
      title: title.trim(),
      outcome: _clean(outcome),
      context: _clean(context),
      createdAt: at,
      updatedAt: at,
    );
    final store = await ref.read(goalStoreProvider.future);
    await store.add(goal);
    await _publish(store);
    return goal;
  }

  Future<void> save(Goal goal, {DateTime? now}) async {
    final store = await ref.read(goalStoreProvider.future);
    await store.update(goal.copyWith(updatedAt: now ?? DateTime.now()));
    await _publish(store);
  }

  /// Marks a Goal reached, or puts it back.
  ///
  /// The user's own judgement, never inferred. A goal can be met without
  /// finishing every task it produced, and finishing every task does not
  /// always mean the goal was met.
  Future<void> setAchieved(Goal goal, bool achieved, {DateTime? now}) async {
    final at = now ?? DateTime.now();
    await save(
      goal.copyWith(
        status: achieved ? GoalStatus.achieved : GoalStatus.active,
        achievedAt: achieved ? at : null,
        clearAchievedAt: !achieved,
      ),
      now: at,
    );
  }

  Future<void> archive(Goal goal, {DateTime? now}) =>
      save(goal.copyWith(status: GoalStatus.archived), now: now);

  /// Records that an Action came out of this Goal.
  Future<void> linkAction(String goalId, String actionId,
      {DateTime? now}) async {
    final store = await ref.read(goalStoreProvider.future);
    final goal = await store.byId(goalId);
    if (goal == null) return;
    final at = now ?? DateTime.now();
    await store.update(goal.linking(actionId, now: at));
    await _publish(store);
  }

  Future<void> delete(String id) async {
    final store = await ref.read(goalStoreProvider.future);
    await store.delete(id);
    await _publish(store);
  }

  Future<void> _publish(GoalStore store) async {
    state = AsyncData(await store.all());
  }

  static String? _clean(String? value) {
    final trimmed = value?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }
}

/// One Goal, watched.
final goalProvider = Provider.family<Goal?, String>((ref, id) {
  final goals = ref.watch(goalsProvider).value ?? const <Goal>[];
  return goals.where((g) => g.id == id).firstOrNull;
});

/// Goals still being worked on, which is what Library shows.
final openGoalsProvider = Provider<List<Goal>>((ref) {
  final goals = ref.watch(goalsProvider).value ?? const <Goal>[];
  return goals.where((g) => g.isOpen).toList();
});
