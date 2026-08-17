import 'package:action_app/features/actions/data/actions_database.dart';
import 'package:action_app/features/actions/domain/action_item.dart';
import 'package:action_app/features/extraction/domain/extraction_schema.dart';
import 'package:action_app/features/extraction/domain/money_value.dart';
import 'package:drift/native.dart';

/// A fixed instant so nothing under test depends on the clock.
final testNow = DateTime.utc(2026, 8, 18, 12);

/// In-memory database — one per test, closed by the caller.
ActionsDatabase memoryDatabase() => ActionsDatabase(NativeDatabase.memory());

MoneyValue gbp(String amount) =>
    (MoneyValue.parse(amount, 'GBP') as MoneyParsed).value;

ActionItem sampleAction(
  String id, {
  String? title,
  String? sourceId = 'src-1',
  ActionStatus status = ActionStatus.active,
  ActionUrgency urgency = ActionUrgency.normal,
  ActionDue? dueAt,
  MoneyValue? amount,
  DateTime? createdAt,
  DateTime? completedAt,
  ActionOrigin origin = ActionOrigin.extraction,
  List<ActionStepItem> steps = const [],
  List<ActionFactItem> facts = const [],
}) {
  final created = createdAt ?? testNow;
  return ActionItem(
    id: id,
    sourceId: sourceId,
    title: title ?? 'Action $id',
    status: status,
    urgency: urgency,
    category: ActionCategory.payment,
    dueAt: dueAt,
    amount: amount,
    origin: origin,
    reviewedAt: created,
    createdAt: created,
    updatedAt: created,
    completedAt: completedAt,
    steps: steps,
    facts: facts,
  );
}
