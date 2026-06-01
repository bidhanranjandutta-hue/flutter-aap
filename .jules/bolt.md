## 2026-06-01 - Prevent Unbounded Route Stacks
**Learning:** Using Navigator.pushNamed repeatedly in BottomNavigationBar creates an unbounded route stack leading to memory leaks.
**Action:** Always use pushReplacementNamed for root-level tab switches to maintain a flat stack.
