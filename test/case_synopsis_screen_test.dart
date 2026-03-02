import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('Verify CaseSynopsisScreen TabBar Existence and Content', (
    WidgetTester tester,
  ) async {
    // Build the CaseSynopsisScreen within a MaterialApp to provide necessary context.
    await tester.pumpWidget(const MaterialApp(home: CaseSynopsisScreen()));

    // Wait for the UI to settle, including any animations from the TabController.
    await tester.pumpAndSettle();

    // Verify the existence of the TabBar.
    final tabBarFinder = find.byType(TabBar);
    expect(
      tabBarFinder,
      findsOneWidget,
      reason: 'TabBar widget should be present on the screen.',
    );

    // Verify the existence of the expected Tab widgets.
    final tabSubjectFinder = find.widgetWithText(Tab, 'Subject');
    final tabSituationFinder = find.widgetWithText(Tab, 'Situation');
    final tabPositionFinder = find.widgetWithText(Tab, 'Position');

    expect(
      tabSubjectFinder,
      findsOneWidget,
      reason: 'Tab with text "Subject" should exist.',
    );
    expect(
      tabSituationFinder,
      findsOneWidget,
      reason: 'Tab with text "Situation" should exist.',
    );
    expect(
      tabPositionFinder,
      findsOneWidget,
      reason: 'Tab with text "Position" should exist.',
    );

    // Additional verification: Ensure there are exactly 3 Tab widgets inside the TabBar.
    final tabsFinder = find.descendant(
      of: tabBarFinder,
      matching: find.byType(Tab),
    );
    expect(
      tabsFinder,
      findsNWidgets(3),
      reason: 'There should be exactly 3 Tabs in the TabBar.',
    );

    // Interact with the tabs to ensure they are tapable and do not cause errors.
    // We use warnIfMissed: false to avoid hit-test warnings if the tab's hit area is slightly smaller than expected.
    await tester.tap(tabSituationFinder, warnIfMissed: false);
    await tester.pumpAndSettle();

    await tester.tap(tabPositionFinder, warnIfMissed: false);
    await tester.pumpAndSettle();

    await tester.tap(tabSubjectFinder, warnIfMissed: false);
    await tester.pumpAndSettle();
  });
}
