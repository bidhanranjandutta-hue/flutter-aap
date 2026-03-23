import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyaya_assist/main.dart';
import 'package:nyaya_assist/screens/welcome_screen.dart';
import 'package:nyaya_assist/screens/dashboard_screen.dart';

void main() {
  testWidgets('App navigation flow test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that we start on Welcome Screen
    expect(find.byType(WelcomeScreen), findsOneWidget);
    expect(find.text('NyayaAssist'), findsOneWidget);

    // Tap the 'Continue with Google' button.
    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    // Verify that we are on Dashboard Screen
    expect(find.byType(DashboardScreen), findsOneWidget);
    expect(find.text('Inspector Sharma'), findsOneWidget);

    // Tap on OCR Scanner - The text is wrapped in multiple widgets, might be hard to find by exact text alone if rich text
    // The text is 'OCR Evidence Scanner' in a Text widget.
    // However, it is inside an InkWell inside a Container.
    // Let's scroll to it first to be safe, though likely visible.
    await tester.ensureVisible(find.text('OCR Evidence Scanner'));
    await tester.tap(find.text('OCR Evidence Scanner'));
    await tester.pumpAndSettle();

    // Verify OCR Screen
    expect(find.text('NyayaAssist OCR'), findsOneWidget);

    // Go back
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();

    // Verify Dashboard again
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
