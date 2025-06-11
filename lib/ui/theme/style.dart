import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF212529);
  static const Color onPrimary = Colors.white;

  static const Color primaryContainer = Color(0xFFf5f6f7);
  static const Color onPrimaryContainer = Color(0xFF212529);

  static const Color secondary = Color(0xFFf4f6f8);
  static const Color onSecondary = Color(0xFF212529);

  static const Color primaryText = Color(0xFF212529);
  static const Color primaryBackground = Colors.white;

  // card dialog background color
  static const Color surface = Colors.white;
  static const Color onSurface = Color(0xFF212529);

  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFDC3545);

  // Gradient colors
  static const Color gradientStart = Colors.white;
  static const Color gradientEnd = Color(0x00FFFFFF); // Transparent white
}

class AppButtonStyles {
  // Default dark button style
  static ButtonStyle defaultStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
    shadowColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(vertical: 16),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  );

  // Light variant
  static ButtonStyle lightStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondary,
    foregroundColor: AppColors.onSecondary,
    shadowColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(vertical: 16),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  );
}

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    error: AppColors.error,
    onError: Colors.white,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: AppColors.primaryText,
      fontSize: 30,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      color: AppColors.primaryText,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: AppColors.primaryText,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: AppColors.primaryText,
      fontSize: 14,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: AppButtonStyles.defaultStyle,
  ),
  scaffoldBackgroundColor: AppColors.primaryBackground,
);
