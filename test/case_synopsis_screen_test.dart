import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  testWidgets('CaseSynopsisScreen renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.lightTheme, home: const CaseSynopsisScreen()),
    );

    // Verify app bar title
    expect(find.text('Case Synopsis'), findsOneWidget);

    // Verify static content
    expect(find.text('Alleged Offence'), findsOneWidget);
    expect(find.text('Time of Occurrence'), findsOneWidget);

    // Verify that TabBar tabs are NOT present
    expect(find.text('Subject'), findsNothing);
    expect(find.text('Situation'), findsNothing);
    expect(find.text('Position'), findsNothing);
  });
}
