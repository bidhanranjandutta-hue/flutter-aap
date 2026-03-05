import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('LawMapScreen segment button performance benchmark', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LawMapScreen()));

    final stopwatch = Stopwatch()..start();

    // Find all segment buttons by text
    final comparisonFinder = find.text('Comparison');
    final fullTextFinder = find.text('Full Text');
    final caseLawFinder = find.text('Case Law');

    // Simulate rapid tapping to force rebuilds
    for (int i = 0; i < 100; i++) {
      await tester.tap(fullTextFinder);
      await tester.pump();
      await tester.tap(caseLawFinder);
      await tester.pump();
      await tester.tap(comparisonFinder);
      await tester.pump();
    }

    stopwatch.stop();
    debugPrint('Segment button rapid tap (300 taps) time: ${stopwatch.elapsedMilliseconds} ms');
  });
}
