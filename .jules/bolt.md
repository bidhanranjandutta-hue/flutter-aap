## 2024-06-03 - Unbounded Route Stack Memory Leaks in Tab Navigation
**Learning:** In Flutter, repeatedly using `Navigator.pushNamed` inside a `BottomNavigationBar` creates an unbounded route stack (and memory leak) as each tab switch adds a new route on top of the previous one. This is a common performance anti-pattern.
**Action:** Always use `Navigator.pushReplacementNamed` for root-level tab switching to keep the navigation stack flat. Use `Navigator.pushNamedAndRemoveUntil` when transitioning from a login/welcome screen to the main app dashboard to clear the initial stack.
