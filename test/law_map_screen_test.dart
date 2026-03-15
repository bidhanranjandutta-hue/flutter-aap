import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  testWidgets('LawMapScreen initial state and static content', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const LawMapScreen(),
        routes: {
          '/dashbord': (context) =>
              const Scaffold(body: Text('Mock Dashboard')),
        },
      ),
    );

    // Verify Title
    expect(find.text('Law Compatibility Map'), findsOneWidget);

    // Verify search input initial value
    expect(
      find.text('IPC 302'),
      findsWidgets,
    ); // TextField has it and the card has it

    // Verify Segmented Controls
    expect(find.text('Comparison'), findsOneWidget);
    expect(find.text('Full Text'), findsOneWidget);
    expect(find.text('Case Law'), findsOneWidget);

    // Verify Main Law Header
    expect(find.text('Old Law'), findsOneWidget);
    expect(find.text('New Law'), findsOneWidget);
    expect(find.text('BNS 103'), findsOneWidget);

    // Verify Comparison Cards
    expect(find.text('Indian Penal Code'), findsOneWidget);
    expect(find.text('Bharatiya Nyaya Sanhita'), findsOneWidget);

    // Verify Bottom Navigation Bar items
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Cases'), findsOneWidget);
    expect(
      find.text('Law Map'),
      findsOneWidget,
    ); // Found twice, one as appbar title? Oh, BottomNav also has it.
  });

  testWidgets('LawMapScreen segment button interaction', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const LawMapScreen(),
        routes: {
          '/dashbord': (context) =>
              const Scaffold(body: Text('Mock Dashboard')),
        },
      ),
    );

    // Initial state: Comparison is selected
    // Since we don't have a direct way to read the private state _selectedSegment,
    // we can tap the other segments and ensure no exceptions are thrown during rebuild.

    // Tap 'Full Text'
    await tester.tap(find.text('Full Text'));
    await tester.pumpAndSettle();

    // Tap 'Case Law'
    await tester.tap(find.text('Case Law'));
    await tester.pumpAndSettle();

    // Tap back to 'Comparison'
    await tester.tap(find.text('Comparison'));
    await tester.pumpAndSettle();

    // If we reach here without exceptions, state update (setState) handles gracefully.
    expect(true, isTrue);
  });

  testWidgets('LawMapScreen bottom navigation to dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const LawMapScreen(),
        routes: {
          '/dashbord': (context) =>
              const Scaffold(body: Text('Mock Dashboard')),
        },
      ),
    );

    // Tap Home icon on BottomNavigationBar (index 0)
    // There are multiple icons and texts, let's find the specific inkwell or icon for Home.
    // BottomNavigationBarItem uses a specific structure. The text 'Home' is unique to it.
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    // Verify navigation occurred to Mock Dashboard
    expect(find.text('Mock Dashboard'), findsOneWidget);
  });
}
