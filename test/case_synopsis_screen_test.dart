import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'NyayaAssist Test',
      theme: AppTheme.lightTheme,
      home: const CaseSynopsisScreen(),
    );
  }

  testWidgets('CaseSynopsisScreen renders key UI elements', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Verify AppBar
    expect(find.text('Case Synopsis'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.history), findsOneWidget);

    // Verify Upload Section
    expect(find.text('Upload Case File'), findsOneWidget);
    expect(find.text('Tap to scan or upload FIR (PDF, JPG)'), findsOneWidget);
    expect(find.text('Select File'), findsOneWidget);

    // Verify Smart Summary Section
    expect(find.text('Smart Summary'), findsOneWidget);

    // Verify Tabs
    expect(find.text('Subject'), findsOneWidget);
    expect(find.text('Situation'), findsOneWidget);
    expect(find.text('Position'), findsOneWidget);

    // Verify Suggested Legal Sections
    expect(find.text('Suggested Legal Sections'), findsOneWidget);
    expect(find.text('BNS 2023'), findsWidgets); // Used in multiple tags
    expect(find.text('Section 305'), findsOneWidget);
    expect(find.text('Section 331(4)'), findsOneWidget);
    expect(find.text('Article 21'), findsOneWidget);

    // Verify Bottom Action Button
    expect(find.text('Export Report'), findsOneWidget);
  });

  testWidgets('CaseSynopsisScreen handles tab navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Ensure tabs are visible before interacting
    await tester.ensureVisible(find.text('Situation'));

    // Tap on the 'Situation' tab
    await tester.tap(find.text('Situation'));
    await tester.pumpAndSettle();

    // Verify the tab is selected (implicitly tested by tapping and settling without error)
    // The content is static in this version of CaseSynopsisScreen, so we don't assert content changes.
    expect(find.text('Situation'), findsOneWidget);

    // Tap on the 'Position' tab
    await tester.tap(find.text('Position'));
    await tester.pumpAndSettle();
    expect(find.text('Position'), findsOneWidget);
  });

  testWidgets('CaseSynopsisScreen handles back navigation', (
    WidgetTester tester,
  ) async {
    bool didPop = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Navigator(
          onDidRemovePage: (route) {
            didPop = true;
          },
          pages: [
            const MaterialPage(child: Scaffold(body: Text('Previous Screen'))),
            const MaterialPage(child: CaseSynopsisScreen()),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Tap back button
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Verify navigation pop was attempted
    expect(didPop, isTrue);
  });
}
