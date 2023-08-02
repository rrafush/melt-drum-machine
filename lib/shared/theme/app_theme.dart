import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melt/shared/theme/app_colors.dart';

ThemeData defineTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: _defineColorScheme(),
    textTheme: GoogleFonts.titilliumWebTextTheme(
      const TextTheme().apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
        decorationColor: AppColors.white,
      ),
    ),
  );
}

ColorScheme _defineColorScheme() => const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.brandPink,
      onPrimary: AppColors.white,
      secondary: AppColors.brandGreen,
      onSecondary: AppColors.brandBeige,
      error: AppColors.red,
      onError: AppColors.white,
      background: AppColors.greyDark2,
      onBackground: AppColors.white,
      surface: AppColors.greyDark1,
      onSurface: AppColors.white,
      errorContainer: AppColors.red,
      tertiary: AppColors.brandYellow,
    );

extension AppColor on ColorScheme {
  Color get brandBlue => AppColors.brandBlue;
  Color get brandDarkBlue => AppColors.brandDarkBlue;
  Color get brandBeige => AppColors.brandBeige;
  Color get brandGreen => AppColors.brandGreen;
  Color get brandOrange => AppColors.brandOrange;
  Color get brandPink => AppColors.brandPink;
  Color get brandYellow => AppColors.brandYellow;
}
