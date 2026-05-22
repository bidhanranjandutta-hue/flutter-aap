## 2025-02-04 - Unbounded Route Stacking via BottomNavigationBar
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a BottomNavigationBar returning to 'Home') creates an unbounded route stack and memory leaks in Flutter applications. Every tap adds a new full-screen route without disposing of the previous ones.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` when navigating back to root tabs, or `Navigator.pushReplacementNamed` when transitioning linearly from login screens.
