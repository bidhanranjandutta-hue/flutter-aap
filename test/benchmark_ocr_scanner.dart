import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/ocr_scanner_screen.dart';

void main() {
  testWidgets('Benchmark OCR Scanner screen build', (WidgetTester tester) async {
    final stopwatch = Stopwatch()..start();

    // Build the screen
    await tester.pumpWidget(
      const MaterialApp(
        home: OCRScannerScreen(),
      ),
    );

    // Simulate toggling the view multiple times
    for (int i = 0; i < 500; i++) {
      await tester.tap(find.text('Digitized Text'));
      await tester.pump();
      await tester.tap(find.text('Original Scan'));
      await tester.pump();
    }

    stopwatch.stop();
    debugPrint('Time taken for 500 toggles: ${stopwatch.elapsedMilliseconds} ms');
  });
}
