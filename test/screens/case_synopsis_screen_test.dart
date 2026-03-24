import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  Widget createTestWidget({required NavigatorObserver observer}) {
    return MaterialApp(
      home: const CaseSynopsisScreen(),
      navigatorObservers: [observer],
      routes: {
        '/dashbord': (context) => const Scaffold(body: Text('Dashboard')),
      },
    );
  }

  testWidgets('CaseSynopsisScreen renders all main components', (WidgetTester tester) async {
    final mockObserver = _MockNavigatorObserver();
    await tester.pumpWidget(createTestWidget(observer: mockObserver));
    await tester.pumpAndSettle();

    // Verify AppBar
    expect(find.text('Case Synopsis'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.history), findsOneWidget);

    // Verify Upload Section
    expect(find.text('Upload Case File'), findsOneWidget);
    expect(find.text('Select File'), findsOneWidget);
    expect(find.byIcon(Icons.upload_file), findsOneWidget);

    // Verify Smart Summary Section
    expect(find.text('Smart Summary'), findsOneWidget);
    expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
    expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);

    // Verify TabBar
    expect(find.text('Subject'), findsOneWidget);
    expect(find.text('Situation'), findsOneWidget);
    expect(find.text('Position'), findsOneWidget);

    // Scroll to see bottom sections
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -500));
    await tester.pumpAndSettle();

    // Verify Summary Items inside Tabs
    expect(find.text('Alleged Offence'), findsOneWidget);
    expect(find.text('Time of Occurrence'), findsOneWidget);

    // Verify Suggested Legal Sections
    expect(find.text('Suggested Legal Sections'), findsOneWidget);
    expect(find.text('BNS 2023'), findsWidgets);
    expect(find.text('Section 305'), findsOneWidget);
    expect(find.text('Section 331(4)'), findsOneWidget);
    expect(find.text('Constitution'), findsOneWidget);
    expect(find.text('Article 21'), findsOneWidget);

    // Verify Export Report button
    expect(find.text('Export Report'), findsOneWidget);

    // Verify Bottom Navigation Bar
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.description), findsWidgets); // Used in BottomNavBar and maybe elsewhere
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.text('Analysis'), findsOneWidget);
  });

  testWidgets('CaseSynopsisScreen TabBar interaction', (WidgetTester tester) async {
    final mockObserver = _MockNavigatorObserver();
    await tester.pumpWidget(createTestWidget(observer: mockObserver));
    await tester.pumpAndSettle();

    // Initial tab is Subject
    expect(find.text('Subject'), findsOneWidget);

    // Tap on Situation tab
    await tester.ensureVisible(find.text('Situation'));
    await tester.tap(find.text('Situation'));
    await tester.pumpAndSettle();

    // Tap on Position tab
    await tester.ensureVisible(find.text('Position'));
    await tester.tap(find.text('Position'));
    await tester.pumpAndSettle();
  });

  testWidgets('CaseSynopsisScreen back button navigation', (WidgetTester tester) async {
    final mockObserver = _MockNavigatorObserver();
    await tester.pumpWidget(createTestWidget(observer: mockObserver));
    await tester.pumpAndSettle();

    // Tap back button
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Ensure pop was called on the navigator
    expect(mockObserver.poppedRoutes.length, 1);
  });

  testWidgets('CaseSynopsisScreen bottom nav bar navigation to Dashboard', (WidgetTester tester) async {
    final mockObserver = _MockNavigatorObserver();
    await tester.pumpWidget(createTestWidget(observer: mockObserver));
    await tester.pumpAndSettle();

    // Tap the home icon in the bottom nav bar
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    // Ensure dashboard route was pushed
    expect(mockObserver.pushedRoutes.any((route) => route.settings.name == '/dashbord'), true);
    expect(find.text('Dashboard'), findsOneWidget);
  });
}

class _MockNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> pushedRoutes = [];
  final List<Route<dynamic>> poppedRoutes = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushedRoutes.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    poppedRoutes.add(route);
  }
}
