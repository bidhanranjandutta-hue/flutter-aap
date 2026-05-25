## 2024-05-25 - Unbounded Route Stack
**Learning:** Found an unbounded route stack memory leak pattern. The app uses `Navigator.pushNamed` inside `BottomNavigationBar` taps and the Welcome screen, which pushes a new screen onto the stack without replacing or popping the current one.
**Action:** Replaced `Navigator.pushNamed` with `Navigator.pushReplacementNamed` and `Navigator.pushNamedAndRemoveUntil` for root level navigation.
