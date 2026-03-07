import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('CaseSynopsisScreen Theme.of(context) Benchmark', (
    WidgetTester tester,
  ) async {
    // Build the widget tree
    await tester.pumpWidget(const MaterialApp(home: CaseSynopsisScreen()));

    // Warm up
    for (int i = 0; i < 5; i++) {
      await tester.pump();
    }

    final stopwatch = Stopwatch()..start();

    // Pump the widget multiple times to trigger build methods
    for (int i = 0; i < 1000; i++) {
      // Rebuild by triggering a state change or just pumping
      // A simple pump might not trigger a rebuild if nothing changed,
      // so we simulate an action that causes a rebuild, like tapping a tab.
      if (i % 2 == 0) {
        await tester.tap(find.text('Situation').first, warnIfMissed: false);
      } else {
        await tester.tap(find.text('Subject').first, warnIfMissed: false);
      }
      await tester.pump();
    }

    stopwatch.stop();

    debugPrint('Benchmark Time: ${stopwatch.elapsedMilliseconds} ms');
  });
}
