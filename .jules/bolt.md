## 2025-02-23 - Flutter Route Stack Memory Leaks
**Learning:** Repeatedly using `Navigator.pushNamed` for root-level navigation (like inside a `BottomNavigationBar` or after a one-way login flow) creates an unbounded route stack and memory leaks in Flutter.
**Action:** Navigate away from the root tab using `pushNamed`, but return to the root tab using `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` to clear the stack and preserve memory and expected back-button behavior.
