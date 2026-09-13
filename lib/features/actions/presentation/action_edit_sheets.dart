import 'package:flutter/material.dart';

import '../../../design/components/app_sheet.dart';
import '../../../l10n/gen/app_l10n.dart';
import '../../../l10n/enum_labels.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../../extraction/data/extraction_validator.dart' show parseStrictIso8601;
import '../../extraction/domain/extraction_schema.dart';
import '../../extraction/domain/money_value.dart';
import '../domain/action_item.dart';

/// Pops a sheet once, however many times its button is tapped.
///
/// A modal's route stays mounted through its dismissal animation, so a second
/// tap landing in that window runs the same handler again — and the second
/// `pop` does not close the sheet (it is already going), it closes whatever
/// was underneath. On the Action Detail screen that means a save quietly
/// throwing the user back to the inbox. Checking [ModalRoute.isCurrent] costs
/// nothing and closes the window: it flips false the moment the first pop
/// starts.
void popSheetOnce<T>(BuildContext context, T result) {
  final route = ModalRoute.of(context);
  if (route == null || !route.isCurrent) return;
  Navigator.of(context).pop<T>(result);
}

/// Edit surfaces for a durable Action.
///
/// Each sheet owns one decision, validates with the *same* parsers the
/// extraction trust boundary uses, and returns only a value it has already
/// proved. Nothing here writes to the database — the caller persists, so a
/// storage failure can be reported honestly instead of being swallowed
/// behind a dismissed sheet.
///
/// Internal machinery (schema version, source id, sync state, the uid,
/// anything the outbox knows) is deliberately unreachable from these screens.

/// A sheet's outcome. `null` from `showModalBottomSheet` means dismissed —
/// distinct from [EditCleared], which is a deliberate "there is no value".
sealed class EditOutcome<T> {
  const EditOutcome();
}

final class EditSaved<T> extends EditOutcome<T> {
  const EditSaved(this.value);
  final T value;
}

final class EditCleared<T> extends EditOutcome<T> {
  const EditCleared();
}

// ------------------------------------------------------------------ title --

Future<String?> showTitleSheet(BuildContext context, String current) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
      child: AppSheet(
        title: AppL10n.of(sheetContext).reviewFieldTitle,
        child: _TextEditor(
          initial: current,
          hint: AppL10n.of(sheetContext).reviewTitleHint,
          maxLength: 200,
          saveLabel: AppL10n.of(sheetContext).commonSave,
        ),
      ),
    ),
  );
}

/// The suggested next move. Clearable: an Action is allowed to have no
/// suggestion, and an empty string is not the same thing as one.
Future<EditOutcome<String>?> showNextStepSheet(
  BuildContext context,
  String? current,
) {
  return showModalBottomSheet<EditOutcome<String>>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
      child: AppSheet(
        title: AppL10n.of(sheetContext).editNextStepTitle,
        subtitle: AppL10n.of(sheetContext).editNextStepSubtitle,
        child: _TextEditor(
          initial: current ?? '',
          hint: AppL10n.of(sheetContext).editNextStepHint,
          maxLength: 240,
          saveLabel: AppL10n.of(sheetContext).commonSave,
          clearLabel: current == null ? null : AppL10n.of(sheetContext).editRemoveSuggestion,
        ),
      ),
    ),
  );
}

// --------------------------------------------------------------- deadline --

/// Deadlines are edited in the semantic type they already have: a date-only
/// deadline stays date-only. Nothing here converts a confirmed date into an
/// instant, which is the failure the storage format exists to prevent.
Future<EditOutcome<DateTime>?> showDeadlineSheet(
  BuildContext context,
  ActionDue? current,
) {
  return showModalBottomSheet<EditOutcome<DateTime>>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
      child: AppSheet(
        title: AppL10n.of(sheetContext).reviewDeadline,
        child: _DeadlineEditor(current: current),
      ),
    ),
  );
}

// ----------------------------------------------------------------- amount --

Future<EditOutcome<MoneyValue>?> showAmountSheet(
  BuildContext context,
  MoneyValue? current,
) {
  return showModalBottomSheet<EditOutcome<MoneyValue>>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
      child: AppSheet(
        title: AppL10n.of(sheetContext).reviewAmount,
        child: _AmountEditor(current: current),
      ),
    ),
  );
}

// ---------------------------------------------------------------- urgency --

Future<ActionUrgency?> showUrgencySheet(
  BuildContext context,
  ActionUrgency current,
) {
  return showModalBottomSheet<ActionUrgency>(
    context: context,
    builder: (sheetContext) => AppSheet(
      title: AppL10n.of(sheetContext).editUrgencyTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final value in ActionUrgency.values)
            ListTile(
              title: Text(value.labelIn(AppL10n.of(sheetContext))),
              trailing: value == current
                  ? Icon(Icons.check, color: sheetContext.colors.brand)
                  : null,
              onTap: () => popSheetOnce(sheetContext, value),
            ),
        ],
      ),
    ),
  );
}

// ------------------------------------------------------------------ steps --

/// Add or rename one chain step. Returns the trimmed title.
Future<String?> showStepSheet(
  BuildContext context, {
  String? current,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
      child: AppSheet(
        title: current == null ? AppL10n.of(sheetContext).reviewAddStep : AppL10n.of(sheetContext).reviewEditStep,
        child: _TextEditor(
          initial: current ?? '',
          hint: AppL10n.of(sheetContext).editStepHint,
          maxLength: 200,
          saveLabel: current == null ? AppL10n.of(sheetContext).editAddStep : AppL10n.of(sheetContext).commonSave,
        ),
      ),
    ),
  );
}

