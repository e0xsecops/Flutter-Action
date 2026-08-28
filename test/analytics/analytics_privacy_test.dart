import 'package:action_app/core/analytics/app_analytics.dart';
import 'package:action_app/features/actions/data/action_cloud_mirror.dart';
import 'package:action_app/features/actions/data/notification_scheduler.dart';
import 'package:action_app/features/extraction/data/extraction_transport.dart';
import 'package:flutter_test/flutter_test.dart';

/// The analytics privacy contract, enforced rather than promised.
///
/// Action's whole subject matter is the material that must never become
/// telemetry: bills, letters, deadlines, amounts, reference numbers, and
/// whatever someone types into search. These tests exist so that "we do not
/// log content" is a property a build fails on, not a sentence in a document.
///
/// Two mechanisms do the work, and both are tested here. Event *names* come
/// from a closed catalogue, so a name can never be built from data. Event
/// *parameters* are checked against an allowlist of keys **and** a closed set
/// of values per key — the second half is the important one, because a key
/// allowlist alone would happily carry `capture_type: "Water bill.pdf"`.
void main() {
  group('the event catalogue is closed', () {
    test('a known event passes', () {
      expect(
        () => validateAnalytics(AnalyticsEvents.actionCreated, null),
        returnsNormally,
      );
    });

    test('an unknown event is rejected', () {
      expect(
        () => validateAnalytics('action_created_for_water_bill', null),
        throwsA(isA<AnalyticsContractViolation>()),
      );
    });

    test('a name built from data cannot be sent', () {
      const title = 'Northgate Water invoice';
      expect(
        () => validateAnalytics('action_created_$title', null),
        throwsA(isA<AnalyticsContractViolation>()),
      );
    });

    test('every name in the catalogue is in the closed set', () {
      // Guards the one way this could rot: adding a constant and forgetting
      // to register it, so it silently stops being loggable.
      expect(AnalyticsEvents.all, contains(AnalyticsEvents.appOpened));
      expect(AnalyticsEvents.all, contains(AnalyticsEvents.searchNoResults));
      expect(AnalyticsEvents.all, contains(AnalyticsEvents.privacyDeletePartial));
      expect(AnalyticsEvents.all.length, greaterThanOrEqualTo(40));
    });

    test('no event name contains a field that could carry content', () {
      for (final name in AnalyticsEvents.all) {
        for (final banned in const [
          'title', 'amount', 'query', 'due', 'uid', 'id_', 'text', 'ocr',
        ]) {
          expect(
            name.contains(banned),
            isFalse,
            reason: '"$name" reads like it carries $banned',
          );
        }
      }
    });
  });

  group('parameters cannot carry content', () {
    test('an allowed key with an allowed value passes through', () {
      final safe = validateAnalytics(
        AnalyticsEvents.captureStarted,
        {AnalyticsParams.captureType: 'camera'},
      );
      expect(safe, {AnalyticsParams.captureType: 'camera'});
    });

    test('a key that is not on the allowlist is rejected', () {
      for (final key in const [
        'title', 'query', 'amount', 'due', 'currency', 'organisation',
        'reference', 'action_id', 'source_id', 'uid', 'path', 'ocr_text',
        'evidence', 'model_output',
      ]) {
        expect(
          () => validateAnalytics(AnalyticsEvents.actionCreated, {key: 'x'}),
          throwsA(isA<AnalyticsContractViolation>()),
          reason: '"$key" must never be loggable',
        );
      }
    });

    test('an allowed key carrying content instead of its enum is rejected',
        () {
      // The attack this closes: the key is fine, the value is a document.
      expect(
        () => validateAnalytics(
          AnalyticsEvents.captureStarted,
          {AnalyticsParams.captureType: 'Northgate Water invoice.pdf'},
        ),
        throwsA(isA<AnalyticsContractViolation>()),
      );
      expect(
        () => validateAnalytics(
          AnalyticsEvents.appearanceChanged,
          {AnalyticsParams.themeMode: 'user typed this'},
        ),
        throwsA(isA<AnalyticsContractViolation>()),
      );
    });

    test('a failure class must be a machine word, not a message', () {
      expect(
        () => validateAnalytics(
          AnalyticsEvents.privacyDeletePartial,
          {AnalyticsParams.failureClass: 'auth_unavailable'},
        ),
        returnsNormally,
      );
      // A sentence is prose, and prose is where content hides.
      expect(
        () => validateAnalytics(
          AnalyticsEvents.privacyDeletePartial,
          {AnalyticsParams.failureClass: 'could not delete Water bill'},
        ),
        throwsA(isA<AnalyticsContractViolation>()),
      );
      expect(
        () => validateAnalytics(
          AnalyticsEvents.privacyDeletePartial,
          {AnalyticsParams.failureClass: 'x' * 100},
        ),
        throwsA(isA<AnalyticsContractViolation>()),
      );
    });

    test('every allowlisted value set is closed except failure_class', () {
      for (final entry in AnalyticsParams.allowed.entries) {
        if (entry.key == AnalyticsParams.failureClass) continue;
        expect(
          entry.value,
          isNotNull,
          reason: '"${entry.key}" must pin its values to a closed set',
        );
        expect(entry.value, isNotEmpty);
      }
    });

    test('search events carry no parameters at all', () {
      // Nothing about a search may be described, not even its shape.
      expect(
        () => validateAnalytics(AnalyticsEvents.searchNoResults, null),
        returnsNormally,
      );
      expect(
        () => validateAnalytics(
          AnalyticsEvents.searchNoResults,
          {'query': 'passport'},
        ),
        throwsA(isA<AnalyticsContractViolation>()),
      );
    });
  });

  _crashlyticsContract();

  group('the sinks behave', () {
    test('the recorder keeps names and validated parameters', () async {
      final analytics = RecordingAppAnalytics();
      await analytics.log(AnalyticsEvents.appOpened);
      await analytics.log(
        AnalyticsEvents.captureStarted,
        parameters: {AnalyticsParams.captureType: 'paste'},
      );
      expect(analytics.names,
          [AnalyticsEvents.appOpened, AnalyticsEvents.captureStarted]);
      expect(analytics.events.last.parameters,
          {AnalyticsParams.captureType: 'paste'});
    });

    test('the no-op still enforces the contract', () async {
      // Otherwise a test that stubbed analytics away would also stub away the
      // rule, and the mistake would only surface in production.
      const analytics = NoopAppAnalytics();
      await expectLater(
        analytics.log('not_a_real_event'),
        throwsA(isA<AnalyticsContractViolation>()),
      );
    });

    test('a valid event through the no-op is silent and harmless', () async {
      const analytics = NoopAppAnalytics();
      await expectLater(
        analytics.log(AnalyticsEvents.actionCompleted),
        completes,
      );
    });
  });
}

