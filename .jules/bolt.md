## 2024-05-29 - Unbounded Route Stack in Flutter BottomNavigationBar
**Learning:** Using `Navigator.pushNamed` for root-level navigation (like inside a `BottomNavigationBar`) creates an unbounded route stack and memory leaks as users cycle through tabs.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` or `pushReplacementNamed` for root tabs to keep the route stack flat and prevent memory issues.
