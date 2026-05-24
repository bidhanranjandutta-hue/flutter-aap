## 2024-05-24 - Unbounded Route Stacks in Flutter
**Learning:** Using `Navigator.pushNamed` for main navigation screens (like via `BottomNavigationBar` or Dashboard shortcuts) creates an unbounded route stack leading to memory leaks and slow navigation.
**Action:** Use `Navigator.pushNamedAndRemoveUntil` for dashboard/root returns and `Navigator.pushReplacementNamed` for sibling root tabs to maintain a flat navigation hierarchy.
