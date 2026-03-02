import 'package:flutter/material.dart';

class AppTheme {
  // Navy Blue & White Theme per UX directives
  static const Color primary = Color(0xFF003366); // Navy Blue
  static const Color primaryDark = Color(0xFF001A33);
  static const Color secondary = Color(0xFFFF9933); // Accent
  static const Color backgroundLight = Color(0xFFFFFFFF); // White
  static const Color surfaceLight = Color(
    0xFFF8F9FA,
  ); // Very light grey for cards
  static const Color textMain = Color(
    0xFF1A1A1A,
  ); // Almost black for high contrast
  static const Color textMuted = Color(0xFF5A5A5A);

  // Define a base text theme ensuring minimum 16sp (logical pixels) for readability
  static const TextTheme _baseTextTheme = TextTheme(
    displayLarge: TextStyle(
      color: textMain,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: textMain,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: textMain,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: textMain,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: textMain,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      color: textMain,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: textMain,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: textMain,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: textMain,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    // Core body text MUST be at least 16sp
    bodyLarge: TextStyle(color: textMain, fontSize: 18),
    bodyMedium: TextStyle(color: textMain, fontSize: 16),
    bodySmall: TextStyle(color: textMuted, fontSize: 16),
    labelLarge: TextStyle(
      color: textMain,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: textMain,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      color: textMuted,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );

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
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(
            64,
            48,
          ), // Large, touch-friendly touch targets
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      textTheme: _baseTextTheme,
    );
  }

  static ThemeData get darkTheme {
    // Basic dark theme fallback for UX completeness
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: Color(0xFF121212),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
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
