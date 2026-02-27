import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('LawMapScreen text field retains value on rebuild', (WidgetTester tester) async {
    // Build the LawMapScreen
    await tester.pumpWidget(const MaterialApp(home: LawMapScreen()));

    // Verify initial text is "IPC 302" in the TextField
    // There are multiple "IPC 302" texts (one in header, one in TextField).
    // We find the TextField and check its controller's text or find the text inside it.
    final textFieldFinder = find.widgetWithText(TextField, 'IPC 302');
    expect(textFieldFinder, findsOneWidget);

    // Enter new text "IPC 307"
    await tester.enterText(textFieldFinder, 'IPC 307');
    await tester.pump();

    // Verify text is updated
    expect(find.widgetWithText(TextField, 'IPC 307'), findsOneWidget);

    // Tap a segment button to trigger a rebuild (setState is called in _buildSegmentButton)
    // The segment buttons are "Comparison", "Full Text", "Case Law".
    // Let's tap "Full Text" (index 1).
    await tester.tap(find.text('Full Text'));
    await tester.pump();

    // Verify that the text field still contains "IPC 307"
    // If the controller is recreated in build(), it will reset to "IPC 302".
    expect(find.widgetWithText(TextField, 'IPC 307'), findsOneWidget);

    // Ensure "IPC 302" is NOT in the text field (it might still be in the header, which is static)
    // But we specifically check the TextField.
    expect(find.widgetWithText(TextField, 'IPC 302'), findsNothing);
  });
}
