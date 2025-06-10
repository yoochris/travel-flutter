import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primaryText = Color(0xFF212529);
  static const Color primaryBackground = Colors.white;

  // Secondary colors
  static const Color secondaryText = Colors.white;
  static const Color secondaryBackground = Color(0xFF212529);

  // Accent colors
  static const Color accent = Color(0xFF212529);
  static const Color accentLight = Color(0xFF6C757D);

  // Status colors
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
    backgroundColor: AppColors.secondaryBackground,
    foregroundColor: Colors.white,
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
    backgroundColor: Color(0xFFF5F6F7),
    foregroundColor: AppColors.secondaryBackground,
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

  // Accent variant
  static ButtonStyle accentStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accent,
    foregroundColor: Colors.white,
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
    primary: AppColors.accent,
    onPrimary: Colors.white,
    secondary: AppColors.accentLight,
    onSecondary: Colors.white,
    error: AppColors.error,
    onError: Colors.white,
    surface: AppColors.primaryBackground,
    onSurface: AppColors.primaryText,
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
