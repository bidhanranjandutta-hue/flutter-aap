## YYYY-MM-DD - Unbounded Route Stacks in Flutter
**Learning:** Found a memory leak pattern in root-level navigation (`BottomNavigationBar`). Repeated use of `Navigator.pushNamed` without stack management causes the widget tree to grow infinitely, consuming memory and slowing down the app.
**Action:** Use `pushReplacementNamed` when navigating to top-level/root screens from a bottom navigation bar, and `pushNamedAndRemoveUntil` after login, to keep the stack flat while preserving expected back navigation where appropriate.
