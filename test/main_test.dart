import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/law_map_screen.dart';
import 'package:flutter_application_1/screens/ocr_scanner_screen.dart';
import 'package:flutter_application_1/screens/case_synopsis_screen.dart';

void main() {
  testWidgets('MainApp route definitions test', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    final materialAppFinder = find.byType(MaterialApp);
    expect(materialAppFinder, findsOneWidget);

    final MaterialApp app = tester.widget<MaterialApp>(materialAppFinder);

    expect(app.initialRoute, '/');
    expect(app.routes, isNotNull);

    final routes = app.routes!;
    expect(routes.containsKey('/'), isTrue);
    expect(routes.containsKey('/dashbord'), isTrue);
    expect(routes.containsKey('/law_map'), isTrue);
    expect(routes.containsKey('/ocr'), isTrue);
    expect(routes.containsKey('/synopsis'), isTrue);

    // We can also verify that the builders return the correct widget types
    // by calling the builder functions with a mock context.
    final BuildContext context = tester.element(materialAppFinder);

    expect(routes['/']!(context), isA<WelcomeScreen>());
    expect(routes['/dashbord']!(context), isA<DashboardScreen>());
    expect(routes['/law_map']!(context), isA<LawMapScreen>());
    expect(routes['/ocr']!(context), isA<OCRScannerScreen>());
    expect(routes['/synopsis']!(context), isA<CaseSynopsisScreen>());
  });
}
