## 2026-06-04 - Unbounded Stack Growth in Bottom Navigation
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a `BottomNavigationBar`) creates an unbounded route stack and memory leaks.
**Action:** Use `Navigator.pushReplacementNamed` to keep the stack flat during tab switches, and use `Navigator.pushNamedAndRemoveUntil` for clearing the stack after login.
