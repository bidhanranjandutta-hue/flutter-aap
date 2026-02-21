import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/welcome_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/law_map_screen.dart';
import 'screens/ocr_scanner_screen.dart';
import 'screens/case_synopsis_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NyayaAssist',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/dashbord': (context) => const DashboardScreen(),
        '/law_map': (context) => const LawMapScreen(),
        '/ocr': (context) => const OCRScannerScreen(),
        '/synopsis': (context) => const CaseSynopsisScreen(),
      },
    );
  }
}
