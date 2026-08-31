/// Something the user wants, that Action can help turn into execution.
///
/// **What a Goal is not.** Not a project, not a board, not a habit tracker,
/// and not something with a score. It is a sentence about a desired outcome,
/// plus whatever Actions have come out of it so far. The moment it grows
/// assignees, phases or a percentage it has stopped being the thing this app is
/// for and become project-management software that happens to be on a phone.
///
/// **Why the link lives here rather than on the Action.** A Goal holds
/// [linkedActionIds]; an Action knows nothing about Goals. That direction was
/// chosen deliberately: Actions are the durable, mirrored, heavily-tested part
/// of this app, and pointing them at a new local-only concept would mean a
/// database migration and a change to the cloud payload for a feature that is
/// entirely on-device. This way a Goal can be deleted, or the whole feature
/// removed, without an Action noticing.
///
/// **Entirely local.** Goals are never mirrored, never sent anywhere on their
/// own, and go to a provider only when the user runs a tool on one.
library;

/// Where a Goal has got to.
///
/// Three states, none of them a measurement. "Achieved" is the user's own
/// judgement — nothing here infers it from how many linked Actions are done,
/// because a goal can be met without finishing every task it produced, and
/// finishing every task does not always mean the goal was met.
enum GoalStatus {
  active,
  achieved,
  archived;

  static GoalStatus fromName(String? name) => GoalStatus.values.firstWhere(
        (s) => s.name == name,
        orElse: () => GoalStatus.active,
      );
}

class Goal {
  const Goal({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.outcome,
    this.context,
    this.status = GoalStatus.active,
    this.linkedActionIds = const [],
    this.achievedAt,
  });

  final String id;

  /// What the user wants, in their words. The only required field.
  final String title;

  /// What "done" looks like. Optional, because a goal is worth writing down
  /// before it is worth defining precisely — and demanding the definition
  /// first is how a capture tool becomes a form.
  final String? outcome;

  /// Where it stands now. What the planning tools read as current state.
  final String? context;

  final GoalStatus status;

  /// Actions made from this Goal, oldest first.
  final List<String> linkedActionIds;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? achievedAt;

  bool get isOpen => status == GoalStatus.active;

  /// Whether there is enough here for a planning tool to do anything useful.
  ///
  /// A title alone is a wish. The tools can work from one, but they work far
  /// better with an outcome, and the workspace says so rather than letting the
  /// user spend a request finding out.
  bool get hasEnoughToPlan => title.trim().length >= 8;

  Goal copyWith({
    String? title,
    String? outcome,
    String? context,
    GoalStatus? status,
    List<String>? linkedActionIds,
    DateTime? updatedAt,
    DateTime? achievedAt,
    bool clearOutcome = false,
    bool clearContext = false,
    bool clearAchievedAt = false,
  }) =>
      Goal(
        id: id,
        title: title ?? this.title,
        outcome: clearOutcome ? null : (outcome ?? this.outcome),
        context: clearContext ? null : (context ?? this.context),
        status: status ?? this.status,
        linkedActionIds: linkedActionIds ?? this.linkedActionIds,
        createdAt: createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        achievedAt: clearAchievedAt ? null : (achievedAt ?? this.achievedAt),
      );

  /// Records that an Action came out of this Goal.
  ///
  /// Idempotent: creating the same Action twice from one plan would otherwise
  /// list it twice, and the second entry would be indistinguishable from a
  /// second real Action.
  Goal linking(String actionId, {required DateTime now}) {
    if (linkedActionIds.contains(actionId)) return this;
    return copyWith(
      linkedActionIds: [...linkedActionIds, actionId],
      updatedAt: now,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        if (outcome != null) 'outcome': outcome,
        if (context != null) 'context': context,
        'status': status.name,
        if (linkedActionIds.isNotEmpty) 'linkedActionIds': linkedActionIds,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        if (achievedAt != null) 'achievedAt': achievedAt!.toIso8601String(),
      };

  /// Null for a record that cannot be understood, so one bad row does not take
  /// the whole list down with it.
  static Goal? fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['title'];
    if (id is! String || id.isEmpty) return null;
    if (title is! String || title.trim().isEmpty) return null;

    final created = DateTime.tryParse(json['createdAt'] as String? ?? '');
    if (created == null) return null;

    return Goal(
      id: id,
      title: title,
      outcome: json['outcome'] as String?,
      context: json['context'] as String?,
      status: GoalStatus.fromName(json['status'] as String?),
      linkedActionIds: (json['linkedActionIds'] as List? ?? const [])
          .whereType<String>()
          .toList(growable: false),
      createdAt: created,
      updatedAt:
          DateTime.tryParse(json['updatedAt'] as String? ?? '') ?? created,
      achievedAt: DateTime.tryParse(json['achievedAt'] as String? ?? ''),
    );
  }

  @override
  String toString() => 'Goal($id, ${status.name})';
}

/// Where Goals are kept.
abstract interface class GoalStore {
  /// Most recently updated first.
  Future<List<Goal>> all();

  Future<Goal?> byId(String id);

  Future<void> add(Goal goal);

  /// Replaces an existing record. A missing id is a no-op rather than an
  /// insert — silently resurrecting a deleted Goal would be worse than doing
  /// nothing.
  Future<void> update(Goal goal);

  Future<void> delete(String id);

  Future<void> clear();
}
