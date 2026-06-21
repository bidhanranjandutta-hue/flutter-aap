## YYYY-MM-DD - Unbounded Route Stacks in Flutter BottomNavigationBar
**Learning:** In Flutter, using Navigator.pushNamed repeatedly for root-level navigation or returning to the root tab creates an unbounded route stack and memory leaks.
**Action:** To prevent unbounded route stacks while preserving back-button behavior, return to the root tab using Navigator.pushNamedAndRemoveUntil(..., (route) => false).
