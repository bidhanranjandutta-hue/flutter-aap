## 2024-05-23 - Prevent memory leaks from unbounded route stacks
**Learning:** In Flutter, using `Navigator.pushNamed` for navigation between root tabs (like via a `BottomNavigationBar` or returning to the dashboard) creates an unbounded route stack over time, leading to severe memory leaks as the widget tree is never garbage collected.
**Action:** Replaced `Navigator.pushNamed` with `Navigator.pushNamedAndRemoveUntil` for dashboard and primary tab routing to explicitly clear the route stack and maintain a flat navigation hierarchy.
