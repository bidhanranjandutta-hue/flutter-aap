## 2024-05-23 - Unbounded Route Stacks in BottomNavigationBar
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks in Flutter applications.
**Action:** Use Navigator.pushNamedAndRemoveUntil (or pushReplacementNamed) for root tab navigation to keep the stack flat and prevent memory leaks.
