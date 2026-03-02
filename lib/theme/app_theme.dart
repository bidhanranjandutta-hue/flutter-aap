import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF135BEC);
  static const Color primaryDark = Color(0xFF0B3D91);
  static const Color secondary = Color(0xFFFF9933);
  static const Color backgroundLight = Color(0xFFF6F6F8);
  static const Color backgroundSubtle = Color(0xFFF6F8FB);
  static const Color backgroundDark = Color(0xFF101622);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1A2233);
  static const Color textMain = Color(0xFF0F172A);
  static const Color textMuted = Color(0xFF475569);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: surfaceLight,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textMain,
      ),
      scaffoldBackgroundColor: backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceLight,
        foregroundColor: textMain,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textMain),
        displayMedium: TextStyle(color: textMain),
        displaySmall: TextStyle(color: textMain),
        headlineLarge: TextStyle(color: textMain),
        headlineMedium: TextStyle(color: textMain),
        headlineSmall: TextStyle(color: textMain),
        titleLarge: TextStyle(color: textMain),
        titleMedium: TextStyle(color: textMain),
        titleSmall: TextStyle(color: textMain),
        bodyLarge: TextStyle(color: textMain),
        bodyMedium: TextStyle(color: textMain),
        bodySmall: TextStyle(color: textMuted),
        labelLarge: TextStyle(color: textMain),
        labelMedium: TextStyle(color: textMain),
        labelSmall: TextStyle(color: textMuted),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surfaceDark,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceDark,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        headlineLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.grey),
        labelLarge: TextStyle(color: Colors.white),
        labelMedium: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.grey),
      ),
    );
  }
}
