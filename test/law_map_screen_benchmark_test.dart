import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('LawMapScreen performance baseline', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LawMapScreen()));
    await tester.pumpAndSettle();

    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < 50; i++) {
      await tester.tap(find.text('Full Text'));
      await tester.pump();
      await tester.tap(find.text('Comparison'));
      await tester.pump();
    }
    stopwatch.stop();
    debugPrint('Elapsed time: ${stopwatch.elapsedMilliseconds}ms');
  });
}
