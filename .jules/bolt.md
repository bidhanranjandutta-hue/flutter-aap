## YYYY-MM-DD - Unbounded Route Stack Memory Leaks
**Learning:** In Flutter, using Navigator.pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Navigate away from the root tab using pushNamed, and return to the root tab using Navigator.pushNamedAndRemoveUntil(..., (route) => false).