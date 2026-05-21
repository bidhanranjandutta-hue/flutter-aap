## 2024-05-18 - Fix Unbounded Route Stack Memory Leaks
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like back to a dashboard in a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil` to clear the stack when returning to root screens, or `Navigator.pushReplacementNamed` when previous route history isn't needed.
