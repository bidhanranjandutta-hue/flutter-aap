import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyaya_assist/screens/law_map_screen.dart';

void main() {
  testWidgets('Law Map Screen offline search test', (
    WidgetTester tester,
  ) async {
    // 1. Test rendering with a known query (IPC 302)
    await tester.pumpWidget(
      const MaterialApp(home: LawMapScreen(initialQuery: 'IPC 302')),
    );

    // Verify it found and rendered BNS 103
    expect(find.text('Section 103'), findsOneWidget);
    expect(
      find.text('AI-generated assistance. Verify with official gazette.'),
      findsOneWidget,
    );

    // 2. Test search update (CrPC 41)
    await tester.enterText(find.byType(TextField), 'CrPC 41');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();

    // Verify it updated to BNSS 35
    expect(find.text('Section 35'), findsOneWidget);

    // 3. Test not found
    await tester.enterText(find.byType(TextField), 'InvalidLaw');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();

    // Verify not found message
    expect(
      find.text('No mapping found. Try "IPC 302" or "CrPC 41".'),
      findsOneWidget,
    );
  });
}
