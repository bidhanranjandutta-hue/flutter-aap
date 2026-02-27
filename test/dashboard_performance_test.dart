import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen performance baseline', (
    WidgetTester tester,
  ) async {
    final stopwatch = Stopwatch()..start();

    await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));

    // Simulate multiple rebuilds to measure performance
    for (int i = 0; i < 100; i++) {
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
    }

    stopwatch.stop();
    print('Baseline Performance Time: ${stopwatch.elapsedMilliseconds} ms');
  });
}
