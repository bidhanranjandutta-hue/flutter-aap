## YYYY-MM-DD - Fix Unbounded Route Stack
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Navigate away from the root tab (e.g., dashboard) using `pushNamed` to preserve back button, and return to the root tab using `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` to prevent memory leaks. Also, reserve `pushNamedAndRemoveUntil` for one-way flows like login.
