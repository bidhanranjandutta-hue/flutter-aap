import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('lightTheme has correct configuration', () {
      final ThemeData theme = AppTheme.lightTheme;

      expect(theme.useMaterial3, isTrue);
      expect(theme.colorScheme.brightness, Brightness.light);
      expect(theme.colorScheme.primary, AppTheme.primary);
      expect(theme.colorScheme.secondary, AppTheme.secondary);
      expect(theme.colorScheme.surface, AppTheme.surfaceLight);
      expect(theme.colorScheme.onPrimary, Colors.white);
      expect(theme.colorScheme.onSecondary, Colors.white);
      expect(theme.colorScheme.onSurface, AppTheme.textMain);

      expect(theme.scaffoldBackgroundColor, AppTheme.backgroundLight);

      expect(theme.appBarTheme.backgroundColor, AppTheme.surfaceLight);
      expect(theme.appBarTheme.foregroundColor, AppTheme.textMain);
      expect(theme.appBarTheme.elevation, 0);

      expect(theme.textTheme.displayLarge?.color, AppTheme.textMain);
      expect(theme.textTheme.bodyLarge?.color, AppTheme.textMain);
      expect(theme.textTheme.bodySmall?.color, AppTheme.textMuted);
    });

    test('darkTheme has correct configuration', () {
      final ThemeData theme = AppTheme.darkTheme;

      expect(theme.useMaterial3, isTrue);
      expect(theme.colorScheme.brightness, Brightness.dark);
      expect(theme.colorScheme.primary, AppTheme.primary);
      expect(theme.colorScheme.secondary, AppTheme.secondary);
      expect(theme.colorScheme.surface, AppTheme.surfaceDark);
      expect(theme.colorScheme.onPrimary, Colors.white);
      expect(theme.colorScheme.onSecondary, Colors.white);
      expect(theme.colorScheme.onSurface, Colors.white);

      expect(theme.scaffoldBackgroundColor, AppTheme.backgroundDark);

      expect(theme.appBarTheme.backgroundColor, AppTheme.surfaceDark);
      expect(theme.appBarTheme.foregroundColor, Colors.white);
      expect(theme.appBarTheme.elevation, 0);

      expect(theme.textTheme.displayLarge?.color, Colors.white);
      expect(theme.textTheme.bodyLarge?.color, Colors.white);
      expect(theme.textTheme.bodySmall?.color, Colors.grey);
    });
  });
}
