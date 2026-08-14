// Generates the one fixture that cannot be produced by drawing alone: a JPEG
// whose pixels are stored sideways and whose EXIF orientation tag says so.
//
// This is what a phone camera actually writes when the handset is held in
// portrait — the sensor buffer is landscape and the tag carries the rotation.
// A viewer that honours EXIF shows it upright; ML Kit, which reads the buffer
// we hand it rather than the metadata, sees it sideways and recognises almost
// nothing. That is the case `img.bakeOrientation` exists for, and the drawn
// "rotated" fixture (which is skewed, not rotated, and carries no tag) never
// exercised it.
//
// Run from the project root:
//   dart run tool/make_exif_rotated_fixture.dart

import 'dart:io';

import 'package:image/image.dart' as img;

void main() {
  const source = 'test/fixtures/images/01_clean_notice.jpg';
  const target = 'test/fixtures/images/19_exif_rotated.jpg';

  final upright = img.decodeImage(File(source).readAsBytesSync());
  if (upright == null) {
    stderr.writeln('could not decode $source');
    exit(1);
  }

  // Store the pixels rotated a quarter turn anticlockwise, then declare
  // orientation 6 ("rotate 90 clockwise to display"). The two cancel out for
  // any reader that honours the tag, and only for such a reader.
  final sideways = img.copyRotate(upright, angle: -90);
  sideways.exif.imageIfd.orientation = 6;

  final bytes = img.encodeJpg(sideways, quality: 88);
  File(target).writeAsBytesSync(bytes);

  stdout.writeln('wrote $target');
  stdout.writeln('  stored pixels : ${sideways.width}x${sideways.height}');
  stdout.writeln('  orientation   : ${sideways.exif.imageIfd.orientation}');
  stdout.writeln('  upright should be : ${upright.width}x${upright.height}');
  stdout.writeln('  bytes         : ${bytes.length}');
}
