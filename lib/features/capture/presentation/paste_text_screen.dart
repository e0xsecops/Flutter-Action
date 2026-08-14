import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/capture_controller.dart';

/// Paste-and-analyse. The editor is the whole screen: no card, no border, no
/// competing affordances, because the only thing to do here is put text in.
class PasteTextScreen extends ConsumerStatefulWidget {
  const PasteTextScreen({super.key});

  @override
  ConsumerState<PasteTextScreen> createState() => _PasteTextScreenState();
}

class _PasteTextScreenState extends ConsumerState<PasteTextScreen> {
  final _controller = TextEditingController();
  final _focus = FocusNode();
  bool _busy = false;

  /// Below this there is not enough signal to find a date, an amount, or an
  /// obligation, and running analysis would waste the user's time.
  static const _minimumUsefulLength = 20;

  int get _length => _controller.text.trim().length;

  bool get _canAnalyse => _length >= _minimumUsefulLength && !_busy;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) => _focus.requestFocus());
  }

  void _onChanged() => setState(() {});

  @override
  void dispose() {
    _controller
      ..removeListener(_onChanged)
      ..dispose();
    _focus.dispose();
    super.dispose();
  }

  Future<void> _analyse() async {
    setState(() => _busy = true);
    try {
      final item =
          await ref.read(sourcesProvider.notifier).addPastedText(_controller.text);
      if (!mounted) return;
      context.go(Routes.home);
      context.push(Routes.source(item.id));
    } on Object {
      if (!mounted) return;
      setState(() => _busy = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Couldn't save that. Try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paste text'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _busy ? null : () => context.pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Space.page),
              child: TextField(
                controller: _controller,
                focusNode: _focus,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                style: text.bodyLarge,
                decoration: InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText:
                      'Paste the email, message, or notice you would rather not '
                      'read through.',
                  hintStyle: text.bodyLarge?.copyWith(color: colors.textTertiary),
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Space.page,
                Space.md,
                Space.page,
                Space.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _length == 0
                        ? 'Anything with a date, an amount, or a request works well.'
                        : _canAnalyse
                            ? 'Looks like enough to work with.'
                            : 'A little more text will give a better result.',
                    style: text.bodySmall?.copyWith(
                      color: _canAnalyse ? colors.success : colors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: Space.md),
                  FilledButton(
                    onPressed: _canAnalyse ? _analyse : null,
                    child: _busy
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Continue'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
