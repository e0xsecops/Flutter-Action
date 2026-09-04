/// Connecting a provider: pick one, paste a key, choose a model.
///
/// This is the only screen in the app that ever holds a secret in memory, and
/// it is written to hold it for as little time as possible. The field is
/// obscured, the controller is cleared as soon as the key is stored, and there
/// is no path anywhere in the app that reads it back for display. See
/// `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T11, T12).
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/security/secret_store.dart';
import '../../../design/components/app_sheet.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/dimens.dart';
import '../application/intelligence_providers.dart';
import '../domain/ai_capabilities.dart';
import '../domain/ai_provider_config.dart';

/// Opens the connect flow. Returns true when a provider was connected.
Future<bool> showConnectProviderSheet(
  BuildContext context, {
  AiProviderKind? initialKind,
}) async {
  final connected = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: AppSheet(
        title: 'Connect your AI',
        subtitle: 'You use your own provider account and API key. '
            'Action stores the key in this device’s secure storage.',
        child: _ConnectForm(initialKind: initialKind),
      ),
    ),
  );
  return connected ?? false;
}

class _ConnectForm extends ConsumerStatefulWidget {
  const _ConnectForm({this.initialKind});

  final AiProviderKind? initialKind;

  @override
  ConsumerState<_ConnectForm> createState() => _ConnectFormState();
}

class _ConnectFormState extends ConsumerState<_ConnectForm> {
  late AiProviderKind _kind = widget.initialKind ?? AiProviderKind.anthropic;
  final _keyController = TextEditingController();
  final _modelController = TextEditingController();
  final _endpointController = TextEditingController();

  String? _selectedPreset;
  bool _busy = false;
  String? _error;
  String? _status;

  @override
  void initState() {
    super.initState();
    _selectDefaultModel();
  }

  @override
  void dispose() {
    // Clearing before disposing, not just disposing. A disposed controller
    // still held the string until it was collected.
    _keyController.clear();
    _keyController.dispose();
    _modelController.dispose();
    _endpointController.dispose();
    super.dispose();
  }

  void _selectDefaultModel() {
    final presets = ref.read(aiProvidersProvider)[_kind]?.presetModels ?? [];
    setState(() {
      _selectedPreset = presets.isEmpty ? null : presets.first.id;
      _modelController.text = presets.isEmpty ? '' : presets.first.id;
    });
  }

  String get _modelId => _modelController.text.trim();

  Future<void> _save({required bool alsoTest}) async {
    final key = _keyController.text.trim();
    if (key.isEmpty) {
      setState(() => _error = 'Paste your API key to continue.');
      return;
    }
    if (_modelId.isEmpty) {
      setState(() => _error = 'Choose a model, or type a model id.');
      return;
    }
    if (_kind == AiProviderKind.openAiCompatible &&
        _endpointController.text.trim().isEmpty) {
      setState(() => _error = 'Add the address of your endpoint.');
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
      _status = null;
    });

    final config = AiProviderConfig(
      kind: _kind,
      modelId: _modelId,
      baseUrl: _kind == AiProviderKind.openAiCompatible
          ? _endpointController.text.trim()
          : null,
      declaredCapabilities:
          _kind == AiProviderKind.openAiCompatible
              ? AiCapabilities.textOnly
              : null,
    );

    try {
      await ref
          .read(secretStoreProvider)
          .write(SecretKeys.providerKey(config.secretKey), key);
    } on SecretStoreUnavailable {
      if (!mounted) return;
      setState(() {
        _busy = false;
        _error = "This device's secure storage could not be opened, so the "
            'key was not saved.';
      });
      return;
    }

    // The key is in secure storage now; nothing else needs the plaintext.
    _keyController.clear();

    if (alsoTest) {
      setState(() => _status = 'Checking…');
      final provider = ref.read(aiProvidersProvider)[_kind]!;
      final check = await provider.testConnection(config);
      if (!mounted) return;
      if (!check.ok) {
        setState(() {
          _busy = false;
          _status = null;
          _error = check.message;
        });
        return;
      }
      setState(() => _status = check.message);
    }

