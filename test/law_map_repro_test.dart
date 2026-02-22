import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('Law Map Screen retains search text on segment change', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LawMapScreen()));

    // Verify initial state
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Check initial text
    final initialTextField = tester.widget<TextField>(textFieldFinder);
    expect(initialTextField.controller!.text, "IPC 302");

    // Enter some text
    // "BNS 103" is already present in the UI as a Text widget (in the header),
    // so we use a unique string to avoid ambiguity.
    const uniqueSearchTerm = "SECTION 420";
    await tester.enterText(textFieldFinder, uniqueSearchTerm);
    await tester.pumpAndSettle();

    // Verify text was entered in the text field
    expect(find.widgetWithText(TextField, uniqueSearchTerm), findsOneWidget);

    // Tap a segment button to trigger rebuild (e.g. "Full Text")
    await tester.tap(find.text("Full Text"));
    await tester.pumpAndSettle();

    // Verify text is still there
    final updatedTextField = tester.widget<TextField>(textFieldFinder);

    // Ensure search text persists after segment change (regression test for state reset bug)
    expect(updatedTextField.controller!.text, uniqueSearchTerm, reason: "Search text should persist after segment change");
  });
}
