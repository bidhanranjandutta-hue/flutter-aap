import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('LawMapScreen renders successfully (Smoke Test)', (
    WidgetTester tester,
  ) async {
    // Wrap in MaterialApp to provide required context
    await tester.pumpWidget(const MaterialApp(home: LawMapScreen()));

    // Verify AppBar title exists
    expect(find.text('Law Compatibility Map'), findsOneWidget);

    // Verify Search input is present with default text 'IPC 302'
    expect(find.byType(TextField), findsOneWidget);

    // Verify Segment Buttons are present
    expect(find.text('Comparison'), findsOneWidget);
    expect(find.text('Full Text'), findsOneWidget);
    expect(find.text('Case Law'), findsOneWidget);

    // Verify Old and New Law headers
    expect(find.text('Old Law'), findsOneWidget);
    expect(find.text('New Law'), findsOneWidget);

    // Verify specific IPC to BNS sections
    expect(
      find.text('IPC 302'),
      findsNWidgets(2),
    ); // Once in search, once in old law header
    expect(find.text('BNS 103'), findsOneWidget);

    // Verify BottomNavigationBar is present
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
