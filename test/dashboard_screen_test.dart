import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen Search Bar Presence', (WidgetTester tester) async {
    // Build DashboardScreen inside a MaterialApp to provide necessary context
    await tester.pumpWidget(const MaterialApp(
      home: DashboardScreen(),
    ));

    // Wait for the UI to settle
    await tester.pumpAndSettle();

    // Verify Search Bar is present
    expect(find.byType(TextField), findsOneWidget);

    // Verify hint text is correct
    expect(find.text('Search FIRs, statutes, or people...'), findsOneWidget);

    // Verify icons are present
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.mic), findsOneWidget);
  });
}
