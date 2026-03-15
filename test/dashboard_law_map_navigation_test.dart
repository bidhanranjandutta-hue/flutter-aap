import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('Dashboard to Law Map navigation test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Perform the login flow (tapping 'Continue with Google').
    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    // Verify that we are on Dashboard Screen
    expect(find.byType(DashboardScreen), findsOneWidget);

    // Ensure the "Law Map" tool card is visible.
    // It's in a scrollable area.
    await tester.scrollUntilVisible(find.text('Law Map'), 100.0);
    expect(find.text('Law Map'), findsOneWidget);

    // Tap on the "Law Map" tool card.
    await tester.tap(find.text('Law Map'));
    await tester.pumpAndSettle();

    // Verify that the LawMapScreen is displayed.
    expect(find.byType(LawMapScreen), findsOneWidget);
    expect(find.text('Law Compatibility Map'), findsOneWidget);
  });
}
