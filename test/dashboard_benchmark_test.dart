import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen microbenchmark', (WidgetTester tester) async {
    final stopwatch = Stopwatch()..start();

    // Pump the widget multiple times to simulate rebuilds
    for (int i = 0; i < 1000; i++) {
      await tester.pumpWidget(
        MaterialApp(
          home: const DashboardScreen(),
        ),
      );
    }

    stopwatch.stop();
    print('DashboardScreen 1000 rebuilds took: ${stopwatch.elapsedMilliseconds} ms');
  });
}
