## 2026-06-12 - Unbounded Route Stack in Flutter BottomNavigationBar
**Learning:** Found an unbounded route stack memory leak across standard sub-tabs inside Flutter's `BottomNavigationBar`. Repeatedly navigating to the root "dashboard" using `Navigator.pushNamed` kept stacking route elements in memory rather than removing the older ones.
**Action:** When a user navigates to the core screen acting as a root from its sub-navigation, always use `Navigator.pushNamedAndRemoveUntil` with `route => false` instead of `Navigator.pushNamed`. This preserves the stack depth and avoids memory leaks.
