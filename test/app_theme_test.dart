import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  group('AppTheme Tests', () {
    test('lightTheme has correct properties', () {
      final ThemeData lightTheme = AppTheme.lightTheme;

      // Verify basic properties
      expect(lightTheme.useMaterial3, isTrue);
      expect(lightTheme.scaffoldBackgroundColor, AppTheme.backgroundLight);

      // Verify ColorScheme
      expect(lightTheme.colorScheme.primary, AppTheme.primary);
      expect(lightTheme.colorScheme.secondary, AppTheme.secondary);
      expect(lightTheme.colorScheme.surface, AppTheme.surfaceLight);
      expect(lightTheme.colorScheme.onPrimary, Colors.white);
      expect(lightTheme.colorScheme.onSecondary, Colors.white);
      expect(lightTheme.colorScheme.onSurface, AppTheme.textMain);
      expect(lightTheme.colorScheme.brightness, Brightness.light);

      // Verify AppBarTheme
      expect(lightTheme.appBarTheme.backgroundColor, AppTheme.surfaceLight);
      expect(lightTheme.appBarTheme.foregroundColor, AppTheme.textMain);
      expect(lightTheme.appBarTheme.elevation, 0);

      // Verify TextTheme
      expect(lightTheme.textTheme.bodyLarge?.color, AppTheme.textMain);
      expect(lightTheme.textTheme.bodyMedium?.color, AppTheme.textMain);
      expect(lightTheme.textTheme.bodySmall?.color, AppTheme.textMuted);
    });

    test('darkTheme has correct properties', () {
      final ThemeData darkTheme = AppTheme.darkTheme;

      // Verify basic properties
      expect(darkTheme.useMaterial3, isTrue);
      expect(darkTheme.scaffoldBackgroundColor, AppTheme.backgroundDark);

      // Verify ColorScheme
      expect(darkTheme.colorScheme.primary, AppTheme.primary);
      expect(darkTheme.colorScheme.secondary, AppTheme.secondary);
      expect(darkTheme.colorScheme.surface, AppTheme.surfaceDark);
      expect(darkTheme.colorScheme.onPrimary, Colors.white);
      expect(darkTheme.colorScheme.onSecondary, Colors.white);
      expect(darkTheme.colorScheme.onSurface, Colors.white);
      expect(darkTheme.colorScheme.brightness, Brightness.dark);

      // Verify AppBarTheme
      expect(darkTheme.appBarTheme.backgroundColor, AppTheme.surfaceDark);
      expect(darkTheme.appBarTheme.foregroundColor, Colors.white);
      expect(darkTheme.appBarTheme.elevation, 0);

      // Verify TextTheme
      expect(darkTheme.textTheme.bodyLarge?.color, Colors.white);
      expect(darkTheme.textTheme.bodyMedium?.color, Colors.white);
      expect(darkTheme.textTheme.bodySmall?.color, Colors.grey);
    });
  });
}
