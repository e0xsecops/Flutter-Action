/// The one sheet every Goal field is edited through.
///
/// A Goal has three free-text fields and no structured ones, so three bespoke
/// editors would be the same widget written three times. The caller supplies
/// the title and the example.
library;

import 'package:flutter/material.dart';

import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/dimens.dart';

/// Returns the new text, `''` to clear it, or null if the user backed out.
///
/// Empty and null are deliberately different: clearing a field is a decision,
/// and treating it as a cancel would silently refuse to let anyone undo
/// something they wrote.
Future<String?> showGoalTextSheet(
  BuildContext context, {
  required String title,
  required String hint,
  String? initial,
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
        child: _GoalTextEditor(hint: hint, initial: initial ?? ''),
      ),
    ),
  );
}

class _GoalTextEditor extends StatefulWidget {
  const _GoalTextEditor({required this.hint, required this.initial});

  final String hint;
  final String initial;

  @override
  State<_GoalTextEditor> createState() => _GoalTextEditorState();
}

class _GoalTextEditorState extends State<_GoalTextEditor> {
  late final _controller = TextEditingController(text: widget.initial);
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _focus.requestFocus());
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.sm,
        Space.page,
        Space.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            focusNode: _focus,
            maxLines: 4,
            minLines: 2,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(hintText: widget.hint),
          ),
          const SizedBox(height: Space.md),
          FilledButton(
            onPressed: () =>
                Navigator.of(context).pop(_controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

/// The sheet for writing a new Goal.
///
/// One field, and the button is off until there is something in it. A goal
/// with no words is not a goal, and creating an empty one would put a row in
/// the user's Library that they have to go and delete.
Future<String?> showNewGoalSheet(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
      ),
      child: const AppSheet(
        title: 'What do you want to happen?',
        subtitle: 'One sentence is enough. You can add the details after.',
        child: _NewGoalEditor(),
      ),
    ),
  );
}

class _NewGoalEditor extends StatefulWidget {
  const _NewGoalEditor();

  @override
  State<_NewGoalEditor> createState() => _NewGoalEditorState();
}

class _NewGoalEditorState extends State<_NewGoalEditor> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => _focus.requestFocus());
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canSave = _controller.text.trim().isNotEmpty;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        Space.sm,
        Space.page,
        Space.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            focusNode: _focus,
            maxLines: 3,
            minLines: 1,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              hintText: 'Renew the car insurance without overpaying.',
            ),
          ),
          const SizedBox(height: Space.md),
          FilledButton(
            onPressed: canSave
                ? () => Navigator.of(context).pop(_controller.text.trim())
                : null,
            child: const Text('Create goal'),
          ),
        ],
      ),
    );
  }
}
