import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/widgets/file_item_card.dart';

void main() {
  testWidgets('FileItemCard renders correctly', (WidgetTester tester) async {
    // Define test data
    const String title = 'Test File.pdf';
    const String subtitle = 'Edited now';
    const IconData icon = Icons.file_present;
    const Color iconColor = Colors.blue;

    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FileItemCard(
            title: title,
            subtitle: subtitle,
            icon: icon,
            iconColor: iconColor,
          ),
        ),
      ),
    );

    // Verify title and subtitle are displayed
    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);

    // Verify icon is present
    expect(find.byIcon(icon), findsOneWidget);
  });
}
