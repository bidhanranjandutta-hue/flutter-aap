import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  testWidgets('DashboardScreen BottomNavigationBar navigation test', (
    WidgetTester tester,
  ) async {
    // Inject mock routes for testing 'Scan' tab navigation
    bool pushedToOcr = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const DashboardScreen(),
        routes: {
          '/ocr': (context) {
            pushedToOcr = true;
            return const Scaffold(body: Text('Mock OCR Screen'));
          },
        },
      ),
    );

    // Initial state: Home tab
    expect(find.text('WELCOME BACK'), findsOneWidget);
    expect(find.text('Inspector Sharma'), findsOneWidget);
    expect(find.text('My Cases Screen'), findsNothing);

    // Tap 'My Cases' tab (index 1)
    await tester.tap(find.text('My Cases'));
    await tester.pumpAndSettle();

    // Verify state changed to 'My Cases'
    expect(find.text('My Cases Screen'), findsOneWidget);
    expect(find.text('WELCOME BACK'), findsNothing);

    // Tap 'Tools' tab (index 3)
    await tester.tap(find.text('Tools'));
    await tester.pumpAndSettle();
    expect(find.text('Tools Screen'), findsOneWidget);

    // Tap 'Profile' tab (index 4)
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Profile Screen'), findsOneWidget);

    // Tap 'Scan' tab (index 2) - Should navigate to '/ocr'
    await tester.tap(find.text('Scan'));
    await tester.pumpAndSettle();

    // Verify navigation was triggered
    expect(pushedToOcr, isTrue);
  });
}
