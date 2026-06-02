## 2026-06-02 - Unbounded Navigation Stack
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Use Navigator.pushReplacementNamed to keep the stack flat during tab switches.
