import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('CaseSynopsisScreen UI elements test', (
    WidgetTester tester,
  ) async {
    // Build the widget in a MaterialApp
    await tester.pumpWidget(
      MaterialApp(
        home: const CaseSynopsisScreen(),
        routes: {
          '/dashbord': (context) =>
              const Scaffold(body: Text('Dashboard Mock')),
        },
      ),
    );

    // Verify AppBar
    expect(find.text('Case Synopsis'), findsOneWidget);

    // Verify Upload Section
    expect(find.text('Upload Case File'), findsOneWidget);
    expect(find.text('Tap to scan or upload FIR (PDF, JPG)'), findsOneWidget);
    expect(find.text('Select File'), findsOneWidget);
    expect(find.byIcon(Icons.upload_file), findsOneWidget);

    // Verify Smart Summary Section
    expect(find.text('Smart Summary'), findsOneWidget);
    expect(find.byIcon(Icons.psychology), findsOneWidget);

    // Verify TabBar
    expect(find.text('Subject'), findsOneWidget);
    expect(find.text('Situation'), findsOneWidget);
    expect(find.text('Position'), findsOneWidget);

    // Verify Content inside Tab
    expect(find.text('Alleged Offence'), findsOneWidget);
    expect(find.text('Time of Occurrence'), findsOneWidget);

    // Verify Suggested Legal Sections
    expect(find.text('Suggested Legal Sections'), findsOneWidget);
    expect(find.text('BNS 2023'), findsWidgets);
    expect(find.text('Section 305'), findsOneWidget);
    expect(find.text('Section 331(4)'), findsOneWidget);
    expect(find.text('Constitution'), findsOneWidget);

    // Verify Export Button
    expect(find.text('Export Report'), findsOneWidget);
    expect(find.byIcon(Icons.ios_share), findsOneWidget);

    // Verify BottomNavigationBar
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Analysis'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('CaseSynopsisScreen Tab interaction test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const CaseSynopsisScreen(),
        routes: {
          '/dashbord': (context) =>
              const Scaffold(body: Text('Dashboard Mock')),
        },
      ),
    );

    // Ensure the Situation tab is visible before tapping
    await tester.ensureVisible(find.text('Situation'));
    // Tap on Situation tab
    await tester.tap(find.text('Situation'), warnIfMissed: false);
    await tester.pumpAndSettle(); // Wait for animation

    // Ensure the Position tab is visible before tapping
    await tester.ensureVisible(find.text('Position'));
    // Tap on Position tab
    await tester.tap(find.text('Position'), warnIfMissed: false);
    await tester.pumpAndSettle();

    // Verify we didn't crash and are still on the screen
    expect(find.text('Case Synopsis'), findsOneWidget);
  });

  testWidgets('CaseSynopsisScreen Navigation test', (
    WidgetTester tester,
  ) async {
    bool didPop = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Navigator(
          onDidRemovePage: (page) {
            didPop = true;
          },
          pages: const [
            MaterialPage(child: Scaffold(body: Text('Previous Screen'))),
            MaterialPage(child: CaseSynopsisScreen()),
          ],
        ),
        routes: {
          '/dashbord': (context) =>
              const Scaffold(body: Text('Dashboard Mock')),
        },
      ),
    );

    // Wait for everything to settle
    await tester.pumpAndSettle();

    // Tap the back button
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Verify back navigation occurred
    expect(didPop, isTrue);
  });

  testWidgets('CaseSynopsisScreen Bottom Navigation Bar to Dashboard test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: '/synopsis',
        routes: {
          '/synopsis': (context) => const CaseSynopsisScreen(),
          '/dashbord': (context) =>
              const Scaffold(body: Text('Dashboard Mock')),
        },
      ),
    );

    // Tap on Home tab in BottomNavigationBar
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    // Verify we navigated to Dashboard Mock
    expect(find.text('Dashboard Mock'), findsOneWidget);
  });
}
