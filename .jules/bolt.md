## 2026-06-13 - Unbounded Route Stack Memory Leaks in BottomNavigationBar
**Learning:** Repeatedly navigating to the root tab (dashboard) via `Navigator.pushNamed` from sub-screens creates an unbounded route stack memory leak. This happens because the root screen gets pushed multiple times over itself instead of being returned to or replaced.
**Action:** When navigating back to the root tab from other screens, use `Navigator.pushNamedAndRemoveUntil(context, '/dashbord', (route) => false)` to clear the stack and avoid unbounded memory growth, especially on BottomNavigationBar actions.
