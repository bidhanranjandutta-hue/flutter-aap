import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(home: CaseSynopsisScreen());
  }

  group('CaseSynopsisScreen UI Tests', () {
    testWidgets('renders main UI components', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Verify AppBar title
      expect(find.text('Case Synopsis'), findsOneWidget);

      // Verify Upload Section
      expect(find.text('Upload Case File'), findsOneWidget);
      expect(find.text('Tap to scan or upload FIR (PDF, JPG)'), findsOneWidget);
      expect(find.byIcon(Icons.upload_file), findsOneWidget);

      // Verify Smart Summary and TabBar
      expect(find.text('Smart Summary'), findsOneWidget);
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.text('Subject'), findsOneWidget);
      expect(find.text('Situation'), findsOneWidget);
      expect(find.text('Position'), findsOneWidget);

      // Verify Summary Items inside Tab
      expect(find.text('Alleged Offence'), findsOneWidget);
      expect(find.text('Time of Occurrence'), findsOneWidget);
    });

    testWidgets('renders Legal Sections correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Scroll to the bottom to make sure legal sections are visible
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      expect(find.text('Suggested Legal Sections'), findsOneWidget);
      expect(find.text('Section 305'), findsOneWidget);
      expect(find.text('Section 331(4)'), findsOneWidget);
      expect(find.text('Article 21'), findsOneWidget);
    });

    testWidgets('renders Action Buttons correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Upload button
      expect(find.text('Select File'), findsOneWidget);

      // Export Report button (Positioned widget)
      expect(find.text('Export Report'), findsOneWidget);
      expect(find.byIcon(Icons.ios_share), findsOneWidget);

      // Bottom Navigation Bar
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Analysis'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });
  });

  group('CaseSynopsisScreen Navigation Tests', () {
    testWidgets('tapping back button pops route', (WidgetTester tester) async {
      bool isPopped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CaseSynopsisScreen(),
                        ),
                      );
                      isPopped = true;
                    },
                    child: const Text('Push'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to the screen
      await tester.tap(find.text('Push'));
      await tester.pumpAndSettle();

      expect(find.byType(CaseSynopsisScreen), findsOneWidget);

      // Tap the back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.byType(CaseSynopsisScreen), findsNothing);
      expect(isPopped, isTrue);
    });

    testWidgets('tapping home on bottom nav attempts pushNamed to /dashbord', (
      WidgetTester tester,
    ) async {
      String? pushedRoute;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/dashbord': (context) => const Scaffold(body: Text('Dashboard')),
          },
          home: const CaseSynopsisScreen(),
          navigatorObservers: [
            MockNavigatorObserver(
              onPush: (route, previousRoute) {
                if (route is MaterialPageRoute || route is PageRouteBuilder) {
                  pushedRoute = route.settings.name;
                }
              },
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // Tap the Home item (index 0)
      await tester.tap(find.text('Home').last);
      await tester.pumpAndSettle();

      expect(pushedRoute, '/dashbord');
    });
  });
}

class MockNavigatorObserver extends NavigatorObserver {
  final void Function(Route<dynamic> route, Route<dynamic>? previousRoute)?
  onPush;

  MockNavigatorObserver({this.onPush});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (onPush != null) {
      onPush!(route, previousRoute);
    }
    super.didPush(route, previousRoute);
  }
}
