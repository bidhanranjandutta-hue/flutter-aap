## 2025-02-18 - Replacing `Navigator.pushNamed` with `Navigator.pushReplacementNamed` in BottomNavigationBar
**Learning:** Using `Navigator.pushNamed` repeatedly inside a `BottomNavigationBar` creates an unbounded route stack. This causes a memory leak as the stack depth grows infinitely during regular usage (e.g. switching back and forth between tabs).
**Action:** When navigating between top-level tabs via BottomNavigationBar, use `Navigator.pushReplacementNamed` or `pushNamedAndRemoveUntil` instead to keep the stack depth constant and flat.
