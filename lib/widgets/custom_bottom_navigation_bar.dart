import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: AppTheme.primary,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'My Cases'),
        BottomNavigationBarItem(
          icon: Icon(Icons.center_focus_weak),
          label: 'Scan',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Tools'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        if (index == currentIndex) return;

        if (index == 0) {
          // If already on Dashboard, don't push new route.
          // In an app with a deep nav stack, this might need `pushNamedAndRemoveUntil`,
          // but following simple and needful, pushing back to dashbord.
          Navigator.pushNamed(context, '/dashbord');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/ocr');
        } else if (index == 3) {
          // Both synopsis and law map are considered tools, let's say tools menu
          // We don't have a direct Tools screen in the routes known,
          // but we will do nothing for unmapped tabs as was the current behavior
          // (Current behavior only handled specific indexes).
        }
      },
    );
  }
}
