import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('LawMapScreen search text is retained when switching segments', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LawMapScreen()));
    await tester.pumpAndSettle();

    // Type something in the search field
    await tester.enterText(find.byType(TextField), 'IPC 420');
    await tester.pump();

    expect(find.text('IPC 420'), findsOneWidget);

    // Switch segment
    await tester.tap(find.text('Full Text'));
    await tester.pump();

    // Verify text is still there
    expect(find.text('IPC 420'), findsOneWidget);
  });
}
