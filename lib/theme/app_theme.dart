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

  // Extra colors for professional theme
  static const Color dividerLight = Color(0xFFE2E8F0);
  static const Color dividerDark = Color(0xFF334155);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E293B);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: surfaceLight,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textMain,
        error: Colors.redAccent,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundLight,
      cardColor: cardLight,
      dividerColor: dividerLight,
      iconTheme: const IconThemeData(color: textMain),
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceLight,
        foregroundColor: textMain,
        elevation: 0,
        iconTheme: IconThemeData(color: textMain),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceLight,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
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
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surfaceDark,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundDark,
      cardColor: cardDark,
      dividerColor: dividerDark,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceDark,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceDark,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
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
