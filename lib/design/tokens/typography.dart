import 'package:flutter/material.dart';

/// Type scale for the app.
///
/// Deliberately uses the platform font for now. What separates this from a
/// default Material screen is the scale itself — tighter tracking on large
/// sizes, weight rather than size carrying hierarchy, and a restrained number
/// of steps. Bundling a variable face (Inter or Geist) is a day-15 polish item;
/// it is not what makes or breaks the look here, and it costs APK size and an
/// asset-licensing step we do not need on day 3.
abstract final class AppText {
  /// Amounts, dates, counts. Proportional digits make columns of numbers jitter
  /// as they update, which reads as sloppy on a screen full of deadlines.
  static const numeric = <FontFeature>[FontFeature.tabularFigures()];

  static TextTheme build({
    required Color primary,
    required Color secondary,
  }) {
    return TextTheme(
      // Screen titles. Tight tracking stops large text looking loose.
      displaySmall: TextStyle(
        fontSize: 32,
        height: 38 / 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.8,
        color: primary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        height: 30 / 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
        color: primary,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        height: 26 / 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        color: primary,
      ),
      // Card titles.
      titleMedium: TextStyle(
        fontSize: 17,
        height: 23 / 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
        color: primary,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        height: 20 / 15,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        color: primary,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        height: 22 / 15,
        fontWeight: FontWeight.w400,
        color: secondary,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        height: 18 / 13,
        fontWeight: FontWeight.w400,
        color: secondary,
      ),
      // Chips, badges, section headers.
      labelLarge: TextStyle(
        fontSize: 15,
        height: 20 / 15,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        height: 18 / 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: secondary,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        height: 14 / 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        color: secondary,
      ),
    );
  }
}
