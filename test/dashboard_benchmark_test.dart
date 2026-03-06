import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen rebuild benchmark', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));

    final element = tester.element(find.byType(DashboardScreen));

    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < 1000; i++) {
      element.markNeedsBuild();
      await tester.pump();
    }
    stopwatch.stop();
    debugPrint('Baseline rebuild time: ${stopwatch.elapsedMilliseconds} ms');
  });
}
