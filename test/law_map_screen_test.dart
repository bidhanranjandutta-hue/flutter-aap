import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  group('LawMapScreen Tests', () {
    testWidgets('Segment navigation updates state and UI', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LawMapScreen(),
        ),
      );

      // Verify initial state: 'Comparison' is selected
      final comparisonTextFinder = find.text('Comparison');
      final fullTextFinder = find.text('Full Text');
      final caseLawFinder = find.text('Case Law');

      expect(comparisonTextFinder, findsOneWidget);
      expect(fullTextFinder, findsOneWidget);
      expect(caseLawFinder, findsOneWidget);

      // Verify initial colors
      Text comparisonText = tester.widget(comparisonTextFinder);
      expect(comparisonText.style?.color, AppTheme.primary);

      Text fullTextText = tester.widget(fullTextFinder);
      expect(fullTextText.style?.color, Colors.grey);

      // Tap on 'Full Text'
      await tester.tap(fullTextFinder);
      await tester.pumpAndSettle();

      // Verify state updated
      comparisonText = tester.widget(comparisonTextFinder);
      expect(comparisonText.style?.color, Colors.grey);

      fullTextText = tester.widget(fullTextFinder);
      expect(fullTextText.style?.color, AppTheme.primary);

      // Tap on 'Case Law'
      await tester.tap(caseLawFinder);
      await tester.pumpAndSettle();

      // Verify state updated
      Text caseLawText = tester.widget(caseLawFinder);
      expect(caseLawText.style?.color, AppTheme.primary);

      fullTextText = tester.widget(fullTextFinder);
      expect(fullTextText.style?.color, Colors.grey);
    });

    testWidgets('Search input displays initial text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LawMapScreen(),
        ),
      );

      // The TextField should have initial text "IPC 302"
      final textFieldFinder = find.byType(TextField);
      expect(textFieldFinder, findsOneWidget);

      final TextField textField = tester.widget(textFieldFinder);
      expect(textField.controller?.text, 'IPC 302');
    });

    testWidgets('BottomNavigationBar navigation to dashboard', (WidgetTester tester) async {
      String? pushedRoute;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/dashbord': (context) => const Scaffold(body: Text('Dashboard Mock')),
          },
          home: const LawMapScreen(),
          navigatorObservers: [
            _MockNavigatorObserver(onPush: (route, previousRoute) {
              if (route.settings.name != null) {
                pushedRoute = route.settings.name;
              }
            }),
          ],
        ),
      );

      // Find the "Home" icon which is at index 0
      final homeIconFinder = find.byIcon(Icons.home);
      expect(homeIconFinder, findsOneWidget);

      // Tap on the home icon
      await tester.tap(homeIconFinder);
      await tester.pumpAndSettle();

      // Verify that it pushed the dashboard route
      expect(pushedRoute, '/dashbord');
      expect(find.text('Dashboard Mock'), findsOneWidget);
    });
  });
}

class _MockNavigatorObserver extends NavigatorObserver {
  final void Function(Route<dynamic> route, Route<dynamic>? previousRoute)? onPush;

  _MockNavigatorObserver({this.onPush});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (onPush != null) {
      onPush!(route, previousRoute);
    }
    super.didPush(route, previousRoute);
  }
}
