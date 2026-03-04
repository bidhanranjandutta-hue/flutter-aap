import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('Performance baseline: CaseSynopsisScreen render time', (
    WidgetTester tester,
  ) async {
    final stopwatch = Stopwatch();

    // Pump widget once to initialize
    await tester.pumpWidget(const MaterialApp(home: CaseSynopsisScreen()));
    await tester.pumpAndSettle();

    stopwatch.start();
    // Simulate scrolling or rebuilding the widget multiple times
    for (int i = 0; i < 100; i++) {
      // Force a rebuild by injecting a slightly different state or just calling pump
      await tester.pump();
    }
    stopwatch.stop();

    debugPrint(
      'Baseline Render Time for 100 pumps: ${stopwatch.elapsedMilliseconds} ms',
    );
  });
}