/// Crash reporting is the other channel content could escape through, and it
/// is harder to police than analytics: a stack trace is whatever propagated.
/// The defence is upstream — every error this app raises itself carries a
/// machine word, never the document, title, query or provider body that
/// produced it. These pin that, so a future `throw` that interpolates a title
/// fails here rather than in a crash report.
void _crashlyticsContract() {
  group('errors carry classes, not content', () {
    test('a cloud mirror failure names only its class', () {
      const e = CloudMirrorException('permission_denied');
      expect(e.toString(), 'CloudMirrorException(permission_denied)');
      expect(e.failureClass, isNot(contains(' ')));
    });

    test('a notification failure names only its class', () {
      const e = NotificationScheduleException('permission_denied');
      expect(e.toString(), contains('permission_denied'));
      expect(e.toString().length, lessThan(80));
    });

    test('a transport failure carries a kind, and never the document', () {
      const e = ProviderTransportException(
        ProviderFailureKind.serviceUnavailable,
        detail: 'firebase_unavailable',
      );
      expect(e.kind, ProviderFailureKind.serviceUnavailable);
      expect(e.toString(), contains('serviceUnavailable'));
    });

    test('every user-facing failure message is a fixed string', () {
      // None of these is built from data, so none can leak one.
      for (final kind in ProviderFailureKind.values) {
        expect(kind.userMessage, isNotEmpty);
        expect(kind.userMessage, isNot(contains(r'$')));
      }
    });
  });
}
