import 'dart:io';

import 'package:action_app/features/capture/application/capture_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final sep = Platform.pathSeparator;

  group('imageExtensionFor', () {
    test('keeps the real extension so the filename does not lie', () {
      // A picked screenshot is a PNG; storing it as .jpg would mislead anything
      // that infers a MIME type from the name.
      expect(imageExtensionFor('${sep}tmp${sep}shot.png'), 'png');
      expect(imageExtensionFor('${sep}tmp${sep}photo.JPG'), 'jpg');
      expect(imageExtensionFor('${sep}tmp${sep}scan.heic'), 'heic');
      expect(imageExtensionFor('${sep}tmp${sep}pic.webp'), 'webp');
    });

    test('falls back to jpg when there is no extension', () {
      expect(imageExtensionFor('${sep}tmp${sep}noextension'), 'jpg');
    });

    test('ignores dots that belong to a directory, not the file', () {
      expect(imageExtensionFor('${sep}tmp${sep}my.folder${sep}file'), 'jpg');
    });

    test('falls back when the trailing segment is too long to be an extension',
        () {
      expect(
        imageExtensionFor('${sep}tmp${sep}archive.backup2026'),
        'jpg',
      );
    });

    test('falls back on a trailing dot', () {
      expect(imageExtensionFor('${sep}tmp${sep}weird.'), 'jpg');
    });
  });
}
