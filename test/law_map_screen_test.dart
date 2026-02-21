import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('Law Map Screen retains search text on segment change', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: LawMapScreen()));

    // Verify initial state
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Check initial text in the TextField
    TextField textField = tester.widget<TextField>(textFieldFinder);
    expect(textField.controller?.text, "IPC 302");

    // Enter some new text
    await tester.enterText(textFieldFinder, "BNS 103");
    await tester.pump();

    // Re-acquire the widget to check controller text
    textField = tester.widget<TextField>(textFieldFinder);
    expect(textField.controller?.text, "BNS 103");

    // Tap a segment button "Full Text" to trigger setState and rebuild
    await tester.tap(find.text("Full Text"));
    await tester.pump();

    // Re-acquire the widget
    textField = tester.widget<TextField>(textFieldFinder);

    // This assertion will fail if the controller was reset to "IPC 302"
    expect(textField.controller?.text, "BNS 103", reason: "Search text reset after rebuild!");
  });
}
