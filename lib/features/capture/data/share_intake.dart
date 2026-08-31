/// The seam to Android's share sheet.
///
/// Kept thin on purpose: everything that decides anything lives in
/// [ShareValidator], which is pure and tested. This reads bytes and talks to a
/// platform channel, which is the part a test cannot exercise and therefore the
/// part that should contain no judgement.
library;

import 'dart:async';
import 'dart:io';


import 'package:flutter/services.dart';

import '../domain/shared_payload.dart';

/// A document the user picked, already copied into app storage.
class PickedDocument {
  const PickedDocument({
    required this.path,
    required this.sizeBytes,
    this.declaredName,
  });

  final String path;
  final int sizeBytes;
  final String? declaredName;
}

/// Where shares come from.
abstract interface class ShareIntake {
  /// The share waiting to be acted on, if any. Asking clears it.
  ///
  /// Pull rather than push because a cold start delivers the intent before the
  /// Dart engine exists — there is nobody to push to. Clearing on read is what
  /// stops one share being acted on twice across a rebuild or a rotation.
  Future<SharedPayload?> consumePending();

  /// Fires when a share arrives while Action is already running.
  Stream<void> get arrivals;

  /// Opens the system document picker.
  ///
  /// Null when the user backed out, which is an ordinary thing to do and not a
  /// failure to report.
  Future<PickedDocument?> pickDocument();
}

class PlatformShareIntake implements ShareIntake {
  PlatformShareIntake() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'shareArrived') _arrivals.add(null);
    });
  }

  static const _channel = MethodChannel('com.solvex.actionapp/share_in');

  /// Enough to identify every format [FileIdentifier] knows, with room for the
  /// `ftyp` brand that separates a HEIC from an MP4.
  static const _headerBytes = 32;

  final _arrivals = StreamController<void>.broadcast();

  @override
  Stream<void> get arrivals => _arrivals.stream;

  @override
  Future<SharedPayload?> consumePending() async {
    final Map<Object?, Object?>? raw;
    try {
      raw = await _channel.invokeMapMethod<Object?, Object?>(
        'consumePendingShare',
      );
    } on PlatformException {
      return const SharedRejected(ShareRejection.unreadable);
    } on MissingPluginException {
      // iOS, or a widget test. Not an error: there is simply no share.
      return null;
    }
    if (raw == null) return null;

    switch (raw['kind']) {
      case 'text':
        return ShareValidator.validateText(
          raw['text'] as String?,
          truncated: raw['truncated'] as bool? ?? false,
        );

      case 'file':
        final path = raw['path'] as String?;
        if (path == null) return const SharedRejected(ShareRejection.empty);
        final header = await _headerOf(path);
        if (header == null) {
          return const SharedRejected(ShareRejection.unreadable);
        }
        return ShareValidator.validateFile(
          path: path,
          declaredMimeType: raw['declaredMimeType'] as String?,
          declaredName: raw['declaredName'] as String?,
          sizeBytes: (raw['size'] as num?)?.toInt() ?? 0,
          header: header,
        );

      case 'unreadable':
        // The platform half could not read the shared stream at all — most
        // often a URI grant that is no longer valid.
        return const SharedRejected(ShareRejection.unreadable);

      default:
        return const SharedRejected(ShareRejection.empty);
    }
  }

  @override
  Future<PickedDocument?> pickDocument() async {
    final Map<Object?, Object?>? raw;
    try {
      raw = await _channel.invokeMapMethod<Object?, Object?>('pickDocument');
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
    if (raw == null || raw['kind'] != 'file') return null;

    final path = raw['path'] as String?;
    if (path == null) return null;
    return PickedDocument(
      path: path,
      sizeBytes: (raw['size'] as num?)?.toInt() ?? 0,
      declaredName: raw['declaredName'] as String?,
    );
  }

  static Future<Uint8List?> _headerOf(String path) async {
    try {
      final handle = await File(path).open();
      try {
        final buffer = Uint8List(_headerBytes);
        final read = await handle.readInto(buffer);
        return Uint8List.sublistView(buffer, 0, read);
      } finally {
        await handle.close();
      }
    } on FileSystemException {
      return null;
    }
  }

  void dispose() => _arrivals.close();
}

/// For tests and for hosts with no share sheet.
class NoShareIntake implements ShareIntake {
  const NoShareIntake();

  @override
  Future<SharedPayload?> consumePending() async => null;

  @override
  Stream<void> get arrivals => const Stream.empty();

  @override
  Future<PickedDocument?> pickDocument() async => null;
}