    await ref.read(aiProviderConfigProvider.notifier).connect(config);
    ref.invalidate(aiConnectionReadyProvider);
    ref.invalidate(aiKeyFingerprintProvider);

    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;
    final presets = ref.watch(aiProvidersProvider)[_kind]?.presetModels ?? [];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        Space.page,
        0,
        Space.page,
        Space.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Provider', style: text.labelLarge),
          const SizedBox(height: Space.sm),
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.sm,
            children: [
              for (final kind in AiProviderKind.values)
                ChoiceChip(
                  label: Text(kind.label),
                  selected: _kind == kind,
                  onSelected: _busy
                      ? null
                      : (_) {
                          setState(() {
                            _kind = kind;
                            _error = null;
                          });
                          _selectDefaultModel();
                        },
                ),
            ],
          ),
          const SizedBox(height: Space.xl),

          if (_kind == AiProviderKind.openAiCompatible) ...[
            Text('Endpoint', style: text.labelLarge),
            const SizedBox(height: Space.sm),
            TextField(
              controller: _endpointController,
              enabled: !_busy,
              keyboardType: TextInputType.url,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: 'https://…/v1',
              ),
            ),
            const SizedBox(height: Space.xs),
            Text(
              'Must be an https:// address. Action will not send your '
              'documents over an unencrypted connection.',
              style: text.bodySmall,
            ),
            const SizedBox(height: Space.xl),
          ],

          Text('API key', style: text.labelLarge),
          const SizedBox(height: Space.sm),
          TextField(
            controller: _keyController,
            enabled: !_busy,
            // Obscured, and excluded from autofill and suggestion systems that
            // would otherwise copy it somewhere Action does not control.
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            autofillHints: const [],
            keyboardType: TextInputType.visiblePassword,
            inputFormatters: [
              // Pasting from a provider console routinely brings a trailing
              // newline, which becomes an invalid header value.
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: const InputDecoration(hintText: 'Paste your key'),
          ),
          const SizedBox(height: Space.xs),
          Text(
            'Your key stays on this device. Action never sends it anywhere '
            'except to the provider you chose, and cannot show it to you '
            'again after saving.',
            style: text.bodySmall,
          ),
          const SizedBox(height: Space.xl),

          Text('Model', style: text.labelLarge),
          const SizedBox(height: Space.sm),
          if (presets.isNotEmpty)
            Wrap(
              spacing: Space.sm,
              runSpacing: Space.sm,
              children: [
                for (final model in presets)
                  ChoiceChip(
                    label: Text(model.label),
                    selected: _selectedPreset == model.id,
                    onSelected: _busy
                        ? null
                        : (_) => setState(() {
                              _selectedPreset = model.id;
                              _modelController.text = model.id;
                            }),
                  ),
              ],
            ),
          const SizedBox(height: Space.sm),
          TextField(
            controller: _modelController,
            enabled: !_busy,
            autocorrect: false,
            onChanged: (_) => setState(() => _selectedPreset = null),
            decoration: const InputDecoration(hintText: 'Model id'),
          ),
          const SizedBox(height: Space.xs),
          Text(
            // The honest reason a free-text field exists next to the presets.
            'Providers retire model ids and add new ones. If the one you want '
            'is not listed, type it here.',
            style: text.bodySmall,
          ),

          if (_error != null) ...[
            const SizedBox(height: Space.lg),
            Text(
              _error!,
              style: text.bodyMedium?.copyWith(color: colors.danger),
            ),
          ],
          if (_status != null) ...[
            const SizedBox(height: Space.lg),
            Text(
              _status!,
              style: text.bodyMedium?.copyWith(color: colors.success),
            ),
          ],

          const SizedBox(height: Space.xl),
          FilledButton(
            onPressed: _busy ? null : () => _save(alsoTest: true),
            child: Text(_busy ? 'Checking…' : 'Connect and test'),
          ),
          const SizedBox(height: Space.sm),
          TextButton(
            onPressed: _busy ? null : () => _save(alsoTest: false),
            child: const Text('Save without testing'),
          ),
        ],
      ),
    );
  }
}
