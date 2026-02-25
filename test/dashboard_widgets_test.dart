import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/widgets/file_item_card.dart';

void main() {
  testWidgets('DashboardScreen renders FileItemCard widgets', (
    WidgetTester tester,
  ) async {
    // Wrap with MaterialApp because DashboardScreen uses Theme.of(context)
    await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));

    // Verify FileItemCard widgets are present
    expect(find.byType(FileItemCard), findsNWidgets(4));

    // Verify specific content
    expect(find.text('FIR_2023_0912_Theft.pdf'), findsOneWidget);
    expect(find.text('Edited 10m ago • Case #402'), findsOneWidget);

    expect(find.text('Witness_Statement_Rao.docx'), findsOneWidget);
    expect(find.text('Edited 1h ago • Case #398'), findsOneWidget);
  });
}
