import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/ocr_scanner_screen.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  testWidgets('Navigation stack growth test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'NyayaAssist',
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/dashbord': (context) => const DashboardScreen(),
          '/law_map': (context) => const LawMapScreen(),
          '/ocr': (context) => const OCRScannerScreen(),
          '/synopsis': (context) => const CaseSynopsisScreen(),
        },
      ),
    );

    // 1. Welcome -> Dashboard
    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    // Check we are on Dashboard
    expect(find.byType(DashboardScreen), findsOneWidget);

    // 2. Dashboard -> OCR
    // Find OCR card by text to be precise
    await tester.tap(find.text('OCR Evidence Scanner'));
    await tester.pumpAndSettle();

    // Check we are on OCR
    expect(find.byType(OCRScannerScreen), findsOneWidget);

    // 3. OCR -> Dashboard (via Home)
    // Find Home icon within OCR screen's bottom nav
    final ocrScreenFinder = find.byType(OCRScannerScreen);
    final homeIconFinder = find.descendant(
      of: ocrScreenFinder,
      matching: find.byIcon(Icons.home),
    );
    await tester.tap(homeIconFinder);
    await tester.pumpAndSettle();

    // Verify number of DashboardScreens found
    final dashboardCount = tester.widgetList(find.byType(DashboardScreen, skipOffstage: false)).length;

    // Also verify we are actually ON the Dashboard (top route)
    // We can check if OCR is NOT the top route.
    // But testing top route is hard without navigator key.
    // However, if we pushed Dashboard, we expect to see Dashboard text.
    expect(find.text('Inspector Sharma'), findsOneWidget); // Found in Dashboard
    // But this text is also in the underlying Dashboard.

    // We expect 1 if the bug is fixed.
    expect(dashboardCount, 1, reason: "Expected 1 Dashboard after fix");
  });
}
