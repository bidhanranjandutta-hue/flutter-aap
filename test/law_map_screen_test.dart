import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';

void main() {
  Widget createTestWidget() {
    return MaterialApp(
      home: const LawMapScreen(),
      routes: {
        '/dashbord': (context) =>
            const Scaffold(body: Text('Dashboard Screen')),
      },
    );
  }

  testWidgets('LawMapScreen initial UI rendering', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Verify AppBar title
    expect(find.text('Law Compatibility Map'), findsOneWidget);

    // Verify Search input
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('IPC 302'), findsWidgets); // Controller text

    // Verify Segmented Control buttons
    expect(find.text('Comparison'), findsOneWidget);
    expect(find.text('Full Text'), findsOneWidget);
    expect(find.text('Case Law'), findsOneWidget);

    // Verify Main Content Headers
    expect(find.text('Old Law'), findsOneWidget);
    expect(find.text('IPC 302'), findsWidgets);
    expect(find.text('New Law'), findsOneWidget);
    expect(find.text('BNS 103'), findsOneWidget);
  });

  testWidgets('LawMapScreen segmented control interaction', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestWidget());

    // Tap on 'Full Text'
    await tester.tap(find.text('Full Text'));
    await tester.pumpAndSettle();

    // Verify UI didn't crash and text is still there
    expect(find.text('Full Text'), findsOneWidget);

    // Tap on 'Case Law'
    await tester.tap(find.text('Case Law'));
    await tester.pumpAndSettle();

    // Verify UI didn't crash and text is still there
    expect(find.text('Case Law'), findsOneWidget);
  });

  testWidgets('LawMapScreen bottom navigation to Dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestWidget());

    // Tap on 'Home' icon in BottomNavigationBar
    // There are multiple Icons.home, but find.text('Home') is the label
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    // Verify navigation occurred
    expect(find.text('Dashboard Screen'), findsOneWidget);
  });
}
