/// Wiring for the activity journal.
///
/// Deliberately has no import from `features/` so the journal stays a core
/// concern rather than something the settings feature owns — three features
/// record into it, and the one that reads it should not be its landlord.
library;

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'activity_journal.dart';

/// Where activity is stored.
///
/// Application *support*, not documents: this is Action's own bookkeeping, not
/// the user's content, and on Android it keeps the file out of anything that
/// enumerates user-visible files.
///
/// Falls back to memory rather than failing. A widget test has no
/// `path_provider` implementation behind the platform channel, and an app that
/// cannot open a log file must still open.
final activityJournalProvider = FutureProvider<ActivityJournal>((ref) async {
  try {
    final Directory directory = await getApplicationSupportDirectory();
    return JsonFileActivityJournal(directory);
  } on Object {
    return InMemoryActivityJournal();
  }
});

/// Everything recorded, most recent first.
final activityEntriesProvider = FutureProvider<List<ActivityEntry>>((ref) async {
  final journal = await ref.watch(activityJournalProvider.future);
  return journal.all();
});

/// Entries that describe data crossing the network boundary.
final dataTransfersProvider = FutureProvider<List<ActivityEntry>>((ref) async {
  final entries = await ref.watch(activityEntriesProvider.future);
  return entries.where((e) => e.lane == ActivityLane.transfer).toList();
});

final activityRecorderProvider = Provider<ActivityRecorder>((ref) {
  return ActivityRecorder(ref);
});

/// Records events without making the caller care whether it worked.
///
/// **Recording is best-effort, and that is a deliberate ranking.** A receipt
/// exists to inform the user afterwards; the user's actual task exists now. An
/// AI run that aborts because a log file could not be opened would be a worse
/// product and no more private, so every path here swallows.
class ActivityRecorder {
  const ActivityRecorder(this._ref);

  final Ref _ref;

  Future<void> record(
    ActivityEvent event, {
    String? providerId,
    String? toolId,
    int pages = 0,
    int attachments = 0,
    int textCharacters = 0,
    DateTime? at,
  }) async {
    await recordEntry(ActivityEntry(
      event: event,
      at: at ?? DateTime.now(),
      providerId: providerId,
      toolId: toolId,
      pages: pages,
      attachments: attachments,
      textCharacters: textCharacters,
    ));
  }

  Future<void> recordEntry(ActivityEntry entry) async {
    try {
      final journal = await _ref.read(activityJournalProvider.future);
      await journal.record(entry);
      _ref.invalidate(activityEntriesProvider);
    } on Object {
      // See the class comment.
    }
  }

  Future<void> clear() async {
    try {
      final journal = await _ref.read(activityJournalProvider.future);
      await journal.clear();
      _ref.invalidate(activityEntriesProvider);
    } on Object {
      // Nothing useful to say, and a failure dialog on a privacy screen would
      // be worse than a stale list.
    }
  }
}
