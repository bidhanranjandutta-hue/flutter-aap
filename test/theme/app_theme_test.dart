import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  group('AppTheme Tests', () {
    test('darkTheme configures ThemeData correctly', () {
      final ThemeData theme = AppTheme.darkTheme;

      // useMaterial3
      expect(theme.useMaterial3, isTrue);

      // colorScheme
      expect(theme.colorScheme.primary, AppTheme.primary);
      expect(theme.colorScheme.secondary, AppTheme.secondary);
      expect(theme.colorScheme.surface, AppTheme.surfaceDark);
      expect(theme.colorScheme.onPrimary, Colors.white);
      expect(theme.colorScheme.onSecondary, Colors.white);
      expect(theme.colorScheme.onSurface, Colors.white);

      // scaffoldBackgroundColor
      expect(theme.scaffoldBackgroundColor, AppTheme.backgroundDark);

      // appBarTheme
      expect(theme.appBarTheme.backgroundColor, AppTheme.surfaceDark);
      expect(theme.appBarTheme.foregroundColor, Colors.white);
      expect(theme.appBarTheme.elevation, 0);

      // textTheme
      expect(theme.textTheme.displayLarge?.color, Colors.white);
      expect(theme.textTheme.displayMedium?.color, Colors.white);
      expect(theme.textTheme.displaySmall?.color, Colors.white);
      expect(theme.textTheme.headlineLarge?.color, Colors.white);
      expect(theme.textTheme.headlineMedium?.color, Colors.white);
      expect(theme.textTheme.headlineSmall?.color, Colors.white);
      expect(theme.textTheme.titleLarge?.color, Colors.white);
      expect(theme.textTheme.titleMedium?.color, Colors.white);
      expect(theme.textTheme.titleSmall?.color, Colors.white);
      expect(theme.textTheme.bodyLarge?.color, Colors.white);
      expect(theme.textTheme.bodyMedium?.color, Colors.white);
      expect(theme.textTheme.bodySmall?.color, Colors.grey);
      expect(theme.textTheme.labelLarge?.color, Colors.white);
      expect(theme.textTheme.labelMedium?.color, Colors.white);
      expect(theme.textTheme.labelSmall?.color, Colors.grey);
    });
  });
}
