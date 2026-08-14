import 'package:flutter/material.dart';

/// Semantic colour for the app, exposed as a [ThemeExtension] so widgets read
/// meaning ("this is critical") rather than a raw swatch.
///
/// The palette is split into two deliberately separate families:
///
///  * **Urgency** is warm (red → amber → slate) and is always rendered as a
///    *solid* fill: the card spine, filled chips.
///  * **Confidence** is cool (teal → blue → violet → neutral) and is always
///    rendered as an *outline* with an icon.
///
/// Hue alone is not enough to keep them apart — a user glancing at an amber
/// badge should not have to work out whether it means "due soon" or "we are
/// unsure". Differing in both hue family and fill treatment makes the two
/// systems unmistakable even at a glance, and keeps working for anyone who
/// cannot separate the hues at all.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.surface,
    required this.surfaceElevated,
    required this.surfaceSunken,
    required this.border,
    required this.borderStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.brand,
    required this.brandPressed,
    required this.brandSubtle,
    required this.onBrand,
    required this.urgencyCritical,
    required this.urgencyImportant,
    required this.urgencyNormal,
    required this.urgencyLow,
    required this.confidenceConfirmed,
    required this.confidenceHigh,
    required this.confidenceReview,
    required this.confidenceMissing,
    required this.danger,
    required this.success,
  });

  // Surfaces. Never pure white or pure black — both read as cheap on OLED and
  // make borders impossible to place.
  final Color surface;
  final Color surfaceElevated;
  final Color surfaceSunken;

  // Hairline separation, used instead of shadows almost everywhere.
  final Color border;
  final Color borderStrong;

  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  // Brand is for identity and the primary action only. It is deliberately not
  // used for state, so a blue element always means "you can act on this".
  final Color brand;
  final Color brandPressed;
  final Color brandSubtle;
  final Color onBrand;

  // Warm family, solid fills.
  final Color urgencyCritical;
  final Color urgencyImportant;
  final Color urgencyNormal;
  final Color urgencyLow;

  // Cool family, outline treatment.
  final Color confidenceConfirmed;
  final Color confidenceHigh;
  final Color confidenceReview;
  final Color confidenceMissing;

  final Color danger;
  final Color success;

  static const light = AppColors(
    surface: Color(0xFFFAFAFB),
    surfaceElevated: Color(0xFFFFFFFF),
    surfaceSunken: Color(0xFFF2F3F6),
    border: Color(0xFFE4E6EC),
    borderStrong: Color(0xFFCFD2DB),
    textPrimary: Color(0xFF12141A),
    textSecondary: Color(0xFF5B6070),
    textTertiary: Color(0xFF8A8FA0),
    brand: Color(0xFF2563EB),
    brandPressed: Color(0xFF1D4FD8),
    brandSubtle: Color(0xFFEFF4FF),
    onBrand: Color(0xFFFFFFFF),
    urgencyCritical: Color(0xFFB42318),
    urgencyImportant: Color(0xFFB54708),
    urgencyNormal: Color(0xFF5B6070),
    urgencyLow: Color(0xFF8A8FA0),
    confidenceConfirmed: Color(0xFF0F766E),
    confidenceHigh: Color(0xFF1D4FD8),
    confidenceReview: Color(0xFF6D28D9),
    confidenceMissing: Color(0xFF8A8FA0),
    danger: Color(0xFFB42318),
    success: Color(0xFF0F766E),
  );

  static const dark = AppColors(
    surface: Color(0xFF0B0D10),
    surfaceElevated: Color(0xFF14171C),
    surfaceSunken: Color(0xFF08090C),
    border: Color(0xFF232830),
    borderStrong: Color(0xFF333944),
    textPrimary: Color(0xFFF2F3F6),
    textSecondary: Color(0xFFA2A8B8),
    textTertiary: Color(0xFF6E7482),
    brand: Color(0xFF6090FA),
    brandPressed: Color(0xFF93B4FD),
    brandSubtle: Color(0xFF16233D),
    onBrand: Color(0xFF0B0D10),
    urgencyCritical: Color(0xFFF97066),
    urgencyImportant: Color(0xFFFDB022),
    urgencyNormal: Color(0xFFA2A8B8),
    urgencyLow: Color(0xFF6E7482),
    confidenceConfirmed: Color(0xFF2DD4BF),
    confidenceHigh: Color(0xFF60A5FA),
    confidenceReview: Color(0xFFA78BFA),
    confidenceMissing: Color(0xFF6E7482),
    danger: Color(0xFFF97066),
    success: Color(0xFF2DD4BF),
  );

  @override
  AppColors copyWith({
    Color? surface,
    Color? surfaceElevated,
    Color? surfaceSunken,
    Color? border,
    Color? borderStrong,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? brand,
    Color? brandPressed,
    Color? brandSubtle,
    Color? onBrand,
    Color? urgencyCritical,
    Color? urgencyImportant,
    Color? urgencyNormal,
    Color? urgencyLow,
    Color? confidenceConfirmed,
    Color? confidenceHigh,
    Color? confidenceReview,
    Color? confidenceMissing,
    Color? danger,
    Color? success,
  }) {
    return AppColors(
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      surfaceSunken: surfaceSunken ?? this.surfaceSunken,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      brand: brand ?? this.brand,
      brandPressed: brandPressed ?? this.brandPressed,
      brandSubtle: brandSubtle ?? this.brandSubtle,
      onBrand: onBrand ?? this.onBrand,
      urgencyCritical: urgencyCritical ?? this.urgencyCritical,
      urgencyImportant: urgencyImportant ?? this.urgencyImportant,
      urgencyNormal: urgencyNormal ?? this.urgencyNormal,
      urgencyLow: urgencyLow ?? this.urgencyLow,
      confidenceConfirmed: confidenceConfirmed ?? this.confidenceConfirmed,
      confidenceHigh: confidenceHigh ?? this.confidenceHigh,
      confidenceReview: confidenceReview ?? this.confidenceReview,
      confidenceMissing: confidenceMissing ?? this.confidenceMissing,
      danger: danger ?? this.danger,
      success: success ?? this.success,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      surface: c(surface, other.surface),
      surfaceElevated: c(surfaceElevated, other.surfaceElevated),
      surfaceSunken: c(surfaceSunken, other.surfaceSunken),
      border: c(border, other.border),
      borderStrong: c(borderStrong, other.borderStrong),
      textPrimary: c(textPrimary, other.textPrimary),
      textSecondary: c(textSecondary, other.textSecondary),
      textTertiary: c(textTertiary, other.textTertiary),
      brand: c(brand, other.brand),
      brandPressed: c(brandPressed, other.brandPressed),
      brandSubtle: c(brandSubtle, other.brandSubtle),
      onBrand: c(onBrand, other.onBrand),
      urgencyCritical: c(urgencyCritical, other.urgencyCritical),
      urgencyImportant: c(urgencyImportant, other.urgencyImportant),
      urgencyNormal: c(urgencyNormal, other.urgencyNormal),
      urgencyLow: c(urgencyLow, other.urgencyLow),
      confidenceConfirmed: c(confidenceConfirmed, other.confidenceConfirmed),
      confidenceHigh: c(confidenceHigh, other.confidenceHigh),
      confidenceReview: c(confidenceReview, other.confidenceReview),
      confidenceMissing: c(confidenceMissing, other.confidenceMissing),
      danger: c(danger, other.danger),
      success: c(success, other.success),
    );
  }
}

/// `context.colors.textSecondary` reads better at call sites than the full
/// `Theme.of(context).extension<AppColors>()!` incantation.
extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
