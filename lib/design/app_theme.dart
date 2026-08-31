import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tokens/colors.dart';
import 'tokens/dimens.dart';
import 'tokens/typography.dart';

/// Builds the app's [ThemeData] from the token layer.
///
/// The two rules that keep this from looking like a stock Material app: every
/// elevation is zero, with structure carried by hairline borders and surface
/// steps instead of shadows; and the brand colour appears only on the primary
/// action, never as decoration.
abstract final class AppTheme {
  static ThemeData light() => _build(Brightness.light, AppColors.light);

  static ThemeData dark() => _build(Brightness.dark, AppColors.dark);

  static ThemeData _build(Brightness brightness, AppColors c) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.brand,
      onPrimary: c.onBrand,
      primaryContainer: c.brandSubtle,
      onPrimaryContainer: c.brand,
      secondary: c.brand,
      onSecondary: c.onBrand,
      error: c.danger,
      onError: c.onBrand,
      surface: c.surface,
      onSurface: c.textPrimary,
      surfaceContainerLowest: c.surfaceSunken,
      surfaceContainerLow: c.surface,
      surfaceContainer: c.surfaceElevated,
      surfaceContainerHigh: c.surfaceElevated,
      surfaceContainerHighest: c.surfaceElevated,
      onSurfaceVariant: c.textSecondary,
      outline: c.border,
      outlineVariant: c.border,
    );

    final text = AppText.build(primary: c.textPrimary, secondary: c.textSecondary);

    return ThemeData(
      brightness: brightness,
      colorScheme: scheme,
      textTheme: text,
      scaffoldBackgroundColor: c.surface,
      splashFactory: InkSparkle.splashFactory,
      extensions: <ThemeExtension<dynamic>>[c],

      appBarTheme: AppBarTheme(
        backgroundColor: c.surface,
        foregroundColor: c.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: text.titleMedium,
        // Written out rather than using SystemUiOverlayStyle.light/.dark.
        // Both of those constants hardcode an opaque black
        // `systemNavigationBarColor` *and* light navigation-bar icons — so in
        // the light theme, on a device using three-button navigation, the app
        // was asking for light icons against a light surface. Under Android
        // 16's enforced edge-to-edge the black is a deprecated no-op, but the
        // icon brightness is not.
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              brightness == Brightness.dark ? Brightness.light : Brightness.dark,
          statusBarBrightness: brightness,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness:
              brightness == Brightness.dark ? Brightness.light : Brightness.dark,
          // Let the OS draw its own scrim behind the bar rather than painting
          // a colour under it, which is the part Android 16 ignores.
          systemNavigationBarContrastEnforced: true,
        ),
      ),

      // Flat, hairline-bounded. Shadows are reserved for things that genuinely
      // float above the page, which a list item does not.
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: c.surfaceElevated,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.rMd,
          side: BorderSide(color: c.border, width: Strokes.hairline),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: c.border,
        thickness: Strokes.hairline,
        space: Strokes.hairline,
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.brand,
          foregroundColor: c.onBrand,
          disabledBackgroundColor: c.border,
          disabledForegroundColor: c.textTertiary,
          minimumSize: const Size.fromHeight(52),
          textStyle: text.labelLarge,
          shape: const RoundedRectangleBorder(borderRadius: Radii.rMd),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: c.brand,
          textStyle: text.labelLarge,
          minimumSize: const Size(48, 48),
          shape: const RoundedRectangleBorder(borderRadius: Radii.rSm),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.textPrimary,
          minimumSize: const Size.fromHeight(52),
          textStyle: text.labelLarge,
          side: BorderSide(color: c.borderStrong, width: Strokes.hairline),
          shape: const RoundedRectangleBorder(borderRadius: Radii.rMd),
        ),
      ),

      iconTheme: IconThemeData(color: c.textSecondary, size: 22),

      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Space.lg,
          vertical: Space.sm,
        ),
        iconColor: c.textSecondary,
        titleTextStyle: text.titleSmall,
        subtitleTextStyle: text.bodySmall,
        shape: const RoundedRectangleBorder(borderRadius: Radii.rMd),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        // Transparent because AppSheet paints the surface itself: the glass
        // needs to see what is behind it, and an opaque route background
        // would be exactly the thing in the way.
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        modalElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: Radii.sheet),
        showDragHandle: false,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surfaceSunken,
        hintStyle: text.bodyMedium?.copyWith(color: c.textTertiary),
        contentPadding: const EdgeInsets.all(Space.lg),
        border: OutlineInputBorder(
          borderRadius: Radii.rMd,
          borderSide: BorderSide(color: c.border, width: Strokes.hairline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: Radii.rMd,
          borderSide: BorderSide(color: c.border, width: Strokes.hairline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: Radii.rMd,
          borderSide: BorderSide(color: c.brand, width: 1.5),
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: c.textPrimary,
        contentTextStyle: text.bodyMedium?.copyWith(color: c.surface),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: Radii.rMd),
      ),

      // Deliberately NOT overridden any more.
      //
      // This used to pin Android to `FadeForwardsPageTransitionsBuilder`, which
      // reads like a tasteful choice and quietly cost the app predictive back.
      // Flutter's Android default is `PredictiveBackPageTransitionsBuilder`,
      // which renders *the same* fade-forwards animation going forward and adds
      // the back-gesture peek — and FadeForwards is precisely the fallback that
      // builder degrades to where predictive back is unavailable. So the
      // override kept the fallback and threw away the feature, on an app that
      // targets API 36 where the system enables predictive back by default.
      // Inheriting the default is both the fix and the smaller diff.
    );
  }
}
