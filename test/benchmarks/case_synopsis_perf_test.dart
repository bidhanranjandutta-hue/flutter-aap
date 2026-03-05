import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  testWidgets('CaseSynopsisScreen Performance Baseline', (
    WidgetTester tester,
  ) async {
    // Wrap with MaterialApp to provide required context
    final widget = MaterialApp(
      theme: AppTheme.lightTheme,
      home: const CaseSynopsisScreen(),
    );

    // Initial render
    await tester.pumpWidget(widget);

    // Warm-up loop to ensure compiled code is hot
    for (var i = 0; i < 50; i++) {
      await tester.pumpWidget(widget);
    }

    // Benchmark loop
    final stopwatch = Stopwatch()..start();
    const int iterations = 1000;

    for (var i = 0; i < iterations; i++) {
      // Simulate rebuilds to measure widget construction overhead
      await tester.pumpWidget(widget);
    }

    stopwatch.stop();
    debugPrint(
      'CaseSynopsisScreen build time for $iterations iterations: ${stopwatch.elapsedMilliseconds} ms',
    );
  });
}
