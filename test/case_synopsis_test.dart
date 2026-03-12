import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyaya_assist/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('Case Synopsis Screen initial UI test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: CaseSynopsisScreen()));

    // Verify initial UI elements before upload
    expect(find.text('Case Synopsis'), findsOneWidget);
    expect(find.text('Upload Case File'), findsOneWidget);
    expect(find.text('Select File'), findsOneWidget);

    // Summary and Legal sections should not be visible initially
    expect(find.text('Smart Summary'), findsNothing);
    expect(find.text('Suggested Legal Sections'), findsNothing);
  });
}
