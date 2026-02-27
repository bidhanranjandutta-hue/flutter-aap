import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('Dashboard to Case Synopsis navigation test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Tap the 'Continue with Google' button.
    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    // Verify that we are on Dashboard Screen
    expect(find.byType(DashboardScreen), findsOneWidget);

    // Tap the 'Case Synopsis' card.
    await tester.tap(find.text('Case Synopsis'));
    await tester.pumpAndSettle();

    // Verify Case Synopsis Screen
    expect(find.byType(CaseSynopsisScreen), findsOneWidget);
    expect(find.text('Smart Summary'), findsOneWidget);
  });
}
