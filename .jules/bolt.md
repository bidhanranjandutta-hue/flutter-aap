## 2024-05-25 - Prevent unbounded route stack memory leaks on Bottom Navigation
**Learning:** Using Navigator.pushNamed inside BottomNavigationBar repeatedly pushes new instances of top-level screens onto the stack, creating an unbounded stack growth and causing significant memory leaks over time.
**Action:** Always use Navigator.pushReplacementNamed or Navigator.pushNamedAndRemoveUntil when switching root-level tabs via BottomNavigationBar to keep the navigation stack flat.
