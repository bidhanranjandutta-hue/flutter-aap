import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';

void main() {
  group('WelcomeScreen Tests', () {
    testWidgets(
      'Smoke test: WelcomeScreen renders correctly with key elements',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));

        // Verify basic widget rendering
        expect(find.byType(WelcomeScreen), findsOneWidget);

        // Verify key text elements are present
        expect(find.text('NyayaAssist'), findsOneWidget);
        expect(find.text('EMPOWERING INDIAN POLICE'), findsOneWidget);
        expect(find.text('Modern Policing, Simplified.'), findsOneWidget);
        expect(find.text('Instant Case Analysis'), findsOneWidget);
        expect(find.text('Smart OCR Tools'), findsOneWidget);
        expect(find.text('New Law Mapping'), findsOneWidget);

        // Verify the Continue with Google button is present
        expect(find.text('Continue with Google'), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);

        // Verify icons are present (using exact type matching if needed)
        expect(find.byIcon(Icons.analytics), findsOneWidget);
        expect(find.byIcon(Icons.document_scanner), findsOneWidget);
        expect(find.byIcon(Icons.gavel), findsOneWidget);
        expect(find.byIcon(Icons.lock), findsOneWidget);
        expect(find.byIcon(Icons.g_mobiledata), findsOneWidget);
      },
    );

    testWidgets('Navigation: Tapping Continue with Google routes to /dashbord', (
      WidgetTester tester,
    ) async {
      bool pushedRoute = false;
      String? routeName;

      await tester.pumpWidget(
        MaterialApp(
          // Define the routes so the app knows how to handle the push operation.
          routes: {
            '/': (context) => const WelcomeScreen(),
            '/dashbord': (context) =>
                const Scaffold(body: Text('Dashboard Mock')),
          },
          initialRoute: '/',
          navigatorObservers: [
            _MockNavigatorObserver(
              onPush: (route, previousRoute) {
                if (route.settings.name == '/dashbord') {
                  pushedRoute = true;
                  routeName = route.settings.name;
                }
              },
            ),
          ],
        ),
      );

      // Tap the continue button
      await tester.tap(find.text('Continue with Google'));
      await tester.pumpAndSettle();

      // Verify that navigation was triggered
      expect(pushedRoute, isTrue);
      expect(routeName, '/dashbord');
      expect(find.text('Dashboard Mock'), findsOneWidget);
    });
  });
}

// Helper observer to listen for route events
class _MockNavigatorObserver extends NavigatorObserver {
  final void Function(Route<dynamic> route, Route<dynamic>? previousRoute)
  onPush;

  _MockNavigatorObserver({required this.onPush});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPush(route, previousRoute);
    super.didPush(route, previousRoute);
  }
}
