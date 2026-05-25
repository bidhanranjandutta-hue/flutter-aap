## 2024-05-25 - Unbounded Route Stacks in Flutter BottomNavigationBar
**Learning:** Using `Navigator.pushNamed` repeatedly inside a Flutter app's root navigation (like a `BottomNavigationBar` switching between tabs) creates an unbounded route stack leading to memory leaks and performance degradation as invisible off-screen widgets are kept in memory indefinitely.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil` or `pushReplacementNamed` when switching between top-level tabs to flatten the route stack and free up memory.
