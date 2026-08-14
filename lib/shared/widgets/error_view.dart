import 'package:flutter/material.dart';

/// Failure state with a retry affordance.
///
/// Extraction can fail for reasons the user can act on (a blurry photo) and
/// reasons they cannot (the service is down), so the message is always caller-
/// supplied plain language rather than a generic "Something went wrong".
class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.message,
    this.onRetry,
    this.onManualEntry,
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;

  /// Escape hatch required by the product rules: if extraction fails the user
  /// must still be able to create the action by hand.
  final VoidCallback? onManualEntry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.tonalIcon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Try again'),
              ),
            ],
            if (onManualEntry != null) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: onManualEntry,
                child: const Text('Enter it manually'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
