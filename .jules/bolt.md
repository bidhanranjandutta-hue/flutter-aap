## 2024-05-24 - Unbounded Route Stacks in Flutter BottomNavigationBar
**Learning:** Using `Navigator.pushNamed` inside `BottomNavigationBar` creates an unbounded route stack and memory leaks because each tab switch pushes a new route on top of the stack rather than replacing the current one.
**Action:** Replace `Navigator.pushNamed` with `Navigator.pushReplacementNamed` for tab switches to keep the navigation stack flat. Use `pushNamedAndRemoveUntil` for post-login/welcome screens to prevent users from navigating back to the welcome screen.
