## 2026-06-06 - Unbounded Route Stacks in Flutter
**Learning:** Using Navigator.pushNamed repeatedly in root-level navigation (like BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Always use Navigator.pushReplacementNamed for tab switches to keep the stack flat while preserving back-button behavior.
