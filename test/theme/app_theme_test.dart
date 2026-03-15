import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('static colors should have correct values', () {
      expect(AppTheme.primary, const Color(0xFF135BEC));
      expect(AppTheme.primaryDark, const Color(0xFF0B3D91));
      expect(AppTheme.secondary, const Color(0xFFFF9933));
      expect(AppTheme.backgroundLight, const Color(0xFFF6F6F8));
      expect(AppTheme.backgroundSubtle, const Color(0xFFF6F8FB));
      expect(AppTheme.backgroundDark, const Color(0xFF101622));
      expect(AppTheme.surfaceLight, const Color(0xFFFFFFFF));
      expect(AppTheme.surfaceDark, const Color(0xFF1A2233));
      expect(AppTheme.textMain, const Color(0xFF0F172A));
      expect(AppTheme.textMuted, const Color(0xFF475569));
    });

    test('lightTheme should be configured correctly', () {
      final lightTheme = AppTheme.lightTheme;

      expect(lightTheme.useMaterial3, isTrue);
      expect(lightTheme.colorScheme.brightness, Brightness.light);
      expect(lightTheme.colorScheme.primary, AppTheme.primary);
      expect(lightTheme.colorScheme.secondary, AppTheme.secondary);
      expect(lightTheme.colorScheme.surface, AppTheme.surfaceLight);
      expect(lightTheme.scaffoldBackgroundColor, AppTheme.backgroundLight);
      expect(lightTheme.appBarTheme.backgroundColor, AppTheme.surfaceLight);
      expect(lightTheme.appBarTheme.foregroundColor, AppTheme.textMain);
      expect(lightTheme.appBarTheme.elevation, 0);

      // Verify a few TextTheme properties
      expect(lightTheme.textTheme.bodyLarge?.color, AppTheme.textMain);
      expect(lightTheme.textTheme.bodySmall?.color, AppTheme.textMuted);
    });

    test('darkTheme should be configured correctly', () {
      final darkTheme = AppTheme.darkTheme;

      expect(darkTheme.useMaterial3, isTrue);
      expect(darkTheme.colorScheme.brightness, Brightness.dark);
      expect(darkTheme.colorScheme.primary, AppTheme.primary);
      expect(darkTheme.colorScheme.secondary, AppTheme.secondary);
      expect(darkTheme.colorScheme.surface, AppTheme.surfaceDark);
      expect(darkTheme.scaffoldBackgroundColor, AppTheme.backgroundDark);
      expect(darkTheme.appBarTheme.backgroundColor, AppTheme.surfaceDark);
      expect(darkTheme.appBarTheme.foregroundColor, Colors.white);
      expect(darkTheme.appBarTheme.elevation, 0);

      // Verify a few TextTheme properties
      expect(darkTheme.textTheme.bodyLarge?.color, Colors.white);
      expect(darkTheme.textTheme.bodySmall?.color, Colors.grey);
    });
  });
}
