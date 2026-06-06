## 2026-06-06 - BottomNavigationBar Unbounded Route Stack
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Always use Navigator.pushReplacementNamed for tab switches to keep the stack flat while preserving back-button behavior, and Navigator.pushNamedAndRemoveUntil for clearing the stack after login.
