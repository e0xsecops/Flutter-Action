/// A local, content-free record of what Action did with the user's data.
///
/// **What this is for.** Action's privacy claims are, at the moment, a page of
/// prose the user has to take on faith. This makes them checkable: when a tool
/// sends a document to a provider, a receipt is written locally saying which
/// tool, which provider, how much, and when. The user can read back what
/// actually left this device rather than what the marketing said would.
///
/// **The design constraint that makes it safe.** A log of what you analysed is
/// itself a sensitive document — arguably more sensitive than any single
/// capture, because it is a timeline. So the entry type has no field capable of
/// holding content. There is no message, no title, no filename, no query, no
/// prompt and no response. The two string fields are *identifiers* — a tool id
/// and a provider id, both drawn from constants compiled into the app — and
/// [ActivityEntry.sanitiseId] enforces that shape on the way in, so content
/// cannot arrive here even through a caller's mistake.
///
/// This is the same rule the analytics contract follows and the same rule
/// `recentToolsProvider` follows: remembering *which tool* is a convenience;
/// remembering *what it was pointed at* would be a log of what the user reads.
///
/// **Bounded, because retention is a liability.** The journal keeps the most
/// recent [ActivityJournal.maxEntries] entries and nothing older than
/// [ActivityJournal.retentionDays]. A privacy feature that quietly accumulates
/// a permanent history has become the thing it was guarding against.
///
/// **Never leaves the device.** It is not mirrored, not analysed, and not
/// attached to a crash report.
library;

import 'dart:convert';
import 'dart:io';

/// Something worth being able to look back at.
///
/// A closed set, deliberately. Anything not on this list cannot be recorded,
/// which is what stops the journal drifting into a general-purpose log.
enum ActivityEvent {
  /// Content was sent to an AI provider. The receipt.
  ///
  /// Recorded at the moment of sending, never on success. A receipt that
  /// listed only completed runs would understate what left the device — a
  /// request that failed at the provider still arrived there — and would go
  /// missing entirely if the app were killed mid-run.
  aiRequestSent,

  /// An AI provider was connected, or replaced.
  providerConnected,

  /// The provider and its key were removed.
  providerDisconnected,

  appLockEnabled,
  appLockDisabled,

  screenPrivacyEnabled,
  screenPrivacyDisabled,

  notificationPrivacyEnabled,
  notificationPrivacyDisabled,

  /// A cleaned copy was produced by the redaction tool.
  redactedCopyCreated,

  capturesCleared,
  dataDeletionRequested,
  dataDeletionCompleted,
}

/// Whether an entry belongs to the "what left this device" view or the
/// "what changed" one.
///
/// The two are shown separately because they answer different questions and
/// mixing them buries the one that matters. A user checking what was sent to
/// OpenAI should not have to scroll past six appearance changes.
enum ActivityLane {
  /// Data crossed the network boundary.
  transfer,

  /// A protection or a setting changed, entirely locally.
  protection,
}

ActivityLane laneOf(ActivityEvent event) => switch (event) {
      ActivityEvent.aiRequestSent => ActivityLane.transfer,
      _ => ActivityLane.protection,
    };

/// One recorded event.
///
/// Every field is either an enum, a number, or an identifier constrained by
/// [sanitiseId]. There is deliberately nowhere to put a sentence.
class ActivityEntry {
  ActivityEntry({
    required this.event,
    required this.at,
    String? providerId,
    String? toolId,
    this.pages = 0,
    this.attachments = 0,
    this.textCharacters = 0,
  })  : providerId = sanitiseId(providerId),
        toolId = sanitiseId(toolId);

  final ActivityEvent event;
  final DateTime at;

  /// A provider *kind* id — `openai`, `anthropic`. Never a key, never an
  /// endpoint, never an account.
  final String? providerId;

  /// A tool id from the registry — `document_intelligence`. Never what the
  /// tool was pointed at.
  final String? toolId;

  /// Counts describing the size of what was sent. Never the thing itself.
  final int pages;
  final int attachments;
  final int textCharacters;

  ActivityLane get lane => laneOf(event);

  /// The gate that makes "content cannot get in here" structurally true rather
  /// than a convention.
  ///
  /// Identifiers in this app are lowercase, short, and drawn from constants.
  /// Anything else — a title, a filename, a sentence, a key — fails the shape
  /// and is dropped rather than stored. Dropping is the right failure: a
  /// missing tool name costs a label, and storing a document title costs the
  /// user the guarantee this whole file exists to provide.
  static String? sanitiseId(String? raw) {
    if (raw == null) return null;
    final trimmed = raw.trim();
    if (trimmed.isEmpty || trimmed.length > 40) return null;
    if (!RegExp(r'^[a-z0-9_.-]+$').hasMatch(trimmed)) return null;
    return trimmed;
  }

