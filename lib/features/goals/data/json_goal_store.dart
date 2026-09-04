/// JSON-file storage for Goals.
///
/// The same shape as the capture index, and for the same reasons: one file,
/// rewritten on change, a corrupt file degrading to an empty list rather than
/// taking the app down. Goals are few and small; a table and a migration would
/// be machinery bought for volume that does not exist.
///
/// **Why not Drift, given Actions are there.** Putting Goals in the database
/// would mean a schema migration on every existing install for a feature that
/// is entirely local and entirely new. The link between the two lives on the
/// Goal — see [Goal] — precisely so the Action side needs no change at all.
library;

import 'dart:convert';
import 'dart:io';

import '../domain/goal.dart';

class JsonFileGoalStore implements GoalStore {
  JsonFileGoalStore(this.directory);

  /// Injected rather than resolved internally, so tests use a temp folder.
  final Directory directory;

  static const _fileName = 'goals.json';

  File get _file =>
      File('${directory.path}${Platform.pathSeparator}$_fileName');

  @override
  Future<List<Goal>> all() async {
    final file = _file;
    if (!await file.exists()) return const [];

    try {
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! List) return const [];
      return decoded
          .whereType<Map<String, dynamic>>()
          .map(Goal.fromJson)
          .nonNulls
          .toList(growable: false)
        ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    } on FormatException {
      return const [];
    } on FileSystemException {
      return const [];
    }
  }

  @override
  Future<Goal?> byId(String id) async =>
      (await all()).where((g) => g.id == id).firstOrNull;

  @override
  Future<void> add(Goal goal) async {
    final goals = [...await all(), goal];
    await _write(goals);
  }

  @override
  Future<void> update(Goal goal) async {
    final goals = await all();
    final index = goals.indexWhere((g) => g.id == goal.id);
    if (index < 0) return;
    await _write([...goals]..[index] = goal);
  }

  @override
  Future<void> delete(String id) async {
    final goals = await all();
    await _write(goals.where((g) => g.id != id).toList());
  }

  @override
  Future<void> clear() async {
    final file = _file;
    try {
      if (await file.exists()) await file.delete();
    } on FileSystemException {
      // Nothing useful to do. A privacy wipe reports what it could not remove
      // through its own accounting, not by throwing from here.
    }
  }

  Future<void> _write(List<Goal> goals) async {
    if (!await directory.exists()) await directory.create(recursive: true);
    await _file.writeAsString(
      jsonEncode(goals.map((g) => g.toJson()).toList()),
      flush: true,
    );
  }
}

/// For tests and for the case where no writable directory is available.
class InMemoryGoalStore implements GoalStore {
  InMemoryGoalStore([List<Goal> seed = const []]) : _goals = [...seed];

  final List<Goal> _goals;

  @override
  Future<List<Goal>> all() async =>
      List.unmodifiable([..._goals]..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)));

  @override
  Future<Goal?> byId(String id) async =>
      _goals.where((g) => g.id == id).firstOrNull;

  @override
  Future<void> add(Goal goal) async => _goals.add(goal);

  @override
  Future<void> update(Goal goal) async {
    final index = _goals.indexWhere((g) => g.id == goal.id);
    if (index < 0) return;
    _goals[index] = goal;
  }

  @override
  Future<void> delete(String id) async => _goals.removeWhere((g) => g.id == id);

  @override
  Future<void> clear() async => _goals.clear();
}
