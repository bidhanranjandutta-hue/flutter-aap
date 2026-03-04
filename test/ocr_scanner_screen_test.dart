import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/ocr_scanner_screen.dart';

void main() {
  testWidgets('OCR Scanner zoom controls adjust zoom level', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OCRScannerScreen(),
      ),
    );

    // Initial scale should be 1.0 (implicitly via Identity Matrix inside InteractiveViewer)
    final interactiveViewer = tester.widget<InteractiveViewer>(find.byType(InteractiveViewer));
    final initialMatrix = interactiveViewer.transformationController!.value;
    expect(initialMatrix.getMaxScaleOnAxis(), 1.0);

    // Tap zoom in
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    final zoomedInMatrix = interactiveViewer.transformationController!.value;
    expect(zoomedInMatrix.getMaxScaleOnAxis(), 1.5);

    // Tap zoom out
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    final zoomedOutMatrix = interactiveViewer.transformationController!.value;
    expect(zoomedOutMatrix.getMaxScaleOnAxis(), 1.0);
  });
}
