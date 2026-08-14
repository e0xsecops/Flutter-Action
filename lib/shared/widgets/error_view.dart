import 'package:flutter/material.dart';

import '../../design/tokens/colors.dart';
import '../../design/tokens/dimens.dart';

/// Failure state with a way forward.
///
/// The message is always caller-supplied plain language: extraction fails for
/// reasons a user can act on (a blurry photo) and reasons they cannot (a
/// service is down), and a generic "Something went wrong" helps with neither.
class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.message,
    this.onRetry,
    this.onManualEntry,
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;

  /// Required by the product rule that manual creation stays available when
  /// automatic extraction fails.
  final VoidCallback? onManualEntry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Space.xxxl,
          vertical: Space.huge,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: colors.surfaceSunken,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 30,
                color: colors.danger,
              ),
            ),
            const SizedBox(height: Space.xl),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Text(
                message,
                style: text.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: Space.xxl),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded, size: 20),
                label: const Text('Try again'),
              ),
            ],
            if (onManualEntry != null) ...[
              const SizedBox(height: Space.sm),
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
