import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/ocr_scanner_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  testWidgets('Benchmark OCRScannerScreen ToggleOption builds', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const Scaffold(body: OCRScannerScreen()),
      ),
    );

    await tester.pumpAndSettle();

    final stopwatch = Stopwatch()..start();

    // Tap the 'Digitized Text' toggle to trigger a setState in _viewMode
    await tester.tap(find.text('Digitized Text'));
    await tester.pumpAndSettle();

    // Tap back to 'Original Scan'
    await tester.tap(find.text('Original Scan'));
    await tester.pumpAndSettle();

    stopwatch.stop();

    debugPrint(
      'Benchmark: Toggling view modes took ${stopwatch.elapsedMilliseconds}ms',
    );

    // As a baseline, without const constructors, the widgets will rebuild entirely
    // We are looking for const effectiveness in the rebuilt widget tree
  });
}
