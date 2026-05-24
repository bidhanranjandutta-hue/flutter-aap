## 2024-05-19 - Unbounded Route Stack Memory Leaks in Flutter Navigation
**Learning:** Using `Navigator.pushNamed()` repeatedly inside `BottomNavigationBar`s or central dashboard navigation routes creates an unbounded route stack and memory leak, as the previous screens are never removed from memory.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` or `Navigator.pushReplacementNamed()` for root-level tab navigations to ensure a flat stack and conserve memory.
