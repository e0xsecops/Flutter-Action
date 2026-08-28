import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/reminder_presets.dart';
import '../domain/action_item.dart';

import 'action_edit_sheets.dart' show popSheetOnce;

/// Choosing when to be reminded.
///
/// Two rules shape this sheet. Nothing is created without an explicit tap, and
/// the exact date and time being agreed to is on screen before the button is
/// pressed — a relative phrase like "1 day before" is never the whole promise,
/// because it hides which hour was picked.
Future<DateTime?> showReminderSheet(
  BuildContext context, {
  required ActionItem action,
  required DateTime now,
  DateTime? initial,
}) {
  return showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
      child: AppSheet(
        title: initial == null ? 'Add a reminder' : 'Change this reminder',
        child: _ReminderEditor(action: action, now: now, initial: initial),
      ),
    ),
  );
}

class _ReminderEditor extends StatefulWidget {
  const _ReminderEditor({
    required this.action,
    required this.now,
    this.initial,
  });

  final ActionItem action;
  final DateTime now;
  final DateTime? initial;

  @override
  State<_ReminderEditor> createState() => _ReminderEditorState();
}

class _ReminderEditorState extends State<_ReminderEditor> {
  late DateTime _chosen = widget.initial ?? _firstOffer();
  late final List<ReminderPreset> _presets =
      reminderPresetsFor(widget.action, widget.now);

  DateTime _firstOffer() {
    final presets = reminderPresetsFor(widget.action, widget.now);
    return presets.isNotEmpty
        ? presets.first.at
        : widget.now.add(const Duration(hours: 1));
  }

  bool get _isPast => !_chosen.isAfter(widget.now);

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _chosen,
      // The past is not offerable: a reminder can only be in front of you.
      firstDate: DateTime(widget.now.year, widget.now.month, widget.now.day),
      lastDate: DateTime(widget.now.year + 5),
    );
    if (picked == null || !mounted) return;
    setState(() {
      _chosen = DateTime(
        picked.year,
        picked.month,
        picked.day,
        _chosen.hour,
        _chosen.minute,
      );
    });
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_chosen),
    );
    if (picked == null || !mounted) return;
    setState(() {
      _chosen = DateTime(
        _chosen.year,
        _chosen.month,
        _chosen.day,
        picked.hour,
        picked.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.page, 0, Space.page, Space.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_presets.isNotEmpty) ...[
              Wrap(
                spacing: Space.sm,
                runSpacing: Space.sm,
                children: [
                  for (final preset in _presets)
                    _PresetChip(
                      preset: preset,
                      selected: preset.at == _chosen,
                      onTap: () => setState(() => _chosen = preset.at),
                    ),
                ],
              ),
              const SizedBox(height: Space.lg),
            ],
            Row(
              children: [
                Expanded(
                  child: _PickerField(
                    label: 'Date',
                    value: DateFormat('EEE d MMM yyyy').format(_chosen),
                    onTap: _pickDate,
                  ),
                ),
                const SizedBox(width: Space.md),
                Expanded(
                  child: _PickerField(
                    label: 'Time',
                    value: DateFormat('h:mm a').format(_chosen),
                    onTap: _pickTime,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Space.lg),
            // The whole promise, spelled out, before anything is created.
            Text(
              'You will be reminded on '
              '${DateFormat('EEEE d MMMM').format(_chosen)} at '
              '${DateFormat('h:mm a').format(_chosen)}.',
              style: text.bodyMedium?.copyWith(color: colors.textSecondary),
            ),
            if (_isPast) ...[
              const SizedBox(height: Space.sm),
              Text(
                'That time has already passed. Choose a later one.',
                style: text.bodySmall?.copyWith(color: colors.danger),
              ),
            ],
            const SizedBox(height: Space.lg),
            FilledButton(
              onPressed:
                  _isPast ? null : () => popSheetOnce(context, _chosen),
              child: const Text('Set reminder'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PresetChip extends StatelessWidget {
  const _PresetChip({
    required this.preset,
    required this.selected,
    required this.onTap,
  });

  final ReminderPreset preset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Radii.pill),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Space.md,
          vertical: Space.sm,
        ),
        decoration: BoxDecoration(
          color: selected ? colors.brandSubtle : colors.surfaceElevated,
          borderRadius: BorderRadius.circular(Radii.pill),
          border: Border.all(
            color: selected ? colors.brand : colors.border,
            width: Strokes.hairline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              preset.label,
              style: text.labelLarge?.copyWith(
                color: selected ? colors.brand : colors.textPrimary,
              ),
            ),
            // The resolved time, always — so "1 day before" can never quietly
            // mean an hour the user did not pick.
            Text(
              DateFormat('d MMM, h:mm a').format(preset.at),
              style: text.bodySmall?.copyWith(color: colors.textTertiary),
            ),
          ],
        ),
      ),
    );
  }
}

class _PickerField extends StatelessWidget {
  const _PickerField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: Radii.rMd,
      child: Container(
        padding: const EdgeInsets.all(Space.md),
        decoration: BoxDecoration(
          color: colors.surfaceSunken,
          borderRadius: Radii.rMd,
          border: Border.all(color: colors.border, width: Strokes.hairline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: text.bodySmall?.copyWith(color: colors.textSecondary),
            ),
            const SizedBox(height: Space.xxs),
            Text(value, style: text.bodyMedium),
          ],
        ),
      ),
    );
  }
}
