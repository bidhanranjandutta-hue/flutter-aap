import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/ocr_scanner_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  testWidgets('OCRScannerScreen view mode toggle test', (WidgetTester tester) async {
    // Build OCRScannerScreen
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const OCRScannerScreen(),
      ),
    );

    // Initial state: 'Original Scan' should be selected (primary color)
    // 'Digitized Text' should be unselected (grey color)
    final originalScanText = find.text('Original Scan');
    final digitizedTextText = find.text('Digitized Text');

    expect(originalScanText, findsOneWidget);
    expect(digitizedTextText, findsOneWidget);

    Text originalScanWidget = tester.widget<Text>(originalScanText);
    Text digitizedTextWidget = tester.widget<Text>(digitizedTextText);

    expect(originalScanWidget.style?.color, AppTheme.primary);
    expect(digitizedTextWidget.style?.color, Colors.grey);

    // Tap 'Digitized Text'
    await tester.tap(digitizedTextText);
    await tester.pumpAndSettle();

    // Updated state: 'Digitized Text' should be selected (primary color)
    // 'Original Scan' should be unselected (grey color)
    originalScanWidget = tester.widget<Text>(originalScanText);
    digitizedTextWidget = tester.widget<Text>(digitizedTextText);

    expect(originalScanWidget.style?.color, Colors.grey);
    expect(digitizedTextWidget.style?.color, AppTheme.primary);

    // Tap 'Original Scan' back
    await tester.tap(originalScanText);
    await tester.pumpAndSettle();

    // Verify it toggles back
    originalScanWidget = tester.widget<Text>(originalScanText);
    digitizedTextWidget = tester.widget<Text>(digitizedTextText);

    expect(originalScanWidget.style?.color, AppTheme.primary);
    expect(digitizedTextWidget.style?.color, Colors.grey);
  });
}
