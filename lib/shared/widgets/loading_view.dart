import 'package:flutter/material.dart';

import '../../design/tokens/dimens.dart';

/// Busy state. Always labelled: a bare spinner reads as a hang, and the work
/// this app does is slow enough that the user deserves to know what it is
/// doing. The staged processing language arrives with the AI pipeline.
class LoadingView extends StatelessWidget {
  const LoadingView({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Space.xxxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            ),
            if (message != null) ...[
              const SizedBox(height: Space.xl),
              Text(
                message!,
                style: text.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
