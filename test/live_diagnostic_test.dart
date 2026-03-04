import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyaya_assist/screens/live_diagnostic_screen.dart';

void main() {
  testWidgets('Live Diagnostic Screen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LiveDiagnosticScreen()));

    // Verify UI elements
    expect(find.text('Live Problem Solving'), findsOneWidget);
    expect(find.text('Describe your issue (Any Language):'), findsOneWidget);
    expect(find.text('Screenshot'), findsOneWidget);
    expect(find.text('Record Screen'), findsOneWidget);
    expect(find.text('Submit Diagnostic Report'), findsOneWidget);

    // Test Screenshot toggle
    await tester.tap(find.text('Screenshot'));
    await tester.pump();
    expect(find.text('Screenshot Preview (Markup enabled)'), findsOneWidget);
  });
}
