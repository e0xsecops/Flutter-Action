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
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_l10n.dart';
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
    // `AppSheet.title` and `.subtitle` are plain Strings rather than widgets,
    // so they are resolved here, against the sheet's own context, instead of
    // inside the form.
    builder: (sheetContext) {
      final l10n = AppL10n.of(sheetContext);
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
        ),
        child: AppSheet(
          title: l10n.connectSheetTitle,
          subtitle: l10n.connectSheetSubtitle,
          child: _ConnectForm(initialKind: initialKind),
        ),
      );
    },
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
    // Resolved once, up front: everything below it either runs synchronously
    // or is guarded by `mounted`, and a bundle read before the first await is
    // the same bundle the user is looking at.
    final l10n = AppL10n.of(context);

    final key = _keyController.text.trim();
    if (key.isEmpty) {
      setState(() => _error = l10n.connectErrorKeyMissing);
      return;
    }
    if (_modelId.isEmpty) {
      setState(() => _error = l10n.connectErrorModelMissing);
      return;
    }
    if (_kind == AiProviderKind.openAiCompatible &&
        _endpointController.text.trim().isEmpty) {
      setState(() => _error = l10n.connectErrorEndpointMissing);
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
        _error = l10n.connectErrorSecureStorageUnavailable;
      });
      return;
    }

    // The key is in secure storage now; nothing else needs the plaintext.
    _keyController.clear();

    if (alsoTest) {
      setState(() => _status = l10n.commonChecking);
      final provider = ref.read(aiProvidersProvider)[_kind]!;
      final check = await provider.testConnection(config);
      if (!mounted) return;
      if (!check.ok) {
        setState(() {
          _busy = false;
          _status = null;
          // Knowingly still English, and the one string on this screen that
          // is. `AiConnectionCheck` carries a finished sentence and nothing
          // else: the `AiFailureKind` that produced it is consumed inside the
          // adapter, so there is nothing here to switch on. Replacing it with
          // a single localized "that did not work" would throw away the only
          // diagnostic the user gets — out of credit is not rate-limited, and
          // "could not reach your provider" is the opposite claim to "your
          // provider is having trouble". The fix is to carry the kind on
          // AiConnectionCheck; it is not a change this file can make.
          _error = check.message;
        });
        return;
      }
      // Composed here rather than echoed from `check.message`. All four
      // adapters build the same two English sentences, and the number they
      // interpolate is already on the check — so the count can be pluralised
      // properly against a BuildContext the adapters do not have. The claim
      // stays the narrow one: the provider answered, nothing more.
      setState(() => _status = check.models.isEmpty
          ? l10n.connectTestSucceeded
          : l10n.connectTestSucceededWithModels(check.models.length));
    }

    await ref.read(aiProviderConfigProvider.notifier).connect(config);
    ref.invalidate(aiConnectionReadyProvider);
    ref.invalidate(aiKeyFingerprintProvider);

    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
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
          Text(l10n.connectProviderLabel, style: text.labelLarge),
          const SizedBox(height: Space.sm),
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.sm,
            children: [
              for (final kind in AiProviderKind.values)
                ChoiceChip(
                  // Three of the four are trademarks and come back verbatim;
                  // only the custom entry has a word to translate. The enum
                  // keeps its English `label` for logs and fixtures.
                  label: Text(kind.labelIn(l10n)),
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
            Text(l10n.connectEndpointLabel, style: text.labelLarge),
            const SizedBox(height: Space.sm),
            TextField(
              controller: _endpointController,
              enabled: !_busy,
              keyboardType: TextInputType.url,
              autocorrect: false,
              decoration: const InputDecoration(
                // Not prose: a URL shape the user is meant to copy.
                hintText: 'https://…/v1',
              ),
            ),
            const SizedBox(height: Space.xs),
            Text(
              l10n.connectEndpointHttpsNote,
              style: text.bodySmall,
            ),
            const SizedBox(height: Space.xl),
          ],

          Text(l10n.connectApiKeyLabel, style: text.labelLarge),
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
            decoration: InputDecoration(hintText: l10n.connectApiKeyHint),
          ),
          const SizedBox(height: Space.xs),
          Text(
            l10n.connectKeyPrivacyNote,
            style: text.bodySmall,
          ),
          const SizedBox(height: Space.xl),

          Text(l10n.connectModelLabel, style: text.labelLarge),
          const SizedBox(height: Space.sm),
          if (presets.isNotEmpty)
            Wrap(
              spacing: Space.sm,
              runSpacing: Space.sm,
              children: [
                for (final model in presets)
                  ChoiceChip(
                    // A provider's own model name, not copy.
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
            decoration: InputDecoration(hintText: l10n.connectModelIdHint),
          ),
          const SizedBox(height: Space.xs),
          Text(
            // The honest reason a free-text field exists next to the presets:
            // the presets are hints, never a whitelist.
            l10n.connectModelFreeTextNote,
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
            child: Text(_busy ? l10n.commonChecking : l10n.connectAndTest),
          ),
          const SizedBox(height: Space.sm),
          TextButton(
            onPressed: _busy ? null : () => _save(alsoTest: false),
            child: Text(l10n.connectSaveWithoutTesting),
          ),
        ],
      ),
    );
  }
}
