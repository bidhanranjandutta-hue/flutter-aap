## YYYY-MM-DD - [Prevent Unbounded Route Stack Memory Leaks in BottomNavigationBar]
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Navigate away from the root tab (e.g., dashboard) using pushNamed to preserve the back button, return to the root tab using pushNamedAndRemoveUntil(..., (route) => false) to prevent unbounded stacks, and reserve pushNamedAndRemoveUntil starting with an empty stack for one-way flows (like login).
