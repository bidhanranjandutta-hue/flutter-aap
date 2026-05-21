## 2024-05-21 - Unbounded Route Stacks in Flutter
**Learning:** Using `Navigator.pushNamed()` repeatedly for root-level navigation (like inside a `BottomNavigationBar` or returning to a dashboard) creates an unbounded route stack. This leads to memory leaks and degraded performance as hidden screens are kept alive in the background indefinitely.
**Action:** For navigating to root tabs or main screens, always use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` to clear the stack completely and free up memory.