  Map<String, dynamic> toJson() => {
        'event': event.name,
        'at': at.toIso8601String(),
        if (providerId != null) 'provider': providerId,
        if (toolId != null) 'tool': toolId,
        if (pages > 0) 'pages': pages,
        if (attachments > 0) 'attachments': attachments,
        if (textCharacters > 0) 'chars': textCharacters,
      };

  /// Returns null for a record that cannot be understood, so one bad line does
  /// not take the whole journal down with it.
  static ActivityEntry? fromJson(Map<String, dynamic> json) {
    final name = json['event'];
    final event =
        ActivityEvent.values.where((e) => e.name == name).firstOrNull;
    if (event == null) return null;

    final at = DateTime.tryParse(json['at'] as String? ?? '');
    if (at == null) return null;

    return ActivityEntry(
      event: event,
      at: at,
      providerId: json['provider'] as String?,
      toolId: json['tool'] as String?,
      pages: (json['pages'] as num?)?.toInt() ?? 0,
      attachments: (json['attachments'] as num?)?.toInt() ?? 0,
      textCharacters: (json['chars'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  String toString() => 'ActivityEntry(${event.name}, ${at.toIso8601String()})';
}

/// Where activity is kept.
abstract interface class ActivityJournal {
  /// Most recent first.
  Future<List<ActivityEntry>> all();

  Future<void> record(ActivityEntry entry);

  /// Forgets everything. Offered to the user, because a history they cannot
  /// clear is not a feature they control.
  Future<void> clear();

  /// Keep at most this many. Chosen to cover months of ordinary use while
  /// staying small enough to read and rewrite in one go.
  static const maxEntries = 250;

  /// And nothing older than this, regardless of count.
  static const retentionDays = 90;
}

/// JSON-file backed, following the same shape as the capture index: one file,
/// rewritten on change, with a corrupt file degrading to empty rather than
/// taking the app down.
///
/// Losing the journal costs the user a history. Failing to open the app
/// because of it would cost them the app, so every read path here is total.
class JsonFileActivityJournal implements ActivityJournal {
  JsonFileActivityJournal(this.directory);

  final Directory directory;

  static const _fileName = 'activity.json';

  File get _file =>
      File('${directory.path}${Platform.pathSeparator}$_fileName');

  @override
  Future<List<ActivityEntry>> all() async {
    final file = _file;
    if (!await file.exists()) return const [];

    try {
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! List) return const [];
      return decoded
          .whereType<Map<String, dynamic>>()
          .map(ActivityEntry.fromJson)
          .nonNulls
          .toList(growable: false)
        ..sort((a, b) => b.at.compareTo(a.at));
    } on FormatException {
      return const [];
    } on FileSystemException {
      return const [];
    }
  }

  @override
  Future<void> record(ActivityEntry entry) async {
    final existing = await all();
    final pruned = prune([entry, ...existing], now: entry.at);
    await _write(pruned);
  }

  @override
  Future<void> clear() async {
    final file = _file;
    try {
      if (await file.exists()) await file.delete();
    } on FileSystemException {
      // Nothing useful to do, and nothing the user needs to be told: the
      // journal is a convenience, and failing to clear it must not become an
      // error dialog on a privacy screen.
    }
  }

  Future<void> _write(List<ActivityEntry> entries) async {
    try {
      if (!await directory.exists()) await directory.create(recursive: true);
      await _file.writeAsString(
        jsonEncode(entries.map((e) => e.toJson()).toList()),
        flush: true,
      );
    } on FileSystemException {
      // Recording is best-effort by design. A journal write must never be able
      // to fail a user's actual task — the alternative is an AI run that
      // aborts because a log file could not be opened.
    }
  }

  /// Applies both retention rules. Pure, so the policy can be tested without
  /// touching a disk.
  static List<ActivityEntry> prune(
    List<ActivityEntry> entries, {
    required DateTime now,
  }) {
    final cutoff = now.subtract(
      const Duration(days: ActivityJournal.retentionDays),
    );
    final sorted = [...entries]..sort((a, b) => b.at.compareTo(a.at));
    return sorted
        .where((e) => e.at.isAfter(cutoff))
        .take(ActivityJournal.maxEntries)
        .toList(growable: false);
  }
}

/// For tests, and for the case where no writable directory is available.
///
/// A real implementation is preferable to a null object here: an app that
/// silently stops recording is one whose receipts lie by omission, and this at
/// least keeps the session's own history intact.
class InMemoryActivityJournal implements ActivityJournal {
  final List<ActivityEntry> _entries = [];

  @override
  Future<List<ActivityEntry>> all() async =>
      List.unmodifiable([..._entries]..sort((a, b) => b.at.compareTo(a.at)));

  @override
  Future<void> record(ActivityEntry entry) async {
    _entries
      ..add(entry)
      ..sort((a, b) => b.at.compareTo(a.at));
    final pruned = JsonFileActivityJournal.prune(_entries, now: entry.at);
    _entries
      ..clear()
      ..addAll(pruned);
  }

  @override
  Future<void> clear() async => _entries.clear();
}
