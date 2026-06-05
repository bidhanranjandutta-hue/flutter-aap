## 2024-05-24 - Unbounded Route Stacks in BottomNavigationBar

**Learning:** In Flutter, using `Navigator.pushNamed` repeatedly inside a `BottomNavigationBar` creates an unbounded route stack memory leak. This occurs because every tab switch pushes a new route on top of the old one, rather than switching between parallel route stacks.

**Action:** Always use `Navigator.pushReplacementNamed` for bottom tab switches to keep the stack flat while preserving back-button behavior, and use `Navigator.pushNamedAndRemoveUntil` for un-returnable flows like post-login transitions.
