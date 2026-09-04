/// Settings → Intelligence.
///
/// Four groups and no jargon. The saved key appears only as a masked tail —
/// there is no Reveal, because a secret that can be read back out of the UI is
/// a secret sitting on the screen waiting to be photographed.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design/tokens/dimens.dart';
import '../../settings/presentation/settings_shell.dart';
import '../application/intelligence_providers.dart';
import '../domain/ai_provider_config.dart';
import 'connect_provider_sheet.dart';

class IntelligenceSettingsScreen extends ConsumerStatefulWidget {
  const IntelligenceSettingsScreen({super.key});

  @override
  ConsumerState<IntelligenceSettingsScreen> createState() =>
      _IntelligenceSettingsScreenState();
}

class _IntelligenceSettingsScreenState
    extends ConsumerState<IntelligenceSettingsScreen> {
  String? _testResult;
  bool _testing = false;

  Future<void> _test(AiProviderConfig config) async {
    setState(() {
      _testing = true;
      _testResult = null;
    });
    final provider = ref.read(aiProvidersProvider)[config.kind];
    if (provider == null) {
      setState(() {
        _testing = false;
        _testResult = 'That provider is not available in this version.';
      });
      return;
    }
    final check = await provider.testConnection(config);
    if (!mounted) return;
    setState(() {
      _testing = false;
      _testResult = check.message;
    });
  }

  Future<void> _disconnect() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove this connection?'),
        content: const Text(
          'Action will delete your API key from this device and stop using '
          'AI features. Your provider account is not affected.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await ref.read(aiProviderConfigProvider.notifier).disconnect();
    ref.invalidate(aiConnectionReadyProvider);
    ref.invalidate(aiKeyFingerprintProvider);
    if (mounted) setState(() => _testResult = null);
  }

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(aiProviderConfigProvider);
    final ready = ref.watch(aiConnectionReadyProvider);
    final fingerprint = ref.watch(aiKeyFingerprintProvider);
    final recents = ref.watch(recentToolsProvider);

    return SettingsPage(
      title: 'Intelligence',
      slivers: [
        SettingsSection(
          title: 'Provider',
          footnote: config == null
              ? 'Action works without AI. Connecting a provider adds document '
                  'analysis, planning and drafting tools.'
              : 'You are billed by your provider for what you use. Action '
                  'never makes a request on its own.',
          children: [
            if (config == null)
              SettingsRow(
                label: 'Connect an AI provider',
                description:
                    'Use your own account and API key with OpenAI, Anthropic, '
                    'Google Gemini, or a compatible endpoint.',
                onTap: () async {
                  await showConnectProviderSheet(context);
                  if (mounted) setState(() => _testResult = null);
                },
              )
            else ...[
              SettingsRow(
                label: 'Provider',
                value: config.kind.label,
              ),
              SettingsRow(
                label: 'Model',
                value: config.modelId,
              ),
              if (config.baseUrl != null)
                SettingsRow(label: 'Endpoint', value: config.baseUrl),
              SettingsRow(
                label: 'API key',
                // The only form of the secret the UI may ever show.
                value: fingerprint.value ?? '••••••••',
                description: ready.when(
                  data: (ok) => ok
                      ? 'Stored in this device’s secure storage.'
                      : 'No key found on this device. Connect again to add one.',
                  loading: () => 'Checking…',
                  error: (_, _) => 'Could not be checked.',
                ),
              ),
              SettingsRow(
                label: 'Test connection',
                description: _testResult,
                trailing: TextButton(
                  // Deliberate, never on page open: a connection test is a
                  // request against the user's own metered key.
                  onPressed: _testing ? null : () => _test(config),
                  child: Text(_testing ? 'Checking…' : 'Test'),
                ),
              ),
              SettingsRow(
                label: 'Change provider or model',
                onTap: () async {
                  await showConnectProviderSheet(
                    context,
                    initialKind: config.kind,
                  );
                  if (mounted) setState(() => _testResult = null);
                },
              ),
              SettingsRow(
                label: 'Remove key',
                destructive: true,
                onTap: _disconnect,
              ),
            ],
          ],
        ),
        SettingsSection(
          title: 'Privacy',
          children: [
            const SettingsRow(
              label: 'What gets sent',
              description:
                  'Only the document or text you pick for a tool, and only '
                  'when you run it. Action never sends anything in the '
                  'background, and never sends your other Actions or sources.',
            ),
            SettingsRow(
              label: 'Where it goes',
              description: config == null
                  ? 'Nothing is sent until you connect a provider.'
                  : 'Directly to ${config.kind.label}, using your key. '
                      'It does not pass through Action’s servers.',
            ),
          ],
        ),
        SettingsSection(
          title: 'Data',
          footnote: 'Action remembers which tools you used, never what you '
              'used them on.',
          children: [
            SettingsRow(
              label: 'Recently used tools',
              value: recents.isEmpty ? 'None' : '${recents.length}',
              trailing: recents.isEmpty
                  ? null
                  : TextButton(
                      onPressed: () =>
                          ref.read(recentToolsProvider.notifier).clear(),
                      child: const Text('Clear'),
                    ),
            ),
          ],
        ),
        const SliverToBoxAdapter(child: SizedBox(height: Space.xxl)),
      ],
    );
  }
}
