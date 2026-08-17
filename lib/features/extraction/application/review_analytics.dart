import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Semantic review events. Names only — never a payload.
///
/// The review screen handles deadlines, amounts and document text, and none
/// of that may leave the device through telemetry. Each hook records *that*
/// something happened, not *what* it was: no source text, no quotes, no
/// values, no dates. Widget tests override [reviewAnalyticsProvider] with a
/// recorder; the default implementation swallows every failure because
/// analytics must never be able to break review.
abstract final class ReviewEvents {
  static const opened = 'extraction_review_opened';
  static const fieldEdited = 'extraction_field_edited';
  static const evidenceViewed = 'extraction_evidence_viewed';
  static const confirmed = 'extraction_confirmed';
  static const manualFallback = 'extraction_manual_fallback';
  static const cancelled = 'extraction_cancelled';
}

class ReviewAnalytics {
  const ReviewAnalytics();

  Future<void> log(String event) async {
    try {
      await FirebaseAnalytics.instance.logEvent(name: event);
    } on Object catch (_) {
      // Analytics is best-effort by design.
    }
  }
}

final reviewAnalyticsProvider =
    Provider<ReviewAnalytics>((ref) => const ReviewAnalytics());
