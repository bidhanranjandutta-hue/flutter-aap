import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  testWidgets('WelcomeScreen build benchmark', (WidgetTester tester) async {
    final stopwatch = Stopwatch()..start();

    for (var i = 0; i < 1000; i++) {
      await tester.pumpWidget(
        MaterialApp(theme: AppTheme.lightTheme, home: const WelcomeScreen()),
      );
    }

    stopwatch.stop();
    debugPrint(
      'WelcomeScreen 1000 builds took: ${stopwatch.elapsedMilliseconds}ms',
    );
  });
}
