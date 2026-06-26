## YYYY-MM-DD - [Prevent Unbounded Route Stack]
**Learning:** Using `Navigator.pushNamed` for root-level navigation (like inside a `BottomNavigationBar` or one-way flows) creates an unbounded route stack and memory leaks in Flutter.
**Action:** Always navigate away from root tabs with `pushNamed` to preserve the back button, but return to root tabs (or navigate in one-way flows like login) using `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` to prevent unbounded stacks.
