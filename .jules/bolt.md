## YYYY-MM-DD - Root Route Stack Optimization
**Learning:** Using pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil(..., (route) => false) when returning to the root tab to prevent unbounded stacks.
