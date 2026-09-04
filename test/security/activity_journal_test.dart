import 'dart:convert';
import 'dart:io';

import 'package:action_app/core/security/activity_journal.dart';
import 'package:flutter_test/flutter_test.dart';

DateTime _at(int day) => DateTime.utc(2026, 9, day, 12);

ActivityEntry _sent({
  int day = 1,
  String? provider = 'anthropic',
  String? tool = 'document-intelligence',
  int pages = 0,
  int attachments = 0,
  int chars = 0,
}) =>
    ActivityEntry(
      event: ActivityEvent.aiRequestSent,
      at: _at(day),
      providerId: provider,
      toolId: tool,
      pages: pages,
      attachments: attachments,
      textCharacters: chars,
    );

void main() {
  group('content cannot get into the journal', () {
    test('an identifier is kept', () {
      expect(ActivityEntry.sanitiseId('anthropic'), 'anthropic');
      expect(
        ActivityEntry.sanitiseId('document-intelligence'),
        'document-intelligence',
      );
      expect(ActivityEntry.sanitiseId('gpt_4.1'), 'gpt_4.1');
    });

    test('anything sentence-shaped is dropped', () {
      // The failure this prevents: a caller passing a document title, a
      // capture's OCR text, or a user's question where a tool id belongs.
      const contentish = [
        'Renew the car insurance by 18 August',
        'passport scan.pdf',
        'What is the deadline?',
        'Dear Sir or Madam',
      ];

      for (final value in contentish) {
        expect(ActivityEntry.sanitiseId(value), isNull, reason: value);
      }
    });

    test('a credential is dropped', () {
      expect(
        ActivityEntry.sanitiseId('sk-ant-api03-EXAMPLEEXAMPLEEXAMPLEEXAMPLE'),
        isNull,
      );
      // Not because it is recognised as a key — because it is too long and
      // has capitals. Shape, not a blocklist.
      expect(ActivityEntry.sanitiseId('AIzaEXAMPLE'), isNull);
    });

    test('an endpoint URL is dropped', () {
      // A self-hosted endpoint is itself identifying.
      expect(ActivityEntry.sanitiseId('https://ai.mycompany.example/v1'), isNull);
    });

    test('empty and overlong values are dropped', () {
      expect(ActivityEntry.sanitiseId(''), isNull);
      expect(ActivityEntry.sanitiseId('   '), isNull);
      expect(ActivityEntry.sanitiseId('a' * 41), isNull);
      expect(ActivityEntry.sanitiseId('a' * 40), hasLength(40));
    });

    test('the constructor applies the gate, not just the helper', () {
      final entry = ActivityEntry(
        event: ActivityEvent.aiRequestSent,
        at: _at(1),
        providerId: 'The user asked about their tax return',
        toolId: 'invoice from British Gas.pdf',
      );

      expect(entry.providerId, isNull);
      expect(entry.toolId, isNull);
    });

    test('serialised output carries counts, never characters', () {
      final entry = _sent(pages: 4, attachments: 1, chars: 18_402);
      final json = jsonEncode(entry.toJson());

      expect(json, contains('18402'));
      expect(json, contains('anthropic'));
      // There is simply nowhere for text to live.
      expect(entry.toJson().values.whereType<String>(), [
        'aiRequestSent',
        _at(1).toIso8601String(),
        'anthropic',
        'document-intelligence',
      ]);
    });

    test('toString does not grow a content field by accident', () {
      expect('${_sent()}', 'ActivityEntry(aiRequestSent, '
          '${_at(1).toIso8601String()})');
    });
  });

  group('round trip', () {
    test('survives encoding and decoding intact', () {
      final entry = _sent(day: 3, pages: 12, attachments: 2, chars: 900);

      final restored = ActivityEntry.fromJson(
        jsonDecode(jsonEncode(entry.toJson())) as Map<String, dynamic>,
      )!;

      expect(restored.event, entry.event);
      expect(restored.at, entry.at);
      expect(restored.providerId, 'anthropic');
      expect(restored.toolId, 'document-intelligence');
      expect(restored.pages, 12);
      expect(restored.attachments, 2);
      expect(restored.textCharacters, 900);
    });

    test('an unknown event name decodes to null rather than throwing', () {
      expect(
        ActivityEntry.fromJson({'event': 'somethingElse', 'at': '2026-09-01'}),
        isNull,
      );
    });

    test('a missing or unreadable timestamp decodes to null', () {
      expect(ActivityEntry.fromJson({'event': 'aiRequestSent'}), isNull);
      expect(
        ActivityEntry.fromJson({'event': 'aiRequestSent', 'at': 'never'}),
        isNull,
      );
    });
  });

  group('lanes', () {
    test('a send is a transfer, everything else is a protection change', () {
      expect(laneOf(ActivityEvent.aiRequestSent), ActivityLane.transfer);

      for (final event in ActivityEvent.values) {
        if (event == ActivityEvent.aiRequestSent) continue;
        expect(laneOf(event), ActivityLane.protection, reason: event.name);
      }
    });
  });

  group('retention', () {
    test('keeps only the newest maxEntries', () {
      final entries = [
        for (var i = 0; i < ActivityJournal.maxEntries + 40; i++)
          ActivityEntry(
            event: ActivityEvent.aiRequestSent,
            at: DateTime.utc(2026, 9, 1).add(Duration(minutes: i)),
          ),
      ];

      final pruned = JsonFileActivityJournal.prune(
        entries,
        now: DateTime.utc(2026, 9, 1, 12),
      );

      expect(pruned, hasLength(ActivityJournal.maxEntries));
      // Newest kept, oldest dropped.
      expect(pruned.first.at, entries.last.at);
    });

    test('drops anything past the retention window regardless of count', () {
      final now = DateTime.utc(2026, 9, 1);
      final entries = [
        ActivityEntry(event: ActivityEvent.aiRequestSent, at: now),
        ActivityEntry(
          event: ActivityEvent.aiRequestSent,
          at: now.subtract(const Duration(days: 200)),
        ),
      ];

      final pruned = JsonFileActivityJournal.prune(entries, now: now);

      expect(pruned, hasLength(1));
      expect(pruned.single.at, now);
    });

    test('an entry exactly at the boundary is dropped, not kept', () {
      final now = DateTime.utc(2026, 9, 1);
      final entries = [
        ActivityEntry(
          event: ActivityEvent.aiRequestSent,
          at: now.subtract(const Duration(days: ActivityJournal.retentionDays)),
        ),
      ];

      expect(JsonFileActivityJournal.prune(entries, now: now), isEmpty);
    });
  });

  group('the in-memory journal', () {
    test('returns newest first', () async {
      final journal = InMemoryActivityJournal();
      await journal.record(_sent(day: 1));
      await journal.record(_sent(day: 5));
      await journal.record(_sent(day: 3));

      final all = await journal.all();
      expect(all.map((e) => e.at.day), [5, 3, 1]);
    });

    test('clear forgets everything', () async {
      final journal = InMemoryActivityJournal();
      await journal.record(_sent());
      await journal.clear();

      expect(await journal.all(), isEmpty);
    });

    test('prunes as it records', () async {
      final journal = InMemoryActivityJournal();
      for (var i = 0; i < ActivityJournal.maxEntries + 10; i++) {
        await journal.record(ActivityEntry(
          event: ActivityEvent.aiRequestSent,
          at: DateTime.utc(2026, 9, 1).add(Duration(minutes: i)),
        ));
      }

      expect(await journal.all(), hasLength(ActivityJournal.maxEntries));
    });
  });

  group('the file journal', () {
    late Directory dir;

    setUp(() async {
      dir = await Directory.systemTemp.createTemp('action_activity');
    });
    tearDown(() async {
      if (await dir.exists()) await dir.delete(recursive: true);
    });

    test('reads back what it wrote', () async {
      final journal = JsonFileActivityJournal(dir);
      await journal.record(_sent(day: 2, pages: 4));

      final reopened = await JsonFileActivityJournal(dir).all();

      expect(reopened, hasLength(1));
      expect(reopened.single.pages, 4);
      expect(reopened.single.providerId, 'anthropic');
    });

    test('an absent file is an empty journal, not an error', () async {
      expect(await JsonFileActivityJournal(dir).all(), isEmpty);
    });

    test('a corrupt file degrades to empty rather than taking the app down',
        () async {
      final file = File('${dir.path}${Platform.pathSeparator}activity.json');
      await file.writeAsString('{ this is not json');

      expect(await JsonFileActivityJournal(dir).all(), isEmpty);
    });

    test('one unreadable record does not lose the others', () async {
      final file = File('${dir.path}${Platform.pathSeparator}activity.json');
      await file.writeAsString(jsonEncode([
        {'event': 'aiRequestSent', 'at': '2026-09-02T12:00:00Z'},
        {'event': 'inventedByAFutureVersion', 'at': '2026-09-03T12:00:00Z'},
        {'event': 'providerConnected', 'at': '2026-09-01T12:00:00Z'},
      ]));

      final all = await JsonFileActivityJournal(dir).all();

      expect(all, hasLength(2));
      expect(all.map((e) => e.event), [
        ActivityEvent.aiRequestSent,
        ActivityEvent.providerConnected,
      ]);
    });

    test('clear removes the file', () async {
      final journal = JsonFileActivityJournal(dir);
      await journal.record(_sent());
      await journal.clear();

      expect(await journal.all(), isEmpty);
      expect(
        await File('${dir.path}${Platform.pathSeparator}activity.json')
            .exists(),
        isFalse,
      );
    });

    test('clearing an empty journal is not an error', () async {
      await JsonFileActivityJournal(dir).clear();
    });

    test('writing into a directory that does not exist yet creates it',
        () async {
      final nested = Directory(
        '${dir.path}${Platform.pathSeparator}not${Platform.pathSeparator}yet',
      );
      final journal = JsonFileActivityJournal(nested);

      await journal.record(_sent());

      expect(await journal.all(), hasLength(1));
    });

    test('the file on disk contains no free text at all', () async {
      // The strongest form of the guarantee: read the actual bytes and assert
      // that every string in them is a known constant.
      final journal = JsonFileActivityJournal(dir);
      await journal.record(_sent(pages: 4, chars: 20000));
      await journal.record(ActivityEntry(
        event: ActivityEvent.providerConnected,
        at: _at(2),
        providerId: 'openai',
      ));

      final raw = await File(
        '${dir.path}${Platform.pathSeparator}activity.json',
      ).readAsString();
      final decoded = jsonDecode(raw) as List;

      for (final record in decoded.cast<Map<String, dynamic>>()) {
        for (final entry in record.entries) {
          final value = entry.value;
          if (value is! String) continue;
          if (entry.key == 'at') continue;
          expect(
            RegExp(r'^[A-Za-z0-9_.-]+$').hasMatch(value),
            isTrue,
            reason: 'free text reached the journal: ${entry.key}=$value',
          );
        }
      }
    });
  });
}
