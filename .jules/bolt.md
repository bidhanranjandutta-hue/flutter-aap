## 2024-05-15 - Unbounded Route Stack Memory Leak in BottomNavigationBar
**Learning:** Using `Navigator.pushNamed` inside a Flutter `BottomNavigationBar` creates a new route instance every time a tab is tapped. Over time, this leads to an unbounded route stack memory leak, degrading app performance and potentially causing out-of-memory crashes on low-end devices during long sessions.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil` (with a `(route) => false` predicate) when navigating to root-level screens like Dashboards to keep the navigation stack flat.
