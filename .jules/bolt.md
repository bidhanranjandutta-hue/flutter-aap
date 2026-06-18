## YYYY-MM-DD - Optimize Flutter Route Navigation
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil(context, '/dashbord', (route) => false) when returning to the root tab to prevent unbounded stacks while preserving one-way flows.