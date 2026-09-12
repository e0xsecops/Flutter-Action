/// Settings → Intelligence.
///
/// Four groups and no jargon. The saved key appears only as a masked tail —
/// there is no Reveal, because a secret that can be read back out of the UI is
/// a secret sitting on the screen waiting to be photographed.
///
/// **Why the connection test is kept as data rather than as a sentence.** The
/// adapters build their success line in English (`AiConnectionCheck.message`,
/// "Connected. 4 models available.") because the data layer has no bundle to
/// ask. So this screen stores what the test *found* — no adapter, connected
/// with a model count, or failed — and writes the sentence itself in [build],
/// where the locale is known and where a language change re-renders it.
///
/// The one thing still shown in the adapter's own words is the failure text.
/// `AiProviderFailure.message` is a family of about a dozen English sentences
/// in `data/ai_http.dart`, and moving them into the bundle needs a
/// kind-to-key mapping rather than a string; until that exists, showing the
/// English is better than showing nothing.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design/tokens/dimens.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_l10n.dart';
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
  _TestOutcome? _testOutcome;
  bool _testing = false;

  Future<void> _test(AiProviderConfig config) async {
    setState(() {
      _testing = true;
      _testOutcome = null;
    });
    final provider = ref.read(aiProvidersProvider)[config.kind];
    if (provider == null) {
      setState(() {
        _testing = false;
        _testOutcome = const _TestUnavailable();
      });
      return;
    }
    final check = await provider.testConnection(config);
    if (!mounted) return;
    setState(() {
      _testing = false;
      // Success is restated from the model count the adapter reported, so the
      // sentence is this screen's and follows the locale. Failure stays the
      // adapter's own English until those messages have keys.
      _testOutcome = check.ok
          ? _TestConnected(check.models.length)
          : _TestFailed(check.message);
    });
  }

  Future<void> _disconnect() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final l10n = AppL10n.of(dialogContext);
        return AlertDialog(
          // The row says remove and the body says delete, and that is the
          // distinction: the connection comes out of Action, the key is
          // destroyed, and the account at the provider is untouched.
          title: Text(l10n.aiSettingsRemoveTitle),
          content: Text(l10n.aiSettingsRemoveBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(l10n.commonCancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(l10n.commonRemove),
            ),
          ],
        );
      },
    );
    if (confirmed != true) return;

    await ref.read(aiProviderConfigProvider.notifier).disconnect();
    ref.invalidate(aiConnectionReadyProvider);
    ref.invalidate(aiKeyFingerprintProvider);
    if (mounted) setState(() => _testOutcome = null);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final config = ref.watch(aiProviderConfigProvider);
    final ready = ref.watch(aiConnectionReadyProvider);
    final fingerprint = ref.watch(aiKeyFingerprintProvider);
    final recents = ref.watch(recentToolsProvider);

    return SettingsPage(
      title: l10n.navIntelligence,
      slivers: [
        SettingsSection(
          // One key for the heading and the row below it. SettingsSection
          // uppercases the title through eyebrowCase(), so the bundle holds
          // the sentence-case word once and neither copy is pre-shouted.
          title: l10n.aiSettingsProviderLabel,
          footnote: config == null
              ? l10n.settingsIntelligenceFootnote
              : l10n.aiSettingsProviderFootnoteConnected,
          children: [
            if (config == null)
              SettingsRow(
                label: l10n.aiSettingsConnectLabel,
                description: l10n.aiSettingsConnectDescription,
                onTap: () async {
                  await showConnectProviderSheet(context);
                  if (mounted) setState(() => _testOutcome = null);
                },
              )
            else ...[
              SettingsRow(
                label: l10n.aiSettingsProviderLabel,
                value: config.kind.labelIn(l10n),
              ),
              SettingsRow(
                label: l10n.aiSettingsModelLabel,
                // The provider's own wire id for the model. Never translated:
                // it is what goes on the request.
                value: config.modelId,
              ),
              if (config.baseUrl != null)
                SettingsRow(
                  label: l10n.aiSettingsEndpointLabel,
                  // The user's own URL, shown exactly as they typed it.
                  value: config.baseUrl,
                ),
              SettingsRow(
                label: l10n.aiSettingsApiKeyLabel,
                // The only form of the secret the UI may ever show.
                value: fingerprint.value ?? '••••••••',
                description: ready.when(
                  data: (ok) =>
                      ok ? l10n.aiSettingsKeyStored : l10n.aiSettingsKeyMissing,
                  loading: () => l10n.commonChecking,
                  error: (_, _) => l10n.settingsNotificationsUnknown,
                ),
              ),
              SettingsRow(
                label: l10n.aiSettingsTestLabel,
                description: switch (_testOutcome) {
                  null => null,
                  _TestUnavailable() => l10n.aiSettingsProviderUnavailable,
                  _TestConnected(:final models) =>
                    l10n.aiSettingsTestConnectedModels(models),
                  // Untranslated on purpose, and visibly the adapter's voice:
                  // see the note in the library comment.
                  _TestFailed(:final message) => message,
                },
                trailing: TextButton(
                  // Deliberate, never on page open: a connection test is a
                  // request against the user's own metered key.
                  onPressed: _testing ? null : () => _test(config),
                  child: Text(
                    _testing ? l10n.commonChecking : l10n.aiSettingsTestButton,
                  ),
                ),
              ),
              SettingsRow(
                label: l10n.aiSettingsChangeProvider,
                onTap: () async {
                  await showConnectProviderSheet(
                    context,
                    initialKind: config.kind,
                  );
                  if (mounted) setState(() => _testOutcome = null);
                },
              ),
              SettingsRow(
                label: l10n.aiSettingsRemoveKey,
                destructive: true,
                onTap: _disconnect,
              ),
            ],
          ],
        ),
        SettingsSection(
          title: l10n.aiSettingsSectionPrivacy,
          children: [
            SettingsRow(
              label: l10n.aiSettingsWhatGetsSentLabel,
              // The same sentence the Privacy screen gives, from the same key:
              // two screens disagreeing about what leaves the device would be
              // worse than either of them being terse.
              description: l10n.privacyProviderScope,
            ),
            SettingsRow(
              label: l10n.aiSettingsWhereItGoesLabel,
              description: config == null
                  ? l10n.aiSettingsWhereItGoesNoProvider
                  : l10n.aiSettingsWhereItGoesProvider(
                      config.kind.labelIn(l10n),
                    ),
            ),
          ],
        ),
        SettingsSection(
          title: l10n.aiSettingsSectionData,
          footnote: l10n.aiSettingsDataFootnote,
          children: [
            SettingsRow(
              label: l10n.aiSettingsRecentToolsLabel,
              value: recents.isEmpty
                  ? l10n.aiSettingsRecentToolsNone
                  : '${recents.length}',
              trailing: recents.isEmpty
                  ? null
                  : TextButton(
                      onPressed: () =>
                          ref.read(recentToolsProvider.notifier).clear(),
                      child: Text(l10n.securityClear),
                    ),
            ),
          ],
        ),
        const SliverToBoxAdapter(child: SizedBox(height: Space.xxl)),
      ],
    );
  }
}

/// What the last connection test found.
///
/// Three outcomes rather than one string, because two of them are this
/// screen's own sentences and one of them is not.
sealed class _TestOutcome {
  const _TestOutcome();
}

/// A stored config naming a provider this build has no adapter for.
class _TestUnavailable extends _TestOutcome {
  const _TestUnavailable();
}

/// The request went through. [models] is what the provider said it could
/// reach, and it is legitimately zero on a key with no model access.
class _TestConnected extends _TestOutcome {
  const _TestConnected(this.models);

  final int models;
}

/// The adapter's own English explanation, shown verbatim.
class _TestFailed extends _TestOutcome {
  const _TestFailed(this.message);

  final String message;
}
