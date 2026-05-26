
## 2024-05-26 - Unbounded Route Stacks in BottomNav
**Learning:** Using `Navigator.pushNamed` inside a BottomNavigationBar's `onTap` creates an unbounded route stack memory leak as users cycle through tabs.
**Action:** Always use `Navigator.pushReplacementNamed` or `Navigator.pushNamedAndRemoveUntil` for root-level navigation tabs.
