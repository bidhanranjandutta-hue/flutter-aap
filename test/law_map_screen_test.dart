import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('LawMapScreen search field initial text test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LawMapScreen(),
    ));

    // Find the TextField
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Verify that the initial text is empty (was "IPC 302")
    final TextField textField = tester.widget(textFieldFinder);
    expect(textField.controller?.text, "");

    // Verify hint text is still present
    expect(find.text('Search IPC Section (e.g., 302)'), findsOneWidget);
  });
}
