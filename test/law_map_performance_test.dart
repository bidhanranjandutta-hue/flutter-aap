import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  testWidgets('LawMapScreen rebuild performance baseline', (
    WidgetTester tester,
  ) async {
    // Wrap in MaterialApp and Theme to provide necessary context
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.lightTheme, home: const LawMapScreen()),
    );

    // Initial pump to render the screen
    await tester.pumpAndSettle();

    // Verify the segments are present
    expect(find.text('Comparison'), findsOneWidget);
    expect(find.text('Full Text'), findsOneWidget);

    final comparisonButton = find.text('Comparison');
    final fullTextButton = find.text('Full Text');

    // Warm-up to ensure compilation overhead is minimized
    for (int i = 0; i < 5; i++) {
      await tester.tap(fullTextButton);
      await tester.pump();
      await tester.tap(comparisonButton);
      await tester.pump();
    }

    final stopwatch = Stopwatch()..start();

    // Perform multiple rebuilds by toggling the selected segment
    const int iterations = 100;
    for (int i = 0; i < iterations; i++) {
      // Tap 'Full Text' to trigger rebuild
      await tester.tap(fullTextButton);
      await tester.pump();

      // Tap 'Comparison' to trigger rebuild
      await tester.tap(comparisonButton);
      await tester.pump();
    }

    stopwatch.stop();

    debugPrint(
      'Performance Test: ${iterations * 2} rebuilds took ${stopwatch.elapsedMilliseconds}ms',
    );
    debugPrint(
      'Average rebuild time: ${stopwatch.elapsedMilliseconds / (iterations * 2)}ms',
    );
  });
}
