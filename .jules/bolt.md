## YYYY-MM-DD - [Prevent Unbounded Route Stack in Flutter BottomNavigationBar]
**Learning:** In Flutter, repeatedly using `Navigator.pushNamed` to return to a root tab from other tabs creates an unbounded route stack and memory leak, as routes are pushed on top of each other continuously.
**Action:** Use `Navigator.pushNamedAndRemoveUntil` with `(route) => false` when returning to root tabs (like a dashboard) to clear the accumulated stack and prevent memory leaks while preserving proper forward navigation flow.
