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

    expect(find.text('Case Synopsis'), findsOneWidget);
    expect(find.text('Upload Case File'), findsOneWidget);
    expect(find.text('Smart Summary'), findsOneWidget);
    expect(find.text('Suggested Legal Sections'), findsOneWidget);
    expect(find.text('BNS 2023'), findsAtLeastNWidgets(1));
  });
}
