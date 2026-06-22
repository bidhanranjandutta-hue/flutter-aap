## 2026-06-22 - Route Stack Memory Leaks in Flutter BottomNavigationBar
**Learning:** In Flutter, using Navigator.pushNamed repeatedly for root-level navigation inside a BottomNavigationBar creates an unbounded route stack and memory leaks.
**Action:** When returning to root tabs from sub-screens, use Navigator.pushNamedAndRemoveUntil(..., (route) => false) instead of pushNamed to clear the stack and prevent unbounded growth. For one-way flows like login, also use pushNamedAndRemoveUntil starting with an empty stack.
