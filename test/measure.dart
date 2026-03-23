import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/screens/dashboard_screen.dart';

void main() {
  testWidgets('Dashboard performance benchmark', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardScreen(),
      ),
    );

    // We can't really get a true FPS measurement in a widget test,
    // but we can ensure the screen renders.
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
