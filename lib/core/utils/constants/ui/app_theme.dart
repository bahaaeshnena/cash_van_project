import 'package:flutter/material.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';

class AppTheme {
  // LIGHT THEME
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    dividerColor: AppColors.lightDividerText,
    cardColor: AppColors.lightSurface,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondaryColor,
      onSecondary: Colors.white,
      error: AppColors.errorColor,
      onError: Colors.white,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightSubTitleText,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.lightTitleText,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.lightSubTitleText,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightSubTitleText,
      ),
      labelSmall: TextStyle(
        color: AppColors.lightLabelText,
        fontSize: 12,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.lightDividerText),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.lightDividerText),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.4),
      ),
      labelStyle: const TextStyle(
        color: AppColors.lightLabelText,
      ),
      hintStyle: const TextStyle(
        color: AppColors.lightLabelText,
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.lightDividerText,
      thickness: 0.7,
      space: 0.7,
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  // DARK THEME
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    dividerColor: AppColors.darkDividerText,
    cardColor: AppColors.darkSurface,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondaryColor,
      onSecondary: Colors.white,
      error: AppColors.errorColor,
      onError: Colors.white,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkSubTitleText,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.darkTitleText,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkSubTitleText,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkSubTitleText,
      ),
      labelSmall: TextStyle(
        color: AppColors.darkLabelText,
        fontSize: 12,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.darkDividerText),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.darkDividerText),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.4),
      ),
      labelStyle: const TextStyle(
        color: AppColors.darkLabelText,
      ),
      hintStyle: const TextStyle(
        color: AppColors.darkLabelText,
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.darkDividerText,
      thickness: 0.7,
      space: 0.7,
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
