/// Holds the door while Action is locked.
///
/// Sits inside `MaterialApp.router`'s builder, so it covers every route, every
/// pushed detail screen and every dialog on the root navigator. Putting it
/// above `MaterialApp` instead would leave it without a Directionality or a
/// theme; putting it inside a single screen would leave every other screen
/// uncovered.
///
/// **Two different coverings, for two different jobs.** The veil goes up the
/// moment Action stops being frontmost, because that is when Android takes the
/// snapshot it shows in the app switcher — a lock that only appeared on return
/// would be shown to the user and never to the person scrolling their recents.
/// The lock screen itself appears on return, once [AppLockPolicy] has decided
/// enough time has passed.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/security/device_lock.dart';
import '../design/ambient/ambient_background.dart';
import '../design/tokens/colors.dart';
import '../design/tokens/dimens.dart';
import '../core/security/protection_providers.dart';

class AppLockGate extends ConsumerStatefulWidget {
  const AppLockGate({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends ConsumerState<AppLockGate>
    with WidgetsBindingObserver {
  bool _veiled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final locked = ref.read(appLockedProvider.notifier);
    final enabled = ref.read(protectionSettingsProvider).appLockEnabled;

    switch (state) {
      case AppLifecycleState.inactive:
        // Transient: the notification shade, a system dialog, the app switcher
        // being summoned. Not a departure — recording one here would start the
        // grace period every time the user pulled down the shade. But it *is*
        // when the snapshot is taken, so the veil goes up.
        if (enabled && mounted) setState(() => _veiled = true);
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        if (enabled && mounted) setState(() => _veiled = true);
        locked.noteLeftForeground();
      case AppLifecycleState.resumed:
        locked.noteReturnedToForeground();
        if (mounted) setState(() => _veiled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final locked = ref.watch(appLockedProvider);
    final enabled = ref.watch(protectionSettingsProvider).appLockEnabled;

    return Stack(
      children: [
        widget.child,
        // Order matters: the lock screen wins over the veil, so returning to a
        // locked app does not flash the veil underneath it.
        if (enabled && locked)
          const _LockScreen()
        else if (enabled && _veiled)
          const _Veil(),
      ],
    );
  }
}

/// What the app switcher gets to see.
///
/// Opaque rather than blurred. A blur of a page still shows its shape, its
/// colour and how many items are in the list, and the point of this is that
/// the snapshot carries nothing.
class _Veil extends StatelessWidget {
  const _Veil();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ExcludeSemantics(
      child: ColoredBox(
        color: colors.surface,
        child: Center(
          child: Icon(
            Icons.lock_outline_rounded,
            size: 40,
            color: colors.textTertiary,
          ),
        ),
      ),
    );
  }
}

class _LockScreen extends ConsumerStatefulWidget {
  const _LockScreen();

  @override
  ConsumerState<_LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<_LockScreen> {
  bool _asking = false;
  DeviceAuthOutcome? _lastOutcome;

  @override
  void initState() {
    super.initState();
    // Prompt on arrival. Making the user tap "Unlock" before the OS dialog
    // appears adds a step to something they do several times a day and buys
    // nothing — they came here to get in.
    WidgetsBinding.instance.addPostFrameCallback((_) => _ask());
  }

  Future<void> _ask() async {
    if (_asking || !mounted) return;
    setState(() => _asking = true);
    final outcome = await ref.read(appLockedProvider.notifier).unlock();
    if (!mounted) return;
    setState(() {
      _asking = false;
      _lastOutcome = outcome;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return AmbientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: Breakpoints.readableContent),
              child: Padding(
                padding: const EdgeInsets.all(Space.xxxl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: colors.brandSubtle,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.lock_outline_rounded,
                        color: colors.brand,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: Space.xl),
                    Text('Action is locked', style: text.headlineSmall),
                    const SizedBox(height: Space.sm),
                    Text(
                      _message(_lastOutcome),
                      textAlign: TextAlign.center,
                      style: text.bodyMedium
                          ?.copyWith(color: colors.textSecondary),
                    ),
                    const SizedBox(height: Space.xxl),
                    FilledButton(
                      onPressed: _asking ? null : _ask,
                      child: Text(_asking ? 'Waiting…' : 'Unlock'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Each outcome gets its own sentence.
  ///
  /// The unavailable case is the one that matters: someone who removed their
  /// device PIN after enabling App Lock would otherwise be told "that didn't
  /// work" forever with no hint of where the problem actually is.
  static String _message(DeviceAuthOutcome? outcome) => switch (outcome) {
        null =>
          'Confirm it is you to continue. Action asks your device — it never '
              'sees your fingerprint, face or PIN.',
        DeviceAuthOutcome.succeeded => 'Unlocking…',
        DeviceAuthOutcome.failed =>
          'That was not confirmed. Try again when you are ready.',
        DeviceAuthOutcome.unavailable =>
          'Your device cannot confirm it is you right now. Check that a '
              'screen lock is still set up in your device settings.',
      };
}
