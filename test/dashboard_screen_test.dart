import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';

void main() {
  group('DashboardScreen Smoke Test', () {
    testWidgets('Renders DashboardScreen and finds key elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const DashboardScreen(),
          routes: {
            '/ocr': (context) => const Scaffold(body: Text('OCR Screen')),
            '/synopsis': (context) => const Scaffold(body: Text('Synopsis Screen')),
            '/law_map': (context) => const Scaffold(body: Text('Law Map Screen')),
          },
        ),
      );

      // Verify static texts
      expect(find.text('Inspector Sharma'), findsOneWidget);
      expect(find.text('OCR Evidence Scanner'), findsOneWidget);
      expect(find.text('Law Map'), findsOneWidget);
      expect(find.text('Case Synopsis'), findsOneWidget);

      // Verify icons
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.document_scanner), findsOneWidget);
    });

    testWidgets('Navigation to OCR screen works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const DashboardScreen(),
          routes: {
            '/ocr': (context) => const Scaffold(body: Text('OCR Screen')),
            '/synopsis': (context) => const Scaffold(body: Text('Synopsis Screen')),
            '/law_map': (context) => const Scaffold(body: Text('Law Map Screen')),
          },
        ),
      );

      // Tap on OCR Card
      await tester.tap(find.text('OCR Evidence Scanner'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('OCR Screen'), findsOneWidget);
    });

    testWidgets('Navigation to Law Map screen works', (WidgetTester tester) async {
       await tester.pumpWidget(
        MaterialApp(
          home: const DashboardScreen(),
          routes: {
            '/ocr': (context) => const Scaffold(body: Text('OCR Screen')),
            '/synopsis': (context) => const Scaffold(body: Text('Synopsis Screen')),
            '/law_map': (context) => const Scaffold(body: Text('Law Map Screen')),
          },
        ),
      );

      // Tap on Law Map Card
      await tester.tap(find.text('Law Map'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Law Map Screen'), findsOneWidget);
    });

     testWidgets('Navigation to Case Synopsis screen works', (WidgetTester tester) async {
       await tester.pumpWidget(
        MaterialApp(
          home: const DashboardScreen(),
          routes: {
            '/ocr': (context) => const Scaffold(body: Text('OCR Screen')),
            '/synopsis': (context) => const Scaffold(body: Text('Synopsis Screen')),
            '/law_map': (context) => const Scaffold(body: Text('Law Map Screen')),
          },
        ),
      );

      // Tap on Case Synopsis Card
      await tester.tap(find.text('Case Synopsis'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Synopsis Screen'), findsOneWidget);
    });
  });
}
