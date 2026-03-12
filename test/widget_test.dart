import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('MainApp has Hello World! text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that the 'Hello World!' text is present.
    expect(find.text('Hello World!'), findsOneWidget);
  });
}
