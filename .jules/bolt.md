## 2024-05-22 - Memory Leak via Unbounded Route Stacks in Flutter BottomNavigationBar
**Learning:** In Flutter, using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a `BottomNavigationBar`) creates an unbounded route stack and memory leaks.
**Action:** Use `Navigator.pushReplacementNamed` or `pushNamedAndRemoveUntil` instead to keep the stack flat for top-level app destinations.
