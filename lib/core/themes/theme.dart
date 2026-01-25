import 'package:flutter/material.dart';
import 'package:talk2me/core/themes/colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.lightBackground,
        onSurface: AppColors.lightText,
      ),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.lightText),
        titleMedium: TextStyle(color: AppColors.lightText),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.lightText,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.darkBackground,
        onSurface: AppColors.darkText,
      ),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.darkText),
        titleMedium: TextStyle(color: AppColors.darkText),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.darkText,
      ),
    );
  }
}