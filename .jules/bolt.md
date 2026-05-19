## 2024-05-19 - Unbounded Route Stack Memory Leaks
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a `BottomNavigationBar`) creates an unbounded route stack and memory leaks.
**Action:** Use `Navigator.pushReplacementNamed` or `pushNamedAndRemoveUntil` instead to keep the stack flat.
