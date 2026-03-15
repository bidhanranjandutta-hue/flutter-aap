import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('CaseSynopsisScreen displays correctly', (
    WidgetTester tester,
  ) async {
    // Wrap the screen in a MaterialApp for testing
    await tester.pumpWidget(const MaterialApp(home: CaseSynopsisScreen()));

    // Verify AppBar title
    expect(find.text('Case Synopsis'), findsOneWidget);

    // Verify Upload Section
    expect(find.text('Upload Case File'), findsOneWidget);
    expect(find.text('Tap to scan or upload FIR (PDF, JPG)'), findsOneWidget);
    expect(find.text('Select File'), findsOneWidget);

    // Verify Smart Summary and Tabs
    expect(find.text('Smart Summary'), findsOneWidget);
    expect(find.text('Subject'), findsOneWidget);
    expect(find.text('Situation'), findsOneWidget);
    expect(find.text('Position'), findsOneWidget);

    // Verify Summary Items
    expect(find.text('Alleged Offence'), findsOneWidget);
    expect(find.text('Time of Occurrence'), findsOneWidget);

    // Verify Suggested Legal Sections
    expect(find.text('Suggested Legal Sections'), findsOneWidget);
    expect(find.text('BNS 2023'), findsWidgets);
    expect(find.text('Section 305'), findsOneWidget);
    expect(find.text('Section 331(4)'), findsOneWidget);
    expect(find.text('Article 21'), findsOneWidget);

    // Verify Export Report button
    expect(find.text('Export Report'), findsOneWidget);

    // Verify BottomNavigationBar
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Analysis'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('CaseSynopsisScreen tabs interactions work', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: CaseSynopsisScreen()));

    // Wait for the initial render and animations to settle
    await tester.pumpAndSettle();

    // Verify initial tab is Subject
    final subjectTab = find.text('Subject');
    expect(subjectTab, findsOneWidget);

    final situationTab = find.text('Situation');
    expect(situationTab, findsOneWidget);

    final positionTab = find.text('Position');
    expect(positionTab, findsOneWidget);

    // Tap on the Situation tab
    await tester.ensureVisible(situationTab);
    await tester.tap(situationTab, warnIfMissed: false);
    await tester.pumpAndSettle();

    // Tap on the Position tab
    await tester.ensureVisible(positionTab);
    await tester.tap(positionTab, warnIfMissed: false);
    await tester.pumpAndSettle();
  });

  testWidgets('CaseSynopsisScreen navigation back button pops route', (
    WidgetTester tester,
  ) async {
    bool didPop = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Navigator(
          onDidRemovePage: (route) {
            didPop = true;
          },
          pages: const [
            MaterialPage(child: Text('Previous Page')),
            MaterialPage(child: CaseSynopsisScreen()),
          ],
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Find the back button and tap it
    final backButton = find.byIcon(Icons.arrow_back);
    expect(backButton, findsOneWidget);

    await tester.tap(backButton);
    await tester.pumpAndSettle();

    expect(didPop, isTrue);
  });

  testWidgets(
    'CaseSynopsisScreen BottomNavigationBar navigation pushes /dashbord',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/dashbord': (context) =>
                const Scaffold(body: Text('Dashboard Mock')),
          },
          home: const CaseSynopsisScreen(),
        ),
      );

      // Find the Home icon in BottomNavigationBar
      final homeIcon = find.byIcon(Icons.home);
      expect(homeIcon, findsOneWidget);

      // Tap Home icon
      await tester.tap(homeIcon);
      await tester.pumpAndSettle();

      // Verify we navigated to the mock dashboard
      expect(find.text('Dashboard Mock'), findsOneWidget);
    },
  );
}
