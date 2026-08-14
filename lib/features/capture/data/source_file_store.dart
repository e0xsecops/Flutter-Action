import 'dart:io';
import 'dart:typed_data';

/// Persistence for capture *bytes*, kept separate from [SourceStore], which
/// persists capture *metadata*.
///
/// The two have different lifetimes and different replacements: the metadata
/// index becomes Drift on day 8, while files stay on the filesystem. Splitting
/// them means that swap does not reach into capture logic, and nothing outside
/// this file needs to know where bytes physically live.
abstract interface class SourceFileStore {
  /// Writes [bytes] under [id] and returns the absolute path written.
  ///
  /// [extension] must match what is actually in [bytes]; callers get it from
  /// format detection, never from the source filename.
  Future<String> save({
    required String id,
    required Uint8List bytes,
    required String extension,
  });

  /// Removes a single file. Missing files are not an error — the caller's
  /// intent is that the bytes are gone.
  Future<void> delete(String path);

  Future<void> deleteAll();
}

class DirectorySourceFileStore implements SourceFileStore {
  DirectorySourceFileStore(this.root);

  /// Parent directory; files land in a `sources` subfolder of it.
  final Directory root;

  static const folderName = 'sources';

  Directory get _directory =>
      Directory('${root.path}${Platform.pathSeparator}$folderName');

  @override
  Future<String> save({
    required String id,
    required Uint8List bytes,
    required String extension,
  }) async {
    await _directory.create(recursive: true);
    final file = File(
      '${_directory.path}${Platform.pathSeparator}$id.$extension',
    );
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  @override
  Future<void> delete(String path) async {
    final file = File(path);
    if (await file.exists()) await file.delete();
  }

  @override
  Future<void> deleteAll() async {
    if (await _directory.exists()) {
      await _directory.delete(recursive: true);
    }
  }
}
