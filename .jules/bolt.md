## 2024-05-18 - Unbounded Route Stacks with `pushNamed`
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like returning to the dashboard from a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** When returning to a root tab like the dashboard, use `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` to clear the stack and prevent memory leaks, or use `pushNamed` from the root tab to sub-tabs to preserve the back button.
