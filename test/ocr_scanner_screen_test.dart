import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/ocr_scanner_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  Widget createTestWidget() {
    return const MaterialApp(
      home: OCRScannerScreen(),
    );
  }

  testWidgets('OCRScannerScreen initial rendering', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Verify AppBar title
    expect(find.text('NyayaAssist OCR'), findsOneWidget);
    expect(find.text('Scan ID #884-FIR'), findsOneWidget);

    // Verify View Toggle options
    expect(find.text('Original Scan'), findsOneWidget);
    expect(find.text('Digitized Text'), findsOneWidget);

    // Verify Status Bar text
    expect(find.text('AI analyzing context...'), findsOneWidget);

    // Verify Action Grid buttons
    expect(find.text('Enhance Text'), findsOneWidget);
    expect(find.text('Translate'), findsOneWidget);
    expect(find.text('Export'), findsOneWidget);

    // Verify BottomNavigationBar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('OCRScannerScreen view mode toggle', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Initially 'Original Scan' should be selected.
    // We can verify this by checking the text color of 'Original Scan' vs 'Digitized Text'
    final originalScanText = tester.widget<Text>(find.text('Original Scan'));
    expect(originalScanText.style?.color, AppTheme.primary);

    final digitizedTextText = tester.widget<Text>(find.text('Digitized Text'));
    expect(digitizedTextText.style?.color, Colors.grey);

    // Tap on 'Digitized Text'
    await tester.tap(find.text('Digitized Text'));
    await tester.pumpAndSettle();

    // Now 'Digitized Text' should be selected.
    final updatedOriginalScanText = tester.widget<Text>(find.text('Original Scan'));
    expect(updatedOriginalScanText.style?.color, Colors.grey);

    final updatedDigitizedTextText = tester.widget<Text>(find.text('Digitized Text'));
    expect(updatedDigitizedTextText.style?.color, AppTheme.primary);
  });
}
