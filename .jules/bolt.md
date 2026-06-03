## 2024-06-03 - Flutter Navigation Stack Leaks
**Learning:** Found that using `Navigator.pushNamed` repeatedly inside root-level `BottomNavigationBar` creates an unbounded route stack leading to memory leaks over time. Also, `Navigator.pushNamed` after the welcome/login screen leaves the splash screen in the stack.
**Action:** Use `Navigator.pushReplacementNamed` for flat root-level tab switches to maintain a fixed stack size and memory profile, and use `Navigator.pushNamedAndRemoveUntil` for post-login to clear the stack completely.