// ------------------------------------------------------------- internals --

/// Single-field text editor. Save stays disabled until the trimmed value is
/// non-empty, so a whitespace-only title can never be committed.
class _TextEditor extends StatefulWidget {
  const _TextEditor({
    required this.initial,
    required this.hint,
    required this.maxLength,
    required this.saveLabel,
    this.clearLabel,
  });

  final String initial;
  final String hint;
  final int maxLength;
  final String saveLabel;
  final String? clearLabel;

  @override
  State<_TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<_TextEditor> {
  late final _controller = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _valid => _controller.text.trim().isNotEmpty;

  void _save() {
    final value = _controller.text.trim();
    if (value.isEmpty) return;
    // Callers that asked for a plain String get one; the clearable variant
    // wraps it so "saved" and "cleared" stay distinguishable.
    popSheetOnce<Object>(
      context,
      widget.clearLabel == null ? value : EditSaved<String>(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, 0, Space.page, Space.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            maxLength: widget.maxLength,
            maxLines: null,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(hintText: widget.hint),
            onChanged: (_) => setState(() {}),
            onSubmitted: (_) => _save(),
          ),
          const SizedBox(height: Space.sm),
          FilledButton(
            onPressed: _valid ? _save : null,
            child: Text(widget.saveLabel),
          ),
          if (widget.clearLabel != null) ...[
            const SizedBox(height: Space.xs),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pop<Object>(const EditCleared<String>()),
              child: Text(widget.clearLabel!),
            ),
          ],
        ],
      ),
    );
  }
}

class _DeadlineEditor extends StatefulWidget {
  const _DeadlineEditor({required this.current});

  final ActionDue? current;

  @override
  State<_DeadlineEditor> createState() => _DeadlineEditorState();
}

class _DeadlineEditorState extends State<_DeadlineEditor> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.current == null
        ? ''
        : _dateOnlyText(widget.current!.wallClock),
  );
  String? _error;

  static String _dateOnlyText(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    final text = _controller.text.trim();
    // The same strict parser the validator uses: 2026-02-30 is rejected, not
    // rolled forward into March.
    final parsed = parseStrictIso8601(text);
    if (parsed == null) {
      setState(() => _error = AppL10n.of(context).reviewBadDate);
      return;
    }
    // A deadline that was a plain date stays a plain date: the time
    // components are exactly what the user typed, never a zone conversion.
    popSheetOnce(context, EditSaved<DateTime>(parsed));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, 0, Space.page, Space.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            keyboardType: TextInputType.datetime,
            decoration:
                InputDecoration(hintText: AppL10n.of(context).editDateHint),
            onChanged: (_) {
              if (_error != null) setState(() => _error = null);
            },
            onSubmitted: (_) => _save(),
          ),
          if (_error != null) ...[
            const SizedBox(height: Space.xs),
            Text(
              _error!,
              style: text.bodySmall?.copyWith(color: colors.danger),
            ),
          ],
          const SizedBox(height: Space.sm),
          FilledButton(
            onPressed: _save,
            child: Text(AppL10n.of(context).reviewUseThisDate),
          ),
          if (widget.current != null) ...[
            const SizedBox(height: Space.xs),
            TextButton(
              onPressed: () =>
                  popSheetOnce(context, const EditCleared<DateTime>()),
              child: Text(AppL10n.of(context).editRemoveDeadline),
            ),
          ],
        ],
      ),
    );
  }
}

class _AmountEditor extends StatefulWidget {
  const _AmountEditor({required this.current});

  final MoneyValue? current;

  @override
  State<_AmountEditor> createState() => _AmountEditorState();
}

class _AmountEditorState extends State<_AmountEditor> {
  late final TextEditingController _amount =
      TextEditingController(text: widget.current?.plainAmount ?? '');
  late String _currency = widget.current?.currencyCode ?? 'GBP';
  String? _error;

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  void _save() {
    // MoneyValue.parse is the strict parser: exact minor units, a supported
    // ISO-4217 code, never a float and never an inferred currency.
    switch (MoneyValue.parse(_amount.text.trim(), _currency)) {
      case MoneyParsed(:final value):
        popSheetOnce(context, EditSaved<MoneyValue>(value));
      case MoneyRejected(:final error):
        setState(() => _error = error.reason);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.page, 0, Space.page, Space.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _amount,
                  autofocus: true,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      hintText: AppL10n.of(context).editAmountHint),
                  onChanged: (_) {
                    if (_error != null) setState(() => _error = null);
                  },
                  onSubmitted: (_) => _save(),
                ),
              ),
              const SizedBox(width: Space.md),
              DropdownMenu<String>(
                initialSelection: _currency,
                width: 116,
                requestFocusOnTap: false,
                onSelected: (value) {
                  if (value != null) setState(() => _currency = value);
                },
                dropdownMenuEntries: [
                  for (final code in supportedCurrencies)
                    DropdownMenuEntry(value: code, label: code),
                ],
              ),
            ],
          ),
          if (_error != null) ...[
            const SizedBox(height: Space.xs),
            Text(
              _error!,
              style: text.bodySmall?.copyWith(color: colors.danger),
            ),
          ],
          const SizedBox(height: Space.sm),
          FilledButton(
            onPressed: _save,
            child: Text(AppL10n.of(context).editSaveAmount),
          ),
          if (widget.current != null) ...[
            const SizedBox(height: Space.xs),
            TextButton(
              onPressed: () =>
                  popSheetOnce(context, const EditCleared<MoneyValue>()),
              child: Text(AppL10n.of(context).editRemoveAmount),
            ),
          ],
        ],
      ),
    );
  }
}
