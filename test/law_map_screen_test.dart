import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

void main() {
  Widget createTestableWidget() {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const LawMapScreen(),
    );
  }

  group('LawMapScreen Widget Tests', () {
    testWidgets('Renders the initial screen with title and search bar',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      // Verify Title
      expect(find.text('Law Compatibility Map'), findsOneWidget);

      // Verify Search TextField and its initial value
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('IPC 302'), findsNWidgets(2));

      // Verify Segmented Controls
      expect(find.text('Comparison'), findsOneWidget);
      expect(find.text('Full Text'), findsOneWidget);
      expect(find.text('Case Law'), findsOneWidget);

      // Verify Main Body Components
      expect(find.text('Old Law'), findsOneWidget);
      expect(find.text('New Law'), findsOneWidget);
      expect(find.text('Punishment for Murder'), findsOneWidget);

      // Verify Comparison Cards Titles
      expect(find.text('Section 302'), findsOneWidget);
      expect(find.text('Section 103'), findsOneWidget);

      // Verify Offline Indicator
      expect(find.text('DATABASE OFFLINE READY'), findsOneWidget);
    });

    testWidgets('Tapping segmented controls updates selection',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      // Initial state is 'Comparison' (index 0)
      final comparisonFinder = find.text('Comparison');
      final fullTextFinder = find.text('Full Text');

      // The unselected text should have grey color
      var fullTextWidget = tester.widget<Text>(fullTextFinder);
      expect(fullTextWidget.style?.color, Colors.grey);

      // Tap 'Full Text'
      await tester.tap(fullTextFinder);
      await tester.pumpAndSettle();

      // Verify 'Full Text' is now selected (primary color)
      fullTextWidget = tester.widget<Text>(fullTextFinder);
      expect(fullTextWidget.style?.color, AppTheme.primary);

      // Verify 'Comparison' is now unselected (grey color)
      var comparisonWidget = tester.widget<Text>(comparisonFinder);
      expect(comparisonWidget.style?.color, Colors.grey);
    });

    testWidgets('Tapping BottomNavigationBar items does not throw',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      // Find 'Cases' item
      final casesTab = find.text('Cases');
      expect(casesTab, findsOneWidget);

      // Tap 'Cases'
      await tester.tap(casesTab);
      await tester.pumpAndSettle();

      // Since the main logic of bottom navigation pushing a new route
      // requires a defined named route '/dashbord', which isn't defined here,
      // tapping the 'Home' icon will try to push a route and throw an error
      // if we don't handle it in testing. So we are just ensuring the tab is tappable
      // and state doesn't crash on standard items.

      // We will specifically test tapping a tab that does nothing locally, like 'Cases' (index 1).
      // The test passes if no exceptions are thrown.
      expect(find.byType(LawMapScreen), findsOneWidget);
    });
  });
}
