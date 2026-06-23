## YYYY-MM-DD - Route Stack Memory Leaks
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks in Flutter.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` when returning to root tabs or for one-way flows like login.
