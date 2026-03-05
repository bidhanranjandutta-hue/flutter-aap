import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('CaseSynopsisScreen Performance Benchmark', (WidgetTester tester) async {
    // Warm-up phase
    for (int i = 0; i < 50; i++) {
      await tester.pumpWidget(
        const MaterialApp(
          home: CaseSynopsisScreen(),
        ),
      );
      await tester.pumpAndSettle();
    }

    final stopwatch = Stopwatch()..start();

    // Measurement phase
    for (int i = 0; i < 1000; i++) {
      await tester.pumpWidget(
        const MaterialApp(
          home: CaseSynopsisScreen(),
        ),
      );
      await tester.pumpAndSettle();
    }

    stopwatch.stop();

    debugPrint('CaseSynopsisScreen Build Time (1000 iterations): ${stopwatch.elapsedMilliseconds} ms');

    // Pass the test
    expect(true, isTrue);
  });
}
