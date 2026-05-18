## 2024-05-24 - Unbounded Navigation Stack Memory Leak
**Learning:** Using `Navigator.pushNamed` repeatedly in a `BottomNavigationBar` creates an ever-growing route stack in Flutter, leading to a significant memory leak and degraded performance.
**Action:** Always use `Navigator.pushReplacementNamed` or clear the route stack when navigating between root-level sections of an app via a bottom navigation bar.
