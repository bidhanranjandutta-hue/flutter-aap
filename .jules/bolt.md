## 2024-05-22 - Unbounded Route Stacks in Navigation Bars
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a `BottomNavigationBar` tapping "Home" to return to Dashboard) creates an unbounded route stack and memory leaks.
**Action:** Use `Navigator.pushNamedAndRemoveUntil` instead to clear the stack completely without breaking reverse navigation expectations, or `Navigator.pushReplacementNamed` when moving forward from an initial splash/welcome screen.
