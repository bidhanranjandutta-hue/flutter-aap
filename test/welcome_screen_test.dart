import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  group('WelcomeScreen Smoke Tests', () {
    Widget createTestableWidget({Map<String, WidgetBuilder>? routes}) {
      return MaterialApp(
        theme: AppTheme.lightTheme,
        home: const WelcomeScreen(),
        routes: routes ?? {},
      );
    }

    testWidgets('Renders essential visual elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestableWidget());

      // Assert Header/Hero Section texts
      expect(find.text('NyayaAssist'), findsOneWidget);
      expect(find.text('EMPOWERING INDIAN POLICE'), findsOneWidget);

      // Assert Value Proposition Card text
      expect(find.text('Modern Policing, Simplified.'), findsOneWidget);
      expect(
        find.text('AI-driven tools tailored for the new legal framework.'),
        findsOneWidget,
      );

      // Assert features are presented
      expect(find.text('Instant Case Analysis'), findsOneWidget);
      expect(
        find.text('Automated insights from FIRs & case files.'),
        findsOneWidget,
      );

      expect(find.text('Smart OCR Tools'), findsOneWidget);
      expect(
        find.text('Extract text from handwritten documents instantly.'),
        findsOneWidget,
      );

      expect(find.text('New Law Mapping'), findsOneWidget);
      expect(find.text('BNS • BNSS • BSA'), findsOneWidget);

      // Assert specific icons exist
      expect(find.byIcon(Icons.local_police), findsOneWidget);
      expect(find.byIcon(Icons.analytics), findsOneWidget);
      expect(find.byIcon(Icons.document_scanner), findsOneWidget);
      expect(find.byIcon(Icons.gavel), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);

      // Assert the Google login button and its placeholder icon are present
      expect(find.text('Continue with Google'), findsOneWidget);
      expect(find.byIcon(Icons.g_mobiledata), findsOneWidget);
    });

    testWidgets(
      'Tapping Continue with Google triggers navigation to dashboard',
      (WidgetTester tester) async {
        // Create a dummy destination for the /dashbord route.
        // We expect the button tap to push this route.
        bool navigated = false;
        await tester.pumpWidget(
          createTestableWidget(
            routes: {
              '/dashbord': (context) {
                navigated = true;
                return const Scaffold(body: Text('Dashboard Mock'));
              },
            },
          ),
        );

        // Locate the button and tap it.
        final buttonFinder = find.widgetWithText(
          ElevatedButton,
          'Continue with Google',
        );
        expect(buttonFinder, findsOneWidget);

        // Ensure the button is visible before tapping (it's at the bottom)
        await tester.ensureVisible(buttonFinder);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();

        // Verify the route navigation occurred and we see the mock destination.
        expect(navigated, isTrue);
        expect(find.text('Dashboard Mock'), findsOneWidget);
      },
    );
  });
}
