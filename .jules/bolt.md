## 2026-06-10 - Unbounded Route Stack Memory Leak

**Learning:** Using `Navigator.pushNamed` repeatedly in a BottomNavigationBar to navigate to the root screen (like `/dashbord`) creates an unbounded route stack over time, consuming memory and causing performance degradation as all previous screens are kept in memory instead of being disposed of.

**Action:** Whenever navigating back to the root tab/dashboard, especially from BottomNavigationBar items or completing flows (like Welcome screen to Dashboard), always use `Navigator.pushNamedAndRemoveUntil(context, '/rootRoute', (route) => false)` to clear the route stack and prevent memory leaks.
