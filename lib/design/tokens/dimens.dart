import 'package:flutter/widgets.dart';

/// 4pt spacing scale. Named by role rather than size so a screen reads as a
/// rhythm instead of a pile of magic numbers.
abstract final class Space {
  static const xxs = 2.0;
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 20.0;
  static const xxl = 24.0;
  static const xxxl = 32.0;
  static const huge = 40.0;
  static const giant = 64.0;

  /// Horizontal page inset. Every full-width screen uses this so content lines
  /// up vertically as the user moves between screens.
  static const page = 20.0;
}

/// Controlled radii. Not everything is rounded, and nothing is a pill unless it
/// is genuinely a chip or a badge.
abstract final class Radii {
  static const xs = 6.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const pill = 999.0;

  static const rSm = BorderRadius.all(Radius.circular(sm));
  static const rMd = BorderRadius.all(Radius.circular(md));
  static const rLg = BorderRadius.all(Radius.circular(lg));
  static const rXl = BorderRadius.all(Radius.circular(xl));

  /// Bottom sheets are rounded on the top edge only.
  static const sheet = BorderRadius.vertical(top: Radius.circular(xl));
}

/// Hairlines carry the structure that shadows would otherwise carry.
abstract final class Strokes {
  static const hairline = 1.0;

  /// The signature urgency spine down the left edge of an Action Card.
  static const spine = 3.0;
}

/// Motion is short, standard-eased, and used only where it explains a change of
/// state. No springs, no bounce, no decorative animation.
abstract final class Motion {
  static const fast = Duration(milliseconds: 150);
  static const base = Duration(milliseconds: 220);
  static const slow = Duration(milliseconds: 320);

  static const enter = Curves.easeOutCubic;
  static const exit = Curves.easeInCubic;
  static const standard = Curves.easeInOutCubic;
}
