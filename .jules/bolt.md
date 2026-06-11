## 2026-06-11 - Unbounded Route Stack in Flutter BottomNavigationBar
**Learning:** In Flutter, repeatedly using `Navigator.pushNamed` for navigation between primary tabs (like a `BottomNavigationBar` navigating back to a root dashboard) without popping previous routes creates an unbounded route stack and memory leak.
**Action:** When navigating from a sub-tab back to a root tab, use `pushNamedAndRemoveUntil(context, route, (r) => false)` to clear the stack and prevent unbounded growth. Use `pushNamed` when moving *away* from root to preserve the back button.
