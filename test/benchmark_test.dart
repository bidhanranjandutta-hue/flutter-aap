import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('Benchmark CaseSynopsisScreen rebuilds', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: CaseSynopsisScreen()));

    final stopwatch = Stopwatch()..start();

    for (int i = 0; i < 2000; i++) {
      // Force rebuild by changing the theme
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: i % 2 == 0 ? Colors.blue : Colors.red),
          home: const CaseSynopsisScreen(),
        ),
      );
    }

    stopwatch.stop();
    debugPrint(
      'Baseline rendering time for CaseSynopsisScreen rebuilds: ${stopwatch.elapsedMilliseconds} ms',
    );
  });
}
