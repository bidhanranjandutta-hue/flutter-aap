## 2026-06-05 - Prevent Unbounded Route Stacks in Flutter Navigation
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar) creates an unbounded route stack and memory leaks.
**Action:** Always use Navigator.pushReplacementNamed for root-level tab switches to keep the stack flat while preserving back-button behavior, and use Navigator.pushNamedAndRemoveUntil for clearing the stack after post-login flows.
