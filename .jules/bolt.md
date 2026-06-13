## 2026-06-13 - Prevent Unbounded Route Stack Memory Leaks
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a BottomNavigationBar returning to the dashboard) creates an unbounded route stack leading to memory leaks and degraded performance.
**Action:** Navigate away from root tabs with `pushNamed` to preserve the back button, but return to root tabs using `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` to flush the stack.
